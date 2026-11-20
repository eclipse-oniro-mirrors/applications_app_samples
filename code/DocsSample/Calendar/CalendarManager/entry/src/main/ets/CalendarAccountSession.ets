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

export interface AccountCalendarPort {
  setConfig(config: calendarManager.CalendarConfig): Promise<void>;
  getAccount(): calendarManager.CalendarAccount;
}

export interface AccountManagerPort {
  createCalendar(account: calendarManager.CalendarAccount): Promise<AccountCalendarPort>;
  getCalendar(account?: calendarManager.CalendarAccount): Promise<AccountCalendarPort>;
  getAllCalendars(): Promise<AccountCalendarPort[]>;
  deleteCalendar(calendar: AccountCalendarPort): Promise<void>;
}

/** Calendar account lifecycle; selected handles are never fabricated. */
export class CalendarAccountSession {
  private manager: AccountManagerPort;
  private selected?: AccountCalendarPort;
  private generation: number = 0;
  private creationSequence: number = 0;
  private creating?: Promise<AccountCalendarPort>;
  constructor(manager: AccountManagerPort) { this.manager = manager; }

  static account(): calendarManager.CalendarAccount {
    return { name: 'MyCalendar', type: calendarManager.CalendarType.LOCAL, displayName: 'MyCalendar' };
  }

  /** Coalesce a double click and let the latest initiated creation own selection. */
  createCalendar(): Promise<AccountCalendarPort> {
    if (this.creating) { return this.creating; }
    const generation: number = this.generation;
    const sequence: number = ++this.creationSequence;
    const creating: Promise<AccountCalendarPort> = this.manager.createCalendar(CalendarAccountSession.account());
    this.creating = creating;
    creating.then((calendar: AccountCalendarPort) => {
      if (generation === this.generation && sequence === this.creationSequence) { this.selected = calendar; }
      if (this.creating === creating) { this.creating = undefined; }
    }, () => { if (this.creating === creating) { this.creating = undefined; } });
    return creating;
  }

  /** Resolve the named account through the SDK before applying configuration. */
  async setConfig(): Promise<void> {
    const calendar: AccountCalendarPort = await this.manager.getCalendar(CalendarAccountSession.account());
    await calendar.setConfig({ enableReminder: true, color: '#aabbcc' });
  }

  getCalendarByParam(): Promise<AccountCalendarPort> {
    return this.manager.getCalendar(CalendarAccountSession.account());
  }

  getDefaultCalendar(): Promise<AccountCalendarPort> { return this.manager.getCalendar(); }

  /** Preserve all objects; consumers may inspect accounts without altering them. */
  getAllCalendars(): Promise<AccountCalendarPort[]> { return this.manager.getAllCalendars(); }

  /** Delete only the handle returned by this session's successful creation. */
  async deleteCalendar(): Promise<void> {
    const calendar: AccountCalendarPort | undefined = this.selected;
    if (!calendar) { throw new Error('Calendar has not been created'); }
    const generation: number = this.generation;
    await this.manager.deleteCalendar(calendar);
    if (generation === this.generation && this.selected === calendar) { this.selected = undefined; }
  }

  /** Drop local ownership without deleting the user's account. */
  clear(): void {
    this.generation++;
    this.creationSequence++;
    this.creating = undefined;
    this.selected = undefined;
  }
}
