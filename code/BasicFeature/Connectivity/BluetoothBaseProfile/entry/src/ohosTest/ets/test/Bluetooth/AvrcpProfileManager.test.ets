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
import { BluetoothConnectionState, BluetoothProfileType, AvrcpModel, AvrcpProfileManager } from 'library';

/**
 * @description Test suite for AvrcpProfileManager
 * @since 26.0.0
 */

const SERVICE_NAME: string = 'AvrcpService';
const PROFILE_ID: string = 'AVRCP';
const DEVICE_A: string = 'avrcp_profile_device_a';
const DEVICE_B: string = 'avrcp_profile_device_b';
const DEVICE_C: string = 'avrcp_profile_device_c';
const GHOST_DEVICE: string = 'avrcp_profile_ghost_device';
const GHOST_PREFIX: string = 'avrcp_profile_ghost_';
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

function recordsOf(manager: AvrcpProfileManager): RecordView[] {
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

function recordAt(manager: AvrcpProfileManager, index: number): RecordView {
  const list = recordsOf(manager);
  return list[index];
}

function lastRecord(manager: AvrcpProfileManager): RecordView {
  const list = recordsOf(manager);
  return list[list.length - 1];
}

function healthOf(manager: AvrcpProfileManager): HealthView {
  const status: ESObject = manager.getHealthStatus();
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

function svcDetailsOf(manager: AvrcpProfileManager): string[] {
  const history: ESObject = manager.getService().getOperationHistory();
  const list: string[] = [];
  const length: number = history.length;
  for (let i = 0; i < length; i++) {
    list.push(history[i].details as string);
  }
  return list;
}

function countString(items: string[], value: string): number {
  let count = 0;
  for (let i = 0; i < items.length; i++) {
    if (items[i] === value) {
      count++;
    }
  }
  return count;
}

export default function avrcpProfileManagerTest(): void {
  describe('AvrcpProfileManagerTest', () => {
    /*
     * @tc.number: SUB_AVRCP_PROFILE_0100
     * @tc.name: testAvrcpProfile0001
     * @tc.desc: Verify that initialize returns true on the first call.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0001', 0, async () => {
      const manager = new AvrcpProfileManager();
      const modelBeforeInit = manager.getModel();
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.isConnected()).assertFalse();
      expect(manager.getStatistics().uptimeMs).assertEqual(0);

      const result = await manager.initialize();
      expect(result).assertTrue();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(1);
      expect(records[0].operationId).assertEqual('mgr_op_1');
      expect(records[0].operationName).assertEqual('initialize');
      expect(records[0].success).assertTrue();
      expect(records[0].errorMessage).assertEqual('');
      expect(records[0].details).assertEqual('Manager initialized');
      expect(records[0].startTime).assertEqual(records[0].endTime);
      expect(records[0].durationMs).assertEqual(0);

      const stats = manager.getStatistics();
      expect(stats.totalOperations).assertEqual(1);
      expect(stats.successfulOperations).assertEqual(1);
      expect(stats.failedOperations).assertEqual(0);
      expect(stats.totalConnectionAttempts).assertEqual(0);
      expect(stats.uptimeMs < 60000).assertTrue();
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(stats.managedDeviceCount).assertEqual(0);
      expect(stats.queuedOperationCount).assertEqual(0);
      expect(stats.retryAttempts).assertEqual(0);
      expect(stats.autoReconnectEvents).assertEqual(0);

      const service = manager.getService();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.serviceName).assertEqual(SERVICE_NAME);
      expect(svcStats.isInitialized).assertTrue();
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      expect(svcStats.operationHistoryCount).assertEqual(1);
      expect(manager.getModel() !== modelBeforeInit).assertTrue();
      expect(manager.getModel() === service.getModel()).assertTrue();

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_0200
     * @tc.name: testAvrcpProfile0002
     * @tc.desc: Verify that initialize returns false when already initialized.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0002', 0, async () => {
      const manager = new AvrcpProfileManager();
      expect(await manager.initialize()).assertTrue();
      const modelAfterFirst = manager.getModel();
      const recordsAfterFirst = recordsOf(manager);

      const second = await manager.initialize();
      expect(second).assertFalse();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(1);
      expect(records[0].operationId).assertEqual('mgr_op_1');
      expect(records[0].operationName).assertEqual('initialize');
      expect(records !== recordsAfterFirst).assertTrue();

      const stats = manager.getStatistics();
      expect(stats.totalOperations).assertEqual(1);
      expect(stats.successfulOperations).assertEqual(1);
      expect(stats.failedOperations).assertEqual(0);
      expect(stats.totalConnectionAttempts).assertEqual(0);
      expect(stats.lastOperationTime).assertEqual(recordsAfterFirst[0].endTime);

      const service = manager.getService();
      expect(manager.getModel() === modelAfterFirst).assertTrue();
      expect(service.getOperationHistory().length).assertEqual(1);
      expect(service.getOperationHistory()[0].details).assertEqual('Service initialized successfully');

      expect(manager.isConnected()).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT);
      expect(manager.getProfileType()).assertEqual(BluetoothProfileType.AVRCP);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_0300
     * @tc.name: testAvrcpProfile0003
     * @tc.desc: Verify that connect succeeds with a valid device ID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0003', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();

      const result = await manager.connect(DEVICE_A);
      expect(result).assertTrue();
      expect(manager.isConnected()).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);

      const ids = manager.getConnectedDeviceIds();
      expect(ids.length).assertEqual(1);
      expect(ids[0]).assertEqual(DEVICE_A);

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(1);
      expect(stats.successfulConnections).assertEqual(1);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.connectedDeviceCount).assertEqual(1);
      expect(stats.managedDeviceCount).assertEqual(1);
      expect(stats.connectionSuccessRate).assertEqual(100);
      expect(stats.lastConnectionEvent >= stats.uptimeMs).assertTrue();

      const record = lastRecord(manager);
      expect(recordsOf(manager).length).assertEqual(2);
      expect(record.operationId).assertEqual('mgr_op_2');
      expect(record.operationName).assertEqual('connect');
      expect(record.success).assertTrue();
      expect(record.errorMessage).assertEqual('');
      expect(record.details).assertEqual(`Connected to ${DEVICE_A}`);

      const service = manager.getService();
      expect(service.isConnected()).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.connectedDeviceCount).assertEqual(1);
      expect(svcStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(svcStats.operationHistoryCount).assertEqual(2);
      const history = service.getOperationHistory();
      expect(history.length).assertEqual(2);
      expect(history[1].operation).assertEqual('connect');
      expect(history[1].success).assertTrue();
      expect(history[1].details).assertEqual(`Connected to ${DEVICE_A}`);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_0400
     * @tc.name: testAvrcpProfile0004
     * @tc.desc: Verify that connect fails with an empty device ID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpProfile0004', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();

      const result = await manager.connect('');
      expect(result).assertFalse();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(1);
      expect(stats.successfulConnections).assertEqual(0);
      expect(stats.failedConnections).assertEqual(1);
      expect(stats.connectionSuccessRate).assertEqual(0);
      expect(stats.totalOperations).assertEqual(2);
      expect(stats.failedOperations).assertEqual(1);
      expect(stats.errorRate).assertEqual(50);

      const record = lastRecord(manager);
      expect(recordsOf(manager).length).assertEqual(2);
      expect(record.operationName).assertEqual('connect');
      expect(record.success).assertFalse();
      expect(record.errorMessage).assertEqual('Connection failed');
      expect(record.details).assertEqual('Failed to connect to ');
      expect(record.operationId).assertEqual('mgr_op_2');

      const health = healthOf(manager);
      expect(health.lastError).assertEqual('Connection failed');
      expect(health.isHealthy).assertFalse();
      expect(health.healthScore).assertEqual(10);

      const service = manager.getService();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      expect(svcStats.operationHistoryCount).assertEqual(2);
      const history = service.getOperationHistory();
      expect(history.length).assertEqual(2);
      expect(history[1].operation).assertEqual('connect');
      expect(history[1].success).assertFalse();
      expect(history[1].details).assertEqual('Invalid device ID');

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_0500
     * @tc.name: testAvrcpProfile0005
     * @tc.desc: Verify that reconnecting the same device returns true without duplicate counting.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0005', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      expect(await manager.connect(DEVICE_A)).assertTrue();

      const result = await manager.connect(DEVICE_A);
      expect(result).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      expect(manager.getConnectedDeviceIds().length).assertEqual(1);
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      expect(manager.isConnected()).assertTrue();

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(1);
      expect(stats.successfulConnections).assertEqual(1);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.totalOperations).assertEqual(2);
      expect(stats.connectedDeviceCount).assertEqual(1);
      expect(stats.connectionSuccessRate).assertEqual(100);

      const records = recordsOf(manager);
      expect(records.length).assertEqual(2);
      expect(records[1].operationName).assertEqual('connect');
      expect(records[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      expect(records[1].success).assertTrue();

      const service = manager.getService();
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.connectedDeviceCount).assertEqual(1);
      expect(svcStats.operationHistoryCount).assertEqual(2);
      const svcHistory = service.getOperationHistory();
      expect(svcHistory.length).assertEqual(2);
      expect(svcHistory[1].operation).assertEqual('connect');
      expect(svcHistory[1].success).assertTrue();
      expect(svcHistory[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      expect(countString(svcDetailsOf(manager), 'Already connected')).assertEqual(0);
      expect(service.getOperationHistory() === svcHistory).assertFalse();

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_0600
     * @tc.name: testAvrcpProfile0006
     * @tc.desc: Verify that disconnect succeeds for a connected device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0006', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      expect(await manager.connect(DEVICE_A)).assertTrue();

      const result = await manager.disconnect(DEVICE_A);
      expect(result).assertTrue();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const stats = manager.getStatistics();
      expect(stats.disconnectionEvents).assertEqual(1);
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(stats.managedDeviceCount).assertEqual(0);
      expect(stats.totalConnectionAttempts).assertEqual(1);
      expect(stats.successfulConnections).assertEqual(1);
      expect(stats.failedOperations).assertEqual(0);
      expect(stats.totalOperations).assertEqual(3);

      const records = recordsOf(manager);
      expect(records.length).assertEqual(3);
      expect(records[2].operationId).assertEqual('mgr_op_3');
      expect(records[2].operationName).assertEqual('disconnect');
      expect(records[2].success).assertTrue();
      expect(records[2].errorMessage).assertEqual('');
      expect(records[2].details).assertEqual(`Disconnected from ${DEVICE_A}`);

      const service = manager.getService();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      expect(svcStats.operationHistoryCount).assertEqual(3);
      const svcHistory = service.getOperationHistory();
      expect(svcHistory.length).assertEqual(3);
      expect(svcHistory[2].operation).assertEqual('disconnect');
      expect(svcHistory[2].success).assertTrue();
      expect(svcHistory[2].details).assertEqual(`Disconnected from ${DEVICE_A}`);

      expect(await manager.disconnect(DEVICE_A)).assertFalse();
      expect(manager.getStatistics().disconnectionEvents).assertEqual(1);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_0700
     * @tc.name: testAvrcpProfile0007
     * @tc.desc: Verify that disconnect fails for a device that is not connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpProfile0007', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();

      const result = await manager.disconnect(GHOST_DEVICE);
      expect(result).assertFalse();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      const records = recordsOf(manager);
      expect(records.length).assertEqual(2);
      expect(records[1].operationId).assertEqual('mgr_op_2');
      expect(records[1].operationName).assertEqual('disconnect');
      expect(records[1].success).assertFalse();
      expect(records[1].errorMessage).assertEqual('Not managed');
      expect(records[1].details).assertEqual(`Device ${GHOST_DEVICE} not managed`);
      expect(records[1].startTime).assertEqual(records[1].endTime);

      const stats = manager.getStatistics();
      expect(stats.totalOperations).assertEqual(2);
      expect(stats.failedOperations).assertEqual(1);
      expect(stats.successfulOperations).assertEqual(1);
      expect(stats.disconnectionEvents).assertEqual(0);
      expect(stats.totalConnectionAttempts).assertEqual(0);
      expect(stats.errorRate).assertEqual(50);

      const health = healthOf(manager);
      expect(health.lastError).assertEqual('Not managed');
      expect(health.isHealthy).assertFalse();
      expect(health.managedDeviceCount).assertEqual(0);
      expect(health.queuedOperationCount).assertEqual(0);
      expect(health.retryAttempts).assertEqual(0);

      const service = manager.getService();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      expect(svcStats.operationHistoryCount).assertEqual(1);
      const svcHistory = service.getOperationHistory();
      expect(svcHistory.length).assertEqual(1);
      expect(svcHistory[0].operation).assertEqual('initialize');
      expect(svcHistory[0].details).assertEqual('Service initialized successfully');

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_0800
     * @tc.name: testAvrcpProfile0008
     * @tc.desc: Verify that getProfileType returns the expected profile type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0008', 0, async () => {
      const uninitialized = new AvrcpProfileManager();
      expect(uninitialized.getProfileType()).assertEqual(BluetoothProfileType.AVRCP);
      expect(uninitialized.getProfileType()).assertEqual(PROFILE_ID);
      expect(typeof uninitialized.getProfileType()).assertEqual('string');
      expect(uninitialized.getProfileType().toUpperCase()).assertEqual(uninitialized.getProfileType());
      expect(uninitialized.getProfileType().length > 0).assertTrue();
      expect(uninitialized.getProfileType().indexOf(' ')).assertEqual(-1);
      expect(BluetoothProfileType.AVRCP).assertEqual(PROFILE_ID);
      expect(uninitialized.getProfileType().charCodeAt(0) >= 65
        && uninitialized.getProfileType().charCodeAt(0) <= 90).assertTrue();
      expect(typeof BluetoothProfileType.AVRCP).assertEqual('string');

      const manager = new AvrcpProfileManager();
      expect(manager.getProfileType() === uninitialized.getProfileType()).assertTrue();
      const firstRead = manager.getProfileType();
      expect(manager.getProfileType()).assertEqual(firstRead);

      await manager.initialize();
      expect(manager.getProfileType()).assertEqual(BluetoothProfileType.AVRCP);
      await manager.connect(DEVICE_A);
      expect(manager.getProfileType()).assertEqual(PROFILE_ID);
      await manager.disconnect(DEVICE_A);
      expect(manager.getProfileType()).assertEqual(BluetoothProfileType.AVRCP);
      await manager.reset();
      expect(manager.getProfileType()).assertEqual(PROFILE_ID);
      await manager.destroy();
      expect(manager.getProfileType()).assertEqual(BluetoothProfileType.AVRCP);

      const other = new AvrcpProfileManager();
      expect(other.getProfileType()).assertEqual(manager.getProfileType());
      expect(other.getProfileType()).assertEqual(BluetoothProfileType.AVRCP);
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_0900
     * @tc.name: testAvrcpProfile0009
     * @tc.desc: Verify that getService returns a non-null service instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0009', 0, async () => {
      const manager = new AvrcpProfileManager();
      const serviceBeforeInit = manager.getService();
      expect(serviceBeforeInit !== undefined).assertTrue();
      expect(manager.getService() === serviceBeforeInit).assertTrue();
      expect(serviceBeforeInit.isConnected()).assertFalse();

      await manager.initialize();
      const service = manager.getService();
      expect(service !== undefined).assertTrue();
      expect(service === serviceBeforeInit).assertTrue();
      expect(service.getModel() === manager.getModel()).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(manager.getService() === service).assertTrue();
      expect(service.isConnected()).assertTrue();
      expect(service.getOperationHistory().length).assertEqual(2);
      expect(service.getOperationHistory()[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      expect(service.getOperationHistory()[1].operation).assertEqual('connect');

      const stats: ESObject = service.getStatistics();
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      expect(stats.isInitialized).assertTrue();
      expect(stats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(stats.connectedDeviceCount).assertEqual(1);

      await manager.destroy();
      expect(manager.getService() === service).assertTrue();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getOperationHistory().length).assertEqual(1);
      expect(service.getOperationHistory()[0].details).assertEqual('Service reset');
      expect(service.getOperationHistory()[0].operation).assertEqual('reset');
      const statsAfterDestroy: ESObject = service.getStatistics();
      expect(statsAfterDestroy.isInitialized).assertFalse();
      expect(statsAfterDestroy.connectedDeviceCount).assertEqual(0);
      expect(statsAfterDestroy.serviceName).assertEqual(SERVICE_NAME);
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_1000
     * @tc.name: testAvrcpProfile0010
     * @tc.desc: Verify that getModel returns a non-null model instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0010', 0, async () => {
      const manager = new AvrcpProfileManager();
      const modelBeforeInit = manager.getModel();
      expect(modelBeforeInit !== undefined).assertTrue();
      expect(manager.getModel() === modelBeforeInit).assertTrue();

      await manager.initialize();
      const model = manager.getModel();
      expect(model !== undefined).assertTrue();
      expect(model !== modelBeforeInit).assertTrue();
      expect(model === manager.getService().getModel()).assertTrue();
      expect(manager.getModel() === model).assertTrue();

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(manager.getModel() === model).assertTrue();
      expect(manager.getService().getModel() === model).assertTrue();
      expect(typeof manager.getModel()).assertEqual('object');
      expect(manager.getModel() !== null).assertTrue();

      await manager.disconnect(DEVICE_A);
      expect(manager.getModel() === model).assertTrue();

      await manager.reset();
      const modelAfterReset = manager.getModel();
      expect(modelAfterReset !== model).assertTrue();
      expect(modelAfterReset === manager.getService().getModel()).assertTrue();

      await manager.destroy();
      const modelAfterDestroy = manager.getModel();
      expect(modelAfterDestroy !== modelAfterReset).assertTrue();
      expect(modelAfterDestroy === manager.getService().getModel()).assertTrue();
      expect(manager.isConnected()).assertFalse();

      await manager.initialize();
      const modelAfterReinit = manager.getModel();
      expect(modelAfterReinit !== modelAfterDestroy).assertTrue();
      expect(modelAfterReinit === manager.getService().getModel()).assertTrue();
      expect(manager.getModel() === modelAfterReinit).assertTrue();
      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_1100
     * @tc.name: testAvrcpProfile0011
     * @tc.desc: Verify that getConnectedDeviceIds returns an empty array when no device is connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0011', 0, async () => {
      const manager = new AvrcpProfileManager();
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      await manager.initialize();

      const ids = manager.getConnectedDeviceIds();
      expect(ids.length).assertEqual(0);
      expect(Array.isArray(ids)).assertTrue();
      expect(manager.getConnectedDeviceIds() !== ids).assertTrue();
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      ids.push(DEVICE_A);
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.isConnected()).assertFalse();

      const stats = manager.getStatistics();
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(stats.managedDeviceCount).assertEqual(0);
      expect(stats.totalConnectionAttempts).assertEqual(0);
      expect(healthOf(manager).managedDeviceCount).assertEqual(0);
      expect(manager.getService().getOperationHistory().length).assertEqual(1);
      expect(manager.getService().isConnected()).assertFalse();

      await manager.destroy();
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      expect(manager.getConnectedDeviceIds()[0] === undefined).assertTrue();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_1200
     * @tc.name: testAvrcpProfile0012
     * @tc.desc: Verify that getConnectedDeviceIds contains the connected device ID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0012', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();

      expect(await manager.connect(DEVICE_A)).assertTrue();
      const single = manager.getConnectedDeviceIds();
      expect(single.length).assertEqual(1);
      expect(single[0]).assertEqual(DEVICE_A);
      expect(single.indexOf(DEVICE_B)).assertEqual(-1);

      expect(await manager.connect(DEVICE_B)).assertTrue();
      const pair = manager.getConnectedDeviceIds();
      expect(pair.length).assertEqual(2);
      expect(pair[0]).assertEqual(DEVICE_A);
      expect(pair[1]).assertEqual(DEVICE_B);
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      expect(manager.isConnected()).assertTrue();

      const stats = manager.getStatistics();
      expect(stats.connectedDeviceCount).assertEqual(2);
      expect(stats.managedDeviceCount).assertEqual(2);
      expect(stats.successfulConnections).assertEqual(2);
      expect(stats.totalConnectionAttempts).assertEqual(2);
      expect(healthOf(manager).managedDeviceCount).assertEqual(2);

      pair.push(DEVICE_C);
      expect(manager.getConnectedDeviceIds().length).assertEqual(2);
      expect(manager.getConnectedDeviceIds() !== pair).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(2);

      const serviceStats: ESObject = manager.getService().getStatistics();
      expect(serviceStats.connectedDeviceCount).assertEqual(2);
      expect(serviceStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(serviceStats.operationHistoryCount).assertEqual(3);
      expect(manager.getService().getOperationHistory()[2].details).assertEqual(`Connected to ${DEVICE_B}`);

      await manager.destroy();
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_1300
     * @tc.name: testAvrcpProfile0013
     * @tc.desc: Verify that getManagedDeviceCount increases after a device is connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0013', 0, async () => {
      const manager = new AvrcpProfileManager();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      await manager.initialize();
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      expect(manager.getConnectedDeviceIds().length).assertEqual(1);
      expect(manager.getStatistics().managedDeviceCount).assertEqual(1);

      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(2);

      expect(await manager.connect(DEVICE_C)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(3);
      expect(manager.getConnectedDeviceIds().length).assertEqual(3);
      expect(manager.isConnected()).assertTrue();

      const stats = manager.getStatistics();
      expect(stats.managedDeviceCount).assertEqual(3);
      expect(stats.connectedDeviceCount).assertEqual(3);
      expect(stats.totalConnectionAttempts).assertEqual(3);
      expect(stats.successfulConnections).assertEqual(3);
      expect(stats.totalOperations).assertEqual(4);
      expect(healthOf(manager).managedDeviceCount).assertEqual(3);

      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      expect(manager.getConnectedDeviceIds()[1]).assertEqual(DEVICE_C);

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(await manager.disconnect(DEVICE_C)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.isConnected()).assertFalse();
      expect(manager.getStatistics().connectedDeviceCount).assertEqual(0);
      expect(manager.getStatistics().disconnectionEvents).assertEqual(3);

      await manager.destroy();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_1400
     * @tc.name: testAvrcpProfile0014
     * @tc.desc: Verify that setConfig updates the connection timeout configuration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0014', 0, async () => {
      const manager = new AvrcpProfileManager();
      const initial = manager.getConfig();
      expect(initial.connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT);
      expect(initial.operationTimeoutMs).assertEqual(DEFAULT_OPERATION_TIMEOUT);
      expect(initial.maxRetryAttempts).assertEqual(DEFAULT_MAX_RETRY);
      expect(initial.retryDelayMs).assertEqual(DEFAULT_RETRY_DELAY);
      expect(initial.useExponentialBackoff).assertTrue();
      expect(initial.maxBackoffDelayMs).assertEqual(DEFAULT_MAX_BACKOFF);
      expect(initial.autoReconnect).assertTrue();
      expect(initial.maxAutoReconnectAttempts).assertEqual(DEFAULT_AUTO_RECONNECT_ATTEMPTS);
      expect(initial.autoReconnectDelayMs).assertEqual(DEFAULT_AUTO_RECONNECT_DELAY);
      expect(initial.maxQueueSize).assertEqual(MAX_QUEUE_SIZE);
      expect(initial.maxManagedDevices).assertEqual(DEFAULT_MAX_MANAGED_DEVICES);
      expect(initial.verboseLogging).assertFalse();
      expect(initial.enablePerformanceTracing).assertTrue();
      expect(initial.healthCheckIntervalMs).assertEqual(60000);
      expect(initial.minHealthScoreThreshold).assertEqual(DEFAULT_HEALTH_THRESHOLD);

      await manager.initialize();
      manager.setConfig({ connectionTimeoutMs: 5000 });
      const updated = manager.getConfig();
      expect(updated.connectionTimeoutMs).assertEqual(5000);
      expect(updated.operationTimeoutMs).assertEqual(DEFAULT_OPERATION_TIMEOUT);
      expect(updated.maxRetryAttempts).assertEqual(DEFAULT_MAX_RETRY);
      expect(updated.maxManagedDevices).assertEqual(DEFAULT_MAX_MANAGED_DEVICES);
      expect(updated.minHealthScoreThreshold).assertEqual(DEFAULT_HEALTH_THRESHOLD);
      expect(manager.getConfig() !== updated).assertTrue();

      updated.connectionTimeoutMs = 1;
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(5000);
      expect(recordsOf(manager).length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      const svc = manager.getService();
      const svcHistoryBefore = svc.getOperationHistory().length;
      expect(svcHistoryBefore).assertEqual(1);
      expect(svc.isConnected()).assertFalse();
      expect(svc.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats0: ESObject = svc.getStatistics();
      expect(svcStats0.operationHistoryCount).assertEqual(1);
      expect(svcStats0.connectedDeviceCount).assertEqual(0);

      manager.setConfig({});
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(5000);
      expect(manager.getConfig().maxQueueSize).assertEqual(MAX_QUEUE_SIZE);
      expect(svc.getOperationHistory().length).assertEqual(svcHistoryBefore);
      expect(svc.getOperationHistory()[0].operation).assertEqual('initialize');

      await manager.destroy();
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(5000);
      expect(manager.getConfig().enablePerformanceTracing).assertTrue();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_1500
     * @tc.name: testAvrcpProfile0015
     * @tc.desc: Verify that getStatistics returns a non-null statistics object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0015', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();

      const stats = manager.getStatistics();
      expect(stats !== undefined).assertTrue();
      expect(manager.getStatistics() !== stats).assertTrue();
      expect(stats.totalConnectionAttempts).assertEqual(0);
      expect(stats.successfulConnections).assertEqual(0);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.disconnectionEvents).assertEqual(0);
      expect(stats.totalOperations).assertEqual(1);
      expect(stats.successfulOperations).assertEqual(1);
      expect(stats.failedOperations).assertEqual(0);
      expect(stats.averageOperationDurationMs).assertEqual(0);
      expect(stats.maxOperationDurationMs).assertEqual(0);
      expect(stats.minOperationDurationMs).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(stats.connectionSuccessRate).assertEqual(0);
      expect(stats.operationSuccessRate).assertEqual(100);
      expect(stats.uptimeMs < 60000).assertTrue();
      expect(stats.lastConnectionEvent).assertEqual(0);
      expect(stats.lastOperationTime).assertEqual(recordsOf(manager)[0].endTime);
      expect(stats.managedDeviceCount).assertEqual(0);
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(stats.queuedOperationCount).assertEqual(0);
      expect(stats.retryAttempts).assertEqual(0);
      expect(stats.autoReconnectEvents).assertEqual(0);
      expect(stats.errorRate).assertEqual(0);
      expect(stats.isHealthy).assertTrue();
      expect(stats.healthScore).assertEqual(60);

      stats.totalOperations = 99;
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      expect(manager.getOperationRecords().length).assertEqual(1);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_1600
     * @tc.name: testAvrcpProfile0016
     * @tc.desc: Verify that getOperationRecords returns an array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0016', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();

      const records = manager.getOperationRecords();
      expect(Array.isArray(records)).assertTrue();
      expect(records.length).assertEqual(1);
      expect(manager.getOperationRecords() !== records).assertTrue();
      records.push(records[0]);
      expect(manager.getOperationRecords().length).assertEqual(1);

      let accepted = 0;
      for (let i = 0; i < 600; i++) {
        if (await manager.disconnect(`${GHOST_PREFIX}${i}`)) {
          accepted++;
        }
      }
      expect(accepted).assertEqual(0);

      const capped = recordsOf(manager);
      expect(capped.length).assertEqual(MAX_RECORD_SIZE);
      expect(capped[0].operationId).assertEqual('mgr_op_102');
      expect(capped[499].operationId).assertEqual('mgr_op_601');
      expect(capped[0].operationName).assertEqual('disconnect');
      expect(capped[0].success).assertFalse();
      expect(capped[0].errorMessage).assertEqual('Not managed');
      expect(capped[0].details).assertEqual(`Device ${GHOST_PREFIX}100 not managed`);
      expect(capped[499].details).assertEqual(`Device ${GHOST_PREFIX}599 not managed`);
      expect(capped[0].startTime).assertEqual(capped[0].endTime);
      expect(capped[0].durationMs).assertEqual(0);

      const stats = manager.getStatistics();
      expect(stats.totalOperations).assertEqual(601);
      expect(stats.successfulOperations).assertEqual(1);
      expect(stats.failedOperations).assertEqual(600);
      expect(stats.errorRate > 99).assertTrue();
      expect(stats.queuedOperationCount).assertEqual(0);
      expect(stats.lastOperationTime).assertEqual(capped[499].endTime);

      const health = healthOf(manager);
      expect(health.lastError).assertEqual('Not managed');
      expect(health.isHealthy).assertFalse();
      expect(health.queuedOperationCount).assertEqual(0);
      expect(health.retryAttempts).assertEqual(0);
      expect(health.healthScore).assertEqual(10);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_1700
     * @tc.name: testAvrcpProfile0017
     * @tc.desc: Verify that the statistics health score is greater than zero.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0017', 0, async () => {
      const manager = new AvrcpProfileManager();
      const rawFirst: ESObject = manager.getHealthStatus();
      const rawSecond: ESObject = manager.getHealthStatus();
      expect(rawFirst !== undefined).assertTrue();
      expect(rawFirst !== rawSecond).assertTrue();
      expect(rawFirst.healthScore).assertEqual(60);
      expect(rawFirst.healthScore !== DEFAULT_HEALTH_SCORE_INIT).assertTrue();
      expect(rawFirst.isHealthy).assertTrue();
      expect(rawFirst.uptimeMs).assertEqual(0);
      expect(rawFirst.connectionSuccessRate).assertEqual(0);
      expect(rawFirst.errorRate).assertEqual(0);
      expect(rawFirst.lastError).assertEqual('');

      await manager.initialize();
      const health = healthOf(manager);
      expect(health.healthScore).assertEqual(60);
      expect(health.healthScore > 0).assertTrue();
      expect(health.healthScore < DEFAULT_HEALTH_SCORE_INIT).assertTrue();
      expect(health.isHealthy).assertTrue();
      expect(health.uptimeMs < 60000).assertTrue();
      expect(health.connectionSuccessRate).assertEqual(0);
      expect(health.operationSuccessRate).assertEqual(100);
      expect(health.errorRate).assertEqual(0);
      expect(health.managedDeviceCount).assertEqual(0);
      expect(health.queuedOperationCount).assertEqual(0);
      expect(health.retryAttempts).assertEqual(0);
      expect(health.lastError).assertEqual('');

      expect(manager.getHealthStatus() !== undefined).assertTrue();
      const stats = manager.getStatistics();
      expect(stats.healthScore).assertEqual(health.healthScore);
      expect(stats.isHealthy).assertEqual(health.isHealthy);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_1800
     * @tc.name: testAvrcpProfile0018
     * @tc.desc: Verify that a removed state callback is not invoked.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0018', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      const states: string[] = [];
      const onState = (state: BluetoothConnectionState) => {
        states.push(state);
      };

      manager.addStateCallback(onState);
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(states.length).assertEqual(0);
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(states.length).assertEqual(0);

      const svcHistory = manager.getService().getOperationHistory();
      expect(svcHistory.length).assertEqual(3);
      expect(svcHistory[1].operation).assertEqual('connect');
      expect(svcHistory[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      expect(svcHistory[2].operation).assertEqual('disconnect');
      expect(svcHistory[2].details).assertEqual(`Disconnected from ${DEVICE_A}`);
      expect(manager.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      manager.removeStateCallback(onState);
      manager.removeStateCallback(onState);
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(states.length).assertEqual(0);
      expect(manager.getConnectedDeviceIds().length).assertEqual(1);

      const serviceStates: string[] = [];
      const onServiceState = (state: BluetoothConnectionState) => {
        serviceStates.push(state);
      };
      manager.getService().addConnectionCallback(onServiceState);
      expect(await manager.connect(DEVICE_C)).assertTrue();
      expect(countString(serviceStates, BluetoothConnectionState.CONNECTED)).assertEqual(1);
      expect(serviceStates[serviceStates.length - 1]).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(states.length).assertEqual(0);
      manager.getService().removeConnectionCallback(onServiceState);

      await manager.destroy();
      manager.addStateCallback(onState);
      expect(await manager.connect(DEVICE_C)).assertFalse();
      expect(states.length).assertEqual(0);
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_1900
     * @tc.name: testAvrcpProfile0019
     * @tc.desc: Verify that data callback registration and removal work correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0019', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      const service = manager.getService();

      const managerModels: AvrcpModel[] = [];
      const onManagerData = (model: AvrcpModel) => {
        managerModels.push(model);
      };
      const serviceModels: AvrcpModel[] = [];
      const onServiceData = (model: AvrcpModel) => {
        serviceModels.push(model);
      };

      manager.addDataCallback(onManagerData);
      manager.addDataCallback(onManagerData);
      service.addDataCallback(onServiceData);
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(managerModels.length).assertEqual(0);
      expect(serviceModels.length).assertEqual(1);
      expect(serviceModels[0] === service.getModel()).assertTrue();

      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(managerModels.length).assertEqual(0);
      expect(serviceModels.length).assertEqual(2);
      expect(serviceModels[1] === serviceModels[0]).assertTrue();

      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      expect(managerModels.length).assertEqual(0);
      expect(serviceModels.length).assertEqual(3);
      expect(service.getOperationHistory().length).assertEqual(4);
      expect(service.getOperationHistory()[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      expect(service.getOperationHistory()[3].operation).assertEqual('disconnect');
      expect(service.getOperationHistory()[3].details).assertEqual(`Disconnected from ${DEVICE_B}`);

      expect(manager.getOperationRecords().length).assertEqual(4);
      expect(recordAt(manager, 1).details).assertEqual(`Connected to ${DEVICE_A}`);

      manager.removeDataCallback(onManagerData);
      service.removeDataCallback(onServiceData);
      expect(await manager.connect(DEVICE_C)).assertTrue();
      expect(managerModels.length).assertEqual(0);
      expect(serviceModels.length).assertEqual(3);
      expect(service.getOperationHistory().length).assertEqual(5);
      expect(service.getOperationHistory()[4].success).assertTrue();
      const svcStatsNow: ESObject = service.getStatistics();
      expect(svcStatsNow.connectedDeviceCount).assertEqual(2);
      expect(svcStatsNow.operationHistoryCount).assertEqual(5);

      await manager.destroy();
      manager.addDataCallback(onManagerData);
      expect(managerModels.length).assertEqual(0);
      expect(serviceModels.length).assertEqual(3);
      expect(manager.isConnected()).assertFalse();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_2000
     * @tc.name: testAvrcpProfile0020
     * @tc.desc: Verify that reset clears connections and resets state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0020', 0, async () => {
      const manager = new AvrcpProfileManager();
      const configBefore = manager.getConfig();
      await manager.initialize();
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(manager.getOperationRecords().length).assertEqual(3);

      await manager.reset();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(1);
      expect(records[0].operationId).assertEqual('mgr_op_6');
      expect(records[0].operationName).assertEqual('reset');
      expect(records[0].success).assertTrue();
      expect(records[0].errorMessage).assertEqual('');
      expect(records[0].details).assertEqual('Manager reset');

      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.isConnected()).assertFalse();

      const stats = manager.getStatistics();
      expect(stats.totalOperations).assertEqual(6);
      expect(stats.successfulOperations).assertEqual(6);
      expect(stats.failedOperations).assertEqual(0);
      expect(stats.totalConnectionAttempts).assertEqual(2);
      expect(stats.successfulConnections).assertEqual(2);
      expect(stats.disconnectionEvents).assertEqual(2);
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(stats.managedDeviceCount).assertEqual(0);
      expect(stats.errorRate).assertEqual(0);
      expect(healthOf(manager).lastError).assertEqual('');

      const service = manager.getService();
      expect(service.isConnected()).assertFalse();
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      expect(svcStats.operationHistoryCount).assertEqual(1);
      expect(svcStats.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getOperationHistory().length).assertEqual(1);
      expect(service.getOperationHistory()[0].details).assertEqual('Service reset');
      expect(service.getModel() === manager.getModel()).assertTrue();

      expect(manager.getConfig() !== configBefore).assertTrue();
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(configBefore.connectionTimeoutMs);

      expect(await manager.connect(DEVICE_C)).assertTrue();
      expect(recordAt(manager, 1).operationId).assertEqual('mgr_op_7');
      expect(manager.getManagedDeviceCount()).assertEqual(1);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_2100
     * @tc.name: testAvrcpProfile0021
     * @tc.desc: Verify that destroy releases resources and disconnects devices.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0021', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      expect(await manager.connect(DEVICE_A)).assertTrue();

      await manager.destroy();

      const afterDestroy = recordsOf(manager);
      expect(afterDestroy.length).assertEqual(1);
      expect(afterDestroy[0].operationId).assertEqual('mgr_op_4');
      expect(afterDestroy[0].operationName).assertEqual('reset');
      expect(manager.isConnected()).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const service = manager.getService();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      expect(svcStats.isInitialized).assertFalse();
      expect(svcStats.operationHistoryCount).assertEqual(1);
      expect(svcStats.serviceName).assertEqual(SERVICE_NAME);
      expect(service.getOperationHistory().length).assertEqual(1);

      const statsAfterDestroy = manager.getStatistics();
      expect(statsAfterDestroy.totalOperations).assertEqual(4);
      expect(statsAfterDestroy.totalConnectionAttempts).assertEqual(1);
      expect(statsAfterDestroy.successfulConnections).assertEqual(1);
      expect(statsAfterDestroy.disconnectionEvents).assertEqual(1);
      expect(statsAfterDestroy.failedOperations).assertEqual(0);

      expect(await manager.connect(DEVICE_B)).assertFalse();
      expect(await manager.disconnect(DEVICE_B)).assertFalse();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(3);
      expect(records[1].operationName).assertEqual('connect');
      expect(records[1].errorMessage).assertEqual('Not ready');
      expect(records[1].details).assertEqual('Manager not initialized');
      expect(records[1].success).assertFalse();
      expect(records[2].operationName).assertEqual('disconnect');
      expect(records[2].operationId).assertEqual('mgr_op_6');

      const stats = manager.getStatistics();
      expect(stats.totalOperations).assertEqual(6);
      expect(stats.failedOperations).assertEqual(2);
      expect(stats.totalConnectionAttempts).assertEqual(1);
      expect(stats.failedConnections).assertEqual(0);
      expect(Math.floor(stats.errorRate)).assertEqual(33);
      expect(healthOf(manager).lastError).assertEqual('Not ready');
      expect(healthOf(manager).healthScore).assertEqual(50);
      expect(healthOf(manager).isHealthy).assertTrue();

      expect(await manager.initialize()).assertTrue();
      const recovered = manager.getStatistics();
      expect(recovered.totalOperations).assertEqual(1);
      expect(recovered.totalConnectionAttempts).assertEqual(0);
      expect(recovered.disconnectionEvents).assertEqual(0);
      expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_1');
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(manager.isConnected()).assertTrue();

      await manager.destroy();
      expect(manager.isConnected()).assertFalse();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_2200
     * @tc.name: testAvrcpProfile0022
     * @tc.desc: Verify that multiple devices can be connected simultaneously.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0022', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      manager.setConfig({ maxManagedDevices: 3 });
      expect(manager.getConfig().maxManagedDevices).assertEqual(3);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(await manager.connect(DEVICE_C)).assertTrue();

      const ids = manager.getConnectedDeviceIds();
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(DEVICE_A);
      expect(ids[1]).assertEqual(DEVICE_B);
      expect(ids[2]).assertEqual(DEVICE_C);
      expect(manager.getManagedDeviceCount()).assertEqual(3);
      expect(manager.isConnected()).assertTrue();

      expect(await manager.connect(GHOST_DEVICE)).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(3);
      expect(manager.getConnectedDeviceIds().length).assertEqual(3);

      const record = lastRecord(manager);
      expect(record.operationName).assertEqual('connect');
      expect(record.success).assertFalse();
      expect(record.errorMessage).assertEqual('Max devices');
      expect(record.details).assertEqual('Maximum managed devices reached');
      expect(record.operationId).assertEqual('mgr_op_5');

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(3);
      expect(stats.successfulConnections).assertEqual(3);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.connectedDeviceCount).assertEqual(3);
      expect(stats.managedDeviceCount).assertEqual(3);
      expect(stats.totalOperations).assertEqual(5);
      expect(stats.failedOperations).assertEqual(1);
      expect(stats.errorRate).assertEqual(20);
      expect(stats.connectionSuccessRate).assertEqual(100);

      const service = manager.getService();
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.connectedDeviceCount).assertEqual(3);
      expect(svcStats.operationHistoryCount).assertEqual(4);
      expect(svcStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      const svcHistory = service.getOperationHistory();
      expect(svcHistory.length).assertEqual(4);
      expect(svcHistory[3].details).assertEqual(`Connected to ${DEVICE_C}`);
      expect(service.isConnected()).assertTrue();
      expect(healthOf(manager).managedDeviceCount).assertEqual(3);

      manager.setConfig({ maxManagedDevices: DEFAULT_MAX_MANAGED_DEVICES });
      expect(manager.getConfig().maxManagedDevices).assertEqual(DEFAULT_MAX_MANAGED_DEVICES);
      expect(await manager.connect(GHOST_DEVICE)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(4);
      expect(manager.getService().getOperationHistory().length).assertEqual(5);

      await manager.destroy();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_2300
     * @tc.name: testAvrcpProfile0023
     * @tc.desc: Verify that the service connection state is CONNECTED after connecting.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0023', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      const service = manager.getService();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.isConnected()).assertFalse();
      expect(manager.isConnected()).assertFalse();
      const initStats: ESObject = service.getStatistics();
      expect(initStats.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(initStats.connectedDeviceCount).assertEqual(0);
      expect(initStats.operationHistoryCount).assertEqual(1);
      expect(initStats.serviceName).assertEqual(SERVICE_NAME);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(service.isConnected()).assertTrue();
      expect(manager.isConnected()).assertTrue();

      const history = service.getOperationHistory();
      expect(history.length).assertEqual(2);
      expect(history[0].operation).assertEqual('initialize');
      expect(history[0].success).assertTrue();
      expect(history[0].details).assertEqual('Service initialized successfully');
      expect(history[1].operation).assertEqual('connect');
      expect(history[1].success).assertTrue();
      expect(history[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      expect(history[0].timestamp <= history[1].timestamp).assertTrue();

      const connectedStats: ESObject = service.getStatistics();
      expect(connectedStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(connectedStats.connectedDeviceCount).assertEqual(1);
      expect(connectedStats.operationHistoryCount).assertEqual(2);
      expect(connectedStats.isInitialized).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.isConnected()).assertFalse();
      expect(manager.isConnected()).assertFalse();
      expect(service.getOperationHistory().length).assertEqual(3);
      expect(service.getOperationHistory()[2].operation).assertEqual('disconnect');
      expect(service.getOperationHistory()[2].details).assertEqual(`Disconnected from ${DEVICE_A}`);

      await manager.destroy();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_2400
     * @tc.name: testAvrcpProfile0024
     * @tc.desc: Verify that statistics are updated when a device is connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0024', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      const before = manager.getStatistics();
      expect(before.totalConnectionAttempts).assertEqual(0);
      expect(before.successfulConnections).assertEqual(0);
      expect(before.lastConnectionEvent).assertEqual(0);
      expect(before.connectedDeviceCount).assertEqual(0);
      expect(before.healthScore).assertEqual(60);
      expect(before.connectionSuccessRate).assertEqual(0);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      const after = manager.getStatistics();
      expect(after.totalConnectionAttempts).assertEqual(before.totalConnectionAttempts + 1);
      expect(after.successfulConnections).assertEqual(1);
      expect(after.failedConnections).assertEqual(0);
      expect(after.connectedDeviceCount).assertEqual(1);
      expect(after.managedDeviceCount).assertEqual(1);
      expect(after.connectionSuccessRate).assertEqual(100);
      expect(after.totalOperations).assertEqual(2);
      expect(after.successfulOperations).assertEqual(2);
      expect(after.operationSuccessRate).assertEqual(100);
      expect(after.errorRate).assertEqual(0);
      expect(after.healthScore).assertEqual(100);
      expect(after.isHealthy).assertTrue();
      expect(after.lastConnectionEvent > 0).assertTrue();
      expect(after.lastOperationTime > 0).assertTrue();
      expect(after.uptimeMs > 0).assertTrue();
      expect(after.operationsPerMinute > 0).assertTrue();
      expect(after.queuedOperationCount).assertEqual(0);
      expect(after.retryAttempts).assertEqual(0);
      expect(after.autoReconnectEvents).assertEqual(0);
      expect(after.lastOperationTime).assertEqual(recordAt(manager, 1).endTime);

      await manager.destroy();
      expect(manager.getStatistics().totalConnectionAttempts).assertEqual(1);
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_2500
     * @tc.name: testAvrcpProfile0025
     * @tc.desc: Verify that statistics are updated when a device is disconnected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0025', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(await manager.connect(DEVICE_B)).assertTrue();

      const before = manager.getStatistics();
      expect(before.totalConnectionAttempts).assertEqual(2);
      expect(before.successfulConnections).assertEqual(2);
      expect(before.disconnectionEvents).assertEqual(0);
      expect(before.connectedDeviceCount).assertEqual(2);
      expect(before.totalOperations).assertEqual(3);
      expect(before.healthScore).assertEqual(100);

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      const after = manager.getStatistics();
      expect(after.disconnectionEvents).assertEqual(1);
      expect(after.connectedDeviceCount).assertEqual(1);
      expect(after.managedDeviceCount).assertEqual(1);
      expect(after.totalConnectionAttempts).assertEqual(2);
      expect(after.successfulConnections).assertEqual(2);
      expect(after.failedConnections).assertEqual(0);
      expect(after.totalOperations).assertEqual(4);
      expect(after.successfulOperations).assertEqual(4);
      expect(after.failedOperations).assertEqual(0);
      expect(after.errorRate).assertEqual(0);
      expect(after.connectionSuccessRate).assertEqual(100);
      expect(after.healthScore).assertEqual(100);
      expect(after.isHealthy).assertTrue();
      expect(after.lastOperationTime).assertEqual(recordAt(manager, 3).endTime);
      expect(after.uptimeMs > 0).assertTrue();

      const service = manager.getService();
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.operationHistoryCount).assertEqual(4);
      expect(svcStats.connectedDeviceCount).assertEqual(1);
      expect(svcStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      const svcHistory = service.getOperationHistory();
      expect(svcHistory.length).assertEqual(4);
      expect(svcHistory[3].operation).assertEqual('disconnect');
      expect(svcHistory[3].success).assertTrue();
      expect(svcHistory[3].details).assertEqual(`Disconnected from ${DEVICE_A}`);

      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      const final = manager.getStatistics();
      expect(final.disconnectionEvents).assertEqual(2);
      expect(final.connectedDeviceCount).assertEqual(0);
      expect(final.totalOperations).assertEqual(5);
      expect(manager.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getOperationHistory().length).assertEqual(5);
      expect(service.getOperationHistory()[4].details).assertEqual(`Disconnected from ${DEVICE_B}`);
      const statsAfterAll: ESObject = service.getStatistics();
      expect(statsAfterAll.connectedDeviceCount).assertEqual(0);
      expect(statsAfterAll.operationHistoryCount).assertEqual(5);
      expect(statsAfterAll.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_2600
     * @tc.name: testAvrcpProfile0026
     * @tc.desc: Verify that the health score is calculated as expected after operations.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0026', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();

      const fresh = healthOf(manager);
      expect(fresh.healthScore).assertEqual(60);
      expect(fresh.isHealthy).assertTrue();
      expect(fresh.errorRate).assertEqual(0);
      expect(fresh.connectionSuccessRate).assertEqual(0);
      expect(fresh.lastError).assertEqual('');

      expect(await manager.disconnect(GHOST_DEVICE)).assertFalse();
      const afterFailure = healthOf(manager);
      expect(afterFailure.errorRate).assertEqual(50);
      expect(afterFailure.healthScore).assertEqual(10);
      expect(afterFailure.isHealthy).assertFalse();
      expect(afterFailure.lastError).assertEqual('Not managed');
      expect(afterFailure.connectionSuccessRate).assertEqual(0);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      const afterSuccess = healthOf(manager);
      expect(afterSuccess.connectionSuccessRate).assertEqual(100);
      expect(afterSuccess.errorRate > 30 && afterSuccess.errorRate < 34).assertTrue();
      expect(afterSuccess.healthScore).assertEqual(50);
      expect(afterSuccess.isHealthy).assertTrue();
      expect(afterSuccess.lastError).assertEqual('Not managed');

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      const afterClean = healthOf(manager);
      expect(afterClean.errorRate).assertEqual(25);
      expect(afterClean.healthScore).assertEqual(70);
      expect(afterClean.isHealthy).assertTrue();
      expect(afterClean.lastError).assertEqual('Not managed');
      expect(afterClean.connectionSuccessRate).assertEqual(100);

      const stats = manager.getStatistics();
      expect(stats.totalOperations).assertEqual(4);
      expect(stats.failedOperations).assertEqual(1);
      expect(stats.successfulOperations).assertEqual(3);
      expect(stats.healthScore).assertEqual(afterClean.healthScore);
      expect(stats.isHealthy).assertEqual(afterClean.isHealthy);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_2700
     * @tc.name: testAvrcpProfile0027
     * @tc.desc: Verify that operations are recorded in the operation records.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0027', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(await manager.disconnect(GHOST_DEVICE)).assertFalse();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(4);
      expect(manager.getOperationRecords() !== manager.getOperationRecords()).assertTrue();

      const expectedNames: string[] = ['initialize', 'connect', 'disconnect', 'disconnect'];
      const expectedIds: string[] = ['mgr_op_1', 'mgr_op_2', 'mgr_op_3', 'mgr_op_4'];
      const expectedDetails: string[] = ['Manager initialized', `Connected to ${DEVICE_A}`,
        `Disconnected from ${DEVICE_A}`, `Device ${GHOST_DEVICE} not managed`];
      for (let i = 0; i < records.length; i++) {
        expect(records[i].operationId).assertEqual(expectedIds[i]);
        expect(records[i].operationName).assertEqual(expectedNames[i]);
        expect(records[i].details).assertEqual(expectedDetails[i]);
        expect(records[i].startTime).assertEqual(records[i].endTime);
        expect(records[i].durationMs).assertEqual(0);
        expect(records[i].success).assertEqual(i !== 3);
      }

      expect(records[3].errorMessage).assertEqual('Not managed');
      expect(records[0].errorMessage).assertEqual('');
      expect(records[1].errorMessage).assertEqual('');
      expect(records[2].errorMessage).assertEqual('');

      const stats = manager.getStatistics();
      expect(stats.totalOperations).assertEqual(4);
      expect(stats.successfulOperations).assertEqual(3);
      expect(stats.failedOperations).assertEqual(1);
      expect(stats.errorRate).assertEqual(25);
      expect(stats.averageOperationDurationMs).assertEqual(0);
      expect(stats.maxOperationDurationMs).assertEqual(0);
      expect(stats.minOperationDurationMs).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(stats.lastOperationTime).assertEqual(records[3].endTime);

      await manager.destroy();
      expect(recordAt(manager, 0).operationName).assertEqual('reset');
      expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_5');
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_2800
     * @tc.name: testAvrcpProfile0028
     * @tc.desc: Verify that configuration changes persist across reads.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0028', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      manager.setConfig({
        maxRetryAttempts: 7,
        verboseLogging: true,
        autoReconnect: false,
        maxManagedDevices: 3,
        healthCheckIntervalMs: 1234
      });

      const changed = manager.getConfig();
      expect(changed.maxRetryAttempts).assertEqual(7);
      expect(changed.verboseLogging).assertTrue();
      expect(changed.autoReconnect).assertFalse();
      expect(changed.maxManagedDevices).assertEqual(3);
      expect(changed.healthCheckIntervalMs).assertEqual(1234);
      expect(changed.connectionTimeoutMs).assertEqual(DEFAULT_CONNECTION_TIMEOUT);
      expect(changed.operationTimeoutMs).assertEqual(DEFAULT_OPERATION_TIMEOUT);
      expect(changed.retryDelayMs).assertEqual(DEFAULT_RETRY_DELAY);
      expect(changed.useExponentialBackoff).assertTrue();
      expect(changed.maxBackoffDelayMs).assertEqual(DEFAULT_MAX_BACKOFF);
      expect(changed.maxAutoReconnectAttempts).assertEqual(DEFAULT_AUTO_RECONNECT_ATTEMPTS);
      expect(changed.autoReconnectDelayMs).assertEqual(DEFAULT_AUTO_RECONNECT_DELAY);
      expect(changed.maxQueueSize).assertEqual(MAX_QUEUE_SIZE);
      expect(changed.enablePerformanceTracing).assertTrue();
      expect(changed.minHealthScoreThreshold).assertEqual(DEFAULT_HEALTH_THRESHOLD);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(manager.getConfig().maxRetryAttempts).assertEqual(7);
      expect(manager.getConfig().autoReconnect).assertFalse();
      expect(manager.getConfig().verboseLogging).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      await manager.reset();
      expect(manager.getConfig().maxManagedDevices).assertEqual(3);
      expect(manager.getConfig().healthCheckIntervalMs).assertEqual(1234);

      const copy = manager.getConfig();
      copy.maxRetryAttempts = 99;
      copy.autoReconnect = true;
      expect(manager.getConfig().maxRetryAttempts).assertEqual(7);
      expect(manager.getConfig().autoReconnect).assertFalse();

      manager.setConfig({ operationTimeoutMs: 2222 });
      expect(manager.getConfig().operationTimeoutMs).assertEqual(2222);
      expect(manager.getConfig().maxRetryAttempts).assertEqual(7);
      expect(manager.getConfig().healthCheckIntervalMs).assertEqual(1234);

      await manager.destroy();
      expect(manager.getConfig().operationTimeoutMs).assertEqual(2222);
      expect(manager.getConfig().maxManagedDevices).assertEqual(3);
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_2900
     * @tc.name: testAvrcpProfile0029
     * @tc.desc: Verify that repeated callback registration and removal behave correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpProfile0029', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      const service = manager.getService();

      const states: string[] = [];
      const models: AvrcpModel[] = [];
      const onState = (state: BluetoothConnectionState) => {
        states.push(state);
      };
      const onData = (model: AvrcpModel) => {
        models.push(model);
      };

      manager.addStateCallback(onState);
      manager.addStateCallback(onState);
      manager.addStateCallback(onState);
      manager.addDataCallback(onData);
      manager.addDataCallback(onData);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(states.length).assertEqual(0);
      expect(models.length).assertEqual(0);
      const svcHistory = service.getOperationHistory();
      expect(svcHistory.length).assertEqual(4);
      expect(svcHistory[1].details).assertEqual(`Connected to ${DEVICE_A}`);
      expect(svcHistory[2].details).assertEqual(`Disconnected from ${DEVICE_A}`);
      expect(svcHistory[3].details).assertEqual(`Connected to ${DEVICE_B}`);
      expect(svcHistory[2].success).assertTrue();

      const unknownState = (state: BluetoothConnectionState) => {
        states.push(state);
      };
      const unknownData = (model: AvrcpModel) => {
        models.push(model);
      };
      manager.removeStateCallback(unknownState);
      manager.removeDataCallback(unknownData);
      expect(states.length).assertEqual(0);
      expect(models.length).assertEqual(0);

      const serviceStates: string[] = [];
      const onServiceState = (state: BluetoothConnectionState) => {
        serviceStates.push(state);
      };
      const serviceModels: AvrcpModel[] = [];
      const onServiceData = (model: AvrcpModel) => {
        serviceModels.push(model);
      };
      service.addConnectionCallback(onServiceState);
      service.addDataCallback(onServiceData);
      expect(await manager.connect(DEVICE_C)).assertTrue();
      expect(countString(serviceStates, BluetoothConnectionState.CONNECTED)).assertEqual(1);
      expect(serviceStates[serviceStates.length - 1]).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(serviceModels.length).assertEqual(1);
      expect(serviceModels[0] === service.getModel()).assertTrue();
      expect(states.length).assertEqual(0);
      expect(models.length).assertEqual(0);
      expect(service.getOperationHistory().length).assertEqual(5);

      manager.removeStateCallback(onState);
      manager.removeStateCallback(onState);
      manager.removeDataCallback(onData);
      manager.removeDataCallback(onData);
      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      expect(await manager.disconnect(DEVICE_C)).assertTrue();
      expect(states.length).assertEqual(0);
      expect(models.length).assertEqual(0);
      expect(serviceStates[serviceStates.length - 1]).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(countString(serviceStates, BluetoothConnectionState.CONNECTED)).assertEqual(2);
      expect(countString(serviceStates, BluetoothConnectionState.DISCONNECTED)).assertEqual(1);
      expect(serviceModels.length).assertEqual(3);
      expect(service.getOperationHistory().length).assertEqual(7);
      expect(service.getOperationHistory()[6].details).assertEqual(`Disconnected from ${DEVICE_C}`);
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.operationHistoryCount).assertEqual(7);
      expect(svcStats.connectedDeviceCount).assertEqual(0);

      await manager.destroy();
      manager.addStateCallback(onState);
      manager.addDataCallback(onData);
      expect(await manager.connect(DEVICE_A)).assertFalse();
      expect(states.length).assertEqual(0);
      expect(models.length).assertEqual(0);
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_3000
     * @tc.name: testAvrcpProfile0030
     * @tc.desc: Verify that concurrent operations keep state consistent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpProfile0030', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      const prefix = 'avrcp_profile_concurrent_';

      const ids: string[] = [];
      const tasks: Array<Promise<boolean>> = [];
      for (let i = 0; i < 5; i++) {
        const id = `${prefix}${i}`;
        ids.push(id);
        tasks.push(manager.connect(id));
      }
      const results: boolean[] = await Promise.all(tasks);

      let succeeded = 0;
      for (let i = 0; i < results.length; i++) {
        if (results[i]) {
          succeeded++;
        }
      }
      expect(succeeded).assertEqual(5);
      expect(manager.getManagedDeviceCount()).assertEqual(5);
      const concurrentIds = manager.getConnectedDeviceIds();
      expect(concurrentIds.length).assertEqual(5);
      for (let i = 0; i < ids.length; i++) {
        expect(concurrentIds[i]).assertEqual(ids[i]);
      }

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(5);
      expect(stats.successfulConnections).assertEqual(5);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.connectedDeviceCount).assertEqual(5);
      expect(stats.managedDeviceCount).assertEqual(5);
      expect(stats.connectionSuccessRate).assertEqual(100);
      expect(stats.totalOperations).assertEqual(6);
      expect(stats.errorRate).assertEqual(0);
      expect(stats.healthScore).assertEqual(100);

      const service = manager.getService();
      const concurrentDetails = svcDetailsOf(manager);
      expect(concurrentDetails.length).assertEqual(6);
      expect(countString(concurrentDetails, 'Service initialized successfully')).assertEqual(1);
      for (let i = 0; i < ids.length; i++) {
        expect(countString(concurrentDetails, `Connected to ${ids[i]}`)).assertEqual(1);
      }
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.connectedDeviceCount).assertEqual(5);
      expect(svcStats.operationHistoryCount).assertEqual(6);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(manager.isConnected()).assertTrue();

      const managedTasks: Array<Promise<boolean>> = [];
      for (let i = 0; i < 3; i++) {
        managedTasks.push(manager.connect(ids[0]));
      }
      const managedResults: boolean[] = await Promise.all(managedTasks);
      let managedAccepted = 0;
      for (let i = 0; i < managedResults.length; i++) {
        if (managedResults[i]) {
          managedAccepted++;
        }
      }
      expect(managedAccepted).assertEqual(3);
      expect(manager.getManagedDeviceCount()).assertEqual(5);
      expect(manager.getOperationRecords().length).assertEqual(6);
      expect(manager.getStatistics().totalConnectionAttempts).assertEqual(5);
      expect(manager.getStatistics().successfulConnections).assertEqual(5);
      expect(svcDetailsOf(manager).length).assertEqual(6);
      expect(countString(svcDetailsOf(manager), 'Already connected')).assertEqual(0);

      const dupId = `${prefix}dup`;
      const duplicateTasks: Array<Promise<boolean>> = [];
      for (let i = 0; i < 3; i++) {
        duplicateTasks.push(manager.connect(dupId));
      }
      const duplicateResults: boolean[] = await Promise.all(duplicateTasks);
      let duplicateAccepted = 0;
      for (let i = 0; i < duplicateResults.length; i++) {
        if (duplicateResults[i]) {
          duplicateAccepted++;
        }
      }
      expect(duplicateAccepted).assertEqual(3);
      expect(manager.getManagedDeviceCount()).assertEqual(8);
      const dupIds = manager.getConnectedDeviceIds();
      expect(dupIds.length).assertEqual(8);
      expect(dupIds.indexOf(dupId)).assertEqual(5);
      expect(dupIds.lastIndexOf(dupId)).assertEqual(7);
      expect(dupIds.indexOf(ids[0])).assertEqual(0);
      const dupDetails = svcDetailsOf(manager);
      expect(dupDetails.length).assertEqual(9);
      expect(countString(dupDetails, `Connected to ${dupId}`)).assertEqual(3);
      const dupStats: ESObject = service.getStatistics();
      expect(dupStats.connectedDeviceCount).assertEqual(8);
      expect(dupStats.operationHistoryCount).assertEqual(9);
      expect(dupStats.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(manager.getStatistics().totalConnectionAttempts).assertEqual(8);
      expect(manager.getStatistics().successfulConnections).assertEqual(8);
      expect(manager.getStatistics().connectedDeviceCount).assertEqual(8);
      expect(recordsOf(manager).length).assertEqual(9);
      expect(recordAt(manager, 8).details).assertEqual(`Connected to ${dupId}`);

      expect(await manager.disconnect(dupId)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(7);
      expect(await manager.disconnect(dupId)).assertTrue();
      expect(await manager.disconnect(dupId)).assertTrue();
      expect(await manager.disconnect(dupId)).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(5);
      expect(manager.getStatistics().disconnectionEvents).assertEqual(3);
      const finalDetails = svcDetailsOf(manager);
      expect(finalDetails.length).assertEqual(12);
      expect(countString(finalDetails, `Disconnected from ${dupId}`)).assertEqual(3);
      expect(finalDetails[11]).assertEqual(`Disconnected from ${dupId}`);
      const afterDupStats: ESObject = service.getStatistics();
      expect(afterDupStats.connectedDeviceCount).assertEqual(5);
      expect(afterDupStats.operationHistoryCount).assertEqual(12);

      await manager.destroy();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_3100
     * @tc.name: testAvrcpProfile0031
     * @tc.desc: Verify that operations in an invalid state return expected errors without crashing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAvrcpProfile0031', 0, async () => {
      const manager = new AvrcpProfileManager();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const connectResult = await manager.connect(DEVICE_A);
      expect(connectResult).assertFalse();
      const disconnectResult = await manager.disconnect(DEVICE_A);
      expect(disconnectResult).assertFalse();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(2);
      expect(records[0].operationId).assertEqual('mgr_op_1');
      expect(records[0].operationName).assertEqual('connect');
      expect(records[0].success).assertFalse();
      expect(records[0].errorMessage).assertEqual('Not ready');
      expect(records[0].details).assertEqual('Manager not initialized');
      expect(records[1].operationId).assertEqual('mgr_op_2');
      expect(records[1].operationName).assertEqual('disconnect');
      expect(records[1].errorMessage).assertEqual('Not ready');

      const stats = manager.getStatistics();
      expect(stats.totalOperations).assertEqual(2);
      expect(stats.failedOperations).assertEqual(2);
      expect(stats.successfulOperations).assertEqual(0);
      expect(stats.errorRate).assertEqual(100);
      expect(stats.totalConnectionAttempts).assertEqual(0);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.connectionSuccessRate).assertEqual(0);
      expect(stats.uptimeMs).assertEqual(0);
      expect(stats.lastConnectionEvent).assertEqual(0);
      expect(stats.operationSuccessRate).assertEqual(0);

      const health = healthOf(manager);
      expect(health.healthScore).assertEqual(10);
      expect(health.isHealthy).assertFalse();
      expect(health.lastError).assertEqual('Not ready');
      expect(health.uptimeMs).assertEqual(0);

      const service = manager.getService();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getOperationHistory().length).assertEqual(0);
      const serviceStats: ESObject = service.getStatistics();
      expect(serviceStats.isInitialized).assertFalse();
      expect(serviceStats.operationHistoryCount).assertEqual(0);
      expect(serviceStats.connectedDeviceCount).assertEqual(0);
      expect(serviceStats.serviceName).assertEqual(SERVICE_NAME);

      await manager.reset();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(recordAt(manager, 0).operationName).assertEqual('reset');
      expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_3');
      expect(manager.isConnected()).assertFalse();

      expect(await manager.initialize()).assertTrue();
      const afterInit = recordsOf(manager);
      expect(afterInit.length).assertEqual(1);
      expect(afterInit[0].operationId).assertEqual('mgr_op_1');
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(manager.isConnected()).assertTrue();

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_AVRCP_PROFILE_3200
     * @tc.name: testAvrcpProfile0032
     * @tc.desc: Verify the full manager lifecycle of initialize, connect, disconnect and destroy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAvrcpProfile0032', 0, async () => {
      const manager = new AvrcpProfileManager();
      await manager.initialize();
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      expect(manager.isConnected()).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);

      await manager.reset();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.isConnected()).assertFalse();

      await manager.destroy();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const recordsAfterDestroy = recordsOf(manager);
      expect(recordsAfterDestroy.length).assertEqual(1);
      expect(recordsAfterDestroy[0].operationId).assertEqual('mgr_op_7');
      expect(recordsAfterDestroy[0].operationName).assertEqual('reset');

      expect(await manager.connect(DEVICE_C)).assertFalse();
      const records = recordsOf(manager);
      expect(records.length).assertEqual(2);
      expect(records[1].operationId).assertEqual('mgr_op_8');
      expect(records[1].operationName).assertEqual('connect');
      expect(records[1].errorMessage).assertEqual('Not ready');

      const stats = manager.getStatistics();
      expect(stats.totalOperations).assertEqual(8);
      expect(stats.successfulOperations).assertEqual(7);
      expect(stats.failedOperations).assertEqual(1);
      expect(stats.totalConnectionAttempts).assertEqual(2);
      expect(stats.successfulConnections).assertEqual(2);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.disconnectionEvents).assertEqual(2);
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(stats.managedDeviceCount).assertEqual(0);
      expect(stats.errorRate).assertEqual(12.5);
      expect(stats.connectionSuccessRate).assertEqual(100);
      expect(stats.healthScore).assertEqual(70);
      expect(stats.isHealthy).assertTrue();

      const service = manager.getService();
      expect(service.isConnected()).assertFalse();
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(service.getOperationHistory().length).assertEqual(1);
      expect(service.getOperationHistory()[0].details).assertEqual('Service reset');
      expect(service.getOperationHistory()[0].operation).assertEqual('reset');
      expect(service.getOperationHistory()[0].success).assertTrue();
      const svcStats: ESObject = service.getStatistics();
      expect(svcStats.connectedDeviceCount).assertEqual(0);
      expect(svcStats.isInitialized).assertFalse();
      expect(svcStats.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(svcStats.operationHistoryCount).assertEqual(1);
      expect(svcStats.serviceName).assertEqual(SERVICE_NAME);

      expect(await manager.initialize()).assertTrue();
      const reinitialized = manager.getStatistics();
      expect(reinitialized.totalOperations).assertEqual(1);
      expect(reinitialized.totalConnectionAttempts).assertEqual(0);
      expect(reinitialized.disconnectionEvents).assertEqual(0);
      expect(reinitialized.healthScore).assertEqual(60);
      expect(recordAt(manager, 0).operationId).assertEqual('mgr_op_1');
      expect(service.getOperationHistory().length).assertEqual(1);
      expect(service.getOperationHistory()[0].details).assertEqual('Service initialized successfully');
      expect(service.isConnected()).assertFalse();
      expect(manager.getModel() === service.getModel()).assertTrue();
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(manager.isConnected()).assertTrue();

      await manager.destroy();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
    });
  });
}
