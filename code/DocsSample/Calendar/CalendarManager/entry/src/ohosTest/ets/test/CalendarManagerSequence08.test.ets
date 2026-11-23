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

export default function calendarManagerSequence08Test(): void {
  describe('CalendarManagerSequence08Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_0100
     * @tc.name testCalendarManagerSequence080001
     * @tc.desc default then create then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080001';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default,create');
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
            expect(manager.trace.join(',')).assertEqual('create,default,create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[2]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,create,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_0200
     * @tc.name testCalendarManagerSequence080002
     * @tc.desc default then create then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080002';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,create,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,default,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_0300
     * @tc.name testCalendarManagerSequence080003
     * @tc.desc default then create then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080003';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(2);
            expect(manager.trace.join(',')).assertEqual('create,default,create');
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
            expect(manager.trace.join(',')).assertEqual('create,default,create');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_0400
     * @tc.name testCalendarManagerSequence080004
     * @tc.desc default then create then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080004';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,default,create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,create,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_0500
     * @tc.name testCalendarManagerSequence080005
     * @tc.desc default then create then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080005';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,create,default,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_0600
     * @tc.name testCalendarManagerSequence080006
     * @tc.desc default then create then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080006';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,create,list,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_0700
     * @tc.name testCalendarManagerSequence080007
     * @tc.desc default then create then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080007';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,default,create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,create,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_0800
     * @tc.name testCalendarManagerSequence080008
     * @tc.desc default then delete then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080008';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,default,delete,create');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[1].getAccount().name).assertEqual('created3');
            expect(manager.deleted[1] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,delete,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_0900
     * @tc.name testCalendarManagerSequence080009
     * @tc.desc default then delete then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080009';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,default,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,default,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_1000
     * @tc.name testCalendarManagerSequence080010
     * @tc.desc default then delete then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080010';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,default,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,default,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_1100
     * @tc.name testCalendarManagerSequence080011
     * @tc.desc default then delete then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080011';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,default,delete,named');
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
            expect(manager.trace.join(',')).assertEqual('create,default,delete,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_1200
     * @tc.name testCalendarManagerSequence080012
     * @tc.desc default then delete then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080012';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,delete,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default,delete,default');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_1300
     * @tc.name testCalendarManagerSequence080013
     * @tc.desc default then delete then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080013';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,delete,list');
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
            expect(manager.trace.join(',')).assertEqual('create,default,delete,list');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_1400
     * @tc.name testCalendarManagerSequence080014
     * @tc.desc default then delete then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080014';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,default,delete,named');
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
            expect(manager.trace.join(',')).assertEqual('create,default,delete,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_1500
     * @tc.name testCalendarManagerSequence080015
     * @tc.desc default then clear then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080015';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_1600
     * @tc.name testCalendarManagerSequence080016
     * @tc.desc default then clear then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080016';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_1700
     * @tc.name testCalendarManagerSequence080017
     * @tc.desc default then clear then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080017';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_1800
     * @tc.name testCalendarManagerSequence080018
     * @tc.desc default then clear then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080018';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,default,named');
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
            expect(manager.trace.join(',')).assertEqual('create,default,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_1900
     * @tc.name testCalendarManagerSequence080019
     * @tc.desc default then clear then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080019';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[1] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,default');
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
            expect(manager.trace.join(',')).assertEqual('create,default,default');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_2000
     * @tc.name testCalendarManagerSequence080020
     * @tc.desc default then clear then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080020';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,list');
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
            expect(manager.trace.join(',')).assertEqual('create,default,list');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_2100
     * @tc.name testCalendarManagerSequence080021
     * @tc.desc default then clear then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080021';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,default,named');
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
            expect(manager.trace.join(',')).assertEqual('create,default,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_2200
     * @tc.name testCalendarManagerSequence080022
     * @tc.desc default then named then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080022';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,default,named');
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
            expect(manager.trace.join(',')).assertEqual('create,default,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,named,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_2300
     * @tc.name testCalendarManagerSequence080023
     * @tc.desc default then named then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080023';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,default,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,named,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,default,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_2400
     * @tc.name testCalendarManagerSequence080024
     * @tc.desc default then named then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080024';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,default,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,default,named');
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
            expect(manager.trace.join(',')).assertEqual('create,default,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_2500
     * @tc.name testCalendarManagerSequence080025
     * @tc.desc default then named then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080025';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,default,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[2]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[2]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[2]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,default,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,named,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_2600
     * @tc.name testCalendarManagerSequence080026
     * @tc.desc default then named then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080026';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,default,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[2] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,named,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,named,default,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_2700
     * @tc.name testCalendarManagerSequence080027
     * @tc.desc default then named then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080027';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,default,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,named,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,named,list,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_08_2800
     * @tc.name testCalendarManagerSequence080028
     * @tc.desc default then named then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence080028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence080028';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[1]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,default,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[2]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,default,named,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,named,named,delete');
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
