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
import { CalendarPermissionGate,hasCalendarPermissions } from '../../../main/ets/CalendarPermission';
import type { CalendarPermissionHandlers } from '../../../main/ets/CalendarPermission';

interface Outcome<T> {
  value?: T;
  error?: Error;
}

let releases: (() => void)[]=[];
let completions: Promise<void>[]=[];

class Pending<T> {
  readonly promise: Promise<T>;
  resolve: (value: T) => void=(value: T): void => { };
  reject: (error: Error) => void=(error: Error): void => { };

  constructor(fallback: T) {
    this.promise=new Promise<T>((resolve,reject): void => {
      this.resolve=resolve;
      this.reject=reject;
    });
    this.promise.catch((): void => { });
    releases.push((): void => { this.resolve(fallback); });
  }
}

function observe<T>(pending: Promise<T>): Promise<Outcome<T>> {
  const result: Promise<Outcome<T>>=pending.then((value: T): Outcome<T> => {
    return { value: value };
  },(error: Error): Outcome<T> => {
    return { error: error };
  });
  completions.push(result.then((): void => { }));
  return result;
}

class ControlledCalendar implements AccountCalendarPort {
  readonly configurations: calendarManager.CalendarConfig[]=[];
  private readonly account: calendarManager.CalendarAccount;
  configPending?: Pending<void>;
  configError?: Error;

  constructor(name: string) {
    this.account={ name: name,type: calendarManager.CalendarType.LOCAL };
  }

  setConfig(config: calendarManager.CalendarConfig): Promise<void> {
    this.configurations.push(config);
    if(this.configError) {
      return Promise.reject(this.configError);
    }
    return this.configPending? this.configPending.promise:Promise.resolve();
  }

  getAccount(): calendarManager.CalendarAccount {
    return this.account;
  }
}

class ControlledManager implements AccountManagerPort {
  readonly trace: string[]=[];
  readonly accounts: calendarManager.CalendarAccount[]=[];
  readonly lookups: (calendarManager.CalendarAccount|undefined)[]=[];
  readonly deleted: AccountCalendarPort[]=[];
  created: AccountCalendarPort=new ControlledCalendar('created');
  named: ControlledCalendar=new ControlledCalendar('named');
  defaultCalendar: AccountCalendarPort=new ControlledCalendar('default');
  all: AccountCalendarPort[]=[this.named,this.defaultCalendar];
  createPending?: Pending<AccountCalendarPort>;
  lookupPending?: Pending<AccountCalendarPort>;
  listPending?: Pending<AccountCalendarPort[]>;
  deletePending?: Pending<void>;
  createError?: Error;
  lookupError?: Error;
  listError?: Error;
  deleteError?: Error;
  throwCreate: boolean=false;

  createCalendar(account: calendarManager.CalendarAccount): Promise<AccountCalendarPort> {
    this.trace.push('create');
    this.accounts.push(account);
    if(this.createError) {
      if(this.throwCreate) {
        throw this.createError;
      }
      return Promise.reject(this.createError);
    }
    return this.createPending? this.createPending.promise:Promise.resolve(this.created);
  }

  getCalendar(account?: calendarManager.CalendarAccount): Promise<AccountCalendarPort> {
    this.trace.push(account? 'get:named':'get:default');
    this.lookups.push(account);
    if(this.lookupError) {
      return Promise.reject(this.lookupError);
    }
    return this.lookupPending? this.lookupPending.promise:
      Promise.resolve(account? this.named:this.defaultCalendar);
  }

  getAllCalendars(): Promise<AccountCalendarPort[]> {
    this.trace.push('all');
    if(this.listError) {
      return Promise.reject(this.listError);
    }
    return this.listPending? this.listPending.promise:Promise.resolve(this.all);
  }

  deleteCalendar(calendar: AccountCalendarPort): Promise<void> {
    this.trace.push('delete');
    this.deleted.push(calendar);
    if(this.deleteError) {
      return Promise.reject(this.deleteError);
    }
    return this.deletePending? this.deletePending.promise:Promise.resolve();
  }
}

function permissionResult(read: number,write: number): PermissionRequestResult {
  return {
    permissions: ['ohos.permission.READ_CALENDAR','ohos.permission.WRITE_CALENDAR'],
    authResults: [read,write]
  };
}

class PermissionRecorder implements CalendarPermissionHandlers {
  readonly trace: string[]=[];
  granted?: PermissionRequestResult;
  denied?: PermissionRequestResult;

  onGranted(result: PermissionRequestResult): void {
    this.trace.push('granted');
    this.granted=result;
  }

  onDenied(result: PermissionRequestResult): void {
    this.trace.push('denied');
    this.denied=result;
  }

  onFailed(): void {
    this.trace.push('failed');
  }
}

export default function calendarManagerLifecycleTest(): void {
  describe('CalendarManagerLifecycleLogic',(): void => {
    beforeEach((): void => {
      releases=[];
      completions=[];
    });
    afterEach(async (): Promise<void> => {
      releases.forEach((release: () => void): void => { release(); });
      await Promise.all(completions);
      releases=[];
      completions=[];
    });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_CREATECALENDAR_0100
     * @tc.name testCalendarManagerCreateCalendar0001
     * @tc.desc Reject deletion during pending creation and delete the resolved owned calendar afterward.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerCreateCalendar0001',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerCreateCalendar0001';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const pending: Pending<AccountCalendarPort>=new Pending(manager.created);
          manager.createPending=pending;
          const creation: Promise<Outcome<AccountCalendarPort>>=observe(session.createCalendar());
          const deletion: Outcome<void>=await observe(session.deleteCalendar());
          expect(deletion.error?.message).assertEqual('Calendar has not been created');
          expect(manager.deleted.length).assertEqual(0);
          pending.resolve(manager.created);
          expect((await creation).value===manager.created).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[0]===manager.created).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_CREATECALENDAR_0200
     * @tc.name testCalendarManagerCreateCalendar0002
     * @tc.desc Preserve the same rejection for coalesced create requests and allow a subsequent retry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerCreateCalendar0002',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerCreateCalendar0002';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const pending: Pending<AccountCalendarPort>=new Pending(manager.created);
          manager.createPending=pending;
          const first: Promise<AccountCalendarPort>=session.createCalendar();
          const second: Promise<AccountCalendarPort>=session.createCalendar();
          const firstResult: Promise<Outcome<AccountCalendarPort>>=observe(first);
          const secondResult: Promise<Outcome<AccountCalendarPort>>=observe(second);
          const error: Error=new Error('create rejected');
          pending.reject(error);
          expect(first===second).assertEqual(true);
          expect((await firstResult).error===error).assertEqual(true);
          expect((await firstResult).error?.message).assertEqual('create rejected');
          expect((await secondResult).error===error).assertEqual(true);
          expect((await secondResult).error?.message).assertEqual('create rejected');
          expect(manager.accounts.length).assertEqual(1);
          manager.createPending=undefined;
          await session.createCalendar();
          expect(manager.accounts.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_CREATECALENDAR_0300
     * @tc.name testCalendarManagerCreateCalendar0003
     * @tc.desc Preserve a synchronous create error and allow retry followed by deletion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerCreateCalendar0003',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerCreateCalendar0003';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const expected: Error=new Error('synchronous create');
          manager.createError=expected;
          manager.throwCreate=true;
          let actual: Error|undefined=undefined;
          try {
            session.createCalendar();
          } catch(error) {
            actual=error as Error;
            expect(actual.message).assertEqual('synchronous create');
          }
          expect(actual===expected).assertEqual(true);
          manager.createError=undefined;
          await session.createCalendar();
          await session.deleteCalendar();
          expect(manager.trace.join(',')).assertEqual('create,create,delete');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_CREATECALENDAR_0400
     * @tc.name testCalendarManagerCreateCalendar0004
     * @tc.desc Start a distinct create operation after settlement and select its returned calendar for deletion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerCreateCalendar0004',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerCreateCalendar0004';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const first: Promise<AccountCalendarPort>=session.createCalendar();
          await first;
          const next: AccountCalendarPort=new ControlledCalendar('next');
          manager.created=next;
          const second: Promise<AccountCalendarPort>=session.createCalendar();
          expect(first===second).assertEqual(false);
          expect((await second)===next).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[0]===next).assertEqual(true);
          expect(manager.accounts.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_CREATECALENDAR_0500
     * @tc.name testCalendarManagerCreateCalendar0005
     * @tc.desc Retain the previously owned calendar when replacement creation rejects.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerCreateCalendar0005',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerCreateCalendar0005';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const owned: AccountCalendarPort=await session.createCalendar();
          const error: Error=new Error('replacement rejected');
          manager.createError=error;
          const replacement: Outcome<AccountCalendarPort>=await observe(session.createCalendar());
          expect(replacement.error===error).assertEqual(true);
          expect(replacement.error?.message).assertEqual('replacement rejected');
          await session.deleteCalendar();
          expect(manager.deleted[0]===owned).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_CREATECALENDAR_0600
     * @tc.name testCalendarManagerCreateCalendar0006
     * @tc.desc Keep the new pending create operation active when an obsolete generation resolves first.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerCreateCalendar0006',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerCreateCalendar0006';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const oldCalendar: AccountCalendarPort=manager.created;
          const nextCalendar: AccountCalendarPort=new ControlledCalendar('next');
          const oldGate: Pending<AccountCalendarPort>=new Pending(oldCalendar);
          const nextGate: Pending<AccountCalendarPort>=new Pending(nextCalendar);
          manager.createPending=oldGate;
          const old: Promise<Outcome<AccountCalendarPort>>=observe(session.createCalendar());
          session.clear();
          manager.createPending=nextGate;
          const next: Promise<AccountCalendarPort>=session.createCalendar();
          const nextResult: Promise<Outcome<AccountCalendarPort>>=observe(next);
          oldGate.resolve(oldCalendar);
          expect((await old).value===oldCalendar).assertEqual(true);
          expect(session.createCalendar()===next).assertEqual(true);
          nextGate.resolve(nextCalendar);
          await nextResult;
          await session.deleteCalendar();
          expect(manager.deleted[0]===nextCalendar).assertEqual(true);
          expect(manager.accounts.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_CREATECALENDAR_0700
     * @tc.name testCalendarManagerCreateCalendar0007
     * @tc.desc Preserve the new pending create operation after rejection of an obsolete generation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerCreateCalendar0007',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerCreateCalendar0007';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const oldGate: Pending<AccountCalendarPort>=new Pending(manager.created);
          const nextCalendar: AccountCalendarPort=new ControlledCalendar('next');
          const nextGate: Pending<AccountCalendarPort>=new Pending(nextCalendar);
          manager.createPending=oldGate;
          const old: Promise<Outcome<AccountCalendarPort>>=observe(session.createCalendar());
          session.clear();
          manager.createPending=nextGate;
          const next: Promise<AccountCalendarPort>=session.createCalendar();
          const nextResult: Promise<Outcome<AccountCalendarPort>>=observe(next);
          const error: Error=new Error('obsolete create');
          oldGate.reject(error);
          expect((await old).error===error).assertEqual(true);
          expect((await old).error?.message).assertEqual('obsolete create');
          expect(session.createCalendar()===next).assertEqual(true);
          nextGate.resolve(nextCalendar);
          await nextResult;
          await session.deleteCalendar();
          expect(manager.deleted[0]===nextCalendar).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_CREATECALENDAR_0800
     * @tc.name testCalendarManagerCreateCalendar0008
     * @tc.desc Keep the replacement selected when an obsolete creation resolves after replacement success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerCreateCalendar0008',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerCreateCalendar0008';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const oldCalendar: AccountCalendarPort=manager.created;
          const oldGate: Pending<AccountCalendarPort>=new Pending(oldCalendar);
          manager.createPending=oldGate;
          const old: Promise<Outcome<AccountCalendarPort>>=observe(session.createCalendar());
          session.clear();
          manager.createPending=undefined;
          const nextCalendar: AccountCalendarPort=new ControlledCalendar('next');
          manager.created=nextCalendar;
          await session.createCalendar();
          oldGate.resolve(oldCalendar);
          await old;
          await session.deleteCalendar();
          expect(manager.deleted[0]===nextCalendar).assertEqual(true);
          expect(manager.trace.join(',')).assertEqual('create,create,delete');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_CLEAR_0100
     * @tc.name testCalendarManagerClear0001
     * @tc.desc Clear ownership repeatedly without deleting calendars and allow recreation afterward.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerClear0001',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerClear0001';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          session.clear();
          session.clear();
          expect(manager.trace.length).assertEqual(0);
          await session.createCalendar();
          session.clear();
          session.clear();
          expect(manager.deleted.length).assertEqual(0);
          await session.createCalendar();
          await session.deleteCalendar();
          expect(manager.trace.join(',')).assertEqual('create,create,delete');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_DELETECALENDAR_0100
     * @tc.name testCalendarManagerDeleteCalendar0001
     * @tc.desc Keep deletion pending until port completion and reject a second deletion after ownership clears.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerDeleteCalendar0001',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerDeleteCalendar0001';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          await session.createCalendar();
          const pending: Pending<void>=new Pending<void>(undefined);
          manager.deletePending=pending;
          let completed: boolean=false;
          const deletion: Promise<Outcome<void>>=observe(session.deleteCalendar().then((): void => {
            completed=true;
          }));
          await Promise.resolve();
          expect(completed).assertEqual(false);
          expect(manager.deleted[0]===manager.created).assertEqual(true);
          pending.resolve(undefined);
          expect((await deletion).error===undefined).assertEqual(true);
          expect(completed).assertEqual(true);
          expect((await observe(session.deleteCalendar())).error?.message)
            .assertEqual('Calendar has not been created');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_DELETECALENDAR_0200
     * @tc.name testCalendarManagerDeleteCalendar0002
     * @tc.desc Preserve replacement ownership when deletion of the previous calendar completes successfully.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerDeleteCalendar0002',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerDeleteCalendar0002';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const old: AccountCalendarPort=await session.createCalendar();
          const pending: Pending<void>=new Pending<void>(undefined);
          manager.deletePending=pending;
          const deletion: Promise<Outcome<void>>=observe(session.deleteCalendar());
          const next: AccountCalendarPort=new ControlledCalendar('replacement');
          manager.created=next;
          await session.createCalendar();
          pending.resolve(undefined);
          expect((await deletion).error===undefined).assertEqual(true);
          manager.deletePending=undefined;
          await session.deleteCalendar();
          expect(manager.deleted[0]===old).assertEqual(true);
          expect(manager.deleted[1]===next).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_DELETECALENDAR_0300
     * @tc.name testCalendarManagerDeleteCalendar0003
     * @tc.desc Preserve replacement ownership and the original error when deletion of the previous calendar rejects.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerDeleteCalendar0003',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerDeleteCalendar0003';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          await session.createCalendar();
          const pending: Pending<void>=new Pending<void>(undefined);
          manager.deletePending=pending;
          const deletion: Promise<Outcome<void>>=observe(session.deleteCalendar());
          const next: AccountCalendarPort=new ControlledCalendar('replacement');
          manager.created=next;
          await session.createCalendar();
          const error: Error=new Error('old delete rejected');
          pending.reject(error);
          expect((await deletion).error===error).assertEqual(true);
          expect((await deletion).error?.message).assertEqual('old delete rejected');
          manager.deletePending=undefined;
          await session.deleteCalendar();
          expect(manager.deleted[1]===next).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_DELETECALENDAR_0400
     * @tc.name testCalendarManagerDeleteCalendar0004
     * @tc.desc Preserve ownership of a recreated generation even when it reuses the handle being deleted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerDeleteCalendar0004',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerDeleteCalendar0004';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const same: AccountCalendarPort=await session.createCalendar();
          const pending: Pending<void>=new Pending<void>(undefined);
          manager.deletePending=pending;
          const deletion: Promise<Outcome<void>>=observe(session.deleteCalendar());
          session.clear();
          await session.createCalendar();
          pending.resolve(undefined);
          expect((await deletion).error===undefined).assertEqual(true);
          manager.deletePending=undefined;
          await session.deleteCalendar();
          expect(manager.deleted.length).assertEqual(2);
          expect(manager.deleted[1]===same).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_DELETECALENDAR_0500
     * @tc.name testCalendarManagerDeleteCalendar0005
     * @tc.desc Keep ownership cleared when a pending deletion rejects after clear.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerDeleteCalendar0005',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerDeleteCalendar0005';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          await session.createCalendar();
          const pending: Pending<void>=new Pending<void>(undefined);
          manager.deletePending=pending;
          const deletion: Promise<Outcome<void>>=observe(session.deleteCalendar());
          session.clear();
          const error: Error=new Error('cleared delete rejected');
          pending.reject(error);
          expect((await deletion).error===error).assertEqual(true);
          expect((await deletion).error?.message).assertEqual('cleared delete rejected');
          expect((await observe(session.deleteCalendar())).error?.message)
            .assertEqual('Calendar has not been created');
          expect(manager.deleted.length).assertEqual(1);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SETCONFIG_0100
     * @tc.name testCalendarManagerSetConfig0001
     * @tc.desc Wait for named lookup before applying reminder and color configuration to the resolved calendar.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSetConfig0001',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerSetConfig0001';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const pending: Pending<AccountCalendarPort>=new Pending<AccountCalendarPort>(manager.named);
          manager.lookupPending=pending;
          const operation: Promise<Outcome<void>>=observe(session.setConfig());
          await Promise.resolve();
          expect(manager.named.configurations.length).assertEqual(0);
          expect(manager.trace.join(',')).assertEqual('get:named');
          pending.resolve(manager.named);
          expect((await operation).error===undefined).assertEqual(true);
          expect(manager.named.configurations.length).assertEqual(1);
          expect(manager.named.configurations[0].enableReminder).assertEqual(true);
          expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SETCONFIG_0200
     * @tc.name testCalendarManagerSetConfig0002
     * @tc.desc Wait for setter completion and propagate its rejection without reporting configuration success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSetConfig0002',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerSetConfig0002';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const pending: Pending<void>=new Pending<void>(undefined);
          manager.named.configPending=pending;
          let completed: boolean=false;
          const operation: Promise<Outcome<void>>=observe(session.setConfig().then((): void => {
            completed=true;
          }));
          await Promise.resolve();
          expect(manager.named.configurations.length).assertEqual(1);
          expect(completed).assertEqual(false);
          const error: Error=new Error('config rejected');
          pending.reject(error);
          expect((await operation).error===error).assertEqual(true);
          expect((await operation).error?.message).assertEqual('config rejected');
          expect(completed).assertEqual(false);
          expect(manager.deleted.length).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SETCONFIG_0300
     * @tc.name testCalendarManagerSetConfig0003
     * @tc.desc Retain the owned calendar through setter rejection and a successful configuration retry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSetConfig0003',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerSetConfig0003';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const owned: AccountCalendarPort=await session.createCalendar();
          const error: Error=new Error('setter failed');
          manager.named.configError=error;
          const configuration: Outcome<void>=await observe(session.setConfig());
          expect(configuration.error===error).assertEqual(true);
          expect(configuration.error?.message).assertEqual('setter failed');
          manager.named.configError=undefined;
          await session.setConfig();
          await session.deleteCalendar();
          expect(manager.named.configurations.length).assertEqual(2);
          expect(manager.deleted[0]===owned).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SETCONFIG_0400
     * @tc.name testCalendarManagerSetConfig0004
     * @tc.desc Apply concurrent configurations to their own lookup targets when lookups resolve out of order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSetConfig0004',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerSetConfig0004';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const firstCalendar: ControlledCalendar=new ControlledCalendar('first');
          const secondCalendar: ControlledCalendar=new ControlledCalendar('second');
          const firstGate: Pending<AccountCalendarPort>=new Pending<AccountCalendarPort>(firstCalendar);
          const secondGate: Pending<AccountCalendarPort>=new Pending<AccountCalendarPort>(secondCalendar);
          manager.lookupPending=firstGate;
          const first: Promise<Outcome<void>>=observe(session.setConfig());
          manager.lookupPending=secondGate;
          const second: Promise<Outcome<void>>=observe(session.setConfig());
          secondGate.resolve(secondCalendar);
          expect((await second).error===undefined).assertEqual(true);
          expect(firstCalendar.configurations.length).assertEqual(0);
          expect(secondCalendar.configurations.length).assertEqual(1);
          firstGate.resolve(firstCalendar);
          expect((await first).error===undefined).assertEqual(true);
          expect(firstCalendar.configurations.length).assertEqual(1);
          expect(firstCalendar.configurations[0]===secondCalendar.configurations[0]).assertEqual(false);
          expect(manager.trace.join(',')).assertEqual('get:named,get:named');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_CLEAR_0200
     * @tc.name testCalendarManagerClear0002
     * @tc.desc Allow an already requested configuration to complete after clear without acquiring ownership.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerClear0002',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerClear0002';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const pending: Pending<AccountCalendarPort>=new Pending<AccountCalendarPort>(manager.named);
          manager.lookupPending=pending;
          const config: Promise<Outcome<void>>=observe(session.setConfig());
          session.clear();
          pending.resolve(manager.named);
          expect((await config).error===undefined).assertEqual(true);
          expect(manager.named.configurations.length).assertEqual(1);
          expect((await observe(session.deleteCalendar())).error?.message)
            .assertEqual('Calendar has not been created');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_GETCALENDARBYPARAM_0100
     * @tc.name testCalendarManagerGetCalendarByParam0001
     * @tc.desc Propagate named and default lookup errors while preserving the created calendar for deletion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerGetCalendarByParam0001',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerGetCalendarByParam0001';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const owned: AccountCalendarPort=await session.createCalendar();
          const error: Error=new Error('query failed');
          manager.lookupError=error;
          const namedQuery: Outcome<AccountCalendarPort>=await observe(session.getCalendarByParam());
          expect(namedQuery.error===error).assertEqual(true);
          expect(namedQuery.error?.message).assertEqual('query failed');
          const defaultQuery: Outcome<AccountCalendarPort>=await observe(session.getDefaultCalendar());
          expect(defaultQuery.error===error).assertEqual(true);
          expect(defaultQuery.error?.message).assertEqual('query failed');
          await session.deleteCalendar();
          expect(manager.deleted[0]===owned).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_GETCALENDARBYPARAM_0200
     * @tc.name testCalendarManagerGetCalendarByParam0002
     * @tc.desc Use fresh named account arguments despite port mutation and omit the default lookup argument.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerGetCalendarByParam0002',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerGetCalendarByParam0002';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          await session.getCalendarByParam();
          const first: calendarManager.CalendarAccount|undefined=manager.lookups[0];
          if(!first) {
            throw new Error('Named account argument missing');
          }
          first.displayName='changed by port';
          await session.setConfig();
          await session.getDefaultCalendar();
          expect(manager.lookups[1]?.name).assertEqual('MyCalendar');
          expect(manager.lookups[1]?.displayName).assertEqual('MyCalendar');
          expect(manager.lookups[1]===first).assertEqual(false);
          expect(manager.lookups[2]===undefined).assertEqual(true);
          await session.createCalendar();
          expect(manager.accounts[0].name).assertEqual('MyCalendar');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_GETALLCALENDARS_0100
     * @tc.name testCalendarManagerGetAllCalendars0001
     * @tc.desc Return the calendar list unchanged without adopting any returned handle for deletion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerGetAllCalendars0001',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerGetAllCalendars0001';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const returned: AccountCalendarPort[]=await session.getAllCalendars();
          expect(returned===manager.all).assertEqual(true);
          expect((await observe(session.deleteCalendar())).error?.message)
            .assertEqual('Calendar has not been created');
          expect(manager.deleted.length).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_GETALLCALENDARS_0200
     * @tc.name testCalendarManagerGetAllCalendars0002
     * @tc.desc Preserve list query error identity and return the original list on a subsequent successful retry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerGetAllCalendars0002',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerGetAllCalendars0002';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const error: Error=new Error('list failed');
          manager.listError=error;
          const listing: Outcome<AccountCalendarPort[]>=await observe(session.getAllCalendars());
          expect(listing.error===error).assertEqual(true);
          expect(listing.error?.message).assertEqual('list failed');
          manager.listError=undefined;
          expect((await session.getAllCalendars())===manager.all).assertEqual(true);
          expect(manager.trace.join(',')).assertEqual('all,all');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_GETALLCALENDARS_0300
     * @tc.name testCalendarManagerGetAllCalendars0003
     * @tc.desc Preserve independent list identities when concurrent queries resolve in reverse order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerGetAllCalendars0003',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerGetAllCalendars0003';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const firstItems: AccountCalendarPort[]=[manager.named];
          const secondItems: AccountCalendarPort[]=[];
          const firstGate: Pending<AccountCalendarPort[]>=new Pending(firstItems);
          const secondGate: Pending<AccountCalendarPort[]>=new Pending(secondItems);
          manager.listPending=firstGate;
          const first: Promise<Outcome<AccountCalendarPort[]>>=observe(session.getAllCalendars());
          manager.listPending=secondGate;
          const second: Promise<Outcome<AccountCalendarPort[]>>=observe(session.getAllCalendars());
          secondGate.resolve(secondItems);
          expect((await second).value===secondItems).assertEqual(true);
          firstGate.resolve(firstItems);
          expect((await first).value===firstItems).assertEqual(true);
          expect(manager.trace.join(',')).assertEqual('all,all');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_GETDEFAULTCALENDAR_0100
     * @tc.name testCalendarManagerGetDefaultCalendar0001
     * @tc.desc Preserve created ownership when an earlier pending default lookup returns another calendar.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerGetDefaultCalendar0001',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerGetDefaultCalendar0001';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const session: CalendarAccountSession=new CalendarAccountSession(manager);
          const pending: Pending<AccountCalendarPort>=new Pending(manager.defaultCalendar);
          manager.lookupPending=pending;
          const query: Promise<Outcome<AccountCalendarPort>>=observe(session.getDefaultCalendar());
          const owned: AccountCalendarPort=await session.createCalendar();
          pending.resolve(manager.defaultCalendar);
          expect((await query).value===manager.defaultCalendar).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[0]===owned).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_CREATECALENDAR_0900
     * @tc.name testCalendarManagerCreateCalendar0009
     * @tc.desc Keep independent created ownership for two sessions sharing the same manager port.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerCreateCalendar0009',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerCreateCalendar0009';
        console.info(`${TAG} start`);
        try {
          const manager: ControlledManager=new ControlledManager();
          const first: CalendarAccountSession=new CalendarAccountSession(manager);
          const second: CalendarAccountSession=new CalendarAccountSession(manager);
          const firstCalendar: AccountCalendarPort=await first.createCalendar();
          const secondCalendar: AccountCalendarPort=new ControlledCalendar('second');
          manager.created=secondCalendar;
          await second.createCalendar();
          await first.deleteCalendar();
          await second.deleteCalendar();
          expect(manager.deleted[0]===firstCalendar).assertEqual(true);
          expect(manager.deleted[1]===secondCalendar).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_HASCALENDARPERMISSIONS_0100
     * @tc.name testCalendarManagerHasCalendarPermissions0001
     * @tc.desc Reject nonzero and nonfinite authorization codes when checking the required permission pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerHasCalendarPermissions0001',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerHasCalendarPermissions0001';
        console.info(`${TAG} start`);
        try {
          expect(hasCalendarPermissions(permissionResult(1,0))).assertEqual(false);
          expect(hasCalendarPermissions(permissionResult(0,1))).assertEqual(false);
          expect(hasCalendarPermissions(permissionResult(NaN,0))).assertEqual(false);
          expect(hasCalendarPermissions(permissionResult(0,Infinity))).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_HASCALENDARPERMISSIONS_0200
     * @tc.name testCalendarManagerHasCalendarPermissions0002
     * @tc.desc Reject an extra permission entry and an extra authorization code independently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerHasCalendarPermissions0002',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerHasCalendarPermissions0002';
        console.info(`${TAG} start`);
        try {
          const extraPermission: PermissionRequestResult=permissionResult(0,0);
          extraPermission.permissions.push('ohos.permission.READ_CALENDAR');
          extraPermission.authResults.push(0);
          expect(hasCalendarPermissions(extraPermission)).assertEqual(false);
          const extraCode: PermissionRequestResult=permissionResult(0,0);
          extraCode.authResults.push(0);
          expect(hasCalendarPermissions(extraCode)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_HASCALENDARPERMISSIONS_0300
     * @tc.name testCalendarManagerHasCalendarPermissions0003
     * @tc.desc Require exact permission names and reject case changes, trailing whitespace, and empty names.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerHasCalendarPermissions0003',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerHasCalendarPermissions0003';
        console.info(`${TAG} start`);
        try {
          const wrongCase: PermissionRequestResult=permissionResult(0,0);
          wrongCase.permissions[0]='ohos.permission.read_calendar';
          expect(hasCalendarPermissions(wrongCase)).assertEqual(false);
          const whitespace: PermissionRequestResult=permissionResult(0,0);
          whitespace.permissions[1]='ohos.permission.WRITE_CALENDAR ';
          expect(hasCalendarPermissions(whitespace)).assertEqual(false);
          const emptyName: PermissionRequestResult=permissionResult(0,0);
          emptyName.permissions[0]='';
          expect(hasCalendarPermissions(emptyName)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_HASCALENDARPERMISSIONS_0400
     * @tc.name testCalendarManagerHasCalendarPermissions0004
     * @tc.desc Reject a denied write permission in reversed order without mutating permission names or codes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerHasCalendarPermissions0004',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerHasCalendarPermissions0004';
        console.info(`${TAG} start`);
        try {
          const reversed: PermissionRequestResult={
            permissions: ['ohos.permission.WRITE_CALENDAR','ohos.permission.READ_CALENDAR'],
            authResults: [-1,0]
          };
          expect(hasCalendarPermissions(reversed)).assertEqual(false);
          expect(reversed.permissions.join(','))
            .assertEqual('ohos.permission.WRITE_CALENDAR,ohos.permission.READ_CALENDAR');
          expect(reversed.authResults.join(',')).assertEqual('-1,0');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_REQUEST_0100
     * @tc.name testCalendarManagerRequest0001
     * @tc.desc Emit no callbacks while a permission request is pending and deliver the exact granted result afterward.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRequest0001',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerRequest0001';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate=new CalendarPermissionGate();
          const handlers: PermissionRecorder=new PermissionRecorder();
          const granted: PermissionRequestResult=permissionResult(0,0);
          const pending: Pending<PermissionRequestResult>=new Pending(granted);
          const request: Promise<Outcome<PermissionRequestResult>>=
            observe(gate.request(() => pending.promise,handlers));
          await Promise.resolve();
          expect(handlers.trace.length).assertEqual(0);
          pending.resolve(granted);
          expect((await request).value===granted).assertEqual(true);
          expect(handlers.granted===granted).assertEqual(true);
          expect(handlers.trace.join(',')).assertEqual('granted');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_REQUEST_0200
     * @tc.name testCalendarManagerRequest0002
     * @tc.desc Deliver the latest denial and suppress callbacks for an earlier request that later grants.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRequest0002',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerRequest0002';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate=new CalendarPermissionGate();
          const oldHandlers: PermissionRecorder=new PermissionRecorder();
          const nextHandlers: PermissionRecorder=new PermissionRecorder();
          const granted: PermissionRequestResult=permissionResult(0,0);
          const denied: PermissionRequestResult=permissionResult(-1,-1);
          const pending: Pending<PermissionRequestResult>=new Pending(granted);
          const old: Promise<Outcome<PermissionRequestResult>>=
            observe(gate.request(() => pending.promise,oldHandlers));
          expect((await gate.request(() => Promise.resolve(denied),nextHandlers))===denied).assertEqual(true);
          pending.resolve(granted);
          expect((await old).value===granted).assertEqual(true);
          expect(oldHandlers.trace.length).assertEqual(0);
          expect(nextHandlers.denied===denied).assertEqual(true);
          expect(nextHandlers.trace.join(',')).assertEqual('denied');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_REQUEST_0300
     * @tc.name testCalendarManagerRequest0003
     * @tc.desc Preserve an obsolete request rejection without emitting failure callbacks after the latest grant.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRequest0003',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerRequest0003';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate=new CalendarPermissionGate();
          const oldHandlers: PermissionRecorder=new PermissionRecorder();
          const nextHandlers: PermissionRecorder=new PermissionRecorder();
          const granted: PermissionRequestResult=permissionResult(0,0);
          const pending: Pending<PermissionRequestResult>=new Pending(granted);
          const old: Promise<Outcome<PermissionRequestResult>>=
            observe(gate.request(() => pending.promise,oldHandlers));
          await gate.request(() => Promise.resolve(granted),nextHandlers);
          const error: Error=new Error('obsolete permission failure');
          pending.reject(error);
          expect((await old).error===error).assertEqual(true);
          expect((await old).error?.message).assertEqual('obsolete permission failure');
          expect(oldHandlers.trace.length).assertEqual(0);
          expect(nextHandlers.trace.join(',')).assertEqual('granted');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_REQUEST_0400
     * @tc.name testCalendarManagerRequest0004
     * @tc.desc Report the latest request failure and suppress callbacks for an earlier request that later denies.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRequest0004',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerRequest0004';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate=new CalendarPermissionGate();
          const oldHandlers: PermissionRecorder=new PermissionRecorder();
          const nextHandlers: PermissionRecorder=new PermissionRecorder();
          const denied: PermissionRequestResult=permissionResult(0,-1);
          const pending: Pending<PermissionRequestResult>=new Pending(denied);
          const old: Promise<Outcome<PermissionRequestResult>>=
            observe(gate.request(() => pending.promise,oldHandlers));
          const error: Error=new Error('latest permission failure');
          const next: Outcome<PermissionRequestResult>=
            await observe(gate.request(() => Promise.reject(error),nextHandlers));
          expect(next.error===error).assertEqual(true);
          expect(next.error?.message).assertEqual('latest permission failure');
          pending.resolve(denied);
          expect((await old).value===denied).assertEqual(true);
          expect(oldHandlers.trace.length).assertEqual(0);
          expect(nextHandlers.trace.join(',')).assertEqual('failed');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_REQUEST_0500
     * @tc.name testCalendarManagerRequest0005
     * @tc.desc Preserve the rejection of an invalidated request without invoking its handlers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRequest0005',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerRequest0005';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate=new CalendarPermissionGate();
          const handlers: PermissionRecorder=new PermissionRecorder();
          const pending: Pending<PermissionRequestResult>=new Pending(permissionResult(0,0));
          const request: Promise<Outcome<PermissionRequestResult>>=
            observe(gate.request(() => pending.promise,handlers));
          gate.invalidate();
          const error: Error=new Error('destroyed permission request');
          pending.reject(error);
          expect((await request).error===error).assertEqual(true);
          expect((await request).error?.message).assertEqual('destroyed permission request');
          expect(handlers.trace.length).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_INVALIDATE_0100
     * @tc.name testCalendarManagerInvalidate0001
     * @tc.desc Keep a new request active after repeated invalidation while suppressing the older request callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerInvalidate0001',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerInvalidate0001';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate=new CalendarPermissionGate();
          const oldHandlers: PermissionRecorder=new PermissionRecorder();
          const nextHandlers: PermissionRecorder=new PermissionRecorder();
          const granted: PermissionRequestResult=permissionResult(0,0);
          const pending: Pending<PermissionRequestResult>=new Pending(granted);
          const old: Promise<Outcome<PermissionRequestResult>>=
            observe(gate.request(() => pending.promise,oldHandlers));
          gate.invalidate();
          gate.invalidate();
          await gate.request(() => Promise.resolve(granted),nextHandlers);
          pending.resolve(granted);
          await old;
          expect(oldHandlers.trace.length).assertEqual(0);
          expect(nextHandlers.trace.join(',')).assertEqual('granted');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_REQUEST_0600
     * @tc.name testCalendarManagerRequest0006
     * @tc.desc Convert a synchronous requester throw into rejection and allow a later request to grant.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRequest0006',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerRequest0006';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate=new CalendarPermissionGate();
          const handlers: PermissionRecorder=new PermissionRecorder();
          const error: Error=new Error('requester threw');
          const result: Outcome<PermissionRequestResult>=
            await observe(gate.request((): Promise<PermissionRequestResult> => {
              throw error;
            },handlers));
          expect(result.error===error).assertEqual(true);
          expect(result.error?.message).assertEqual('requester threw');
          expect(handlers.trace.join(',')).assertEqual('failed');
          await gate.request(() => Promise.resolve(permissionResult(0,0)),handlers);
          expect(handlers.trace.join(',')).assertEqual('failed,granted');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_INVALIDATE_0200
     * @tc.name testCalendarManagerInvalidate0002
     * @tc.desc Suppress handlers when a requester invalidates its own generation before resolving.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerInvalidate0002',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerInvalidate0002';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate=new CalendarPermissionGate();
          const handlers: PermissionRecorder=new PermissionRecorder();
          const granted: PermissionRequestResult=permissionResult(0,0);
          const result: PermissionRequestResult=await gate.request((): Promise<PermissionRequestResult> => {
            gate.invalidate();
            return Promise.resolve(granted);
          },handlers);
          expect(result===granted).assertEqual(true);
          expect(handlers.trace.length).assertEqual(0);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_REQUEST_0700
     * @tc.name testCalendarManagerRequest0007
     * @tc.desc Keep requests on separate gates independent when one gate invalidates and then denies.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRequest0007',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerRequest0007';
        console.info(`${TAG} start`);
        try {
          const first: CalendarPermissionGate=new CalendarPermissionGate();
          const second: CalendarPermissionGate=new CalendarPermissionGate();
          const firstHandlers: PermissionRecorder=new PermissionRecorder();
          const secondHandlers: PermissionRecorder=new PermissionRecorder();
          const granted: PermissionRequestResult=permissionResult(0,0);
          const pending: Pending<PermissionRequestResult>=new Pending(granted);
          const request: Promise<Outcome<PermissionRequestResult>>=observe(second.request(() => pending.promise,
            secondHandlers));
          first.invalidate();
          await first.request(() => Promise.resolve(permissionResult(-1,0)),firstHandlers);
          pending.resolve(granted);
          await request;
          expect(firstHandlers.trace.join(',')).assertEqual('denied');
          expect(secondHandlers.trace.join(',')).assertEqual('granted');
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_REQUEST_0800
     * @tc.name testCalendarManagerRequest0008
     * @tc.desc Deliver consecutive denial and grant results to reused handlers without returning stale results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRequest0008',
      TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (): Promise<void> => {
        const TAG: string='testCalendarManagerRequest0008';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate=new CalendarPermissionGate();
          const handlers: PermissionRecorder=new PermissionRecorder();
          const denied: PermissionRequestResult=permissionResult(0,-1);
          const granted: PermissionRequestResult=permissionResult(0,0);
          expect((await gate.request(() => Promise.resolve(denied),handlers))===denied).assertEqual(true);
          expect((await gate.request(() => Promise.resolve(granted),handlers))===granted).assertEqual(true);
          expect(handlers.trace.join(',')).assertEqual('denied,granted');
          expect(handlers.denied===denied).assertEqual(true);
          expect(handlers.granted===granted).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });
  });
}
