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

import { describe, it, expect } from '@ohos/hypium';
import { BluetoothConnectionState, PanModel, PanService, PanState } from 'library';

const SERVICE_NAME: string = 'PanService';
const DEVICE_A: string = 'pan_service_device_a';
const DEVICE_B: string = 'pan_service_device_b';
const MAX_HISTORY: number = 200;
const DEFAULT_CONNECTION_TIMEOUT: number = 30000;
const DEFAULT_OPERATION_TIMEOUT: number = 10000;
const DEFAULT_MAX_RETRY: number = 3;
const DEFAULT_RETRY_DELAY: number = 1000;
const DEFAULT_MAX_BACKOFF: number = 30000;
const DEFAULT_AUTO_RECONNECT_ATTEMPTS: number = 5;
const DEFAULT_AUTO_RECONNECT_DELAY: number = 5000;

interface HistoryEntryView {
  operation: string;
  timestamp: number;
  success: boolean;
  details: string;
}

interface RecordView {
  operationId: string;
  operationName: string;
  startTime: number;
  endTime: number;
  durationMs: number;
  success: boolean;
  errorMessage: string;
  details: string;
  deviceId: string;
}

interface StatsView {
  serviceName: string;
  isInitialized: boolean;
  connectionState: string;
  connectedDeviceCount: number;
  isProcessing: boolean;
  queueSize: number;
  currentRetryCount: number;
  lastError: string;
  stateTransitionCount: number;
  operationHistoryCount: number;
  operationRecordCount: number;
  connectionCallbackCount: number;
  dataCallbackCount: number;
  operationCallbackCount: number;
}

/**
 * 复制操作历史为具名视图数组。
 * @param {PanService} service - 被测服务
 * @returns {HistoryEntryView[]} 历史条目副本
 */
function historyOf(service: PanService): HistoryEntryView[] {
  const raw = service.getOperationHistory();
  const result: HistoryEntryView[] = [];
  for (const entry of raw) {
    result.push({
      operation: entry.operation,
      timestamp: entry.timestamp,
      success: entry.success,
      details: entry.details
    });
  }
  return result;
}

/**
 * 统计指定操作名的历史条目数量。
 * @param {PanService} service - 被测服务
 * @param {string} operation - 操作名
 * @returns {number} 匹配条目数
 */
function countHistory(service: PanService, operation: string): number {
  let count: number = 0;
  for (const entry of historyOf(service)) {
    if (entry.operation === operation) {
      count += 1;
    }
  }
  return count;
}

/**
 * 读取末条操作历史，空历史返回空条目。
 * @param {PanService} service - 被测服务
 * @returns {HistoryEntryView} 末条历史
 */
function lastHistory(service: PanService): HistoryEntryView {
  const entries = historyOf(service);
  if (entries.length === 0) {
    return { operation: '', timestamp: 0, success: false, details: '' };
  }
  return entries[entries.length - 1];
}

/**
 * 读取末条操作记录，空记录返回空条目。
 * @param {PanService} service - 被测服务
 * @returns {RecordView} 末条记录
 */
function lastRecord(service: PanService): RecordView {
  const records = service.getOperationRecords();
  if (records.length === 0) {
    return {
      operationId: '', operationName: '', startTime: 0, endTime: 0,
      durationMs: 0, success: false, errorMessage: '', details: '', deviceId: ''
    };
  }
  const record = records[records.length - 1];
  return {
    operationId: record.operationId,
    operationName: record.operationName,
    startTime: record.startTime,
    endTime: record.endTime,
    durationMs: record.durationMs,
    success: record.success,
    errorMessage: record.errorMessage,
    details: record.details,
    deviceId: record.deviceId
  };
}

/**
 * 读取统计快照，getStatistics 返回裸 object，需经 ESObject 取字段。
 * @param {PanService} service - 被测服务
 * @returns {StatsView} 统计快照
 */
function statsOf(service: PanService): StatsView {
  const stats: ESObject = service.getStatistics();
  const callbacks: ESObject = stats.callbackCounts;
  return {
    serviceName: stats.serviceName,
    isInitialized: stats.isInitialized,
    connectionState: stats.connectionState,
    connectedDeviceCount: stats.connectedDeviceCount,
    isProcessing: stats.isProcessing,
    queueSize: stats.queueSize,
    currentRetryCount: stats.currentRetryCount,
    lastError: stats.lastError,
    stateTransitionCount: stats.stateTransitionCount,
    operationHistoryCount: stats.operationHistoryCount,
    operationRecordCount: stats.operationRecordCount,
    connectionCallbackCount: callbacks.connection,
    dataCallbackCount: callbacks.data,
    operationCallbackCount: callbacks.operation
  };
}

/**
 * @description Test suite for PanService
 * @since 26.0.0
 */
export default function panServiceTest(): void {
  describe('PanServiceTest', () => {
    // ==================== 生命周期与初始化（5 条） ====================

    /*
     * @tc.number: SUB_PAN_SERVICE_0100
     * @tc.name: testPanService0001
     * @tc.desc: Verify the default view of a service instance created but never initialized.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0001', 0, () => {
      const service = new PanService();

      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.getOperationHistory().length).assertEqual(0);
      expect(service.getOperationRecords().length).assertEqual(0);
      expect(service.getStateTransitions().length).assertEqual(0);

      const model = service.getModel();
      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      expect(model.operationCount).assertEqual(0);
      expect(model.getLogs().length).assertEqual(0);

      const stats = statsOf(service);
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      expect(stats.isInitialized).assertFalse();
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(stats.isProcessing).assertFalse();
      expect(stats.queueSize).assertEqual(0);
      expect(stats.currentRetryCount).assertEqual(0);
      expect(stats.lastError).assertEqual('');
      expect(stats.stateTransitionCount).assertEqual(0);
      expect(stats.operationHistoryCount).assertEqual(0);
      expect(stats.operationRecordCount).assertEqual(0);
      expect(stats.connectionCallbackCount).assertEqual(0);
      expect(stats.dataCallbackCount).assertEqual(0);
      expect(stats.operationCallbackCount).assertEqual(0);
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_0200
     * @tc.name: testPanService0002
     * @tc.desc: Verify the first initialize call succeeds and establishes a clean service baseline.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0002', 0, async () => {
      const service = new PanService();
      const modelBeforeInit = service.getModel();
      const before: number = Date.now();

      const result = await service.initialize();
      const after: number = Date.now();

      expect(result).assertTrue();
      expect(statsOf(service).isInitialized).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.getStateTransitions().length).assertEqual(0);
      expect(service.getOperationRecords().length).assertEqual(0);

      const history = historyOf(service);
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('initialize');
      expect(history[0].success).assertTrue();
      expect(history[0].details).assertEqual('Service initialized successfully');
      expect(history[0].timestamp >= before && history[0].timestamp <= after).assertTrue();

      const model = service.getModel();
      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(PanState.DISCONNECTED);

      const metrics = service.getPerformanceMetrics();
      expect(metrics.totalOperations).assertEqual(0);
      expect(metrics.successfulOperations).assertEqual(0);
      expect(metrics.failedOperations).assertEqual(0);
      expect(metrics.connectionEvents).assertEqual(0);
      expect(metrics.disconnectionEvents).assertEqual(0);
      expect(metrics.dataSyncEvents).assertEqual(0);
      expect(metrics.lastOperationTime).assertEqual(0);
      expect(metrics.uptimeMs < 60000).assertTrue();
      expect(service.getModel() !== modelBeforeInit).assertTrue();
      expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_0300
     * @tc.name: testPanService0003
     * @tc.desc: Verify a repeated initialize is rejected and preserves the live connection state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0003', 0, async () => {
      const service = new PanService();
      await service.initialize();
      await service.connect(DEVICE_A);
      const historyBefore: number = service.getOperationHistory().length;
      const recordsBefore: number = service.getOperationRecords().length;
      const transitionsBefore: number = service.getStateTransitions().length;
      const modelBefore = service.getModel();

      const second = await service.initialize();

      expect(second).assertFalse();
      expect(service.isConnected()).assertTrue();
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(service.getOperationHistory().length).assertEqual(historyBefore + 1);
      expect(service.getOperationRecords().length).assertEqual(recordsBefore);
      expect(service.getStateTransitions().length).assertEqual(transitionsBefore);
      expect(service.getModel() === modelBefore).assertTrue();

      const entry = lastHistory(service);
      expect(entry.operation).assertEqual('initialize');
      expect(entry.success).assertFalse();
      expect(entry.details).assertEqual('Already initialized');

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_0400
     * @tc.name: testPanService0004
     * @tc.desc: Verify connect and syncData are rejected before the service is initialized.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0004', 0, async () => {
      const service = new PanService();

      const connected = await service.connect(DEVICE_A);
      const synced = await service.syncData(DEVICE_A);
      const disconnected = await service.disconnect(DEVICE_A);

      expect(connected).assertFalse();
      expect(synced).assertFalse();
      expect(disconnected).assertFalse();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.getStateTransitions().length).assertEqual(0);
      expect(service.getOperationRecords().length).assertEqual(0);
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(0);

      const history = historyOf(service);
      expect(history.length).assertEqual(3);
      expect(history[0].operation).assertEqual('connect');
      expect(history[0].details).assertEqual('Service not initialized');
      expect(history[0].success).assertFalse();
      expect(history[1].operation).assertEqual('syncData');
      expect(history[1].details).assertEqual('Not connected');
      expect(history[2].operation).assertEqual('disconnect');
      expect(history[2].details).assertEqual('Not initialized');

      const stats = statsOf(service);
      expect(stats.isInitialized).assertFalse();
      expect(stats.operationHistoryCount).assertEqual(3);
      expect(stats.operationRecordCount).assertEqual(0);
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_0500
     * @tc.name: testPanService0005
     * @tc.desc: Verify destroy releases all callbacks and lets the service be initialized again.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0005', 0, async () => {
      const service = new PanService();
      await service.initialize();
      const signals: string[] = [];
      const connectionCallback = (state: BluetoothConnectionState): void => {
        signals.push('connection:' + state);
      };
      const dataCallback = (model: PanModel): void => {
        signals.push('data:' + model.deviceId);
      };
      service.addConnectionCallback(connectionCallback);
      service.addDataCallback(dataCallback);
      expect(statsOf(service).connectionCallbackCount).assertEqual(1);
      expect(statsOf(service).dataCallbackCount).assertEqual(1);

      await service.connect(DEVICE_A);
      expect(signals.length).assertEqual(2);
      await service.destroy();

      expect(signals[0]).assertEqual('connection:connected');
      expect(signals[1]).assertEqual('data:');
      expect(statsOf(service).isInitialized).assertFalse();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(statsOf(service).connectionCallbackCount).assertEqual(0);
      expect(statsOf(service).dataCallbackCount).assertEqual(0);
      expect(statsOf(service).operationCallbackCount).assertEqual(0);
      expect(service.getStateTransitions().length).assertEqual(0);
      expect(service.getOperationRecords().length).assertEqual(0);

      const history = historyOf(service);
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('reset');
      expect(history[0].details).assertEqual('Service reset');

      expect(await service.initialize()).assertTrue();
      expect(await service.connect(DEVICE_B)).assertTrue();
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B);

      await service.destroy();
    });

    // ==================== 连接与断开（6 条） ====================

    /*
     * @tc.number: SUB_PAN_SERVICE_0600
     * @tc.name: testPanService0006
     * @tc.desc: Verify a successful connection writes transitions history and an operation record.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0006', 0, async () => {
      const service = new PanService();
      await service.initialize();
      const started: number = Date.now();

      const result = await service.connect(DEVICE_A);
      const finished: number = Date.now();

      expect(result).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(service.isConnected()).assertTrue();
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);

      const transitions = service.getStateTransitions();
      expect(transitions.length).assertEqual(2);
      expect(transitions[0].from).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(transitions[0].to).assertEqual(BluetoothConnectionState.CONNECTING);
      expect(transitions[1].from).assertEqual(BluetoothConnectionState.CONNECTING);
      expect(transitions[1].to).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(transitions[0].timestamp >= started && transitions[1].timestamp <= finished).assertTrue();

      const entry = lastHistory(service);
      expect(entry.operation).assertEqual('connect');
      expect(entry.success).assertTrue();
      expect(entry.details).assertEqual('Connected to ' + DEVICE_A);

      const record = lastRecord(service);
      expect(record.operationId).assertEqual('op_1');
      expect(record.operationName).assertEqual('connect');
      expect(record.deviceId).assertEqual(DEVICE_A);
      expect(record.success).assertTrue();
      expect(record.errorMessage).assertEqual('');
      expect(record.details).assertEqual('Connected to ' + DEVICE_A);
      expect(record.startTime).assertEqual(record.endTime);
      expect(record.durationMs).assertEqual(0);

      const metrics = service.getPerformanceMetrics();
      expect(metrics.totalOperations).assertEqual(1);
      expect(metrics.successfulOperations).assertEqual(1);
      expect(metrics.connectionEvents).assertEqual(1);
      expect(metrics.stateTransitions).assertEqual(2);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_0700
     * @tc.name: testPanService0007
     * @tc.desc: Verify connect rejects an empty device identifier without changing any state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0007', 0, async () => {
      const service = new PanService();
      await service.initialize();

      const empty = await service.connect('');
      const blank = await service.connect('');

      expect(empty).assertFalse();
      expect(blank).assertFalse();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.getStateTransitions().length).assertEqual(0);
      expect(service.getOperationRecords().length).assertEqual(0);
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(0);
      expect(countHistory(service, 'connect')).assertEqual(2);

      const entry = lastHistory(service);
      expect(entry.success).assertFalse();
      expect(entry.details).assertEqual('Invalid device ID');

      const stats = statsOf(service);
      expect(stats.stateTransitionCount).assertEqual(0);
      expect(stats.operationRecordCount).assertEqual(0);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_0800
     * @tc.name: testPanService0008
     * @tc.desc: Verify reconnecting an already connected device reports success without new side effects.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0008', 0, async () => {
      const service = new PanService();
      await service.initialize();
      await service.connect(DEVICE_A);
      const historyBefore: number = service.getOperationHistory().length;
      const record = lastRecord(service);

      const repeated = await service.connect(DEVICE_A);

      expect(repeated).assertTrue();
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      expect(service.getStateTransitions().length).assertEqual(2);
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(1);
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(1);
      expect(service.getOperationHistory().length).assertEqual(historyBefore + 1);
      expect(lastRecord(service).operationId).assertEqual(record.operationId);

      const entry = lastHistory(service);
      expect(entry.operation).assertEqual('connect');
      expect(entry.success).assertFalse();
      expect(entry.details).assertEqual('Already connected');

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_0900
     * @tc.name: testPanService0009
     * @tc.desc: Verify two devices can be connected and are tracked in the order they joined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0009', 0, async () => {
      const service = new PanService();
      await service.initialize();

      expect(await service.connect(DEVICE_A)).assertTrue();
      expect(await service.connect(DEVICE_B)).assertTrue();

      const devices = service.getConnectedDeviceIds();
      expect(devices.length).assertEqual(2);
      expect(devices[0]).assertEqual(DEVICE_A);
      expect(devices[1]).assertEqual(DEVICE_B);
      expect(service.isConnected()).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(service.getStateTransitions().length).assertEqual(4);
      expect(service.getOperationRecords().length).assertEqual(2);
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(2);
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(2);
      expect(countHistory(service, 'connect')).assertEqual(2);

      const secondRecord = lastRecord(service);
      expect(secondRecord.operationId).assertEqual('op_2');
      expect(secondRecord.deviceId).assertEqual(DEVICE_B);

      const stats = statsOf(service);
      expect(stats.connectedDeviceCount).assertEqual(2);
      expect(stats.stateTransitionCount).assertEqual(4);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_1000
     * @tc.name: testPanService0010
     * @tc.desc: Verify disconnecting an unknown device is rejected and leaves the connection untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0010', 0, async () => {
      const service = new PanService();
      await service.initialize();
      await service.connect(DEVICE_A);
      const historyBefore: number = service.getOperationHistory().length;

      const result = await service.disconnect('pan_service_device_unknown');

      expect(result).assertFalse();
      expect(service.isConnected()).assertTrue();
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      expect(service.getStateTransitions().length).assertEqual(2);
      expect(service.getOperationRecords().length).assertEqual(1);
      expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(0);
      expect(service.getOperationHistory().length).assertEqual(historyBefore + 1);

      const entry = lastHistory(service);
      expect(entry.operation).assertEqual('disconnect');
      expect(entry.success).assertFalse();
      expect(entry.details).assertEqual('Device not connected');

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_1100
     * @tc.name: testPanService0011
     * @tc.desc: Verify disconnecting one of two devices keeps the service connected and skips the model reset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0011', 0, async () => {
      const service = new PanService();
      await service.initialize();
      await service.connect(DEVICE_A);
      await service.connect(DEVICE_B);
      const modelBefore = service.getModel();
      modelBefore.markConnecting();
      const transitionsBefore: number = service.getStateTransitions().length;

      const result = await service.disconnect(DEVICE_A);

      expect(result).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(service.isConnected()).assertTrue();
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B);
      expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(1);
      expect(service.getModel() === modelBefore).assertTrue();
      expect(service.getModel().state).assertEqual(PanState.CONNECTING);

      const transitions = service.getStateTransitions();
      expect(transitions.length).assertEqual(transitionsBefore + 2);
      expect(transitions[transitions.length - 2].to).assertEqual(BluetoothConnectionState.DISCONNECTING);
      expect(transitions[transitions.length - 1].to).assertEqual(BluetoothConnectionState.CONNECTED);

      const record = lastRecord(service);
      expect(record.operationName).assertEqual('disconnect');
      expect(record.deviceId).assertEqual(DEVICE_A);
      expect(record.details).assertEqual('Disconnected successfully');
      expect(record.operationId).assertEqual('op_3');

      await service.destroy();
    });

    // ==================== 模型联动（3 条） ====================

    /*
     * @tc.number: SUB_PAN_SERVICE_1200
     * @tc.name: testPanService0012
     * @tc.desc: Verify a successful connection leaves the bound model untouched by the state entry point.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0012', 0, async () => {
      const service = new PanService();
      await service.initialize();
      const model = service.getModel();

      await service.connect(DEVICE_A);

      expect(service.isConnected()).assertTrue();
      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      expect(model.isConnected()).assertFalse();
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(service.getModel() === model).assertTrue();

      await service.disconnect(DEVICE_A);

      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      expect(model.getLogs().length).assertEqual(0);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_1300
     * @tc.name: testPanService0013
     * @tc.desc: Verify dropping the last connection resets the model and returns the service to disconnected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0013', 0, async () => {
      const service = new PanService();
      await service.initialize();
      await service.connect(DEVICE_A);
      const model = service.getModel();
      model.markConnecting();
      model.markConnected();
      expect(model.state).assertEqual(PanState.CONNECTED);
      expect(model.operationCount).assertEqual(2);

      const result = await service.disconnect(DEVICE_A);

      expect(result).assertTrue();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(model.state).assertEqual(PanState.DISCONNECTED);
      expect(model.operationCount).assertEqual(0);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(service.getModel() === model).assertTrue();
      expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(1);

      const transitions = service.getStateTransitions();
      expect(transitions.length).assertEqual(4);
      expect(transitions[3].to).assertEqual(BluetoothConnectionState.DISCONNECTED);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_1400
     * @tc.name: testPanService0014
     * @tc.desc: Verify the accessor methods return defensive copies rather than internal collections.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0014', 0, async () => {
      const service = new PanService();
      await service.initialize();
      await service.connect(DEVICE_A);

      const devices = service.getConnectedDeviceIds();
      const otherDevices = service.getConnectedDeviceIds();
      expect(devices.length).assertEqual(1);
      expect(devices === otherDevices).assertFalse();
      devices.push(DEVICE_B);
      expect(devices.length).assertEqual(2);
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);

      const history = service.getOperationHistory();
      const otherHistory = service.getOperationHistory();
      expect(history.length).assertEqual(2);
      expect(history === otherHistory).assertFalse();

      const records = service.getOperationRecords();
      expect(records.length).assertEqual(1);
      expect(records === service.getOperationRecords()).assertFalse();

      const transitions = service.getStateTransitions();
      expect(transitions.length).assertEqual(2);
      expect(transitions === service.getStateTransitions()).assertFalse();

      await service.destroy();
    });

    // ==================== 数据同步（2 条） ====================

    /*
     * @tc.number: SUB_PAN_SERVICE_1500
     * @tc.name: testPanService0015
     * @tc.desc: Verify syncing data on a connected device records one operation and no state transition.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0015', 0, async () => {
      const service = new PanService();
      await service.initialize();
      await service.connect(DEVICE_A);
      const transitionsBefore: number = service.getStateTransitions().length;

      const result = await service.syncData(DEVICE_A);

      expect(result).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(service.getStateTransitions().length).assertEqual(transitionsBefore);
      expect(service.getPerformanceMetrics().dataSyncEvents).assertEqual(1);
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(2);
      expect(service.getOperationRecords().length).assertEqual(2);

      const record = lastRecord(service);
      expect(record.operationId).assertEqual('op_2');
      expect(record.operationName).assertEqual('syncData');
      expect(record.deviceId).assertEqual(DEVICE_A);
      expect(record.success).assertTrue();
      expect(record.details).assertEqual('Data synchronized');

      const entry = lastHistory(service);
      expect(entry.operation).assertEqual('syncData');
      expect(entry.success).assertTrue();
      expect(entry.details).assertEqual('Data synced from ' + DEVICE_A);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_1600
     * @tc.name: testPanService0016
     * @tc.desc: Verify syncing data for a disconnected device is rejected without counting a sync event.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0016', 0, async () => {
      const service = new PanService();
      await service.initialize();
      await service.connect(DEVICE_A);

      const unknown = await service.syncData('pan_service_device_unknown');
      await service.disconnect(DEVICE_A);
      const afterDisconnect = await service.syncData(DEVICE_A);

      expect(unknown).assertFalse();
      expect(afterDisconnect).assertFalse();
      expect(service.getPerformanceMetrics().dataSyncEvents).assertEqual(0);
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(2);
      expect(countHistory(service, 'syncData')).assertEqual(2);
      expect(lastHistory(service).details).assertEqual('Not connected');
      expect(lastHistory(service).success).assertFalse();
      expect(service.getOperationRecords().length).assertEqual(2);

      const stats = statsOf(service);
      expect(stats.operationRecordCount).assertEqual(2);
      expect(stats.connectedDeviceCount).assertEqual(0);

      await service.destroy();
    });

    // ==================== 配置与性能指标（3 条） ====================

    /*
     * @tc.number: SUB_PAN_SERVICE_1700
     * @tc.name: testPanService0017
     * @tc.desc: Verify the connection configuration merges partial updates and returns a detached copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0017', 0, async () => {
      const service = new PanService();
      await service.initialize();

      const initial = service.getConnectionConfig();
      expect(initial.connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT);
      expect(initial.operationTimeoutMs).assertEqual(DEFAULT_OPERATION_TIMEOUT);
      expect(initial.maxRetryAttempts).assertEqual(DEFAULT_MAX_RETRY);
      expect(initial.retryDelayMs).assertEqual(DEFAULT_RETRY_DELAY);
      expect(initial.useExponentialBackoff).assertTrue();
      expect(initial.maxBackoffDelayMs).assertEqual(DEFAULT_MAX_BACKOFF);
      expect(initial.autoReconnect).assertTrue();
      expect(initial.maxAutoReconnectAttempts).assertEqual(DEFAULT_AUTO_RECONNECT_ATTEMPTS);
      expect(initial.autoReconnectDelayMs).assertEqual(DEFAULT_AUTO_RECONNECT_DELAY);
      expect(initial.verboseLogging).assertFalse();
      expect(initial.enablePerformanceTracing).assertTrue();
      expect(initial.customParameters.size).assertEqual(0);
      expect(service.getOperationHistory().length).assertEqual(1);

      service.setConnectionConfig({ connectionTimeoutMs: 500, verboseLogging: true });

      const merged = service.getConnectionConfig();
      expect(merged.connectionTimeoutMs).assertEqual(500);
      expect(merged.verboseLogging).assertTrue();
      expect(merged.operationTimeoutMs).assertEqual(DEFAULT_OPERATION_TIMEOUT);
      expect(merged.maxRetryAttempts).assertEqual(DEFAULT_MAX_RETRY);
      expect(merged.autoReconnect).assertTrue();

      merged.connectionTimeoutMs = 1;
      expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(500);
      expect(service.getConnectionConfig() === service.getConnectionConfig()).assertFalse();
      expect(service.getOperationHistory().length).assertEqual(1);
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(0);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_1800
     * @tc.name: testPanService0018
     * @tc.desc: Verify a shortened connection timeout still completes the handshake with full bookkeeping.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0018', 0, async () => {
      const service = new PanService();
      await service.initialize();
      service.setConnectionConfig({ connectionTimeoutMs: 800 });
      expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(800);

      const started: number = Date.now();
      const result = await service.connect(DEVICE_A);
      const elapsed: number = Date.now() - started;

      expect(result).assertTrue();
      expect(elapsed >= 500).assertTrue();
      expect(service.isConnected()).assertTrue();
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      expect(service.getStateTransitions().length).assertEqual(2);
      expect(service.getOperationRecords().length).assertEqual(1);
      expect(lastRecord(service).operationId).assertEqual('op_1');
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(1);
      expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(800);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_1900
     * @tc.name: testPanService0019
     * @tc.desc: Verify the derived performance metrics keep duration and error aggregates untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0019', 0, async () => {
      const service = new PanService();
      await service.initialize();

      const fresh = service.getPerformanceMetrics();
      expect(fresh.minDurationMs).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(fresh.averageDurationMs).assertEqual(0);
      expect(fresh.maxDurationMs).assertEqual(0);
      expect(fresh.errorRate).assertEqual(0);
      expect(fresh.operationsPerMinute).assertEqual(0);
      expect(fresh.totalOperations).assertEqual(0);

      const started: number = Date.now();
      await service.connect(DEVICE_A);
      await service.syncData(DEVICE_A);
      await service.disconnect(DEVICE_A);
      const finished: number = Date.now();

      const metrics = service.getPerformanceMetrics();
      expect(metrics.totalOperations).assertEqual(3);
      expect(metrics.successfulOperations).assertEqual(3);
      expect(metrics.failedOperations).assertEqual(0);
      expect(metrics.errorRate).assertEqual(0);
      expect(metrics.connectionEvents).assertEqual(1);
      expect(metrics.disconnectionEvents).assertEqual(1);
      expect(metrics.dataSyncEvents).assertEqual(1);
      expect(metrics.stateTransitions).assertEqual(4);
      expect(metrics.minDurationMs).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(metrics.averageDurationMs).assertEqual(0);
      expect(metrics.maxDurationMs).assertEqual(0);
      expect(metrics.lastOperationTime >= started && metrics.lastOperationTime <= finished).assertTrue();
      expect(metrics.uptimeMs >= 1000).assertTrue();
      expect(metrics.operationsPerMinute > 0).assertTrue();

      const again = service.getPerformanceMetrics();
      expect(again === metrics).assertFalse();
      expect(again.totalOperations).assertEqual(metrics.totalOperations);

      await service.destroy();
    });

    // ==================== 回调注册与通知（3 条） ====================

    /*
     * @tc.number: SUB_PAN_SERVICE_2000
     * @tc.name: testPanService0020
     * @tc.desc: Verify connection callbacks fire once per settled connection and skip intermediate states.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0020', 0, async () => {
      const service = new PanService();
      await service.initialize();
      const states: string[] = [];
      const callback = (state: BluetoothConnectionState): void => {
        states.push(state);
      };

      service.addConnectionCallback(callback);
      expect(statsOf(service).connectionCallbackCount).assertEqual(1);

      await service.connect(DEVICE_A);
      expect(states.length).assertEqual(1);
      expect(states[0]).assertEqual(BluetoothConnectionState.CONNECTED);

      await service.disconnect(DEVICE_A);
      expect(states.length).assertEqual(2);
      expect(states[1]).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(states.indexOf(BluetoothConnectionState.CONNECTING)).assertEqual(-1);
      expect(states.indexOf(BluetoothConnectionState.DISCONNECTING)).assertEqual(-1);
      expect(service.getStateTransitions().length).assertEqual(4);

      service.removeConnectionCallback(callback);
      await service.connect(DEVICE_A);
      expect(states.length).assertEqual(2);
      expect(statsOf(service).connectionCallbackCount).assertEqual(0);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_2100
     * @tc.name: testPanService0021
     * @tc.desc: Verify registering the same callback twice is deduplicated and removal is selective.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0021', 0, async () => {
      const service = new PanService();
      await service.initialize();
      const hits: string[] = [];
      const shared = (state: BluetoothConnectionState): void => {
        hits.push('shared');
      };
      const other = (state: BluetoothConnectionState): void => {
        hits.push('other');
      };

      service.addConnectionCallback(shared);
      service.addConnectionCallback(shared);
      service.addConnectionCallback(other);
      expect(statsOf(service).connectionCallbackCount).assertEqual(2);

      await service.connect(DEVICE_A);
      expect(hits.length).assertEqual(2);
      expect(hits[0]).assertEqual('shared');
      expect(hits[1]).assertEqual('other');

      service.removeConnectionCallback(other);
      service.removeConnectionCallback(other);
      expect(statsOf(service).connectionCallbackCount).assertEqual(1);

      hits.splice(0, hits.length);
      await service.disconnect(DEVICE_A);
      expect(hits.length).assertEqual(1);
      expect(hits[0]).assertEqual('shared');
      expect(service.isConnected()).assertFalse();

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_2200
     * @tc.name: testPanService0022
     * @tc.desc: Verify data and operation callbacks receive live payloads and a throwing listener is isolated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0022', 0, async () => {
      const service = new PanService();
      await service.initialize();
      const model = service.getModel();
      const seenModels: PanModel[] = [];
      const seenRecords: string[] = [];
      const dataCallback = (received: PanModel): void => {
        seenModels.push(received);
      };
      const operationCallback = (record: object): void => {
        const view: ESObject = record;
        seenRecords.push(view.operationId + ':' + view.operationName);
      };
      const throwing = (state: BluetoothConnectionState): void => {
        throw new Error('callback failure');
      };

      service.addDataCallback(dataCallback);
      service.addOperationCallback(operationCallback);
      service.addConnectionCallback(throwing);

      await service.connect(DEVICE_A);
      expect(seenModels.length).assertEqual(1);
      expect(seenModels[0] === model).assertTrue();
      expect(seenRecords.length).assertEqual(1);
      expect(seenRecords[0]).assertEqual('op_1:connect');
      expect(service.isConnected()).assertTrue();

      await service.syncData(DEVICE_A);
      expect(seenModels.length).assertEqual(2);
      expect(seenRecords.length).assertEqual(2);
      expect(seenRecords[1]).assertEqual('op_2:syncData');

      const stats = statsOf(service);
      expect(stats.dataCallbackCount).assertEqual(1);
      expect(stats.operationCallbackCount).assertEqual(1);
      expect(stats.connectionCallbackCount).assertEqual(1);

      service.removeDataCallback(dataCallback);
      service.removeOperationCallback(operationCallback);
      await service.disconnect(DEVICE_A);
      expect(seenModels.length).assertEqual(2);
      expect(seenRecords.length).assertEqual(2);
      expect(service.isConnected()).assertFalse();

      await service.destroy();
    });

    // ==================== 历史与记录上限（3 条） ====================

    /*
     * @tc.number: SUB_PAN_SERVICE_2300
     * @tc.name: testPanService0023
     * @tc.desc: Verify the operation history is trimmed to its ceiling while the counters keep growing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0023', 0, async () => {
      const service = new PanService();
      await service.initialize();
      expect(await service.connect(DEVICE_A)).assertTrue();

      let everyRejected: boolean = true;
      for (let i = 0; i < 250; i++) {
        const repeated = await service.connect(DEVICE_A);
        if (!repeated) {
          everyRejected = false;
        }
      }

      const history = historyOf(service);
      expect(everyRejected).assertTrue();
      expect(history.length).assertEqual(MAX_HISTORY);
      expect(history[0].operation).assertEqual('connect');
      expect(history[0].details).assertEqual('Already connected');
      expect(history[history.length - 1].details).assertEqual('Already connected');
      expect(countHistory(service, 'initialize')).assertEqual(0);
      expect(service.getOperationRecords().length).assertEqual(1);
      expect(lastRecord(service).operationId).assertEqual('op_1');
      expect(service.getStateTransitions().length).assertEqual(2);
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(1);
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(1);
      expect(statsOf(service).operationHistoryCount).assertEqual(MAX_HISTORY);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_2400
     * @tc.name: testPanService0024
     * @tc.desc: Verify rejected operations create no record while accepted ones receive increasing identifiers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0024', 0, async () => {
      const service = new PanService();
      await service.initialize();
      expect(service.getOperationRecords().length).assertEqual(0);

      await service.connect(DEVICE_A);
      expect(lastRecord(service).operationId).assertEqual('op_1');

      await service.syncData(DEVICE_A);
      expect(lastRecord(service).operationId).assertEqual('op_2');

      await service.syncData(DEVICE_B);
      expect(service.getOperationRecords().length).assertEqual(2);
      expect(lastRecord(service).operationId).assertEqual('op_2');

      await service.connect('');
      expect(service.getOperationRecords().length).assertEqual(2);

      await service.disconnect(DEVICE_B);
      expect(service.getOperationRecords().length).assertEqual(2);

      await service.disconnect(DEVICE_A);
      expect(service.getOperationRecords().length).assertEqual(3);
      expect(lastRecord(service).operationId).assertEqual('op_3');
      expect(lastRecord(service).operationName).assertEqual('disconnect');
      expect(lastRecord(service).deviceId).assertEqual(DEVICE_A);

      const metrics = service.getPerformanceMetrics();
      expect(metrics.totalOperations).assertEqual(3);
      expect(metrics.successfulOperations).assertEqual(3);
      expect(metrics.failedOperations).assertEqual(0);

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_2500
     * @tc.name: testPanService0025
     * @tc.desc: Verify the statistics snapshot agrees with every individual accessor after a session.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0025', 0, async () => {
      const service = new PanService();
      await service.initialize();
      await service.connect(DEVICE_A);
      await service.syncData(DEVICE_A);

      const stats = statsOf(service);
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      expect(stats.isInitialized).assertTrue();
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(stats.connectionState).assertEqual(service.getConnectionState());
      expect(stats.connectedDeviceCount).assertEqual(service.getConnectedDeviceIds().length);
      expect(stats.stateTransitionCount).assertEqual(service.getStateTransitions().length);
      expect(stats.operationHistoryCount).assertEqual(service.getOperationHistory().length);
      expect(stats.operationRecordCount).assertEqual(service.getOperationRecords().length);
      expect(stats.operationRecordCount).assertEqual(2);
      expect(stats.operationHistoryCount).assertEqual(3);
      expect(stats.stateTransitionCount).assertEqual(2);
      expect(stats.isProcessing).assertFalse();
      expect(stats.queueSize).assertEqual(0);
      expect(stats.currentRetryCount).assertEqual(0);
      expect(stats.lastError).assertEqual('');

      const nested: ESObject = service.getStatistics();
      expect(nested.performanceMetrics.totalOperations).assertEqual(2);
      expect(nested.performanceMetrics.connectionEvents).assertEqual(1);
      expect(nested.performanceMetrics.dataSyncEvents).assertEqual(1);
      expect(nested.connectedDevices.length).assertEqual(1);
      expect(nested.connectedDevices[0]).assertEqual(DEVICE_A);

      await service.destroy();
    });

    // ==================== 重置与组合场景（5 条） ====================

    /*
     * @tc.number: SUB_PAN_SERVICE_2600
     * @tc.name: testPanService0026
     * @tc.desc: Verify reset drops every session collection while the accumulated metrics survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0026', 0, async () => {
      const service = new PanService();
      await service.initialize();
      const modelBefore = service.getModel();
      await service.connect(DEVICE_A);
      await service.connect(DEVICE_B);
      await service.syncData(DEVICE_A);
      expect(service.getOperationRecords().length).assertEqual(3);

      await service.reset();

      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getModel() !== modelBefore).assertTrue();
      expect(service.getModel().deviceId).assertEqual('');
      expect(service.getModel().state).assertEqual(PanState.DISCONNECTED);
      expect(service.getStateTransitions().length).assertEqual(0);
      expect(service.getOperationRecords().length).assertEqual(0);

      const history = historyOf(service);
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('reset');
      expect(history[0].success).assertTrue();
      expect(history[0].details).assertEqual('Service reset');

      const metrics = service.getPerformanceMetrics();
      expect(metrics.totalOperations).assertEqual(5);
      expect(metrics.successfulOperations).assertEqual(5);
      expect(metrics.connectionEvents).assertEqual(2);
      expect(metrics.disconnectionEvents).assertEqual(2);
      expect(metrics.dataSyncEvents).assertEqual(1);
      expect(statsOf(service).isInitialized).assertTrue();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_2700
     * @tc.name: testPanService0027
     * @tc.desc: Verify the operation identifier counter is not restored by reset although the record list is.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0027', 0, async () => {
      const service = new PanService();
      await service.initialize();
      await service.connect(DEVICE_A);
      expect(lastRecord(service).operationId).assertEqual('op_1');

      await service.reset();
      expect(service.getOperationRecords().length).assertEqual(0);
      expect(service.getOperationHistory().length).assertEqual(1);

      expect(await service.connect(DEVICE_B)).assertTrue();

      const records = service.getOperationRecords();
      expect(records.length).assertEqual(1);
      expect(records[0].operationId).assertEqual('op_3');
      expect(records[0].deviceId).assertEqual(DEVICE_B);
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(3);
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(2);
      expect(service.getOperationHistory().length).assertEqual(2);
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B);

      expect(await service.initialize()).assertFalse();
      expect(service.getOperationRecords().length).assertEqual(1);
      expect(lastRecord(service).operationId).assertEqual('op_3');

      await service.destroy();
      expect(statsOf(service).isInitialized).assertFalse();
      expect(await service.initialize()).assertTrue();
      expect(service.getOperationRecords().length).assertEqual(0);
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(0);
      expect(await service.connect(DEVICE_A)).assertTrue();
      expect(lastRecord(service).operationId).assertEqual('op_1');

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_2800
     * @tc.name: testPanService0028
     * @tc.desc: Verify every entry point is rejected after destroy until the service is initialized again.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0028', 0, async () => {
      const service = new PanService();
      await service.initialize();
      await service.connect(DEVICE_A);
      await service.destroy();

      const connected = await service.connect(DEVICE_B);
      const synced = await service.syncData(DEVICE_B);
      const disconnected = await service.disconnect(DEVICE_B);

      expect(connected).assertFalse();
      expect(synced).assertFalse();
      expect(disconnected).assertFalse();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(statsOf(service).isInitialized).assertFalse();

      const history = historyOf(service);
      expect(history.length).assertEqual(4);
      expect(history[0].operation).assertEqual('reset');
      expect(history[1].details).assertEqual('Service not initialized');
      expect(history[2].details).assertEqual('Not connected');
      expect(history[3].details).assertEqual('Not initialized');

      expect(await service.initialize()).assertTrue();
      expect(service.getOperationHistory().length).assertEqual(1);
      expect(service.getOperationRecords().length).assertEqual(0);
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(0);
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(0);
      expect(await service.connect(DEVICE_A)).assertTrue();
      expect(lastRecord(service).operationId).assertEqual('op_1');

      await service.destroy();
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_2900
     * @tc.name: testPanService0029
     * @tc.desc: Verify a full initialize connect sync disconnect destroy lifecycle leaves a clean service.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanService0029', 0, async () => {
      const service = new PanService();

      expect(await service.initialize()).assertTrue();
      expect(await service.connect(DEVICE_A)).assertTrue();
      expect(service.isConnected()).assertTrue();
      expect(await service.syncData(DEVICE_A)).assertTrue();
      expect(service.getOperationRecords().length).assertEqual(2);
      expect(await service.disconnect(DEVICE_A)).assertTrue();
      expect(service.isConnected()).assertFalse();
      expect(service.getOperationRecords().length).assertEqual(3);
      expect(service.getStateTransitions().length).assertEqual(4);
      expect(service.getOperationHistory().length).assertEqual(4);

      const peak = service.getPerformanceMetrics();
      expect(peak.totalOperations).assertEqual(3);
      expect(peak.successfulOperations).assertEqual(3);
      expect(peak.dataSyncEvents).assertEqual(1);

      await service.destroy();

      expect(statsOf(service).isInitialized).assertFalse();
      expect(service.getStateTransitions().length).assertEqual(0);
      expect(service.getOperationRecords().length).assertEqual(0);
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      expect(service.getOperationHistory().length).assertEqual(1);
      expect(lastHistory(service).operation).assertEqual('reset');
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(3);
      expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(1);
      expect(service.getModel().state).assertEqual(PanState.DISCONNECTED);
    });

    /*
     * @tc.number: SUB_PAN_SERVICE_3000
     * @tc.name: testPanService0030
     * @tc.desc: Verify two service instances keep their models devices histories and metrics independent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanService0030', 0, async () => {
      const first = new PanService();
      const second = new PanService();
      await first.initialize();
      await second.initialize();

      await first.connect(DEVICE_A);
      await first.syncData(DEVICE_A);
      await second.connect(DEVICE_B);

      expect(first.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      expect(second.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B);
      expect(first.getConnectedDeviceIds().length).assertEqual(1);
      expect(second.getOperationRecords().length).assertEqual(1);
      expect(first.getOperationRecords().length).assertEqual(2);
      expect(lastRecord(first).operationId).assertEqual('op_2');
      expect(lastRecord(second).operationId).assertEqual('op_1');
      expect(first.getModel() !== second.getModel()).assertTrue();
      expect(first.getOperationHistory().length).assertEqual(3);
      expect(second.getOperationHistory().length).assertEqual(2);
      expect(first.getPerformanceMetrics().dataSyncEvents).assertEqual(1);
      expect(second.getPerformanceMetrics().dataSyncEvents).assertEqual(0);
      expect(second.getPerformanceMetrics().totalOperations).assertEqual(1);

      await first.destroy();

      expect(statsOf(first).isInitialized).assertFalse();
      expect(statsOf(second).isInitialized).assertTrue();
      expect(second.isConnected()).assertTrue();
      expect(second.getConnectedDeviceIds().length).assertEqual(1);
      expect(second.getStateTransitions().length).assertEqual(2);

      await second.destroy();
    });
  });
}
