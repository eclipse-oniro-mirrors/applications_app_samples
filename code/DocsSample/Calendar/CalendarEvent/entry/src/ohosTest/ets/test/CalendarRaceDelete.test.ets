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

export default function calendarRaceDeleteTest(): void {
  describe('CalendarRaceDeleteTest', (): void => {
    /**
     * @tc.number SUB_CALENDAR_RACE_DELETE_0100
     * @tc.name CalendarEventRaceDelete_0001
     * @tc.desc Pending delete of positive ID; add replacement;
     * deletion before change; SDK confirms deletion; distinct new ID survives.
     * @tc.type FUNC
     */
    it('CalendarEventRaceDelete_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 701;
      expect(await session.addEvent()).assertEqual(701);
      const deletionGate: Pending<void> = new Pending<void>();
      calendar.deleteQueue.push(deletionGate);
      const error: Error = new Error('pending deletion failed');
      const deletion: Promise<void> = session.deleteEvent();
      const deletionResult: Promise<Error | undefined> = captureFailure((): Promise<void> => deletion);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(701);
      await assertSelected(session, calendar, 701);
      const additionGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(additionGate);
      const addition: Promise<number> = session.addEvent();
      const additionResult: Promise<Error | undefined> = captureFailure((): Promise<number> => addition);
      expect(calendar.additions.length).assertEqual(2);
      deletionGate.resolve(undefined);
      expect((await deletionResult) === undefined).assertEqual(true);
      expect((await deletion) === undefined).assertEqual(true);
      await assertSelected(session, calendar, undefined);
      additionGate.resolve(702);
      expect((await additionResult) === undefined).assertEqual(true);
      expect(await addition).assertEqual(702);
      await assertSelected(session, calendar, 702);
      await assertSelected(session, calendar, 702);
      expect(calendar.additions[1].startTime).assertEqual(1686931200000);
      expect(calendar.additions[1].endTime).assertEqual(1686934800000);
      expect(calendar.addQueue.length).assertEqual(0);
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deleteQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(701);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].enableReminder).assertEqual(true);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_DELETE_0200
     * @tc.name CalendarEventRaceDelete_0002
     * @tc.desc Pending delete of zero ID; add replacement;
     * deletion before change; SDK confirms deletion; distinct new ID survives.
     * @tc.type FUNC
     */
    it('CalendarEventRaceDelete_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const deletionGate: Pending<void> = new Pending<void>();
      calendar.deleteQueue.push(deletionGate);
      const error: Error = new Error('pending deletion failed');
      const deletion: Promise<void> = session.deleteEvent();
      const deletionResult: Promise<Error | undefined> = captureFailure((): Promise<void> => deletion);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(0);
      await assertSelected(session, calendar, 0);
      const additionGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(additionGate);
      const addition: Promise<number> = session.addEvent();
      const additionResult: Promise<Error | undefined> = captureFailure((): Promise<number> => addition);
      expect(calendar.additions.length).assertEqual(2);
      deletionGate.resolve(undefined);
      expect((await deletionResult) === undefined).assertEqual(true);
      expect((await deletion) === undefined).assertEqual(true);
      await assertSelected(session, calendar, undefined);
      additionGate.resolve(702);
      expect((await additionResult) === undefined).assertEqual(true);
      expect(await addition).assertEqual(702);
      await assertSelected(session, calendar, 702);
      await assertSelected(session, calendar, 702);
      expect(calendar.additions[1].startTime).assertEqual(1686931200000);
      expect(calendar.additions[1].endTime).assertEqual(1686934800000);
      expect(calendar.addQueue.length).assertEqual(0);
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deleteQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(0);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].enableReminder).assertEqual(true);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_DELETE_0300
     * @tc.name CalendarEventRaceDelete_0003
     * @tc.desc Pending delete of positive ID; add replacement;
     * change before deletion; SDK confirms deletion; distinct new ID survives.
     * @tc.type FUNC
     */
    it('CalendarEventRaceDelete_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 701;
      expect(await session.addEvent()).assertEqual(701);
      const deletionGate: Pending<void> = new Pending<void>();
      calendar.deleteQueue.push(deletionGate);
      const error: Error = new Error('pending deletion failed');
      const deletion: Promise<void> = session.deleteEvent();
      const deletionResult: Promise<Error | undefined> = captureFailure((): Promise<void> => deletion);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(701);
      await assertSelected(session, calendar, 701);
      const additionGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(additionGate);
      const addition: Promise<number> = session.addEvent();
      const additionResult: Promise<Error | undefined> = captureFailure((): Promise<number> => addition);
      expect(calendar.additions.length).assertEqual(2);
      additionGate.resolve(702);
      expect((await additionResult) === undefined).assertEqual(true);
      expect(await addition).assertEqual(702);
      await assertSelected(session, calendar, 702);
      deletionGate.resolve(undefined);
      expect((await deletionResult) === undefined).assertEqual(true);
      expect((await deletion) === undefined).assertEqual(true);
      await assertSelected(session, calendar, 702);
      expect(calendar.additions[1].startTime).assertEqual(1686931200000);
      expect(calendar.additions[1].endTime).assertEqual(1686934800000);
      expect(calendar.addQueue.length).assertEqual(0);
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deleteQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(701);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].enableReminder).assertEqual(true);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_DELETE_0400
     * @tc.name CalendarEventRaceDelete_0004
     * @tc.desc Pending delete of zero ID; add replacement;
     * change before deletion; SDK confirms deletion; distinct new ID survives.
     * @tc.type FUNC
     */
    it('CalendarEventRaceDelete_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const deletionGate: Pending<void> = new Pending<void>();
      calendar.deleteQueue.push(deletionGate);
      const error: Error = new Error('pending deletion failed');
      const deletion: Promise<void> = session.deleteEvent();
      const deletionResult: Promise<Error | undefined> = captureFailure((): Promise<void> => deletion);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(0);
      await assertSelected(session, calendar, 0);
      const additionGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(additionGate);
      const addition: Promise<number> = session.addEvent();
      const additionResult: Promise<Error | undefined> = captureFailure((): Promise<number> => addition);
      expect(calendar.additions.length).assertEqual(2);
      additionGate.resolve(702);
      expect((await additionResult) === undefined).assertEqual(true);
      expect(await addition).assertEqual(702);
      await assertSelected(session, calendar, 702);
      deletionGate.resolve(undefined);
      expect((await deletionResult) === undefined).assertEqual(true);
      expect((await deletion) === undefined).assertEqual(true);
      await assertSelected(session, calendar, 702);
      expect(calendar.additions[1].startTime).assertEqual(1686931200000);
      expect(calendar.additions[1].endTime).assertEqual(1686934800000);
      expect(calendar.addQueue.length).assertEqual(0);
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deleteQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(0);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].enableReminder).assertEqual(true);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_DELETE_0500
     * @tc.name CalendarEventRaceDelete_0005
     * @tc.desc Pending delete of positive ID; add replacement;
     * deletion before change; failure preserves identity/message; distinct new ID survives.
     * @tc.type FUNC
     */
    it('CalendarEventRaceDelete_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 701;
      expect(await session.addEvent()).assertEqual(701);
      const deletionGate: Pending<void> = new Pending<void>();
      calendar.deleteQueue.push(deletionGate);
      const error: Error = new Error('pending deletion failed');
      const deletion: Promise<void> = session.deleteEvent();
      const deletionResult: Promise<Error | undefined> = captureFailure((): Promise<void> => deletion);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(701);
      await assertSelected(session, calendar, 701);
      const additionGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(additionGate);
      const addition: Promise<number> = session.addEvent();
      const additionResult: Promise<Error | undefined> = captureFailure((): Promise<number> => addition);
      expect(calendar.additions.length).assertEqual(2);
      deletionGate.reject(error);
      assertFailure(await deletionResult, error);
      await assertSelected(session, calendar, 701);
      additionGate.resolve(702);
      expect((await additionResult) === undefined).assertEqual(true);
      expect(await addition).assertEqual(702);
      await assertSelected(session, calendar, 702);
      await assertSelected(session, calendar, 702);
      expect(calendar.additions[1].startTime).assertEqual(1686931200000);
      expect(calendar.additions[1].endTime).assertEqual(1686934800000);
      expect(calendar.addQueue.length).assertEqual(0);
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deleteQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(701);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].enableReminder).assertEqual(true);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_DELETE_0600
     * @tc.name CalendarEventRaceDelete_0006
     * @tc.desc Pending delete of zero ID; add replacement;
     * deletion before change; failure preserves identity/message; distinct new ID survives.
     * @tc.type FUNC
     */
    it('CalendarEventRaceDelete_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const deletionGate: Pending<void> = new Pending<void>();
      calendar.deleteQueue.push(deletionGate);
      const error: Error = new Error('pending deletion failed');
      const deletion: Promise<void> = session.deleteEvent();
      const deletionResult: Promise<Error | undefined> = captureFailure((): Promise<void> => deletion);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(0);
      await assertSelected(session, calendar, 0);
      const additionGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(additionGate);
      const addition: Promise<number> = session.addEvent();
      const additionResult: Promise<Error | undefined> = captureFailure((): Promise<number> => addition);
      expect(calendar.additions.length).assertEqual(2);
      deletionGate.reject(error);
      assertFailure(await deletionResult, error);
      await assertSelected(session, calendar, 0);
      additionGate.resolve(702);
      expect((await additionResult) === undefined).assertEqual(true);
      expect(await addition).assertEqual(702);
      await assertSelected(session, calendar, 702);
      await assertSelected(session, calendar, 702);
      expect(calendar.additions[1].startTime).assertEqual(1686931200000);
      expect(calendar.additions[1].endTime).assertEqual(1686934800000);
      expect(calendar.addQueue.length).assertEqual(0);
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deleteQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(1);
      expect(calendar.deletions[0]).assertEqual(0);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].enableReminder).assertEqual(true);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_DELETE_0700
     * @tc.name CalendarEventRaceDelete_0007
     * @tc.desc Pending delete of positive ID; add replacement;
     * change before deletion; failure preserves identity/message; distinct new ID survives.
     * @tc.type FUNC
     */
    it('CalendarEventRaceDelete_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 701;
      expect(await session.addEvent()).assertEqual(701);
      const deletionGate: Pending<void> = new Pending<void>();
      calendar.deleteQueue.push(deletionGate);