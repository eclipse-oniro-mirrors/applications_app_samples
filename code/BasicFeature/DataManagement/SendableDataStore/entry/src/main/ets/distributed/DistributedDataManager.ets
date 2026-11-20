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
import { ResultText } from '../utils/ResultText';

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
  private lastWriteTime: number = 0;
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
    this.lastWriteTime = 0;
    this.syncCount = 0;
    this.insertCount = 0;
    this.updateCount = 0;
    this.deleteCount = 0;
    this.queryCount = 0;
    this.createdAt = Date.now();
    return ResultText.of($r('app.string.result_distributed_initialized'), 'Distributed data manager initialized');
  }

  put(key: string, value: string): string {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_distributed_put_invalid_key'), 'put failed: invalid key');
    }
    if (!DataValidator.isValidValue(value)) {
      return ResultText.of($r('app.string.result_distributed_put_invalid_value'), 'put failed: invalid value');
    }
    const existIdx: number = this.findLocalKeyIndex(key);
    if (existIdx >= 0) {
      const newData: string[] = [];
      for (let i: number = 0; i < this.localDataCount; i++) {
        if (i === existIdx) {
          newData.push(value);
        } else {
          newData.push(this.localData[i]);
        }
      }
      this.localData = newData;
      this.updateCount++;
      this.lastWriteTime = Date.now();
      return ResultText.ofArgs($r('app.string.result_distributed_put_updated'), [key, value],
        `put updated: ${key}=${value}`);
    }
    const newKeys: string[] = [];
    const newValues: string[] = [];
    for (let i: number = 0; i < this.localDataCount; i++) {
      newKeys.push(this.localKeys[i]);
      newValues.push(this.localData[i]);
    }
    newKeys.push(key);
    newValues.push(value);
    this.localKeys = newKeys;
    this.localData = newValues;
    this.localDataCount++;
    this.insertCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_distributed_put_inserted'), [key, value],
      `put inserted: ${key}=${value}`);
  }

  get(key: string): string {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_distributed_get_invalid_key'), 'get failed: invalid key');
    }
    const idx: number = this.findLocalKeyIndex(key);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_distributed_get_not_found'), [key],
        `get: key '${key}' not found`);
    }
    this.queryCount++;
    return ResultText.ofArgs($r('app.string.result_distributed_get_value'), [key, this.localData[idx]],
      `get('${key}'): ${this.localData[idx]}`);
  }

  delete(key: string): string {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_distributed_delete_invalid_key'), 'delete failed: invalid key');
    }
    const idx: number = this.findLocalKeyIndex(key);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_distributed_delete_not_found'), [key],
        `delete: key '${key}' not found`);
    }
    const newKeys: string[] = [];
    const newValues: string[] = [];
    for (let i: number = 0; i < this.localDataCount; i++) {
      if (i !== idx) {
        newKeys.push(this.localKeys[i]);
        newValues.push(this.localData[i]);
      }
    }
    this.localKeys = newKeys;
    this.localData = newValues;
    this.localDataCount--;
    this.deleteCount++;
    return ResultText.ofArgs($r('app.string.result_distributed_delete_completed'), [key],
      `delete completed: '${key}'`);
  }

  has(key: string): boolean {
    if (!DataValidator.isValidKey(key)) {
      return false;
    }
    return this.findLocalKeyIndex(key) >= 0;
  }

  getAllKeys(): string {
    this.queryCount++;
    return ResultText.ofArgs($r('app.string.result_distributed_keys'), [this.localKeys.join(', '), this.localDataCount],
      `Keys: [${this.localKeys.join(', ')}] (${this.localDataCount} entries)`);
  }

  registerDevice(deviceId: string, deviceName: string, deviceType: string): string {
    if (!DataValidator.isValidDeviceId(deviceId)) {
      return ResultText.of($r('app.string.result_distributed_register_invalid_id'),
        'registerDevice failed: invalid device ID');
    }
    if (this.deviceCount >= MAX_DEVICES) {
      return ResultText.ofArgs($r('app.string.result_distributed_register_max_reached'), [MAX_DEVICES],
        `registerDevice failed: max devices reached (${MAX_DEVICES})`);
    }
    const existIdx: number = this.findDeviceIndex(deviceId);
    if (existIdx >= 0) {
      return ResultText.ofArgs($r('app.string.result_distributed_register_exists'), [deviceId],
        `registerDevice failed: device '${deviceId}' already registered`);
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
    for (let i: number = 0; i < this.deviceCount; i++) {
      newDevices.push(this.devices[i]);
    }
    newDevices.push(device);
    this.devices = newDevices;
    this.deviceCount++;
    return ResultText.ofArgs($r('app.string.result_distributed_register_completed'), [deviceId, deviceName, deviceType],
      `registerDevice completed: ${deviceId} (${deviceName}, ${deviceType})`);
  }

  unregisterDevice(deviceId: string): string {
    if (!DataValidator.isValidDeviceId(deviceId)) {
      return ResultText.of($r('app.string.result_distributed_unregister_invalid_id'),
        'unregisterDevice failed: invalid device ID');
    }
    const idx: number = this.findDeviceIndex(deviceId);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_distributed_unregister_not_found'), [deviceId],
        `unregisterDevice failed: device '${deviceId}' not found`);
    }
    const newDevices: DeviceInfo[] = [];
    for (let i: number = 0; i < this.deviceCount; i++) {
      if (i !== idx) {
        newDevices.push(this.devices[i]);
      }
    }
    this.devices = newDevices;
    this.deviceCount--;
    return ResultText.ofArgs($r('app.string.result_distributed_unregister_completed'), [deviceId],
      `unregisterDevice completed: '${deviceId}'`);
  }

  listDevices(): string {
    if (this.deviceCount === 0) {
      return ResultText.of($r('app.string.result_distributed_list_devices_empty'),
        'listDevices: no devices registered');
    }
    const result: string[] = [];
    for (let i: number = 0; i < this.deviceCount; i++) {
      const d: DeviceInfo = this.devices[i];
      result.push(`${d.deviceId}:${d.deviceName}:${d.deviceType}:${d.isConnected}`);
    }
    return ResultText.ofArgs($r('app.string.result_distributed_list_devices'), [result.join(', '), this.deviceCount],
      `Devices: [${result.join(', ')}] (${this.deviceCount} devices)`);
  }

  getDeviceInfo(deviceId: string): string {
    const idx: number = this.findDeviceIndex(deviceId);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_distributed_device_info_not_found'), [deviceId],
        `getDeviceInfo: device '${deviceId}' not found`);
    }
    const d: DeviceInfo = this.devices[idx];
    return ResultText.ofArgs($r('app.string.result_distributed_device_info'),
      [d.deviceId, d.deviceName, d.deviceType, String(d.isConnected), d.lastSeen],
      `DeviceInfo: id=${d.deviceId}, name=${d.deviceName}, type=${d.deviceType}, ` +
        `connected=${d.isConnected}, lastSeen=${d.lastSeen}`);
  }

  setDeviceConnected(deviceId: string, connected: boolean): string {
    const idx: number = this.findDeviceIndex(deviceId);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_distributed_set_connected_not_found'), [deviceId],
        `setDeviceConnected failed: device '${deviceId}' not found`);
    }
    const newDevices: DeviceInfo[] = [];
    for (let i: number = 0; i < this.deviceCount; i++) {
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
    return ResultText.ofArgs($r('app.string.result_distributed_set_connected'), [deviceId, String(connected)],
      `setDeviceConnected: ${deviceId} = ${connected}`);
  }

  async sync(): Promise<string> {
    if (this.isSyncing) {
      return ResultText.of($r('app.string.result_distributed_sync_in_progress'),
        'sync failed: sync already in progress');
    }
    if (this.deviceCount === 0) {
      return ResultText.of($r('app.string.result_distributed_sync_no_devices'), 'sync failed: no devices to sync with');
    }
    this.isSyncing = true;
    this.syncCount++;
    let syncedCount: number = 0;
    let conflictTotal: number = 0;
    const syncTime: number = Date.now();
    for (let i: number = 0; i < this.deviceCount; i++) {
      if (this.devices[i].isConnected) {
        syncedCount++;
        conflictTotal += this.simulateRemoteConflicts(this.devices[i].deviceId, syncTime);
      }
    }
    this.lastSyncTime = syncTime;
    this.isSyncing = false;
    return ResultText.ofArgs($r('app.string.result_distributed_sync_completed'),
      [syncedCount, this.deviceCount, this.lastSyncTime, conflictTotal],
      `sync completed: ${syncedCount}/${this.deviceCount} devices synced at ${this.lastSyncTime}, ` +
        `conflicts detected: ${conflictTotal}`);
  }

  syncStatus(): string {
    return ResultText.ofArgs($r('app.string.result_distributed_sync_status'),
      [String(this.syncMode), String(this.isSyncing), this.lastSyncTime, this.syncCount, this.deviceCount],
      `SyncStatus: mode=${this.syncMode}, syncing=${this.isSyncing}, ` +
        `lastSync=${this.lastSyncTime}, syncCount=${this.syncCount}, ` +
        `devices=${this.deviceCount}`);
  }

  setSyncMode(mode: SyncMode): string {
    if (!DataValidator.isValidSyncMode(mode)) {
      return ResultText.ofArgs($r('app.string.result_distributed_sync_mode_invalid'), [String(mode)],
        `setSyncMode failed: invalid mode '${mode}'`);
    }
    this.syncMode = mode;
    return ResultText.ofArgs($r('app.string.result_distributed_sync_mode_set'), [String(mode)],
      `setSyncMode: ${mode}`);
  }

  getSyncMode(): SyncMode {
    return this.syncMode;
  }

  setConflictPolicy(policy: ConflictPolicy): string {
    if (!DataValidator.isValidConflictPolicy(policy)) {
      return ResultText.ofArgs($r('app.string.result_distributed_policy_invalid'), [String(policy)],
        `setConflictPolicy failed: invalid policy '${policy}'`);
    }
    this.conflictPolicy = policy;
    return ResultText.ofArgs($r('app.string.result_distributed_policy_set'), [String(policy)],
      `setConflictPolicy: ${policy}`);
  }

  getConflictPolicy(): ConflictPolicy {
    return this.conflictPolicy;
  }

  resolveConflict(key: string, resolution: ConflictPolicy): string {
    if (!DataValidator.isValidConflictPolicy(resolution)) {
      return ResultText.ofArgs($r('app.string.result_distributed_policy_invalid'), [String(resolution)],
        `resolveConflict failed: invalid policy '${resolution}'`);
    }
    const idx: number = this.findConflictIndex(key);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_distributed_resolve_not_found'), [key],
        `resolveConflict failed: no conflict for key '${key}'`);
    }
    const resolvedValue: string = this.chooseConflictValue(this.conflicts[idx], resolution);
    this.applyLocalValue(key, resolvedValue);
    const newConflicts: ConflictRecord[] = [];
    for (let i: number = 0; i < this.conflictCount; i++) {
      if (i === idx) {
        const resolved: ConflictRecord = {
          key: this.conflicts[i].key,
          localValue: resolvedValue,
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
    return ResultText.ofArgs($r('app.string.result_distributed_resolve_completed'), [key, String(resolution)],
      `resolveConflict: '${key}' resolved with ${resolution}, value=${resolvedValue}`);
  }

  getConflicts(): string {
    if (this.conflictCount === 0) {
      return ResultText.of($r('app.string.result_distributed_conflicts_empty'), 'getConflicts: no conflicts');
    }
    const result: string[] = [];
    for (let i: number = 0; i < this.conflictCount; i++) {
      const c: ConflictRecord = this.conflicts[i];
      const status: string = c.resolved ? 'RESOLVED' : 'PENDING';
      result.push(`${c.key}:${c.localValue}vs${c.remoteValue}:${status}`);
    }
    return ResultText.ofArgs($r('app.string.result_distributed_conflicts'), [result.join(', '), this.conflictCount],
      `Conflicts: [${result.join(', ')}] (${this.conflictCount} total)`);
  }

  getUnresolvedConflicts(): string {
    const result: string[] = [];
    for (let i: number = 0; i < this.conflictCount; i++) {
      if (!this.conflicts[i].resolved) {
        const c: ConflictRecord = this.conflicts[i];
        result.push(`${c.key}:${c.localValue}vs${c.remoteValue}`);
      }
    }
    return ResultText.ofArgs($r('app.string.result_distributed_unresolved'), [result.join(', '), result.length],
      `Unresolved: [${result.join(', ')}] (${result.length} pending)`);
  }

  getConnectedDevices(): number {
    let count: number = 0;
    for (let i: number = 0; i < this.deviceCount; i++) {
      if (this.devices[i].isConnected) {
        count++;
      }
    }
    return count;
  }

  getStatistics(): string {
    return ResultText.ofArgs($r('app.string.result_distributed_statistics'),
      [this.localDataCount, this.deviceCount, this.conflictCount, this.syncCount, this.insertCount,
        this.updateCount, this.deleteCount, this.queryCount, String(this.syncMode), String(this.conflictPolicy)],
      `Distributed Statistics: dataCount=${this.localDataCount}, devices=${this.deviceCount}, ` +
        `conflicts=${this.conflictCount}, syncs=${this.syncCount}, inserts=${this.insertCount}, ` +
        `updates=${this.updateCount}, deletes=${this.deleteCount}, queries=${this.queryCount}, ` +
        `syncMode=${this.syncMode}, policy=${this.conflictPolicy}`);
  }

  resetStatistics(): string {
    this.syncCount = 0;
    this.insertCount = 0;
    this.updateCount = 0;
    this.deleteCount = 0;
    this.queryCount = 0;
    return ResultText.of($r('app.string.result_distributed_stats_reset'), 'Distributed statistics reset');
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
    this.lastWriteTime = 0;
    this.syncCount = 0;
    this.insertCount = 0;
    this.updateCount = 0;
    this.deleteCount = 0;
    this.queryCount = 0;
    this.createdAt = 0;
    Logger.info('DistributedDataManager released');
  }

  private findLocalKeyIndex(key: string): number {
    for (let i: number = 0; i < this.localDataCount; i++) {
      if (this.localKeys[i] === key) {
        return i;
      }
    }
    return -1;
  }

  private findDeviceIndex(deviceId: string): number {
    for (let i: number = 0; i < this.deviceCount; i++) {
      if (this.devices[i].deviceId === deviceId) {
        return i;
      }
    }
    return -1;
  }

  private findConflictIndex(key: string): number {
    for (let i: number = 0; i < this.conflictCount; i++) {
      if (this.conflicts[i].key === key) {
        return i;
      }
    }
    return -1;
  }

  /**
   * Simulates the writes a peer device reports during a sync.
   *
   * The demo has no real peer, so every locally stored key whose remote value
   * differs from the local one is recorded as a pending conflict. That keeps the
   * conflict APIs (getConflicts / getUnresolvedConflicts / resolveConflict)
   * reachable from the sync workflow.
   */
  private simulateRemoteConflicts(deviceId: string, syncTime: number): number {
    const pending: ConflictRecord[] = [];
    for (let i: number = 0; i < this.localDataCount; i++) {
      if (this.conflictCount + pending.length >= MAX_CONFLICTS) {
        break;
      }
      const key: string = this.localKeys[i];
      if (this.hasPendingConflict(key)) {
        continue;
      }
      const remoteValue: string = `remote_${this.localData[i]}`;
      const record: ConflictRecord = {
        key: key,
        localValue: this.localData[i],
        remoteValue: remoteValue,
        localTimestamp: this.lastWriteTime,
        remoteTimestamp: syncTime,
        deviceId: deviceId,
        resolved: false,
        resolution: this.conflictPolicy
      };
      pending.push(record);
    }
    if (pending.length === 0) {
      return 0;
    }
    const newConflicts: ConflictRecord[] = [];
    for (let i: number = 0; i < this.conflictCount; i++) {
      newConflicts.push(this.conflicts[i]);
    }
    for (let i: number = 0; i < pending.length; i++) {
      newConflicts.push(pending[i]);
    }
    this.conflicts = newConflicts;
    this.conflictCount = newConflicts.length;
    return pending.length;
  }

  private hasPendingConflict(key: string): boolean {
    for (let i: number = 0; i < this.conflictCount; i++) {
      if (this.conflicts[i].key === key && !this.conflicts[i].resolved) {
        return true;
      }
    }
    return false;
  }

  private chooseConflictValue(conflict: ConflictRecord, resolution: ConflictPolicy): string {
    switch (resolution) {
      case ConflictPolicy.REMOTE_FIRST:
        return conflict.remoteValue;
      case ConflictPolicy.TIMESTAMP:
        return conflict.remoteTimestamp > conflict.localTimestamp ? conflict.remoteValue : conflict.localValue;
      case ConflictPolicy.MERGE:
        return `${conflict.localValue}|${conflict.remoteValue}`;
      case ConflictPolicy.LOCAL_FIRST:
      default:
        return conflict.localValue;
    }
  }

  private applyLocalValue(key: string, value: string): void {
    const idx: number = this.findLocalKeyIndex(key);
    if (idx < 0) {
      return;
    }
    const newData: string[] = [];
    for (let i: number = 0; i < this.localDataCount; i++) {
      if (i === idx) {
        newData.push(value);
      } else {
        newData.push(this.localData[i]);
      }
    }
    this.localData = newData;
  }
}
