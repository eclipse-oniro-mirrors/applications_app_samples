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

import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists,
  BUNDLE_NAME, ACCOUNT_ID, CONNECTION_NUMBER
} from '../Shared/SharedDriver';

enum SvcState {
  NONE = 0,
  CREATED = 1,
  CONNECTED = 2,
  DISCONNECTED = 3,
  DESTROYED = 4
}

class SvcEvent {
  name: string = '';
  connection: number = -1;
  accepted: boolean = false;

  constructor(name: string, connection: number, accepted: boolean) {
    this.name = name;
    this.connection = connection;
    this.accepted = accepted;
  }
}

class SvcLifecycleModel {
  private state: number = SvcState.NONE;
  private events: SvcEvent[] = [];
  private active: number[] = [];
  private connectCount: number = 0;
  private disconnectCount: number = 0;
  private errors: number = 0;

  onCreate(): boolean {
    if (this.state !== SvcState.NONE) {
      this.record('onCreate', -1, false);
      return false;
    }
    this.state = SvcState.CREATED;
    this.record('onCreate', -1, true);
    return true;
  }

  onConnect(connection: number): boolean {
    if (connection < 0 || this.state === SvcState.DESTROYED || this.state === SvcState.NONE) {
      this.record('onConnect', connection, false);
      return false;
    }
    if (this.active.indexOf(connection) >= 0) {
      this.record('onConnect', connection, false);
      return false;
    }
    this.active.push(connection);
    this.connectCount = this.connectCount + 1;
    this.state = SvcState.CONNECTED;
    this.record('onConnect', connection, true);
    return true;
  }

  onDisconnect(connection: number): boolean {
    const index = this.active.indexOf(connection);
    if (index < 0 || this.state !== SvcState.CONNECTED) {
      this.record('onDisconnect', connection, false);
      return false;
    }
    this.active.splice(index, 1);
    this.disconnectCount = this.disconnectCount + 1;
    if (this.active.length === 0) {
      this.state = SvcState.DISCONNECTED;
    }
    this.record('onDisconnect', connection, true);
    return true;
  }

  onDestroy(): boolean {
    if (this.state === SvcState.NONE || this.state === SvcState.DESTROYED) {
      this.record('onDestroy', -1, false);
      return false;
    }
    this.active = [];
    this.state = SvcState.DESTROYED;
    this.record('onDestroy', -1, true);
    return true;
  }

  private record(name: string, connection: number, accepted: boolean): void {
    this.events.push(new SvcEvent(name, connection, accepted));
    if (!accepted) {
      this.errors = this.errors + 1;
    }
  }

  isReady(): boolean {
    return this.state === SvcState.CREATED || this.state === SvcState.CONNECTED;
  }

  getState(): number {
    return this.state;
  }

  getActive(): number[] {
    return this.active;
  }

  getConnectCount(): number {
    return this.connectCount;
  }

  getDisconnectCount(): number {
    return this.disconnectCount;
  }

  getErrors(): number {
    return this.errors;
  }

  getEvents(): SvcEvent[] {
    return this.events;
  }

  lastEvent(): SvcEvent | null {
    if (this.events.length === 0) {
      return null;
    }
    return this.events[this.events.length - 1];
  }

  eventCount(name: string): number {
    let count = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].name === name) {
        count = count + 1;
      }
    }
    return count;
  }
}

export default function serviceExtContextLifecycleTest(): void {
  describe('ServiceExtContextLifecycle', () => {
    it('ServiceExtContextLifecycle_001', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      expect(model.getState()).assertEqual(SvcState.NONE);
      expect(model.isReady()).assertFalse();
      expect(model.getEvents().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextLifecycle_002', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      expect(model.onCreate()).assertTrue();
      expect(model.getState()).assertEqual(SvcState.CREATED);
      expect(model.isReady()).assertTrue();
      done();
    });

    it('ServiceExtContextLifecycle_003', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      expect(model.onConnect(CONNECTION_NUMBER)).assertTrue();
      expect(model.getState()).assertEqual(SvcState.CONNECTED);
      expect(model.getConnectCount()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_004', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      expect(model.onConnect(CONNECTION_NUMBER)).assertFalse();
      expect(model.getState()).assertEqual(SvcState.NONE);
      expect(model.getErrors()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_005', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      expect(model.onConnect(-1)).assertFalse();
      expect(model.getActive().length).assertEqual(0);
      expect(model.getErrors()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_006', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      expect(model.onDisconnect(0)).assertTrue();
      expect(model.getState()).assertEqual(SvcState.DISCONNECTED);
      expect(model.getDisconnectCount()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_007', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      expect(model.onDisconnect(0)).assertFalse();
      expect(model.getState()).assertEqual(SvcState.CREATED);
      expect(model.getErrors()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_008', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onConnect(1);
      expect(model.getActive().length).assertEqual(2);
      expect(model.getConnectCount()).assertEqual(2);
      done();
    });

    it('ServiceExtContextLifecycle_009', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onConnect(1);
      model.onDisconnect(0);
      expect(model.getState()).assertEqual(SvcState.CONNECTED);
      expect(model.getActive().length).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_010', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      expect(model.onConnect(0)).assertFalse();
      expect(model.getActive().length).assertEqual(1);
      expect(model.getErrors()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_011', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      expect(model.onDestroy()).assertTrue();
      expect(model.getState()).assertEqual(SvcState.DESTROYED);
      expect(model.getActive().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextLifecycle_012', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      expect(model.onDestroy()).assertFalse();
      expect(model.getState()).assertEqual(SvcState.NONE);
      expect(model.getErrors()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_013', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onDestroy();
      expect(model.onConnect(1)).assertFalse();
      expect(model.getState()).assertEqual(SvcState.DESTROYED);
      expect(model.getErrors()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_014', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      expect(model.onCreate()).assertFalse();
      expect(model.getState()).assertEqual(SvcState.CREATED);
      expect(model.getErrors()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_015', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onDisconnect(0);
      expect(model.onConnect(1)).assertTrue();
      expect(model.getState()).assertEqual(SvcState.CONNECTED);
      expect(model.getConnectCount()).assertEqual(2);
      done();
    });

    it('ServiceExtContextLifecycle_016', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      expect(model.onDisconnect(5)).assertFalse();
      expect(model.getActive().length).assertEqual(1);
      expect(model.getErrors()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_017', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onDestroy();
      expect(model.onDisconnect(0)).assertFalse();
      expect(model.getState()).assertEqual(SvcState.DESTROYED);
      expect(model.getDisconnectCount()).assertEqual(0);
      done();
    });

    it('ServiceExtContextLifecycle_018', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      const events = model.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[0].name).assertEqual('onCreate');
      expect(events[1].name).assertEqual('onConnect');
      done();
    });

    it('ServiceExtContextLifecycle_019', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onCreate();
      expect(model.eventCount('onCreate')).assertEqual(2);
      expect(model.getErrors()).assertEqual(1);
      expect(model.getState()).assertEqual(SvcState.CREATED);
      done();
    });

    it('ServiceExtContextLifecycle_020', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      expect(model.isReady()).assertTrue();
      expect(model.getState()).assertEqual(SvcState.CONNECTED);
      expect(model.getActive()[0]).assertEqual(0);
      done();
    });

    it('ServiceExtContextLifecycle_021', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onDisconnect(0);
      expect(model.isReady()).assertFalse();
      expect(model.getState()).assertEqual(SvcState.DISCONNECTED);
      expect(model.getConnectCount()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_022', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onDestroy();
      expect(model.isReady()).assertFalse();
      expect(model.getState()).assertEqual(SvcState.DESTROYED);
      expect(model.getErrors()).assertEqual(0);
      done();
    });

    it('ServiceExtContextLifecycle_023', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      expect(model.lastEvent()).assertNull();
      model.onCreate();
      const last = model.lastEvent();
      expect(last !== null).assertTrue();
      expect(model.getEvents().length).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_024', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(3);
      const last = model.lastEvent();
      const connection: number = last === null ? -1 : last.connection;
      expect(connection).assertEqual(3);
      expect(last !== null).assertTrue();
      done();
    });

    it('ServiceExtContextLifecycle_025', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onDisconnect(0);
      expect(model.onDestroy()).assertTrue();
      expect(model.getState()).assertEqual(SvcState.DESTROYED);
      expect(model.getDisconnectCount()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_026', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onDisconnect(0);
      expect(model.onConnect(7)).assertTrue();
      expect(model.getActive().length).assertEqual(1);
      expect(model.getActive()[0]).assertEqual(7);
      done();
    });

    it('ServiceExtContextLifecycle_027', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onDestroy();
      const events = model.getEvents();
      expect(events[0].accepted).assertTrue();
      expect(events[1].accepted).assertTrue();
      expect(events[2].accepted).assertTrue();
      done();
    });

    it('ServiceExtContextLifecycle_028', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onConnect(1);
      model.onDisconnect(0);
      model.onDisconnect(1);
      expect(model.getDisconnectCount()).assertEqual(2);
      expect(model.getState()).assertEqual(SvcState.DISCONNECTED);
      expect(model.getActive().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextLifecycle_029', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onConnect(1);
      model.onDestroy();
      expect(model.getActive().length).assertEqual(0);
      expect(model.getState()).assertEqual(SvcState.DESTROYED);
      expect(model.getConnectCount()).assertEqual(2);
      done();
    });

    it('ServiceExtContextLifecycle_030', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onConnect(0);
      model.onCreate();
      model.onConnect(0);
      model.onConnect(0);
      expect(model.getErrors()).assertEqual(2);
      expect(model.getConnectCount()).assertEqual(1);
      expect(model.getActive().length).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_031', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onDestroy();
      expect(model.onDestroy()).assertFalse();
      expect(model.getErrors()).assertEqual(1);
      expect(model.getState()).assertEqual(SvcState.DESTROYED);
      done();
    });

    it('ServiceExtContextLifecycle_032', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      expect(model.eventCount('onConnect')).assertEqual(1);
      expect(model.eventCount('onDisconnect')).assertEqual(0);
      expect(model.eventCount('onDestroy')).assertEqual(0);
      done();
    });

    it('ServiceExtContextLifecycle_033', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      expect(model.getState()).assertEqual(SvcState.NONE);
      model.onCreate();
      expect(model.getState()).assertEqual(SvcState.CREATED);
      model.onConnect(0);
      expect(model.getState()).assertEqual(SvcState.CONNECTED);
      model.onDestroy();
      expect(model.getState()).assertEqual(SvcState.DESTROYED);
      done();
    });

    it('ServiceExtContextLifecycle_034', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      expect(model.onConnect(0)).assertFalse();
      expect(model.onDestroy()).assertFalse();
      expect(model.onConnect(-1)).assertFalse();
      expect(model.getErrors()).assertEqual(3);
      expect(model.getState()).assertEqual(SvcState.NONE);
      done();
    });

    it('ServiceExtContextLifecycle_035', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onDisconnect(0);
      model.onConnect(0);
      model.onDisconnect(0);
      expect(model.getConnectCount()).assertEqual(2);
      expect(model.getDisconnectCount()).assertEqual(2);
      expect(model.getState()).assertEqual(SvcState.DISCONNECTED);
      done();
    });

    it('ServiceExtContextLifecycle_036', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onConnect(1);
      model.onDestroy();
      expect(model.onConnect(2)).assertFalse();
      expect(model.getActive().length).assertEqual(0);
      expect(model.getErrors()).assertEqual(1);
      done();
    });

    it('ServiceExtContextLifecycle_037', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onDisconnect(0);
      model.onDestroy();
      const events = model.getEvents();
      expect(events.length).assertEqual(4);
      expect(events[3].name).assertEqual('onDestroy');
      expect(events[2].name).assertEqual('onDisconnect');
      expect(model.getState()).assertEqual(SvcState.DESTROYED);
      done();
    });

    it('ServiceExtContextLifecycle_038', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      model.onConnect(0);
      model.onDestroy();
      expect(model.onConnect(0)).assertFalse();
      expect(model.getState()).assertEqual(SvcState.DESTROYED);
      expect(model.isReady()).assertFalse();
      done();
    });

    it('ServiceExtContextLifecycle_039', 0, async (done: Function) => {
      const model = new SvcLifecycleModel();
      model.onCreate();
      expect(model.onConnect(-7)).assertFalse();
      expect(model.getConnectCount()).assertEqual(0);
      expect(model.getActive().length).assertEqual(0);
      expect(model.getState()).assertEqual(SvcState.CREATED);
      done();
    });

  });
}
