/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { calendarMgr } from '../entryability/EntryAbility';
import { CalendarEventSession } from '../CalendarEventSession';
import { SdkEventManager } from '../SdkCalendarEvent';

@Entry
@Component
struct Index {
  private session?: CalendarEventSession;

  private getSession(): CalendarEventSession {
    if (!calendarMgr) { throw new Error('Calendar permission is not granted'); }
    if (!this.session) { this.session = new CalendarEventSession(new SdkEventManager(calendarMgr)); }
    return this.session;
  }

  aboutToDisappear(): void {
    this.session?.clear();
    this.session = undefined;
  }

  async createCalendar(): Promise<void> {
    try { await this.getSession().createCalendar(); }
    catch (error) { console.error('Failed to create or configure calendar'); }
  }

  async addEvent(): Promise<void> {
    try {
      const session: CalendarEventSession = this.getSession();
      // Preserve the two original alternatives, including the real SDK edit page.
      await Promise.all([session.addEvent(), session.editEvent()]);
    } catch (error) { console.error('Failed to add or edit event'); }
  }

  async updateEvent(): Promise<void> {
    try { await this.getSession().updateEvent(); }
    catch (error) { console.error('Failed to update event'); }
  }

  async getEvents(): Promise<void> {
    try { await this.getSession().getEvents(); }
    catch (error) { console.error('Failed to get events'); }
  }

  async getEvent(): Promise<void> {
    try { await this.getSession().getEvent(); }
    catch (error) { console.error('Failed to query events'); }
  }

  async deleteEvent(): Promise<void> {
    try { await this.getSession().deleteEvent(); }
    catch (error) { console.error('Failed to delete event'); }
  }

  build() {
    Column() {
      Row() {
        Button('1，创建日历账户', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.createCalendar(); })
          .width('100%')
      }.padding({ top: 10 })
      Row() {
        Button('2，创建日程', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.addEvent(); })
          .width('100%')
      }.padding({ top: 10 })
      Row() {
        Button('3，修改日程', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.updateEvent(); })
          .width('100%')
      }.padding({ top: 10 })
      Row() {
        Button('4，查询所有日程', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.getEvents(); })
          .width('100%')
      }.padding({ top: 10 })
      Row() {
        Button('5，查询指定日程', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.getEvent(); })
          .width('100%')
      }.padding({ top: 10 })
      Row() {
        Button('6，删除指定日程', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.deleteEvent(); })
          .width('100%')
      }.padding({ top: 10 })
    }
    .height('100%')
    .width('100%')
  }
}
