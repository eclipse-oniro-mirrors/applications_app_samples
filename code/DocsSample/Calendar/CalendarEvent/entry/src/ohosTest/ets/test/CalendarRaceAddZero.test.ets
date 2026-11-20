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

export default function calendarRaceAddZeroTest(): void {
  describe('CalendarRaceAddZeroTest', (): void => {
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_0100
     * @tc.name CalendarEventRaceAddZero_0001
     * @tc.desc 3 adds; completion 123; selection absent; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_0200
     * @tc.name CalendarEventRaceAddZero_0002
     * @tc.desc 3 adds; completion 123; selection absent; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyOld123 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_0300
     * @tc.name CalendarEventRaceAddZero_0003
     * @tc.desc 3 adds; completion 123; selection absent; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyLatest123 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_0400
     * @tc.name CalendarEventRaceAddZero_0004
     * @tc.desc 3 adds; completion 123; selection existing; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_0500
     * @tc.name CalendarEventRaceAddZero_0005
     * @tc.desc 3 adds; completion 123; selection existing; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedOld123 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_0600
     * @tc.name CalendarEventRaceAddZero_0006
     * @tc.desc 3 adds; completion 123; selection existing; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedLatest123 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_0700
     * @tc.name CalendarEventRaceAddZero_0007
     * @tc.desc 3 adds; completion 132; selection absent; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_0800
     * @tc.name CalendarEventRaceAddZero_0008
     * @tc.desc 3 adds; completion 132; selection absent; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyOld132 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_0900
     * @tc.name CalendarEventRaceAddZero_0009
     * @tc.desc 3 adds; completion 132; selection absent; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyLatest132 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_1000
     * @tc.name CalendarEventRaceAddZero_0010
     * @tc.desc 3 adds; completion 132; selection existing; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_1100
     * @tc.name CalendarEventRaceAddZero_0011
     * @tc.desc 3 adds; completion 132; selection existing; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedOld132 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_1200
     * @tc.name CalendarEventRaceAddZero_0012
     * @tc.desc 3 adds; completion 132; selection existing; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedLatest132 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_1300
     * @tc.name CalendarEventRaceAddZero_0013
     * @tc.desc 3 adds; completion 213; selection absent; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_1400
     * @tc.name CalendarEventRaceAddZero_0014
     * @tc.desc 3 adds; completion 213; selection absent; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyOld213 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_1500
     * @tc.name CalendarEventRaceAddZero_0015
     * @tc.desc 3 adds; completion 213; selection absent; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyLatest213 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_1600
     * @tc.name CalendarEventRaceAddZero_0016
     * @tc.desc 3 adds; completion 213; selection existing; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_1700
     * @tc.name CalendarEventRaceAddZero_0017
     * @tc.desc 3 adds; completion 213; selection existing; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedOld213 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_1800
     * @tc.name CalendarEventRaceAddZero_0018
     * @tc.desc 3 adds; completion 213; selection existing; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedLatest213 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_1900
     * @tc.name CalendarEventRaceAddZero_0019
     * @tc.desc 3 adds; completion 231; selection absent; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_2000
     * @tc.name CalendarEventRaceAddZero_0020
     * @tc.desc 3 adds; completion 231; selection absent; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyOld231 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_2100
     * @tc.name CalendarEventRaceAddZero_0021
     * @tc.desc 3 adds; completion 231; selection absent; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyLatest231 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_2200
     * @tc.name CalendarEventRaceAddZero_0022
     * @tc.desc 3 adds; completion 231; selection existing; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_2300
     * @tc.name CalendarEventRaceAddZero_0023
     * @tc.desc 3 adds; completion 231; selection existing; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedOld231 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_2400
     * @tc.name CalendarEventRaceAddZero_0024
     * @tc.desc 3 adds; completion 231; selection existing; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedLatest231 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_2500
     * @tc.name CalendarEventRaceAddZero_0025
     * @tc.desc 3 adds; completion 312; selection absent; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0025', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_2600
     * @tc.name CalendarEventRaceAddZero_0026
     * @tc.desc 3 adds; completion 312; selection absent; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0026', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyOld312 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_2700
     * @tc.name CalendarEventRaceAddZero_0027
     * @tc.desc 3 adds; completion 312; selection absent; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0027', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyLatest312 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_2800
     * @tc.name CalendarEventRaceAddZero_0028
     * @tc.desc 3 adds; completion 312; selection existing; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0028', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_2900
     * @tc.name CalendarEventRaceAddZero_0029
     * @tc.desc 3 adds; completion 312; selection existing; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0029', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedOld312 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_3000
     * @tc.name CalendarEventRaceAddZero_0030
     * @tc.desc 3 adds; completion 312; selection existing; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0030', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedLatest312 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_3100
     * @tc.name CalendarEventRaceAddZero_0031
     * @tc.desc 3 adds; completion 321; selection absent; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0031', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_3200
     * @tc.name CalendarEventRaceAddZero_0032
     * @tc.desc 3 adds; completion 321; selection absent; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0032', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyOld321 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_3300
     * @tc.name CalendarEventRaceAddZero_0033
     * @tc.desc 3 adds; completion 321; selection absent; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0033', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroEmptyLatest321 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_3400
     * @tc.name CalendarEventRaceAddZero_0034
     * @tc.desc 3 adds; completion 321; selection existing; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0034', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_3500
     * @tc.name CalendarEventRaceAddZero_0035
     * @tc.desc 3 adds; completion 321; selection existing; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0035', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedOld321 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      thirdGate.resolve(0);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDZERO_3600
     * @tc.name CalendarEventRaceAddZero_0036
     * @tc.desc 3 adds; completion 321; selection existing; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddZero_0036', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddZeroSelectedLatest321 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      const thirdGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate, thirdGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      const third: Promise<number> = session.addEvent();
      const thirdResult: Promise<Error | undefined> = captureFailure((): Promise<number> => third);
      expect(calendar.additions.length).assertEqual(4);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(4);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[2].startTime).assertEqual(time);
      expect(calendar.additions[2].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[3].startTime).assertEqual(time);
      expect(calendar.additions[3].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
  });
}
