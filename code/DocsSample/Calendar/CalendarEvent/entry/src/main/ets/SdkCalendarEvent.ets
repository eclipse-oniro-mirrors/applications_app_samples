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
import { EventCalendarPort, EventManagerPort } from './CalendarEventSession';

/** Translate query requests into actual SDK EventFilter instances. */
export class SdkEventCalendar implements EventCalendarPort {
  private calendar: calendarManager.Calendar;
  constructor(calendar: calendarManager.Calendar) { this.calendar = calendar; }
  setConfig(config: calendarManager.CalendarConfig): Promise<void> { return this.calendar.setConfig(config); }
  addEvent(event: calendarManager.Event): Promise<number> { return this.calendar.addEvent(event); }
  updateEvent(event: calendarManager.Event): Promise<void> { return this.calendar.updateEvent(event); }
  getEvents(): Promise<calendarManager.Event[]> { return this.calendar.getEvents(); }
  getById(id: number): Promise<calendarManager.Event[]> {
    return this.calendar.getEvents(calendarManager.EventFilter.filterById([id]));
  }
  getByTitle(title: string): Promise<calendarManager.Event[]> {
    return this.calendar.getEvents(calendarManager.EventFilter.filterByTitle(title));
  }
  getByTime(start: number, end: number): Promise<calendarManager.Event[]> {
    return this.calendar.getEvents(calendarManager.EventFilter.filterByTime(start, end));
  }
  deleteEvent(id: number): Promise<void> { return this.calendar.deleteEvent(id); }
}

/** Every method delegates to a real SDK manager obtained after actual authorization. */
export class SdkEventManager implements EventManagerPort {
  private manager: calendarManager.CalendarManager;
  constructor(manager: calendarManager.CalendarManager) { this.manager = manager; }
  async createCalendar(account: calendarManager.CalendarAccount): Promise<EventCalendarPort> {
    return new SdkEventCalendar(await this.manager.createCalendar(account));
  }
  editEvent(event: calendarManager.Event): Promise<number> { return this.manager.editEvent(event); }
}
