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
import { CalendarPermissionGate, hasCalendarPermissions } from '../../../main/ets/CalendarPermission';
import type { CalendarPermissionHandlers } from '../../../main/ets/CalendarPermission';
import { captureFailure } from './CalendarLogicFixtures';

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

export default function calendarPermissionFailuresTest(): void {
  describe('CalendarPermissionFailures', (): void => {
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_0100
     * @tc.name CalendarEventPermissionFailures_0001
     * @tc.desc Preserve original Error on synchronous throw; retry forward grant after 0 invalidation and route only
     * the recovery granted callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0001', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(1);
      expect(recovered.denials).assertEqual(0);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === recovery).assertEqual(true);
      expect(recovered.deniedResult === undefined).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:granted');
      expect(hasCalendarPermissions(returned)).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_0200
     * @tc.name CalendarEventPermissionFailures_0002
     * @tc.desc Preserve original Error on synchronous throw; retry forward grant after 1 invalidation and route only
     * the recovery granted callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0002', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(1);
      expect(recovered.denials).assertEqual(0);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === recovery).assertEqual(true);
      expect(recovered.deniedResult === undefined).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:granted');
      expect(hasCalendarPermissions(returned)).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_0300
     * @tc.name CalendarEventPermissionFailures_0003
     * @tc.desc Preserve original Error on synchronous throw; retry reverse grant after 0 invalidation and route only
     * the recovery granted callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0003', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(1);
      expect(recovered.denials).assertEqual(0);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === recovery).assertEqual(true);
      expect(recovered.deniedResult === undefined).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:granted');
      expect(hasCalendarPermissions(returned)).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_0400
     * @tc.name CalendarEventPermissionFailures_0004
     * @tc.desc Preserve original Error on synchronous throw; retry reverse grant after 1 invalidation and route only
     * the recovery granted callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0004', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(1);
      expect(recovered.denials).assertEqual(0);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === recovery).assertEqual(true);
      expect(recovered.deniedResult === undefined).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:granted');
      expect(hasCalendarPermissions(returned)).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_0500
     * @tc.name CalendarEventPermissionFailures_0005
     * @tc.desc Preserve original Error on synchronous throw; retry write denial after 0 invalidation and route only
     * the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0005', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_0600
     * @tc.name CalendarEventPermissionFailures_0006
     * @tc.desc Preserve original Error on synchronous throw; retry write denial after 1 invalidation and route only
     * the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0006', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_0700
     * @tc.name CalendarEventPermissionFailures_0007
     * @tc.desc Preserve original Error on synchronous throw; retry read denial after 0 invalidation and route only
     * the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0007', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_0800
     * @tc.name CalendarEventPermissionFailures_0008
     * @tc.desc Preserve original Error on synchronous throw; retry read denial after 1 invalidation and route only
     * the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0008', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_0900
     * @tc.name CalendarEventPermissionFailures_0009
     * @tc.desc Preserve original Error on synchronous throw; retry duplicate read after 0 invalidation and route only
     * the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0009', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_1000
     * @tc.name CalendarEventPermissionFailures_0010
     * @tc.desc Preserve original Error on synchronous throw; retry duplicate read after 1 invalidation and route only
     * the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0010', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_1100
     * @tc.name CalendarEventPermissionFailures_0011
     * @tc.desc Preserve original Error on synchronous throw; retry short authorization after 0 invalidation and route
     * only the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0011', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_1200
     * @tc.name CalendarEventPermissionFailures_0012
     * @tc.desc Preserve original Error on synchronous throw; retry short authorization after 1 invalidation and route
     * only the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0012', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_1300
     * @tc.name CalendarEventPermissionFailures_0013
     * @tc.desc Keep settled forward grant callback identity when the next requester produces synchronous throw;
     * propagate the new Error and do not replay success callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0013', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const prior: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request(() => Promise.resolve(prior), handlers);
      expect(returned === prior).assertEqual(true);
      expect(handlers.grants).assertEqual(1);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === prior).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      const original: Error = new Error('next request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, handlers));
      expect(error?.message).assertEqual('next request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(handlers.grants).assertEqual(1);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(1);
      expect(handlers.grantedResult === prior).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:granted,shared:failed');
      expect(hasCalendarPermissions(prior)).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_1400
     * @tc.name CalendarEventPermissionFailures_0014
     * @tc.desc Keep settled write denial callback identity when the next requester produces synchronous throw;
     * propagate the new Error and do not replay success callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0014', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const prior: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const returned: PermissionRequestResult = await gate.request(() => Promise.resolve(prior), handlers);
      expect(returned === prior).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === prior).assertEqual(true);
      const original: Error = new Error('next request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, handlers));
      expect(error?.message).assertEqual('next request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(1);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === prior).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied,shared:failed');
      expect(hasCalendarPermissions(prior)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_1500
     * @tc.name CalendarEventPermissionFailures_0015
     * @tc.desc Keep settled duplicate read callback identity when the next requester produces synchronous throw;
     * propagate the new Error and do not replay success callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0015', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const prior: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request(() => Promise.resolve(prior), handlers);
      expect(returned === prior).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === prior).assertEqual(true);
      const original: Error = new Error('next request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          throw original;
        }, handlers));
      expect(error?.message).assertEqual('next request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(1);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === prior).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied,shared:failed');
      expect(hasCalendarPermissions(prior)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_1600
     * @tc.name CalendarEventPermissionFailures_0016
     * @tc.desc Preserve original Error on asynchronous rejection; retry forward grant after 0 invalidation and route
     * only the recovery granted callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0016', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(1);
      expect(recovered.denials).assertEqual(0);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === recovery).assertEqual(true);
      expect(recovered.deniedResult === undefined).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:granted');
      expect(hasCalendarPermissions(returned)).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_1700
     * @tc.name CalendarEventPermissionFailures_0017
     * @tc.desc Preserve original Error on asynchronous rejection; retry forward grant after 1 invalidation and route
     * only the recovery granted callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0017', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(1);
      expect(recovered.denials).assertEqual(0);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === recovery).assertEqual(true);
      expect(recovered.deniedResult === undefined).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:granted');
      expect(hasCalendarPermissions(returned)).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_1800
     * @tc.name CalendarEventPermissionFailures_0018
     * @tc.desc Preserve original Error on asynchronous rejection; retry reverse grant after 0 invalidation and route
     * only the recovery granted callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0018', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(1);
      expect(recovered.denials).assertEqual(0);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === recovery).assertEqual(true);
      expect(recovered.deniedResult === undefined).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:granted');
      expect(hasCalendarPermissions(returned)).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_1900
     * @tc.name CalendarEventPermissionFailures_0019
     * @tc.desc Preserve original Error on asynchronous rejection; retry reverse grant after 1 invalidation and route
     * only the recovery granted callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0019', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(1);
      expect(recovered.denials).assertEqual(0);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === recovery).assertEqual(true);
      expect(recovered.deniedResult === undefined).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:granted');
      expect(hasCalendarPermissions(returned)).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_2000
     * @tc.name CalendarEventPermissionFailures_0020
     * @tc.desc Preserve original Error on asynchronous rejection; retry write denial after 0 invalidation and route
     * only the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0020', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_2100
     * @tc.name CalendarEventPermissionFailures_0021
     * @tc.desc Preserve original Error on asynchronous rejection; retry write denial after 1 invalidation and route
     * only the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0021', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_2200
     * @tc.name CalendarEventPermissionFailures_0022
     * @tc.desc Preserve original Error on asynchronous rejection; retry read denial after 0 invalidation and route
     * only the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0022', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_2300
     * @tc.name CalendarEventPermissionFailures_0023
     * @tc.desc Preserve original Error on asynchronous rejection; retry read denial after 1 invalidation and route
     * only the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0023', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_2400
     * @tc.name CalendarEventPermissionFailures_0024
     * @tc.desc Preserve original Error on asynchronous rejection; retry duplicate read after 0 invalidation and route
     * only the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0024', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_2500
     * @tc.name CalendarEventPermissionFailures_0025
     * @tc.desc Preserve original Error on asynchronous rejection; retry duplicate read after 1 invalidation and route
     * only the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0025', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_2600
     * @tc.name CalendarEventPermissionFailures_0026
     * @tc.desc Preserve original Error on asynchronous rejection; retry short authorization after 0 invalidation and
     * route only the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0026', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_2700
     * @tc.name CalendarEventPermissionFailures_0027
     * @tc.desc Preserve original Error on asynchronous rejection; retry short authorization after 1 invalidation and
     * route only the recovery denied callback.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0027', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const failed: PermissionRecorder = new PermissionRecorder('failed', trace);
      const recovered: PermissionRecorder = new PermissionRecorder('retry', trace);
      const original: Error = new Error('permission request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, failed));
      expect(error?.message).assertEqual('permission request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(failed.grants).assertEqual(0);
      expect(failed.denials).assertEqual(0);
      expect(failed.failures).assertEqual(1);
      expect(failed.grantedResult === undefined).assertEqual(true);
      expect(failed.deniedResult === undefined).assertEqual(true);
      gate.invalidate();
      const recovery: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0]
      };
      const returned: PermissionRequestResult = await gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(recovery);
      }, recovered);
      expect(returned === recovery).assertEqual(true);
      expect(requests).assertEqual(2);
      expect(recovered.grants).assertEqual(0);
      expect(recovered.denials).assertEqual(1);
      expect(recovered.failures).assertEqual(0);
      expect(recovered.grantedResult === undefined).assertEqual(true);
      expect(recovered.deniedResult === recovery).assertEqual(true);
      expect(failed.failures).assertEqual(1);
      expect(trace.join(',')).assertEqual('failed:failed,retry:denied');
      expect(hasCalendarPermissions(returned)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_2800
     * @tc.name CalendarEventPermissionFailures_0028
     * @tc.desc Keep settled forward grant callback identity when the next requester produces asynchronous rejection;
     * propagate the new Error and do not replay success callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0028', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const prior: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request(() => Promise.resolve(prior), handlers);
      expect(returned === prior).assertEqual(true);
      expect(handlers.grants).assertEqual(1);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === prior).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      const original: Error = new Error('next request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, handlers));
      expect(error?.message).assertEqual('next request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(handlers.grants).assertEqual(1);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(1);
      expect(handlers.grantedResult === prior).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:granted,shared:failed');
      expect(hasCalendarPermissions(prior)).assertEqual(true);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_2900
     * @tc.name CalendarEventPermissionFailures_0029
     * @tc.desc Keep settled write denial callback identity when the next requester produces asynchronous rejection;
     * propagate the new Error and do not replay success callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0029', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const prior: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const returned: PermissionRequestResult = await gate.request(() => Promise.resolve(prior), handlers);
      expect(returned === prior).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === prior).assertEqual(true);
      const original: Error = new Error('next request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, handlers));
      expect(error?.message).assertEqual('next request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(1);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === prior).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied,shared:failed');
      expect(hasCalendarPermissions(prior)).assertEqual(false);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_FAILURES_3000
     * @tc.name CalendarEventPermissionFailures_0030
     * @tc.desc Keep settled duplicate read callback identity when the next requester produces asynchronous rejection;
     * propagate the new Error and do not replay success callbacks.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionFailures_0030', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('shared', trace);
      const prior: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const returned: PermissionRequestResult = await gate.request(() => Promise.resolve(prior), handlers);
      expect(returned === prior).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === prior).assertEqual(true);
      const original: Error = new Error('next request failed');
      let requests: number = 0;
      const error: Error | undefined = await captureFailure(() =>
        gate.request((): Promise<PermissionRequestResult> => {
          requests++;
          return Promise.reject(original);
        }, handlers));
      expect(error?.message).assertEqual('next request failed');
      expect(error === original).assertEqual(true);
      expect(requests).assertEqual(1);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(1);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === prior).assertEqual(true);
      expect(trace.join(',')).assertEqual('shared:denied,shared:failed');
      expect(hasCalendarPermissions(prior)).assertEqual(false);
    });
  });
}
