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
import { calendarManager } from '@kit.CalendarKit';
import { it, expect } from './TestSupport';
import { CalendarEventSession } from '../../../main/ets/CalendarEventSession';
import type { EventCalendarPort } from '../../../main/ets/CalendarEventSession';
import { ManagerProbe, Pending, captureFailure } from './CalendarLogicFixtures';

export default function calendarStateMatrix01Test(): void {
  describe('CalendarStateMatrix01', (): void => {
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_0100
     * @tc.name CalendarEventStateMatrix01_0001
     * @tc.desc initial state: add is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_0200
     * @tc.name CalendarEventStateMatrix01_0002
     * @tc.desc initial state: update is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_0300
     * @tc.name CalendarEventStateMatrix01_0003
     * @tc.desc initial state: all is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[] = await session.getEvents();
      expect(recoveredresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_0400
     * @tc.name CalendarEventStateMatrix01_0004
     * @tc.desc initial state: id is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[][] = await session.getEvent();
      expect(recoveredresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_0500
     * @tc.name CalendarEventStateMatrix01_0005
     * @tc.desc initial state: delete is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(1);
      const recoveredafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(recoveredafterupdateGuard?.message).assertEqual('Event has not been created');
      const recoveredafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(recoveredafterqueryGuard?.message).assertEqual('Event has not been created');
      const recoveredafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(recoveredafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_0600
     * @tc.name CalendarEventStateMatrix01_0006
     * @tc.desc initial state: edit is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore + 1);
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      expect(await session.editEvent()).assertEqual(manager.editId);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_0700
     * @tc.name CalendarEventStateMatrix01_0007
     * @tc.desc creating state: add is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const opening: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(opening);
      const creating: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      opening.resolve(manager.calendar);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_0800
     * @tc.name CalendarEventStateMatrix01_0008
     * @tc.desc creating state: update is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const opening: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(opening);
      const creating: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      opening.resolve(manager.calendar);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_0900
     * @tc.name CalendarEventStateMatrix01_0009
     * @tc.desc creating state: all is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const opening: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(opening);
      const creating: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      opening.resolve(manager.calendar);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[] = await session.getEvents();
      expect(recoveredresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_1000
     * @tc.name CalendarEventStateMatrix01_0010
     * @tc.desc creating state: id is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const opening: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(opening);
      const creating: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      opening.resolve(manager.calendar);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[][] = await session.getEvent();
      expect(recoveredresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_1100
     * @tc.name CalendarEventStateMatrix01_0011
     * @tc.desc creating state: delete is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const opening: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(opening);
      const creating: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      opening.resolve(manager.calendar);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(1);
      const recoveredafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(recoveredafterupdateGuard?.message).assertEqual('Event has not been created');
      const recoveredafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(recoveredafterqueryGuard?.message).assertEqual('Event has not been created');
      const recoveredafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(recoveredafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_1200
     * @tc.name CalendarEventStateMatrix01_0012
     * @tc.desc creating state: edit is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const opening: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(opening);
      const creating: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore + 1);
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      opening.resolve(manager.calendar);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      expect(await session.editEvent()).assertEqual(manager.editId);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_1300
     * @tc.name CalendarEventStateMatrix01_0013
     * @tc.desc configuring state: add is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const configuring: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(configuring);
      const creating: Promise<void> = session.createCalendar();
      await Promise.resolve();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      configuring.resolve(undefined);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_1400
     * @tc.name CalendarEventStateMatrix01_0014
     * @tc.desc configuring state: update is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const configuring: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(configuring);
      const creating: Promise<void> = session.createCalendar();
      await Promise.resolve();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      configuring.resolve(undefined);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_1500
     * @tc.name CalendarEventStateMatrix01_0015
     * @tc.desc configuring state: all is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const configuring: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(configuring);
      const creating: Promise<void> = session.createCalendar();
      await Promise.resolve();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      configuring.resolve(undefined);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[] = await session.getEvents();
      expect(recoveredresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_1600
     * @tc.name CalendarEventStateMatrix01_0016
     * @tc.desc configuring state: id is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const configuring: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(configuring);
      const creating: Promise<void> = session.createCalendar();
      await Promise.resolve();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      configuring.resolve(undefined);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[][] = await session.getEvent();
      expect(recoveredresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_1700
     * @tc.name CalendarEventStateMatrix01_0017
     * @tc.desc configuring state: delete is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const configuring: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(configuring);
      const creating: Promise<void> = session.createCalendar();
      await Promise.resolve();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      configuring.resolve(undefined);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(1);
      const recoveredafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(recoveredafterupdateGuard?.message).assertEqual('Event has not been created');
      const recoveredafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(recoveredafterqueryGuard?.message).assertEqual('Event has not been created');
      const recoveredafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(recoveredafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_1800
     * @tc.name CalendarEventStateMatrix01_0018
     * @tc.desc configuring state: edit is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const configuring: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(configuring);
      const creating: Promise<void> = session.createCalendar();
      await Promise.resolve();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore + 1);
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      configuring.resolve(undefined);
      await creating;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      expect(await session.editEvent()).assertEqual(manager.editId);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_1900
     * @tc.name CalendarEventStateMatrix01_0019
     * @tc.desc ready state: add is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_2000
     * @tc.name CalendarEventStateMatrix01_0020
     * @tc.desc ready state: update is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(failure?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_2100
     * @tc.name CalendarEventStateMatrix01_0021
     * @tc.desc ready state: all is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const currentresult: calendarManager.Event[] = await session.getEvents();
      expect(currentresult === manager.calendar.results).assertTrue();
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_2200
     * @tc.name CalendarEventStateMatrix01_0022
     * @tc.desc ready state: id is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[][] = await session.getEvent();
      expect(recoveredresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_2300
     * @tc.name CalendarEventStateMatrix01_0023
     * @tc.desc ready state: delete is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(failure?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(1);
      const recoveredafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(recoveredafterupdateGuard?.message).assertEqual('Event has not been created');
      const recoveredafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(recoveredafterqueryGuard?.message).assertEqual('Event has not been created');
      const recoveredafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(recoveredafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_2400
     * @tc.name CalendarEventStateMatrix01_0024
     * @tc.desc ready state: edit is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore + 1);
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      expect(await session.editEvent()).assertEqual(manager.editId);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_2500
     * @tc.name CalendarEventStateMatrix01_0025
     * @tc.desc selected state: add is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0025', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_2600
     * @tc.name CalendarEventStateMatrix01_0026
     * @tc.desc selected state: update is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0026', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_2700
     * @tc.name CalendarEventStateMatrix01_0027
     * @tc.desc selected state: all is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0027', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const currentresult: calendarManager.Event[] = await session.getEvents();
      expect(currentresult === manager.calendar.results).assertTrue();
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_2800
     * @tc.name CalendarEventStateMatrix01_0028
     * @tc.desc selected state: id is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0028', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const currentresult: calendarManager.Event[][] = await session.getEvent();
      expect(currentresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_2900
     * @tc.name CalendarEventStateMatrix01_0029
     * @tc.desc selected state: delete is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0029', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(0);
      const currentafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(currentafterupdateGuard?.message).assertEqual('Event has not been created');
      const currentafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(currentafterqueryGuard?.message).assertEqual('Event has not been created');
      const currentafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(currentafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_3000
     * @tc.name CalendarEventStateMatrix01_0030
     * @tc.desc selected state: edit is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0030', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore + 1);
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(await session.editEvent()).assertEqual(manager.editId);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_3100
     * @tc.name CalendarEventStateMatrix01_0031
     * @tc.desc deleted state: add is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0031', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.deleteEvent();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_3200
     * @tc.name CalendarEventStateMatrix01_0032
     * @tc.desc deleted state: update is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0032', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.deleteEvent();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(failure?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_3300
     * @tc.name CalendarEventStateMatrix01_0033
     * @tc.desc deleted state: all is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0033', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.deleteEvent();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const currentresult: calendarManager.Event[] = await session.getEvents();
      expect(currentresult === manager.calendar.results).assertTrue();
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_3400
     * @tc.name CalendarEventStateMatrix01_0034
     * @tc.desc deleted state: id is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0034', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.deleteEvent();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[][] = await session.getEvent();
      expect(recoveredresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_3500
     * @tc.name CalendarEventStateMatrix01_0035
     * @tc.desc deleted state: delete is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0035', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.deleteEvent();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(failure?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(1);
      const recoveredafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(recoveredafterupdateGuard?.message).assertEqual('Event has not been created');
      const recoveredafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(recoveredafterqueryGuard?.message).assertEqual('Event has not been created');
      const recoveredafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(recoveredafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_3600
     * @tc.name CalendarEventStateMatrix01_0036
     * @tc.desc deleted state: edit is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0036', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.deleteEvent();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore + 1);
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      expect(await session.editEvent()).assertEqual(manager.editId);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_3700
     * @tc.name CalendarEventStateMatrix01_0037
     * @tc.desc cleared state: add is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0037', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const beforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(beforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_3800
     * @tc.name CalendarEventStateMatrix01_0038
     * @tc.desc cleared state: update is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0038', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const beforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(beforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_3900
     * @tc.name CalendarEventStateMatrix01_0039
     * @tc.desc cleared state: all is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0039', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const beforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(beforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[] = await session.getEvents();
      expect(recoveredresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_4000
     * @tc.name CalendarEventStateMatrix01_0040
     * @tc.desc cleared state: id is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0040', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const beforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(beforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[][] = await session.getEvent();
      expect(recoveredresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_4100
     * @tc.name CalendarEventStateMatrix01_0041
     * @tc.desc cleared state: delete is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0041', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const beforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(beforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(1);
      const recoveredafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(recoveredafterupdateGuard?.message).assertEqual('Event has not been created');
      const recoveredafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(recoveredafterqueryGuard?.message).assertEqual('Event has not been created');
      const recoveredafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(recoveredafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_4200
     * @tc.name CalendarEventStateMatrix01_0042
     * @tc.desc cleared state: edit is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0042', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const beforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(beforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore + 1);
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      expect(await session.editEvent()).assertEqual(manager.editId);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_4300
     * @tc.name CalendarEventStateMatrix01_0043
     * @tc.desc configFailed state: add is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0043', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      manager.calendar.failMethod = 'config';
      const original: Error = new Error('201: Configuration permission denied');
      manager.calendar.error = original;
      const configurationFailure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(configurationFailure === original).assertTrue();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      manager.calendar.failMethod = '';
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_4400
     * @tc.name CalendarEventStateMatrix01_0044
     * @tc.desc configFailed state: update is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0044', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      manager.calendar.failMethod = 'config';
      const original: Error = new Error('201: Configuration permission denied');
      manager.calendar.error = original;
      const configurationFailure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(configurationFailure === original).assertTrue();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      manager.calendar.failMethod = '';
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_4500
     * @tc.name CalendarEventStateMatrix01_0045
     * @tc.desc configFailed state: all is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0045', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      manager.calendar.failMethod = 'config';
      const original: Error = new Error('201: Configuration permission denied');
      manager.calendar.error = original;
      const configurationFailure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(configurationFailure === original).assertTrue();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      manager.calendar.failMethod = '';
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[] = await session.getEvents();
      expect(recoveredresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_4600
     * @tc.name CalendarEventStateMatrix01_0046
     * @tc.desc configFailed state: id is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0046', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      manager.calendar.failMethod = 'config';
      const original: Error = new Error('201: Configuration permission denied');
      manager.calendar.error = original;
      const configurationFailure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(configurationFailure === original).assertTrue();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      manager.calendar.failMethod = '';
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const recoveredresult: calendarManager.Event[][] = await session.getEvent();
      expect(recoveredresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_4700
     * @tc.name CalendarEventStateMatrix01_0047
     * @tc.desc configFailed state: delete is guarded without SDK calls; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0047', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      manager.calendar.failMethod = 'config';
      const original: Error = new Error('201: Configuration permission denied');
      manager.calendar.error = original;
      const configurationFailure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(configurationFailure === original).assertTrue();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      const failure: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(failure?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(0);
      manager.calendar.failMethod = '';
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(1);
      const recoveredafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(recoveredafterupdateGuard?.message).assertEqual('Event has not been created');
      const recoveredafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(recoveredafterqueryGuard?.message).assertEqual('Event has not been created');
      const recoveredafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(recoveredafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_4800
     * @tc.name CalendarEventStateMatrix01_0048
     * @tc.desc configFailed state: edit is allowed; readiness recovery works.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0048', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      manager.calendar.failMethod = 'config';
      const original: Error = new Error('201: Configuration permission denied');
      manager.calendar.error = original;
      const configurationFailure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(configurationFailure === original).assertTrue();
      const traceBefore: string = manager.calendar.trace.join(",");
      const accountsBefore: number = manager.accounts.length;
      const editsBefore: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.accounts.length).assertEqual(accountsBefore);
      expect(manager.edits.length).assertEqual(editsBefore + 1);
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      manager.calendar.failMethod = '';
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      expect(await session.editEvent()).assertEqual(manager.editId);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_4900
     * @tc.name CalendarEventStateMatrix01_0049
     * @tc.desc reconfigure with zero ID: add obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0049', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const config: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(config);
      const reopening: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const duringConfig: Error | undefined = await captureFailure(() => session.addEvent());
      expect(duringConfig?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.additions.length).assertEqual(1);
      config.resolve(undefined);
      await reopening;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_5000
     * @tc.name CalendarEventStateMatrix01_0050
     * @tc.desc reconfigure with zero ID: update obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0050', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const config: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(config);
      const reopening: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const duringConfig: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(duringConfig?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.additions.length).assertEqual(1);
      config.resolve(undefined);
      await reopening;
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_5100
     * @tc.name CalendarEventStateMatrix01_0051
     * @tc.desc reconfigure with zero ID: all obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0051', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const config: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(config);
      const reopening: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const duringConfig: Error | undefined = await captureFailure(() => session.getEvents());
      expect(duringConfig?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.additions.length).assertEqual(1);
      config.resolve(undefined);
      await reopening;
      const reconfiguredresult: calendarManager.Event[] = await session.getEvents();
      expect(reconfiguredresult === manager.calendar.results).assertTrue();
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_5200
     * @tc.name CalendarEventStateMatrix01_0052
     * @tc.desc reconfigure with zero ID: id obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0052', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const config: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(config);
      const reopening: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const duringConfig: Error | undefined = await captureFailure(() => session.getEvent());
      expect(duringConfig?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.additions.length).assertEqual(1);
      config.resolve(undefined);
      await reopening;
      const reconfiguredresult: calendarManager.Event[][] = await session.getEvent();
      expect(reconfiguredresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_5300
     * @tc.name CalendarEventStateMatrix01_0053
     * @tc.desc reconfigure with zero ID: delete obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0053', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const config: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(config);
      const reopening: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const duringConfig: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(duringConfig?.message).assertEqual('Calendar is not ready');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.additions.length).assertEqual(1);
      config.resolve(undefined);
      await reopening;
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(0);
      const reconfiguredafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(reconfiguredafterupdateGuard?.message).assertEqual('Event has not been created');
      const reconfiguredafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(reconfiguredafterqueryGuard?.message).assertEqual('Event has not been created');
      const reconfiguredafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(reconfiguredafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_5400
     * @tc.name CalendarEventStateMatrix01_0054
     * @tc.desc reconfigure with zero ID: edit obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0054', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      manager.editId = 1;
      const config: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(config);
      const reopening: Promise<void> = session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      config.resolve(undefined);
      await reopening;
      expect(await session.editEvent()).assertEqual(manager.editId);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX01_5500
     * @tc.name CalendarEventStateMatrix01_0055
     * @tc.desc deleteThenReopen with zero ID: add obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix01_0055', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(0);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(1);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
  });
}
