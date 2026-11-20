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

export default function calendarResult02Test(): void {
  describe('CalendarResult02', (): void => {
    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_2500
     * @tc.name CalendarEventResult02_0001
     * @tc.desc Preserve ID/title/time groups of 3/3/0 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000),
        fixtureEvent(101, 'Id1', 1709168400000),
        fixtureEvent(102, 'Id2', 1709172000000)
      ];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000),
        fixtureEvent(201, '标题1', 1709168400000),
        fixtureEvent(202, '标题2', 1709172000000)
      ];
      const byTime: calendarManager.Event[] = [];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('0');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(0);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_2600
     * @tc.name CalendarEventResult02_0002
     * @tc.desc Preserve ID/title/time groups of 3/3/1 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000),
        fixtureEvent(101, 'Id1', 1709168400000),
        fixtureEvent(102, 'Id2', 1709172000000)
      ];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000),
        fixtureEvent(201, '标题1', 1709168400000),
        fixtureEvent(202, '标题2', 1709172000000)
      ];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('0');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(0);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_2700
     * @tc.name CalendarEventResult02_0003
     * @tc.desc Preserve ID/title/time groups of 3/3/3 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000),
        fixtureEvent(101, 'Id1', 1709168400000),
        fixtureEvent(102, 'Id2', 1709172000000)
      ];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000),
        fixtureEvent(201, '标题1', 1709168400000),
        fixtureEvent(202, '标题2', 1709172000000)
      ];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000),
        fixtureEvent(301, 'Time1', 1709168400000),
        fixtureEvent(302, 'Time2', 1709172000000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('0');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(0);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_2800
     * @tc.name CalendarEventResult02_0004
     * @tc.desc Preserve ID/title/time groups of 0/0/0 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [];
      const byTitle: calendarManager.Event[] = [];
      const byTime: calendarManager.Event[] = [];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_2900
     * @tc.name CalendarEventResult02_0005
     * @tc.desc Preserve ID/title/time groups of 0/0/1 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [];
      const byTitle: calendarManager.Event[] = [];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_3000
     * @tc.name CalendarEventResult02_0006
     * @tc.desc Preserve ID/title/time groups of 0/0/3 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [];
      const byTitle: calendarManager.Event[] = [];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000),
        fixtureEvent(301, 'Time1', 1709168400000),
        fixtureEvent(302, 'Time2', 1709172000000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_3100
     * @tc.name CalendarEventResult02_0007
     * @tc.desc Preserve ID/title/time groups of 0/1/0 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000)
      ];
      const byTime: calendarManager.Event[] = [];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_3200
     * @tc.name CalendarEventResult02_0008
     * @tc.desc Preserve ID/title/time groups of 0/1/1 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000)
      ];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_3300
     * @tc.name CalendarEventResult02_0009
     * @tc.desc Preserve ID/title/time groups of 0/1/3 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000)
      ];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000),
        fixtureEvent(301, 'Time1', 1709168400000),
        fixtureEvent(302, 'Time2', 1709172000000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_3400
     * @tc.name CalendarEventResult02_0010
     * @tc.desc Preserve ID/title/time groups of 0/3/0 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000),
        fixtureEvent(201, '标题1', 1709168400000),
        fixtureEvent(202, '标题2', 1709172000000)
      ];
      const byTime: calendarManager.Event[] = [];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_3500
     * @tc.name CalendarEventResult02_0011
     * @tc.desc Preserve ID/title/time groups of 0/3/1 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000),
        fixtureEvent(201, '标题1', 1709168400000),
        fixtureEvent(202, '标题2', 1709172000000)
      ];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_3600
     * @tc.name CalendarEventResult02_0012
     * @tc.desc Preserve ID/title/time groups of 0/3/3 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000),
        fixtureEvent(201, '标题1', 1709168400000),
        fixtureEvent(202, '标题2', 1709172000000)
      ];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000),
        fixtureEvent(301, 'Time1', 1709168400000),
        fixtureEvent(302, 'Time2', 1709172000000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_3700
     * @tc.name CalendarEventResult02_0013
     * @tc.desc Preserve ID/title/time groups of 1/0/0 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000)
      ];
      const byTitle: calendarManager.Event[] = [];
      const byTime: calendarManager.Event[] = [];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_3800
     * @tc.name CalendarEventResult02_0014
     * @tc.desc Preserve ID/title/time groups of 1/0/1 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000)
      ];
      const byTitle: calendarManager.Event[] = [];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_3900
     * @tc.name CalendarEventResult02_0015
     * @tc.desc Preserve ID/title/time groups of 1/0/3 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000)
      ];
      const byTitle: calendarManager.Event[] = [];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000),
        fixtureEvent(301, 'Time1', 1709168400000),
        fixtureEvent(302, 'Time2', 1709172000000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_4000
     * @tc.name CalendarEventResult02_0016
     * @tc.desc Preserve ID/title/time groups of 1/1/0 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000)
      ];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000)
      ];
      const byTime: calendarManager.Event[] = [];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_4100
     * @tc.name CalendarEventResult02_0017
     * @tc.desc Preserve ID/title/time groups of 1/1/1 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000)
      ];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000)
      ];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_4200
     * @tc.name CalendarEventResult02_0018
     * @tc.desc Preserve ID/title/time groups of 1/1/3 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000)
      ];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000)
      ];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000),
        fixtureEvent(301, 'Time1', 1709168400000),
        fixtureEvent(302, 'Time2', 1709172000000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_4300
     * @tc.name CalendarEventResult02_0019
     * @tc.desc Preserve ID/title/time groups of 1/3/0 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000)
      ];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000),
        fixtureEvent(201, '标题1', 1709168400000),
        fixtureEvent(202, '标题2', 1709172000000)
      ];
      const byTime: calendarManager.Event[] = [];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_4400
     * @tc.name CalendarEventResult02_0020
     * @tc.desc Preserve ID/title/time groups of 1/3/1 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000)
      ];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000),
        fixtureEvent(201, '标题1', 1709168400000),
        fixtureEvent(202, '标题2', 1709172000000)
      ];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_4500
     * @tc.name CalendarEventResult02_0021
     * @tc.desc Preserve ID/title/time groups of 1/3/3 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000)
      ];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000),
        fixtureEvent(201, '标题1', 1709168400000),
        fixtureEvent(202, '标题2', 1709172000000)
      ];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000),
        fixtureEvent(301, 'Time1', 1709168400000),
        fixtureEvent(302, 'Time2', 1709172000000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_4600
     * @tc.name CalendarEventResult02_0022
     * @tc.desc Preserve ID/title/time groups of 3/0/0 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000),
        fixtureEvent(101, 'Id1', 1709168400000),
        fixtureEvent(102, 'Id2', 1709172000000)
      ];
      const byTitle: calendarManager.Event[] = [];
      const byTime: calendarManager.Event[] = [];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_4700
     * @tc.name CalendarEventResult02_0023
     * @tc.desc Preserve ID/title/time groups of 3/0/1 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000),
        fixtureEvent(101, 'Id1', 1709168400000),
        fixtureEvent(102, 'Id2', 1709172000000)
      ];
      const byTitle: calendarManager.Event[] = [];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_4800
     * @tc.name CalendarEventResult02_0024
     * @tc.desc Preserve ID/title/time groups of 3/0/3 events with One selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult02_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 1;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000),
        fixtureEvent(101, 'Id1', 1709168400000),
        fixtureEvent(102, 'Id2', 1709172000000)
      ];
      const byTitle: calendarManager.Event[] = [];
      const byTime: calendarManager.Event[] = [
        fixtureEvent(300, 'Time0', 1709164800000),
        fixtureEvent(301, 'Time1', 1709168400000),
        fixtureEvent(302, 'Time2', 1709172000000)
      ];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(1);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('1');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(1);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });
  });
}
