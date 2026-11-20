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

export default function calendarResult05Test(): void {
  describe('CalendarResult05', (): void => {
    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_9700
     * @tc.name CalendarEventResult05_0001
     * @tc.desc Preserve ID/title/time groups of 1/3/0 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
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
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_9800
     * @tc.name CalendarEventResult05_0002
     * @tc.desc Preserve ID/title/time groups of 1/3/1 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
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
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_9900
     * @tc.name CalendarEventResult05_0003
     * @tc.desc Preserve ID/title/time groups of 1/3/3 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
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
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_10000
     * @tc.name CalendarEventResult05_0004
     * @tc.desc Preserve ID/title/time groups of 3/0/0 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
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
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_10100
     * @tc.name CalendarEventResult05_0005
     * @tc.desc Preserve ID/title/time groups of 3/0/1 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
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
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_10200
     * @tc.name CalendarEventResult05_0006
     * @tc.desc Preserve ID/title/time groups of 3/0/3 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
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
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_10300
     * @tc.name CalendarEventResult05_0007
     * @tc.desc Preserve ID/title/time groups of 3/1/0 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000),
        fixtureEvent(101, 'Id1', 1709168400000),
        fixtureEvent(102, 'Id2', 1709172000000)
      ];
      const byTitle: calendarManager.Event[] = [
        fixtureEvent(200, '标题0', 1709164800000)
      ];
      const byTime: calendarManager.Event[] = [];
      manager.calendar.idResults = byId;
      manager.calendar.titleResults = byTitle;
      manager.calendar.timeResults = byTime;
      await session.createCalendar();
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_10400
     * @tc.name CalendarEventResult05_0008
     * @tc.desc Preserve ID/title/time groups of 3/1/1 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000),
        fixtureEvent(101, 'Id1', 1709168400000),
        fixtureEvent(102, 'Id2', 1709172000000)
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
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_10500
     * @tc.name CalendarEventResult05_0009
     * @tc.desc Preserve ID/title/time groups of 3/1/3 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [
        fixtureEvent(100, 'Id0', 1709164800000),
        fixtureEvent(101, 'Id1', 1709168400000),
        fixtureEvent(102, 'Id2', 1709172000000)
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
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_10600
     * @tc.name CalendarEventResult05_0010
     * @tc.desc Preserve ID/title/time groups of 3/3/0 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
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
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_10700
     * @tc.name CalendarEventResult05_0011
     * @tc.desc Preserve ID/title/time groups of 3/3/1 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
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
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_10800
     * @tc.name CalendarEventResult05_0012
     * @tc.desc Preserve ID/title/time groups of 3/3/3 events with SafeIntegerMax selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 9007199254740991;
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
      expect(await session.addEvent()).assertEqual(9007199254740991);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(3);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('9007199254740991');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(9007199254740991);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[0][0].id).assertEqual(100);
      expect(groups[0][2].title).assertEqual('Id2');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_10900
     * @tc.name CalendarEventResult05_0013
     * @tc.desc Return empty all-event data without copying or reordering in ready state.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_11000
     * @tc.name CalendarEventResult05_0014
     * @tc.desc Return empty all-event data without copying or reordering in selected state.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      await session.addEvent();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_11100
     * @tc.name CalendarEventResult05_0015
     * @tc.desc Return empty all-event data without copying or reordering in deleted state.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      await session.addEvent();
      await session.deleteEvent();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,delete,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_11200
     * @tc.name CalendarEventResult05_0016
     * @tc.desc Return empty all-event data without copying or reordering in reopened state.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      session.clear();
      await session.createCalendar();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(0);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(manager.calendar.trace.join(',')).assertEqual('config,config,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_11300
     * @tc.name CalendarEventResult05_0017
     * @tc.desc Return single all-event data without copying or reordering in ready state.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
        fixtureEvent(0, '', 0)
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(1);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(first[0] === events[0]).assertEqual(true);
      expect(first[0].id).assertEqual(0);
      expect(first[0].title).assertEqual('');
      expect(manager.calendar.trace.join(',')).assertEqual('config,all,all');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_ALL_11400
     * @tc.name CalendarEventResult05_0018
     * @tc.desc Return single all-event data without copying or reordering in selected state.
     * @tc.type FUNC
     */
    it('CalendarEventResult05_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      const session: CalendarEventSession = new CalendarEventSession(manager, 0);
      const events: calendarManager.Event[] = [
        fixtureEvent(0, '', 0)
      ];
      manager.calendar.results = events;
      await session.createCalendar();
      await session.addEvent();
      const first: calendarManager.Event[] = await session.getEvents();
      const second: calendarManager.Event[] = await session.getEvents();
      expect(first === events).assertEqual(true);
      expect(second === events).assertEqual(true);
      expect(first.length).assertEqual(1);
      expect(manager.calendar.ids.length).assertEqual(0);
      expect(manager.calendar.titles.length).assertEqual(0);
      expect(manager.calendar.starts.length).assertEqual(0);
      expect(manager.calendar.updates.length).assertEqual(0);
      expect(first[0] === events[0]).assertEqual(true);
      expect(first[0].id).assertEqual(0);