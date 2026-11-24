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

export default function calendarFailureMatrix01Test(): void {
  describe('CalendarFailureMatrix01', (): void => {
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_0100
     * @tc.name CalendarEventFailureMatrix01_0001
     * @tc.desc add throws synchronously; permission text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
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
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_0200
     * @tc.name CalendarEventFailureMatrix01_0002
     * @tc.desc add throws synchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0002', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_0300
     * @tc.name CalendarEventFailureMatrix01_0003
     * @tc.desc add throws synchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0003', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_0400
     * @tc.name CalendarEventFailureMatrix01_0004
     * @tc.desc add throws synchronously; permission text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.addEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_0500
     * @tc.name CalendarEventFailureMatrix01_0005
     * @tc.desc add throws synchronously; parameter text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
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
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_0600
     * @tc.name CalendarEventFailureMatrix01_0006
     * @tc.desc add throws synchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0006', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_0700
     * @tc.name CalendarEventFailureMatrix01_0007
     * @tc.desc add throws synchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0007', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_0800
     * @tc.name CalendarEventFailureMatrix01_0008
     * @tc.desc add throws synchronously; parameter text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.addEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_0900
     * @tc.name CalendarEventFailureMatrix01_0009
     * @tc.desc add throws synchronously; service text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
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
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_1000
     * @tc.name CalendarEventFailureMatrix01_0010
     * @tc.desc add throws synchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0010', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_1100
     * @tc.name CalendarEventFailureMatrix01_0011
     * @tc.desc add throws synchronously; service text; clear/rebuilt with int32 maximum ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0011', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_1200
     * @tc.name CalendarEventFailureMatrix01_0012
     * @tc.desc add throws synchronously; service text; repeat failure with safe-integer maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.addEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.addEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_1300
     * @tc.name CalendarEventFailureMatrix01_0013
     * @tc.desc add rejects asynchronously; permission text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
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
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_1400
     * @tc.name CalendarEventFailureMatrix01_0014
     * @tc.desc add rejects asynchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0014', 0, async (): Promise<void> => {
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
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_1500
     * @tc.name CalendarEventFailureMatrix01_0015
     * @tc.desc add rejects asynchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0015', 0, async (): Promise<void> => {
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
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_1600
     * @tc.name CalendarEventFailureMatrix01_0016
     * @tc.desc add rejects asynchronously; permission text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.addEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_1700
     * @tc.name CalendarEventFailureMatrix01_0017
     * @tc.desc add rejects asynchronously; parameter text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
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
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_1800
     * @tc.name CalendarEventFailureMatrix01_0018
     * @tc.desc add rejects asynchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0018', 0, async (): Promise<void> => {
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
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_1900
     * @tc.name CalendarEventFailureMatrix01_0019
     * @tc.desc add rejects asynchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0019', 0, async (): Promise<void> => {
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
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_2000
     * @tc.name CalendarEventFailureMatrix01_0020
     * @tc.desc add rejects asynchronously; parameter text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.addEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_2100
     * @tc.name CalendarEventFailureMatrix01_0021
     * @tc.desc add rejects asynchronously; service text; ready without selection; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
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
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_2200
     * @tc.name CalendarEventFailureMatrix01_0022
     * @tc.desc add rejects asynchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0022', 0, async (): Promise<void> => {
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
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_2300
     * @tc.name CalendarEventFailureMatrix01_0023
     * @tc.desc add rejects asynchronously; service text; clear/rebuilt with int32 maximum ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0023', 0, async (): Promise<void> => {
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
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_2400
     * @tc.name CalendarEventFailureMatrix01_0024
     * @tc.desc add rejects asynchronously; service text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'add';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.addEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<number> = new Pending<number>();
      manager.calendar.addQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.addEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.calendar.addQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('add');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('add,update');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_2500
     * @tc.name CalendarEventFailureMatrix01_0025
     * @tc.desc update throws synchronously; permission text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0025', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_2600
     * @tc.name CalendarEventFailureMatrix01_0026
     * @tc.desc update throws synchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0026', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_2700
     * @tc.name CalendarEventFailureMatrix01_0027
     * @tc.desc update throws synchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0027', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_2800
     * @tc.name CalendarEventFailureMatrix01_0028
     * @tc.desc update throws synchronously; permission text; repeat failure with safe-integer maximum ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0028', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_2900
     * @tc.name CalendarEventFailureMatrix01_0029
     * @tc.desc update throws synchronously; parameter text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0029', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_3000
     * @tc.name CalendarEventFailureMatrix01_0030
     * @tc.desc update throws synchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0030', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_3100
     * @tc.name CalendarEventFailureMatrix01_0031
     * @tc.desc update throws synchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0031', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_3200
     * @tc.name CalendarEventFailureMatrix01_0032
     * @tc.desc update throws synchronously; parameter text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0032', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_3300
     * @tc.name CalendarEventFailureMatrix01_0033
     * @tc.desc update throws synchronously; service text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0033', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_3400
     * @tc.name CalendarEventFailureMatrix01_0034
     * @tc.desc update throws synchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0034', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_3500
     * @tc.name CalendarEventFailureMatrix01_0035
     * @tc.desc update throws synchronously; service text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0035', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_3600
     * @tc.name CalendarEventFailureMatrix01_0036
     * @tc.desc update throws synchronously; service text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0036', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.updateEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'update';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.updateEvent());
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_3700
     * @tc.name CalendarEventFailureMatrix01_0037
     * @tc.desc update rejects asynchronously; permission text; first request with positive ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0037', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const message: string = '201: Permission denied';
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_3800
     * @tc.name CalendarEventFailureMatrix01_0038
     * @tc.desc update rejects asynchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0038', 0, async (): Promise<void> => {
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_3900
     * @tc.name CalendarEventFailureMatrix01_0039
     * @tc.desc update rejects asynchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0039', 0, async (): Promise<void> => {
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_4000
     * @tc.name CalendarEventFailureMatrix01_0040
     * @tc.desc update rejects asynchronously; permission text; repeat failure with safe-integer maximum ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0040', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_4100
     * @tc.name CalendarEventFailureMatrix01_0041
     * @tc.desc update rejects asynchronously; parameter text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0041', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 1;
      expect(await session.addEvent()).assertEqual(1);
      const message: string = '401: Invalid parameter';
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_4200
     * @tc.name CalendarEventFailureMatrix01_0042
     * @tc.desc update rejects asynchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0042', 0, async (): Promise<void> => {
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
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX01_4300
     * @tc.name CalendarEventFailureMatrix01_0043
     * @tc.desc update rejects asynchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix01_0043', 0, async (): Promise<void> => {
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
  });
}
