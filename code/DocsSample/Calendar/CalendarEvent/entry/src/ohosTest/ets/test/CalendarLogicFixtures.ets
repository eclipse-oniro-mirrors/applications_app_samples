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
import type { EventCalendarPort, EventManagerPort } from '../../../main/ets/CalendarEventSession';

export class Pending<T> {
  promise: Promise<T>;
  resolve: (value: T) => void = (value: T): void => {};
  reject: (error: Error) => void = (error: Error): void => {};

  constructor() {
    this.promise = new Promise<T>((resolve, reject) => {
      this.resolve = resolve;
      this.reject = reject;
    });
  }
}

/** Captures the rejection value without masking unexpected success. */
export async function captureFailure<T>(action: () => T | Promise<T>): Promise<Error | undefined> {
  try {
    await action();
    return undefined;
  } catch (error) {
    return error as Error;
  }
}

/** Builds an isolated one-hour normal event fixture. */
export function fixtureEvent(id: number, title: string, time: number): calendarManager.Event {
  return {
    id: id,
    title: title,
    type: calendarManager.EventType.NORMAL,
    startTime: time,
    endTime: time + 3600000
  };
}

export class CalendarProbe implements EventCalendarPort {
  trace: string[] = [];
  configs: calendarManager.CalendarConfig[] = [];
  additions: calendarManager.Event[] = [];
  updates: calendarManager.Event[] = [];
  ids: number[] = [];
  titles: string[] = [];
  starts: number[] = [];
  ends: number[] = [];
  deletions: number[] = [];
  nextId: number = 0;
  results: calendarManager.Event[] = [];
  idResults: calendarManager.Event[] = [];
  titleResults: calendarManager.Event[] = [];
  timeResults: calendarManager.Event[] = [];
  failMethod: string = '';
  synchronous: boolean = false;
  error: Error = new Error('calendar operation failed');
  configQueue: Pending<void>[] = [];
  addQueue: Pending<number>[] = [];
  updateQueue: Pending<void>[] = [];
  allQueue: Pending<calendarManager.Event[]>[] = [];
  idQueue: Pending<calendarManager.Event[]>[] = [];
  titleQueue: Pending<calendarManager.Event[]>[] = [];
  timeQueue: Pending<calendarManager.Event[]>[] = [];
  deleteQueue: Pending<void>[] = [];

  private failure<T>(method: string): Promise<T> | undefined {
    if (this.failMethod !== method) {
      return undefined;
    }
    if (this.synchronous) {
      throw this.error;
    }
    return Promise.reject(this.error);
  }

  setConfig(config: calendarManager.CalendarConfig): Promise<void> {
    this.trace.push('config');
    this.configs.push(config);
    return this.failure<void>('config') || this.configQueue.shift()?.promise || Promise.resolve();
  }

  addEvent(event: calendarManager.Event): Promise<number> {
    this.trace.push('add');
    this.additions.push(event);
    return this.failure<number>('add') || this.addQueue.shift()?.promise || Promise.resolve(this.nextId);
  }

  updateEvent(event: calendarManager.Event): Promise<void> {
    this.trace.push('update');
    this.updates.push(event);
    return this.failure<void>('update') || this.updateQueue.shift()?.promise || Promise.resolve();
  }

  getEvents(): Promise<calendarManager.Event[]> {
    this.trace.push('all');
    return this.failure<calendarManager.Event[]>('all') || this.allQueue.shift()?.promise ||
      Promise.resolve(this.results);
  }

  getById(id: number): Promise<calendarManager.Event[]> {
    this.trace.push('id');
    this.ids.push(id);
    return this.failure<calendarManager.Event[]>('id') || this.idQueue.shift()?.promise ||
      Promise.resolve(this.idResults);
  }

  getByTitle(title: string): Promise<calendarManager.Event[]> {
    this.trace.push('title');
    this.titles.push(title);
    return this.failure<calendarManager.Event[]>('title') || this.titleQueue.shift()?.promise ||
      Promise.resolve(this.titleResults);
  }

  getByTime(start: number, end: number): Promise<calendarManager.Event[]> {
    this.trace.push('time');
    this.starts.push(start);
    this.ends.push(end);
    return this.failure<calendarManager.Event[]>('time') || this.timeQueue.shift()?.promise ||
      Promise.resolve(this.timeResults);
  }

  deleteEvent(id: number): Promise<void> {
    this.trace.push('delete');
    this.deletions.push(id);
    return this.failure<void>('delete') || this.deleteQueue.shift()?.promise || Promise.resolve();
  }
}

export class ManagerProbe implements EventManagerPort {
  calendar: CalendarProbe = new CalendarProbe();
  accounts: calendarManager.CalendarAccount[] = [];
  edits: calendarManager.Event[] = [];
  failMethod: string = '';
  synchronous: boolean = false;
  error: Error = new Error('manager operation failed');
  editId: number = 91;
  createQueue: Pending<EventCalendarPort>[] = [];
  editQueue: Pending<number>[] = [];

  createCalendar(account: calendarManager.CalendarAccount): Promise<EventCalendarPort> {
    this.accounts.push(account);
    if (this.failMethod === 'create') {
      if (this.synchronous) {
        throw this.error;
      }
      return Promise.reject(this.error);
    }
    return this.createQueue.shift()?.promise || Promise.resolve(this.calendar);
  }

  editEvent(event: calendarManager.Event): Promise<number> {
    this.edits.push(event);
    if (this.failMethod === 'edit') {
      if (this.synchronous) {
        throw this.error;
      }
      return Promise.reject(this.error);
    }
    return this.editQueue.shift()?.promise || Promise.resolve(this.editId);
  }
}
