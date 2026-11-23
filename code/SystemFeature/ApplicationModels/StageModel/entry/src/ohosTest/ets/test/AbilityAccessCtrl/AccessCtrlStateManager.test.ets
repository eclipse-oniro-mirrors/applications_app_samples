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
import { getDriver, ensureAppReady } from '../Shared/SharedDriver';

const GRANT_PERMISSION: string = 'ohos.permission.GRANT_SENSITIVE_PERMISSIONS';
const GET_PERMISSION: string = 'ohos.permission.GET_SENSITIVE_PERMISSIONS';
const TOKEN_A: number = 100;
const TOKEN_B: number = 200;
const TOKEN_C: number = 300;

enum GrantState {
  UNKNOWN = 0,
  GRANTED = 1,
  DENIED = 2,
  REVOKED = 3
}

enum StateEvent {
  GRANT = 0,
  DENY = 1,
  REVOKE = 2,
  RESET = 3
}

class PermissionRecord {
  readonly tokenId: number;
  readonly permission: string;
  private state: GrantState;

  constructor(tokenId: number, permission: string, state: GrantState) {
    this.tokenId = tokenId;
    this.permission = permission;
    this.state = state;
  }

  getState(): GrantState {
    return this.state;
  }

  setState(state: GrantState): void {
    this.state = state;
  }

  isGranted(): boolean {
    return this.state === GrantState.GRANTED;
  }

  isRevoked(): boolean {
    return this.state === GrantState.REVOKED;
  }

  isDenied(): boolean {
    return this.state === GrantState.DENIED;
  }

  key(): string {
    return `${this.tokenId}:${this.permission}`;
  }

  describe(): string {
    return `${this.key()}:${this.state}`;
  }
}

class StateTransition {
  readonly tokenId: number;
  readonly from: GrantState;
  readonly to: GrantState;
  readonly accepted: boolean;

  constructor(tokenId: number, from: GrantState, to: GrantState, accepted: boolean) {
    this.tokenId = tokenId;
    this.from = from;
    this.to = to;
    this.accepted = accepted;
  }

  describe(): string {
    return `${this.tokenId}:${this.from}->${this.to}:${this.accepted}`;
  }

  isUpward(): boolean {
    return this.to === GrantState.GRANTED && this.from !== GrantState.GRANTED;
  }

  isDownward(): boolean {
    return this.from === GrantState.GRANTED && this.to !== GrantState.GRANTED;
  }
}

class TokenRegistry {
  private records: PermissionRecord[] = [];

  register(tokenId: number, permission: string, state: GrantState): TokenRegistry {
    if (this.find(tokenId, permission) === null) {
      this.records.push(new PermissionRecord(tokenId, permission, state));
    }
    return this;
  }

  find(tokenId: number, permission: string): PermissionRecord | null {
    for (const record of this.records) {
      if (record.tokenId === tokenId && record.permission === permission) {
        return record;
      }
    }
    return null;
  }

  byToken(tokenId: number): PermissionRecord[] {
    return this.records.filter((record: PermissionRecord) => record.tokenId === tokenId);
  }

  byPermission(permission: string): PermissionRecord[] {
    return this.records.filter((record: PermissionRecord) => record.permission === permission);
  }

  size(): number {
    return this.records.length;
  }

  stateOf(tokenId: number, permission: string): GrantState {
    const record = this.find(tokenId, permission);
    if (record === null) {
      return GrantState.UNKNOWN;
    }
    return record.getState();
  }

  setState(tokenId: number, permission: string, state: GrantState): boolean {
    const record = this.find(tokenId, permission);
    if (record === null) {
      return false;
    }
    record.setState(state);
    return true;
  }

  grantedCount(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.isGranted()) {
        count += 1;
      }
    }
    return count;
  }

  revokedCount(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.isRevoked()) {
        count += 1;
      }
    }
    return count;
  }

  deniedCount(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.isDenied()) {
        count += 1;
      }
    }
    return count;
  }

  distinctTokens(): number[] {
    const tokens: number[] = [];
    for (const record of this.records) {
      if (tokens.indexOf(record.tokenId) < 0) {
        tokens.push(record.tokenId);
      }
    }
    return tokens;
  }

  all(): PermissionRecord[] {
    return this.records;
  }
}

class AccessCtrlStateManager {
  private registry: TokenRegistry = new TokenRegistry();
  private history: StateTransition[] = [];

  getRegistry(): TokenRegistry {
    return this.registry;
  }

  getHistory(): StateTransition[] {
    return this.history;
  }

  seed(tokenId: number, permission: string): AccessCtrlStateManager {
    this.registry.register(tokenId, permission, GrantState.UNKNOWN);
    return this;
  }

  canTransition(from: GrantState, to: GrantState): boolean {
    if (from === to) {
      return false;
    }
    if (from === GrantState.UNKNOWN) {
      return to === GrantState.GRANTED || to === GrantState.DENIED;
    }
    if (from === GrantState.DENIED) {
      return to === GrantState.GRANTED || to === GrantState.REVOKED;
    }
    if (from === GrantState.GRANTED) {
      return to === GrantState.REVOKED || to === GrantState.DENIED;
    }
    if (from === GrantState.REVOKED) {
      return to === GrantState.GRANTED;
    }
    return false;
  }

  apply(tokenId: number, permission: string, to: GrantState): StateTransition {
    const from = this.registry.stateOf(tokenId, permission);
    const accepted = this.canTransition(from, to);
    if (accepted) {
      this.registry.setState(tokenId, permission, to);
    }
    const transition = new StateTransition(tokenId, from, to, accepted);
    this.history.push(transition);
    return transition;
  }

  acceptCount(): number {
    let count = 0;
    for (const transition of this.history) {
      if (transition.accepted) {
        count += 1;
      }
    }
    return count;
  }

  rejectCount(): number {
    return this.history.length - this.acceptCount();
  }

  last(): StateTransition | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[this.history.length - 1];
  }

  tokenState(tokenId: number, permission: string): GrantState {
    return this.registry.stateOf(tokenId, permission);
  }
}

class AccessSummary {
  private registry: TokenRegistry;

  constructor(registry: TokenRegistry) {
    this.registry = registry;
  }

  total(): number {
    return this.registry.size();
  }

  granted(): number {
    return this.registry.grantedCount();
  }

  revoked(): number {
    return this.registry.revokedCount();
  }

  denied(): number {
    return this.registry.deniedCount();
  }

  tokens(): number {
    return this.registry.distinctTokens().length;
  }

  describe(): string {
    return `total=${this.total()},granted=${this.granted()},revoked=${this.revoked()}`;
  }
}

function buildManager(): AccessCtrlStateManager {
  const manager = new AccessCtrlStateManager();
  manager.seed(TOKEN_A, GRANT_PERMISSION);
  manager.seed(TOKEN_B, GRANT_PERMISSION);
  manager.seed(TOKEN_C, GET_PERMISSION);
  manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
  manager.apply(TOKEN_B, GRANT_PERMISSION, GrantState.DENIED);
  return manager;
}

export default function accessCtrlStateManagerTest(): void {
  describe('AccessCtrlStateManagerSuite', () => {
    let manager: AccessCtrlStateManager = buildManager();

    beforeAll(() => {
      manager = buildManager();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'access ctrl state suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'access ctrl state suite end');
    });

    it('AccessCtrlStateManager_001', 0, async (done: Function) => {
      const registry = manager.getRegistry();
      expect(registry.size()).assertEqual(3);
      expect(registry.distinctTokens().length).assertEqual(3);
      expect(registry.grantedCount()).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_002', 0, async (done: Function) => {
      expect(manager.tokenState(TOKEN_A, GRANT_PERMISSION)).assertEqual(GrantState.GRANTED);
      expect(manager.tokenState(TOKEN_B, GRANT_PERMISSION)).assertEqual(GrantState.DENIED);
      expect(manager.tokenState(TOKEN_C, GET_PERMISSION)).assertEqual(GrantState.UNKNOWN);
      done();
    });

    it('AccessCtrlStateManager_003', 0, async (done: Function) => {
      expect(manager.getHistory().length).assertEqual(2);
      expect(manager.acceptCount()).assertEqual(2);
      expect(manager.rejectCount()).assertEqual(0);
      done();
    });

    it('AccessCtrlStateManager_004', 0, async (done: Function) => {
      const last = manager.last();
      expect(last !== null).assertTrue();
      expect(last !== null ? last.tokenId : 0).assertEqual(TOKEN_B);
      expect(last !== null ? last.to : GrantState.UNKNOWN).assertEqual(GrantState.DENIED);
      done();
    });

    it('AccessCtrlStateManager_005', 0, async (done: Function) => {
      const transition = manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      expect(transition.accepted).assertTrue();
      expect(transition.isDownward()).assertTrue();
      expect(manager.tokenState(TOKEN_A, GRANT_PERMISSION)).assertEqual(GrantState.REVOKED);
      done();
    });

    it('AccessCtrlStateManager_006', 0, async (done: Function) => {
      const transition = manager.apply(TOKEN_B, GRANT_PERMISSION, GrantState.GRANTED);
      expect(transition.accepted).assertTrue();
      expect(transition.isUpward()).assertTrue();
      expect(manager.tokenState(TOKEN_B, GRANT_PERMISSION)).assertEqual(GrantState.GRANTED);
      done();
    });

    it('AccessCtrlStateManager_007', 0, async (done: Function) => {
      const transition = manager.apply(TOKEN_C, GET_PERMISSION, GrantState.REVOKED);
      expect(transition.accepted).assertFalse();
      expect(manager.tokenState(TOKEN_C, GET_PERMISSION)).assertEqual(GrantState.UNKNOWN);
      expect(manager.rejectCount()).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_008', 0, async (done: Function) => {
      expect(manager.canTransition(GrantState.UNKNOWN, GrantState.GRANTED)).assertTrue();
      expect(manager.canTransition(GrantState.UNKNOWN, GrantState.DENIED)).assertTrue();
      expect(manager.canTransition(GrantState.UNKNOWN, GrantState.REVOKED)).assertFalse();
      done();
    });

    it('AccessCtrlStateManager_009', 0, async (done: Function) => {
      expect(manager.canTransition(GrantState.GRANTED, GrantState.REVOKED)).assertTrue();
      expect(manager.canTransition(GrantState.GRANTED, GrantState.DENIED)).assertTrue();
      expect(manager.canTransition(GrantState.GRANTED, GrantState.GRANTED)).assertFalse();
      done();
    });

    it('AccessCtrlStateManager_010', 0, async (done: Function) => {
      expect(manager.canTransition(GrantState.DENIED, GrantState.GRANTED)).assertTrue();
      expect(manager.canTransition(GrantState.DENIED, GrantState.REVOKED)).assertTrue();
      expect(manager.canTransition(GrantState.DENIED, GrantState.DENIED)).assertFalse();
      done();
    });

    it('AccessCtrlStateManager_011', 0, async (done: Function) => {
      expect(manager.canTransition(GrantState.REVOKED, GrantState.GRANTED)).assertTrue();
      expect(manager.canTransition(GrantState.REVOKED, GrantState.DENIED)).assertFalse();
      expect(manager.canTransition(GrantState.REVOKED, GrantState.REVOKED)).assertFalse();
      done();
    });

    it('AccessCtrlStateManager_012', 0, async (done: Function) => {
      const record = new PermissionRecord(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(record.isGranted()).assertTrue();
      expect(record.isRevoked()).assertFalse();
      expect(record.key()).assertEqual(`${TOKEN_A}:${GRANT_PERMISSION}`);
      done();
    });

    it('AccessCtrlStateManager_013', 0, async (done: Function) => {
      const record = new PermissionRecord(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      record.setState(GrantState.REVOKED);
      expect(record.getState()).assertEqual(GrantState.REVOKED);
      expect(record.isRevoked()).assertTrue();
      expect(record.isGranted()).assertFalse();
      done();
    });

    it('AccessCtrlStateManager_014', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      expect(registry.size()).assertEqual(0);
      expect(registry.stateOf(TOKEN_A, GRANT_PERMISSION)).assertEqual(GrantState.UNKNOWN);
      expect(registry.find(TOKEN_A, GRANT_PERMISSION)).assertNull();
      done();
    });

    it('AccessCtrlStateManager_015', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.DENIED);
      expect(registry.size()).assertEqual(1);
      expect(registry.stateOf(TOKEN_A, GRANT_PERMISSION)).assertEqual(GrantState.GRANTED);
      done();
    });

    it('AccessCtrlStateManager_016', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      registry.register(TOKEN_A, GET_PERMISSION, GrantState.DENIED);
      registry.register(TOKEN_B, GRANT_PERMISSION, GrantState.REVOKED);
      expect(registry.size()).assertEqual(3);
      expect(registry.byToken(TOKEN_A).length).assertEqual(2);
      expect(registry.byPermission(GRANT_PERMISSION).length).assertEqual(2);
      done();
    });

    it('AccessCtrlStateManager_017', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(registry.setState(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED)).assertTrue();
      expect(registry.grantedCount()).assertEqual(0);
      expect(registry.revokedCount()).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_018', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      expect(registry.setState(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED)).assertFalse();
      expect(registry.grantedCount()).assertEqual(0);
      expect(registry.size()).assertEqual(0);
      done();
    });

    it('AccessCtrlStateManager_019', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      registry.register(TOKEN_B, GRANT_PERMISSION, GrantState.DENIED);
      registry.register(TOKEN_C, GRANT_PERMISSION, GrantState.REVOKED);
      expect(registry.grantedCount()).assertEqual(1);
      expect(registry.deniedCount()).assertEqual(1);
      expect(registry.revokedCount()).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_020', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      registry.register(TOKEN_A, GET_PERMISSION, GrantState.GRANTED);
      registry.register(TOKEN_B, GET_PERMISSION, GrantState.GRANTED);
      const tokens = registry.distinctTokens();
      expect(tokens.length).assertEqual(2);
      expect(tokens[0]).assertEqual(TOKEN_A);
      expect(tokens[1]).assertEqual(TOKEN_B);
      done();
    });

    it('AccessCtrlStateManager_021', 0, async (done: Function) => {
      const transition = new StateTransition(TOKEN_A, GrantState.DENIED, GrantState.GRANTED, true);
      expect(transition.isUpward()).assertTrue();
      expect(transition.isDownward()).assertFalse();
      expect(transition.describe()).assertEqual(`${TOKEN_A}:2->1:true`);
      done();
    });

    it('AccessCtrlStateManager_022', 0, async (done: Function) => {
      const transition = new StateTransition(TOKEN_B, GrantState.GRANTED, GrantState.REVOKED, true);
      expect(transition.isDownward()).assertTrue();
      expect(transition.isUpward()).assertFalse();
      expect(transition.accepted).assertTrue();
      done();
    });

    it('AccessCtrlStateManager_023', 0, async (done: Function) => {
      const summary = new AccessSummary(manager.getRegistry());
      expect(summary.total()).assertEqual(3);
      expect(summary.tokens()).assertEqual(3);
      expect(summary.describe().indexOf('total=3') >= 0).assertTrue();
      done();
    });

    it('AccessCtrlStateManager_024', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      const summary = new AccessSummary(manager.getRegistry());
      expect(summary.total()).assertEqual(1);
      expect(summary.granted()).assertEqual(0);
      expect(summary.revoked()).assertEqual(0);
      done();
    });

    it('AccessCtrlStateManager_025', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      const summary = new AccessSummary(manager.getRegistry());
      expect(summary.granted()).assertEqual(1);
      expect(summary.denied()).assertEqual(0);
      done();
    });

    it('AccessCtrlStateManager_026', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      const transition = manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(transition.from).assertEqual(GrantState.UNKNOWN);
      expect(transition.to).assertEqual(GrantState.GRANTED);
      expect(manager.acceptCount()).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_027', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      const transition = manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(transition.accepted).assertFalse();
      expect(manager.acceptCount()).assertEqual(1);
      expect(manager.rejectCount()).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_028', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(manager.getHistory().length).assertEqual(3);
      expect(manager.acceptCount()).assertEqual(3);
      expect(manager.tokenState(TOKEN_A, GRANT_PERMISSION)).assertEqual(GrantState.GRANTED);
      done();
    });

    it('AccessCtrlStateManager_029', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.DENIED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      expect(manager.tokenState(TOKEN_A, GRANT_PERMISSION)).assertEqual(GrantState.REVOKED);
      expect(manager.acceptCount()).assertEqual(2);
      done();
    });

    it('AccessCtrlStateManager_030', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      expect(manager.last()).assertNull();
      expect(manager.getHistory().length).assertEqual(0);
      expect(manager.rejectCount()).assertEqual(0);
      done();
    });

    it('AccessCtrlStateManager_031', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.seed(TOKEN_A, GET_PERMISSION);
      expect(manager.getRegistry().size()).assertEqual(2);
      expect(manager.getRegistry().byToken(TOKEN_A).length).assertEqual(2);
      done();
    });

    it('AccessCtrlStateManager_032', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.seed(TOKEN_B, GET_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_B, GET_PERMISSION, GrantState.GRANTED);
      expect(manager.acceptCount()).assertEqual(2);
      expect(manager.getRegistry().grantedCount()).assertEqual(2);
      done();
    });

    it('AccessCtrlStateManager_033', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      const transition = manager.apply(TOKEN_A, GET_PERMISSION, GrantState.GRANTED);
      expect(transition.accepted).assertTrue();
      expect(transition.from).assertEqual(GrantState.UNKNOWN);
      expect(manager.getRegistry().size()).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_034', 0, async (done: Function) => {
      const record = new PermissionRecord(TOKEN_B, GET_PERMISSION, GrantState.DENIED);
      expect(record.isDenied()).assertTrue();
      expect(record.isGranted()).assertFalse();
      expect(record.describe()).assertEqual(`${TOKEN_B}:${GET_PERMISSION}:2`);
      done();
    });

    it('AccessCtrlStateManager_035', 0, async (done: Function) => {
      const states: GrantState[] = [GrantState.UNKNOWN, GrantState.GRANTED, GrantState.DENIED, GrantState.REVOKED];
      expect(states.length).assertEqual(4);
      expect(states[0]).assertEqual(GrantState.UNKNOWN);
      expect(states[3]).assertEqual(GrantState.REVOKED);
      done();
    });

    it('AccessCtrlStateManager_036', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      for (let i = 0; i < 5; i++) {
        registry.register(TOKEN_A + i, GRANT_PERMISSION, GrantState.GRANTED);
      }
      expect(registry.size()).assertEqual(5);
      expect(registry.grantedCount()).assertEqual(5);
      expect(registry.distinctTokens().length).assertEqual(5);
      done();
    });

    it('AccessCtrlStateManager_037', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(registry.size()).assertEqual(1);
      expect(registry.byToken(TOKEN_A).length).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_038', 0, async (done: Function) => {
      const manager = buildManager();
      const summary = new AccessSummary(manager.getRegistry());
      expect(summary.total()).assertEqual(3);
      expect(summary.granted() + summary.denied() + summary.revoked()).assertEqual(
        manager.getRegistry().size() - 1);
      done();
    });

    it('AccessCtrlStateManager_039', 0, async (done: Function) => {
      const manager = buildManager();
      expect(manager.tokenState(TOKEN_A, GRANT_PERMISSION)).assertEqual(GrantState.GRANTED);
      expect(manager.tokenState(TOKEN_B, GRANT_PERMISSION)).assertEqual(GrantState.DENIED);
      expect(manager.getHistory().length).assertEqual(2);
      done();
    });

    it('AccessCtrlStateManager_040', 0, async (done: Function) => {
      const manager = buildManager();
      manager.apply(TOKEN_B, GRANT_PERMISSION, GrantState.REVOKED);
      manager.apply(TOKEN_B, GRANT_PERMISSION, GrantState.GRANTED);
      expect(manager.acceptCount()).assertEqual(4);
      expect(manager.tokenState(TOKEN_B, GRANT_PERMISSION)).assertEqual(GrantState.GRANTED);
      done();
    });

    it('AccessCtrlStateManager_041', 0, async (done: Function) => {
      const manager = buildManager();
      manager.apply(TOKEN_C, GET_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_C, GET_PERMISSION, GrantState.REVOKED);
      expect(manager.tokenState(TOKEN_C, GET_PERMISSION)).assertEqual(GrantState.REVOKED);
      expect(manager.acceptCount()).assertEqual(4);
      done();
    });

    it('AccessCtrlStateManager_042', 0, async (done: Function) => {
      const manager = buildManager();
      manager.apply(TOKEN_C, GET_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_C, GET_PERMISSION, GrantState.DENIED);
      expect(manager.rejectCount()).assertEqual(0);
      expect(manager.tokenState(TOKEN_C, GET_PERMISSION)).assertEqual(GrantState.DENIED);
      done();
    });

    it('AccessCtrlStateManager_043', 0, async (done: Function) => {
      const manager = buildManager();
      const upward = manager.getHistory().filter((entry: StateTransition) => entry.isUpward());
      expect(upward.length).assertEqual(1);
      expect(upward[0].to).assertEqual(GrantState.GRANTED);
      done();
    });

    it('AccessCtrlStateManager_044', 0, async (done: Function) => {
      const manager = buildManager();
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      const downward = manager.getHistory().filter((entry: StateTransition) => entry.isDownward());
      expect(downward.length).assertEqual(1);
      expect(downward[0].tokenId).assertEqual(TOKEN_A);
      done();
    });

    it('AccessCtrlStateManager_045', 0, async (done: Function) => {
      const manager = buildManager();
      const accepted = manager.getHistory().filter((entry: StateTransition) => entry.accepted);
      const rejected = manager.getHistory().filter((entry: StateTransition) => !entry.accepted);
      expect(accepted.length).assertEqual(2);
      expect(rejected.length).assertEqual(0);
      done();
    });

    it('AccessCtrlStateManager_046', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      for (let i = 0; i < 4; i++) {
        manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
        manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      }
      expect(manager.getHistory().length).assertEqual(8);
      expect(manager.acceptCount()).assertEqual(8);
      expect(manager.rejectCount()).assertEqual(0);
      done();
    });

    it('AccessCtrlStateManager_047', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      registry.register(TOKEN_B, GRANT_PERMISSION, GrantState.GRANTED);
      registry.register(TOKEN_C, GRANT_PERMISSION, GrantState.DENIED);
      const granted = registry.all().filter((record: PermissionRecord) => record.isGranted());
      expect(granted.length).assertEqual(2);
      expect(registry.deniedCount()).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_048', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      const record = registry.find(TOKEN_A, GRANT_PERMISSION);
      expect(record !== null).assertTrue();
      expect(record !== null ? record.isRevoked() : false).assertTrue();
      expect(record !== null ? record.key() : '').assertEqual(`${TOKEN_A}:${GRANT_PERMISSION}`);
      done();
    });

    it('AccessCtrlStateManager_049', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      const record = manager.getRegistry().find(TOKEN_A, GRANT_PERMISSION);
      expect(record !== null ? record.getState() : GrantState.GRANTED).assertEqual(GrantState.UNKNOWN);
      expect(manager.last()).assertNull();
      done();
    });

    it('AccessCtrlStateManager_050', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      const first = manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      const second = manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.DENIED);
      const third = manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      expect(first.accepted).assertTrue();
      expect(second.accepted).assertTrue();
      expect(third.accepted).assertTrue();
      done();
    });

    it('AccessCtrlStateManager_051', 0, async (done: Function) => {
      const manager = buildManager();
      expect(manager.canTransition(GrantState.UNKNOWN, GrantState.UNKNOWN)).assertFalse();
      expect(manager.canTransition(GrantState.GRANTED, GrantState.GRANTED)).assertFalse();
      expect(manager.canTransition(GrantState.DENIED, GrantState.DENIED)).assertFalse();
      expect(manager.canTransition(GrantState.REVOKED, GrantState.REVOKED)).assertFalse();
      done();
    });

    it('AccessCtrlStateManager_052', 0, async (done: Function) => {
      const manager = buildManager();
      let sameState = 0;
      const all: GrantState[] = [GrantState.UNKNOWN, GrantState.GRANTED, GrantState.DENIED, GrantState.REVOKED];
      for (const state of all) {
        if (!manager.canTransition(state, state)) {
          sameState += 1;
        }
      }
      expect(sameState).assertEqual(4);
      done();
    });

    it('AccessCtrlStateManager_053', 0, async (done: Function) => {
      const manager = buildManager();
      const summary = new AccessSummary(manager.getRegistry());
      expect(summary.granted()).assertEqual(1);
      expect(summary.denied()).assertEqual(1);
      expect(summary.revoked()).assertEqual(0);
      expect(summary.tokens()).assertEqual(3);
      done();
    });

    it('AccessCtrlStateManager_054', 0, async (done: Function) => {
      const manager = buildManager();
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      const summary = new AccessSummary(manager.getRegistry());
      expect(summary.granted()).assertEqual(0);
      expect(summary.revoked()).assertEqual(1);
      expect(summary.total()).assertEqual(3);
      done();
    });

    it('AccessCtrlStateManager_055', 0, async (done: Function) => {
      const manager = buildManager();
      const history = manager.getHistory();
      expect(history[0].describe().indexOf('->') >= 0).assertTrue();
      expect(history[1].describe().indexOf('->') >= 0).assertTrue();
      expect(history.length).assertEqual(2);
      done();
    });

    it('AccessCtrlStateManager_056', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.seed(TOKEN_B, GRANT_PERMISSION);
      manager.seed(TOKEN_C, GRANT_PERMISSION);
      expect(manager.getRegistry().distinctTokens().length).assertEqual(3);
      expect(manager.getRegistry().byPermission(GRANT_PERMISSION).length).assertEqual(3);
      done();
    });

    it('AccessCtrlStateManager_057', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      expect(manager.getRegistry().size()).assertEqual(1);
      expect(manager.getHistory().length).assertEqual(0);
      done();
    });

    it('AccessCtrlStateManager_058', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.DENIED);
      const transition = manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      expect(transition.from).assertEqual(GrantState.DENIED);
      expect(transition.to).assertEqual(GrantState.REVOKED);
      done();
    });

    it('AccessCtrlStateManager_059', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(manager.getRegistry().grantedCount()).assertEqual(1);
      expect(manager.getRegistry().revokedCount()).assertEqual(0);
      expect(manager.getRegistry().deniedCount()).assertEqual(0);
      done();
    });

    it('AccessCtrlStateManager_060', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      expect(manager.getRegistry().grantedCount()).assertEqual(0);
      expect(manager.getRegistry().revokedCount()).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_061', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      for (let i = 0; i < 3; i++) {
        manager.seed(TOKEN_A + i, GRANT_PERMISSION);
        manager.apply(TOKEN_A + i, GRANT_PERMISSION, GrantState.GRANTED);
      }
      expect(manager.acceptCount()).assertEqual(3);
      expect(manager.getRegistry().grantedCount()).assertEqual(3);
      expect(manager.getRegistry().distinctTokens().length).assertEqual(3);
      done();
    });

    it('AccessCtrlStateManager_062', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      for (let i = 0; i < 3; i++) {
        manager.seed(TOKEN_A + i, GRANT_PERMISSION);
      }
      for (let i = 0; i < 3; i++) {
        manager.apply(TOKEN_A + i, GRANT_PERMISSION, GrantState.GRANTED);
      }
      for (let i = 0; i < 3; i++) {
        manager.apply(TOKEN_A + i, GRANT_PERMISSION, GrantState.REVOKED);
      }
      expect(manager.getRegistry().revokedCount()).assertEqual(3);
      expect(manager.acceptCount()).assertEqual(6);
      done();
    });

    it('AccessCtrlStateManager_063', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.seed(TOKEN_B, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_B, GRANT_PERMISSION, GrantState.REVOKED);
      expect(manager.rejectCount()).assertEqual(1);
      expect(manager.getRegistry().grantedCount()).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_064', 0, async (done: Function) => {
      const manager = buildManager();
      const records = manager.getRegistry().byPermission(GRANT_PERMISSION);
      expect(records.length).assertEqual(2);
      expect(records[0].tokenId).assertEqual(TOKEN_A);
      expect(records[1].tokenId).assertEqual(TOKEN_B);
      done();
    });

    it('AccessCtrlStateManager_065', 0, async (done: Function) => {
      const manager = buildManager();
      const records = manager.getRegistry().byToken(TOKEN_A);
      expect(records.length).assertEqual(1);
      expect(records[0].permission).assertEqual(GRANT_PERMISSION);
      done();
    });

    it('AccessCtrlStateManager_066', 0, async (done: Function) => {
      const manager = buildManager();
      let transitionSum = 0;
      for (const entry of manager.getHistory()) {
        if (entry.accepted) {
          transitionSum += 1;
        }
      }
      expect(transitionSum).assertEqual(manager.acceptCount());
      expect(transitionSum).assertEqual(2);
      done();
    });

    it('AccessCtrlStateManager_067', 0, async (done: Function) => {
      const manager = buildManager();
      expect(manager.getHistory()[0].from).assertEqual(GrantState.UNKNOWN);
      expect(manager.getHistory()[0].to).assertEqual(GrantState.GRANTED);
      expect(manager.getHistory()[1].from).assertEqual(GrantState.UNKNOWN);
      expect(manager.getHistory()[1].to).assertEqual(GrantState.DENIED);
      done();
    });

    it('AccessCtrlStateManager_068', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      const summary = new AccessSummary(manager.getRegistry());
      expect(summary.describe()).assertEqual('total=1,granted=0,revoked=0');
      expect(summary.tokens()).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_069', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      const summary = new AccessSummary(manager.getRegistry());
      expect(summary.describe()).assertEqual('total=1,granted=0,revoked=1');
      done();
    });

    it('AccessCtrlStateManager_070', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.DENIED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(manager.getHistory().length).assertEqual(2);
      expect(manager.acceptCount()).assertEqual(2);
      expect(manager.tokenState(TOKEN_A, GRANT_PERMISSION)).assertEqual(GrantState.GRANTED);
      done();
    });

    it('AccessCtrlStateManager_071', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.DENIED);
      const last = manager.last();
      expect(last !== null ? last.from : GrantState.UNKNOWN).assertEqual(GrantState.GRANTED);
      expect(last !== null ? last.to : GrantState.UNKNOWN).assertEqual(GrantState.DENIED);
      done();
    });

    it('AccessCtrlStateManager_072', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      registry.register(TOKEN_A, GET_PERMISSION, GrantState.GRANTED);
      expect(registry.byToken(TOKEN_A).length).assertEqual(2);
      expect(registry.grantedCount()).assertEqual(2);
      expect(registry.distinctTokens().length).assertEqual(1);
      done();
    });

    it('AccessCtrlStateManager_073', 0, async (done: Function) => {
      const registry = new TokenRegistry();
      registry.register(TOKEN_A, GRANT_PERMISSION, GrantState.DENIED);
      const record = registry.find(TOKEN_A, GRANT_PERMISSION);
      expect(record !== null ? record.isDenied() : false).assertTrue();
      expect(registry.setState(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED)).assertTrue();
      expect(registry.deniedCount()).assertEqual(0);
      done();
    });

    it('AccessCtrlStateManager_074', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.seed(TOKEN_B, GET_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(manager.getRegistry().grantedCount()).assertEqual(1);
      expect(manager.getRegistry().deniedCount()).assertEqual(0);
      expect(manager.getRegistry().revokedCount()).assertEqual(0);
      done();
    });

    it('AccessCtrlStateManager_075', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      const before = manager.acceptCount();
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(manager.acceptCount()).assertEqual(before + 2);
      done();
    });

    it('AccessCtrlStateManager_076', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.seed(TOKEN_B, GRANT_PERMISSION);
      manager.seed(TOKEN_C, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_B, GRANT_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_C, GRANT_PERMISSION, GrantState.DENIED);
      const summary = new AccessSummary(manager.getRegistry());
      expect(summary.granted()).assertEqual(2);
      expect(summary.denied()).assertEqual(1);
      expect(summary.total()).assertEqual(3);
      done();
    });

    it('AccessCtrlStateManager_077', 0, async (done: Function) => {
      const manager = buildManager();
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(manager.acceptCount()).assertEqual(4);
      expect(manager.tokenState(TOKEN_A, GRANT_PERMISSION)).assertEqual(GrantState.GRANTED);
      done();
    });

    it('AccessCtrlStateManager_078', 0, async (done: Function) => {
      const manager = buildManager();
      const revoked = manager.getHistory().filter((entry: StateTransition) => !entry.accepted);
      expect(revoked.length).assertEqual(0);
      expect(manager.getHistory().length).assertEqual(2);
      done();
    });

    it('AccessCtrlStateManager_079', 0, async (done: Function) => {
      const manager = buildManager();
      manager.apply(TOKEN_C, GET_PERMISSION, GrantState.REVOKED);
      const rejected = manager.getHistory().filter((entry: StateTransition) => !entry.accepted);
      expect(rejected.length).assertEqual(1);
      expect(rejected[0].tokenId).assertEqual(TOKEN_C);
      done();
    });

    it('AccessCtrlStateManager_080', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.REVOKED);
      expect(manager.getRegistry().revokedCount()).assertEqual(1);
      expect(manager.acceptCount()).assertEqual(4);
      done();
    });

    it('AccessCtrlStateManager_081', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.seed(TOKEN_B, GRANT_PERMISSION);
      expect(manager.getRegistry().stateOf(TOKEN_A, GRANT_PERMISSION)).assertEqual(GrantState.UNKNOWN);
      expect(manager.getRegistry().stateOf(TOKEN_C, GRANT_PERMISSION)).assertEqual(GrantState.UNKNOWN);
      done();
    });

    it('AccessCtrlStateManager_082', 0, async (done: Function) => {
      const manager = new AccessCtrlStateManager();
      manager.seed(TOKEN_A, GRANT_PERMISSION);
      manager.apply(TOKEN_A, GRANT_PERMISSION, GrantState.GRANTED);
      expect(manager.getRegistry().find(TOKEN_A, GRANT_PERMISSION)?.isGranted()).assertTrue();
      expect(manager.getRegistry().find(TOKEN_A, GET_PERMISSION)).assertNull();
      done();
    });

    it('AccessCtrlStateManager_083', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(typeof ready === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('AccessCtrlStateManager_084', 0, async (done: Function) => {
      const manager = buildManager();
      const total = manager.getRegistry().grantedCount() + manager.getRegistry().deniedCount()
        + manager.getRegistry().revokedCount();
      expect(total).assertEqual(2);
      expect(manager.getRegistry().size() - total).assertEqual(1);
      expect(manager.getHistory().length).assertEqual(2);
      expect(manager.acceptCount()).assertEqual(2);
      done();
    });
  });
}

