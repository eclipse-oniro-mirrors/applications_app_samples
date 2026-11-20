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
import { BluetoothConnectionState, BluetoothProfileType, A2dpModel, A2dpProfileManager } from 'library';
import { A2dpServiceStatistics, ManagerHealthStatus, OperationHistoryEntry } from 'library';

/**
 * @description Test suite for A2dpProfileManager
 * @since 26.0.0
 */

const SERVICE_NAME: string = 'A2dpService';
const PROFILE_ID: string = 'A2DP';
const DEVICE_A: string = 'a2dp_profile_device_a';
const DEVICE_B: string = 'a2dp_profile_device_b';
const DEVICE_C: string = 'a2dp_profile_device_c';
const GHOST_DEVICE: string = 'a2dp_profile_ghost_device';
const GHOST_PREFIX: string = 'a2dp_profile_ghost_';
const MAX_RECORD_SIZE: number = 500;
const MAX_QUEUE_SIZE: number = 50;
const DEFAULT_MAX_MANAGED_DEVICES: number = 10;
const DEFAULT_HEALTH_THRESHOLD: number = 50;
const DEFAULT_CONNECTION_TIMEOUT: number = 30000;
const DEFAULT_OPERATION_TIMEOUT: number = 10000;
const DEFAULT_MAX_RETRY: number = 3;
const DEFAULT_RETRY_DELAY: number = 1000;
const DEFAULT_MAX_BACKOFF: number = 30000;
const DEFAULT_AUTO_RECONNECT_ATTEMPTS: number = 5;
const DEFAULT_AUTO_RECONNECT_DELAY: number = 5000;
const DEFAULT_HEALTH_SCORE_INIT: number = 100;

interface RecordView {
  operationId: string;
  operationName: string;
  startTime: number;
  endTime: number;
  durationMs: number;
  success: boolean;
  errorMessage: string;
  details: string;
}

interface HealthView {
  isHealthy: boolean;
  healthScore: number;
  uptimeMs: number;
  connectionSuccessRate: number;
  operationSuccessRate: number;
  errorRate: number;
  managedDeviceCount: number;
  queuedOperationCount: number;
  retryAttempts: number;
  lastError: string;
}

function recordsOf(manager: A2dpProfileManager): RecordView[] {
  const source = manager.getOperationRecords();
  const list: RecordView[] = [];
  for (let i = 0; i < source.length; i++) {
    list.push({
      operationId: source[i].operationId,
      operationName: source[i].operationName,
      startTime: source[i].startTime,
      endTime: source[i].endTime,
      durationMs: source[i].durationMs,
      success: source[i].success,
      errorMessage: source[i].errorMessage,
      details: source[i].details
    });
  }
  return list;
}

function recordAt(manager: A2dpProfileManager, index: number): RecordView {
  const list = recordsOf(manager);
  return list[index];
}

function lastRecord(manager: A2dpProfileManager): RecordView {
  const list = recordsOf(manager);
  return list[list.length - 1];
}

function healthOf(manager: A2dpProfileManager): HealthView {
  const status: ManagerHealthStatus = manager.getHealthStatus();
  return {
    isHealthy: status.isHealthy,
    healthScore: status.healthScore,
    uptimeMs: status.uptimeMs,
    connectionSuccessRate: status.connectionSuccessRate,
    operationSuccessRate: status.operationSuccessRate,
    errorRate: status.errorRate,
    managedDeviceCount: status.managedDeviceCount,
    queuedOperationCount: status.queuedOperationCount,
    retryAttempts: status.retryAttempts,
    lastError: status.lastError
  };
}

function svcDetailsOf(manager: A2dpProfileManager): string[] {
  const history: OperationHistoryEntry[] = manager.getService().getOperationHistory();
  const list: string[] = [];
  const length: number = history.length;
  for (let i = 0; i < length; i++) {
    list.push(history[i].details as string);
  }
  return list;
}

function countString(items: string[], value: string): number {
  let count: number = 0;
  for (let i = 0; i < items.length; i++) {
    if (items[i] === value) {
      count++;
    }
  }
  return count;
}

export default function a2dpProfileManagerTest(): void {
  describe('A2dpProfileManagerTest', () => {
    /*
     * @tc.number: SUB_A2DP_PROFILE_0100
     * @tc.name: testA2dpProfile0001
     * @tc.desc: Verify that initialize returns true on the first call.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0001', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0001', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      const modelBeforeInit = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#2 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#3 assert ' + "expect(manager.getStatistics().uptimeMs).assertEqual(0)");
      expect(manager.getStatistics().uptimeMs).assertEqual(0);

      const result = await manager.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#4 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#5 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#6 ' + "records[0].operationId" + ' = ' + JSON.stringify(records[0].operationId));
      expect(records[0].operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#7 ' + "records[0].operationName" + ' = ' + JSON.stringify(records[0].operationName));
      expect(records[0].operationName).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#8 ' + "records[0].success" + ' = ' + JSON.stringify(records[0].success));
      expect(records[0].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#9 ' + "records[0].errorMessage" + ' = ' + JSON.stringify(records[0].errorMessage));
      expect(records[0].errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#10 ' + "records[0].details" + ' = ' + JSON.stringify(records[0].details));
      expect(records[0].details).assertEqual('Manager initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#11 ' + "records[0].startTime" + ' = ' + JSON.stringify(records[0].startTime));
      expect(records[0].startTime).assertEqual(records[0].endTime);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#12 ' + "records[0].durationMs" + ' = ' + JSON.stringify(records[0].durationMs));
      expect(records[0].durationMs).assertEqual(0);

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#13 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#14 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#15 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#16 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#17 ' + "stats.uptimeMs < 60000" + ' = ' + JSON.stringify(stats.uptimeMs < 60000));
      expect(stats.uptimeMs < 60000).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#18 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#19 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#20 ' + "stats.queuedOperationCount" + ' = ' + JSON.stringify(stats.queuedOperationCount));
      expect(stats.queuedOperationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#21 ' + "stats.retryAttempts" + ' = ' + JSON.stringify(stats.retryAttempts));
      expect(stats.retryAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#22 ' + "stats.autoReconnectEvents" + ' = ' + JSON.stringify(stats.autoReconnectEvents));
      expect(stats.autoReconnectEvents).assertEqual(0);

      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#23 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#24 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#25 ' + "svcStats.serviceName" + ' = ' + JSON.stringify(svcStats.serviceName));
      expect(svcStats.serviceName).assertEqual(SERVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#26 ' + "svcStats.isInitialized" + ' = ' + JSON.stringify(svcStats.isInitialized));
      expect(svcStats.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#27 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#28 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#29 assert ' + "expect(manager.getModel() !== modelBeforeInit).assertTrue()");
      expect(manager.getModel() !== modelBeforeInit).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0001',
        '#30 assert ' + "expect(manager.getModel() === service.getModel()).assertTrue()");
      expect(manager.getModel() === service.getModel()).assertTrue();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0001', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_0200
     * @tc.name: testA2dpProfile0002
     * @tc.desc: Verify that initialize returns false when already initialized.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0002', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0002', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#1 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      const modelAfterFirst = manager.getModel();
      const recordsAfterFirst = recordsOf(manager);

      const second = await manager.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#2 ' + "second" + ' = ' + JSON.stringify(second));
      expect(second).assertFalse();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#3 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#4 ' + "records[0].operationId" + ' = ' + JSON.stringify(records[0].operationId));
      expect(records[0].operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#5 ' + "records[0].operationName" + ' = ' + JSON.stringify(records[0].operationName));
      expect(records[0].operationName).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#6 ' + "records !== recordsAfterFirst" + ' = ' + JSON.stringify(records !== recordsAfterFirst));
      expect(records !== recordsAfterFirst).assertTrue();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#7 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#8 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#9 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#10 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#11 ' + "stats.lastOperationTime" + ' = ' + JSON.stringify(stats.lastOperationTime));
      expect(stats.lastOperationTime).assertEqual(recordsAfterFirst[0].endTime);

      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#12 assert ' + "expect(manager.getModel() === modelAfterFirst).assertTrue()");
      expect(manager.getModel() === modelAfterFirst).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#13 assert ' + "expect(service.getOperationHistory().length).assertEqual(1)");
      expect(service.getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#14 assert ' +
        "expect(service.getOperationHistory()[0].details).assertEqual('Service initialized successfully')");
      expect(service.getOperationHistory()[0].details).assertEqual('Service initialized successfully');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#15 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#16 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#17 assert ' + "expect(manager.getConfig().connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT)");
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0002',
        '#18 assert ' + "expect(manager.getProfileType()).assertEqual(BluetoothProfileType.A2DP)");
      expect(manager.getProfileType()).assertEqual(BluetoothProfileType.A2DP);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0002', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_0300
     * @tc.name: testA2dpProfile0003
     * @tc.desc: Verify that connect succeeds with a valid device ID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0003', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0003', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();

      const result = await manager.connect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#1 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#2 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#3 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);

      const ids = manager.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#4 ' + "ids.length" + ' = ' + JSON.stringify(ids.length));
      expect(ids.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#5 ' + "ids[0]" + ' = ' + JSON.stringify(ids[0]));
      expect(ids[0]).assertEqual(DEVICE_A);

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#6 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#7 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#8 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#9 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#10 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#11 ' + "stats.connectionSuccessRate" + ' = ' + JSON.stringify(stats.connectionSuccessRate));
      expect(stats.connectionSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#12 ' + "stats.lastConnectionEvent >= stats.uptimeMs" + ' = ' +
        JSON.stringify(stats.lastConnectionEvent >= stats.uptimeMs));
      expect(stats.lastConnectionEvent >= stats.uptimeMs).assertTrue();

      const record = lastRecord(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#13 assert ' + "expect(recordsOf(manager).length).assertEqual(2)");
      expect(recordsOf(manager).length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#14 ' + "record.operationId" + ' = ' + JSON.stringify(record.operationId));
      expect(record.operationId).assertEqual('mgr_op_2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#15 ' + "record.operationName" + ' = ' + JSON.stringify(record.operationName));
      expect(record.operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#16 ' + "record.success" + ' = ' + JSON.stringify(record.success));
      expect(record.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#17 ' + "record.errorMessage" + ' = ' + JSON.stringify(record.errorMessage));
      expect(record.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#18 ' + "record.details" + ' = ' + JSON.stringify(record.details));
      expect(record.details).assertEqual(`Connected to ${DEVICE_A}`);

      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#19 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#20 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#21 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#22 ' + "svcStats.connectionState" + ' = ' + JSON.stringify(svcStats.connectionState));
      expect(svcStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#23 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(2);
      const history = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#24 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#25 ' + "history[1].operation" + ' = ' + JSON.stringify(history[1].operation));
      expect(history[1].operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#26 ' + "history[1].success" + ' = ' + JSON.stringify(history[1].success));
      expect(history[1].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0003',
        '#27 ' + "history[1].details" + ' = ' + JSON.stringify(history[1].details));
      expect(history[1].details).assertEqual(`Connected to ${DEVICE_A}`);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0003', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_0400
     * @tc.name: testA2dpProfile0004
     * @tc.desc: Verify that connect fails with an empty device ID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpProfile0004', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0004', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();

      const result = await manager.connect('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#1 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#2 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#3 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#4 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#5 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#6 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#7 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#8 ' + "stats.connectionSuccessRate" + ' = ' + JSON.stringify(stats.connectionSuccessRate));
      expect(stats.connectionSuccessRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#9 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#10 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#11 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(50);

      const record = lastRecord(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#12 assert ' + "expect(recordsOf(manager).length).assertEqual(2)");
      expect(recordsOf(manager).length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#13 ' + "record.operationName" + ' = ' + JSON.stringify(record.operationName));
      expect(record.operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#14 ' + "record.success" + ' = ' + JSON.stringify(record.success));
      expect(record.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#15 ' + "record.errorMessage" + ' = ' + JSON.stringify(record.errorMessage));
      expect(record.errorMessage).assertEqual('Connection failed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#16 ' + "record.details" + ' = ' + JSON.stringify(record.details));
      expect(record.details).assertEqual('Failed to connect to ');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#17 ' + "record.operationId" + ' = ' + JSON.stringify(record.operationId));
      expect(record.operationId).assertEqual('mgr_op_2');

      const health = healthOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#18 ' + "health.lastError" + ' = ' + JSON.stringify(health.lastError));
      expect(health.lastError).assertEqual('Connection failed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#19 ' + "health.isHealthy" + ' = ' + JSON.stringify(health.isHealthy));
      expect(health.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#20 ' + "health.healthScore" + ' = ' + JSON.stringify(health.healthScore));
      expect(health.healthScore).assertEqual(10);

      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#21 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#22 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#23 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#24 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(2);
      const history = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#25 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#26 ' + "history[1].operation" + ' = ' + JSON.stringify(history[1].operation));
      expect(history[1].operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#27 ' + "history[1].success" + ' = ' + JSON.stringify(history[1].success));
      expect(history[1].success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0004',
        '#28 ' + "history[1].details" + ' = ' + JSON.stringify(history[1].details));
      expect(history[1].details).assertEqual('Invalid device ID');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0004', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_0500
     * @tc.name: testA2dpProfile0005
     * @tc.desc: Verify that reconnecting the same device returns true without duplicate counting.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0005', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0005', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();

      const result = await manager.connect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#2 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#3 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#4 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(1)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#5 assert ' + "expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A)");
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#6 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#7 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#8 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#9 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#10 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#11 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#12 ' + "stats.connectionSuccessRate" + ' = ' + JSON.stringify(stats.connectionSuccessRate));
      expect(stats.connectionSuccessRate).assertEqual(100);

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#13 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#14 ' + "records[1].operationName" + ' = ' + JSON.stringify(records[1].operationName));
      expect(records[1].operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#15 ' + "records[1].details" + ' = ' + JSON.stringify(records[1].details));
      expect(records[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#16 ' + "records[1].success" + ' = ' + JSON.stringify(records[1].success));
      expect(records[1].success).assertTrue();

      const service = manager.getService();
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#17 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#18 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(2);
      const svcHistory = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#19 ' + "svcHistory.length" + ' = ' + JSON.stringify(svcHistory.length));
      expect(svcHistory.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#20 ' + "svcHistory[1].operation" + ' = ' + JSON.stringify(svcHistory[1].operation));
      expect(svcHistory[1].operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#21 ' + "svcHistory[1].success" + ' = ' + JSON.stringify(svcHistory[1].success));
      expect(svcHistory[1].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#22 ' + "svcHistory[1].details" + ' = ' + JSON.stringify(svcHistory[1].details));
      expect(svcHistory[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#23 assert ' + "expect(countString(svcDetailsOf(manager), 'Already connected')).assertEqual(0)");
      expect(countString(svcDetailsOf(manager), 'Already connected')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0005',
        '#24 assert ' + "expect(service.getOperationHistory() === svcHistory).assertFalse()");
      expect(service.getOperationHistory() === svcHistory).assertFalse();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0005', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_0600
     * @tc.name: testA2dpProfile0006
     * @tc.desc: Verify that disconnect succeeds for a connected device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0006', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0006', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();

      const result = await manager.disconnect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#2 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#3 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#4 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#5 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#6 ' + "stats.disconnectionEvents" + ' = ' + JSON.stringify(stats.disconnectionEvents));
      expect(stats.disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#7 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#8 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#9 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#10 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#11 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#12 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(3);

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#13 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#14 ' + "records[2].operationId" + ' = ' + JSON.stringify(records[2].operationId));
      expect(records[2].operationId).assertEqual('mgr_op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#15 ' + "records[2].operationName" + ' = ' + JSON.stringify(records[2].operationName));
      expect(records[2].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#16 ' + "records[2].success" + ' = ' + JSON.stringify(records[2].success));
      expect(records[2].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#17 ' + "records[2].errorMessage" + ' = ' + JSON.stringify(records[2].errorMessage));
      expect(records[2].errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#18 ' + "records[2].details" + ' = ' + JSON.stringify(records[2].details));
      expect(records[2].details).assertEqual(`Disconnected from ${DEVICE_A}`);

      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#19 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#20 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#21 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#22 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(3);
      const svcHistory = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#23 ' + "svcHistory.length" + ' = ' + JSON.stringify(svcHistory.length));
      expect(svcHistory.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#24 ' + "svcHistory[2].operation" + ' = ' + JSON.stringify(svcHistory[2].operation));
      expect(svcHistory[2].operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#25 ' + "svcHistory[2].success" + ' = ' + JSON.stringify(svcHistory[2].success));
      expect(svcHistory[2].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#26 ' + "svcHistory[2].details" + ' = ' + JSON.stringify(svcHistory[2].details));
      expect(svcHistory[2].details).assertEqual(`Disconnected from ${DEVICE_A}`);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#27 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertFalse()");
      expect(await manager.disconnect(DEVICE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0006',
        '#28 assert ' + "expect(manager.getStatistics().disconnectionEvents).assertEqual(1)");
      expect(manager.getStatistics().disconnectionEvents).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0006', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_0700
     * @tc.name: testA2dpProfile0007
     * @tc.desc: Verify that disconnect fails for a device that is not connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpProfile0007', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0007', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();

      const result = await manager.disconnect(GHOST_DEVICE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#1 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#2 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#3 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#4 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#5 ' + "records[1].operationId" + ' = ' + JSON.stringify(records[1].operationId));
      expect(records[1].operationId).assertEqual('mgr_op_2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#6 ' + "records[1].operationName" + ' = ' + JSON.stringify(records[1].operationName));
      expect(records[1].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#7 ' + "records[1].success" + ' = ' + JSON.stringify(records[1].success));
      expect(records[1].success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#8 ' + "records[1].errorMessage" + ' = ' + JSON.stringify(records[1].errorMessage));
      expect(records[1].errorMessage).assertEqual('Not managed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#9 ' + "records[1].details" + ' = ' + JSON.stringify(records[1].details));
      expect(records[1].details).assertEqual(`Device ${GHOST_DEVICE} not managed`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#10 ' + "records[1].startTime" + ' = ' + JSON.stringify(records[1].startTime));
      expect(records[1].startTime).assertEqual(records[1].endTime);

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#11 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#12 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#13 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#14 ' + "stats.disconnectionEvents" + ' = ' + JSON.stringify(stats.disconnectionEvents));
      expect(stats.disconnectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#15 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#16 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(50);

      const health = healthOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#17 ' + "health.lastError" + ' = ' + JSON.stringify(health.lastError));
      expect(health.lastError).assertEqual('Not managed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#18 ' + "health.isHealthy" + ' = ' + JSON.stringify(health.isHealthy));
      expect(health.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#19 ' + "health.managedDeviceCount" + ' = ' + JSON.stringify(health.managedDeviceCount));
      expect(health.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#20 ' + "health.queuedOperationCount" + ' = ' + JSON.stringify(health.queuedOperationCount));
      expect(health.queuedOperationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#21 ' + "health.retryAttempts" + ' = ' + JSON.stringify(health.retryAttempts));
      expect(health.retryAttempts).assertEqual(0);

      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#22 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#23 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#24 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#25 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(1);
      const svcHistory = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#26 ' + "svcHistory.length" + ' = ' + JSON.stringify(svcHistory.length));
      expect(svcHistory.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#27 ' + "svcHistory[0].operation" + ' = ' + JSON.stringify(svcHistory[0].operation));
      expect(svcHistory[0].operation).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0007',
        '#28 ' + "svcHistory[0].details" + ' = ' + JSON.stringify(svcHistory[0].details));
      expect(svcHistory[0].details).assertEqual('Service initialized successfully');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0007', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_0800
     * @tc.name: testA2dpProfile0008
     * @tc.desc: Verify that getProfileType returns the expected profile type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0008', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0008', 'begin');
      const uninitialized: A2dpProfileManager = new A2dpProfileManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#1 assert ' + "expect(uninitialized.getProfileType()).assertEqual(BluetoothProfileType.A2DP)");
      expect(uninitialized.getProfileType()).assertEqual(BluetoothProfileType.A2DP);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#2 assert ' + "expect(uninitialized.getProfileType()).assertEqual(PROFILE_ID)");
      expect(uninitialized.getProfileType()).assertEqual(PROFILE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#3 assert ' + "expect(typeof uninitialized.getProfileType()).assertEqual('string')");
      expect(typeof uninitialized.getProfileType()).assertEqual('string');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#4 assert ' +
        "expect(uninitialized.getProfileType().toUpperCase()).assertEqual(uninitialized.getProfileType())");
      expect(uninitialized.getProfileType().toUpperCase()).assertEqual(uninitialized.getProfileType());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#5 assert ' + "expect(uninitialized.getProfileType().length > 0).assertTrue()");
      expect(uninitialized.getProfileType().length > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#6 assert ' + "expect(uninitialized.getProfileType().indexOf(' ')).assertEqual(-1)");
      expect(uninitialized.getProfileType().indexOf(' ')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#7 ' + "BluetoothProfileType.A2DP" + ' = ' + JSON.stringify(BluetoothProfileType.A2DP));
      expect(BluetoothProfileType.A2DP).assertEqual(PROFILE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#8 assert ' +
        "expect(uninitialized.getProfileType().charCodeAt(0) >= 65 && uninitialized.getProfileType().charCodeAt(0) <" +
        "= 90).assertTrue()");
      expect(uninitialized.getProfileType().charCodeAt(0) >= 65 &&
        uninitialized.getProfileType().charCodeAt(0) <= 90).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#9 ' + "typeof BluetoothProfileType.A2DP" + ' = ' + JSON.stringify(typeof BluetoothProfileType.A2DP));
      expect(typeof BluetoothProfileType.A2DP).assertEqual('string');

      const manager: A2dpProfileManager = new A2dpProfileManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#10 assert ' + "expect(manager.getProfileType() === uninitialized.getProfileType()).assertTrue()");
      expect(manager.getProfileType() === uninitialized.getProfileType()).assertTrue();
      const firstRead = manager.getProfileType();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#11 assert ' + "expect(manager.getProfileType()).assertEqual(firstRead)");
      expect(manager.getProfileType()).assertEqual(firstRead);

      await manager.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#12 assert ' + "expect(manager.getProfileType()).assertEqual(BluetoothProfileType.A2DP)");
      expect(manager.getProfileType()).assertEqual(BluetoothProfileType.A2DP);
      await manager.connect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#13 assert ' + "expect(manager.getProfileType()).assertEqual(PROFILE_ID)");
      expect(manager.getProfileType()).assertEqual(PROFILE_ID);
      await manager.disconnect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#14 assert ' + "expect(manager.getProfileType()).assertEqual(BluetoothProfileType.A2DP)");
      expect(manager.getProfileType()).assertEqual(BluetoothProfileType.A2DP);
      await manager.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#15 assert ' + "expect(manager.getProfileType()).assertEqual(PROFILE_ID)");
      expect(manager.getProfileType()).assertEqual(PROFILE_ID);
      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#16 assert ' + "expect(manager.getProfileType()).assertEqual(BluetoothProfileType.A2DP)");
      expect(manager.getProfileType()).assertEqual(BluetoothProfileType.A2DP);

      const other: A2dpProfileManager = new A2dpProfileManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#17 assert ' + "expect(other.getProfileType()).assertEqual(manager.getProfileType())");
      expect(other.getProfileType()).assertEqual(manager.getProfileType());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0008',
        '#18 assert ' + "expect(other.getProfileType()).assertEqual(BluetoothProfileType.A2DP)");
      expect(other.getProfileType()).assertEqual(BluetoothProfileType.A2DP);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0008', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_0900
     * @tc.name: testA2dpProfile0009
     * @tc.desc: Verify that getService returns a non-null service instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0009', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0009', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      const serviceBeforeInit = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#1 ' + "serviceBeforeInit !== undefined" + ' = ' + JSON.stringify(serviceBeforeInit !== undefined));
      expect(serviceBeforeInit !== undefined).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#2 assert ' + "expect(manager.getService() === serviceBeforeInit).assertTrue()");
      expect(manager.getService() === serviceBeforeInit).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#3 assert ' + "expect(serviceBeforeInit.isConnected()).assertFalse()");
      expect(serviceBeforeInit.isConnected()).assertFalse();

      await manager.initialize();
      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#4 ' + "service !== undefined" + ' = ' + JSON.stringify(service !== undefined));
      expect(service !== undefined).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#5 ' + "service === serviceBeforeInit" + ' = ' + JSON.stringify(service === serviceBeforeInit));
      expect(service === serviceBeforeInit).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#6 assert ' + "expect(service.getModel() === manager.getModel()).assertTrue()");
      expect(service.getModel() === manager.getModel()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#7 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#8 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#9 assert ' + "expect(manager.getService() === service).assertTrue()");
      expect(manager.getService() === service).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#10 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#11 assert ' + "expect(service.getOperationHistory().length).assertEqual(2)");
      expect(service.getOperationHistory().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#12 assert ' + "expect(service.getOperationHistory()[1].details).assertEqual(`Connected to ${DEVICE_A}`)");
      expect(service.getOperationHistory()[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#13 assert ' + "expect(service.getOperationHistory()[1].operation).assertEqual('connect')");
      expect(service.getOperationHistory()[1].operation).assertEqual('connect');

      const stats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#14 ' + "stats.serviceName" + ' = ' + JSON.stringify(stats.serviceName));
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#15 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#16 ' + "stats.connectionState" + ' = ' + JSON.stringify(stats.connectionState));
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#17 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(1);

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#18 assert ' + "expect(manager.getService() === service).assertTrue()");
      expect(manager.getService() === service).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#19 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#20 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#21 assert ' + "expect(service.getOperationHistory().length).assertEqual(1)");
      expect(service.getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#22 assert ' + "expect(service.getOperationHistory()[0].details).assertEqual('Service reset')");
      expect(service.getOperationHistory()[0].details).assertEqual('Service reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#23 assert ' + "expect(service.getOperationHistory()[0].operation).assertEqual('reset')");
      expect(service.getOperationHistory()[0].operation).assertEqual('reset');
      const statsAfterDestroy: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#24 ' + "statsAfterDestroy.isInitialized" + ' = ' + JSON.stringify(statsAfterDestroy.isInitialized));
      expect(statsAfterDestroy.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#25 ' + "statsAfterDestroy.connectedDeviceCount" + ' = ' +
        JSON.stringify(statsAfterDestroy.connectedDeviceCount));
      expect(statsAfterDestroy.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0009',
        '#26 ' + "statsAfterDestroy.serviceName" + ' = ' + JSON.stringify(statsAfterDestroy.serviceName));
      expect(statsAfterDestroy.serviceName).assertEqual(SERVICE_NAME);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0009', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_1000
     * @tc.name: testA2dpProfile0010
     * @tc.desc: Verify that getModel returns a non-null model instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0010', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0010', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      const modelBeforeInit = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#1 ' + "modelBeforeInit !== undefined" + ' = ' + JSON.stringify(modelBeforeInit !== undefined));
      expect(modelBeforeInit !== undefined).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#2 assert ' + "expect(manager.getModel() === modelBeforeInit).assertTrue()");
      expect(manager.getModel() === modelBeforeInit).assertTrue();

      await manager.initialize();
      const model = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#3 ' + "model !== undefined" + ' = ' + JSON.stringify(model !== undefined));
      expect(model !== undefined).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#4 ' + "model !== modelBeforeInit" + ' = ' + JSON.stringify(model !== modelBeforeInit));
      expect(model !== modelBeforeInit).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#5 assert ' + "expect(model === manager.getService().getModel()).assertTrue()");
      expect(model === manager.getService().getModel()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#6 assert ' + "expect(manager.getModel() === model).assertTrue()");
      expect(manager.getModel() === model).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#7 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#8 assert ' + "expect(manager.getModel() === model).assertTrue()");
      expect(manager.getModel() === model).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#9 assert ' + "expect(manager.getService().getModel() === model).assertTrue()");
      expect(manager.getService().getModel() === model).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#10 assert ' + "expect(typeof manager.getModel()).assertEqual('object')");
      expect(typeof manager.getModel()).assertEqual('object');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#11 assert ' + "expect(manager.getModel() !== null).assertTrue()");
      expect(manager.getModel() !== null).assertTrue();

      await manager.disconnect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#12 assert ' + "expect(manager.getModel() === model).assertTrue()");
      expect(manager.getModel() === model).assertTrue();

      await manager.reset();
      const modelAfterReset = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#13 ' + "modelAfterReset !== model" + ' = ' + JSON.stringify(modelAfterReset !== model));
      expect(modelAfterReset !== model).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#14 assert ' + "expect(modelAfterReset === manager.getService().getModel()).assertTrue()");
      expect(modelAfterReset === manager.getService().getModel()).assertTrue();

      await manager.destroy();
      const modelAfterDestroy = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#15 ' + "modelAfterDestroy !== modelAfterReset" + ' = ' +
        JSON.stringify(modelAfterDestroy !== modelAfterReset));
      expect(modelAfterDestroy !== modelAfterReset).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#16 assert ' + "expect(modelAfterDestroy === manager.getService().getModel()).assertTrue()");
      expect(modelAfterDestroy === manager.getService().getModel()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#17 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();

      await manager.initialize();
      const modelAfterReinit = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#18 ' + "modelAfterReinit !== modelAfterDestroy" + ' = ' +
        JSON.stringify(modelAfterReinit !== modelAfterDestroy));
      expect(modelAfterReinit !== modelAfterDestroy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#19 assert ' + "expect(modelAfterReinit === manager.getService().getModel()).assertTrue()");
      expect(modelAfterReinit === manager.getService().getModel()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0010',
        '#20 assert ' + "expect(manager.getModel() === modelAfterReinit).assertTrue()");
      expect(manager.getModel() === modelAfterReinit).assertTrue();
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0010', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_1100
     * @tc.name: testA2dpProfile0011
     * @tc.desc: Verify that getConnectedDeviceIds returns an empty array when no device is connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0011', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0011', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#1 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      await manager.initialize();

      const ids = manager.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#2 ' + "ids.length" + ' = ' + JSON.stringify(ids.length));
      expect(ids.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#3 assert ' + "expect(Array.isArray(ids)).assertTrue()");
      expect(Array.isArray(ids)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#4 assert ' + "expect(manager.getConnectedDeviceIds() !== ids).assertTrue()");
      expect(manager.getConnectedDeviceIds() !== ids).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#5 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      ids.push(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#6 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#7 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#8 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#9 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#10 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#11 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#12 assert ' + "expect(healthOf(manager).managedDeviceCount).assertEqual(0)");
      expect(healthOf(manager).managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#13 assert ' + "expect(manager.getService().getOperationHistory().length).assertEqual(1)");
      expect(manager.getService().getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#14 assert ' + "expect(manager.getService().isConnected()).assertFalse()");
      expect(manager.getService().isConnected()).assertFalse();

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#15 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0011',
        '#16 assert ' + "expect(manager.getConnectedDeviceIds()[0] === undefined).assertTrue()");
      expect(manager.getConnectedDeviceIds()[0] === undefined).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0011', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_1200
     * @tc.name: testA2dpProfile0012
     * @tc.desc: Verify that getConnectedDeviceIds contains the connected device ID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0012', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0012', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      const single = manager.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#2 ' + "single.length" + ' = ' + JSON.stringify(single.length));
      expect(single.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#3 ' + "single[0]" + ' = ' + JSON.stringify(single[0]));
      expect(single[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#4 assert ' + "expect(single.indexOf(DEVICE_B)).assertEqual(-1)");
      expect(single.indexOf(DEVICE_B)).assertEqual(-1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#5 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      const pair = manager.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#6 ' + "pair.length" + ' = ' + JSON.stringify(pair.length));
      expect(pair.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#7 ' + "pair[0]" + ' = ' + JSON.stringify(pair[0]));
      expect(pair[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#8 ' + "pair[1]" + ' = ' + JSON.stringify(pair[1]));
      expect(pair[1]).assertEqual(DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#9 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(2)");
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#10 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#11 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#12 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#13 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#14 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#15 assert ' + "expect(healthOf(manager).managedDeviceCount).assertEqual(2)");
      expect(healthOf(manager).managedDeviceCount).assertEqual(2);

      pair.push(DEVICE_C);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#16 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(2)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#17 assert ' + "expect(manager.getConnectedDeviceIds() !== pair).assertTrue()");
      expect(manager.getConnectedDeviceIds() !== pair).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#18 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(2)");
      expect(manager.getManagedDeviceCount()).assertEqual(2);

      const serviceStats: A2dpServiceStatistics = manager.getService().getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#19 ' + "serviceStats.connectedDeviceCount" + ' = ' + JSON.stringify(serviceStats.connectedDeviceCount));
      expect(serviceStats.connectedDeviceCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#20 ' + "serviceStats.connectionState" + ' = ' + JSON.stringify(serviceStats.connectionState));
      expect(serviceStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#21 ' + "serviceStats.operationHistoryCount" + ' = ' + JSON.stringify(serviceStats.operationHistoryCount));
      expect(serviceStats.operationHistoryCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#22 assert ' +
        "expect(manager.getService().getOperationHistory()[2].details).assertEqual(`Connected to ${DEVICE_B}`)");
      expect(manager.getService().getOperationHistory()[2].details).assertEqual(`Connected to ${DEVICE_B}`);

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0012',
        '#23 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0012', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_1300
     * @tc.name: testA2dpProfile0013
     * @tc.desc: Verify that getManagedDeviceCount increases after a device is connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0013', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0013', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#1 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      await manager.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#2 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#3 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#4 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#5 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(1)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#6 assert ' + "expect(manager.getStatistics().managedDeviceCount).assertEqual(1)");
      expect(manager.getStatistics().managedDeviceCount).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#7 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#8 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(2)");
      expect(manager.getManagedDeviceCount()).assertEqual(2);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#9 assert ' + "expect(await manager.connect(DEVICE_C)).assertTrue()");
      expect(await manager.connect(DEVICE_C)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#10 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(3)");
      expect(manager.getManagedDeviceCount()).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#11 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(3)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#12 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#13 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#14 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#15 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#16 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#17 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#18 assert ' + "expect(healthOf(manager).managedDeviceCount).assertEqual(3)");
      expect(healthOf(manager).managedDeviceCount).assertEqual(3);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#19 assert ' + "expect(await manager.disconnect(DEVICE_B)).assertTrue()");
      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#20 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(2)");
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#21 assert ' + "expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A)");
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#22 assert ' + "expect(manager.getConnectedDeviceIds()[1]).assertEqual(DEVICE_C)");
      expect(manager.getConnectedDeviceIds()[1]).assertEqual(DEVICE_C);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#23 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#24 assert ' + "expect(await manager.disconnect(DEVICE_C)).assertTrue()");
      expect(await manager.disconnect(DEVICE_C)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#25 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#26 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#27 assert ' + "expect(manager.getStatistics().connectedDeviceCount).assertEqual(0)");
      expect(manager.getStatistics().connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#28 assert ' + "expect(manager.getStatistics().disconnectionEvents).assertEqual(3)");
      expect(manager.getStatistics().disconnectionEvents).assertEqual(3);

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0013',
        '#29 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0013', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_1400
     * @tc.name: testA2dpProfile0014
     * @tc.desc: Verify that setConfig updates the connection timeout configuration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0014', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0014', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      const initial = manager.getConfig();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#1 ' + "initial.connectionTimeoutMs" + ' = ' + JSON.stringify(initial.connectionTimeoutMs));
      expect(initial.connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#2 ' + "initial.operationTimeoutMs" + ' = ' + JSON.stringify(initial.operationTimeoutMs));
      expect(initial.operationTimeoutMs).assertEqual(DEFAULT_OPERATION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#3 ' + "initial.maxRetryAttempts" + ' = ' + JSON.stringify(initial.maxRetryAttempts));
      expect(initial.maxRetryAttempts).assertEqual(DEFAULT_MAX_RETRY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#4 ' + "initial.retryDelayMs" + ' = ' + JSON.stringify(initial.retryDelayMs));
      expect(initial.retryDelayMs).assertEqual(DEFAULT_RETRY_DELAY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#5 ' + "initial.useExponentialBackoff" + ' = ' + JSON.stringify(initial.useExponentialBackoff));
      expect(initial.useExponentialBackoff).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#6 ' + "initial.maxBackoffDelayMs" + ' = ' + JSON.stringify(initial.maxBackoffDelayMs));
      expect(initial.maxBackoffDelayMs).assertEqual(DEFAULT_MAX_BACKOFF);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#7 ' + "initial.autoReconnect" + ' = ' + JSON.stringify(initial.autoReconnect));
      expect(initial.autoReconnect).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#8 ' + "initial.maxAutoReconnectAttempts" + ' = ' + JSON.stringify(initial.maxAutoReconnectAttempts));
      expect(initial.maxAutoReconnectAttempts).assertEqual(DEFAULT_AUTO_RECONNECT_ATTEMPTS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#9 ' + "initial.autoReconnectDelayMs" + ' = ' + JSON.stringify(initial.autoReconnectDelayMs));
      expect(initial.autoReconnectDelayMs).assertEqual(DEFAULT_AUTO_RECONNECT_DELAY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#10 ' + "initial.maxQueueSize" + ' = ' + JSON.stringify(initial.maxQueueSize));
      expect(initial.maxQueueSize).assertEqual(MAX_QUEUE_SIZE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#11 ' + "initial.maxManagedDevices" + ' = ' + JSON.stringify(initial.maxManagedDevices));
      expect(initial.maxManagedDevices).assertEqual(DEFAULT_MAX_MANAGED_DEVICES);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#12 ' + "initial.verboseLogging" + ' = ' + JSON.stringify(initial.verboseLogging));
      expect(initial.verboseLogging).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#13 ' + "initial.enablePerformanceTracing" + ' = ' + JSON.stringify(initial.enablePerformanceTracing));
      expect(initial.enablePerformanceTracing).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#14 ' + "initial.healthCheckIntervalMs" + ' = ' + JSON.stringify(initial.healthCheckIntervalMs));
      expect(initial.healthCheckIntervalMs).assertEqual(60000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#15 ' + "initial.minHealthScoreThreshold" + ' = ' + JSON.stringify(initial.minHealthScoreThreshold));
      expect(initial.minHealthScoreThreshold).assertEqual(DEFAULT_HEALTH_THRESHOLD);

      await manager.initialize();
      manager.setConfig({ connectionTimeoutMs: 5000 });
      const updated = manager.getConfig();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#16 ' + "updated.connectionTimeoutMs" + ' = ' + JSON.stringify(updated.connectionTimeoutMs));
      expect(updated.connectionTimeoutMs).assertEqual(5000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#17 ' + "updated.operationTimeoutMs" + ' = ' + JSON.stringify(updated.operationTimeoutMs));
      expect(updated.operationTimeoutMs).assertEqual(DEFAULT_OPERATION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#18 ' + "updated.maxRetryAttempts" + ' = ' + JSON.stringify(updated.maxRetryAttempts));
      expect(updated.maxRetryAttempts).assertEqual(DEFAULT_MAX_RETRY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#19 ' + "updated.maxManagedDevices" + ' = ' + JSON.stringify(updated.maxManagedDevices));
      expect(updated.maxManagedDevices).assertEqual(DEFAULT_MAX_MANAGED_DEVICES);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#20 ' + "updated.minHealthScoreThreshold" + ' = ' + JSON.stringify(updated.minHealthScoreThreshold));
      expect(updated.minHealthScoreThreshold).assertEqual(DEFAULT_HEALTH_THRESHOLD);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#21 assert ' + "expect(manager.getConfig() !== updated).assertTrue()");
      expect(manager.getConfig() !== updated).assertTrue();

      updated.connectionTimeoutMs = 1;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#22 assert ' + "expect(manager.getConfig().connectionTimeoutMs).assertEqual(5000)");
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(5000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#23 assert ' + "expect(recordsOf(manager).length).assertEqual(1)");
      expect(recordsOf(manager).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#24 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#25 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(0)");
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      const svc = manager.getService();
      const svcHistoryBefore = svc.getOperationHistory().length;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#26 ' + "svcHistoryBefore" + ' = ' + JSON.stringify(svcHistoryBefore));
      expect(svcHistoryBefore).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#27 assert ' + "expect(svc.isConnected()).assertFalse()");
      expect(svc.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#28 assert ' + "expect(svc.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(svc.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats0: A2dpServiceStatistics = svc.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#29 ' + "svcStats0.operationHistoryCount" + ' = ' + JSON.stringify(svcStats0.operationHistoryCount));
      expect(svcStats0.operationHistoryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#30 ' + "svcStats0.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats0.connectedDeviceCount));
      expect(svcStats0.connectedDeviceCount).assertEqual(0);

      manager.setConfig({});
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#31 assert ' + "expect(manager.getConfig().connectionTimeoutMs).assertEqual(5000)");
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(5000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#32 assert ' + "expect(manager.getConfig().maxQueueSize).assertEqual(MAX_QUEUE_SIZE)");
      expect(manager.getConfig().maxQueueSize).assertEqual(MAX_QUEUE_SIZE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#33 assert ' + "expect(svc.getOperationHistory().length).assertEqual(svcHistoryBefore)");
      expect(svc.getOperationHistory().length).assertEqual(svcHistoryBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#34 assert ' + "expect(svc.getOperationHistory()[0].operation).assertEqual('initialize')");
      expect(svc.getOperationHistory()[0].operation).assertEqual('initialize');

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#35 assert ' + "expect(manager.getConfig().connectionTimeoutMs).assertEqual(5000)");
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(5000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0014',
        '#36 assert ' + "expect(manager.getConfig().enablePerformanceTracing).assertTrue()");
      expect(manager.getConfig().enablePerformanceTracing).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0014', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_1500
     * @tc.name: testA2dpProfile0015
     * @tc.desc: Verify that getStatistics returns a non-null statistics object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0015', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0015', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#1 ' + "stats !== undefined" + ' = ' + JSON.stringify(stats !== undefined));
      expect(stats !== undefined).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#2 assert ' + "expect(manager.getStatistics() !== stats).assertTrue()");
      expect(manager.getStatistics() !== stats).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#3 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#4 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#5 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#6 ' + "stats.disconnectionEvents" + ' = ' + JSON.stringify(stats.disconnectionEvents));
      expect(stats.disconnectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#7 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#8 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#9 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#10 ' + "stats.averageOperationDurationMs" + ' = ' + JSON.stringify(stats.averageOperationDurationMs));
      expect(stats.averageOperationDurationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#11 ' + "stats.maxOperationDurationMs" + ' = ' + JSON.stringify(stats.maxOperationDurationMs));
      expect(stats.maxOperationDurationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#12 ' + "stats.minOperationDurationMs" + ' = ' + JSON.stringify(stats.minOperationDurationMs));
      expect(stats.minOperationDurationMs).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#13 ' + "stats.connectionSuccessRate" + ' = ' + JSON.stringify(stats.connectionSuccessRate));
      expect(stats.connectionSuccessRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#14 ' + "stats.operationSuccessRate" + ' = ' + JSON.stringify(stats.operationSuccessRate));
      expect(stats.operationSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#15 ' + "stats.uptimeMs < 60000" + ' = ' + JSON.stringify(stats.uptimeMs < 60000));
      expect(stats.uptimeMs < 60000).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#16 ' + "stats.lastConnectionEvent" + ' = ' + JSON.stringify(stats.lastConnectionEvent));
      expect(stats.lastConnectionEvent).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#17 ' + "stats.lastOperationTime" + ' = ' + JSON.stringify(stats.lastOperationTime));
      expect(stats.lastOperationTime).assertEqual(recordsOf(manager)[0].endTime);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#18 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#19 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#20 ' + "stats.queuedOperationCount" + ' = ' + JSON.stringify(stats.queuedOperationCount));
      expect(stats.queuedOperationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#21 ' + "stats.retryAttempts" + ' = ' + JSON.stringify(stats.retryAttempts));
      expect(stats.retryAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#22 ' + "stats.autoReconnectEvents" + ' = ' + JSON.stringify(stats.autoReconnectEvents));
      expect(stats.autoReconnectEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#23 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#24 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#25 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(60);

      stats.totalOperations = 99;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#26 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0015',
        '#27 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0015', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_1600
     * @tc.name: testA2dpProfile0016
     * @tc.desc: Verify that getOperationRecords returns an array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0016', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0016', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();

      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#1 assert ' + "expect(Array.isArray(records)).assertTrue()");
      expect(Array.isArray(records)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#2 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#3 assert ' + "expect(manager.getOperationRecords() !== records).assertTrue()");
      expect(manager.getOperationRecords() !== records).assertTrue();
      records.push(records[0]);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#4 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);

      let accepted: number = 0;
      for (let i = 0; i < 600; i++) {
        if (await manager.disconnect(`${GHOST_PREFIX}${i}`)) {
          accepted++;
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#5 ' + "accepted" + ' = ' + JSON.stringify(accepted));
      expect(accepted).assertEqual(0);

      const capped = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#6 ' + "capped.length" + ' = ' + JSON.stringify(capped.length));
      expect(capped.length).assertEqual(MAX_RECORD_SIZE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#7 ' + "capped[0].operationId" + ' = ' + JSON.stringify(capped[0].operationId));
      expect(capped[0].operationId).assertEqual('mgr_op_102');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#8 ' + "capped[499].operationId" + ' = ' + JSON.stringify(capped[499].operationId));
      expect(capped[499].operationId).assertEqual('mgr_op_601');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#9 ' + "capped[0].operationName" + ' = ' + JSON.stringify(capped[0].operationName));
      expect(capped[0].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#10 ' + "capped[0].success" + ' = ' + JSON.stringify(capped[0].success));
      expect(capped[0].success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#11 ' + "capped[0].errorMessage" + ' = ' + JSON.stringify(capped[0].errorMessage));
      expect(capped[0].errorMessage).assertEqual('Not managed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#12 ' + "capped[0].details" + ' = ' + JSON.stringify(capped[0].details));
      expect(capped[0].details).assertEqual(`Device ${GHOST_PREFIX}100 not managed`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#13 ' + "capped[499].details" + ' = ' + JSON.stringify(capped[499].details));
      expect(capped[499].details).assertEqual(`Device ${GHOST_PREFIX}599 not managed`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#14 ' + "capped[0].startTime" + ' = ' + JSON.stringify(capped[0].startTime));
      expect(capped[0].startTime).assertEqual(capped[0].endTime);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#15 ' + "capped[0].durationMs" + ' = ' + JSON.stringify(capped[0].durationMs));
      expect(capped[0].durationMs).assertEqual(0);

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#16 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(601);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#17 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#18 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(600);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#19 ' + "stats.errorRate > 99" + ' = ' + JSON.stringify(stats.errorRate > 99));
      expect(stats.errorRate > 99).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#20 ' + "stats.queuedOperationCount" + ' = ' + JSON.stringify(stats.queuedOperationCount));
      expect(stats.queuedOperationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#21 ' + "stats.lastOperationTime" + ' = ' + JSON.stringify(stats.lastOperationTime));
      expect(stats.lastOperationTime).assertEqual(capped[499].endTime);

      const health = healthOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#22 ' + "health.lastError" + ' = ' + JSON.stringify(health.lastError));
      expect(health.lastError).assertEqual('Not managed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#23 ' + "health.isHealthy" + ' = ' + JSON.stringify(health.isHealthy));
      expect(health.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#24 ' + "health.queuedOperationCount" + ' = ' + JSON.stringify(health.queuedOperationCount));
      expect(health.queuedOperationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#25 ' + "health.retryAttempts" + ' = ' + JSON.stringify(health.retryAttempts));
      expect(health.retryAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0016',
        '#26 ' + "health.healthScore" + ' = ' + JSON.stringify(health.healthScore));
      expect(health.healthScore).assertEqual(10);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0016', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_1700
     * @tc.name: testA2dpProfile0017
     * @tc.desc: Verify that the statistics health score is greater than zero.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0017', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0017', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      const rawFirst: ManagerHealthStatus = manager.getHealthStatus();
      const rawSecond: ManagerHealthStatus = manager.getHealthStatus();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#1 ' + "rawFirst !== undefined" + ' = ' + JSON.stringify(rawFirst !== undefined));
      expect(rawFirst !== undefined).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#2 ' + "rawFirst !== rawSecond" + ' = ' + JSON.stringify(rawFirst !== rawSecond));
      expect(rawFirst !== rawSecond).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#3 ' + "rawFirst.healthScore" + ' = ' + JSON.stringify(rawFirst.healthScore));
      expect(rawFirst.healthScore).assertEqual(60);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#4 ' + "rawFirst.healthScore !== DEFAULT_HEALTH_SCORE_INIT" + ' = ' +
        JSON.stringify(rawFirst.healthScore !== DEFAULT_HEALTH_SCORE_INIT));
      expect(rawFirst.healthScore !== DEFAULT_HEALTH_SCORE_INIT).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#5 ' + "rawFirst.isHealthy" + ' = ' + JSON.stringify(rawFirst.isHealthy));
      expect(rawFirst.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#6 ' + "rawFirst.uptimeMs" + ' = ' + JSON.stringify(rawFirst.uptimeMs));
      expect(rawFirst.uptimeMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#7 ' + "rawFirst.connectionSuccessRate" + ' = ' + JSON.stringify(rawFirst.connectionSuccessRate));
      expect(rawFirst.connectionSuccessRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#8 ' + "rawFirst.errorRate" + ' = ' + JSON.stringify(rawFirst.errorRate));
      expect(rawFirst.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#9 ' + "rawFirst.lastError" + ' = ' + JSON.stringify(rawFirst.lastError));
      expect(rawFirst.lastError).assertEqual('');

      await manager.initialize();
      const health = healthOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#10 ' + "health.healthScore" + ' = ' + JSON.stringify(health.healthScore));
      expect(health.healthScore).assertEqual(60);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#11 ' + "health.healthScore > 0" + ' = ' + JSON.stringify(health.healthScore > 0));
      expect(health.healthScore > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#12 ' + "health.healthScore < DEFAULT_HEALTH_SCORE_INIT" + ' = ' +
        JSON.stringify(health.healthScore < DEFAULT_HEALTH_SCORE_INIT));
      expect(health.healthScore < DEFAULT_HEALTH_SCORE_INIT).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#13 ' + "health.isHealthy" + ' = ' + JSON.stringify(health.isHealthy));
      expect(health.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#14 ' + "health.uptimeMs < 60000" + ' = ' + JSON.stringify(health.uptimeMs < 60000));
      expect(health.uptimeMs < 60000).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#15 ' + "health.connectionSuccessRate" + ' = ' + JSON.stringify(health.connectionSuccessRate));
      expect(health.connectionSuccessRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#16 ' + "health.operationSuccessRate" + ' = ' + JSON.stringify(health.operationSuccessRate));
      expect(health.operationSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#17 ' + "health.errorRate" + ' = ' + JSON.stringify(health.errorRate));
      expect(health.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#18 ' + "health.managedDeviceCount" + ' = ' + JSON.stringify(health.managedDeviceCount));
      expect(health.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#19 ' + "health.queuedOperationCount" + ' = ' + JSON.stringify(health.queuedOperationCount));
      expect(health.queuedOperationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#20 ' + "health.retryAttempts" + ' = ' + JSON.stringify(health.retryAttempts));
      expect(health.retryAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#21 ' + "health.lastError" + ' = ' + JSON.stringify(health.lastError));
      expect(health.lastError).assertEqual('');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#22 assert ' + "expect(manager.getHealthStatus() !== undefined).assertTrue()");
      expect(manager.getHealthStatus() !== undefined).assertTrue();
      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#23 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(health.healthScore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0017',
        '#24 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertEqual(health.isHealthy);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0017', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_1800
     * @tc.name: testA2dpProfile0018
     * @tc.desc: Verify that a removed state callback is not invoked.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0018', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0018', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      const states: string[] = [];
      const onState = (state: BluetoothConnectionState) => {
        states.push(state);
      };

      manager.addStateCallback(onState);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#2 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#3 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#4 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(0);

      const svcHistory = manager.getService().getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#5 ' + "svcHistory.length" + ' = ' + JSON.stringify(svcHistory.length));
      expect(svcHistory.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#6 ' + "svcHistory[1].operation" + ' = ' + JSON.stringify(svcHistory[1].operation));
      expect(svcHistory[1].operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#7 ' + "svcHistory[1].details" + ' = ' + JSON.stringify(svcHistory[1].details));
      expect(svcHistory[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#8 ' + "svcHistory[2].operation" + ' = ' + JSON.stringify(svcHistory[2].operation));
      expect(svcHistory[2].operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#9 ' + "svcHistory[2].details" + ' = ' + JSON.stringify(svcHistory[2].details));
      expect(svcHistory[2].details).assertEqual(`Disconnected from ${DEVICE_A}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#10 assert ' +
        "expect(manager.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(manager.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      manager.removeStateCallback(onState);
      manager.removeStateCallback(onState);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#11 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#12 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#13 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(1)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(1);

      const serviceStates: string[] = [];
      const onServiceState = (state: BluetoothConnectionState) => {
        serviceStates.push(state);
      };
      manager.getService().addConnectionCallback(onServiceState);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#14 assert ' + "expect(await manager.connect(DEVICE_C)).assertTrue()");
      expect(await manager.connect(DEVICE_C)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#15 assert ' + "expect(countString(serviceStates, BluetoothConnectionState.CONNECTED)).assertEqual(1)");
      expect(countString(serviceStates, BluetoothConnectionState.CONNECTED)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#16 ' + "serviceStates[serviceStates.length - 1]" + ' = ' +
        JSON.stringify(serviceStates[serviceStates.length - 1]));
      expect(serviceStates[serviceStates.length - 1]).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#17 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(0);
      manager.getService().removeConnectionCallback(onServiceState);

      await manager.destroy();
      manager.addStateCallback(onState);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#18 assert ' + "expect(await manager.connect(DEVICE_C)).assertFalse()");
      expect(await manager.connect(DEVICE_C)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#19 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0018',
        '#20 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0018', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_1900
     * @tc.name: testA2dpProfile0019
     * @tc.desc: Verify that data callback registration and removal work correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0019', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0019', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      const service = manager.getService();

      const managerModels: A2dpModel[] = [];
      const onManagerData = (model: A2dpModel) => {
        managerModels.push(model);
      };
      const serviceModels: A2dpModel[] = [];
      const onServiceData = (model: A2dpModel) => {
        serviceModels.push(model);
      };

      manager.addDataCallback(onManagerData);
      manager.addDataCallback(onManagerData);
      service.addDataCallback(onServiceData);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#2 ' + "managerModels.length" + ' = ' + JSON.stringify(managerModels.length));
      expect(managerModels.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#3 ' + "serviceModels.length" + ' = ' + JSON.stringify(serviceModels.length));
      expect(serviceModels.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#4 assert ' + "expect(serviceModels[0] === service.getModel()).assertTrue()");
      expect(serviceModels[0] === service.getModel()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#5 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#6 ' + "managerModels.length" + ' = ' + JSON.stringify(managerModels.length));
      expect(managerModels.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#7 ' + "serviceModels.length" + ' = ' + JSON.stringify(serviceModels.length));
      expect(serviceModels.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#8 ' + "serviceModels[1] === serviceModels[0]" + ' = ' +
        JSON.stringify(serviceModels[1] === serviceModels[0]));
      expect(serviceModels[1] === serviceModels[0]).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#9 assert ' + "expect(await manager.disconnect(DEVICE_B)).assertTrue()");
      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#10 ' + "managerModels.length" + ' = ' + JSON.stringify(managerModels.length));
      expect(managerModels.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#11 ' + "serviceModels.length" + ' = ' + JSON.stringify(serviceModels.length));
      expect(serviceModels.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#12 assert ' + "expect(service.getOperationHistory().length).assertEqual(4)");
      expect(service.getOperationHistory().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#13 assert ' + "expect(service.getOperationHistory()[1].details).assertEqual(`Connected to ${DEVICE_A}`)");
      expect(service.getOperationHistory()[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#14 assert ' + "expect(service.getOperationHistory()[3].operation).assertEqual('disconnect')");
      expect(service.getOperationHistory()[3].operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#15 assert ' +
        "expect(service.getOperationHistory()[3].details).assertEqual(`Disconnected from ${DEVICE_B}`)");
      expect(service.getOperationHistory()[3].details).assertEqual(`Disconnected from ${DEVICE_B}`);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#16 assert ' + "expect(manager.getOperationRecords().length).assertEqual(4)");
      expect(manager.getOperationRecords().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#17 assert ' + "expect(recordAt(manager, 1).details).assertEqual(`Connected to ${DEVICE_A}`)");
      expect(recordAt(manager, 1).details).assertEqual(`Connected to ${DEVICE_A}`);

      manager.removeDataCallback(onManagerData);
      service.removeDataCallback(onServiceData);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#18 assert ' + "expect(await manager.connect(DEVICE_C)).assertTrue()");
      expect(await manager.connect(DEVICE_C)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#19 ' + "managerModels.length" + ' = ' + JSON.stringify(managerModels.length));
      expect(managerModels.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#20 ' + "serviceModels.length" + ' = ' + JSON.stringify(serviceModels.length));
      expect(serviceModels.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#21 assert ' + "expect(service.getOperationHistory().length).assertEqual(5)");
      expect(service.getOperationHistory().length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#22 assert ' + "expect(service.getOperationHistory()[4].success).assertTrue()");
      expect(service.getOperationHistory()[4].success).assertTrue();
      const svcStatsNow: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#23 ' + "svcStatsNow.connectedDeviceCount" + ' = ' + JSON.stringify(svcStatsNow.connectedDeviceCount));
      expect(svcStatsNow.connectedDeviceCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#24 ' + "svcStatsNow.operationHistoryCount" + ' = ' + JSON.stringify(svcStatsNow.operationHistoryCount));
      expect(svcStatsNow.operationHistoryCount).assertEqual(5);

      await manager.destroy();
      manager.addDataCallback(onManagerData);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#25 ' + "managerModels.length" + ' = ' + JSON.stringify(managerModels.length));
      expect(managerModels.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#26 ' + "serviceModels.length" + ' = ' + JSON.stringify(serviceModels.length));
      expect(serviceModels.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0019',
        '#27 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0019', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_2000
     * @tc.name: testA2dpProfile0020
     * @tc.desc: Verify that reset clears connections and resets state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0020', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0020', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      const configBefore = manager.getConfig();
      await manager.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#2 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#3 assert ' + "expect(manager.getOperationRecords().length).assertEqual(3)");
      expect(manager.getOperationRecords().length).assertEqual(3);

      await manager.reset();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#4 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#5 ' + "records[0].operationId" + ' = ' + JSON.stringify(records[0].operationId));
      expect(records[0].operationId).assertEqual('mgr_op_6');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#6 ' + "records[0].operationName" + ' = ' + JSON.stringify(records[0].operationName));
      expect(records[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#7 ' + "records[0].success" + ' = ' + JSON.stringify(records[0].success));
      expect(records[0].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#8 ' + "records[0].errorMessage" + ' = ' + JSON.stringify(records[0].errorMessage));
      expect(records[0].errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#9 ' + "records[0].details" + ' = ' + JSON.stringify(records[0].details));
      expect(records[0].details).assertEqual('Manager reset');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#10 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#11 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#12 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#13 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#14 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#15 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#16 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#17 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#18 ' + "stats.disconnectionEvents" + ' = ' + JSON.stringify(stats.disconnectionEvents));
      expect(stats.disconnectionEvents).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#19 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#20 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#21 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#22 assert ' + "expect(healthOf(manager).lastError).assertEqual('')");
      expect(healthOf(manager).lastError).assertEqual('');

      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#23 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#24 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#25 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#26 ' + "svcStats.connectionState" + ' = ' + JSON.stringify(svcStats.connectionState));
      expect(svcStats.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#27 assert ' + "expect(service.getOperationHistory().length).assertEqual(1)");
      expect(service.getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#28 assert ' + "expect(service.getOperationHistory()[0].details).assertEqual('Service reset')");
      expect(service.getOperationHistory()[0].details).assertEqual('Service reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#29 assert ' + "expect(service.getModel() === manager.getModel()).assertTrue()");
      expect(service.getModel() === manager.getModel()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#30 assert ' + "expect(manager.getConfig() !== configBefore).assertTrue()");
      expect(manager.getConfig() !== configBefore).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#31 assert ' +
        "expect(manager.getConfig().connectionTimeoutMs).assertEqual(configBefore.connectionTimeoutMs)");
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(configBefore.connectionTimeoutMs);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#32 assert ' + "expect(await manager.connect(DEVICE_C)).assertTrue()");
      expect(await manager.connect(DEVICE_C)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#33 assert ' + "expect(recordAt(manager, 1).operationId).assertEqual('mgr_op_7')");
      expect(recordAt(manager, 1).operationId).assertEqual('mgr_op_7');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0020',
        '#34 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0020', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_2100
     * @tc.name: testA2dpProfile0021
     * @tc.desc: Verify that destroy releases resources and disconnects devices.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0021', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0021', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();

      await manager.destroy();

      const afterDestroy = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#2 ' + "afterDestroy.length" + ' = ' + JSON.stringify(afterDestroy.length));
      expect(afterDestroy.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#3 ' + "afterDestroy[0].operationId" + ' = ' + JSON.stringify(afterDestroy[0].operationId));
      expect(afterDestroy[0].operationId).assertEqual('mgr_op_4');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#4 ' + "afterDestroy[0].operationName" + ' = ' + JSON.stringify(afterDestroy[0].operationName));
      expect(afterDestroy[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#5 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#6 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#7 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#8 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#9 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#10 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#11 ' + "svcStats.isInitialized" + ' = ' + JSON.stringify(svcStats.isInitialized));
      expect(svcStats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#12 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#13 ' + "svcStats.serviceName" + ' = ' + JSON.stringify(svcStats.serviceName));
      expect(svcStats.serviceName).assertEqual(SERVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#14 assert ' + "expect(service.getOperationHistory().length).assertEqual(1)");
      expect(service.getOperationHistory().length).assertEqual(1);

      const statsAfterDestroy = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#15 ' + "statsAfterDestroy.totalOperations" + ' = ' + JSON.stringify(statsAfterDestroy.totalOperations));
      expect(statsAfterDestroy.totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#16 ' + "statsAfterDestroy.totalConnectionAttempts" + ' = ' +
        JSON.stringify(statsAfterDestroy.totalConnectionAttempts));
      expect(statsAfterDestroy.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#17 ' + "statsAfterDestroy.successfulConnections" + ' = ' +
        JSON.stringify(statsAfterDestroy.successfulConnections));
      expect(statsAfterDestroy.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#18 ' + "statsAfterDestroy.disconnectionEvents" + ' = ' +
        JSON.stringify(statsAfterDestroy.disconnectionEvents));
      expect(statsAfterDestroy.disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#19 ' + "statsAfterDestroy.failedOperations" + ' = ' + JSON.stringify(statsAfterDestroy.failedOperations));
      expect(statsAfterDestroy.failedOperations).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#20 assert ' + "expect(await manager.connect(DEVICE_B)).assertFalse()");
      expect(await manager.connect(DEVICE_B)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#21 assert ' + "expect(await manager.disconnect(DEVICE_B)).assertFalse()");
      expect(await manager.disconnect(DEVICE_B)).assertFalse();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#22 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#23 ' + "records[1].operationName" + ' = ' + JSON.stringify(records[1].operationName));
      expect(records[1].operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#24 ' + "records[1].errorMessage" + ' = ' + JSON.stringify(records[1].errorMessage));
      expect(records[1].errorMessage).assertEqual('Not ready');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#25 ' + "records[1].details" + ' = ' + JSON.stringify(records[1].details));
      expect(records[1].details).assertEqual('Manager not initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#26 ' + "records[1].success" + ' = ' + JSON.stringify(records[1].success));
      expect(records[1].success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#27 ' + "records[2].operationName" + ' = ' + JSON.stringify(records[2].operationName));
      expect(records[2].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#28 ' + "records[2].operationId" + ' = ' + JSON.stringify(records[2].operationId));
      expect(records[2].operationId).assertEqual('mgr_op_6');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#29 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#30 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#31 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#32 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#33 assert ' + "expect(Math.floor(stats.errorRate)).assertEqual(33)");
      expect(Math.floor(stats.errorRate)).assertEqual(33);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#34 assert ' + "expect(healthOf(manager).lastError).assertEqual('Not ready')");
      expect(healthOf(manager).lastError).assertEqual('Not ready');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#35 assert ' + "expect(healthOf(manager).healthScore).assertEqual(50)");
      expect(healthOf(manager).healthScore).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#36 assert ' + "expect(healthOf(manager).isHealthy).assertTrue()");
      expect(healthOf(manager).isHealthy).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#37 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      const recovered = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#38 ' + "recovered.totalOperations" + ' = ' + JSON.stringify(recovered.totalOperations));
      expect(recovered.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#39 ' + "recovered.totalConnectionAttempts" + ' = ' + JSON.stringify(recovered.totalConnectionAttempts));
      expect(recovered.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#40 ' + "recovered.disconnectionEvents" + ' = ' + JSON.stringify(recovered.disconnectionEvents));
      expect(recovered.disconnectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#41 assert ' + "expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_1')");
      expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#42 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#43 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0021',
        '#44 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0021', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_2200
     * @tc.name: testA2dpProfile0022
     * @tc.desc: Verify that multiple devices can be connected simultaneously.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0022', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0022', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      manager.setConfig({ maxManagedDevices: 3 });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#1 assert ' + "expect(manager.getConfig().maxManagedDevices).assertEqual(3)");
      expect(manager.getConfig().maxManagedDevices).assertEqual(3);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#2 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#3 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#4 assert ' + "expect(await manager.connect(DEVICE_C)).assertTrue()");
      expect(await manager.connect(DEVICE_C)).assertTrue();

      const ids = manager.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#5 ' + "ids.length" + ' = ' + JSON.stringify(ids.length));
      expect(ids.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#6 ' + "ids[0]" + ' = ' + JSON.stringify(ids[0]));
      expect(ids[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#7 ' + "ids[1]" + ' = ' + JSON.stringify(ids[1]));
      expect(ids[1]).assertEqual(DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#8 ' + "ids[2]" + ' = ' + JSON.stringify(ids[2]));
      expect(ids[2]).assertEqual(DEVICE_C);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#9 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(3)");
      expect(manager.getManagedDeviceCount()).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#10 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#11 assert ' + "expect(await manager.connect(GHOST_DEVICE)).assertFalse()");
      expect(await manager.connect(GHOST_DEVICE)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#12 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(3)");
      expect(manager.getManagedDeviceCount()).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#13 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(3)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(3);

      const record = lastRecord(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#14 ' + "record.operationName" + ' = ' + JSON.stringify(record.operationName));
      expect(record.operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#15 ' + "record.success" + ' = ' + JSON.stringify(record.success));
      expect(record.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#16 ' + "record.errorMessage" + ' = ' + JSON.stringify(record.errorMessage));
      expect(record.errorMessage).assertEqual('Max devices');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#17 ' + "record.details" + ' = ' + JSON.stringify(record.details));
      expect(record.details).assertEqual('Maximum managed devices reached');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#18 ' + "record.operationId" + ' = ' + JSON.stringify(record.operationId));
      expect(record.operationId).assertEqual('mgr_op_5');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#19 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#20 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#21 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#22 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#23 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#24 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#25 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#26 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#27 ' + "stats.connectionSuccessRate" + ' = ' + JSON.stringify(stats.connectionSuccessRate));
      expect(stats.connectionSuccessRate).assertEqual(100);

      const service = manager.getService();
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#28 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#29 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#30 ' + "svcStats.connectionState" + ' = ' + JSON.stringify(svcStats.connectionState));
      expect(svcStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      const svcHistory = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#31 ' + "svcHistory.length" + ' = ' + JSON.stringify(svcHistory.length));
      expect(svcHistory.length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#32 ' + "svcHistory[3].details" + ' = ' + JSON.stringify(svcHistory[3].details));
      expect(svcHistory[3].details).assertEqual(`Connected to ${DEVICE_C}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#33 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#34 assert ' + "expect(healthOf(manager).managedDeviceCount).assertEqual(3)");
      expect(healthOf(manager).managedDeviceCount).assertEqual(3);

      manager.setConfig({ maxManagedDevices: DEFAULT_MAX_MANAGED_DEVICES });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#35 assert ' + "expect(manager.getConfig().maxManagedDevices).assertEqual(DEFAULT_MAX_MANAGED_DEVICES)");
      expect(manager.getConfig().maxManagedDevices).assertEqual(DEFAULT_MAX_MANAGED_DEVICES);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#36 assert ' + "expect(await manager.connect(GHOST_DEVICE)).assertTrue()");
      expect(await manager.connect(GHOST_DEVICE)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#37 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(4)");
      expect(manager.getManagedDeviceCount()).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#38 assert ' + "expect(manager.getService().getOperationHistory().length).assertEqual(5)");
      expect(manager.getService().getOperationHistory().length).assertEqual(5);

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0022',
        '#39 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0022', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_2300
     * @tc.name: testA2dpProfile0023
     * @tc.desc: Verify that the service connection state is CONNECTED after connecting.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0023', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0023', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#1 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#2 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#3 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      const initStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#4 ' + "initStats.connectionState" + ' = ' + JSON.stringify(initStats.connectionState));
      expect(initStats.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#5 ' + "initStats.connectedDeviceCount" + ' = ' + JSON.stringify(initStats.connectedDeviceCount));
      expect(initStats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#6 ' + "initStats.operationHistoryCount" + ' = ' + JSON.stringify(initStats.operationHistoryCount));
      expect(initStats.operationHistoryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#7 ' + "initStats.serviceName" + ' = ' + JSON.stringify(initStats.serviceName));
      expect(initStats.serviceName).assertEqual(SERVICE_NAME);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#8 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#9 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#10 assert ' + "expect(service.isConnected()).assertTrue()");
      expect(service.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#11 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      const history = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#12 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#13 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#14 ' + "history[0].success" + ' = ' + JSON.stringify(history[0].success));
      expect(history[0].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#15 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service initialized successfully');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#16 ' + "history[1].operation" + ' = ' + JSON.stringify(history[1].operation));
      expect(history[1].operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#17 ' + "history[1].success" + ' = ' + JSON.stringify(history[1].success));
      expect(history[1].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#18 ' + "history[1].details" + ' = ' + JSON.stringify(history[1].details));
      expect(history[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#19 ' + "history[0].timestamp <= history[1].timestamp" + ' = ' +
        JSON.stringify(history[0].timestamp <= history[1].timestamp));
      expect(history[0].timestamp <= history[1].timestamp).assertTrue();

      const connectedStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#20 ' + "connectedStats.connectionState" + ' = ' + JSON.stringify(connectedStats.connectionState));
      expect(connectedStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#21 ' + "connectedStats.connectedDeviceCount" + ' = ' + JSON.stringify(connectedStats.connectedDeviceCount));
      expect(connectedStats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#22 ' + "connectedStats.operationHistoryCount" + ' = ' + JSON.stringify(connectedStats.operationHistoryCount));
      expect(connectedStats.operationHistoryCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#23 ' + "connectedStats.isInitialized" + ' = ' + JSON.stringify(connectedStats.isInitialized));
      expect(connectedStats.isInitialized).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#24 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#25 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#26 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#27 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#28 assert ' + "expect(service.getOperationHistory().length).assertEqual(3)");
      expect(service.getOperationHistory().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#29 assert ' + "expect(service.getOperationHistory()[2].operation).assertEqual('disconnect')");
      expect(service.getOperationHistory()[2].operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#30 assert ' +
        "expect(service.getOperationHistory()[2].details).assertEqual(`Disconnected from ${DEVICE_A}`)");
      expect(service.getOperationHistory()[2].details).assertEqual(`Disconnected from ${DEVICE_A}`);

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0023',
        '#31 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0023', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_2400
     * @tc.name: testA2dpProfile0024
     * @tc.desc: Verify that statistics are updated when a device is connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0024', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0024', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      const before = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#1 ' + "before.totalConnectionAttempts" + ' = ' + JSON.stringify(before.totalConnectionAttempts));
      expect(before.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#2 ' + "before.successfulConnections" + ' = ' + JSON.stringify(before.successfulConnections));
      expect(before.successfulConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#3 ' + "before.lastConnectionEvent" + ' = ' + JSON.stringify(before.lastConnectionEvent));
      expect(before.lastConnectionEvent).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#4 ' + "before.connectedDeviceCount" + ' = ' + JSON.stringify(before.connectedDeviceCount));
      expect(before.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#5 ' + "before.healthScore" + ' = ' + JSON.stringify(before.healthScore));
      expect(before.healthScore).assertEqual(60);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#6 ' + "before.connectionSuccessRate" + ' = ' + JSON.stringify(before.connectionSuccessRate));
      expect(before.connectionSuccessRate).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#7 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      const after = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#8 ' + "after.totalConnectionAttempts" + ' = ' + JSON.stringify(after.totalConnectionAttempts));
      expect(after.totalConnectionAttempts).assertEqual(before.totalConnectionAttempts + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#9 ' + "after.successfulConnections" + ' = ' + JSON.stringify(after.successfulConnections));
      expect(after.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#10 ' + "after.failedConnections" + ' = ' + JSON.stringify(after.failedConnections));
      expect(after.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#11 ' + "after.connectedDeviceCount" + ' = ' + JSON.stringify(after.connectedDeviceCount));
      expect(after.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#12 ' + "after.managedDeviceCount" + ' = ' + JSON.stringify(after.managedDeviceCount));
      expect(after.managedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#13 ' + "after.connectionSuccessRate" + ' = ' + JSON.stringify(after.connectionSuccessRate));
      expect(after.connectionSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#14 ' + "after.totalOperations" + ' = ' + JSON.stringify(after.totalOperations));
      expect(after.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#15 ' + "after.successfulOperations" + ' = ' + JSON.stringify(after.successfulOperations));
      expect(after.successfulOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#16 ' + "after.operationSuccessRate" + ' = ' + JSON.stringify(after.operationSuccessRate));
      expect(after.operationSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#17 ' + "after.errorRate" + ' = ' + JSON.stringify(after.errorRate));
      expect(after.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#18 ' + "after.healthScore" + ' = ' + JSON.stringify(after.healthScore));
      expect(after.healthScore).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#19 ' + "after.isHealthy" + ' = ' + JSON.stringify(after.isHealthy));
      expect(after.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#20 ' + "after.lastConnectionEvent > 0" + ' = ' + JSON.stringify(after.lastConnectionEvent > 0));
      expect(after.lastConnectionEvent > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#21 ' + "after.lastOperationTime > 0" + ' = ' + JSON.stringify(after.lastOperationTime > 0));
      expect(after.lastOperationTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#22 ' + "after.uptimeMs > 0" + ' = ' + JSON.stringify(after.uptimeMs > 0));
      expect(after.uptimeMs > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#23 ' + "after.operationsPerMinute > 0" + ' = ' + JSON.stringify(after.operationsPerMinute > 0));
      expect(after.operationsPerMinute > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#24 ' + "after.queuedOperationCount" + ' = ' + JSON.stringify(after.queuedOperationCount));
      expect(after.queuedOperationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#25 ' + "after.retryAttempts" + ' = ' + JSON.stringify(after.retryAttempts));
      expect(after.retryAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#26 ' + "after.autoReconnectEvents" + ' = ' + JSON.stringify(after.autoReconnectEvents));
      expect(after.autoReconnectEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#27 ' + "after.lastOperationTime" + ' = ' + JSON.stringify(after.lastOperationTime));
      expect(after.lastOperationTime).assertEqual(recordAt(manager, 1).endTime);

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0024',
        '#28 assert ' + "expect(manager.getStatistics().totalConnectionAttempts).assertEqual(1)");
      expect(manager.getStatistics().totalConnectionAttempts).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0024', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_2500
     * @tc.name: testA2dpProfile0025
     * @tc.desc: Verify that statistics are updated when a device is disconnected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0025', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0025', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#2 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();

      const before = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#3 ' + "before.totalConnectionAttempts" + ' = ' + JSON.stringify(before.totalConnectionAttempts));
      expect(before.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#4 ' + "before.successfulConnections" + ' = ' + JSON.stringify(before.successfulConnections));
      expect(before.successfulConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#5 ' + "before.disconnectionEvents" + ' = ' + JSON.stringify(before.disconnectionEvents));
      expect(before.disconnectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#6 ' + "before.connectedDeviceCount" + ' = ' + JSON.stringify(before.connectedDeviceCount));
      expect(before.connectedDeviceCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#7 ' + "before.totalOperations" + ' = ' + JSON.stringify(before.totalOperations));
      expect(before.totalOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#8 ' + "before.healthScore" + ' = ' + JSON.stringify(before.healthScore));
      expect(before.healthScore).assertEqual(100);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#9 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      const after = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#10 ' + "after.disconnectionEvents" + ' = ' + JSON.stringify(after.disconnectionEvents));
      expect(after.disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#11 ' + "after.connectedDeviceCount" + ' = ' + JSON.stringify(after.connectedDeviceCount));
      expect(after.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#12 ' + "after.managedDeviceCount" + ' = ' + JSON.stringify(after.managedDeviceCount));
      expect(after.managedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#13 ' + "after.totalConnectionAttempts" + ' = ' + JSON.stringify(after.totalConnectionAttempts));
      expect(after.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#14 ' + "after.successfulConnections" + ' = ' + JSON.stringify(after.successfulConnections));
      expect(after.successfulConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#15 ' + "after.failedConnections" + ' = ' + JSON.stringify(after.failedConnections));
      expect(after.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#16 ' + "after.totalOperations" + ' = ' + JSON.stringify(after.totalOperations));
      expect(after.totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#17 ' + "after.successfulOperations" + ' = ' + JSON.stringify(after.successfulOperations));
      expect(after.successfulOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#18 ' + "after.failedOperations" + ' = ' + JSON.stringify(after.failedOperations));
      expect(after.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#19 ' + "after.errorRate" + ' = ' + JSON.stringify(after.errorRate));
      expect(after.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#20 ' + "after.connectionSuccessRate" + ' = ' + JSON.stringify(after.connectionSuccessRate));
      expect(after.connectionSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#21 ' + "after.healthScore" + ' = ' + JSON.stringify(after.healthScore));
      expect(after.healthScore).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#22 ' + "after.isHealthy" + ' = ' + JSON.stringify(after.isHealthy));
      expect(after.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#23 ' + "after.lastOperationTime" + ' = ' + JSON.stringify(after.lastOperationTime));
      expect(after.lastOperationTime).assertEqual(recordAt(manager, 3).endTime);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#24 ' + "after.uptimeMs > 0" + ' = ' + JSON.stringify(after.uptimeMs > 0));
      expect(after.uptimeMs > 0).assertTrue();

      const service = manager.getService();
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#25 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#26 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#27 ' + "svcStats.connectionState" + ' = ' + JSON.stringify(svcStats.connectionState));
      expect(svcStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      const svcHistory = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#28 ' + "svcHistory.length" + ' = ' + JSON.stringify(svcHistory.length));
      expect(svcHistory.length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#29 ' + "svcHistory[3].operation" + ' = ' + JSON.stringify(svcHistory[3].operation));
      expect(svcHistory[3].operation).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#30 ' + "svcHistory[3].success" + ' = ' + JSON.stringify(svcHistory[3].success));
      expect(svcHistory[3].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#31 ' + "svcHistory[3].details" + ' = ' + JSON.stringify(svcHistory[3].details));
      expect(svcHistory[3].details).assertEqual(`Disconnected from ${DEVICE_A}`);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#32 assert ' + "expect(await manager.disconnect(DEVICE_B)).assertTrue()");
      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      const final = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#33 ' + "final.disconnectionEvents" + ' = ' + JSON.stringify(final.disconnectionEvents));
      expect(final.disconnectionEvents).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#34 ' + "final.connectedDeviceCount" + ' = ' + JSON.stringify(final.connectedDeviceCount));
      expect(final.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#35 ' + "final.totalOperations" + ' = ' + JSON.stringify(final.totalOperations));
      expect(final.totalOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#36 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#37 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#38 assert ' + "expect(service.getOperationHistory().length).assertEqual(5)");
      expect(service.getOperationHistory().length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#39 assert ' +
        "expect(service.getOperationHistory()[4].details).assertEqual(`Disconnected from ${DEVICE_B}`)");
      expect(service.getOperationHistory()[4].details).assertEqual(`Disconnected from ${DEVICE_B}`);
      const statsAfterAll: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#40 ' + "statsAfterAll.connectedDeviceCount" + ' = ' + JSON.stringify(statsAfterAll.connectedDeviceCount));
      expect(statsAfterAll.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#41 ' + "statsAfterAll.operationHistoryCount" + ' = ' + JSON.stringify(statsAfterAll.operationHistoryCount));
      expect(statsAfterAll.operationHistoryCount).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0025',
        '#42 ' + "statsAfterAll.connectionState" + ' = ' + JSON.stringify(statsAfterAll.connectionState));
      expect(statsAfterAll.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0025', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_2600
     * @tc.name: testA2dpProfile0026
     * @tc.desc: Verify that the health score is calculated as expected after operations.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0026', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0026', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();

      const fresh = healthOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#1 ' + "fresh.healthScore" + ' = ' + JSON.stringify(fresh.healthScore));
      expect(fresh.healthScore).assertEqual(60);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#2 ' + "fresh.isHealthy" + ' = ' + JSON.stringify(fresh.isHealthy));
      expect(fresh.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#3 ' + "fresh.errorRate" + ' = ' + JSON.stringify(fresh.errorRate));
      expect(fresh.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#4 ' + "fresh.connectionSuccessRate" + ' = ' + JSON.stringify(fresh.connectionSuccessRate));
      expect(fresh.connectionSuccessRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#5 ' + "fresh.lastError" + ' = ' + JSON.stringify(fresh.lastError));
      expect(fresh.lastError).assertEqual('');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#6 assert ' + "expect(await manager.disconnect(GHOST_DEVICE)).assertFalse()");
      expect(await manager.disconnect(GHOST_DEVICE)).assertFalse();
      const afterFailure = healthOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#7 ' + "afterFailure.errorRate" + ' = ' + JSON.stringify(afterFailure.errorRate));
      expect(afterFailure.errorRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#8 ' + "afterFailure.healthScore" + ' = ' + JSON.stringify(afterFailure.healthScore));
      expect(afterFailure.healthScore).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#9 ' + "afterFailure.isHealthy" + ' = ' + JSON.stringify(afterFailure.isHealthy));
      expect(afterFailure.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#10 ' + "afterFailure.lastError" + ' = ' + JSON.stringify(afterFailure.lastError));
      expect(afterFailure.lastError).assertEqual('Not managed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#11 ' + "afterFailure.connectionSuccessRate" + ' = ' + JSON.stringify(afterFailure.connectionSuccessRate));
      expect(afterFailure.connectionSuccessRate).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#12 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      const afterSuccess = healthOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#13 ' + "afterSuccess.connectionSuccessRate" + ' = ' + JSON.stringify(afterSuccess.connectionSuccessRate));
      expect(afterSuccess.connectionSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#14 ' + "afterSuccess.errorRate > 30 && afterSuccess.errorRate < 34" + ' = ' +
        JSON.stringify(afterSuccess.errorRate > 30 && afterSuccess.errorRate < 34));
      expect(afterSuccess.errorRate > 30 && afterSuccess.errorRate < 34).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#15 ' + "afterSuccess.healthScore" + ' = ' + JSON.stringify(afterSuccess.healthScore));
      expect(afterSuccess.healthScore).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#16 ' + "afterSuccess.isHealthy" + ' = ' + JSON.stringify(afterSuccess.isHealthy));
      expect(afterSuccess.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#17 ' + "afterSuccess.lastError" + ' = ' + JSON.stringify(afterSuccess.lastError));
      expect(afterSuccess.lastError).assertEqual('Not managed');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#18 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      const afterClean = healthOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#19 ' + "afterClean.errorRate" + ' = ' + JSON.stringify(afterClean.errorRate));
      expect(afterClean.errorRate).assertEqual(25);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#20 ' + "afterClean.healthScore" + ' = ' + JSON.stringify(afterClean.healthScore));
      expect(afterClean.healthScore).assertEqual(70);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#21 ' + "afterClean.isHealthy" + ' = ' + JSON.stringify(afterClean.isHealthy));
      expect(afterClean.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#22 ' + "afterClean.lastError" + ' = ' + JSON.stringify(afterClean.lastError));
      expect(afterClean.lastError).assertEqual('Not managed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#23 ' + "afterClean.connectionSuccessRate" + ' = ' + JSON.stringify(afterClean.connectionSuccessRate));
      expect(afterClean.connectionSuccessRate).assertEqual(100);

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#24 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#25 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#26 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#27 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(afterClean.healthScore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0026',
        '#28 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertEqual(afterClean.isHealthy);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0026', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_2700
     * @tc.name: testA2dpProfile0027
     * @tc.desc: Verify that operations are recorded in the operation records.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0027', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0027', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#2 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#3 assert ' + "expect(await manager.disconnect(GHOST_DEVICE)).assertFalse()");
      expect(await manager.disconnect(GHOST_DEVICE)).assertFalse();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#4 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#5 assert ' + "expect(manager.getOperationRecords() !== manager.getOperationRecords()).assertTrue()");
      expect(manager.getOperationRecords() !== manager.getOperationRecords()).assertTrue();

      const expectedNames: string[] = ['initialize', 'connect', 'disconnect', 'disconnect'];
      const expectedIds: string[] = ['mgr_op_1', 'mgr_op_2', 'mgr_op_3', 'mgr_op_4'];
      const expectedDetails: string[] = ['Manager initialized', `Connected to ${DEVICE_A}`,
        `Disconnected from ${DEVICE_A}`, `Device ${GHOST_DEVICE} not managed`];
      for (let i = 0; i < records.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
          '#6 ' + "records[i].operationId" + ' = ' + JSON.stringify(records[i].operationId));
        expect(records[i].operationId).assertEqual(expectedIds[i]);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
          '#7 ' + "records[i].operationName" + ' = ' + JSON.stringify(records[i].operationName));
        expect(records[i].operationName).assertEqual(expectedNames[i]);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
          '#8 ' + "records[i].details" + ' = ' + JSON.stringify(records[i].details));
        expect(records[i].details).assertEqual(expectedDetails[i]);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
          '#9 ' + "records[i].startTime" + ' = ' + JSON.stringify(records[i].startTime));
        expect(records[i].startTime).assertEqual(records[i].endTime);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
          '#10 ' + "records[i].durationMs" + ' = ' + JSON.stringify(records[i].durationMs));
        expect(records[i].durationMs).assertEqual(0);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
          '#11 ' + "records[i].success" + ' = ' + JSON.stringify(records[i].success));
        expect(records[i].success).assertEqual(i !== 3);
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#12 ' + "records[3].errorMessage" + ' = ' + JSON.stringify(records[3].errorMessage));
      expect(records[3].errorMessage).assertEqual('Not managed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#13 ' + "records[0].errorMessage" + ' = ' + JSON.stringify(records[0].errorMessage));
      expect(records[0].errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#14 ' + "records[1].errorMessage" + ' = ' + JSON.stringify(records[1].errorMessage));
      expect(records[1].errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#15 ' + "records[2].errorMessage" + ' = ' + JSON.stringify(records[2].errorMessage));
      expect(records[2].errorMessage).assertEqual('');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#16 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#17 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#18 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#19 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(25);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#20 ' + "stats.averageOperationDurationMs" + ' = ' + JSON.stringify(stats.averageOperationDurationMs));
      expect(stats.averageOperationDurationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#21 ' + "stats.maxOperationDurationMs" + ' = ' + JSON.stringify(stats.maxOperationDurationMs));
      expect(stats.maxOperationDurationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#22 ' + "stats.minOperationDurationMs" + ' = ' + JSON.stringify(stats.minOperationDurationMs));
      expect(stats.minOperationDurationMs).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#23 ' + "stats.lastOperationTime" + ' = ' + JSON.stringify(stats.lastOperationTime));
      expect(stats.lastOperationTime).assertEqual(records[3].endTime);

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#24 assert ' + "expect(recordAt(manager, 0).operationName).assertEqual('reset')");
      expect(recordAt(manager, 0).operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0027',
        '#25 assert ' + "expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_5')");
      expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_5');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0027', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_2800
     * @tc.name: testA2dpProfile0028
     * @tc.desc: Verify that configuration changes persist across reads.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0028', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0028', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      manager.setConfig({
        maxRetryAttempts: 7,
        verboseLogging: true,
        autoReconnect: false,
        maxManagedDevices: 3,
        healthCheckIntervalMs: 1234
      });

      const changed = manager.getConfig();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#1 ' + "changed.maxRetryAttempts" + ' = ' + JSON.stringify(changed.maxRetryAttempts));
      expect(changed.maxRetryAttempts).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#2 ' + "changed.verboseLogging" + ' = ' + JSON.stringify(changed.verboseLogging));
      expect(changed.verboseLogging).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#3 ' + "changed.autoReconnect" + ' = ' + JSON.stringify(changed.autoReconnect));
      expect(changed.autoReconnect).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#4 ' + "changed.maxManagedDevices" + ' = ' + JSON.stringify(changed.maxManagedDevices));
      expect(changed.maxManagedDevices).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#5 ' + "changed.healthCheckIntervalMs" + ' = ' + JSON.stringify(changed.healthCheckIntervalMs));
      expect(changed.healthCheckIntervalMs).assertEqual(1234);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#6 ' + "changed.connectionTimeoutMs" + ' = ' + JSON.stringify(changed.connectionTimeoutMs));
      expect(changed.connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#7 ' + "changed.operationTimeoutMs" + ' = ' + JSON.stringify(changed.operationTimeoutMs));
      expect(changed.operationTimeoutMs).assertEqual(DEFAULT_OPERATION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#8 ' + "changed.retryDelayMs" + ' = ' + JSON.stringify(changed.retryDelayMs));
      expect(changed.retryDelayMs).assertEqual(DEFAULT_RETRY_DELAY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#9 ' + "changed.useExponentialBackoff" + ' = ' + JSON.stringify(changed.useExponentialBackoff));
      expect(changed.useExponentialBackoff).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#10 ' + "changed.maxBackoffDelayMs" + ' = ' + JSON.stringify(changed.maxBackoffDelayMs));
      expect(changed.maxBackoffDelayMs).assertEqual(DEFAULT_MAX_BACKOFF);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#11 ' + "changed.maxAutoReconnectAttempts" + ' = ' + JSON.stringify(changed.maxAutoReconnectAttempts));
      expect(changed.maxAutoReconnectAttempts).assertEqual(DEFAULT_AUTO_RECONNECT_ATTEMPTS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#12 ' + "changed.autoReconnectDelayMs" + ' = ' + JSON.stringify(changed.autoReconnectDelayMs));
      expect(changed.autoReconnectDelayMs).assertEqual(DEFAULT_AUTO_RECONNECT_DELAY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#13 ' + "changed.maxQueueSize" + ' = ' + JSON.stringify(changed.maxQueueSize));
      expect(changed.maxQueueSize).assertEqual(MAX_QUEUE_SIZE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#14 ' + "changed.enablePerformanceTracing" + ' = ' + JSON.stringify(changed.enablePerformanceTracing));
      expect(changed.enablePerformanceTracing).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#15 ' + "changed.minHealthScoreThreshold" + ' = ' + JSON.stringify(changed.minHealthScoreThreshold));
      expect(changed.minHealthScoreThreshold).assertEqual(DEFAULT_HEALTH_THRESHOLD);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#16 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#17 assert ' + "expect(manager.getConfig().maxRetryAttempts).assertEqual(7)");
      expect(manager.getConfig().maxRetryAttempts).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#18 assert ' + "expect(manager.getConfig().autoReconnect).assertFalse()");
      expect(manager.getConfig().autoReconnect).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#19 assert ' + "expect(manager.getConfig().verboseLogging).assertTrue()");
      expect(manager.getConfig().verboseLogging).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#20 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      await manager.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#21 assert ' + "expect(manager.getConfig().maxManagedDevices).assertEqual(3)");
      expect(manager.getConfig().maxManagedDevices).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#22 assert ' + "expect(manager.getConfig().healthCheckIntervalMs).assertEqual(1234)");
      expect(manager.getConfig().healthCheckIntervalMs).assertEqual(1234);

      const copy = manager.getConfig();
      copy.maxRetryAttempts = 99;
      copy.autoReconnect = true;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#23 assert ' + "expect(manager.getConfig().maxRetryAttempts).assertEqual(7)");
      expect(manager.getConfig().maxRetryAttempts).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#24 assert ' + "expect(manager.getConfig().autoReconnect).assertFalse()");
      expect(manager.getConfig().autoReconnect).assertFalse();

      manager.setConfig({ operationTimeoutMs: 2222 });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#25 assert ' + "expect(manager.getConfig().operationTimeoutMs).assertEqual(2222)");
      expect(manager.getConfig().operationTimeoutMs).assertEqual(2222);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#26 assert ' + "expect(manager.getConfig().maxRetryAttempts).assertEqual(7)");
      expect(manager.getConfig().maxRetryAttempts).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#27 assert ' + "expect(manager.getConfig().healthCheckIntervalMs).assertEqual(1234)");
      expect(manager.getConfig().healthCheckIntervalMs).assertEqual(1234);

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#28 assert ' + "expect(manager.getConfig().operationTimeoutMs).assertEqual(2222)");
      expect(manager.getConfig().operationTimeoutMs).assertEqual(2222);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0028',
        '#29 assert ' + "expect(manager.getConfig().maxManagedDevices).assertEqual(3)");
      expect(manager.getConfig().maxManagedDevices).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0028', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_2900
     * @tc.name: testA2dpProfile0029
     * @tc.desc: Verify that repeated callback registration and removal behave correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpProfile0029', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0029', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      const service = manager.getService();

      const states: string[] = [];
      const models: A2dpModel[] = [];
      const onState = (state: BluetoothConnectionState) => {
        states.push(state);
      };
      const onData = (model: A2dpModel) => {
        models.push(model);
      };

      manager.addStateCallback(onState);
      manager.addStateCallback(onState);
      manager.addStateCallback(onState);
      manager.addDataCallback(onData);
      manager.addDataCallback(onData);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#2 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#3 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#4 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#5 ' + "models.length" + ' = ' + JSON.stringify(models.length));
      expect(models.length).assertEqual(0);
      const svcHistory = service.getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#6 ' + "svcHistory.length" + ' = ' + JSON.stringify(svcHistory.length));
      expect(svcHistory.length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#7 ' + "svcHistory[1].details" + ' = ' + JSON.stringify(svcHistory[1].details));
      expect(svcHistory[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#8 ' + "svcHistory[2].details" + ' = ' + JSON.stringify(svcHistory[2].details));
      expect(svcHistory[2].details).assertEqual(`Disconnected from ${DEVICE_A}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#9 ' + "svcHistory[3].details" + ' = ' + JSON.stringify(svcHistory[3].details));
      expect(svcHistory[3].details).assertEqual(`Connected to ${DEVICE_B}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#10 ' + "svcHistory[2].success" + ' = ' + JSON.stringify(svcHistory[2].success));
      expect(svcHistory[2].success).assertTrue();

      const unknownState = (state: BluetoothConnectionState) => {
        states.push(state);
      };
      const unknownData = (model: A2dpModel) => {
        models.push(model);
      };
      manager.removeStateCallback(unknownState);
      manager.removeDataCallback(unknownData);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#11 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#12 ' + "models.length" + ' = ' + JSON.stringify(models.length));
      expect(models.length).assertEqual(0);

      const serviceStates: string[] = [];
      const onServiceState = (state: BluetoothConnectionState) => {
        serviceStates.push(state);
      };
      const serviceModels: A2dpModel[] = [];
      const onServiceData = (model: A2dpModel) => {
        serviceModels.push(model);
      };
      service.addConnectionCallback(onServiceState);
      service.addDataCallback(onServiceData);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#13 assert ' + "expect(await manager.connect(DEVICE_C)).assertTrue()");
      expect(await manager.connect(DEVICE_C)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#14 assert ' + "expect(countString(serviceStates, BluetoothConnectionState.CONNECTED)).assertEqual(1)");
      expect(countString(serviceStates, BluetoothConnectionState.CONNECTED)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#15 ' + "serviceStates[serviceStates.length - 1]" + ' = ' +
        JSON.stringify(serviceStates[serviceStates.length - 1]));
      expect(serviceStates[serviceStates.length - 1]).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#16 ' + "serviceModels.length" + ' = ' + JSON.stringify(serviceModels.length));
      expect(serviceModels.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#17 assert ' + "expect(serviceModels[0] === service.getModel()).assertTrue()");
      expect(serviceModels[0] === service.getModel()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#18 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#19 ' + "models.length" + ' = ' + JSON.stringify(models.length));
      expect(models.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#20 assert ' + "expect(service.getOperationHistory().length).assertEqual(5)");
      expect(service.getOperationHistory().length).assertEqual(5);

      manager.removeStateCallback(onState);
      manager.removeStateCallback(onState);
      manager.removeDataCallback(onData);
      manager.removeDataCallback(onData);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#21 assert ' + "expect(await manager.disconnect(DEVICE_B)).assertTrue()");
      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#22 assert ' + "expect(await manager.disconnect(DEVICE_C)).assertTrue()");
      expect(await manager.disconnect(DEVICE_C)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#23 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#24 ' + "models.length" + ' = ' + JSON.stringify(models.length));
      expect(models.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#25 ' + "serviceStates[serviceStates.length - 1]" + ' = ' +
        JSON.stringify(serviceStates[serviceStates.length - 1]));
      expect(serviceStates[serviceStates.length - 1]).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#26 assert ' + "expect(countString(serviceStates, BluetoothConnectionState.CONNECTED)).assertEqual(2)");
      expect(countString(serviceStates, BluetoothConnectionState.CONNECTED)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#27 assert ' + "expect(countString(serviceStates, BluetoothConnectionState.DISCONNECTED)).assertEqual(1)");
      expect(countString(serviceStates, BluetoothConnectionState.DISCONNECTED)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#28 ' + "serviceModels.length" + ' = ' + JSON.stringify(serviceModels.length));
      expect(serviceModels.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#29 assert ' + "expect(service.getOperationHistory().length).assertEqual(7)");
      expect(service.getOperationHistory().length).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#30 assert ' +
        "expect(service.getOperationHistory()[6].details).assertEqual(`Disconnected from ${DEVICE_C}`)");
      expect(service.getOperationHistory()[6].details).assertEqual(`Disconnected from ${DEVICE_C}`);
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#31 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#32 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(0);

      await manager.destroy();
      manager.addStateCallback(onState);
      manager.addDataCallback(onData);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#33 assert ' + "expect(await manager.connect(DEVICE_A)).assertFalse()");
      expect(await manager.connect(DEVICE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#34 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#35 ' + "models.length" + ' = ' + JSON.stringify(models.length));
      expect(models.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0029',
        '#36 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0029', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_3000
     * @tc.name: testA2dpProfile0030
     * @tc.desc: Verify that concurrent operations keep state consistent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpProfile0030', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0030', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      const prefix = 'a2dp_profile_concurrent_';

      const ids: string[] = [];
      const tasks: Array<Promise<boolean>> = [];
      for (let i = 0; i < 5; i++) {
        const id = `${prefix}${i}`;
        ids.push(id);
        tasks.push(manager.connect(id));
      }
      const results: boolean[] = await Promise.all(tasks);

      let succeeded: number = 0;
      for (let i = 0; i < results.length; i++) {
        if (results[i]) {
          succeeded++;
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#1 ' + "succeeded" + ' = ' + JSON.stringify(succeeded));
      expect(succeeded).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#2 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(5)");
      expect(manager.getManagedDeviceCount()).assertEqual(5);
      const concurrentIds = manager.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#3 ' + "concurrentIds.length" + ' = ' + JSON.stringify(concurrentIds.length));
      expect(concurrentIds.length).assertEqual(5);
      for (let i = 0; i < ids.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
          '#4 ' + "concurrentIds[i]" + ' = ' + JSON.stringify(concurrentIds[i]));
        expect(concurrentIds[i]).assertEqual(ids[i]);
      }

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#5 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#6 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#7 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#8 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#9 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#10 ' + "stats.connectionSuccessRate" + ' = ' + JSON.stringify(stats.connectionSuccessRate));
      expect(stats.connectionSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#11 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#12 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#13 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(100);

      const service = manager.getService();
      const concurrentDetails = svcDetailsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#14 ' + "concurrentDetails.length" + ' = ' + JSON.stringify(concurrentDetails.length));
      expect(concurrentDetails.length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#15 assert ' + "expect(countString(concurrentDetails, 'Service initialized successfully')).assertEqual(1)");
      expect(countString(concurrentDetails, 'Service initialized successfully')).assertEqual(1);
      for (let i = 0; i < ids.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
          '#16 assert ' + "expect(countString(concurrentDetails, `Connected to ${ids[i]}`)).assertEqual(1)");
        expect(countString(concurrentDetails, `Connected to ${ids[i]}`)).assertEqual(1);
      }
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#17 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#18 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#19 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#20 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      const managedTasks: Array<Promise<boolean>> = [];
      for (let i = 0; i < 3; i++) {
        managedTasks.push(manager.connect(ids[0]));
      }
      const managedResults: boolean[] = await Promise.all(managedTasks);
      let managedAccepted: number = 0;
      for (let i = 0; i < managedResults.length; i++) {
        if (managedResults[i]) {
          managedAccepted++;
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#21 ' + "managedAccepted" + ' = ' + JSON.stringify(managedAccepted));
      expect(managedAccepted).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#22 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(5)");
      expect(manager.getManagedDeviceCount()).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#23 assert ' + "expect(manager.getOperationRecords().length).assertEqual(6)");
      expect(manager.getOperationRecords().length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#24 assert ' + "expect(manager.getStatistics().totalConnectionAttempts).assertEqual(5)");
      expect(manager.getStatistics().totalConnectionAttempts).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#25 assert ' + "expect(manager.getStatistics().successfulConnections).assertEqual(5)");
      expect(manager.getStatistics().successfulConnections).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#26 assert ' + "expect(svcDetailsOf(manager).length).assertEqual(6)");
      expect(svcDetailsOf(manager).length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#27 assert ' + "expect(countString(svcDetailsOf(manager), 'Already connected')).assertEqual(0)");
      expect(countString(svcDetailsOf(manager), 'Already connected')).assertEqual(0);

      const dupId = `${prefix}dup`;
      const duplicateTasks: Array<Promise<boolean>> = [];
      for (let i = 0; i < 3; i++) {
        duplicateTasks.push(manager.connect(dupId));
      }
      const duplicateResults: boolean[] = await Promise.all(duplicateTasks);
      let duplicateAccepted: number = 0;
      for (let i = 0; i < duplicateResults.length; i++) {
        if (duplicateResults[i]) {
          duplicateAccepted++;
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#28 ' + "duplicateAccepted" + ' = ' + JSON.stringify(duplicateAccepted));
      expect(duplicateAccepted).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#29 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(8)");
      expect(manager.getManagedDeviceCount()).assertEqual(8);
      const dupIds = manager.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#30 ' + "dupIds.length" + ' = ' + JSON.stringify(dupIds.length));
      expect(dupIds.length).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#31 assert ' + "expect(dupIds.indexOf(dupId)).assertEqual(5)");
      expect(dupIds.indexOf(dupId)).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#32 assert ' + "expect(dupIds.lastIndexOf(dupId)).assertEqual(7)");
      expect(dupIds.lastIndexOf(dupId)).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#33 assert ' + "expect(dupIds.indexOf(ids[0])).assertEqual(0)");
      expect(dupIds.indexOf(ids[0])).assertEqual(0);
      const dupDetails = svcDetailsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#34 ' + "dupDetails.length" + ' = ' + JSON.stringify(dupDetails.length));
      expect(dupDetails.length).assertEqual(9);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#35 assert ' + "expect(countString(dupDetails, `Connected to ${dupId}`)).assertEqual(3)");
      expect(countString(dupDetails, `Connected to ${dupId}`)).assertEqual(3);
      const dupStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#36 ' + "dupStats.connectedDeviceCount" + ' = ' + JSON.stringify(dupStats.connectedDeviceCount));
      expect(dupStats.connectedDeviceCount).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#37 ' + "dupStats.operationHistoryCount" + ' = ' + JSON.stringify(dupStats.operationHistoryCount));
      expect(dupStats.operationHistoryCount).assertEqual(9);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#38 ' + "dupStats.connectionState" + ' = ' + JSON.stringify(dupStats.connectionState));
      expect(dupStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#39 assert ' + "expect(manager.getStatistics().totalConnectionAttempts).assertEqual(8)");
      expect(manager.getStatistics().totalConnectionAttempts).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#40 assert ' + "expect(manager.getStatistics().successfulConnections).assertEqual(8)");
      expect(manager.getStatistics().successfulConnections).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#41 assert ' + "expect(manager.getStatistics().connectedDeviceCount).assertEqual(8)");
      expect(manager.getStatistics().connectedDeviceCount).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#42 assert ' + "expect(recordsOf(manager).length).assertEqual(9)");
      expect(recordsOf(manager).length).assertEqual(9);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#43 assert ' + "expect(recordAt(manager, 8).details).assertEqual(`Connected to ${dupId}`)");
      expect(recordAt(manager, 8).details).assertEqual(`Connected to ${dupId}`);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#44 assert ' + "expect(await manager.disconnect(dupId)).assertTrue()");
      expect(await manager.disconnect(dupId)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#45 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(7)");
      expect(manager.getManagedDeviceCount()).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#46 assert ' + "expect(await manager.disconnect(dupId)).assertTrue()");
      expect(await manager.disconnect(dupId)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#47 assert ' + "expect(await manager.disconnect(dupId)).assertTrue()");
      expect(await manager.disconnect(dupId)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#48 assert ' + "expect(await manager.disconnect(dupId)).assertFalse()");
      expect(await manager.disconnect(dupId)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#49 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(5)");
      expect(manager.getManagedDeviceCount()).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#50 assert ' + "expect(manager.getStatistics().disconnectionEvents).assertEqual(3)");
      expect(manager.getStatistics().disconnectionEvents).assertEqual(3);
      const finalDetails = svcDetailsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#51 ' + "finalDetails.length" + ' = ' + JSON.stringify(finalDetails.length));
      expect(finalDetails.length).assertEqual(12);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#52 assert ' + "expect(countString(finalDetails, `Disconnected from ${dupId}`)).assertEqual(3)");
      expect(countString(finalDetails, `Disconnected from ${dupId}`)).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#53 ' + "finalDetails[11]" + ' = ' + JSON.stringify(finalDetails[11]));
      expect(finalDetails[11]).assertEqual(`Disconnected from ${dupId}`);
      const afterDupStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#54 ' + "afterDupStats.connectedDeviceCount" + ' = ' + JSON.stringify(afterDupStats.connectedDeviceCount));
      expect(afterDupStats.connectedDeviceCount).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#55 ' + "afterDupStats.operationHistoryCount" + ' = ' + JSON.stringify(afterDupStats.operationHistoryCount));
      expect(afterDupStats.operationHistoryCount).assertEqual(12);

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#56 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0030',
        '#57 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0030', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_3100
     * @tc.name: testA2dpProfile0031
     * @tc.desc: Verify that operations in an invalid state return expected errors without crashing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testA2dpProfile0031', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0031', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#1 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#2 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#3 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#4 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const connectResult = await manager.connect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#5 ' + "connectResult" + ' = ' + JSON.stringify(connectResult));
      expect(connectResult).assertFalse();
      const disconnectResult = await manager.disconnect(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#6 ' + "disconnectResult" + ' = ' + JSON.stringify(disconnectResult));
      expect(disconnectResult).assertFalse();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#7 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#8 ' + "records[0].operationId" + ' = ' + JSON.stringify(records[0].operationId));
      expect(records[0].operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#9 ' + "records[0].operationName" + ' = ' + JSON.stringify(records[0].operationName));
      expect(records[0].operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#10 ' + "records[0].success" + ' = ' + JSON.stringify(records[0].success));
      expect(records[0].success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#11 ' + "records[0].errorMessage" + ' = ' + JSON.stringify(records[0].errorMessage));
      expect(records[0].errorMessage).assertEqual('Not ready');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#12 ' + "records[0].details" + ' = ' + JSON.stringify(records[0].details));
      expect(records[0].details).assertEqual('Manager not initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#13 ' + "records[1].operationId" + ' = ' + JSON.stringify(records[1].operationId));
      expect(records[1].operationId).assertEqual('mgr_op_2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#14 ' + "records[1].operationName" + ' = ' + JSON.stringify(records[1].operationName));
      expect(records[1].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#15 ' + "records[1].errorMessage" + ' = ' + JSON.stringify(records[1].errorMessage));
      expect(records[1].errorMessage).assertEqual('Not ready');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#16 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#17 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#18 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#19 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#20 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#21 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#22 ' + "stats.connectionSuccessRate" + ' = ' + JSON.stringify(stats.connectionSuccessRate));
      expect(stats.connectionSuccessRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#23 ' + "stats.uptimeMs" + ' = ' + JSON.stringify(stats.uptimeMs));
      expect(stats.uptimeMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#24 ' + "stats.lastConnectionEvent" + ' = ' + JSON.stringify(stats.lastConnectionEvent));
      expect(stats.lastConnectionEvent).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#25 ' + "stats.operationSuccessRate" + ' = ' + JSON.stringify(stats.operationSuccessRate));
      expect(stats.operationSuccessRate).assertEqual(0);

      const health = healthOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#26 ' + "health.healthScore" + ' = ' + JSON.stringify(health.healthScore));
      expect(health.healthScore).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#27 ' + "health.isHealthy" + ' = ' + JSON.stringify(health.isHealthy));
      expect(health.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#28 ' + "health.lastError" + ' = ' + JSON.stringify(health.lastError));
      expect(health.lastError).assertEqual('Not ready');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#29 ' + "health.uptimeMs" + ' = ' + JSON.stringify(health.uptimeMs));
      expect(health.uptimeMs).assertEqual(0);

      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#30 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#31 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#32 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      const serviceStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#33 ' + "serviceStats.isInitialized" + ' = ' + JSON.stringify(serviceStats.isInitialized));
      expect(serviceStats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#34 ' + "serviceStats.operationHistoryCount" + ' = ' + JSON.stringify(serviceStats.operationHistoryCount));
      expect(serviceStats.operationHistoryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#35 ' + "serviceStats.connectedDeviceCount" + ' = ' + JSON.stringify(serviceStats.connectedDeviceCount));
      expect(serviceStats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#36 ' + "serviceStats.serviceName" + ' = ' + JSON.stringify(serviceStats.serviceName));
      expect(serviceStats.serviceName).assertEqual(SERVICE_NAME);

      await manager.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#37 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#38 assert ' + "expect(recordAt(manager, 0).operationName).assertEqual('reset')");
      expect(recordAt(manager, 0).operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#39 assert ' + "expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_3')");
      expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#40 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#41 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      const afterInit = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#42 ' + "afterInit.length" + ' = ' + JSON.stringify(afterInit.length));
      expect(afterInit.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#43 ' + "afterInit[0].operationId" + ' = ' + JSON.stringify(afterInit[0].operationId));
      expect(afterInit[0].operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#44 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#45 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0031',
        '#46 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0031', 'end');
    });

    /*
     * @tc.number: SUB_A2DP_PROFILE_3200
     * @tc.name: testA2dpProfile0032
     * @tc.desc: Verify the full manager lifecycle of initialize, connect, disconnect and destroy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testA2dpProfile0032', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0032', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      await manager.initialize();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#2 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#3 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(2)");
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#4 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#5 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#6 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);

      await manager.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#7 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#8 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#9 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#10 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const recordsAfterDestroy = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#11 ' + "recordsAfterDestroy.length" + ' = ' + JSON.stringify(recordsAfterDestroy.length));
      expect(recordsAfterDestroy.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#12 ' + "recordsAfterDestroy[0].operationId" + ' = ' + JSON.stringify(recordsAfterDestroy[0].operationId));
      expect(recordsAfterDestroy[0].operationId).assertEqual('mgr_op_7');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#13 ' + "recordsAfterDestroy[0].operationName" + ' = ' + JSON.stringify(recordsAfterDestroy[0].operationName));
      expect(recordsAfterDestroy[0].operationName).assertEqual('reset');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#14 assert ' + "expect(await manager.connect(DEVICE_C)).assertFalse()");
      expect(await manager.connect(DEVICE_C)).assertFalse();
      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#15 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#16 ' + "records[1].operationId" + ' = ' + JSON.stringify(records[1].operationId));
      expect(records[1].operationId).assertEqual('mgr_op_8');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#17 ' + "records[1].operationName" + ' = ' + JSON.stringify(records[1].operationName));
      expect(records[1].operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#18 ' + "records[1].errorMessage" + ' = ' + JSON.stringify(records[1].errorMessage));
      expect(records[1].errorMessage).assertEqual('Not ready');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#19 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#20 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#21 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#22 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#23 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#24 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#25 ' + "stats.disconnectionEvents" + ' = ' + JSON.stringify(stats.disconnectionEvents));
      expect(stats.disconnectionEvents).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#26 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#27 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#28 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(12.5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#29 ' + "stats.connectionSuccessRate" + ' = ' + JSON.stringify(stats.connectionSuccessRate));
      expect(stats.connectionSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#30 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(70);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#31 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertTrue();

      const service = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#32 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#33 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#34 assert ' + "expect(service.getOperationHistory().length).assertEqual(1)");
      expect(service.getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#35 assert ' + "expect(service.getOperationHistory()[0].details).assertEqual('Service reset')");
      expect(service.getOperationHistory()[0].details).assertEqual('Service reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#36 assert ' + "expect(service.getOperationHistory()[0].operation).assertEqual('reset')");
      expect(service.getOperationHistory()[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#37 assert ' + "expect(service.getOperationHistory()[0].success).assertTrue()");
      expect(service.getOperationHistory()[0].success).assertTrue();
      const svcStats: A2dpServiceStatistics = service.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#38 ' + "svcStats.connectedDeviceCount" + ' = ' + JSON.stringify(svcStats.connectedDeviceCount));
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#39 ' + "svcStats.isInitialized" + ' = ' + JSON.stringify(svcStats.isInitialized));
      expect(svcStats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#40 ' + "svcStats.connectionState" + ' = ' + JSON.stringify(svcStats.connectionState));
      expect(svcStats.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#41 ' + "svcStats.operationHistoryCount" + ' = ' + JSON.stringify(svcStats.operationHistoryCount));
      expect(svcStats.operationHistoryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#42 ' + "svcStats.serviceName" + ' = ' + JSON.stringify(svcStats.serviceName));
      expect(svcStats.serviceName).assertEqual(SERVICE_NAME);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#43 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      const reinitialized = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#44 ' + "reinitialized.totalOperations" + ' = ' + JSON.stringify(reinitialized.totalOperations));
      expect(reinitialized.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#45 ' + "reinitialized.totalConnectionAttempts" + ' = ' +
        JSON.stringify(reinitialized.totalConnectionAttempts));
      expect(reinitialized.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#46 ' + "reinitialized.disconnectionEvents" + ' = ' + JSON.stringify(reinitialized.disconnectionEvents));
      expect(reinitialized.disconnectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#47 ' + "reinitialized.healthScore" + ' = ' + JSON.stringify(reinitialized.healthScore));
      expect(reinitialized.healthScore).assertEqual(60);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#48 assert ' + "expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_1')");
      expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#49 assert ' + "expect(service.getOperationHistory().length).assertEqual(1)");
      expect(service.getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#50 assert ' +
        "expect(service.getOperationHistory()[0].details).assertEqual('Service initialized successfully')");
      expect(service.getOperationHistory()[0].details).assertEqual('Service initialized successfully');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#51 assert ' + "expect(service.isConnected()).assertFalse()");
      expect(service.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#52 assert ' + "expect(manager.getModel() === service.getModel()).assertTrue()");
      expect(manager.getModel() === service.getModel()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#53 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#54 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#55 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testA2dpProfile0032',
        '#56 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testA2dpProfile0032', 'end');
    });
  });
}
