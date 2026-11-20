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
import { Pending } from './CalendarLogicFixtures';

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

export default function calendarPermissionRoutingTest(): void {
  describe('CalendarPermissionRouting', (): void => {
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_0100
     * @tc.name CalendarEventPermissionRouting_0001
     * @tc.desc Route deferred read/write order with authResults [0, 0] to exactly one granted callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0001', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(1);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === result).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:granted');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_0200
     * @tc.name CalendarEventPermissionRouting_0002
     * @tc.desc Route resolved read/write order with authResults [0, -1] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0002', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_0300
     * @tc.name CalendarEventPermissionRouting_0003
     * @tc.desc Route deferred read/write order with authResults [-1, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0003', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [-1, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_0400
     * @tc.name CalendarEventPermissionRouting_0004
     * @tc.desc Route resolved read/write order with authResults [0, 1] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0004', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 1]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_0500
     * @tc.name CalendarEventPermissionRouting_0005
     * @tc.desc Route deferred read/write order with authResults [2, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0005', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [2, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_0600
     * @tc.name CalendarEventPermissionRouting_0006
     * @tc.desc Route resolved read/write order with authResults [0, 2147483647] to exactly one denied callback with
     * original object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0006', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 2147483647]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_0700
     * @tc.name CalendarEventPermissionRouting_0007
     * @tc.desc Route deferred read/write order with authResults [-2147483648, 0] to exactly one denied callback with
     * original object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0007', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [-2147483648, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_0800
     * @tc.name CalendarEventPermissionRouting_0008
     * @tc.desc Route resolved read/write order with authResults [0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0008', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_0900
     * @tc.name CalendarEventPermissionRouting_0009
     * @tc.desc Route deferred read/write order with authResults [0, 0, 0] to exactly one denied callback with
     * original object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0009', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_1000
     * @tc.name CalendarEventPermissionRouting_0010
     * @tc.desc Route resolved write/read order with authResults [0, 0] to exactly one granted callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0010', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(1);
      expect(handlers.denials).assertEqual(0);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === result).assertEqual(true);
      expect(handlers.deniedResult === undefined).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:granted');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_1100
     * @tc.name CalendarEventPermissionRouting_0011
     * @tc.desc Route deferred write/read order with authResults [0, -1] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0011', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_1200
     * @tc.name CalendarEventPermissionRouting_0012
     * @tc.desc Route resolved write/read order with authResults [-1, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0012', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [-1, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_1300
     * @tc.name CalendarEventPermissionRouting_0013
     * @tc.desc Route deferred write/read order with authResults [0, 1] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0013', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 1]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_1400
     * @tc.name CalendarEventPermissionRouting_0014
     * @tc.desc Route resolved write/read order with authResults [2, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0014', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [2, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_1500
     * @tc.name CalendarEventPermissionRouting_0015
     * @tc.desc Route deferred write/read order with authResults [0, 2147483647] to exactly one denied callback with
     * original object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0015', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 2147483647]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_1600
     * @tc.name CalendarEventPermissionRouting_0016
     * @tc.desc Route resolved write/read order with authResults [-2147483648, 0] to exactly one denied callback with
     * original object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0016', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [-2147483648, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_1700
     * @tc.name CalendarEventPermissionRouting_0017
     * @tc.desc Route deferred write/read order with authResults [0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0017', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_1800
     * @tc.name CalendarEventPermissionRouting_0018
     * @tc.desc Route resolved write/read order with authResults [0, 0, 0] to exactly one denied callback with
     * original object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0018', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_1900
     * @tc.name CalendarEventPermissionRouting_0019
     * @tc.desc Route deferred empty permissions with authResults [0, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0019', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_2000
     * @tc.name CalendarEventPermissionRouting_0020
     * @tc.desc Route resolved read only with authResults [0, 0] to exactly one denied callback with original object
     * identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0020', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_2100
     * @tc.name CalendarEventPermissionRouting_0021
     * @tc.desc Route deferred write only with authResults [0, 0] to exactly one denied callback with original object
     * identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0021', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_2200
     * @tc.name CalendarEventPermissionRouting_0022
     * @tc.desc Route resolved duplicate reads with authResults [0, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0022', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_2300
     * @tc.name CalendarEventPermissionRouting_0023
     * @tc.desc Route deferred duplicate reads with authResults [0, -1] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0023', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_2400
     * @tc.name CalendarEventPermissionRouting_0024
     * @tc.desc Route resolved duplicate writes with authResults [0, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0024', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_2500
     * @tc.name CalendarEventPermissionRouting_0025
     * @tc.desc Route deferred duplicate writes with authResults [0, -1] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0025', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_2600
     * @tc.name CalendarEventPermissionRouting_0026
     * @tc.desc Route resolved read then unknown with authResults [0, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0026', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.UNKNOWN_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_2700
     * @tc.name CalendarEventPermissionRouting_0027
     * @tc.desc Route deferred read then unknown with authResults [0, -1] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0027', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.UNKNOWN_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_2800
     * @tc.name CalendarEventPermissionRouting_0028
     * @tc.desc Route resolved unknown then write with authResults [0, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0028', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.UNKNOWN_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_2900
     * @tc.name CalendarEventPermissionRouting_0029
     * @tc.desc Route deferred unknown then write with authResults [0, -1] to exactly one denied callback with
     * original object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0029', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.UNKNOWN_CALENDAR',
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_3000
     * @tc.name CalendarEventPermissionRouting_0030
     * @tc.desc Route resolved write then unknown with authResults [0, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0030', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.UNKNOWN_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_3100
     * @tc.name CalendarEventPermissionRouting_0031
     * @tc.desc Route deferred write then unknown with authResults [0, -1] to exactly one denied callback with
     * original object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0031', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.UNKNOWN_CALENDAR'
        ],
        authResults: [0, -1]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_3200
     * @tc.name CalendarEventPermissionRouting_0032
     * @tc.desc Route resolved extra unknown with authResults [0, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0032', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.UNKNOWN_CALENDAR'
        ],
        authResults: [0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_3300
     * @tc.name CalendarEventPermissionRouting_0033
     * @tc.desc Route deferred empty permissions with authResults [] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0033', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
        ],
        authResults: []
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_3400
     * @tc.name CalendarEventPermissionRouting_0034
     * @tc.desc Route resolved read only with authResults [0] to exactly one denied callback with original object
     * identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0034', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_3500
     * @tc.name CalendarEventPermissionRouting_0035
     * @tc.desc Route deferred write only with authResults [0] to exactly one denied callback with original object
     * identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0035', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.WRITE_CALENDAR'
        ],
        authResults: [0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_3600
     * @tc.name CalendarEventPermissionRouting_0036
     * @tc.desc Route resolved extra unknown with authResults [0, 0, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0036', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.UNKNOWN_CALENDAR'
        ],
        authResults: [0, 0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return Promise.resolve(result);
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
    /**
     * @tc.number SUB_CALENDAR_PERMISSION_ROUTING_3700
     * @tc.name CalendarEventPermissionRouting_0037
     * @tc.desc Route deferred extra duplicate with authResults [0, 0, 0] to exactly one denied callback with original
     * object identity.
     * @tc.type FUNC
     */
    it('CalendarEventPermissionRouting_0037', 0, async (): Promise<void> => {
      const gate: CalendarPermissionGate = new CalendarPermissionGate();
      const trace: string[] = [];
      const handlers: PermissionRecorder = new PermissionRecorder('route', trace);
      const result: PermissionRequestResult = {
        permissions: [
          'ohos.permission.READ_CALENDAR',
          'ohos.permission.WRITE_CALENDAR',
          'ohos.permission.READ_CALENDAR'
        ],
        authResults: [0, 0, 0]
      };
      const permissions: string[] = result.permissions;
      const statuses: number[] = result.authResults;
      const permissionText: string = permissions.join('|');
      const statusText: string = statuses.join('|');
      let requests: number = 0;
      const pending: Pending<PermissionRequestResult> = new Pending<PermissionRequestResult>();
      const waiting: Promise<PermissionRequestResult> = gate.request((): Promise<PermissionRequestResult> => {
        requests++;
        return pending.promise;
      }, handlers);
      expect(requests).assertEqual(1);
      expect(trace.join(',')).assertEqual('');
      pending.resolve(result);
      const returned: PermissionRequestResult = await waiting;
      expect(returned === result).assertEqual(true);
      expect(handlers.grants).assertEqual(0);
      expect(handlers.denials).assertEqual(1);
      expect(handlers.failures).assertEqual(0);
      expect(handlers.grantedResult === undefined).assertEqual(true);
      expect(handlers.deniedResult === result).assertEqual(true);
      expect(trace.join(',')).assertEqual('route:denied');
      expect(returned.permissions === permissions).assertEqual(true);
      expect(returned.authResults === statuses).assertEqual(true);
      expect(permissions.join('|')).assertEqual(permissionText);
      expect(statuses.join('|')).assertEqual(statusText);
    });
  });
}
