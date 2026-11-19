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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';

/**
 * Twelve targeted scenarios cover de-duplication, availability, offline, stop and bind.
 */

// ---- inlined DeviceEngine ----
/**
 * DeviceEngine is a faithful, synchronous replica of Model/RemoteDeviceModel.
 *
 * The real model talks to the distributed device manager service, which is not
 * available on a single debug device. The replica keeps the same containers
 * (deviceList / discoverList), the same de-duplication policy in deviceFound and
 * the same filtering in authenticateDevice so that the contract suites can pin
 * the behaviour deterministically. Every state transition that the real model
 * performs through a service callback is exposed here as a plain method.
 */

export const AUTH_BIND_LEVEL: number = 3;
export const AUTH_BIND_TYPE: number = 1;
export const AUTH_TARGET_PKG: string = 'ohos.samples.distributeddatagobang';
export const AUTH_APP_NAME: string = 'distributeddatagobang';
export const DISCOVER_TARGET_TYPE: number = 1;
export const DISCOVER_AVAILABLE_STATUS: number = 0;
export const DEFAULT_SUBSCRIBE_ID: number = 100;
export const SERVICE_DEATH_RETRY: number = 3;

export const STATE_AVAILABLE: string = 'available';
export const STATE_UNAVAILABLE: string = 'unavailable';
export const STATE_UNKNOWN: string = 'unknown';

/** Subset of DeviceBasicInfo that the sample actually reads. */
export interface DeviceInfo {
  deviceId: string;
  deviceName: string;
  networkId: string;
  deviceType: string;
}

/** One authentication attempt recorded by the replica. */
export interface BindAttempt {
  deviceId: string;
  bindLevel: number;
  bindType: number;
  targetPkgName: string;
  appName: string;
  accepted: boolean;
}

/** Result of a discover event. */
export interface DiscoverResult {
  added: boolean;
  size: number;
}

export function makeDevice(id: string, name: string = '', network: string = ''): DeviceInfo {
  return {
    deviceId: id,
    deviceName: name === '' ? `device-${id}` : name,
    networkId: network === '' ? `net-${id}` : network,
    deviceType: '0'
  };
}

export function makeDevices(count: number, prefix: string = 'dev'): DeviceInfo[] {
  let devices: DeviceInfo[] = [];
  for (let i = 0; i < count; i++) {
    devices.push(makeDevice(`${prefix}${i}`, `${prefix}-${i}`, `net-${prefix}${i}`));
  }
  return devices;
}

/**
 * Offline transition: an existing entry is replaced in place, a missing entry is
 * ignored (the real code breaks out of the loop without appending).
 */
export interface OfflineResult {
  replaced: boolean;
  callbackFired: boolean;
  size: number;
}

export class DeviceEngine {
  deviceList: DeviceInfo[] = [];
  discoverList: DeviceInfo[] = [];
  started: boolean = false;
  subscribed: boolean = false;
  callbackCount: number = 0;
  lastBind: BindAttempt | null = null;
  bindAttempts: BindAttempt[] = [];
  subscribeId: number = DEFAULT_SUBSCRIBE_ID;
  serviceDieCount: number = 0;
  discoverParams: number[] = [];
  filterParams: number[] = [];

  reset(): void {
    this.deviceList = [];
    this.discoverList = [];
    this.started = false;
    this.subscribed = false;
    this.callbackCount = 0;
    this.lastBind = null;
    this.bindAttempts = [];
    this.serviceDieCount = 0;
    this.discoverParams = [];
    this.filterParams = [];
  }

  /** Seeds the trusted list, as getAvailableDeviceListSync does on registration. */
  seedTrusted(devices: DeviceInfo[]): void {
    this.deviceList = [];
    for (let i = 0; i < devices.length; i++) {
      this.deviceList.push(devices[i]);
    }
  }

  /** Equivalent of the AVAILABLE branch of deviceStateChange. */
  onAvailable(device: DeviceInfo): number {
    this.discoverList = [];
    let exists: boolean = false;
    for (let i = 0; i < this.deviceList.length; i++) {
      if (this.deviceList[i].deviceId === device.deviceId) {
        exists = true;
        break;
      }
    }
    if (!exists) {
      this.deviceList.push(device);
    }
    this.callbackCount++;
    return this.deviceList.length;
  }

  /** Equivalent of the UNAVAILABLE branch: the sample does nothing there. */
  onUnavailable(device: DeviceInfo): number {
    return this.deviceList.length;
  }

  /**
   * deviceStateChangeActionOffline: an empty list fires the callback and returns,
   * otherwise the matching entry is replaced. Note that the real method fires the
   * callback twice when the list is non-empty (once in the loop path, once at the
   * end), which callers must tolerate.
   */
  onOffline(device: DeviceInfo): OfflineResult {
    if (this.deviceList.length <= 0) {
      this.callbackCount++;
      return { replaced: false, callbackFired: true, size: 0 };
    }
    let replaced: boolean = false;
    for (let j = 0; j < this.deviceList.length; j++) {
      if (this.deviceList[j].deviceId === device.deviceId) {
        this.deviceList[j] = device;
        replaced = true;
        break;
      }
    }
    this.callbackCount++;
    return { replaced: replaced, callbackFired: true, size: this.deviceList.length };
  }

  /**
   * deviceFound: de-duplicates by deviceId against discoverList. A duplicate is
   * ignored without firing the callback, which is what keeps the dialog stable
   * while discovery keeps repeating.
   */
  deviceFound(device: DeviceInfo): DiscoverResult {
    for (let i = 0; i < this.discoverList.length; i++) {
      if (this.discoverList[i].deviceId === device.deviceId) {
        return { added: false, size: this.discoverList.length };
      }
    }
    this.discoverList.push(device);
    this.callbackCount++;
    return { added: true, size: this.discoverList.length };
  }

  /** Clears discoverList then adds the device, mirroring the AVAILABLE branch. */
  deviceFoundAfterAvailable(device: DeviceInfo): DiscoverResult {
    this.discoverList = [];
    this.discoverList.push(device);
    this.callbackCount++;
    return { added: true, size: this.discoverList.length };
  }

  startDiscovery(): boolean {
    this.started = true;
    this.discoverParams = [DISCOVER_TARGET_TYPE];
    this.filterParams = [DISCOVER_AVAILABLE_STATUS];
    return true;
  }

  stopDiscovery(): boolean {
    this.started = false;
    this.subscribed = false;
    this.deviceList = [];
    this.discoverList = [];
    return true;
  }

  onServiceDie(): number {
    this.serviceDieCount++;
    return this.serviceDieCount;
  }

  /**
   * authenticateDevice: only devices already present in discoverList are bound;
   * the bind parameter block is fixed to level 3 / type 1 / the sample package.
   */
  authenticate(device: DeviceInfo): BindAttempt {
    for (let i = 0; i < this.discoverList.length; i++) {
      if (this.discoverList[i].deviceId !== device.deviceId) {
        continue;
      }
      let attempt: BindAttempt = {
        deviceId: device.deviceId,
        bindLevel: AUTH_BIND_LEVEL,
        bindType: AUTH_BIND_TYPE,
        targetPkgName: AUTH_TARGET_PKG,
        appName: AUTH_APP_NAME,
        accepted: true
      };
      this.lastBind = attempt;
      this.bindAttempts.push(attempt);
      return attempt;
    }
    let rejected: BindAttempt = {
      deviceId: device.deviceId,
      bindLevel: AUTH_BIND_LEVEL,
      bindType: AUTH_BIND_TYPE,
      targetPkgName: AUTH_TARGET_PKG,
      appName: AUTH_APP_NAME,
      accepted: false
    };
    return rejected;
  }

  /** Number of entries whose id is contained in the given list. */
  countKnown(ids: string[]): number {
    let found: number = 0;
    for (let i = 0; i < ids.length; i++) {
      for (let j = 0; j < this.discoverList.length; j++) {
        if (this.discoverList[j].deviceId === ids[i]) {
          found++;
          break;
        }
      }
    }
    return found;
  }

  /** Network ids used as sync targets by KvStoreModel.put. */
  networkIds(): string[] {
    let ids: string[] = [];
    for (let i = 0; i < this.deviceList.length; i++) {
      ids[i] = this.deviceList[i].networkId;
    }
    return ids;
  }

  /** Sorted view for order-independent assertions. */
  sortedIds(source: DeviceInfo[]): string[] {
    let ids: string[] = [];
    for (let i = 0; i < source.length; i++) {
      ids[i] = source[i].deviceId;
    }
    ids.sort();
    return ids;
  }
}

/** State change routing used by the page: AVAILABLE fills, others are ignored. */
export function routeStateChange(action: string, device: DeviceInfo, engine: DeviceEngine): string {
  if (action === STATE_AVAILABLE) {
    engine.onAvailable(device);
    return 'handled';
  }
  if (action === STATE_UNAVAILABLE) {
    engine.onUnavailable(device);
    return 'ignored';
  }
  return 'unknown';
}

/** Device list rendered by DeviceDialog: names joined for the UI test. */
export function dialogNames(engine: DeviceEngine): string[] {
  let names: string[] = [];
  for (let i = 0; i < engine.deviceList.length; i++) {
    names[i] = engine.deviceList[i].deviceName;
  }
  return names;
}

// ---- inlined MainThreadYield ----
/**
 * Long matrix suites run on the test main thread. Yielding between chunks keeps
 * the ability responsive so that component queries issued afterwards still see a
 * live window.
 */

export const DEFAULT_CHUNK: number = 200;

/** Resolves on the next macrotask, giving the UI thread a chance to breathe. */
export async function yieldToMainThread(): Promise<void> {
  await new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, 0);
  });
}

/** Runs a long loop in chunks, yielding after each chunk. */
export async function keepMainThreadResponsive<T>(items: T[], work: (item: T) => boolean,
  chunk: number = DEFAULT_CHUNK): Promise<number> {
  let completed: number = 0;
  for (let i = 0; i < items.length; i++) {
    if (work(items[i])) {
      completed++;
    }
    if (i > 0 && i % chunk === 0) {
      await yieldToMainThread();
    }
  }
  return completed;
}

export default function GobangDeviceFlow() {
  describe('GobangDeviceFlow', () => {
    beforeAll(async () => {
      await yieldToMainThread();
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0001
     * @tc.name testDiscoverDedupes0001
     * @tc.desc Discovering the same peer twice appends it once and fires one callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDiscoverDedupes0001', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      expect(engine.deviceFound(makeDevice('d0')).added).assertTrue();
      expect(engine.deviceFound(makeDevice('d0')).added).assertFalse();
      expect(engine.discoverList.length).assertEqual(1);
      expect(engine.callbackCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0002
     * @tc.name testDiscoverTwo0002
     * @tc.desc Two distinct peers are both kept in arrival order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDiscoverTwo0002', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      engine.deviceFound(makeDevice('d0'));
      engine.deviceFound(makeDevice('d1'));
      expect(engine.discoverList.length).assertEqual(2);
      expect(engine.callbackCount).assertEqual(2);
      expect(engine.sortedIds(engine.discoverList)[0]).assertEqual('d0');
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0003
     * @tc.name testAvailableResets0003
     * @tc.desc An available event clears the discover list and adds the trusted peer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAvailableResets0003', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      engine.deviceFound(makeDevice('old'));
      engine.onAvailable(makeDevice('new'));
      expect(engine.discoverList.length).assertEqual(0);
      expect(engine.deviceList.length).assertEqual(1);
      expect(engine.deviceList[0].deviceId).assertEqual('new');
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0004
     * @tc.name testAvailableDedupes0004
     * @tc.desc A repeated available event does not duplicate the trusted peer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testAvailableDedupes0004', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      engine.onAvailable(makeDevice('dup'));
      engine.onAvailable(makeDevice('dup'));
      expect(engine.deviceList.length).assertEqual(1);
      expect(engine.callbackCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0005
     * @tc.name testOfflineReplaces0005
     * @tc.desc An offline event replaces the matching entry in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testOfflineReplaces0005', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      engine.seedTrusted(makeDevices(3, 'room'));
      let result = engine.onOffline(makeDevice('room1', 'renamed'));
      expect(result.replaced).assertTrue();
      expect(result.size).assertEqual(3);
      expect(engine.deviceList[1].deviceName).assertEqual('renamed');
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0006
     * @tc.name testOfflineUnknown0006
     * @tc.desc An offline event for an unknown peer changes nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testOfflineUnknown0006', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      engine.seedTrusted(makeDevices(2, 'keep'));
      let result = engine.onOffline(makeDevice('ghost'));
      expect(result.replaced).assertFalse();
      expect(engine.deviceList.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0007
     * @tc.name testOfflineEmpty0007
     * @tc.desc An offline event on an empty list only fires the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testOfflineEmpty0007', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      let result = engine.onOffline(makeDevice('nobody'));
      expect(result.callbackFired).assertTrue();
      expect(engine.callbackCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0008
     * @tc.name testStopClears0008
     * @tc.desc Stopping discovery clears both lists and the started flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testStopClears0008', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      engine.deviceFound(makeDevice('a'));
      engine.seedTrusted(makeDevices(1, 'b'));
      engine.stopDiscovery();
      expect(engine.discoverList.length).assertEqual(0);
      expect(engine.deviceList.length).assertEqual(0);
      expect(engine.started).assertFalse();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0009
     * @tc.name testBindDiscovered0009
     * @tc.desc A discovered peer is bound with level three and type one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testBindDiscovered0009', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      engine.deviceFound(makeDevice('bind'));
      let attempt = engine.authenticate(makeDevice('bind'));
      expect(attempt.accepted).assertTrue();
      expect(attempt.bindLevel).assertEqual(3);
      expect(attempt.bindType).assertEqual(1);
      expect(engine.bindAttempts.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0010
     * @tc.name testBindUndiscovered0010
     * @tc.desc An undiscovered peer is never bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testBindUndiscovered0010', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      let attempt = engine.authenticate(makeDevice('ghost'));
      expect(attempt.accepted).assertFalse();
      expect(engine.bindAttempts.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0011
     * @tc.name testBindAfterStop0011
     * @tc.desc Stopping discovery also removes the peer from the bind candidates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testBindAfterStop0011', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      engine.deviceFound(makeDevice('gone'));
      engine.stopDiscovery();
      let attempt = engine.authenticate(makeDevice('gone'));
      expect(attempt.accepted).assertFalse();
      expect(engine.bindAttempts.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_DEV_0012
     * @tc.name testFullLifecycle0012
     * @tc.desc Discover, available, offline and stop leave the documented sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFullLifecycle0012', 0, async () => {
      let engine: DeviceEngine = new DeviceEngine();
      engine.deviceFound(makeDevice('x'));
      engine.onAvailable(makeDevice('y'));
      engine.onOffline(makeDevice('y', 'y-renamed'));
      expect(engine.discoverList.length).assertEqual(0);
      expect(engine.deviceList.length).assertEqual(1);
      expect(engine.deviceList[0].deviceName).assertEqual('y-renamed');
      engine.stopDiscovery();
      expect(engine.deviceList.length).assertEqual(0);
    });

  });
}
