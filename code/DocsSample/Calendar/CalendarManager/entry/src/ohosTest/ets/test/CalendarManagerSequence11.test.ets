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

export default function calendarManagerSequence11Test(): void {
  describe('CalendarManagerSequence11Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_0100
     * @tc.name testCalendarManagerSequence110001
     * @tc.desc list then list then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110001';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list');
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
            expect(manager.trace.join(',')).assertEqual('create,list,list,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_0200
     * @tc.name testCalendarManagerSequence110002
     * @tc.desc list then list then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110002';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,list,list,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_0300
     * @tc.name testCalendarManagerSequence110003
     * @tc.desc list then list then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110003';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,list,list');
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
            expect(manager.trace.join(',')).assertEqual('create,list,list');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_0400
     * @tc.name testCalendarManagerSequence110004
     * @tc.desc list then list then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110004';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,list,list,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_0500
     * @tc.name testCalendarManagerSequence110005
     * @tc.desc list then list then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110005';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list,default,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_0600
     * @tc.name testCalendarManagerSequence110006
     * @tc.desc list then list then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110006';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list,list,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_0700
     * @tc.name testCalendarManagerSequence110007
     * @tc.desc list then list then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110007';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,list,list,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,list,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_0800
     * @tc.name testCalendarManagerSequence110008
     * @tc.desc list then config then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110008';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,list,named');
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
            expect(manager.trace.join(',')).assertEqual('create,list,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,named,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_0900
     * @tc.name testCalendarManagerSequence110009
     * @tc.desc list then config then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110009';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,list,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,named,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,list,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_1000
     * @tc.name testCalendarManagerSequence110010
     * @tc.desc list then config then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110010';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,list,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,list,named');
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
            expect(manager.trace.join(',')).assertEqual('create,list,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_1100
     * @tc.name testCalendarManagerSequence110011
     * @tc.desc list then config then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110011';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,list,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,list,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,named,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_1200
     * @tc.name testCalendarManagerSequence110012
     * @tc.desc list then config then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110012';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,list,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,named,default,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_1300
     * @tc.name testCalendarManagerSequence110013
     * @tc.desc list then config then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110013';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,list,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,named,list,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_1400
     * @tc.name testCalendarManagerSequence110014
     * @tc.desc list then config then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110014';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,list,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[1].enableReminder).assertEqual(true);
            expect(manager.named.configurations[1].color).assertEqual('#aabbcc');
            expect(manager.named.configurations[1] === manager.named.configurations[0]).assertEqual(false);
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,list,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,named,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_1500
     * @tc.name testCalendarManagerSequence110015
     * @tc.desc config then create then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110015';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created2: MatrixCalendar = new MatrixCalendar('created2');
            manager.nextCalendar = created2;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created2).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created2');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created3: MatrixCalendar = new MatrixCalendar('created3');
            manager.nextCalendar = created3;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created3).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created3');
            expect(manager.creationAccounts[2].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[2].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[2].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[2] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[2]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,create,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_1600
     * @tc.name testCalendarManagerSequence110016
     * @tc.desc config then create then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110016';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created2: MatrixCalendar = new MatrixCalendar('created2');
            manager.nextCalendar = created2;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created2).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created2');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,create,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,named,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_1700
     * @tc.name testCalendarManagerSequence110017
     * @tc.desc config then create then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110017';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created2: MatrixCalendar = new MatrixCalendar('created2');
            manager.nextCalendar = created2;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created2).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created2');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(2);
            expect(manager.trace.join(',')).assertEqual('create,named,create');
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
            expect(manager.trace.join(',')).assertEqual('create,named,create');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_1800
     * @tc.name testCalendarManagerSequence110018
     * @tc.desc config then create then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110018';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created2: MatrixCalendar = new MatrixCalendar('created2');
            manager.nextCalendar = created2;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created2).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created2');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,create,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_1900
     * @tc.name testCalendarManagerSequence110019
     * @tc.desc config then create then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110019';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created2: MatrixCalendar = new MatrixCalendar('created2');
            manager.nextCalendar = created2;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created2).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created2');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,create,default,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_2000
     * @tc.name testCalendarManagerSequence110020
     * @tc.desc config then create then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110020';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created2: MatrixCalendar = new MatrixCalendar('created2');
            manager.nextCalendar = created2;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created2).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created2');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,create,list,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_2100
     * @tc.name testCalendarManagerSequence110021
     * @tc.desc config then create then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110021';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const created2: MatrixCalendar = new MatrixCalendar('created2');
            manager.nextCalendar = created2;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created2).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created2');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[1].enableReminder).assertEqual(true);
            expect(manager.named.configurations[1].color).assertEqual('#aabbcc');
            expect(manager.named.configurations[1] === manager.named.configurations[0]).assertEqual(false);
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,create,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_2200
     * @tc.name testCalendarManagerSequence110022
     * @tc.desc config then delete then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110022';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,delete');
            expect(manager.deleted.length).assertEqual(1);
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
            expect(manager.trace.join(',')).assertEqual('create,named,delete,create');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[1].getAccount().name).assertEqual('created3');
            expect(manager.deleted[1] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,delete,create,delete');
            expect(manager.deleted.length).assertEqual(2);
          }
          const recovered: MatrixCalendar = new MatrixCalendar('recovered');
          manager.nextCalendar = recovered;
          const recreated: AccountCalendarPort = await session.createCalendar();
          expect(recreated === recovered).assertEqual(true);
          await session.deleteCalendar();
          expect(manager.deleted[2].getAccount().name).assertEqual('recovered');
          expect(manager.deleted[2] === recovered).assertEqual(true);
          expect(manager.deleted.length).assertEqual(3);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_2300
     * @tc.name testCalendarManagerSequence110023
     * @tc.desc config then delete then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110023';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,named,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_2400
     * @tc.name testCalendarManagerSequence110024
     * @tc.desc config then delete then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110024';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,named,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_2500
     * @tc.name testCalendarManagerSequence110025
     * @tc.desc config then delete then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110025';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named,delete,named');
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
            expect(manager.trace.join(',')).assertEqual('create,named,delete,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_2600
     * @tc.name testCalendarManagerSequence110026
     * @tc.desc config then delete then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110026';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,delete,default');
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
            expect(manager.trace.join(',')).assertEqual('create,named,delete,default');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_2700
     * @tc.name testCalendarManagerSequence110027
     * @tc.desc config then delete then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110027';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,delete,list');
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
            expect(manager.trace.join(',')).assertEqual('create,named,delete,list');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_11_2800
     * @tc.name testCalendarManagerSequence110028
     * @tc.desc config then delete then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence110028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence110028';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[1].enableReminder).assertEqual(true);
            expect(manager.named.configurations[1].color).assertEqual('#aabbcc');
            expect(manager.named.configurations[1] === manager.named.configurations[0]).assertEqual(false);
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named,delete,named');
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
            expect(manager.trace.join(',')).assertEqual('create,named,delete,named');
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
