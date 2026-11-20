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

export default function calendarManagerRecovery02Test(): void {
  describe('CalendarManagerRecovery02Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_0100
     * @tc.name testCalendarManagerRecovery020001
     * @tc.desc reject list failure then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020001';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_0200
     * @tc.name testCalendarManagerRecovery020002
     * @tc.desc reject list failure then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020002';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_0300
     * @tc.name testCalendarManagerRecovery020003
     * @tc.desc reject list failure then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020003';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_0400
     * @tc.name testCalendarManagerRecovery020004
     * @tc.desc reject list failure then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020004';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_0500
     * @tc.name testCalendarManagerRecovery020005
     * @tc.desc reject list failure then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020005';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_0600
     * @tc.name testCalendarManagerRecovery020006
     * @tc.desc reject list failure then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020006';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_0700
     * @tc.name testCalendarManagerRecovery020007
     * @tc.desc reject list failure then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020007';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'list';
            manager.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_0800
     * @tc.name testCalendarManagerRecovery020008
     * @tc.desc reject config failure then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020008';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'config';
            manager.synchronous = false;
            manager.named.failure = manager.failure;
            manager.named.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_0900
     * @tc.name testCalendarManagerRecovery020009
     * @tc.desc reject config failure then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020009';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'config';
            manager.synchronous = false;
            manager.named.failure = manager.failure;
            manager.named.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_1000
     * @tc.name testCalendarManagerRecovery020010
     * @tc.desc reject config failure then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020010';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'config';
            manager.synchronous = false;
            manager.named.failure = manager.failure;
            manager.named.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_1100
     * @tc.name testCalendarManagerRecovery020011
     * @tc.desc reject config failure then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020011';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'config';
            manager.synchronous = false;
            manager.named.failure = manager.failure;
            manager.named.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_1200
     * @tc.name testCalendarManagerRecovery020012
     * @tc.desc reject config failure then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020012';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'config';
            manager.synchronous = false;
            manager.named.failure = manager.failure;
            manager.named.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_1300
     * @tc.name testCalendarManagerRecovery020013
     * @tc.desc reject config failure then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020013';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'config';
            manager.synchronous = false;
            manager.named.failure = manager.failure;
            manager.named.synchronous = false;
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_1400
     * @tc.name testCalendarManagerRecovery020014
     * @tc.desc reject config failure then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020014';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'config';
            manager.synchronous = false;
            manager.named.failure = manager.failure;
            manager.named.synchronous = false;
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
            await session.setConfig();
            expect(manager.lookupAccounts[1]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[1].enableReminder).assertEqual(true);
            expect(manager.named.configurations[1].color).assertEqual('#aabbcc');
            expect(manager.named.configurations[1] === manager.named.configurations[0]).assertEqual(false);
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_1500
     * @tc.name testCalendarManagerRecovery020015
     * @tc.desc sync create failure then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020015';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'create';
            manager.synchronous = true;
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            let rejected: boolean = false;
            try {
              await session.createCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
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
            expect(manager.creationAccounts[2].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[2].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[2].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[2] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[2]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_1600
     * @tc.name testCalendarManagerRecovery020016
     * @tc.desc sync create failure then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020016';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'create';
            manager.synchronous = true;
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            let rejected: boolean = false;
            try {
              await session.createCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_1700
     * @tc.name testCalendarManagerRecovery020017
     * @tc.desc sync create failure then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020017';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'create';
            manager.synchronous = true;
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            let rejected: boolean = false;
            try {
              await session.createCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(2);
            expect(manager.trace.join(',')).assertEqual('create,create');
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
            expect(manager.trace.join(',')).assertEqual('create,create');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_1800
     * @tc.name testCalendarManagerRecovery020018
     * @tc.desc sync create failure then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020018';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'create';
            manager.synchronous = true;
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            let rejected: boolean = false;
            try {
              await session.createCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
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
            expect(manager.trace.join(',')).assertEqual('create,create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_1900
     * @tc.name testCalendarManagerRecovery020019
     * @tc.desc sync create failure then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020019';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'create';
            manager.synchronous = true;
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            let rejected: boolean = false;
            try {
              await session.createCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
            manager.failureOn = '';
            manager.named.failure = undefined;
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,default,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_2000
     * @tc.name testCalendarManagerRecovery020020
     * @tc.desc sync create failure then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020020';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'create';
            manager.synchronous = true;
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            let rejected: boolean = false;
            try {
              await session.createCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
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
            expect(manager.trace.join(',')).assertEqual('create,create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,list,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_2100
     * @tc.name testCalendarManagerRecovery020021
     * @tc.desc sync create failure then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020021';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'create';
            manager.synchronous = true;
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            let rejected: boolean = false;
            try {
              await session.createCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
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
            expect(manager.trace.join(',')).assertEqual('create,create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_2200
     * @tc.name testCalendarManagerRecovery020022
     * @tc.desc sync delete failure then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020022';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'delete';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,delete');
            expect(manager.deleted.length).assertEqual(1);
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
            expect(manager.trace.join(',')).assertEqual('create,delete,create');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[1].getAccount().name).assertEqual('created2');
            expect(manager.deleted[1] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,delete,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_2300
     * @tc.name testCalendarManagerRecovery020023
     * @tc.desc sync delete failure then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020023';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'delete';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,delete');
            expect(manager.deleted.length).assertEqual(1);
            manager.failureOn = '';
            manager.named.failure = undefined;
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[1].getAccount().name).assertEqual('seed');
            expect(manager.deleted[1] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,delete,delete');
            expect(manager.deleted.length).assertEqual(2);
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
            expect(manager.trace.join(',')).assertEqual('create,delete,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_2400
     * @tc.name testCalendarManagerRecovery020024
     * @tc.desc sync delete failure then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerRecovery020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerRecovery020024';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            manager.failureOn = 'delete';
            manager.synchronous = true;
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('matrix port failure');
              expect(error === manager.failure).assertEqual(true);
            }
            expect(rejected).assertEqual(true);
            expect(manager.deleted[0].getAccount().name).assertEqual('seed');
            expect(manager.deleted[0] === manager.creationHandles[0]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,delete');
            expect(manager.deleted.length).assertEqual(1);
            manager.failureOn = '';
            manager.named.failure = undefined;
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(1);
            expect(manager.trace.join(',')).assertEqual('create,delete');
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
            expect(manager.trace.join(',')).assertEqual('create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_RECOVERY_02_2500
     * @tc.name testCalendarManagerRecovery020025