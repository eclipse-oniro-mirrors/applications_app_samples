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
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:denied');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_1200
     * @tc.name CalendarEventPermissionTripleOrdering_0012
     * @tc.desc Complete triple denied/granted/denied in third-second-first order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0012', 0, async (): Promise<void> => {
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
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:denied');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_1300
     * @tc.name CalendarEventPermissionTripleOrdering_0013
     * @tc.desc Complete triple granted/denied/failed in first-second-third order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0013', 0, async (): Promise<void> => {
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_1400
     * @tc.name CalendarEventPermissionTripleOrdering_0014
     * @tc.desc Complete triple granted/denied/failed in first-third-second order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0014', 0, async (): Promise<void> => {
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_1500
     * @tc.name CalendarEventPermissionTripleOrdering_0015
     * @tc.desc Complete triple granted/denied/failed in second-first-third order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0015', 0, async (): Promise<void> => {
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_1600
     * @tc.name CalendarEventPermissionTripleOrdering_0016
     * @tc.desc Complete triple granted/denied/failed in second-third-first order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0016', 0, async (): Promise<void> => {
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_1700
     * @tc.name CalendarEventPermissionTripleOrdering_0017
     * @tc.desc Complete triple granted/denied/failed in third-first-second order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0017', 0, async (): Promise<void> => {
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_1800
     * @tc.name CalendarEventPermissionTripleOrdering_0018
     * @tc.desc Complete triple granted/denied/failed in third-second-first order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0018', 0, async (): Promise<void> => {
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_1900
     * @tc.name CalendarEventPermissionTripleOrdering_0019
     * @tc.desc Complete triple failed/granted/denied in first-second-third order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0019', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
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
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_2000
     * @tc.name CalendarEventPermissionTripleOrdering_0020
     * @tc.desc Complete triple failed/granted/denied in first-third-second order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0020', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
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
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_2100
     * @tc.name CalendarEventPermissionTripleOrdering_0021
     * @tc.desc Complete triple failed/granted/denied in second-first-third order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0021', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
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
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_2200
     * @tc.name CalendarEventPermissionTripleOrdering_0022
     * @tc.desc Complete triple failed/granted/denied in second-third-first order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0022', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
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
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_2300
     * @tc.name CalendarEventPermissionTripleOrdering_0023
     * @tc.desc Complete triple failed/granted/denied in third-first-second order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0023', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
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
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:denied');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_2400
     * @tc.name CalendarEventPermissionTripleOrdering_0024
     * @tc.desc Complete triple failed/granted/denied in third-second-first order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0024', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
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
      thirdPending.resolve(thirdResult);
      expect((await thirdWait) === thirdResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:denied');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:denied');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_2500
     * @tc.name CalendarEventPermissionTripleOrdering_0025
     * @tc.desc Complete triple denied/failed/granted in first-second-third order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0025', 0, async (): Promise<void> => {
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
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
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
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_2600
     * @tc.name CalendarEventPermissionTripleOrdering_0026
     * @tc.desc Complete triple denied/failed/granted in first-third-second order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0026', 0, async (): Promise<void> => {
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
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
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
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_2700
     * @tc.name CalendarEventPermissionTripleOrdering_0027
     * @tc.desc Complete triple denied/failed/granted in second-first-third order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0027', 0, async (): Promise<void> => {
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
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
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
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_2800
     * @tc.name CalendarEventPermissionTripleOrdering_0028
     * @tc.desc Complete triple denied/failed/granted in second-third-first order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0028', 0, async (): Promise<void> => {
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
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
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
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_2900
     * @tc.name CalendarEventPermissionTripleOrdering_0029
     * @tc.desc Complete triple denied/failed/granted in third-first-second order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0029', 0, async (): Promise<void> => {
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
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
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
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_3000
     * @tc.name CalendarEventPermissionTripleOrdering_0030
     * @tc.desc Complete triple denied/failed/granted in third-second-first order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0030', 0, async (): Promise<void> => {
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
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
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
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
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
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_3100
     * @tc.name CalendarEventPermissionTripleOrdering_0031
     * @tc.desc Complete triple failed/failed/failed in first-second-third order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0031', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_3200
     * @tc.name CalendarEventPermissionTripleOrdering_0032
     * @tc.desc Complete triple failed/failed/failed in first-third-second order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0032', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_3300
     * @tc.name CalendarEventPermissionTripleOrdering_0033
     * @tc.desc Complete triple failed/failed/failed in second-first-third order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0033', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_3400
     * @tc.name CalendarEventPermissionTripleOrdering_0034
     * @tc.desc Complete triple failed/failed/failed in second-third-first order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0034', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_3500
     * @tc.name CalendarEventPermissionTripleOrdering_0035
     * @tc.desc Complete triple failed/failed/failed in third-first-second order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0035', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_TRIPLE_ORDERING_3600
     * @tc.name CalendarEventPermissionTripleOrdering_0036
     * @tc.desc Complete triple failed/failed/failed in third-second-first order; return each original settlement and
     * notify only the third request.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionTripleOrdering_0036', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const thirdHandlers: PermissionRecorder = new PermissionRecorder('third', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      const thirdPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const thirdError: Error = new Error('third rejected');
      const thirdWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => thirdPending.promise, thirdHandlers));
      expect(trace.join(',')).assertEqual('');
      thirdPending.reject(thirdError);
      const thirdFailure: Error | undefined = await thirdWait;
      expect(thirdFailure?.message).assertEqual('third rejected');
      expect(thirdFailure === thirdError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('third:failed');
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(thirdHandlers.grants).assertEqual(0);
      expect(thirdHandlers.denials).assertEqual(0);
      expect(thirdHandlers.failures).assertEqual(1);
      expect(thirdHandlers.grantedResult === undefined).assertEqual(true);
      expect(thirdHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
    });
  });
}
