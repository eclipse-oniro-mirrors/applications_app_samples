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

export default function calendarRaceAddSameTest(): void {
  describe('CalendarRaceAddSameTest', (): void => {
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_0100
     * @tc.name CalendarEventRaceAddSame_0001
     * @tc.desc 3 adds; completion 123; selection absent; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0001', 0, async (): Promise<void> => {
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
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_0200
     * @tc.name CalendarEventRaceAddSame_0002
     * @tc.desc 3 adds; completion 123; selection absent; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyOld123 failed add');
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
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_0300
     * @tc.name CalendarEventRaceAddSame_0003
     * @tc.desc 3 adds; completion 123; selection absent; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyLatest123 failed add');
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
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_0400
     * @tc.name CalendarEventRaceAddSame_0004
     * @tc.desc 3 adds; completion 123; selection existing; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_0500
     * @tc.name CalendarEventRaceAddSame_0005
     * @tc.desc 3 adds; completion 123; selection existing; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedOld123 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_0600
     * @tc.name CalendarEventRaceAddSame_0006
     * @tc.desc 3 adds; completion 123; selection existing; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedLatest123 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 90);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_0700
     * @tc.name CalendarEventRaceAddSame_0007
     * @tc.desc 3 adds; completion 132; selection absent; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0007', 0, async (): Promise<void> => {
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
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(1);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_0800
     * @tc.name CalendarEventRaceAddSame_0008
     * @tc.desc 3 adds; completion 132; selection absent; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyOld132 failed add');
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
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(1);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_0900
     * @tc.name CalendarEventRaceAddSame_0009
     * @tc.desc 3 adds; completion 132; selection absent; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyLatest132 failed add');
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
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_1000
     * @tc.name CalendarEventRaceAddSame_0010
     * @tc.desc 3 adds; completion 132; selection existing; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_1100
     * @tc.name CalendarEventRaceAddSame_0011
     * @tc.desc 3 adds; completion 132; selection existing; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedOld132 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_1200
     * @tc.name CalendarEventRaceAddSame_0012
     * @tc.desc 3 adds; completion 132; selection existing; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedLatest132 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_1300
     * @tc.name CalendarEventRaceAddSame_0013
     * @tc.desc 3 adds; completion 213; selection absent; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0013', 0, async (): Promise<void> => {
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
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_1400
     * @tc.name CalendarEventRaceAddSame_0014
     * @tc.desc 3 adds; completion 213; selection absent; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyOld213 failed add');
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
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_1500
     * @tc.name CalendarEventRaceAddSame_0015
     * @tc.desc 3 adds; completion 213; selection absent; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyLatest213 failed add');
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
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_1600
     * @tc.name CalendarEventRaceAddSame_0016
     * @tc.desc 3 adds; completion 213; selection existing; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_1700
     * @tc.name CalendarEventRaceAddSame_0017
     * @tc.desc 3 adds; completion 213; selection existing; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedOld213 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_1800
     * @tc.name CalendarEventRaceAddSame_0018
     * @tc.desc 3 adds; completion 213; selection existing; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedLatest213 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 90);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_1900
     * @tc.name CalendarEventRaceAddSame_0019
     * @tc.desc 3 adds; completion 231; selection absent; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0019', 0, async (): Promise<void> => {
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
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(1);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_2000
     * @tc.name CalendarEventRaceAddSame_0020
     * @tc.desc 3 adds; completion 231; selection absent; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyOld231 failed add');
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
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(1);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_2100
     * @tc.name CalendarEventRaceAddSame_0021
     * @tc.desc 3 adds; completion 231; selection absent; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyLatest231 failed add');
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
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_2200
     * @tc.name CalendarEventRaceAddSame_0022
     * @tc.desc 3 adds; completion 231; selection existing; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_2300
     * @tc.name CalendarEventRaceAddSame_0023
     * @tc.desc 3 adds; completion 231; selection existing; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedOld231 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_2400
     * @tc.name CalendarEventRaceAddSame_0024
     * @tc.desc 3 adds; completion 231; selection existing; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedLatest231 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 90);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_2500
     * @tc.name CalendarEventRaceAddSame_0025
     * @tc.desc 3 adds; completion 312; selection absent; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0025', 0, async (): Promise<void> => {
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
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(1);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_2600
     * @tc.name CalendarEventRaceAddSame_0026
     * @tc.desc 3 adds; completion 312; selection absent; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0026', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyOld312 failed add');
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
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(1);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_2700
     * @tc.name CalendarEventRaceAddSame_0027
     * @tc.desc 3 adds; completion 312; selection absent; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0027', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyLatest312 failed add');
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
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_2800
     * @tc.name CalendarEventRaceAddSame_0028
     * @tc.desc 3 adds; completion 312; selection existing; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0028', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_2900
     * @tc.name CalendarEventRaceAddSame_0029
     * @tc.desc 3 adds; completion 312; selection existing; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0029', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedOld312 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_3000
     * @tc.name CalendarEventRaceAddSame_0030
     * @tc.desc 3 adds; completion 312; selection existing; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0030', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedLatest312 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_3100
     * @tc.name CalendarEventRaceAddSame_0031
     * @tc.desc 3 adds; completion 321; selection absent; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0031', 0, async (): Promise<void> => {
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
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(1);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_3200
     * @tc.name CalendarEventRaceAddSame_0032
     * @tc.desc 3 adds; completion 321; selection absent; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0032', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyOld321 failed add');
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
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(1);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_3300
     * @tc.name CalendarEventRaceAddSame_0033
     * @tc.desc 3 adds; completion 321; selection absent; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0033', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameEmptyLatest321 failed add');
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
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_3400
     * @tc.name CalendarEventRaceAddSame_0034
     * @tc.desc 3 adds; completion 321; selection existing; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0034', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_3500
     * @tc.name CalendarEventRaceAddSame_0035
     * @tc.desc 3 adds; completion 321; selection existing; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0035', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedOld321 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      thirdGate.resolve(404);
      expect((await thirdResult) === undefined).assertEqual(true);
      expect(await third).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 404);
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
     * @tc.number SUB_CALENDAR_RACE_ADDSAME_3600
     * @tc.name CalendarEventRaceAddSame_0036
     * @tc.desc 3 adds; completion 321; selection existing; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddSame_0036', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddSameSelectedLatest321 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
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
      await assertSelected(session, calendar, 90);
      thirdGate.reject(error);
      assertFailure(await thirdResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 90);
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
