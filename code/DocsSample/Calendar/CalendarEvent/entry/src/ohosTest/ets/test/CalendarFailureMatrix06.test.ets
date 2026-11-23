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

export default function calendarFailureMatrix06Test(): void {
  describe('CalendarFailureMatrix06', (): void => {
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_0100
     * @tc.name CalendarEventFailureMatrix06_0001
     * @tc.desc create throws synchronously; service text; failed reopen retry after clearing safe-integer ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const traceBeforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(traceBeforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const message: string = '16000050: Calendar service unavailable';
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_0200
     * @tc.name CalendarEventFailureMatrix06_0002
     * @tc.desc create rejects asynchronously; permission text; first opening; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_0300
     * @tc.name CalendarEventFailureMatrix06_0003
     * @tc.desc create rejects asynchronously; permission text; reopen after clearing zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0003', 0, async (): Promise<void> => {
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
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_0400
     * @tc.name CalendarEventFailureMatrix06_0004
     * @tc.desc create rejects asynchronously; permission text; reopen after clearing int32 maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0004', 0, async (): Promise<void> => {
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
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_0500
     * @tc.name CalendarEventFailureMatrix06_0005
     * @tc.desc create rejects asynchronously; permission text; failed reopen retry after clearing safe-integer ID;
     * error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0005', 0, async (): Promise<void> => {
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
      manager.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_0600
     * @tc.name CalendarEventFailureMatrix06_0006
     * @tc.desc create rejects asynchronously; parameter text; first opening; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_0700
     * @tc.name CalendarEventFailureMatrix06_0007
     * @tc.desc create rejects asynchronously; parameter text; reopen after clearing zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0007', 0, async (): Promise<void> => {
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
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_0800
     * @tc.name CalendarEventFailureMatrix06_0008
     * @tc.desc create rejects asynchronously; parameter text; reopen after clearing int32 maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0008', 0, async (): Promise<void> => {
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
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_0900
     * @tc.name CalendarEventFailureMatrix06_0009
     * @tc.desc create rejects asynchronously; parameter text; failed reopen retry after clearing safe-integer ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0009', 0, async (): Promise<void> => {
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
      manager.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_1000
     * @tc.name CalendarEventFailureMatrix06_0010
     * @tc.desc create rejects asynchronously; service text; first opening; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_1100
     * @tc.name CalendarEventFailureMatrix06_0011
     * @tc.desc create rejects asynchronously; service text; reopen after clearing zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0011', 0, async (): Promise<void> => {
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
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_1200
     * @tc.name CalendarEventFailureMatrix06_0012
     * @tc.desc create rejects asynchronously; service text; reopen after clearing int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0012', 0, async (): Promise<void> => {
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
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_1300
     * @tc.name CalendarEventFailureMatrix06_0013
     * @tc.desc create rejects asynchronously; service text; failed reopen retry after clearing safe-integer ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const traceBeforeClear: string = manager.calendar.trace.join(",");
      session.clear();
      expect(manager.calendar.trace.join(",")).assertEqual(traceBeforeClear);
      expect(manager.calendar.deletions.length).assertEqual(0);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.error = original;
      manager.failMethod = 'create';
      manager.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<EventCalendarPort> = new Pending<EventCalendarPort>();
      manager.createQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('');
      expect(manager.createQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_1400
     * @tc.name CalendarEventFailureMatrix06_0014
     * @tc.desc config throws synchronously; permission text; first configuration; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_1500
     * @tc.name CalendarEventFailureMatrix06_0015
     * @tc.desc config throws synchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_1600
     * @tc.name CalendarEventFailureMatrix06_0016
     * @tc.desc config throws synchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0016', 0, async (): Promise<void> => {
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
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_1700
     * @tc.name CalendarEventFailureMatrix06_0017
     * @tc.desc config throws synchronously; permission text; repeat failure with safe-integer maximum ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_1800
     * @tc.name CalendarEventFailureMatrix06_0018
     * @tc.desc config throws synchronously; parameter text; first configuration; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_1900
     * @tc.name CalendarEventFailureMatrix06_0019
     * @tc.desc config throws synchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_2000
     * @tc.name CalendarEventFailureMatrix06_0020
     * @tc.desc config throws synchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0020', 0, async (): Promise<void> => {
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
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_2100
     * @tc.name CalendarEventFailureMatrix06_0021
     * @tc.desc config throws synchronously; parameter text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_2200
     * @tc.name CalendarEventFailureMatrix06_0022
     * @tc.desc config throws synchronously; service text; first configuration; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_2300
     * @tc.name CalendarEventFailureMatrix06_0023
     * @tc.desc config throws synchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0023', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_2400
     * @tc.name CalendarEventFailureMatrix06_0024
     * @tc.desc config throws synchronously; service text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0024', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_2500
     * @tc.name CalendarEventFailureMatrix06_0025
     * @tc.desc config throws synchronously; service text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0025', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_2600
     * @tc.name CalendarEventFailureMatrix06_0026
     * @tc.desc config rejects asynchronously; permission text; first configuration; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0026', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_2700
     * @tc.name CalendarEventFailureMatrix06_0027
     * @tc.desc config rejects asynchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0027', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_2800
     * @tc.name CalendarEventFailureMatrix06_0028
     * @tc.desc config rejects asynchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0028', 0, async (): Promise<void> => {
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
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_2900
     * @tc.name CalendarEventFailureMatrix06_0029
     * @tc.desc config rejects asynchronously; permission text; repeat failure with safe-integer maximum ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0029', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_3000
     * @tc.name CalendarEventFailureMatrix06_0030
     * @tc.desc config rejects asynchronously; parameter text; first configuration; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0030', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_3100
     * @tc.name CalendarEventFailureMatrix06_0031
     * @tc.desc config rejects asynchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0031', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_3200
     * @tc.name CalendarEventFailureMatrix06_0032
     * @tc.desc config rejects asynchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0032', 0, async (): Promise<void> => {
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
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_3300
     * @tc.name CalendarEventFailureMatrix06_0033
     * @tc.desc config rejects asynchronously; parameter text; repeat failure with safe-integer maximum ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0033', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_3400
     * @tc.name CalendarEventFailureMatrix06_0034
     * @tc.desc config rejects asynchronously; service text; first configuration; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0034', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 1);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_3500
     * @tc.name CalendarEventFailureMatrix06_0035
     * @tc.desc config rejects asynchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0035', 0, async (): Promise<void> => {
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
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_3600
     * @tc.name CalendarEventFailureMatrix06_0036
     * @tc.desc config rejects asynchronously; service text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0036', 0, async (): Promise<void> => {
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
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX06_3700
     * @tc.name CalendarEventFailureMatrix06_0037
     * @tc.desc config rejects asynchronously; service text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix06_0037', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'config';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.createCalendar());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.configQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.createCalendar());
      await Promise.resolve();
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.calendar.configQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('config');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const readinessFailure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(readinessFailure?.message).assertEqual('Calendar is not ready');
      const beforeRetry: number = manager.calendar.trace.length;
      const accountsBeforeRetry: number = manager.accounts.length;
      await session.createCalendar();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual("config");
      expect(manager.accounts.length).assertEqual(accountsBeforeRetry + 0);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
    });
  });
}
