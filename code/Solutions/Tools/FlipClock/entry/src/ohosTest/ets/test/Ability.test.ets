/*
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON, Point } from '@kit.TestKit';
import { AbilityDelegatorRegistry } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { fileIo } from '@kit.CoreFileKit';
import { Contact, ContactSource, MyDataSource } from '../../../main/ets/common/DataSource';
import { tabArray } from '../../../main/ets/mock/TabData';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

const BUNDLE_NAME: string = 'ohos.samples.flipclock';
const ABILITY_NAME: string = 'EntryAbility';
const TAG: string = 'FlipClockTest';
const DOMAIN: number = 0xF811;
const STORAGE_PATH: string = '/data/storage/el2/base/haps/entry/preferences/storage';

const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }
      , duration);
  }
    );
}

function readStorageFile(): string {
  try {
    return fileIo.readTextSync(STORAGE_PATH);
  }
    catch (err) {
    return '';
  }
}

async function waitForStorageAlarm(expected: boolean, attempts: number): Promise<boolean> {
  for (let i = 0; i < attempts; i++) {
    const content: string = readStorageFile();
    if (content.includes('amount') && content.includes('alarmClock') === expected) {
      return true;
    }
    await sleep(300);
  }
  return false;
}

async function readDigits(driver: Driver): Promise<string> {
  for (let attempt = 0; attempt < 5; attempt++) {
    let result: string = '';
    let valid: boolean = true;
    for (let i = 0; i < 6; i++) {
      const digit: string = await getTextById(driver, `digit${i}`);
      const value: number = parseInt(digit, 10);
      if (digit.length !== 1 || value < 0 || value > 9) {
        valid = false;
        break;
      }
      result += digit;
    }
    if (valid && result.length === 6) {
      return result;
    }
    await sleep(300);
  }
  return '';
}


async function clickId(driver: Driver, id: string, timeout: number): Promise<boolean> {
  const component: Component = await driver.waitForComponent(ON.id(id), timeout);
  if (!component) {
    return false;
  }
  await component.click();
  return true;
}

async function getTextById(driver: Driver, id: string): Promise<string> {
  const component: Component = await driver.findComponent(ON.id(id));
  if (!component) {
    return '';
  }
  return await component.getText();
}

// findComponent returns null when the component is missing,
// so existence must be checked with assertComponentExist, which throws 17000003 on absence.
async function existsById(driver: Driver, id: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.id(id));
    return true;
  }
    catch (err) {
    return false;
  }
}

async function waitForId(driver: Driver, id: string, attempts: number): Promise<boolean> {
  for (let i = 0; i < attempts; i++) {
    if (await existsById(driver, id)) {
      return true;
    }
    await sleep(300);
  }
  return false;
}

async function existsByText(driver: Driver, text: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.text(text));
    return true;
  }
    catch (err) {
    return false;
  }
}

async function unlockIfNeeded(driver: Driver): Promise<void> {
  if (await existsByText(driver, 'Swipe up to unlock')) {
    await driver.swipe(360, 1100, 360, 300, 600);
    await sleep(1200);
    log('unlocked lock screen');
  }
}

async function ensureToggleChecked(driver: Driver, id: string, target: boolean): Promise<boolean> {
  for (let i = 0; i < 4; i++) {
    const component: Component = await driver.findComponent(ON.id(id));
    if (!component) {
      return false;
    }
    const checked: boolean = await component.isChecked();
    if (checked === target) {
      return true;
    }
    await component.click();
    await sleep(400);
  }
  const finalComponent: Component = await driver.findComponent(ON.id(id));
  if (!finalComponent) {
    return false;
  }
  return (await finalComponent.isChecked()) === target;
}

async function dismissDialogs(driver: Driver): Promise<void> {
  const texts: string[] = ['Allow', 'Allow all', 'Always allow', 'While using the app', 'Only this time'];
  for (let i = 0; i < 3; i++) {
    let clicked: boolean = false;
    for (let j = 0; j < texts.length; j++) {
      if (await existsByText(driver, texts[j])) {
        const allow: Component = await driver.findComponent(ON.text(texts[j]));
        if (allow) {
          await allow.click();
          clicked = true;
          await sleep(500);
          break;
        }
      }
    }
    if (!clicked) {
      break;
    }
  }
}

async function ensureClockTab(driver: Driver): Promise<boolean> {
  for (let i = 0; i < 4; i++) {
    const tab0: Component = await driver.findComponent(ON.id('tab0'));
    if (tab0) {
      await tab0.click();
      await sleep(800);
      return await waitForId(driver, 'currentTimeBox', 3);
    }
    await sleep(800);
  }
  return false;
}

async function clickTab(driver: Driver, index: number): Promise<boolean> {
  const clicked: boolean = await clickId(driver, `tab${index}`, 3000);
  if (clicked) {
    await sleep(900);
  }
  return clicked;
}

async function clearAlarms(driver: Driver): Promise<void> {
  for (let i = 0; i < 5; i++) {
    const buttons: Component[] = await driver.findComponents(ON.id('deleteAlarmClock'));
    if (!buttons || buttons.length === 0) {
      return;
    }
    await buttons[0].click();
    await sleep(800);
  }
}

function toSeconds(text: string): number {
  const parts: string[] = text.split(':');
  if (parts.length !== 3) {
    return -1;
  }
  const hours: number = parseInt(parts[0], 10);
  const minutes: number = parseInt(parts[1], 10);
  const seconds: number = parseInt(parts[2], 10);
  return hours * 3600 + minutes * 60 + seconds;
}

async function swipePicker(driver: Driver, id: string, count: number): Promise<boolean> {
  if (!await waitForId(driver, id, 3)) {
    log(`swipePicker id=${id} not found`);
    return false;
  }
  const picker: Component = await driver.findComponent(ON.id(id));
  const center: Point = await picker.getBoundsCenter();
  log(`swipePicker id=${id}, center=(${center.x},${center.y})`);
  for (let i = 0; i < count; i++) {
    // 90 px at 2000 px/s reliably advances the wheel; slower/shorter swipes are often ignored at index 0.
    await driver.swipe(center.x, center.y, center.x, center.y - 90, 2000);
    await sleep(900);
  }
  return true;
}

// Swipes the picker, presses start and verifies that the countdown is running.
// Retries when the swipe is ignored by the picker or the selected duration is out of range.
async function startCountdown(driver: Driver, pickerId: string, swipes: number, maxRounds: number,
  maxSeconds: number): Promise<string> {
  for (let round = 0; round < maxRounds; round++) {
    expect(await clickId(driver, 'reset', 3000)).assertTrue();
    await sleep(500);
    log(`startCountdown round=${round}, pickerReady=${await existsById(driver, pickerId)}`);
    expect(await swipePicker(driver, pickerId, swipes)).assertTrue();
    await sleep(500);
    expect(await clickId(driver, 'start', 3000)).assertTrue();
    await sleep(1200);
    const text: string = await getTextById(driver, 'countdownTime');
    const seconds: number = toSeconds(text);
    if (seconds > 0 && (maxSeconds === 0 || seconds <= maxSeconds)) {
      return text;
    }
    log(`startCountdown retry, round=${round}, text=${text}`);
  }
  return '';
}

export default function abilityTest() {
  describe('FlipClockTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      const driver: Driver = Driver.create();
      await unlockIfNeeded(driver);
      await delegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      }
        );
      await sleep(2500);
      let ready: boolean = false;
      for (let i = 0; i < 5 && !ready; i++) {
        await dismissDialogs(driver);
        ready = await ensureClockTab(driver);
        if (!ready) {
          log(`beforeAll retry ${i}`);
          await delegator.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME
          }
            );
          await sleep(1500);
        }
      }
      expect(ready).assertTrue();
      log('beforeAll end');
    }
      );

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const ready: boolean = await ensureClockTab(driver);
      expect(ready).assertTrue();
    }
      );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_0100
     * @tc.name      testFlipClockLaunch0001
     * @tc.desc      Start the application and verify the clock page and all four tabs are displayed.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockLaunch0001',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockLaunch0001 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await ensureClockTab(driver)));
          expect(await ensureClockTab(driver)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await existsById(driver, 'currentTimeBox')));
          expect(await existsById(driver, 'currentTimeBox')).assertTrue();
          for (let i = 0; i < 4; i++) {
            hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await existsById(driver, `tab${i}`)));
            expect(await existsById(driver, `tab${i}`)).assertTrue();
          }
        }
          catch (err) {
          log(`testFlipClockLaunch0001 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_0200
     * @tc.name      testFlipClockDigits0002
     * @tc.desc      Verify the six flip-clock digits are valid and match the system time within tolerance.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockDigits0002',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDigits0002 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await ensureClockTab(driver)));
          expect(await ensureClockTab(driver)).assertTrue();
          const digits: string = await readDigits(driver);
          log(`digits=${digits}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(digits.length), String(6));
          expect(digits.length).assertEqual(6);
          const hour: number = parseInt(digits.substring(0, 2), 10);
          const minute: number = parseInt(digits.substring(2, 4), 10);
          const second: number = parseInt(digits.substring(4, 6), 10);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(hour < 24));
          expect(hour < 24).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(minute < 60));
          expect(minute < 60).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(second < 60));
          expect(second < 60).assertTrue();
          const now: Date = new Date();
          const nowSeconds: number = now.getHours() * 3600 + now.getMinutes() * 60 + now.getSeconds();
          const clockSeconds: number = hour * 3600 + minute * 60 + second;
          let diff: number = Math.abs(clockSeconds - nowSeconds);
          if (diff > 43200) {
            diff = 86400 - diff;
          }
          log(`digits=${digits}, diff=${diff}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(diff <= 5));
          expect(diff <= 5).assertTrue();
          await sleep(1500);
          const nextDigits: string = await readDigits(driver);
          log(`nextDigits=${nextDigits}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(nextDigits.length), String(6));
          expect(nextDigits.length).assertEqual(6);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(nextDigits === digits));
          expect(nextDigits === digits).assertFalse();
        }
          catch (err) {
          log(`testFlipClockDigits0002 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_0300
     * @tc.name      testFlipClockTabSwitch0003
     * @tc.desc      Switch among the four tabs and verify the page-specific controls are displayed.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockTabSwitch0003',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabSwitch0003 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 0)));
          expect(await clickTab(driver, 0)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await existsById(driver, 'currentTimeBox')));
          expect(await existsById(driver, 'currentTimeBox')).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 1)));
          expect(await clickTab(driver, 1)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await existsById(driver, 'add')));
          expect(await existsById(driver, 'add')).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 2)));
          expect(await clickTab(driver, 2)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await existsById(driver, 'countdownTime')));
          expect(await existsById(driver, 'countdownTime')).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 3)));
          expect(await clickTab(driver, 3)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await waitForId(driver, 'fullScreenToggle', 5)));
          expect(await waitForId(driver, 'fullScreenToggle', 5)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 0)));
          expect(await clickTab(driver, 0)).assertTrue();
        }
          catch (err) {
          log(`testFlipClockTabSwitch0003 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_0400
     * @tc.name      testFlipClockAlarm0004
     * @tc.desc      Add an alarm and delete it, verifying the alarm row appears and then disappears.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockAlarm0004',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAlarm0004 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 1)));
          expect(await clickTab(driver, 1)).assertTrue();
          await clearAlarms(driver);
          const addClicked: boolean = await clickId(driver, 'add', 3000);
          log(`alarm add clicked=${addClicked}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(addClicked));
          expect(addClicked).assertTrue();
          await sleep(800);
          const picker: Component = await driver.waitForComponent(ON.id('timePicker'), 3000);
          const pickerFound: boolean = await existsById(driver, 'timePicker');
          log(`alarm picker found=${pickerFound}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pickerFound));
          expect(pickerFound).assertTrue();
          const center: Point = await picker.getBoundsCenter();
          await driver.swipe(center.x, center.y, center.x, center.y - 60, 600);
          await sleep(800);
          const yesClicked: boolean = await clickId(driver, 'yes', 3000);
          log(`alarm yes clicked=${yesClicked}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(yesClicked));
          expect(yesClicked).assertTrue();
          await sleep(1200);
          const deleteBefore: Component = await driver.findComponent(ON.id('deleteAlarmClock'));
          const deleteBeforeFound: boolean = await waitForId(driver, 'deleteAlarmClock', 5);
          log(`alarm deleteBefore=${deleteBeforeFound}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(deleteBeforeFound));
          expect(deleteBeforeFound).assertTrue();
          const alarmStored: boolean = await waitForStorageAlarm(true, 20);
          log(`alarm storage before delete ready=${alarmStored}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(alarmStored));
          expect(alarmStored).assertTrue();
          await deleteBefore.click();
          await sleep(500);
          const alarmRemoved: boolean = await waitForStorageAlarm(false, 20);
          log(`alarm storage after delete ready=${alarmRemoved}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(alarmRemoved));
          expect(alarmRemoved).assertTrue();
        }
          catch (err) {
          log(`testFlipClockAlarm0004 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_0500
     * @tc.name      testFlipClockCountDownZero0005
     * @tc.desc      Verify the countdown does not start when the selected duration is zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockCountDownZero0005',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockCountDownZero0005 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 2)));
          expect(await clickTab(driver, 2)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickId(driver, 'reset', 3000)));
          expect(await clickId(driver, 'reset', 3000)).assertTrue();
          await sleep(500);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(await getTextById(driver, 'countdownTime')), String('00:00:00'));
          expect(await getTextById(driver, 'countdownTime')).assertEqual('00:00:00');
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickId(driver, 'start', 3000)));
          expect(await clickId(driver, 'start', 3000)).assertTrue();
          await sleep(1500);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(await getTextById(driver, 'countdownTime')), String('00:00:00'));
          expect(await getTextById(driver, 'countdownTime')).assertEqual('00:00:00');
        }
          catch (err) {
          log(`testFlipClockCountDownZero0005 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_0600
     * @tc.name      testFlipClockCountDownFlow0006
     * @tc.desc      Set a countdown, start it, pause, resume, verify it decreases and reset to zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockCountDownFlow0006',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockCountDownFlow0006 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 2)));
          expect(await clickTab(driver, 2)).assertTrue();
          const runningText: string = await startCountdown(driver, 'minute', 1, 3, 0);
          log(`countdown running text=${runningText}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(runningText === '00:00:00'));
          expect(runningText === '00:00:00').assertFalse();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickId(driver, 'start', 3000)));
          expect(await clickId(driver, 'start', 3000)).assertTrue();
          await sleep(800);
          const pausedText: string = await getTextById(driver, 'countdownTime');
          await sleep(1500);
          const pausedAgain: string = await getTextById(driver, 'countdownTime');
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(pausedAgain), String(pausedText));
          expect(pausedAgain).assertEqual(pausedText);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickId(driver, 'start', 3000)));
          expect(await clickId(driver, 'start', 3000)).assertTrue();
          await sleep(2000);
          const resumedText: string = await getTextById(driver, 'countdownTime');
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(toSeconds(resumedText) < toSeconds(pausedText)));
          expect(toSeconds(resumedText) < toSeconds(pausedText)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickId(driver, 'reset', 3000)));
          expect(await clickId(driver, 'reset', 3000)).assertTrue();
          await sleep(800);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(await getTextById(driver, 'countdownTime')), String('00:00:00'));
          expect(await getTextById(driver, 'countdownTime')).assertEqual('00:00:00');
        }
          catch (err) {
          log(`testFlipClockCountDownFlow0006 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_0700
     * @tc.name      testFlipClockSetting0007
     * @tc.desc      Open the setting tab and verify the in-app full screen, screen light and brightness controls.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockSetting0007',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockSetting0007 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 3)));
          expect(await clickTab(driver, 3)).assertTrue();
          const ids: string[] = ['fullScreenToggle', 'screenLight', 'brightness', 'brightnessValue'];
          for (let i = 0; i < ids.length; i++) {
            hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await waitForId(driver, ids[i], 10)));
            expect(await waitForId(driver, ids[i], 10)).assertTrue();
          }
        }
          catch (err) {
          log(`testFlipClockSetting0007 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_0800
     * @tc.name      testFlipClockDataSource0008
     * @tc.desc      Verify MyDataSource push, delete, replace and totalCount operations.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockDataSource0008',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDataSource0008 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const source: MyDataSource = new MyDataSource([...tabArray]);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
          expect(source.totalCount()).assertEqual(4);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
          expect(source.getData(0).num).assertEqual(0);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(3).num), String(3));
          expect(source.getData(3).num).assertEqual(3);
          source.pushData(tabArray[0]);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(5));
          expect(source.totalCount()).assertEqual(5);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(4).num), String(0));
          expect(source.getData(4).num).assertEqual(0);
          source.deleteData(4);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
          expect(source.totalCount()).assertEqual(4);
          source.replaceData([tabArray[1]]);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
          expect(source.totalCount()).assertEqual(1);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(1));
          expect(source.getData(0).num).assertEqual(1);
          source.replaceData([]);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
          expect(source.totalCount()).assertEqual(0);
        }
          catch (err) {
          log(`testFlipClockDataSource0008 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_0900
     * @tc.name      testFlipClockContactSource0009
     * @tc.desc      Verify ContactSource push, delete, replace and totalCount operations.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockContactSource0009',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactSource0009 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const first: Contact = new Contact('a', 'A', 1);
          const second: Contact = new Contact('b', 'B', 2);
          const source: ContactSource = new ContactSource([first]);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
          expect(source.totalCount()).assertEqual(1);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('a'));
          expect(source.getData(0).key).assertEqual('a');
          source.pushData(second);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
          expect(source.totalCount()).assertEqual(2);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).value), String('B'));
          expect(source.getData(1).value).assertEqual('B');
          source.deleteData(0);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
          expect(source.totalCount()).assertEqual(1);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('b'));
          expect(source.getData(0).key).assertEqual('b');
          source.replaceData([first]);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
          expect(source.totalCount()).assertEqual(1);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).reminderId), String(1));
          expect(source.getData(0).reminderId).assertEqual(1);
          source.replaceData([]);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
          expect(source.totalCount()).assertEqual(0);
        }
          catch (err) {
          log(`testFlipClockContactSource0009 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_1000
     * @tc.name      testFlipClockAlarmCancel0010
     * @tc.desc      Open the alarm picker and cancel it, verifying no alarm is stored or displayed.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockAlarmCancel0010',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAlarmCancel0010 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 1)));
          expect(await clickTab(driver, 1)).assertTrue();
          await clearAlarms(driver);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickId(driver, 'add', 3000)));
          expect(await clickId(driver, 'add', 3000)).assertTrue();
          await sleep(800);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await waitForId(driver, 'timePicker', 5)));
          expect(await waitForId(driver, 'timePicker', 5)).assertTrue();
          const noClicked: boolean = await clickId(driver, 'no', 3000);
          log(`alarm cancel no clicked=${noClicked}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(noClicked));
          expect(noClicked).assertTrue();
          await sleep(1000);
          const noAlarm: boolean = await waitForStorageAlarm(false, 10);
          log(`alarm cancel storage noAlarm=${noAlarm}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(noAlarm));
          expect(noAlarm).assertTrue();
        }
          catch (err) {
          log(`testFlipClockAlarmCancel0010 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_1100
     * @tc.name      testFlipClockCountDownReset0011
     * @tc.desc      Reset a countdown and verify the selected duration is cleared so it cannot start again.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockCountDownReset0011',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockCountDownReset0011 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 2)));
          expect(await clickTab(driver, 2)).assertTrue();
          const runningText: string = await startCountdown(driver, 'minute', 1, 3, 0);
          log(`countdown running text=${runningText}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(runningText === '00:00:00'));
          expect(runningText === '00:00:00').assertFalse();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickId(driver, 'start', 3000)));
          expect(await clickId(driver, 'start', 3000)).assertTrue();
          await sleep(800);
          const pausedText: string = await getTextById(driver, 'countdownTime');
          log(`countdown paused text=${pausedText}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pausedText === '00:00:00'));
          expect(pausedText === '00:00:00').assertFalse();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickId(driver, 'reset', 3000)));
          expect(await clickId(driver, 'reset', 3000)).assertTrue();
          await sleep(800);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(await getTextById(driver, 'countdownTime')), String('00:00:00'));
          expect(await getTextById(driver, 'countdownTime')).assertEqual('00:00:00');
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickId(driver, 'start', 3000)));
          expect(await clickId(driver, 'start', 3000)).assertTrue();
          await sleep(1500);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(await getTextById(driver, 'countdownTime')), String('00:00:00'));
          expect(await getTextById(driver, 'countdownTime')).assertEqual('00:00:00');
        }
          catch (err) {
          log(`testFlipClockCountDownReset0011 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_1200
     * @tc.name      testFlipClockDataSourceBoundary0012
     * @tc.desc      Verify MyDataSource handles empty, single and replace-empty boundaries.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockDataSourceBoundary0012',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDataSourceBoundary0012 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const source: MyDataSource = new MyDataSource([]);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
          expect(source.totalCount()).assertEqual(0);
          source.pushData(tabArray[2]);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
          expect(source.totalCount()).assertEqual(1);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(2));
          expect(source.getData(0).num).assertEqual(2);
          source.deleteData(0);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
          expect(source.totalCount()).assertEqual(0);
          source.replaceData([tabArray[0], tabArray[1]]);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
          expect(source.totalCount()).assertEqual(2);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).num), String(1));
          expect(source.getData(1).num).assertEqual(1);
          source.replaceData([]);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
          expect(source.totalCount()).assertEqual(0);
        }
          catch (err) {
          log(`testFlipClockDataSourceBoundary0012 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_1300
     * @tc.name      testFlipClockCountDownFinish0013
     * @tc.desc      Start a short countdown and verify it resets to zero automatically when it expires.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockCountDownFinish0013',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockCountDownFinish0013 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 2)));
          expect(await clickTab(driver, 2)).assertTrue();
          const runningText: string = await startCountdown(driver, 'second', 1, 4, 8);
          log(`countdown running text=${runningText}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(runningText === '00:00:00'));
          expect(runningText === '00:00:00').assertFalse();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(toSeconds(runningText) <= 8));
          expect(toSeconds(runningText) <= 8).assertTrue();
          const expectedSeconds: number = toSeconds(runningText);
          let finished: boolean = false;
          const polls: number = Math.max(8, expectedSeconds + 4) * 2;
          for (let i = 0; i < polls; i++) {
            await sleep(500);
            const currentText: string = await getTextById(driver, 'countdownTime');
            if (currentText === '00:00:00') {
              finished = true;
              break;
            }
          }
          log(`countdown finished=${finished}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(finished));
          expect(finished).assertTrue();
          await sleep(800);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(await getTextById(driver, 'countdownTime')), String('00:00:00'));
          expect(await getTextById(driver, 'countdownTime')).assertEqual('00:00:00');
        }
          catch (err) {
          log(`testFlipClockCountDownFinish0013 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_1400
     * @tc.name      testFlipClockSettingFullScreen0014
     * @tc.desc      Toggle full screen on and off in the settings tab and verify the switch state.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockSettingFullScreen0014',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockSettingFullScreen0014 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 3)));
          expect(await clickTab(driver, 3)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await ensureToggleChecked(driver, 'fullScreenToggle', true)));
          expect(await ensureToggleChecked(driver, 'fullScreenToggle', true)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await ensureToggleChecked(driver, 'fullScreenToggle', false)));
          expect(await ensureToggleChecked(driver, 'fullScreenToggle', false)).assertTrue();
        }
          catch (err) {
          log(`testFlipClockSettingFullScreen0014 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_1500
     * @tc.name      testFlipClockSettingScreenLight0015
     * @tc.desc      Toggle keep-screen-on in the settings tab and verify the switch state.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockSettingScreenLight0015',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockSettingScreenLight0015 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 3)));
          expect(await clickTab(driver, 3)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await ensureToggleChecked(driver, 'screenLight', true)));
          expect(await ensureToggleChecked(driver, 'screenLight', true)).assertTrue();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await ensureToggleChecked(driver, 'screenLight', false)));
          expect(await ensureToggleChecked(driver, 'screenLight', false)).assertTrue();
        }
          catch (err) {
          log(`testFlipClockSettingScreenLight0015 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );

    /**
     * @tc.number    SUB_FLIP_CLOCK_APP_1600
     * @tc.name      testFlipClockSettingBrightness0016
     * @tc.desc      Drag the brightness slider and verify the displayed value increases.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFlipClockSettingBrightness0016',
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockSettingBrightness0016 begin');
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await clickTab(driver, 3)));
          expect(await clickTab(driver, 3)).assertTrue();
          const slider: Component = await driver.waitForComponent(ON.id('brightness'), 3000);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(await existsById(driver, 'brightness')));
          expect(await existsById(driver, 'brightness')).assertTrue();
          const initialText: string = await getTextById(driver, 'brightnessValue');
          hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parseInt(initialText, 10)), String(40));
          expect(parseInt(initialText, 10)).assertEqual(40);
          const center: Point = await slider.getBoundsCenter();
          await driver.swipe(center.x, center.y, center.x + 80, center.y, 600);
          await sleep(500);
          const valueText: string = await getTextById(driver, 'brightnessValue');
          log(`brightness value=${valueText}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseInt(valueText, 10) > 40));
          expect(parseInt(valueText, 10) > 40).assertTrue();
        }
          catch (err) {
          log(`testFlipClockSettingBrightness0016 failed: ${String(err)}`);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', 'assertFail');
          expect().assertFail();
        }
          finally {
          done();
        }
      }
        );
  }
    );
}
