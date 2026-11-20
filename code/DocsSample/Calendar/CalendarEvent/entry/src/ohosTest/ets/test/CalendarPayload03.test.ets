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

export default function calendarPayload03Test(): void {
  describe('CalendarPayload03', (): void => {
    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_4900
     * @tc.name CalendarEventPayload03_0001
     * @tc.desc Verify Leap2024 time and Zero ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_5000
     * @tc.name CalendarEventPayload03_0002
     * @tc.desc Verify Leap2024 time and Zero ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_5100
     * @tc.name CalendarEventPayload03_0003
     * @tc.desc Verify Leap2024 time and Zero ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_5200
     * @tc.name CalendarEventPayload03_0004
     * @tc.desc Verify Leap2024 time and One ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_5300
     * @tc.name CalendarEventPayload03_0005
     * @tc.desc Verify Leap2024 time and One ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_5400
     * @tc.name CalendarEventPayload03_0006
     * @tc.desc Verify Leap2024 time and One ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_5500
     * @tc.name CalendarEventPayload03_0007
     * @tc.desc Verify Leap2024 time and Signed32Max ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_5600
     * @tc.name CalendarEventPayload03_0008
     * @tc.desc Verify Leap2024 time and Signed32Max ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_5700
     * @tc.name CalendarEventPayload03_0009
     * @tc.desc Verify Leap2024 time and Signed32Max ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_5800
     * @tc.name CalendarEventPayload03_0010
     * @tc.desc Verify Leap2024 time and SafeIntegerMax ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_5900
     * @tc.name CalendarEventPayload03_0011
     * @tc.desc Verify Leap2024 time and SafeIntegerMax ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_6000
     * @tc.name CalendarEventPayload03_0012
     * @tc.desc Verify Leap2024 time and SafeIntegerMax ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
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
      expect(added.startTime).assertEqual(1709164800000);
      expect(added.endTime).assertEqual(1709168400000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1709175600000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1709172000000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1709164800000);
      expect(edited.endTime).assertEqual(1709168400000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1709164800000);
      expect(updated.endTime).assertEqual(1709168400000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_6100
     * @tc.name CalendarEventPayload03_0013
     * @tc.desc Verify YearBoundary time and Zero ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_6200
     * @tc.name CalendarEventPayload03_0014
     * @tc.desc Verify YearBoundary time and Zero ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_6300
     * @tc.name CalendarEventPayload03_0015
     * @tc.desc Verify YearBoundary time and Zero ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_6400
     * @tc.name CalendarEventPayload03_0016
     * @tc.desc Verify YearBoundary time and One ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_6500
     * @tc.name CalendarEventPayload03_0017
     * @tc.desc Verify YearBoundary time and One ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_6600
     * @tc.name CalendarEventPayload03_0018
     * @tc.desc Verify YearBoundary time and One ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_6700
     * @tc.name CalendarEventPayload03_0019
     * @tc.desc Verify YearBoundary time and Signed32Max ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_6800
     * @tc.name CalendarEventPayload03_0020
     * @tc.desc Verify YearBoundary time and Signed32Max ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_6900
     * @tc.name CalendarEventPayload03_0021
     * @tc.desc Verify YearBoundary time and Signed32Max ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_7000
     * @tc.name CalendarEventPayload03_0022
     * @tc.desc Verify YearBoundary time and SafeIntegerMax ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_7100
     * @tc.name CalendarEventPayload03_0023
     * @tc.desc Verify YearBoundary time and SafeIntegerMax ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_7200
     * @tc.name CalendarEventPayload03_0024
     * @tc.desc Verify YearBoundary time and SafeIntegerMax ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload03_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1735689599999);
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
      expect(added.startTime).assertEqual(1735689599999);
      expect(added.endTime).assertEqual(1735693199999);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(1735700399999);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('1735696799999');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(1735689599999);
      expect(edited.endTime).assertEqual(1735693199999);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(1735689599999);
      expect(updated.endTime).assertEqual(1735693199999);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });
  });
}
