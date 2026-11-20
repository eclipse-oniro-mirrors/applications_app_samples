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

export default function calendarManagerPermutation06Test(): void {
  describe('CalendarManagerPermutation06Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_0100
     * @tc.name testCalendarManagerPermutation060001
     * @tc.desc RDD, finish 120; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060001';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
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
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_0200
     * @tc.name testCalendarManagerPermutation060002
     * @tc.desc RDD, finish 201; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060002';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
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
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_0300
     * @tc.name testCalendarManagerPermutation060003
     * @tc.desc RDD, finish 210; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060003';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
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
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_0400
     * @tc.name testCalendarManagerPermutation060004
     * @tc.desc RDR, finish 012; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060004';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
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
              authResults: [0, 0]
            };
            const error2: Error = new Error('request 2 rejected');
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.reject(error2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.error === error2).assertEqual(true);
            expect(outcome2.error?.message).assertEqual('request 2 rejected');
            expect(outcome2.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(1);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed,granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_0500
     * @tc.name testCalendarManagerPermutation060005
     * @tc.desc RDR, finish 021; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060005';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
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
              authResults: [0, 0]
            };
            const error2: Error = new Error('request 2 rejected');
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.reject(error2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.error === error2).assertEqual(true);
            expect(outcome2.error?.message).assertEqual('request 2 rejected');
            expect(outcome2.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('failed');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(1);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed,granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_0600
     * @tc.name testCalendarManagerPermutation060006
     * @tc.desc RDR, finish 102; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060006';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
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
              authResults: [0, 0]
            };
            const error2: Error = new Error('request 2 rejected');
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
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.reject(error2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.error === error2).assertEqual(true);
            expect(outcome2.error?.message).assertEqual('request 2 rejected');
            expect(outcome2.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(1);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed,granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_0700
     * @tc.name testCalendarManagerPermutation060007
     * @tc.desc RDR, finish 120; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060007';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
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
              authResults: [0, 0]
            };
            const error2: Error = new Error('request 2 rejected');
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
            pending2.reject(error2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.error === error2).assertEqual(true);
            expect(outcome2.error?.message).assertEqual('request 2 rejected');
            expect(outcome2.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(1);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed,granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_0800
     * @tc.name testCalendarManagerPermutation060008
     * @tc.desc RDR, finish 201; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060008';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
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
              authResults: [0, 0]
            };
            const error2: Error = new Error('request 2 rejected');
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.reject(error2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.error === error2).assertEqual(true);
            expect(outcome2.error?.message).assertEqual('request 2 rejected');
            expect(outcome2.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('failed');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(1);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed,granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_0900
     * @tc.name testCalendarManagerPermutation060009
     * @tc.desc RDR, finish 210; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060009';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
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
              authResults: [0, 0]
            };
            const error2: Error = new Error('request 2 rejected');
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.reject(error2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.error === error2).assertEqual(true);
            expect(outcome2.error?.message).assertEqual('request 2 rejected');
            expect(outcome2.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('failed');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(1);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('failed,granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_1000
     * @tc.name testCalendarManagerPermutation060010
     * @tc.desc RRG, finish 012; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060010';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, 0]
            };
            const error1: Error = new Error('request 1 rejected');
            const pending1: MatrixPending<PermissionRequestResult> = scope.pending(input1);
            const request1: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending1.promise, recorder));
            const input2: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.reject(error1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.error === error1).assertEqual(true);
            expect(outcome1.error?.message).assertEqual('request 1 rejected');
            expect(outcome1.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted.length).assertEqual(1);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            expect(recorder.granted[0] === input2).assertEqual(true);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted,granted');
            expect(recorder.granted[1] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_1100
     * @tc.name testCalendarManagerPermutation060011
     * @tc.desc RRG, finish 021; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060011';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, 0]
            };
            const error1: Error = new Error('request 1 rejected');
            const pending1: MatrixPending<PermissionRequestResult> = scope.pending(input1);
            const request1: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending1.promise, recorder));
            const input2: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            pending1.reject(error1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.error === error1).assertEqual(true);
            expect(outcome1.error?.message).assertEqual('request 1 rejected');
            expect(outcome1.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted.length).assertEqual(1);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            expect(recorder.granted[0] === input2).assertEqual(true);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted,granted');
            expect(recorder.granted[1] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_1200
     * @tc.name testCalendarManagerPermutation060012
     * @tc.desc RRG, finish 102; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060012';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, 0]
            };
            const error1: Error = new Error('request 1 rejected');
            const pending1: MatrixPending<PermissionRequestResult> = scope.pending(input1);
            const request1: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending1.promise, recorder));
            const input2: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.reject(error1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.error === error1).assertEqual(true);
            expect(outcome1.error?.message).assertEqual('request 1 rejected');
            expect(outcome1.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted.length).assertEqual(1);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            expect(recorder.granted[0] === input2).assertEqual(true);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted,granted');
            expect(recorder.granted[1] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_1300
     * @tc.name testCalendarManagerPermutation060013
     * @tc.desc RRG, finish 120; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060013';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, 0]
            };
            const error1: Error = new Error('request 1 rejected');
            const pending1: MatrixPending<PermissionRequestResult> = scope.pending(input1);
            const request1: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending1.promise, recorder));
            const input2: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.reject(error1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.error === error1).assertEqual(true);
            expect(outcome1.error?.message).assertEqual('request 1 rejected');
            expect(outcome1.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted.length).assertEqual(1);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            expect(recorder.granted[0] === input2).assertEqual(true);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted,granted');
            expect(recorder.granted[1] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_1400
     * @tc.name testCalendarManagerPermutation060014
     * @tc.desc RRG, finish 201; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060014';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, 0]
            };
            const error1: Error = new Error('request 1 rejected');
            const pending1: MatrixPending<PermissionRequestResult> = scope.pending(input1);
            const request1: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending1.promise, recorder));
            const input2: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            pending1.reject(error1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.error === error1).assertEqual(true);
            expect(outcome1.error?.message).assertEqual('request 1 rejected');
            expect(outcome1.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted.length).assertEqual(1);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            expect(recorder.granted[0] === input2).assertEqual(true);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted,granted');
            expect(recorder.granted[1] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_1500
     * @tc.name testCalendarManagerPermutation060015
     * @tc.desc RRG, finish 210; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060015';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, 0]
            };
            const error1: Error = new Error('request 1 rejected');
            const pending1: MatrixPending<PermissionRequestResult> = scope.pending(input1);
            const request1: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending1.promise, recorder));
            const input2: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            pending1.reject(error1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.error === error1).assertEqual(true);
            expect(outcome1.error?.message).assertEqual('request 1 rejected');
            expect(outcome1.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted.length).assertEqual(1);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            expect(recorder.granted[0] === input2).assertEqual(true);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted,granted');
            expect(recorder.granted[1] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_1600
     * @tc.name testCalendarManagerPermutation060016
     * @tc.desc RRD, finish 012; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060016';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, 0]
            };
            const error1: Error = new Error('request 1 rejected');
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
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.reject(error1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.error === error1).assertEqual(true);
            expect(outcome1.error?.message).assertEqual('request 1 rejected');
            expect(outcome1.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(false);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_1700
     * @tc.name testCalendarManagerPermutation060017
     * @tc.desc RRD, finish 021; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060017';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, 0]
            };
            const error1: Error = new Error('request 1 rejected');
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
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('denied');
            pending1.reject(error1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.error === error1).assertEqual(true);
            expect(outcome1.error?.message).assertEqual('request 1 rejected');
            expect(outcome1.value === undefined).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_1800
     * @tc.name testCalendarManagerPermutation060018
     * @tc.desc RRD, finish 102; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060018';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, 0]
            };
            const error1: Error = new Error('request 1 rejected');
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
            pending1.reject(error1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.error === error1).assertEqual(true);
            expect(outcome1.error?.message).assertEqual('request 1 rejected');
            expect(outcome1.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(false);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_1900
     * @tc.name testCalendarManagerPermutation060019
     * @tc.desc RRD, finish 120; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation060019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation060019';
        console.info(`${TAG} start`);
        try {
          const gate: CalendarPermissionGate = new CalendarPermissionGate();
          const scope: MatrixScope = new MatrixScope();
          const recorder: MatrixPermissionRecorder = new MatrixPermissionRecorder();
          try {
            const input0: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR',
                'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const error0: Error = new Error('request 0 rejected');
            const pending0: MatrixPending<PermissionRequestResult> = scope.pending(input0);
            const request0: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending0.promise, recorder));
            const input1: PermissionRequestResult = {
              permissions: ['ohos.permission.WRITE_CALENDAR',
                'ohos.permission.READ_CALENDAR'],
              authResults: [0, 0]
            };
            const error1: Error = new Error('request 1 rejected');
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
            pending1.reject(error1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.error === error1).assertEqual(true);
            expect(outcome1.error?.message).assertEqual('request 1 rejected');
            expect(outcome1.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('denied');
            pending0.reject(error0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.error === error0).assertEqual(true);
            expect(outcome0.error?.message).assertEqual('request 0 rejected');
            expect(outcome0.value === undefined).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_06_2000
     * @tc.name testCalendarManagerPermutation060020
     * @tc.desc RRD, finish 201; latest callback only and fresh request recovery.