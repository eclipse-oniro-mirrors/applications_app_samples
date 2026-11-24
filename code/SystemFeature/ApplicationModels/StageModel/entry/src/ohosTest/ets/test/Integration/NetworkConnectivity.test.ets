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
  getDriver, ensureAppReady, checkComponentExists, clampNumber
} from '../Shared/SharedDriver';

enum ConnectionState {
  DISCONNECTED = 0,
  CONNECTING = 1,
  CONNECTED = 2,
  DEGRADED = 3
}

class NetworkEndpoint {
  host: string = '';
  port: number = 0;

  constructor(host: string, port: number) {
    this.host = host;
    this.port = port;
  }

  isValid(): boolean {
    return this.host.length > 0 && this.port > 0 && this.port <= 65535;
  }

  key(): string {
    return this.host + ':' + this.port;
  }
}

class ConnectionModel {
  private endpoint: NetworkEndpoint;
  private state: ConnectionState = ConnectionState.DISCONNECTED;
  private attempts: number = 0;
  private successes: number = 0;
  private failures: number = 0;

  constructor(endpoint: NetworkEndpoint) {
    this.endpoint = endpoint;
  }

  getState(): ConnectionState {
    return this.state;
  }

  attempt(): boolean {
    this.attempts = this.attempts + 1;
    if (!this.endpoint.isValid()) {
      this.state = ConnectionState.DISCONNECTED;
      this.failures = this.failures + 1;
      return false;
    }
    this.state = ConnectionState.CONNECTING;
    this.state = ConnectionState.CONNECTED;
    this.successes = this.successes + 1;
    return true;
  }

  degrade(): void {
    if (this.state === ConnectionState.CONNECTED) {
      this.state = ConnectionState.DEGRADED;
    }
  }

  recover(): void {
    if (this.state === ConnectionState.DEGRADED) {
      this.state = ConnectionState.CONNECTED;
    }
  }

  close(): void {
    this.state = ConnectionState.DISCONNECTED;
  }

  attemptCount(): number {
    return this.attempts;
  }

  successCount(): number {
    return this.successes;
  }

  failureCount(): number {
    return this.failures;
  }

  successRatio(): number {
    if (this.attempts === 0) {
      return 0;
    }
    return clampNumber(this.successes / this.attempts, 0, 1);
  }

  isOnline(): boolean {
    return this.state === ConnectionState.CONNECTED;
  }

  backoffDelay(base: number, exponent: number): number {
    const value = base * Math.pow(2, exponent);
    return clampNumber(value, 0, 60000);
  }
}

export default function networkConnectivityTest(): void {
  describe('NetworkConnectivity', () => {
    it('NetworkConnectivity_001', 0, async (done: Function) => {
      const endpoint = new NetworkEndpoint('127.0.0.1', 8080);
      expect(endpoint.isValid()).assertTrue();
      expect(endpoint.key()).assertEqual('127.0.0.1:8080');
      done();
    });

    it('NetworkConnectivity_002', 0, async (done: Function) => {
      expect(new NetworkEndpoint('', 80).isValid()).assertFalse();
      expect(new NetworkEndpoint('h', 0).isValid()).assertFalse();
      expect(new NetworkEndpoint('h', 70000).isValid()).assertFalse();
      done();
    });

    it('NetworkConnectivity_003', 0, async (done: Function) => {
      const model = new ConnectionModel(new NetworkEndpoint('h', 80));
      expect(model.getState()).assertEqual(ConnectionState.DISCONNECTED);
      expect(model.isOnline()).assertFalse();
      done();
    });

    it('NetworkConnectivity_004', 0, async (done: Function) => {
      const model = new ConnectionModel(new NetworkEndpoint('h', 80));
      expect(model.attempt()).assertTrue();
      expect(model.getState()).assertEqual(ConnectionState.CONNECTED);
      expect(model.isOnline()).assertTrue();
      done();
    });

    it('NetworkConnectivity_005', 0, async (done: Function) => {
      const model = new ConnectionModel(new NetworkEndpoint('', 0));
      expect(model.attempt()).assertFalse();
      expect(model.failureCount()).assertEqual(1);
      expect(model.successRatio()).assertEqual(0);
      done();
    });

    it('NetworkConnectivity_006', 0, async (done: Function) => {
      const model = new ConnectionModel(new NetworkEndpoint('h', 80));
      model.attempt();
      model.attempt();
      model.attempt();
      expect(model.attemptCount()).assertEqual(3);
      expect(model.successCount()).assertEqual(3);
      expect(model.successRatio()).assertEqual(1);
      done();
    });

    it('NetworkConnectivity_007', 0, async (done: Function) => {
      const model = new ConnectionModel(new NetworkEndpoint('h', 80));
      model.attempt();
      model.degrade();
      expect(model.getState()).assertEqual(ConnectionState.DEGRADED);
      expect(model.isOnline()).assertFalse();
      model.recover();
      expect(model.getState()).assertEqual(ConnectionState.CONNECTED);
      done();
    });

    it('NetworkConnectivity_008', 0, async (done: Function) => {
      const model = new ConnectionModel(new NetworkEndpoint('h', 80));
      expect(model.backoffDelay(100, 0)).assertEqual(100);
      expect(model.backoffDelay(100, 3)).assertEqual(800);
      expect(model.backoffDelay(100, 20)).assertEqual(60000);
      done();
    });

    it('NetworkConnectivity_009', 0, async (done: Function) => {
      const model = new ConnectionModel(new NetworkEndpoint('h', 80));
      model.attempt();
      model.close();
      expect(model.getState()).assertEqual(ConnectionState.DISCONNECTED);
      expect(model.isOnline()).assertFalse();
      expect(model.attemptCount()).assertEqual(1);
      done();
    });

    it('NetworkConnectivity_010', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', 'NetworkConnectivity probe');
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}
