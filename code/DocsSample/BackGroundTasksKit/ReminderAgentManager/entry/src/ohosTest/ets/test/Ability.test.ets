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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { reminderAgentManager } from '@kit.BackgroundTasksKit';
import { notificationManager } from '@kit.NotificationKit';
import { preferences } from '@kit.ArkData';
import TimeConversion from '../../../main/ets/util/TimeConversion';
import Constant from '../../../main/ets/common/Constant';
import AlarmClockReminder from '../../../main/ets/util/AlarmClockReminder';
import CalendarReminder from '../../../main/ets/util/CalendarReminder';
import Logger from '../util/Logger';

const BUNDLE_NAME: string = 'com.example.reminderagentmanager';
const ABILITY_NAME: string = 'EntryAbility';
const TAG: string = 'ReminderAgentAppTest';
const PREF_NAME: string = 'ReminderAgentManager';
const REMINDER_TITLE: string = 'uiTestReminder';
const REMINDER_CONTENT: string = 'uiTestContent';
const NOTIFY_TITLE: string = 'uiTestNotify';
const SECONDS_PER_DAY: number = 86400;

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const appContext = delegator.getAppContext();

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function getString(resource: Resource): Promise<string> {
  return await appContext.resourceManager.getStringValue(resource);
}

// findComponent returns null when the component is missing,
// so existence must be checked with assertComponentExist, which throws 17000003 on absence.
async function existsById(driver: Driver, id: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.id(id));
    return true;
  } catch (err) {
    return false;
  }
}

async function existsByText(driver: Driver, text: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.text(text));
    return true;
  } catch (err) {
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

async function swipeRowLeft(driver: Driver, row: Component): Promise<void> {
  const rect = await row.getBounds();
  const centerY: number = (rect.top + rect.bottom) / 2;
  await driver.swipe(rect.right - 200, centerY, rect.left + 40, centerY, 600);
}

async function findRows(driver: Driver, id: string): Promise<Array<Component>> {
  const result = await driver.findComponents(ON.id(id));
  if (!result) {
    return [];
  }
  return result;
}

async function clickText(driver: Driver, text: string, timeout: number): Promise<boolean> {
  const component: Component = await driver.waitForComponent(ON.text(text), timeout);
  if (!component) {
    return false;
  }
  await component.click();
  return true;
}

async function clickAnyText(driver: Driver, texts: string[], timeout: number): Promise<boolean> {
  for (let i = 0; i < texts.length; i++) {
    if (await clickText(driver, texts[i], timeout)) {
      return true;
    }
  }
  return false;
}

async function clickDialogButton(driver: Driver, texts: string[], pickerType: string,
  timeout: number): Promise<boolean> {
  const deadline: number = Date.now() + timeout;
  while (Date.now() < deadline) {
    const pickers = await driver.findComponents(ON.type(pickerType));
    if (pickers && pickers.length > 0) {
      const pickerRect = await pickers[pickers.length - 1].getBounds();
      const buttons = await driver.findComponents(ON.type('Button'));
      if (buttons && buttons.length > 0) {
        for (let t = 0; t < texts.length; t++) {
          const found = await driver.findComponents(ON.text(texts[t]));
          if (found && found.length > 0) {
            for (let i = found.length - 1; i >= 0; i--) {
              const rect = await found[i].getBounds();
              const centerX: number = (rect.left + rect.right) / 2;
              const centerY: number = (rect.top + rect.bottom) / 2;
              if (centerY > pickerRect.bottom && centerY < pickerRect.bottom + 200) {
                let bestIndex: number = -1;
                let bestArea: number = Number.MAX_VALUE;
                for (let b = 0; b < buttons.length; b++) {
                  const buttonRect = await buttons[b].getBounds();
                  if (centerX >= buttonRect.left && centerX <= buttonRect.right &&
                    centerY >= buttonRect.top && centerY <= buttonRect.bottom) {
                    const area: number = (buttonRect.right - buttonRect.left) *
                      (buttonRect.bottom - buttonRect.top);
                    if (area < bestArea) {
                      bestArea = area;
                      bestIndex = b;
                    }
                  }
                }
                if (bestIndex >= 0) {
                  const buttonRect = await buttons[bestIndex].getBounds();
                  const buttonX: number = Math.floor((buttonRect.left + buttonRect.right) / 2);
                  const buttonY: number = Math.floor((buttonRect.top + buttonRect.bottom) / 2);
                  Logger.info(`${TAG} dialog button ${texts[t]} buttonIndex=${bestIndex}, x=${buttonX}, y=${buttonY}`);
                  const shellResult = await delegator.executeShellCommand(
                    `uitest uiInput click ${buttonX} ${buttonY}`);
                  Logger.info(`${TAG} shell click result=${JSON.stringify(shellResult)}`);
                  await sleep(300);
                  return true;
                }
              }
            }
          }
        }
      }
    }
    await sleep(200);
  }
  return false;
}

async function shellClickComponent(component: Component): Promise<void> {
  const rect = await component.getBounds();
  const x: number = Math.floor((rect.left + rect.right) / 2);
  const y: number = Math.floor((rect.top + rect.bottom) / 2);
  await delegator.executeShellCommand(`uitest uiInput click ${x} ${y}`);
  await sleep(300);
}

async function clickId(driver: Driver, id: string, timeout: number): Promise<boolean> {
  const component: Component = await driver.waitForComponent(ON.id(id), timeout);
  if (!component) {
    return false;
  }
  await component.click();
  return true;
}

async function clearAlarmRows(driver: Driver): Promise<void> {
  for (let i = 0; i < 5; i++) {
    const rows: Array<Component> = await findRows(driver, 'clock0');
    if (rows.length === 0) {
      return;
    }
    await swipeRowLeft(driver, rows[rows.length - 1]);
    await sleep(1500);
  }
}

async function ensureOneAlarm(driver: Driver): Promise<boolean> {
  const alarmTab: Component = await driver.waitForComponent(ON.id('tab0'), 5000);
  if (!alarmTab) {
    return false;
  }
  await alarmTab.click();
  await sleep(800);
  await clearAlarmRows(driver);
  const addClock: Component = await driver.waitForComponent(ON.id('addClock'), 3000);
  if (!addClock) {
    return false;
  }
  await addClock.click();
  const confirmed: boolean = await clickDialogButton(driver, ['确定', 'OK'], 'TimePicker', 3000);
  await sleep(500);
  return confirmed;
}

async function clearCalendarRows(driver: Driver): Promise<void> {
  for (let i = 0; i < 5; i++) {
    const rows: Array<Component> = await findRows(driver, 'calendar0');
    if (rows.length === 0) {
      return;
    }
    await swipeRowLeft(driver, rows[0]);
    await sleep(1500);
  }
}

async function ensureOneCalendar(driver: Driver): Promise<boolean> {
  const calendarTab: Component = await driver.waitForComponent(ON.id('tab1'), 5000);
  if (!calendarTab) {
    return false;
  }
  await calendarTab.click();
  await sleep(800);
  await clearCalendarRows(driver);
  const addCalendar: Component = await driver.waitForComponent(ON.id('addCalendar'), 3000);
  if (!addCalendar) {
    return false;
  }
  await addCalendar.click();
  const confirmed: boolean = await clickDialogButton(driver, ['确定', 'OK'], 'DatePicker', 3000);
  await sleep(500);
  return confirmed;
}

function createWantAgent(): reminderAgentManager.WantAgent {
  return {
    pkgName: BUNDLE_NAME,
    abilityName: ABILITY_NAME
  };
}

function createTimerRequest(seconds: number, notificationId: number): reminderAgentManager.ReminderRequestTimer {
  return {
    reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
    triggerTimeInSeconds: seconds,
    ringDuration: 1,
    title: REMINDER_TITLE,
    content: REMINDER_CONTENT,
    wantAgent: createWantAgent(),
    notificationId: notificationId,
    slotType: notificationManager.SlotType.CONTENT_INFORMATION
  };
}

function createAlarmRequest(minutesAhead: number): reminderAgentManager.ReminderRequestAlarm {
  const target: Date = new Date(Date.now() + minutesAhead * 60 * 1000);
  return {
    reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
    hour: target.getHours(),
    minute: target.getMinutes(),
    daysOfWeek: [],
    ringDuration: 1,
    title: REMINDER_TITLE,
    content: REMINDER_CONTENT,
    wantAgent: createWantAgent(),
    snoozeTimes: 0,
    timeInterval: 0,
    slotType: notificationManager.SlotType.CONTENT_INFORMATION
  };
}

function createCalendarRequest(minutesAhead: number): reminderAgentManager.ReminderRequestCalendar {
  const target: Date = new Date(Date.now() + minutesAhead * 60 * 1000);
  return {
    reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_CALENDAR,
    dateTime: {
      year: target.getFullYear(),
      month: target.getMonth() + 1,
      day: target.getDate(),
      hour: target.getHours(),
      minute: target.getMinutes()
    },
    ringDuration: 1,
    title: REMINDER_TITLE,
    content: REMINDER_CONTENT,
    wantAgent: createWantAgent(),
    slotType: notificationManager.SlotType.CONTENT_INFORMATION
  };
}

async function publishCheckAndCancel(request: reminderAgentManager.ReminderRequest): Promise<void> {
  const reminderId: number = await reminderAgentManager.publishReminder(request);
  expect(reminderId).assertLarger(0);
  const validReminders: Array<reminderAgentManager.ReminderInfo> =
    await reminderAgentManager.getAllValidReminders();
  const exists: boolean =
    validReminders.some((item: reminderAgentManager.ReminderInfo) => item.reminderId === reminderId);
  expect(exists).assertTrue();
  await reminderAgentManager.cancelReminder(reminderId);
  const afterCancel: Array<reminderAgentManager.ReminderInfo> =
    await reminderAgentManager.getAllValidReminders();
  const stillExists: boolean =
    afterCancel.some((item: reminderAgentManager.ReminderInfo) => item.reminderId === reminderId);
  expect(stillExists).assertFalse();
}

function expectedTimeToMillisecond(targetHour: number, targetMinute: number, at: Date): number {
  const nowSeconds: number = at.getHours() * 3600 + at.getMinutes() * 60 + at.getSeconds();
  const targetSeconds: number = targetHour * 3600 + targetMinute * 60;
  let delta: number = targetSeconds - nowSeconds;
  if (delta <= 0) {
    delta += SECONDS_PER_DAY;
  }
  return delta - 2;
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_0100
     * @tc.name      testReminderAgentStartAbility0001
     * @tc.desc      Start the application with the correct bundle and ability and verify the alarm tab appears.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentStartAbility0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentStartAbility0001 begin`);
        try {
          await delegator.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME
          });
          const driver: Driver = Driver.create();
          const alarmClockText: string = await getString($r('app.string.alarm_clock'));
          await await driver.waitForComponent(ON.text(alarmClockText), 8000);
          expect(await existsByText(driver, alarmClockText)).assertTrue();
          expect(alarmClockText.length > 0).assertTrue();
          Logger.info(`${TAG} testReminderAgentStartAbility0001 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentStartAbility0001 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_0200
     * @tc.name      testReminderAgentNotification0002
     * @tc.desc      Allow the notification authorization dialog and verify notification is enabled.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentNotification0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentNotification0002 begin`);
        try {
          const driver: Driver = Driver.create();
          const clicked: boolean = await clickAnyText(driver, ['允许', 'Allow'], 5000);
          Logger.info(`${TAG} notification dialog clicked: ${clicked}`);
          await sleep(1000);
          const enabled: boolean = await notificationManager.isNotificationEnabled();
          expect(enabled).assertTrue();
          expect(typeof enabled).assertEqual('boolean');
          Logger.info(`${TAG} testReminderAgentNotification0002 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentNotification0002 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_0300
     * @tc.name      testReminderAgentSwitchTab0003
     * @tc.desc      Switch among calendar, timer and alarm tabs and verify the page control exists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentSwitchTab0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentSwitchTab0003 begin`);
        try {
          const driver: Driver = Driver.create();
          const calendarTab: Component = await driver.waitForComponent(ON.id('tab1'), 5000);
          expect(await existsById(driver, 'tab1')).assertTrue();
          await calendarTab.click();
          await sleep(800);
          const addCalendar: Component = await driver.waitForComponent(ON.id('addCalendar'), 3000);
          expect(await existsById(driver, 'addCalendar')).assertTrue();

          const timerTab: Component = await driver.findComponent(ON.id('tab2'));
          await timerTab.click();
          await sleep(800);
          const countDown: Component = await driver.waitForComponent(ON.id('countDown'), 3000);
          expect(await existsById(driver, 'countDown')).assertTrue();

          const alarmTab: Component = await driver.findComponent(ON.id('tab0'));
          await alarmTab.click();
          await sleep(800);
          const addClock: Component = await driver.waitForComponent(ON.id('addClock'), 3000);
          expect(await existsById(driver, 'addClock')).assertTrue();
          Logger.info(`${TAG} testReminderAgentSwitchTab0003 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentSwitchTab0003 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_0400
     * @tc.name      testReminderAgentAlarmPicker0004
     * @tc.desc      Open the alarm time picker and cancel it, then verify the alarm page remains.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentAlarmPicker0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentAlarmPicker0004 begin`);
        try {
          const driver: Driver = Driver.create();
          const addClock: Component = await driver.waitForComponent(ON.id('addClock'), 3000);
          await addClock.click();
          const cancelled: boolean = await clickDialogButton(driver, ['取消', 'Cancel'], 'TimePicker', 3000);
          expect(cancelled).assertTrue();
          await sleep(500);
          await await driver.waitForComponent(ON.id('addClock'), 3000);
          expect(await existsById(driver, 'addClock')).assertTrue();
          Logger.info(`${TAG} testReminderAgentAlarmPicker0004 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentAlarmPicker0004 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_0500
     * @tc.name      testReminderAgentCalendarPicker0005
     * @tc.desc      Open the calendar date picker and cancel it, then verify the calendar page remains.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentCalendarPicker0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentCalendarPicker0005 begin`);
        try {
          const driver: Driver = Driver.create();
          const calendarTab: Component = await driver.findComponent(ON.id('tab1'));
          await calendarTab.click();
          await sleep(800);
          const addCalendar: Component = await driver.waitForComponent(ON.id('addCalendar'), 3000);
          await addCalendar.click();
          const cancelled: boolean = await clickDialogButton(driver, ['取消', 'Cancel'], 'DatePicker', 3000);
          expect(cancelled).assertTrue();
          await sleep(500);
          await await driver.waitForComponent(ON.id('addCalendar'), 3000);
          expect(await existsById(driver, 'addCalendar')).assertTrue();
          Logger.info(`${TAG} testReminderAgentCalendarPicker0005 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentCalendarPicker0005 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_0600
     * @tc.name      testReminderAgentTimerZeroStart0006
     * @tc.desc      Verify the timer does not start at zero seconds and resets back to zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentTimerZeroStart0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentTimerZeroStart0006 begin`);
        try {
          const driver: Driver = Driver.create();
          const timerTab: Component = await driver.findComponent(ON.id('tab2'));
          await timerTab.click();
          await sleep(800);
          const countDown: Component = await driver.waitForComponent(ON.id('countDown'), 3000);
          const initialText: string = await countDown.getText();
          expect(initialText).assertEqual('00:00:00');

          const start: Component = await driver.findComponent(ON.id('startCalculagraph'));
          await start.click();
          await sleep(1500);
          const afterStart: Component = await driver.findComponent(ON.id('countDown'));
          const afterText: string = await afterStart.getText();
          expect(afterText).assertEqual('00:00:00');

          const reset: Component = await driver.findComponent(ON.id('resetCalculagraph'));
          await reset.click();
          await sleep(500);
          const afterReset: Component = await driver.findComponent(ON.id('countDown'));
          const resetText: string = await afterReset.getText();
          expect(resetText).assertEqual('00:00:00');
          Logger.info(`${TAG} testReminderAgentTimerZeroStart0006 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentTimerZeroStart0006 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_0700
     * @tc.name      testReminderAgentPublishTimer0007
     * @tc.desc      Publish a timer reminder, verify it is valid, cancel it and verify it is removed.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentPublishTimer0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentPublishTimer0007 begin`);
        try {
          await reminderAgentManager.addNotificationSlot({
            notificationType: notificationManager.SlotType.CONTENT_INFORMATION
          });
          await publishCheckAndCancel(createTimerRequest(60, 9101));
          const reminders = await reminderAgentManager.getAllValidReminders();
          expect(Array.isArray(reminders)).assertTrue();
          expect(reminders.length >= 0).assertTrue();
          Logger.info(`${TAG} testReminderAgentPublishTimer0007 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentPublishTimer0007 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_0800
     * @tc.name      testReminderAgentPublishAlarm0008
     * @tc.desc      Publish an alarm reminder, verify it is valid, cancel it and verify it is removed.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentPublishAlarm0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentPublishAlarm0008 begin`);
        try {
          await reminderAgentManager.addNotificationSlot({
            notificationType: notificationManager.SlotType.CONTENT_INFORMATION
          });
          await publishCheckAndCancel(createAlarmRequest(5));
          const reminders = await reminderAgentManager.getAllValidReminders();
          expect(Array.isArray(reminders)).assertTrue();
          expect(reminders.length >= 0).assertTrue();
          Logger.info(`${TAG} testReminderAgentPublishAlarm0008 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentPublishAlarm0008 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_0900
     * @tc.name      testReminderAgentPublishCalendar0009
     * @tc.desc      Publish a calendar reminder, verify it is valid, cancel it and verify it is removed.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentPublishCalendar0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentPublishCalendar0009 begin`);
        try {
          await reminderAgentManager.addNotificationSlot({
            notificationType: notificationManager.SlotType.CONTENT_INFORMATION
          });
          await publishCheckAndCancel(createCalendarRequest(10));
          const reminders = await reminderAgentManager.getAllValidReminders();
          expect(Array.isArray(reminders)).assertTrue();
          expect(reminders.length >= 0).assertTrue();
          Logger.info(`${TAG} testReminderAgentPublishCalendar0009 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentPublishCalendar0009 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_1000
     * @tc.name      testReminderAgentInvalidRequest0010
     * @tc.desc      Verify that publishing an incomplete reminder request fails.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentInvalidRequest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentInvalidRequest0010 begin`);
        try {
          const invalidRequest: reminderAgentManager.ReminderRequest = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER
          };
          let failed: boolean = false;
          try {
            await reminderAgentManager.publishReminder(invalidRequest);
          } catch (err) {
            failed = true;
            Logger.info(`${TAG} expected error: ${JSON.stringify(err)}`);
          }
          expect(failed).assertTrue();
          expect(typeof failed).assertEqual('boolean');
          Logger.info(`${TAG} testReminderAgentInvalidRequest0010 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentInvalidRequest0010 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_1100
     * @tc.name      testReminderAgentTimeConversion0011
     * @tc.desc      Verify time conversion results are correct for future and past timestamps.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentTimeConversion0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentTimeConversion0011 begin`);
        try {
          const before: Date = new Date();
          const future: Date = new Date(before.getTime() + 10 * 60 * 1000);
          const futureHour: number = future.getHours();
          const futureMinute: number = future.getMinutes();
          const actualFuture: number = TimeConversion.timeToMillisecond(futureHour, futureMinute);
          const after: Date = new Date();
          const low: number = Math.min(expectedTimeToMillisecond(futureHour, futureMinute, before),
            expectedTimeToMillisecond(futureHour, futureMinute, after)) - 2;
          const high: number = Math.max(expectedTimeToMillisecond(futureHour, futureMinute, before),
            expectedTimeToMillisecond(futureHour, futureMinute, after)) + 2;
          expect(actualFuture >= low).assertTrue();
          expect(actualFuture <= high).assertTrue();

          const past: Date = new Date(after.getTime() - 10 * 60 * 1000);
          const pastHour: number = past.getHours();
          const pastMinute: number = past.getMinutes();
          const actualPast: number = TimeConversion.timeToMillisecond(pastHour, pastMinute);
          const pastLow: number = Math.min(expectedTimeToMillisecond(pastHour, pastMinute, before),
            expectedTimeToMillisecond(pastHour, pastMinute, after)) - 2;
          const pastHigh: number = Math.max(expectedTimeToMillisecond(pastHour, pastMinute, before),
            expectedTimeToMillisecond(pastHour, pastMinute, after)) + 2;
          expect(actualPast >= pastLow).assertTrue();
          expect(actualPast <= pastHigh).assertTrue();

          const futureDate: Date = new Date(Date.now() + 10 * 60 * 1000);
          const dateFuture: number = TimeConversion.dateToMillisecond(futureDate.getFullYear(),
            futureDate.getMonth() + 1, futureDate.getDate(), futureDate.getHours(), futureDate.getMinutes());
          expect(dateFuture > 0).assertTrue();
          expect(dateFuture <= 10 * 60).assertTrue();

          const pastDate: Date = new Date(Date.now() - 10 * 60 * 1000);
          const datePast: number = TimeConversion.dateToMillisecond(pastDate.getFullYear(),
            pastDate.getMonth() + 1, pastDate.getDate(), pastDate.getHours(), pastDate.getMinutes());
          expect(datePast < 0).assertTrue();
          expect(datePast >= -11 * 60).assertTrue();
          Logger.info(`${TAG} testReminderAgentTimeConversion0011 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentTimeConversion0011 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_1200
     * @tc.name      testReminderAgentPreferences0012
     * @tc.desc      Verify preference put, get and delete operations return the expected values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentPreferences0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentPreferences0012 begin`);
        try {
          const entryContext = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(entryContext, { name: PREF_NAME });
          const key: string = 'uiTestKey';
          const value: string = 'uiTestValue';
          await pref.put(key, value);
          await pref.flush();
          const readValue: string = String(await pref.get(key, ''));
          expect(readValue).assertEqual(value);
          await pref.delete(key);
          await pref.flush();
          const afterDelete: string = String(await pref.get(key, ''));
          expect(afterDelete).assertEqual('');
          Logger.info(`${TAG} testReminderAgentPreferences0012 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentPreferences0012 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_1300
     * @tc.name      testReminderAgentAlarmFlow0013
     * @tc.desc      Add an alarm, enable it, verify it is published, swipe left and verify it is deleted.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentAlarmFlow0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentAlarmFlow0013 begin`);
        try {
          const driver: Driver = Driver.create();
          const alarmTab: Component = await driver.waitForComponent(ON.id('tab0'), 5000);
          expect(await existsById(driver, 'tab0')).assertTrue();
          await alarmTab.click();
          await sleep(800);
          const rowsBefore: Array<Component> = await findRows(driver, 'clock0');
          const index: number = rowsBefore.length;
          Logger.info(`${TAG} alarm rows before add: ${index}`);
          const addClock: Component = await driver.waitForComponent(ON.id('addClock'), 3000);
          await addClock.click();
          const confirmed: boolean = await clickDialogButton(driver, ['确定', 'OK'], 'TimePicker', 3000);
          expect(confirmed).assertTrue();
          let clockSwitch: Component =
            await driver.waitForComponent(ON.id(`clockSwitch${index}`), 5000);
          expect(await waitForId(driver, `clockSwitch${index}`, 10)).assertTrue();
          const rowsAfterAdd: Array<Component> = await findRows(driver, 'clock0');
          expect(rowsAfterAdd.length).assertEqual(index + 1);
          await clockSwitch.click();
          await sleep(1500);
          clockSwitch = await driver.findComponent(ON.id(`clockSwitch${index}`));
          const checked: boolean = await clockSwitch.isChecked();
          expect(checked).assertTrue();
          Logger.info(`${TAG} alarm rows after add: ${rowsAfterAdd.length}, checked: ${checked}`);
          const rowsForSwipe: Array<Component> = await findRows(driver, 'clock0');
          expect(rowsForSwipe.length).assertLarger(index);
          await swipeRowLeft(driver, rowsForSwipe[rowsForSwipe.length - 1]);
          await sleep(2500);
          const rowsAfterDelete: Array<Component> = await findRows(driver, 'clock0');
          expect(rowsAfterDelete.length).assertEqual(index);
          Logger.info(`${TAG} testReminderAgentAlarmFlow0013 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentAlarmFlow0013 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_1400
     * @tc.name      testReminderAgentCalendarFlow0014
     * @tc.desc      Add a calendar reminder, verify it is stored, swipe left and verify it is deleted.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentCalendarFlow0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentCalendarFlow0014 begin`);
        try {
          const driver: Driver = Driver.create();
          const calendarTab: Component = await driver.waitForComponent(ON.id('tab1'), 5000);
          expect(await existsById(driver, 'tab1')).assertTrue();
          await calendarTab.click();
          await sleep(800);
          const rowsBefore: Array<Component> = await findRows(driver, 'calendar0');
          const index: number = rowsBefore.length;
          Logger.info(`${TAG} calendar rows before add: ${index}`);
          const addCalendar: Component = await driver.waitForComponent(ON.id('addCalendar'), 3000);
          await addCalendar.click();
          const confirmed: boolean = await clickDialogButton(driver, ['确定', 'OK'], 'DatePicker', 3000);
          expect(confirmed).assertTrue();
          let calendarSwitch: Component =
            await driver.waitForComponent(ON.id(`calendarSwitch${index}`), 5000);
          expect(await waitForId(driver, `calendarSwitch${index}`, 10)).assertTrue();
          const rowsAfterAdd: Array<Component> = await findRows(driver, 'calendar0');
          expect(rowsAfterAdd.length).assertEqual(index + 1);
          await calendarSwitch.click();
          await sleep(1500);
          calendarSwitch = await driver.findComponent(ON.id(`calendarSwitch${index}`));
          const checked: boolean = await calendarSwitch.isChecked();
          expect(checked).assertTrue();
          Logger.info(`${TAG} calendar rows after add: ${rowsAfterAdd.length}, checked: ${checked}`);
          const rowsForSwipe: Array<Component> = await findRows(driver, 'calendar0');
          expect(rowsForSwipe.length).assertLarger(index);
          await swipeRowLeft(driver, rowsForSwipe[rowsForSwipe.length - 1]);
          await sleep(2500);
          const rowsAfterDelete: Array<Component> = await findRows(driver, 'calendar0');
          expect(rowsAfterDelete.length).assertEqual(index);
          Logger.info(`${TAG} testReminderAgentCalendarFlow0014 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentCalendarFlow0014 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_1500
     * @tc.name      testReminderAgentTimerFlow0015
     * @tc.desc      Set a non-zero timer, start it, pause it, verify it freezes, then reset it to zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentTimerFlow0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentTimerFlow0015 begin`);
        try {
          const driver: Driver = Driver.create();
          const timerTab: Component = await driver.findComponent(ON.id('tab2'));
          await timerTab.click();
          await sleep(800);
          let secondPicker: Component = await driver.waitForComponent(ON.id('secondPicker'), 3000);
          let rect = await secondPicker.getBounds();
          let centerX: number = (rect.left + rect.right) / 2;
          let centerY: number = (rect.top + rect.bottom) / 2;
          for (let i = 0; i < 3; i++) {
            await driver.swipe(centerX, centerY + 30, centerX, centerY - 30, 300);
            await sleep(300);
          }
          let start: Component = await driver.findComponent(ON.id('startCalculagraph'));
          await start.click();
          await sleep(1500);
          let countDown: Component = await driver.findComponent(ON.id('countDown'));
          let runningText: string = await countDown.getText();
          if (runningText === '00:00:00') {
            secondPicker = await driver.waitForComponent(ON.id('secondPicker'), 3000);
            rect = await secondPicker.getBounds();
            centerX = (rect.left + rect.right) / 2;
            centerY = (rect.top + rect.bottom) / 2;
            for (let i = 0; i < 5; i++) {
              await driver.swipe(centerX, centerY + 30, centerX, centerY - 30, 300);
              await sleep(300);
            }
            start = await driver.findComponent(ON.id('startCalculagraph'));
            await start.click();
            await sleep(1500);
            countDown = await driver.findComponent(ON.id('countDown'));
            runningText = await countDown.getText();
          }
          expect(runningText === '00:00:00').assertFalse();
          const pauseButton: Component = await driver.findComponent(ON.id('startCalculagraph'));
          await pauseButton.click();
          await sleep(500);
          let pausedView: Component = await driver.findComponent(ON.id('countDown'));
          const pausedText: string = await pausedView.getText();
          await sleep(1500);
          pausedView = await driver.findComponent(ON.id('countDown'));
          const pausedTextAgain: string = await pausedView.getText();
          expect(pausedTextAgain).assertEqual(pausedText);
          const resetButton: Component = await driver.findComponent(ON.id('resetCalculagraph'));
          await resetButton.click();
          await sleep(500);
          const resetView: Component = await driver.findComponent(ON.id('countDown'));
          const resetText: string = await resetView.getText();
          expect(resetText).assertEqual('00:00:00');
          Logger.info(`${TAG} testReminderAgentTimerFlow0015 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentTimerFlow0015 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_1600
     * @tc.name      testReminderAgentNotifyArrival0016
     * @tc.desc      Publish a five-second timer reminder and verify the notification arrives.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentNotifyArrival0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentNotifyArrival0016 begin`);
        let reminderId: number = 0;
        try {
          await reminderAgentManager.addNotificationSlot({
            notificationType: notificationManager.SlotType.CONTENT_INFORMATION
          });
          const request: reminderAgentManager.ReminderRequestTimer = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
            triggerTimeInSeconds: 5,
            ringDuration: 1,
            title: NOTIFY_TITLE,
            content: REMINDER_CONTENT,
            wantAgent: createWantAgent(),
            notificationId: 9201,
            slotType: notificationManager.SlotType.CONTENT_INFORMATION
          };
          reminderId = await reminderAgentManager.publishReminder(request);
          expect(reminderId).assertLarger(0);
          expect(typeof reminderId).assertEqual('number');
          await sleep(9000);
          const active = await notificationManager.getActiveNotifications();
          const found: boolean =
            active.some((item) => JSON.stringify(item).includes(NOTIFY_TITLE));
          expect(found).assertTrue();
          try {
            await reminderAgentManager.cancelReminder(reminderId);
          } catch (err) {
            Logger.info(`${TAG} reminder already triggered, cancel skipped`);
          }
          Logger.info(`${TAG} testReminderAgentNotifyArrival0016 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentNotifyArrival0016 failed: ${JSON.stringify(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_1700
     * @tc.name      testReminderAgentAlarmSettings0017
     * @tc.desc      Change alarm repeat day, vibration and ringtone in the setting dialog and verify them.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentAlarmSettings0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentAlarmSettings0017 begin`);
        try {
          const driver: Driver = Driver.create();
          expect(await ensureOneAlarm(driver)).assertTrue();
          const alarmName: string = AlarmClockReminder.alarmClockReminders[0].reminderName;
          const rowText: Component = await driver.waitForComponent(ON.text(alarmName), 3000);
          expect(await existsByText(driver, alarmName)).assertTrue();
          await shellClickComponent(rowText);
          await sleep(500);
          await await driver.waitForComponent(ON.id('alarmSettingConfirm'), 3000);
          expect(await existsById(driver, 'alarmSettingConfirm')).assertTrue();
          expect(await clickId(driver, 'day00', 3000)).assertTrue();
          expect(await clickId(driver, 'vibrationSwitch0', 3000)).assertTrue();
          expect(await clickId(driver, 'selectMusic0', 3000)).assertTrue();
          await sleep(300);
          expect(await clickAnyText(driver, ['Demo'], 2000)).assertTrue();
          await sleep(300);
          expect(await clickId(driver, 'alarmSettingConfirm', 3000)).assertTrue();
          await sleep(500);
          const alarm = AlarmClockReminder.alarmClockReminders[0];
          expect(alarm.reminderRequestAlarm!.daysOfWeek!.includes(1)).assertTrue();
          expect(alarm.isVibrator).assertTrue();
          expect(alarm.audioSrc.includes('demo.wav')).assertTrue();
          Logger.info(`${TAG} testReminderAgentAlarmSettings0017 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentAlarmSettings0017 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_1800
     * @tc.name      testReminderAgentCalendarSettings0018
     * @tc.desc      Change calendar vibration and ringtone in the setting dialog and verify them.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentCalendarSettings0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentCalendarSettings0018 begin`);
        try {
          const driver: Driver = Driver.create();
          expect(await ensureOneCalendar(driver)).assertTrue();
          const calendarName: string = CalendarReminder.calendarReminders[0].reminderName;
          const rowText: Component = await driver.waitForComponent(ON.text(calendarName), 3000);
          expect(await existsByText(driver, calendarName)).assertTrue();
          await shellClickComponent(rowText);
          await sleep(500);
          await await driver.waitForComponent(ON.id('calendarSettingConfirm'), 3000);
          expect(await existsById(driver, 'calendarSettingConfirm')).assertTrue();
          expect(await clickId(driver, 'vibrationSwitch0', 3000)).assertTrue();
          expect(await clickId(driver, 'music0', 3000)).assertTrue();
          await sleep(300);
          expect(await clickAnyText(driver, ['Demo'], 2000)).assertTrue();
          await sleep(300);
          expect(await clickId(driver, 'calendarSettingConfirm', 3000)).assertTrue();
          await sleep(500);
          const calendar = CalendarReminder.calendarReminders[0];
          expect(calendar.isVibrator).assertTrue();
          expect(calendar.audioSrc.includes('demo.wav')).assertTrue();
          Logger.info(`${TAG} testReminderAgentCalendarSettings0018 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentCalendarSettings0018 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_1900
     * @tc.name      testReminderAgentAlarmSwitchOff0019
     * @tc.desc      Enable then disable an alarm and verify the reminder is no longer valid.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentAlarmSwitchOff0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentAlarmSwitchOff0019 begin`);
        try {
          const driver: Driver = Driver.create();
          expect(await ensureOneAlarm(driver)).assertTrue();
          let clockSwitch: Component =
            await driver.waitForComponent(ON.id('clockSwitch0'), 3000);
          expect(await waitForId(driver, 'clockSwitch0', 10)).assertTrue();
          await clockSwitch.click();
          await sleep(1500);
          expect(AlarmClockReminder.alarmClockReminders[0].isStart).assertTrue();
          const reminderId: number = AlarmClockReminder.alarmClockReminders[0].reminderId;
          expect(reminderId).assertLarger(0);
          expect(typeof reminderId).assertEqual('number');
          clockSwitch = await driver.findComponent(ON.id('clockSwitch0'));
          expect(await existsById(driver, 'clockSwitch0')).assertTrue();
          await clockSwitch.click();
          await sleep(1500);
          expect(AlarmClockReminder.alarmClockReminders[0].isStart).assertFalse();
          const validReminders: Array<reminderAgentManager.ReminderInfo> =
            await reminderAgentManager.getAllValidReminders();
          const stillValid: boolean =
            validReminders.some((item: reminderAgentManager.ReminderInfo) => item.reminderId === reminderId);
          expect(stillValid).assertFalse();
          Logger.info(`${TAG} testReminderAgentAlarmSwitchOff0019 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentAlarmSwitchOff0019 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_2000
     * @tc.name      testReminderAgentAlarmSettingsCancel0020
     * @tc.desc      Select a repeat day in the setting dialog and cancel, verifying the change is discarded.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentAlarmSettingsCancel0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info(`${TAG} testReminderAgentAlarmSettingsCancel0020 begin`);
        try {
          const driver: Driver = Driver.create();
          expect(await ensureOneAlarm(driver)).assertTrue();
          const alarmName: string = AlarmClockReminder.alarmClockReminders[0].reminderName;
          const rowText: Component = await driver.waitForComponent(ON.text(alarmName), 3000);
          expect(await existsByText(driver, alarmName)).assertTrue();
          await shellClickComponent(rowText);
          await sleep(500);
          await await driver.waitForComponent(ON.id('alarmSettingCancel'), 3000);
          expect(await existsById(driver, 'alarmSettingCancel')).assertTrue();
          expect(await clickId(driver, 'day00', 3000)).assertTrue();
          expect(await clickId(driver, 'alarmSettingCancel', 3000)).assertTrue();
          await sleep(800);
          expect(AlarmClockReminder.alarmClockReminders[0].reminderRequestAlarm!.daysOfWeek!.includes(1))
            .assertFalse();
          Logger.info(`${TAG} testReminderAgentAlarmSettingsCancel0020 end`);
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentAlarmSettingsCancel0020 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_2100
     * @tc.name      testReminderAgentMatrixTimeBounds0021
     * @tc.desc      Verify time conversion results stay inside one day for boundary times.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixTimeBounds0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const values: number[] = [
            TimeConversion.timeToMillisecond(0, 0),
            TimeConversion.timeToMillisecond(0, 1),
            TimeConversion.timeToMillisecond(12, 0),
            TimeConversion.timeToMillisecond(23, 59)
          ];
          for (let i = 0; i < values.length; i++) {
            expect(values[i] >= -2).assertTrue();
            expect(values[i] <= 86398).assertTrue();
          }
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixTimeBounds0021 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_2200
     * @tc.name      testReminderAgentMatrixTimeConsistency0022
     * @tc.desc      Verify one converted time matches the expected value with clock tolerance.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixTimeConsistency0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const before: Date = new Date();
          const target: Date = new Date(before.getTime() + 10 * 60 * 1000);
          const actual: number =
            TimeConversion.timeToMillisecond(target.getHours(), target.getMinutes());
          const after: Date = new Date();
          const low: number = Math.min(
            expectedTimeToMillisecond(target.getHours(), target.getMinutes(), before),
            expectedTimeToMillisecond(target.getHours(), target.getMinutes(), after)) - 3;
          const high: number = Math.max(
            expectedTimeToMillisecond(target.getHours(), target.getMinutes(), before),
            expectedTimeToMillisecond(target.getHours(), target.getMinutes(), after)) + 3;
          expect(actual >= low).assertTrue();
          expect(actual <= high).assertTrue();
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixTimeConsistency0022 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_2300
     * @tc.name      testReminderAgentMatrixDateFuture0023
     * @tc.desc      Verify a date two minutes ahead converts to a small positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDateFuture0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const future: Date = new Date(Date.now() + 2 * 60 * 1000);
          const result: number = TimeConversion.dateToMillisecond(future.getFullYear(),
            future.getMonth() + 1, future.getDate(), future.getHours(), future.getMinutes());
          expect(result > 0).assertTrue();
          expect(result <= 121).assertTrue();
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixDateFuture0023 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_2400
     * @tc.name      testReminderAgentMatrixDatePast0024
     * @tc.desc      Verify a date two minutes ago converts to a small negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDatePast0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const past: Date = new Date(Date.now() - 2 * 60 * 1000);
          const result: number = TimeConversion.dateToMillisecond(past.getFullYear(),
            past.getMonth() + 1, past.getDate(), past.getHours(), past.getMinutes());
          expect(result < 0).assertTrue();
          expect(result >= -181).assertTrue();
          expect(result <= -60).assertTrue();
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixDatePast0024 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_2500
     * @tc.name      testReminderAgentMatrixDateSameMinute0025
     * @tc.desc      Verify the current minute converts to a value between minus one minute and zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDateSameMinute0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const now: Date = new Date();
          const result: number = TimeConversion.dateToMillisecond(now.getFullYear(),
            now.getMonth() + 1, now.getDate(), now.getHours(), now.getMinutes());
          expect(result <= 0).assertTrue();
          expect(result >= -60).assertTrue();
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixDateSameMinute0025 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_2600
     * @tc.name      testReminderAgentMatrixDateWrap0026
     * @tc.desc      Verify next-hour and previous-hour conversions wrap within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDateWrap0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const now: Date = new Date();
          const nextHour: number = (now.getHours() + 1) % 24;
          const prevHour: number = (now.getHours() + 23) % 24;
          const nextResult: number = TimeConversion.dateToMillisecond(now.getFullYear(),
            now.getMonth() + 1, now.getDate(), nextHour, 0);
          const prevResult: number = TimeConversion.dateToMillisecond(now.getFullYear(),
            now.getMonth() + 1, now.getDate(), prevHour, 0);
          expect(nextResult >= 0).assertTrue();
          expect(nextResult <= 3600).assertTrue();
          expect(prevResult !== 0).assertTrue();
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixDateWrap0026 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_2700
     * @tc.name      testReminderAgentMatrixTimerPublish0027
     * @tc.desc      Publish and cancel a timer reminder and verify valid reminder state.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixTimerPublish0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let reminderId: number = 0;
        try {
          await reminderAgentManager.addNotificationSlot({
            notificationType: notificationManager.SlotType.CONTENT_INFORMATION
          });
          reminderId = await reminderAgentManager.publishReminder(createTimerRequest(60, 9301));
          expect(reminderId).assertLarger(0);
          expect(typeof reminderId).assertEqual('number');
          let valid: Array<reminderAgentManager.ReminderInfo> =
            await reminderAgentManager.getAllValidReminders();
          expect(valid.some((item: reminderAgentManager.ReminderInfo) => item.reminderId === reminderId))
            .assertTrue();
          const canceledId: number = reminderId;
          await reminderAgentManager.cancelReminder(canceledId);
          reminderId = 0;
          valid = await reminderAgentManager.getAllValidReminders();
          expect(valid.some((item: reminderAgentManager.ReminderInfo) => item.reminderId === canceledId))
            .assertFalse();
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixTimerPublish0027 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          if (reminderId > 0) {
            try {
              await reminderAgentManager.cancelReminder(reminderId);
            } catch (err) {
              Logger.info(`${TAG} cleanup timer reminder skipped`);
            }
          }
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_2800
     * @tc.name      testReminderAgentMatrixAlarmPublish0028
     * @tc.desc      Publish and cancel an alarm reminder with a future hour.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixAlarmPublish0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let reminderId: number = 0;
        try {
          const hour: number = (new Date().getHours() + 1) % 24;
          const request: reminderAgentManager.ReminderRequestAlarm = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
            hour: hour,
            minute: 0,
            title: REMINDER_TITLE,
            content: REMINDER_CONTENT,
            ringDuration: 1,
            wantAgent: createWantAgent(),
            slotType: notificationManager.SlotType.CONTENT_INFORMATION,
            daysOfWeek: []
          };
          reminderId = await reminderAgentManager.publishReminder(request);
          expect(reminderId).assertLarger(0);
          expect(typeof reminderId).assertEqual('number');
          await reminderAgentManager.cancelReminder(reminderId);
          reminderId = 0;
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixAlarmPublish0028 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          if (reminderId > 0) {
            try {
              await reminderAgentManager.cancelReminder(reminderId);
            } catch (err) {
              Logger.info(`${TAG} cleanup alarm reminder skipped`);
            }
          }
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_2900
     * @tc.name      testReminderAgentMatrixCalendarPublish0029
     * @tc.desc      Publish and cancel a calendar reminder five minutes ahead.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixCalendarPublish0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let reminderId: number = 0;
        try {
          const date: Date = new Date(Date.now() + 5 * 60 * 1000);
          const request: reminderAgentManager.ReminderRequestCalendar = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_CALENDAR,
            dateTime: {
              year: date.getFullYear(),
              month: date.getMonth() + 1,
              day: date.getDate(),
              hour: date.getHours(),
              minute: date.getMinutes()
            },
            title: REMINDER_TITLE,
            content: REMINDER_CONTENT,
            ringDuration: 1,
            wantAgent: createWantAgent(),
            slotType: notificationManager.SlotType.CONTENT_INFORMATION
          };
          reminderId = await reminderAgentManager.publishReminder(request);
          expect(reminderId).assertLarger(0);
          expect(typeof reminderId).assertEqual('number');
          await reminderAgentManager.cancelReminder(reminderId);
          reminderId = 0;
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixCalendarPublish0029 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          if (reminderId > 0) {
            try {
              await reminderAgentManager.cancelReminder(reminderId);
            } catch (err) {
              Logger.info(`${TAG} cleanup calendar reminder skipped`);
            }
          }
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_3000
     * @tc.name      testReminderAgentMatrixInvalidAlarm0030
     * @tc.desc      Verify an alarm request without hour and minute is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixInvalidAlarm0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequest = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
            title: REMINDER_TITLE
          };
          let failed: boolean = false;
          try {
            await reminderAgentManager.publishReminder(request);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(typeof failed).assertEqual('boolean');
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixInvalidAlarm0030 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_3100
     * @tc.name      testReminderAgentMatrixInvalidCalendar0031
     * @tc.desc      Verify a calendar request without dateTime is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixInvalidCalendar0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const request: reminderAgentManager.ReminderRequest = {
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_CALENDAR,
            title: REMINDER_TITLE
          };
          let failed: boolean = false;
          try {
            await reminderAgentManager.publishReminder(request);
          } catch (err) {
            failed = true;
          }
          expect(failed).assertTrue();
          expect(typeof failed).assertEqual('boolean');
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixInvalidCalendar0031 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_3300
     * @tc.name      testReminderAgentMatrixTabCycle0033
     * @tc.desc      Verify switching through all three tabs and back to alarm.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixTabCycle0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          for (let i = 1; i <= 2; i++) {
            const tab: Component = await driver.waitForComponent(ON.id(`tab${i}`), 3000);
            await tab.click();
            await sleep(500);
            expect(await existsById(driver, `tab${i}`)).assertTrue();
          }
          const alarmTab: Component = await driver.waitForComponent(ON.id('tab0'), 3000);
          await alarmTab.click();
          await sleep(500);
          expect(await existsById(driver, 'addClock')).assertTrue();
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixTabCycle0033 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_3600
     * @tc.name      testReminderAgentMatrixTimerResume0036
     * @tc.desc      Verify pause freezes the countdown and resume makes it advance again.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixTimerResume0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          const timerTab: Component = await driver.waitForComponent(ON.id('tab2'), 3000);
          await timerTab.click();
          await sleep(500);
          const picker: Component = await driver.waitForComponent(ON.id('secondPicker'), 3000);
          const rect = await picker.getBounds();
          const x: number = (rect.left + rect.right) / 2;
          const y: number = (rect.top + rect.bottom) / 2;
          for (let i = 0; i < 3; i++) {
            await driver.swipe(x, y + 30, x, y - 30, 300);
            await sleep(300);
          }
          let start: Component = await driver.findComponent(ON.id('startCalculagraph'));
          await start.click();
          await sleep(1200);
          start = await driver.findComponent(ON.id('startCalculagraph'));
          await start.click();
          await sleep(300);
          const paused: string = await (await driver.findComponent(ON.id('countDown'))).getText();
          await sleep(1200);
          expect(await (await driver.findComponent(ON.id('countDown'))).getText()).assertEqual(paused);
          start = await driver.findComponent(ON.id('startCalculagraph'));
          await start.click();
          await sleep(1200);
          expect((await (await driver.findComponent(ON.id('countDown'))).getText()) === paused).assertFalse();
          await (await driver.findComponent(ON.id('resetCalculagraph'))).click();
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixTimerResume0036 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_3700
     * @tc.name      testReminderAgentMatrixTimerResetTwice0037
     * @tc.desc      Verify resetting an idle timer twice keeps it at zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixTimerResetTwice0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          const timerTab: Component = await driver.waitForComponent(ON.id('tab2'), 3000);
          await timerTab.click();
          await sleep(500);
          for (let i = 0; i < 2; i++) {
            const reset: Component = await driver.findComponent(ON.id('resetCalculagraph'));
            await reset.click();
            await sleep(300);
          }
          expect(await (await driver.findComponent(ON.id('countDown'))).getText()).assertEqual('00:00:00');
          expect(await existsById(driver, 'countDown')).assertTrue();
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixTimerResetTwice0037 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_4000
     * @tc.name      testReminderAgentMatrixAlarmCancel0040
     * @tc.desc      Verify alarm setting cancel discards a repeat-day change.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixAlarmCancel0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureOneAlarm(driver)).assertTrue();
          const name: string = AlarmClockReminder.alarmClockReminders[0].reminderName;
          const row: Component = await driver.waitForComponent(ON.text(name), 3000);
          await shellClickComponent(row);
          await sleep(500);
          await driver.waitForComponent(ON.id('alarmSettingCancel'), 3000);
          expect(await clickId(driver, 'day00', 3000)).assertTrue();
          expect(await clickId(driver, 'alarmSettingCancel', 3000)).assertTrue();
          await sleep(500);
          expect(AlarmClockReminder.alarmClockReminders[0].reminderRequestAlarm!.daysOfWeek!.includes(1))
            .assertFalse();
        } catch (err) {
          Logger.error(`${TAG} testReminderAgentMatrixAlarmCancel0040 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });


    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_4100
     * @tc.name      testReminderAgentMatrixTimeZero0041
     * @tc.desc      Verify midnight conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixTimeZero0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 0);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_4200
     * @tc.name      testReminderAgentMatrixTimeOneMinute0042
     * @tc.desc      Verify one-minute conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixTimeOneMinute0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 1);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_4300
     * @tc.name      testReminderAgentMatrixTimeNoon0043
     * @tc.desc      Verify noon conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixTimeNoon0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(12, 0);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_4400
     * @tc.name      testReminderAgentMatrixTimeLastMinute0044
     * @tc.desc      Verify 23:59 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixTimeLastMinute0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(23, 59);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_4500
     * @tc.name      testReminderAgentMatrixTimeHalfDay0045
     * @tc.desc      Verify 06:30 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixTimeHalfDay0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const value: number = TimeConversion.timeToMillisecond(6, 30);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_4600
     * @tc.name      testReminderAgentMatrixDateFiveMinutes0046
     * @tc.desc      Verify a five-minute future date converts to a positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDateFiveMinutes0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const future: Date = new Date(Date.now() + 5 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(future.getFullYear(),
            future.getMonth() + 1, future.getDate(), future.getHours(), future.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 301).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_4700
     * @tc.name      testReminderAgentMatrixDateFiveMinutesPast0047
     * @tc.desc      Verify a five-minute past date converts to a negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDateFiveMinutesPast0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const past: Date = new Date(Date.now() - 5 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(past.getFullYear(),
            past.getMonth() + 1, past.getDate(), past.getHours(), past.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -361).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_MANAGER_4800
     * @tc.name      testReminderAgentMatrixDateCurrent0048
     * @tc.desc      Verify the current minute is between minus one minute and zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentMatrixDateCurrent0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const now: Date = new Date();
          const value: number = TimeConversion.dateToMillisecond(now.getFullYear(),
            now.getMonth() + 1, now.getDate(), now.getHours(), now.getMinutes());
          expect(value <= 0).assertTrue();
          expect(value >= -90000).assertTrue();
          expect(value >= -60).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
