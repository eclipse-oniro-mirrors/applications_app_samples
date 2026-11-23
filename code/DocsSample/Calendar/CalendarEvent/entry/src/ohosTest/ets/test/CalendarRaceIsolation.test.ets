/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe } from '@ohos/hypium';
import { it, expect } from './TestSupport';
import { CalendarEventSession } from '../../../main/ets/CalendarEventSession';
import type { EventCalendarPort } from '../../../main/ets/CalendarEventSession';
import { CalendarProbe, ManagerProbe, Pending, captureFailure } from './CalendarLogicFixtures';

function assertFailure(actual: Error | undefined, expected: Error): void {
  expect(actual === expected).assertEqual(true);
  expect(actual instanceof Error).assertEqual(true);
  expect(actual?.message).assertEqual(expected.message);
}

async function assertMissingCalendar(session: CalendarEventSession): Promise<void> {
  const failure: Error | undefined = await captureFailure((): Promise<void> => session.updateEvent());
  expect(failure instanceof Error).assertEqual(true);
  expect(failure?.message).assertEqual('Calendar is not ready');
}

async function assertSelected(session: CalendarEventSession, calendar: CalendarProbe,
  expectedId: number | undefined): Promise<void> {
  const previous: number = calendar.updates.length;
  if (expectedId === undefined) {
    const failure: Error | undefined = await captureFailure((): Promise<void> => session.updateEvent());
    expect(failure instanceof Error).assertEqual(true);
    expect(failure?.message).assertEqual('Event has not been created');
    expect(calendar.updates.length).assertEqual(previous);
    return;
  }
  await session.updateEvent();
  expect(calendar.updates.length).assertEqual(previous + 1);
  expect(calendar.updates[previous].id).assertEqual(expectedId);
  expect(calendar.updates[previous].title).assertEqual('updateTitle');
  expect(calendar.updates[previous].description).assertEqual('updateEventTest');
}

export default function calendarRaceIsolationTest(): void {
  describe('CalendarRaceIsolationTest', (): void => {
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_0100
     * @tc.name CalendarEventRaceIsolation_0001
     * @tc.desc Two independent instances run add; right completes first;
     * left clear none; equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0001', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<number> = new Pending<number>();
      const rightGate: Pending<number> = new Pending<number>();
      leftCalendar.addQueue.push(leftGate);
      rightCalendar.addQueue.push(rightGate);
      const left: Promise<number> = leftSession.addEvent();
      const right: Promise<number> = rightSession.addEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<number> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<number> => right);
      rightGate.resolve(903);
      expect((await rightResult) === undefined).assertEqual(true);
      expect(await right).assertEqual(903);
      await assertSelected(leftSession, leftCalendar, 901);
      await assertSelected(rightSession, rightCalendar, 903);
      leftGate.resolve(902);
      expect((await leftResult) === undefined).assertEqual(true);
      expect(await left).assertEqual(902);
      await assertSelected(leftSession, leftCalendar, 902);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(0);
      expect(rightCalendar.deletions.length).assertEqual(0);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_0200
     * @tc.name CalendarEventRaceIsolation_0002
     * @tc.desc Two independent instances run add; right completes first;
     * left clear before; left fails with original error;equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0002', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<number> = new Pending<number>();
      const rightGate: Pending<number> = new Pending<number>();
      leftCalendar.addQueue.push(leftGate);
      rightCalendar.addQueue.push(rightGate);
      const left: Promise<number> = leftSession.addEvent();
      const right: Promise<number> = rightSession.addEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<number> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<number> => right);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      rightGate.resolve(903);
      expect((await rightResult) === undefined).assertEqual(true);
      expect(await right).assertEqual(903);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, 903);
      const error: Error = new Error('left instance operation failed');
      leftGate.reject(error);
      assertFailure(await leftResult, error);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(0);
      expect(rightCalendar.deletions.length).assertEqual(0);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_0300
     * @tc.name CalendarEventRaceIsolation_0003
     * @tc.desc Two independent instances run add; right completes first;
     * left clear after; equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0003', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<number> = new Pending<number>();
      const rightGate: Pending<number> = new Pending<number>();
      leftCalendar.addQueue.push(leftGate);
      rightCalendar.addQueue.push(rightGate);
      const left: Promise<number> = leftSession.addEvent();
      const right: Promise<number> = rightSession.addEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<number> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<number> => right);
      rightGate.resolve(903);
      expect((await rightResult) === undefined).assertEqual(true);
      expect(await right).assertEqual(903);
      await assertSelected(leftSession, leftCalendar, 901);
      await assertSelected(rightSession, rightCalendar, 903);
      leftGate.resolve(902);
      expect((await leftResult) === undefined).assertEqual(true);
      expect(await left).assertEqual(902);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(0);
      expect(rightCalendar.deletions.length).assertEqual(0);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_0400
     * @tc.name CalendarEventRaceIsolation_0004
     * @tc.desc Two independent instances run add; left completes first;
     * left clear none; equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0004', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<number> = new Pending<number>();
      const rightGate: Pending<number> = new Pending<number>();
      leftCalendar.addQueue.push(leftGate);
      rightCalendar.addQueue.push(rightGate);
      const left: Promise<number> = leftSession.addEvent();
      const right: Promise<number> = rightSession.addEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<number> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<number> => right);
      leftGate.resolve(902);
      expect((await leftResult) === undefined).assertEqual(true);
      expect(await left).assertEqual(902);
      await assertSelected(leftSession, leftCalendar, 902);
      await assertSelected(rightSession, rightCalendar, 901);
      rightGate.resolve(903);
      expect((await rightResult) === undefined).assertEqual(true);
      expect(await right).assertEqual(903);
      await assertSelected(leftSession, leftCalendar, 902);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(0);
      expect(rightCalendar.deletions.length).assertEqual(0);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_0500
     * @tc.name CalendarEventRaceIsolation_0005
     * @tc.desc Two independent instances run add; left completes first;
     * left clear before; left fails with original error;equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0005', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<number> = new Pending<number>();
      const rightGate: Pending<number> = new Pending<number>();
      leftCalendar.addQueue.push(leftGate);
      rightCalendar.addQueue.push(rightGate);
      const left: Promise<number> = leftSession.addEvent();
      const right: Promise<number> = rightSession.addEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<number> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<number> => right);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      const error: Error = new Error('left instance operation failed');
      leftGate.reject(error);
      assertFailure(await leftResult, error);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, 901);
      rightGate.resolve(903);
      expect((await rightResult) === undefined).assertEqual(true);
      expect(await right).assertEqual(903);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(0);
      expect(rightCalendar.deletions.length).assertEqual(0);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_0600
     * @tc.name CalendarEventRaceIsolation_0006
     * @tc.desc Two independent instances run add; left completes first;
     * left clear after; equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0006', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<number> = new Pending<number>();
      const rightGate: Pending<number> = new Pending<number>();
      leftCalendar.addQueue.push(leftGate);
      rightCalendar.addQueue.push(rightGate);
      const left: Promise<number> = leftSession.addEvent();
      const right: Promise<number> = rightSession.addEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<number> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<number> => right);
      leftGate.resolve(902);
      expect((await leftResult) === undefined).assertEqual(true);
      expect(await left).assertEqual(902);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, 901);
      rightGate.resolve(903);
      expect((await rightResult) === undefined).assertEqual(true);
      expect(await right).assertEqual(903);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(0);
      expect(rightCalendar.deletions.length).assertEqual(0);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_0700
     * @tc.name CalendarEventRaceIsolation_0007
     * @tc.desc Two independent instances run opening; right completes first;
     * left clear none; separate ports never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0007', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      const leftGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const rightGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      leftManager.createQueue.push(leftGate);
      rightManager.createQueue.push(rightGate);
      const left: Promise<void> = leftSession.createCalendar();
      const right: Promise<void> = rightSession.createCalendar();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      expect(leftSession.createCalendar() === left).assertEqual(true);
      expect(rightSession.createCalendar() === right).assertEqual(true);
      expect(left === right).assertEqual(false);
      rightGate.resolve(rightCalendar);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      expect(leftSession.createCalendar() === left).assertEqual(true);
      await assertSelected(rightSession, rightCalendar, undefined);
      leftGate.resolve(leftCalendar);
      expect((await leftResult) === undefined).assertEqual(true);
      expect((await left) === undefined).assertEqual(true);
      await assertSelected(leftSession, leftCalendar, undefined);
      await assertSelected(rightSession, rightCalendar, undefined);
      rightCalendar.nextId = 903;
      expect(await rightSession.addEvent()).assertEqual(903);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.configs.length).assertEqual(1);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_0800
     * @tc.name CalendarEventRaceIsolation_0008
     * @tc.desc Two independent instances run opening; right completes first;
     * left clear before; left fails with original error;separate ports never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0008', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      const leftGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const rightGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      leftManager.createQueue.push(leftGate);
      rightManager.createQueue.push(rightGate);
      const left: Promise<void> = leftSession.createCalendar();
      const right: Promise<void> = rightSession.createCalendar();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      expect(leftSession.createCalendar() === left).assertEqual(true);
      expect(rightSession.createCalendar() === right).assertEqual(true);
      expect(left === right).assertEqual(false);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      rightGate.resolve(rightCalendar);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, undefined);
      const error: Error = new Error('left instance operation failed');
      leftGate.reject(error);
      assertFailure(await leftResult, error);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, undefined);
      rightCalendar.nextId = 903;
      expect(await rightSession.addEvent()).assertEqual(903);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.configs.length).assertEqual(0);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_0900
     * @tc.name CalendarEventRaceIsolation_0009
     * @tc.desc Two independent instances run opening; right completes first;
     * left clear after; separate ports never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0009', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      const leftGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const rightGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      leftManager.createQueue.push(leftGate);
      rightManager.createQueue.push(rightGate);
      const left: Promise<void> = leftSession.createCalendar();
      const right: Promise<void> = rightSession.createCalendar();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      expect(leftSession.createCalendar() === left).assertEqual(true);
      expect(rightSession.createCalendar() === right).assertEqual(true);
      expect(left === right).assertEqual(false);
      rightGate.resolve(rightCalendar);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      expect(leftSession.createCalendar() === left).assertEqual(true);
      await assertSelected(rightSession, rightCalendar, undefined);
      leftGate.resolve(leftCalendar);
      expect((await leftResult) === undefined).assertEqual(true);
      expect((await left) === undefined).assertEqual(true);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, undefined);
      rightCalendar.nextId = 903;
      expect(await rightSession.addEvent()).assertEqual(903);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.configs.length).assertEqual(1);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_1000
     * @tc.name CalendarEventRaceIsolation_0010
     * @tc.desc Two independent instances run opening; left completes first;
     * left clear none; separate ports never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0010', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      const leftGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const rightGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      leftManager.createQueue.push(leftGate);
      rightManager.createQueue.push(rightGate);
      const left: Promise<void> = leftSession.createCalendar();
      const right: Promise<void> = rightSession.createCalendar();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      expect(leftSession.createCalendar() === left).assertEqual(true);
      expect(rightSession.createCalendar() === right).assertEqual(true);
      expect(left === right).assertEqual(false);
      leftGate.resolve(leftCalendar);
      expect((await leftResult) === undefined).assertEqual(true);
      expect((await left) === undefined).assertEqual(true);
      await assertSelected(leftSession, leftCalendar, undefined);
      expect(rightSession.createCalendar() === right).assertEqual(true);
      rightGate.resolve(rightCalendar);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      await assertSelected(leftSession, leftCalendar, undefined);
      await assertSelected(rightSession, rightCalendar, undefined);
      rightCalendar.nextId = 903;
      expect(await rightSession.addEvent()).assertEqual(903);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.configs.length).assertEqual(1);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_1100
     * @tc.name CalendarEventRaceIsolation_0011
     * @tc.desc Two independent instances run opening; left completes first;
     * left clear before; left fails with original error;separate ports never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0011', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      const leftGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const rightGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      leftManager.createQueue.push(leftGate);
      rightManager.createQueue.push(rightGate);
      const left: Promise<void> = leftSession.createCalendar();
      const right: Promise<void> = rightSession.createCalendar();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      expect(leftSession.createCalendar() === left).assertEqual(true);
      expect(rightSession.createCalendar() === right).assertEqual(true);
      expect(left === right).assertEqual(false);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      const error: Error = new Error('left instance operation failed');
      leftGate.reject(error);
      assertFailure(await leftResult, error);
      await assertMissingCalendar(leftSession);
      expect(rightSession.createCalendar() === right).assertEqual(true);
      rightGate.resolve(rightCalendar);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, undefined);
      rightCalendar.nextId = 903;
      expect(await rightSession.addEvent()).assertEqual(903);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.configs.length).assertEqual(0);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_1200
     * @tc.name CalendarEventRaceIsolation_0012
     * @tc.desc Two independent instances run opening; left completes first;
     * left clear after; separate ports never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0012', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      const leftGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const rightGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      leftManager.createQueue.push(leftGate);
      rightManager.createQueue.push(rightGate);
      const left: Promise<void> = leftSession.createCalendar();
      const right: Promise<void> = rightSession.createCalendar();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      expect(leftSession.createCalendar() === left).assertEqual(true);
      expect(rightSession.createCalendar() === right).assertEqual(true);
      expect(left === right).assertEqual(false);
      leftGate.resolve(leftCalendar);
      expect((await leftResult) === undefined).assertEqual(true);
      expect((await left) === undefined).assertEqual(true);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      expect(rightSession.createCalendar() === right).assertEqual(true);
      rightGate.resolve(rightCalendar);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, undefined);
      rightCalendar.nextId = 903;
      expect(await rightSession.addEvent()).assertEqual(903);
      await assertSelected(rightSession, rightCalendar, 903);
      expect(leftCalendar.configs.length).assertEqual(1);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_1300
     * @tc.name CalendarEventRaceIsolation_0013
     * @tc.desc Two independent instances run delete; right completes first;
     * left clear none; equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0013', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<void> = new Pending<void>();
      const rightGate: Pending<void> = new Pending<void>();
      leftCalendar.deleteQueue.push(leftGate);
      rightCalendar.deleteQueue.push(rightGate);
      const left: Promise<void> = leftSession.deleteEvent();
      const right: Promise<void> = rightSession.deleteEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      rightGate.resolve(undefined);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      await assertSelected(leftSession, leftCalendar, 901);
      await assertSelected(rightSession, rightCalendar, undefined);
      leftGate.resolve(undefined);
      expect((await leftResult) === undefined).assertEqual(true);
      expect((await left) === undefined).assertEqual(true);
      await assertSelected(leftSession, leftCalendar, undefined);
      await assertSelected(rightSession, rightCalendar, undefined);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(1);
      expect(rightCalendar.deletions.length).assertEqual(1);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_1400
     * @tc.name CalendarEventRaceIsolation_0014
     * @tc.desc Two independent instances run delete; right completes first;
     * left clear before; left fails with original error;equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0014', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<void> = new Pending<void>();
      const rightGate: Pending<void> = new Pending<void>();
      leftCalendar.deleteQueue.push(leftGate);
      rightCalendar.deleteQueue.push(rightGate);
      const left: Promise<void> = leftSession.deleteEvent();
      const right: Promise<void> = rightSession.deleteEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      rightGate.resolve(undefined);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, undefined);
      const error: Error = new Error('left instance operation failed');
      leftGate.reject(error);
      assertFailure(await leftResult, error);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, undefined);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(1);
      expect(rightCalendar.deletions.length).assertEqual(1);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_1500
     * @tc.name CalendarEventRaceIsolation_0015
     * @tc.desc Two independent instances run delete; right completes first;
     * left clear after; equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0015', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<void> = new Pending<void>();
      const rightGate: Pending<void> = new Pending<void>();
      leftCalendar.deleteQueue.push(leftGate);
      rightCalendar.deleteQueue.push(rightGate);
      const left: Promise<void> = leftSession.deleteEvent();
      const right: Promise<void> = rightSession.deleteEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      rightGate.resolve(undefined);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      await assertSelected(leftSession, leftCalendar, 901);
      await assertSelected(rightSession, rightCalendar, undefined);
      leftGate.resolve(undefined);
      expect((await leftResult) === undefined).assertEqual(true);
      expect((await left) === undefined).assertEqual(true);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, undefined);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(1);
      expect(rightCalendar.deletions.length).assertEqual(1);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_1600
     * @tc.name CalendarEventRaceIsolation_0016
     * @tc.desc Two independent instances run delete; left completes first;
     * left clear none; equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0016', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<void> = new Pending<void>();
      const rightGate: Pending<void> = new Pending<void>();
      leftCalendar.deleteQueue.push(leftGate);
      rightCalendar.deleteQueue.push(rightGate);
      const left: Promise<void> = leftSession.deleteEvent();
      const right: Promise<void> = rightSession.deleteEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      leftGate.resolve(undefined);
      expect((await leftResult) === undefined).assertEqual(true);
      expect((await left) === undefined).assertEqual(true);
      await assertSelected(leftSession, leftCalendar, undefined);
      await assertSelected(rightSession, rightCalendar, 901);
      rightGate.resolve(undefined);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      await assertSelected(leftSession, leftCalendar, undefined);
      await assertSelected(rightSession, rightCalendar, undefined);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(1);
      expect(rightCalendar.deletions.length).assertEqual(1);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_1700
     * @tc.name CalendarEventRaceIsolation_0017
     * @tc.desc Two independent instances run delete; left completes first;
     * left clear before; left fails with original error;equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0017', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<void> = new Pending<void>();
      const rightGate: Pending<void> = new Pending<void>();
      leftCalendar.deleteQueue.push(leftGate);
      rightCalendar.deleteQueue.push(rightGate);
      const left: Promise<void> = leftSession.deleteEvent();
      const right: Promise<void> = rightSession.deleteEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      const error: Error = new Error('left instance operation failed');
      leftGate.reject(error);
      assertFailure(await leftResult, error);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, 901);
      rightGate.resolve(undefined);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, undefined);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(1);
      expect(rightCalendar.deletions.length).assertEqual(1);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ISOLATION_1800
     * @tc.name CalendarEventRaceIsolation_0018
     * @tc.desc Two independent instances run delete; left completes first;
     * left clear after; equal seed IDs never share state.
     * @tc.type FUNC
     */
    it('CalendarEventRaceIsolation_0018', 0, async (): Promise<void> => {
      const leftManager: ManagerProbe = new ManagerProbe();
      const rightManager: ManagerProbe = new ManagerProbe();
      const leftCalendar: CalendarProbe = leftManager.calendar;
      const rightCalendar: CalendarProbe = rightManager.calendar;
      const leftSession: CalendarEventSession = new CalendarEventSession(leftManager, 1686931200000);
      const rightSession: CalendarEventSession = new CalendarEventSession(rightManager, 1687017600000);
      expect(leftCalendar === rightCalendar).assertEqual(false);
      await leftSession.createCalendar();
      await rightSession.createCalendar();
      leftCalendar.nextId = 901;
      rightCalendar.nextId = 901;
      expect(await leftSession.addEvent()).assertEqual(901);
      expect(await rightSession.addEvent()).assertEqual(901);
      const leftGate: Pending<void> = new Pending<void>();
      const rightGate: Pending<void> = new Pending<void>();
      leftCalendar.deleteQueue.push(leftGate);
      rightCalendar.deleteQueue.push(rightGate);
      const left: Promise<void> = leftSession.deleteEvent();
      const right: Promise<void> = rightSession.deleteEvent();
      const leftResult: Promise<Error | undefined> = captureFailure((): Promise<void> => left);
      const rightResult: Promise<Error | undefined> = captureFailure((): Promise<void> => right);
      leftGate.resolve(undefined);
      expect((await leftResult) === undefined).assertEqual(true);
      expect((await left) === undefined).assertEqual(true);
      leftSession.clear();
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, 901);
      rightGate.resolve(undefined);
      expect((await rightResult) === undefined).assertEqual(true);
      expect((await right) === undefined).assertEqual(true);
      await assertMissingCalendar(leftSession);
      await assertSelected(rightSession, rightCalendar, undefined);
      expect(leftCalendar.additions[0].startTime).assertEqual(1686931200000);
      expect(rightCalendar.additions[0].startTime).assertEqual(1687017600000);
      expect(leftCalendar.deletions.length).assertEqual(1);
      expect(rightCalendar.deletions.length).assertEqual(1);
      expect(leftManager.accounts.length).assertEqual(1);
      expect(rightManager.accounts.length).assertEqual(1);
      expect(rightCalendar.configs.length).assertEqual(1);
      expect(rightCalendar.configs[0].enableReminder).assertEqual(true);
      expect(rightCalendar.configs[0].color).assertEqual('#aabbcc');
    });
  });
}
