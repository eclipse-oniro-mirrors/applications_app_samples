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
import type { PermissionRequestResult } from '@kit.AbilityKit';
import { expect } from './TestSupport';
import { CalendarPermissionGate, hasCalendarPermissions } from '../../../main/ets/CalendarPermission';
import { MatrixPermissionRecorder } from './CalendarMatrixSupport';

export default function calendarManagerValidation02Test(): void {
  describe('CalendarManagerValidation02Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_0100
     * @tc.name testCalendarManagerValidation020001
     * @tc.desc duplicateWrite permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020001';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_0200
     * @tc.name testCalendarManagerValidation020002
     * @tc.desc duplicateWrite permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020002';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [-1, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_0300
     * @tc.name testCalendarManagerValidation020003
     * @tc.desc duplicateWrite permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020003';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, -1]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_0400
     * @tc.name testCalendarManagerValidation020004
     * @tc.desc duplicateWrite permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020004';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [-1, -1]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_0500
     * @tc.name testCalendarManagerValidation020005
     * @tc.desc duplicateWrite permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020005';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [1, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_0600
     * @tc.name testCalendarManagerValidation020006
     * @tc.desc duplicateWrite permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020006';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [NaN, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_0700
     * @tc.name testCalendarManagerValidation020007
     * @tc.desc duplicateWrite permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020007';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, Infinity]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_0800
     * @tc.name testCalendarManagerValidation020008
     * @tc.desc duplicateWrite permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020008';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_0900
     * @tc.name testCalendarManagerValidation020009
     * @tc.desc duplicateWrite permissions with noCodes; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020009';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: []
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_1000
     * @tc.name testCalendarManagerValidation020010
     * @tc.desc duplicateWrite permissions with extraCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020010';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, 0, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_1100
     * @tc.name testCalendarManagerValidation020011
     * @tc.desc emptyName permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020011';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_1200
     * @tc.name testCalendarManagerValidation020012
     * @tc.desc emptyName permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020012';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [-1, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_1300
     * @tc.name testCalendarManagerValidation020013
     * @tc.desc emptyName permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020013';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, -1]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_1400
     * @tc.name testCalendarManagerValidation020014
     * @tc.desc emptyName permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020014';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [-1, -1]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_1500
     * @tc.name testCalendarManagerValidation020015
     * @tc.desc emptyName permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020015';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [1, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_1600
     * @tc.name testCalendarManagerValidation020016
     * @tc.desc emptyName permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020016';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [NaN, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_1700
     * @tc.name testCalendarManagerValidation020017
     * @tc.desc emptyName permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020017';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, Infinity]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_1800
     * @tc.name testCalendarManagerValidation020018
     * @tc.desc emptyName permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020018';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_1900
     * @tc.name testCalendarManagerValidation020019
     * @tc.desc emptyName permissions with noCodes; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020019';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: []
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_2000
     * @tc.name testCalendarManagerValidation020020
     * @tc.desc emptyName permissions with extraCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020020';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, 0, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_2100
     * @tc.name testCalendarManagerValidation020021
     * @tc.desc unknownName permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020021';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['other',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_2200
     * @tc.name testCalendarManagerValidation020022
     * @tc.desc unknownName permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020022';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['other',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [-1, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_2300
     * @tc.name testCalendarManagerValidation020023
     * @tc.desc unknownName permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020023';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['other',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, -1]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_2400
     * @tc.name testCalendarManagerValidation020024
     * @tc.desc unknownName permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020024';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['other',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [-1, -1]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_2500
     * @tc.name testCalendarManagerValidation020025
     * @tc.desc unknownName permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020025';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['other',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [1, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_2600
     * @tc.name testCalendarManagerValidation020026
     * @tc.desc unknownName permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020026';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['other',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [NaN, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_2700
     * @tc.name testCalendarManagerValidation020027
     * @tc.desc unknownName permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020027';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['other',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, Infinity]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_2800
     * @tc.name testCalendarManagerValidation020028
     * @tc.desc unknownName permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020028';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['other',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_2900
     * @tc.name testCalendarManagerValidation020029
     * @tc.desc unknownName permissions with noCodes; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020029';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['other',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: []
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_02_3000
     * @tc.name testCalendarManagerValidation020030
     * @tc.desc unknownName permissions with extraCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation020030';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['other',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, 0, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(false);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('denied');
          expect(recorder.granted.length).assertEqual(0);
          expect(recorder.denied.length).assertEqual(1);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.denied[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(false);
        } finally {
          console.info(`${TAG} end`);
        }
      });
  });
}
