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
import { describe } from '@ohos/hypium';
import type { PermissionRequestResult } from '@kit.AbilityKit';
import { it, expect } from './TestSupport';
import { CalendarPermissionGate } from '../../../main/ets/CalendarPermission';
import type { CalendarPermissionHandlers } from '../../../main/ets/CalendarPermission';
import { Pending, captureFailure } from './CalendarLogicFixtures';

class PermissionRecorder implements CalendarPermissionHandlers {
  grants: number = 0;
  denials: number = 0;
  failures: number = 0;
  grantedResult: PermissionRequestResult | undefined;
  deniedResult: PermissionRequestResult | undefined;
  trace: string[];
  label: string;

  constructor(label: string, trace: string[]) {
    this.label = label;
    this.trace = trace;
  }

  onGranted(result: PermissionRequestResult): void {
    this.grants++;
    this.grantedResult = result;
    this.trace.push(this.label + ':granted');
  }

  onDenied(result: PermissionRequestResult): void {
    this.denials++;
    this.deniedResult = result;
    this.trace.push(this.label + ':denied');
  }

  onFailed(): void {
    this.failures++;
    this.trace.push(this.label + ':failed');
  }
}

export default function calendarPermissionTripleOrderingTest(): void {
  describe('CalendarPermissionTripleOrdering', (): void => {
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_0100
     * @tc.name CalendarEventPermissionTripleOrdering_0001
     * @tc.desc Complete triple granted/granted/granted in first-second-third order; return each original settlement
     * and notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0001', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const firstWait: Promise<PermissionRequestResult> =
        gate.request(() => firstPending.promise, firstHandlers);
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const thirdWait: Promise<PermissionRequestResult> =
        gate.request(() => thirdPending.promise, thirdHandlers);
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(1);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grantedResult === thirdResult).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_0200
     * @tc.name CalendarEventPermissionTripleOrdering_0002
     * @tc.desc Complete triple granted/granted/granted in first-third-second order; return each original settlement
     * and notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0002', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const firstWait: Promise<PermissionRequestResult> =
        gate.request(() => firstPending.promise, firstHandlers);
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const thirdWait: Promise<PermissionRequestResult> =
        gate.request(() => thirdPending.promise, thirdHandlers);
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(1);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grantedResult === thirdResult).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_0300
     * @tc.name CalendarEventPermissionTripleOrdering_0003
     * @tc.desc Complete triple granted/granted/granted in second-first-third order; return each original settlement
     * and notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0003', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const firstWait: Promise<PermissionRequestResult> =
        gate.request(() => firstPending.promise, firstHandlers);
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const thirdWait: Promise<PermissionRequestResult> =
        gate.request(() => thirdPending.promise, thirdHandlers);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(1);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grantedResult === thirdResult).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_0400
     * @tc.name CalendarEventPermissionTripleOrdering_0004
     * @tc.desc Complete triple granted/granted/granted in second-third-first order; return each original settlement
     * and notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0004', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const firstWait: Promise<PermissionRequestResult> =
        gate.request(() => firstPending.promise, firstHandlers);
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const thirdWait: Promise<PermissionRequestResult> =
        gate.request(() => thirdPending.promise, thirdHandlers);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(1);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grantedResult === thirdResult).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_0500
     * @tc.name CalendarEventPermissionTripleOrdering_0005
     * @tc.desc Complete triple granted/granted/granted in third-first-second order; return each original settlement
     * and notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0005', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const firstWait: Promise<PermissionRequestResult> =
        gate.request(() => firstPending.promise, firstHandlers);
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const thirdWait: Promise<PermissionRequestResult> =
        gate.request(() => thirdPending.promise, thirdHandlers);
      expect(trace.join(',')).assertEqual('');
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(1);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grantedResult === thirdResult).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_0600
     * @tc.name CalendarEventPermissionTripleOrdering_0006
     * @tc.desc Complete triple granted/granted/granted in third-second-first order; return each original settlement
     * and notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0006', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const firstWait: Promise<PermissionRequestResult> =
        gate.request(() => firstPending.promise, firstHandlers);
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const thirdWait: Promise<PermissionRequestResult> =
        gate.request(() => thirdPending.promise, thirdHandlers);
      expect(trace.join(',')).assertEqual('');
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:granted');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(1);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grantedResult === thirdResult).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_0700
     * @tc.name CalendarEventPermissionTripleOrdering_0007
     * @tc.desc Complete triple denied/granted/denied in first-second-third order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0007', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const firstWait: Promise<PermissionRequestResult> =
        gate.request(() => firstPending.promise, firstHandlers);
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const thirdWait: Promise<PermissionRequestResult> =
        gate.request(() => thirdPending.promise, thirdHandlers);
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:denied');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(1);
      expect(thirdHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === thirdResult).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_0800
     * @tc.name CalendarEventPermissionTripleOrdering_0008
     * @tc.desc Complete triple denied/granted/denied in first-third-second order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0008', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const firstWait: Promise<PermissionRequestResult> =
        gate.request(() => firstPending.promise, firstHandlers);
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const thirdWait: Promise<PermissionRequestResult> =
        gate.request(() => thirdPending.promise, thirdHandlers);
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:denied');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:denied');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(1);
      expect(thirdHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === thirdResult).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_0900
     * @tc.name CalendarEventPermissionTripleOrdering_0009
     * @tc.desc Complete triple denied/granted/denied in second-first-third order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0009', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const firstWait: Promise<PermissionRequestResult> =
        gate.request(() => firstPending.promise, firstHandlers);
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const thirdWait: Promise<PermissionRequestResult> =
        gate.request(() => thirdPending.promise, thirdHandlers);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:denied');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(1);
      expect(thirdHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === thirdResult).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_1000
     * @tc.name CalendarEventPermissionTripleOrdering_0010
     * @tc.desc Complete triple denied/granted/denied in second-third-first order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0010', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const firstWait: Promise<PermissionRequestResult> =
        gate.request(() => firstPending.promise, firstHandlers);
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const thirdWait: Promise<PermissionRequestResult> =
        gate.request(() => thirdPending.promise, thirdHandlers);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:denied');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:denied');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(1);
      expect(thirdHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === thirdResult).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_1100
     * @tc.name CalendarEventPermissionTripleOrdering_0011
     * @tc.desc Complete triple denied/granted/denied in third-first-second order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0011', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'