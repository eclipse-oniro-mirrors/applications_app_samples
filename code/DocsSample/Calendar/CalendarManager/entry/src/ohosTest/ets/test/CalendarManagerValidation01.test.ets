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

export default function calendarManagerValidation01Test(): void {
  describe('CalendarManagerValidation01Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_0100
     * @tc.name testCalendarManagerValidation010001
     * @tc.desc readWrite permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010001';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.WRITE_CALENDAR'],
            authResults: [0, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(true);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('granted');
          expect(recorder.granted.length).assertEqual(1);
          expect(recorder.denied.length).assertEqual(0);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.granted[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_0200
     * @tc.name testCalendarManagerValidation010002
     * @tc.desc readWrite permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010002';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_0300
     * @tc.name testCalendarManagerValidation010003
     * @tc.desc readWrite permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010003';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_0400
     * @tc.name testCalendarManagerValidation010004
     * @tc.desc readWrite permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010004';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_0500
     * @tc.name testCalendarManagerValidation010005
     * @tc.desc readWrite permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010005';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_0600
     * @tc.name testCalendarManagerValidation010006
     * @tc.desc readWrite permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010006';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_0700
     * @tc.name testCalendarManagerValidation010007
     * @tc.desc readWrite permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010007';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_0800
     * @tc.name testCalendarManagerValidation010008
     * @tc.desc readWrite permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010008';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_0900
     * @tc.name testCalendarManagerValidation010009
     * @tc.desc readWrite permissions with noCodes; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010009';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_1000
     * @tc.name testCalendarManagerValidation010010
     * @tc.desc readWrite permissions with extraCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010010';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_1100
     * @tc.name testCalendarManagerValidation010011
     * @tc.desc writeRead permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010011';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
            authResults: [0, 0]
          };
          const beforePermissions: string = input.permissions.join(',');
          const beforeResults: string = input.authResults.join(',');
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          expect(hasCalendarPermissions(input)).assertEqual(true);
          const returned: PermissionRequestResult = await gate.request(
            (): Promise<PermissionRequestResult> => Promise.resolve(input), recorder);
          expect(returned === input).assertEqual(true);
          expect(recorder.trace.join(',')).assertEqual('granted');
          expect(recorder.granted.length).assertEqual(1);
          expect(recorder.denied.length).assertEqual(0);
          expect(recorder.failures).assertEqual(0);
          expect(recorder.granted[0] === input).assertEqual(true);
          expect(input.permissions.join(',')).assertEqual(beforePermissions);
          expect(input.authResults.join(',')).assertEqual(beforeResults);
          expect(hasCalendarPermissions(input)).assertEqual(true);
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_1200
     * @tc.name testCalendarManagerValidation010012
     * @tc.desc writeRead permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010012';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_1300
     * @tc.name testCalendarManagerValidation010013
     * @tc.desc writeRead permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010013';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_1400
     * @tc.name testCalendarManagerValidation010014
     * @tc.desc writeRead permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010014';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_1500
     * @tc.name testCalendarManagerValidation010015
     * @tc.desc writeRead permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010015';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_1600
     * @tc.name testCalendarManagerValidation010016
     * @tc.desc writeRead permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010016';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_1700
     * @tc.name testCalendarManagerValidation010017
     * @tc.desc writeRead permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010017';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_1800
     * @tc.name testCalendarManagerValidation010018
     * @tc.desc writeRead permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010018';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_1900
     * @tc.name testCalendarManagerValidation010019
     * @tc.desc writeRead permissions with noCodes; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010019';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_2000
     * @tc.name testCalendarManagerValidation010020
     * @tc.desc writeRead permissions with extraCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010020';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_2100
     * @tc.name testCalendarManagerValidation010021
     * @tc.desc duplicateRead permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010021';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_2200
     * @tc.name testCalendarManagerValidation010022
     * @tc.desc duplicateRead permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010022';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_2300
     * @tc.name testCalendarManagerValidation010023
     * @tc.desc duplicateRead permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010023';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_2400
     * @tc.name testCalendarManagerValidation010024
     * @tc.desc duplicateRead permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010024';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_2500
     * @tc.name testCalendarManagerValidation010025
     * @tc.desc duplicateRead permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010025';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_2600
     * @tc.name testCalendarManagerValidation010026
     * @tc.desc duplicateRead permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010026';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_2700
     * @tc.name testCalendarManagerValidation010027
     * @tc.desc duplicateRead permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010027';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_01_2800
     * @tc.name testCalendarManagerValidation010028
     * @tc.desc duplicateRead permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation010028';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.READ_CALENDAR'],
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