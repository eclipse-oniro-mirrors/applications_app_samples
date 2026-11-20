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
import { ManagerProbe, fixtureEvent } from './CalendarLogicFixtures';

export default function calendarResult06Test(): void {
  describe('CalendarResult06', (): void => {
    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_12100
     * @tc.name CalendarEventResult06_0001
     * @tc.desc Return duplicateid all-event data without copying or reordering in ready state.
     * @tc.type FUNC
     */
    it('CalendarEventResult06_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
        fixtureEvent(1, 'First', 0),
        fixtureEvent(1, 'Second', 3600000)
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(2);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(first[0] === events[0]).assertEqual(true);
      expect(first[0].id).assertEqual(1);
      expect(first[0].title).assertEqual('First');
      expect(first[1] === events[1]).assertEqual(true);
      expect(first[1].id).assertEqual(1);
      expect(first[1].title).assertEqual('Second');
      expect(manager.calendar.trace.join(',')).assertEqual('config,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_12200
     * @tc.name CalendarEventResult06_0002
     * @tc.desc Return duplicateid all-event data without copying or reordering in selected state.
     * @tc.type FUNC
     */
    it('CalendarEventResult06_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
        fixtureEvent(1, 'First', 0),
        fixtureEvent(1, 'Second', 3600000)
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      await session.addEvent();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(2);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(first[0] === events[0]).assertEqual(true);
      expect(first[0].id).assertEqual(1);
      expect(first[0].title).assertEqual('First');
      expect(first[1] === events[1]).assertEqual(true);
      expect(first[1].id).assertEqual(1);
      expect(first[1].title).assertEqual('Second');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_12300
     * @tc.name CalendarEventResult06_0003
     * @tc.desc Return duplicateid all-event data without copying or reordering in deleted state.
     * @tc.type FUNC
     */
    it('CalendarEventResult06_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
        fixtureEvent(1, 'First', 0),
        fixtureEvent(1, 'Second', 3600000)
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      await session.addEvent();
      await session.deleteEvent();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(2);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(first[0] === events[0]).assertEqual(true);
      expect(first[0].id).assertEqual(1);
      expect(first[0].title).assertEqual('First');
      expect(first[1] === events[1]).assertEqual(true);
      expect(first[1].id).assertEqual(1);
      expect(first[1].title).assertEqual('Second');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,delete,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_12400
     * @tc.name CalendarEventResult06_0004
     * @tc.desc Return duplicateid all-event data without copying or reordering in reopened state.
     * @tc.type FUNC
     */
    it('CalendarEventResult06_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
        fixtureEvent(1, 'First', 0),
        fixtureEvent(1, 'Second', 3600000)
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      session.clear();
      await session.createCalendar();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(2);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(first[0] === events[0]).assertEqual(true);
      expect(first[0].id).assertEqual(1);
      expect(first[0].title).assertEqual('First');
      expect(first[1] === events[1]).assertEqual(true);
      expect(first[1].id).assertEqual(1);
      expect(first[1].title).assertEqual('Second');
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_12500
     * @tc.name CalendarEventResult06_0005
     * @tc.desc Return ordered all-event data without copying or reordering in ready state.
     * @tc.type FUNC
     */
    it('CalendarEventResult06_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
        fixtureEvent(3, 'Third', 7200000),
        fixtureEvent(1, 'First', 0),
        fixtureEvent(2, 'Second', 3600000)
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(3);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(first[0] === events[0]).assertEqual(true);
      expect(first[0].id).assertEqual(3);
      expect(first[0].title).assertEqual('Third');
      expect(first[1] === events[1]).assertEqual(true);
      expect(first[1].id).assertEqual(1);
      expect(first[1].title).assertEqual('First');
      expect(first[2] === events[2]).assertEqual(true);
      expect(first[2].id).assertEqual(2);
      expect(first[2].title).assertEqual('Second');
      expect(manager.calendar.trace.join(',')).assertEqual('config,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_12600
     * @tc.name CalendarEventResult06_0006
     * @tc.desc Return ordered all-event data without copying or reordering in selected state.
     * @tc.type FUNC
     */
    it('CalendarEventResult06_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
        fixtureEvent(3, 'Third', 7200000),
        fixtureEvent(1, 'First', 0),
        fixtureEvent(2, 'Second', 3600000)
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      await session.addEvent();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(3);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(first[0] === events[0]).assertEqual(true);
      expect(first[0].id).assertEqual(3);
      expect(first[0].title).assertEqual('Third');
      expect(first[1] === events[1]).assertEqual(true);
      expect(first[1].id).assertEqual(1);
      expect(first[1].title).assertEqual('First');
      expect(first[2] === events[2]).assertEqual(true);
      expect(first[2].id).assertEqual(2);
      expect(first[2].title).assertEqual('Second');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_12700
     * @tc.name CalendarEventResult06_0007
     * @tc.desc Return ordered all-event data without copying or reordering in deleted state.
     * @tc.type FUNC
     */
    it('CalendarEventResult06_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
        fixtureEvent(3, 'Third', 7200000),
        fixtureEvent(1, 'First', 0),
        fixtureEvent(2, 'Second', 3600000)
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      await session.addEvent();
      await session.deleteEvent();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(3);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(first[0] === events[0]).assertEqual(true);
      expect(first[0].id).assertEqual(3);
      expect(first[0].title).assertEqual('Third');
      expect(first[1] === events[1]).assertEqual(true);
      expect(first[1].id).assertEqual(1);
      expect(first[1].title).assertEqual('First');
      expect(first[2] === events[2]).assertEqual(true);
      expect(first[2].id).assertEqual(2);
      expect(first[2].title).assertEqual('Second');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,delete,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_12800
     * @tc.name CalendarEventResult06_0008
     * @tc.desc Return ordered all-event data without copying or reordering in reopened state.
     * @tc.type FUNC
     */
    it('CalendarEventResult06_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
        fixtureEvent(3, 'Third', 7200000),
        fixtureEvent(1, 'First', 0),
        fixtureEvent(2, 'Second', 3600000)
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      session.clear();
      await session.createCalendar();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(3);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(first[0] === events[0]).assertEqual(true);
      expect(first[0].id).assertEqual(3);
      expect(first[0].title).assertEqual('Third');
      expect(first[1] === events[1]).assertEqual(true);
      expect(first[1].id).assertEqual(1);
      expect(first[1].title).assertEqual('First');
      expect(first[2] === events[2]).assertEqual(true);
      expect(first[2].id).assertEqual(2);
      expect(first[2].title).assertEqual('Second');
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,all,all');
    });
  });
}
