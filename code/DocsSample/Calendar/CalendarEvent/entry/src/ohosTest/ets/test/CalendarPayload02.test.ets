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
import { describe } from '@ohos/hypium';
import { calendarManager } from '@kit.CalendarKit';
import { it, expect } from './TestSupport';
import { CalendarEventSession } from '../../../main/ets/CalendarEventSession';
import { ManagerProbe } from './CalendarLogicFixtures';

export default function calendarPayload02Test(): void {
  describe('CalendarPayload02', (): void => {
    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_2500
     * @tc.name CalendarEventPayload02_0001
     * @tc.desc Verify Millisecond time and Zero ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[0].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[0].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(0);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_2600
     * @tc.name CalendarEventPayload02_0002
     * @tc.desc Verify Millisecond time and Zero ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(0);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_2700
     * @tc.name CalendarEventPayload02_0003
     * @tc.desc Verify Millisecond time and Zero ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      session.clear();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(2);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(0);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_2800
     * @tc.name CalendarEventPayload02_0004
     * @tc.desc Verify Millisecond time and One ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[0].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[0].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(1);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_2900
     * @tc.name CalendarEventPayload02_0005
     * @tc.desc Verify Millisecond time and One ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(1);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_3000
     * @tc.name CalendarEventPayload02_0006
     * @tc.desc Verify Millisecond time and One ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      session.clear();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(2);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(1);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_3100
     * @tc.name CalendarEventPayload02_0007
     * @tc.desc Verify Millisecond time and Signed32Max ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[0].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[0].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(2147483647);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_3200
     * @tc.name CalendarEventPayload02_0008
     * @tc.desc Verify Millisecond time and Signed32Max ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(2147483647);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_3300
     * @tc.name CalendarEventPayload02_0009
     * @tc.desc Verify Millisecond time and Signed32Max ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      session.clear();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(2);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(2147483647);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_3400
     * @tc.name CalendarEventPayload02_0010
     * @tc.desc Verify Millisecond time and SafeIntegerMax ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[0].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[0].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(9007199254740991);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_3500
     * @tc.name CalendarEventPayload02_0011
     * @tc.desc Verify Millisecond time and SafeIntegerMax ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(9007199254740991);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_3600
     * @tc.name CalendarEventPayload02_0012
     * @tc.desc Verify Millisecond time and SafeIntegerMax ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1);
      await session.createCalendar();
      session.clear();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(2);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(9007199254740991);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(1);
      expect(added.endTime).assertEqual(3600001);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(10800001);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('7200001');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1);
      expect(edited.endTime).assertEqual(3600001);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1);
      expect(updated.endTime).assertEqual(3600001);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_3700
     * @tc.name CalendarEventPayload02_0013
     * @tc.desc Verify Leap2000 time and Zero ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[0].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[0].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(0);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_3800
     * @tc.name CalendarEventPayload02_0014
     * @tc.desc Verify Leap2000 time and Zero ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(0);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_3900
     * @tc.name CalendarEventPayload02_0015
     * @tc.desc Verify Leap2000 time and Zero ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      session.clear();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(2);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(0);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_4000
     * @tc.name CalendarEventPayload02_0016
     * @tc.desc Verify Leap2000 time and One ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[0].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[0].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(1);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_4100
     * @tc.name CalendarEventPayload02_0017
     * @tc.desc Verify Leap2000 time and One ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(1);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_4200
     * @tc.name CalendarEventPayload02_0018
     * @tc.desc Verify Leap2000 time and One ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      session.clear();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(2);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(1);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_4300
     * @tc.name CalendarEventPayload02_0019
     * @tc.desc Verify Leap2000 time and Signed32Max ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[0].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[0].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(2147483647);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_4400
     * @tc.name CalendarEventPayload02_0020
     * @tc.desc Verify Leap2000 time and Signed32Max ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(2147483647);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_4500
     * @tc.name CalendarEventPayload02_0021
     * @tc.desc Verify Leap2000 time and Signed32Max ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      session.clear();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(2);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(2147483647);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_4600
     * @tc.name CalendarEventPayload02_0022
     * @tc.desc Verify Leap2000 time and SafeIntegerMax ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(1);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[0].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[0].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(9007199254740991);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_4700
     * @tc.name CalendarEventPayload02_0023
     * @tc.desc Verify Leap2000 time and SafeIntegerMax ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(1);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(9007199254740991);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_4800
     * @tc.name CalendarEventPayload02_0024
     * @tc.desc Verify Leap2000 time and SafeIntegerMax ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload02_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 951782400000);
      await session.createCalendar();
      session.clear();
      await session.createCalendar();
      expect(manager.accounts.length).assertEqual(2);
      expect(manager.calendar.configs.length).assertEqual(2);
      expect(manager.accounts[0].name).assertEqual('MyCalendar');
      expect(manager.accounts[0].displayName).assertEqual('MyCalendar');
      expect(manager.accounts[0].type).assertEqual(calendarManager.CalendarType.LOCAL);
      expect(manager.calendar.configs[1].enableReminder).assertEqual(true);
      expect(manager.calendar.configs[1].color).assertEqual('#aabbcc');
      const returnedId: number = await session.addEvent();
      expect(returnedId).assertEqual(9007199254740991);
      expect(manager.calendar.additions.length).assertEqual(1);
      const added: calendarManager.Event = manager.calendar.additions[0];
      expect(added.title).assertEqual('title');
      expect(added.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(added.startTime).assertEqual(951782400000);
      expect(added.endTime).assertEqual(951786000000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(951793200000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('951789600000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(951782400000);
      expect(edited.endTime).assertEqual(951786000000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(951782400000);
      expect(updated.endTime).assertEqual(951786000000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });
  });
}
