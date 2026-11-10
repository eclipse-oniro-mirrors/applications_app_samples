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
import {
  BluetoothConnectionState,
  HdpModel,
  HdpProfileManager,
  HdpService
} from 'library';

/**
 * @description Test suite for health measurement operations of HdpProfileManager
 * @since 26.0.0
 */

const SERVICE_NAME: string = 'HdpService';
const DEVICE_A: string = 'hdp_meas_device_a';
const DEVICE_B: string = 'hdp_meas_device_b';

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

function recordsOf(manager: HdpProfileManager): RecordView[] {
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

function lastRecord(manager: HdpProfileManager): RecordView {
  const list = recordsOf(manager);
  return list[list.length - 1];
}

function recordNames(manager: HdpProfileManager): string[] {
  const list = recordsOf(manager);
  const names: string[] = [];
  for (let i = 0; i < list.length; i++) {
    names.push(list[i].operationName);
  }
  return names;
}

function serviceHistoryCount(manager: HdpProfileManager): number {
  return manager.getService().getOperationHistory().length;
}

async function readyManager(): Promise<HdpProfileManager> {
  const manager = new HdpProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<HdpProfileManager> {
  const manager = new HdpProfileManager();
  await manager.initialize();
  await manager.connect(deviceId);
  return manager;
}

export default function hdpProfileMeasureTest(): void {
  describe('HdpProfileMeasureTest', () => {
    /*
     * @tc.number: SUB_HDP_MEAS_0100
     * @tc.name: testHdpMeas0001
     * @tc.desc: Verify that measurement control and every reading are blocked before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpMeas0001', 0, async () => {
      const manager = new HdpProfileManager();
      const service: HdpService = manager.getService();
      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      expect(await manager.startMeasurement()).assertFalse();
      expect(await manager.stopMeasurement()).assertFalse();

      expect(manager.getMeasurementValue()).assertEqual(0);
      expect(manager.getMeasurementUnit()).assertEqual('');
      expect(manager.getMeasurementTime()).assertEqual(0);
      expect(manager.getHealthDeviceType()).assertEqual(0);
      expect(manager.getDataType()).assertEqual(0);
      expect(manager.getHistoryCount()).assertEqual(0);
      expect(manager.getAccuracy()).assertEqual(0);
      expect(manager.getDeviceStatus()).assertEqual(0);
      expect(manager.isMeasuring()).assertFalse();

      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(manager.isConnected()).assertFalse();
      expect(manager.getStatistics().failedOperations).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HDP_MEAS_0200
     * @tc.name: testHdpMeas0002
     * @tc.desc: Verify that starting a measurement needs a device while stopping one does not.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpMeas0002', 0, async () => {
      const manager = await readyManager();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      expect(await manager.startMeasurement()).assertFalse();
      expect(await manager.startMeasurement()).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      expect(manager.isMeasuring()).assertFalse();

      expect(await manager.stopMeasurement()).assertTrue();
      expect(lastRecord(manager).operationName).assertEqual('stopMeasurement');
      expect(lastRecord(manager).details).assertEqual('Measurement stopped');
      expect(lastRecord(manager).operationId).assertEqual('mgr_op_2');
      expect(manager.getOperationRecords().length).assertEqual(2);
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const stats: ESObject = manager.getService().getStatistics();
      expect(stats.operationHistoryCount).assertEqual(1);
      expect(stats.isInitialized).assertTrue();

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_HDP_MEAS_0300
     * @tc.name: testHdpMeas0003
     * @tc.desc: Verify the records of a repeated start and stop cycle on a connected device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpMeas0003', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getOperationRecords().length).assertEqual(2);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      expect(await manager.startMeasurement()).assertTrue();
      expect(manager.isMeasuring()).assertTrue();
      expect(await manager.stopMeasurement()).assertTrue();
      expect(manager.isMeasuring()).assertFalse();
      expect(await manager.startMeasurement()).assertTrue();
      expect(manager.isMeasuring()).assertTrue();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(5);
      expect(records[2].operationName).assertEqual('startMeasurement');
      expect(records[2].details).assertEqual('Measurement started');
      expect(records[3].operationName).assertEqual('stopMeasurement');
      expect(records[3].details).assertEqual('Measurement stopped');
      expect(records[4].details).assertEqual('Measurement started');
      expect(records[2].operationId).assertEqual('mgr_op_3');
      expect(records[4].operationId).assertEqual('mgr_op_5');
      expect(records[4].durationMs).assertEqual(0);
      expect(records[4].startTime).assertEqual(records[4].endTime);

      expect(serviceHistoryCount(manager)).assertEqual(2);
      expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect');

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_HDP_MEAS_0400
     * @tc.name: testHdpMeas0004
     * @tc.desc: Verify that numeric readings stay at their defaults through a full measurement cycle.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpMeas0004', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.startMeasurement()).assertTrue();
      expect(await manager.stopMeasurement()).assertTrue();

      expect(manager.getMeasurementValue()).assertEqual(0);
      expect(manager.getMeasurementUnit()).assertEqual('');
      expect(manager.getMeasurementTime()).assertEqual(0);
      expect(manager.getHistoryCount()).assertEqual(0);
      expect(manager.getAccuracy()).assertEqual(0);

      const exposed: HdpModel = manager.getModel();
      expect(exposed.measurementValue).assertEqual(0);
      expect(exposed.measurementUnit).assertEqual('');
      expect(exposed.measurementTime).assertEqual(0);
      expect(exposed.historyCount).assertEqual(0);
      expect(exposed.accuracy).assertEqual(0);
      expect(recordsOf(manager).length).assertEqual(4);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_HDP_MEAS_0500
     * @tc.name: testHdpMeas0005
     * @tc.desc: Verify that the three numeric status readings stay zero because the model keeps text values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpMeas0005', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.startMeasurement()).assertTrue();
      expect(manager.getHealthDeviceType()).assertEqual(0);
      expect(manager.getDataType()).assertEqual(0);
      expect(manager.getDeviceStatus()).assertEqual(0);

      expect(await manager.stopMeasurement()).assertTrue();
      expect(manager.getHealthDeviceType()).assertEqual(0);
      expect(manager.getDataType()).assertEqual(0);
      expect(manager.getDeviceStatus()).assertEqual(0);

      const exposed: HdpModel = manager.getModel();
      expect(exposed.healthDeviceType).assertEqual('');
      expect(exposed.dataType).assertEqual('');
      expect(exposed.deviceStatus).assertEqual('idle');
      expect(Number(exposed.deviceStatus) === 0).assertFalse();
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_HDP_MEAS_0600
     * @tc.name: testHdpMeas0006
     * @tc.desc: Verify that the measuring flag survives a disconnection and that stopping needs no device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpMeas0006', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.startMeasurement()).assertTrue();
      expect(manager.isMeasuring()).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.isMeasuring()).assertTrue();

      expect(await manager.startMeasurement()).assertFalse();
      const recordsBefore = recordsOf(manager).length;
      expect(await manager.stopMeasurement()).assertTrue();
      expect(manager.isMeasuring()).assertFalse();
      expect(recordsOf(manager).length).assertEqual(recordsBefore + 1);
      expect(lastRecord(manager).details).assertEqual('Measurement stopped');
      expect(serviceHistoryCount(manager)).assertEqual(3);
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_HDP_MEAS_0700
     * @tc.name: testHdpMeas0007
     * @tc.desc: Verify that an interrupted measurement is reported active again after re-initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpMeas0007', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.startMeasurement()).assertTrue();
      expect(manager.isMeasuring()).assertTrue();

      await manager.destroy();
      expect(manager.isMeasuring()).assertFalse();
      expect(await manager.startMeasurement()).assertFalse();
      expect(await manager.stopMeasurement()).assertFalse();
      expect(recordsOf(manager).length).assertEqual(1);
      expect(lastRecord(manager).operationName).assertEqual('reset');
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const stats: ESObject = manager.getService().getStatistics();
      expect(stats.isInitialized).assertFalse();
      expect(manager.getModel().isMeasuring).assertFalse();

      expect(await manager.initialize()).assertTrue();
      expect(manager.isMeasuring()).assertTrue();
      expect(await manager.startMeasurement()).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1');
      expect(await manager.stopMeasurement()).assertTrue();
      expect(manager.isMeasuring()).assertFalse();

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_HDP_MEAS_0800
     * @tc.name: testHdpMeas0008
     * @tc.desc: Verify the recorded order when measurement calls are issued concurrently.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpMeas0008', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      const tasks: Promise<boolean>[] =
        [manager.startMeasurement(), manager.stopMeasurement(), manager.startMeasurement()];
      const results: boolean[] = await Promise.all(tasks);
      expect(results.length).assertEqual(3);
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();

      const names = recordNames(manager);
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual('startMeasurement');
      expect(names[3]).assertEqual('stopMeasurement');
      expect(names[4]).assertEqual('startMeasurement');
      expect(manager.isMeasuring()).assertTrue();
      expect(manager.getStatistics().totalOperations).assertEqual(5);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_HDP_MEAS_0900
     * @tc.name: testHdpMeas0009
     * @tc.desc: Verify that repeated start and stop calls are all recorded without state validation.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpMeas0009', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      for (let i = 0; i < 3; i++) {
        expect(await manager.startMeasurement()).assertTrue();
        expect(manager.isMeasuring()).assertTrue();
      }
      for (let i = 0; i < 2; i++) {
        expect(await manager.stopMeasurement()).assertTrue();
        expect(manager.isMeasuring()).assertFalse();
      }
      const records = recordsOf(manager);
      expect(records.length).assertEqual(7);
      for (let i = 2; i < 5; i++) {
        expect(records[i].operationName).assertEqual('startMeasurement');
        expect(records[i].success).assertTrue();
      }
      expect(records[5].operationName).assertEqual('stopMeasurement');
      expect(records[6].details).assertEqual('Measurement stopped');
      expect(manager.getStatistics().totalOperations).assertEqual(7);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_HDP_MEAS_1000
     * @tc.name: testHdpMeas0010
     * @tc.desc: Verify that reset keeps the measuring flag and lets the operation identifier counter grow.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHdpMeas0010', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.startMeasurement()).assertTrue();
      expect(manager.getOperationRecords().length).assertEqual(3);

      await manager.reset();
      const afterReset = recordsOf(manager);
      expect(afterReset.length).assertEqual(1);
      expect(afterReset[0].operationName).assertEqual('reset');
      expect(afterReset[0].operationId).assertEqual('mgr_op_5');
      expect(afterReset[0].details).assertEqual('Manager reset');
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.isMeasuring()).assertTrue();
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const history = manager.getService().getOperationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('reset');
      expect(history[0].details).assertEqual('Service reset');

      expect(await manager.startMeasurement()).assertFalse();
      expect(await manager.stopMeasurement()).assertTrue();
      expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_6');
      expect(manager.isMeasuring()).assertFalse();
      expect(manager.getStatistics().totalOperations).assertEqual(6);

      await manager.destroy();
    });

    /*
     * @tc.number: SUB_HDP_MEAS_1100
     * @tc.name: testHdpMeas0011
     * @tc.desc: Verify that measurement control only depends on having at least one managed device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHdpMeas0011', 0, async () => {
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      expect(manager.getConnectedDeviceIds().length).assertEqual(2);
      expect(await manager.startMeasurement()).assertTrue();

      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      expect(await manager.startMeasurement()).assertTrue();

      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.isConnected()).assertFalse();
      expect(await manager.startMeasurement()).assertFalse();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(7);
      expect(records[3].operationName).assertEqual('startMeasurement');
      expect(records[5].operationName).assertEqual('startMeasurement');
      expect(records[6].operationName).assertEqual('disconnect');
      expect(serviceHistoryCount(manager)).assertEqual(5);

      await manager.destroy();
    });
  });
}
