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
import { CalendarProbe, ManagerProbe, Pending, captureFailure } from './CalendarLogicFixtures';

export default function calendarFailureMatrix03Test(): void {
  describe('CalendarFailureMatrix03', (): void => {
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_0100
     * @tc.name CalendarEventFailureMatrix03_0001
     * @tc.desc id rejects asynchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0001', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.idQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.idQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_0200
     * @tc.name CalendarEventFailureMatrix03_0002
     * @tc.desc id rejects asynchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0002', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.idQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.idQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(2147483647);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_0300
     * @tc.name CalendarEventFailureMatrix03_0003
     * @tc.desc id rejects asynchronously; permission text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'id';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.getEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.idQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.idQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(2);
      expect(manager.calendar.titles.length).assertEqual(2);
      expect(manager.calendar.starts.length).assertEqual(2);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_0400
     * @tc.name CalendarEventFailureMatrix03_0004
     * @tc.desc id rejects asynchronously; parameter text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0004', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.idQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.idQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_0500
     * @tc.name CalendarEventFailureMatrix03_0005
     * @tc.desc id rejects asynchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0005', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.idQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.idQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_0600
     * @tc.name CalendarEventFailureMatrix03_0006
     * @tc.desc id rejects asynchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0006', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.idQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.idQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(2147483647);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_0700
     * @tc.name CalendarEventFailureMatrix03_0007
     * @tc.desc id rejects asynchronously; parameter text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'id';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.getEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.idQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.idQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(2);
      expect(manager.calendar.titles.length).assertEqual(2);
      expect(manager.calendar.starts.length).assertEqual(2);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_0800
     * @tc.name CalendarEventFailureMatrix03_0008
     * @tc.desc id rejects asynchronously; service text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0008', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.idQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.idQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_0900
     * @tc.name CalendarEventFailureMatrix03_0009
     * @tc.desc id rejects asynchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0009', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.idQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.idQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_1000
     * @tc.name CalendarEventFailureMatrix03_0010
     * @tc.desc id rejects asynchronously; service text; clear/rebuilt with int32 maximum ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0010', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.idQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.idQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(2147483647);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_1100
     * @tc.name CalendarEventFailureMatrix03_0011
     * @tc.desc id rejects asynchronously; service text; repeat failure with safe-integer maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'id';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.getEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.idQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.idQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(2);
      expect(manager.calendar.titles.length).assertEqual(2);
      expect(manager.calendar.starts.length).assertEqual(2);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_1200
     * @tc.name CalendarEventFailureMatrix03_0012
     * @tc.desc title throws synchronously; permission text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0012', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_1300
     * @tc.name CalendarEventFailureMatrix03_0013
     * @tc.desc title throws synchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0013', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_1400
     * @tc.name CalendarEventFailureMatrix03_0014
     * @tc.desc title throws synchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0014', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(2147483647);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_1500
     * @tc.name CalendarEventFailureMatrix03_0015
     * @tc.desc title throws synchronously; permission text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.getEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(2);
      expect(manager.calendar.titles.length).assertEqual(2);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_1600
     * @tc.name CalendarEventFailureMatrix03_0016
     * @tc.desc title throws synchronously; parameter text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0016', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_1700
     * @tc.name CalendarEventFailureMatrix03_0017
     * @tc.desc title throws synchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0017', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_1800
     * @tc.name CalendarEventFailureMatrix03_0018
     * @tc.desc title throws synchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0018', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(2147483647);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_1900
     * @tc.name CalendarEventFailureMatrix03_0019
     * @tc.desc title throws synchronously; parameter text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.getEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(2);
      expect(manager.calendar.titles.length).assertEqual(2);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_2000
     * @tc.name CalendarEventFailureMatrix03_0020
     * @tc.desc title throws synchronously; service text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0020', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_2100
     * @tc.name CalendarEventFailureMatrix03_0021
     * @tc.desc title throws synchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0021', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_2200
     * @tc.name CalendarEventFailureMatrix03_0022
     * @tc.desc title throws synchronously; service text; clear/rebuilt with int32 maximum ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0022', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(2147483647);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_2300
     * @tc.name CalendarEventFailureMatrix03_0023
     * @tc.desc title throws synchronously; service text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.getEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(2);
      expect(manager.calendar.titles.length).assertEqual(2);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_2400
     * @tc.name CalendarEventFailureMatrix03_0024
     * @tc.desc title rejects asynchronously; permission text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0024', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_2500
     * @tc.name CalendarEventFailureMatrix03_0025
     * @tc.desc title rejects asynchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0025', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_2600
     * @tc.name CalendarEventFailureMatrix03_0026
     * @tc.desc title rejects asynchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0026', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(2147483647);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_2700
     * @tc.name CalendarEventFailureMatrix03_0027
     * @tc.desc title rejects asynchronously; permission text; repeat failure with safe-integer maximum ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0027', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.getEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(2);
      expect(manager.calendar.titles.length).assertEqual(2);
      expect(manager.calendar.starts.length).assertEqual(2);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_2800
     * @tc.name CalendarEventFailureMatrix03_0028
     * @tc.desc title rejects asynchronously; parameter text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0028', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_2900
     * @tc.name CalendarEventFailureMatrix03_0029
     * @tc.desc title rejects asynchronously; parameter text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0029', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_3000
     * @tc.name CalendarEventFailureMatrix03_0030
     * @tc.desc title rejects asynchronously; parameter text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0030', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(2147483647);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_3100
     * @tc.name CalendarEventFailureMatrix03_0031
     * @tc.desc title rejects asynchronously; parameter text; repeat failure with safe-integer maximum ID; error
     * identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0031', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '401: Invalid parameter';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.getEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(2);
      expect(manager.calendar.titles.length).assertEqual(2);
      expect(manager.calendar.starts.length).assertEqual(2);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_3200
     * @tc.name CalendarEventFailureMatrix03_0032
     * @tc.desc title rejects asynchronously; service text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0032', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_3300
     * @tc.name CalendarEventFailureMatrix03_0033
     * @tc.desc title rejects asynchronously; service text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0033', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_3400
     * @tc.name CalendarEventFailureMatrix03_0034
     * @tc.desc title rejects asynchronously; service text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0034', 0, async (): Promise<void> => {
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
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(2147483647);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_3500
     * @tc.name CalendarEventFailureMatrix03_0035
     * @tc.desc title rejects asynchronously; service text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0035', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '16000050: Calendar service unavailable';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'title';
      manager.calendar.synchronous = false;
      const previous: Error | undefined = await captureFailure(() => session.getEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      const pending: Pending<calendarManager.Event[]> = new Pending<calendarManager.Event[]>();
      manager.calendar.titleQueue.push(pending);
      const captured: Promise<Error | undefined> = captureFailure(() => session.getEvent());
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.calendar.titleQueue.length).assertEqual(0);
      pending.reject(original);
      const failure: Error | undefined = await captured;
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(2);
      expect(manager.calendar.titles.length).assertEqual(2);
      expect(manager.calendar.starts.length).assertEqual(2);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_3600
     * @tc.name CalendarEventFailureMatrix03_0036
     * @tc.desc time throws synchronously; permission text; first request with positive ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0036', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'time';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(1);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(1);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_3700
     * @tc.name CalendarEventFailureMatrix03_0037
     * @tc.desc time throws synchronously; permission text; selected zero ID; error identity and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0037', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'time';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(0);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(0);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_3800
     * @tc.name CalendarEventFailureMatrix03_0038
     * @tc.desc time throws synchronously; permission text; clear/rebuilt with int32 maximum ID; error identity and
     * retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0038', 0, async (): Promise<void> => {
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
      manager.calendar.failMethod = 'time';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(1);
      expect(manager.calendar.titles.length).assertEqual(1);
      expect(manager.calendar.starts.length).assertEqual(1);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(2147483647);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(2147483647);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
    /**
     * @tc.number SUB_CALENDAR_FAILURE_FAILUREMATRIX03_3900
     * @tc.name CalendarEventFailureMatrix03_0039
     * @tc.desc time throws synchronously; permission text; repeat failure with safe-integer maximum ID; error identity
     * and retry.
     * @tc.type FUNC
     */
    it('CalendarEventFailureMatrix03_0039', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      manager.calendar.nextId = 9007199254740991;
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const message: string = '201: Permission denied';
      const original: Error = new Error(message);
      manager.calendar.error = original;
      manager.calendar.failMethod = 'time';
      manager.calendar.synchronous = true;
      const previous: Error | undefined = await captureFailure(() => session.getEvent());
      expect(previous === original).assertTrue();
      expect(previous?.message).assertEqual(message);
      manager.calendar.failMethod = '';
      const traceOffset: number = manager.calendar.trace.length;
      const accountsOffset: number = manager.accounts.length;
      const editsOffset: number = manager.edits.length;
      manager.calendar.failMethod = 'time';
      manager.calendar.synchronous = true;
      const failure: Error | undefined = await captureFailure(() => session.getEvent());
      expect(failure === original).assertTrue();
      expect(failure?.message).assertEqual(message);
      expect(manager.calendar.trace.slice(traceOffset).join(",")).assertEqual('id,title,time');
      expect(manager.accounts.length).assertEqual(accountsOffset + 0);
      expect(manager.edits.length).assertEqual(editsOffset + 0);
      expect(manager.calendar.ids.length).assertEqual(2);
      expect(manager.calendar.titles.length).assertEqual(2);
      expect(manager.calendar.starts.length).assertEqual(2);
      expect(manager.calendar.ends.length).assertEqual(manager.calendar.starts.length);
      manager.calendar.failMethod = '';
      await session.updateEvent();
      expect(manager.calendar.updates[manager.calendar.updates.length - 1].id).assertEqual(9007199254740991);
      const beforeRetry: number = manager.calendar.trace.length;
      const editsBeforeRetry: number = manager.edits.length;
      const retryresult: calendarManager.Event[][] = await session.getEvent();
      expect(retryresult.length).assertEqual(3);
      expect(manager.calendar.ids[manager.calendar.ids.length - 1]).assertEqual(9007199254740991);
      expect(manager.calendar.trace.slice(beforeRetry).join(",")).assertEqual('id,title,time');
      expect(manager.edits.length).assertEqual(editsBeforeRetry + 0);
    });
  });
}
