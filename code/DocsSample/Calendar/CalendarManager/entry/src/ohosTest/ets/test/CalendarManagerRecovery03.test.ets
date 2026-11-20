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

export default function calendarManagerRecovery03Test(): void {
  describe('CalendarManagerRecovery03Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_0100
     * @tc.name testCalendarManagerRecovery030001
     * @tc.desc sync named failure then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030001';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'named';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getCalendarByParam();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_0200
     * @tc.name testCalendarManagerRecovery030002
     * @tc.desc sync named failure then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030002';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'named';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getCalendarByParam();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_0300
     * @tc.name testCalendarManagerRecovery030003
     * @tc.desc sync named failure then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030003';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'named';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getCalendarByParam();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,named');
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
            expect(manager.trace.join(',')).assertEqual('create,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_0400
     * @tc.name testCalendarManagerRecovery030004
     * @tc.desc sync named failure then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030004';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'named';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getCalendarByParam();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_0500
     * @tc.name testCalendarManagerRecovery030005
     * @tc.desc sync named failure then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030005';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'named';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getCalendarByParam();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_0600
     * @tc.name testCalendarManagerRecovery030006
     * @tc.desc sync named failure then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030006';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'named';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getCalendarByParam();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_0700
     * @tc.name testCalendarManagerRecovery030007
     * @tc.desc sync named failure then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030007';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'named';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getCalendarByParam();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_0800
     * @tc.name testCalendarManagerRecovery030008
     * @tc.desc sync default failure then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030008';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'default';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getDefaultCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_0900
     * @tc.name testCalendarManagerRecovery030009
     * @tc.desc sync default failure then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030009';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'default';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getDefaultCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_1000
     * @tc.name testCalendarManagerRecovery030010
     * @tc.desc sync default failure then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030010';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'default';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getDefaultCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_1100
     * @tc.name testCalendarManagerRecovery030011
     * @tc.desc sync default failure then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030011';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'default';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getDefaultCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_1200
     * @tc.name testCalendarManagerRecovery030012
     * @tc.desc sync default failure then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030012';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'default';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getDefaultCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,default,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_1300
     * @tc.name testCalendarManagerRecovery030013
     * @tc.desc sync default failure then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030013';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'default';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getDefaultCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default,list,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_1400
     * @tc.name testCalendarManagerRecovery030014
     * @tc.desc sync default failure then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030014';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'default';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getDefaultCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,default');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_1500
     * @tc.name testCalendarManagerRecovery030015
     * @tc.desc sync list failure then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030015';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getAllCalendars();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
            expect(manager.trace.join(',')).assertEqual('create,list,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_1600
     * @tc.name testCalendarManagerRecovery030016
     * @tc.desc sync list failure then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030016';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getAllCalendars();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,list,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_1700
     * @tc.name testCalendarManagerRecovery030017
     * @tc.desc sync list failure then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030017';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getAllCalendars();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,list');
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
            expect(manager.trace.join(',')).assertEqual('create,list');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_1800
     * @tc.name testCalendarManagerRecovery030018
     * @tc.desc sync list failure then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030018';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getAllCalendars();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_1900
     * @tc.name testCalendarManagerRecovery030019
     * @tc.desc sync list failure then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030019';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getAllCalendars();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list,default,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_2000
     * @tc.name testCalendarManagerRecovery030020
     * @tc.desc sync list failure then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030020';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getAllCalendars();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_2100
     * @tc.name testCalendarManagerRecovery030021
     * @tc.desc sync list failure then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030021';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.getAllCalendars();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,list');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_2200
     * @tc.name testCalendarManagerRecovery030022
     * @tc.desc sync config failure then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030022';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'config';
            manager.synchronous = true;
            manager.named.failure = manager.failure;
            manager.named.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.setConfig();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_2300
     * @tc.name testCalendarManagerRecovery030023
     * @tc.desc sync config failure then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030023';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'config';
            manager.synchronous = true;
            manager.named.failure = manager.failure;
            manager.named.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.setConfig();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_2400
     * @tc.name testCalendarManagerRecovery030024
     * @tc.desc sync config failure then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030024';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'config';
            manager.synchronous = true;
            manager.named.failure = manager.failure;
            manager.named.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.setConfig();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,named');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,named');
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
            expect(manager.trace.join(',')).assertEqual('create,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_03_2500
     * @tc.name testCalendarManagerRecovery030025
     * @tc.desc sync config failure then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery030025';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'config';
            manager.synchronous = true;
            manager.named.failure = manager.failure;
            manager.named.synchronous = true;
            let rejected: boolean = false;