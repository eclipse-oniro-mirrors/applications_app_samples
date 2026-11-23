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
import type { PermissionRequestResult } from '@kit.AbilityKit';
import { it, expect } from './TestSupport';
import { CalendarEventSession } from '../../../main/ets/CalendarEventSession';
import type { EventCalendarPort, EventManagerPort } from '../../../main/ets/CalendarEventSession';
import { CalendarPermissionGate, hasCalendarPermissions } from '../../../main/ets/CalendarPermission';
import type { CalendarPermissionHandlers } from '../../../main/ets/CalendarPermission';
class Deferred<T> {
  promise: Promise<T>;
  resolve: (value: T) => void = (value: T) => {
  };
  reject: (reason: Error) => void = (reason: Error) => {
  };
  constructor() {
    this.promise = new Promise<T>((resolve, reject) => {
      this.resolve = resolve;
      this.reject = reject;
    });
  }
}
class EventRecorder implements EventCalendarPort {
  trace: string[] = [];
  added?: calendarManager.Event;
  updated?: calendarManager.Event;
  config?: calendarManager.CalendarConfig;
  id: number = 0;
  fail: string = '';
  additions: Deferred<number>[] = [];
  configuring?: Deferred<void>;
  deleting?: Deferred<void>;
  results: calendarManager.Event[] = [{ id: 0, title: 'oracle', type: 0, startTime: 1000, endTime: 2000 }];
  setConfig(config: calendarManager.CalendarConfig): Promise<void> {
    this.trace.push('config');
    this.config = config;
    if (this.fail === 'config') {
      return Promise.reject(new Error('config failed'));
    }
    return this.configuring?.promise || Promise.resolve();
  }
  addEvent(event: calendarManager.Event): Promise<number> {
    this.trace.push('add');
    this.added = event;
    if (this.fail === 'add') {
      return Promise.reject(new Error('add failed'));
    }
    return this.additions.shift()?.promise || Promise.resolve(this.id);
  }
  updateEvent(event: calendarManager.Event): Promise<void> {
    this.trace.push(`update:${event.id}`);
    this.updated = event;
    return this.fail === 'update' ? Promise.reject(new Error('update failed')) : Promise.resolve();
  }
  getEvents(): Promise<calendarManager.Event[]> {
    this.trace.push('all');
    return this.fail === 'query' ? Promise.reject(new Error('query failed')) : Promise.resolve(this.results);
  }
  getById(id: number): Promise<calendarManager.Event[]> {
    this.trace.push(`id:${id}`);
    return this.getEvents();
  }
  getByTitle(title: string): Promise<calendarManager.Event[]> {
    this.trace.push(`title:${title}`);
    return this.getEvents();
  }
  getByTime(start: number, end: number): Promise<calendarManager.Event[]> {
    this.trace.push(`time:${start}:${end}`);
    return this.getEvents();
  }
  deleteEvent(id: number): Promise<void> {
    this.trace.push(`delete:${id}`);
    if (this.fail === 'delete') {
      return Promise.reject(new Error('delete failed'));
    }
    return this.deleting?.promise || Promise.resolve();
  }
}
class EventManagerRecorder implements EventManagerPort {
  calendar: EventRecorder = new EventRecorder();
  account?: calendarManager.CalendarAccount;
  edited?: calendarManager.Event;
  creations: number = 0;
  fail: boolean = false;
  creating?: Deferred<EventCalendarPort>;
  createCalendar(account: calendarManager.CalendarAccount): Promise<EventCalendarPort> {
    this.creations++;
    this.account = account;
    if (this.fail) {
      return Promise.reject(new Error('create failed'));
    }
    return this.creating?.promise || Promise.resolve(this.calendar);
  }
  editEvent(event: calendarManager.Event): Promise<number> {
    this.edited = event;
    return Promise.resolve(91);
  }
}
async function failure(action: () => void |
  Promise<void | number | calendarManager.Event[] | PermissionRequestResult>): Promise<string> {
  try {
    await action();
  } catch (error) {
    return (error as Error).message;
  }
  return 'NO_ERROR';
}
export default function calendarEventLogicTest(): void {
  describe('CalendarEventProductionLogic', () => {
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_0100
     * @tc.name CalendarEventLogic_0001
     * @tc.desc Reject operations until the calendar is ready and an event is selected.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0001', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      expect(await failure(() => session.addEvent())).assertEqual('Calendar is not ready');
      await session.createCalendar();
      expect(await failure(() => session.updateEvent())).assertEqual('Event has not been created');
      expect(await failure(() => session.deleteEvent())).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(',')).assertEqual('config');
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_0200
     * @tc.name CalendarEventLogic_0002
     * @tc.desc Coalesce concurrent creation and withhold readiness until configuration completes.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0002', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const config: Deferred<void> = new Deferred<void>();
      manager.calendar.configuring = config;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      const first: Promise<void> = session.createCalendar();
      const second: Promise<void> = session.createCalendar();
      expect(first === second).assertEqual(true);
      await Promise.resolve();
      expect(await failure(() => session.addEvent())).assertEqual('Calendar is not ready');
      expect(manager.creations).assertEqual(1);
      expect(manager.account?.name).assertEqual('MyCalendar');
      expect(manager.account?.displayName).assertEqual('MyCalendar');
      expect(manager.calendar.config?.color).assertEqual('#aabbcc');
      expect(manager.calendar.config?.enableReminder).assertEqual(true);
      config.resolve();
      await first;
      expect(await session.addEvent()).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_0300
     * @tc.name CalendarEventLogic_0003
     * @tc.desc Allow creation to retry after the manager rejects the initial request.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0003', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      manager.fail = true;
      const session: CalendarEventSession = new CalendarEventSession(manager);
      expect(await failure(() => session.createCalendar())).assertEqual('create failed');
      manager.fail = false;
      await session.createCalendar();
      expect(manager.creations).assertEqual(2);
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_0400
     * @tc.name CalendarEventLogic_0004
     * @tc.desc Reuse the existing calendar when retrying failed configuration.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0004', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      manager.calendar.fail = 'config';
      const session: CalendarEventSession = new CalendarEventSession(manager);
      expect(await failure(() => session.createCalendar())).assertEqual('config failed');
      expect(await failure(() => session.addEvent())).assertEqual('Calendar is not ready');
      manager.calendar.fail = '';
      await session.createCalendar();
      expect(manager.creations).assertEqual(1);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config');
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_0500
     * @tc.name CalendarEventLogic_0005
     * @tc.desc Preserve recurring-event payload fields and accept zero as a selected event ID.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0005', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(0);
      await session.updateEvent();
      const event: calendarManager.Event = manager.calendar.added!;
      expect(event.title).assertEqual('title');
      expect(event.startTime).assertEqual(1000);
      expect(event.endTime).assertEqual(3601000);
      expect(event.reminderTime?.join(',')).assertEqual('10');
      expect(event.recurrenceRule?.count).assertEqual(100);
      expect(event.recurrenceRule?.interval).assertEqual(2);
      expect(event.recurrenceRule?.expire).assertEqual(10801000);
      expect(event.recurrenceRule?.excludedDates?.join(',')).assertEqual('7201000');
      expect(event.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(manager.calendar.updated?.id).assertEqual(0);
      expect(manager.calendar.updated?.title).assertEqual('updateTitle');
      expect(manager.calendar.updated?.description).assertEqual('updateEventTest');
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_0600
     * @tc.name CalendarEventLogic_0006
     * @tc.desc Return the edit result without treating its ID as the selected local-calendar event.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0006', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const session: CalendarEventSession = new CalendarEventSession(manager, 1000);
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edited?.endTime).assertEqual(3601000);
      await session.createCalendar();
      expect(await failure(() => session.updateEvent())).assertEqual('Event has not been created');
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_0700
     * @tc.name CalendarEventLogic_0007
     * @tc.desc Keep the previously selected ID when a subsequent add request fails.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0007', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const session: CalendarEventSession = new CalendarEventSession(manager);
      await session.createCalendar();
      await session.addEvent();
      manager.calendar.fail = 'add';
      expect(await failure(() => session.addEvent())).assertEqual('add failed');
      await session.updateEvent();
      expect(manager.calendar.updated?.id).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_0800
     * @tc.name CalendarEventLogic_0008
     * @tc.desc Select the latest initiated add despite reversed completion order.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0008', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const session: CalendarEventSession = new CalendarEventSession(manager);
      await session.createCalendar();
      const first: Deferred<number> = new Deferred<number>();
      const second: Deferred<number> = new Deferred<number>();
      manager.calendar.additions = [first, second];
      const a: Promise<number> = session.addEvent();
      const b: Promise<number> = session.addEvent();
      second.resolve(22);
      expect(await b).assertEqual(22);
      first.resolve(11);
      expect(await a).assertEqual(11);
      await session.updateEvent();
      expect(manager.calendar.updated?.id).assertEqual(22);
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_0900
     * @tc.name CalendarEventLogic_0009
     * @tc.desc Retain selection on delete rejection and clear it after a successful retry.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0009', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const session: CalendarEventSession = new CalendarEventSession(manager);
      await session.createCalendar();
      await session.addEvent();
      manager.calendar.fail = 'delete';
      expect(await failure(() => session.deleteEvent())).assertEqual('delete failed');
      await session.updateEvent();
      expect(manager.calendar.updated?.id).assertEqual(0);
      manager.calendar.fail = '';
      await session.deleteEvent();
      expect(await failure(() => session.updateEvent())).assertEqual('Event has not been created');
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_1000
     * @tc.name CalendarEventLogic_0010
     * @tc.desc Prevent a late deletion from clearing a newly selected different event ID.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0010', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const session: CalendarEventSession = new CalendarEventSession(manager);
      await session.createCalendar();
      await session.addEvent();
      const deletion: Deferred<void> = new Deferred<void>();
      manager.calendar.deleting = deletion;
      const pending: Promise<void> = session.deleteEvent();
      manager.calendar.id = 23;
      await session.addEvent();
      deletion.resolve();
      await pending;
      await session.updateEvent();
      expect(manager.calendar.updated?.id).assertEqual(23);
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_1100
     * @tc.name CalendarEventLogic_0011
     * @tc.desc Preserve ID, title and fixed-time query arguments and propagate query rejection.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0011', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const session: CalendarEventSession = new CalendarEventSession(manager);
      await session.createCalendar();
      await session.addEvent();
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0][0].title).assertEqual('oracle');
      expect(manager.calendar.trace.join(',')).assertEqual(
        'config,add,id:0,all,title:update,all,time:1686931200000:1687017600000,all');
      manager.calendar.results = [];
      expect((await session.getEvents()).length).assertEqual(0);
      manager.calendar.fail = 'query';
      expect(await failure(() => session.getEvents())).assertEqual('query failed');
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_1200
     * @tc.name CalendarEventLogic_0012
     * @tc.desc Invalidate pending selection without deleting stored calendar or event data.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0012', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const session: CalendarEventSession = new CalendarEventSession(manager);
      await session.createCalendar();
      const addition: Deferred<number> = new Deferred<number>();
      manager.calendar.additions = [addition];
      const pending: Promise<number> = session.addEvent();
      session.clear();
      addition.resolve(99);
      await pending;
      await session.createCalendar();
      expect(await failure(() => session.updateEvent())).assertEqual('Event has not been created');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,config');
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_1300
     * @tc.name CalendarEventLogic_0013
     * @tc.desc Prevent stale configuration completion from restoring readiness after clear.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0013', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const config: Deferred<void> = new Deferred<void>();
      manager.calendar.configuring = config;
      const session: CalendarEventSession = new CalendarEventSession(manager);
      const pending: Promise<void> = session.createCalendar();
      await Promise.resolve();
      session.clear();
      config.resolve();
      await pending;
      expect(await failure(() => session.addEvent())).assertEqual('Calendar is not ready');
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_1400
     * @tc.name CalendarEventLogic_0014
     * @tc.desc Keep another session selection intact when the first instance is cleared.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0014', 0, async (): Promise<void> => {
      const manager: EventManagerRecorder = new EventManagerRecorder();
      const other: EventManagerRecorder = new EventManagerRecorder();
      other.calendar.id = 55;
      const a: CalendarEventSession = new CalendarEventSession(manager);
      const b: CalendarEventSession = new CalendarEventSession(other);
      await a.createCalendar();
      await b.createCalendar();
      await a.addEvent();
      await b.addEvent();
      a.clear();
      await b.updateEvent();
      expect(other.calendar.updated?.id).assertEqual(55);
      expect(await failure(() => a.updateEvent())).assertEqual('Calendar is not ready');
    });
  });
  describe('CalendarEventPermissionGate', () => {
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_1500
     * @tc.name CalendarEventLogic_0015
     * @tc.desc Require both grants and map authorization results by returned permission ordering.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0015', 0, (): void => {
      expect(hasCalendarPermissions({ permissions: ['ohos.permission.WRITE_CALENDAR', 'ohos.permission.READ_CALENDAR'],
        authResults: [0, 0]
      })).assertEqual(true);
      expect(hasCalendarPermissions({ permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
        authResults: [0, -1] })).assertEqual(false);
      expect(hasCalendarPermissions({ permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
        authResults: [-1, 0] })).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_1600
     * @tc.name CalendarEventLogic_0016
     * @tc.desc Deny empty, incomplete, duplicated and unknown permission result arrays.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0016', 0, (): void => {
      expect(hasCalendarPermissions({ permissions: [], authResults: [] })).assertEqual(false);
      expect(hasCalendarPermissions({
        permissions: ['ohos.permission.READ_CALENDAR'], authResults: [0]
      })).assertEqual(false);
      expect(hasCalendarPermissions({
        permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.READ_CALENDAR'],
        authResults: [0, 0]
      })).assertEqual(false);
      expect(hasCalendarPermissions({
        permissions: ['other', 'ohos.permission.WRITE_CALENDAR'], authResults: [0, 0]
      })).assertEqual(false);
      expect(hasCalendarPermissions({ permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
        authResults: [0] })).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_1700
     * @tc.name CalendarEventLogic_0017
     * @tc.desc Preserve a denied result identity while blocking granted and failed callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0017', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const partial: PermissionRequestResult = {
        permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'], authResults: [0, -1]
      };
      let operations: number = 0;
      let denied: PermissionRequestResult | undefined;
      const returned: PermissionRequestResult = await gate.request(() => Promise.resolve(partial), {
        onGranted: (): void => {
          operations++;
        },
        onDenied: (result: PermissionRequestResult): void => {
          denied = result;
        },
        onFailed: (): void => {
          operations++;
        }
      });
      expect(returned === partial).assertEqual(true);
      expect(denied === partial).assertEqual(true);
      expect(operations).assertEqual(0);
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_1800
     * @tc.name CalendarEventLogic_0018
     * @tc.desc Rethrow the permission error and invoke only the failed callback.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0018', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      let operations: number = 0;
      let failures: number = 0;
      expect(await failure(() => gate.request(() => Promise.reject(new Error('permission failed')), {
        onGranted: (): void => {
          operations++;
        },
        onDenied: (): void => {
          operations++;
        },
        onFailed: (): void => {
          failures++;
        }
      }))).assertEqual('permission failed');
      expect(operations).assertEqual(0);
      expect(failures).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_EVENT_LOGIC_1900
     * @tc.name CalendarEventLogic_0019
     * @tc.desc Apply only the latest result and suppress granted callbacks after invalidation.
     * @tc.type FUNC
     */
    it('CalendarEventLogic_0019', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const first: Deferred<PermissionRequestResult> = new Deferred<PermissionRequestResult>();
      const second: Deferred<PermissionRequestResult> = new Deferred<PermissionRequestResult>();
      let operations: number = 0;
      const handlers: CalendarPermissionHandlers = {
        onGranted: (): void => {
          operations++;
        },
        onDenied: (): void => {
        },
        onFailed: (): void => {
        }
      };
      const oldRequest: Promise<PermissionRequestResult> = gate.request(() => first.promise, handlers);
      const latestRequest: Promise<PermissionRequestResult> = gate.request(() => second.promise, handlers);
      const granted: PermissionRequestResult = {
        permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'], authResults: [0, 0]
      };
      second.resolve(granted);
      expect((await latestRequest) === granted).assertEqual(true);
      first.resolve(granted);
      expect((await oldRequest) === granted).assertEqual(true);
      expect(operations).assertEqual(1);
      const late: Deferred<PermissionRequestResult> = new Deferred<PermissionRequestResult>();
      const invalidated: Promise<PermissionRequestResult> = gate.request(() => late.promise, handlers);
      gate.invalidate();
      late.resolve(granted);
      await invalidated;
      expect(operations).assertEqual(1);
    });
  });
}
