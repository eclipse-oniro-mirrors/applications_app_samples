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
import { calendarManager } from '@kit.CalendarKit';
import type { PermissionRequestResult } from '@kit.AbilityKit';
import type { AccountCalendarPort, AccountManagerPort } from '../../../main/ets/CalendarAccountSession';
import type { CalendarPermissionHandlers } from '../../../main/ets/CalendarPermission';

export class MatrixCalendar implements AccountCalendarPort {
  readonly configurations: calendarManager.CalendarConfig[] = [];
  private readonly account: calendarManager.CalendarAccount;
  failure?: Error;
  synchronous: boolean = false;

  constructor(name: string) {
    this.account = { name: name, type: calendarManager.CalendarType.LOCAL, displayName: name };
  }

  setConfig(config: calendarManager.CalendarConfig): Promise<void> {
    this.configurations.push(config);
    if (this.failure) {
      if (this.synchronous) {
        throw this.failure;
      }
      return Promise.reject(this.failure);
    }
    return Promise.resolve();
  }

  getAccount(): calendarManager.CalendarAccount {
    return this.account;
  }
}

export class MatrixManager implements AccountManagerPort {
  readonly trace: string[] = [];
  readonly creationAccounts: calendarManager.CalendarAccount[] = [];
  readonly creationHandles: AccountCalendarPort[] = [];
  readonly lookupAccounts: (calendarManager.CalendarAccount | undefined)[] = [];
  readonly deleted: AccountCalendarPort[] = [];
  readonly named: MatrixCalendar = new MatrixCalendar('named');
  readonly defaultCalendar: MatrixCalendar = new MatrixCalendar('default');
  readonly all: AccountCalendarPort[] = [this.defaultCalendar, this.named, this.defaultCalendar];
  nextCalendar: MatrixCalendar = new MatrixCalendar('seed');
  failureOn: string = '';
  readonly failure: Error = new Error('matrix port failure');
  synchronous: boolean = false;

  private reject<T>(): Promise<T> {
    if (this.synchronous) {
      throw this.failure;
    }
    return Promise.reject(this.failure);
  }

  createCalendar(account: calendarManager.CalendarAccount): Promise<AccountCalendarPort> {
    this.trace.push('create');
    this.creationAccounts.push(account);
    this.creationHandles.push(this.nextCalendar);
    return this.failureOn === 'create' ? this.reject<AccountCalendarPort>() : Promise.resolve(this.nextCalendar);
  }

  getCalendar(account?: calendarManager.CalendarAccount): Promise<AccountCalendarPort> {
    const operation: string = account ? 'named' : 'default';
    this.trace.push(operation);
    this.lookupAccounts.push(account);
    return this.failureOn === operation ? this.reject<AccountCalendarPort>() :
      Promise.resolve(account ? this.named : this.defaultCalendar);
  }

  getAllCalendars(): Promise<AccountCalendarPort[]> {
    this.trace.push('list');
    return this.failureOn === 'list' ? this.reject<AccountCalendarPort[]>() : Promise.resolve(this.all);
  }

  deleteCalendar(calendar: AccountCalendarPort): Promise<void> {
    this.trace.push('delete');
    this.deleted.push(calendar);
    return this.failureOn === 'delete' ? this.reject<void>() : Promise.resolve();
  }
}

export interface MatrixOutcome<T> {
  value?: T;
  error?: Error;
}

export class MatrixPending<T> {
  readonly promise: Promise<T>;
  resolve: (value: T) => void = (value: T): void => { };
  reject: (error: Error) => void = (error: Error): void => { };

  constructor() {
    this.promise = new Promise<T>((resolve, reject): void => {
      this.resolve = resolve;
      this.reject = reject;
    });
  }
}

export class MatrixScope {
  private readonly releases: (() => void)[] = [];
  private readonly observations: Promise<void>[] = [];

  pending<T>(fallback: T): MatrixPending<T> {
    const pending: MatrixPending<T> = new MatrixPending<T>();
    this.releases.push((): void => { pending.resolve(fallback); });
    return pending;
  }

  observe<T>(promise: Promise<T>): Promise<MatrixOutcome<T>> {
    const outcome: Promise<MatrixOutcome<T>> = promise.then((value: T): MatrixOutcome<T> => {
      return { value: value };
    }, (error: Error): MatrixOutcome<T> => {
      return { error: error };
    });
    this.observations.push(outcome.then((): void => { }));
    return outcome;
  }

  async close(): Promise<void> {
    this.releases.forEach((release: () => void): void => { release(); });
    await Promise.all(this.observations);
    this.releases.length = 0;
    this.observations.length = 0;
  }
}

export class MatrixPermissionRecorder implements CalendarPermissionHandlers {
  readonly trace: string[] = [];
  readonly granted: PermissionRequestResult[] = [];
  readonly denied: PermissionRequestResult[] = [];
  failures: number = 0;

  onGranted(result: PermissionRequestResult): void {
    this.trace.push('granted');
    this.granted.push(result);
  }

  onDenied(result: PermissionRequestResult): void {
    this.trace.push('denied');
    this.denied.push(result);
  }

  onFailed(): void {
    this.trace.push('failed');
    this.failures++;
  }
}
