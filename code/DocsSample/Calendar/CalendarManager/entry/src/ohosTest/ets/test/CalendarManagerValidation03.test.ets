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

export default function calendarManagerValidation03Test(): void {
  describe('CalendarManagerValidation03Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_0100
     * @tc.name testCalendarManagerValidation030001
     * @tc.desc caseChanged permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030001';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.read_calendar',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_0200
     * @tc.name testCalendarManagerValidation030002
     * @tc.desc caseChanged permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030002';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.read_calendar',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_0300
     * @tc.name testCalendarManagerValidation030003
     * @tc.desc caseChanged permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030003';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.read_calendar',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_0400
     * @tc.name testCalendarManagerValidation030004
     * @tc.desc caseChanged permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030004';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.read_calendar',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_0500
     * @tc.name testCalendarManagerValidation030005
     * @tc.desc caseChanged permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030005';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.read_calendar',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_0600
     * @tc.name testCalendarManagerValidation030006
     * @tc.desc caseChanged permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030006';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.read_calendar',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_0700
     * @tc.name testCalendarManagerValidation030007
     * @tc.desc caseChanged permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030007';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.read_calendar',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_0800
     * @tc.name testCalendarManagerValidation030008
     * @tc.desc caseChanged permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030008';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.read_calendar',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_0900
     * @tc.name testCalendarManagerValidation030009
     * @tc.desc caseChanged permissions with noCodes; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030009';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.read_calendar',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_1000
     * @tc.name testCalendarManagerValidation030010
     * @tc.desc caseChanged permissions with extraCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030010';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.read_calendar',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_1100
     * @tc.name testCalendarManagerValidation030011
     * @tc.desc trailingSpace permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030011';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR ',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_1200
     * @tc.name testCalendarManagerValidation030012
     * @tc.desc trailingSpace permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030012';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR ',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_1300
     * @tc.name testCalendarManagerValidation030013
     * @tc.desc trailingSpace permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030013';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR ',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_1400
     * @tc.name testCalendarManagerValidation030014
     * @tc.desc trailingSpace permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030014';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR ',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_1500
     * @tc.name testCalendarManagerValidation030015
     * @tc.desc trailingSpace permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030015';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR ',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_1600
     * @tc.name testCalendarManagerValidation030016
     * @tc.desc trailingSpace permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030016';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR ',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_1700
     * @tc.name testCalendarManagerValidation030017
     * @tc.desc trailingSpace permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030017';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR ',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_1800
     * @tc.name testCalendarManagerValidation030018
     * @tc.desc trailingSpace permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030018';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR ',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_1900
     * @tc.name testCalendarManagerValidation030019
     * @tc.desc trailingSpace permissions with noCodes; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030019';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR ',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_2000
     * @tc.name testCalendarManagerValidation030020
     * @tc.desc trailingSpace permissions with extraCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030020';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR ',
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_2100
     * @tc.name testCalendarManagerValidation030021
     * @tc.desc missingWrite permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030021';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_2200
     * @tc.name testCalendarManagerValidation030022
     * @tc.desc missingWrite permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030022';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_2300
     * @tc.name testCalendarManagerValidation030023
     * @tc.desc missingWrite permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030023';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_2400
     * @tc.name testCalendarManagerValidation030024
     * @tc.desc missingWrite permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030024';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_2500
     * @tc.name testCalendarManagerValidation030025
     * @tc.desc missingWrite permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030025';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_2600
     * @tc.name testCalendarManagerValidation030026
     * @tc.desc missingWrite permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030026';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_2700
     * @tc.name testCalendarManagerValidation030027
     * @tc.desc missingWrite permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030027';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_2800
     * @tc.name testCalendarManagerValidation030028
     * @tc.desc missingWrite permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030028';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_2900
     * @tc.name testCalendarManagerValidation030029
     * @tc.desc missingWrite permissions with noCodes; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030029';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_03_3000
     * @tc.name testCalendarManagerValidation030030
     * @tc.desc missingWrite permissions with extraCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation030030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation030030';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR'],
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
