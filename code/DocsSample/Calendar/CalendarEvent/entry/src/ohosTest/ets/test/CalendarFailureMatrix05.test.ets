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

export default function calendarFailureMatrix05Test(): void {
  describe('CalendarFailureMatrix05', (): void => {
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_0100
     * @tc.name CalendarEventFailureMatrix05_0001
     * @tc.desc delete rejects asynchronously; parameter text; repeat failure with safe-integer maximum ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'delete';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.deleteQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.deleteEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('delete');
      expect(manager.calendar.deleteQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('delete');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(9007199254740991);
      const retryafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(retryafterupdateGuard?.message).assertEqual('Event has not been created');
      const retryafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(retryafterqueryGuard?.message).assertEqual('Event has not been created');
      const retryafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(retryafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('delete');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_0200
     * @tc.name CalendarEventFailureMatrix05_0002
     * @tc.desc delete rejects asynchronously; service text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.deleteQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.deleteEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('delete');
      expect(manager.calendar.deleteQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('delete');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(1);
      const retryafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(retryafterupdateGuard?.message).assertEqual('Event has not been created');
      const retryafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(retryafterqueryGuard?.message).assertEqual('Event has not been created');
      const retryafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(retryafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('delete');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_0300
     * @tc.name CalendarEventFailureMatrix05_0003
     * @tc.desc delete rejects asynchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.deleteQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.deleteEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('delete');
      expect(manager.calendar.deleteQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('delete');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(0);
      const retryafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(retryafterupdateGuard?.message).assertEqual('Event has not been created');
      const retryafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(retryafterqueryGuard?.message).assertEqual('Event has not been created');
      const retryafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(retryafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('delete');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_0400
     * @tc.name CalendarEventFailureMatrix05_0004
     * @tc.desc delete rejects asynchronously; service text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const oldCalendar: CalendarProbe = manager.calendar;
      const oldTrace: string = oldCalendar.trace.join(",");
      session.clear();
      expect(oldCalendar.trace.join(",")).assertEqual(oldTrace);
      expect(oldCalendar.deletions.length).assertEqual(0);
      manager.calendar = new CalendarProbe();
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.deleteQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.deleteEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('delete');
      expect(manager.calendar.deleteQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('delete');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(2147483647);
      const retryafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(retryafterupdateGuard?.message).assertEqual('Event has not been created');
      const retryafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(retryafterqueryGuard?.message).assertEqual('Event has not been created');
      const retryafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(retryafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('delete');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_0500
     * @tc.name CalendarEventFailureMatrix05_0005
     * @tc.desc delete rejects asynchronously; service text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'delete';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.deleteQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.deleteEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('delete');
      expect(manager.calendar.deleteQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('delete');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      await session.deleteEvent();
      expect(manager.calendar.deletions[manager.calendar.deletions.length - 1]).assertEqual(9007199254740991);
      const retryafterupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(retryafterupdateGuard?.message).assertEqual('Event has not been created');
      const retryafterqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(retryafterqueryGuard?.message).assertEqual('Event has not been created');
      const retryafterdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(retryafterdeleteGuard?.message).assertEqual('Event has not been created');
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('delete');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_0600
     * @tc.name CalendarEventFailureMatrix05_0006
     * @tc.desc edit throws synchronously; permission text; uninitialized session; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      const editCalendarGuard: Error | undefined = await captureFailure(() => session.addEvent());
      expect(editCalendarGuard?.message).assertEqual('Calendar is not ready');
      expect(manager.accounts.length).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.createCalendar();
      const afterEditupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterEditupdateGuard?.message).assertEqual('Event has not been created');
      const afterEditqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterEditqueryGuard?.message).assertEqual('Event has not been created');
      const afterEditdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterEditdeleteGuard?.message).assertEqual('Event has not been created');
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_0700
     * @tc.name CalendarEventFailureMatrix05_0007
     * @tc.desc edit throws synchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_0800
     * @tc.name CalendarEventFailureMatrix05_0008
     * @tc.desc edit throws synchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const oldCalendar: CalendarProbe = manager.calendar;
      const oldTrace: string = oldCalendar.trace.join(",");
      session.clear();
      expect(oldCalendar.trace.join(",")).assertEqual(oldTrace);
      expect(oldCalendar.deletions.length).assertEqual(0);
      manager.calendar = new CalendarProbe();
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_0900
     * @tc.name CalendarEventFailureMatrix05_0009
     * @tc.desc edit throws synchronously; permission text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.editEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_1000
     * @tc.name CalendarEventFailureMatrix05_0010
     * @tc.desc edit throws synchronously; parameter text; uninitialized session; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      const editCalendarGuard: Error | undefined = await captureFailure(() => session.addEvent());
      expect(editCalendarGuard?.message).assertEqual('Calendar is not ready');
      expect(manager.accounts.length).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.createCalendar();
      const afterEditupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterEditupdateGuard?.message).assertEqual('Event has not been created');
      const afterEditqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterEditqueryGuard?.message).assertEqual('Event has not been created');
      const afterEditdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterEditdeleteGuard?.message).assertEqual('Event has not been created');
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_1100
     * @tc.name CalendarEventFailureMatrix05_0011
     * @tc.desc edit throws synchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_1200
     * @tc.name CalendarEventFailureMatrix05_0012
     * @tc.desc edit throws synchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const oldCalendar: CalendarProbe = manager.calendar;
      const oldTrace: string = oldCalendar.trace.join(",");
      session.clear();
      expect(oldCalendar.trace.join(",")).assertEqual(oldTrace);
      expect(oldCalendar.deletions.length).assertEqual(0);
      manager.calendar = new CalendarProbe();
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_1300
     * @tc.name CalendarEventFailureMatrix05_0013
     * @tc.desc edit throws synchronously; parameter text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.editEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_1400
     * @tc.name CalendarEventFailureMatrix05_0014
     * @tc.desc edit throws synchronously; service text; uninitialized session; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      const editCalendarGuard: Error | undefined = await captureFailure(() => session.addEvent());
      expect(editCalendarGuard?.message).assertEqual('Calendar is not ready');
      expect(manager.accounts.length).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.createCalendar();
      const afterEditupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterEditupdateGuard?.message).assertEqual('Event has not been created');
      const afterEditqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterEditqueryGuard?.message).assertEqual('Event has not been created');
      const afterEditdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterEditdeleteGuard?.message).assertEqual('Event has not been created');
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_1500
     * @tc.name CalendarEventFailureMatrix05_0015
     * @tc.desc edit throws synchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_1600
     * @tc.name CalendarEventFailureMatrix05_0016
     * @tc.desc edit throws synchronously; service text; clear/rebuilt with int32 maximum ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const oldCalendar: CalendarProbe = manager.calendar;
      const oldTrace: string = oldCalendar.trace.join(",");
      session.clear();
      expect(oldCalendar.trace.join(",")).assertEqual(oldTrace);
      expect(oldCalendar.deletions.length).assertEqual(0);
      manager.calendar = new CalendarProbe();
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_1700
     * @tc.name CalendarEventFailureMatrix05_0017
     * @tc.desc edit throws synchronously; service text; repeat failure with safe-integer maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.editEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'edit';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.editEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_1800
     * @tc.name CalendarEventFailureMatrix05_0018
     * @tc.desc edit rejects asynchronously; permission text; uninitialized session; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      const editCalendarGuard: Error | undefined = await captureFailure(() => session.addEvent());
      expect(editCalendarGuard?.message).assertEqual('Calendar is not ready');
      expect(manager.accounts.length).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.createCalendar();
      const afterEditupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterEditupdateGuard?.message).assertEqual('Event has not been created');
      const afterEditqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterEditqueryGuard?.message).assertEqual('Event has not been created');
      const afterEditdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterEditdeleteGuard?.message).assertEqual('Event has not been created');
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_1900
     * @tc.name CalendarEventFailureMatrix05_0019
     * @tc.desc edit rejects asynchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_2000
     * @tc.name CalendarEventFailureMatrix05_0020
     * @tc.desc edit rejects asynchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const oldCalendar: CalendarProbe = manager.calendar;
      const oldTrace: string = oldCalendar.trace.join(",");
      session.clear();
      expect(oldCalendar.trace.join(",")).assertEqual(oldTrace);
      expect(oldCalendar.deletions.length).assertEqual(0);
      manager.calendar = new CalendarProbe();
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_2100
     * @tc.name CalendarEventFailureMatrix05_0021
     * @tc.desc edit rejects asynchronously; permission text; repeat failure with safe-integer maximum ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      manager.failMethod = 'edit';
      manager.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.editEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_2200
     * @tc.name CalendarEventFailureMatrix05_0022
     * @tc.desc edit rejects asynchronously; parameter text; uninitialized session; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      const editCalendarGuard: Error | undefined = await captureFailure(() => session.addEvent());
      expect(editCalendarGuard?.message).assertEqual('Calendar is not ready');
      expect(manager.accounts.length).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.createCalendar();
      const afterEditupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterEditupdateGuard?.message).assertEqual('Event has not been created');
      const afterEditqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterEditqueryGuard?.message).assertEqual('Event has not been created');
      const afterEditdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterEditdeleteGuard?.message).assertEqual('Event has not been created');
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_2300
     * @tc.name CalendarEventFailureMatrix05_0023
     * @tc.desc edit rejects asynchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_2400
     * @tc.name CalendarEventFailureMatrix05_0024
     * @tc.desc edit rejects asynchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const oldCalendar: CalendarProbe = manager.calendar;
      const oldTrace: string = oldCalendar.trace.join(",");
      session.clear();
      expect(oldCalendar.trace.join(",")).assertEqual(oldTrace);
      expect(oldCalendar.deletions.length).assertEqual(0);
      manager.calendar = new CalendarProbe();
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_2500
     * @tc.name CalendarEventFailureMatrix05_0025
     * @tc.desc edit rejects asynchronously; parameter text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0025', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      manager.failMethod = 'edit';
      manager.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.editEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_2600
     * @tc.name CalendarEventFailureMatrix05_0026
     * @tc.desc edit rejects asynchronously; service text; uninitialized session; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0026', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      const editCalendarGuard: Error | undefined = await captureFailure(() => session.addEvent());
      expect(editCalendarGuard?.message).assertEqual('Calendar is not ready');
      expect(manager.accounts.length).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.createCalendar();
      const afterEditupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterEditupdateGuard?.message).assertEqual('Event has not been created');
      const afterEditqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterEditqueryGuard?.message).assertEqual('Event has not been created');
      const afterEditdeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterEditdeleteGuard?.message).assertEqual('Event has not been created');
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_2700
     * @tc.name CalendarEventFailureMatrix05_0027
     * @tc.desc edit rejects asynchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0027', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_2800
     * @tc.name CalendarEventFailureMatrix05_0028
     * @tc.desc edit rejects asynchronously; service text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0028', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const oldCalendar: CalendarProbe = manager.calendar;
      const oldTrace: string = oldCalendar.trace.join(",");
      session.clear();
      expect(oldCalendar.trace.join(",")).assertEqual(oldTrace);
      expect(oldCalendar.deletions.length).assertEqual(0);
      manager.calendar = new CalendarProbe();
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_2900
     * @tc.name CalendarEventFailureMatrix05_0029
     * @tc.desc edit rejects asynchronously; service text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0029', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      manager.failMethod = 'edit';
      manager.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.editEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.editQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.editEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.editQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 1);
      manager.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      expect(await session.editEvent()).assertEqual(manager.editId);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_3000
     * @tc.name CalendarEventFailureMatrix05_0030
     * @tc.desc create throws synchronously; permission text; first opening; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0030', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 1);
      const afterOpenupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterOpenupdateGuard?.message).assertEqual('Event has not been created');
      const afterOpenqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterOpenqueryGuard?.message).assertEqual('Event has not been created');
      const afterOpendeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterOpendeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_3100
     * @tc.name CalendarEventFailureMatrix05_0031
     * @tc.desc create throws synchronously; permission text; reopen after clearing zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0031', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const traceBeforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(traceBeforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 1);
      const afterOpenupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterOpenupdateGuard?.message).assertEqual('Event has not been created');
      const afterOpenqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterOpenqueryGuard?.message).assertEqual('Event has not been created');
      const afterOpendeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterOpendeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_3200
     * @tc.name CalendarEventFailureMatrix05_0032
     * @tc.desc create throws synchronously; permission text; reopen after clearing int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0032', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      const traceBeforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(traceBeforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 1);
      const afterOpenupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterOpenupdateGuard?.message).assertEqual('Event has not been created');
      const afterOpenqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterOpenqueryGuard?.message).assertEqual('Event has not been created');
      const afterOpendeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterOpendeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_3300
     * @tc.name CalendarEventFailureMatrix05_0033
     * @tc.desc create throws synchronously; permission text; failed reopen retry after clearing safe-integer ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0033', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const traceBeforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(traceBeforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 1);
      const afterOpenupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterOpenupdateGuard?.message).assertEqual('Event has not been created');
      const afterOpenqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterOpenqueryGuard?.message).assertEqual('Event has not been created');
      const afterOpendeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterOpendeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_3400
     * @tc.name CalendarEventFailureMatrix05_0034
     * @tc.desc create throws synchronously; parameter text; first opening; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0034', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 1);
      const afterOpenupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterOpenupdateGuard?.message).assertEqual('Event has not been created');
      const afterOpenqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterOpenqueryGuard?.message).assertEqual('Event has not been created');
      const afterOpendeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterOpendeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_3500
     * @tc.name CalendarEventFailureMatrix05_0035
     * @tc.desc create throws synchronously; parameter text; reopen after clearing zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0035', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const traceBeforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(traceBeforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 1);
      const afterOpenupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterOpenupdateGuard?.message).assertEqual('Event has not been created');
      const afterOpenqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterOpenqueryGuard?.message).assertEqual('Event has not been created');
      const afterOpendeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterOpendeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_3600
     * @tc.name CalendarEventFailureMatrix05_0036
     * @tc.desc create throws synchronously; parameter text; reopen after clearing int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0036', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      const traceBeforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(traceBeforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 1);
      const afterOpenupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterOpenupdateGuard?.message).assertEqual('Event has not been created');
      const afterOpenqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterOpenqueryGuard?.message).assertEqual('Event has not been created');
      const afterOpendeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterOpendeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_3700
     * @tc.name CalendarEventFailureMatrix05_0037
     * @tc.desc create throws synchronously; parameter text; failed reopen retry after clearing safe-integer ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0037', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const traceBeforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(traceBeforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 1);
      const afterOpenupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterOpenupdateGuard?.message).assertEqual('Event has not been created');
      const afterOpenqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterOpenqueryGuard?.message).assertEqual('Event has not been created');
      const afterOpendeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterOpendeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_3800
     * @tc.name CalendarEventFailureMatrix05_0038
     * @tc.desc create throws synchronously; service text; first opening; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0038', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 1);
      const afterOpenupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterOpenupdateGuard?.message).assertEqual('Event has not been created');
      const afterOpenqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterOpenqueryGuard?.message).assertEqual('Event has not been created');
      const afterOpendeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterOpendeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_3900
     * @tc.name CalendarEventFailureMatrix05_0039
     * @tc.desc create throws synchronously; service text; reopen after clearing zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0039', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const traceBeforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(traceBeforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 1);
      const afterOpenupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterOpenupdateGuard?.message).assertEqual('Event has not been created');
      const afterOpenqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterOpenqueryGuard?.message).assertEqual('Event has not been created');
      const afterOpendeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterOpendeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX05_4000
     * @tc.name CalendarEventFailureMatrix05_0040
     * @tc.desc create throws synchronously; service text; reopen after clearing int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix05_0040', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 2147483647;
      expect(await session.addEvent()).assertEqual(2147483647);
      const traceBeforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(traceBeforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.failMethod = 'create';
      manager.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 1);
      const afterOpenupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(afterOpenupdateGuard?.message).assertEqual('Event has not been created');
      const afterOpenqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(afterOpenqueryGuard?.message).assertEqual('Event has not been created');
      const afterOpendeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(afterOpendeleteGuard?.message).assertEqual('Event has not been created');
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
    });
  });
}
