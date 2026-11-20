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

export default function calendarManagerValidation04Test(): void {
  describe('CalendarManagerValidation04Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_0100
     * @tc.name testCalendarManagerValidation040001
     * @tc.desc missingRead permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040001';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_0200
     * @tc.name testCalendarManagerValidation040002
     * @tc.desc missingRead permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040002';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_0300
     * @tc.name testCalendarManagerValidation040003
     * @tc.desc missingRead permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040003';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_0400
     * @tc.name testCalendarManagerValidation040004
     * @tc.desc missingRead permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040004';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_0500
     * @tc.name testCalendarManagerValidation040005
     * @tc.desc missingRead permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040005';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_0600
     * @tc.name testCalendarManagerValidation040006
     * @tc.desc missingRead permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040006';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_0700
     * @tc.name testCalendarManagerValidation040007
     * @tc.desc missingRead permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040007';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_0800
     * @tc.name testCalendarManagerValidation040008
     * @tc.desc missingRead permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040008';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_0900
     * @tc.name testCalendarManagerValidation040009
     * @tc.desc missingRead permissions with noCodes; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040009';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_1000
     * @tc.name testCalendarManagerValidation040010
     * @tc.desc missingRead permissions with extraCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040010';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.WRITE_CALENDAR'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_1100
     * @tc.name testCalendarManagerValidation040011
     * @tc.desc noPermissions permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040011';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: [],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_1200
     * @tc.name testCalendarManagerValidation040012
     * @tc.desc noPermissions permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040012';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: [],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_1300
     * @tc.name testCalendarManagerValidation040013
     * @tc.desc noPermissions permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040013';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: [],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_1400
     * @tc.name testCalendarManagerValidation040014
     * @tc.desc noPermissions permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040014';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: [],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_1500
     * @tc.name testCalendarManagerValidation040015
     * @tc.desc noPermissions permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040015';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: [],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_1600
     * @tc.name testCalendarManagerValidation040016
     * @tc.desc noPermissions permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040016';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: [],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_1700
     * @tc.name testCalendarManagerValidation040017
     * @tc.desc noPermissions permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040017';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: [],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_1800
     * @tc.name testCalendarManagerValidation040018
     * @tc.desc noPermissions permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040018';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: [],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_1900
     * @tc.name testCalendarManagerValidation040019
     * @tc.desc noPermissions permissions with noCodes; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040019';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: [],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_2000
     * @tc.name testCalendarManagerValidation040020
     * @tc.desc noPermissions permissions with extraCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040020';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: [],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_2100
     * @tc.name testCalendarManagerValidation040021
     * @tc.desc extraPermission permissions with grant; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040021';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.WRITE_CALENDAR',
    'other'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_2200
     * @tc.name testCalendarManagerValidation040022
     * @tc.desc extraPermission permissions with readDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040022';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.WRITE_CALENDAR',
    'other'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_2300
     * @tc.name testCalendarManagerValidation040023
     * @tc.desc extraPermission permissions with writeDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040023';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.WRITE_CALENDAR',
    'other'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_2400
     * @tc.name testCalendarManagerValidation040024
     * @tc.desc extraPermission permissions with bothDenied; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040024';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.WRITE_CALENDAR',
    'other'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_2500
     * @tc.name testCalendarManagerValidation040025
     * @tc.desc extraPermission permissions with positiveCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040025';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.WRITE_CALENDAR',
    'other'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_2600
     * @tc.name testCalendarManagerValidation040026
     * @tc.desc extraPermission permissions with nanCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040026';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.WRITE_CALENDAR',
    'other'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_2700
     * @tc.name testCalendarManagerValidation040027
     * @tc.desc extraPermission permissions with infiniteCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040027';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.WRITE_CALENDAR',
    'other'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_2800
     * @tc.name testCalendarManagerValidation040028
     * @tc.desc extraPermission permissions with missingCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040028';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.WRITE_CALENDAR',
    'other'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_2900
     * @tc.name testCalendarManagerValidation040029
     * @tc.desc extraPermission permissions with noCodes; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040029';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.WRITE_CALENDAR',
    'other'],
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
     * @tc.number SUB_CALENDAR_MANAGER_VALIDATION_04_3000
     * @tc.name testCalendarManagerValidation040030
     * @tc.desc extraPermission permissions with extraCode; validate exact dual grant and unchanged SDK result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerValidation040030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerValidation040030';
        console.info(`${TAG} start`);
        try {
          const input: PermissionRequestResult = {
            permissions: ['ohos.permission.READ_CALENDAR',
    'ohos.permission.WRITE_CALENDAR',
    'other'],
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
