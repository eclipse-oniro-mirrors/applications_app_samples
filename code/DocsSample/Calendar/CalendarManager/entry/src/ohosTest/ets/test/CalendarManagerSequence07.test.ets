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
import { describe, it, Level, Size, TestType } from '@ohos/hypium';
import { calendarManager } from '@kit.CalendarKit';
import { expect } from './TestSupport';
import { CalendarAccountSession } from '../../../main/ets/CalendarAccountSession';
import type { AccountCalendarPort } from '../../../main/ets/CalendarAccountSession';
import { MatrixCalendar, MatrixManager } from './CalendarMatrixSupport';

export default function calendarManagerSequence07Test(): void {
  describe('CalendarManagerSequence07Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_0100
     * @tc.name testCalendarManagerSequence070001
     * @tc.desc named then named then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070001';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created3: MatrixCalendar = new MatrixCalendar('created3');
            manager.nextCalendar = created3;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created3).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created3');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,create,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_0200
     * @tc.name testCalendarManagerSequence070002
     * @tc.desc named then named then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070002';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_0300
     * @tc.name testCalendarManagerSequence070003
     * @tc.desc named then named then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070003';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[0].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[0] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(1);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_0400
     * @tc.name testCalendarManagerSequence070004
     * @tc.desc named then named then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070004';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[2]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[2]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[2]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_0500
     * @tc.name testCalendarManagerSequence070005
     * @tc.desc named then named then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070005';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[2] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,default,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_0600
     * @tc.name testCalendarManagerSequence070006
     * @tc.desc named then named then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070006';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,list,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_0700
     * @tc.name testCalendarManagerSequence070007
     * @tc.desc named then named then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070007';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[2]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_0800
     * @tc.name testCalendarManagerSequence070008
     * @tc.desc named then default then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070008';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created3: MatrixCalendar = new MatrixCalendar('created3');
            manager.nextCalendar = created3;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created3).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created3');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,default,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default,create,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_0900
     * @tc.name testCalendarManagerSequence070009
     * @tc.desc named then default then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070009';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_1000
     * @tc.name testCalendarManagerSequence070010
     * @tc.desc named then default then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070010';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[0].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[0] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(1);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_1100
     * @tc.name testCalendarManagerSequence070011
     * @tc.desc named then default then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070011';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[2]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[2]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[2]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,default,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_1200
     * @tc.name testCalendarManagerSequence070012
     * @tc.desc named then default then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070012';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[2] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default,default,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_1300
     * @tc.name testCalendarManagerSequence070013
     * @tc.desc named then default then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070013';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default,list,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_1400
     * @tc.name testCalendarManagerSequence070014
     * @tc.desc named then default then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070014';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[2]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,default,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,default,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_1500
     * @tc.name testCalendarManagerSequence070015
     * @tc.desc named then list then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070015';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created3: MatrixCalendar = new MatrixCalendar('created3');
            manager.nextCalendar = created3;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created3).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created3');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,list,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list,create,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_1600
     * @tc.name testCalendarManagerSequence070016
     * @tc.desc named then list then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070016';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_1700
     * @tc.name testCalendarManagerSequence070017
     * @tc.desc named then list then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070017';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[0].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[0] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(1);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_1800
     * @tc.name testCalendarManagerSequence070018
     * @tc.desc named then list then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070018';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,list,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_1900
     * @tc.name testCalendarManagerSequence070019
     * @tc.desc named then list then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070019';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list,default,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_2000
     * @tc.name testCalendarManagerSequence070020
     * @tc.desc named then list then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070020';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list,list,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_2100
     * @tc.name testCalendarManagerSequence070021
     * @tc.desc named then list then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070021';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,list,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,list,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_2200
     * @tc.name testCalendarManagerSequence070022
     * @tc.desc named then config then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070022';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created3: MatrixCalendar = new MatrixCalendar('created3');
            manager.nextCalendar = created3;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created3).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created3');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,create,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_2300
     * @tc.name testCalendarManagerSequence070023
     * @tc.desc named then config then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070023';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_2400
     * @tc.name testCalendarManagerSequence070024
     * @tc.desc named then config then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070024';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[0].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[0] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(1);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_2500
     * @tc.name testCalendarManagerSequence070025
     * @tc.desc named then config then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070025';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[2]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[2]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[2]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_2600
     * @tc.name testCalendarManagerSequence070026
     * @tc.desc named then config then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070026';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[2] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,default,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_2700
     * @tc.name testCalendarManagerSequence070027
     * @tc.desc named then config then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070027';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,list,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_07_2800
     * @tc.name testCalendarManagerSequence070028
     * @tc.desc named then config then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence070028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence070028';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[2]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[1].enableReminder).assertEqual(true);
            expect(manager.named.configurations[1].color).assertEqual('#aabbcc');
            expect(manager.named.configurations[1] === manager.named.configurations[0]).assertEqual(false);
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,named,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[1].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[1] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(2);
        } finally {
          console.info(`${TAG} end`);
        }
      });
  });
}
