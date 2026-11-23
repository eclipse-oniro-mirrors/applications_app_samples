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
import { afterEach,beforeEach,describe,it,Level,Size,TestType } from '@ohos/hypium';
import { calendarManager } from '@kit.CalendarKit';
import type { PermissionRequestResult } from '@kit.AbilityKit';
import { expect } from './TestSupport';
import { CalendarAccountSession } from '../../../main/ets/CalendarAccountSession';
import type { AccountCalendarPort,AccountManagerPort } from '../../../main/ets/CalendarAccountSession';
import { CalendarPermissionGate } from '../../../main/ets/CalendarPermission';

let cleanups: (() => void)[]=[];
let observations: Promise<void>[]=[];

class BoundaryPending<T> {
  readonly promise: Promise<T>;
  resolve: (value: T) => void=(value: T): void => { };
  reject: (reason: Error) => void=(reason: Error): void => { };

  constructor(fallback: T) {
    this.promise=new Promise<T>((resolve,reject): void => {
      this.resolve=resolve;
      this.reject=reject;
    });
    this.promise.catch((): void => { });
    cleanups.push((): void => { this.resolve(fallback); });
  }
}

function rejectionOf<T>(pending: Promise<T>): Promise<Error|undefined> {
  const result: Promise<Error|undefined>=pending.then((): undefined => undefined,
    (error: Error): Error => error);
  observations.push(result.then((): void => { }));
  return result;
}

class BoundaryCalendar implements AccountCalendarPort {
  readonly configurations: calendarManager.CalendarConfig[]=[];
  setterError?: Error;
  private readonly account: calendarManager.CalendarAccount={
    name: 'boundary',type: calendarManager.CalendarType.LOCAL
  };

  setConfig(config: calendarManager.CalendarConfig): Promise<void> {
    this.configurations.push(config);
    if(this.setterError) {
      throw this.setterError;
    }
    return Promise.resolve();
  }

  getAccount(): calendarManager.CalendarAccount {
    return this.account;
  }
}

class BoundaryManager implements AccountManagerPort {
  readonly trace: string[]=[];
  readonly deleted: AccountCalendarPort[]=[];
  readonly failure: Error=new Error('synchronous boundary failure');
  readonly named: BoundaryCalendar=new BoundaryCalendar();
  created: AccountCalendarPort=new BoundaryCalendar();
  throwOn: string='';
  creation?: BoundaryPending<AccountCalendarPort>;
  deletion?: BoundaryPending<void>;
  lookup?: BoundaryPending<AccountCalendarPort>;

  createCalendar(account: calendarManager.CalendarAccount): Promise<AccountCalendarPort> {
    this.trace.push(`create:${account.name}`);
    return this.creation? this.creation.promise:Promise.resolve(this.created);
  }

  getCalendar(account?: calendarManager.CalendarAccount): Promise<AccountCalendarPort> {
    this.trace.push(account? 'named':'default');
    if(this.throwOn==='lookup') {
      throw this.failure;
    }
    return this.lookup? this.lookup.promise:Promise.resolve(this.named);
  }

  getAllCalendars(): Promise<AccountCalendarPort[]> {
    this.trace.push('list');
    if(this.throwOn==='list') {
      throw this.failure;
    }
    return Promise.resolve([this.named]);
  }

  deleteCalendar(calendar: AccountCalendarPort): Promise<void> {
    this.deleted.push(calendar);
    this.trace.push('delete');
    if(this.throwOn==='delete') {
      throw this.failure;
    }
    return this.deletion? this.deletion.promise:Promise.resolve();
  }
}

export default function calendarManagerErrorBoundaryTest(): void {
  describe('CalendarManagerErrorBoundaryLogic',(): void => {
    beforeEach((): void => {
      cleanups=[];
      observations=[];
    });
    afterEach(async (): Promise<void> => {
      cleanups.forEach((cleanup: () => void): void => { cleanup(); });
      await Promise.all(observations);
      cleanups=[];
      observations=[];
    });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_NAMED_QUERY_0100
     * @tc.name testCalendarManagerSyncNamedQuery0001
     * @tc.desc Preserve a synchronous named-query error without issuing a default query.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSyncNamedQuery0001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerSyncNamedQuery0001';
        console.info(`${TAG} start`);
        try {
          const manager: BoundaryManager=new BoundaryManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          manager.throwOn='lookup';
          let rejected: boolean=false;
          try {
            session.getCalendarByParam();
          } catch(error) {
            rejected=true;
            expect((error as Error).message).assertEqual('synchronous boundary failure');
            expect(error===manager.failure).assertEqual(true);
          }
          expect(rejected).assertEqual(true);
          expect(manager.trace.join(',')).assertEqual('named');
          manager.throwOn='';
          expect(await session.getCalendarByParam()===manager.named).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_DEFAULT_QUERY_0100
     * @tc.name testCalendarManagerSyncDefaultQuery0001
     * @tc.desc Preserve a synchronous default-query error and retain the created handle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSyncDefaultQuery0001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerSyncDefaultQuery0001';
        console.info(`${TAG} start`);
        try {
          const manager: BoundaryManager=new BoundaryManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const owned: AccountCalendarPort=await session.createCalendar();
          manager.throwOn='lookup';
          let rejected: boolean=false;
          try {
            session.getDefaultCalendar();
          } catch(error) {
            rejected=true;
            expect((error as Error).message).assertEqual('synchronous boundary failure');
            expect(error===manager.failure).assertEqual(true);
          }
          expect(rejected).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[0]===owned).assertEqual(true);
          expect(manager.trace.join(',')).assertEqual('create:MyCalendar,default,delete');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_LIST_QUERY_0100
     * @tc.name testCalendarManagerSyncListQuery0001
     * @tc.desc Preserve a synchronous list-query error and allow a subsequent query.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSyncListQuery0001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerSyncListQuery0001';
        console.info(`${TAG} start`);
        try {
          const manager: BoundaryManager=new BoundaryManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          manager.throwOn='list';
          let rejected: boolean=false;
          try {
            session.getAllCalendars();
          } catch(error) {
            rejected=true;
            expect((error as Error).message).assertEqual('synchronous boundary failure');
            expect(error===manager.failure).assertEqual(true);
          }
          expect(rejected).assertEqual(true);
          manager.throwOn='';
          expect((await session.getAllCalendars())[0]===manager.named).assertEqual(true);
          expect(manager.trace.join(',')).assertEqual('list,list');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_CONFIG_LOOKUP_0100
     * @tc.name testCalendarManagerSyncConfigLookup0001
     * @tc.desc Reject configuration when lookup throws synchronously without invoking the setter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSyncConfigLookup0001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerSyncConfigLookup0001';
        console.info(`${TAG} start`);
        try {
          const manager: BoundaryManager=new BoundaryManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          manager.throwOn='lookup';
          let rejected: boolean=false;
          try {
            await session.setConfig();
          } catch(error) {
            rejected=true;
            expect((error as Error).message).assertEqual('synchronous boundary failure');
            expect(error===manager.failure).assertEqual(true);
          }
          expect(rejected).assertEqual(true);
          expect(manager.named.configurations.length).assertEqual(0);
          expect(manager.trace.join(',')).assertEqual('named');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_CONFIG_SETTER_0100
     * @tc.name testCalendarManagerSyncConfigSetter0001
     * @tc.desc Reject a synchronous setter failure without losing the owned calendar.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSyncConfigSetter0001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerSyncConfigSetter0001';
        console.info(`${TAG} start`);
        try {
          const manager: BoundaryManager=new BoundaryManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const owned: AccountCalendarPort=await session.createCalendar();
          manager.named.setterError=manager.failure;
          let rejected: boolean=false;
          try {
            await session.setConfig();
          } catch(error) {
            rejected=true;
            expect((error as Error).message).assertEqual('synchronous boundary failure');
            expect(error===manager.failure).assertEqual(true);
          }
          expect(rejected).assertEqual(true);
          expect(manager.named.configurations.length).assertEqual(1);
          await session.deleteCalendar();
          expect(manager.deleted[0]===owned).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_DELETE_0100
     * @tc.name testCalendarManagerSyncDelete0001
     * @tc.desc Retain ownership after a synchronous deletion failure and retry the same handle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSyncDelete0001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerSyncDelete0001';
        console.info(`${TAG} start`);
        try {
          const manager: BoundaryManager=new BoundaryManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const owned: AccountCalendarPort=await session.createCalendar();
          manager.throwOn='delete';
          let rejected: boolean=false;
          try {
            await session.deleteCalendar();
          } catch(error) {
            rejected=true;
            expect((error as Error).message).assertEqual('synchronous boundary failure');
            expect(error===manager.failure).assertEqual(true);
          }
          expect(rejected).assertEqual(true);
          manager.throwOn='';
          await session.deleteCalendar();
          expect(manager.deleted.length).assertEqual(2);
          expect(manager.deleted[0]===owned&&manager.deleted[1]===owned).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_PENDING_REPLACEMENT_0100
     * @tc.name testCalendarManagerPendingReplacement0001
     * @tc.desc Adopt a pending replacement after deletion of the previous handle completes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPendingReplacement0001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerPendingReplacement0001';
        console.info(`${TAG} start`);
        try {
          const manager: BoundaryManager=new BoundaryManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const old: AccountCalendarPort=await session.createCalendar();
          const replacement: AccountCalendarPort=new BoundaryCalendar();
          const pending: BoundaryPending<AccountCalendarPort>=new BoundaryPending(replacement);
          manager.creation=pending;
          const creation: Promise<AccountCalendarPort>=session.createCalendar();
          const creationError: Promise<Error|undefined>=rejectionOf(creation);
          await session.deleteCalendar();
          expect(manager.deleted[0]===old).assertEqual(true);
          pending.resolve(replacement);
          expect(await creationError===undefined).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1]===replacement).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_PENDING_REPLACEMENT_0200
     * @tc.name testCalendarManagerPendingReplacement0002
     * @tc.desc A failed pending replacement cannot restore an already deleted handle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPendingReplacement0002',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerPendingReplacement0002';
        console.info(`${TAG} start`);
        try {
          const manager: BoundaryManager=new BoundaryManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          await session.createCalendar();
          const pending: BoundaryPending<AccountCalendarPort>=new BoundaryPending(manager.created);
          manager.creation=pending;
          const creation: Promise<Error|undefined>=rejectionOf(session.createCalendar());
          await session.deleteCalendar();
          pending.reject(manager.failure);
          const error: Error|undefined=await creation;
          expect(error===manager.failure).assertEqual(true);
          expect(error?.message).assertEqual('synchronous boundary failure');
          expect((await rejectionOf(session.deleteCalendar()))?.message)
            .assertEqual('Calendar has not been created');
          expect(manager.deleted.length).assertEqual(1);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_OVERLAPPING_DELETE_0100
     * @tc.name testCalendarManagerOverlappingDelete0001
     * @tc.desc A late rejected deletion cannot restore ownership removed by another successful deletion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerOverlappingDelete0001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerOverlappingDelete0001';
        console.info(`${TAG} start`);
        try {
          const manager: BoundaryManager=new BoundaryManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const owned: AccountCalendarPort=await session.createCalendar();
          const first: BoundaryPending<void>=new BoundaryPending<void>(undefined);
          const second: BoundaryPending<void>=new BoundaryPending<void>(undefined);
          manager.deletion=first;
          const firstError: Promise<Error|undefined>=rejectionOf(session.deleteCalendar());
          manager.deletion=second;
          const secondError: Promise<Error|undefined>=rejectionOf(session.deleteCalendar());
          second.resolve(undefined);
          expect(await secondError===undefined).assertEqual(true);
          first.reject(manager.failure);
          const error: Error|undefined=await firstError;
          expect(error===manager.failure).assertEqual(true);
          expect(error?.message).assertEqual('synchronous boundary failure');
          expect((await rejectionOf(session.deleteCalendar()))?.message)
            .assertEqual('Calendar has not been created');
          expect(manager.deleted.length).assertEqual(2);
          expect(manager.deleted[0]===owned&&manager.deleted[1]===owned).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_PENDING_CREATE_QUERY_0100
     * @tc.name testCalendarManagerPendingCreateQuery0001
     * @tc.desc A synchronous query failure cannot cancel a pending creation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPendingCreateQuery0001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerPendingCreateQuery0001';
        console.info(`${TAG} start`);
        try {
          const manager: BoundaryManager=new BoundaryManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const pending: BoundaryPending<AccountCalendarPort>=new BoundaryPending(manager.created);
          manager.creation=pending;
          const creation: Promise<AccountCalendarPort>=session.createCalendar();
          const result: Promise<Error|undefined>=rejectionOf(creation);
          manager.throwOn='lookup';
          let rejected: boolean=false;
          try {
            session.getCalendarByParam();
          } catch(error) {
            rejected=true;
            expect((error as Error).message).assertEqual('synchronous boundary failure');
          }
          expect(rejected).assertEqual(true);
          expect(session.createCalendar()===creation).assertEqual(true);
          pending.resolve(manager.created);
          expect(await result===undefined).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[0]===manager.created).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_CONFIG_ISOLATION_0100
     * @tc.name testCalendarManagerConfigFailureIsolation0001
     * @tc.desc A late setter failure does not alter the target or outcome of a newer configuration request.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerConfigFailureIsolation0001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerConfigFailureIsolation0001';
        console.info(`${TAG} start`);
        try {
          const manager: BoundaryManager=new BoundaryManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const failedCalendar: BoundaryCalendar=new BoundaryCalendar();
          failedCalendar.setterError=manager.failure;
          const pending: BoundaryPending<AccountCalendarPort>=
            new BoundaryPending<AccountCalendarPort>(failedCalendar);
          manager.lookup=pending;
          const first: Promise<Error|undefined>=rejectionOf(session.setConfig());
          manager.lookup=undefined;
          await session.setConfig();
          expect(manager.named.configurations.length).assertEqual(1);
          pending.resolve(failedCalendar);
          const error: Error|undefined=await first;
          expect(error===manager.failure).assertEqual(true);
          expect(error?.message).assertEqual('synchronous boundary failure');
          expect(failedCalendar.configurations.length).assertEqual(1);
          expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
          expect(manager.named.configurations.length).assertEqual(1);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_BOUNDARY_PERMISSION_ORDER_0100
     * @tc.name testCalendarManagerPermissionInitiationOrder0001
     * @tc.desc Starting a new permission request suppresses an old denial before the new request resolves.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermissionInitiationOrder0001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string='testCalendarManagerPermissionInitiationOrder0001';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate=new CalendarPermissionGate();
          const trace: string[]=[];
          const granted: PermissionRequestResult={
            permissions: ['ohos.permission.READ_CALENDAR','ohos.permission.WRITE_CALENDAR'],authResults: [0,0]
          };
          const denied: PermissionRequestResult={
            permissions: ['ohos.permission.READ_CALENDAR','ohos.permission.WRITE_CALENDAR'],authResults: [-1,0]
          };
          const first: BoundaryPending<PermissionRequestResult>=new BoundaryPending(denied);
          const second: BoundaryPending<PermissionRequestResult>=new BoundaryPending(granted);
          const old: Promise<Error|undefined>=rejectionOf(gate.request(() => first.promise,{
            onGranted: (): void => { trace.push('old granted'); },
            onDenied: (): void => { trace.push('old denied'); },
            onFailed: (): void => { trace.push('old failed'); }
          }));
          const next: Promise<Error|undefined>=rejectionOf(gate.request(() => second.promise,{
            onGranted: (): void => { trace.push('new granted'); },
            onDenied: (): void => { trace.push('new denied'); },
            onFailed: (): void => { trace.push('new failed'); }
          }));
          first.resolve(denied);
          expect(await old===undefined).assertEqual(true);
          expect(trace.length).assertEqual(0);
          second.resolve(granted);
          expect(await next===undefined).assertEqual(true);
          expect(trace.join(',')).assertEqual('new granted');
        } finally {
          console.info(`${TAG} end`);
        }
      });
  });
}
