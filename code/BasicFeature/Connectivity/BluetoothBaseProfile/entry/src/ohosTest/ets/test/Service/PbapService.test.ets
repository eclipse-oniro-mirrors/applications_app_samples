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

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BluetoothConnectionState, PbapModel, PbapService, PbapState } from 'library';
import { PbapOperationRecord, PbapServiceStatistics, ServiceCallbackCounts } from 'library';

const SERVICE_NAME: string = 'PbapService';
const DEVICE_A: string = 'pbap_service_device_a';
const DEVICE_B: string = 'pbap_service_device_b';
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
 * copy operation history for named view array.
 * @param {PbapService} service - passive test service
 * @returns {HistoryEntryView[]} history entry copy
 */
function historyOf(service: PbapService): HistoryEntryView[] {
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
 * statistics specified operation name history entry number amount.
 * @param {PbapService} service - passive test service
 * @param {string} operation - operation name
 * @returns {number} matching entry count
 */
function countHistory(service: PbapService, operation: string): number {
  let count: number = 0;
  for (const entry of historyOf(service)) {
    if (entry.operation === operation) {
      count += 1;
    }
  }
  return count;
}

/**
 * read last operation history, empty history return empty entry.
 * @param {PbapService} service - passive test service
 * @returns {HistoryEntryView} last history
 */
function lastHistory(service: PbapService): HistoryEntryView {
  const entries = historyOf(service);
  if (entries.length === 0) {
    return { operation: '', timestamp: 0, success: false, details: '' };
  }
  return entries[entries.length - 1];
}

/**
 * read last operation record, empty record return empty entry.
 * @param {PbapService} service - passive test service
 * @returns {RecordView} last record
 */
function lastRecord(service: PbapService): RecordView {
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
 * read statistics snapshot, getStatistics return typed statistics object, read fields directly.
 * @param {PbapService} service - passive test service
 * @returns {StatsView} statistics snapshot
 */
function statsOf(service: PbapService): StatsView {
  const stats: PbapServiceStatistics = service.getStatistics();
  const callbacks: ServiceCallbackCounts = stats.callbackCounts;
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
    connectionCallbackCount: callbacks.connection ?? 0,
    dataCallbackCount: callbacks.data ?? 0,
    operationCallbackCount: callbacks.operation ?? 0
  };
}

/**
 * @description Test suite for PbapService
 * @since 26.0.0
 */
export default function pbapServiceTest(): void {
  describe('PbapServiceTest', () => {
    // ==================== lifecycle and initialize (5 cases) ====================

    /*
     * @tc.number: SUB_PBAP_SERVICE_0100
     * @tc.name: testPbapService0001
     * @tc.desc: Verify the default view of a service instance created but never initialized.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0001', 'begin');
      const service: PbapService = new PbapService();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#1 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#2 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#3 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#4 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#5 assert ' + "expect(service.getOperationRecords().length).assertEqual(0)");
      expect(service.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#6 assert ' + "expect(service.getStateTransitions().length).assertEqual(0)");
      expect(service.getStateTransitions().length).assertEqual(0);

      const model = service.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#7 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#8 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#9 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);

      const stats = statsOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#11 ' + "stats.serviceName" + ' = ' + JSON.stringify(stats.serviceName));
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#12 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#13 ' + "stats.connectionState" + ' = ' + JSON.stringify(stats.connectionState));
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#14 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#15 ' + "stats.isProcessing" + ' = ' + JSON.stringify(stats.isProcessing));
      expect(stats.isProcessing).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#16 ' + "stats.queueSize" + ' = ' + JSON.stringify(stats.queueSize));
      expect(stats.queueSize).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#17 ' + "stats.currentRetryCount" + ' = ' + JSON.stringify(stats.currentRetryCount));
      expect(stats.currentRetryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#18 ' + "stats.lastError" + ' = ' + JSON.stringify(stats.lastError));
      expect(stats.lastError).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#19 ' + "stats.stateTransitionCount" + ' = ' + JSON.stringify(stats.stateTransitionCount));
      expect(stats.stateTransitionCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#20 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#21 ' + "stats.operationRecordCount" + ' = ' + JSON.stringify(stats.operationRecordCount));
      expect(stats.operationRecordCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#22 ' + "stats.connectionCallbackCount" + ' = ' + JSON.stringify(stats.connectionCallbackCount));
      expect(stats.connectionCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#23 ' + "stats.dataCallbackCount" + ' = ' + JSON.stringify(stats.dataCallbackCount));
      expect(stats.dataCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0001',
        '#24 ' + "stats.operationCallbackCount" + ' = ' + JSON.stringify(stats.operationCallbackCount));
      expect(stats.operationCallbackCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0001', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_0200
     * @tc.name: testPbapService0002
     * @tc.desc: Verify the first initialize call succeeds and establishes a clean service baseline.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0002', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0002', 'begin');
      const service: PbapService = new PbapService();
      const modelBeforeInit = service.getModel();
      const before: number = Date.now();

      const result = await service.initialize();
      const after: number = Date.now();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#1 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#2 assert ' + "expect(statsOf(service).isInitialized).assertTrue()");
      expect(statsOf(service).isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#3 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#4 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#5 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#6 assert ' + "expect(service.getStateTransitions().length).assertEqual(0)");
      expect(service.getStateTransitions().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#7 assert ' + "expect(service.getOperationRecords().length).assertEqual(0)");
      expect(service.getOperationRecords().length).assertEqual(0);

      const history = historyOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#8 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#9 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#10 ' + "history[0].success" + ' = ' + JSON.stringify(history[0].success));
      expect(history[0].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#11 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service initialized successfully');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#12 ' + "history[0].timestamp >= before && history[0].timestamp <= after" + ' = ' +
        JSON.stringify(history[0].timestamp >= before && history[0].timestamp <= after));
      expect(history[0].timestamp >= before && history[0].timestamp <= after).assertTrue();

      const model = service.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#13 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#14 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTED);

      const metrics = service.getPerformanceMetrics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#15 ' + "metrics.totalOperations" + ' = ' + JSON.stringify(metrics.totalOperations));
      expect(metrics.totalOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#16 ' + "metrics.successfulOperations" + ' = ' + JSON.stringify(metrics.successfulOperations));
      expect(metrics.successfulOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#17 ' + "metrics.failedOperations" + ' = ' + JSON.stringify(metrics.failedOperations));
      expect(metrics.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#18 ' + "metrics.connectionEvents" + ' = ' + JSON.stringify(metrics.connectionEvents));
      expect(metrics.connectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#19 ' + "metrics.disconnectionEvents" + ' = ' + JSON.stringify(metrics.disconnectionEvents));
      expect(metrics.disconnectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#20 ' + "metrics.dataSyncEvents" + ' = ' + JSON.stringify(metrics.dataSyncEvents));
      expect(metrics.dataSyncEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#21 ' + "metrics.lastOperationTime" + ' = ' + JSON.stringify(metrics.lastOperationTime));
      expect(metrics.lastOperationTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#22 ' + "metrics.uptimeMs < 60000" + ' = ' + JSON.stringify(metrics.uptimeMs < 60000));
      expect(metrics.uptimeMs < 60000).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#23 assert ' + "expect(service.getModel() !== modelBeforeInit).assertTrue()");
      expect(service.getModel() !== modelBeforeInit).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0002',
        '#24 assert ' +
        "expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT)");
      expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0002', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_0300
     * @tc.name: testPbapService0003
     * @tc.desc: Verify a repeated initialize is rejected and preserves the live connection state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0003', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0003', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      await service.connect(DEVICE_A);
      const historyBefore: number = service.getOperationHistory().length;
      const recordsBefore: number = service.getOperationRecords().length;
      const transitionsBefore: number = service.getStateTransitions().length;
      const modelBefore = service.getModel();

      const second = await service.initialize();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#1 ' + "second" + ' = ' + JSON.stringify(second));
      expect(second).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#2 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#3 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(1)");
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#4 assert ' + "expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A)");
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#5 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#6 assert ' + "expect(service.getOperationHistory().length).assertEqual(historyBefore + 1)");
      expect(service.getOperationHistory().length).assertEqual(historyBefore + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#7 assert ' + "expect(service.getOperationRecords().length).assertEqual(recordsBefore)");
      expect(service.getOperationRecords().length).assertEqual(recordsBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#8 assert ' + "expect(service.getStateTransitions().length).assertEqual(transitionsBefore)");
      expect(service.getStateTransitions().length).assertEqual(transitionsBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#9 assert ' + "expect(service.getModel() === modelBefore).assertTrue()");
      expect(service.getModel() === modelBefore).assertTrue();

      const entry = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#10 ' + "entry.operation" + ' = ' + JSON.stringify(entry.operation));
      expect(entry.operation).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#11 ' + "entry.success" + ' = ' + JSON.stringify(entry.success));
      expect(entry.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0003',
        '#12 ' + "entry.details" + ' = ' + JSON.stringify(entry.details));
      expect(entry.details).assertEqual('Already initialized');

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0003', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_0400
     * @tc.name: testPbapService0004
     * @tc.desc: Verify connect and syncData are rejected before the service is initialized.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0004', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0004', 'begin');
      const service: PbapService = new PbapService();

      const connected = await service.connect(DEVICE_A);
      const synced = await service.syncData(DEVICE_A);
      const disconnected = await service.disconnect(DEVICE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#1 ' + "connected" + ' = ' + JSON.stringify(connected));
      expect(connected).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#2 ' + "synced" + ' = ' + JSON.stringify(synced));
      expect(synced).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#3 ' + "disconnected" + ' = ' + JSON.stringify(disconnected));
      expect(disconnected).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#4 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#5 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#6 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#7 assert ' + "expect(service.getStateTransitions().length).assertEqual(0)");
      expect(service.getStateTransitions().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#8 assert ' + "expect(service.getOperationRecords().length).assertEqual(0)");
      expect(service.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#9 assert ' + "expect(service.getPerformanceMetrics().totalOperations).assertEqual(0)");
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(0);

      const history = historyOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#10 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#11 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#12 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service not initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#13 ' + "history[0].success" + ' = ' + JSON.stringify(history[0].success));
      expect(history[0].success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#14 ' + "history[1].operation" + ' = ' + JSON.stringify(history[1].operation));
      expect(history[1].operation).assertEqual('syncData');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#15 ' + "history[1].details" + ' = ' + JSON.stringify(history[1].details));
      expect(history[1].details).assertEqual('Not connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#16 ' + "history[2].operation" + ' = ' + JSON.stringify(history[2].operation));
      expect(history[2].operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#17 ' + "history[2].details" + ' = ' + JSON.stringify(history[2].details));
      expect(history[2].details).assertEqual('Not initialized');

      const stats = statsOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#18 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#19 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0004',
        '#20 ' + "stats.operationRecordCount" + ' = ' + JSON.stringify(stats.operationRecordCount));
      expect(stats.operationRecordCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0004', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_0500
     * @tc.name: testPbapService0005
     * @tc.desc: Verify destroy releases all callbacks and lets the service be initialized again.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0005', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0005', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      const signals: string[] = [];
      const connectionCallback = (state: BluetoothConnectionState): void => {
        signals.push('connection:' + state);
      };
      const dataCallback = (model: PbapModel): void => {
        signals.push('data:' + model.deviceId);
      };
      service.addConnectionCallback(connectionCallback);
      service.addDataCallback(dataCallback);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#1 assert ' + "expect(statsOf(service).connectionCallbackCount).assertEqual(1)");
      expect(statsOf(service).connectionCallbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#2 assert ' + "expect(statsOf(service).dataCallbackCount).assertEqual(1)");
      expect(statsOf(service).dataCallbackCount).assertEqual(1);

      await service.connect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#3 ' + "signals.length" + ' = ' + JSON.stringify(signals.length));
      expect(signals.length).assertEqual(2);
      await service.destroy();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#4 ' + "signals[0]" + ' = ' + JSON.stringify(signals[0]));
      expect(signals[0]).assertEqual('connection:connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#5 ' + "signals[1]" + ' = ' + JSON.stringify(signals[1]));
      expect(signals[1]).assertEqual('data:');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#6 assert ' + "expect(statsOf(service).isInitialized).assertFalse()");
      expect(statsOf(service).isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#7 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#8 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#9 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#10 assert ' + "expect(statsOf(service).connectionCallbackCount).assertEqual(0)");
      expect(statsOf(service).connectionCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#11 assert ' + "expect(statsOf(service).dataCallbackCount).assertEqual(0)");
      expect(statsOf(service).dataCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#12 assert ' + "expect(statsOf(service).operationCallbackCount).assertEqual(0)");
      expect(statsOf(service).operationCallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#13 assert ' + "expect(service.getStateTransitions().length).assertEqual(0)");
      expect(service.getStateTransitions().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#14 assert ' + "expect(service.getOperationRecords().length).assertEqual(0)");
      expect(service.getOperationRecords().length).assertEqual(0);

      const history = historyOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#15 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#16 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#17 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service reset');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#18 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#19 assert ' + "expect(await service.connect(DEVICE_B)).assertTrue()");
      expect(await service.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0005',
        '#20 assert ' + "expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B)");
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0005', 'end');
    });

    // ==================== connect and disconnect (6 cases) ====================

    /*
     * @tc.number: SUB_PBAP_SERVICE_0600
     * @tc.name: testPbapService0006
     * @tc.desc: Verify a successful connection writes transitions history and an operation record.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0006', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0006', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      const started: number = Date.now();

      const result = await service.connect(DEVICE_A);
      const finished: number = Date.now();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#1 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#2 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#3 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#4 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(1)");
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#5 assert ' + "expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A)");
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);

      const transitions = service.getStateTransitions();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#6 ' + "transitions.length" + ' = ' + JSON.stringify(transitions.length));
      expect(transitions.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#7 ' + "transitions[0].from" + ' = ' + JSON.stringify(transitions[0].from));
      expect(transitions[0].from).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#8 ' + "transitions[0].to" + ' = ' + JSON.stringify(transitions[0].to));
      expect(transitions[0].to).assertEqual(BluetoothConnectionState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#9 ' + "transitions[1].from" + ' = ' + JSON.stringify(transitions[1].from));
      expect(transitions[1].from).assertEqual(BluetoothConnectionState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#10 ' + "transitions[1].to" + ' = ' + JSON.stringify(transitions[1].to));
      expect(transitions[1].to).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#11 ' + "transitions[0].timestamp >= started && transitions[1].timestamp <= finished" + ' = ' +
        JSON.stringify(transitions[0].timestamp >= started && transitions[1].timestamp <= finished));
      expect(transitions[0].timestamp >= started && transitions[1].timestamp <= finished).assertTrue();

      const entry = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#12 ' + "entry.operation" + ' = ' + JSON.stringify(entry.operation));
      expect(entry.operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#13 ' + "entry.success" + ' = ' + JSON.stringify(entry.success));
      expect(entry.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#14 ' + "entry.details" + ' = ' + JSON.stringify(entry.details));
      expect(entry.details).assertEqual('Connected to ' + DEVICE_A);

      const record = lastRecord(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#15 ' + "record.operationId" + ' = ' + JSON.stringify(record.operationId));
      expect(record.operationId).assertEqual('op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#16 ' + "record.operationName" + ' = ' + JSON.stringify(record.operationName));
      expect(record.operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#17 ' + "record.deviceId" + ' = ' + JSON.stringify(record.deviceId));
      expect(record.deviceId).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#18 ' + "record.success" + ' = ' + JSON.stringify(record.success));
      expect(record.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#19 ' + "record.errorMessage" + ' = ' + JSON.stringify(record.errorMessage));
      expect(record.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#20 ' + "record.details" + ' = ' + JSON.stringify(record.details));
      expect(record.details).assertEqual('Connected to ' + DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#21 ' + "record.startTime" + ' = ' + JSON.stringify(record.startTime));
      expect(record.startTime).assertEqual(record.endTime);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#22 ' + "record.durationMs" + ' = ' + JSON.stringify(record.durationMs));
      expect(record.durationMs).assertEqual(0);

      const metrics = service.getPerformanceMetrics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#23 ' + "metrics.totalOperations" + ' = ' + JSON.stringify(metrics.totalOperations));
      expect(metrics.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#24 ' + "metrics.successfulOperations" + ' = ' + JSON.stringify(metrics.successfulOperations));
      expect(metrics.successfulOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#25 ' + "metrics.connectionEvents" + ' = ' + JSON.stringify(metrics.connectionEvents));
      expect(metrics.connectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0006',
        '#26 ' + "metrics.stateTransitions" + ' = ' + JSON.stringify(metrics.stateTransitions));
      expect(metrics.stateTransitions).assertEqual(2);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0006', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_0700
     * @tc.name: testPbapService0007
     * @tc.desc: Verify connect rejects an empty device identifier without changing any state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0007', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0007', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();

      const empty = await service.connect('');
      const blank = await service.connect('');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#1 ' + "empty" + ' = ' + JSON.stringify(empty));
      expect(empty).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#2 ' + "blank" + ' = ' + JSON.stringify(blank));
      expect(blank).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#3 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#4 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#5 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#6 assert ' + "expect(service.getStateTransitions().length).assertEqual(0)");
      expect(service.getStateTransitions().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#7 assert ' + "expect(service.getOperationRecords().length).assertEqual(0)");
      expect(service.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#8 assert ' + "expect(service.getPerformanceMetrics().connectionEvents).assertEqual(0)");
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#9 assert ' + "expect(countHistory(service, 'connect')).assertEqual(2)");
      expect(countHistory(service, 'connect')).assertEqual(2);

      const entry = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#10 ' + "entry.success" + ' = ' + JSON.stringify(entry.success));
      expect(entry.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#11 ' + "entry.details" + ' = ' + JSON.stringify(entry.details));
      expect(entry.details).assertEqual('Invalid device ID');

      const stats = statsOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#12 ' + "stats.stateTransitionCount" + ' = ' + JSON.stringify(stats.stateTransitionCount));
      expect(stats.stateTransitionCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0007',
        '#13 ' + "stats.operationRecordCount" + ' = ' + JSON.stringify(stats.operationRecordCount));
      expect(stats.operationRecordCount).assertEqual(0);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0007', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_0800
     * @tc.name: testPbapService0008
     * @tc.desc: Verify reconnecting an already connected device reports success without new side effects.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0008', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0008', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      await service.connect(DEVICE_A);
      const historyBefore: number = service.getOperationHistory().length;
      const record = lastRecord(service);

      const repeated = await service.connect(DEVICE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0008',
        '#1 ' + "repeated" + ' = ' + JSON.stringify(repeated));
      expect(repeated).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0008',
        '#2 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(1)");
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0008',
        '#3 assert ' + "expect(service.getStateTransitions().length).assertEqual(2)");
      expect(service.getStateTransitions().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0008',
        '#4 assert ' + "expect(service.getPerformanceMetrics().connectionEvents).assertEqual(1)");
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0008',
        '#5 assert ' + "expect(service.getPerformanceMetrics().totalOperations).assertEqual(1)");
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0008',
        '#6 assert ' + "expect(service.getOperationHistory().length).assertEqual(historyBefore + 1)");
      expect(service.getOperationHistory().length).assertEqual(historyBefore + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0008',
        '#7 assert ' + "expect(lastRecord(service).operationId).assertEqual(record.operationId)");
      expect(lastRecord(service).operationId).assertEqual(record.operationId);

      const entry = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0008',
        '#8 ' + "entry.operation" + ' = ' + JSON.stringify(entry.operation));
      expect(entry.operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0008',
        '#9 ' + "entry.success" + ' = ' + JSON.stringify(entry.success));
      expect(entry.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0008',
        '#10 ' + "entry.details" + ' = ' + JSON.stringify(entry.details));
      expect(entry.details).assertEqual('Already connected');

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0008', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_0900
     * @tc.name: testPbapService0009
     * @tc.desc: Verify two devices can be connected and are tracked in the order they joined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0009', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0009', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#1 assert ' + "expect(await service.connect(DEVICE_A)).assertTrue()");
      expect(await service.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#2 assert ' + "expect(await service.connect(DEVICE_B)).assertTrue()");
      expect(await service.connect(DEVICE_B)).assertTrue();

      const devices = service.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#3 ' + "devices.length" + ' = ' + JSON.stringify(devices.length));
      expect(devices.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#4 ' + "devices[0]" + ' = ' + JSON.stringify(devices[0]));
      expect(devices[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#5 ' + "devices[1]" + ' = ' + JSON.stringify(devices[1]));
      expect(devices[1]).assertEqual(DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#6 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#7 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#8 assert ' + "expect(service.getStateTransitions().length).assertEqual(4)");
      expect(service.getStateTransitions().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#9 assert ' + "expect(service.getOperationRecords().length).assertEqual(2)");
      expect(service.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#10 assert ' + "expect(service.getPerformanceMetrics().connectionEvents).assertEqual(2)");
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#11 assert ' + "expect(service.getPerformanceMetrics().totalOperations).assertEqual(2)");
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#12 assert ' + "expect(countHistory(service, 'connect')).assertEqual(2)");
      expect(countHistory(service, 'connect')).assertEqual(2);

      const secondRecord = lastRecord(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#13 ' + "secondRecord.operationId" + ' = ' + JSON.stringify(secondRecord.operationId));
      expect(secondRecord.operationId).assertEqual('op_2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#14 ' + "secondRecord.deviceId" + ' = ' + JSON.stringify(secondRecord.deviceId));
      expect(secondRecord.deviceId).assertEqual(DEVICE_B);

      const stats = statsOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#15 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0009',
        '#16 ' + "stats.stateTransitionCount" + ' = ' + JSON.stringify(stats.stateTransitionCount));
      expect(stats.stateTransitionCount).assertEqual(4);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0009', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_1000
     * @tc.name: testPbapService0010
     * @tc.desc: Verify disconnecting an unknown device is rejected and leaves the connection untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0010', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0010', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      await service.connect(DEVICE_A);
      const historyBefore: number = service.getOperationHistory().length;

      const result = await service.disconnect('pbap_service_device_unknown');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0010',
        '#1 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0010',
        '#2 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0010',
        '#3 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(1)");
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0010',
        '#4 assert ' + "expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A)");
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0010',
        '#5 assert ' + "expect(service.getStateTransitions().length).assertEqual(2)");
      expect(service.getStateTransitions().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0010',
        '#6 assert ' + "expect(service.getOperationRecords().length).assertEqual(1)");
      expect(service.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0010',
        '#7 assert ' + "expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(0)");
      expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0010',
        '#8 assert ' + "expect(service.getOperationHistory().length).assertEqual(historyBefore + 1)");
      expect(service.getOperationHistory().length).assertEqual(historyBefore + 1);

      const entry = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0010',
        '#9 ' + "entry.operation" + ' = ' + JSON.stringify(entry.operation));
      expect(entry.operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0010',
        '#10 ' + "entry.success" + ' = ' + JSON.stringify(entry.success));
      expect(entry.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0010',
        '#11 ' + "entry.details" + ' = ' + JSON.stringify(entry.details));
      expect(entry.details).assertEqual('Device not connected');

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0010', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_1100
     * @tc.name: testPbapService0011
     * @tc.desc: Verify disconnecting one of two devices keeps the service connected and skips the model reset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0011', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0011', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      await service.connect(DEVICE_A);
      await service.connect(DEVICE_B);
      const modelBefore = service.getModel();
      modelBefore.markConnecting();
      const transitionsBefore: number = service.getStateTransitions().length;

      const result = await service.disconnect(DEVICE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#1 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#2 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#3 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#4 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(1)");
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#5 assert ' + "expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B)");
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#6 assert ' + "expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(1)");
      expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#7 assert ' + "expect(service.getModel() === modelBefore).assertTrue()");
      expect(service.getModel() === modelBefore).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#8 assert ' + "expect(service.getModel().state).assertEqual(PbapState.CONNECTING)");
      expect(service.getModel().state).assertEqual(PbapState.CONNECTING);

      const transitions = service.getStateTransitions();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#9 ' + "transitions.length" + ' = ' + JSON.stringify(transitions.length));
      expect(transitions.length).assertEqual(transitionsBefore + 2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#10 ' + "transitions[transitions.length - 2].to" + ' = ' +
        JSON.stringify(transitions[transitions.length - 2].to));
      expect(transitions[transitions.length - 2].to).assertEqual(BluetoothConnectionState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#11 ' + "transitions[transitions.length - 1].to" + ' = ' +
        JSON.stringify(transitions[transitions.length - 1].to));
      expect(transitions[transitions.length - 1].to).assertEqual(BluetoothConnectionState.CONNECTED);

      const record = lastRecord(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#12 ' + "record.operationName" + ' = ' + JSON.stringify(record.operationName));
      expect(record.operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#13 ' + "record.deviceId" + ' = ' + JSON.stringify(record.deviceId));
      expect(record.deviceId).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#14 ' + "record.details" + ' = ' + JSON.stringify(record.details));
      expect(record.details).assertEqual('Disconnected successfully');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0011',
        '#15 ' + "record.operationId" + ' = ' + JSON.stringify(record.operationId));
      expect(record.operationId).assertEqual('op_3');

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0011', 'end');
    });

    // ==================== model type link move (3 cases) ====================

    /*
     * @tc.number: SUB_PBAP_SERVICE_1200
     * @tc.name: testPbapService0012
     * @tc.desc: Verify a successful connection leaves the bound model untouched by the state entry point.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0012', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0012', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      const model = service.getModel();

      await service.connect(DEVICE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0012',
        '#1 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0012',
        '#2 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0012',
        '#3 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0012',
        '#4 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0012',
        '#5 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0012',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0012',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0012',
        '#8 assert ' + "expect(service.getModel() === model).assertTrue()");
      expect(service.getModel() === model).assertTrue();

      await service.disconnect(DEVICE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0012',
        '#9 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0012',
        '#10 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0012',
        '#11 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0012', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_1300
     * @tc.name: testPbapService0013
     * @tc.desc: Verify dropping the last connection resets the model and returns the service to disconnected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0013', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0013', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      await service.connect(DEVICE_A);
      const model = service.getModel();
      model.markConnecting();
      model.markConnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#2 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);

      const result = await service.disconnect(DEVICE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#3 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#4 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#5 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#6 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#7 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#8 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#9 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#10 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#11 assert ' + "expect(service.getModel() === model).assertTrue()");
      expect(service.getModel() === model).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#12 assert ' + "expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(1)");
      expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(1);

      const transitions = service.getStateTransitions();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#13 ' + "transitions.length" + ' = ' + JSON.stringify(transitions.length));
      expect(transitions.length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0013',
        '#14 ' + "transitions[3].to" + ' = ' + JSON.stringify(transitions[3].to));
      expect(transitions[3].to).assertEqual(BluetoothConnectionState.DISCONNECTED);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0013', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_1400
     * @tc.name: testPbapService0014
     * @tc.desc: Verify the accessor methods return defensive copies rather than internal collections.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0014', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0014', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      await service.connect(DEVICE_A);

      const devices = service.getConnectedDeviceIds();
      const otherDevices = service.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0014',
        '#1 ' + "devices.length" + ' = ' + JSON.stringify(devices.length));
      expect(devices.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0014',
        '#2 ' + "devices === otherDevices" + ' = ' + JSON.stringify(devices === otherDevices));
      expect(devices === otherDevices).assertFalse();
      devices.push(DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0014',
        '#3 ' + "devices.length" + ' = ' + JSON.stringify(devices.length));
      expect(devices.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0014',
        '#4 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(1)");
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0014',
        '#5 assert ' + "expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A)");
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);

      const history = service.getOperationHistory();
      const otherHistory = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0014',
        '#6 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0014',
        '#7 ' + "history === otherHistory" + ' = ' + JSON.stringify(history === otherHistory));
      expect(history === otherHistory).assertFalse();

      const records = service.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0014',
        '#8 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0014',
        '#9 assert ' + "expect(records === service.getOperationRecords()).assertFalse()");
      expect(records === service.getOperationRecords()).assertFalse();

      const transitions = service.getStateTransitions();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0014',
        '#10 ' + "transitions.length" + ' = ' + JSON.stringify(transitions.length));
      expect(transitions.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0014',
        '#11 assert ' + "expect(transitions === service.getStateTransitions()).assertFalse()");
      expect(transitions === service.getStateTransitions()).assertFalse();

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0014', 'end');
    });

    // ==================== number data same step (2 cases) ====================

    /*
     * @tc.number: SUB_PBAP_SERVICE_1500
     * @tc.name: testPbapService0015
     * @tc.desc: Verify syncing data on a connected device records one operation and no state transition.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0015', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0015', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      await service.connect(DEVICE_A);
      const transitionsBefore: number = service.getStateTransitions().length;

      const result = await service.syncData(DEVICE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#1 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#2 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#3 assert ' + "expect(service.getStateTransitions().length).assertEqual(transitionsBefore)");
      expect(service.getStateTransitions().length).assertEqual(transitionsBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#4 assert ' + "expect(service.getPerformanceMetrics().dataSyncEvents).assertEqual(1)");
      expect(service.getPerformanceMetrics().dataSyncEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#5 assert ' + "expect(service.getPerformanceMetrics().totalOperations).assertEqual(2)");
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#6 assert ' + "expect(service.getOperationRecords().length).assertEqual(2)");
      expect(service.getOperationRecords().length).assertEqual(2);

      const record = lastRecord(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#7 ' + "record.operationId" + ' = ' + JSON.stringify(record.operationId));
      expect(record.operationId).assertEqual('op_2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#8 ' + "record.operationName" + ' = ' + JSON.stringify(record.operationName));
      expect(record.operationName).assertEqual('syncData');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#9 ' + "record.deviceId" + ' = ' + JSON.stringify(record.deviceId));
      expect(record.deviceId).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#10 ' + "record.success" + ' = ' + JSON.stringify(record.success));
      expect(record.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#11 ' + "record.details" + ' = ' + JSON.stringify(record.details));
      expect(record.details).assertEqual('Data synchronized');

      const entry = lastHistory(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#12 ' + "entry.operation" + ' = ' + JSON.stringify(entry.operation));
      expect(entry.operation).assertEqual('syncData');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#13 ' + "entry.success" + ' = ' + JSON.stringify(entry.success));
      expect(entry.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0015',
        '#14 ' + "entry.details" + ' = ' + JSON.stringify(entry.details));
      expect(entry.details).assertEqual('Data synced from ' + DEVICE_A);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0015', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_1600
     * @tc.name: testPbapService0016
     * @tc.desc: Verify syncing data for a disconnected device is rejected without counting a sync event.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0016', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0016', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      await service.connect(DEVICE_A);

      const unknown = await service.syncData('pbap_service_device_unknown');
      await service.disconnect(DEVICE_A);
      const afterDisconnect = await service.syncData(DEVICE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0016',
        '#1 ' + "unknown" + ' = ' + JSON.stringify(unknown));
      expect(unknown).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0016',
        '#2 ' + "afterDisconnect" + ' = ' + JSON.stringify(afterDisconnect));
      expect(afterDisconnect).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0016',
        '#3 assert ' + "expect(service.getPerformanceMetrics().dataSyncEvents).assertEqual(0)");
      expect(service.getPerformanceMetrics().dataSyncEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0016',
        '#4 assert ' + "expect(service.getPerformanceMetrics().totalOperations).assertEqual(2)");
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0016',
        '#5 assert ' + "expect(countHistory(service, 'syncData')).assertEqual(2)");
      expect(countHistory(service, 'syncData')).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0016',
        '#6 assert ' + "expect(lastHistory(service).details).assertEqual('Not connected')");
      expect(lastHistory(service).details).assertEqual('Not connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0016',
        '#7 assert ' + "expect(lastHistory(service).success).assertFalse()");
      expect(lastHistory(service).success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0016',
        '#8 assert ' + "expect(service.getOperationRecords().length).assertEqual(2)");
      expect(service.getOperationRecords().length).assertEqual(2);

      const stats = statsOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0016',
        '#9 ' + "stats.operationRecordCount" + ' = ' + JSON.stringify(stats.operationRecordCount));
      expect(stats.operationRecordCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0016',
        '#10 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0016', 'end');
    });

    // ==================== config set and property capability metric (3 cases) ====================

    /*
     * @tc.number: SUB_PBAP_SERVICE_1700
     * @tc.name: testPbapService0017
     * @tc.desc: Verify the connection configuration merges partial updates and returns a detached copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0017', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0017', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();

      const initial = service.getConnectionConfig();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#1 ' + "initial.connectionTimeoutMs" + ' = ' + JSON.stringify(initial.connectionTimeoutMs));
      expect(initial.connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#2 ' + "initial.operationTimeoutMs" + ' = ' + JSON.stringify(initial.operationTimeoutMs));
      expect(initial.operationTimeoutMs).assertEqual(DEFAULT_OPERATION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#3 ' + "initial.maxRetryAttempts" + ' = ' + JSON.stringify(initial.maxRetryAttempts));
      expect(initial.maxRetryAttempts).assertEqual(DEFAULT_MAX_RETRY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#4 ' + "initial.retryDelayMs" + ' = ' + JSON.stringify(initial.retryDelayMs));
      expect(initial.retryDelayMs).assertEqual(DEFAULT_RETRY_DELAY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#5 ' + "initial.useExponentialBackoff" + ' = ' + JSON.stringify(initial.useExponentialBackoff));
      expect(initial.useExponentialBackoff).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#6 ' + "initial.maxBackoffDelayMs" + ' = ' + JSON.stringify(initial.maxBackoffDelayMs));
      expect(initial.maxBackoffDelayMs).assertEqual(DEFAULT_MAX_BACKOFF);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#7 ' + "initial.autoReconnect" + ' = ' + JSON.stringify(initial.autoReconnect));
      expect(initial.autoReconnect).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#8 ' + "initial.maxAutoReconnectAttempts" + ' = ' + JSON.stringify(initial.maxAutoReconnectAttempts));
      expect(initial.maxAutoReconnectAttempts).assertEqual(DEFAULT_AUTO_RECONNECT_ATTEMPTS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#9 ' + "initial.autoReconnectDelayMs" + ' = ' + JSON.stringify(initial.autoReconnectDelayMs));
      expect(initial.autoReconnectDelayMs).assertEqual(DEFAULT_AUTO_RECONNECT_DELAY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#10 ' + "initial.verboseLogging" + ' = ' + JSON.stringify(initial.verboseLogging));
      expect(initial.verboseLogging).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#11 ' + "initial.enablePerformanceTracing" + ' = ' + JSON.stringify(initial.enablePerformanceTracing));
      expect(initial.enablePerformanceTracing).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#12 ' + "initial.customParameters.size" + ' = ' + JSON.stringify(initial.customParameters.size));
      expect(initial.customParameters.size).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#13 assert ' + "expect(service.getOperationHistory().length).assertEqual(1)");
      expect(service.getOperationHistory().length).assertEqual(1);

      service.setConnectionConfig({ connectionTimeoutMs: 500, verboseLogging: true });

      const merged = service.getConnectionConfig();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#14 ' + "merged.connectionTimeoutMs" + ' = ' + JSON.stringify(merged.connectionTimeoutMs));
      expect(merged.connectionTimeoutMs).assertEqual(500);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#15 ' + "merged.verboseLogging" + ' = ' + JSON.stringify(merged.verboseLogging));
      expect(merged.verboseLogging).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#16 ' + "merged.operationTimeoutMs" + ' = ' + JSON.stringify(merged.operationTimeoutMs));
      expect(merged.operationTimeoutMs).assertEqual(DEFAULT_OPERATION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#17 ' + "merged.maxRetryAttempts" + ' = ' + JSON.stringify(merged.maxRetryAttempts));
      expect(merged.maxRetryAttempts).assertEqual(DEFAULT_MAX_RETRY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#18 ' + "merged.autoReconnect" + ' = ' + JSON.stringify(merged.autoReconnect));
      expect(merged.autoReconnect).assertTrue();

      merged.connectionTimeoutMs = 1;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#19 assert ' + "expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(500)");
      expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(500);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#20 assert ' + "expect(service.getConnectionConfig() === service.getConnectionConfig()).assertFalse()");
      expect(service.getConnectionConfig() === service.getConnectionConfig()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#21 assert ' + "expect(service.getOperationHistory().length).assertEqual(1)");
      expect(service.getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0017',
        '#22 assert ' + "expect(service.getPerformanceMetrics().totalOperations).assertEqual(0)");
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(0);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0017', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_1800
     * @tc.name: testPbapService0018
     * @tc.desc: Verify a shortened connection timeout still completes the handshake with full bookkeeping.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0018', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0018', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      service.setConnectionConfig({ connectionTimeoutMs: 800 });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0018',
        '#1 assert ' + "expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(800)");
      expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(800);

      const started: number = Date.now();
      const result = await service.connect(DEVICE_A);
      const elapsed: number = Date.now() - started;

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0018',
        '#2 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0018',
        '#3 ' + "elapsed >= 500" + ' = ' + JSON.stringify(elapsed >= 500));
      expect(elapsed >= 500).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0018',
        '#4 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0018',
        '#5 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(1)");
      expect(service.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0018',
        '#6 assert ' + "expect(service.getStateTransitions().length).assertEqual(2)");
      expect(service.getStateTransitions().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0018',
        '#7 assert ' + "expect(service.getOperationRecords().length).assertEqual(1)");
      expect(service.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0018',
        '#8 assert ' + "expect(lastRecord(service).operationId).assertEqual('op_1')");
      expect(lastRecord(service).operationId).assertEqual('op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0018',
        '#9 assert ' + "expect(service.getPerformanceMetrics().connectionEvents).assertEqual(1)");
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0018',
        '#10 assert ' + "expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(800)");
      expect(service.getConnectionConfig().connectionTimeoutMs).assertEqual(800);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0018', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_1900
     * @tc.name: testPbapService0019
     * @tc.desc: Verify the derived performance metrics keep duration and error aggregates untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0019', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0019', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();

      const fresh = service.getPerformanceMetrics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#1 ' + "fresh.minDurationMs" + ' = ' + JSON.stringify(fresh.minDurationMs));
      expect(fresh.minDurationMs).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#2 ' + "fresh.averageDurationMs" + ' = ' + JSON.stringify(fresh.averageDurationMs));
      expect(fresh.averageDurationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#3 ' + "fresh.maxDurationMs" + ' = ' + JSON.stringify(fresh.maxDurationMs));
      expect(fresh.maxDurationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#4 ' + "fresh.errorRate" + ' = ' + JSON.stringify(fresh.errorRate));
      expect(fresh.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#5 ' + "fresh.operationsPerMinute" + ' = ' + JSON.stringify(fresh.operationsPerMinute));
      expect(fresh.operationsPerMinute).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#6 ' + "fresh.totalOperations" + ' = ' + JSON.stringify(fresh.totalOperations));
      expect(fresh.totalOperations).assertEqual(0);

      const started: number = Date.now();
      await service.connect(DEVICE_A);
      await service.syncData(DEVICE_A);
      await service.disconnect(DEVICE_A);
      const finished: number = Date.now();

      const metrics = service.getPerformanceMetrics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#7 ' + "metrics.totalOperations" + ' = ' + JSON.stringify(metrics.totalOperations));
      expect(metrics.totalOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#8 ' + "metrics.successfulOperations" + ' = ' + JSON.stringify(metrics.successfulOperations));
      expect(metrics.successfulOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#9 ' + "metrics.failedOperations" + ' = ' + JSON.stringify(metrics.failedOperations));
      expect(metrics.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#10 ' + "metrics.errorRate" + ' = ' + JSON.stringify(metrics.errorRate));
      expect(metrics.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#11 ' + "metrics.connectionEvents" + ' = ' + JSON.stringify(metrics.connectionEvents));
      expect(metrics.connectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#12 ' + "metrics.disconnectionEvents" + ' = ' + JSON.stringify(metrics.disconnectionEvents));
      expect(metrics.disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#13 ' + "metrics.dataSyncEvents" + ' = ' + JSON.stringify(metrics.dataSyncEvents));
      expect(metrics.dataSyncEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#14 ' + "metrics.stateTransitions" + ' = ' + JSON.stringify(metrics.stateTransitions));
      expect(metrics.stateTransitions).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#15 ' + "metrics.minDurationMs" + ' = ' + JSON.stringify(metrics.minDurationMs));
      expect(metrics.minDurationMs).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#16 ' + "metrics.averageDurationMs" + ' = ' + JSON.stringify(metrics.averageDurationMs));
      expect(metrics.averageDurationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#17 ' + "metrics.maxDurationMs" + ' = ' + JSON.stringify(metrics.maxDurationMs));
      expect(metrics.maxDurationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#18 ' + "metrics.lastOperationTime >= started && metrics.lastOperationTime <= finished" + ' = ' +
        JSON.stringify(metrics.lastOperationTime >= started && metrics.lastOperationTime <= finished));
      expect(metrics.lastOperationTime >= started && metrics.lastOperationTime <= finished).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#19 ' + "metrics.uptimeMs >= 1000" + ' = ' + JSON.stringify(metrics.uptimeMs >= 1000));
      expect(metrics.uptimeMs >= 1000).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#20 ' + "metrics.operationsPerMinute > 0" + ' = ' + JSON.stringify(metrics.operationsPerMinute > 0));
      expect(metrics.operationsPerMinute > 0).assertTrue();

      const again = service.getPerformanceMetrics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#21 ' + "again === metrics" + ' = ' + JSON.stringify(again === metrics));
      expect(again === metrics).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0019',
        '#22 ' + "again.totalOperations" + ' = ' + JSON.stringify(again.totalOperations));
      expect(again.totalOperations).assertEqual(metrics.totalOperations);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0019', 'end');
    });

    // ==================== callback registration and notification (3 cases) ====================

    /*
     * @tc.number: SUB_PBAP_SERVICE_2000
     * @tc.name: testPbapService0020
     * @tc.desc: Verify connection callbacks fire once per settled connection and skip intermediate states.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0020', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0020', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      const states: string[] = [];
      const callback = (state: BluetoothConnectionState): void => {
        states.push(state);
      };

      service.addConnectionCallback(callback);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0020',
        '#1 assert ' + "expect(statsOf(service).connectionCallbackCount).assertEqual(1)");
      expect(statsOf(service).connectionCallbackCount).assertEqual(1);

      await service.connect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0020',
        '#2 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0020',
        '#3 ' + "states[0]" + ' = ' + JSON.stringify(states[0]));
      expect(states[0]).assertEqual(BluetoothConnectionState.CONNECTED);

      await service.disconnect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0020',
        '#4 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0020',
        '#5 ' + "states[1]" + ' = ' + JSON.stringify(states[1]));
      expect(states[1]).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0020',
        '#6 assert ' + "expect(states.indexOf(BluetoothConnectionState.CONNECTING)).assertEqual(-1)");
      expect(states.indexOf(BluetoothConnectionState.CONNECTING)).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0020',
        '#7 assert ' + "expect(states.indexOf(BluetoothConnectionState.DISCONNECTING)).assertEqual(-1)");
      expect(states.indexOf(BluetoothConnectionState.DISCONNECTING)).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0020',
        '#8 assert ' + "expect(service.getStateTransitions().length).assertEqual(4)");
      expect(service.getStateTransitions().length).assertEqual(4);

      service.removeConnectionCallback(callback);
      await service.connect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0020',
        '#9 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0020',
        '#10 assert ' + "expect(statsOf(service).connectionCallbackCount).assertEqual(0)");
      expect(statsOf(service).connectionCallbackCount).assertEqual(0);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0020', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_2100
     * @tc.name: testPbapService0021
     * @tc.desc: Verify registering the same callback twice is deduplicated and removal is selective.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0021', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0021', 'begin');
      const service: PbapService = new PbapService();
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
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0021',
        '#1 assert ' + "expect(statsOf(service).connectionCallbackCount).assertEqual(2)");
      expect(statsOf(service).connectionCallbackCount).assertEqual(2);

      await service.connect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0021',
        '#2 ' + "hits.length" + ' = ' + JSON.stringify(hits.length));
      expect(hits.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0021',
        '#3 ' + "hits[0]" + ' = ' + JSON.stringify(hits[0]));
      expect(hits[0]).assertEqual('shared');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0021',
        '#4 ' + "hits[1]" + ' = ' + JSON.stringify(hits[1]));
      expect(hits[1]).assertEqual('other');

      service.removeConnectionCallback(other);
      service.removeConnectionCallback(other);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0021',
        '#5 assert ' + "expect(statsOf(service).connectionCallbackCount).assertEqual(1)");
      expect(statsOf(service).connectionCallbackCount).assertEqual(1);

      hits.splice(0, hits.length);
      await service.disconnect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0021',
        '#6 ' + "hits.length" + ' = ' + JSON.stringify(hits.length));
      expect(hits.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0021',
        '#7 ' + "hits[0]" + ' = ' + JSON.stringify(hits[0]));
      expect(hits[0]).assertEqual('shared');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0021',
        '#8 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0021', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_2200
     * @tc.name: testPbapService0022
     * @tc.desc: Verify data and operation callbacks receive live payloads and a throwing listener is isolated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0022', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0022', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      const model = service.getModel();
      const seenModels: PbapModel[] = [];
      const seenRecords: string[] = [];
      const dataCallback = (received: PbapModel): void => {
        seenModels.push(received);
      };
      const operationCallback = (record: PbapOperationRecord): void => {
        seenRecords.push(record.operationId + ':' + record.operationName);
      };
      const throwing = (state: BluetoothConnectionState): void => {
        throw new Error('callback failure');
      };

      service.addDataCallback(dataCallback);
      service.addOperationCallback(operationCallback);
      service.addConnectionCallback(throwing);

      await service.connect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#1 ' + "seenModels.length" + ' = ' + JSON.stringify(seenModels.length));
      expect(seenModels.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#2 ' + "seenModels[0] === model" + ' = ' + JSON.stringify(seenModels[0] === model));
      expect(seenModels[0] === model).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#3 ' + "seenRecords.length" + ' = ' + JSON.stringify(seenRecords.length));
      expect(seenRecords.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#4 ' + "seenRecords[0]" + ' = ' + JSON.stringify(seenRecords[0]));
      expect(seenRecords[0]).assertEqual('op_1:connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#5 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();

      await service.syncData(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#6 ' + "seenModels.length" + ' = ' + JSON.stringify(seenModels.length));
      expect(seenModels.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#7 ' + "seenRecords.length" + ' = ' + JSON.stringify(seenRecords.length));
      expect(seenRecords.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#8 ' + "seenRecords[1]" + ' = ' + JSON.stringify(seenRecords[1]));
      expect(seenRecords[1]).assertEqual('op_2:syncData');

      const stats = statsOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#9 ' + "stats.dataCallbackCount" + ' = ' + JSON.stringify(stats.dataCallbackCount));
      expect(stats.dataCallbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#10 ' + "stats.operationCallbackCount" + ' = ' + JSON.stringify(stats.operationCallbackCount));
      expect(stats.operationCallbackCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#11 ' + "stats.connectionCallbackCount" + ' = ' + JSON.stringify(stats.connectionCallbackCount));
      expect(stats.connectionCallbackCount).assertEqual(1);

      service.removeDataCallback(dataCallback);
      service.removeOperationCallback(operationCallback);
      await service.disconnect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#12 ' + "seenModels.length" + ' = ' + JSON.stringify(seenModels.length));
      expect(seenModels.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#13 ' + "seenRecords.length" + ' = ' + JSON.stringify(seenRecords.length));
      expect(seenRecords.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0022',
        '#14 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0022', 'end');
    });

    // ==================== history and record upper limit (3 cases) ====================

    /*
     * @tc.number: SUB_PBAP_SERVICE_2300
     * @tc.name: testPbapService0023
     * @tc.desc: Verify the operation history is trimmed to its ceiling while the counters keep growing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0023', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0023', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#1 assert ' + "expect(await service.connect(DEVICE_A)).assertTrue()");
      expect(await service.connect(DEVICE_A)).assertTrue();

      let everyRejected: boolean = true;
      for (let i = 0; i < 250; i++) {
        const repeated = await service.connect(DEVICE_A);
        if (!repeated) {
          everyRejected = false;
        }
      }

      const history = historyOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#2 ' + "everyRejected" + ' = ' + JSON.stringify(everyRejected));
      expect(everyRejected).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#3 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(MAX_HISTORY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#4 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#5 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Already connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#6 ' + "history[history.length - 1].details" + ' = ' + JSON.stringify(history[history.length - 1].details));
      expect(history[history.length - 1].details).assertEqual('Already connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#7 assert ' + "expect(countHistory(service, 'initialize')).assertEqual(0)");
      expect(countHistory(service, 'initialize')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#8 assert ' + "expect(service.getOperationRecords().length).assertEqual(1)");
      expect(service.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#9 assert ' + "expect(lastRecord(service).operationId).assertEqual('op_1')");
      expect(lastRecord(service).operationId).assertEqual('op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#10 assert ' + "expect(service.getStateTransitions().length).assertEqual(2)");
      expect(service.getStateTransitions().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#11 assert ' + "expect(service.getPerformanceMetrics().totalOperations).assertEqual(1)");
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#12 assert ' + "expect(service.getPerformanceMetrics().connectionEvents).assertEqual(1)");
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0023',
        '#13 assert ' + "expect(statsOf(service).operationHistoryCount).assertEqual(MAX_HISTORY)");
      expect(statsOf(service).operationHistoryCount).assertEqual(MAX_HISTORY);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0023', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_2400
     * @tc.name: testPbapService0024
     * @tc.desc: Verify rejected operations create no record while accepted ones receive increasing identifiers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0024', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0024', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#1 assert ' + "expect(service.getOperationRecords().length).assertEqual(0)");
      expect(service.getOperationRecords().length).assertEqual(0);

      await service.connect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#2 assert ' + "expect(lastRecord(service).operationId).assertEqual('op_1')");
      expect(lastRecord(service).operationId).assertEqual('op_1');

      await service.syncData(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#3 assert ' + "expect(lastRecord(service).operationId).assertEqual('op_2')");
      expect(lastRecord(service).operationId).assertEqual('op_2');

      await service.syncData(DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#4 assert ' + "expect(service.getOperationRecords().length).assertEqual(2)");
      expect(service.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#5 assert ' + "expect(lastRecord(service).operationId).assertEqual('op_2')");
      expect(lastRecord(service).operationId).assertEqual('op_2');

      await service.connect('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#6 assert ' + "expect(service.getOperationRecords().length).assertEqual(2)");
      expect(service.getOperationRecords().length).assertEqual(2);

      await service.disconnect(DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#7 assert ' + "expect(service.getOperationRecords().length).assertEqual(2)");
      expect(service.getOperationRecords().length).assertEqual(2);

      await service.disconnect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#8 assert ' + "expect(service.getOperationRecords().length).assertEqual(3)");
      expect(service.getOperationRecords().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#9 assert ' + "expect(lastRecord(service).operationId).assertEqual('op_3')");
      expect(lastRecord(service).operationId).assertEqual('op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#10 assert ' + "expect(lastRecord(service).operationName).assertEqual('disconnect')");
      expect(lastRecord(service).operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#11 assert ' + "expect(lastRecord(service).deviceId).assertEqual(DEVICE_A)");
      expect(lastRecord(service).deviceId).assertEqual(DEVICE_A);

      const metrics = service.getPerformanceMetrics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#12 ' + "metrics.totalOperations" + ' = ' + JSON.stringify(metrics.totalOperations));
      expect(metrics.totalOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#13 ' + "metrics.successfulOperations" + ' = ' + JSON.stringify(metrics.successfulOperations));
      expect(metrics.successfulOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0024',
        '#14 ' + "metrics.failedOperations" + ' = ' + JSON.stringify(metrics.failedOperations));
      expect(metrics.failedOperations).assertEqual(0);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0024', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_2500
     * @tc.name: testPbapService0025
     * @tc.desc: Verify the statistics snapshot agrees with every individual accessor after a session.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0025', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0025', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      await service.connect(DEVICE_A);
      await service.syncData(DEVICE_A);

      const stats = statsOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#1 ' + "stats.serviceName" + ' = ' + JSON.stringify(stats.serviceName));
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#2 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#3 ' + "stats.connectionState" + ' = ' + JSON.stringify(stats.connectionState));
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#4 ' + "stats.connectionState" + ' = ' + JSON.stringify(stats.connectionState));
      expect(stats.connectionState).assertEqual(service.getConnectionState());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#5 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(service.getConnectedDeviceIds().length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#6 ' + "stats.stateTransitionCount" + ' = ' + JSON.stringify(stats.stateTransitionCount));
      expect(stats.stateTransitionCount).assertEqual(service.getStateTransitions().length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#7 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(service.getOperationHistory().length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#8 ' + "stats.operationRecordCount" + ' = ' + JSON.stringify(stats.operationRecordCount));
      expect(stats.operationRecordCount).assertEqual(service.getOperationRecords().length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#9 ' + "stats.operationRecordCount" + ' = ' + JSON.stringify(stats.operationRecordCount));
      expect(stats.operationRecordCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#10 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#11 ' + "stats.stateTransitionCount" + ' = ' + JSON.stringify(stats.stateTransitionCount));
      expect(stats.stateTransitionCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#12 ' + "stats.isProcessing" + ' = ' + JSON.stringify(stats.isProcessing));
      expect(stats.isProcessing).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#13 ' + "stats.queueSize" + ' = ' + JSON.stringify(stats.queueSize));
      expect(stats.queueSize).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#14 ' + "stats.currentRetryCount" + ' = ' + JSON.stringify(stats.currentRetryCount));
      expect(stats.currentRetryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#15 ' + "stats.lastError" + ' = ' + JSON.stringify(stats.lastError));
      expect(stats.lastError).assertEqual('');

      const nested: PbapServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#16 ' + "nested.performanceMetrics.totalOperations" + ' = ' +
        JSON.stringify(nested.performanceMetrics.totalOperations));
      expect(nested.performanceMetrics.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#17 ' + "nested.performanceMetrics.connectionEvents" + ' = ' +
        JSON.stringify(nested.performanceMetrics.connectionEvents));
      expect(nested.performanceMetrics.connectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#18 ' + "nested.performanceMetrics.dataSyncEvents" + ' = ' +
        JSON.stringify(nested.performanceMetrics.dataSyncEvents));
      expect(nested.performanceMetrics.dataSyncEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#19 ' + "nested.connectedDevices.length" + ' = ' + JSON.stringify(nested.connectedDevices.length));
      expect(nested.connectedDevices.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0025',
        '#20 ' + "nested.connectedDevices[0]" + ' = ' + JSON.stringify(nested.connectedDevices[0]));
      expect(nested.connectedDevices[0]).assertEqual(DEVICE_A);

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0025', 'end');
    });

    // ==================== reset and combined scenario (5 cases) ====================

    /*
     * @tc.number: SUB_PBAP_SERVICE_2600
     * @tc.name: testPbapService0026
     * @tc.desc: Verify reset drops every session collection while the accumulated metrics survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0026', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0026', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      const modelBefore = service.getModel();
      await service.connect(DEVICE_A);
      await service.connect(DEVICE_B);
      await service.syncData(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#1 assert ' + "expect(service.getOperationRecords().length).assertEqual(3)");
      expect(service.getOperationRecords().length).assertEqual(3);

      await service.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#2 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#3 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#4 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#5 assert ' + "expect(service.getModel() !== modelBefore).assertTrue()");
      expect(service.getModel() !== modelBefore).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#6 assert ' + "expect(service.getModel().deviceId).assertEqual('')");
      expect(service.getModel().deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#7 assert ' + "expect(service.getModel().state).assertEqual(PbapState.DISCONNECTED)");
      expect(service.getModel().state).assertEqual(PbapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#8 assert ' + "expect(service.getStateTransitions().length).assertEqual(0)");
      expect(service.getStateTransitions().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#9 assert ' + "expect(service.getOperationRecords().length).assertEqual(0)");
      expect(service.getOperationRecords().length).assertEqual(0);

      const history = historyOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#10 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#11 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#12 ' + "history[0].success" + ' = ' + JSON.stringify(history[0].success));
      expect(history[0].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#13 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service reset');

      const metrics = service.getPerformanceMetrics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#14 ' + "metrics.totalOperations" + ' = ' + JSON.stringify(metrics.totalOperations));
      expect(metrics.totalOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#15 ' + "metrics.successfulOperations" + ' = ' + JSON.stringify(metrics.successfulOperations));
      expect(metrics.successfulOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#16 ' + "metrics.connectionEvents" + ' = ' + JSON.stringify(metrics.connectionEvents));
      expect(metrics.connectionEvents).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#17 ' + "metrics.disconnectionEvents" + ' = ' + JSON.stringify(metrics.disconnectionEvents));
      expect(metrics.disconnectionEvents).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#18 ' + "metrics.dataSyncEvents" + ' = ' + JSON.stringify(metrics.dataSyncEvents));
      expect(metrics.dataSyncEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0026',
        '#19 assert ' + "expect(statsOf(service).isInitialized).assertTrue()");
      expect(statsOf(service).isInitialized).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0026', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_2700
     * @tc.name: testPbapService0027
     * @tc.desc: Verify the operation identifier counter is not restored by reset although the record list is.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0027', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0027', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      await service.connect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#1 assert ' + "expect(lastRecord(service).operationId).assertEqual('op_1')");
      expect(lastRecord(service).operationId).assertEqual('op_1');

      await service.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#2 assert ' + "expect(service.getOperationRecords().length).assertEqual(0)");
      expect(service.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#3 assert ' + "expect(service.getOperationHistory().length).assertEqual(1)");
      expect(service.getOperationHistory().length).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#4 assert ' + "expect(await service.connect(DEVICE_B)).assertTrue()");
      expect(await service.connect(DEVICE_B)).assertTrue();

      const records = service.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#5 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#6 ' + "records[0].operationId" + ' = ' + JSON.stringify(records[0].operationId));
      expect(records[0].operationId).assertEqual('op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#7 ' + "records[0].deviceId" + ' = ' + JSON.stringify(records[0].deviceId));
      expect(records[0].deviceId).assertEqual(DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#8 assert ' + "expect(service.getPerformanceMetrics().totalOperations).assertEqual(3)");
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#9 assert ' + "expect(service.getPerformanceMetrics().connectionEvents).assertEqual(2)");
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#10 assert ' + "expect(service.getOperationHistory().length).assertEqual(2)");
      expect(service.getOperationHistory().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#11 assert ' + "expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B)");
      expect(service.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#12 assert ' + "expect(await service.initialize()).assertFalse()");
      expect(await service.initialize()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#13 assert ' + "expect(service.getOperationRecords().length).assertEqual(1)");
      expect(service.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#14 assert ' + "expect(lastRecord(service).operationId).assertEqual('op_3')");
      expect(lastRecord(service).operationId).assertEqual('op_3');

      await service.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#15 assert ' + "expect(statsOf(service).isInitialized).assertFalse()");
      expect(statsOf(service).isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#16 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#17 assert ' + "expect(service.getOperationRecords().length).assertEqual(0)");
      expect(service.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#18 assert ' + "expect(service.getPerformanceMetrics().totalOperations).assertEqual(0)");
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#19 assert ' + "expect(await service.connect(DEVICE_A)).assertTrue()");
      expect(await service.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0027',
        '#20 assert ' + "expect(lastRecord(service).operationId).assertEqual('op_1')");
      expect(lastRecord(service).operationId).assertEqual('op_1');

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0027', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_2800
     * @tc.name: testPbapService0028
     * @tc.desc: Verify every entry point is rejected after destroy until the service is initialized again.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0028', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0028', 'begin');
      const service: PbapService = new PbapService();
      await service.initialize();
      await service.connect(DEVICE_A);
      await service.destroy();

      const connected = await service.connect(DEVICE_B);
      const synced = await service.syncData(DEVICE_B);
      const disconnected = await service.disconnect(DEVICE_B);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#1 ' + "connected" + ' = ' + JSON.stringify(connected));
      expect(connected).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#2 ' + "synced" + ' = ' + JSON.stringify(synced));
      expect(synced).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#3 ' + "disconnected" + ' = ' + JSON.stringify(disconnected));
      expect(disconnected).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#4 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#5 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#6 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#7 assert ' + "expect(statsOf(service).isInitialized).assertFalse()");
      expect(statsOf(service).isInitialized).assertFalse();

      const history = historyOf(service);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#8 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#9 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#10 ' + "history[1].details" + ' = ' + JSON.stringify(history[1].details));
      expect(history[1].details).assertEqual('Service not initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#11 ' + "history[2].details" + ' = ' + JSON.stringify(history[2].details));
      expect(history[2].details).assertEqual('Not connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#12 ' + "history[3].details" + ' = ' + JSON.stringify(history[3].details));
      expect(history[3].details).assertEqual('Not initialized');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#13 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#14 assert ' + "expect(service.getOperationHistory().length).assertEqual(1)");
      expect(service.getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#15 assert ' + "expect(service.getOperationRecords().length).assertEqual(0)");
      expect(service.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#16 assert ' + "expect(service.getPerformanceMetrics().totalOperations).assertEqual(0)");
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#17 assert ' + "expect(service.getPerformanceMetrics().connectionEvents).assertEqual(0)");
      expect(service.getPerformanceMetrics().connectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#18 assert ' + "expect(await service.connect(DEVICE_A)).assertTrue()");
      expect(await service.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0028',
        '#19 assert ' + "expect(lastRecord(service).operationId).assertEqual('op_1')");
      expect(lastRecord(service).operationId).assertEqual('op_1');

      await service.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0028', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_2900
     * @tc.name: testPbapService0029
     * @tc.desc: Verify a full initialize connect sync disconnect destroy lifecycle leaves a clean service.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapService0029', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0029', 'begin');
      const service: PbapService = new PbapService();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#1 assert ' + "expect(await service.initialize()).assertTrue()");
      expect(await service.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#2 assert ' + "expect(await service.connect(DEVICE_A)).assertTrue()");
      expect(await service.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#3 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#4 assert ' + "expect(await service.syncData(DEVICE_A)).assertTrue()");
      expect(await service.syncData(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#5 assert ' + "expect(service.getOperationRecords().length).assertEqual(2)");
      expect(service.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#6 assert ' + "expect(await service.disconnect(DEVICE_A)).assertTrue()");
      expect(await service.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#7 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#8 assert ' + "expect(service.getOperationRecords().length).assertEqual(3)");
      expect(service.getOperationRecords().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#9 assert ' + "expect(service.getStateTransitions().length).assertEqual(4)");
      expect(service.getStateTransitions().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#10 assert ' + "expect(service.getOperationHistory().length).assertEqual(4)");
      expect(service.getOperationHistory().length).assertEqual(4);

      const peak = service.getPerformanceMetrics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#11 ' + "peak.totalOperations" + ' = ' + JSON.stringify(peak.totalOperations));
      expect(peak.totalOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#12 ' + "peak.successfulOperations" + ' = ' + JSON.stringify(peak.successfulOperations));
      expect(peak.successfulOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#13 ' + "peak.dataSyncEvents" + ' = ' + JSON.stringify(peak.dataSyncEvents));
      expect(peak.dataSyncEvents).assertEqual(1);

      await service.destroy();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#14 assert ' + "expect(statsOf(service).isInitialized).assertFalse()");
      expect(statsOf(service).isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#15 assert ' + "expect(service.getStateTransitions().length).assertEqual(0)");
      expect(service.getStateTransitions().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#16 assert ' + "expect(service.getOperationRecords().length).assertEqual(0)");
      expect(service.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#17 assert ' + "expect(service.getConnectedDeviceIds().length).assertEqual(0)");
      expect(service.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#18 assert ' + "expect(service.getOperationHistory().length).assertEqual(1)");
      expect(service.getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#19 assert ' + "expect(lastHistory(service).operation).assertEqual('reset')");
      expect(lastHistory(service).operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#20 assert ' + "expect(service.getPerformanceMetrics().totalOperations).assertEqual(3)");
      expect(service.getPerformanceMetrics().totalOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#21 assert ' + "expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(1)");
      expect(service.getPerformanceMetrics().disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0029',
        '#22 assert ' + "expect(service.getModel().state).assertEqual(PbapState.DISCONNECTED)");
      expect(service.getModel().state).assertEqual(PbapState.DISCONNECTED);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0029', 'end');
    });

    /*
     * @tc.number: SUB_PBAP_SERVICE_3000
     * @tc.name: testPbapService0030
     * @tc.desc: Verify two service instances keep their models devices histories and metrics independent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapService0030', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0030', 'begin');
      const first: PbapService = new PbapService();
      const second: PbapService = new PbapService();
      await first.initialize();
      await second.initialize();

      await first.connect(DEVICE_A);
      await first.syncData(DEVICE_A);
      await second.connect(DEVICE_B);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#1 assert ' + "expect(first.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A)");
      expect(first.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#2 assert ' + "expect(second.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B)");
      expect(second.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#3 assert ' + "expect(first.getConnectedDeviceIds().length).assertEqual(1)");
      expect(first.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#4 assert ' + "expect(second.getOperationRecords().length).assertEqual(1)");
      expect(second.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#5 assert ' + "expect(first.getOperationRecords().length).assertEqual(2)");
      expect(first.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#6 assert ' + "expect(lastRecord(first).operationId).assertEqual('op_2')");
      expect(lastRecord(first).operationId).assertEqual('op_2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#7 assert ' + "expect(lastRecord(second).operationId).assertEqual('op_1')");
      expect(lastRecord(second).operationId).assertEqual('op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#8 assert ' + "expect(first.getModel() !== second.getModel()).assertTrue()");
      expect(first.getModel() !== second.getModel()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#9 assert ' + "expect(first.getOperationHistory().length).assertEqual(3)");
      expect(first.getOperationHistory().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#10 assert ' + "expect(second.getOperationHistory().length).assertEqual(2)");
      expect(second.getOperationHistory().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#11 assert ' + "expect(first.getPerformanceMetrics().dataSyncEvents).assertEqual(1)");
      expect(first.getPerformanceMetrics().dataSyncEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#12 assert ' + "expect(second.getPerformanceMetrics().dataSyncEvents).assertEqual(0)");
      expect(second.getPerformanceMetrics().dataSyncEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#13 assert ' + "expect(second.getPerformanceMetrics().totalOperations).assertEqual(1)");
      expect(second.getPerformanceMetrics().totalOperations).assertEqual(1);

      await first.destroy();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#14 assert ' + "expect(statsOf(first).isInitialized).assertFalse()");
      expect(statsOf(first).isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#15 assert ' + "expect(statsOf(second).isInitialized).assertTrue()");
      expect(statsOf(second).isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#16 assert ' + "expect(second.isConnected()).assertTrue()");
      expect(second.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#17 assert ' + "expect(second.getConnectedDeviceIds().length).assertEqual(1)");
      expect(second.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapService0030',
        '#18 assert ' + "expect(second.getStateTransitions().length).assertEqual(2)");
      expect(second.getStateTransitions().length).assertEqual(2);

      await second.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapService0030', 'end');
    });
  });
}
