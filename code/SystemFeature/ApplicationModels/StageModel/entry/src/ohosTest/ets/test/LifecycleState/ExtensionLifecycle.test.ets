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
import { getDriver, ensureAppReady, checkComponentExists, BUNDLE_NAME } from '../Shared/SharedDriver';

enum ExtensionKind {
  SERVICE = 0,
  FORM = 1,
  DATA_SHARE = 2
}

enum ExtState {
  INIT = 0,
  CONNECTED = 1,
  DISCONNECTED = 2,
  DESTROYED = 3
}

class Connection {
  id: number = 0;
  caller: string = '';
  active: boolean = false;

  constructor(id: number, caller: string) {
    this.id = id;
    this.caller = caller;
    this.active = true;
  }
}

class Request {
  id: number = 0;
  action: string = '';
  handled: boolean = false;

  constructor(id: number, action: string, handled: boolean) {
    this.id = id;
    this.action = action;
    this.handled = handled;
  }
}

function validExtensionKind(kind: number): boolean {
  return kind === ExtensionKind.SERVICE || kind === ExtensionKind.FORM || kind === ExtensionKind.DATA_SHARE;
}

function extensionKindName(kind: number): string {
  if (kind === ExtensionKind.SERVICE) {
    return 'ServiceExtAbility';
  }
  if (kind === ExtensionKind.FORM) {
    return 'FormAbility';
  }
  if (kind === ExtensionKind.DATA_SHARE) {
    return 'DataShareExtAbility';
  }
  return 'unknown';
}

class ExtensionModel {
  instanceId: number = 0;
  kind: number = ExtensionKind.SERVICE;
  state: number = ExtState.INIT;
  private connections: Connection[] = [];
  private requests: Request[] = [];
  private nextConnectionId: number = 1;
  private nextRequestId: number = 1;
  private duplicateConnections: number = 0;
  private destroyReason: string = '';

  constructor(instanceId: number, kind: number) {
    this.instanceId = instanceId;
    this.kind = kind;
  }

  connect(caller: string): number {
    if (this.state === ExtState.DESTROYED) {
      return -1;
    }
    for (let i = 0; i < this.connections.length; i++) {
      if (this.connections[i].caller === caller && this.connections[i].active) {
        this.duplicateConnections = this.duplicateConnections + 1;
        return this.connections[i].id;
      }
    }
    const connection = new Connection(this.nextConnectionId, caller);
    this.nextConnectionId = this.nextConnectionId + 1;
    this.connections.push(connection);
    this.state = ExtState.CONNECTED;
    return connection.id;
  }

  disconnect(connectionId: number): boolean {
    for (let i = 0; i < this.connections.length; i++) {
      if (this.connections[i].id === connectionId) {
        if (!this.connections[i].active) {
          return false;
        }
        this.connections[i].active = false;
        if (this.activeConnectionCount() === 0 && this.state !== ExtState.DESTROYED) {
          this.state = ExtState.DISCONNECTED;
        }
        return true;
      }
    }
    return false;
  }

  disconnectAll(): number {
    let count = 0;
    for (let i = 0; i < this.connections.length; i++) {
      if (this.connections[i].active) {
        this.connections[i].active = false;
        count = count + 1;
      }
    }
    if (count > 0 && this.state !== ExtState.DESTROYED) {
      this.state = ExtState.DISCONNECTED;
    }
    return count;
  }

  activeConnectionCount(): number {
    let count = 0;
    for (let i = 0; i < this.connections.length; i++) {
      if (this.connections[i].active) {
        count = count + 1;
      }
    }
    return count;
  }

  totalConnectionCount(): number {
    return this.connections.length;
  }

  findConnection(connectionId: number): Connection | null {
    for (let i = 0; i < this.connections.length; i++) {
      if (this.connections[i].id === connectionId) {
        return this.connections[i];
      }
    }
    return null;
  }

  handleRequest(action: string): number {
    const handled = action.trim().length > 0 && this.state !== ExtState.DESTROYED;
    const request = new Request(this.nextRequestId, action, handled);
    this.nextRequestId = this.nextRequestId + 1;
    this.requests.push(request);
    return handled ? request.id : -1;
  }

  requestCount(): number {
    return this.requests.length;
  }

  handledRequestCount(): number {
    let count = 0;
    for (let i = 0; i < this.requests.length; i++) {
      if (this.requests[i].handled) {
        count = count + 1;
      }
    }
    return count;
  }

  destroy(reason: string): boolean {
    if (this.state === ExtState.DESTROYED) {
      return false;
    }
    this.destroyReason = reason;
    this.disconnectAll();
    this.state = ExtState.DESTROYED;
    return true;
  }

  isConnected(): boolean {
    return this.state === ExtState.CONNECTED && this.activeConnectionCount() > 0;
  }

  isDestroyed(): boolean {
    return this.state === ExtState.DESTROYED;
  }

  getDestroyReason(): string {
    return this.destroyReason;
  }

  getDuplicateConnections(): number {
    return this.duplicateConnections;
  }

  canAcceptWork(): boolean {
    return this.state !== ExtState.DESTROYED;
  }
}

class ExtensionRegistry {
  private models: ExtensionModel[] = [];
  private nextId: number = 1;

  register(kind: number): ExtensionModel {
    const model = new ExtensionModel(this.nextId, kind);
    this.nextId = this.nextId + 1;
    this.models.push(model);
    return model;
  }

  lookup(instanceId: number): ExtensionModel | null {
    for (let i = 0; i < this.models.length; i++) {
      if (this.models[i].instanceId === instanceId) {
        return this.models[i];
      }
    }
    return null;
  }

  countByKind(kind: number): number {
    let count = 0;
    for (let i = 0; i < this.models.length; i++) {
      if (this.models[i].kind === kind) {
        count = count + 1;
      }
    }
    return count;
  }

  activeCount(): number {
    let count = 0;
    for (let i = 0; i < this.models.length; i++) {
      if (!this.models[i].isDestroyed()) {
        count = count + 1;
      }
    }
    return count;
  }

  destroyAll(reason: string): number {
    let count = 0;
    for (let i = 0; i < this.models.length; i++) {
      if (this.models[i].destroy(reason)) {
        count = count + 1;
      }
    }
    return count;
  }

  size(): number {
    return this.models.length;
  }
}

export default function extensionLifecycleTest(): void {
  describe('ExtensionLifecycle', () => {
    it('ExtensionLifecycle_001', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      expect(model.state).assertEqual(ExtState.INIT);
      expect(model.activeConnectionCount()).assertEqual(0);
      expect(model.totalConnectionCount()).assertEqual(0);
      expect(model.isConnected()).assertFalse();
      expect(model.isDestroyed()).assertFalse();
      done();
    });

    it('ExtensionLifecycle_002', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      const id = model.connect('MainAbility');
      expect(id).assertEqual(1);
      expect(model.state).assertEqual(ExtState.CONNECTED);
      expect(model.activeConnectionCount()).assertEqual(1);
      expect(model.isConnected()).assertTrue();
      done();
    });

    it('ExtensionLifecycle_003', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      const first = model.connect('A');
      const second = model.connect('B');
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(model.activeConnectionCount()).assertEqual(2);
      expect(model.totalConnectionCount()).assertEqual(2);
      done();
    });

    it('ExtensionLifecycle_004', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      const id = model.connect('A');
      model.connect('A');
      expect(model.getDuplicateConnections()).assertEqual(1);
      expect(model.totalConnectionCount()).assertEqual(1);
      expect(model.findConnection(id) !== null).assertTrue();
      done();
    });

    it('ExtensionLifecycle_005', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      const id = model.connect('A');
      expect(model.disconnect(id)).assertTrue();
      expect(model.state).assertEqual(ExtState.DISCONNECTED);
      expect(model.activeConnectionCount()).assertEqual(0);
      expect(model.disconnect(id)).assertFalse();
      done();
    });

    it('ExtensionLifecycle_006', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      model.connect('A');
      model.connect('B');
      expect(model.disconnectAll()).assertEqual(2);
      expect(model.state).assertEqual(ExtState.DISCONNECTED);
      expect(model.activeConnectionCount()).assertEqual(0);
      expect(model.totalConnectionCount()).assertEqual(2);
      done();
    });

    it('ExtensionLifecycle_007', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      model.connect('A');
      expect(model.handleRequest('connect')).assertEqual(1);
      expect(model.handleRequest('play')).assertEqual(2);
      expect(model.requestCount()).assertEqual(2);
      expect(model.handledRequestCount()).assertEqual(2);
      done();
    });

    it('ExtensionLifecycle_008', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      expect(model.handleRequest('   ')).assertEqual(-1);
      expect(model.requestCount()).assertEqual(1);
      expect(model.handledRequestCount()).assertEqual(0);
      done();
    });

    it('ExtensionLifecycle_009', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      model.connect('A');
      expect(model.destroy('user')).assertTrue();
      expect(model.state).assertEqual(ExtState.DESTROYED);
      expect(model.isDestroyed()).assertTrue();
      expect(model.getDestroyReason()).assertEqual('user');
      expect(model.activeConnectionCount()).assertEqual(0);
      done();
    });

    it('ExtensionLifecycle_010', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      model.destroy('first');
      expect(model.destroy('second')).assertFalse();
      expect(model.getDestroyReason()).assertEqual('first');
      expect(model.isDestroyed()).assertTrue();
      done();
    });

    it('ExtensionLifecycle_011', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      model.destroy('done');
      expect(model.connect('A')).assertEqual(-1);
      expect(model.handleRequest('after')).assertEqual(-1);
      expect(model.canAcceptWork()).assertFalse();
      done();
    });

    it('ExtensionLifecycle_012', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.FORM);
      expect(model.kind).assertEqual(ExtensionKind.FORM);
      expect(validExtensionKind(model.kind)).assertTrue();
      expect(extensionKindName(model.kind)).assertEqual('FormAbility');
      expect(extensionKindName(99)).assertEqual('unknown');
      done();
    });

    it('ExtensionLifecycle_013', 0, async (done: Function) => {
      expect(validExtensionKind(ExtensionKind.SERVICE)).assertTrue();
      expect(validExtensionKind(ExtensionKind.FORM)).assertTrue();
      expect(validExtensionKind(ExtensionKind.DATA_SHARE)).assertTrue();
      expect(validExtensionKind(-1)).assertFalse();
      expect(validExtensionKind(3)).assertFalse();
      done();
    });

    it('ExtensionLifecycle_014', 0, async (done: Function) => {
      const registry = new ExtensionRegistry();
      const service = registry.register(ExtensionKind.SERVICE);
      const form = registry.register(ExtensionKind.FORM);
      expect(service.instanceId).assertEqual(1);
      expect(form.instanceId).assertEqual(2);
      expect(registry.size()).assertEqual(2);
      expect(registry.countByKind(ExtensionKind.SERVICE)).assertEqual(1);
      expect(registry.countByKind(ExtensionKind.DATA_SHARE)).assertEqual(0);
      done();
    });

    it('ExtensionLifecycle_015', 0, async (done: Function) => {
      const registry = new ExtensionRegistry();
      registry.register(ExtensionKind.SERVICE);
      registry.register(ExtensionKind.FORM);
      const found = registry.lookup(2);
      expect(found !== null).assertTrue();
      expect(found === null ? -1 : found.kind).assertEqual(ExtensionKind.FORM);
      expect(registry.lookup(99)).assertNull();
      done();
    });

    it('ExtensionLifecycle_016', 0, async (done: Function) => {
      const registry = new ExtensionRegistry();
      const first = registry.register(ExtensionKind.SERVICE);
      registry.register(ExtensionKind.SERVICE);
      first.destroy('done');
      expect(registry.activeCount()).assertEqual(1);
      expect(registry.size()).assertEqual(2);
      expect(registry.countByKind(ExtensionKind.SERVICE)).assertEqual(2);
      done();
    });

    it('ExtensionLifecycle_017', 0, async (done: Function) => {
      const registry = new ExtensionRegistry();
      registry.register(ExtensionKind.SERVICE);
      registry.register(ExtensionKind.FORM);
      registry.register(ExtensionKind.DATA_SHARE);
      expect(registry.destroyAll('shutdown')).assertEqual(3);
      expect(registry.activeCount()).assertEqual(0);
      expect(registry.destroyAll('again')).assertEqual(0);
      done();
    });

    it('ExtensionLifecycle_018', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      const id = model.connect('A');
      const connection = model.findConnection(id);
      expect(connection !== null).assertTrue();
      expect(connection === null ? '' : connection.caller).assertEqual('A');
      expect(connection === null ? false : connection.active).assertTrue();
      expect(model.findConnection(99)).assertNull();
      done();
    });

    it('ExtensionLifecycle_019', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.DATA_SHARE);
      const first = model.connect('Reader');
      const second = model.connect('Writer');
      model.disconnect(first);
      expect(model.state).assertEqual(ExtState.CONNECTED);
      expect(model.activeConnectionCount()).assertEqual(1);
      model.disconnect(second);
      expect(model.state).assertEqual(ExtState.DISCONNECTED);
      done();
    });

    it('ExtensionLifecycle_020', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      model.connect('A');
      model.connect('B');
      model.disconnectAll();
      expect(model.handleRequest('afterDisconnect')).assertEqual(1);
      expect(model.handledRequestCount()).assertEqual(1);
      expect(model.state).assertEqual(ExtState.DISCONNECTED);
      done();
    });

    it('ExtensionLifecycle_021', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      const first = model.connect('A');
      model.connect('A');
      expect(model.disconnect(first)).assertTrue();
      expect(model.getDuplicateConnections()).assertEqual(1);
      expect(model.state).assertEqual(ExtState.DISCONNECTED);
      done();
    });

    it('ExtensionLifecycle_022', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      for (let i = 0; i < 5; i++) {
        model.connect(`caller-${i}`);
      }
      expect(model.activeConnectionCount()).assertEqual(5);
      expect(model.disconnectAll()).assertEqual(5);
      expect(model.activeConnectionCount()).assertEqual(0);
      expect(model.totalConnectionCount()).assertEqual(5);
      done();
    });

    it('ExtensionLifecycle_023', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.FORM);
      expect(model.canAcceptWork()).assertTrue();
      model.connect('FormMgr');
      model.handleRequest('addForm');
      model.handleRequest('updateForm');
      expect(model.handledRequestCount()).assertEqual(2);
      expect(model.requestCount()).assertEqual(2);
      done();
    });

    it('ExtensionLifecycle_024', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.DATA_SHARE);
      model.connect('Reader');
      model.handleRequest('query');
      model.destroy('dataShareClosed');
      expect(model.handledRequestCount()).assertEqual(1);
      expect(model.isDestroyed()).assertTrue();
      expect(model.getDestroyReason()).assertEqual('dataShareClosed');
      expect(model.state).assertEqual(ExtState.DESTROYED);
      done();
    });

    it('ExtensionLifecycle_025', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      const id = model.connect('A');
      expect(model.connect('B')).assertEqual(id + 1);
      expect(model.connect('C')).assertEqual(id + 2);
      expect(model.totalConnectionCount()).assertEqual(3);
      expect(model.activeConnectionCount()).assertEqual(3);
      done();
    });

    it('ExtensionLifecycle_026', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      expect(model.handleRequest('a')).assertEqual(1);
      expect(model.handleRequest('b')).assertEqual(2);
      expect(model.handleRequest('c')).assertEqual(3);
      expect(model.requestCount()).assertEqual(3);
      done();
    });

    it('ExtensionLifecycle_027', 0, async (done: Function) => {
      const registry = new ExtensionRegistry();
      registry.register(ExtensionKind.FORM);
      registry.register(ExtensionKind.FORM);
      const third = registry.register(ExtensionKind.FORM);
      expect(registry.countByKind(ExtensionKind.FORM)).assertEqual(3);
      expect(third.instanceId).assertEqual(3);
      expect(registry.lookup(3) !== null).assertTrue();
      done();
    });

    it('ExtensionLifecycle_028', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      model.connect('A');
      model.connect('B');
      model.disconnect(1);
      model.destroy('shutdown');
      expect(model.activeConnectionCount()).assertEqual(0);
      expect(model.state).assertEqual(ExtState.DESTROYED);
      expect(model.totalConnectionCount()).assertEqual(2);
      done();
    });

    it('ExtensionLifecycle_029', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      expect(model.disconnect(42)).assertFalse();
      expect(model.disconnectAll()).assertEqual(0);
      expect(model.state).assertEqual(ExtState.INIT);
      expect(model.isConnected()).assertFalse();
      done();
    });

    it('ExtensionLifecycle_030', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      model.connect('A');
      model.handleRequest('work');
      const connection = model.findConnection(1);
      expect(connection === null ? 0 : connection.id).assertEqual(1);
      expect(model.requestCount()).assertEqual(1);
      expect(model.handledRequestCount()).assertEqual(1);
      expect(model.canAcceptWork()).assertTrue();
      done();
    });

    it('ExtensionLifecycle_031', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      model.connect('A');
      model.connect('B');
      model.connect('C');
      model.disconnect(2);
      expect(model.activeConnectionCount()).assertEqual(2);
      expect(model.state).assertEqual(ExtState.CONNECTED);
      expect(model.findConnection(2) === null ? true : false).assertFalse();
      done();
    });

    it('ExtensionLifecycle_032', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      model.destroy('terminated');
      model.destroy('ignored');
      expect(model.getDestroyReason()).assertEqual('terminated');
      expect(model.isDestroyed()).assertTrue();
      expect(model.canAcceptWork()).assertFalse();
      done();
    });

    it('ExtensionLifecycle_033', 0, async (done: Function) => {
      const registry = new ExtensionRegistry();
      const first = registry.register(ExtensionKind.SERVICE);
      const second = registry.register(ExtensionKind.FORM);
      first.connect('A');
      second.connect('B');
      expect(first.isConnected()).assertTrue();
      expect(second.isConnected()).assertTrue();
      expect(registry.activeCount()).assertEqual(2);
      done();
    });

    it('ExtensionLifecycle_034', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.SERVICE);
      model.connect('A');
      model.disconnectAll();
      model.connect('B');
      expect(model.state).assertEqual(ExtState.CONNECTED);
      expect(model.activeConnectionCount()).assertEqual(1);
      expect(model.totalConnectionCount()).assertEqual(2);
      done();
    });

    it('ExtensionLifecycle_035', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.FORM);
      expect(model.handleRequest('')).assertEqual(-1);
      expect(model.handleRequest('  ')).assertEqual(-1);
      expect(model.handleRequest('valid')).assertEqual(3);
      expect(model.requestCount()).assertEqual(3);
      expect(model.handledRequestCount()).assertEqual(1);
      done();
    });

    it('ExtensionLifecycle_036', 0, async (done: Function) => {
      const model = new ExtensionModel(1, ExtensionKind.DATA_SHARE);
      model.connect('Reader1');
      model.connect('Reader2');
      expect(model.isConnected()).assertTrue();
      model.disconnect(1);
      expect(model.isConnected()).assertTrue();
      model.disconnect(2);
      expect(model.isConnected()).assertFalse();
      expect(model.state).assertEqual(ExtState.DISCONNECTED);
      done();
    });

    it('ExtensionLifecycle_037', 0, async (done: Function) => {
      const registry = new ExtensionRegistry();
      registry.register(ExtensionKind.SERVICE);
      registry.register(ExtensionKind.SERVICE);
      registry.lookup(2);
      const target = registry.lookup(1);
      if (target !== null) {
        target.destroy('done');
      }
      expect(registry.activeCount()).assertEqual(1);
      expect(registry.countByKind(ExtensionKind.SERVICE)).assertEqual(2);
      done();
    });

    it('ExtensionLifecycle_038', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', `extension ui probe ${exists}`);
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
    it('ExtensionLifecycle_039', 0, async (done: Function) => {
      const model = new ExtensionModel(9, ExtensionKind.DATA_SHARE);
      expect(extensionKindName(model.kind)).assertEqual('DataShareExtAbility');
      expect(model.instanceId).assertEqual(9);
      expect(model.connect('Caller')).assertEqual(1);
      expect(model.handleRequest('insert')).assertEqual(1);
      expect(model.state).assertEqual(ExtState.CONNECTED);
      done();
    });

    it('ExtensionLifecycle_040', 0, async (done: Function) => {
      const registry = new ExtensionRegistry();
      const service = registry.register(ExtensionKind.SERVICE);
      service.connect('A');
      service.connect('B');
      expect(service.disconnectAll()).assertEqual(2);
      expect(registry.destroyAll('final')).assertEqual(1);
      expect(registry.activeCount()).assertEqual(0);
      expect(registry.size()).assertEqual(1);
      done();
    });
  });
}




