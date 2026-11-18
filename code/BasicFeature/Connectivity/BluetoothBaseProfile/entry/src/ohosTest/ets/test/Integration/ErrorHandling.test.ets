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
import { A2dpProfileManager, BluetoothConnectionState, ManagerHealthStatus } from 'library';

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
  const raw: ManagerHealthStatus = manager.getHealthStatus();
  const view: HealthView = {
    isHealthy: raw.isHealthy,
    healthScore: raw.healthScore,
    uptimeMs: raw.uptimeMs,
    connectionSuccessRate: raw.connectionSuccessRate,
    operationSuccessRate: raw.operationSuccessRate,
    errorRate: raw.errorRate,
    managedDeviceCount: raw.managedDeviceCount,
    queuedOperationCount: raw.queuedOperationCount,
    retryAttempts: raw.retryAttempts,
    lastError: raw.lastError
  };
  return view;
}

async function readyManager(): Promise<A2dpProfileManager> {
  const manager: A2dpProfileManager = new A2dpProfileManager();
  await manager.initialize();
  return manager;
}

export default function errorHandlingTest(): void {
  describe('ErrorHandlingTest', () => {
    // ==================== lifecycle and ready guard (4 cases) ====================

    /*
     * @tc.number: SUB_ERROR_HANDLING_0100
     * @tc.name: testErrorHandling0001
     * @tc.desc: Verify that a connect on an uninitialized manager is refused and recorded as not ready.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0001', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0001', 'begin');
      const manager: A2dpProfileManager = new A2dpProfileManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#1 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#2 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#3 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#4 assert ' + "expect(manager.getService().getOperationHistory().length).assertEqual(0)");
      expect(manager.getService().getOperationHistory().length).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#5 assert ' + "expect(await manager.connect(DEVICE_A)).assertFalse()");
      expect(await manager.connect(DEVICE_A)).assertFalse();

      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#6 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#7 ' + "records[0].operationName" + ' = ' + JSON.stringify(records[0].operationName));
      expect(records[0].operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#8 ' + "records[0].success" + ' = ' + JSON.stringify(records[0].success));
      expect(records[0].success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#9 ' + "records[0].errorMessage" + ' = ' + JSON.stringify(records[0].errorMessage));
      expect(records[0].errorMessage).assertEqual('Not ready');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#10 ' + "records[0].details" + ' = ' + JSON.stringify(records[0].details));
      expect(records[0].details).assertEqual('Manager not initialized');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#11 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#12 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#13 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#14 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#15 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#16 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#17 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#18 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0001',
        '#19 assert ' + "expect(manager.getService().getOperationHistory().length).assertEqual(0)");
      expect(manager.getService().getOperationHistory().length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0002', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#1 assert ' + "expect(await manager.initialize()).assertFalse()");
      expect(await manager.initialize()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#2 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#3 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      const history = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#4 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#5 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#6 ' + "history[0].success" + ' = ' + JSON.stringify(history[0].success));
      expect(history[0].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#7 assert ' + "expect(manager.getConfig().connectionTimeoutMs).assertEqual(30000)");
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(30000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#8 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#9 assert ' + "expect(manager.getStatistics().healthScore).assertEqual(IDLE_SCORE)");
      expect(manager.getStatistics().healthScore).assertEqual(IDLE_SCORE);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#10 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#11 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#12 assert ' + "expect(manager.getStatistics().totalConnectionAttempts).assertEqual(1)");
      expect(manager.getStatistics().totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#13 assert ' + "expect(manager.getStatistics().successfulConnections).assertEqual(1)");
      expect(manager.getStatistics().successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0002',
        '#14 assert ' + "expect(historyOf(manager).length).assertEqual(2)");
      expect(historyOf(manager).length).assertEqual(2);

      await manager.disconnect(DEVICE_A);
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0003', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      await manager.destroy();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#2 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#3 assert ' + "expect(await manager.connect(DEVICE_A)).assertFalse()");
      expect(await manager.connect(DEVICE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#4 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertFalse()");
      expect(await manager.disconnect(DEVICE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#5 assert ' + "expect(await manager.play()).assertFalse()");
      expect(await manager.play()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#6 assert ' + "expect(await manager.pause()).assertFalse()");
      expect(await manager.pause()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#7 assert ' + "expect(await manager.stop()).assertFalse()");
      expect(await manager.stop()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#8 assert ' + "expect(await manager.skipForward()).assertFalse()");
      expect(await manager.skipForward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#9 assert ' + "expect(await manager.skipBackward()).assertFalse()");
      expect(await manager.skipBackward()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#10 assert ' + "expect(await manager.setVolume(30)).assertFalse()");
      expect(await manager.setVolume(30)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#11 assert ' + "expect(await manager.selectCodec(2)).assertFalse()");
      expect(await manager.selectCodec(2)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#12 assert ' + "expect(manager.getSupportedCodecs().length).assertEqual(0)");
      expect(manager.getSupportedCodecs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#13 assert ' + "expect(manager.getActiveCodec()).assertNull()");
      expect(manager.getActiveCodec()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#14 assert ' + "expect(manager.getPlaybackInfo()).assertNull()");
      expect(manager.getPlaybackInfo()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#15 assert ' + "expect(manager.getQualityMetrics()).assertNull()");
      expect(manager.getQualityMetrics()).assertNull();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#16 assert ' + "expect(manager.isPlaying()).assertFalse()");
      expect(manager.isPlaying()).assertFalse();

      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#17 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#18 ' + "records[0].operationName" + ' = ' + JSON.stringify(records[0].operationName));
      expect(records[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#19 ' + "records[1].errorMessage" + ' = ' + JSON.stringify(records[1].errorMessage));
      expect(records[1].errorMessage).assertEqual('Not ready');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#20 ' + "records[2].operationName" + ' = ' + JSON.stringify(records[2].operationName));
      expect(records[2].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#21 ' + "records[2].errorMessage" + ' = ' + JSON.stringify(records[2].errorMessage));
      expect(records[2].errorMessage).assertEqual('Not ready');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#22 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#23 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#24 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#25 ' + "stats.disconnectionEvents" + ' = ' + JSON.stringify(stats.disconnectionEvents));
      expect(stats.disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#26 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#27 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#28 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#29 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#30 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0003',
        '#31 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0004', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#1 assert ' + "expect(await manager.connect('')).assertFalse()");
      expect(await manager.connect('')).assertFalse();
      await manager.destroy();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#2 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#3 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#4 ' + "records[0].operationName" + ' = ' + JSON.stringify(records[0].operationName));
      expect(records[0].operationName).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#5 ' + "records[0].success" + ' = ' + JSON.stringify(records[0].success));
      expect(records[0].success).assertTrue();

      const reset = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#6 ' + "reset.totalOperations" + ' = ' + JSON.stringify(reset.totalOperations));
      expect(reset.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#7 ' + "reset.failedOperations" + ' = ' + JSON.stringify(reset.failedOperations));
      expect(reset.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#8 ' + "reset.totalConnectionAttempts" + ' = ' + JSON.stringify(reset.totalConnectionAttempts));
      expect(reset.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#9 ' + "reset.failedConnections" + ' = ' + JSON.stringify(reset.failedConnections));
      expect(reset.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#10 ' + "reset.errorRate" + ' = ' + JSON.stringify(reset.errorRate));
      expect(reset.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#11 ' + "reset.healthScore" + ' = ' + JSON.stringify(reset.healthScore));
      expect(reset.healthScore).assertEqual(IDLE_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#12 ' + "reset.isHealthy" + ' = ' + JSON.stringify(reset.isHealthy));
      expect(reset.isHealthy).assertTrue();
      const history = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#13 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#14 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service initialized successfully');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#15 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#16 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#17 assert ' + "expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A)");
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#18 assert ' + "expect(manager.getStatistics().healthScore).assertEqual(HEALTHY_SCORE)");
      expect(manager.getStatistics().healthScore).assertEqual(HEALTHY_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0004',
        '#19 assert ' + "expect(manager.getStatistics().errorRate).assertEqual(0)");
      expect(manager.getStatistics().errorRate).assertEqual(0);

      await manager.disconnect(DEVICE_A);
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0004', 'end');
    });

    // ==================== device identifier exception input (6 cases) ====================

    /*
     * @tc.number: SUB_ERROR_HANDLING_0500
     * @tc.name: testErrorHandling0005
     * @tc.desc: Verify that an empty device identifier fails through both manager and service layers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0005', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0005', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#1 assert ' + "expect(await manager.connect('')).assertFalse()");
      expect(await manager.connect('')).assertFalse();

      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#2 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#3 ' + "records[1].operationName" + ' = ' + JSON.stringify(records[1].operationName));
      expect(records[1].operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#4 ' + "records[1].success" + ' = ' + JSON.stringify(records[1].success));
      expect(records[1].success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#5 ' + "records[1].errorMessage" + ' = ' + JSON.stringify(records[1].errorMessage));
      expect(records[1].errorMessage).assertEqual('Connection failed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#6 ' + "records[1].details" + ' = ' + JSON.stringify(records[1].details));
      expect(records[1].details).assertEqual('Failed to connect to ');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#7 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#8 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#9 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#10 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#11 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#12 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#13 ' + "stats.connectionSuccessRate" + ' = ' + JSON.stringify(stats.connectionSuccessRate));
      expect(stats.connectionSuccessRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#14 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#15 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#16 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#17 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#18 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();

      const history = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#19 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#20 ' + "history[1].operation" + ' = ' + JSON.stringify(history[1].operation));
      expect(history[1].operation).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#21 ' + "history[1].success" + ' = ' + JSON.stringify(history[1].success));
      expect(history[1].success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0005',
        '#22 ' + "history[1].details" + ' = ' + JSON.stringify(history[1].details));
      expect(history[1].details).assertEqual('Invalid device ID');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0006', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#1 assert ' + "expect(await manager.connect(BLANK_DEVICE)).assertTrue()");
      expect(await manager.connect(BLANK_DEVICE)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#2 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#3 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#4 assert ' + "expect(manager.getConnectedDeviceIds()[0]).assertEqual(BLANK_DEVICE)");
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(BLANK_DEVICE);
      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#5 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#6 ' + "records[1].success" + ' = ' + JSON.stringify(records[1].success));
      expect(records[1].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#7 ' + "records[1].details" + ' = ' + JSON.stringify(records[1].details));
      expect(records[1].details).assertEqual(`Connected to ${BLANK_DEVICE}`);
      const connected = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#8 ' + "connected.totalConnectionAttempts" + ' = ' + JSON.stringify(connected.totalConnectionAttempts));
      expect(connected.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#9 ' + "connected.successfulConnections" + ' = ' + JSON.stringify(connected.successfulConnections));
      expect(connected.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#10 ' + "connected.failedConnections" + ' = ' + JSON.stringify(connected.failedConnections));
      expect(connected.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#11 ' + "connected.errorRate" + ' = ' + JSON.stringify(connected.errorRate));
      expect(connected.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#12 ' + "connected.healthScore" + ' = ' + JSON.stringify(connected.healthScore));
      expect(connected.healthScore).assertEqual(HEALTHY_SCORE);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#13 assert ' + "expect(await manager.disconnect(BLANK_DEVICE)).assertTrue()");
      expect(await manager.disconnect(BLANK_DEVICE)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#14 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#15 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      const after = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#16 ' + "after.length" + ' = ' + JSON.stringify(after.length));
      expect(after.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#17 ' + "after[2].operationName" + ' = ' + JSON.stringify(after[2].operationName));
      expect(after[2].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#18 ' + "after[2].success" + ' = ' + JSON.stringify(after[2].success));
      expect(after[2].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0006',
        '#19 assert ' + "expect(historyOf(manager)[2].details).assertEqual(`Disconnected from ${BLANK_DEVICE}`)");
      expect(historyOf(manager)[2].details).assertEqual(`Disconnected from ${BLANK_DEVICE}`);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0007', 'begin');
      let longId: string = 'dev_';
      for (let i = 0; i < 249; i++) {
        longId += 'xxxx';
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#1 ' + "longId.length" + ' = ' + JSON.stringify(longId.length));
      expect(longId.length).assertEqual(LONG_ID_LENGTH);

      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#2 assert ' + "expect(await manager.connect(longId)).assertTrue()");
      expect(await manager.connect(longId)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#3 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#4 assert ' + "expect(manager.getConnectedDeviceIds()[0].length).assertEqual(LONG_ID_LENGTH)");
      expect(manager.getConnectedDeviceIds()[0].length).assertEqual(LONG_ID_LENGTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#5 assert ' + "expect(manager.getConnectedDeviceIds()[0]).assertEqual(longId)");
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(longId);

      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#6 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#7 ' + "records[1].details" + ' = ' + JSON.stringify(records[1].details));
      expect(records[1].details).assertEqual(`Connected to ${longId}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#8 ' + "records[1].details.length" + ' = ' + JSON.stringify(records[1].details.length));
      expect(records[1].details.length).assertEqual('Connected to '.length + LONG_ID_LENGTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#9 assert ' + "expect(manager.getStatistics().successfulConnections).assertEqual(1)");
      expect(manager.getStatistics().successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#10 assert ' + "expect(manager.getStatistics().failedConnections).assertEqual(0)");
      expect(manager.getStatistics().failedConnections).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#11 assert ' + "expect(await manager.disconnect(longId)).assertTrue()");
      expect(await manager.disconnect(longId)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#12 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      const history = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#13 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0007',
        '#14 ' + "history[2].details" + ' = ' + JSON.stringify(history[2].details));
      expect(history[2].details).assertEqual(`Disconnected from ${longId}`);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0008', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      const before = manager.getStatistics();
      const beforeRecords = manager.getOperationRecords().length;
      const beforeHistory = historyOf(manager).length;

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#2 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#3 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#4 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(1)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#5 assert ' + "expect(manager.getOperationRecords().length).assertEqual(beforeRecords)");
      expect(manager.getOperationRecords().length).assertEqual(beforeRecords);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#6 assert ' + "expect(historyOf(manager).length).assertEqual(beforeHistory)");
      expect(historyOf(manager).length).assertEqual(beforeHistory);

      const after = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#7 ' + "after.totalConnectionAttempts" + ' = ' + JSON.stringify(after.totalConnectionAttempts));
      expect(after.totalConnectionAttempts).assertEqual(before.totalConnectionAttempts);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#8 ' + "after.successfulConnections" + ' = ' + JSON.stringify(after.successfulConnections));
      expect(after.successfulConnections).assertEqual(before.successfulConnections);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#9 ' + "after.failedConnections" + ' = ' + JSON.stringify(after.failedConnections));
      expect(after.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#10 ' + "after.totalOperations" + ' = ' + JSON.stringify(after.totalOperations));
      expect(after.totalOperations).assertEqual(before.totalOperations);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#11 ' + "after.healthScore" + ' = ' + JSON.stringify(after.healthScore));
      expect(after.healthScore).assertEqual(HEALTHY_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#12 ' + "after.isHealthy" + ' = ' + JSON.stringify(after.isHealthy));
      expect(after.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#13 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#14 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0008',
        '#15 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0009', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#1 assert ' + "expect(await manager.disconnect(GHOST_DEVICE)).assertFalse()");
      expect(await manager.disconnect(GHOST_DEVICE)).assertFalse();

      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#2 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#3 ' + "records[1].operationName" + ' = ' + JSON.stringify(records[1].operationName));
      expect(records[1].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#4 ' + "records[1].success" + ' = ' + JSON.stringify(records[1].success));
      expect(records[1].success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#5 ' + "records[1].errorMessage" + ' = ' + JSON.stringify(records[1].errorMessage));
      expect(records[1].errorMessage).assertEqual('Not managed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#6 ' + "records[1].details" + ' = ' + JSON.stringify(records[1].details));
      expect(records[1].details).assertEqual(`Device ${GHOST_DEVICE} not managed`);

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#7 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#8 ' + "stats.disconnectionEvents" + ' = ' + JSON.stringify(stats.disconnectionEvents));
      expect(stats.disconnectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#9 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#10 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#11 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#12 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#13 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#14 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#15 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#16 assert ' + "expect(historyOf(manager).length).assertEqual(1)");
      expect(historyOf(manager).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0009',
        '#17 assert ' +
        "expect(manager.getService().getConnectionState()) .assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(manager.getService().getConnectionState())
        .assertEqual(BluetoothConnectionState.DISCONNECTED);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0010', 'begin');
      const manager = await readyManager();
      const config = manager.getConfig();
      config.maxManagedDevices = MANAGE_LIMIT;
      manager.setConfig(config);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#1 assert ' + "expect(manager.getConfig().maxManagedDevices).assertEqual(MANAGE_LIMIT)");
      expect(manager.getConfig().maxManagedDevices).assertEqual(MANAGE_LIMIT);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#2 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#3 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#4 assert ' + "expect(await manager.connect(DEVICE_C)).assertFalse()");
      expect(await manager.connect(DEVICE_C)).assertFalse();

      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#5 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#6 ' + "records[3].errorMessage" + ' = ' + JSON.stringify(records[3].errorMessage));
      expect(records[3].errorMessage).assertEqual('Max devices');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#7 ' + "records[3].details" + ' = ' + JSON.stringify(records[3].details));
      expect(records[3].details).assertEqual('Maximum managed devices reached');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#8 ' + "records[3].success" + ' = ' + JSON.stringify(records[3].success));
      expect(records[3].success).assertFalse();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#9 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(MANAGE_LIMIT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#10 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(MANAGE_LIMIT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#11 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#12 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(MANAGE_LIMIT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#13 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(MANAGE_LIMIT);

      const ids = manager.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#14 ' + "ids.length" + ' = ' + JSON.stringify(ids.length));
      expect(ids.length).assertEqual(MANAGE_LIMIT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#15 ' + "ids[0]" + ' = ' + JSON.stringify(ids[0]));
      expect(ids[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#16 ' + "ids[1]" + ' = ' + JSON.stringify(ids[1]));
      expect(ids[1]).assertEqual(DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#17 assert ' + "expect(ids.indexOf(DEVICE_C)).assertEqual(-1)");
      expect(ids.indexOf(DEVICE_C)).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#18 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#19 assert ' + "expect(historyOf(manager).length).assertEqual(3)");
      expect(historyOf(manager).length).assertEqual(3);

      await manager.disconnect(DEVICE_A);
      await manager.disconnect(DEVICE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#20 assert ' + "expect(await manager.connect(DEVICE_C)).assertTrue()");
      expect(await manager.connect(DEVICE_C)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0010',
        '#21 assert ' + "expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_C)");
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_C);

      await manager.disconnect(DEVICE_C);
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0010', 'end');
    });

    // ==================== concurrency and callback exception (2 cases) ====================

    /*
     * @tc.number: SUB_ERROR_HANDLING_1100
     * @tc.name: testErrorHandling0011
     * @tc.desc: Verify that two simultaneous connections of one device create duplicate managed entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0011', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0011', 'begin');
      const manager = await readyManager();
      const results: boolean[] = await Promise.all([manager.connect(DEVICE_A), manager.connect(DEVICE_A)]);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#1 ' + "results[0]" + ' = ' + JSON.stringify(results[0]));
      expect(results[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#2 ' + "results[1]" + ' = ' + JSON.stringify(results[1]));
      expect(results[1]).assertTrue();

      const ids = manager.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#3 ' + "ids.length" + ' = ' + JSON.stringify(ids.length));
      expect(ids.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#4 ' + "ids[0]" + ' = ' + JSON.stringify(ids[0]));
      expect(ids[0]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#5 ' + "ids[1]" + ' = ' + JSON.stringify(ids[1]));
      expect(ids[1]).assertEqual(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#6 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(2)");
      expect(manager.getManagedDeviceCount()).assertEqual(2);

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#7 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#8 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#9 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#10 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#11 assert ' + "expect(manager.getOperationRecords().length).assertEqual(3)");
      expect(manager.getOperationRecords().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#12 assert ' + "expect(historyOf(manager).length).assertEqual(3)");
      expect(historyOf(manager).length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#13 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#14 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#15 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#16 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#17 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#18 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#19 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0011',
        '#20 assert ' + "expect(manager.getStatistics().disconnectionEvents).assertEqual(2)");
      expect(manager.getStatistics().disconnectionEvents).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0012', 'begin');
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

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#2 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#3 ' + "states[0]" + ' = ' + JSON.stringify(states[0]));
      expect(states[0]).assertEqual(BluetoothConnectionState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#4 ' + "states[1]" + ' = ' + JSON.stringify(states[1]));
      expect(states[1]).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#5 ' + "badCalls" + ' = ' + JSON.stringify(badCalls));
      expect(badCalls).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#6 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#7 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#8 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#9 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#10 ' + "states[2]" + ' = ' + JSON.stringify(states[2]));
      expect(states[2]).assertEqual(BluetoothConnectionState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#11 ' + "states[3]" + ' = ' + JSON.stringify(states[3]));
      expect(states[3]).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#12 ' + "badCalls" + ' = ' + JSON.stringify(badCalls));
      expect(badCalls).assertEqual(4);

      service.removeConnectionCallback(goodCallback);
      service.removeConnectionCallback(badCallback);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#13 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#14 ' + "states.length" + ' = ' + JSON.stringify(states.length));
      expect(states.length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#15 ' + "badCalls" + ' = ' + JSON.stringify(badCalls));
      expect(badCalls).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#16 assert ' + "expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B)");
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_B);

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#17 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#18 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#19 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#20 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0012',
        '#21 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(HEALTHY_SCORE);

      await manager.disconnect(DEVICE_B);
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0012', 'end');
    });

    // ==================== statistics, record and config set consistency (6 cases) ====================

    /*
     * @tc.number: SUB_ERROR_HANDLING_1300
     * @tc.name: testErrorHandling0013
     * @tc.desc: Verify that statistics, records and device lists are returned as independent copies.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0013', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0013', 'begin');
      const manager = await readyManager();
      const before = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#1 ' + "before.totalOperations" + ' = ' + JSON.stringify(before.totalOperations));
      expect(before.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#2 ' + "before.failedConnections" + ' = ' + JSON.stringify(before.failedConnections));
      expect(before.failedConnections).assertEqual(0);

      await manager.connect('');
      const after = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#3 ' + "before.totalOperations" + ' = ' + JSON.stringify(before.totalOperations));
      expect(before.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#4 ' + "before.failedConnections" + ' = ' + JSON.stringify(before.failedConnections));
      expect(before.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#5 ' + "before.errorRate" + ' = ' + JSON.stringify(before.errorRate));
      expect(before.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#6 ' + "after.totalOperations" + ' = ' + JSON.stringify(after.totalOperations));
      expect(after.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#7 ' + "after.failedConnections" + ' = ' + JSON.stringify(after.failedConnections));
      expect(after.failedConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#8 ' + "after.errorRate" + ' = ' + JSON.stringify(after.errorRate));
      expect(after.errorRate).assertEqual(50);

      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#9 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(2);
      records.push(records[0]);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#10 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#11 assert ' + "expect(manager.getOperationRecords()[0].operationName).assertEqual('initialize')");
      expect(manager.getOperationRecords()[0].operationName).assertEqual('initialize');

      const ids = manager.getConnectedDeviceIds();
      ids.push('injected_device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#12 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#13 assert ' + "expect(manager.getConnectedDeviceIds().indexOf('injected_device')).assertEqual(-1)");
      expect(manager.getConnectedDeviceIds().indexOf('injected_device')).assertEqual(-1);

      const snapshot = manager.getStatistics();
      snapshot.totalOperations = 999;
      snapshot.failedConnections = 999;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#14 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(2)");
      expect(manager.getStatistics().totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0013',
        '#15 assert ' + "expect(manager.getStatistics().failedConnections).assertEqual(1)");
      expect(manager.getStatistics().failedConnections).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0013', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0014', 'begin');
      const manager = await readyManager();
      const initRecord = manager.getOperationRecords()[0];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#1 ' + "initRecord.operationId" + ' = ' + JSON.stringify(initRecord.operationId));
      expect(initRecord.operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#2 ' + "initRecord.success" + ' = ' + JSON.stringify(initRecord.success));
      expect(initRecord.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#3 ' + "initRecord.errorMessage" + ' = ' + JSON.stringify(initRecord.errorMessage));
      expect(initRecord.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#4 ' + "initRecord.details" + ' = ' + JSON.stringify(initRecord.details));
      expect(initRecord.details).assertEqual('Manager initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#5 ' + "initRecord.durationMs" + ' = ' + JSON.stringify(initRecord.durationMs));
      expect(initRecord.durationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#6 ' + "initRecord.startTime" + ' = ' + JSON.stringify(initRecord.startTime));
      expect(initRecord.startTime).assertEqual(initRecord.endTime);

      await manager.connect('');
      const failed = manager.getOperationRecords()[1];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#7 ' + "failed.operationId" + ' = ' + JSON.stringify(failed.operationId));
      expect(failed.operationId).assertEqual('mgr_op_2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#8 ' + "failed.success" + ' = ' + JSON.stringify(failed.success));
      expect(failed.success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#9 ' + "failed.errorMessage" + ' = ' + JSON.stringify(failed.errorMessage));
      expect(failed.errorMessage).assertEqual('Connection failed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#10 ' + "failed.durationMs" + ' = ' + JSON.stringify(failed.durationMs));
      expect(failed.durationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#11 ' + "failed.startTime" + ' = ' + JSON.stringify(failed.startTime));
      expect(failed.startTime).assertEqual(failed.endTime);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#12 ' + "failed.startTime >= initRecord.startTime" + ' = ' +
        JSON.stringify(failed.startTime >= initRecord.startTime));
      expect(failed.startTime >= initRecord.startTime).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#13 assert ' + "expect(manager.getStatistics().lastOperationTime).assertEqual(failed.endTime)");
      expect(manager.getStatistics().lastOperationTime).assertEqual(failed.endTime);

      await manager.disconnect(GHOST_DEVICE);
      const ghost = manager.getOperationRecords()[2];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#14 ' + "ghost.operationId" + ' = ' + JSON.stringify(ghost.operationId));
      expect(ghost.operationId).assertEqual('mgr_op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#15 ' + "ghost.operationName" + ' = ' + JSON.stringify(ghost.operationName));
      expect(ghost.operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#16 ' + "ghost.errorMessage" + ' = ' + JSON.stringify(ghost.errorMessage));
      expect(ghost.errorMessage).assertEqual('Not managed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#17 assert ' + "expect(manager.getStatistics().lastOperationTime).assertEqual(ghost.endTime)");
      expect(manager.getStatistics().lastOperationTime).assertEqual(ghost.endTime);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#18 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      const ok = manager.getOperationRecords()[3];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#19 ' + "ok.operationId" + ' = ' + JSON.stringify(ok.operationId));
      expect(ok.operationId).assertEqual('mgr_op_4');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#20 ' + "ok.success" + ' = ' + JSON.stringify(ok.success));
      expect(ok.success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#21 ' + "ok.errorMessage" + ' = ' + JSON.stringify(ok.errorMessage));
      expect(ok.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#22 ' + "ok.details" + ' = ' + JSON.stringify(ok.details));
      expect(ok.details).assertEqual(`Connected to ${DEVICE_A}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0014',
        '#23 assert ' + "expect(manager.getOperationRecords().length).assertEqual(4)");
      expect(manager.getOperationRecords().length).assertEqual(4);

      await manager.disconnect(DEVICE_A);
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0014', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0015', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#1 assert ' + "expect(await manager.connect('')).assertFalse()");
      expect(await manager.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#2 assert ' + "expect(await manager.disconnect(GHOST_DEVICE)).assertFalse()");
      expect(await manager.disconnect(GHOST_DEVICE)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#3 assert ' + "expect(manager.getOperationRecords().length).assertEqual(3)");
      expect(manager.getOperationRecords().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#4 assert ' + "expect(manager.getStatistics().totalConnectionAttempts).assertEqual(1)");
      expect(manager.getStatistics().totalConnectionAttempts).assertEqual(1);

      await manager.reset();

      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#5 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#6 ' + "records[0].operationName" + ' = ' + JSON.stringify(records[0].operationName));
      expect(records[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#7 ' + "records[0].success" + ' = ' + JSON.stringify(records[0].success));
      expect(records[0].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#8 ' + "records[0].errorMessage" + ' = ' + JSON.stringify(records[0].errorMessage));
      expect(records[0].errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#9 ' + "records[0].details" + ' = ' + JSON.stringify(records[0].details));
      expect(records[0].details).assertEqual('Manager reset');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#10 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#11 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#12 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#13 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#14 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#15 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#16 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#17 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#18 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#19 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#20 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);

      const history = historyOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#21 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#22 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0015',
        '#23 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service reset');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0015', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0016', 'begin');
      const manager = await readyManager();
      let unexpected: number = 0;
      for (let i = 0; i < FAILURE_ROUNDS; i++) {
        if (await manager.connect('')) {
          unexpected = unexpected + 1;
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#1 ' + "unexpected" + ' = ' + JSON.stringify(unexpected));
      expect(unexpected).assertEqual(0);

      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#2 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(RECORD_CAP);
      const firstKept: number = FAILURE_ROUNDS + 2 - RECORD_CAP;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#3 ' + "records[0].operationId" + ' = ' + JSON.stringify(records[0].operationId));
      expect(records[0].operationId).assertEqual(`mgr_op_${firstKept}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#4 ' + "records[RECORD_CAP - 1].operationId" + ' = ' + JSON.stringify(records[RECORD_CAP - 1].operationId));
      expect(records[RECORD_CAP - 1].operationId).assertEqual(`mgr_op_${FAILURE_ROUNDS + 1}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#5 ' + "records[0].operationName" + ' = ' + JSON.stringify(records[0].operationName));
      expect(records[0].operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#6 ' + "records[RECORD_CAP - 1].success" + ' = ' + JSON.stringify(records[RECORD_CAP - 1].success));
      expect(records[RECORD_CAP - 1].success).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#7 ' + "records[RECORD_CAP - 1].errorMessage" + ' = ' + JSON.stringify(records[RECORD_CAP - 1].errorMessage));
      expect(records[RECORD_CAP - 1].errorMessage).assertEqual('Connection failed');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#8 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(FAILURE_ROUNDS + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#9 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(FAILURE_ROUNDS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#10 ' + "stats.successfulOperations" + ' = ' + JSON.stringify(stats.successfulOperations));
      expect(stats.successfulOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#11 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(FAILURE_ROUNDS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#12 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(FAILURE_ROUNDS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#13 ' + "stats.operationSuccessRate" + ' = ' + JSON.stringify(stats.operationSuccessRate));
      expect(stats.operationSuccessRate).assertEqual(1 / (FAILURE_ROUNDS + 1) * 100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#14 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#15 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0016',
        '#16 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0016', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0017', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#1 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#2 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#3 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#4 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#5 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#6 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#7 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#8 ' + "stats.disconnectionEvents" + ' = ' + JSON.stringify(stats.disconnectionEvents));
      expect(stats.disconnectionEvents).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#9 ' + "stats.connectionSuccessRate" + ' = ' + JSON.stringify(stats.connectionSuccessRate));
      expect(stats.connectionSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#10 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#11 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#12 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#13 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(HEALTHY_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#14 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#15 ' + "stats.managedDeviceCount" + ' = ' + JSON.stringify(stats.managedDeviceCount));
      expect(stats.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#16 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#17 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#18 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(0)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#19 assert ' + "expect(manager.getOperationRecords().length).assertEqual(5)");
      expect(manager.getOperationRecords().length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0017',
        '#20 assert ' + "expect(historyOf(manager).length).assertEqual(5)");
      expect(historyOf(manager).length).assertEqual(5);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0017', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0018', 'begin');
      const manager = await readyManager();
      const defaults = manager.getConfig();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#1 ' + "defaults.connectionTimeoutMs" + ' = ' + JSON.stringify(defaults.connectionTimeoutMs));
      expect(defaults.connectionTimeoutMs).assertEqual(30000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#2 ' + "defaults.operationTimeoutMs" + ' = ' + JSON.stringify(defaults.operationTimeoutMs));
      expect(defaults.operationTimeoutMs).assertEqual(10000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#3 ' + "defaults.maxRetryAttempts" + ' = ' + JSON.stringify(defaults.maxRetryAttempts));
      expect(defaults.maxRetryAttempts).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#4 ' + "defaults.retryDelayMs" + ' = ' + JSON.stringify(defaults.retryDelayMs));
      expect(defaults.retryDelayMs).assertEqual(1000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#5 ' + "defaults.useExponentialBackoff" + ' = ' + JSON.stringify(defaults.useExponentialBackoff));
      expect(defaults.useExponentialBackoff).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#6 ' + "defaults.maxBackoffDelayMs" + ' = ' + JSON.stringify(defaults.maxBackoffDelayMs));
      expect(defaults.maxBackoffDelayMs).assertEqual(30000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#7 ' + "defaults.autoReconnect" + ' = ' + JSON.stringify(defaults.autoReconnect));
      expect(defaults.autoReconnect).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#8 ' + "defaults.maxAutoReconnectAttempts" + ' = ' + JSON.stringify(defaults.maxAutoReconnectAttempts));
      expect(defaults.maxAutoReconnectAttempts).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#9 ' + "defaults.autoReconnectDelayMs" + ' = ' + JSON.stringify(defaults.autoReconnectDelayMs));
      expect(defaults.autoReconnectDelayMs).assertEqual(5000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#10 ' + "defaults.maxQueueSize" + ' = ' + JSON.stringify(defaults.maxQueueSize));
      expect(defaults.maxQueueSize).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#11 ' + "defaults.maxManagedDevices" + ' = ' + JSON.stringify(defaults.maxManagedDevices));
      expect(defaults.maxManagedDevices).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#12 ' + "defaults.verboseLogging" + ' = ' + JSON.stringify(defaults.verboseLogging));
      expect(defaults.verboseLogging).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#13 ' + "defaults.enablePerformanceTracing" + ' = ' + JSON.stringify(defaults.enablePerformanceTracing));
      expect(defaults.enablePerformanceTracing).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#14 ' + "defaults.healthCheckIntervalMs" + ' = ' + JSON.stringify(defaults.healthCheckIntervalMs));
      expect(defaults.healthCheckIntervalMs).assertEqual(60000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#15 ' + "defaults.minHealthScoreThreshold" + ' = ' + JSON.stringify(defaults.minHealthScoreThreshold));
      expect(defaults.minHealthScoreThreshold).assertEqual(50);

      const mutated = manager.getConfig();
      mutated.maxRetryAttempts = 999;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#16 assert ' + "expect(manager.getConfig().maxRetryAttempts).assertEqual(3)");
      expect(manager.getConfig().maxRetryAttempts).assertEqual(3);

      const partial = manager.getConfig();
      partial.connectionTimeoutMs = -1;
      partial.maxQueueSize = 0;
      manager.setConfig(partial);
      const applied = manager.getConfig();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#17 ' + "applied.connectionTimeoutMs" + ' = ' + JSON.stringify(applied.connectionTimeoutMs));
      expect(applied.connectionTimeoutMs).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#18 ' + "applied.maxQueueSize" + ' = ' + JSON.stringify(applied.maxQueueSize));
      expect(applied.maxQueueSize).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#19 ' + "applied.operationTimeoutMs" + ' = ' + JSON.stringify(applied.operationTimeoutMs));
      expect(applied.operationTimeoutMs).assertEqual(10000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#20 ' + "applied.maxManagedDevices" + ' = ' + JSON.stringify(applied.maxManagedDevices));
      expect(applied.maxManagedDevices).assertEqual(10);

      const restored = manager.getConfig();
      restored.connectionTimeoutMs = 30000;
      restored.maxQueueSize = 50;
      manager.setConfig(restored);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#21 assert ' + "expect(manager.getConfig().connectionTimeoutMs).assertEqual(30000)");
      expect(manager.getConfig().connectionTimeoutMs).assertEqual(30000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#22 assert ' + "expect(manager.getConfig().maxQueueSize).assertEqual(50)");
      expect(manager.getConfig().maxQueueSize).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0018',
        '#23 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();

      await manager.disconnect(DEVICE_A);
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0018', 'end');
    });

    // ==================== health score and fault isolation (4 cases) ====================

    /*
     * @tc.number: SUB_ERROR_HANDLING_1900
     * @tc.name: testErrorHandling0019
     * @tc.desc: Verify the health score degradation and recovery steps after a failed and a valid connection.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0019', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0019', 'begin');
      const manager = await readyManager();
      const idle = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#1 ' + "idle.healthScore" + ' = ' + JSON.stringify(idle.healthScore));
      expect(idle.healthScore).assertEqual(IDLE_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#2 ' + "idle.isHealthy" + ' = ' + JSON.stringify(idle.isHealthy));
      expect(idle.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#3 ' + "idle.errorRate" + ' = ' + JSON.stringify(idle.errorRate));
      expect(idle.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#4 ' + "idle.connectionSuccessRate" + ' = ' + JSON.stringify(idle.connectionSuccessRate));
      expect(idle.connectionSuccessRate).assertEqual(0);

      await manager.connect('');
      const degraded = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#5 ' + "degraded.errorRate" + ' = ' + JSON.stringify(degraded.errorRate));
      expect(degraded.errorRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#6 ' + "degraded.connectionSuccessRate" + ' = ' + JSON.stringify(degraded.connectionSuccessRate));
      expect(degraded.connectionSuccessRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#7 ' + "degraded.healthScore" + ' = ' + JSON.stringify(degraded.healthScore));
      expect(degraded.healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#8 ' + "degraded.isHealthy" + ' = ' + JSON.stringify(degraded.isHealthy));
      expect(degraded.isHealthy).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#9 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      const mixed = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#10 ' + "mixed.totalConnectionAttempts" + ' = ' + JSON.stringify(mixed.totalConnectionAttempts));
      expect(mixed.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#11 ' + "mixed.successfulConnections" + ' = ' + JSON.stringify(mixed.successfulConnections));
      expect(mixed.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#12 ' + "mixed.connectionSuccessRate" + ' = ' + JSON.stringify(mixed.connectionSuccessRate));
      expect(mixed.connectionSuccessRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#13 ' + "mixed.errorRate" + ' = ' + JSON.stringify(mixed.errorRate));
      expect(mixed.errorRate).assertEqual(1 / 3 * 100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#14 ' + "mixed.healthScore" + ' = ' + JSON.stringify(mixed.healthScore));
      expect(mixed.healthScore).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#15 ' + "mixed.isHealthy" + ' = ' + JSON.stringify(mixed.isHealthy));
      expect(mixed.isHealthy).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#16 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      const settled = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#17 ' + "settled.totalOperations" + ' = ' + JSON.stringify(settled.totalOperations));
      expect(settled.totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#18 ' + "settled.failedOperations" + ' = ' + JSON.stringify(settled.failedOperations));
      expect(settled.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#19 ' + "settled.errorRate" + ' = ' + JSON.stringify(settled.errorRate));
      expect(settled.errorRate).assertEqual(25);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#20 ' + "settled.connectionSuccessRate" + ' = ' + JSON.stringify(settled.connectionSuccessRate));
      expect(settled.connectionSuccessRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#21 ' + "settled.healthScore" + ' = ' + JSON.stringify(settled.healthScore));
      expect(settled.healthScore).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#22 ' + "settled.isHealthy" + ' = ' + JSON.stringify(settled.isHealthy));
      expect(settled.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0019',
        '#23 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0019', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0020', 'begin');
      const manager = await readyManager();
      const idle = healthOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#1 ' + "idle.isHealthy" + ' = ' + JSON.stringify(idle.isHealthy));
      expect(idle.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#2 ' + "idle.healthScore" + ' = ' + JSON.stringify(idle.healthScore));
      expect(idle.healthScore).assertEqual(IDLE_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#3 ' + "idle.lastError" + ' = ' + JSON.stringify(idle.lastError));
      expect(idle.lastError).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#4 ' + "idle.errorRate" + ' = ' + JSON.stringify(idle.errorRate));
      expect(idle.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#5 ' + "idle.operationSuccessRate" + ' = ' + JSON.stringify(idle.operationSuccessRate));
      expect(idle.operationSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#6 ' + "idle.connectionSuccessRate" + ' = ' + JSON.stringify(idle.connectionSuccessRate));
      expect(idle.connectionSuccessRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#7 ' + "idle.managedDeviceCount" + ' = ' + JSON.stringify(idle.managedDeviceCount));
      expect(idle.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#8 ' + "idle.queuedOperationCount" + ' = ' + JSON.stringify(idle.queuedOperationCount));
      expect(idle.queuedOperationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#9 ' + "idle.retryAttempts" + ' = ' + JSON.stringify(idle.retryAttempts));
      expect(idle.retryAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#10 ' + "idle.uptimeMs >= 0" + ' = ' + JSON.stringify(idle.uptimeMs >= 0));
      expect(idle.uptimeMs >= 0).assertTrue();

      await manager.connect('');
      const failed = healthOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#11 ' + "failed.lastError" + ' = ' + JSON.stringify(failed.lastError));
      expect(failed.lastError).assertEqual('Connection failed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#12 ' + "failed.errorRate" + ' = ' + JSON.stringify(failed.errorRate));
      expect(failed.errorRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#13 ' + "failed.operationSuccessRate" + ' = ' + JSON.stringify(failed.operationSuccessRate));
      expect(failed.operationSuccessRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#14 ' + "failed.healthScore" + ' = ' + JSON.stringify(failed.healthScore));
      expect(failed.healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#15 ' + "failed.isHealthy" + ' = ' + JSON.stringify(failed.isHealthy));
      expect(failed.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#16 ' + "failed.queuedOperationCount" + ' = ' + JSON.stringify(failed.queuedOperationCount));
      expect(failed.queuedOperationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#17 ' + "failed.managedDeviceCount" + ' = ' + JSON.stringify(failed.managedDeviceCount));
      expect(failed.managedDeviceCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#18 ' + "failed.healthScore" + ' = ' + JSON.stringify(failed.healthScore));
      expect(failed.healthScore).assertEqual(manager.getStatistics().healthScore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0020',
        '#19 ' + "failed.errorRate" + ' = ' + JSON.stringify(failed.errorRate));
      expect(failed.errorRate).assertEqual(manager.getStatistics().errorRate);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0020', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0021', 'begin');
      const first = await readyManager();
      const second = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#1 assert ' + "expect(await first.connect('')).assertFalse()");
      expect(await first.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#2 assert ' + "expect(await first.disconnect(GHOST_DEVICE)).assertFalse()");
      expect(await first.disconnect(GHOST_DEVICE)).assertFalse();

      const firstStats = first.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#3 ' + "firstStats.totalConnectionAttempts" + ' = ' + JSON.stringify(firstStats.totalConnectionAttempts));
      expect(firstStats.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#4 ' + "firstStats.failedConnections" + ' = ' + JSON.stringify(firstStats.failedConnections));
      expect(firstStats.failedConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#5 ' + "firstStats.totalOperations" + ' = ' + JSON.stringify(firstStats.totalOperations));
      expect(firstStats.totalOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#6 ' + "firstStats.failedOperations" + ' = ' + JSON.stringify(firstStats.failedOperations));
      expect(firstStats.failedOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#7 ' + "firstStats.errorRate" + ' = ' + JSON.stringify(firstStats.errorRate));
      expect(firstStats.errorRate).assertEqual(2 / 3 * 100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#8 ' + "firstStats.healthScore" + ' = ' + JSON.stringify(firstStats.healthScore));
      expect(firstStats.healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#9 ' + "firstStats.isHealthy" + ' = ' + JSON.stringify(firstStats.isHealthy));
      expect(firstStats.isHealthy).assertFalse();

      const secondStats = second.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#10 ' + "secondStats.totalConnectionAttempts" + ' = ' + JSON.stringify(secondStats.totalConnectionAttempts));
      expect(secondStats.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#11 ' + "secondStats.failedConnections" + ' = ' + JSON.stringify(secondStats.failedConnections));
      expect(secondStats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#12 ' + "secondStats.totalOperations" + ' = ' + JSON.stringify(secondStats.totalOperations));
      expect(secondStats.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#13 ' + "secondStats.failedOperations" + ' = ' + JSON.stringify(secondStats.failedOperations));
      expect(secondStats.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#14 ' + "secondStats.errorRate" + ' = ' + JSON.stringify(secondStats.errorRate));
      expect(secondStats.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#15 ' + "secondStats.healthScore" + ' = ' + JSON.stringify(secondStats.healthScore));
      expect(secondStats.healthScore).assertEqual(IDLE_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#16 ' + "secondStats.isHealthy" + ' = ' + JSON.stringify(secondStats.isHealthy));
      expect(secondStats.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#17 assert ' + "expect(second.getOperationRecords().length).assertEqual(1)");
      expect(second.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#18 assert ' + "expect(second.getConnectedDeviceIds().length).assertEqual(0)");
      expect(second.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#19 assert ' + "expect(second.isConnected()).assertFalse()");
      expect(second.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#20 assert ' + "expect(await second.connect(DEVICE_B)).assertTrue()");
      expect(await second.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#21 assert ' + "expect(second.isConnected()).assertTrue()");
      expect(second.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#22 assert ' + "expect(first.isConnected()).assertFalse()");
      expect(first.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0021',
        '#23 assert ' + "expect(second.getStatistics().healthScore).assertEqual(HEALTHY_SCORE)");
      expect(second.getStatistics().healthScore).assertEqual(HEALTHY_SCORE);

      await second.disconnect(DEVICE_B);
      await first.destroy();
      await second.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0021', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0022', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#1 assert ' + "expect(await manager.connect('')).assertFalse()");
      expect(await manager.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#2 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(1)");
      expect(manager.getStatistics().failedOperations).assertEqual(1);

      await manager.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#3 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#4 assert ' + "expect(await manager.connect(DEVICE_A)).assertTrue()");
      expect(await manager.connect(DEVICE_A)).assertTrue();
      const records = manager.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#5 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#6 ' + "records[0].operationName" + ' = ' + JSON.stringify(records[0].operationName));
      expect(records[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#7 ' + "records[1].operationName" + ' = ' + JSON.stringify(records[1].operationName));
      expect(records[1].operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#8 ' + "records[1].success" + ' = ' + JSON.stringify(records[1].success));
      expect(records[1].success).assertTrue();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#9 ' + "stats.totalConnectionAttempts" + ' = ' + JSON.stringify(stats.totalConnectionAttempts));
      expect(stats.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#10 ' + "stats.successfulConnections" + ' = ' + JSON.stringify(stats.successfulConnections));
      expect(stats.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#11 ' + "stats.failedConnections" + ' = ' + JSON.stringify(stats.failedConnections));
      expect(stats.failedConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#12 ' + "stats.connectionSuccessRate" + ' = ' + JSON.stringify(stats.connectionSuccessRate));
      expect(stats.connectionSuccessRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#13 ' + "stats.totalOperations" + ' = ' + JSON.stringify(stats.totalOperations));
      expect(stats.totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#14 ' + "stats.failedOperations" + ' = ' + JSON.stringify(stats.failedOperations));
      expect(stats.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#15 ' + "stats.errorRate" + ' = ' + JSON.stringify(stats.errorRate));
      expect(stats.errorRate).assertEqual(25);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#16 ' + "stats.healthScore" + ' = ' + JSON.stringify(stats.healthScore));
      expect(stats.healthScore).assertEqual(60);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#17 ' + "stats.isHealthy" + ' = ' + JSON.stringify(stats.isHealthy));
      expect(stats.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#18 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#19 assert ' + "expect(manager.isConnected()).assertTrue()");
      expect(manager.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#20 assert ' + "expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A)");
      expect(manager.getConnectedDeviceIds()[0]).assertEqual(DEVICE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#21 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testErrorHandling0022',
        '#22 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testErrorHandling0022', 'end');
    });
  });
}
