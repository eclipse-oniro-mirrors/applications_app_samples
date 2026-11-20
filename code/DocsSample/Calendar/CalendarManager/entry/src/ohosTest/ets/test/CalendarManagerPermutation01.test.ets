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

export default function calendarManagerPermutation01Test(): void {
  describe('CalendarManagerPermutation01Logic', (): void => {
    /**
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_0100
     * @tc.name testCalendarManagerPermutation010001
     * @tc.desc GGG, finish 012; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010001';
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_0200
     * @tc.name testCalendarManagerPermutation010002
     * @tc.desc GGG, finish 021; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010002';
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_0300
     * @tc.name testCalendarManagerPermutation010003
     * @tc.desc GGG, finish 102; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010003';
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_0400
     * @tc.name testCalendarManagerPermutation010004
     * @tc.desc GGG, finish 120; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010004';
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
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_0500
     * @tc.name testCalendarManagerPermutation010005
     * @tc.desc GGG, finish 201; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010005';
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
            pending2.resolve(input2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.value === input2).assertEqual(true);
            expect(outcome2.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input2)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('granted');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_0600
     * @tc.name testCalendarManagerPermutation010006
     * @tc.desc GGG, finish 210; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010006';
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
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_0700
     * @tc.name testCalendarManagerPermutation010007
     * @tc.desc GGD, finish 012; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010007';
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
              authResults: [0, -1]
            };
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_0800
     * @tc.name testCalendarManagerPermutation010008
     * @tc.desc GGD, finish 021; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010008';
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
              authResults: [0, -1]
            };
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_0900
     * @tc.name testCalendarManagerPermutation010009
     * @tc.desc GGD, finish 102; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010009';
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_1000
     * @tc.name testCalendarManagerPermutation010010
     * @tc.desc GGD, finish 120; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010010';
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
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_1100
     * @tc.name testCalendarManagerPermutation010011
     * @tc.desc GGD, finish 201; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010011';
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
            expect(hasCalendarPermissions(input0)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_1200
     * @tc.name testCalendarManagerPermutation010012
     * @tc.desc GGD, finish 210; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010012';
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
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_1300
     * @tc.name testCalendarManagerPermutation010013
     * @tc.desc GGR, finish 012; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010013';
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
            const error2: Error = new Error('request 2 rejected');
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
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
     * @tc.number SUB_CALENDAR_MANAGER_PERMUTATION_01_1400
     * @tc.name testCalendarManagerPermutation010014
     * @tc.desc GGR, finish 021; latest callback only and fresh request recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCalendarManagerPermutation010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testCalendarManagerPermutation010014';
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
            const error2: Error = new Error('request 2 rejected');
            const pending2: MatrixPending<PermissionRequestResult> = scope.pending(input2);
            const request2: Promise<MatrixOutcome<PermissionRequestResult>> =
              scope.observe(gate.request((): Promise<PermissionRequestResult> => pending2.promise, recorder));
            expect(recorder.trace.join(',')).assertEqual('');
            pending0.resolve(input0);
            const outcome0: MatrixOutcome<PermissionRequestResult> = await request0;
            expect(outcome0.value === input0).assertEqual(true);
            expect(outcome0.error === undefined).assertEqual(true);
            expect(hasCalendarPermissions(input0)).assertEqual(true);
            expect(recorder.trace.join(',')).assertEqual('');
            pending2.reject(error2);
            const outcome2: MatrixOutcome<PermissionRequestResult> = await request2;
            expect(outcome2.error === error2).assertEqual(true);