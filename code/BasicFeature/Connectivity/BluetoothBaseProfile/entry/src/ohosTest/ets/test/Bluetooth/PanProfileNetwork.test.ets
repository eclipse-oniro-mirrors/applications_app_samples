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
import {
  BluetoothConnectionState,
  PanModel,
  PanProfileManager,
  PanService
} from 'library';
import { PanServiceStatistics } from 'library';

/**
 * @description Test suite for PAN network sharing of PanProfileManager
 * @since 26.0.0
 */

const SERVICE_NAME: string = 'PanService';
const DEVICE_A: string = 'pan_net_device_a';
const DEVICE_B: string = 'pan_net_device_b';
const DEFAULT_NETWORK_ROLE: string = 'none';

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

function recordsOf(manager: PanProfileManager): RecordView[] {
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

function lastRecord(manager: PanProfileManager): RecordView {
  const list = recordsOf(manager);
  return list[list.length - 1];
}

function recordNames(manager: PanProfileManager): string[] {
  const list = recordsOf(manager);
  const names: string[] = [];
  for (let i = 0; i < list.length; i++) {
    names.push(list[i].operationName);
  }
  return names;
}

function serviceHistoryCount(manager: PanProfileManager): number {
  return manager.getService().getOperationHistory().length;
}

async function readyManager(): Promise<PanProfileManager> {
  const manager: PanProfileManager = new PanProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<PanProfileManager> {
  const manager: PanProfileManager = new PanProfileManager();
  await manager.initialize();
  await manager.connect(deviceId);
  return manager;
}

export default function panProfileNetworkTest(): void {
  describe('PanProfileNetworkTest', () => {
    /*
     * @tc.number: SUB_PAN_NET_0100
     * @tc.name: testPanNet0001
     * @tc.desc: Verify that tethering control and every network reading are blocked before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanNet0001', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0001', 'begin');
      const manager: PanProfileManager = new PanProfileManager();
      const service: PanService = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#1 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#2 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#3 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#4 assert ' + "expect(await manager.enableTethering()).assertFalse()");
      expect(await manager.enableTethering()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#5 assert ' + "expect(await manager.disableTethering()).assertFalse()");
      expect(await manager.disableTethering()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#6 assert ' + "expect(manager.getIpAddress()).assertEqual('')");
      expect(manager.getIpAddress()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#7 assert ' + "expect(manager.getSubnetMask()).assertEqual('')");
      expect(manager.getSubnetMask()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#8 assert ' + "expect(manager.getGateway()).assertEqual('')");
      expect(manager.getGateway()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#9 assert ' + "expect(manager.getDnsServer()).assertEqual('')");
      expect(manager.getDnsServer()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#10 assert ' + "expect(manager.getUploadSpeed()).assertEqual(0)");
      expect(manager.getUploadSpeed()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#11 assert ' + "expect(manager.getDownloadSpeed()).assertEqual(0)");
      expect(manager.getDownloadSpeed()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#12 assert ' + "expect(manager.getBytesTransferred()).assertEqual(0)");
      expect(manager.getBytesTransferred()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#13 assert ' + "expect(manager.getConnectedDeviceCount()).assertEqual(0)");
      expect(manager.getConnectedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#14 assert ' + "expect(manager.getNetworkRole()).assertEqual(0)");
      expect(manager.getNetworkRole()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#15 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#16 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#17 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0001',
        '#18 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0001', 'end');
    });

    /*
     * @tc.number: SUB_PAN_NET_0200
     * @tc.name: testPanNet0002
     * @tc.desc: Verify that only enabling tethering requires a managed device while disabling always succeeds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanNet0002', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0002', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#2 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#3 assert ' + "expect(await manager.enableTethering()).assertFalse()");
      expect(await manager.enableTethering()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#4 assert ' + "expect(await manager.enableTethering()).assertFalse()");
      expect(await manager.enableTethering()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#5 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#6 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#7 assert ' + "expect(manager.getIpAddress()).assertEqual('')");
      expect(manager.getIpAddress()).assertEqual('');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#8 assert ' + "expect(await manager.disableTethering()).assertTrue()");
      expect(await manager.disableTethering()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#9 assert ' + "expect(lastRecord(manager).operationName).assertEqual('disableTethering')");
      expect(lastRecord(manager).operationName).assertEqual('disableTethering');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#10 assert ' + "expect(lastRecord(manager).details).assertEqual('Tethering disabled')");
      expect(lastRecord(manager).details).assertEqual('Tethering disabled');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#11 assert ' + "expect(lastRecord(manager).operationId).assertEqual('mgr_op_2')");
      expect(lastRecord(manager).operationId).assertEqual('mgr_op_2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#12 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0002',
        '#13 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0002', 'end');
    });

    /*
     * @tc.number: SUB_PAN_NET_0300
     * @tc.name: testPanNet0003
     * @tc.desc: Verify the recorded details of a tethering cycle on a connected device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanNet0003', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0003', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#2 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#3 assert ' + "expect(await manager.enableTethering()).assertTrue()");
      expect(await manager.enableTethering()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#4 assert ' + "expect(await manager.disableTethering()).assertTrue()");
      expect(await manager.disableTethering()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#5 assert ' + "expect(await manager.enableTethering()).assertTrue()");
      expect(await manager.enableTethering()).assertTrue();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#6 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#7 ' + "records[2].operationName" + ' = ' + JSON.stringify(records[2].operationName));
      expect(records[2].operationName).assertEqual('enableTethering');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#8 ' + "records[2].details" + ' = ' + JSON.stringify(records[2].details));
      expect(records[2].details).assertEqual('Tethering enabled');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#9 ' + "records[3].operationName" + ' = ' + JSON.stringify(records[3].operationName));
      expect(records[3].operationName).assertEqual('disableTethering');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#10 ' + "records[3].details" + ' = ' + JSON.stringify(records[3].details));
      expect(records[3].details).assertEqual('Tethering disabled');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#11 ' + "records[4].details" + ' = ' + JSON.stringify(records[4].details));
      expect(records[4].details).assertEqual('Tethering enabled');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#12 ' + "records[2].operationId" + ' = ' + JSON.stringify(records[2].operationId));
      expect(records[2].operationId).assertEqual('mgr_op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#13 ' + "records[4].operationId" + ' = ' + JSON.stringify(records[4].operationId));
      expect(records[4].operationId).assertEqual('mgr_op_5');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#14 ' + "records[4].success" + ' = ' + JSON.stringify(records[4].success));
      expect(records[4].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#15 ' + "records[4].errorMessage" + ' = ' + JSON.stringify(records[4].errorMessage));
      expect(records[4].errorMessage).assertEqual('');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#16 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0003',
        '#17 assert ' + "expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect')");
      expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0003', 'end');
    });

    /*
     * @tc.number: SUB_PAN_NET_0400
     * @tc.name: testPanNet0004
     * @tc.desc: Verify that the four network parameters stay empty even while tethering is enabled.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanNet0004', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0004', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0004',
        '#1 assert ' + "expect(await manager.enableTethering()).assertTrue()");
      expect(await manager.enableTethering()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0004',
        '#2 assert ' + "expect(manager.getIpAddress()).assertEqual('')");
      expect(manager.getIpAddress()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0004',
        '#3 assert ' + "expect(manager.getSubnetMask()).assertEqual('')");
      expect(manager.getSubnetMask()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0004',
        '#4 assert ' + "expect(manager.getGateway()).assertEqual('')");
      expect(manager.getGateway()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0004',
        '#5 assert ' + "expect(manager.getDnsServer()).assertEqual('')");
      expect(manager.getDnsServer()).assertEqual('');

      const exposed: PanModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0004',
        '#6 ' + "exposed.ipAddress" + ' = ' + JSON.stringify(exposed.ipAddress));
      expect(exposed.ipAddress).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0004',
        '#7 ' + "exposed.subnetMask" + ' = ' + JSON.stringify(exposed.subnetMask));
      expect(exposed.subnetMask).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0004',
        '#8 ' + "exposed.gatewayAddress" + ' = ' + JSON.stringify(exposed.gatewayAddress));
      expect(exposed.gatewayAddress).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0004',
        '#9 ' + "exposed.dnsServer" + ' = ' + JSON.stringify(exposed.dnsServer));
      expect(exposed.dnsServer).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0004',
        '#10 assert ' + "expect(manager.getStatistics().connectedDeviceCount).assertEqual(1)");
      expect(manager.getStatistics().connectedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0004',
        '#11 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0004', 'end');
    });

    /*
     * @tc.number: SUB_PAN_NET_0500
     * @tc.name: testPanNet0005
     * @tc.desc: Verify that throughput readings stay zero because no traffic is ever accounted.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanNet0005', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0005', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0005',
        '#1 assert ' + "expect(await manager.enableTethering()).assertTrue()");
      expect(await manager.enableTethering()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0005',
        '#2 assert ' + "expect(await manager.disableTethering()).assertTrue()");
      expect(await manager.disableTethering()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0005',
        '#3 assert ' + "expect(await manager.enableTethering()).assertTrue()");
      expect(await manager.enableTethering()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0005',
        '#4 assert ' + "expect(manager.getUploadSpeed()).assertEqual(0)");
      expect(manager.getUploadSpeed()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0005',
        '#5 assert ' + "expect(manager.getDownloadSpeed()).assertEqual(0)");
      expect(manager.getDownloadSpeed()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0005',
        '#6 assert ' + "expect(manager.getBytesTransferred()).assertEqual(0)");
      expect(manager.getBytesTransferred()).assertEqual(0);

      const exposed: PanModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0005',
        '#7 ' + "exposed.uploadSpeed" + ' = ' + JSON.stringify(exposed.uploadSpeed));
      expect(exposed.uploadSpeed).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0005',
        '#8 ' + "exposed.downloadSpeed" + ' = ' + JSON.stringify(exposed.downloadSpeed));
      expect(exposed.downloadSpeed).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0005',
        '#9 ' + "exposed.bytesTransferred" + ' = ' + JSON.stringify(exposed.bytesTransferred));
      expect(exposed.bytesTransferred).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0005',
        '#10 assert ' + "expect(recordsOf(manager).length).assertEqual(5)");
      expect(recordsOf(manager).length).assertEqual(5);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0005', 'end');
    });

    /*
     * @tc.number: SUB_PAN_NET_0600
     * @tc.name: testPanNet0006
     * @tc.desc: Compare the profile device counter with the managed device list of the manager.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanNet0006', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0006', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0006',
        '#1 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0006',
        '#2 assert ' + "expect(manager.getConnectedDeviceCount()).assertEqual(0)");
      expect(manager.getConnectedDeviceCount()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0006',
        '#3 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0006',
        '#4 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(2)");
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0006',
        '#5 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(2)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0006',
        '#6 assert ' + "expect(manager.getConnectedDeviceCount()).assertEqual(0)");
      expect(manager.getConnectedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0006',
        '#7 assert ' + "expect(manager.getModel().connectedDeviceCount).assertEqual(0)");
      expect(manager.getModel().connectedDeviceCount).assertEqual(0);

      const stats: PanServiceStatistics = manager.getService().getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0006',
        '#8 ' + "stats.connectedDeviceCount" + ' = ' + JSON.stringify(stats.connectedDeviceCount));
      expect(stats.connectedDeviceCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0006',
        '#9 ' + "stats.serviceName" + ' = ' + JSON.stringify(stats.serviceName));
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0006',
        '#10 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(3)");
      expect(serviceHistoryCount(manager)).assertEqual(3);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0006', 'end');
    });

    /*
     * @tc.number: SUB_PAN_NET_0700
     * @tc.name: testPanNet0007
     * @tc.desc: Verify that the numeric network role stays zero while the model keeps the text role.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanNet0007', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0007', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0007',
        '#1 assert ' + "expect(manager.getNetworkRole()).assertEqual(0)");
      expect(manager.getNetworkRole()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0007',
        '#2 assert ' + "expect(await manager.enableTethering()).assertTrue()");
      expect(await manager.enableTethering()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0007',
        '#3 assert ' + "expect(manager.getNetworkRole()).assertEqual(0)");
      expect(manager.getNetworkRole()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0007',
        '#4 assert ' + "expect(await manager.disableTethering()).assertTrue()");
      expect(await manager.disableTethering()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0007',
        '#5 assert ' + "expect(manager.getNetworkRole()).assertEqual(0)");
      expect(manager.getNetworkRole()).assertEqual(0);

      const exposed: PanModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0007',
        '#6 ' + "exposed.networkRole" + ' = ' + JSON.stringify(exposed.networkRole));
      expect(exposed.networkRole).assertEqual(DEFAULT_NETWORK_ROLE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0007',
        '#7 ' + "exposed.isSharingEnabled" + ' = ' + JSON.stringify(exposed.isSharingEnabled));
      expect(exposed.isSharingEnabled).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0007',
        '#8 assert ' + "expect(Number(exposed.networkRole) === 0).assertFalse()");
      expect(Number(exposed.networkRole) === 0).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0007',
        '#9 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0007', 'end');
    });

    /*
     * @tc.number: SUB_PAN_NET_0800
     * @tc.name: testPanNet0008
     * @tc.desc: Verify that enabling tethering is invisible through the model exposed by the manager.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanNet0008', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0008', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#1 assert ' + "expect(await manager.enableTethering()).assertTrue()");
      expect(await manager.enableTethering()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#2 assert ' + "expect(await manager.enableTethering()).assertTrue()");
      expect(await manager.enableTethering()).assertTrue();

      const exposed: PanModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#3 ' + "exposed.isSharingEnabled" + ' = ' + JSON.stringify(exposed.isSharingEnabled));
      expect(exposed.isSharingEnabled).assertFalse();
      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#4 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#5 ' + "records[2].details" + ' = ' + JSON.stringify(records[2].details));
      expect(records[2].details).assertEqual('Tethering enabled');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#6 ' + "records[3].details" + ' = ' + JSON.stringify(records[3].details));
      expect(records[3].details).assertEqual('Tethering enabled');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#7 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#8 assert ' + "expect(await manager.enableTethering()).assertFalse()");
      expect(await manager.enableTethering()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#9 assert ' + "expect(await manager.disableTethering()).assertTrue()");
      expect(await manager.disableTethering()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#10 assert ' + "expect(manager.getOperationRecords().length).assertEqual(6)");
      expect(manager.getOperationRecords().length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#11 assert ' + "expect(manager.getModel().isSharingEnabled).assertFalse()");
      expect(manager.getModel().isSharingEnabled).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0008',
        '#12 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(3)");
      expect(serviceHistoryCount(manager)).assertEqual(3);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0008', 'end');
    });

    /*
     * @tc.number: SUB_PAN_NET_0900
     * @tc.name: testPanNet0009
     * @tc.desc: Verify the recorded order when tethering calls are issued concurrently.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanNet0009', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0009', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const tasks: Promise<boolean>[] =
        [manager.enableTethering(), manager.disableTethering(), manager.enableTethering()];
      const results: boolean[] = await Promise.all(tasks);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0009',
        '#1 ' + "results.length" + ' = ' + JSON.stringify(results.length));
      expect(results.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0009',
        '#2 ' + "results[0]" + ' = ' + JSON.stringify(results[0]));
      expect(results[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0009',
        '#3 ' + "results[1]" + ' = ' + JSON.stringify(results[1]));
      expect(results[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0009',
        '#4 ' + "results[2]" + ' = ' + JSON.stringify(results[2]));
      expect(results[2]).assertTrue();

      const names = recordNames(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0009',
        '#5 ' + "names.length" + ' = ' + JSON.stringify(names.length));
      expect(names.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0009',
        '#6 ' + "names[2]" + ' = ' + JSON.stringify(names[2]));
      expect(names[2]).assertEqual('enableTethering');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0009',
        '#7 ' + "names[3]" + ' = ' + JSON.stringify(names[3]));
      expect(names[3]).assertEqual('disableTethering');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0009',
        '#8 ' + "names[4]" + ' = ' + JSON.stringify(names[4]));
      expect(names[4]).assertEqual('enableTethering');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0009',
        '#9 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(5)");
      expect(manager.getStatistics().totalOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0009',
        '#10 assert ' + "expect(manager.getModel().isSharingEnabled).assertFalse()");
      expect(manager.getModel().isSharingEnabled).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0009',
        '#11 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0009', 'end');
    });

    /*
     * @tc.number: SUB_PAN_NET_1000
     * @tc.name: testPanNet0010
     * @tc.desc: Verify that reset keeps tethering records consistent and the identifier counter grows.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPanNet0010', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0010', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#1 assert ' + "expect(await manager.enableTethering()).assertTrue()");
      expect(await manager.enableTethering()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#2 assert ' + "expect(manager.getOperationRecords().length).assertEqual(3)");
      expect(manager.getOperationRecords().length).assertEqual(3);

      await manager.reset();
      const afterReset = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#3 ' + "afterReset.length" + ' = ' + JSON.stringify(afterReset.length));
      expect(afterReset.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#4 ' + "afterReset[0].operationName" + ' = ' + JSON.stringify(afterReset[0].operationName));
      expect(afterReset[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#5 ' + "afterReset[0].operationId" + ' = ' + JSON.stringify(afterReset[0].operationId));
      expect(afterReset[0].operationId).assertEqual('mgr_op_5');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#6 ' + "afterReset[0].details" + ' = ' + JSON.stringify(afterReset[0].details));
      expect(afterReset[0].details).assertEqual('Manager reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#7 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#8 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const history = manager.getService().getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#9 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#10 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#11 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service reset');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#12 assert ' + "expect(await manager.enableTethering()).assertFalse()");
      expect(await manager.enableTethering()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#13 assert ' + "expect(recordsOf(manager).length).assertEqual(1)");
      expect(recordsOf(manager).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#14 assert ' + "expect(await manager.disableTethering()).assertTrue()");
      expect(await manager.disableTethering()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#15 assert ' + "expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_6')");
      expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_6');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0010',
        '#16 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(6)");
      expect(manager.getStatistics().totalOperations).assertEqual(6);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0010', 'end');
    });

    /*
     * @tc.number: SUB_PAN_NET_1100
     * @tc.name: testPanNet0011
     * @tc.desc: Verify that tethering control only depends on having at least one managed device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPanNet0011', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0011', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#1 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#2 assert ' + "expect(await manager.enableTethering()).assertTrue()");
      expect(await manager.enableTethering()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#3 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#4 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#5 assert ' + "expect(await manager.enableTethering()).assertTrue()");
      expect(await manager.enableTethering()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#6 assert ' + "expect(await manager.disconnect(DEVICE_B)).assertTrue()");
      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#7 assert ' + "expect(await manager.enableTethering()).assertFalse()");
      expect(await manager.enableTethering()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#8 assert ' + "expect(await manager.disableTethering()).assertTrue()");
      expect(await manager.disableTethering()).assertTrue();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#9 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#10 ' + "records[3].operationName" + ' = ' + JSON.stringify(records[3].operationName));
      expect(records[3].operationName).assertEqual('enableTethering');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#11 ' + "records[6].operationName" + ' = ' + JSON.stringify(records[6].operationName));
      expect(records[6].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#12 ' + "records[7].operationName" + ' = ' + JSON.stringify(records[7].operationName));
      expect(records[7].operationName).assertEqual('disableTethering');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#13 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPanNet0011',
        '#14 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(5)");
      expect(serviceHistoryCount(manager)).assertEqual(5);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPanNet0011', 'end');
    });
  });
}
