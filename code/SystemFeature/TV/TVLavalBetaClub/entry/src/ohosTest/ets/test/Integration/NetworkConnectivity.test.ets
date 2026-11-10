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

const NET_WIFI: string = 'wifi';

const NET_CELLULAR: string = 'cellular';

const NET_ETHERNET: string = 'ethernet';

const NET_NONE: string = 'none';

const MIN_SIGNAL: number = 0;

const MAX_SIGNAL: number = 4;

const MAX_HISTORY: number = 20;

const RECONNECT_MAX_ATTEMPTS: number = 3;

interface NetworkStatus {
  online: boolean;
  type: string;
  signal: number;
  timestamp: number;
}

// Tracks connectivity status transitions
class ConnectivityMonitor {
  private status: NetworkStatus;
  private history: NetworkStatus[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
    this.status = {
      online: false,
      type: NET_NONE,
      signal: MIN_SIGNAL,
      timestamp: 0
    };
  }

  public update(online: boolean, type: string, signal: number, now: number): boolean {
    if (online && !ConnectivityMonitor.isTypeValid(type)) {
      return false;
    }
    if (signal < MIN_SIGNAL || signal > MAX_SIGNAL) {
      return false;
    }
    this.status = {
      online: online,
      type: online ? type : NET_NONE,
      signal: online ? signal : MIN_SIGNAL,
      timestamp: now
    };
    if (this.history.length >= this.capacity) {
      this.history.shift();
    }
    this.history.push(this.status);
    return true;
  }

  public static isTypeValid(type: string): boolean {
    return type === NET_WIFI || type === NET_CELLULAR || type === NET_ETHERNET;
  }

  public isOnline(): boolean {
    return this.status.online;
  }

  public getType(): string {
    return this.status.type;
  }

  public getSignal(): number {
    return this.status.signal;
  }

  public isWifi(): boolean {
    return this.status.online && this.status.type === NET_WIFI;
  }

  public isMetered(): boolean {
    return this.status.online && this.status.type === NET_CELLULAR;
  }

  public hasStrongSignal(threshold: number): boolean {
    return this.status.online && this.status.signal >= threshold;
  }

  public getHistory(): NetworkStatus[] {
    return [...this.history];
  }

  public transitionCount(): number {
    let count: number = 0;
    for (let i = 1; i < this.history.length; i++) {
      if (this.history[i].online !== this.history[i - 1].online) {
        count++;
      }
    }
    return count;
  }

  public reset(): void {
    this.history = [];
    this.status = { online: false, type: NET_NONE, signal: MIN_SIGNAL, timestamp: 0 };
  }
}

// Computes capped reconnect delays
class ReconnectPolicy {
  private attempts: number = 0;
  private readonly baseDelayMs: number;

  constructor(baseDelayMs: number) {
    this.baseDelayMs = baseDelayMs;
  }

  public onFailure(): boolean {
    this.attempts++;
    return this.attempts <= RECONNECT_MAX_ATTEMPTS;
  }

  public onSuccess(): void {
    this.attempts = 0;
  }

  public getAttempts(): number {
    return this.attempts;
  }

  public isExhausted(): boolean {
    return this.attempts > RECONNECT_MAX_ATTEMPTS;
  }

  public nextDelay(): number {
    if (this.attempts <= 0) {
      return 0;
    }
    return this.baseDelayMs * this.attempts;
  }

  public shouldFallbackToCache(): boolean {
    return this.isExhausted();
  }

  public reset(): void {
    this.attempts = 0;
  }
}

// Notifies listeners about connectivity changes
class ConnectivityObserver {
  private observers: Map<string, number> = new Map<string, number>();
  private notifications: number = 0;

  public subscribe(id: string): boolean {
    if (id.length === 0 || this.observers.has(id)) {
      return false;
    }
    this.observers.set(id, 0);
    return true;
  }

  public unsubscribe(id: string): boolean {
    return this.observers.delete(id);
  }

  public notify(online: boolean): number {
    let delivered: number = 0;
    this.observers.forEach((count: number, id: string) => {
      this.observers.set(id, count + 1);
      delivered++;
    });
    this.notifications++;
    return delivered;
  }

  public countOf(id: string): number {
    const count = this.observers.get(id);
    return count === undefined ? 0 : count;
  }

  public size(): number {
    return this.observers.size;
  }

  public getNotifications(): number {
    return this.notifications;
  }

  public reset(): void {
    this.observers = new Map<string, number>();
    this.notifications = 0;
  }
}

export default function networkConnectivityTest() {
  describe('NetworkConnectivity_Test', () => {

    it('monitor_should_start_offline', 0, () => {
      const monitor = new ConnectivityMonitor(MAX_HISTORY);
      expect(monitor.isOnline()).assertFalse();
      expect(monitor.getType()).assertEqual(NET_NONE);
      expect(monitor.getSignal()).assertEqual(MIN_SIGNAL);
      expect(monitor.isWifi()).assertFalse();
      expect(monitor.isMetered()).assertFalse();
    });

    it('monitor_should_update_wifi_status', 0, () => {
      const monitor = new ConnectivityMonitor(MAX_HISTORY);
      expect(monitor.update(true, NET_WIFI, 4, 1000)).assertTrue();
      expect(monitor.isOnline()).assertTrue();
      expect(monitor.isWifi()).assertTrue();
      expect(monitor.getSignal()).assertEqual(4);
      expect(monitor.hasStrongSignal(3)).assertTrue();
      expect(monitor.isMetered()).assertFalse();
    });

    it('monitor_should_update_cellular_status', 0, () => {
      const monitor = new ConnectivityMonitor(MAX_HISTORY);
      monitor.update(true, NET_CELLULAR, 2, 1000);
      expect(monitor.isMetered()).assertTrue();
      expect(monitor.isWifi()).assertFalse();
      expect(monitor.hasStrongSignal(3)).assertFalse();
      expect(monitor.hasStrongSignal(2)).assertTrue();
    });

    it('monitor_should_reject_invalid_updates', 0, () => {
      const monitor = new ConnectivityMonitor(MAX_HISTORY);
      expect(monitor.update(true, 'bluetooth', 4, 0)).assertFalse();
      expect(monitor.update(true, NET_WIFI, -1, 0)).assertFalse();
      expect(monitor.update(true, NET_WIFI, MAX_SIGNAL + 1, 0)).assertFalse();
      expect(monitor.isOnline()).assertFalse();
      expect(monitor.getHistory().length).assertEqual(0);
    });

    it('monitor_should_clear_details_when_offline', 0, () => {
      const monitor = new ConnectivityMonitor(MAX_HISTORY);
      monitor.update(true, NET_WIFI, 4, 1000);
      expect(monitor.update(false, NET_WIFI, 4, 2000)).assertTrue();
      expect(monitor.isOnline()).assertFalse();
      expect(monitor.getType()).assertEqual(NET_NONE);
      expect(monitor.getSignal()).assertEqual(MIN_SIGNAL);
      expect(monitor.isWifi()).assertFalse();
    });

    it('monitor_should_count_transitions', 0, () => {
      const monitor = new ConnectivityMonitor(MAX_HISTORY);
      monitor.update(true, NET_WIFI, 3, 1);
      monitor.update(true, NET_WIFI, 3, 2);
      monitor.update(false, NET_NONE, 0, 3);
      monitor.update(true, NET_CELLULAR, 2, 4);
      expect(monitor.getHistory().length).assertEqual(4);
      expect(monitor.transitionCount()).assertEqual(2);
      monitor.reset();
      expect(monitor.getHistory().length).assertEqual(0);
      expect(monitor.isOnline()).assertFalse();
    });

    it('monitor_should_bound_history', 0, () => {
      const monitor = new ConnectivityMonitor(2);
      monitor.update(true, NET_WIFI, 1, 1);
      monitor.update(false, NET_NONE, 0, 2);
      monitor.update(true, NET_WIFI, 2, 3);
      expect(monitor.getHistory().length).assertEqual(2);
      expect(monitor.getHistory()[0].timestamp).assertEqual(2);
      expect(monitor.getHistory()[1].timestamp).assertEqual(3);
    });

    it('reconnect_policy_should_bound_attempts', 0, () => {
      const policy = new ReconnectPolicy(500);
      expect(policy.onFailure()).assertTrue();
      expect(policy.onFailure()).assertTrue();
      expect(policy.onFailure()).assertTrue();
      expect(policy.isExhausted()).assertFalse();
      expect(policy.onFailure()).assertFalse();
      expect(policy.isExhausted()).assertTrue();
      expect(policy.shouldFallbackToCache()).assertTrue();
    });

    it('reconnect_policy_should_compute_delay', 0, () => {
      const policy = new ReconnectPolicy(500);
      expect(policy.nextDelay()).assertEqual(0);
      policy.onFailure();
      expect(policy.nextDelay()).assertEqual(500);
      policy.onFailure();
      expect(policy.nextDelay()).assertEqual(1000);
      policy.onSuccess();
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.nextDelay()).assertEqual(0);
    });

    it('observer_should_receive_connectivity_changes', 0, () => {
      const observer = new ConnectivityObserver();
      expect(observer.subscribe('listPage')).assertTrue();
      expect(observer.subscribe('listPage')).assertFalse();
      expect(observer.subscribe('')).assertFalse();
      observer.subscribe('detailPage');
      expect(observer.size()).assertEqual(2);
      expect(observer.notify(true)).assertEqual(2);
      expect(observer.countOf('listPage')).assertEqual(1);
      expect(observer.getNotifications()).assertEqual(1);
      expect(observer.unsubscribe('listPage')).assertTrue();
      expect(observer.notify(false)).assertEqual(1);
      observer.reset();
      expect(observer.getNotifications()).assertEqual(0);
      expect(observer.size()).assertEqual(0);
    });

    it('connectivity_flow_should_reconnect', 0, () => {
      const monitor = new ConnectivityMonitor(MAX_HISTORY);
      const policy = new ReconnectPolicy(300);
      const observer = new ConnectivityObserver();
      observer.subscribe('network');
      monitor.update(false, NET_NONE, 0, 1);
      observer.notify(false);
      expect(policy.onFailure()).assertTrue();
      expect(policy.nextDelay()).assertEqual(300);
      monitor.update(true, NET_WIFI, 3, 2);
      observer.notify(true);
      policy.onSuccess();
      expect(monitor.isOnline()).assertTrue();
      expect(policy.getAttempts()).assertEqual(0);
      expect(observer.countOf('network')).assertEqual(2);
    });

    it('connectivity_constants_should_be_stable', 0, () => {
      expect(NET_WIFI).assertEqual('wifi');
      expect(NET_CELLULAR).assertEqual('cellular');
      expect(NET_ETHERNET).assertEqual('ethernet');
      expect(NET_NONE).assertEqual('none');
      expect(MIN_SIGNAL).assertEqual(0);
      expect(MAX_SIGNAL).assertEqual(4);
      expect(RECONNECT_MAX_ATTEMPTS).assertEqual(3);
    });
  });
}

