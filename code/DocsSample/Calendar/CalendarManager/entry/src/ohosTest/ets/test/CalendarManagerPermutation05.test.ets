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

export default function calendarManagerPermutation05Test(): void {
  describe('CalendarManagerPermutation05Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_0100
     * @tc.name testCalendarManagerPermutation050001
     * @tc.desc RGG, finish 012; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050001';
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
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_0200
     * @tc.name testCalendarManagerPermutation050002
     * @tc.desc RGG, finish 021; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050002';
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
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_0300
     * @tc.name testCalendarManagerPermutation050003
     * @tc.desc RGG, finish 102; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050003';
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
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_0400
     * @tc.name testCalendarManagerPermutation050004
     * @tc.desc RGG, finish 120; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050004';
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
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_0500
     * @tc.name testCalendarManagerPermutation050005
     * @tc.desc RGG, finish 201; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050005';
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
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_0600
     * @tc.name testCalendarManagerPermutation050006
     * @tc.desc RGG, finish 210; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050006';
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
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_0700
     * @tc.name testCalendarManagerPermutation050007
     * @tc.desc RGD, finish 012; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050007';
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
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_0800
     * @tc.name testCalendarManagerPermutation050008
     * @tc.desc RGD, finish 021; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050008';
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
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_0900
     * @tc.name testCalendarManagerPermutation050009
     * @tc.desc RGD, finish 102; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050009';
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
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_1000
     * @tc.name testCalendarManagerPermutation050010
     * @tc.desc RGD, finish 120; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050010';
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
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_1100
     * @tc.name testCalendarManagerPermutation050011
     * @tc.desc RGD, finish 201; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050011';
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
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_1200
     * @tc.name testCalendarManagerPermutation050012
     * @tc.desc RGD, finish 210; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050012';
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
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_1300
     * @tc.name testCalendarManagerPermutation050013
     * @tc.desc RGR, finish 012; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050013';
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
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_1400
     * @tc.name testCalendarManagerPermutation050014
     * @tc.desc RGR, finish 021; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050014';
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
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_1500
     * @tc.name testCalendarManagerPermutation050015
     * @tc.desc RGR, finish 102; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050015';
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
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_1600
     * @tc.name testCalendarManagerPermutation050016
     * @tc.desc RGR, finish 120; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050016';
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
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_1700
     * @tc.name testCalendarManagerPermutation050017
     * @tc.desc RGR, finish 201; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050017';
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
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_1800
     * @tc.name testCalendarManagerPermutation050018
     * @tc.desc RGR, finish 210; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050018';
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
            expect(hasCalendarPermissions(input1)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_1900
     * @tc.name testCalendarManagerPermutation050019
     * @tc.desc RDG, finish 012; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050019';
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_2000
     * @tc.name testCalendarManagerPermutation050020
     * @tc.desc RDG, finish 021; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050020';
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
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_2100
     * @tc.name testCalendarManagerPermutation050021
     * @tc.desc RDG, finish 102; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050021';
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_2200
     * @tc.name testCalendarManagerPermutation050022
     * @tc.desc RDG, finish 120; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050022';
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_2300
     * @tc.name testCalendarManagerPermutation050023
     * @tc.desc RDG, finish 201; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050023';
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
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_2400
     * @tc.name testCalendarManagerPermutation050024
     * @tc.desc RDG, finish 210; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050024';
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
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_2500
     * @tc.name testCalendarManagerPermutation050025
     * @tc.desc RDD, finish 012; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050025';
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_2600
     * @tc.name testCalendarManagerPermutation050026
     * @tc.desc RDD, finish 021; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050026';
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_05_2700
     * @tc.name testCalendarManagerPermutation050027
     * @tc.desc RDD, finish 102; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation050027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation050027';
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
  });
}
