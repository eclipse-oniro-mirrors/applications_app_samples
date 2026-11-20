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

export default function calendarRaceOpeningTest(): void {
  describe('CalendarRaceOpeningTest', (): void => {
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_0100
     * @tc.name CalendarEventRaceOpening_0001
     * @tc.desc Opening merge at create; 2 callers share identity;
     * configuration gates readiness and preserves success.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const creation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const configuration: Pending<void> = new Pending<void>();
      manager.createQueue.push(creation);
      calendar.configQueue.push(configuration);
      const error: Error = new Error('create shared opening failure');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      const second: Promise<void> = session.createCalendar();
      expect(second === first).assertEqual(true);
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      expect(manager.accounts.length).assertEqual(1);
      await assertMissingCalendar(session);
      expect(calendar.updates.length).assertEqual(0);
      creation.resolve(calendar);
      await creation.promise;
      expect(calendar.configs.length).assertEqual(1);
      expect(session.createCalendar() === first).assertEqual(true);
      await assertMissingCalendar(session);
      configuration.resolve(undefined);
      expect((await firstResult) === undefined).assertEqual(true);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await first) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      expect(manager.accounts.length).assertEqual(1);
      await assertSelected(session, calendar, undefined);
      calendar.nextId = 601;
      expect(await session.addEvent()).assertEqual(601);
      await assertSelected(session, calendar, 601);
      expect(calendar.configs[0].enableReminder).assertEqual(true);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(calendar.additions.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_0200
     * @tc.name CalendarEventRaceOpening_0002
     * @tc.desc Opening merge at create; 2 callers share identity;
     * shared failure identity/message and retry.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const creation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const configuration: Pending<void> = new Pending<void>();
      manager.createQueue.push(creation);
      calendar.configQueue.push(configuration);
      const error: Error = new Error('create shared opening failure');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      const second: Promise<void> = session.createCalendar();
      expect(second === first).assertEqual(true);
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      expect(manager.accounts.length).assertEqual(1);
      await assertMissingCalendar(session);
      expect(calendar.updates.length).assertEqual(0);
      creation.reject(error);
      assertFailure(await firstResult, error);
      assertFailure(await secondResult, error);
      await assertMissingCalendar(session);
      configuration.resolve(undefined);
      const retry: Promise<void> = session.createCalendar();
      expect(retry === first).assertEqual(false);
      expect(session.createCalendar() === retry).assertEqual(true);
      await retry;
      expect(manager.accounts.length).assertEqual(2);
      await assertSelected(session, calendar, undefined);
      calendar.nextId = 601;
      expect(await session.addEvent()).assertEqual(601);
      await assertSelected(session, calendar, 601);
      expect(calendar.configs[0].enableReminder).assertEqual(true);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(calendar.additions.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_0300
     * @tc.name CalendarEventRaceOpening_0003
     * @tc.desc Opening merge at create; 3 callers share identity;
     * configuration gates readiness and preserves success.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const creation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const configuration: Pending<void> = new Pending<void>();
      manager.createQueue.push(creation);
      calendar.configQueue.push(configuration);
      const error: Error = new Error('create shared opening failure');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      const second: Promise<void> = session.createCalendar();
      expect(second === first).assertEqual(true);
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      const third: Promise<void> = session.createCalendar();
      expect(third === first).assertEqual(true);
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(manager.accounts.length).assertEqual(1);
      await assertMissingCalendar(session);
      expect(calendar.updates.length).assertEqual(0);
      creation.resolve(calendar);
      await creation.promise;
      expect(calendar.configs.length).assertEqual(1);
      expect(session.createCalendar() === first).assertEqual(true);
      await assertMissingCalendar(session);
      configuration.resolve(undefined);
      expect((await firstResult) === undefined).assertEqual(true);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await first) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      expect(manager.accounts.length).assertEqual(1);
      await assertSelected(session, calendar, undefined);
      calendar.nextId = 601;
      expect(await session.addEvent()).assertEqual(601);
      await assertSelected(session, calendar, 601);
      expect(calendar.configs[0].enableReminder).assertEqual(true);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(calendar.additions.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_0400
     * @tc.name CalendarEventRaceOpening_0004
     * @tc.desc Opening merge at create; 3 callers share identity;