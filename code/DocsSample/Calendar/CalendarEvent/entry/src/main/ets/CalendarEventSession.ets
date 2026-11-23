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

export interface EventCalendarPort {
  setConfig(config: calendarManager.CalendarConfig): Promise<void>;
  addEvent(event: calendarManager.Event): Promise<number>;
  updateEvent(event: calendarManager.Event): Promise<void>;
  getEvents(): Promise<calendarManager.Event[]>;
  getById(id: number): Promise<calendarManager.Event[]>;
  getByTitle(title: string): Promise<calendarManager.Event[]>;
  getByTime(start: number, end: number): Promise<calendarManager.Event[]>;
  deleteEvent(id: number): Promise<void>;
}

export interface EventManagerPort {
  createCalendar(account: calendarManager.CalendarAccount): Promise<EventCalendarPort>;
  editEvent(event: calendarManager.Event): Promise<number>;
}

/** Stateful event logic shared by the page and non-UI tests. Ports preserve SDK promises. */
export class CalendarEventSession {
  private manager: EventManagerPort;
  private calendar?: EventCalendarPort;
  private eventId?: number;
  private time: number;
  private generation: number = 0;
  private addSequence: number = 0;
  private ready: boolean = false;
  private opening?: Promise<void>;
  constructor(manager: EventManagerPort, time: number = Date.now()) {
    this.manager = manager;
    this.time = time;
  }

  /** Coalesce double clicks; publish readiness only after configuration completes. */
  createCalendar(): Promise<void> {
    if (this.opening) { return this.opening; }
    const generation: number = this.generation;
    const opening: Promise<void> = this.openCalendar(generation);
    this.opening = opening;
    opening.then(() => {
      if (this.opening === opening) { this.opening = undefined; }
    }, () => {
      if (this.opening === opening) { this.opening = undefined; }
    });
    return opening;
  }

  private async openCalendar(generation: number): Promise<void> {
    const calendar: EventCalendarPort = this.calendar || await this.manager.createCalendar({
      name: 'MyCalendar', type: calendarManager.CalendarType.LOCAL, displayName: 'MyCalendar'
    });
    if (generation !== this.generation) { return; }
    this.calendar = calendar;
    this.ready = false;
    await calendar.setConfig({ enableReminder: true, color: '#aabbcc' });
    if (generation === this.generation) { this.ready = true; }
  }

  private requireCalendar(): EventCalendarPort {
    if (!this.calendar || !this.ready) { throw new Error('Calendar is not ready'); }
    return this.calendar;
  }

  private requireId(): number {
    if (this.eventId === undefined) { throw new Error('Event has not been created'); }
    return this.eventId;
  }

  /** Create the original recurring event. Latest initiated add owns the selected id. */
  async addEvent(): Promise<number> {
    const calendar: EventCalendarPort = this.requireCalendar();
    const generation: number = this.generation;
    const sequence: number = ++this.addSequence;
    const id: number = await calendar.addEvent({
      title: 'title', type: calendarManager.EventType.NORMAL,
      startTime: this.time, endTime: this.time + 3600000, reminderTime: [10],
      recurrenceRule: {
        recurrenceFrequency: calendarManager.RecurrenceFrequency.DAILY,
        count: 100, interval: 2, expire: this.time + 10800000,
        excludedDates: [this.time + 7200000]
      },
      service: { type: calendarManager.ServiceType.TRIP, uri: 'xxx://xxx.xxx.com/xxx', description: 'One-tap service' }
    });
    if (generation === this.generation && sequence === this.addSequence) { this.eventId = id; }
    return id;
  }

  /** Keep the separate SDK edit-page alternative, not a fake non-UI edit. */
  editEvent(): Promise<number> {
    return this.manager.editEvent({ title: 'title', type: calendarManager.EventType.NORMAL,
      startTime: this.time, endTime: this.time + 3600000 });
  }

  /** Update only a known event; preserve the sample's full update payload. */
  updateEvent(): Promise<void> {
    return this.requireCalendar().updateEvent({ title: 'updateTitle', description: 'updateEventTest',
      type: calendarManager.EventType.NORMAL, id: this.requireId(),
      startTime: this.time, endTime: this.time + 3600000 });
  }

  /** Query all events without synthesizing an empty success. */
  getEvents(): Promise<calendarManager.Event[]> { return this.requireCalendar().getEvents(); }

  /** Keep all three original query examples, and await their actual completions. */
  async getEvent(): Promise<calendarManager.Event[][]> {
    const calendar: EventCalendarPort = this.requireCalendar();
    const id: number = this.requireId();
    return Promise.all([calendar.getById(id), calendar.getByTitle('update'),
      calendar.getByTime(1686931200000, 1687017600000)]);
  }

  /** Clear the selection only after the SDK confirms deletion. */
  async deleteEvent(): Promise<void> {
    const calendar: EventCalendarPort = this.requireCalendar();
    const id: number = this.requireId();
    const generation: number = this.generation;
    await calendar.deleteEvent(id);
    if (generation === this.generation && this.eventId === id) { this.eventId = undefined; }
  }

  /** Drop local references, without deleting the user's stored calendar/events. */
  clear(): void {
    this.generation++;
    this.addSequence++;
    this.opening = undefined;
    this.calendar = undefined;
    this.ready = false;
    this.eventId = undefined;
  }
}
