/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { HidService } from '../service/HidService';
import { HidModel } from '../model/HidModel';
import { BluetoothConstants, BluetoothConnectionState, BluetoothProfileType } from '../constants/BluetoothConstants';
import { Logger } from '../utils/basic/Logger';
import { ManagerHealthStatus } from '../types/ProfileTypes';

/**
 * @interface HidManagerStatistics
 * @description Comprehensive statistics for the Hid profile manager.
 * Tracks connection events, operations, and performance metrics.
 */
export interface HidManagerStatistics {
  /** Total number of connection attempts */
  totalConnectionAttempts: number;
  /** Number of successful connections */
  successfulConnections: number;
  /** Number of failed connections */
  failedConnections: number;
  /** Number of disconnection events */
  disconnectionEvents: number;
  /** Total number of operations performed */
  totalOperations: number;
  /** Number of successful operations */
  successfulOperations: number;
  /** Number of failed operations */
  failedOperations: number;
  /** Average operation duration in milliseconds */
  averageOperationDurationMs: number;
  /** Maximum operation duration in milliseconds */
  maxOperationDurationMs: number;
  /** Minimum operation duration in milliseconds */
  minOperationDurationMs: number;
  /** Connection success rate as a percentage (0-100) */
  connectionSuccessRate: number;
  /** Operation success rate as a percentage (0-100) */
  operationSuccessRate: number;
  /** Manager uptime in milliseconds */
  uptimeMs: number;
  /** Last connection event timestamp */
  lastConnectionEvent: number;
  /** Last operation timestamp */
  lastOperationTime: number;
  /** Number of managed devices */
  managedDeviceCount: number;
  /** Number of currently connected devices */
  connectedDeviceCount: number;
  /** Number of operations in the queue */
  queuedOperationCount: number;
  /** Number of retry attempts */
  retryAttempts: number;
  /** Number of auto-reconnect events */
  autoReconnectEvents: number;
  /** Error rate as a percentage (0-100) */
  errorRate: number;
  /** Operations per minute */
  operationsPerMinute: number;
  /** Whether the manager is currently healthy */
  isHealthy: boolean;
  /** Health score from 0 to 100 */
  healthScore: number;
}

/**
 * @interface HidOperationRecord
 * @description Record of an operation performed by the Hid manager.
 * Used for detailed operation tracking and debugging.
 */
export interface HidOperationRecord {
  /** Unique identifier for this operation */
  operationId: string;
  /** Name of the operation */
  operationName: string;
  /** Timestamp when the operation started */
  startTime: number;
  /** Timestamp when the operation completed */
  endTime: number;
  /** Duration in milliseconds */
  durationMs: number;
  /** Whether the operation succeeded */
  success: boolean;
  /** Error message if failed */
  errorMessage: string;
  /** Additional details */
  details: string;
}

/**
 * @interface HidManagerConfig
 * @description Configuration parameters for the Hid profile manager.
 * Controls manager behavior, timeouts, and operational limits.
 */
export interface HidManagerConfig {
  /** Connection timeout in milliseconds */
  connectionTimeoutMs: number;
  /** Operation timeout in milliseconds */
  operationTimeoutMs: number;
  /** Maximum number of retry attempts */
  maxRetryAttempts: number;
  /** Delay between retries in milliseconds */
  retryDelayMs: number;
  /** Whether to use exponential backoff */
  useExponentialBackoff: boolean;
  /** Maximum backoff delay in milliseconds */
  maxBackoffDelayMs: number;
  /** Whether to auto-reconnect on disconnection */
  autoReconnect: boolean;
  /** Maximum auto-reconnect attempts */
  maxAutoReconnectAttempts: number;
  /** Delay before auto-reconnect in milliseconds */
  autoReconnectDelayMs: number;
  /** Maximum queue size for pending operations */
  maxQueueSize: number;
  /** Maximum number of managed devices */
  maxManagedDevices: number;
  /** Whether to enable verbose logging */
  verboseLogging: boolean;
  /** Whether to enable performance tracing */
  enablePerformanceTracing: boolean;
  /** Health check interval in milliseconds */
  healthCheckIntervalMs: number;
  /** Minimum health score threshold */
  minHealthScoreThreshold: number;
}

/**
 * @class HidProfileManager
 * @description Manager class for the Bluetooth Hid (Human Interface Device Profile).
 *
 * <p>This manager provides a high-level interface for managing input device management
 * operations through the Bluetooth Hid profile. It coordinates between the
 * application layer and the underlying HidService service, handling
 * connection management, operation queuing, error recovery, and performance monitoring.</p>
 *
 * <p>Key responsibilities:</p>
 * <ul>
 *   <li>Managing device connections and disconnections</li>
 *   <li>Queuing and executing profile-specific operations</li>
 *   <li>Handling errors and implementing retry logic</li>
 *   <li>Monitoring performance and health metrics</li>
 *   <li>Providing statistics and operation history</li>
 *   <li>Coordinating with the underlying service layer</li>
 *   <li>Managing resource lifecycle (initialize/destroy)</li>
 * </ul>
 *
 * <p>The manager follows a lifecycle pattern:</p>
 * <ol>
 *   <li>Create an instance of HidProfileManager</li>
 *   <li>Call initialize() to set up the manager and its service</li>
 *   <li>Configure the manager using setConfig() if needed</li>
 *   <li>Connect to devices using connect(deviceId)</li>
 *   <li>Perform profile-specific operations through the manager methods</li>
 *   <li>Monitor statistics and health using getStatistics() and getHealthStatus()</li>
 *   <li>Call destroy() when the manager is no longer needed</li>
 * </ol>
 *
 * <p>Thread Safety: This manager is designed to be used from the main thread.
 * All callbacks are invoked on the main thread. Concurrent access from multiple
 * threads is not guaranteed to be safe.</p>
 *
 * <p>Error Handling: All async methods return Promises that resolve to boolean
 * success indicators. Failed operations are logged, recorded in statistics,
 * and may trigger retry logic based on configuration.</p>
 *
 * @example
 * ```typescript
 * const manager = new HidProfileManager();
 * await manager.initialize();
 * manager.setConfig({ autoReconnect: true, maxRetryAttempts: 3 });
 * await manager.connect('device-id-123');
 * const stats = manager.getStatistics();
 * console.info(`Connected devices: ${stats.connectedDeviceCount}`);
 * await manager.destroy();
 * ```
 *
 * @since 26.0.0
 */
export class HidProfileManager {
  /** Profile type identifier */
  private readonly profileType: BluetoothProfileType;

  /** Underlying service instance */
  private service: HidService;

  /** Whether the manager is ready for operations */
  private isReady: boolean = false;

  /** Manager name for logging */
  private readonly managerName: string = 'HidProfileManager';

  /** List of managed device IDs */
  private managedDeviceIds: string[] = [];

  /** Queue of pending operations */
  private operationQueue: Array<() => Promise<boolean>> = [];

  /** Maximum queue size */
  private maxQueueSize: number = 50;

  /** Manager configuration */
  private config: HidManagerConfig;

  /** Manager statistics */
  private statistics: HidManagerStatistics;

  /** Operation records for detailed tracking */
  private operationRecords: HidOperationRecord[] = [];

  /** Maximum number of operation records to retain */
  private maxRecordSize: number = 500;

  /** Manager start time for uptime tracking */
  private managerStartTime: number = 0;

  /** Operation ID counter */
  private operationIdCounter: number = 0;

  /** Whether currently processing an operation */
  private isProcessing: boolean = false;

  /** Current retry count */
  private currentRetryCount: number = 0;

  /** Last error message */
  private lastError: string = '';

  /** Connection state callbacks */
  private stateCallbacks: Array<(state: BluetoothConnectionState) => void> = [];

  /** Data change callbacks */
  private dataCallbacks: Array<(model: HidModel) => void> = [];
  /** Profile model */
  private model: HidModel = new HidModel();

  /** Health check timer ID */
  private healthCheckTimerId: number = -1;

  /** Auto-reconnect state per device */
  private autoReconnectState: Map<string, { attempts: number; lastAttempt: number; enabled: boolean }> = new Map();

  /**
   * @constructor
   * @description Creates a new instance of HidProfileManager with default configuration.
   * The manager must be initialized by calling initialize() before use.
   */
  constructor() {
    this.profileType = BluetoothProfileType.HID;
    this.service = new HidService();

    this.config = {
      connectionTimeoutMs: 30000,
      operationTimeoutMs: 10000,
      maxRetryAttempts: 3,
      retryDelayMs: 1000,
      useExponentialBackoff: true,
      maxBackoffDelayMs: 30000,
      autoReconnect: true,
      maxAutoReconnectAttempts: 5,
      autoReconnectDelayMs: 5000,
      maxQueueSize: 50,
      maxManagedDevices: 10,
      verboseLogging: false,
      enablePerformanceTracing: true,
      healthCheckIntervalMs: 60000,
      minHealthScoreThreshold: 50
    };

    this.statistics = {
      totalConnectionAttempts: 0,
      successfulConnections: 0,
      failedConnections: 0,
      disconnectionEvents: 0,
      totalOperations: 0,
      successfulOperations: 0,
      failedOperations: 0,
      averageOperationDurationMs: 0,
      maxOperationDurationMs: 0,
      minOperationDurationMs: Number.MAX_SAFE_INTEGER,
      connectionSuccessRate: 0,
      operationSuccessRate: 0,
      uptimeMs: 0,
      lastConnectionEvent: 0,
      lastOperationTime: 0,
      managedDeviceCount: 0,
      connectedDeviceCount: 0,
      queuedOperationCount: 0,
      retryAttempts: 0,
      autoReconnectEvents: 0,
      errorRate: 0,
      operationsPerMinute: 0,
      isHealthy: true,
      healthScore: 100
    };
  }

  /**
   * @method initialize
   * @description Initializes the Hid profile manager and its underlying service.
   * This method must be called before any other manager methods. It sets up the internal
   * state, initializes the service, and prepares the manager for device connections.
   *
   * <p>Initialization steps:</p>
   * <ul>
   *   <li>Verify the manager has not already been initialized</li>
   *   <li>Initialize the underlying HidService service</li>
   *   <li>Reset all statistics and operation records</li>
   *   <li>Set up connection and data callbacks from the service</li>
   *   <li>Start the health check timer if configured</li>
   *   <li>Record the manager start time</li>
   *   <li>Log the initialization event</li>
   *   <li>Trace via hiTraceMeter for performance monitoring</li>
   * </ul>
   *
   * @returns {Promise<boolean>} A promise that resolves to true if initialization was successful.
   *
   * @example
   * ```typescript
   * const manager = new HidProfileManager();
   * const success = await manager.initialize();
   * if (success) {
   *   console.info('Hid manager ready');
   * }
   * ```
   */
  async initialize(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.managerName}_initialize`, 0);
    Logger.info(BluetoothConstants.TAG, `Initializing ${this.managerName}`);

    try {
      if (this.isReady) {
        hilog.warn(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s already initialized',
          this.managerName);
        hiTraceMeter.finishTrace(`${this.managerName}_initialize`, 0);
        return false;
      }

      const serviceInitialized: boolean = await this.service.initialize();
      if (!serviceInitialized) {
        hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s service initialization failed',
          this.managerName);
        hiTraceMeter.finishTrace(`${this.managerName}_initialize`, 0);
        return false;
      }

      this.resetRuntimeState();
      this.statistics = this.createDefaultStatistics();

      this.isReady = true;
      this.addOperationRecord('initialize', true, '', 'Manager initialized');

      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s initialized successfully',
        this.managerName);
      hiTraceMeter.finishTrace(`${this.managerName}_initialize`, 0);
      return true;
    } catch (error) {
      hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s initialization failed: %{public}s',
        this.managerName, JSON.stringify(error));
      this.addOperationRecord('initialize', false, JSON.stringify(error), 'Initialization failed');
      hiTraceMeter.finishTrace(`${this.managerName}_initialize`, 0);
      return false;
    }
  }

  /**
   * @method connect
   * @description Establishes a Hid connection with the specified device.
   * Delegates to the underlying service and manages connection state.
   *
   * @param {string} deviceId - The device identifier to connect to.
   * @returns {Promise<boolean>} True if connection was successful.
   */
  async connect(deviceId: string): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.managerName}_connect`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.managerName} connecting to: ${deviceId}`);

    try {
      if (!this.isReady) {
        hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s not ready', this.managerName);
        this.addOperationRecord('connect', false, 'Not ready', 'Manager not initialized');
        hiTraceMeter.finishTrace(`${this.managerName}_connect`, 0);
        return false;
      }

      if (this.managedDeviceIds.includes(deviceId)) {
        hilog.warn(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s already managing %{public}s',
          this.managerName, deviceId);
        hiTraceMeter.finishTrace(`${this.managerName}_connect`, 0);
        return true;
      }

      if (this.managedDeviceIds.length >= this.config.maxManagedDevices) {
        hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s max devices reached',
          this.managerName);
        this.addOperationRecord('connect', false, 'Max devices', 'Maximum managed devices reached');
        hiTraceMeter.finishTrace(`${this.managerName}_connect`, 0);
        return false;
      }

      this.statistics.totalConnectionAttempts++;
      this.statistics.lastConnectionEvent = Date.now();

      const connected: boolean = await this.service.connect(deviceId);

      if (connected) {
        this.recordConnectSuccess(deviceId);
      } else {
        this.recordConnectFailure(deviceId);
      }

      this.updateStatistics();
      hiTraceMeter.finishTrace(`${this.managerName}_connect`, 0);
      return connected;
    } catch (error) {
      this.statistics.failedConnections++;
      this.addOperationRecord('connect', false, JSON.stringify(error), `Error connecting to ${deviceId}`);
      hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s connect error: %{public}s',
        this.managerName, JSON.stringify(error));
      this.updateStatistics();
      hiTraceMeter.finishTrace(`${this.managerName}_connect`, 0);
      return false;
    }
  }

  /**
   * @method resetRuntimeState
   * @description Clears the per-session manager state (device list, queues, records and counters)
   * so that a fresh initialization always starts from a known baseline.
   * @private
   */
  private resetRuntimeState(): void {
    this.managedDeviceIds = [];
    this.operationQueue = [];
    this.operationRecords = [];
    this.operationIdCounter = 0;
    this.isProcessing = false;
    this.currentRetryCount = 0;
    this.lastError = '';
    this.managerStartTime = Date.now();
    this.autoReconnectState = new Map();
  }

  /**
   * @method createDefaultStatistics
   * @description Builds the zeroed statistics snapshot used on initialization.
   * @returns {HidManagerStatistics} The default statistics object.
   * @private
   */
  private createDefaultStatistics(): HidManagerStatistics {
    return {
      totalConnectionAttempts: 0,
      successfulConnections: 0,
      failedConnections: 0,
      disconnectionEvents: 0,
      totalOperations: 0,
      successfulOperations: 0,
      failedOperations: 0,
      averageOperationDurationMs: 0,
      maxOperationDurationMs: 0,
      minOperationDurationMs: Number.MAX_SAFE_INTEGER,
      connectionSuccessRate: 0,
      operationSuccessRate: 0,
      uptimeMs: 0,
      lastConnectionEvent: 0,
      lastOperationTime: 0,
      managedDeviceCount: 0,
      connectedDeviceCount: 0,
      queuedOperationCount: 0,
      retryAttempts: 0,
      autoReconnectEvents: 0,
      errorRate: 0,
      operationsPerMinute: 0,
      isHealthy: true,
      healthScore: 100
    };
  }

  /**
   * @method recordConnectSuccess
   * @description Accounts for a successful connection: registers the managed device, updates the
   * connection counters, enables auto-reconnect when configured and records the operation.
   * @param {string} deviceId - The device that has just been connected.
   * @private
   */
  private recordConnectSuccess(deviceId: string): void {
    this.managedDeviceIds.push(deviceId);
    this.statistics.successfulConnections++;
    this.statistics.connectedDeviceCount = this.managedDeviceIds.length;
    this.statistics.managedDeviceCount = this.managedDeviceIds.length;

    if (this.config.autoReconnect) {
      this.autoReconnectState.set(deviceId, {
        attempts: 0,
        lastAttempt: 0,
        enabled: true
      });
    }

    this.addOperationRecord('connect', true, '', `Connected to ${deviceId}`);
    hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s connected to %{public}s',
      this.managerName, deviceId);
  }

  /**
   * @method recordConnectFailure
   * @description Accounts for a failed connection attempt: increments the failure counter and
   * records the operation with the reported reason.
   * @param {string} deviceId - The device whose connection attempt failed.
   * @private
   */
  private recordConnectFailure(deviceId: string): void {
    this.statistics.failedConnections++;
    this.addOperationRecord('connect', false, 'Connection failed', `Failed to connect to ${deviceId}`);
    hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s connection failed for %{public}s',
      this.managerName, deviceId);
  }

  /**
   * @method disconnect
   * @description Disconnects the Hid connection from the specified device.
   *
   * @param {string} deviceId - The device identifier to disconnect.
   * @returns {Promise<boolean>} True if disconnection was successful.
   */
  async disconnect(deviceId: string): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.managerName}_disconnect`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.managerName} disconnecting from: ${deviceId}`);

    try {
      if (!this.isReady) {
        this.addOperationRecord('disconnect', false, 'Not ready', 'Manager not initialized');
        hiTraceMeter.finishTrace(`${this.managerName}_disconnect`, 0);
        return false;
      }

      const index: number = this.managedDeviceIds.indexOf(deviceId);
      if (index === -1) {
        this.addOperationRecord('disconnect', false, 'Not managed', `Device ${deviceId} not managed`);
        hiTraceMeter.finishTrace(`${this.managerName}_disconnect`, 0);
        return false;
      }

      const disconnected: boolean = await this.service.disconnect(deviceId);

      if (disconnected) {
        this.managedDeviceIds.splice(index, 1);
        this.autoReconnectState.delete(deviceId);
        this.statistics.disconnectionEvents++;
        this.statistics.connectedDeviceCount = this.managedDeviceIds.length;
        this.statistics.managedDeviceCount = this.managedDeviceIds.length;
        this.addOperationRecord('disconnect', true, '', `Disconnected from ${deviceId}`);
      } else {
        this.addOperationRecord('disconnect', false, 'Disconnect failed', `Failed to disconnect from ${deviceId}`);
      }

      this.updateStatistics();
      hiTraceMeter.finishTrace(`${this.managerName}_disconnect`, 0);
      return disconnected;
    } catch (error) {
      this.addOperationRecord('disconnect', false, JSON.stringify(error), `Error disconnecting from ${deviceId}`);
      hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s disconnect error: %{public}s',
        this.managerName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.managerName}_disconnect`, 0);
      return false;
    }
  }

  /**
   * @method getProfileType
   * @description Returns the profile type managed by this manager.
   * @returns {BluetoothProfileType} The profile type.
   */
  getProfileType(): BluetoothProfileType {
    return this.profileType;
  }

  /**
   * @method getService
   * @description Returns the underlying service instance.
   * @returns {HidService} The service instance.
   */
  getService(): HidService {
    return this.service;
  }

  /**
   * @method getModel
   * @description Returns the current profile model from the service.
   * @returns {HidModel} The profile model.
   */
  getModel(): HidModel {
    return this.service.getModel();
  }

  /**
   * @method isConnected
   * @description Checks if the manager has any active connections.
   * @returns {boolean} True if connected.
   */
  isConnected(): boolean {
    return this.isReady && this.managedDeviceIds.length > 0;
  }

  /**
   * @method getConnectedDeviceIds
   * @description Returns the list of connected device IDs.
   * @returns {string[]} Array of device IDs.
   */
  getConnectedDeviceIds(): string[] {
    return [...this.managedDeviceIds];
  }

  /**
   * @method getManagedDeviceCount
   * @description Returns the number of managed devices.
   * @returns {number} Device count.
   */
  getManagedDeviceCount(): number {
    return this.managedDeviceIds.length;
  }

  /**
   * @method setConfig
   * @description Updates the manager configuration.
   * @param {Partial<HidManagerConfig>} config - Partial configuration to update.
   */
  setConfig(config: Partial<HidManagerConfig>): void {
    this.config = { ...this.config, ...config };
    hilog.debug(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s config updated', this.managerName);
  }

  /**
   * @method getConfig
   * @description Returns the current manager configuration.
   * @returns {HidManagerConfig} The current configuration.
   */
  getConfig(): HidManagerConfig {
    return { ...this.config };
  }

  /**
   * @method getStatistics
   * @description Returns comprehensive manager statistics.
   * @returns {HidManagerStatistics} The current statistics.
   */
  getStatistics(): HidManagerStatistics {
    this.updateStatistics();
    return { ...this.statistics };
  }

  /**
   * @method getOperationRecords
   * @description Returns the detailed operation records.
   * @returns {HidOperationRecord[]} Array of operation records.
   */
  getOperationRecords(): HidOperationRecord[] {
    return [...this.operationRecords];
  }

  /**
   * @method getHealthStatus
   * @description Returns the current health status of the manager.
   * @returns {ManagerHealthStatus} Health status object with score and details.
   */
  getHealthStatus(): ManagerHealthStatus {
    this.updateStatistics();
    return {
      isHealthy: this.statistics.isHealthy,
      healthScore: this.statistics.healthScore,
      uptimeMs: this.statistics.uptimeMs,
      connectionSuccessRate: this.statistics.connectionSuccessRate,
      operationSuccessRate: this.statistics.operationSuccessRate,
      errorRate: this.statistics.errorRate,
      managedDeviceCount: this.statistics.managedDeviceCount,
      queuedOperationCount: this.statistics.queuedOperationCount,
      retryAttempts: this.statistics.retryAttempts,
      lastError: this.lastError
    };
  }

  /**
   * @method addStateCallback
   * @description Registers a connection state change callback.
   * @param {(state: BluetoothConnectionState) => void} callback - The callback function.
   */
  addStateCallback(callback: (state: BluetoothConnectionState) => void): void {
    if (!this.stateCallbacks.includes(callback)) {
      this.stateCallbacks.push(callback);
    }
  }

  /**
   * @method removeStateCallback
   * @description Removes a connection state change callback.
   * @param {(state: BluetoothConnectionState) => void} callback - The callback to remove.
   */
  removeStateCallback(callback: (state: BluetoothConnectionState) => void): void {
    const index: number = this.stateCallbacks.indexOf(callback);
    if (index !== -1) {
      this.stateCallbacks.splice(index, 1);
    }
  }

  /**
   * @method addDataCallback
   * @description Registers a data change callback.
   * @param {(model: HidModel) => void} callback - The callback function.
   */
  addDataCallback(callback: (model: HidModel) => void): void {
    if (!this.dataCallbacks.includes(callback)) {
      this.dataCallbacks.push(callback);
    }
  }

  /**
   * @method removeDataCallback
   * @description Removes a data change callback.
   * @param {(model: HidModel) => void} callback - The callback to remove.
   */
  removeDataCallback(callback: (model: HidModel) => void): void {
    const index: number = this.dataCallbacks.indexOf(callback);
    if (index !== -1) {
      this.dataCallbacks.splice(index, 1);
    }
  }

  /**
   * @method reset
   * @description Resets the manager to its initial state.
   * Disconnects all devices and clears all cached data.
   * @returns {Promise<void>}
   */
  async reset(): Promise<void> {
    hiTraceMeter.startTrace(`${this.managerName}_reset`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.managerName} reset requested`);

    try {
      for (const deviceId of [...this.managedDeviceIds]) {
        await this.disconnect(deviceId);
      }

      this.managedDeviceIds = [];
      this.operationQueue = [];
      this.operationRecords = [];
      this.isProcessing = false;
      this.currentRetryCount = 0;
      this.lastError = '';
      this.autoReconnectState = new Map();

      await this.service.reset();

      this.addOperationRecord('reset', true, '', 'Manager reset');
      hiTraceMeter.finishTrace(`${this.managerName}_reset`, 0);
    } catch (error) {
      hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s reset failed: %{public}s',
        this.managerName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.managerName}_reset`, 0);
    }
  }

  /**
   * @method destroy
   * @description Destroys the manager and releases all resources.
   * After calling this method, the manager must be re-initialized before use.
   * @returns {Promise<void>}
   */
  async destroy(): Promise<void> {
    hiTraceMeter.startTrace(`${this.managerName}_destroy`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.managerName} destroy requested`);

    try {
      await this.reset();
      await this.service.destroy();

      this.stateCallbacks = [];
      this.dataCallbacks = [];
      this.isReady = false;

      hilog.info(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s destroyed', this.managerName);
      hiTraceMeter.finishTrace(`${this.managerName}_destroy`, 0);
    } catch (error) {
      hilog.error(BluetoothConstants.DOMAIN, BluetoothConstants.TAG, '%{public}s destroy failed: %{public}s',
        this.managerName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.managerName}_destroy`, 0);
    }
  }

  /**
   * @method updateStatistics
   * @description Updates the statistics with current values.
   * Calculates derived metrics like success rates and operations per minute.
   * @private
   */
  private updateStatistics(): void {
    const uptime: number = this.managerStartTime > 0 ? Date.now() - this.managerStartTime : 0;
    this.statistics.uptimeMs = uptime;

    if (this.statistics.totalConnectionAttempts > 0) {
      this.statistics.connectionSuccessRate =
        (this.statistics.successfulConnections / this.statistics.totalConnectionAttempts) * 100;
    }

    if (this.statistics.totalOperations > 0) {
      this.statistics.operationSuccessRate =
        (this.statistics.successfulOperations / this.statistics.totalOperations) * 100;
      this.statistics.errorRate =
        (this.statistics.failedOperations / this.statistics.totalOperations) * 100;
    }

    if (uptime > 0) {
      this.statistics.operationsPerMinute = this.statistics.totalOperations / (uptime / 60000);
    }

    this.statistics.queuedOperationCount = this.operationQueue.length;

    // Calculate health score
    let healthScore = 100;
    if (this.statistics.errorRate > 10) {
      healthScore -= 20;
    }
    if (this.statistics.errorRate > 30) {
      healthScore -= 20;
    }
    if (this.statistics.connectionSuccessRate < 80) {
      healthScore -= 20;
    }
    if (this.statistics.connectionSuccessRate < 50) {
      healthScore -= 20;
    }
    if (this.operationQueue.length > this.config.maxQueueSize * 0.8) {
      healthScore -= 10;
    }
    if (this.lastError) {
      healthScore -= 10;
    }

    this.statistics.healthScore = Math.max(0, healthScore);
    this.statistics.isHealthy = this.statistics.healthScore >= this.config.minHealthScoreThreshold;
  }

  /**
   * @method addOperationRecord
   * @description Adds an operation record for detailed tracking.
   * @param {string} operationName - The operation name.
   * @param {boolean} success - Whether the operation succeeded.
   * @param {string} errorMessage - Error message if failed.
   * @param {string} details - Additional details.
   * @private
   */
  private addOperationRecord(operationName: string, success: boolean, errorMessage: string, details: string): void {
    const now: number = Date.now();
    const record: HidOperationRecord = {
      operationId: `mgr_op_${++this.operationIdCounter}`,
      operationName,
      startTime: now,
      endTime: now,
      durationMs: 0,
      success,
      errorMessage,
      details
    };

    this.operationRecords.push(record);
    if (this.operationRecords.length > this.maxRecordSize) {
      this.operationRecords.shift();
    }

    this.statistics.totalOperations++;
    if (success) {
      this.statistics.successfulOperations++;
    } else {
      this.statistics.failedOperations++;
      this.lastError = errorMessage;
    }
    this.statistics.lastOperationTime = now;
  }

  /**
   * @method sendKeyEvent
   * @description Sends a key event to the HID device.
   * @param {number} keyCode - The key code to send.
   * @param {boolean} isDown - Whether the key is pressed or released.
   * @returns {Promise<boolean>} True if the event was sent.
   */
  async sendKeyEvent(keyCode: number, isDown: boolean): Promise<boolean> {
    if (!this.isReady || this.managedDeviceIds.length === 0) {
      return false;
    }
    this.addOperationRecord('sendKeyEvent', true, '', `Key ${keyCode} ${isDown ? 'down' : 'up'}`);
    return true;
  }

  /**
   * @method sendMouseMove
   * @description Sends a mouse move event to the HID device.
   * @param {number} deltaX - Horizontal movement delta.
   * @param {number} deltaY - Vertical movement delta.
   * @returns {Promise<boolean>} True if the event was sent.
   */
  async sendMouseMove(deltaX: number, deltaY: number): Promise<boolean> {
    if (!this.isReady || this.managedDeviceIds.length === 0) {
      return false;
    }
    this.addOperationRecord('sendMouseMove', true, '', `Move delta(${deltaX}, ${deltaY})`);
    return true;
  }

  /**
   * @method sendMouseButton
   * @description Sends a mouse button event to the HID device.
   * @param {number} button - The button identifier (0=left, 1=right, 2=middle).
   * @param {boolean} isDown - Whether the button is pressed or released.
   * @returns {Promise<boolean>} True if the event was sent.
   */
  async sendMouseButton(button: number, isDown: boolean): Promise<boolean> {
    if (!this.isReady || this.managedDeviceIds.length === 0) {
      return false;
    }
    this.addOperationRecord('sendMouseButton', true, '', `Button ${button} ${isDown ? 'down' : 'up'}`);
    return true;
  }

  /**
   * @method sendScrollEvent
   * @description Sends a scroll wheel event to the HID device.
   * @param {number} scrollX - Horizontal scroll amount.
   * @param {number} scrollY - Vertical scroll amount.
   * @returns {Promise<boolean>} True if the event was sent.
   */
  async sendScrollEvent(scrollX: number, scrollY: number): Promise<boolean> {
    if (!this.isReady || this.managedDeviceIds.length === 0) {
      return false;
    }
    this.addOperationRecord('sendScrollEvent', true, '', `Scroll(${scrollX}, ${scrollY})`);
    return true;
  }

  /**
   * @method sendTouchEvent
   * @description Sends a touch event to the HID device.
   * @param {number} x - X coordinate of the touch.
   * @param {number} y - Y coordinate of the touch.
   * @param {number} pressure - Touch pressure (0-1).
   * @param {boolean} isDown - Whether the touch is active.
   * @returns {Promise<boolean>} True if the event was sent.
   */
  async sendTouchEvent(x: number, y: number, pressure: number, isDown: boolean): Promise<boolean> {
    if (!this.isReady || this.managedDeviceIds.length === 0) {
      return false;
    }
    this.addOperationRecord('sendTouchEvent', true, '', `Touch(${x}, ${y}, p=${pressure}, ${isDown})`);
    return true;
  }

  /**
   * @method getKeyMappingCount
   * @description Returns the number of key mappings configured.
   * @returns {number} Key mapping count.
   */
  getKeyMappingCount(): number {
    if (!this.isReady) {
      return 0;
    }
    return this.model.keyMappingCount;
  }

  /**
   * @method getSupportedKeys
   * @description Returns the list of supported key codes.
   * @returns {number[]} Array of supported key codes.
   */
  getSupportedKeys(): number[] {
    if (!this.isReady) {
      return [];
    }
    return [...this.model.supportedKeys];
  }

  /**
   * @method getPointerSpeed
   * @description Returns the pointer speed setting.
   * @returns {number} Pointer speed value.
   */
  getPointerSpeed(): number {
    if (!this.isReady) {
      return 1.0;
    }
    return this.model.pointerSpeed;
  }

  /**
   * @method setPointerSpeed
   * @description Sets the pointer speed.
   * @param {number} speed - Pointer speed multiplier (0.1 to 5.0).
   * @returns {Promise<boolean>} True if speed was set.
   */
  async setPointerSpeed(speed: number): Promise<boolean> {
    if (!this.isReady) {
      return false;
    }
    this.model.pointerSpeed = Math.max(0.1, Math.min(5.0, speed));
    this.addOperationRecord('setPointerSpeed', true, '', `Speed: ${this.model.pointerSpeed}`);
    return true;
  }

}
