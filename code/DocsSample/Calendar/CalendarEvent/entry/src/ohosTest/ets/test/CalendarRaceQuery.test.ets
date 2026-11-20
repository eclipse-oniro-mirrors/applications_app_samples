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
import { calendarManager } from '@kit.CalendarKit';
import { CalendarEventSession } from '../../../main/ets/CalendarEventSession';
import { CalendarProbe, ManagerProbe, Pending, captureFailure, fixtureEvent } from './CalendarLogicFixtures';

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

export default function calendarRaceQueryTest(): void {
  describe('CalendarRaceQueryTest', (): void => {
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_0100
     * @tc.name CalendarEventRaceQuery_0001
     * @tc.desc Three query branches complete 123; clear after 0 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),
        fixtureEvent(803, 'by-title-second', 1686931200200)];
      const byTime: calendarManager.Event[] = [fixtureEvent(804, 'by-time', 1686931200300),
        fixtureEvent(805, 'by-time-second', 1686931200400), fixtureEvent(806, 'by-time-third', 1686931200500)];
      const firstGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const secondGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const thirdGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      calendar.idQueue.push(firstGate);
      calendar.titleQueue.push(secondGate);
      calendar.timeQueue.push(thirdGate);
      const query: Promise<calendarManager.Event[][]> = session.getEvent();
      const queryResult: Promise<Error | undefined> = captureFailure((): Promise<calendarManager.Event[][]> => query);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.ids[0]).assertEqual(0);
      expect(calendar.titles[0]).assertEqual('update');
      expect(calendar.starts[0]).assertEqual(1686931200000);
      expect(calendar.ends[0]).assertEqual(1687017600000);
      expect(calendar.trace[2]).assertEqual('id');
      expect(calendar.trace[3]).assertEqual('title');
      expect(calendar.trace[4]).assertEqual('time');
      session.clear();
      await assertMissingCalendar(session);
      firstGate.resolve(byId);
      expect((await firstGate.promise) === byId).assertEqual(true);
      secondGate.resolve(byTitle);
      expect((await secondGate.promise) === byTitle).assertEqual(true);
      thirdGate.resolve(byTime);
      expect((await thirdGate.promise) === byTime).assertEqual(true);
      expect((await queryResult) === undefined).assertEqual(true);
      const result: calendarManager.Event[][] = await query;
      expect(result.length).assertEqual(3);
      expect(result[0] === byId).assertEqual(true);
      expect(result[1] === byTitle).assertEqual(true);
      expect(result[2] === byTime).assertEqual(true);
      expect(result[0].length).assertEqual(1);
      expect(result[1].length).assertEqual(2);
      expect(result[2].length).assertEqual(3);
      expect(result[0][0].id).assertEqual(801);
      expect(result[0][0].title).assertEqual('by-id');
      expect(result[1][1].id).assertEqual(803);
      expect(result[2][2].startTime).assertEqual(1686931200500);
      await assertMissingCalendar(session);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.titles.length).assertEqual(1);
      expect(calendar.starts.length).assertEqual(1);
      expect(calendar.ends.length).assertEqual(1);
      expect(calendar.idQueue.length).assertEqual(0);
      expect(calendar.titleQueue.length).assertEqual(0);
      expect(calendar.timeQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_0200
     * @tc.name CalendarEventRaceQuery_0002
     * @tc.desc Three query branches complete 123; clear after 1 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 801;
      expect(await session.addEvent()).assertEqual(801);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),
        fixtureEvent(803, 'by-title-second', 1686931200200)];
      const byTime: calendarManager.Event[] = [fixtureEvent(804, 'by-time', 1686931200300),
        fixtureEvent(805, 'by-time-second', 1686931200400), fixtureEvent(806, 'by-time-third', 1686931200500)];
      const firstGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const secondGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const thirdGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      calendar.idQueue.push(firstGate);
      calendar.titleQueue.push(secondGate);
      calendar.timeQueue.push(thirdGate);
      const query: Promise<calendarManager.Event[][]> = session.getEvent();
      const queryResult: Promise<Error | undefined> = captureFailure((): Promise<calendarManager.Event[][]> => query);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.ids[0]).assertEqual(801);
      expect(calendar.titles[0]).assertEqual('update');
      expect(calendar.starts[0]).assertEqual(1686931200000);
      expect(calendar.ends[0]).assertEqual(1687017600000);
      expect(calendar.trace[2]).assertEqual('id');
      expect(calendar.trace[3]).assertEqual('title');
      expect(calendar.trace[4]).assertEqual('time');
      firstGate.resolve(byId);
      expect((await firstGate.promise) === byId).assertEqual(true);
      session.clear();
      await assertMissingCalendar(session);
      secondGate.resolve(byTitle);
      expect((await secondGate.promise) === byTitle).assertEqual(true);
      thirdGate.resolve(byTime);
      expect((await thirdGate.promise) === byTime).assertEqual(true);
      expect((await queryResult) === undefined).assertEqual(true);
      const result: calendarManager.Event[][] = await query;
      expect(result.length).assertEqual(3);
      expect(result[0] === byId).assertEqual(true);
      expect(result[1] === byTitle).assertEqual(true);
      expect(result[2] === byTime).assertEqual(true);
      expect(result[0].length).assertEqual(1);
      expect(result[1].length).assertEqual(2);
      expect(result[2].length).assertEqual(3);
      expect(result[0][0].id).assertEqual(801);
      expect(result[0][0].title).assertEqual('by-id');
      expect(result[1][1].id).assertEqual(803);
      expect(result[2][2].startTime).assertEqual(1686931200500);
      await assertMissingCalendar(session);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.titles.length).assertEqual(1);
      expect(calendar.starts.length).assertEqual(1);
      expect(calendar.ends.length).assertEqual(1);
      expect(calendar.idQueue.length).assertEqual(0);
      expect(calendar.titleQueue.length).assertEqual(0);
      expect(calendar.timeQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_0300
     * @tc.name CalendarEventRaceQuery_0003
     * @tc.desc Three query branches complete 123; clear after 3 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 801;
      expect(await session.addEvent()).assertEqual(801);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),
        fixtureEvent(803, 'by-title-second', 1686931200200)];
      const byTime: calendarManager.Event[] = [fixtureEvent(804, 'by-time', 1686931200300),
        fixtureEvent(805, 'by-time-second', 1686931200400), fixtureEvent(806, 'by-time-third', 1686931200500)];
      const firstGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const secondGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const thirdGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      calendar.idQueue.push(firstGate);
      calendar.titleQueue.push(secondGate);
      calendar.timeQueue.push(thirdGate);
      const query: Promise<calendarManager.Event[][]> = session.getEvent();
      const queryResult: Promise<Error | undefined> = captureFailure((): Promise<calendarManager.Event[][]> => query);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.ids[0]).assertEqual(801);
      expect(calendar.titles[0]).assertEqual('update');
      expect(calendar.starts[0]).assertEqual(1686931200000);
      expect(calendar.ends[0]).assertEqual(1687017600000);
      expect(calendar.trace[2]).assertEqual('id');
      expect(calendar.trace[3]).assertEqual('title');
      expect(calendar.trace[4]).assertEqual('time');
      firstGate.resolve(byId);
      expect((await firstGate.promise) === byId).assertEqual(true);
      secondGate.resolve(byTitle);
      expect((await secondGate.promise) === byTitle).assertEqual(true);
      thirdGate.resolve(byTime);
      expect((await thirdGate.promise) === byTime).assertEqual(true);
      expect((await queryResult) === undefined).assertEqual(true);
      const result: calendarManager.Event[][] = await query;
      expect(result.length).assertEqual(3);
      expect(result[0] === byId).assertEqual(true);
      expect(result[1] === byTitle).assertEqual(true);
      expect(result[2] === byTime).assertEqual(true);
      expect(result[0].length).assertEqual(1);
      expect(result[1].length).assertEqual(2);
      expect(result[2].length).assertEqual(3);
      expect(result[0][0].id).assertEqual(801);
      expect(result[0][0].title).assertEqual('by-id');
      expect(result[1][1].id).assertEqual(803);
      expect(result[2][2].startTime).assertEqual(1686931200500);
      await assertSelected(session, calendar, 801);
      session.clear();
      await assertMissingCalendar(session);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.titles.length).assertEqual(1);
      expect(calendar.starts.length).assertEqual(1);
      expect(calendar.ends.length).assertEqual(1);
      expect(calendar.idQueue.length).assertEqual(0);
      expect(calendar.titleQueue.length).assertEqual(0);
      expect(calendar.timeQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_0400
     * @tc.name CalendarEventRaceQuery_0004
     * @tc.desc Three query branches complete 132; clear after 0 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),
        fixtureEvent(803, 'by-title-second', 1686931200200)];
      const byTime: calendarManager.Event[] = [fixtureEvent(804, 'by-time', 1686931200300),
        fixtureEvent(805, 'by-time-second', 1686931200400), fixtureEvent(806, 'by-time-third', 1686931200500)];
      const firstGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const secondGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const thirdGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      calendar.idQueue.push(firstGate);
      calendar.titleQueue.push(secondGate);
      calendar.timeQueue.push(thirdGate);
      const query: Promise<calendarManager.Event[][]> = session.getEvent();
      const queryResult: Promise<Error | undefined> = captureFailure((): Promise<calendarManager.Event[][]> => query);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.ids[0]).assertEqual(0);
      expect(calendar.titles[0]).assertEqual('update');
      expect(calendar.starts[0]).assertEqual(1686931200000);
      expect(calendar.ends[0]).assertEqual(1687017600000);
      expect(calendar.trace[2]).assertEqual('id');
      expect(calendar.trace[3]).assertEqual('title');
      expect(calendar.trace[4]).assertEqual('time');
      session.clear();
      await assertMissingCalendar(session);
      firstGate.resolve(byId);
      expect((await firstGate.promise) === byId).assertEqual(true);
      thirdGate.resolve(byTime);
      expect((await thirdGate.promise) === byTime).assertEqual(true);
      secondGate.resolve(byTitle);
      expect((await secondGate.promise) === byTitle).assertEqual(true);
      expect((await queryResult) === undefined).assertEqual(true);
      const result: calendarManager.Event[][] = await query;
      expect(result.length).assertEqual(3);
      expect(result[0] === byId).assertEqual(true);
      expect(result[1] === byTitle).assertEqual(true);
      expect(result[2] === byTime).assertEqual(true);
      expect(result[0].length).assertEqual(1);
      expect(result[1].length).assertEqual(2);
      expect(result[2].length).assertEqual(3);
      expect(result[0][0].id).assertEqual(801);
      expect(result[0][0].title).assertEqual('by-id');
      expect(result[1][1].id).assertEqual(803);
      expect(result[2][2].startTime).assertEqual(1686931200500);
      await assertMissingCalendar(session);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.titles.length).assertEqual(1);
      expect(calendar.starts.length).assertEqual(1);
      expect(calendar.ends.length).assertEqual(1);
      expect(calendar.idQueue.length).assertEqual(0);
      expect(calendar.titleQueue.length).assertEqual(0);
      expect(calendar.timeQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_0500
     * @tc.name CalendarEventRaceQuery_0005
     * @tc.desc Three query branches complete 132; clear after 1 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 801;
      expect(await session.addEvent()).assertEqual(801);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),
        fixtureEvent(803, 'by-title-second', 1686931200200)];
      const byTime: calendarManager.Event[] = [fixtureEvent(804, 'by-time', 1686931200300),
        fixtureEvent(805, 'by-time-second', 1686931200400), fixtureEvent(806, 'by-time-third', 1686931200500)];
      const firstGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const secondGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const thirdGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      calendar.idQueue.push(firstGate);
      calendar.titleQueue.push(secondGate);
      calendar.timeQueue.push(thirdGate);
      const query: Promise<calendarManager.Event[][]> = session.getEvent();
      const queryResult: Promise<Error | undefined> = captureFailure((): Promise<calendarManager.Event[][]> => query);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.ids[0]).assertEqual(801);
      expect(calendar.titles[0]).assertEqual('update');
      expect(calendar.starts[0]).assertEqual(1686931200000);
      expect(calendar.ends[0]).assertEqual(1687017600000);
      expect(calendar.trace[2]).assertEqual('id');
      expect(calendar.trace[3]).assertEqual('title');
      expect(calendar.trace[4]).assertEqual('time');
      firstGate.resolve(byId);
      expect((await firstGate.promise) === byId).assertEqual(true);
      session.clear();
      await assertMissingCalendar(session);
      thirdGate.resolve(byTime);
      expect((await thirdGate.promise) === byTime).assertEqual(true);
      secondGate.resolve(byTitle);
      expect((await secondGate.promise) === byTitle).assertEqual(true);
      expect((await queryResult) === undefined).assertEqual(true);
      const result: calendarManager.Event[][] = await query;
      expect(result.length).assertEqual(3);
      expect(result[0] === byId).assertEqual(true);
      expect(result[1] === byTitle).assertEqual(true);
      expect(result[2] === byTime).assertEqual(true);
      expect(result[0].length).assertEqual(1);
      expect(result[1].length).assertEqual(2);
      expect(result[2].length).assertEqual(3);
      expect(result[0][0].id).assertEqual(801);
      expect(result[0][0].title).assertEqual('by-id');
      expect(result[1][1].id).assertEqual(803);
      expect(result[2][2].startTime).assertEqual(1686931200500);
      await assertMissingCalendar(session);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.titles.length).assertEqual(1);
      expect(calendar.starts.length).assertEqual(1);
      expect(calendar.ends.length).assertEqual(1);
      expect(calendar.idQueue.length).assertEqual(0);
      expect(calendar.titleQueue.length).assertEqual(0);
      expect(calendar.timeQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_0600
     * @tc.name CalendarEventRaceQuery_0006
     * @tc.desc Three query branches complete 132; clear after 3 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 801;
      expect(await session.addEvent()).assertEqual(801);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),
        fixtureEvent(803, 'by-title-second', 1686931200200)];
      const byTime: calendarManager.Event[] = [fixtureEvent(804, 'by-time', 1686931200300),
        fixtureEvent(805, 'by-time-second', 1686931200400), fixtureEvent(806, 'by-time-third', 1686931200500)];
      const firstGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const secondGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const thirdGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      calendar.idQueue.push(firstGate);
      calendar.titleQueue.push(secondGate);
      calendar.timeQueue.push(thirdGate);
      const query: Promise<calendarManager.Event[][]> = session.getEvent();
      const queryResult: Promise<Error | undefined> = captureFailure((): Promise<calendarManager.Event[][]> => query);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.ids[0]).assertEqual(801);
      expect(calendar.titles[0]).assertEqual('update');
      expect(calendar.starts[0]).assertEqual(1686931200000);
      expect(calendar.ends[0]).assertEqual(1687017600000);
      expect(calendar.trace[2]).assertEqual('id');
      expect(calendar.trace[3]).assertEqual('title');
      expect(calendar.trace[4]).assertEqual('time');
      firstGate.resolve(byId);
      expect((await firstGate.promise) === byId).assertEqual(true);
      thirdGate.resolve(byTime);
      expect((await thirdGate.promise) === byTime).assertEqual(true);
      secondGate.resolve(byTitle);
      expect((await secondGate.promise) === byTitle).assertEqual(true);
      expect((await queryResult) === undefined).assertEqual(true);
      const result: calendarManager.Event[][] = await query;
      expect(result.length).assertEqual(3);
      expect(result[0] === byId).assertEqual(true);
      expect(result[1] === byTitle).assertEqual(true);
      expect(result[2] === byTime).assertEqual(true);
      expect(result[0].length).assertEqual(1);
      expect(result[1].length).assertEqual(2);
      expect(result[2].length).assertEqual(3);
      expect(result[0][0].id).assertEqual(801);
      expect(result[0][0].title).assertEqual('by-id');
      expect(result[1][1].id).assertEqual(803);
      expect(result[2][2].startTime).assertEqual(1686931200500);
      await assertSelected(session, calendar, 801);
      session.clear();
      await assertMissingCalendar(session);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.titles.length).assertEqual(1);
      expect(calendar.starts.length).assertEqual(1);
      expect(calendar.ends.length).assertEqual(1);
      expect(calendar.idQueue.length).assertEqual(0);
      expect(calendar.titleQueue.length).assertEqual(0);
      expect(calendar.timeQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_0700
     * @tc.name CalendarEventRaceQuery_0007
     * @tc.desc Three query branches complete 213; clear after 0 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),
        fixtureEvent(803, 'by-title-second', 1686931200200)];
      const byTime: calendarManager.Event[] = [fixtureEvent(804, 'by-time', 1686931200300),
        fixtureEvent(805, 'by-time-second', 1686931200400), fixtureEvent(806, 'by-time-third', 1686931200500)];
      const firstGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const secondGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const thirdGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      calendar.idQueue.push(firstGate);
      calendar.titleQueue.push(secondGate);
      calendar.timeQueue.push(thirdGate);
      const query: Promise<calendarManager.Event[][]> = session.getEvent();
      const queryResult: Promise<Error | undefined> = captureFailure((): Promise<calendarManager.Event[][]> => query);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.ids[0]).assertEqual(0);
      expect(calendar.titles[0]).assertEqual('update');
      expect(calendar.starts[0]).assertEqual(1686931200000);
      expect(calendar.ends[0]).assertEqual(1687017600000);
      expect(calendar.trace[2]).assertEqual('id');
      expect(calendar.trace[3]).assertEqual('title');
      expect(calendar.trace[4]).assertEqual('time');
      session.clear();
      await assertMissingCalendar(session);
      secondGate.resolve(byTitle);
      expect((await secondGate.promise) === byTitle).assertEqual(true);
      firstGate.resolve(byId);
      expect((await firstGate.promise) === byId).assertEqual(true);
      thirdGate.resolve(byTime);
      expect((await thirdGate.promise) === byTime).assertEqual(true);
      expect((await queryResult) === undefined).assertEqual(true);
      const result: calendarManager.Event[][] = await query;
      expect(result.length).assertEqual(3);
      expect(result[0] === byId).assertEqual(true);
      expect(result[1] === byTitle).assertEqual(true);
      expect(result[2] === byTime).assertEqual(true);
      expect(result[0].length).assertEqual(1);
      expect(result[1].length).assertEqual(2);
      expect(result[2].length).assertEqual(3);
      expect(result[0][0].id).assertEqual(801);
      expect(result[0][0].title).assertEqual('by-id');
      expect(result[1][1].id).assertEqual(803);
      expect(result[2][2].startTime).assertEqual(1686931200500);
      await assertMissingCalendar(session);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.titles.length).assertEqual(1);
      expect(calendar.starts.length).assertEqual(1);
      expect(calendar.ends.length).assertEqual(1);
      expect(calendar.idQueue.length).assertEqual(0);
      expect(calendar.titleQueue.length).assertEqual(0);
      expect(calendar.timeQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_0800
     * @tc.name CalendarEventRaceQuery_0008
     * @tc.desc Three query branches complete 213; clear after 1 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 801;
      expect(await session.addEvent()).assertEqual(801);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),
        fixtureEvent(803, 'by-title-second', 1686931200200)];
      const byTime: calendarManager.Event[] = [fixtureEvent(804, 'by-time', 1686931200300),
        fixtureEvent(805, 'by-time-second', 1686931200400), fixtureEvent(806, 'by-time-third', 1686931200500)];
      const firstGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const secondGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const thirdGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      calendar.idQueue.push(firstGate);
      calendar.titleQueue.push(secondGate);
      calendar.timeQueue.push(thirdGate);
      const query: Promise<calendarManager.Event[][]> = session.getEvent();
      const queryResult: Promise<Error | undefined> = captureFailure((): Promise<calendarManager.Event[][]> => query);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.ids[0]).assertEqual(801);
      expect(calendar.titles[0]).assertEqual('update');
      expect(calendar.starts[0]).assertEqual(1686931200000);
      expect(calendar.ends[0]).assertEqual(1687017600000);
      expect(calendar.trace[2]).assertEqual('id');
      expect(calendar.trace[3]).assertEqual('title');
      expect(calendar.trace[4]).assertEqual('time');
      secondGate.resolve(byTitle);
      expect((await secondGate.promise) === byTitle).assertEqual(true);
      session.clear();
      await assertMissingCalendar(session);
      firstGate.resolve(byId);
      expect((await firstGate.promise) === byId).assertEqual(true);
      thirdGate.resolve(byTime);
      expect((await thirdGate.promise) === byTime).assertEqual(true);
      expect((await queryResult) === undefined).assertEqual(true);
      const result: calendarManager.Event[][] = await query;
      expect(result.length).assertEqual(3);
      expect(result[0] === byId).assertEqual(true);
      expect(result[1] === byTitle).assertEqual(true);
      expect(result[2] === byTime).assertEqual(true);
      expect(result[0].length).assertEqual(1);
      expect(result[1].length).assertEqual(2);
      expect(result[2].length).assertEqual(3);
      expect(result[0][0].id).assertEqual(801);
      expect(result[0][0].title).assertEqual('by-id');
      expect(result[1][1].id).assertEqual(803);
      expect(result[2][2].startTime).assertEqual(1686931200500);
      await assertMissingCalendar(session);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.titles.length).assertEqual(1);
      expect(calendar.starts.length).assertEqual(1);
      expect(calendar.ends.length).assertEqual(1);
      expect(calendar.idQueue.length).assertEqual(0);
      expect(calendar.titleQueue.length).assertEqual(0);
      expect(calendar.timeQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_0900
     * @tc.name CalendarEventRaceQuery_0009
     * @tc.desc Three query branches complete 213; clear after 3 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 801;
      expect(await session.addEvent()).assertEqual(801);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),
        fixtureEvent(803, 'by-title-second', 1686931200200)];
      const byTime: calendarManager.Event[] = [fixtureEvent(804, 'by-time', 1686931200300),
        fixtureEvent(805, 'by-time-second', 1686931200400), fixtureEvent(806, 'by-time-third', 1686931200500)];
      const firstGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const secondGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const thirdGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      calendar.idQueue.push(firstGate);
      calendar.titleQueue.push(secondGate);
      calendar.timeQueue.push(thirdGate);
      const query: Promise<calendarManager.Event[][]> = session.getEvent();
      const queryResult: Promise<Error | undefined> = captureFailure((): Promise<calendarManager.Event[][]> => query);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.ids[0]).assertEqual(801);
      expect(calendar.titles[0]).assertEqual('update');
      expect(calendar.starts[0]).assertEqual(1686931200000);
      expect(calendar.ends[0]).assertEqual(1687017600000);
      expect(calendar.trace[2]).assertEqual('id');
      expect(calendar.trace[3]).assertEqual('title');
      expect(calendar.trace[4]).assertEqual('time');
      secondGate.resolve(byTitle);
      expect((await secondGate.promise) === byTitle).assertEqual(true);
      firstGate.resolve(byId);
      expect((await firstGate.promise) === byId).assertEqual(true);
      thirdGate.resolve(byTime);
      expect((await thirdGate.promise) === byTime).assertEqual(true);
      expect((await queryResult) === undefined).assertEqual(true);
      const result: calendarManager.Event[][] = await query;
      expect(result.length).assertEqual(3);
      expect(result[0] === byId).assertEqual(true);
      expect(result[1] === byTitle).assertEqual(true);
      expect(result[2] === byTime).assertEqual(true);
      expect(result[0].length).assertEqual(1);
      expect(result[1].length).assertEqual(2);
      expect(result[2].length).assertEqual(3);
      expect(result[0][0].id).assertEqual(801);
      expect(result[0][0].title).assertEqual('by-id');
      expect(result[1][1].id).assertEqual(803);
      expect(result[2][2].startTime).assertEqual(1686931200500);
      await assertSelected(session, calendar, 801);
      session.clear();
      await assertMissingCalendar(session);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.titles.length).assertEqual(1);
      expect(calendar.starts.length).assertEqual(1);
      expect(calendar.ends.length).assertEqual(1);
      expect(calendar.idQueue.length).assertEqual(0);
      expect(calendar.titleQueue.length).assertEqual(0);
      expect(calendar.timeQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_1000
     * @tc.name CalendarEventRaceQuery_0010
     * @tc.desc Three query branches complete 231; clear after 0 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),
        fixtureEvent(803, 'by-title-second', 1686931200200)];
      const byTime: calendarManager.Event[] = [fixtureEvent(804, 'by-time', 1686931200300),
        fixtureEvent(805, 'by-time-second', 1686931200400), fixtureEvent(806, 'by-time-third', 1686931200500)];
      const firstGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const secondGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const thirdGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      calendar.idQueue.push(firstGate);
      calendar.titleQueue.push(secondGate);
      calendar.timeQueue.push(thirdGate);
      const query: Promise<calendarManager.Event[][]> = session.getEvent();
      const queryResult: Promise<Error | undefined> = captureFailure((): Promise<calendarManager.Event[][]> => query);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.ids[0]).assertEqual(0);
      expect(calendar.titles[0]).assertEqual('update');
      expect(calendar.starts[0]).assertEqual(1686931200000);
      expect(calendar.ends[0]).assertEqual(1687017600000);
      expect(calendar.trace[2]).assertEqual('id');
      expect(calendar.trace[3]).assertEqual('title');
      expect(calendar.trace[4]).assertEqual('time');
      session.clear();
      await assertMissingCalendar(session);
      secondGate.resolve(byTitle);
      expect((await secondGate.promise) === byTitle).assertEqual(true);
      thirdGate.resolve(byTime);
      expect((await thirdGate.promise) === byTime).assertEqual(true);
      firstGate.resolve(byId);
      expect((await firstGate.promise) === byId).assertEqual(true);
      expect((await queryResult) === undefined).assertEqual(true);
      const result: calendarManager.Event[][] = await query;
      expect(result.length).assertEqual(3);
      expect(result[0] === byId).assertEqual(true);
      expect(result[1] === byTitle).assertEqual(true);
      expect(result[2] === byTime).assertEqual(true);
      expect(result[0].length).assertEqual(1);
      expect(result[1].length).assertEqual(2);
      expect(result[2].length).assertEqual(3);
      expect(result[0][0].id).assertEqual(801);
      expect(result[0][0].title).assertEqual('by-id');
      expect(result[1][1].id).assertEqual(803);
      expect(result[2][2].startTime).assertEqual(1686931200500);
      await assertMissingCalendar(session);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.titles.length).assertEqual(1);
      expect(calendar.starts.length).assertEqual(1);
      expect(calendar.ends.length).assertEqual(1);
      expect(calendar.idQueue.length).assertEqual(0);
      expect(calendar.titleQueue.length).assertEqual(0);
      expect(calendar.timeQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_1100
     * @tc.name CalendarEventRaceQuery_0011
     * @tc.desc Three query branches complete 231; clear after 1 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 801;
      expect(await session.addEvent()).assertEqual(801);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),
        fixtureEvent(803, 'by-title-second', 1686931200200)];
      const byTime: calendarManager.Event[] = [fixtureEvent(804, 'by-time', 1686931200300),
        fixtureEvent(805, 'by-time-second', 1686931200400), fixtureEvent(806, 'by-time-third', 1686931200500)];
      const firstGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const secondGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      const thirdGate: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      calendar.idQueue.push(firstGate);
      calendar.titleQueue.push(secondGate);
      calendar.timeQueue.push(thirdGate);
      const query: Promise<calendarManager.Event[][]> = session.getEvent();
      const queryResult: Promise<Error | undefined> = captureFailure((): Promise<calendarManager.Event[][]> => query);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.ids[0]).assertEqual(801);
      expect(calendar.titles[0]).assertEqual('update');
      expect(calendar.starts[0]).assertEqual(1686931200000);
      expect(calendar.ends[0]).assertEqual(1687017600000);
      expect(calendar.trace[2]).assertEqual('id');
      expect(calendar.trace[3]).assertEqual('title');
      expect(calendar.trace[4]).assertEqual('time');
      secondGate.resolve(byTitle);
      expect((await secondGate.promise) === byTitle).assertEqual(true);
      session.clear();
      await assertMissingCalendar(session);
      thirdGate.resolve(byTime);
      expect((await thirdGate.promise) === byTime).assertEqual(true);
      firstGate.resolve(byId);
      expect((await firstGate.promise) === byId).assertEqual(true);
      expect((await queryResult) === undefined).assertEqual(true);
      const result: calendarManager.Event[][] = await query;
      expect(result.length).assertEqual(3);
      expect(result[0] === byId).assertEqual(true);
      expect(result[1] === byTitle).assertEqual(true);
      expect(result[2] === byTime).assertEqual(true);
      expect(result[0].length).assertEqual(1);
      expect(result[1].length).assertEqual(2);
      expect(result[2].length).assertEqual(3);
      expect(result[0][0].id).assertEqual(801);
      expect(result[0][0].title).assertEqual('by-id');
      expect(result[1][1].id).assertEqual(803);
      expect(result[2][2].startTime).assertEqual(1686931200500);
      await assertMissingCalendar(session);
      expect(calendar.ids.length).assertEqual(1);
      expect(calendar.titles.length).assertEqual(1);
      expect(calendar.starts.length).assertEqual(1);
      expect(calendar.ends.length).assertEqual(1);
      expect(calendar.idQueue.length).assertEqual(0);
      expect(calendar.titleQueue.length).assertEqual(0);
      expect(calendar.timeQueue.length).assertEqual(0);
      expect(calendar.deletions.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_RACE_QUERY_1200
     * @tc.name CalendarEventRaceQuery_0012
     * @tc.desc Three query branches complete 231; clear after 3 branch completions;
     * Promise.all returns original arrays in byId/title/time order and never restores cleared selection.
     * @tc.type FUNC
     */
    it('CalendarEventRaceQuery_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const calendar: CalendarProbe = manager.calendar;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1686931200000);
      await session.createCalendar();
      calendar.nextId = 801;
      expect(await session.addEvent()).assertEqual(801);
      const byId: calendarManager.Event[] = [fixtureEvent(801, 'by-id', 1686931200000)];
      const byTitle: calendarManager.Event[] = [fixtureEvent(802, 'by-title', 1686931200100),