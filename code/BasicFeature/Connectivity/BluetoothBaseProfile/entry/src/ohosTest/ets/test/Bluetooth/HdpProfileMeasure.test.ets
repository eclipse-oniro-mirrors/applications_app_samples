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
  HdpModel,
  HdpProfileManager,
  HdpService
} from 'library';
import { HdpServiceStatistics } from 'library';

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
  const manager: HdpProfileManager = new HdpProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<HdpProfileManager> {
  const manager: HdpProfileManager = new HdpProfileManager();
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0001', 'begin');
      const manager: HdpProfileManager = new HdpProfileManager();
      const service: HdpService = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#1 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#2 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#3 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#4 assert ' + "expect(await manager.startMeasurement()).assertFalse()");
      expect(await manager.startMeasurement()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#5 assert ' + "expect(await manager.stopMeasurement()).assertFalse()");
      expect(await manager.stopMeasurement()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#6 assert ' + "expect(manager.getMeasurementValue()).assertEqual(0)");
      expect(manager.getMeasurementValue()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#7 assert ' + "expect(manager.getMeasurementUnit()).assertEqual('')");
      expect(manager.getMeasurementUnit()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#8 assert ' + "expect(manager.getMeasurementTime()).assertEqual(0)");
      expect(manager.getMeasurementTime()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#9 assert ' + "expect(manager.getHealthDeviceType()).assertEqual(0)");
      expect(manager.getHealthDeviceType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#10 assert ' + "expect(manager.getDataType()).assertEqual(0)");
      expect(manager.getDataType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#11 assert ' + "expect(manager.getHistoryCount()).assertEqual(0)");
      expect(manager.getHistoryCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#12 assert ' + "expect(manager.getAccuracy()).assertEqual(0)");
      expect(manager.getAccuracy()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#13 assert ' + "expect(manager.getDeviceStatus()).assertEqual(0)");
      expect(manager.getDeviceStatus()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#14 assert ' + "expect(manager.isMeasuring()).assertFalse()");
      expect(manager.isMeasuring()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#15 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#16 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#17 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#18 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0001',
        '#19 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(0)");
      expect(manager.getStatistics().failedOperations).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0002', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#2 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#3 assert ' + "expect(await manager.startMeasurement()).assertFalse()");
      expect(await manager.startMeasurement()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#4 assert ' + "expect(await manager.startMeasurement()).assertFalse()");
      expect(await manager.startMeasurement()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#5 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#6 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#7 assert ' + "expect(manager.isMeasuring()).assertFalse()");
      expect(manager.isMeasuring()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#8 assert ' + "expect(await manager.stopMeasurement()).assertTrue()");
      expect(await manager.stopMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#9 assert ' + "expect(lastRecord(manager).operationName).assertEqual('stopMeasurement')");
      expect(lastRecord(manager).operationName).assertEqual('stopMeasurement');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#10 assert ' + "expect(lastRecord(manager).details).assertEqual('Measurement stopped')");
      expect(lastRecord(manager).details).assertEqual('Measurement stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#11 assert ' + "expect(lastRecord(manager).operationId).assertEqual('mgr_op_2')");
      expect(lastRecord(manager).operationId).assertEqual('mgr_op_2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#12 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#13 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const stats: HdpServiceStatistics = manager.getService().getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#14 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0002',
        '#15 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertTrue();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0003', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#2 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#3 assert ' + "expect(await manager.startMeasurement()).assertTrue()");
      expect(await manager.startMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#4 assert ' + "expect(manager.isMeasuring()).assertTrue()");
      expect(manager.isMeasuring()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#5 assert ' + "expect(await manager.stopMeasurement()).assertTrue()");
      expect(await manager.stopMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#6 assert ' + "expect(manager.isMeasuring()).assertFalse()");
      expect(manager.isMeasuring()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#7 assert ' + "expect(await manager.startMeasurement()).assertTrue()");
      expect(await manager.startMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#8 assert ' + "expect(manager.isMeasuring()).assertTrue()");
      expect(manager.isMeasuring()).assertTrue();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#9 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#10 ' + "records[2].operationName" + ' = ' + JSON.stringify(records[2].operationName));
      expect(records[2].operationName).assertEqual('startMeasurement');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#11 ' + "records[2].details" + ' = ' + JSON.stringify(records[2].details));
      expect(records[2].details).assertEqual('Measurement started');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#12 ' + "records[3].operationName" + ' = ' + JSON.stringify(records[3].operationName));
      expect(records[3].operationName).assertEqual('stopMeasurement');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#13 ' + "records[3].details" + ' = ' + JSON.stringify(records[3].details));
      expect(records[3].details).assertEqual('Measurement stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#14 ' + "records[4].details" + ' = ' + JSON.stringify(records[4].details));
      expect(records[4].details).assertEqual('Measurement started');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#15 ' + "records[2].operationId" + ' = ' + JSON.stringify(records[2].operationId));
      expect(records[2].operationId).assertEqual('mgr_op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#16 ' + "records[4].operationId" + ' = ' + JSON.stringify(records[4].operationId));
      expect(records[4].operationId).assertEqual('mgr_op_5');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#17 ' + "records[4].durationMs" + ' = ' + JSON.stringify(records[4].durationMs));
      expect(records[4].durationMs).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#18 ' + "records[4].startTime" + ' = ' + JSON.stringify(records[4].startTime));
      expect(records[4].startTime).assertEqual(records[4].endTime);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#19 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0003',
        '#20 assert ' + "expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect')");
      expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0004', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#1 assert ' + "expect(await manager.startMeasurement()).assertTrue()");
      expect(await manager.startMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#2 assert ' + "expect(await manager.stopMeasurement()).assertTrue()");
      expect(await manager.stopMeasurement()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#3 assert ' + "expect(manager.getMeasurementValue()).assertEqual(0)");
      expect(manager.getMeasurementValue()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#4 assert ' + "expect(manager.getMeasurementUnit()).assertEqual('')");
      expect(manager.getMeasurementUnit()).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#5 assert ' + "expect(manager.getMeasurementTime()).assertEqual(0)");
      expect(manager.getMeasurementTime()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#6 assert ' + "expect(manager.getHistoryCount()).assertEqual(0)");
      expect(manager.getHistoryCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#7 assert ' + "expect(manager.getAccuracy()).assertEqual(0)");
      expect(manager.getAccuracy()).assertEqual(0);

      const exposed: HdpModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#8 ' + "exposed.measurementValue" + ' = ' + JSON.stringify(exposed.measurementValue));
      expect(exposed.measurementValue).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#9 ' + "exposed.measurementUnit" + ' = ' + JSON.stringify(exposed.measurementUnit));
      expect(exposed.measurementUnit).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#10 ' + "exposed.measurementTime" + ' = ' + JSON.stringify(exposed.measurementTime));
      expect(exposed.measurementTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#11 ' + "exposed.historyCount" + ' = ' + JSON.stringify(exposed.historyCount));
      expect(exposed.historyCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#12 ' + "exposed.accuracy" + ' = ' + JSON.stringify(exposed.accuracy));
      expect(exposed.accuracy).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0004',
        '#13 assert ' + "expect(recordsOf(manager).length).assertEqual(4)");
      expect(recordsOf(manager).length).assertEqual(4);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0005', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#1 assert ' + "expect(await manager.startMeasurement()).assertTrue()");
      expect(await manager.startMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#2 assert ' + "expect(manager.getHealthDeviceType()).assertEqual(0)");
      expect(manager.getHealthDeviceType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#3 assert ' + "expect(manager.getDataType()).assertEqual(0)");
      expect(manager.getDataType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#4 assert ' + "expect(manager.getDeviceStatus()).assertEqual(0)");
      expect(manager.getDeviceStatus()).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#5 assert ' + "expect(await manager.stopMeasurement()).assertTrue()");
      expect(await manager.stopMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#6 assert ' + "expect(manager.getHealthDeviceType()).assertEqual(0)");
      expect(manager.getHealthDeviceType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#7 assert ' + "expect(manager.getDataType()).assertEqual(0)");
      expect(manager.getDataType()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#8 assert ' + "expect(manager.getDeviceStatus()).assertEqual(0)");
      expect(manager.getDeviceStatus()).assertEqual(0);

      const exposed: HdpModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#9 ' + "exposed.healthDeviceType" + ' = ' + JSON.stringify(exposed.healthDeviceType));
      expect(exposed.healthDeviceType).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#10 ' + "exposed.dataType" + ' = ' + JSON.stringify(exposed.dataType));
      expect(exposed.dataType).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#11 ' + "exposed.deviceStatus" + ' = ' + JSON.stringify(exposed.deviceStatus));
      expect(exposed.deviceStatus).assertEqual('idle');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#12 assert ' + "expect(Number(exposed.deviceStatus) === 0).assertFalse()");
      expect(Number(exposed.deviceStatus) === 0).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0005',
        '#13 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0006', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#1 assert ' + "expect(await manager.startMeasurement()).assertTrue()");
      expect(await manager.startMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#2 assert ' + "expect(manager.isMeasuring()).assertTrue()");
      expect(manager.isMeasuring()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#3 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#4 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#5 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#6 assert ' + "expect(manager.isMeasuring()).assertTrue()");
      expect(manager.isMeasuring()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#7 assert ' + "expect(await manager.startMeasurement()).assertFalse()");
      expect(await manager.startMeasurement()).assertFalse();
      const recordsBefore = recordsOf(manager).length;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#8 assert ' + "expect(await manager.stopMeasurement()).assertTrue()");
      expect(await manager.stopMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#9 assert ' + "expect(manager.isMeasuring()).assertFalse()");
      expect(manager.isMeasuring()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#10 assert ' + "expect(recordsOf(manager).length).assertEqual(recordsBefore + 1)");
      expect(recordsOf(manager).length).assertEqual(recordsBefore + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#11 assert ' + "expect(lastRecord(manager).details).assertEqual('Measurement stopped')");
      expect(lastRecord(manager).details).assertEqual('Measurement stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#12 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(3)");
      expect(serviceHistoryCount(manager)).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0006',
        '#13 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(0)");
      expect(manager.getStatistics().failedOperations).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0007', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#1 assert ' + "expect(await manager.startMeasurement()).assertTrue()");
      expect(await manager.startMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#2 assert ' + "expect(manager.isMeasuring()).assertTrue()");
      expect(manager.isMeasuring()).assertTrue();

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#3 assert ' + "expect(manager.isMeasuring()).assertFalse()");
      expect(manager.isMeasuring()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#4 assert ' + "expect(await manager.startMeasurement()).assertFalse()");
      expect(await manager.startMeasurement()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#5 assert ' + "expect(await manager.stopMeasurement()).assertFalse()");
      expect(await manager.stopMeasurement()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#6 assert ' + "expect(recordsOf(manager).length).assertEqual(1)");
      expect(recordsOf(manager).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#7 assert ' + "expect(lastRecord(manager).operationName).assertEqual('reset')");
      expect(lastRecord(manager).operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#8 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const stats: HdpServiceStatistics = manager.getService().getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#9 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#10 assert ' + "expect(manager.getModel().isMeasuring).assertFalse()");
      expect(manager.getModel().isMeasuring).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#11 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#12 assert ' + "expect(manager.isMeasuring()).assertTrue()");
      expect(manager.isMeasuring()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#13 assert ' + "expect(await manager.startMeasurement()).assertFalse()");
      expect(await manager.startMeasurement()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#14 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#15 assert ' + "expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1')");
      expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#16 assert ' + "expect(await manager.stopMeasurement()).assertTrue()");
      expect(await manager.stopMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0007',
        '#17 assert ' + "expect(manager.isMeasuring()).assertFalse()");
      expect(manager.isMeasuring()).assertFalse();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0008', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const tasks: Promise<boolean>[] =
        [manager.startMeasurement(), manager.stopMeasurement(), manager.startMeasurement()];
      const results: boolean[] = await Promise.all(tasks);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0008',
        '#1 ' + "results.length" + ' = ' + JSON.stringify(results.length));
      expect(results.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0008',
        '#2 ' + "results[0]" + ' = ' + JSON.stringify(results[0]));
      expect(results[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0008',
        '#3 ' + "results[1]" + ' = ' + JSON.stringify(results[1]));
      expect(results[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0008',
        '#4 ' + "results[2]" + ' = ' + JSON.stringify(results[2]));
      expect(results[2]).assertTrue();

      const names = recordNames(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0008',
        '#5 ' + "names.length" + ' = ' + JSON.stringify(names.length));
      expect(names.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0008',
        '#6 ' + "names[2]" + ' = ' + JSON.stringify(names[2]));
      expect(names[2]).assertEqual('startMeasurement');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0008',
        '#7 ' + "names[3]" + ' = ' + JSON.stringify(names[3]));
      expect(names[3]).assertEqual('stopMeasurement');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0008',
        '#8 ' + "names[4]" + ' = ' + JSON.stringify(names[4]));
      expect(names[4]).assertEqual('startMeasurement');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0008',
        '#9 assert ' + "expect(manager.isMeasuring()).assertTrue()");
      expect(manager.isMeasuring()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0008',
        '#10 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(5)");
      expect(manager.getStatistics().totalOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0008',
        '#11 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0009', 'begin');
      const manager = await connectedManager(DEVICE_A);
      for (let i = 0; i < 3; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpMeas0009',
          '#1 assert ' + "expect(await manager.startMeasurement()).assertTrue()");
        expect(await manager.startMeasurement()).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpMeas0009',
          '#2 assert ' + "expect(manager.isMeasuring()).assertTrue()");
        expect(manager.isMeasuring()).assertTrue();
      }
      for (let i = 0; i < 2; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpMeas0009',
          '#3 assert ' + "expect(await manager.stopMeasurement()).assertTrue()");
        expect(await manager.stopMeasurement()).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpMeas0009',
          '#4 assert ' + "expect(manager.isMeasuring()).assertFalse()");
        expect(manager.isMeasuring()).assertFalse();
      }
      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0009',
        '#5 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(7);
      for (let i = 2; i < 5; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpMeas0009',
          '#6 ' + "records[i].operationName" + ' = ' + JSON.stringify(records[i].operationName));
        expect(records[i].operationName).assertEqual('startMeasurement');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHdpMeas0009',
          '#7 ' + "records[i].success" + ' = ' + JSON.stringify(records[i].success));
        expect(records[i].success).assertTrue();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0009',
        '#8 ' + "records[5].operationName" + ' = ' + JSON.stringify(records[5].operationName));
      expect(records[5].operationName).assertEqual('stopMeasurement');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0009',
        '#9 ' + "records[6].details" + ' = ' + JSON.stringify(records[6].details));
      expect(records[6].details).assertEqual('Measurement stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0009',
        '#10 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(7)");
      expect(manager.getStatistics().totalOperations).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0009',
        '#11 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0010', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#1 assert ' + "expect(await manager.startMeasurement()).assertTrue()");
      expect(await manager.startMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#2 assert ' + "expect(manager.getOperationRecords().length).assertEqual(3)");
      expect(manager.getOperationRecords().length).assertEqual(3);

      await manager.reset();
      const afterReset = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#3 ' + "afterReset.length" + ' = ' + JSON.stringify(afterReset.length));
      expect(afterReset.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#4 ' + "afterReset[0].operationName" + ' = ' + JSON.stringify(afterReset[0].operationName));
      expect(afterReset[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#5 ' + "afterReset[0].operationId" + ' = ' + JSON.stringify(afterReset[0].operationId));
      expect(afterReset[0].operationId).assertEqual('mgr_op_5');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#6 ' + "afterReset[0].details" + ' = ' + JSON.stringify(afterReset[0].details));
      expect(afterReset[0].details).assertEqual('Manager reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#7 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#8 assert ' + "expect(manager.isMeasuring()).assertTrue()");
      expect(manager.isMeasuring()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#9 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const history = manager.getService().getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#10 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#11 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#12 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service reset');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#13 assert ' + "expect(await manager.startMeasurement()).assertFalse()");
      expect(await manager.startMeasurement()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#14 assert ' + "expect(await manager.stopMeasurement()).assertTrue()");
      expect(await manager.stopMeasurement()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#15 assert ' + "expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_6')");
      expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_6');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#16 assert ' + "expect(manager.isMeasuring()).assertFalse()");
      expect(manager.isMeasuring()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0010',
        '#17 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(6)");
      expect(manager.getStatistics().totalOperations).assertEqual(6);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0011', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#1 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#2 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(2)");
      expect(manager.getManagedDeviceCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#3 assert ' + "expect(manager.getConnectedDeviceIds().length).assertEqual(2)");
      expect(manager.getConnectedDeviceIds().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#4 assert ' + "expect(await manager.startMeasurement()).assertTrue()");
      expect(await manager.startMeasurement()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#5 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#6 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(1)");
      expect(manager.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#7 assert ' + "expect(await manager.startMeasurement()).assertTrue()");
      expect(await manager.startMeasurement()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#8 assert ' + "expect(await manager.disconnect(DEVICE_B)).assertTrue()");
      expect(await manager.disconnect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#9 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#10 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#11 assert ' + "expect(await manager.startMeasurement()).assertFalse()");
      expect(await manager.startMeasurement()).assertFalse();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#12 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#13 ' + "records[3].operationName" + ' = ' + JSON.stringify(records[3].operationName));
      expect(records[3].operationName).assertEqual('startMeasurement');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#14 ' + "records[5].operationName" + ' = ' + JSON.stringify(records[5].operationName));
      expect(records[5].operationName).assertEqual('startMeasurement');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#15 ' + "records[6].operationName" + ' = ' + JSON.stringify(records[6].operationName));
      expect(records[6].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHdpMeas0011',
        '#16 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(5)");
      expect(serviceHistoryCount(manager)).assertEqual(5);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHdpMeas0011', 'end');
    });
  });
}
