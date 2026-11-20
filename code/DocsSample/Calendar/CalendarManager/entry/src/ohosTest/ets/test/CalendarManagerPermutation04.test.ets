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
import { MatrixPermissionRecorder, MatrixScope } from './CalendarMatrixSupport';
import type { MatrixOutcome, MatrixPending } from './CalendarMatrixSupport';

export default function calendarManagerPermutation04Test(): void {
  describe('CalendarManagerPermutation04Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_04_0100
     * @tc.name testCalendarManagerPermutation040001
     * @tc.desc DDD, finish 120; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation040001';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, -1]
            };
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, -1]
            };
            const pending1: MatrixPending<PermissionRequestResult> = scope.pending(input1);
            const request1: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending1.promise, recorder));
            const input2: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, -1]
            };
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('denied');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('denied');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(1);
            expect(recorder.failures).assertEqual(0);
            expect(recorder.denied[0] === input2).assertEqual(true);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('denied,granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_04_0200
     * @tc.name testCalendarManagerPermutation040002
     * @tc.desc DDD, finish 201; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation040002';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, -1]
            };
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, -1]
            };
            const pending1: MatrixPending<PermissionRequestResult> = scope.pending(input1);
            const request1: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending1.promise, recorder));
            const input2: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, -1]
            };
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('denied');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('denied');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('denied');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(1);
            expect(recorder.failures).assertEqual(0);
            expect(recorder.denied[0] === input2).assertEqual(true);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('denied,granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_04_0300
     * @tc.name testCalendarManagerPermutation040003
     * @tc.desc DDD, finish 210; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation040003';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, -1]
            };
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, -1]
            };
            const pending1: MatrixPending<PermissionRequestResult> = scope.pending(input1);
            const request1: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending1.promise, recorder));
            const input2: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, -1]
            };
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('denied');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('denied');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('denied');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(1);
            expect(recorder.failures).assertEqual(0);
            expect(recorder.denied[0] === input2).assertEqual(true);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('denied,granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_04_0400
     * @tc.name testCalendarManagerPermutation040004
     * @tc.desc DDR, finish 012; latest callback only and fresh request recovery.