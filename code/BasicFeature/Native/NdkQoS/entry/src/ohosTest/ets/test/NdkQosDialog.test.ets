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

import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, MatchPattern, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_NdkQosDialogTest]';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'com.example.qossample';
const ABILITY: string = 'EntryAbility';
const HIGH_BUTTON: string = 'High level QoS test';
const LOW_BUTTON: string = 'Low level QoS test';
const CONFIRM: string = 'OK';
const HIGH_MESSAGE_PREFIX: string = 'High-level QoS calculation time';
const LOW_MESSAGE_PREFIX: string = 'Low-level QoS calculation time';
const HIGH_MESSAGE_PATTERN: string = '^High-level QoS calculation time: [0-9]+(\\.[0-9]+)? ms$';
const LOW_MESSAGE_PATTERN: string = '^Low-level QoS calculation time: [0-9]+(\\.[0-9]+)? ms$';
const ZH_HIGH_MESSAGE_PATTERN: string = '^高等级 QoS 计算耗时：[0-9]+(\\.[0-9]+)? ms$';
const ZH_LOW_MESSAGE_PATTERN: string = '^低等级 QoS 计算耗时：[0-9]+(\\.[0-9]+)? ms$';
const WAIT_TIMEOUT: number = 15000;
const CLOSE_RETRY: number = 3;
const DURATION_UPPER_BOUND: number = 120000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// The sample ships English and Chinese resource sets, so every dialog label is resolved in both locales.
const ZH_TEXTS: Map<string, string> = new Map<string, string>([
  ['High level QoS test', '高等级 QoS 测试'],
  ['Low level QoS test', '低等级 QoS 测试'],
  ['OK', '确定'],
  ['High-level QoS calculation time', '高等级 QoS 计算耗时'],
  ['Low-level QoS calculation time', '低等级 QoS 计算耗时']
]);

function zhOf(text: string): string {
  const value: string | undefined = ZH_TEXTS.get(text);
  return value === undefined ? text : value;
}

function containsLocalized(text: string, prefix: string): boolean {
  if (text.indexOf(prefix) >= 0) {
    return true;
  }
  const localized: string = zhOf(prefix);
  return localized !== prefix && text.indexOf(localized) >= 0;
}

function startsWithLocalized(text: string, prefix: string): boolean {
  if (text.indexOf(prefix) === 0) {
    return true;
  }
  const localized: string = zhOf(prefix);
  return localized !== prefix && text.indexOf(localized) === 0;
}

const SETTLE_INTERVAL: number = 120;

function sleepMs(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function tryFindText(driver: Driver, text: string): Promise<Component | undefined> {
  try {
    const component: Component = await driver.findComponent(ON.text(text));
    if (component === undefined || component === null) {
      return undefined;
    }
    return component;
  } catch (error) {
    logInfo('findText failed: ' + text + ' -> ' + JSON.stringify(error));
    return undefined;
  }
}

async function findText(driver: Driver, text: string): Promise<Component | undefined> {
  const found: Component | undefined = await tryFindText(driver, text);
  if (found !== undefined) {
    return found;
  }
  const localized: string = zhOf(text);
  if (localized === text) {
    return undefined;
  }
  return await tryFindText(driver, localized);
}

async function tryFindContainedText(driver: Driver, text: string): Promise<Component | undefined> {
  try {
    const component: Component = await driver.findComponent(ON.text(text, MatchPattern.CONTAINS));
    if (component === undefined || component === null) {
      return undefined;
    }
    return component;
  } catch (error) {
    logInfo('findContainedText failed: ' + text + ' -> ' + JSON.stringify(error));
    return undefined;
  }
}

async function findContainedText(driver: Driver, text: string): Promise<Component | undefined> {
  const found: Component | undefined = await tryFindContainedText(driver, text);
  if (found !== undefined) {
    return found;
  }
  const localized: string = zhOf(text);
  if (localized === text) {
    return undefined;
  }
  return await tryFindContainedText(driver, localized);
}

async function tryWaitText(driver: Driver, text: string, timeout: number): Promise<boolean> {
  try {
    await driver.waitForComponent(ON.text(text), timeout);
    return true;
  } catch (error) {
    logInfo('waitForText timeout: ' + text + ' -> ' + JSON.stringify(error));
    return false;
  }
}

async function waitForText(driver: Driver, text: string, timeout: number): Promise<boolean> {
  if (await tryWaitText(driver, text, timeout)) {
    return true;
  }
  const localized: string = zhOf(text);
  if (localized === text) {
    return false;
  }
  return await tryWaitText(driver, localized, timeout);
}

async function launchAbility(): Promise<boolean> {
  try {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    return true;
  } catch (error) {
    logInfo('startAbility failed: ' + JSON.stringify(error));
    return false;
  }
}

async function ensurePage(driver: Driver): Promise<boolean> {
  const highButton: Component | undefined = await findText(driver, HIGH_BUTTON);
  const lowButton: Component | undefined = await findText(driver, LOW_BUTTON);
  if (highButton !== undefined && lowButton !== undefined) {
    return true;
  }
  if (!await launchAbility()) {
    return false;
  }
  await driver.delayMs(1000);
  return await waitForText(driver, HIGH_BUTTON, WAIT_TIMEOUT);
}

async function closeDialog(driver: Driver): Promise<boolean> {
  for (let attempt: number = 0; attempt < CLOSE_RETRY; attempt++) {
    const confirm: Component | undefined = await findText(driver, CONFIRM);
    if (confirm === undefined) {
      return true;
    }
    try {
      await confirm.click();
    } catch (error) {
      logInfo('confirm click failed: ' + JSON.stringify(error));
    }
    await driver.delayMs(1000);
  }
  return (await findText(driver, CONFIRM)) === undefined;
}

async function openDialog(driver: Driver, buttonText: string, prefix: string): Promise<string> {
  const button: Component | undefined = await findText(driver, buttonText);
  if (button === undefined) {
    return '';
  }
  await button.click();
  if (!await waitForText(driver, CONFIRM, WAIT_TIMEOUT)) {
    return '';
  }
  const message: Component | undefined = await findContainedText(driver, prefix);
  if (message === undefined) {
    return '';
  }
  return await message.getText();
}

function messageTail(message: string, prefix: string): string {
  const start: number = message.indexOf(prefix);
  if (start >= 0) {
    return message.substring(start);
  }
  const localized: string = zhOf(prefix);
  const localizedStart: number = localized === prefix ? -1 : message.indexOf(localized);
  if (localizedStart < 0) {
    return '';
  }
  return message.substring(localizedStart);
}

function matchesPattern(text: string, pattern: string): boolean {
  return new RegExp(pattern).test(text);
}

function matchesHighPattern(text: string): boolean {
  return matchesPattern(text, HIGH_MESSAGE_PATTERN) || matchesPattern(text, ZH_HIGH_MESSAGE_PATTERN);
}

function matchesLowPattern(text: string): boolean {
  return matchesPattern(text, LOW_MESSAGE_PATTERN) || matchesPattern(text, ZH_LOW_MESSAGE_PATTERN);
}

function hasExponentialNotation(text: string): boolean {
  return text.indexOf('e+') >= 0 || text.indexOf('e-') >= 0;
}

// 英文用半角冒号加空格，中文用全角冒号，取值时同时兼容两种写法
function parseDuration(message: string): number {
  const unitIndex: number = message.indexOf(' ms');
  if (unitIndex <= 0) {
    return -1;
  }
  let valueStart: number = -1;
  for (let index = 0; index < unitIndex; index++) {
    const char: string = message.charAt(index);
    if (char === ':' || char === '：') {
      valueStart = index + 1;
    }
  }
  if (valueStart < 0) {
    return -1;
  }
  return Number(message.substring(valueStart, unitIndex).trim());
}

export default function ndkQosDialogTest(): void {
  describe('NdkQosDialog', () => {
    afterEach(async () => {
      await sleepMs(SETTLE_INTERVAL);
      const driver: Driver = Driver.create();
      for (let attempt: number = 0; attempt < CLOSE_RETRY; attempt++) {
        if ((await findText(driver, CONFIRM)) === undefined) {
          break;
        }
        await closeDialog(driver);
      }
      expect(await ensurePage(driver)).assertTrue();
    });

    /**
     * @tc.number    SUB_QOS_DIALOG_0001
     * @tc.name      testNdkQosDialog0001
     * @tc.desc      Checks the high QoS button opens a dialog with the confirm button and message.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosDialog0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosDialog0001 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const message: string = await openDialog(driver, HIGH_BUTTON, HIGH_MESSAGE_PREFIX);
      logInfo('high qos dialog message = ' + message);
      expect(await findText(driver, CONFIRM) !== undefined).assertTrue();
      expect(message.length > 0).assertTrue();
      expect(containsLocalized(message, HIGH_MESSAGE_PREFIX)).assertTrue();
      expect(messageTail(message, HIGH_MESSAGE_PREFIX).length > 0).assertTrue();
      await closeDialog(driver);
      logInfo('testNdkQosDialog0001 end');
    })

    /**
     * @tc.number    SUB_QOS_DIALOG_0002
     * @tc.name      testNdkQosDialog0002
     * @tc.desc      Checks the high QoS dialog message follows the expected wording and unit.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosDialog0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosDialog0002 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const message: string = await openDialog(driver, HIGH_BUTTON, HIGH_MESSAGE_PREFIX);
      const tail: string = messageTail(message, HIGH_MESSAGE_PREFIX);
      logInfo('high qos dialog tail = ' + tail);
      expect(tail.length > 0).assertTrue();
      expect(matchesHighPattern(tail)).assertTrue();
      expect(startsWithLocalized(tail, HIGH_MESSAGE_PREFIX)).assertTrue();
      expect(tail.indexOf(' ms') > 0).assertTrue();
      await closeDialog(driver);
      logInfo('testNdkQosDialog0002 end');
    })

    /**
     * @tc.number    SUB_QOS_DIALOG_0003
     * @tc.name      testNdkQosDialog0003
     * @tc.desc      Checks the duration displayed by the high QoS dialog is a readable positive value.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosDialog0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosDialog0003 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const message: string = await openDialog(driver, HIGH_BUTTON, HIGH_MESSAGE_PREFIX);
      const tail: string = messageTail(message, HIGH_MESSAGE_PREFIX);
      const duration: number = parseDuration(tail);
      logInfo('high qos dialog duration = ' + duration.toString());
      expect(duration).assertLarger(0);
      expect(Number.isFinite(duration)).assertTrue();
      expect(duration < DURATION_UPPER_BOUND).assertTrue();
      expect(hasExponentialNotation(tail)).assertFalse();
      await closeDialog(driver);
      logInfo('testNdkQosDialog0003 end');
    })

    /**
     * @tc.number    SUB_QOS_DIALOG_0004
     * @tc.name      testNdkQosDialog0004
     * @tc.desc      Checks the confirm button closes the dialog and returns to the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosDialog0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosDialog0004 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const message: string = await openDialog(driver, HIGH_BUTTON, HIGH_MESSAGE_PREFIX);
      expect(message.length > 0).assertTrue();
      const closed: boolean = await closeDialog(driver);
      expect(closed).assertTrue();
      expect(await findText(driver, CONFIRM) === undefined).assertTrue();
      expect(await findText(driver, HIGH_BUTTON) !== undefined).assertTrue();
      expect(await findText(driver, LOW_BUTTON) !== undefined).assertTrue();
      logInfo('testNdkQosDialog0004 end');
    })

    /**
     * @tc.number    SUB_QOS_DIALOG_0005
     * @tc.name      testNdkQosDialog0005
     * @tc.desc      Checks the low QoS button opens a dialog with the low level wording.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosDialog0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosDialog0005 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const message: string = await openDialog(driver, LOW_BUTTON, LOW_MESSAGE_PREFIX);
      const tail: string = messageTail(message, LOW_MESSAGE_PREFIX);
      logInfo('low qos dialog tail = ' + tail);
      expect(await findText(driver, CONFIRM) !== undefined).assertTrue();
      expect(containsLocalized(message, LOW_MESSAGE_PREFIX)).assertTrue();
      expect(startsWithLocalized(tail, LOW_MESSAGE_PREFIX)).assertTrue();
      expect(matchesLowPattern(tail)).assertTrue();
      await closeDialog(driver);
      logInfo('testNdkQosDialog0005 end');
    })

    /**
     * @tc.number    SUB_QOS_DIALOG_0006
     * @tc.name      testNdkQosDialog0006
     * @tc.desc      Checks the duration displayed by the low QoS dialog is a readable positive value.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosDialog0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosDialog0006 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const message: string = await openDialog(driver, LOW_BUTTON, LOW_MESSAGE_PREFIX);
      const tail: string = messageTail(message, LOW_MESSAGE_PREFIX);
      const duration: number = parseDuration(tail);
      logInfo('low qos dialog duration = ' + duration.toString());
      expect(duration).assertLarger(0);
      expect(Number.isFinite(duration)).assertTrue();
      expect(duration < DURATION_UPPER_BOUND).assertTrue();
      expect(hasExponentialNotation(tail)).assertFalse();
      const closed: boolean = await closeDialog(driver);
      expect(closed).assertTrue();
      logInfo('testNdkQosDialog0006 end');
    })

    /**
     * @tc.number    SUB_QOS_DIALOG_0007
     * @tc.name      testNdkQosDialog0007
     * @tc.desc      Checks the high QoS dialog shows up again after it has been closed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosDialog0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosDialog0007 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const firstMessage: string = await openDialog(driver, HIGH_BUTTON, HIGH_MESSAGE_PREFIX);
      expect(firstMessage.length > 0).assertTrue();
      expect(await closeDialog(driver)).assertTrue();
      const secondMessage: string = await openDialog(driver, HIGH_BUTTON, HIGH_MESSAGE_PREFIX);
      const secondTail: string = messageTail(secondMessage, HIGH_MESSAGE_PREFIX);
      logInfo('second high qos dialog tail = ' + secondTail);
      expect(secondMessage.length > 0).assertTrue();
      expect(matchesHighPattern(secondTail)).assertTrue();
      expect(parseDuration(secondTail)).assertLarger(0);
      await closeDialog(driver);
      logInfo('testNdkQosDialog0007 end');
    })

    /**
     * @tc.number    SUB_QOS_DIALOG_0008
     * @tc.name      testNdkQosDialog0008
     * @tc.desc      Checks the high and low QoS dialogs keep their own wording in one run.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosDialog0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosDialog0008 begin');
      const driver: Driver = Driver.create();
      expect(await ensurePage(driver)).assertTrue();
      const highMessage: string = await openDialog(driver, HIGH_BUTTON, HIGH_MESSAGE_PREFIX);
      const highTail: string = messageTail(highMessage, HIGH_MESSAGE_PREFIX);
      expect(startsWithLocalized(highTail, HIGH_MESSAGE_PREFIX)).assertTrue();
      expect(containsLocalized(highMessage, LOW_MESSAGE_PREFIX)).assertFalse();
      expect(await closeDialog(driver)).assertTrue();
      const lowMessage: string = await openDialog(driver, LOW_BUTTON, LOW_MESSAGE_PREFIX);
      const lowTail: string = messageTail(lowMessage, LOW_MESSAGE_PREFIX);
      expect(startsWithLocalized(lowTail, LOW_MESSAGE_PREFIX)).assertTrue();
      expect(containsLocalized(lowMessage, HIGH_MESSAGE_PREFIX)).assertFalse();
      expect(parseDuration(highTail)).assertLarger(0);
      expect(parseDuration(lowTail)).assertLarger(0);
      await closeDialog(driver);
      logInfo('testNdkQosDialog0008 end');
    })
  })
}
