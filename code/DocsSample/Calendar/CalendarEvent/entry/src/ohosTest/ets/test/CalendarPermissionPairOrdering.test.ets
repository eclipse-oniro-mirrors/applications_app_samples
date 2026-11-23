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

export default function calendarPermissionPairOrderingTest(): void {
  describe('CalendarPermissionPairOrdering', (): void => {
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_0100
     * @tc.name CalendarEventPermissionPairOrdering_0001
     * @tc.desc Complete pair granted/granted in first then second order with separate handlers and separate input;
     * only second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0001', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_0200
     * @tc.name CalendarEventPermissionPairOrdering_0002
     * @tc.desc Complete pair granted/granted in first then second order with shared handlers and reused input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0002', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      const secondResult: PermissionRequestResult = firstResult;
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_0300
     * @tc.name CalendarEventPermissionPairOrdering_0003
     * @tc.desc Complete pair granted/granted in second then first order with separate handlers and separate input;
     * only second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0003', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:granted');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_0400
     * @tc.name CalendarEventPermissionPairOrdering_0004
     * @tc.desc Complete pair granted/granted in second then first order with shared handlers and reused input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0004', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      const secondResult: PermissionRequestResult = firstResult;
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:granted');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_0500
     * @tc.name CalendarEventPermissionPairOrdering_0005
     * @tc.desc Complete pair granted/denied in first then second order with separate handlers and separate input;
     * only second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0005', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_0600
     * @tc.name CalendarEventPermissionPairOrdering_0006
     * @tc.desc Complete pair granted/denied in first then second order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0006', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_0700
     * @tc.name CalendarEventPermissionPairOrdering_0007
     * @tc.desc Complete pair granted/denied in second then first order with separate handlers and separate input;
     * only second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0007', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:denied');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_0800
     * @tc.name CalendarEventPermissionPairOrdering_0008
     * @tc.desc Complete pair granted/denied in second then first order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0008', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_0900
     * @tc.name CalendarEventPermissionPairOrdering_0009
     * @tc.desc Complete pair granted/failed in first then second order with separate handlers and separate input;
     * only second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0009', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_1000
     * @tc.name CalendarEventPermissionPairOrdering_0010
     * @tc.desc Complete pair granted/failed in first then second order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0010', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_1100
     * @tc.name CalendarEventPermissionPairOrdering_0011
     * @tc.desc Complete pair granted/failed in second then first order with separate handlers and separate input;
     * only second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0011', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:failed');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_1200
     * @tc.name CalendarEventPermissionPairOrdering_0012
     * @tc.desc Complete pair granted/failed in second then first order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0012', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:failed');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_1300
     * @tc.name CalendarEventPermissionPairOrdering_0013
     * @tc.desc Complete pair denied/granted in first then second order with separate handlers and separate input;
     * only second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0013', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_1400
     * @tc.name CalendarEventPermissionPairOrdering_0014
     * @tc.desc Complete pair denied/granted in first then second order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0014', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_1500
     * @tc.name CalendarEventPermissionPairOrdering_0015
     * @tc.desc Complete pair denied/granted in second then first order with separate handlers and separate input;
     * only second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0015', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:granted');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_1600
     * @tc.name CalendarEventPermissionPairOrdering_0016
     * @tc.desc Complete pair denied/granted in second then first order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0016', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:granted');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_1700
     * @tc.name CalendarEventPermissionPairOrdering_0017
     * @tc.desc Complete pair denied/denied in first then second order with separate handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0017', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_1800
     * @tc.name CalendarEventPermissionPairOrdering_0018
     * @tc.desc Complete pair denied/denied in first then second order with shared handlers and reused input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0018', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      const secondResult: PermissionRequestResult = firstResult;
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_1900
     * @tc.name CalendarEventPermissionPairOrdering_0019
     * @tc.desc Complete pair denied/denied in second then first order with separate handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0019', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:denied');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_2000
     * @tc.name CalendarEventPermissionPairOrdering_0020
     * @tc.desc Complete pair denied/denied in second then first order with shared handlers and reused input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0020', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      const secondResult: PermissionRequestResult = firstResult;
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_2100
     * @tc.name CalendarEventPermissionPairOrdering_0021
     * @tc.desc Complete pair denied/failed in first then second order with separate handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0021', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_2200
     * @tc.name CalendarEventPermissionPairOrdering_0022
     * @tc.desc Complete pair denied/failed in first then second order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0022', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      expect(trace.join(',')).assertEqual('');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_2300
     * @tc.name CalendarEventPermissionPairOrdering_0023
     * @tc.desc Complete pair denied/failed in second then first order with separate handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0023', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:failed');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_2400
     * @tc.name CalendarEventPermissionPairOrdering_0024
     * @tc.desc Complete pair denied/failed in second then first order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0024', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:failed');
      firstPending.resolve(firstResult);
      expect((await firstWait) === firstResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(firstResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(firstResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_2500
     * @tc.name CalendarEventPermissionPairOrdering_0025
     * @tc.desc Complete pair failed/granted in first then second order with separate handlers and separate input;
     * only second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0025', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      expect(trace.join(',')).assertEqual('');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_2600
     * @tc.name CalendarEventPermissionPairOrdering_0026
     * @tc.desc Complete pair failed/granted in first then second order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0026', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      expect(trace.join(',')).assertEqual('');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_2700
     * @tc.name CalendarEventPermissionPairOrdering_0027
     * @tc.desc Complete pair failed/granted in second then first order with separate handlers and separate input;
     * only second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0027', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:granted');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_2800
     * @tc.name CalendarEventPermissionPairOrdering_0028
     * @tc.desc Complete pair failed/granted in second then first order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0028', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:granted');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:granted');
      expect(secondHandlers.grants).assertEqual(1);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === secondResult).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|0');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_2900
     * @tc.name CalendarEventPermissionPairOrdering_0029
     * @tc.desc Complete pair failed/denied in first then second order with separate handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0029', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      expect(trace.join(',')).assertEqual('');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_3000
     * @tc.name CalendarEventPermissionPairOrdering_0030
     * @tc.desc Complete pair failed/denied in first then second order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0030', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      expect(trace.join(',')).assertEqual('');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_3100
     * @tc.name CalendarEventPermissionPairOrdering_0031
     * @tc.desc Complete pair failed/denied in second then first order with separate handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0031', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:denied');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_3200
     * @tc.name CalendarEventPermissionPairOrdering_0032
     * @tc.desc Complete pair failed/denied in second then first order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0032', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
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
        authResults: [0, -1]
      };
      const secondWait: Promise<PermissionRequestResult> =
        gate.request(() => secondPending.promise, secondHandlers);
      expect(trace.join(',')).assertEqual('');
      secondPending.resolve(secondResult);
      expect((await secondWait) === secondResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(1);
      expect(secondHandlers.failures).assertEqual(0);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === secondResult).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
      expect(secondResult.permissions.join('|'))
        .assertEqual('ohos.permission.READ_CALENDAR|ohos.permission.WRITE_CALENDAR');
      expect(secondResult.authResults.join('|')).assertEqual('0|-1');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_3300
     * @tc.name CalendarEventPermissionPairOrdering_0033
     * @tc.desc Complete pair failed/failed in first then second order with separate handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0033', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
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
      expect(trace.join(',')).assertEqual('second:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_3400
     * @tc.name CalendarEventPermissionPairOrdering_0034
     * @tc.desc Complete pair failed/failed in first then second order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0034', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
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
      expect(trace.join(',')).assertEqual('shared:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_3500
     * @tc.name CalendarEventPermissionPairOrdering_0035
     * @tc.desc Complete pair failed/failed in second then first order with separate handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0035', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('first', trace);
      const secondHandlers: PermissionRecorder = new PermissionRecorder('second', trace);
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:failed');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('second:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers.grants).assertEqual(0);
      expect(firstHandlers.denials).assertEqual(0);
      expect(firstHandlers.failures).assertEqual(0);
      expect(firstHandlers.grantedResult === undefined).assertEqual(true);
      expect(firstHandlers.deniedResult === undefined).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_PAIR_ORDERING_3600
     * @tc.name CalendarEventPermissionPairOrdering_0036
     * @tc.desc Complete pair failed/failed in second then first order with shared handlers and separate input; only
     * second may notify without changing input arrays.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionPairOrdering_0036', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const firstHandlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const secondHandlers: PermissionRecorder = firstHandlers;
      const firstPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const firstError: Error = new Error('first rejected');
      const firstWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => firstPending.promise, firstHandlers));
      const secondPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const secondError: Error = new Error('second rejected');
      const secondWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => secondPending.promise, secondHandlers));
      expect(trace.join(',')).assertEqual('');
      secondPending.reject(secondError);
      const secondFailure: Error | undefined = await secondWait;
      expect(secondFailure?.message).assertEqual('second rejected');
      expect(secondFailure === secondError).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:failed');
      firstPending.reject(firstError);
      const firstFailure: Error | undefined = await firstWait;
      expect(firstFailure?.message).assertEqual('first rejected');
      expect(firstFailure === firstError).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:failed');
      expect(secondHandlers.grants).assertEqual(0);
      expect(secondHandlers.denials).assertEqual(0);
      expect(secondHandlers.failures).assertEqual(1);
      expect(secondHandlers.grantedResult === undefined).assertEqual(true);
      expect(secondHandlers.deniedResult === undefined).assertEqual(true);
      expect(firstHandlers === secondHandlers).assertEqual(true);
    });
  });
}
