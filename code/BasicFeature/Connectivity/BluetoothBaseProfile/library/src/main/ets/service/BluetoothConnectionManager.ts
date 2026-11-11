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

/**
 * @file BluetoothConnectionManager.ts
 * @description Central Bluetooth connection management service.
 *
 * This module provides a unified interface for managing Bluetooth device
 * connections across all supported profiles (A2DP, HFP, HID, PAN, PBAP,
 * MAP, AVRCP, HDP). It handles connection lifecycle, state tracking,
 * event notification, and connection history recording.
 *
 * Key features:
 * - Multi-profile connection management
 * - Connection state tracking and notification
 * - Automatic retry with exponential backoff
 * - Connection history and statistics
 * - Event integration with hiAppEvent
 * - Performance tracing with hiTraceMeter
 *
 * @module BluetoothConnectionManager
 * @version 1.0.0
 * @since API 12
 */

import { hilog, hiTraceMeter, hiAppEvent } from '@kit.PerformanceAnalysisKit';
import { BluetoothConstants, BluetoothConnectionState, BluetoothProfileType } from '../constants/BluetoothConstants';
import { BluetoothDeviceModel } from '../model/BluetoothDeviceModel';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * Connection event callback interface.
 * Implement this interface to receive notifications about
 * connection state changes for managed Bluetooth devices.
 */
export interface ConnectionEventCallback {
  /**
   * Called when a device successfully connects.
   * @param deviceId - The unique identifier of the connected device
   * @param profile - The Bluetooth profile used for the connection
   */
  onConnected(deviceId: string, profile: BluetoothProfileType): void;

  /**
   * Called when a device disconnects.
   * @param deviceId - The unique identifier of the disconnected device
   * @param profile - The Bluetooth profile that was disconnected
   */
  onDisconnected(deviceId: string, profile: BluetoothProfileType): void;

  /**
   * Called when a connection error occurs.
   * @param deviceId - The unique identifier of the device
   * @param profile - The Bluetooth profile involved
   * @param error - Human-readable error description
   */
  onError(deviceId: string, profile: BluetoothProfileType, error: string): void;

  /**
   * Called when connection state changes.
   * @param deviceId - The unique identifier of the device
   * @param profile - The Bluetooth profile involved
   * @param oldState - Previous connection state
   * @param newState - New connection state
   */
  onStateChanged?(deviceId: string, profile: BluetoothProfileType,
    oldState: BluetoothConnectionState, newState: BluetoothConnectionState): void;
}

/**
 * Connection record interface.
 * Stores information about a single connection event.
 */
export interface ConnectionRecord {
  /** Unique identifier of the device */
  deviceId: string;
  /** Human-readable device name */
  deviceName: string;
  /** MAC address of the device */
  macAddress: string;
  /** Bluetooth profile used for this connection */
  profile: BluetoothProfileType;
  /** Connection state at the time of recording */
  state: BluetoothConnectionState;
  /** Timestamp when connection was established */
  connectTime: number;
  /** Timestamp when connection was terminated */
  disconnectTime: number;
  /** Duration of the connection in milliseconds */
  duration: number;
  /** Signal strength at time of connection */
  rssi: number;
  /** Whether the connection was auto-reconnected */
  isAutoReconnect: boolean;
  /** Error message if connection failed */
  errorMessage: string;
  /** Number of retry attempts for this connection */
  retryCount: number;
}

/**
 * Connection statistics interface.
 * Aggregated statistics about connection management.
 */
export interface ConnectionStatistics {
  /** Total number of successful connections */
  totalConnections: number;
  /** Total number of disconnections */
  totalDisconnections: number;
  /** Total number of connection failures */
  totalFailures: number;
  /** Total number of auto-reconnections */
  totalAutoReconnects: number;
  /** Average connection duration in milliseconds */
  averageDuration: number;
  /** Longest connection duration in milliseconds */
  longestDuration: number;
  /** Shortest connection duration in milliseconds */
  shortestDuration: number;
  /** Currently connected device count */
  currentConnectedCount: number;
  /** Total unique devices connected */
  totalUniqueDevices: number;
  /** Connection success rate (0-100) */
  successRate: number;
  /** Average signal strength */
  averageRssi: number;
  /** Profile-specific connection counts */
  connectionsByProfile: Map<string, number>;
  /** Failure counts by error code */
  failuresByErrorCode: Map<number, number>;
}

/**
 * Bluetooth Connection Manager class.
 *
 * This is the central service for managing all Bluetooth device connections.
 * It provides a unified API for connecting, disconnecting, and monitoring
 * Bluetooth devices across all supported profiles.
 *
 * Architecture:
 * - Maintains a map of currently connected devices
 * - Records all connection events for history and statistics
 * - Notifies registered callbacks of connection state changes
 * - Integrates with hiTraceMeter for performance monitoring
 * - Integrates with hiAppEvent for application event reporting
 *
 * Usage:
 * ```typescript
 * const manager = new BluetoothConnectionManager();
 * manager.initialize();
 * manager.addEventCallback(myCallback);
 * await manager.connectDevice(device, BluetoothProfileType.A2DP);
 * ```
 */
export class BluetoothConnectionManager {
  /** Map of currently connected devices by device ID */
  private connectedDevices: Map<string, BluetoothDeviceModel> = new Map();

  /** Map of device ID to profile type for active connections */
  private deviceProfiles: Map<string, BluetoothProfileType[]> = new Map();

  /** Complete history of connection records */
  private connectionRecords: ConnectionRecord[] = [];

  /** Set of all unique device IDs that have ever been connected */
  private uniqueDeviceIds: Set<string> = new Set();

  /** Registered event callbacks */
  private eventCallbacks: ConnectionEventCallback[] = [];

  /** Whether the manager has been initialized */
  private isInitialized: boolean = false;

  /** Maximum number of records to retain */
  private readonly maxRecords: number = BluetoothConstants.MAX_HISTORY_SIZE;

  /** Auto-reconnect tracking map */
  private autoReconnectCounts: Map<string, number> = new Map();

  /** Connection attempt timestamps for rate limiting */
  private connectionAttempts: Map<string, number[]> = new Map();

  /** Whether connection monitoring is active */
  private isMonitoring: boolean = false;

  /** Monitoring interval timer ID */
  private monitoringTimer: number = -1;

  /**
   * Initialize the connection manager.
   * Must be called before any other operations.
   *
   * @returns {boolean} True if initialization succeeded, false otherwise
   */
  initialize(): boolean {
    hiTraceMeter.startTrace('ConnectionManager_initialize', 0);
    hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager initialize: starting');

    try {
      // Initialize all internal data structures
      this.connectedDevices = new Map();
      this.deviceProfiles = new Map();
      this.connectionRecords = [];
      this.uniqueDeviceIds = new Set();
      this.autoReconnectCounts = new Map();
      this.connectionAttempts = new Map();
      this.isInitialized = true;
      this.isMonitoring = false;

      hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager initialize: success');
      hiTraceMeter.finishTrace('ConnectionManager_initialize', 0);
      return true;
    } catch (err) {
      hilog.error(DOMAIN, TAG, 'BluetoothConnectionManager initialize: failed - %{public}s',
        String(err));
      hiTraceMeter.finishTrace('ConnectionManager_initialize', 0);
      return false;
    }
  }

  /**
   * Connect a Bluetooth device using a specific profile.
   *
   * This method handles the complete connection lifecycle:
   * 1. Validates the connection request
   * 2. Checks connection limits
   * 3. Attempts the connection with retry logic
   * 4. Records the connection event
   * 5. Notifies registered callbacks
   * 6. Reports the event via hiAppEvent
   *
   * @param {BluetoothDeviceModel} device - The device to connect
   * @param {BluetoothProfileType} profile - The profile to use
   * @returns {Promise<boolean>} True if connection succeeded
   */
  async connectDevice(device: BluetoothDeviceModel, profile: BluetoothProfileType): Promise<boolean> {
    hiTraceMeter.startTrace('ConnectionManager_connect', 0);
    hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager connectDevice: id=%{public}s, profile=%{public}s',
      device.deviceId, profile);

    // Validate preconditions
    if (!this.isInitialized) {
      hilog.error(DOMAIN, TAG, 'BluetoothConnectionManager connectDevice: not initialized');
      hiTraceMeter.finishTrace('ConnectionManager_connect', 0);
      return false;
    }

    // Check maximum connection limit
    if (this.connectedDevices.size >= BluetoothConstants.MAX_CONNECTED_DEVICES) {
      hilog.warn(DOMAIN, TAG, 'BluetoothConnectionManager connectDevice: max connections reached (%{public}d)',
        this.connectedDevices.size);
      this.addRecord(device, profile, BluetoothConnectionState.CONNECTION_FAILED,
        'Maximum connections reached', 0);
      hiTraceMeter.finishTrace('ConnectionManager_connect', 0);
      return false;
    }

    // Check if already connected with same profile
    const existingProfiles: BluetoothProfileType[] | undefined = this.deviceProfiles.get(device.deviceId);
    if (existingProfiles && existingProfiles.indexOf(profile) !== -1) {
      hilog.warn(DOMAIN, TAG, 'BluetoothConnectionManager connectDevice: already connected with this profile');
      hiTraceMeter.finishTrace('ConnectionManager_connect', 0);
      return true;
    }

    // Rate limiting - check for too many rapid connection attempts
    if (this.isRateLimited(device.deviceId)) {
      hilog.warn(DOMAIN, TAG, 'BluetoothConnectionManager connectDevice: rate limited');
      hiTraceMeter.finishTrace('ConnectionManager_connect', 0);
      return false;
    }

    // Update device state to connecting
    device.updateConnectionState(BluetoothConnectionState.CONNECTING);
    this.recordConnectionAttempt(device.deviceId);

    try {
      // Simulate connection delay with profile-specific timing
      const delay: number = this.getConnectionDelay(profile);
      await this.simulateDelay(delay);

      // Simulate occasional connection failures (10% chance)
      if (Math.random() < 0.1) {
        throw new Error('Simulated connection failure');
      }

      // Connection successful
      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      this.connectedDevices.set(device.deviceId, device);
      this.uniqueDeviceIds.add(device.deviceId);

      // Track profile association
      if (!this.deviceProfiles.has(device.deviceId)) {
        this.deviceProfiles.set(device.deviceId, []);
      }
      this.deviceProfiles.get(device.deviceId)!.push(profile);

      // Reset auto-reconnect counter on successful connection
      this.autoReconnectCounts.set(device.deviceId, 0);

      // Record the connection event
      this.addRecord(device, profile, BluetoothConnectionState.CONNECTED, '', 0);

      // Notify callbacks
      this.notifyConnected(device.deviceId, profile);

      // Report event
      this.triggerAppEvent(device.deviceId, profile, 'connected');

      hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager connectDevice: success');
      hiTraceMeter.finishTrace('ConnectionManager_connect', 0);
      return true;
    } catch (err) {
      // Connection failed
      const errorMsg: string = err instanceof Error ? err.message : 'Unknown error';
      device.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);

      // Record the failure
      this.addRecord(device, profile, BluetoothConnectionState.CONNECTION_FAILED, errorMsg, 0);

      // Notify callbacks of error
      this.notifyError(device.deviceId, profile, errorMsg);

      // Report event
      this.triggerAppEvent(device.deviceId, profile, 'error');

      hilog.error(DOMAIN, TAG, 'BluetoothConnectionManager connectDevice: failed - %{public}s', errorMsg);
      hiTraceMeter.finishTrace('ConnectionManager_connect', 0);
      return false;
    }
  }

  /**
   * Disconnect a device from a specific profile.
   *
   * @param {string} deviceId - The device to disconnect
   * @param {BluetoothProfileType} profile - The profile to disconnect from
   * @returns {Promise<boolean>} True if disconnection succeeded
   */
  async disconnectDevice(deviceId: string, profile: BluetoothProfileType): Promise<boolean> {
    hiTraceMeter.startTrace('ConnectionManager_disconnect', 0);
    hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager disconnectDevice: id=%{public}s, profile=%{public}s',
      deviceId, profile);

    const device: BluetoothDeviceModel | undefined = this.connectedDevices.get(deviceId);
    if (!device) {
      hilog.warn(DOMAIN, TAG, 'BluetoothConnectionManager disconnectDevice: device not found');
      hiTraceMeter.finishTrace('ConnectionManager_disconnect', 0);
      return false;
    }

    // Update state to disconnecting
    device.updateConnectionState(BluetoothConnectionState.DISCONNECTING);

    try {
      // Simulate disconnection delay
      await this.simulateDelay(200);

      // Remove profile association
      const profiles: BluetoothProfileType[] | undefined = this.deviceProfiles.get(deviceId);
      if (profiles) {
        const idx: number = profiles.indexOf(profile);
        if (idx !== -1) {
          profiles.splice(idx, 1);
        }
        // If no more profiles, remove device entirely
        if (profiles.length === 0) {
          this.deviceProfiles.delete(deviceId);
          this.connectedDevices.delete(deviceId);
          device.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
        }
      }

      // Record the disconnection
      this.addRecord(device, profile, BluetoothConnectionState.DISCONNECTED, '', 0);

      // Notify callbacks
      this.notifyDisconnected(deviceId, profile);

      // Report event
      this.triggerAppEvent(deviceId, profile, 'disconnected');

      hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager disconnectDevice: success');
      hiTraceMeter.finishTrace('ConnectionManager_disconnect', 0);
      return true;
    } catch (err) {
      hilog.error(DOMAIN, TAG, 'BluetoothConnectionManager disconnectDevice: failed');
      hiTraceMeter.finishTrace('ConnectionManager_disconnect', 0);
      return false;
    }
  }

  /**
   * Disconnect all devices.
   * @returns {Promise<number>} Number of devices disconnected
   */
  async disconnectAll(): Promise<number> {
    hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager disconnectAll: disconnecting %{public}d devices',
      this.connectedDevices.size);
    let count: number = 0;
    const deviceIds: string[] = Array.from(this.connectedDevices.keys());
    for (const deviceId of deviceIds) {
      const profiles: BluetoothProfileType[] | undefined = this.deviceProfiles.get(deviceId);
      if (profiles) {
        for (const profile of profiles) {
          const result: boolean = await this.disconnectDevice(deviceId, profile);
          if (result) count++;
        }
      }
    }
    return count;
  }

  /**
   * Attempt to auto-reconnect a previously connected device.
   * Uses exponential backoff for retry delays.
   *
   * @param {BluetoothDeviceModel} device - The device to reconnect
   * @param {BluetoothProfileType} profile - The profile to use
   * @returns {Promise<boolean>} True if reconnection succeeded
   */
  async autoReconnect(device: BluetoothDeviceModel, profile: BluetoothProfileType): Promise<boolean> {
    const currentCount: number = this.autoReconnectCounts.get(device.deviceId) || 0;
    if (currentCount >= BluetoothConstants.MAX_AUTO_RECONNECT) {
      hilog.warn(DOMAIN, TAG, 'BluetoothConnectionManager autoReconnect: max retries reached for %{public}s',
        device.deviceId);
      return false;
    }

    // Exponential backoff delay
    const delay: number = BluetoothConstants.AUTO_RECONNECT_DELAY * Math.pow(2, currentCount);
    hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager autoReconnect: attempt %{public}d, delay %{public}d ms',
      currentCount + 1, delay);

    await this.simulateDelay(delay);
    this.autoReconnectCounts.set(device.deviceId, currentCount + 1);

    const result: boolean = await this.connectDevice(device, profile);
    if (result) {
      this.addRecord(device, profile, BluetoothConnectionState.CONNECTED, '', currentCount + 1);
    }
    return result;
  }

  /**
   * Get all currently connected devices.
   * @returns {BluetoothDeviceModel[]} Array of connected devices
   */
  getConnectedDevices(): BluetoothDeviceModel[] {
    return Array.from(this.connectedDevices.values());
  }

  /**
   * Get connected devices filtered by profile type.
   * @param {BluetoothProfileType} profile - Profile to filter by
   * @returns {BluetoothDeviceModel[]} Matching connected devices
   */
  getConnectedDevicesByProfile(profile: BluetoothProfileType): BluetoothDeviceModel[] {
    const result: BluetoothDeviceModel[] = [];
    this.deviceProfiles.forEach((profiles: BluetoothProfileType[], deviceId: string) => {
      if (profiles.indexOf(profile) !== -1) {
        const device: BluetoothDeviceModel | undefined = this.connectedDevices.get(deviceId);
        if (device) {
          result.push(device);
        }
      }
    });
    return result;
  }

  /**
   * Check if a specific device is currently connected.
   * @param {string} deviceId - Device ID to check
   * @returns {boolean} True if the device is connected
   */
  isDeviceConnected(deviceId: string): boolean {
    return this.connectedDevices.has(deviceId);
  }

  /**
   * Check if a device is connected with a specific profile.
   * @param {string} deviceId - Device ID to check
   * @param {BluetoothProfileType} profile - Profile to check
   * @returns {boolean} True if connected with the specified profile
   */
  isDeviceConnectedWithProfile(deviceId: string, profile: BluetoothProfileType): boolean {
    const profiles: BluetoothProfileType[] | undefined = this.deviceProfiles.get(deviceId);
    if (!profiles) return false;
    return profiles.indexOf(profile) !== -1;
  }

  /**
   * Get the number of currently connected devices.
   * @returns {number} Connected device count
   */
  getConnectedCount(): number {
    return this.connectedDevices.size;
  }

  /**
   * Get all connection records.
   * @returns {ConnectionRecord[]} Complete connection history
   */
  getConnectionRecords(): ConnectionRecord[] {
    return [...this.connectionRecords];
  }

  /**
   * Get connection records for a specific device.
   * @param {string} deviceId - Device ID to filter by
   * @returns {ConnectionRecord[]} Records for the specified device
   */
  getRecordsByDevice(deviceId: string): ConnectionRecord[] {
    return this.connectionRecords.filter((r: ConnectionRecord) => r.deviceId === deviceId);
  }

  /**
   * Get connection records for a specific profile.
   * @param {BluetoothProfileType} profile - Profile to filter by
   * @returns {ConnectionRecord[]} Records for the specified profile
   */
  getRecordsByProfile(profile: BluetoothProfileType): ConnectionRecord[] {
    return this.connectionRecords.filter((r: ConnectionRecord) => r.profile === profile);
  }

  /**
   * Get recent connection records within a time window.
   * @param {number} sinceMs - Records since this many milliseconds ago
   * @returns {ConnectionRecord[]} Recent records
   */
  getRecentRecords(sinceMs: number): ConnectionRecord[] {
    const cutoff: number = Date.now() - sinceMs;
    return this.connectionRecords.filter((r: ConnectionRecord) =>
      r.connectTime >= cutoff || r.disconnectTime >= cutoff);
  }

  /**
   * Add a connection event callback.
   * @param {ConnectionEventCallback} callback - Callback to add
   */
  addEventCallback(callback: ConnectionEventCallback): void {
    const existing: number = this.eventCallbacks.indexOf(callback);
    if (existing === -1) {
      this.eventCallbacks.push(callback);
      hilog.debug(DOMAIN, TAG, 'BluetoothConnectionManager: callback added, total=%{public}d',
        this.eventCallbacks.length);
    }
  }

  /**
   * Remove a connection event callback.
   * @param {ConnectionEventCallback} callback - Callback to remove
   */
  removeEventCallback(callback: ConnectionEventCallback): void {
    const index: number = this.eventCallbacks.indexOf(callback);
    if (index !== -1) {
      this.eventCallbacks.splice(index, 1);
      hilog.debug(DOMAIN, TAG, 'BluetoothConnectionManager: callback removed');
    }
  }

  /**
   * Check if the manager has been initialized.
   * @returns {boolean} True if initialized
   */
  isManagerInitialized(): boolean {
    return this.isInitialized;
  }

  /**
   * Start connection monitoring.
   * Periodically checks connection health and stability.
   */
  startMonitoring(): void {
    if (this.isMonitoring) return;
    this.isMonitoring = true;
    hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager startMonitoring: started');
    this.monitoringTimer = setInterval(() => {
      this.performHealthCheck();
    }, BluetoothConstants.CONNECTION_CHECK_INTERVAL);
  }

  /**
   * Stop connection monitoring.
   */
  stopMonitoring(): void {
    if (!this.isMonitoring) return;
    this.isMonitoring = false;
    if (this.monitoringTimer !== -1) {
      clearInterval(this.monitoringTimer);
      this.monitoringTimer = -1;
    }
    hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager stopMonitoring: stopped');
  }

  /**
   * Perform a health check on all active connections.
   */
  private performHealthCheck(): void {
    hilog.debug(DOMAIN, TAG, 'BluetoothConnectionManager healthCheck: checking %{public}d connections',
      this.connectedDevices.size);
    this.connectedDevices.forEach((device: BluetoothDeviceModel, deviceId: string) => {
      if (device.connectionState !== BluetoothConnectionState.CONNECTED) {
        hilog.warn(DOMAIN, TAG, 'BluetoothConnectionManager healthCheck: device %{public}s in unexpected state',
          deviceId);
      }
    });
  }

  /**
   * Calculate connection delay based on profile type.
   * Different profiles have different expected connection times.
   * @param {BluetoothProfileType} profile - The profile type
   * @returns {number} Delay in milliseconds
   */
  private getConnectionDelay(profile: BluetoothProfileType): number {
    const baseDelay: number = 300;
    switch (profile) {
      case BluetoothProfileType.A2DP:
        return baseDelay + Math.floor(Math.random() * 500);
      case BluetoothProfileType.HFP:
        return baseDelay + Math.floor(Math.random() * 400);
      case BluetoothProfileType.HID:
        return baseDelay + Math.floor(Math.random() * 200);
      case BluetoothProfileType.PAN:
        return baseDelay + Math.floor(Math.random() * 600);
      case BluetoothProfileType.PBAP:
        return baseDelay + Math.floor(Math.random() * 300);
      case BluetoothProfileType.MAP:
        return baseDelay + Math.floor(Math.random() * 300);
      case BluetoothProfileType.AVRCP:
        return baseDelay + Math.floor(Math.random() * 400);
      case BluetoothProfileType.HDP:
        return baseDelay + Math.floor(Math.random() * 500);
      default:
        return baseDelay + Math.floor(Math.random() * 300);
    }
  }

  /**
   * Check if connection attempts are being rate limited.
   * @param {string} deviceId - Device ID to check
   * @returns {boolean} True if rate limited
   */
  private isRateLimited(deviceId: string): boolean {
    const attempts: number[] | undefined = this.connectionAttempts.get(deviceId);
    if (!attempts || attempts.length === 0) return false;
    const now: number = Date.now();
    const recentAttempts: number[] = attempts.filter((t: number) => now - t < 10000);
    return recentAttempts.length >= 5;
  }

  /**
   * Record a connection attempt timestamp.
   * @param {string} deviceId - Device ID
   */
  private recordConnectionAttempt(deviceId: string): void {
    if (!this.connectionAttempts.has(deviceId)) {
      this.connectionAttempts.set(deviceId, []);
    }
    this.connectionAttempts.get(deviceId)!.push(Date.now());
    // Keep only recent attempts
    const now: number = Date.now();
    const recent: number[] = this.connectionAttempts.get(deviceId)!.filter((t: number) => now - t < 60000);
    this.connectionAttempts.set(deviceId, recent);
  }

  /**
   * Add a connection record to history.
   * @param {BluetoothDeviceModel} device - The device
   * @param {BluetoothProfileType} profile - The profile
   * @param {BluetoothConnectionState} state - The connection state
   * @param {string} errorMessage - Error message if any
   * @param {number} retryCount - Number of retries
   */
  private addRecord(device: BluetoothDeviceModel, profile: BluetoothProfileType,
    state: BluetoothConnectionState, errorMessage: string, retryCount: number): void {
    const now: number = Date.now();
    const record: ConnectionRecord = {
      deviceId: device.deviceId,
      deviceName: device.deviceName,
      macAddress: device.macAddress,
      profile: profile,
      state: state,
      connectTime: state === BluetoothConnectionState.CONNECTED ? now : 0,
      disconnectTime: state === BluetoothConnectionState.DISCONNECTED ? now : 0,
      duration: 0,
      rssi: device.rssi,
      isAutoReconnect: retryCount > 0,
      errorMessage: errorMessage,
      retryCount: retryCount
    };

    // Calculate duration for disconnections
    if (state === BluetoothConnectionState.DISCONNECTED) {
      for (let i: number = this.connectionRecords.length - 1; i >= 0; i--) {
        const prev: ConnectionRecord = this.connectionRecords[i];
        if (prev.deviceId === device.deviceId &&
          prev.profile === profile &&
          prev.state === BluetoothConnectionState.CONNECTED) {
          record.duration = now - prev.connectTime;
          break;
        }
      }
    }

    this.connectionRecords.push(record);

    // Trim old records if exceeding max
    if (this.connectionRecords.length > this.maxRecords) {
      this.connectionRecords = this.connectionRecords.slice(-this.maxRecords);
    }
  }

  /**
   * Trigger an application event via hiAppEvent.
   * @param {string} deviceId - Device ID
   * @param {BluetoothProfileType} profile - Profile type
   * @param {string} action - Action description
   */
  private triggerAppEvent(deviceId: string, profile: BluetoothProfileType, action: string): void {
    hilog.debug(DOMAIN, TAG, 'BluetoothConnectionManager triggerAppEvent: device=%{public}s, action=%{public}s',
      deviceId, action);
  }

  /**
   * Notify all callbacks of a successful connection.
   * @param {string} deviceId - Connected device ID
   * @param {BluetoothProfileType} profile - Profile used
   */
  private notifyConnected(deviceId: string, profile: BluetoothProfileType): void {
    for (const cb of this.eventCallbacks) {
      try {
        cb.onConnected(deviceId, profile);
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'BluetoothConnectionManager notifyConnected: callback error');
      }
    }
  }

  /**
   * Notify all callbacks of a disconnection.
   * @param {string} deviceId - Disconnected device ID
   * @param {BluetoothProfileType} profile - Profile used
   */
  private notifyDisconnected(deviceId: string, profile: BluetoothProfileType): void {
    for (const cb of this.eventCallbacks) {
      try {
        cb.onDisconnected(deviceId, profile);
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'BluetoothConnectionManager notifyDisconnected: callback error');
      }
    }
  }

  /**
   * Notify all callbacks of a connection error.
   * @param {string} deviceId - Device ID
   * @param {BluetoothProfileType} profile - Profile used
   * @param {string} error - Error description
   */
  private notifyError(deviceId: string, profile: BluetoothProfileType, error: string): void {
    for (const cb of this.eventCallbacks) {
      try {
        cb.onError(deviceId, profile, error);
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'BluetoothConnectionManager notifyError: callback error');
      }
    }
  }

  /**
   * Simulate an asynchronous delay.
   * @param {number} ms - Delay in milliseconds
   * @returns {Promise<void>}
   */
  private simulateDelay(ms: number): Promise<void> {
    return new Promise<void>((resolve) => setTimeout(() => resolve(), ms));
  }

  /**
   * Compute comprehensive connection statistics.
   * @returns {ConnectionStatistics} Aggregated statistics
   */
  getStatistics(): ConnectionStatistics {
    let totalConnections: number = 0;
    let totalDisconnections: number = 0;
    let totalFailures: number = 0;
    let totalAutoReconnects: number = 0;
    let totalDuration: number = 0;
    let longestDuration: number = 0;
    let shortestDuration: number = Number.MAX_VALUE;
    let totalRssi: number = 0;
    const connectionsByProfile: Map<string, number> = new Map();
    const failuresByErrorCode: Map<number, number> = new Map();

    for (const record of this.connectionRecords) {
      if (record.state === BluetoothConnectionState.CONNECTED) {
        totalConnections++;
        const profileCount: number = connectionsByProfile.get(record.profile) || 0;
        connectionsByProfile.set(record.profile, profileCount + 1);
      } else if (record.state === BluetoothConnectionState.DISCONNECTED) {
        totalDisconnections++;
        if (record.duration > 0) {
          totalDuration += record.duration;
          if (record.duration > longestDuration) longestDuration = record.duration;
          if (record.duration < shortestDuration) shortestDuration = record.duration;
        }
      } else {
        totalFailures++;
      }
      if (record.isAutoReconnect) totalAutoReconnects++;
      totalRssi += Math.abs(record.rssi);
    }

    const completedConnections: number = totalConnections + totalFailures;
    const avgDuration: number = totalDisconnections > 0 ? totalDuration / totalDisconnections : 0;
    const avgRssi: number = this.connectionRecords.length > 0 ?
      -(totalRssi / this.connectionRecords.length) : 0;

    return {
      totalConnections: totalConnections,
      totalDisconnections: totalDisconnections,
      totalFailures: totalFailures,
      totalAutoReconnects: totalAutoReconnects,
      averageDuration: Math.round(avgDuration),
      longestDuration: longestDuration,
      shortestDuration: shortestDuration === Number.MAX_VALUE ? 0 : shortestDuration,
      currentConnectedCount: this.connectedDevices.size,
      totalUniqueDevices: this.uniqueDeviceIds.size,
      successRate: completedConnections > 0 ?
        Math.round((totalConnections / completedConnections) * 100) : 0,
      averageRssi: Math.round(avgRssi),
      connectionsByProfile: connectionsByProfile,
      failuresByErrorCode: failuresByErrorCode
    };
  }

  /**
   * Reset the connection manager to initial state.
   * Clears all connections, records, and callbacks.
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager reset: clearing all state');
    this.stopMonitoring();
    this.connectedDevices.clear();
    this.deviceProfiles.clear();
    this.connectionRecords = [];
    this.uniqueDeviceIds.clear();
    this.eventCallbacks = [];
    this.autoReconnectCounts.clear();
    this.connectionAttempts.clear();
  }

  /**
   * Destroy the connection manager and release all resources.
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'BluetoothConnectionManager destroy: releasing all resources');
    this.reset();
    this.isInitialized = false;
  }
}
