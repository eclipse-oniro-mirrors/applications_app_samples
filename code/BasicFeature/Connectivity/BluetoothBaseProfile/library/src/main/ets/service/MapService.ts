/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { MapModel, MapJson } from '../model/MapModel';
import { BluetoothConstants, BluetoothConnectionState, BluetoothProfileType } from '../constants/BluetoothConstants';
import { Logger } from '../utils/basic/Logger';

/**
 * @interface MapOperationRecord
 * @description Record of an operation performed by the MapService.
 * Used for tracking operation history and debugging.
 */
export interface MapOperationRecord {
  /** Unique identifier for this operation record */
  operationId: string;
  /** Name of the operation that was performed */
  operationName: string;
  /** Timestamp when the operation started */
  startTime: number;
  /** Timestamp when the operation completed */
  endTime: number;
  /** Duration of the operation in milliseconds */
  durationMs: number;
  /** Whether the operation completed successfully */
  success: boolean;
  /** Error message if the operation failed */
  errorMessage: string;
  /** Additional details about the operation */
  details: string;
  /** Device ID associated with this operation */
  deviceId: string;
  /** Parameters passed to the operation */
  parameters: Map<string, string>;
}

/**
 * @interface MapPerformanceMetrics
 * @description Performance metrics for the MapService operations.
 * Tracks operation counts, timing statistics, and error rates.
 */
export interface MapPerformanceMetrics {
  /** Total number of operations performed */
  totalOperations: number;
  /** Number of successful operations */
  successfulOperations: number;
  /** Number of failed operations */
  failedOperations: number;
  /** Average operation duration in milliseconds */
  averageDurationMs: number;
  /** Maximum operation duration in milliseconds */
  maxDurationMs: number;
  /** Minimum operation duration in milliseconds */
  minDurationMs: number;
  /** Error rate as a percentage (0-100) */
  errorRate: number;
  /** Operations per minute */
  operationsPerMinute: number;
  /** Last operation timestamp */
  lastOperationTime: number;
  /** Service uptime in milliseconds */
  uptimeMs: number;
  /** Number of connection events */
  connectionEvents: number;
  /** Number of disconnection events */
  disconnectionEvents: number;
  /** Number of data synchronization events */
  dataSyncEvents: number;
  /** Number of state transitions */
  stateTransitions: number;
}

/**
 * @interface MapConnectionConfig
 * @description Configuration parameters for MAP connections.
 * Controls connection behavior, timeouts, and retry policies.
 */
export interface MapConnectionConfig {
  /** Connection timeout in milliseconds */
  connectionTimeoutMs: number;
  /** Operation timeout in milliseconds */
  operationTimeoutMs: number;
  /** Maximum number of retry attempts */
  maxRetryAttempts: number;
  /** Delay between retry attempts in milliseconds */
  retryDelayMs: number;
  /** Whether to use exponential backoff for retries */
  useExponentialBackoff: boolean;
  /** Maximum backoff delay in milliseconds */
  maxBackoffDelayMs: number;
  /** Whether to auto-reconnect on disconnection */
  autoReconnect: boolean;
  /** Maximum number of auto-reconnect attempts */
  maxAutoReconnectAttempts: number;
  /** Delay before auto-reconnect in milliseconds */
  autoReconnectDelayMs: number;
  /** Whether to log verbose debug information */
  verboseLogging: boolean;
  /** Whether to enable performance tracing */
  enablePerformanceTracing: boolean;
  /** Custom parameters for profile-specific configuration */
  customParameters: Map<string, string>;
}

/**
 * @class MapService
 * @description Service class for managing the Bluetooth MAP (Message Access Profile).
 *
 * <p>This service provides comprehensive functionality for the MAP profile including:</p>
 * <ul>
 *   <li>Device connection and disconnection management</li>
 *   <li>Profile-specific data operations and synchronization</li>
 *   <li>Connection state change notifications via callbacks</li>
 *   <li>Operation history tracking for debugging and auditing</li>
 *   <li>Performance metrics collection and reporting</li>
 *   <li>Configurable connection parameters and retry policies</li>
 *   <li>Resource management with proper lifecycle handling</li>
 *   <li>Performance tracing via hiTraceMeter</li>
 *   <li>Structured logging via hilog</li>
 * </ul>
 *
 * <p>The service follows a standard lifecycle pattern:</p>
 * <ol>
 *   <li>Create an instance of MapService</li>
 *   <li>Call initialize() to set up the service and prepare for connections</li>
 *   <li>Configure connection parameters using setConnectionConfig()</li>
 *   <li>Register callbacks for state changes and data updates</li>
 *   <li>Use connect/disconnect and profile-specific methods as needed</li>
 *   <li>Monitor performance metrics and operation history</li>
 *   <li>Call destroy() when the service is no longer needed to release resources</li>
 * </ol>
 *
 * <p>Thread Safety: This service is designed to be used from the main thread.
 * Callbacks are invoked on the main thread. Concurrent access from multiple
 * threads is not guaranteed to be safe.</p>
 *
 * <p>Error Handling: All async methods return Promises that resolve to boolean
 * success indicators. Failed operations are logged and recorded in the operation
 * history for debugging purposes.</p>
 *
 * @example
 * ```typescript
 * const service = new MapService();
 * await service.initialize();
 * service.addConnectionCallback((state) => {
 *   console.info(`MAP state: ${state}`);
 * });
 * await service.connect('device-id');
 * ```
 *
 * @since 26.0.0
 */
export class MapService {
  /** Service name identifier for logging and tracing */
  private readonly serviceName: string = 'MapService';

  /** Current model containing profile state data */
  private model: MapModel = new MapModel();

  /** Whether the service has been initialized */
  private isInitialized: boolean = false;

  /** Current connection state of the profile */
  private connectionState: BluetoothConnectionState = BluetoothConnectionState.DISCONNECTED;

  /** List of registered connection state change callbacks */
  private connectionCallbacks: Array<(state: BluetoothConnectionState) => void> = [];

  /** List of registered data change callbacks */
  private dataCallbacks: Array<(model: MapModel) => void> = [];

  /** List of registered operation complete callbacks */
  private operationCallbacks: Array<(record: MapOperationRecord) => void> = [];

  /** History of operations performed by this service */
  private operationHistory: Array<{ operation: string; timestamp: number; success: boolean; details: string }> = [];

  /** Detailed operation records for performance analysis */
  private operationRecords: MapOperationRecord[] = [];

  /** Maximum number of operations to retain in history */
  private maxHistorySize: number = 200;

  /** Maximum number of detailed operation records to retain */
  private maxRecordSize: number = 500;

  /** Connected device IDs */
  private connectedDeviceIds: string[] = [];

  /** Connection configuration */
  private connectionConfig: MapConnectionConfig;

  /** Performance metrics */
  private performanceMetrics: MapPerformanceMetrics;

  /** Service start time for uptime tracking */
  private serviceStartTime: number = 0;

  /** Operation ID counter for unique identification */
  private operationIdCounter: number = 0;

  /** Whether the service is currently processing an operation */
  private isProcessing: boolean = false;

  /** Queue of pending operations */
  private operationQueue: Array<() => Promise<boolean>> = [];

  /** Maximum queue size to prevent memory issues */
  private maxQueueSize: number = 50;

  /** Retry state tracking */
  private currentRetryCount: number = 0;

  /** Last error message */
  private lastError: string = '';

  /** State transition history */
  private stateTransitions: Array<{ from: BluetoothConnectionState; to: BluetoothConnectionState; timestamp: number }> = [];

  /**
   * @constructor
   * @description Creates a new instance of MapService with default configuration.
   * The service must be initialized by calling initialize() before use.
   */
  constructor() {
    this.connectionConfig = {
      connectionTimeoutMs: 30000,
      operationTimeoutMs: 10000,
      maxRetryAttempts: 3,
      retryDelayMs: 1000,
      useExponentialBackoff: true,
      maxBackoffDelayMs: 30000,
      autoReconnect: true,
      maxAutoReconnectAttempts: 5,
      autoReconnectDelayMs: 5000,
      verboseLogging: false,
      enablePerformanceTracing: true,
      customParameters: new Map()
    };

    this.performanceMetrics = {
      totalOperations: 0,
      successfulOperations: 0,
      failedOperations: 0,
      averageDurationMs: 0,
      maxDurationMs: 0,
      minDurationMs: Number.MAX_SAFE_INTEGER,
      errorRate: 0,
      operationsPerMinute: 0,
      lastOperationTime: 0,
      uptimeMs: 0,
      connectionEvents: 0,
      disconnectionEvents: 0,
      dataSyncEvents: 0,
      stateTransitions: 0
    };
  }

  /**
   * @method initialize
   * @description Initializes the MAP service and prepares it for connections.
   * This method must be called before any other service methods. It sets up the internal
   * state, initializes the model, and prepares the service for device connections.
   *
   * <p>Initialization steps:</p>
   * <ul>
   *   <li>Verify the service has not already been initialized</li>
   *   <li>Reset the model to default values</li>
   *   <li>Clear all operation history and records</li>
   *   <li>Reset connection state to disconnected</li>
   *   <li>Initialize performance metrics tracking</li>
   *   <li>Record the service start time</li>
   *   <li>Log the initialization event</li>
   *   <li>Trace via hiTraceMeter for performance monitoring</li>
   * </ul>
   *
   * @returns {Promise<boolean>} A promise that resolves to true if initialization was successful,
   *          or false if the service was already initialized or an error occurred.
   *
   * @example
   * ```typescript
   * const success = await service.initialize();
   * if (success) {
   *   console.info('MapService ready');
   * }
   * ```
   */
  async initialize(): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_initialize`, 0);
    Logger.info(BluetoothConstants.TAG, `Initializing ${this.serviceName}`);

    try {
      if (this.isInitialized) {
        hilog.warn(0xF830, BluetoothConstants.TAG, '%{public}s already initialized', this.serviceName);
        this.addHistoryEntry('initialize', false, 'Already initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_initialize`, 0);
        return false;
      }

      this.model = new MapModel();
      this.connectionState = BluetoothConnectionState.DISCONNECTED;
      this.operationHistory = [];
      this.operationRecords = [];
      this.connectedDeviceIds = [];
      this.operationIdCounter = 0;
      this.isProcessing = false;
      this.operationQueue = [];
      this.currentRetryCount = 0;
      this.lastError = '';
      this.stateTransitions = [];
      this.serviceStartTime = Date.now();

      this.performanceMetrics = {
        totalOperations: 0,
        successfulOperations: 0,
        failedOperations: 0,
        averageDurationMs: 0,
        maxDurationMs: 0,
        minDurationMs: Number.MAX_SAFE_INTEGER,
        errorRate: 0,
        operationsPerMinute: 0,
        lastOperationTime: 0,
        uptimeMs: 0,
        connectionEvents: 0,
        disconnectionEvents: 0,
        dataSyncEvents: 0,
        stateTransitions: 0
      };

      this.isInitialized = true;
      this.addHistoryEntry('initialize', true, 'Service initialized successfully');

      hilog.info(0xF830, BluetoothConstants.TAG, '%{public}s initialized successfully', this.serviceName);
      hiTraceMeter.finishTrace(`${this.serviceName}_initialize`, 0);
      return true;
    } catch (error) {
      hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s initialization failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      this.addHistoryEntry('initialize', false, `Error: ${JSON.stringify(error)}`);
      hiTraceMeter.finishTrace(`${this.serviceName}_initialize`, 0);
      return false;
    }
  }

  /**
   * @method connect
   * @description Establishes a MAP connection with the specified Bluetooth device.
   * This method initiates the profile connection setup, negotiates parameters,
   * and prepares the device for profile-specific operations.
   *
   * <p>The connection process involves:</p>
   * <ol>
   *   <li>Validating the device ID parameter</li>
   *   <li>Checking if already connected to this device</li>
   *   <li>Transitioning to CONNECTING state</li>
   *   <li>Simulating the connection establishment</li>
   *   <li>Transitioning to CONNECTED state</li>
   *   <li>Updating the model and notifying callbacks</li>
   *   <li>Recording the connection event in metrics</li>
   * </ol>
   *
   * @param {string} deviceId - The unique identifier of the Bluetooth device to connect to.
   *        This should be a valid device ID obtained from device scanning or pairing.
   * @returns {Promise<boolean>} A promise that resolves to true if the connection was
   *          successfully established, or false if the connection failed.
   */
  async connect(deviceId: string): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_connect`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} connecting to device: ${deviceId}`);

    try {
      if (!this.isInitialized) {
        hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s not initialized', this.serviceName);
        this.addHistoryEntry('connect', false, 'Service not initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
        return false;
      }

      if (!deviceId || deviceId.length === 0) {
        hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s invalid device ID', this.serviceName);
        this.addHistoryEntry('connect', false, 'Invalid device ID');
        hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
        return false;
      }

      if (this.connectedDeviceIds.includes(deviceId)) {
        hilog.warn(0xF830, BluetoothConstants.TAG, '%{public}s already connected to %{public}s',
          this.serviceName, deviceId);
        this.addHistoryEntry('connect', false, 'Already connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
        return true;
      }

      this.transitionState(BluetoothConnectionState.CONNECTING);
      await this.simulateDelay(this.connectionConfig.connectionTimeoutMs > 1000 ? 700 : 500);

      this.connectedDeviceIds.push(deviceId);
      this.transitionState(BluetoothConnectionState.CONNECTED);
      this.model.updateConnectionState(BluetoothConnectionState.CONNECTED);

      this.performanceMetrics.connectionEvents++;
      this.notifyConnectionCallbacks();
      this.notifyDataCallbacks();
      this.addHistoryEntry('connect', true, `Connected to ${deviceId}`);
      this.addOperationRecord('connect', deviceId, true, '', `Connected to ${deviceId}`);

      hilog.info(0xF830, BluetoothConstants.TAG, '%{public}s connected to %{public}s', this.serviceName, deviceId);
      hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
      return true;
    } catch (error) {
      this.transitionState(BluetoothConnectionState.DISCONNECTED);
      this.addHistoryEntry('connect', false, `Error: ${JSON.stringify(error)}`);
      this.addOperationRecord('connect', deviceId, false, JSON.stringify(error), 'Connection failed');
      hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s connect failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.serviceName}_connect`, 0);
      return false;
    }
  }

  /**
   * @method disconnect
   * @description Disconnects the MAP connection from the specified device.
   * Tears down the profile connection and releases associated resources.
   *
   * @param {string} deviceId - The unique identifier of the device to disconnect from.
   * @returns {Promise<boolean>} A promise that resolves to true if disconnection was successful.
   */
  async disconnect(deviceId: string): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_disconnect`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} disconnecting from: ${deviceId}`);

    try {
      if (!this.isInitialized) {
        this.addHistoryEntry('disconnect', false, 'Not initialized');
        hiTraceMeter.finishTrace(`${this.serviceName}_disconnect`, 0);
        return false;
      }

      const index = this.connectedDeviceIds.indexOf(deviceId);
      if (index === -1) {
        this.addHistoryEntry('disconnect', false, 'Device not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_disconnect`, 0);
        return false;
      }

      this.transitionState(BluetoothConnectionState.DISCONNECTING);
      await this.simulateDelay(300);

      this.connectedDeviceIds.splice(index, 1);
      this.performanceMetrics.disconnectionEvents++;

      if (this.connectedDeviceIds.length === 0) {
        this.transitionState(BluetoothConnectionState.DISCONNECTED);
        this.model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
        this.model.reset();
      } else {
        this.transitionState(BluetoothConnectionState.CONNECTED);
      }

      this.notifyConnectionCallbacks();
      this.notifyDataCallbacks();
      this.addHistoryEntry('disconnect', true, `Disconnected from ${deviceId}`);
      this.addOperationRecord('disconnect', deviceId, true, '', 'Disconnected successfully');

      hiTraceMeter.finishTrace(`${this.serviceName}_disconnect`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('disconnect', false, `Error: ${JSON.stringify(error)}`);
      this.addOperationRecord('disconnect', deviceId, false, JSON.stringify(error), 'Disconnect failed');
      hiTraceMeter.finishTrace(`${this.serviceName}_disconnect`, 0);
      return false;
    }
  }

  /**
   * @method syncData
   * @description Initiates a data synchronization operation with the connected device.
   * The specific data synchronized depends on the profile type.
   *
   * @param {string} deviceId - The device to synchronize data with.
   * @returns {Promise<boolean>} True if synchronization was successful.
   */
  async syncData(deviceId: string): Promise<boolean> {
    hiTraceMeter.startTrace(`${this.serviceName}_syncData`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} sync data from: ${deviceId}`);

    try {
      if (!this.isInitialized || !this.connectedDeviceIds.includes(deviceId)) {
        this.addHistoryEntry('syncData', false, 'Not connected');
        hiTraceMeter.finishTrace(`${this.serviceName}_syncData`, 0);
        return false;
      }

      this.performanceMetrics.dataSyncEvents++;
      await this.simulateDelay(500);

      this.addHistoryEntry('syncData', true, `Data synced from ${deviceId}`);
      this.addOperationRecord('syncData', deviceId, true, '', 'Data synchronized');
      this.notifyDataCallbacks();

      hiTraceMeter.finishTrace(`${this.serviceName}_syncData`, 0);
      return true;
    } catch (error) {
      this.addHistoryEntry('syncData', false, `Error: ${JSON.stringify(error)}`);
      this.addOperationRecord('syncData', deviceId, false, JSON.stringify(error), 'Sync failed');
      hiTraceMeter.finishTrace(`${this.serviceName}_syncData`, 0);
      return false;
    }
  }

  /**
   * @method getConnectionState
   * @description Returns the current connection state.
   * @returns {BluetoothConnectionState} The current connection state.
   */
  getConnectionState(): BluetoothConnectionState {
    return this.connectionState;
  }

  /**
   * @method getModel
   * @description Returns the current profile model.
   * @returns {MapModel} The current model.
   */
  getModel(): MapModel {
    return this.model;
  }

  /**
   * @method isConnected
   * @description Checks if the service is connected.
   * @returns {boolean} True if connected.
   */
  isConnected(): boolean {
    return this.connectionState === BluetoothConnectionState.CONNECTED;
  }

  /**
   * @method getConnectedDeviceIds
   * @description Returns the list of connected device IDs.
   * @returns {string[]} Array of connected device IDs.
   */
  getConnectedDeviceIds(): string[] {
    return [...this.connectedDeviceIds];
  }

  /**
   * @method setConnectionConfig
   * @description Updates the connection configuration parameters.
   * @param {Partial<MapConnectionConfig>} config - Partial configuration to update.
   */
  setConnectionConfig(config: Partial<MapConnectionConfig>): void {
    this.connectionConfig = { ...this.connectionConfig, ...config };
    hilog.debug(0xF830, BluetoothConstants.TAG, '%{public}s config updated', this.serviceName);
  }

  /**
   * @method getConnectionConfig
   * @description Returns the current connection configuration.
   * @returns {MapConnectionConfig} The current configuration.
   */
  getConnectionConfig(): MapConnectionConfig {
    return { ...this.connectionConfig };
  }

  /**
   * @method getPerformanceMetrics
   * @description Returns the current performance metrics.
   * @returns {MapPerformanceMetrics} The performance metrics.
   */
  getPerformanceMetrics(): MapPerformanceMetrics {
    const uptime = this.serviceStartTime > 0 ? Date.now() - this.serviceStartTime : 0;
    return {
      ...this.performanceMetrics,
      uptimeMs: uptime,
      errorRate: this.performanceMetrics.totalOperations > 0
        ? (this.performanceMetrics.failedOperations / this.performanceMetrics.totalOperations) * 100
        : 0,
      operationsPerMinute: uptime > 0
        ? (this.performanceMetrics.totalOperations / (uptime / 60000))
        : 0
    };
  }

  /**
   * @method getOperationRecords
   * @description Returns the detailed operation records.
   * @returns {MapOperationRecord[]} Array of operation records.
   */
  getOperationRecords(): MapOperationRecord[] {
    return [...this.operationRecords];
  }

  /**
   * @method getStateTransitions
   * @description Returns the state transition history.
   * @returns {Array<{ from: BluetoothConnectionState; to: BluetoothConnectionState; timestamp: number }>}
   */
  getStateTransitions(): Array<{ from: BluetoothConnectionState; to: BluetoothConnectionState; timestamp: number }> {
    return [...this.stateTransitions];
  }

  /**
   * @method addConnectionCallback
   * @description Registers a connection state change callback.
   * @param {(state: BluetoothConnectionState) => void} callback - The callback function.
   */
  addConnectionCallback(callback: (state: BluetoothConnectionState) => void): void {
    if (!this.connectionCallbacks.includes(callback)) {
      this.connectionCallbacks.push(callback);
    }
  }

  /**
   * @method removeConnectionCallback
   * @description Removes a connection state change callback.
   * @param {(state: BluetoothConnectionState) => void} callback - The callback to remove.
   */
  removeConnectionCallback(callback: (state: BluetoothConnectionState) => void): void {
    const index = this.connectionCallbacks.indexOf(callback);
    if (index !== -1) {
      this.connectionCallbacks.splice(index, 1);
    }
  }

  /**
   * @method addDataCallback
   * @description Registers a data change callback.
   * @param {(model: MapModel) => void} callback - The callback function.
   */
  addDataCallback(callback: (model: MapModel) => void): void {
    if (!this.dataCallbacks.includes(callback)) {
      this.dataCallbacks.push(callback);
    }
  }

  /**
   * @method removeDataCallback
   * @description Removes a data change callback.
   * @param {(model: MapModel) => void} callback - The callback to remove.
   */
  removeDataCallback(callback: (model: MapModel) => void): void {
    const index = this.dataCallbacks.indexOf(callback);
    if (index !== -1) {
      this.dataCallbacks.splice(index, 1);
    }
  }

  /**
   * @method addOperationCallback
   * @description Registers an operation complete callback.
   * @param {(record: MapOperationRecord) => void} callback - The callback function.
   */
  addOperationCallback(callback: (record: MapOperationRecord) => void): void {
    if (!this.operationCallbacks.includes(callback)) {
      this.operationCallbacks.push(callback);
    }
  }

  /**
   * @method removeOperationCallback
   * @description Removes an operation complete callback.
   * @param {(record: MapOperationRecord) => void} callback - The callback to remove.
   */
  removeOperationCallback(callback: (record: MapOperationRecord) => void): void {
    const index = this.operationCallbacks.indexOf(callback);
    if (index !== -1) {
      this.operationCallbacks.splice(index, 1);
    }
  }

  /**
   * @method getOperationHistory
   * @description Returns the operation history.
   * @returns {Array<{operation: string; timestamp: number; success: boolean; details: string}>}
   */
  getOperationHistory(): Array<{ operation: string; timestamp: number; success: boolean; details: string }> {
    return [...this.operationHistory];
  }

  /**
   * @method getStatistics
   * @description Returns comprehensive service statistics.
   * @returns {object} Statistics object with connection, operation, and performance data.
   */
  getStatistics(): object {
    const metrics = this.getPerformanceMetrics();
    return {
      serviceName: this.serviceName,
      isInitialized: this.isInitialized,
      connectionState: this.connectionState,
      connectedDeviceCount: this.connectedDeviceIds.length,
      connectedDevices: [...this.connectedDeviceIds],
      isProcessing: this.isProcessing,
      queueSize: this.operationQueue.length,
      currentRetryCount: this.currentRetryCount,
      lastError: this.lastError,
      stateTransitionCount: this.stateTransitions.length,
      performanceMetrics: metrics,
      operationHistoryCount: this.operationHistory.length,
      operationRecordCount: this.operationRecords.length,
      callbackCounts: {
        connection: this.connectionCallbacks.length,
        data: this.dataCallbacks.length,
        operation: this.operationCallbacks.length
      }
    };
  }

  /**
   * @method reset
   * @description Resets the service to its initial state.
   * Disconnects all devices and clears all cached data.
   * @returns {Promise<void>}
   */
  async reset(): Promise<void> {
    hiTraceMeter.startTrace(`${this.serviceName}_reset`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} reset requested`);

    try {
      for (const deviceId of [...this.connectedDeviceIds]) {
        await this.disconnect(deviceId);
      }

      this.model = new MapModel();
      this.connectionState = BluetoothConnectionState.DISCONNECTED;
      this.operationHistory = [];
      this.operationRecords = [];
      this.connectedDeviceIds = [];
      this.isProcessing = false;
      this.operationQueue = [];
      this.currentRetryCount = 0;
      this.lastError = '';
      this.stateTransitions = [];
      this.serviceStartTime = Date.now();

      this.addHistoryEntry('reset', true, 'Service reset');
      hiTraceMeter.finishTrace(`${this.serviceName}_reset`, 0);
    } catch (error) {
      hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s reset failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.serviceName}_reset`, 0);
    }
  }

  /**
   * @method destroy
   * @description Destroys the service and releases all resources.
   * After calling this method, the service must be re-initialized before use.
   * @returns {Promise<void>}
   */
  async destroy(): Promise<void> {
    hiTraceMeter.startTrace(`${this.serviceName}_destroy`, 0);
    Logger.info(BluetoothConstants.TAG, `${this.serviceName} destroy requested`);

    try {
      await this.reset();
      this.connectionCallbacks = [];
      this.dataCallbacks = [];
      this.operationCallbacks = [];
      this.isInitialized = false;

      hilog.info(0xF830, BluetoothConstants.TAG, '%{public}s destroyed', this.serviceName);
      hiTraceMeter.finishTrace(`${this.serviceName}_destroy`, 0);
    } catch (error) {
      hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s destroy failed: %{public}s',
        this.serviceName, JSON.stringify(error));
      hiTraceMeter.finishTrace(`${this.serviceName}_destroy`, 0);
    }
  }

  /**
   * @method transitionState
   * @description Transitions the service to a new connection state and records the transition.
   * @param {BluetoothConnectionState} newState - The new state to transition to.
   * @private
   */
  private transitionState(newState: BluetoothConnectionState): void {
    if (this.connectionState !== newState) {
      this.stateTransitions.push({
        from: this.connectionState,
        to: newState,
        timestamp: Date.now()
      });
      this.performanceMetrics.stateTransitions++;
      this.connectionState = newState;
    }
  }

  /**
   * @method notifyConnectionCallbacks
   * @description Notifies all registered connection state callbacks.
   * @private
   */
  private notifyConnectionCallbacks(): void {
    for (const callback of this.connectionCallbacks) {
      try {
        callback(this.connectionState);
      } catch (error) {
        hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s callback error: %{public}s',
          this.serviceName, JSON.stringify(error));
      }
    }
  }

  /**
   * @method notifyDataCallbacks
   * @description Notifies all registered data change callbacks.
   * @private
   */
  private notifyDataCallbacks(): void {
    for (const callback of this.dataCallbacks) {
      try {
        callback(this.model);
      } catch (error) {
        hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s data callback error: %{public}s',
          this.serviceName, JSON.stringify(error));
      }
    }
  }

  /**
   * @method notifyOperationCallbacks
   * @description Notifies all registered operation complete callbacks.
   * @param {MapOperationRecord} record - The operation record.
   * @private
   */
  private notifyOperationCallbacks(record: MapOperationRecord): void {
    for (const callback of this.operationCallbacks) {
      try {
        callback(record);
      } catch (error) {
        hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s operation callback error: %{public}s',
          this.serviceName, JSON.stringify(error));
      }
    }
  }

  /**
   * @method addHistoryEntry
   * @description Adds an entry to the operation history.
   * @param {string} operation - The operation name.
   * @param {boolean} success - Whether the operation succeeded.
   * @param {string} details - Additional details.
   * @private
   */
  private addHistoryEntry(operation: string, success: boolean, details: string): void {
    this.operationHistory.push({
      operation,
      timestamp: Date.now(),
      success,
      details
    });
    if (this.operationHistory.length > this.maxHistorySize) {
      this.operationHistory.shift();
    }
  }

  /**
   * @method addOperationRecord
   * @description Adds a detailed operation record for performance analysis.
   * @param {string} operationName - The operation name.
   * @param {string} deviceId - The device ID.
   * @param {boolean} success - Whether the operation succeeded.
   * @param {string} errorMessage - Error message if failed.
   * @param {string} details - Additional details.
   * @private
   */
  private addOperationRecord(operationName: string, deviceId: string, success: boolean,
    errorMessage: string, details: string): void {
    const now = Date.now();
    const record: MapOperationRecord = {
      operationId: `op_${++this.operationIdCounter}`,
      operationName,
      startTime: now,
      endTime: now,
      durationMs: 0,
      success,
      errorMessage,
      details,
      deviceId,
      parameters: new Map()
    };

    this.operationRecords.push(record);
    if (this.operationRecords.length > this.maxRecordSize) {
      this.operationRecords.shift();
    }

    this.performanceMetrics.totalOperations++;
    if (success) {
      this.performanceMetrics.successfulOperations++;
    } else {
      this.performanceMetrics.failedOperations++;
    }
    this.performanceMetrics.lastOperationTime = now;

    this.notifyOperationCallbacks(record);
  }

  /**
   * @method simulateDelay
   * @description Simulates a network delay for operations.
   * @param {number} delayMs - The delay in milliseconds.
   * @returns {Promise<void>}
   * @private
   */
  private async simulateDelay(delayMs: number): Promise<void> {
    return new Promise<void>((resolve) => {
      setTimeout(resolve, delayMs);
    });
  }
}
