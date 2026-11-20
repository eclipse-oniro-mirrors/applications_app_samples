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

export default function calendarManagerSequence01Test(): void {
  describe('CalendarManagerSequence01Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_0100
     * @tc.name testCalendarManagerSequence010001
     * @tc.desc create then create then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010001';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            const created3: MatrixCalendar = new MatrixCalendar('created3');
            manager.nextCalendar = created3;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created3).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created3');
            expect(manager.creationAccounts[3].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[3].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[3].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[3] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create,create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[3]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,create,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_0200
     * @tc.name testCalendarManagerSequence010002
     * @tc.desc create then create then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010002';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
          {
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_0300
     * @tc.name testCalendarManagerSequence010003
     * @tc.desc create then create then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010003';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(3);
            expect(manager.trace.join(',')).assertEqual('create,create,create');
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
            expect(manager.trace.join(',')).assertEqual('create,create,create');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_0400
     * @tc.name testCalendarManagerSequence010004
     * @tc.desc create then create then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010004';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,create,create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[2]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,create,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_0500
     * @tc.name testCalendarManagerSequence010005
     * @tc.desc create then create then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010005';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,create,default');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[2]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,create,default,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_0600
     * @tc.name testCalendarManagerSequence010006
     * @tc.desc create then create then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010006';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,create,list');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[2]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,create,list,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_0700
     * @tc.name testCalendarManagerSequence010007
     * @tc.desc create then create then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010007';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,create,create,named');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created2');
            expect(manager.deleted[0] === manager.creationHandles[2]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,create,named,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_0800
     * @tc.name testCalendarManagerSequence010008
     * @tc.desc create then delete then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010008';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created1');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,delete');
            expect(manager.deleted.length).assertEqual(1);
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
            expect(manager.trace.join(',')).assertEqual('create,create,delete,create');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[1].getAccount().name).assertEqual('created3');
            expect(manager.deleted[1] === manager.creationHandles[2]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,delete,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_0900
     * @tc.name testCalendarManagerSequence010009
     * @tc.desc create then delete then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010009';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created1');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_1000
     * @tc.name testCalendarManagerSequence010010
     * @tc.desc create then delete then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010010';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created1');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(2);
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_1100
     * @tc.name testCalendarManagerSequence010011
     * @tc.desc create then delete then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010011';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created1');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            const returned: AccountCalendarPort = await session.getCalendarByParam();
            expect(returned === manager.named).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('named');
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.displayName).assertEqual('MyCalendar');
            expect(manager.lookupAccounts[0]?.type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.trace.join(',')).assertEqual('create,create,delete,named');
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
            expect(manager.trace.join(',')).assertEqual('create,create,delete,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_1200
     * @tc.name testCalendarManagerSequence010012
     * @tc.desc create then delete then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010012';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created1');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            const returned: AccountCalendarPort = await session.getDefaultCalendar();
            expect(returned === manager.defaultCalendar).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('default');
            expect(manager.lookupAccounts[0] === undefined).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,delete,default');
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
            expect(manager.trace.join(',')).assertEqual('create,create,delete,default');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_1300
     * @tc.name testCalendarManagerSequence010013
     * @tc.desc create then delete then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010013';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created1');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            const returned: AccountCalendarPort[] = await session.getAllCalendars();
            expect(returned === manager.all).assertEqual(true);
            expect(returned.length).assertEqual(3);
            expect(returned[0] === manager.defaultCalendar).assertEqual(true);
            expect(returned[1] === manager.named).assertEqual(true);
            expect(returned[2] === manager.defaultCalendar).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,delete,list');
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
            expect(manager.trace.join(',')).assertEqual('create,create,delete,list');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_1400
     * @tc.name testCalendarManagerSequence010014
     * @tc.desc create then delete then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010014';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created1');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            await session.setConfig();
            expect(manager.lookupAccounts[0]?.name).assertEqual('MyCalendar');
            expect(manager.named.configurations[0].enableReminder).assertEqual(true);
            expect(manager.named.configurations[0].color).assertEqual('#aabbcc');
            expect(manager.defaultCalendar.configurations.length).assertEqual(0);
            expect(manager.trace.join(',')).assertEqual('create,create,delete,named');
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
            expect(manager.trace.join(',')).assertEqual('create,create,delete,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_1500
     * @tc.name testCalendarManagerSequence010015
     * @tc.desc create then clear then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010015';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(2);
            expect(manager.trace.join(',')).assertEqual('create,create');
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
            expect(manager.trace.join(',')).assertEqual('create,create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_1600
     * @tc.name testCalendarManagerSequence010016
     * @tc.desc create then clear then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010016';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_1700
     * @tc.name testCalendarManagerSequence010017
     * @tc.desc create then clear then clear; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010017';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(2);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_1800
     * @tc.name testCalendarManagerSequence010018
     * @tc.desc create then clear then named; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010018';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(2);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_1900
     * @tc.name testCalendarManagerSequence010019
     * @tc.desc create then clear then default; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010019';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(2);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,default');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_2000
     * @tc.name testCalendarManagerSequence010020
     * @tc.desc create then clear then list; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010020';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(2);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,list');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_2100
     * @tc.name testCalendarManagerSequence010021
     * @tc.desc create then clear then config; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010021';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            session.clear();
            expect(manager.creationAccounts.length).assertEqual(2);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {
              rejected = true;
              expect((error as Error).message).assertEqual('Calendar has not been created');
            }
            expect(rejected).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,named');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_2200
     * @tc.name testCalendarManagerSequence010022
     * @tc.desc create then named then create; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010022';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            const created3: MatrixCalendar = new MatrixCalendar('created3');
            manager.nextCalendar = created3;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created3).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created3');
            expect(manager.creationAccounts[2].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[2].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[2].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[2] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create,named,create');
            expect(manager.deleted.length).assertEqual(0);
          }
          {
            await session.deleteCalendar();
            expect(manager.deleted[0].getAccount().name).assertEqual('created3');
            expect(manager.deleted[0] === manager.creationHandles[2]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,named,create,delete');
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
     * @tc.number SUB_CALENDAR_MANAGER_SEQUENCE_01_2300
     * @tc.name testCalendarManagerSequence010023
     * @tc.desc create then named then delete; verify ownership and recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerSequence010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerSequence010023';
        console.info(`${TAG} start`);
        try {
          const manager: MatrixManager = new MatrixManager();
          const session: CalendarAccountSession = new CalendarAccountSession(manager);
          const seed: MatrixCalendar = manager.nextCalendar;
          const seeded: AccountCalendarPort = await session.createCalendar();
          expect(seeded === seed).assertEqual(true);
          {
            const created1: MatrixCalendar = new MatrixCalendar('created1');
            manager.nextCalendar = created1;
            const returned: AccountCalendarPort = await session.createCalendar();
            expect(returned === created1).assertEqual(true);
            expect(returned.getAccount().name).assertEqual('created1');
            expect(manager.creationAccounts[1].name).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].displayName).assertEqual('MyCalendar');
            expect(manager.creationAccounts[1].type).assertEqual(calendarManager.CalendarType.LOCAL);
            expect(manager.creationAccounts[1] === manager.creationAccounts[0]).assertEqual(false);
            expect(manager.trace.join(',')).assertEqual('create,create');
            expect(manager.deleted.length).assertEqual(0);
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
            expect(manager.deleted[0].getAccount().name).assertEqual('created1');
            expect(manager.deleted[0] === manager.creationHandles[1]).assertEqual(true);
            expect(manager.trace.join(',')).assertEqual('create,create,named,delete');
            expect(manager.deleted.length).assertEqual(1);
          }
          {
            let rejected: boolean = false;
            try {
              await session.deleteCalendar();
            } catch (error) {