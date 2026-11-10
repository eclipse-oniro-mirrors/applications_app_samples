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

import { DataValidator } from '../utils/DataValidator';
import { DataStoreConstants } from '../constants/DataStoreConstants';
import { DeviceInfo, SyncStatus, ConflictRecord, ConflictPolicy, SyncMode } from '../models/DataModels';
import { Logger } from '../utils/Logger';

const MAX_DEVICES: number = 32;
const MAX_CONFLICTS: number = 100;

/**
 * DistributedDataManager provides distributed CRUD operations, device
 * management, sync control, and conflict resolution utilities.
 */
export class DistributedDataManager {
  private localData: string[] = [];
  private localKeys: string[] = [];
  private localDataCount: number = 0;
  private devices: DeviceInfo[] = [];
  private deviceCount: number = 0;
  private conflicts: ConflictRecord[] = [];
  private conflictCount: number = 0;
  private syncMode: SyncMode = SyncMode.MANUAL;
  private conflictPolicy: ConflictPolicy = ConflictPolicy.LOCAL_FIRST;
  private isSyncing: boolean = false;
  private lastSyncTime: number = 0;
  private syncCount: number = 0;
  private insertCount: number = 0;
  private updateCount: number = 0;
  private deleteCount: number = 0;
  private queryCount: number = 0;
  private createdAt: number = 0;

  constructor() {
  }

  initialize(): string {
    this.localData = [];
    this.localKeys = [];
    this.localDataCount = 0;
    this.devices = [];
    this.deviceCount = 0;
    this.conflicts = [];
    this.conflictCount = 0;
    this.syncMode = SyncMode.MANUAL;
    this.conflictPolicy = ConflictPolicy.LOCAL_FIRST;
    this.isSyncing = false;
    this.lastSyncTime = 0;
    this.syncCount = 0;
    this.insertCount = 0;
    this.updateCount = 0;
    this.deleteCount = 0;
    this.queryCount = 0;
    this.createdAt = Date.now();
    return 'Distributed data manager initialized';
  }

  put(key: string, value: string): string {
    if (!DataValidator.isValidKey(key)) {
      return 'put failed: invalid key';
    }
    if (!DataValidator.isValidValue(value)) {
      return 'put failed: invalid value';
    }
    const existIdx = this.findLocalKeyIndex(key);
    if (existIdx >= 0) {
      const newData: string[] = [];
      for (let i = 0; i < this.localDataCount; i++) {
        if (i === existIdx) {
          newData.push(value);
        } else {
          newData.push(this.localData[i]);
        }
      }
      this.localData = newData;
      this.updateCount++;
      return `put updated: ${key}=${value}`;
    }
    const newKeys: string[] = [];
    const newValues: string[] = [];
    for (let i = 0; i < this.localDataCount; i++) {
      newKeys.push(this.localKeys[i]);
      newValues.push(this.localData[i]);
    }
    newKeys.push(key);
    newValues.push(value);
    this.localKeys = newKeys;
    this.localData = newValues;
    this.localDataCount++;
    this.insertCount++;
    return `put inserted: ${key}=${value}`;
  }

  get(key: string): string {
    if (!DataValidator.isValidKey(key)) {
      return 'get failed: invalid key';
    }
    const idx = this.findLocalKeyIndex(key);
    if (idx < 0) {
      return `get: key '${key}' not found`;
    }
    this.queryCount++;
    return `get('${key}'): ${this.localData[idx]}`;
  }

  delete(key: string): string {
    if (!DataValidator.isValidKey(key)) {
      return 'delete failed: invalid key';
    }
    const idx = this.findLocalKeyIndex(key);
    if (idx < 0) {
      return `delete: key '${key}' not found`;
    }
    const newKeys: string[] = [];
    const newValues: string[] = [];
    for (let i = 0; i < this.localDataCount; i++) {
      if (i !== idx) {
        newKeys.push(this.localKeys[i]);
        newValues.push(this.localData[i]);
      }
    }
    this.localKeys = newKeys;
    this.localData = newValues;
    this.localDataCount--;
    this.deleteCount++;
    return `delete completed: '${key}'`;
  }

  has(key: string): boolean {
    if (!DataValidator.isValidKey(key)) {
      return false;
    }
    return this.findLocalKeyIndex(key) >= 0;
  }

  getAllKeys(): string {
    this.queryCount++;
    return `Keys: [${this.localKeys.join(', ')}] (${this.localDataCount} entries)`;
  }

  registerDevice(deviceId: string, deviceName: string, deviceType: string): string {
    if (!DataValidator.isValidDeviceId(deviceId)) {
      return 'registerDevice failed: invalid device ID';
    }
    if (this.deviceCount >= MAX_DEVICES) {
      return `registerDevice failed: max devices reached (${MAX_DEVICES})`;
    }
    const existIdx = this.findDeviceIndex(deviceId);
    if (existIdx >= 0) {
      return `registerDevice failed: device '${deviceId}' already registered`;
    }
    const syncStatus: SyncStatus = {
      lastSyncTime: 0,
      pendingChanges: 0,
      syncedDevices: 0,
      totalDevices: this.deviceCount + 1,
      isSyncing: false,
      lastError: ''
    };
    const device: DeviceInfo = {
      deviceId: deviceId,
      deviceName: deviceName,
      deviceType: deviceType,
      isConnected: true,
      lastSeen: Date.now(),
      syncStatus: syncStatus
    };
    const newDevices: DeviceInfo[] = [];
    for (let i = 0; i < this.deviceCount; i++) {
      newDevices.push(this.devices[i]);
    }
    newDevices.push(device);
    this.devices = newDevices;
    this.deviceCount++;
    return `registerDevice completed: ${deviceId} (${deviceName}, ${deviceType})`;
  }

  unregisterDevice(deviceId: string): string {
    if (!DataValidator.isValidDeviceId(deviceId)) {
      return 'unregisterDevice failed: invalid device ID';
    }
    const idx = this.findDeviceIndex(deviceId);
    if (idx < 0) {
      return `unregisterDevice failed: device '${deviceId}' not found`;
    }
    const newDevices: DeviceInfo[] = [];
    for (let i = 0; i < this.deviceCount; i++) {
      if (i !== idx) {
        newDevices.push(this.devices[i]);
      }
    }
    this.devices = newDevices;
    this.deviceCount--;
    return `unregisterDevice completed: '${deviceId}'`;
  }

  listDevices(): string {
    if (this.deviceCount === 0) {
      return 'listDevices: no devices registered';
    }
    const result: string[] = [];
    for (let i = 0; i < this.deviceCount; i++) {
      const d = this.devices[i];
      result.push(`${d.deviceId}:${d.deviceName}:${d.deviceType}:${d.isConnected}`);
    }
    return `Devices: [${result.join(', ')}] (${this.deviceCount} devices)`;
  }

  getDeviceInfo(deviceId: string): string {
    const idx = this.findDeviceIndex(deviceId);
    if (idx < 0) {
      return `getDeviceInfo: device '${deviceId}' not found`;
    }
    const d = this.devices[idx];
    return `DeviceInfo: id=${d.deviceId}, name=${d.deviceName}, type=${d.deviceType}, ` +
      `connected=${d.isConnected}, lastSeen=${d.lastSeen}`;
  }

  setDeviceConnected(deviceId: string, connected: boolean): string {
    const idx = this.findDeviceIndex(deviceId);
    if (idx < 0) {
      return `setDeviceConnected failed: device '${deviceId}' not found`;
    }
    const newDevices: DeviceInfo[] = [];
    for (let i = 0; i < this.deviceCount; i++) {
      if (i === idx) {
        const updated: DeviceInfo = {
          deviceId: this.devices[i].deviceId,
          deviceName: this.devices[i].deviceName,
          deviceType: this.devices[i].deviceType,
          isConnected: connected,
          lastSeen: Date.now(),
          syncStatus: this.devices[i].syncStatus
        };
        newDevices.push(updated);
      } else {
        newDevices.push(this.devices[i]);
      }
    }
    this.devices = newDevices;
    return `setDeviceConnected: ${deviceId} = ${connected}`;
  }

  async sync(): Promise<string> {
    if (this.isSyncing) {
      return 'sync failed: sync already in progress';
    }
    if (this.deviceCount === 0) {
      return 'sync failed: no devices to sync with';
    }
    this.isSyncing = true;
    this.syncCount++;
    let syncedCount = 0;
    for (let i = 0; i < this.deviceCount; i++) {
      if (this.devices[i].isConnected) {
        syncedCount++;
      }
    }
    this.lastSyncTime = Date.now();
    this.isSyncing = false;
    return `sync completed: ${syncedCount}/${this.deviceCount} devices synced at ${this.lastSyncTime}`;
  }

  syncStatus(): string {
    return `SyncStatus: mode=${this.syncMode}, syncing=${this.isSyncing}, ` +
      `lastSync=${this.lastSyncTime}, syncCount=${this.syncCount}, ` +
      `devices=${this.deviceCount}`;
  }

  setSyncMode(mode: SyncMode): string {
    if (!DataValidator.isValidSyncMode(mode)) {
      return `setSyncMode failed: invalid mode '${mode}'`;
    }
    this.syncMode = mode;
    return `setSyncMode: ${mode}`;
  }

  getSyncMode(): SyncMode {
    return this.syncMode;
  }

  setConflictPolicy(policy: ConflictPolicy): string {
    if (!DataValidator.isValidConflictPolicy(policy)) {
      return `setConflictPolicy failed: invalid policy '${policy}'`;
    }
    this.conflictPolicy = policy;
    return `setConflictPolicy: ${policy}`;
  }

  getConflictPolicy(): ConflictPolicy {
    return this.conflictPolicy;
  }

  resolveConflict(key: string, resolution: ConflictPolicy): string {
    const idx = this.findConflictIndex(key);
    if (idx < 0) {
      return `resolveConflict failed: no conflict for key '${key}'`;
    }
    const newConflicts: ConflictRecord[] = [];
    for (let i = 0; i < this.conflictCount; i++) {
      if (i === idx) {
        const resolved: ConflictRecord = {
          key: this.conflicts[i].key,
          localValue: this.conflicts[i].localValue,
          remoteValue: this.conflicts[i].remoteValue,
          localTimestamp: this.conflicts[i].localTimestamp,
          remoteTimestamp: this.conflicts[i].remoteTimestamp,
          deviceId: this.conflicts[i].deviceId,
          resolved: true,
          resolution: resolution
        };
        newConflicts.push(resolved);
      } else {
        newConflicts.push(this.conflicts[i]);
      }
    }
    this.conflicts = newConflicts;
    return `resolveConflict: '${key}' resolved with ${resolution}`;
  }

  getConflicts(): string {
    if (this.conflictCount === 0) {
      return 'getConflicts: no conflicts';
    }
    const result: string[] = [];
    for (let i = 0; i < this.conflictCount; i++) {
      const c = this.conflicts[i];
      const status = c.resolved ? 'RESOLVED' : 'PENDING';
      result.push(`${c.key}:${c.localValue}vs${c.remoteValue}:${status}`);
    }
    return `Conflicts: [${result.join(', ')}] (${this.conflictCount} total)`;
  }

  getUnresolvedConflicts(): string {
    const result: string[] = [];
    for (let i = 0; i < this.conflictCount; i++) {
      if (!this.conflicts[i].resolved) {
        const c = this.conflicts[i];
        result.push(`${c.key}:${c.localValue}vs${c.remoteValue}`);
      }
    }
    return `Unresolved: [${result.join(', ')}] (${result.length} pending)`;
  }

  getConnectedDevices(): number {
    let count = 0;
    for (let i = 0; i < this.deviceCount; i++) {
      if (this.devices[i].isConnected) {
        count++;
      }
    }
    return count;
  }

  getStatistics(): string {
    return `Distributed Statistics: dataCount=${this.localDataCount}, devices=${this.deviceCount}, ` +
      `conflicts=${this.conflictCount}, syncs=${this.syncCount}, inserts=${this.insertCount}, ` +
      `updates=${this.updateCount}, deletes=${this.deleteCount}, queries=${this.queryCount}, ` +
      `syncMode=${this.syncMode}, policy=${this.conflictPolicy}`;
  }

  resetStatistics(): string {
    this.syncCount = 0;
    this.insertCount = 0;
    this.updateCount = 0;
    this.deleteCount = 0;
    this.queryCount = 0;
    return 'Distributed statistics reset';
  }

  isInitialized(): boolean {
    return this.createdAt > 0;
  }

  release(): void {
    this.localData = [];
    this.localKeys = [];
    this.localDataCount = 0;
    this.devices = [];
    this.deviceCount = 0;
    this.conflicts = [];
    this.conflictCount = 0;
    this.syncMode = SyncMode.MANUAL;
    this.conflictPolicy = ConflictPolicy.LOCAL_FIRST;
    this.isSyncing = false;
    this.lastSyncTime = 0;
    this.syncCount = 0;
    this.insertCount = 0;
    this.updateCount = 0;
    this.deleteCount = 0;
    this.queryCount = 0;
    this.createdAt = 0;
    Logger.info('DistributedDataManager released');
  }

  private findLocalKeyIndex(key: string): number {
    for (let i = 0; i < this.localDataCount; i++) {
      if (this.localKeys[i] === key) {
        return i;
      }
    }
    return -1;
  }

  private findDeviceIndex(deviceId: string): number {
    for (let i = 0; i < this.deviceCount; i++) {
      if (this.devices[i].deviceId === deviceId) {
        return i;
      }
    }
    return -1;
  }

  private findConflictIndex(key: string): number {
    for (let i = 0; i < this.conflictCount; i++) {
      if (this.conflicts[i].key === key) {
        return i;
      }
    }
    return -1;
  }
}
