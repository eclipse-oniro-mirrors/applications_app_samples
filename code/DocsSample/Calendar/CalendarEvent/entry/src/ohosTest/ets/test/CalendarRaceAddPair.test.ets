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

export default function calendarRaceAddPairTest(): void {
  describe('CalendarRaceAddPairTest', (): void => {
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_0100
     * @tc.name CalendarEventRaceAddPair_0001
     * @tc.desc 2 adds; completion 12; selection absent; IDs distinct;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(202);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(202);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(1);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_0200
     * @tc.name CalendarEventRaceAddPair_0002
     * @tc.desc 2 adds; completion 12; selection absent; IDs distinct;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairDistinctEmptyOld12 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(202);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(202);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(1);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_0300
     * @tc.name CalendarEventRaceAddPair_0003
     * @tc.desc 2 adds; completion 12; selection absent; IDs distinct;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairDistinctEmptyLatest12 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_0400
     * @tc.name CalendarEventRaceAddPair_0004
     * @tc.desc 2 adds; completion 12; selection existing; IDs distinct;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 90);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(202);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(202);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_0500
     * @tc.name CalendarEventRaceAddPair_0005
     * @tc.desc 2 adds; completion 12; selection existing; IDs distinct;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairDistinctSelectedOld12 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 90);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(202);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(202);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_0600
     * @tc.name CalendarEventRaceAddPair_0006
     * @tc.desc 2 adds; completion 12; selection existing; IDs distinct;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairDistinctSelectedLatest12 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 90);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_0700
     * @tc.name CalendarEventRaceAddPair_0007
     * @tc.desc 2 adds; completion 21; selection absent; IDs distinct;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(202);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(202);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(1);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(2);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_0800
     * @tc.name CalendarEventRaceAddPair_0008
     * @tc.desc 2 adds; completion 21; selection absent; IDs distinct;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairDistinctEmptyOld21 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(202);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(202);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(1);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(2);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_0900
     * @tc.name CalendarEventRaceAddPair_0009
     * @tc.desc 2 adds; completion 21; selection absent; IDs distinct;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairDistinctEmptyLatest21 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
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
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_1000
     * @tc.name CalendarEventRaceAddPair_0010
     * @tc.desc 2 adds; completion 21; selection existing; IDs distinct;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 90);
      secondGate.resolve(202);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(202);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_1100
     * @tc.name CalendarEventRaceAddPair_0011
     * @tc.desc 2 adds; completion 21; selection existing; IDs distinct;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairDistinctSelectedOld21 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 90);
      secondGate.resolve(202);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(202);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 202);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_1200
     * @tc.name CalendarEventRaceAddPair_0012
     * @tc.desc 2 adds; completion 21; selection existing; IDs distinct;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairDistinctSelectedLatest21 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 90);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_1300
     * @tc.name CalendarEventRaceAddPair_0013
     * @tc.desc 2 adds; completion 12; selection absent; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
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
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(1);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_1400
     * @tc.name CalendarEventRaceAddPair_0014
     * @tc.desc 2 adds; completion 12; selection absent; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairSameEmptyOld12 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(1);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_1500
     * @tc.name CalendarEventRaceAddPair_0015
     * @tc.desc 2 adds; completion 12; selection absent; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairSameEmptyLatest12 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_1600
     * @tc.name CalendarEventRaceAddPair_0016
     * @tc.desc 2 adds; completion 12; selection existing; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
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
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_1700
     * @tc.name CalendarEventRaceAddPair_0017
     * @tc.desc 2 adds; completion 12; selection existing; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairSameSelectedOld12 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 90);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_1800
     * @tc.name CalendarEventRaceAddPair_0018
     * @tc.desc 2 adds; completion 12; selection existing; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairSameSelectedLatest12 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 90);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_1900
     * @tc.name CalendarEventRaceAddPair_0019
     * @tc.desc 2 adds; completion 21; selection absent; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
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
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_2000
     * @tc.name CalendarEventRaceAddPair_0020
     * @tc.desc 2 adds; completion 21; selection absent; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairSameEmptyOld21 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
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
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_2100
     * @tc.name CalendarEventRaceAddPair_0021
     * @tc.desc 2 adds; completion 21; selection absent; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairSameEmptyLatest21 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
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
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_2200
     * @tc.name CalendarEventRaceAddPair_0022
     * @tc.desc 2 adds; completion 21; selection existing; IDs same;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 90);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_2300
     * @tc.name CalendarEventRaceAddPair_0023
     * @tc.desc 2 adds; completion 21; selection existing; IDs same;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairSameSelectedOld21 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 90);
      secondGate.resolve(404);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(404);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, 404);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_2400
     * @tc.name CalendarEventRaceAddPair_0024
     * @tc.desc 2 adds; completion 21; selection existing; IDs same;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairSameSelectedLatest21 failed add');
      calendar.nextId = 90;
      expect(await session.addEvent()).assertEqual(90);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 90);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(404);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(404);
      await assertSelected(session, calendar, 90);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_2500
     * @tc.name CalendarEventRaceAddPair_0025
     * @tc.desc 2 adds; completion 12; selection absent; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0025', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
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
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_2600
     * @tc.name CalendarEventRaceAddPair_0026
     * @tc.desc 2 adds; completion 12; selection absent; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0026', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairZeroEmptyOld12 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.reject(error);
      assertFailure(await firstResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(1);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_2700
     * @tc.name CalendarEventRaceAddPair_0027
     * @tc.desc 2 adds; completion 12; selection absent; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0027', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairZeroEmptyLatest12 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
      await assertSelected(session, calendar, undefined);
      expect(calendar.updates.length).assertEqual(0);
      expect(calendar.additions[0].startTime).assertEqual(time);
      expect(calendar.additions[0].endTime).assertEqual(time + 3600000);
      expect(calendar.additions[1].startTime).assertEqual(time);
      expect(calendar.additions[1].endTime).assertEqual(time + 3600000);
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_2800
     * @tc.name CalendarEventRaceAddPair_0028
     * @tc.desc 2 adds; completion 12; selection existing; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0028', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_2900
     * @tc.name CalendarEventRaceAddPair_0029
     * @tc.desc 2 adds; completion 12; selection existing; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0029', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairZeroSelectedOld12 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_3000
     * @tc.name CalendarEventRaceAddPair_0030
     * @tc.desc 2 adds; completion 12; selection existing; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0030', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairZeroSelectedLatest12 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_3100
     * @tc.name CalendarEventRaceAddPair_0031
     * @tc.desc 2 adds; completion 21; selection absent; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0031', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
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
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_3200
     * @tc.name CalendarEventRaceAddPair_0032
     * @tc.desc 2 adds; completion 21; selection absent; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0032', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairZeroEmptyOld21 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.resolve(0);
      expect((await secondResult) === undefined).assertEqual(true);
      expect(await second).assertEqual(0);
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
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_3300
     * @tc.name CalendarEventRaceAddPair_0033
     * @tc.desc 2 adds; completion 21; selection absent; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0033', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairZeroEmptyLatest21 failed add');
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(2);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, undefined);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
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
      expect(calendar.configs.length).assertEqual(1);
      expect(calendar.configs[0].color).assertEqual('#aabbcc');
      expect(manager.accounts.length).assertEqual(1);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_3400
     * @tc.name CalendarEventRaceAddPair_0034
     * @tc.desc 2 adds; completion 21; selection existing; IDs zero;
     * failure none; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0034', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_3500
     * @tc.name CalendarEventRaceAddPair_0035
     * @tc.desc 2 adds; completion 21; selection existing; IDs zero;
     * failure old; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0035', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairZeroSelectedOld21 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_3600
     * @tc.name CalendarEventRaceAddPair_0036
     * @tc.desc 2 adds; completion 21; selection existing; IDs zero;
     * failure latest; latest initiated add alone owns selection, including zero.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0036', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const time: number = 1686931200000;
      const session: CalendarEventSession = new CalendarEventSession(manager, time);
      await session.createCalendar();
      const error: Error = new Error('CalendarRaceAddPairZeroSelectedLatest21 failed add');
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const firstGate: Pending<number> = new Pending<number>();
      const secondGate: Pending<number> = new Pending<number>();
      calendar.addQueue.push(firstGate, secondGate);
      const first: Promise<number> = session.addEvent();
      const firstResult: Promise<Error | undefined> = captureFailure((): Promise<number> => first);
      const second: Promise<number> = session.addEvent();
      const secondResult: Promise<Error | undefined> = captureFailure((): Promise<number> => second);
      expect(calendar.additions.length).assertEqual(3);
      expect(calendar.addQueue.length).assertEqual(0);
      await assertSelected(session, calendar, 0);
      secondGate.reject(error);
      assertFailure(await secondResult, error);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(2);
      firstGate.resolve(101);
      expect((await firstResult) === undefined).assertEqual(true);
      expect(await first).assertEqual(101);
      await assertSelected(session, calendar, 0);
      expect(calendar.updates.length).assertEqual(3);
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
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_3700
     * @tc.name CalendarEventRaceAddPair_0037
     * @tc.desc Old pending add crosses clear and rebuild; IDs distinct;
     * new completes first; latest succeeds; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0037', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 909;
      expect(await session.addEvent()).assertEqual(909);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 909);
      freshGate.resolve(202);
      expect((await freshResult) === undefined).assertEqual(true);
      expect(await fresh).assertEqual(202);
      await assertSelected(session, freshCalendar, 202);
      oldGate.resolve(101);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(101);
      await assertSelected(session, freshCalendar, 202);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_3800
     * @tc.name CalendarEventRaceAddPair_0038
     * @tc.desc Old pending add crosses clear and rebuild; IDs distinct;
     * new completes first; latest fails; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0038', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 909;
      expect(await session.addEvent()).assertEqual(909);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 909);
      const error: Error = new Error('new generation latest add failed');
      freshGate.reject(error);
      assertFailure(await freshResult, error);
      await assertSelected(session, freshCalendar, 909);
      oldGate.resolve(101);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(101);
      await assertSelected(session, freshCalendar, 909);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_3900
     * @tc.name CalendarEventRaceAddPair_0039
     * @tc.desc Old pending add crosses clear and rebuild; IDs distinct;
     * old completes first; latest succeeds; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0039', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 909;
      expect(await session.addEvent()).assertEqual(909);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 909);
      oldGate.resolve(101);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(101);
      await assertSelected(session, freshCalendar, 909);
      freshGate.resolve(202);
      expect((await freshResult) === undefined).assertEqual(true);
      expect(await fresh).assertEqual(202);
      await assertSelected(session, freshCalendar, 202);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_4000
     * @tc.name CalendarEventRaceAddPair_0040
     * @tc.desc Old pending add crosses clear and rebuild; IDs distinct;
     * old completes first; latest fails; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0040', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 909;
      expect(await session.addEvent()).assertEqual(909);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 909);
      const error: Error = new Error('new generation latest add failed');
      oldGate.resolve(101);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(101);
      await assertSelected(session, freshCalendar, 909);
      freshGate.reject(error);
      assertFailure(await freshResult, error);
      await assertSelected(session, freshCalendar, 909);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_4100
     * @tc.name CalendarEventRaceAddPair_0041
     * @tc.desc Old pending add crosses clear and rebuild; IDs same;
     * new completes first; latest succeeds; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0041', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 909;
      expect(await session.addEvent()).assertEqual(909);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 909);
      freshGate.resolve(110);
      expect((await freshResult) === undefined).assertEqual(true);
      expect(await fresh).assertEqual(110);
      await assertSelected(session, freshCalendar, 110);
      oldGate.resolve(110);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(110);
      await assertSelected(session, freshCalendar, 110);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_4200
     * @tc.name CalendarEventRaceAddPair_0042
     * @tc.desc Old pending add crosses clear and rebuild; IDs same;
     * new completes first; latest fails; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0042', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 909;
      expect(await session.addEvent()).assertEqual(909);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 909);
      const error: Error = new Error('new generation latest add failed');
      freshGate.reject(error);
      assertFailure(await freshResult, error);
      await assertSelected(session, freshCalendar, 909);
      oldGate.resolve(110);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(110);
      await assertSelected(session, freshCalendar, 909);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_4300
     * @tc.name CalendarEventRaceAddPair_0043
     * @tc.desc Old pending add crosses clear and rebuild; IDs same;
     * old completes first; latest succeeds; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0043', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 909;
      expect(await session.addEvent()).assertEqual(909);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 909);
      oldGate.resolve(110);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(110);
      await assertSelected(session, freshCalendar, 909);
      freshGate.resolve(110);
      expect((await freshResult) === undefined).assertEqual(true);
      expect(await fresh).assertEqual(110);
      await assertSelected(session, freshCalendar, 110);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_4400
     * @tc.name CalendarEventRaceAddPair_0044
     * @tc.desc Old pending add crosses clear and rebuild; IDs same;
     * old completes first; latest fails; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0044', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 909;
      expect(await session.addEvent()).assertEqual(909);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 909);
      const error: Error = new Error('new generation latest add failed');
      oldGate.resolve(110);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(110);
      await assertSelected(session, freshCalendar, 909);
      freshGate.reject(error);
      assertFailure(await freshResult, error);
      await assertSelected(session, freshCalendar, 909);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_4500
     * @tc.name CalendarEventRaceAddPair_0045
     * @tc.desc Old pending add crosses clear and rebuild; IDs zero;
     * new completes first; latest succeeds; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0045', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 0);
      freshGate.resolve(0);
      expect((await freshResult) === undefined).assertEqual(true);
      expect(await fresh).assertEqual(0);
      await assertSelected(session, freshCalendar, 0);
      oldGate.resolve(101);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(101);
      await assertSelected(session, freshCalendar, 0);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_4600
     * @tc.name CalendarEventRaceAddPair_0046
     * @tc.desc Old pending add crosses clear and rebuild; IDs zero;
     * new completes first; latest fails; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0046', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 0);
      const error: Error = new Error('new generation latest add failed');
      freshGate.reject(error);
      assertFailure(await freshResult, error);
      await assertSelected(session, freshCalendar, 0);
      oldGate.resolve(101);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(101);
      await assertSelected(session, freshCalendar, 0);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_4700
     * @tc.name CalendarEventRaceAddPair_0047
     * @tc.desc Old pending add crosses clear and rebuild; IDs zero;
     * old completes first; latest succeeds; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0047', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 0);
      oldGate.resolve(101);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(101);
      await assertSelected(session, freshCalendar, 0);
      freshGate.resolve(0);
      expect((await freshResult) === undefined).assertEqual(true);
      expect(await fresh).assertEqual(0);
      await assertSelected(session, freshCalendar, 0);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_ADDPAIR_4800
     * @tc.name CalendarEventRaceAddPair_0048
     * @tc.desc Old pending add crosses clear and rebuild; IDs zero;
     * old completes first; latest fails; fresh selection survives old-generation completion.
     * @tc.type FUNC
     */
    it('CalendarEventRaceAddPair_0048', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const oldCalendar: CalendarProbe = manager.calendar;
      const freshCalendar: CalendarProbe = new CalendarProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      oldCalendar.nextId = 808;
      expect(await session.addEvent()).assertEqual(808);
      const oldGate: Pending<number> = new Pending<number>();
      oldCalendar.addQueue.push(oldGate);
      const old: Promise<number> = session.addEvent();
      const oldResult: Promise<Error | undefined> = captureFailure((): Promise<number> => old);
      session.clear();
      await assertMissingCalendar(session);
      manager.calendar = freshCalendar;
      await session.createCalendar();
      freshCalendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const freshGate: Pending<number> = new Pending<number>();
      freshCalendar.addQueue.push(freshGate);
      const fresh: Promise<number> = session.addEvent();
      const freshResult: Promise<Error | undefined> = captureFailure((): Promise<number> => fresh);
      await assertSelected(session, freshCalendar, 0);
      const error: Error = new Error('new generation latest add failed');
      oldGate.resolve(101);
      expect((await oldResult) === undefined).assertEqual(true);
      expect(await old).assertEqual(101);
      await assertSelected(session, freshCalendar, 0);
      freshGate.reject(error);
      assertFailure(await freshResult, error);
      await assertSelected(session, freshCalendar, 0);
      expect(manager.accounts.length).assertEqual(2);
      expect(oldCalendar.configs.length).assertEqual(1);
      expect(freshCalendar.configs.length).assertEqual(1);
      expect(oldCalendar.additions.length).assertEqual(2);
      expect(freshCalendar.additions.length).assertEqual(2);
      expect(oldCalendar.updates.length).assertEqual(0);
      expect(oldCalendar.addQueue.length).assertEqual(0);
      expect(freshCalendar.addQueue.length).assertEqual(0);
      expect(oldCalendar.deletions.length).assertEqual(0);
      expect(freshCalendar.deletions.length).assertEqual(0);
    });
  });
}
