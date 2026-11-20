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
import type { AccountCalendarPort, AccountManagerPort } from './CalendarAccountSession';

export class SdkAccountCalendar implements AccountCalendarPort {
  public readonly calendar: calendarManager.Calendar;
  constructor(calendar: calendarManager.Calendar) { this.calendar = calendar; }
  setConfig(config: calendarManager.CalendarConfig): Promise<void> { return this.calendar.setConfig(config); }
  getAccount(): calendarManager.CalendarAccount { return this.calendar.getAccount(); }
}

/** Promise adapter around the actual calendar manager; no permission/result substitution. */
export class SdkAccountManager implements AccountManagerPort {
  private manager: calendarManager.CalendarManager;
  constructor(manager: calendarManager.CalendarManager) { this.manager = manager; }
  async createCalendar(account: calendarManager.CalendarAccount): Promise<AccountCalendarPort> {
    return new SdkAccountCalendar(await this.manager.createCalendar(account));
  }
  async getCalendar(account?: calendarManager.CalendarAccount): Promise<AccountCalendarPort> {
    return new SdkAccountCalendar(account ? await this.manager.getCalendar(account) : await this.manager.getCalendar());
  }
  async getAllCalendars(): Promise<AccountCalendarPort[]> {
    const calendars: calendarManager.Calendar[] = await this.manager.getAllCalendars();
    return calendars.map((calendar: calendarManager.Calendar): AccountCalendarPort => new SdkAccountCalendar(calendar));
  }
  deleteCalendar(calendar: AccountCalendarPort): Promise<void> {
    if (!(calendar instanceof SdkAccountCalendar)) { return Promise.reject(new Error('Invalid calendar handle')); }
    return this.manager.deleteCalendar(calendar.calendar);
  }
}
