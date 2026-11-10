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
import { A2dpProfileManager, BluetoothConnectionState } from 'library';

/**
 * @description Error handling scenarios of the A2DP profile manager lifecycle.
 * @since 26.0.0
 */

const DEVICE_A: string = 'err_dev_a';
const DEVICE_B: string = 'err_dev_b';
const DEVICE_C: string = 'err_dev_c';
const GHOST_DEVICE: string = 'err_ghost_device';
const BLANK_DEVICE: string = '   ';
const MANAGE_LIMIT: number = 2;
const LONG_ID_LENGTH: number = 1000;
const RECORD_CAP: number = 500;
const FAILURE_ROUNDS: number = 510;
const HEALTHY_SCORE: number = 100;
const IDLE_SCORE: number = 60;
const CRITICAL_SCORE: number = 10;

interface HistoryView {
  operation: string;
  timestamp: number;
  success: boolean;
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

function historyOf(manager: A2dpProfileManager): HistoryView[] {
  const source = manager.getService().getOperationHistory();
  const list: HistoryView[] = [];
  for (let i = 0; i < source.length; i++) {
    list.push({
      operation: source[i].operation,
      timestamp: source[i].timestamp,
      success: source[i].success,
      details: source[i].details
    });
  }
  return list;
}

function healthOf(manager: A2dpProfileManager): HealthView {
  const raw: ESObject = manager.getHealthStatus();
  const view: HealthView = {
    isHealthy: raw.isHealthy as boolean,
    healthScore: raw.healthScore as number,
    uptimeMs: raw.uptimeMs as number,
    connectionSuccessRate: raw.connectionSuccessRate as number,
    operationSuccessRate: raw.operationSuccessRate as number,
    errorRate: raw.errorRate as number,
    managedDeviceCount: raw.managedDeviceCount as number,
    queuedOperationCount: raw.queuedOperationCount as number,
    retryAttempts: raw.retryAttempts as number,
    lastError: raw.lastError as string
  };
  return view;
}

async function readyManager(): Promise<A2dpProfileManager> {
  const manager = new A2dpProfileManager();
  await manager.initialize();
  return manager;
}

export default function errorHandlingTest(): void {
  describe('ErrorHandlingTest', () => {
    // ==================== 生命周期与就绪守卫（4 条） ====================

    /*
     * @tc.number: SUB_ERROR_HANDLING_0100
     * @tc.name: testErrorHandling0001
     * @tc.desc: Verify that a connect on an uninitialized manager is refused and recorded as not ready.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0001', 0, async () => {
      const manager = new A2dpProfileManager();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      expect(manager.getService().getOperationHistory().length).assertEqual(0);

      expect(await manager.connect(DEVICE_A)).assertFalse();

      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(1);
      expect(records[0].operationName).assertEqual('connect');
      expect(records[0].success).assertFalse();
      expect(records[0].errorMessage).assertEqual('Not ready');
      expect(records[0].details).assertEqual('Manager not initialized');

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(0);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.totalOperations).assertEqual(1);
      expect(stats.failedOperations).assertEqual(1);
      expect(stats.errorRate).assertEqual(100);
      expect(stats.healthScore).assertEqual(CRITICAL_SCORE);
      expect(stats.isHealthy).assertFalse();
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      expect(manager.getService().getOperationHistory().length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_0200
     * @tc.name: testErrorHandling0002
     * @tc.desc: Verify that a repeated initialization is refused and leaves the manager operational.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0002', 0, async () => {
      const manager = await readyManager();
      expect(await manager.initialize()).assertFalse();

      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      const history = historyOf(manager);
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('initialize');
      expect(history[0].success).assertTrue();
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(30000);
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      expect(manager.getStatistics().healthScore).assertEqual(IDLE_SCORE);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(manager.isConnected()).assertTrue();
      expect(manager.getStatistics().totalConnectionAttempts).assertEqual(1);
      expect(manager.getStatistics().successfulConnections).assertEqual(1);
      expect(historyOf(manager).length).assertEqual(2);

      await manager.disconnect(DEVICE_A);
      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_0300
     * @tc.name: testErrorHandling0003
     * @tc.desc: Verify that every manager entry point is refused after the manager is destroyed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0003', 0, async () => {
      const manager = await readyManager();
      expect(await manager.connect(DEVICE_A)).assertTrue();
      await manager.destroy();

      expect(manager.isConnected()).assertFalse();
      expect(await manager.connect(DEVICE_A)).assertFalse();
      expect(await manager.disconnect(DEVICE_A)).assertFalse();
      expect(await manager.play()).assertFalse();
      expect(await manager.pause()).assertFalse();
      expect(await manager.stop()).assertFalse();
      expect(await manager.skipForward()).assertFalse();
      expect(await manager.skipBackward()).assertFalse();
      expect(await manager.setVolume(30)).assertFalse();
      expect(await manager.selectCodec(2)).assertFalse();
      expect(manager.getSupportedCodecs().length).assertEqual(0);
      expect(manager.getActiveCodec()).assertNull();
      expect(manager.getPlaybackInfo()).assertNull();
      expect(manager.getQualityMetrics()).assertNull();
      expect(manager.isPlaying()).assertFalse();

      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(3);
      expect(records[0].operationName).assertEqual('reset');
      expect(records[1].errorMessage).assertEqual('Not ready');
      expect(records[2].operationName).assertEqual('disconnect');
      expect(records[2].errorMessage).assertEqual('Not ready');

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(1);
      expect(stats.successfulConnections).assertEqual(1);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.disconnectionEvents).assertEqual(1);
      expect(stats.totalOperations).assertEqual(6);
      expect(stats.failedOperations).assertEqual(2);
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(stats.healthScore).assertEqual(50);
      expect(stats.isHealthy).assertTrue();
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_0400
     * @tc.name: testErrorHandling0004
     * @tc.desc: Verify that re-initializing a destroyed manager restores a clean state and connectivity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testErrorHandling0004', 0, async () => {
      const manager = await readyManager();
      expect(await manager.connect('')).assertFalse();
      await manager.destroy();

      expect(await manager.initialize()).assertTrue();
      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(1);
      expect(records[0].operationName).assertEqual('initialize');
      expect(records[0].success).assertTrue();

      const reset = manager.getStatistics();
      expect(reset.totalOperations).assertEqual(1);
      expect(reset.failedOperations).assertEqual(0);
      expect(reset.totalConnectionAttempts).assertEqual(0);
      expect(reset.failedConnections).assertEqual(0);
      expect(reset.errorRate).assertEqual(0);
      expect(reset.healthScore).assertEqual(IDLE_SCORE);
      expect(reset.isHealthy).assertTrue();
      const history = historyOf(manager);
      expect(history.length).assertEqual(1);
      expect(history[0].details).assertEqual('Service initialized successfully');

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(manager.isConnected()).assertTrue();
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      expect(manager.getStatistics().healthScore).assertEqual(HEALTHY_SCORE);
      expect(manager.getStatistics().errorRate).assertEqual(0);

      await manager.disconnect(DEVICE_A);
      await manager.destroy();
    });

    // ==================== 设备标识异常输入（6 条） ====================

    /*
     * @tc.number: SUB_ERROR_HANDLING_0500
     * @tc.name: testErrorHandling0005
     * @tc.desc: Verify that an empty device identifier fails through both manager and service layers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0005', 0, async () => {
      const manager = await readyManager();
      expect(await manager.connect('')).assertFalse();

      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(2);
      expect(records[1].operationName).assertEqual('connect');
      expect(records[1].success).assertFalse();
      expect(records[1].errorMessage).assertEqual('Connection failed');
      expect(records[1].details).assertEqual('Failed to connect to ');

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(1);
      expect(stats.failedConnections).assertEqual(1);
      expect(stats.successfulConnections).assertEqual(0);
      expect(stats.totalOperations).assertEqual(2);
      expect(stats.failedOperations).assertEqual(1);
      expect(stats.errorRate).assertEqual(50);
      expect(stats.connectionSuccessRate).assertEqual(0);
      expect(stats.healthScore).assertEqual(CRITICAL_SCORE);
      expect(stats.isHealthy).assertFalse();
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      expect(manager.isConnected()).assertFalse();

      const history = historyOf(manager);
      expect(history.length).assertEqual(2);
      expect(history[1].operation).assertEqual('connect');
      expect(history[1].success).assertFalse();
      expect(history[1].details).assertEqual('Invalid device ID');

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_0600
     * @tc.name: testErrorHandling0006
     * @tc.desc: Verify that a blank identifier is accepted because only empty identifiers are rejected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0006', 0, async () => {
      const manager = await readyManager();
      expect(await manager.connect(BLANK_DEVICE)).assertTrue();

      expect(manager.isConnected()).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(BLANK_DEVICE);
      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(2);
      expect(records[1].success).assertTrue();
      expect(records[1].details).assertEqual(`Connected to ${BLANK_DEVICE}`);
      const connected = manager.getStatistics();
      expect(connected.totalConnectionAttempts).assertEqual(1);
      expect(connected.successfulConnections).assertEqual(1);
      expect(connected.failedConnections).assertEqual(0);
      expect(connected.errorRate).assertEqual(0);
      expect(connected.healthScore).assertEqual(HEALTHY_SCORE);

      expect(await manager.disconnect(BLANK_DEVICE)).assertTrue();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      const after = manager.getOperationRecords();
      expect(after.length).assertEqual(3);
      expect(after[2].operationName).assertEqual('disconnect');
      expect(after[2].success).assertTrue();
      expect(historyOf(manager)[2].details).assertEqual(`Disconnected from ${BLANK_DEVICE}`);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_0700
     * @tc.name: testErrorHandling0007
     * @tc.desc: Verify that an oversized device identifier is managed without any length validation.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0007', 0, async () => {
      let longId: string = 'dev_';
      for (let i = 0; i < 249; i++) {
        longId += 'xxxx';
      }
      expect(longId.length).assertEqual(LONG_ID_LENGTH);

      const manager = await readyManager();
      expect(await manager.connect(longId)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      expect(manager.getConnectedDeviceIds()[0].length).assertEqual(LONG_ID_LENGTH);
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(longId);

      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(2);
      expect(records[1].details).assertEqual(`Connected to ${longId}`);
      expect(records[1].details.length).assertEqual('Connected to '.length + LONG_ID_LENGTH);
      expect(manager.getStatistics().successfulConnections).assertEqual(1);
      expect(manager.getStatistics().failedConnections).assertEqual(0);

      expect(await manager.disconnect(longId)).assertTrue();
      expect(manager.isConnected()).assertFalse();
      const history = historyOf(manager);
      expect(history.length).assertEqual(3);
      expect(history[2].details).assertEqual(`Disconnected from ${longId}`);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_0800
     * @tc.name: testErrorHandling0008
     * @tc.desc: Verify that reconnecting an already managed device is idempotent and untracked.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0008', 0, async () => {
      const manager = await readyManager();
      expect(await manager.connect(DEVICE_A)).assertTrue();
      const before = manager.getStatistics();
      const beforeRecords = manager.getOperationRecords().length;
      const beforeHistory = historyOf(manager).length;

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      expect(manager.getConnectedDeviceIds().length).assertEqual(1);
      expect(manager.getOperationRecords().length).assertEqual(beforeRecords);
      expect(historyOf(manager).length).assertEqual(beforeHistory);

      const after = manager.getStatistics();
      expect(after.totalConnectionAttempts).assertEqual(before.totalConnectionAttempts);
      expect(after.successfulConnections).assertEqual(before.successfulConnections);
      expect(after.failedConnections).assertEqual(0);
      expect(after.totalOperations).assertEqual(before.totalOperations);
      expect(after.healthScore).assertEqual(HEALTHY_SCORE);
      expect(after.isHealthy).assertTrue();
      expect(manager.isConnected()).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_0900
     * @tc.name: testErrorHandling0009
     * @tc.desc: Verify that disconnecting an unmanaged device is refused without reaching the service.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0009', 0, async () => {
      const manager = await readyManager();
      expect(await manager.disconnect(GHOST_DEVICE)).assertFalse();

      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(2);
      expect(records[1].operationName).assertEqual('disconnect');
      expect(records[1].success).assertFalse();
      expect(records[1].errorMessage).assertEqual('Not managed');
      expect(records[1].details).assertEqual(`Device ${GHOST_DEVICE} not managed`);

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(0);
      expect(stats.disconnectionEvents).assertEqual(0);
      expect(stats.totalOperations).assertEqual(2);
      expect(stats.failedOperations).assertEqual(1);
      expect(stats.errorRate).assertEqual(50);
      expect(stats.healthScore).assertEqual(CRITICAL_SCORE);
      expect(stats.isHealthy).assertFalse();
      expect(stats.managedDeviceCount).assertEqual(0);
      expect(manager.isConnected()).assertFalse();
      expect(historyOf(manager).length).assertEqual(1);
      expect(manager.getService().getConnectionState())
        .assertEqual(BluetoothConnectionState.DISCONNECTED);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_1000
     * @tc.name: testErrorHandling0010
     * @tc.desc: Verify that the managed device limit blocks further connections with a max devices record.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0010', 0, async () => {
      const manager = await readyManager();
      const config = manager.getConfig();
      config.maxManagedDevices = MANAGE_LIMIT;
      manager.setConfig(config);
      expect(manager.getConfig().maxManagedDevices).assertEqual(MANAGE_LIMIT);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(await manager.connect(DEVICE_C)).assertFalse();

      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(4);
      expect(records[3].errorMessage).assertEqual('Max devices');
      expect(records[3].details).assertEqual('Maximum managed devices reached');
      expect(records[3].success).assertFalse();

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(MANAGE_LIMIT);
      expect(stats.successfulConnections).assertEqual(MANAGE_LIMIT);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.managedDeviceCount).assertEqual(MANAGE_LIMIT);
      expect(stats.connectedDeviceCount).assertEqual(MANAGE_LIMIT);

      const ids = manager.getConnectedDeviceIds();
      expect(ids.length).assertEqual(MANAGE_LIMIT);
      expect(ids[0]).assertEqual(DEVICE_A);
      expect(ids[1]).assertEqual(DEVICE_B);
      expect(ids.indexOf(DEVICE_C)).assertEqual(-1);
      expect(manager.isConnected()).assertTrue();
      expect(historyOf(manager).length).assertEqual(3);

      await manager.disconnect(DEVICE_A);
      await manager.disconnect(DEVICE_B);
      expect(await manager.connect(DEVICE_C)).assertTrue();
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_C);

      await manager.disconnect(DEVICE_C);
      await manager.destroy();
    });

    // ==================== 并发与回调异常（2 条） ====================

    /*
     * @tc.number: SUB_ERROR_HANDLING_1100
     * @tc.name: testErrorHandling0011
     * @tc.desc: Verify that two simultaneous connections of one device create duplicate managed entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0011', 0, async () => {
      const manager = await readyManager();
      const results: boolean[] = await Promise.all([manager.connect(DEVICE_A), manager.connect(DEVICE_A)]);
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();

      const ids = manager.getConnectedDeviceIds();
      expect(ids.length).assertEqual(2);
      expect(ids[0]).assertEqual(DEVICE_A);
      expect(ids[1]).assertEqual(DEVICE_A);
      expect(manager.getManagedDeviceCount()).assertEqual(2);

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(2);
      expect(stats.successfulConnections).assertEqual(2);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.managedDeviceCount).assertEqual(2);
      expect(manager.getOperationRecords().length).assertEqual(3);
      expect(historyOf(manager).length).assertEqual(3);
      expect(manager.isConnected()).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      expect(manager.isConnected()).assertTrue();
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.isConnected()).assertFalse();
      expect(manager.getStatistics().disconnectionEvents).assertEqual(2);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_1200
     * @tc.name: testErrorHandling0012
     * @tc.desc: Verify that a throwing state callback is contained and removed callbacks stop receiving events.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0012', 0, async () => {
      const manager = await readyManager();
      const service = manager.getService();
      const states: BluetoothConnectionState[] = [];
      let badCalls: number = 0;
      const goodCallback = (state: BluetoothConnectionState): void => {
        states.push(state);
      };
      const badCallback = (state: BluetoothConnectionState): void => {
        badCalls = badCalls + 1;
        throw new Error('callback failure');
      };
      service.addConnectionCallback(goodCallback);
      service.addConnectionCallback(badCallback);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(states.length).assertEqual(2);
      expect(states[0]).assertEqual(BluetoothConnectionState.CONNECTING);
      expect(states[1]).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(badCalls).assertEqual(2);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(manager.isConnected()).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(states.length).assertEqual(4);
      expect(states[2]).assertEqual(BluetoothConnectionState.DISCONNECTING);
      expect(states[3]).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(badCalls).assertEqual(4);

      service.removeConnectionCallback(goodCallback);
      service.removeConnectionCallback(badCallback);
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(states.length).assertEqual(4);
      expect(badCalls).assertEqual(4);
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B);

      const stats = manager.getStatistics();
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.successfulConnections).assertEqual(2);
      expect(stats.totalOperations).assertEqual(4);
      expect(stats.errorRate).assertEqual(0);
      expect(stats.healthScore).assertEqual(HEALTHY_SCORE);

      await manager.disconnect(DEVICE_B);
      await manager.destroy();
    });

    // ==================== 统计、记录与配置一致性（6 条） ====================

    /*
     * @tc.number: SUB_ERROR_HANDLING_1300
     * @tc.name: testErrorHandling0013
     * @tc.desc: Verify that statistics, records and device lists are returned as independent copies.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0013', 0, async () => {
      const manager = await readyManager();
      const before = manager.getStatistics();
      expect(before.totalOperations).assertEqual(1);
      expect(before.failedConnections).assertEqual(0);

      await manager.connect('');
      const after = manager.getStatistics();
      expect(before.totalOperations).assertEqual(1);
      expect(before.failedConnections).assertEqual(0);
      expect(before.errorRate).assertEqual(0);
      expect(after.totalOperations).assertEqual(2);
      expect(after.failedConnections).assertEqual(1);
      expect(after.errorRate).assertEqual(50);

      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(2);
      records.push(records[0]);
      expect(manager.getOperationRecords().length).assertEqual(2);
      expect(manager.getOperationRecords()[0].operationName).assertEqual('initialize');

      const ids = manager.getConnectedDeviceIds();
      ids.push('injected_device');
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      expect(manager.getConnectedDeviceIds().indexOf('injected_device')).assertEqual(-1);

      const snapshot = manager.getStatistics();
      snapshot.totalOperations = 999;
      snapshot.failedConnections = 999;
      expect(manager.getStatistics().totalOperations).assertEqual(2);
      expect(manager.getStatistics().failedConnections).assertEqual(1);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_1400
     * @tc.name: testErrorHandling0014
     * @tc.desc: Verify the identifier, timing and message fields of failed operation records.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0014', 0, async () => {
      const manager = await readyManager();
      const initRecord = manager.getOperationRecords()[0];
      expect(initRecord.operationId).assertEqual('mgr_op_1');
      expect(initRecord.success).assertTrue();
      expect(initRecord.errorMessage).assertEqual('');
      expect(initRecord.details).assertEqual('Manager initialized');
      expect(initRecord.durationMs).assertEqual(0);
      expect(initRecord.startTime).assertEqual(initRecord.endTime);

      await manager.connect('');
      const failed = manager.getOperationRecords()[1];
      expect(failed.operationId).assertEqual('mgr_op_2');
      expect(failed.success).assertFalse();
      expect(failed.errorMessage).assertEqual('Connection failed');
      expect(failed.durationMs).assertEqual(0);
      expect(failed.startTime).assertEqual(failed.endTime);
      expect(failed.startTime >= initRecord.startTime).assertTrue();
      expect(manager.getStatistics().lastOperationTime).assertEqual(failed.endTime);

      await manager.disconnect(GHOST_DEVICE);
      const ghost = manager.getOperationRecords()[2];
      expect(ghost.operationId).assertEqual('mgr_op_3');
      expect(ghost.operationName).assertEqual('disconnect');
      expect(ghost.errorMessage).assertEqual('Not managed');
      expect(manager.getStatistics().lastOperationTime).assertEqual(ghost.endTime);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      const ok = manager.getOperationRecords()[3];
      expect(ok.operationId).assertEqual('mgr_op_4');
      expect(ok.success).assertTrue();
      expect(ok.errorMessage).assertEqual('');
      expect(ok.details).assertEqual(`Connected to ${DEVICE_A}`);
      expect(manager.getOperationRecords().length).assertEqual(4);

      await manager.disconnect(DEVICE_A);
      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_1500
     * @tc.name: testErrorHandling0015
     * @tc.desc: Verify that a reset clears the record list while the connection counters are retained.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0015', 0, async () => {
      const manager = await readyManager();
      expect(await manager.connect('')).assertFalse();
      expect(await manager.disconnect(GHOST_DEVICE)).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(3);
      expect(manager.getStatistics().totalConnectionAttempts).assertEqual(1);

      await manager.reset();

      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(1);
      expect(records[0].operationName).assertEqual('reset');
      expect(records[0].success).assertTrue();
      expect(records[0].errorMessage).assertEqual('');
      expect(records[0].details).assertEqual('Manager reset');

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(1);
      expect(stats.failedConnections).assertEqual(1);
      expect(stats.totalOperations).assertEqual(4);
      expect(stats.failedOperations).assertEqual(2);
      expect(stats.successfulOperations).assertEqual(2);
      expect(stats.errorRate).assertEqual(50);
      expect(stats.healthScore).assertEqual(20);
      expect(stats.isHealthy).assertFalse();
      expect(stats.managedDeviceCount).assertEqual(0);
      expect(manager.isConnected()).assertFalse();
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const history = historyOf(manager);
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('reset');
      expect(history[0].details).assertEqual('Service reset');

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_1600
     * @tc.name: testErrorHandling0016
     * @tc.desc: Verify that the operation record list keeps only the most recent five hundred entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0016', 0, async () => {
      const manager = await readyManager();
      let unexpected: number = 0;
      for (let i = 0; i < FAILURE_ROUNDS; i++) {
        if (await manager.connect('')) {
          unexpected = unexpected + 1;
        }
      }
      expect(unexpected).assertEqual(0);

      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(RECORD_CAP);
      const firstKept: number = FAILURE_ROUNDS + 2 - RECORD_CAP;
      expect(records[0].operationId).assertEqual(`mgr_op_${firstKept}`);
      expect(records[RECORD_CAP - 1].operationId).assertEqual(`mgr_op_${FAILURE_ROUNDS + 1}`);
      expect(records[0].operationName).assertEqual('connect');
      expect(records[RECORD_CAP - 1].success).assertFalse();
      expect(records[RECORD_CAP - 1].errorMessage).assertEqual('Connection failed');

      const stats = manager.getStatistics();
      expect(stats.totalOperations).assertEqual(FAILURE_ROUNDS + 1);
      expect(stats.failedOperations).assertEqual(FAILURE_ROUNDS);
      expect(stats.successfulOperations).assertEqual(1);
      expect(stats.totalConnectionAttempts).assertEqual(FAILURE_ROUNDS);
      expect(stats.failedConnections).assertEqual(FAILURE_ROUNDS);
      expect(stats.operationSuccessRate).assertEqual(1 / (FAILURE_ROUNDS + 1) * 100);
      expect(stats.healthScore).assertEqual(CRITICAL_SCORE);
      expect(stats.isHealthy).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_1700
     * @tc.name: testErrorHandling0017
     * @tc.desc: Verify connection counters and the healthy score across repeated connect and disconnect cycles.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testErrorHandling0017', 0, async () => {
      const manager = await readyManager();
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(await manager.connect(DEVICE_A)).assertTrue();
      expect(await manager.disconnect(DEVICE_A)).assertTrue();

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(2);
      expect(stats.successfulConnections).assertEqual(2);
      expect(stats.failedConnections).assertEqual(0);
      expect(stats.disconnectionEvents).assertEqual(2);
      expect(stats.connectionSuccessRate).assertEqual(100);
      expect(stats.totalOperations).assertEqual(5);
      expect(stats.failedOperations).assertEqual(0);
      expect(stats.errorRate).assertEqual(0);
      expect(stats.healthScore).assertEqual(HEALTHY_SCORE);
      expect(stats.isHealthy).assertTrue();
      expect(stats.managedDeviceCount).assertEqual(0);
      expect(stats.connectedDeviceCount).assertEqual(0);
      expect(manager.isConnected()).assertFalse();
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(5);
      expect(historyOf(manager).length).assertEqual(5);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_1800
     * @tc.name: testErrorHandling0018
     * @tc.desc: Verify that the configuration is returned as a copy and unvalidated values are accepted.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0018', 0, async () => {
      const manager = await readyManager();
      const defaults = manager.getConfig();
      expect(defaults.connectionTimeoutMs).assertEqual(30000);
      expect(defaults.operationTimeoutMs).assertEqual(10000);
      expect(defaults.maxRetryAttempts).assertEqual(3);
      expect(defaults.retryDelayMs).assertEqual(1000);
      expect(defaults.useExponentialBackoff).assertTrue();
      expect(defaults.maxBackoffDelayMs).assertEqual(30000);
      expect(defaults.autoReconnect).assertTrue();
      expect(defaults.maxAutoReconnectAttempts).assertEqual(5);
      expect(defaults.autoReconnectDelayMs).assertEqual(5000);
      expect(defaults.maxQueueSize).assertEqual(50);
      expect(defaults.maxManagedDevices).assertEqual(10);
      expect(defaults.verboseLogging).assertFalse();
      expect(defaults.enablePerformanceTracing).assertTrue();
      expect(defaults.healthCheckIntervalMs).assertEqual(60000);
      expect(defaults.minHealthScoreThreshold).assertEqual(50);

      const mutated = manager.getConfig();
      mutated.maxRetryAttempts = 999;
      expect(manager.getConfig().maxRetryAttempts).assertEqual(3);

      const partial = manager.getConfig();
      partial.connectionTimeoutMs = -1;
      partial.maxQueueSize = 0;
      manager.setConfig(partial);
      const applied = manager.getConfig();
      expect(applied.connectionTimeoutMs).assertEqual(-1);
      expect(applied.maxQueueSize).assertEqual(0);
      expect(applied.operationTimeoutMs).assertEqual(10000);
      expect(applied.maxManagedDevices).assertEqual(10);

      const restored = manager.getConfig();
      restored.connectionTimeoutMs = 30000;
      restored.maxQueueSize = 50;
      manager.setConfig(restored);
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(30000);
      expect(manager.getConfig().maxQueueSize).assertEqual(50);
      expect(await manager.connect(DEVICE_A)).assertTrue();

      await manager.disconnect(DEVICE_A);
      await manager.destroy();
    });

    // ==================== 健康度与故障隔离（4 条） ====================

    /*
     * @tc.number: SUB_ERROR_HANDLING_1900
     * @tc.name: testErrorHandling0019
     * @tc.desc: Verify the health score degradation and recovery steps after a failed and a valid connection.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0019', 0, async () => {
      const manager = await readyManager();
      const idle = manager.getStatistics();
      expect(idle.healthScore).assertEqual(IDLE_SCORE);
      expect(idle.isHealthy).assertTrue();
      expect(idle.errorRate).assertEqual(0);
      expect(idle.connectionSuccessRate).assertEqual(0);

      await manager.connect('');
      const degraded = manager.getStatistics();
      expect(degraded.errorRate).assertEqual(50);
      expect(degraded.connectionSuccessRate).assertEqual(0);
      expect(degraded.healthScore).assertEqual(CRITICAL_SCORE);
      expect(degraded.isHealthy).assertFalse();

      expect(await manager.connect(DEVICE_A)).assertTrue();
      const mixed = manager.getStatistics();
      expect(mixed.totalConnectionAttempts).assertEqual(2);
      expect(mixed.successfulConnections).assertEqual(1);
      expect(mixed.connectionSuccessRate).assertEqual(50);
      expect(mixed.errorRate).assertEqual(1 / 3 * 100);
      expect(mixed.healthScore).assertEqual(30);
      expect(mixed.isHealthy).assertFalse();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      const settled = manager.getStatistics();
      expect(settled.totalOperations).assertEqual(4);
      expect(settled.failedOperations).assertEqual(1);
      expect(settled.errorRate).assertEqual(25);
      expect(settled.connectionSuccessRate).assertEqual(50);
      expect(settled.healthScore).assertEqual(50);
      expect(settled.isHealthy).assertTrue();
      expect(manager.isConnected()).assertFalse();

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_2000
     * @tc.name: testErrorHandling0020
     * @tc.desc: Verify that the health status view agrees with the statistics after an error appears.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0020', 0, async () => {
      const manager = await readyManager();
      const idle = healthOf(manager);
      expect(idle.isHealthy).assertTrue();
      expect(idle.healthScore).assertEqual(IDLE_SCORE);
      expect(idle.lastError).assertEqual('');
      expect(idle.errorRate).assertEqual(0);
      expect(idle.operationSuccessRate).assertEqual(100);
      expect(idle.connectionSuccessRate).assertEqual(0);
      expect(idle.managedDeviceCount).assertEqual(0);
      expect(idle.queuedOperationCount).assertEqual(0);
      expect(idle.retryAttempts).assertEqual(0);
      expect(idle.uptimeMs >= 0).assertTrue();

      await manager.connect('');
      const failed = healthOf(manager);
      expect(failed.lastError).assertEqual('Connection failed');
      expect(failed.errorRate).assertEqual(50);
      expect(failed.operationSuccessRate).assertEqual(50);
      expect(failed.healthScore).assertEqual(CRITICAL_SCORE);
      expect(failed.isHealthy).assertFalse();
      expect(failed.queuedOperationCount).assertEqual(0);
      expect(failed.managedDeviceCount).assertEqual(0);
      expect(failed.healthScore).assertEqual(manager.getStatistics().healthScore);
      expect(failed.errorRate).assertEqual(manager.getStatistics().errorRate);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_2100
     * @tc.name: testErrorHandling0021
     * @tc.desc: Verify that failures raised by one manager instance do not affect a second instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0021', 0, async () => {
      const first = await readyManager();
      const second = await readyManager();
      expect(await first.connect('')).assertFalse();
      expect(await first.disconnect(GHOST_DEVICE)).assertFalse();

      const firstStats = first.getStatistics();
      expect(firstStats.totalConnectionAttempts).assertEqual(1);
      expect(firstStats.failedConnections).assertEqual(1);
      expect(firstStats.totalOperations).assertEqual(3);
      expect(firstStats.failedOperations).assertEqual(2);
      expect(firstStats.errorRate).assertEqual(2 / 3 * 100);
      expect(firstStats.healthScore).assertEqual(CRITICAL_SCORE);
      expect(firstStats.isHealthy).assertFalse();

      const secondStats = second.getStatistics();
      expect(secondStats.totalConnectionAttempts).assertEqual(0);
      expect(secondStats.failedConnections).assertEqual(0);
      expect(secondStats.totalOperations).assertEqual(1);
      expect(secondStats.failedOperations).assertEqual(0);
      expect(secondStats.errorRate).assertEqual(0);
      expect(secondStats.healthScore).assertEqual(IDLE_SCORE);
      expect(secondStats.isHealthy).assertTrue();
      expect(second.getOperationRecords().length).assertEqual(1);
      expect(second.getConnectedDeviceIds().length).assertEqual(0);
      expect(second.isConnected()).assertFalse();

      expect(await second.connect(DEVICE_B)).assertTrue();
      expect(second.isConnected()).assertTrue();
      expect(first.isConnected()).assertFalse();
      expect(second.getStatistics().healthScore).assertEqual(HEALTHY_SCORE);

      await second.disconnect(DEVICE_B);
      await first.destroy();
      await second.destroy();
    });

    /*
     * @tc.number: SUB_ERROR_HANDLING_2200
     * @tc.name: testErrorHandling0022
     * @tc.desc: Verify that a manager returns to normal work after a failure followed by a reset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0022', 0, async () => {
      const manager = await readyManager();
      expect(await manager.connect('')).assertFalse();
      expect(manager.getStatistics().failedOperations).assertEqual(1);

      await manager.reset();
      expect(manager.getOperationRecords().length).assertEqual(1);

      expect(await manager.connect(DEVICE_A)).assertTrue();
      const records = manager.getOperationRecords();
      expect(records.length).assertEqual(2);
      expect(records[0].operationName).assertEqual('reset');
      expect(records[1].operationName).assertEqual('connect');
      expect(records[1].success).assertTrue();

      const stats = manager.getStatistics();
      expect(stats.totalConnectionAttempts).assertEqual(2);
      expect(stats.successfulConnections).assertEqual(1);
      expect(stats.failedConnections).assertEqual(1);
      expect(stats.connectionSuccessRate).assertEqual(50);
      expect(stats.totalOperations).assertEqual(4);
      expect(stats.failedOperations).assertEqual(1);
      expect(stats.errorRate).assertEqual(25);
      expect(stats.healthScore).assertEqual(60);
      expect(stats.isHealthy).assertTrue();
      expect(stats.connectedDeviceCount).assertEqual(1);
      expect(manager.isConnected()).assertTrue();
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.isConnected()).assertFalse();
      await manager.destroy();
    });
  });
}
