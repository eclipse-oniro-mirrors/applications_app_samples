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
import { ManagerProbe, Pending, captureFailure } from './CalendarLogicFixtures';

export default function calendarStateMatrix02Test(): void {
  describe('CalendarStateMatrix02', (): void => {
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_0100
     * @tc.name CalendarEventStateMatrix02_0001
     * @tc.desc deleteThenReopen with zero ID: update obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(0);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(0);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_0200
     * @tc.name CalendarEventStateMatrix02_0002
     * @tc.desc deleteThenReopen with zero ID: all obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(0);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedresult: calendarManager.Event[] = await session.getEvents();
      expect(deletedresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.deletions.length).assertEqual(1);
      const stillupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(stillupdateGuard?.message).assertEqual('Event has not been created');
      const stillqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(stillqueryGuard?.message).assertEqual('Event has not been created');
      const stilldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(stilldeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(0);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_0300
     * @tc.name CalendarEventStateMatrix02_0003
     * @tc.desc deleteThenReopen with zero ID: id obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(0);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(0);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_0400
     * @tc.name CalendarEventStateMatrix02_0004
     * @tc.desc deleteThenReopen with zero ID: delete obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(0);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(0);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_0500
     * @tc.name CalendarEventStateMatrix02_0005
     * @tc.desc deleteThenReopen with zero ID: edit obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      manager.editId = 1;
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(0);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.deletions.length).assertEqual(1);
      const stillupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(stillupdateGuard?.message).assertEqual('Event has not been created');
      const stillqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(stillqueryGuard?.message).assertEqual('Event has not been created');
      const stilldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(stilldeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(0);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_0600
     * @tc.name CalendarEventStateMatrix02_0006
     * @tc.desc reconfigure with positive ID: add obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
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
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_0700
     * @tc.name CalendarEventStateMatrix02_0007
     * @tc.desc reconfigure with positive ID: update obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
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
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_0800
     * @tc.name CalendarEventStateMatrix02_0008
     * @tc.desc reconfigure with positive ID: all obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
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
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_0900
     * @tc.name CalendarEventStateMatrix02_0009
     * @tc.desc reconfigure with positive ID: id obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
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
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_1000
     * @tc.name CalendarEventStateMatrix02_0010
     * @tc.desc reconfigure with positive ID: delete obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
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
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(1);
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
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_1100
     * @tc.name CalendarEventStateMatrix02_0011
     * @tc.desc reconfigure with positive ID: edit obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      manager.editId = 2147483647;
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
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_1200
     * @tc.name CalendarEventStateMatrix02_0012
     * @tc.desc deleteThenReopen with positive ID: add obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(1);
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
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_1300
     * @tc.name CalendarEventStateMatrix02_0013
     * @tc.desc deleteThenReopen with positive ID: update obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(1);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
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
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_1400
     * @tc.name CalendarEventStateMatrix02_0014
     * @tc.desc deleteThenReopen with positive ID: all obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(1);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedresult: calendarManager.Event[] = await session.getEvents();
      expect(deletedresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.deletions.length).assertEqual(1);
      const stillupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(stillupdateGuard?.message).assertEqual('Event has not been created');
      const stillqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(stillqueryGuard?.message).assertEqual('Event has not been created');
      const stilldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(stilldeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
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
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_1500
     * @tc.name CalendarEventStateMatrix02_0015
     * @tc.desc deleteThenReopen with positive ID: id obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(1);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
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
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_1600
     * @tc.name CalendarEventStateMatrix02_0016
     * @tc.desc deleteThenReopen with positive ID: delete obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(1);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
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
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_1700
     * @tc.name CalendarEventStateMatrix02_0017
     * @tc.desc deleteThenReopen with positive ID: edit obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      manager.editId = 2147483647;
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(1);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.deletions.length).assertEqual(1);
      const stillupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(stillupdateGuard?.message).assertEqual('Event has not been created');
      const stillqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(stillqueryGuard?.message).assertEqual('Event has not been created');
      const stilldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(stilldeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
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
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_1800
     * @tc.name CalendarEventStateMatrix02_0018
     * @tc.desc reconfigure with int32Max ID: add obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
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
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_1900
     * @tc.name CalendarEventStateMatrix02_0019
     * @tc.desc reconfigure with int32Max ID: update obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
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
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_2000
     * @tc.name CalendarEventStateMatrix02_0020
     * @tc.desc reconfigure with int32Max ID: all obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
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
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_2100
     * @tc.name CalendarEventStateMatrix02_0021
     * @tc.desc reconfigure with int32Max ID: id obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
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
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(2147483647);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_2200
     * @tc.name CalendarEventStateMatrix02_0022
     * @tc.desc reconfigure with int32Max ID: delete obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
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
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(2147483647);
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
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_2300
     * @tc.name CalendarEventStateMatrix02_0023
     * @tc.desc reconfigure with int32Max ID: edit obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      manager.editId = 9007199254740991;
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
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_2400
     * @tc.name CalendarEventStateMatrix02_0024
     * @tc.desc deleteThenReopen with int32Max ID: add obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(2147483647);
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
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_2500
     * @tc.name CalendarEventStateMatrix02_0025
     * @tc.desc deleteThenReopen with int32Max ID: update obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0025', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(2147483647);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(2147483647);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_2600
     * @tc.name CalendarEventStateMatrix02_0026
     * @tc.desc deleteThenReopen with int32Max ID: all obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0026', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(2147483647);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedresult: calendarManager.Event[] = await session.getEvents();
      expect(deletedresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.deletions.length).assertEqual(1);
      const stillupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(stillupdateGuard?.message).assertEqual('Event has not been created');
      const stillqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(stillqueryGuard?.message).assertEqual('Event has not been created');
      const stilldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(stilldeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(2147483647);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_2700
     * @tc.name CalendarEventStateMatrix02_0027
     * @tc.desc deleteThenReopen with int32Max ID: id obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0027', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(2147483647);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(2147483647);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_2800
     * @tc.name CalendarEventStateMatrix02_0028
     * @tc.desc deleteThenReopen with int32Max ID: delete obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0028', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(2147483647);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(2147483647);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_2900
     * @tc.name CalendarEventStateMatrix02_0029
     * @tc.desc deleteThenReopen with int32Max ID: edit obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0029', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      manager.editId = 9007199254740991;
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(2147483647);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.deletions.length).assertEqual(1);
      const stillupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(stillupdateGuard?.message).assertEqual('Event has not been created');
      const stillqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(stillqueryGuard?.message).assertEqual('Event has not been created');
      const stilldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(stilldeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(2147483647);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_3000
     * @tc.name CalendarEventStateMatrix02_0030
     * @tc.desc reconfigure with safeIntegerMax ID: add obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0030', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
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
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_3100
     * @tc.name CalendarEventStateMatrix02_0031
     * @tc.desc reconfigure with safeIntegerMax ID: update obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0031', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
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
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_3200
     * @tc.name CalendarEventStateMatrix02_0032
     * @tc.desc reconfigure with safeIntegerMax ID: all obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0032', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
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
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_3300
     * @tc.name CalendarEventStateMatrix02_0033
     * @tc.desc reconfigure with safeIntegerMax ID: id obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0033', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
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
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(9007199254740991);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_3400
     * @tc.name CalendarEventStateMatrix02_0034
     * @tc.desc reconfigure with safeIntegerMax ID: delete obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0034', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
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
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(9007199254740991);
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
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_3500
     * @tc.name CalendarEventStateMatrix02_0035
     * @tc.desc reconfigure with safeIntegerMax ID: edit obeys readiness and selection lifetime; no implicit deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0035', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      manager.editId = 0;
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
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_3600
     * @tc.name CalendarEventStateMatrix02_0036
     * @tc.desc deleteThenReopen with safeIntegerMax ID: add obeys readiness and selection lifetime; no implicit
     * deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0036', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(9007199254740991);
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
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_3700
     * @tc.name CalendarEventStateMatrix02_0037
     * @tc.desc deleteThenReopen with safeIntegerMax ID: update obeys readiness and selection lifetime; no implicit
     * deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0037', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(9007199254740991);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(9007199254740991);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_3800
     * @tc.name CalendarEventStateMatrix02_0038
     * @tc.desc deleteThenReopen with safeIntegerMax ID: all obeys readiness and selection lifetime; no implicit
     * deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0038', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(9007199254740991);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedresult: calendarManager.Event[] = await session.getEvents();
      expect(deletedresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.deletions.length).assertEqual(1);
      const stillupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(stillupdateGuard?.message).assertEqual('Event has not been created');
      const stillqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(stillqueryGuard?.message).assertEqual('Event has not been created');
      const stilldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(stilldeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(9007199254740991);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_3900
     * @tc.name CalendarEventStateMatrix02_0039
     * @tc.desc deleteThenReopen with safeIntegerMax ID: id obeys readiness and selection lifetime; no implicit
     * deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0039', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(9007199254740991);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(9007199254740991);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_4000
     * @tc.name CalendarEventStateMatrix02_0040
     * @tc.desc deleteThenReopen with safeIntegerMax ID: delete obeys readiness and selection lifetime; no implicit
     * deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0040', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(9007199254740991);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      const deletedGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(deletedGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(",")).assertEqual(traceBefore);
      expect(manager.calendar.deletions.length).assertEqual(1);
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(9007199254740991);
      const finalupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(finalupdateGuard?.message).assertEqual('Event has not been created');
      const finalqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(finalqueryGuard?.message).assertEqual('Event has not been created');
      const finaldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(finaldeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_STATE_STATEMATRIX02_4100
     * @tc.name CalendarEventStateMatrix02_0041
     * @tc.desc deleteThenReopen with safeIntegerMax ID: edit obeys readiness and selection lifetime; no implicit
     * deletion.
     * @tc.type FUNC
     */
    it('CalendarEventStateMatrix02_0041', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      manager.editId = 0;
      await session.deleteEvent();
      expect(manager.calendar.deletions[0]).assertEqual(9007199254740991);
      await session.createCalendar();
      const traceBefore: string = manager.calendar.trace.join(",");
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.deletions.length).assertEqual(1);
      const stillupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(stillupdateGuard?.message).assertEqual('Event has not been created');
      const stillqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(stillqueryGuard?.message).assertEqual('Event has not been created');
      const stilldeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(stilldeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      await session.deleteEvent();
      expect(manager.calendar.deletions[1]).assertEqual(9007199254740991);
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
