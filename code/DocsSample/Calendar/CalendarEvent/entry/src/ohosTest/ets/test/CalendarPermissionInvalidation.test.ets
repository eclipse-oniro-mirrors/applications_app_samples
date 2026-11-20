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

export default function calendarPermissionInvalidationTest(): void {
  describe('CalendarPermissionInvalidation', (): void => {
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_0100
     * @tc.name CalendarEventPermissionInvalidation_0001
     * @tc.desc Invalidate 0 times with pending old granted; start recovery after old completion and apply old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0001', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(1);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === oldResult).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('old:granted');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('old:granted,new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_0200
     * @tc.name CalendarEventPermissionInvalidation_0002
     * @tc.desc Invalidate 0 times with pending old denied; start recovery after old completion and apply old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0002', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(1);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === oldResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('old:denied');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('old:denied,new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_0300
     * @tc.name CalendarEventPermissionInvalidation_0003
     * @tc.desc Invalidate 0 times with pending old failed; start recovery after old completion and apply old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0003', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldError: Error = new Error('old rejected');
      const oldWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => oldPending.promise, oldHandlers));
      oldPending.reject(oldError);
      const oldFailure: Error | undefined = await oldWait;
      expect(oldFailure?.message).assertEqual('old rejected');
      expect(oldFailure === oldError).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(1);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('old:failed');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('old:failed,new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_0400
     * @tc.name CalendarEventPermissionInvalidation_0004
     * @tc.desc Invalidate 0 times with pending old reverse grant; start recovery after old completion and apply old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0004', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(1);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === oldResult).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('old:granted');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('old:granted,new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_0500
     * @tc.name CalendarEventPermissionInvalidation_0005
     * @tc.desc Invalidate 1 times with pending old granted; start recovery before old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0005', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_0600
     * @tc.name CalendarEventPermissionInvalidation_0006
     * @tc.desc Invalidate 1 times with pending old granted; start recovery after old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0006', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_0700
     * @tc.name CalendarEventPermissionInvalidation_0007
     * @tc.desc Invalidate 1 times with pending old denied; start recovery before old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0007', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_0800
     * @tc.name CalendarEventPermissionInvalidation_0008
     * @tc.desc Invalidate 1 times with pending old denied; start recovery after old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0008', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_0900
     * @tc.name CalendarEventPermissionInvalidation_0009
     * @tc.desc Invalidate 1 times with pending old failed; start recovery before old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0009', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldError: Error = new Error('old rejected');
      const oldWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => oldPending.promise, oldHandlers));
      gate.invalidate();
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      oldPending.reject(oldError);
      const oldFailure: Error | undefined = await oldWait;
      expect(oldFailure?.message).assertEqual('old rejected');
      expect(oldFailure === oldError).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_1000
     * @tc.name CalendarEventPermissionInvalidation_0010
     * @tc.desc Invalidate 1 times with pending old failed; start recovery after old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0010', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldError: Error = new Error('old rejected');
      const oldWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => oldPending.promise, oldHandlers));
      gate.invalidate();
      oldPending.reject(oldError);
      const oldFailure: Error | undefined = await oldWait;
      expect(oldFailure?.message).assertEqual('old rejected');
      expect(oldFailure === oldError).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_1100
     * @tc.name CalendarEventPermissionInvalidation_0011
     * @tc.desc Invalidate 1 times with pending old reverse grant; start recovery before old completion and suppress
     * old callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0011', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_1200
     * @tc.name CalendarEventPermissionInvalidation_0012
     * @tc.desc Invalidate 1 times with pending old reverse grant; start recovery after old completion and suppress
     * old callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0012', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_1300
     * @tc.name CalendarEventPermissionInvalidation_0013
     * @tc.desc Invalidate 2 times with pending old granted; start recovery before old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0013', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      gate.invalidate();
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_1400
     * @tc.name CalendarEventPermissionInvalidation_0014
     * @tc.desc Invalidate 2 times with pending old granted; start recovery after old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0014', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      gate.invalidate();
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_1500
     * @tc.name CalendarEventPermissionInvalidation_0015
     * @tc.desc Invalidate 2 times with pending old denied; start recovery before old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0015', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      gate.invalidate();
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_1600
     * @tc.name CalendarEventPermissionInvalidation_0016
     * @tc.desc Invalidate 2 times with pending old denied; start recovery after old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0016', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      gate.invalidate();
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_1700
     * @tc.name CalendarEventPermissionInvalidation_0017
     * @tc.desc Invalidate 2 times with pending old failed; start recovery before old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0017', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldError: Error = new Error('old rejected');
      const oldWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => oldPending.promise, oldHandlers));
      gate.invalidate();
      gate.invalidate();
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      oldPending.reject(oldError);
      const oldFailure: Error | undefined = await oldWait;
      expect(oldFailure?.message).assertEqual('old rejected');
      expect(oldFailure === oldError).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_1800
     * @tc.name CalendarEventPermissionInvalidation_0018
     * @tc.desc Invalidate 2 times with pending old failed; start recovery after old completion and suppress old
     * callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0018', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldError: Error = new Error('old rejected');
      const oldWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => oldPending.promise, oldHandlers));
      gate.invalidate();
      gate.invalidate();
      oldPending.reject(oldError);
      const oldFailure: Error | undefined = await oldWait;
      expect(oldFailure?.message).assertEqual('old rejected');
      expect(oldFailure === oldError).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_1900
     * @tc.name CalendarEventPermissionInvalidation_0019
     * @tc.desc Invalidate 2 times with pending old reverse grant; start recovery before old completion and suppress
     * old callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0019', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      gate.invalidate();
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_2000
     * @tc.name CalendarEventPermissionInvalidation_0020
     * @tc.desc Invalidate 2 times with pending old reverse grant; start recovery after old completion and suppress
     * old callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0020', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const oldHandlers: PermissionRecorder = new PermissionRecorder('old', trace);
      const newHandlers: PermissionRecorder = new PermissionRecorder('new', trace);
      const oldPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const oldResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const oldWait: Promise<PermissionRequestResult> =
        gate.request(() => oldPending.promise, oldHandlers);
      gate.invalidate();
      gate.invalidate();
      oldPending.resolve(oldResult);
      expect((await oldWait) === oldResult).assertEqual(true);
      expect(oldHandlers.grants).assertEqual(0);
      expect(oldHandlers.denials).assertEqual(0);
      expect(oldHandlers.failures).assertEqual(0);
      expect(oldHandlers.grantedResult === undefined).assertEqual(true);
      expect(oldHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const newPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const newResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const newWait: Promise<PermissionRequestResult> =
        gate.request(() => newPending.promise, newHandlers);
      newPending.resolve(newResult);
      expect((await newWait) === newResult).assertEqual(true);
      expect(newHandlers.grants).assertEqual(1);
      expect(newHandlers.denials).assertEqual(0);
      expect(newHandlers.failures).assertEqual(0);
      expect(newHandlers.grantedResult === newResult).assertEqual(true);
      expect(newHandlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('new:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_2100
     * @tc.name CalendarEventPermissionInvalidation_0021
     * @tc.desc Place 1 invalidations before requester for current granted; retain its callback while preserving
     * settlement identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0021', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('current', trace);
      gate.invalidate();
      const currentPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const currentResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const currentWait: Promise<PermissionRequestResult> =
        gate.request(() => currentPending.promise, handlers);
      expect(trace.join(',')).assertEqual('');
      currentPending.resolve(currentResult);
      expect((await currentWait) === currentResult).assertEqual(true);
      expect(handlers.grants).assertEqual(1);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === currentResult).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('current:granted');
      const retryResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const retry: PermissionRecorder = new PermissionRecorder('retry', trace);
      expect((await gate.request(() => Promise.resolve(retryResult), retry)) === retryResult).assertEqual(true);
      expect(retry.grants).assertEqual(1);
      expect(retry.denials).assertEqual(0);
      expect(retry.failures).assertEqual(0);
      expect(retry.grantedResult === retryResult).assertEqual(true);
      expect(retry.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('current:granted,retry:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_2200
     * @tc.name CalendarEventPermissionInvalidation_0022
     * @tc.desc Place 1 invalidations inside requester for current granted; suppress its callback while preserving
     * settlement identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0022', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('current', trace);
      const currentPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const currentResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const currentWait: Promise<PermissionRequestResult> =
        gate.request((): Promise<PermissionRequestResult> => {
          gate.invalidate();
          return currentPending.promise;
        }, handlers);
      expect(trace.join(',')).assertEqual('');
      currentPending.resolve(currentResult);
      expect((await currentWait) === currentResult).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const retryResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const retry: PermissionRecorder = new PermissionRecorder('retry', trace);
      expect((await gate.request(() => Promise.resolve(retryResult), retry)) === retryResult).assertEqual(true);
      expect(retry.grants).assertEqual(1);
      expect(retry.denials).assertEqual(0);
      expect(retry.failures).assertEqual(0);
      expect(retry.grantedResult === retryResult).assertEqual(true);
      expect(retry.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('retry:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_2300
     * @tc.name CalendarEventPermissionInvalidation_0023
     * @tc.desc Place 2 invalidations before requester for current granted; retain its callback while preserving
     * settlement identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0023', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('current', trace);
      gate.invalidate();
      gate.invalidate();
      const currentPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const currentResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const currentWait: Promise<PermissionRequestResult> =
        gate.request(() => currentPending.promise, handlers);
      expect(trace.join(',')).assertEqual('');
      currentPending.resolve(currentResult);
      expect((await currentWait) === currentResult).assertEqual(true);
      expect(handlers.grants).assertEqual(1);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === currentResult).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('current:granted');
      const retryResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const retry: PermissionRecorder = new PermissionRecorder('retry', trace);
      expect((await gate.request(() => Promise.resolve(retryResult), retry)) === retryResult).assertEqual(true);
      expect(retry.grants).assertEqual(1);
      expect(retry.denials).assertEqual(0);
      expect(retry.failures).assertEqual(0);
      expect(retry.grantedResult === retryResult).assertEqual(true);
      expect(retry.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('current:granted,retry:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_2400
     * @tc.name CalendarEventPermissionInvalidation_0024
     * @tc.desc Place 2 invalidations inside requester for current granted; suppress its callback while preserving
     * settlement identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0024', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('current', trace);
      const currentPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const currentResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const currentWait: Promise<PermissionRequestResult> =
        gate.request((): Promise<PermissionRequestResult> => {
          gate.invalidate();
          gate.invalidate();
          return currentPending.promise;
        }, handlers);
      expect(trace.join(',')).assertEqual('');
      currentPending.resolve(currentResult);
      expect((await currentWait) === currentResult).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const retryResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const retry: PermissionRecorder = new PermissionRecorder('retry', trace);
      expect((await gate.request(() => Promise.resolve(retryResult), retry)) === retryResult).assertEqual(true);
      expect(retry.grants).assertEqual(1);
      expect(retry.denials).assertEqual(0);
      expect(retry.failures).assertEqual(0);
      expect(retry.grantedResult === retryResult).assertEqual(true);
      expect(retry.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('retry:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_2500
     * @tc.name CalendarEventPermissionInvalidation_0025
     * @tc.desc Place 1 invalidations before requester for current denied; retain its callback while preserving
     * settlement identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0025', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('current', trace);
      gate.invalidate();
      const currentPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const currentResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const currentWait: Promise<PermissionRequestResult> =
        gate.request(() => currentPending.promise, handlers);
      expect(trace.join(',')).assertEqual('');
      currentPending.resolve(currentResult);
      expect((await currentWait) === currentResult).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === currentResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('current:denied');
      const retryResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const retry: PermissionRecorder = new PermissionRecorder('retry', trace);
      expect((await gate.request(() => Promise.resolve(retryResult), retry)) === retryResult).assertEqual(true);
      expect(retry.grants).assertEqual(1);
      expect(retry.denials).assertEqual(0);
      expect(retry.failures).assertEqual(0);
      expect(retry.grantedResult === retryResult).assertEqual(true);
      expect(retry.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('current:denied,retry:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_2600
     * @tc.name CalendarEventPermissionInvalidation_0026
     * @tc.desc Place 1 invalidations inside requester for current denied; suppress its callback while preserving
     * settlement identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0026', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('current', trace);
      const currentPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const currentResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const currentWait: Promise<PermissionRequestResult> =
        gate.request((): Promise<PermissionRequestResult> => {
          gate.invalidate();
          return currentPending.promise;
        }, handlers);
      expect(trace.join(',')).assertEqual('');
      currentPending.resolve(currentResult);
      expect((await currentWait) === currentResult).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const retryResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const retry: PermissionRecorder = new PermissionRecorder('retry', trace);
      expect((await gate.request(() => Promise.resolve(retryResult), retry)) === retryResult).assertEqual(true);
      expect(retry.grants).assertEqual(1);
      expect(retry.denials).assertEqual(0);
      expect(retry.failures).assertEqual(0);
      expect(retry.grantedResult === retryResult).assertEqual(true);
      expect(retry.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('retry:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_2700
     * @tc.name CalendarEventPermissionInvalidation_0027
     * @tc.desc Place 2 invalidations before requester for current denied; retain its callback while preserving
     * settlement identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0027', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('current', trace);
      gate.invalidate();
      gate.invalidate();
      const currentPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const currentResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const currentWait: Promise<PermissionRequestResult> =
        gate.request(() => currentPending.promise, handlers);
      expect(trace.join(',')).assertEqual('');
      currentPending.resolve(currentResult);
      expect((await currentWait) === currentResult).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === currentResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('current:denied');
      const retryResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const retry: PermissionRecorder = new PermissionRecorder('retry', trace);
      expect((await gate.request(() => Promise.resolve(retryResult), retry)) === retryResult).assertEqual(true);
      expect(retry.grants).assertEqual(1);
      expect(retry.denials).assertEqual(0);
      expect(retry.failures).assertEqual(0);
      expect(retry.grantedResult === retryResult).assertEqual(true);
      expect(retry.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('current:denied,retry:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_2800
     * @tc.name CalendarEventPermissionInvalidation_0028
     * @tc.desc Place 2 invalidations inside requester for current denied; suppress its callback while preserving
     * settlement identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0028', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('current', trace);
      const currentPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const currentResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const currentWait: Promise<PermissionRequestResult> =
        gate.request((): Promise<PermissionRequestResult> => {
          gate.invalidate();
          gate.invalidate();
          return currentPending.promise;
        }, handlers);
      expect(trace.join(',')).assertEqual('');
      currentPending.resolve(currentResult);
      expect((await currentWait) === currentResult).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const retryResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const retry: PermissionRecorder = new PermissionRecorder('retry', trace);
      expect((await gate.request(() => Promise.resolve(retryResult), retry)) === retryResult).assertEqual(true);
      expect(retry.grants).assertEqual(1);
      expect(retry.denials).assertEqual(0);
      expect(retry.failures).assertEqual(0);
      expect(retry.grantedResult === retryResult).assertEqual(true);
      expect(retry.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('retry:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_2900
     * @tc.name CalendarEventPermissionInvalidation_0029
     * @tc.desc Place 1 invalidations before requester for current failed; retain its callback while preserving
     * settlement identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0029', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('current', trace);
      gate.invalidate();
      const currentPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const currentError: Error = new Error('current rejected');
      const currentWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => currentPending.promise, handlers));
      expect(trace.join(',')).assertEqual('');
      currentPending.reject(currentError);
      const currentFailure: Error | undefined = await currentWait;
      expect(currentFailure?.message).assertEqual('current rejected');
      expect(currentFailure === currentError).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(1);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('current:failed');
      const retryResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const retry: PermissionRecorder = new PermissionRecorder('retry', trace);
      expect((await gate.request(() => Promise.resolve(retryResult), retry)) === retryResult).assertEqual(true);
      expect(retry.grants).assertEqual(1);
      expect(retry.denials).assertEqual(0);
      expect(retry.failures).assertEqual(0);
      expect(retry.grantedResult === retryResult).assertEqual(true);
      expect(retry.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('current:failed,retry:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_3000
     * @tc.name CalendarEventPermissionInvalidation_0030
     * @tc.desc Place 1 invalidations inside requester for current failed; suppress its callback while preserving
     * settlement identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0030', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('current', trace);
      const currentPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const currentError: Error = new Error('current rejected');
      const currentWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          gate.invalidate();
          return currentPending.promise;
        }, handlers));
      expect(trace.join(',')).assertEqual('');
      currentPending.reject(currentError);
      const currentFailure: Error | undefined = await currentWait;
      expect(currentFailure?.message).assertEqual('current rejected');
      expect(currentFailure === currentError).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('');
      const retryResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const retry: PermissionRecorder = new PermissionRecorder('retry', trace);
      expect((await gate.request(() => Promise.resolve(retryResult), retry)) === retryResult).assertEqual(true);
      expect(retry.grants).assertEqual(1);
      expect(retry.denials).assertEqual(0);
      expect(retry.failures).assertEqual(0);
      expect(retry.grantedResult === retryResult).assertEqual(true);
      expect(retry.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('retry:granted');
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_INVALIDATION_3100
     * @tc.name CalendarEventPermissionInvalidation_0031
     * @tc.desc Place 2 invalidations before requester for current failed; retain its callback while preserving
     * settlement identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionInvalidation_0031', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('current', trace);
      gate.invalidate();
      gate.invalidate();
      const currentPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const currentError: Error = new Error('current rejected');
      const currentWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => currentPending.promise, handlers));
      expect(trace.join(',')).assertEqual('');
      currentPending.reject(currentError);
      const currentFailure: Error | undefined = await currentWait;
      expect(currentFailure?.message).assertEqual('current rejected');
      expect(currentFailure === currentError).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(1);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('current:failed');
      const retryResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const retry: PermissionRecorder = new PermissionRecorder('retry', trace);
      expect((await gate.request(() => Promise.resolve(retryResult), retry)) === retryResult).assertEqual(true);
      expect(retry.grants).assertEqual(1);