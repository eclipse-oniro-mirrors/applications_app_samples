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

export default function calendarPayload04Test(): void {
  describe('CalendarPayload04', (): void => {
    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_7300
     * @tc.name CalendarEventPayload04_0001
     * @tc.desc Verify Signed32End time and Zero ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_7400
     * @tc.name CalendarEventPayload04_0002
     * @tc.desc Verify Signed32End time and Zero ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_7500
     * @tc.name CalendarEventPayload04_0003
     * @tc.desc Verify Signed32End time and Zero ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_7600
     * @tc.name CalendarEventPayload04_0004
     * @tc.desc Verify Signed32End time and One ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_7700
     * @tc.name CalendarEventPayload04_0005
     * @tc.desc Verify Signed32End time and One ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_7800
     * @tc.name CalendarEventPayload04_0006
     * @tc.desc Verify Signed32End time and One ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_7900
     * @tc.name CalendarEventPayload04_0007
     * @tc.desc Verify Signed32End time and Signed32Max ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_8000
     * @tc.name CalendarEventPayload04_0008
     * @tc.desc Verify Signed32End time and Signed32Max ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_8100
     * @tc.name CalendarEventPayload04_0009
     * @tc.desc Verify Signed32End time and Signed32Max ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_8200
     * @tc.name CalendarEventPayload04_0010
     * @tc.desc Verify Signed32End time and SafeIntegerMax ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_8300
     * @tc.name CalendarEventPayload04_0011
     * @tc.desc Verify Signed32End time and SafeIntegerMax ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_8400
     * @tc.name CalendarEventPayload04_0012
     * @tc.desc Verify Signed32End time and SafeIntegerMax ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483647000);
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
      expect(added.startTime).assertEqual(2147483647000);
      expect(added.endTime).assertEqual(2147487247000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494447000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490847000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483647000);
      expect(edited.endTime).assertEqual(2147487247000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483647000);
      expect(updated.endTime).assertEqual(2147487247000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_8500
     * @tc.name CalendarEventPayload04_0013
     * @tc.desc Verify AfterSigned32 time and Zero ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_8600
     * @tc.name CalendarEventPayload04_0014
     * @tc.desc Verify AfterSigned32 time and Zero ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_8700
     * @tc.name CalendarEventPayload04_0015
     * @tc.desc Verify AfterSigned32 time and Zero ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(0);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_8800
     * @tc.name CalendarEventPayload04_0016
     * @tc.desc Verify AfterSigned32 time and One ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_8900
     * @tc.name CalendarEventPayload04_0017
     * @tc.desc Verify AfterSigned32 time and One ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_9000
     * @tc.name CalendarEventPayload04_0018
     * @tc.desc Verify AfterSigned32 time and One ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(1);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_9100
     * @tc.name CalendarEventPayload04_0019
     * @tc.desc Verify AfterSigned32 time and Signed32Max ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_9200
     * @tc.name CalendarEventPayload04_0020
     * @tc.desc Verify AfterSigned32 time and Signed32Max ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_9300
     * @tc.name CalendarEventPayload04_0021
     * @tc.desc Verify AfterSigned32 time and Signed32Max ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 2147483647;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(2147483647);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_9400
     * @tc.name CalendarEventPayload04_0022
     * @tc.desc Verify AfterSigned32 time and SafeIntegerMax ID payloads after initial creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_9500
     * @tc.name CalendarEventPayload04_0023
     * @tc.desc Verify AfterSigned32 time and SafeIntegerMax ID payloads after reconfigured creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });

    /**
     * @tc.number SUB_CALENDAR_PAYLOAD_9600
     * @tc.name CalendarEventPayload04_0024
     * @tc.desc Verify AfterSigned32 time and SafeIntegerMax ID payloads after reopened creation.
     * @tc.type FUNC
     */
    it('CalendarEventPayload04_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      manager.editId = 91;
      const session: CalendarEventSession = new CalendarEventSession(manager, 2147483648000);
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
      expect(added.startTime).assertEqual(2147483648000);
      expect(added.endTime).assertEqual(2147487248000);
      expect(added.reminderTime?.join(',')).assertEqual('10');
      expect(added.recurrenceRule?.recurrenceFrequency).assertEqual(calendarManager.RecurrenceFrequency.DAILY);
      expect(added.recurrenceRule?.count).assertEqual(100);
      expect(added.recurrenceRule?.interval).assertEqual(2);
      expect(added.recurrenceRule?.expire).assertEqual(2147494448000);
      expect(added.recurrenceRule?.excludedDates?.join(',')).assertEqual('2147490848000');
      expect(added.service?.type).assertEqual(calendarManager.ServiceType.TRIP);
      expect(added.service?.uri).assertEqual('xxx://xxx.xxx.com/xxx');
      expect(added.service?.description).assertEqual('一键服务');
      expect(await session.editEvent()).assertEqual(91);
      expect(manager.edits.length).assertEqual(1);
      const edited: calendarManager.Event = manager.edits[0];
      expect(edited.title).assertEqual('title');
      expect(edited.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(edited.startTime).assertEqual(2147483648000);
      expect(edited.endTime).assertEqual(2147487248000);
      expect(edited.id).assertUndefined();
      await session.updateEvent();
      expect(manager.calendar.updates.length).assertEqual(1);
      const updated: calendarManager.Event = manager.calendar.updates[0];
      expect(updated.id).assertEqual(9007199254740991);
      expect(updated.title).assertEqual('updateTitle');
      expect(updated.description).assertEqual('updateEventTest');
      expect(updated.type).assertEqual(calendarManager.EventType.NORMAL);
      expect(updated.startTime).assertEqual(2147483648000);
      expect(updated.endTime).assertEqual(2147487248000);
      expect(updated.recurrenceRule === undefined).assertEqual(true);
      expect(updated.service === undefined).assertEqual(true);
      expect(added === edited).assertEqual(false);
      expect(added === updated).assertEqual(false);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,add,update');
    });
  });
}
