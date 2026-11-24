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
import { describe, it, Level, Size, TestType } from '@ohos/hypium';
import { calendarManager } from '@kit.CalendarKit';
import type { PermissionRequestResult } from '@kit.AbilityKit';
import { expect } from './TestSupport';
import { CalendarAccountSession } from '../../../main/ets/CalendarAccountSession';
import type { AccountCalendarPort, AccountManagerPort } from '../../../main/ets/CalendarAccountSession';
import { CalendarPermissionGate, hasCalendarPermissions } from '../../../main/ets/CalendarPermission';
import type { CalendarPermissionHandlers } from '../../../main/ets/CalendarPermission';
class Deferred<T> {
  promise: Promise<T>;
  resolve: (value: T) => void = (value: T): void => { };
  reject: (reason: Error) => void = (reason: Error): void => { };
  constructor() {
    this.promise = new Promise<T>((resolve, reject): void => {
      this.resolve = resolve;
      this.reject = reject;
    });
  }
}
class CalendarRecorder implements AccountCalendarPort {
  config?: calendarManager.CalendarConfig;
  private account: calendarManager.CalendarAccount;
  constructor(account: calendarManager.CalendarAccount) { this.account = account; }
  setConfig(config: calendarManager.CalendarConfig): Promise<void> {
    this.config = config;
    return config.color === 'reject' ? Promise.reject(new Error('config failed')) : Promise.resolve();
  }
  getAccount(): calendarManager.CalendarAccount { return this.account; }
}
class ManagerRecorder implements AccountManagerPort {
  trace: string[] = [];
  created: CalendarRecorder = new CalendarRecorder({ name: 'created', type: calendarManager.CalendarType.LOCAL });
  named: CalendarRecorder = new CalendarRecorder({ name: 'MyCalendar', type: calendarManager.CalendarType.LOCAL });
  defaultCalendar: CalendarRecorder = new CalendarRecorder({
    name: 'default',
    type: calendarManager.CalendarType.LOCAL
  });
  all: AccountCalendarPort[] = [this.named, this.defaultCalendar];
  pending?: Deferred<AccountCalendarPort>;
  fail: string = '';
  deleted?: AccountCalendarPort;
  account?: calendarManager.CalendarAccount;
  createCalendar(account: calendarManager.CalendarAccount): Promise<AccountCalendarPort> {
    this.trace.push('create');
    this.account = account;
    if (this.fail === 'create') {
      return Promise.reject(new Error('create failed'));
    }
    return this.pending?.promise || Promise.resolve(this.created);
  }
  getCalendar(account?: calendarManager.CalendarAccount): Promise<AccountCalendarPort> {
    this.trace.push(account ? `get:${account.name}` : 'get:default');
    if (this.fail === 'get') {
      return Promise.reject(new Error('get failed'));
    }
    return Promise.resolve(account ? this.named : this.defaultCalendar);
  }
  getAllCalendars(): Promise<AccountCalendarPort[]> {
    this.trace.push('all');
    return this.fail === 'all' ? Promise.reject(new Error('all failed')) : Promise.resolve(this.all);
  }
  deleteCalendar(calendar: AccountCalendarPort): Promise<void> {
    this.trace.push(`delete:${calendar.getAccount().name}`);
    this.deleted = calendar;
    return this.fail === 'delete' ? Promise.reject(new Error('delete failed')) : Promise.resolve();
  }
}
async function failure(action: () => void | Promise<void | AccountCalendarPort | AccountCalendarPort[] |
  PermissionRequestResult>): Promise<string> {
  try {
    await action();
  }
  catch (error) {
    return (error as Error).message;
  }
  return 'NO_ERROR';
}
export default function calendarManagerLogicTest(): void {
  describe('CalendarManagerProductionLogic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_0100
     * @tc.name testCalendarManagerBaseline0001
     * @tc.desc Verify fixed account contract.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testCalendarManagerBaseline0001';
      console.info(`${TAG} start`);
      try {
        const account: calendarManager.CalendarAccount = CalendarAccountSession.account();
        expect(account.name).assertEqual('MyCalendar');
        expect(account.displayName).assertEqual('MyCalendar');
        expect(account.type).assertEqual(calendarManager.CalendarType.LOCAL);
      }
      finally {
        console.info(`${TAG} end`);
      }
    });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_0200
     * @tc.name testCalendarManagerBaseline0002
     * @tc.desc Verify coalesces double creation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0002';
        console.info(`${TAG} start`);
        try {
          const manager: ManagerRecorder = new ManagerRecorder();
          const pending: Deferred<AccountCalendarPort> = new Deferred<AccountCalendarPort>();
          manager.pending = pending;
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const first: Promise<AccountCalendarPort> = session.createCalendar();
          const second: Promise<AccountCalendarPort> = session.createCalendar();
          expect(first === second).assertEqual(true);
          expect(manager.trace.join(',')).assertEqual('create');
          pending.resolve(manager.created);
          expect((await first).getAccount().name).assertEqual('created');
          await session.deleteCalendar();
          expect(manager.deleted === manager.created).assertEqual(true);
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_0300
     * @tc.name testCalendarManagerBaseline0003
     * @tc.desc Verify creation failure allows retry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0003';
        console.info(`${TAG} start`);
        try {
          const manager: ManagerRecorder = new ManagerRecorder();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          manager.fail = 'create';
          expect(await failure((): Promise<AccountCalendarPort> =>
            session.createCalendar())).assertEqual('create failed');
          manager.fail = '';
          await session.createCalendar();
          expect(manager.trace.join(',')).assertEqual('create,create');
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_0400
     * @tc.name testCalendarManagerBaseline0004
     * @tc.desc Verify delete requires owned created handle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0004';
        console.info(`${TAG} start`);
        try {
          const manager: ManagerRecorder = new ManagerRecorder();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          await session.getCalendarByParam();
          await session.getDefaultCalendar();
          expect(await failure((): Promise<void> =>
            session.deleteCalendar())).assertEqual('Calendar has not been created');
          expect(manager.deleted === undefined).assertEqual(true);
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_0500
     * @tc.name testCalendarManagerBaseline0005
     * @tc.desc Verify delete rejection preserves handle for retry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0005';
        console.info(`${TAG} start`);
        try {
          const manager: ManagerRecorder = new ManagerRecorder();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          await session.createCalendar();
          manager.fail = 'delete';
          expect(await failure((): Promise<void> => session.deleteCalendar())).assertEqual('delete failed');
          manager.fail = '';
          await session.deleteCalendar();
          expect(manager.trace.join(',')).assertEqual('create,delete:created,delete:created');
          expect(await failure((): Promise<void> =>
            session.deleteCalendar())).assertEqual('Calendar has not been created');
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_0600
     * @tc.name testCalendarManagerBaseline0006
     * @tc.desc Verify clear never deletes user data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0006';
        console.info(`${TAG} start`);
        try {
          const manager: ManagerRecorder = new ManagerRecorder();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          await session.createCalendar();
          session.clear();
          expect(manager.trace.join(',')).assertEqual('create');
          expect(await failure((): Promise<void> =>
            session.deleteCalendar())).assertEqual('Calendar has not been created');
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_0700
     * @tc.name testCalendarManagerBaseline0007
     * @tc.desc Verify late creation after clear is not owned.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0007';
        console.info(`${TAG} start`);
        try {
          const manager: ManagerRecorder = new ManagerRecorder();
          const pending: Deferred<AccountCalendarPort> = new Deferred<AccountCalendarPort>();
          manager.pending = pending;
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const creation: Promise<AccountCalendarPort> = session.createCalendar();
          session.clear();
          pending.resolve(manager.created);
          await creation;
          expect(await failure((): Promise<void> =>
            session.deleteCalendar())).assertEqual('Calendar has not been created');
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_0800
     * @tc.name testCalendarManagerBaseline0008
     * @tc.desc Verify config uses named lookup then real setter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0008';
        console.info(`${TAG} start`);
        try {
          const manager: ManagerRecorder = new ManagerRecorder();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          await session.setConfig();
          expect(manager.trace.join(',')).assertEqual('get:MyCalendar');
          expect(manager.named.config?.enableReminder).assertEqual(true);
          expect(manager.named.config?.color).assertEqual('#aabbcc');
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_0900
     * @tc.name testCalendarManagerBaseline0009
     * @tc.desc Verify lookup failure propagates without config.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0009';
        console.info(`${TAG} start`);
        try {
          const manager: ManagerRecorder = new ManagerRecorder();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          manager.fail = 'get';
          expect(await failure((): Promise<void> => session.setConfig())).assertEqual('get failed');
          expect(manager.named.config === undefined).assertEqual(true);
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_1000
     * @tc.name testCalendarManagerBaseline0010
     * @tc.desc Verify named and default queries are distinct.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0010';
        console.info(`${TAG} start`);
        try {
          const manager: ManagerRecorder = new ManagerRecorder();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          expect((await session.getCalendarByParam()).getAccount().name).assertEqual('MyCalendar');
          expect((await session.getDefaultCalendar()).getAccount().name).assertEqual('default');
          expect(manager.trace.join(',')).assertEqual('get:MyCalendar,get:default');
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_1100
     * @tc.name testCalendarManagerBaseline0011
     * @tc.desc Verify all query preserves order identity and empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0011';
        console.info(`${TAG} start`);
        try {
          const manager: ManagerRecorder = new ManagerRecorder();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const result: AccountCalendarPort[] = await session.getAllCalendars();
          expect(result.length).assertEqual(2);
          expect(result[0] === manager.named).assertEqual(true);
          expect(result[1] === manager.defaultCalendar).assertEqual(true);
          manager.all = [];
          expect((await session.getAllCalendars()).length).assertEqual(0);
          manager.fail = 'all';
          expect(await failure((): Promise<AccountCalendarPort[]> =>
            session.getAllCalendars())).assertEqual('all failed');
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_1200
     * @tc.name testCalendarManagerBaseline0012
     * @tc.desc Verify instances do not share owned calendar.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0012';
        console.info(`${TAG} start`);
        try {
          const firstManager: ManagerRecorder = new ManagerRecorder();
          const secondManager: ManagerRecorder = new ManagerRecorder();
          secondManager.created = new CalendarRecorder({ name: 'second', type: calendarManager.CalendarType.LOCAL });
          const first: CalendarAccountSession = new CalendarAccountSession(firstManager);
          const second: CalendarAccountSession = new CalendarAccountSession(secondManager);
          await first.createCalendar();
          await second.createCalendar();
          first.clear();
          await second.deleteCalendar();
          expect(secondManager.deleted?.getAccount().name).assertEqual('second');
          expect(firstManager.deleted === undefined).assertEqual(true);
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
  });
  describe('CalendarManagerPermissionGate', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_1300
     * @tc.name testCalendarManagerBaseline0013
     * @tc.desc Verify permission requires real dual grant.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testCalendarManagerBaseline0013';
      console.info(`${TAG} start`);
      try {
        expect(hasCalendarPermissions({
          permissions: ['ohos.permission.WRITE_CALENDAR',
            'ohos.permission.READ_CALENDAR'],
          authResults: [0, 0]
        })).assertEqual(true);
        expect(hasCalendarPermissions({
          permissions: ['ohos.permission.READ_CALENDAR',
            'ohos.permission.WRITE_CALENDAR'],
          authResults: [0, -1]
        })).assertEqual(false);
        expect(hasCalendarPermissions({ permissions: [], authResults: [] })).assertEqual(false);
        expect(hasCalendarPermissions({
          permissions: ['ohos.permission.READ_CALENDAR'],
          authResults: [0]
        })).assertEqual(false);
      }
      finally {
        console.info(`${TAG} end`);
      }
    });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_1400
     * @tc.name testCalendarManagerBaseline0014
     * @tc.desc Verify permission rejects duplicates unknown and misaligned.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testCalendarManagerBaseline0014';
      console.info(`${TAG} start`);
      try {
        expect(hasCalendarPermissions({
          permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.READ_CALENDAR'],
          authResults: [0, 0]
        })).assertEqual(false);
        expect(hasCalendarPermissions({
          permissions: ['other', 'ohos.permission.WRITE_CALENDAR'],
          authResults: [0, 0]
        })).assertEqual(false);
        expect(hasCalendarPermissions({
          permissions: ['ohos.permission.READ_CALENDAR',
            'ohos.permission.WRITE_CALENDAR'],
          authResults: [0]
        })).assertEqual(false);
      }
      finally {
        console.info(`${TAG} end`);
      }
    });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_1500
     * @tc.name testCalendarManagerBaseline0015
     * @tc.desc Verify permission denial blocks create delete and queries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0015';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const partial: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'], authResults: [-1, 0]
          };
          let accountOperations: number = 0;
          let denied: PermissionRequestResult | undefined;
          const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> =>
            Promise.resolve(partial), {
            onGranted: (): void => { accountOperations++; },
            onDenied: (result: PermissionRequestResult): void => { denied = result; },
            onFailed: (): void => { accountOperations++; }
          });
          expect(returned === partial).assertEqual(true);
          expect(denied === partial).assertEqual(true);
          expect(accountOperations).assertEqual(0);
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_1600
     * @tc.name testCalendarManagerBaseline0016
     * @tc.desc Verify permission error is rethrown without account access.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0016';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          let accountOperations: number = 0;
          let failures: number = 0;
          expect(await failure((): Promise<PermissionRequestResult> =>
            gate.request((): Promise<PermissionRequestResult> => Promise.reject(new Error('permission failed')), {
            onGranted: (): void => { accountOperations++; },
            onDenied: (): void => { accountOperations++; },
            onFailed: (): void => { failures++; }
          }))).assertEqual('permission failed');
          expect(accountOperations).assertEqual(0);
          expect(failures).assertEqual(1);
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_CALENDAR_MANAGER_BASELINE_1700
     * @tc.name testCalendarManagerBaseline0017
     * @tc.desc Verify permission ignores concurrent and invalidated late results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerBaseline0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerBaseline0017';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const first: Deferred<PermissionRequestResult> = new Deferred<PermissionRequestResult>();
          const second: Deferred<PermissionRequestResult> = new Deferred<PermissionRequestResult>();
          let accountOperations: number = 0;
          const handlers: CalendarPermissionHandlers = {
            onGranted: (): void => { accountOperations++; },
            onDenied: (): void => { },
            onFailed: (): void => { }
          };
          const oldRequest: Promise<PermissionRequestResult> = gate.request(
            (): Promise<PermissionRequestResult> => first.promise, handlers);
          const latestRequest: Promise<PermissionRequestResult> = gate.request(
            (): Promise<PermissionRequestResult> => second.promise, handlers);
          const granted: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'], authResults: [0, 0]
          };
          second.resolve(granted);
          await latestRequest;
          first.resolve(granted);
          await oldRequest;
          expect(accountOperations).assertEqual(1);
          const late: Deferred<PermissionRequestResult> = new Deferred<PermissionRequestResult>();
          const invalidated: Promise<PermissionRequestResult> = gate.request(
            (): Promise<PermissionRequestResult> => late.promise, handlers);
          gate.invalidate();
          late.resolve(granted);
          await invalidated;
          expect(accountOperations).assertEqual(1);
        }
        finally {
          console.info(`${TAG} end`);
        }
      });
  });
}
