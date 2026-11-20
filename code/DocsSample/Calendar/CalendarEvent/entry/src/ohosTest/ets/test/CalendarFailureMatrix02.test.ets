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
import { CalendarProbe, ManagerProbe, Pending, captureFailure, fixtureEvent } from './CalendarLogicFixtures';

export default function calendarFailureMatrix02Test(): void {
  describe('CalendarFailureMatrix02', (): void => {
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_0100
     * @tc.name CalendarEventFailureMatrix02_0001
     * @tc.desc update rejects asynchronously; parameter text; repeat failure with safe-integer maximum ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.updateQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.updateEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('update');
      expect(manager.calendar.updateQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('update');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_0200
     * @tc.name CalendarEventFailureMatrix02_0002
     * @tc.desc update rejects asynchronously; service text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0002', 0, async (): Promise<void> => {
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
      manager.calendar.updateQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.updateEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('update');
      expect(manager.calendar.updateQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('update');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_0300
     * @tc.name CalendarEventFailureMatrix02_0003
     * @tc.desc update rejects asynchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0003', 0, async (): Promise<void> => {
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
      manager.calendar.updateQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.updateEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('update');
      expect(manager.calendar.updateQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('update');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_0400
     * @tc.name CalendarEventFailureMatrix02_0004
     * @tc.desc update rejects asynchronously; service text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0004', 0, async (): Promise<void> => {
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
      manager.calendar.updateQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.updateEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('update');
      expect(manager.calendar.updateQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('update');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_0500
     * @tc.name CalendarEventFailureMatrix02_0005
     * @tc.desc update rejects asynchronously; service text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<void> = new Pending<void>();
      manager.calendar.updateQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.updateEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('update');
      expect(manager.calendar.updateQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('update');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_0600
     * @tc.name CalendarEventFailureMatrix02_0006
     * @tc.desc all throws synchronously; permission text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.results = [fixtureEvent(0, 'retry-marker', 1000)];
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const preservedupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(preservedupdateGuard?.message).assertEqual('Event has not been created');
      const preservedqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(preservedqueryGuard?.message).assertEqual('Event has not been created');
      const preserveddeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(preserveddeleteGuard?.message).assertEqual('Event has not been created');
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_0700
     * @tc.name CalendarEventFailureMatrix02_0007
     * @tc.desc all throws synchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      manager.calendar.results = [fixtureEvent(0, 'retry-marker', 1000)];
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_0800
     * @tc.name CalendarEventFailureMatrix02_0008
     * @tc.desc all throws synchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0008', 0, async (): Promise<void> => {
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
      manager.calendar.results = [fixtureEvent(2147483647, 'retry-marker', 1000)];
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_0900
     * @tc.name CalendarEventFailureMatrix02_0009
     * @tc.desc all throws synchronously; permission text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      manager.calendar.results = [fixtureEvent(9007199254740991, 'retry-marker', 1000)];
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.getEvents());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_1000
     * @tc.name CalendarEventFailureMatrix02_0010
     * @tc.desc all throws synchronously; parameter text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.results = [fixtureEvent(0, 'retry-marker', 1000)];
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const preservedupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(preservedupdateGuard?.message).assertEqual('Event has not been created');
      const preservedqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(preservedqueryGuard?.message).assertEqual('Event has not been created');
      const preserveddeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(preserveddeleteGuard?.message).assertEqual('Event has not been created');
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_1100
     * @tc.name CalendarEventFailureMatrix02_0011
     * @tc.desc all throws synchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      manager.calendar.results = [fixtureEvent(0, 'retry-marker', 1000)];
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_1200
     * @tc.name CalendarEventFailureMatrix02_0012
     * @tc.desc all throws synchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0012', 0, async (): Promise<void> => {
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
      manager.calendar.results = [fixtureEvent(2147483647, 'retry-marker', 1000)];
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_1300
     * @tc.name CalendarEventFailureMatrix02_0013
     * @tc.desc all throws synchronously; parameter text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      manager.calendar.results = [fixtureEvent(9007199254740991, 'retry-marker', 1000)];
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.getEvents());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_1400
     * @tc.name CalendarEventFailureMatrix02_0014
     * @tc.desc all throws synchronously; service text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.results = [fixtureEvent(0, 'retry-marker', 1000)];
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const preservedupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(preservedupdateGuard?.message).assertEqual('Event has not been created');
      const preservedqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(preservedqueryGuard?.message).assertEqual('Event has not been created');
      const preserveddeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(preserveddeleteGuard?.message).assertEqual('Event has not been created');
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_1500
     * @tc.name CalendarEventFailureMatrix02_0015
     * @tc.desc all throws synchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      manager.calendar.results = [fixtureEvent(0, 'retry-marker', 1000)];
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_1600
     * @tc.name CalendarEventFailureMatrix02_0016
     * @tc.desc all throws synchronously; service text; clear/rebuilt with int32 maximum ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0016', 0, async (): Promise<void> => {
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
      manager.calendar.results = [fixtureEvent(2147483647, 'retry-marker', 1000)];
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_1700
     * @tc.name CalendarEventFailureMatrix02_0017
     * @tc.desc all throws synchronously; service text; repeat failure with safe-integer maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      manager.calendar.results = [fixtureEvent(9007199254740991, 'retry-marker', 1000)];
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.getEvents());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvents());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_1800
     * @tc.name CalendarEventFailureMatrix02_0018
     * @tc.desc all rejects asynchronously; permission text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.results = [fixtureEvent(0, 'retry-marker', 1000)];
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.allQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvents());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.calendar.allQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const preservedupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(preservedupdateGuard?.message).assertEqual('Event has not been created');
      const preservedqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(preservedqueryGuard?.message).assertEqual('Event has not been created');
      const preserveddeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(preserveddeleteGuard?.message).assertEqual('Event has not been created');
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_1900
     * @tc.name CalendarEventFailureMatrix02_0019
     * @tc.desc all rejects asynchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      manager.calendar.results = [fixtureEvent(0, 'retry-marker', 1000)];
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.allQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvents());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.calendar.allQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_2000
     * @tc.name CalendarEventFailureMatrix02_0020
     * @tc.desc all rejects asynchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0020', 0, async (): Promise<void> => {
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
      manager.calendar.results = [fixtureEvent(2147483647, 'retry-marker', 1000)];
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.allQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvents());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.calendar.allQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_2100
     * @tc.name CalendarEventFailureMatrix02_0021
     * @tc.desc all rejects asynchronously; permission text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      manager.calendar.results = [fixtureEvent(9007199254740991, 'retry-marker', 1000)];
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.getEvents());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.allQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvents());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.calendar.allQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_2200
     * @tc.name CalendarEventFailureMatrix02_0022
     * @tc.desc all rejects asynchronously; parameter text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.results = [fixtureEvent(0, 'retry-marker', 1000)];
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.allQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvents());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.calendar.allQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      const preservedupdateGuard: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(preservedupdateGuard?.message).assertEqual('Event has not been created');
      const preservedqueryGuard: Error | undefined = await captureFailure(() => session.getEvent());
      expect(preservedqueryGuard?.message).assertEqual('Event has not been created');
      const preserveddeleteGuard: Error | undefined = await captureFailure(() => session.deleteEvent());
      expect(preserveddeleteGuard?.message).assertEqual('Event has not been created');
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_2300
     * @tc.name CalendarEventFailureMatrix02_0023
     * @tc.desc all rejects asynchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 0;
      expect(await session.addEvent()).assertEqual(0);
      manager.calendar.results = [fixtureEvent(0, 'retry-marker', 1000)];
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.allQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvents());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.calendar.allQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_2400
     * @tc.name CalendarEventFailureMatrix02_0024
     * @tc.desc all rejects asynchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0024', 0, async (): Promise<void> => {
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
      manager.calendar.results = [fixtureEvent(2147483647, 'retry-marker', 1000)];
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.allQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvents());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.calendar.allQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_2500
     * @tc.name CalendarEventFailureMatrix02_0025
     * @tc.desc all rejects asynchronously; parameter text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0025', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      manager.calendar.results = [fixtureEvent(9007199254740991, 'retry-marker', 1000)];
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'all';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.getEvents());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.allQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvents());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.calendar.allQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[] = await session.getEvents();
      expect(retryresult === manager.calendar.results).assertTrue();
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('all');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX02_2600
     * @tc.name CalendarEventFailureMatrix02_0026
     * @tc.desc all rejects asynchronously; service text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix02_0026', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.results = [fixtureEvent(0, 'retry-marker', 1000)];
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.allQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvents());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('all');
      expect(manager.calendar.allQueue.length).assertEqual(0);