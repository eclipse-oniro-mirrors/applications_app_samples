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