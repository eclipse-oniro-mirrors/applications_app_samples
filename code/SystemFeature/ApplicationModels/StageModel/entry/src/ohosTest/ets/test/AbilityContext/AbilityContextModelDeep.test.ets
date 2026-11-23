/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN, ABILITY_SERVICE, ACCOUNT_ID, RESULT_CODE, CONNECTION_NUMBER } from '../Shared/SharedDriver';

enum OperationKind {
  START_ABILITY = 0,
  START_ABILITY_FOR_RESULT = 1,
  START_ABILITY_WITH_ACCOUNT = 2,
  START_SERVICE = 3,
  STOP_SERVICE = 4,
  START_SERVICE_WITH_ACCOUNT = 5,
  STOP_SERVICE_WITH_ACCOUNT = 6,
  TERMINATE_SELF = 7,
  TERMINATE_WITH_RESULT = 8,
  CONNECT_SERVICE = 9,
  DISCONNECT_SERVICE = 10,
  REQUEST_PERMISSIONS = 11,
  SET_MISSION_LABEL = 12,
  IS_TERMINATING = 13
}

enum ContextLifecycle {
  CREATED = 0,
  FOREGROUND = 1,
  BACKGROUND = 2,
  TERMINATING = 3,
  TERMINATED = 4
}

enum OperationOutcome {
  OK = 0,
  DENIED = 1,
  ILLEGAL_STATE = 2,
  UNSUPPORTED = 3
}

enum CapabilityKind {
  ABILITY_CONTEXT = 0,
  SERVICE_CONTEXT = 1,
  EXTENSION_CONTEXT = 2
}

class Capability {
  readonly kind: CapabilityKind;
  readonly operation: OperationKind;
  readonly allowed: boolean;

  constructor(kind: CapabilityKind, operation: OperationKind, allowed: boolean) {
    this.kind = kind;
    this.operation = operation;
    this.allowed = allowed;
  }
}

class OpRecord {
  readonly sequence: number;
  readonly kind: OperationKind;
  readonly outcome: OperationOutcome;
  readonly detail: string;

  constructor(sequence: number, kind: OperationKind, outcome: OperationOutcome, detail: string) {
    this.sequence = sequence;
    this.kind = kind;
    this.outcome = outcome;
    this.detail = detail;
  }

  succeeded(): boolean {
    return this.outcome === OperationOutcome.OK;
  }

  describe(): string {
    return `${this.sequence}:${this.kind}:${this.outcome}:${this.detail}`;
  }
}

class ServiceConnection {
  readonly connectionId: number;
  readonly accountScoped: boolean;
  readonly target: string;
  connected: boolean;

  constructor(connectionId: number, accountScoped: boolean, target: string) {
    this.connectionId = connectionId;
    this.accountScoped = accountScoped;
    this.target = target;
    this.connected = false;
  }

  open(): boolean {
    if (this.connected) {
      return false;
    }
    this.connected = true;
    return true;
  }

  close(): boolean {
    if (!this.connected) {
      return false;
    }
    this.connected = false;
    return true;
  }

  describe(): string {
    return `${this.connectionId}:${this.target}:${this.connected}`;
  }
}

class PermissionRequest {
  readonly requestToken: number;
  readonly permissions: string[];
  readonly grantedPermissions: string[];
  readonly deniedPermissions: string[];

  constructor(requestToken: number, permissions: string[], granted: string[]) {
    this.requestToken = requestToken;
    this.permissions = permissions;
    this.grantedPermissions = [];
    this.deniedPermissions = [];
    for (const permission of permissions) {
      let isGranted = false;
      for (const allowed of granted) {
        if (allowed === permission) {
          isGranted = true;
        }
      }
      if (isGranted) {
        this.grantedPermissions.push(permission);
      } else {
        this.deniedPermissions.push(permission);
      }
    }
  }

  allGranted(): boolean {
    return this.deniedPermissions.length === 0;
  }

  grantRatio(): number {
    if (this.permissions.length === 0) {
      return 0;
    }
    return this.grantedPermissions.length / this.permissions.length;
  }

  isGranted(permission: string): boolean {
    for (const granted of this.grantedPermissions) {
      if (granted === permission) {
        return true;
      }
    }
    return false;
  }
}

class AbilityContextModel {
  readonly contextId: number;
  readonly abilityName: string;
  readonly capabilityKind: CapabilityKind;
  lifecycle: ContextLifecycle;
  missionLabel: string;
  terminating: boolean;
  private records: OpRecord[] = [];
  private connections: ServiceConnection[] = [];
  private permissions: PermissionRequest[] = [];
  private sequence: number = 0;
  private labelUpdates: number = 0;

  constructor(contextId: number, abilityName: string, capabilityKind: CapabilityKind) {
    this.contextId = contextId;
    this.abilityName = abilityName;
    this.capabilityKind = capabilityKind;
    this.lifecycle = ContextLifecycle.CREATED;
    this.missionLabel = '';
    this.terminating = false;
  }

  private record(kind: OperationKind, outcome: OperationOutcome, detail: string): OperationOutcome {
    this.sequence += 1;
    this.records.push(new OpRecord(this.sequence, kind, outcome, detail));
    return outcome;
  }

  private isAlive(): boolean {
    return this.lifecycle !== ContextLifecycle.TERMINATED && this.lifecycle !== ContextLifecycle.TERMINATING;
  }

  enterForeground(): boolean {
    if (this.lifecycle === ContextLifecycle.CREATED || this.lifecycle === ContextLifecycle.BACKGROUND) {
      this.lifecycle = ContextLifecycle.FOREGROUND;
      return true;
    }
    return false;
  }

  enterBackground(): boolean {
    if (this.lifecycle === ContextLifecycle.FOREGROUND) {
      this.lifecycle = ContextLifecycle.BACKGROUND;
      return true;
    }
    return false;
  }

  startAbility(target: string): OperationOutcome {
    if (!this.isAlive()) {
      return this.record(OperationKind.START_ABILITY, OperationOutcome.ILLEGAL_STATE, target);
    }
    return this.record(OperationKind.START_ABILITY, OperationOutcome.OK, target);
  }

  startAbilityForResult(target: string, resultCode: number): OperationOutcome {
    if (!this.isAlive()) {
      return this.record(OperationKind.START_ABILITY_FOR_RESULT, OperationOutcome.ILLEGAL_STATE, target);
    }
    return this.record(OperationKind.START_ABILITY_FOR_RESULT, OperationOutcome.OK, `${target}:${resultCode}`);
  }

  startAbilityWithAccount(target: string, accountId: number): OperationOutcome {
    if (!this.isAlive()) {
      return this.record(OperationKind.START_ABILITY_WITH_ACCOUNT, OperationOutcome.ILLEGAL_STATE, target);
    }
    return this.record(OperationKind.START_ABILITY_WITH_ACCOUNT, OperationOutcome.OK, `${target}:${accountId}`);
  }

  startServiceExtension(target: string): OperationOutcome {
    if (this.capabilityKind === CapabilityKind.EXTENSION_CONTEXT) {
      return this.record(OperationKind.START_SERVICE, OperationOutcome.UNSUPPORTED, target);
    }
    if (!this.isAlive()) {
      return this.record(OperationKind.START_SERVICE, OperationOutcome.ILLEGAL_STATE, target);
    }
    return this.record(OperationKind.START_SERVICE, OperationOutcome.OK, target);
  }

  stopServiceExtension(target: string): OperationOutcome {
    if (this.capabilityKind === CapabilityKind.EXTENSION_CONTEXT) {
      return this.record(OperationKind.STOP_SERVICE, OperationOutcome.UNSUPPORTED, target);
    }
    if (!this.isAlive()) {
      return this.record(OperationKind.STOP_SERVICE, OperationOutcome.ILLEGAL_STATE, target);
    }
    return this.record(OperationKind.STOP_SERVICE, OperationOutcome.OK, target);
  }

  startServiceWithAccount(target: string, accountId: number): OperationOutcome {
    if (this.capabilityKind === CapabilityKind.EXTENSION_CONTEXT) {
      return this.record(OperationKind.START_SERVICE_WITH_ACCOUNT, OperationOutcome.UNSUPPORTED, target);
    }
    return this.record(OperationKind.START_SERVICE_WITH_ACCOUNT, OperationOutcome.OK, `${target}:${accountId}`);
  }

  stopServiceWithAccount(target: string, accountId: number): OperationOutcome {
    if (this.capabilityKind === CapabilityKind.EXTENSION_CONTEXT) {
      return this.record(OperationKind.STOP_SERVICE_WITH_ACCOUNT, OperationOutcome.UNSUPPORTED, target);
    }
    return this.record(OperationKind.STOP_SERVICE_WITH_ACCOUNT, OperationOutcome.OK, `${target}:${accountId}`);
  }

  connectService(target: string, accountScoped: boolean): ServiceConnection | null {
    if (!this.isAlive()) {
      this.record(OperationKind.CONNECT_SERVICE, OperationOutcome.ILLEGAL_STATE, target);
      return null;
    }
    const connection = new ServiceConnection(CONNECTION_NUMBER + this.connections.length, accountScoped, target);
    connection.open();
    this.connections.push(connection);
    this.record(OperationKind.CONNECT_SERVICE, OperationOutcome.OK, target);
    return connection;
  }

  disconnectService(connectionId: number): OperationOutcome {
    for (const connection of this.connections) {
      if (connection.connectionId === connectionId) {
        const closed = connection.close();
        const outcome = closed ? OperationOutcome.OK : OperationOutcome.ILLEGAL_STATE;
        return this.record(OperationKind.DISCONNECT_SERVICE, outcome, `${connectionId}`);
      }
    }
    return this.record(OperationKind.DISCONNECT_SERVICE, OperationOutcome.ILLEGAL_STATE, `${connectionId}`);
  }

  requestPermissions(requestToken: number, requested: string[], granted: string[]): PermissionRequest {
    const request = new PermissionRequest(requestToken, requested, granted);
    this.permissions.push(request);
    this.record(OperationKind.REQUEST_PERMISSIONS,
      request.allGranted() ? OperationOutcome.OK : OperationOutcome.DENIED, `${requestToken}`);
    return request;
  }

  setMissionLabel(label: string): OperationOutcome {
    this.missionLabel = label;
    this.labelUpdates += 1;
    return this.record(OperationKind.SET_MISSION_LABEL, OperationOutcome.OK, label);
  }

  terminateSelf(): OperationOutcome {
    this.terminating = true;
    this.lifecycle = ContextLifecycle.TERMINATING;
    this.record(OperationKind.TERMINATE_SELF, OperationOutcome.OK, this.abilityName);
    this.lifecycle = ContextLifecycle.TERMINATED;
    return OperationOutcome.OK;
  }

  terminateWithResult(resultCode: number): OperationOutcome {
    this.terminating = true;
    this.lifecycle = ContextLifecycle.TERMINATING;
    this.record(OperationKind.TERMINATE_WITH_RESULT, OperationOutcome.OK, `${resultCode}`);
    this.lifecycle = ContextLifecycle.TERMINATED;
    return OperationOutcome.OK;
  }

  isTerminating(): boolean {
    return this.terminating;
  }

  recordCount(): number {
    return this.records.length;
  }

  allRecords(): OpRecord[] {
    return this.records;
  }

  connectionCount(): number {
    return this.connections.length;
  }

  activeConnections(): number {
    let count = 0;
    for (const connection of this.connections) {
      if (connection.connected) {
        count += 1;
      }
    }
    return count;
  }

  permissionRequestCount(): number {
    return this.permissions.length;
  }

  allPermissionRequests(): PermissionRequest[] {
    return this.permissions;
  }

  labelUpdateCount(): number {
    return this.labelUpdates;
  }
}

class ContextAuditor {
  private model: AbilityContextModel;

  constructor(model: AbilityContextModel) {
    this.model = model;
  }

  outcomeCount(outcome: OperationOutcome): number {
    let count = 0;
    for (const record of this.model.allRecords()) {
      if (record.outcome === outcome) {
        count += 1;
      }
    }
    return count;
  }

  kindCount(kind: OperationKind): number {
    let count = 0;
    for (const record of this.model.allRecords()) {
      if (record.kind === kind) {
        count += 1;
      }
    }
    return count;
  }

  successRatio(): number {
    const total = this.model.recordCount();
    if (total === 0) {
      return 0;
    }
    return this.outcomeCount(OperationOutcome.OK) / total;
  }

  firstFailureDetail(): string {
    for (const record of this.model.allRecords()) {
      if (!record.succeeded()) {
        return record.detail;
      }
    }
    return '';
  }

  lastOutcome(): OperationOutcome {
    const records = this.model.allRecords();
    if (records.length === 0) {
      return OperationOutcome.ILLEGAL_STATE;
    }
    return records[records.length - 1].outcome;
  }

  distinctKinds(): number {
    const kinds: OperationKind[] = [];
    for (const record of this.model.allRecords()) {
      let seen = false;
      for (const kind of kinds) {
        if (kind === record.kind) {
          seen = true;
        }
      }
      if (!seen) {
        kinds.push(record.kind);
      }
    }
    return kinds.length;
  }
}

class ContextCapabilityMatrix {
  private capabilities: Capability[] = [];

  add(kind: CapabilityKind, operation: OperationKind, allowed: boolean): ContextCapabilityMatrix {
    this.capabilities.push(new Capability(kind, operation, allowed));
    return this;
  }

  supports(kind: CapabilityKind, operation: OperationKind): boolean {
    for (const capability of this.capabilities) {
      if (capability.kind === kind && capability.operation === operation) {
        return capability.allowed;
      }
    }
    return false;
  }

  countAllowed(kind: CapabilityKind): number {
    let count = 0;
    for (const capability of this.capabilities) {
      if (capability.kind === kind && capability.allowed) {
        count += 1;
      }
    }
    return count;
  }

  total(): number {
    return this.capabilities.length;
  }
}

class ContextStateMachine {
  private transitions: ContextLifecycle[][] = [
    [ContextLifecycle.CREATED, ContextLifecycle.FOREGROUND],
    [ContextLifecycle.FOREGROUND, ContextLifecycle.BACKGROUND],
    [ContextLifecycle.BACKGROUND, ContextLifecycle.FOREGROUND],
    [ContextLifecycle.FOREGROUND, ContextLifecycle.TERMINATING],
    [ContextLifecycle.TERMINATING, ContextLifecycle.TERMINATED]
  ];

  isAllowed(from: ContextLifecycle, to: ContextLifecycle): boolean {
    for (const pair of this.transitions) {
      if (pair[0] === from && pair[1] === to) {
        return true;
      }
    }
    return false;
  }

  countFrom(from: ContextLifecycle): number {
    let count = 0;
    for (const pair of this.transitions) {
      if (pair[0] === from) {
        count += 1;
      }
    }
    return count;
  }

  size(): number {
    return this.transitions.length;
  }
}

function buildMainContext(): AbilityContextModel {
  const model = new AbilityContextModel(1, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
  model.enterForeground();
  model.startAbility(`${MODULE_ENTRY}/${ABILITY_MAIN}`);
  model.startAbilityForResult(`${MODULE_ENTRY}/${ABILITY_MAIN}`, RESULT_CODE);
  model.startAbilityWithAccount(`${MODULE_ENTRY}/${ABILITY_MAIN}`, ACCOUNT_ID);
  model.startServiceExtension(`${MODULE_ENTRY}/${ABILITY_SERVICE}`);
  model.stopServiceExtension(`${MODULE_ENTRY}/${ABILITY_SERVICE}`);
  model.connectService(`${MODULE_ENTRY}/${ABILITY_SERVICE}`, false);
  model.requestPermissions(1, ['ohos.permission.GRANT_SENSITIVE_PERMISSIONS'], ['ohos.permission.GRANT_SENSITIVE_PERMISSIONS']);
  model.setMissionLabel('StageModel');
  return model;
}

export default function abilityContextModelDeepTest(): void {
  describe('AbilityContextModelDeepSuite', () => {
    let model: AbilityContextModel = buildMainContext();

    beforeAll(() => {
      model = buildMainContext();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'context model deep suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'context model deep suite end');
    });

    it('AbilityContextModelDeep_001', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(1, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      expect(fresh.lifecycle).assertEqual(ContextLifecycle.CREATED);
      expect(fresh.recordCount()).assertEqual(0);
      expect(fresh.connectionCount()).assertEqual(0);
      expect(fresh.permissionRequestCount()).assertEqual(0);
      expect(fresh.isTerminating()).assertFalse();
      done();
    });

    it('AbilityContextModelDeep_002', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(1, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      expect(fresh.enterForeground()).assertTrue();
      expect(fresh.lifecycle).assertEqual(ContextLifecycle.FOREGROUND);
      expect(fresh.enterForeground()).assertFalse();
      expect(fresh.enterBackground()).assertTrue();
      expect(fresh.lifecycle).assertEqual(ContextLifecycle.BACKGROUND);
      done();
    });

    it('AbilityContextModelDeep_003', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(1, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      expect(fresh.enterBackground()).assertFalse();
      expect(fresh.lifecycle).assertEqual(ContextLifecycle.CREATED);
      done();
    });

    it('AbilityContextModelDeep_004', 0, async (done: Function) => {
      expect(model.lifecycle).assertEqual(ContextLifecycle.FOREGROUND);
      expect(model.recordCount()).assertEqual(8);
      expect(model.connectionCount()).assertEqual(1);
      expect(model.activeConnections()).assertEqual(1);
      done();
    });

    it('AbilityContextModelDeep_005', 0, async (done: Function) => {
      expect(model.startAbility(`${MODULE_ENTRY}/${ABILITY_MAIN}`)).assertEqual(OperationOutcome.OK);
      expect(model.recordCount()).assertEqual(9);
      done();
    });

    it('AbilityContextModelDeep_006', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(2, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      fresh.terminateSelf();
      expect(fresh.lifecycle).assertEqual(ContextLifecycle.TERMINATED);
      expect(fresh.isTerminating()).assertTrue();
      expect(fresh.startAbility('x')).assertEqual(OperationOutcome.ILLEGAL_STATE);
      done();
    });

    it('AbilityContextModelDeep_007', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(3, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      expect(fresh.startAbilityForResult('t', RESULT_CODE)).assertEqual(OperationOutcome.OK);
      expect(fresh.recordCount()).assertEqual(1);
      expect(fresh.allRecords()[0].detail).assertEqual(`t:${RESULT_CODE}`);
      done();
    });

    it('AbilityContextModelDeep_008', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(4, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      expect(fresh.startAbilityWithAccount('t', ACCOUNT_ID)).assertEqual(OperationOutcome.OK);
      expect(fresh.allRecords()[0].detail).assertEqual(`t:${ACCOUNT_ID}`);
      done();
    });

    it('AbilityContextModelDeep_009', 0, async (done: Function) => {
      const extension = new AbilityContextModel(5, ABILITY_SERVICE, CapabilityKind.EXTENSION_CONTEXT);
      extension.enterForeground();
      expect(extension.startServiceExtension('t')).assertEqual(OperationOutcome.UNSUPPORTED);
      expect(extension.stopServiceExtension('t')).assertEqual(OperationOutcome.UNSUPPORTED);
      expect(extension.startServiceWithAccount('t', ACCOUNT_ID)).assertEqual(OperationOutcome.UNSUPPORTED);
      expect(extension.stopServiceWithAccount('t', ACCOUNT_ID)).assertEqual(OperationOutcome.UNSUPPORTED);
      done();
    });

    it('AbilityContextModelDeep_010', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(6, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      expect(fresh.startServiceExtension('svc')).assertEqual(OperationOutcome.OK);
      expect(fresh.stopServiceExtension('svc')).assertEqual(OperationOutcome.OK);
      expect(fresh.startServiceWithAccount('svc', ACCOUNT_ID)).assertEqual(OperationOutcome.OK);
      expect(fresh.stopServiceWithAccount('svc', ACCOUNT_ID)).assertEqual(OperationOutcome.OK);
      expect(fresh.recordCount()).assertEqual(4);
      done();
    });

    it('AbilityContextModelDeep_011', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(7, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      const connection = fresh.connectService('svc', false);
      expect(connection !== null).assertTrue();
      expect(fresh.connectionCount()).assertEqual(1);
      expect(fresh.activeConnections()).assertEqual(1);
      done();
    });

    it('AbilityContextModelDeep_012', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(8, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      const connection = fresh.connectService('svc', true);
      expect(connection !== null).assertTrue();
      if (connection !== null) {
        expect(connection.accountScoped).assertTrue();
        expect(connection.connected).assertTrue();
        expect(connection.target).assertEqual('svc');
      }
      done();
    });

    it('AbilityContextModelDeep_013', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(9, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      const connection = fresh.connectService('svc', false);
      expect(connection !== null).assertTrue();
      if (connection !== null) {
        expect(fresh.disconnectService(connection.connectionId)).assertEqual(OperationOutcome.OK);
        expect(fresh.activeConnections()).assertEqual(0);
        expect(fresh.disconnectService(connection.connectionId)).assertEqual(OperationOutcome.ILLEGAL_STATE);
      }
      done();
    });

    it('AbilityContextModelDeep_014', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(10, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      expect(fresh.disconnectService(999)).assertEqual(OperationOutcome.ILLEGAL_STATE);
      expect(fresh.connectionCount()).assertEqual(0);
      done();
    });

    it('AbilityContextModelDeep_015', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(11, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      expect(fresh.connectService('svc', false) !== null).assertTrue();
      expect(fresh.disconnectService(0)).assertEqual(OperationOutcome.OK);
      done();
    });

    it('AbilityContextModelDeep_016', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(12, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      const request = fresh.requestPermissions(1, ['a', 'b'], ['a']);
      expect(request.allGranted()).assertFalse();
      expect(request.grantedPermissions.length).assertEqual(1);
      expect(request.deniedPermissions.length).assertEqual(1);
      expect(request.isGranted('a')).assertTrue();
      expect(request.isGranted('b')).assertFalse();
      done();
    });

    it('AbilityContextModelDeep_017', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(13, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      const request = fresh.requestPermissions(1, ['a', 'b'], ['a', 'b']);
      expect(request.allGranted()).assertTrue();
      expect(request.grantRatio()).assertEqual(1);
      expect(fresh.allRecords()[0].outcome).assertEqual(OperationOutcome.OK);
      done();
    });

    it('AbilityContextModelDeep_018', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(14, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      const request = fresh.requestPermissions(1, ['a', 'b'], ['a']);
      expect(request.grantRatio()).assertEqual(0.5);
      expect(fresh.allRecords()[0].outcome).assertEqual(OperationOutcome.DENIED);
      done();
    });

    it('AbilityContextModelDeep_019', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(15, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      const request = fresh.requestPermissions(1, [], []);
      expect(request.allGranted()).assertTrue();
      expect(request.grantRatio()).assertEqual(0);
      expect(request.permissions.length).assertEqual(0);
      done();
    });

    it('AbilityContextModelDeep_020', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(16, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.setMissionLabel('first');
      expect(fresh.missionLabel).assertEqual('first');
      expect(fresh.labelUpdateCount()).assertEqual(1);
      fresh.setMissionLabel('second');
      expect(fresh.missionLabel).assertEqual('second');
      expect(fresh.labelUpdateCount()).assertEqual(2);
      done();
    });

    it('AbilityContextModelDeep_021', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(17, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      expect(fresh.isTerminating()).assertFalse();
      fresh.terminateWithResult(RESULT_CODE);
      expect(fresh.isTerminating()).assertTrue();
      expect(fresh.lifecycle).assertEqual(ContextLifecycle.TERMINATED);
      expect(fresh.allRecords()[0].detail).assertEqual(`${RESULT_CODE}`);
      done();
    });

    it('AbilityContextModelDeep_022', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(18, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      fresh.startAbility('t');
      fresh.enterBackground();
      expect(fresh.startAbility('t')).assertEqual(OperationOutcome.OK);
      expect(fresh.recordCount()).assertEqual(2);
      done();
    });

    it('AbilityContextModelDeep_023', 0, async (done: Function) => {
      const audit = new ContextAuditor(model);
      expect(audit.outcomeCount(OperationOutcome.OK)).assertEqual(9);
      expect(audit.outcomeCount(OperationOutcome.ILLEGAL_STATE)).assertEqual(0);
      expect(audit.outcomeCount(OperationOutcome.UNSUPPORTED)).assertEqual(0);
      expect(audit.successRatio()).assertEqual(1);
      done();
    });

    it('AbilityContextModelDeep_024', 0, async (done: Function) => {
      const audit = new ContextAuditor(model);
      expect(audit.kindCount(OperationKind.START_ABILITY)).assertEqual(2);
      expect(audit.kindCount(OperationKind.START_SERVICE)).assertEqual(1);
      expect(audit.kindCount(OperationKind.STOP_SERVICE)).assertEqual(1);
      expect(audit.kindCount(OperationKind.CONNECT_SERVICE)).assertEqual(1);
      expect(audit.kindCount(OperationKind.SET_MISSION_LABEL)).assertEqual(1);
      done();
    });

    it('AbilityContextModelDeep_025', 0, async (done: Function) => {
      const audit = new ContextAuditor(model);
      expect(audit.distinctKinds()).assertEqual(8);
      expect(audit.lastOutcome()).assertEqual(OperationOutcome.OK);
      expect(audit.firstFailureDetail()).assertEqual('');
      done();
    });

    it('AbilityContextModelDeep_026', 0, async (done: Function) => {
      const extension = new AbilityContextModel(20, ABILITY_SERVICE, CapabilityKind.EXTENSION_CONTEXT);
      extension.enterForeground();
      extension.startServiceExtension('t');
      extension.startServiceWithAccount('t', ACCOUNT_ID);
      const audit = new ContextAuditor(extension);
      expect(audit.outcomeCount(OperationOutcome.UNSUPPORTED)).assertEqual(2);
      expect(audit.successRatio()).assertEqual(0);
      expect(audit.firstFailureDetail()).assertEqual('t');
      done();
    });

    it('AbilityContextModelDeep_027', 0, async (done: Function) => {
      const mixed = new AbilityContextModel(21, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      mixed.enterForeground();
      mixed.startAbility('a');
      mixed.requestPermissions(1, ['p'], []);
      mixed.terminateSelf();
      const audit = new ContextAuditor(mixed);
      expect(audit.outcomeCount(OperationOutcome.OK)).assertEqual(2);
      expect(audit.outcomeCount(OperationOutcome.DENIED)).assertEqual(1);
      expect(audit.outcomeCount(OperationOutcome.ILLEGAL_STATE)).assertEqual(0);
      expect(audit.successRatio()).assertEqual(2 / 3);
      done();
    });

    it('AbilityContextModelDeep_028', 0, async (done: Function) => {
      const empty = new AbilityContextModel(22, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      const audit = new ContextAuditor(empty);
      expect(audit.successRatio()).assertEqual(0);
      expect(audit.distinctKinds()).assertEqual(0);
      expect(audit.lastOutcome()).assertEqual(OperationOutcome.ILLEGAL_STATE);
      expect(audit.firstFailureDetail()).assertEqual('');
      done();
    });

    it('AbilityContextModelDeep_029', 0, async (done: Function) => {
      const matrix = new ContextCapabilityMatrix();
      matrix.add(CapabilityKind.ABILITY_CONTEXT, OperationKind.START_ABILITY, true);
      matrix.add(CapabilityKind.ABILITY_CONTEXT, OperationKind.CONNECT_SERVICE, true);
      matrix.add(CapabilityKind.EXTENSION_CONTEXT, OperationKind.START_ABILITY, true);
      expect(matrix.supports(CapabilityKind.ABILITY_CONTEXT, OperationKind.START_ABILITY)).assertTrue();
      expect(matrix.supports(CapabilityKind.EXTENSION_CONTEXT, OperationKind.START_ABILITY)).assertTrue();
      expect(matrix.supports(CapabilityKind.ABILITY_CONTEXT, OperationKind.STOP_SERVICE)).assertFalse();
      expect(matrix.total()).assertEqual(3);
      done();
    });

    it('AbilityContextModelDeep_030', 0, async (done: Function) => {
      const matrix = new ContextCapabilityMatrix();
      matrix.add(CapabilityKind.SERVICE_CONTEXT, OperationKind.START_SERVICE, true);
      matrix.add(CapabilityKind.SERVICE_CONTEXT, OperationKind.STOP_SERVICE, false);
      matrix.add(CapabilityKind.SERVICE_CONTEXT, OperationKind.CONNECT_SERVICE, true);
      expect(matrix.countAllowed(CapabilityKind.SERVICE_CONTEXT)).assertEqual(2);
      expect(matrix.countAllowed(CapabilityKind.ABILITY_CONTEXT)).assertEqual(0);
      done();
    });

    it('AbilityContextModelDeep_031', 0, async (done: Function) => {
      const machine = new ContextStateMachine();
      expect(machine.size()).assertEqual(5);
      expect(machine.isAllowed(ContextLifecycle.CREATED, ContextLifecycle.FOREGROUND)).assertTrue();
      expect(machine.isAllowed(ContextLifecycle.FOREGROUND, ContextLifecycle.BACKGROUND)).assertTrue();
      expect(machine.isAllowed(ContextLifecycle.BACKGROUND, ContextLifecycle.FOREGROUND)).assertTrue();
      done();
    });

    it('AbilityContextModelDeep_032', 0, async (done: Function) => {
      const machine = new ContextStateMachine();
      expect(machine.isAllowed(ContextLifecycle.CREATED, ContextLifecycle.TERMINATED)).assertFalse();
      expect(machine.isAllowed(ContextLifecycle.TERMINATED, ContextLifecycle.FOREGROUND)).assertFalse();
      expect(machine.isAllowed(ContextLifecycle.BACKGROUND, ContextLifecycle.TERMINATED)).assertFalse();
      done();
    });

    it('AbilityContextModelDeep_033', 0, async (done: Function) => {
      const machine = new ContextStateMachine();
      expect(machine.countFrom(ContextLifecycle.CREATED)).assertEqual(1);
      expect(machine.countFrom(ContextLifecycle.FOREGROUND)).assertEqual(2);
      expect(machine.countFrom(ContextLifecycle.BACKGROUND)).assertEqual(1);
      expect(machine.countFrom(ContextLifecycle.TERMINATING)).assertEqual(1);
      expect(machine.countFrom(ContextLifecycle.TERMINATED)).assertEqual(0);
      done();
    });

    it('AbilityContextModelDeep_034', 0, async (done: Function) => {
      const connection = new ServiceConnection(1, true, 'svc');
      expect(connection.connected).assertFalse();
      expect(connection.open()).assertTrue();
      expect(connection.connected).assertTrue();
      expect(connection.open()).assertFalse();
      expect(connection.close()).assertTrue();
      expect(connection.close()).assertFalse();
      done();
    });

    it('AbilityContextModelDeep_035', 0, async (done: Function) => {
      const connection = new ServiceConnection(2, false, 'svc');
      connection.open();
      expect(connection.describe()).assertEqual('2:svc:true');
      expect(connection.accountScoped).assertFalse();
      done();
    });

    it('AbilityContextModelDeep_036', 0, async (done: Function) => {
      const record = new OpRecord(1, OperationKind.START_ABILITY, OperationOutcome.OK, 'target');
      expect(record.succeeded()).assertTrue();
      expect(record.describe()).assertEqual('1:0:0:target');
      const failed = new OpRecord(2, OperationKind.STOP_SERVICE, OperationOutcome.ILLEGAL_STATE, 'x');
      expect(failed.succeeded()).assertFalse();
      done();
    });

    it('AbilityContextModelDeep_037', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(30, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      for (let i = 0; i < 5; i++) {
        fresh.startAbility(`target${i}`);
      }
      expect(fresh.recordCount()).assertEqual(5);
      const audit = new ContextAuditor(fresh);
      expect(audit.kindCount(OperationKind.START_ABILITY)).assertEqual(5);
      expect(audit.successRatio()).assertEqual(1);
      done();
    });

    it('AbilityContextModelDeep_038', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(31, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      const first = fresh.connectService('svc', false);
      const second = fresh.connectService('svc', true);
      expect(first !== null).assertTrue();
      expect(second !== null).assertTrue();
      expect(fresh.connectionCount()).assertEqual(2);
      expect(fresh.activeConnections()).assertEqual(2);
      done();
    });

    it('AbilityContextModelDeep_039', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(32, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      fresh.connectService('a', false);
      fresh.connectService('b', false);
      const ids: number[] = [];
      for (let i = 0; i < fresh.connectionCount(); i++) {
        ids.push(i + CONNECTION_NUMBER);
      }
      expect(ids.length).assertEqual(2);
      expect(fresh.disconnectService(ids[0])).assertEqual(OperationOutcome.OK);
      expect(fresh.activeConnections()).assertEqual(1);
      done();
    });

    it('AbilityContextModelDeep_040', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(33, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.requestPermissions(1, ['a'], ['a']);
      fresh.requestPermissions(2, ['b'], []);
      expect(fresh.permissionRequestCount()).assertEqual(2);
      let granted = 0;
      for (const request of fresh.allPermissionRequests()) {
        granted += request.grantedPermissions.length;
      }
      expect(granted).assertEqual(1);
      done();
    });

    it('AbilityContextModelDeep_041', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(34, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      let ok = 0;
      for (let i = 0; i < 3; i++) {
        if (fresh.startAbility(`t${i}`) === OperationOutcome.OK) {
          ok += 1;
        }
      }
      expect(ok).assertEqual(3);
      expect(fresh.recordCount()).assertEqual(3);
      done();
    });

    it('AbilityContextModelDeep_042', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(35, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      fresh.terminateWithResult(RESULT_CODE);
      expect(fresh.startAbility('t')).assertEqual(OperationOutcome.ILLEGAL_STATE);
      expect(fresh.startAbilityForResult('t', RESULT_CODE)).assertEqual(OperationOutcome.ILLEGAL_STATE);
      expect(fresh.startAbilityWithAccount('t', ACCOUNT_ID)).assertEqual(OperationOutcome.ILLEGAL_STATE);
      done();
    });

    it('AbilityContextModelDeep_043', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(36, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      fresh.terminateSelf();
      expect(fresh.connectService('t', false)).assertNull();
      expect(fresh.recordCount()).assertEqual(2);
      expect(fresh.allRecords()[1].outcome).assertEqual(OperationOutcome.ILLEGAL_STATE);
      done();
    });

    it('AbilityContextModelDeep_044', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(37, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      const labels = ['Alpha', 'Beta', 'Gamma'];
      for (const label of labels) {
        fresh.setMissionLabel(label);
      }
      expect(fresh.missionLabel).assertEqual('Gamma');
      expect(fresh.labelUpdateCount()).assertEqual(3);
      expect(fresh.recordCount()).assertEqual(3);
      done();
    });

    it('AbilityContextModelDeep_045', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(38, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      const sequenceIds: number[] = [];
      fresh.enterForeground();
      fresh.startAbility('a');
      fresh.stopServiceExtension('b');
      for (const record of fresh.allRecords()) {
        sequenceIds.push(record.sequence);
      }
      expect(sequenceIds.length).assertEqual(2);
      expect(sequenceIds[0]).assertEqual(1);
      expect(sequenceIds[1]).assertEqual(2);
      done();
    });

    it('AbilityContextModelDeep_046', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(39, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      fresh.startAbility('a');
      fresh.startAbility('b');
      fresh.startAbility('c');
      const audit = new ContextAuditor(fresh);
      expect(audit.outcomeCount(OperationOutcome.OK)).assertEqual(3);
      expect(audit.distinctKinds()).assertEqual(1);
      expect(audit.lastOutcome()).assertEqual(OperationOutcome.OK);
      done();
    });

    it('AbilityContextModelDeep_047', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(40, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      fresh.requestPermissions(1, ['a', 'b', 'c'], ['a', 'c']);
      const request = fresh.allPermissionRequests()[0];
      expect(request.permissions.length).assertEqual(3);
      expect(request.grantedPermissions.length).assertEqual(2);
      expect(request.isGranted('b')).assertFalse();
      expect(request.grantRatio()).assertEqual(2 / 3);
      done();
    });

    it('AbilityContextModelDeep_048', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(41, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      fresh.startAbility('a');
      fresh.requestPermissions(1, ['p'], []);
      fresh.startServiceExtension('svc');
      const audit = new ContextAuditor(fresh);
      expect(audit.outcomeCount(OperationOutcome.OK)).assertEqual(2);
      expect(audit.outcomeCount(OperationOutcome.DENIED)).assertEqual(1);
      expect(audit.successRatio()).assertEqual(2 / 3);
      expect(audit.firstFailureDetail()).assertEqual('1');
      done();
    });

    it('AbilityContextModelDeep_049', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(42, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      const first = fresh.connectService('svc', false);
      const second = fresh.connectService('svc', false);
      expect(first !== null).assertTrue();
      expect(second !== null).assertTrue();
      if (first !== null && second !== null) {
        expect(first.connectionId).assertEqual(second.connectionId - 1);
        expect(first.accountScoped).assertFalse();
      }
      done();
    });

    it('AbilityContextModelDeep_050', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(43, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      const connection = fresh.connectService('svc', false);
      expect(connection !== null).assertTrue();
      if (connection !== null) {
        const id = connection.connectionId;
        expect(fresh.disconnectService(id)).assertEqual(OperationOutcome.OK);
        expect(fresh.activeConnections()).assertEqual(0);
        expect(fresh.recordCount()).assertEqual(2);
      }
      done();
    });

    it('AbilityContextModelDeep_051', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(44, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      const matrix = new ContextCapabilityMatrix();
      const kinds: OperationKind[] = [OperationKind.START_ABILITY, OperationKind.START_SERVICE,
        OperationKind.CONNECT_SERVICE, OperationKind.REQUEST_PERMISSIONS];
      for (const kind of kinds) {
        matrix.add(CapabilityKind.ABILITY_CONTEXT, kind, true);
      }
      expect(matrix.countAllowed(CapabilityKind.ABILITY_CONTEXT)).assertEqual(4);
      expect(matrix.supports(CapabilityKind.ABILITY_CONTEXT, OperationKind.REQUEST_PERMISSIONS)).assertTrue();
      done();
    });

    it('AbilityContextModelDeep_052', 0, async (done: Function) => {
      const fresh = new AbilityContextModel(45, ABILITY_MAIN, CapabilityKind.ABILITY_CONTEXT);
      fresh.enterForeground();
      fresh.startAbility('a');
      fresh.enterBackground();
      fresh.enterForeground();
      fresh.startAbility('b');
      expect(fresh.lifecycle).assertEqual(ContextLifecycle.FOREGROUND);
      expect(fresh.recordCount()).assertEqual(2);
      done();
    });
  });
}





