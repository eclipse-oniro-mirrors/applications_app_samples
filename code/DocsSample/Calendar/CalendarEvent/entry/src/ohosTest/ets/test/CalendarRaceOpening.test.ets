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
     * shared failure identity/message and retry.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0004', 0, async (): Promise<void> => {
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
      creation.reject(error);
      assertFailure(await firstResult, error);
      assertFailure(await secondResult, error);
      assertFailure(await thirdResult, error);
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
     * @tc.number SUB_CALENDAR_RACE_OPENING_0500
     * @tc.name CalendarEventRaceOpening_0005
     * @tc.desc Opening merge at config; 2 callers share identity;
     * configuration gates readiness and preserves success.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const creation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const configuration: Pending<void> = new Pending<void>();
      manager.createQueue.push(creation);
      calendar.configQueue.push(configuration);
      const error: Error = new Error('config shared opening failure');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      creation.resolve(calendar);
      await creation.promise;
      expect(calendar.configs.length).assertEqual(1);
      const second: Promise<void> = session.createCalendar();
      expect(second === first).assertEqual(true);
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      expect(manager.accounts.length).assertEqual(1);
      await assertMissingCalendar(session);
      expect(calendar.updates.length).assertEqual(0);
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
     * @tc.number SUB_CALENDAR_RACE_OPENING_0600
     * @tc.name CalendarEventRaceOpening_0006
     * @tc.desc Opening merge at config; 2 callers share identity;
     * shared failure identity/message and retry.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const creation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const configuration: Pending<void> = new Pending<void>();
      manager.createQueue.push(creation);
      calendar.configQueue.push(configuration);
      const error: Error = new Error('config shared opening failure');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      creation.resolve(calendar);
      await creation.promise;
      expect(calendar.configs.length).assertEqual(1);
      const second: Promise<void> = session.createCalendar();
      expect(second === first).assertEqual(true);
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      expect(manager.accounts.length).assertEqual(1);
      await assertMissingCalendar(session);
      expect(calendar.updates.length).assertEqual(0);
      configuration.reject(error);
      assertFailure(await firstResult, error);
      assertFailure(await secondResult, error);
      await assertMissingCalendar(session);
      configuration.resolve(undefined);
      const retry: Promise<void> = session.createCalendar();
      expect(retry === first).assertEqual(false);
      expect(session.createCalendar() === retry).assertEqual(true);
      await retry;
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
     * @tc.number SUB_CALENDAR_RACE_OPENING_0700
     * @tc.name CalendarEventRaceOpening_0007
     * @tc.desc Opening merge at config; 3 callers share identity;
     * configuration gates readiness and preserves success.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const creation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const configuration: Pending<void> = new Pending<void>();
      manager.createQueue.push(creation);
      calendar.configQueue.push(configuration);
      const error: Error = new Error('config shared opening failure');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      creation.resolve(calendar);
      await creation.promise;
      expect(calendar.configs.length).assertEqual(1);
      const second: Promise<void> = session.createCalendar();
      expect(second === first).assertEqual(true);
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      const third: Promise<void> = session.createCalendar();
      expect(third === first).assertEqual(true);
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(manager.accounts.length).assertEqual(1);
      await assertMissingCalendar(session);
      expect(calendar.updates.length).assertEqual(0);
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
     * @tc.number SUB_CALENDAR_RACE_OPENING_0800
     * @tc.name CalendarEventRaceOpening_0008
     * @tc.desc Opening merge at config; 3 callers share identity;
     * shared failure identity/message and retry.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const creation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const configuration: Pending<void> = new Pending<void>();
      manager.createQueue.push(creation);
      calendar.configQueue.push(configuration);
      const error: Error = new Error('config shared opening failure');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      creation.resolve(calendar);
      await creation.promise;
      expect(calendar.configs.length).assertEqual(1);
      const second: Promise<void> = session.createCalendar();
      expect(second === first).assertEqual(true);
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      const third: Promise<void> = session.createCalendar();
      expect(third === first).assertEqual(true);
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(manager.accounts.length).assertEqual(1);
      await assertMissingCalendar(session);
      expect(calendar.updates.length).assertEqual(0);
      configuration.reject(error);
      assertFailure(await firstResult, error);
      assertFailure(await secondResult, error);
      assertFailure(await thirdResult, error);
      await assertMissingCalendar(session);
      configuration.resolve(undefined);
      const retry: Promise<void> = session.createCalendar();
      expect(retry === first).assertEqual(false);
      expect(session.createCalendar() === retry).assertEqual(true);
      await retry;
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
     * @tc.number SUB_CALENDAR_RACE_OPENING_0900
     * @tc.name CalendarEventRaceOpening_0009
     * @tc.desc Clear during create; old success settles late;
     * fresh configuration remains the shared opening and old completion never restores readiness.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const creation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const configuration: Pending<void> = new Pending<void>();
      manager.createQueue.push(creation);
      oldCalendar.configQueue.push(configuration);
      const error: Error = new Error('cleared opening failure');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      expect(session.createCalendar() === first).assertEqual(true);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      const freshConfiguration: Pending<void> = new Pending<void>();
      const freshCreation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(freshCreation);
      freshCalendar.configQueue.push(freshConfiguration);
      const fresh: Promise<void> = session.createCalendar();
      expect(fresh === first).assertEqual(false);
      freshCreation.resolve(freshCalendar);
      await freshCreation.promise;
      expect(freshCalendar.configs.length).assertEqual(1);
      creation.resolve(oldCalendar);
      expect((await firstResult) === undefined).assertEqual(true);
      expect((await first) === undefined).assertEqual(true);
      expect(session.createCalendar() === fresh).assertEqual(true);
      await assertMissingCalendar(session);
      expect(oldCalendar.configs.length).assertEqual(0);
      freshConfiguration.resolve(undefined);
      expect((await fresh) === undefined).assertEqual(true);
      await assertSelected(session, freshCalendar, undefined);
      freshCalendar.nextId = 602;
      expect(await session.addEvent()).assertEqual(602);
      await assertSelected(session, freshCalendar, 602);
      expect(oldCalendar.additions.length).assertEqual(0);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(2);
      expect(freshCalendar.configs[0].enableReminder).assertEqual(true);
      expect(freshCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_1000
     * @tc.name CalendarEventRaceOpening_0010
     * @tc.desc Clear during create; old failure settles late;
     * fresh configuration remains the shared opening and old completion never restores readiness.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const creation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const configuration: Pending<void> = new Pending<void>();
      manager.createQueue.push(creation);
      oldCalendar.configQueue.push(configuration);
      const error: Error = new Error('cleared opening failure');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      expect(session.createCalendar() === first).assertEqual(true);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      const freshConfiguration: Pending<void> = new Pending<void>();
      const freshCreation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(freshCreation);
      freshCalendar.configQueue.push(freshConfiguration);
      const fresh: Promise<void> = session.createCalendar();
      expect(fresh === first).assertEqual(false);
      freshCreation.resolve(freshCalendar);
      await freshCreation.promise;
      expect(freshCalendar.configs.length).assertEqual(1);
      creation.reject(error);
      assertFailure(await firstResult, error);
      expect(session.createCalendar() === fresh).assertEqual(true);
      await assertMissingCalendar(session);
      expect(oldCalendar.configs.length).assertEqual(0);
      freshConfiguration.resolve(undefined);
      expect((await fresh) === undefined).assertEqual(true);
      await assertSelected(session, freshCalendar, undefined);
      freshCalendar.nextId = 602;
      expect(await session.addEvent()).assertEqual(602);
      await assertSelected(session, freshCalendar, 602);
      expect(oldCalendar.additions.length).assertEqual(0);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(2);
      expect(freshCalendar.configs[0].enableReminder).assertEqual(true);
      expect(freshCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_1100
     * @tc.name CalendarEventRaceOpening_0011
     * @tc.desc Clear during config; old success settles late;
     * fresh configuration remains the shared opening and old completion never restores readiness.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const creation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const configuration: Pending<void> = new Pending<void>();
      manager.createQueue.push(creation);
      oldCalendar.configQueue.push(configuration);
      const error: Error = new Error('cleared opening failure');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      expect(session.createCalendar() === first).assertEqual(true);
      creation.resolve(oldCalendar);
      await creation.promise;
      expect(oldCalendar.configs.length).assertEqual(1);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      const freshConfiguration: Pending<void> = new Pending<void>();
      const freshCreation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(freshCreation);
      freshCalendar.configQueue.push(freshConfiguration);
      const fresh: Promise<void> = session.createCalendar();
      expect(fresh === first).assertEqual(false);
      freshCreation.resolve(freshCalendar);
      await freshCreation.promise;
      expect(freshCalendar.configs.length).assertEqual(1);
      configuration.resolve(undefined);
      expect((await firstResult) === undefined).assertEqual(true);
      expect((await first) === undefined).assertEqual(true);
      expect(session.createCalendar() === fresh).assertEqual(true);
      await assertMissingCalendar(session);
      expect(oldCalendar.configs.length).assertEqual(1);
      freshConfiguration.resolve(undefined);
      expect((await fresh) === undefined).assertEqual(true);
      await assertSelected(session, freshCalendar, undefined);
      freshCalendar.nextId = 602;
      expect(await session.addEvent()).assertEqual(602);
      await assertSelected(session, freshCalendar, 602);
      expect(oldCalendar.additions.length).assertEqual(0);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(2);
      expect(freshCalendar.configs[0].enableReminder).assertEqual(true);
      expect(freshCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_1200
     * @tc.name CalendarEventRaceOpening_0012
     * @tc.desc Clear during config; old failure settles late;
     * fresh configuration remains the shared opening and old completion never restores readiness.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const creation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const configuration: Pending<void> = new Pending<void>();
      manager.createQueue.push(creation);
      oldCalendar.configQueue.push(configuration);
      const error: Error = new Error('cleared opening failure');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      expect(session.createCalendar() === first).assertEqual(true);
      creation.resolve(oldCalendar);
      await creation.promise;
      expect(oldCalendar.configs.length).assertEqual(1);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      const freshConfiguration: Pending<void> = new Pending<void>();
      const freshCreation: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(freshCreation);
      freshCalendar.configQueue.push(freshConfiguration);
      const fresh: Promise<void> = session.createCalendar();
      expect(fresh === first).assertEqual(false);
      freshCreation.resolve(freshCalendar);
      await freshCreation.promise;
      expect(freshCalendar.configs.length).assertEqual(1);
      configuration.reject(error);
      assertFailure(await firstResult, error);
      expect(session.createCalendar() === fresh).assertEqual(true);
      await assertMissingCalendar(session);
      expect(oldCalendar.configs.length).assertEqual(1);
      freshConfiguration.resolve(undefined);
      expect((await fresh) === undefined).assertEqual(true);
      await assertSelected(session, freshCalendar, undefined);
      freshCalendar.nextId = 602;
      expect(await session.addEvent()).assertEqual(602);
      await assertSelected(session, freshCalendar, 602);
      expect(oldCalendar.additions.length).assertEqual(0);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(2);
      expect(freshCalendar.configs[0].enableReminder).assertEqual(true);
      expect(freshCalendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_1300
     * @tc.name CalendarEventRaceOpening_0013
     * @tc.desc Three opening generations separated by two clears; completion 123;
     * only latest generation configures; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      firstGate.resolve(firstCalendar);
      expect((await firstResult) === undefined).assertEqual(true);
      expect((await first) === undefined).assertEqual(true);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_1400
     * @tc.name CalendarEventRaceOpening_0014
     * @tc.desc Three opening generations separated by two clears; completion 123;
     * oldest failure preserves latest opening identity/message; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_1500
     * @tc.name CalendarEventRaceOpening_0015
     * @tc.desc Three opening generations separated by two clears; completion 132;
     * only latest generation configures; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      firstGate.resolve(firstCalendar);
      expect((await firstResult) === undefined).assertEqual(true);
      expect((await first) === undefined).assertEqual(true);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_1600
     * @tc.name CalendarEventRaceOpening_0016
     * @tc.desc Three opening generations separated by two clears; completion 132;
     * oldest failure preserves latest opening identity/message; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_1700
     * @tc.name CalendarEventRaceOpening_0017
     * @tc.desc Three opening generations separated by two clears; completion 213;
     * only latest generation configures; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      firstGate.resolve(firstCalendar);
      expect((await firstResult) === undefined).assertEqual(true);
      expect((await first) === undefined).assertEqual(true);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_1800
     * @tc.name CalendarEventRaceOpening_0018
     * @tc.desc Three opening generations separated by two clears; completion 213;
     * oldest failure preserves latest opening identity/message; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_1900
     * @tc.name CalendarEventRaceOpening_0019
     * @tc.desc Three opening generations separated by two clears; completion 231;
     * only latest generation configures; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      firstGate.resolve(firstCalendar);
      expect((await firstResult) === undefined).assertEqual(true);
      expect((await first) === undefined).assertEqual(true);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_2000
     * @tc.name CalendarEventRaceOpening_0020
     * @tc.desc Three opening generations separated by two clears; completion 231;
     * oldest failure preserves latest opening identity/message; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_2100
     * @tc.name CalendarEventRaceOpening_0021
     * @tc.desc Three opening generations separated by two clears; completion 312;
     * only latest generation configures; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      firstGate.resolve(firstCalendar);
      expect((await firstResult) === undefined).assertEqual(true);
      expect((await first) === undefined).assertEqual(true);
      await assertSelected(session, thirdCalendar, 603);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_2200
     * @tc.name CalendarEventRaceOpening_0022
     * @tc.desc Three opening generations separated by two clears; completion 312;
     * oldest failure preserves latest opening identity/message; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, thirdCalendar, 603);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_2300
     * @tc.name CalendarEventRaceOpening_0023
     * @tc.desc Three opening generations separated by two clears; completion 321;
     * only latest generation configures; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      await assertSelected(session, thirdCalendar, 603);
      firstGate.resolve(firstCalendar);
      expect((await firstResult) === undefined).assertEqual(true);
      expect((await first) === undefined).assertEqual(true);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_OPENING_2400
     * @tc.name CalendarEventRaceOpening_0024
     * @tc.desc Three opening generations separated by two clears; completion 321;
     * oldest failure preserves latest opening identity/message; selection survives late work.
     * @tc.type FUNC
     */
    it('CalendarEventRaceOpening_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      const firstCalendar: CalendarProbe = new CalendarProbe();
      const secondCalendar: CalendarProbe = new CalendarProbe();
      const thirdCalendar: CalendarProbe = new CalendarProbe();
      const firstGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const secondGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      const thirdGate: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(firstGate, secondGate, thirdGate);
      const error: Error = new Error('old generation create failed');
      const first: Promise<void> = session.createCalendar();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<void> => first);
      session.clear();
      const second: Promise<void> = session.createCalendar();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<void> => second);
      session.clear();
      const third: Promise<void> = session.createCalendar();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<void> => third);
      expect(first === second).assertEqual(false);
      expect(second === third).assertEqual(false);
      expect(session.createCalendar() === third).assertEqual(true);
      await assertMissingCalendar(session);
      expect(manager.accounts.length).assertEqual(3);
      thirdGate.resolve(thirdCalendar);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect((await third) === undefined).assertEqual(true);
      thirdCalendar.nextId = 603;
      expect(await session.addEvent()).assertEqual(603);
      await assertSelected(session, thirdCalendar, 603);
      secondGate.resolve(secondCalendar);
      expect((await secondResult) === undefined).assertEqual(true);
      expect((await second) === undefined).assertEqual(true);
      await assertSelected(session, thirdCalendar, 603);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, thirdCalendar, 603);
      expect(firstCalendar.configs.length).assertEqual(0);
      expect(secondCalendar.configs.length).assertEqual(0);
      expect(thirdCalendar.configs.length).assertEqual(1);
      expect(thirdCalendar.configs[0].enableReminder).assertEqual(true);
      expect(thirdCalendar.configs[0].color).assertEqual('#aabbcc');
      expect(firstCalendar.additions.length).assertEqual(0);
      expect(secondCalendar.additions.length).assertEqual(0);
      expect(thirdCalendar.additions.length).assertEqual(1);
      expect(manager.createQueue.length).assertEqual(0);
    });
  });
}
