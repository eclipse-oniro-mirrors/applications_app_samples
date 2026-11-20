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
import { CalendarAccountSession } from '../CalendarAccountSession';
import type { AccountCalendarPort } from '../CalendarAccountSession';
import { SdkAccountManager } from '../SdkCalendarAccount';

@Entry
@Component
struct Index {
  private session?: CalendarAccountSession;

  private getSession(): CalendarAccountSession {
    if (!calendarMgr) {
      throw new Error('Calendar permission is not granted');
    }
    if (!this.session) {
      this.session = new CalendarAccountSession(new SdkAccountManager(calendarMgr));
    }
    return this.session;
  }

  aboutToDisappear(): void {
    this.session?.clear();
    this.session = undefined;
  }

  async createCalendar(): Promise<void> {
    try {
      await this.getSession().createCalendar();
    } catch (error) {
      console.error('Failed to create calendar');
    }
  }

  async setConfig(): Promise<void> {
    try {
      await this.getSession().setConfig();
    } catch (error) {
      console.error('Failed to set calendar config');
    }
  }

  async getCalendarByParam(): Promise<void> {
    try {
      await this.getSession().getCalendarByParam();
    } catch (error) {
      console.error('Failed to get named calendar');
    }
  }

  async getDefaultCalendar(): Promise<void> {
    try {
      await this.getSession().getDefaultCalendar();
    } catch (error) {
      console.error('Failed to get default calendar');
    }
  }

  async getAllCalendars(): Promise<void> {
    try {
      const calendars: AccountCalendarPort[] = await this.getSession().getAllCalendars();
      calendars.forEach((calendar: AccountCalendarPort): void => { calendar.getAccount(); });
    } catch (error) {
      console.error('Failed to get all calendars');
    }
  }

  async deleteCalendar(): Promise<void> {
    try {
      await this.getSession().deleteCalendar();
    } catch (error) {
      console.error('Failed to delete calendar');
    }
  }

  build() {
    Column() {
      Row() {
        Button($r('app.string.calendar_create'), { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.createCalendar(); })
          .width('100%')
      }.padding({ top: 10 })
      Row() {
        Button($r('app.string.calendar_config'), { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.setConfig(); })
          .width('100%')
      }.padding({ top: 10 })
      Row() {
        Button($r('app.string.calendar_named'), { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.getCalendarByParam(); })
          .width('100%')
      }.padding({ top: 10 })
      Row() {
        Button($r('app.string.calendar_default'), { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.getDefaultCalendar(); })
          .width('100%')
      }.padding({ top: 10 })
      Row() {
        Button($r('app.string.calendar_all'), { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.getAllCalendars(); })
          .width('100%')
      }.padding({ top: 10 })
      Row() {
        Button($r('app.string.calendar_delete'), { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .onClick(() => { this.deleteCalendar(); })
          .width('100%')
      }.padding({ top: 10 })
    }
    .height('100%')
    .width('100%')
  }
}
