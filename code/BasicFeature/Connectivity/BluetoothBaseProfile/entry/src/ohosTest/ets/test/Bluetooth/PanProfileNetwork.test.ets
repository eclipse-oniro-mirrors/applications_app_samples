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
import {
  BluetoothConnectionState,
  PanModel,
  PanProfileManager,
  PanService
} from 'library';

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
  const manager = new PanProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<PanProfileManager> {
  const manager = new PanProfileManager();
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
      const manager = new PanProfileManager();
      const service: PanService = manager.getService();
      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      expect(await manager.enableTethering()).assertFalse();
      expect(await manager.disableTethering()).assertFalse();

      expect(manager.getIpAddress()).assertEqual('');
      expect(manager.getSubnetMask()).assertEqual('');
      expect(manager.getGateway()).assertEqual('');
      expect(manager.getDnsServer()).assertEqual('');
      expect(manager.getUploadSpeed()).assertEqual(0);
      expect(manager.getDownloadSpeed()).assertEqual(0);
      expect(manager.getBytesTransferred()).assertEqual(0);
      expect(manager.getConnectedDeviceCount()).assertEqual(0);
      expect(manager.getNetworkRole()).assertEqual(0);

      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(manager.isConnected()).assertFalse();
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
      const manager = await readyManager();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      expect(await manager.enableTethering()).assertFalse();
      expect(await manager.enableTethering()).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      expect(manager.getIpAddress()).assertEqual('');

      expect(await manager.disableTethering()).assertTrue();
      expect(lastRecord(manager).operationName).assertEqual('disableTethering');
      expect(lastRecord(manager).details).assertEqual('Tethering disabled');
      expect(lastRecord(manager).operationId).assertEqual('mgr_op_2');
      expect(manager.getOperationRecords().length).assertEqual(2);
      expect(serviceHistoryCount(manager)).assertEqual(1);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getOperationRecords().length).assertEqual(2);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      expect(await manager.enableTethering()).assertTrue();
      expect(await manager.disableTethering()).assertTrue();
      expect(await manager.enableTethering()).assertTrue();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(5);
      expect(records[2].operationName).assertEqual('enableTethering');
      expect(records[2].details).assertEqual('Tethering enabled');
      expect(records[3].operationName).assertEqual('disableTethering');
      expect(records[3].details).assertEqual('Tethering disabled');
      expect(records[4].details).assertEqual('Tethering enabled');
      expect(records[2].operationId).assertEqual('mgr_op_3');
      expect(records[4].operationId).assertEqual('mgr_op_5');
      expect(records[4].success).assertTrue();
      expect(records[4].errorMessage).assertEqual('');

      expect(serviceHistoryCount(manager)).assertEqual(2);
      expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect');

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.enableTethering()).assertTrue();

      expect(manager.getIpAddress()).assertEqual('');
      expect(manager.getSubnetMask()).assertEqual('');
      expect(manager.getGateway()).assertEqual('');
      expect(manager.getDnsServer()).assertEqual('');

      const exposed: PanModel = manager.getModel();
      expect(exposed.ipAddress).assertEqual('');
      expect(exposed.subnetMask).assertEqual('');
      expect(exposed.gatewayAddress).assertEqual('');
      expect(exposed.dnsServer).assertEqual('');
      expect(manager.getStatistics().connectedDeviceCount).assertEqual(1);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.enableTethering()).assertTrue();
      expect(await manager.disableTethering()).assertTrue();
      expect(await manager.enableTethering()).assertTrue();

      expect(manager.getUploadSpeed()).assertEqual(0);
      expect(manager.getDownloadSpeed()).assertEqual(0);
      expect(manager.getBytesTransferred()).assertEqual(0);

      const exposed: PanModel = manager.getModel();
      expect(exposed.uploadSpeed).assertEqual(0);
      expect(exposed.downloadSpeed).assertEqual(0);
      expect(exposed.bytesTransferred).assertEqual(0);
      expect(recordsOf(manager).length).assertEqual(5);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      expect(manager.getConnectedDeviceCount()).assertEqual(0);

      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      expect(manager.getConnectedDeviceIds().length).assertEqual(2);
      expect(manager.getConnectedDeviceCount()).assertEqual(0);
      expect(manager.getModel().connectedDeviceCount).assertEqual(0);

      const stats: ESObject = manager.getService().getStatistics();
      expect(stats.connectedDeviceCount).assertEqual(2);
      expect(stats.serviceName).assertEqual(SERVICE_NAME);
      expect(serviceHistoryCount(manager)).assertEqual(3);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getNetworkRole()).assertEqual(0);
      expect(await manager.enableTethering()).assertTrue();
      expect(manager.getNetworkRole()).assertEqual(0);
      expect(await manager.disableTethering()).assertTrue();
      expect(manager.getNetworkRole()).assertEqual(0);

      const exposed: PanModel = manager.getModel();
      expect(exposed.networkRole).assertEqual(DEFAULT_NETWORK_ROLE);
      expect(exposed.isSharingEnabled).assertFalse();
      expect(Number(exposed.networkRole) === 0).assertFalse();
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.enableTethering()).assertTrue();
      expect(await manager.enableTethering()).assertTrue();

      const exposed: PanModel = manager.getModel();
      expect(exposed.isSharingEnabled).assertFalse();
      const records = recordsOf(manager);
      expect(records.length).assertEqual(4);
      expect(records[2].details).assertEqual('Tethering enabled');
      expect(records[3].details).assertEqual('Tethering enabled');

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(await manager.enableTethering()).assertFalse();
      expect(await manager.disableTethering()).assertTrue();
      expect(manager.getOperationRecords().length).assertEqual(6);
      expect(manager.getModel().isSharingEnabled).assertFalse();
      expect(serviceHistoryCount(manager)).assertEqual(3);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      const tasks: Promise<boolean>[] =
        [manager.enableTethering(), manager.disableTethering(), manager.enableTethering()];
      const results: boolean[] = await Promise.all(tasks);
      expect(results.length).assertEqual(3);
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();

      const names = recordNames(manager);
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual('enableTethering');
      expect(names[3]).assertEqual('disableTethering');
      expect(names[4]).assertEqual('enableTethering');
      expect(manager.getStatistics().totalOperations).assertEqual(5);
      expect(manager.getModel().isSharingEnabled).assertFalse();
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.enableTethering()).assertTrue();
      expect(manager.getOperationRecords().length).assertEqual(3);

      await manager.reset();
      const afterReset = recordsOf(manager);
      expect(afterReset.length).assertEqual(1);
      expect(afterReset[0].operationName).assertEqual('reset');
      expect(afterReset[0].operationId).assertEqual('mgr_op_5');
      expect(afterReset[0].details).assertEqual('Manager reset');
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const history = manager.getService().getOperationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('reset');
      expect(history[0].details).assertEqual('Service reset');

      expect(await manager.enableTethering()).assertFalse();
      expect(recordsOf(manager).length).assertEqual(1);
      expect(await manager.disableTethering()).assertTrue();
      expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_6');
      expect(manager.getStatistics().totalOperations).assertEqual(6);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(await manager.enableTethering()).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      expect(await manager.enableTethering()).assertTrue();

      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      expect(await manager.enableTethering()).assertFalse();
      expect(await manager.disableTethering()).assertTrue();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(8);
      expect(records[3].operationName).assertEqual('enableTethering');
      expect(records[6].operationName).assertEqual('disconnect');
      expect(records[7].operationName).assertEqual('disableTethering');
      expect(manager.isConnected()).assertFalse();
      expect(serviceHistoryCount(manager)).assertEqual(5);

      await manager.destroy();
    });
  });
}
