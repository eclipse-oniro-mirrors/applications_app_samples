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

export default function calendarManagerPermutation07Test(): void {
  describe('CalendarManagerPermutation07Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_0100
     * @tc.name testCalendarManagerPermutation070001
     * @tc.desc GGG, finish 012, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070001';
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
            gate.invalidate();
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
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
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_0200
     * @tc.name testCalendarManagerPermutation070002
     * @tc.desc GGG, finish 021, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070002';
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
            gate.invalidate();
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_0300
     * @tc.name testCalendarManagerPermutation070003
     * @tc.desc GGG, finish 102, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070003';
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
            gate.invalidate();
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_0400
     * @tc.name testCalendarManagerPermutation070004
     * @tc.desc GGG, finish 120, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070004';
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
            gate.invalidate();
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
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_0500
     * @tc.name testCalendarManagerPermutation070005
     * @tc.desc GGG, finish 201, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070005';
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
            gate.invalidate();
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_0600
     * @tc.name testCalendarManagerPermutation070006
     * @tc.desc GGG, finish 210, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070006';
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
            gate.invalidate();
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_0700
     * @tc.name testCalendarManagerPermutation070007
     * @tc.desc DDD, finish 012, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070007';
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
            gate.invalidate();
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(false);
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
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_0800
     * @tc.name testCalendarManagerPermutation070008
     * @tc.desc DDD, finish 021, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070008';
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
            gate.invalidate();
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_0900
     * @tc.name testCalendarManagerPermutation070009
     * @tc.desc DDD, finish 102, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070009';
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
            gate.invalidate();
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_1000
     * @tc.name testCalendarManagerPermutation070010
     * @tc.desc DDD, finish 120, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070010';
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
            gate.invalidate();
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
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_1100
     * @tc.name testCalendarManagerPermutation070011
     * @tc.desc DDD, finish 201, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070011';
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
            gate.invalidate();
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_1200
     * @tc.name testCalendarManagerPermutation070012
     * @tc.desc DDD, finish 210, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070012';
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
            gate.invalidate();
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.resolve(input1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.value === input1).assertEqual(true);
            expect(outcome1.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input1)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(false);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_1300
     * @tc.name testCalendarManagerPermutation070013
     * @tc.desc RRR, finish 012, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070013';
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
            const error2: Error = new Error('request 2 rejected');
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            gate.invalidate();
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
            pending2.reject(error2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.error === error2).assertEqual(true);
            expect(outcome2.error?.message).assertEqual('request 2 rejected');
            expect(outcome2.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_1400
     * @tc.name testCalendarManagerPermutation070014
     * @tc.desc RRR, finish 021, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070014';
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
            const error2: Error = new Error('request 2 rejected');
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            gate.invalidate();
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
            expect(recorder.trace.join(',')).assertEqual('');
            pending1.reject(error1);
            const outcome1: MatrixOutcome<PermissionRequestResult> = await request1;
            expect(outcome1.error === error1).assertEqual(true);
            expect(outcome1.error?.message).assertEqual('request 1 rejected');
            expect(outcome1.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_1500
     * @tc.name testCalendarManagerPermutation070015
     * @tc.desc RRR, finish 102, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070015';
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
            const error2: Error = new Error('request 2 rejected');
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            gate.invalidate();
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
            pending2.reject(error2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.error === error2).assertEqual(true);
            expect(outcome2.error?.message).assertEqual('request 2 rejected');
            expect(outcome2.value === undefined).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            expect(recorder.granted.length).assertEqual(0);
            expect(recorder.denied.length).assertEqual(0);
            expect(recorder.failures).assertEqual(0);
            const fresh: PermissionRequestResult = {
              permissions: ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'],
              authResults: [0, 0]
            };
            const returned: PermissionRequestResult = await gate.request(
              (): Promise<PermissionRequestResult> => Promise.resolve(fresh), recorder);
            expect(returned === fresh).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            expect(recorder.granted[0] === fresh).assertEqual(true);
          } finally {
            await scope.close();
          }
        } finally {
          console.info(`${TAG} end`);
        }
      });

    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_07_1600
     * @tc.name testCalendarManagerPermutation070016
     * @tc.desc RRR, finish 120, invalidate; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation070016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation070016';
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