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
  signal: () => void = (): void => {};

  constructor(label: string, trace: string[]) {
    this.label = label;
    this.trace = trace;
  }

  onGranted(result: PermissionRequestResult): void {
    this.grants++;
    this.grantedResult = result;
    this.trace.push(this.label + ':granted');
    this.signal();
  }

  onDenied(result: PermissionRequestResult): void {
    this.denials++;
    this.deniedResult = result;
    this.trace.push(this.label + ':denied');
    this.signal();
  }

  onFailed(): void {
    this.failures++;
    this.trace.push(this.label + ':failed');
    this.signal();
  }
}

export default function calendarPermissionReentryTest(): void {
  describe('CalendarPermissionReentry', (): void => {
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_0100
     * @tc.name CalendarEventPermissionReentry_0001
     * @tc.desc Start nested granted from outer granted callback on same gate; preserve outer settlement and nested
     * callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0001', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(1);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === outerResult).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:granted');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(1);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === innerResult).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:granted,inner:granted');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_0200
     * @tc.name CalendarEventPermissionReentry_0002
     * @tc.desc Start nested denied from outer granted callback on same gate; preserve outer settlement and nested
     * callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0002', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(1);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === outerResult).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:granted');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(1);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === innerResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:granted,inner:denied');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_0300
     * @tc.name CalendarEventPermissionReentry_0003
     * @tc.desc Start nested failed from outer granted callback on same gate; preserve outer settlement and nested
     * callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0003', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerError: Error = new Error('inner rejected');
      let innerWait: Promise<Error | undefined> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = captureFailure(() => nestedGate.request(() => innerPending.promise, inner));
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(1);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === outerResult).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:granted');
      innerPending.reject(innerError);
      const innerFailure: Error | undefined = await innerWait;
      expect(innerFailure?.message).assertEqual('inner rejected');
      expect(innerFailure === innerError).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(1);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:granted,inner:failed');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_0400
     * @tc.name CalendarEventPermissionReentry_0004
     * @tc.desc Start nested invalidated grant from outer granted callback on same gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0004', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
        nestedGate.invalidate();
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(1);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === outerResult).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:granted');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:granted');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_0500
     * @tc.name CalendarEventPermissionReentry_0005
     * @tc.desc Start nested granted from outer granted callback on independent gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0005', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(1);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === outerResult).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:granted');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(1);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === innerResult).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:granted,inner:granted');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_0600
     * @tc.name CalendarEventPermissionReentry_0006
     * @tc.desc Start nested denied from outer granted callback on independent gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0006', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(1);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === outerResult).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:granted');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(1);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === innerResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:granted,inner:denied');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_0700
     * @tc.name CalendarEventPermissionReentry_0007
     * @tc.desc Start nested failed from outer granted callback on independent gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0007', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerError: Error = new Error('inner rejected');
      let innerWait: Promise<Error | undefined> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = captureFailure(() => nestedGate.request(() => innerPending.promise, inner));
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(1);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === outerResult).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:granted');
      innerPending.reject(innerError);
      const innerFailure: Error | undefined = await innerWait;
      expect(innerFailure?.message).assertEqual('inner rejected');
      expect(innerFailure === innerError).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(1);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:granted,inner:failed');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_0800
     * @tc.name CalendarEventPermissionReentry_0008
     * @tc.desc Start nested invalidated grant from outer granted callback on independent gate; preserve outer
     * settlement and nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0008', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
        nestedGate.invalidate();
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(1);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === outerResult).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:granted');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:granted');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_0900
     * @tc.name CalendarEventPermissionReentry_0009
     * @tc.desc Start nested granted from outer denied callback on same gate; preserve outer settlement and nested
     * callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0009', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(1);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === outerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:denied');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(1);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === innerResult).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:denied,inner:granted');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_1000
     * @tc.name CalendarEventPermissionReentry_0010
     * @tc.desc Start nested denied from outer denied callback on same gate; preserve outer settlement and nested
     * callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0010', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(1);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === outerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:denied');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(1);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === innerResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:denied,inner:denied');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_1100
     * @tc.name CalendarEventPermissionReentry_0011
     * @tc.desc Start nested failed from outer denied callback on same gate; preserve outer settlement and nested
     * callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0011', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerError: Error = new Error('inner rejected');
      let innerWait: Promise<Error | undefined> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = captureFailure(() => nestedGate.request(() => innerPending.promise, inner));
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(1);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === outerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:denied');
      innerPending.reject(innerError);
      const innerFailure: Error | undefined = await innerWait;
      expect(innerFailure?.message).assertEqual('inner rejected');
      expect(innerFailure === innerError).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(1);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:denied,inner:failed');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_1200
     * @tc.name CalendarEventPermissionReentry_0012
     * @tc.desc Start nested invalidated grant from outer denied callback on same gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0012', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
        nestedGate.invalidate();
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(1);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === outerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:denied');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:denied');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_1300
     * @tc.name CalendarEventPermissionReentry_0013
     * @tc.desc Start nested granted from outer denied callback on independent gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0013', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(1);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === outerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:denied');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(1);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === innerResult).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:denied,inner:granted');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_1400
     * @tc.name CalendarEventPermissionReentry_0014
     * @tc.desc Start nested denied from outer denied callback on independent gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0014', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(1);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === outerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:denied');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(1);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === innerResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:denied,inner:denied');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_1500
     * @tc.name CalendarEventPermissionReentry_0015
     * @tc.desc Start nested failed from outer denied callback on independent gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0015', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerError: Error = new Error('inner rejected');
      let innerWait: Promise<Error | undefined> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = captureFailure(() => nestedGate.request(() => innerPending.promise, inner));
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(1);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === outerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:denied');
      innerPending.reject(innerError);
      const innerFailure: Error | undefined = await innerWait;
      expect(innerFailure?.message).assertEqual('inner rejected');
      expect(innerFailure === innerError).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(1);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:denied,inner:failed');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_1600
     * @tc.name CalendarEventPermissionReentry_0016
     * @tc.desc Start nested invalidated grant from outer denied callback on independent gate; preserve outer
     * settlement and nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0016', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
        nestedGate.invalidate();
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const outerWait: Promise<PermissionRequestResult> =
        gate.request(() => outerPending.promise, outer);
      outerPending.resolve(outerResult);
      expect((await outerWait) === outerResult).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(1);
      expect(outer.failures).assertEqual(0);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === outerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:denied');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:denied');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_1700
     * @tc.name CalendarEventPermissionReentry_0017
     * @tc.desc Start nested granted from outer failed callback on same gate; preserve outer settlement and nested
     * callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0017', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerError: Error = new Error('outer rejected');
      const outerWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => outerPending.promise, outer));
      outerPending.reject(outerError);
      const outerFailure: Error | undefined = await outerWait;
      expect(outerFailure?.message).assertEqual('outer rejected');
      expect(outerFailure === outerError).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(1);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:failed');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(1);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === innerResult).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:failed,inner:granted');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_1800
     * @tc.name CalendarEventPermissionReentry_0018
     * @tc.desc Start nested denied from outer failed callback on same gate; preserve outer settlement and nested
     * callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0018', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerError: Error = new Error('outer rejected');
      const outerWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => outerPending.promise, outer));
      outerPending.reject(outerError);
      const outerFailure: Error | undefined = await outerWait;
      expect(outerFailure?.message).assertEqual('outer rejected');
      expect(outerFailure === outerError).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(1);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:failed');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(1);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === innerResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:failed,inner:denied');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_1900
     * @tc.name CalendarEventPermissionReentry_0019
     * @tc.desc Start nested failed from outer failed callback on same gate; preserve outer settlement and nested
     * callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0019', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerError: Error = new Error('inner rejected');
      let innerWait: Promise<Error | undefined> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = captureFailure(() => nestedGate.request(() => innerPending.promise, inner));
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerError: Error = new Error('outer rejected');
      const outerWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => outerPending.promise, outer));
      outerPending.reject(outerError);
      const outerFailure: Error | undefined = await outerWait;
      expect(outerFailure?.message).assertEqual('outer rejected');
      expect(outerFailure === outerError).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(1);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:failed');
      innerPending.reject(innerError);
      const innerFailure: Error | undefined = await innerWait;
      expect(innerFailure?.message).assertEqual('inner rejected');
      expect(innerFailure === innerError).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(1);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:failed,inner:failed');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_2000
     * @tc.name CalendarEventPermissionReentry_0020
     * @tc.desc Start nested invalidated grant from outer failed callback on same gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0020', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = gate;
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
        nestedGate.invalidate();
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerError: Error = new Error('outer rejected');
      const outerWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => outerPending.promise, outer));
      outerPending.reject(outerError);
      const outerFailure: Error | undefined = await outerWait;
      expect(outerFailure?.message).assertEqual('outer rejected');
      expect(outerFailure === outerError).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(1);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:failed');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:failed');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_2100
     * @tc.name CalendarEventPermissionReentry_0021
     * @tc.desc Start nested granted from outer failed callback on independent gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0021', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerError: Error = new Error('outer rejected');
      const outerWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => outerPending.promise, outer));
      outerPending.reject(outerError);
      const outerFailure: Error | undefined = await outerWait;
      expect(outerFailure?.message).assertEqual('outer rejected');
      expect(outerFailure === outerError).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(1);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:failed');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(1);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === innerResult).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:failed,inner:granted');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_2200
     * @tc.name CalendarEventPermissionReentry_0022
     * @tc.desc Start nested denied from outer failed callback on independent gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0022', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerError: Error = new Error('outer rejected');
      const outerWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => outerPending.promise, outer));
      outerPending.reject(outerError);
      const outerFailure: Error | undefined = await outerWait;
      expect(outerFailure?.message).assertEqual('outer rejected');
      expect(outerFailure === outerError).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(1);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:failed');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(1);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === innerResult).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:failed,inner:denied');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_2300
     * @tc.name CalendarEventPermissionReentry_0023
     * @tc.desc Start nested failed from outer failed callback on independent gate; preserve outer settlement and
     * nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0023', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerError: Error = new Error('inner rejected');
      let innerWait: Promise<Error | undefined> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = captureFailure(() => nestedGate.request(() => innerPending.promise, inner));
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerError: Error = new Error('outer rejected');
      const outerWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => outerPending.promise, outer));
      outerPending.reject(outerError);
      const outerFailure: Error | undefined = await outerWait;
      expect(outerFailure?.message).assertEqual('outer rejected');
      expect(outerFailure === outerError).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(1);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:failed');
      innerPending.reject(innerError);
      const innerFailure: Error | undefined = await innerWait;
      expect(innerFailure?.message).assertEqual('inner rejected');
      expect(innerFailure === innerError).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(1);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:failed,inner:failed');
      expect(nestedRequests).assertEqual(1);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_REENTRY_2400
     * @tc.name CalendarEventPermissionReentry_0024
     * @tc.desc Start nested invalidated grant from outer failed callback on independent gate; preserve outer
     * settlement and nested callback exclusivity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionReentry_0024', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const nestedGate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const outer: PermissionRecorder = new PermissionRecorder('outer', trace);
      const inner: PermissionRecorder = new PermissionRecorder('inner', trace);
      const innerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const innerResult: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      let innerWait: Promise<PermissionRequestResult> | undefined;
      let nestedRequests: number = 0;
      outer.signal = (): void => {
        nestedRequests++;
        innerWait = nestedGate.request(() => innerPending.promise, inner);
        nestedGate.invalidate();
      };
      const outerPending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const outerError: Error = new Error('outer rejected');
      const outerWait: Promise<Error | undefined> = captureFailure(() =>
        gate.request(() => outerPending.promise, outer));
      outerPending.reject(outerError);
      const outerFailure: Error | undefined = await outerWait;
      expect(outerFailure?.message).assertEqual('outer rejected');
      expect(outerFailure === outerError).assertEqual(true);
      expect(nestedRequests).assertEqual(1);
      expect(innerWait !== undefined).assertEqual(true);
      expect(outer.grants).assertEqual(0);
      expect(outer.denials).assertEqual(0);
      expect(outer.failures).assertEqual(1);
      expect(outer.grantedResult === undefined).assertEqual(true);
      expect(outer.deniedResult === undefined).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(trace.join(',')).assertEqual('outer:failed');
      innerPending.resolve(innerResult);
      expect((await innerWait) === innerResult).assertEqual(true);
      expect(inner.grants).assertEqual(0);
      expect(inner.denials).assertEqual(0);
      expect(inner.failures).assertEqual(0);
      expect(inner.grantedResult === undefined).assertEqual(true);
      expect(inner.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('outer:failed');
      expect(nestedRequests).assertEqual(1);
    });
  });
}
