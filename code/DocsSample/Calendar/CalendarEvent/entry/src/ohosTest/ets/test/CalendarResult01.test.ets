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

export default function calendarResult01Test(): void {
  describe('CalendarResult01', (): void => {
    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_0100
     * @tc.name CalendarEventResult01_0001
     * @tc.desc Preserve ID/title/time groups of 0/0/0 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0001', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
      const session: CalendarEventSession = new CalendarEventSession(manager, 1709164800000);
      const byId: calendarManager.Event[] = [];
      const byTitle: calendarManager.Event[] = [];
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
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('0');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(0);
      expect(manager.calendar.deletions.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_0200
     * @tc.name CalendarEventResult01_0002
     * @tc.desc Preserve ID/title/time groups of 0/0/1 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0002', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('0');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(0);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_0300
     * @tc.name CalendarEventResult01_0003
     * @tc.desc Preserve ID/title/time groups of 0/0/3 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0003', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(0);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('0');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(0);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_0400
     * @tc.name CalendarEventResult01_0004
     * @tc.desc Preserve ID/title/time groups of 0/1/0 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0004', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(0);
      expect(manager.calendar.ids.join(',')).assertEqual('0');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(0);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_0500
     * @tc.name CalendarEventResult01_0005
     * @tc.desc Preserve ID/title/time groups of 0/1/1 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0005', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(1);
      expect(manager.calendar.ids.join(',')).assertEqual('0');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(0);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_0600
     * @tc.name CalendarEventResult01_0006
     * @tc.desc Preserve ID/title/time groups of 0/1/3 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0006', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
      expect(groups[1].length).assertEqual(1);
      expect(groups[2].length).assertEqual(3);
      expect(manager.calendar.ids.join(',')).assertEqual('0');
      expect(manager.calendar.titles.join(',')).assertEqual('update');
      expect(manager.calendar.starts.join(',')).assertEqual('1686931200000');
      expect(manager.calendar.ends.join(',')).assertEqual('1687017600000');
      expect(manager.calendar.trace.join(',')).assertEqual('config,add,id,title,time');
      await session.updateEvent();
      expect(manager.calendar.updates[0].id).assertEqual(0);
      expect(manager.calendar.deletions.length).assertEqual(0);
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_0700
     * @tc.name CalendarEventResult01_0007
     * @tc.desc Preserve ID/title/time groups of 0/3/0 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0007', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
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
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_0800
     * @tc.name CalendarEventResult01_0008
     * @tc.desc Preserve ID/title/time groups of 0/3/1 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0008', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
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
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_0900
     * @tc.name CalendarEventResult01_0009
     * @tc.desc Preserve ID/title/time groups of 0/3/3 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0009', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(0);
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
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_1000
     * @tc.name CalendarEventResult01_0010
     * @tc.desc Preserve ID/title/time groups of 1/0/0 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0010', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(0);
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
      expect(groups[0][0].title).assertEqual('Id0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_1100
     * @tc.name CalendarEventResult01_0011
     * @tc.desc Preserve ID/title/time groups of 1/0/1 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0011', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(0);
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
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_1200
     * @tc.name CalendarEventResult01_0012
     * @tc.desc Preserve ID/title/time groups of 1/0/3 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0012', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(0);
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
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_1300
     * @tc.name CalendarEventResult01_0013
     * @tc.desc Preserve ID/title/time groups of 1/1/0 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0013', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(1);
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
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_1400
     * @tc.name CalendarEventResult01_0014
     * @tc.desc Preserve ID/title/time groups of 1/1/1 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0014', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(1);
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
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_1500
     * @tc.name CalendarEventResult01_0015
     * @tc.desc Preserve ID/title/time groups of 1/1/3 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0015', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
      expect(groups[1].length).assertEqual(1);
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
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_1600
     * @tc.name CalendarEventResult01_0016
     * @tc.desc Preserve ID/title/time groups of 1/3/0 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0016', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
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
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_1700
     * @tc.name CalendarEventResult01_0017
     * @tc.desc Preserve ID/title/time groups of 1/3/1 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0017', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
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
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_1800
     * @tc.name CalendarEventResult01_0018
     * @tc.desc Preserve ID/title/time groups of 1/3/3 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0018', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(1);
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
      expect(groups[0][0].title).assertEqual('Id0');
      expect(groups[1][0].id).assertEqual(200);
      expect(groups[1][2].title).assertEqual('标题2');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_1900
     * @tc.name CalendarEventResult01_0019
     * @tc.desc Preserve ID/title/time groups of 3/0/0 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0019', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(0);
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
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_2000
     * @tc.name CalendarEventResult01_0020
     * @tc.desc Preserve ID/title/time groups of 3/0/1 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0020', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(0);
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
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_2100
     * @tc.name CalendarEventResult01_0021
     * @tc.desc Preserve ID/title/time groups of 3/0/3 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0021', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(0);
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
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_2200
     * @tc.name CalendarEventResult01_0022
     * @tc.desc Preserve ID/title/time groups of 3/1/0 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0022', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(1);
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
      expect(groups[1][0].title).assertEqual('标题0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_2300
     * @tc.name CalendarEventResult01_0023
     * @tc.desc Preserve ID/title/time groups of 3/1/1 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0023', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(1);
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
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][0].title).assertEqual('Time0');
    });

    /**
     * @tc.number SUB_CALENDAR_RESULT_GROUPS_2400
     * @tc.name CalendarEventResult01_0024
     * @tc.desc Preserve ID/title/time groups of 3/1/3 events with Zero selection.
     * @tc.type FUNC
     */
    it('CalendarEventResult01_0024', 0, async (): Promise<void> => {
      const manager: ManagerProbe = new ManagerProbe();
      manager.calendar.nextId = 0;
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
      expect(await session.addEvent()).assertEqual(0);
      const groups: calendarManager.Event[][] = await session.getEvent();
      expect(groups.length).assertEqual(3);
      expect(groups[0] === byId).assertEqual(true);
      expect(groups[1] === byTitle).assertEqual(true);
      expect(groups[2] === byTime).assertEqual(true);
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(1);
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
      expect(groups[1][0].title).assertEqual('标题0');
      expect(groups[2][0].id).assertEqual(300);
      expect(groups[2][2].title).assertEqual('Time2');
    });
  });
}
