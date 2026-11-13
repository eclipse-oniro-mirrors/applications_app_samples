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
  HidModel,
  HidProfileManager,
  HidService
} from 'library';
import { HidServiceStatistics } from 'library';

/**
 * @description Test suite for HID input event injection of HidProfileManager
 * @since 26.0.0
 */

const SERVICE_NAME: string = 'HidService';
const DEVICE_A: string = 'hid_input_device_a';
const DEVICE_B: string = 'hid_input_device_b';
const DEFAULT_POINTER_SPEED: number = 1.0;
const KEY_CODE_A: number = 65;
const KEY_CODE_ENTER: number = 13;

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

function recordsOf(manager: HidProfileManager): RecordView[] {
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

function lastRecord(manager: HidProfileManager): RecordView {
  const list = recordsOf(manager);
  return list[list.length - 1];
}

function recordNames(manager: HidProfileManager): string[] {
  const list = recordsOf(manager);
  const names: string[] = [];
  for (let i = 0; i < list.length; i++) {
    names.push(list[i].operationName);
  }
  return names;
}

function serviceHistoryCount(manager: HidProfileManager): number {
  return manager.getService().getOperationHistory().length;
}

async function readyManager(): Promise<HidProfileManager> {
  const manager: HidProfileManager = new HidProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<HidProfileManager> {
  const manager: HidProfileManager = new HidProfileManager();
  await manager.initialize();
  await manager.connect(deviceId);
  return manager;
}

export default function hidProfileInputTest(): void {
  describe('HidProfileInputTest', () => {
    /*
     * @tc.number: SUB_HID_INPUT_0100
     * @tc.name: testHidInput0001
     * @tc.desc: Verify that every input injection is refused before the manager is initialized.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidInput0001', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0001', 'begin');
      const manager: HidProfileManager = new HidProfileManager();
      const service: HidService = manager.getService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#1 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#2 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#3 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#4 assert ' + "expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#5 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#6 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#7 assert ' + "expect(await manager.sendMouseMove(10, -5)).assertFalse()");
      expect(await manager.sendMouseMove(10, -5)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#8 assert ' + "expect(await manager.sendMouseButton(1, false)).assertFalse()");
      expect(await manager.sendMouseButton(1, false)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#9 assert ' + "expect(await manager.sendScrollEvent(0, 3)).assertFalse()");
      expect(await manager.sendScrollEvent(0, 3)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#10 assert ' + "expect(await manager.sendTouchEvent(120, 240, 0.8, true)).assertFalse()");
      expect(await manager.sendTouchEvent(120, 240, 0.8, true)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#11 assert ' + "expect(await manager.setPointerSpeed(2.5)).assertFalse()");
      expect(await manager.setPointerSpeed(2.5)).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#12 assert ' + "expect(manager.getKeyMappingCount()).assertEqual(0)");
      expect(manager.getKeyMappingCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#13 assert ' + "expect(manager.getSupportedKeys().length).assertEqual(0)");
      expect(manager.getSupportedKeys().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#14 assert ' + "expect(manager.getPointerSpeed()).assertEqual(DEFAULT_POINTER_SPEED)");
      expect(manager.getPointerSpeed()).assertEqual(DEFAULT_POINTER_SPEED);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#15 assert ' + "expect(service.getOperationHistory().length).assertEqual(0)");
      expect(service.getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#16 assert ' + "expect(manager.getOperationRecords().length).assertEqual(0)");
      expect(manager.getOperationRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#17 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(0)");
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#18 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(0)");
      expect(manager.getStatistics().failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0001',
        '#19 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0001', 'end');
    });

    /*
     * @tc.number: SUB_HID_INPUT_0200
     * @tc.name: testHidInput0002
     * @tc.desc: Verify that input injection needs a managed device while the pointer speed setting does not.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHidInput0002', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0002', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#2 assert ' + "expect(lastRecord(manager).operationName).assertEqual('initialize')");
      expect(lastRecord(manager).operationName).assertEqual('initialize');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#3 assert ' + "expect(lastRecord(manager).details).assertEqual('Manager initialized')");
      expect(lastRecord(manager).details).assertEqual('Manager initialized');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#4 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#5 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#6 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#7 assert ' + "expect(await manager.sendMouseMove(10, -5)).assertFalse()");
      expect(await manager.sendMouseMove(10, -5)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#8 assert ' + "expect(await manager.sendMouseButton(1, false)).assertFalse()");
      expect(await manager.sendMouseButton(1, false)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#9 assert ' + "expect(await manager.sendScrollEvent(0, 3)).assertFalse()");
      expect(await manager.sendScrollEvent(0, 3)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#10 assert ' + "expect(await manager.sendTouchEvent(120, 240, 0.8, true)).assertFalse()");
      expect(await manager.sendTouchEvent(120, 240, 0.8, true)).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#11 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#12 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(1)");
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#13 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#14 assert ' + "expect(await manager.setPointerSpeed(2.5)).assertTrue()");
      expect(await manager.setPointerSpeed(2.5)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#15 assert ' + "expect(lastRecord(manager).operationName).assertEqual('setPointerSpeed')");
      expect(lastRecord(manager).operationName).assertEqual('setPointerSpeed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#16 assert ' + "expect(lastRecord(manager).details).assertEqual('Speed: 2.5')");
      expect(lastRecord(manager).details).assertEqual('Speed: 2.5');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#17 assert ' + "expect(manager.getPointerSpeed()).assertEqual(2.5)");
      expect(manager.getPointerSpeed()).assertEqual(2.5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0002',
        '#18 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0002', 'end');
    });

    /*
     * @tc.number: SUB_HID_INPUT_0300
     * @tc.name: testHidInput0003
     * @tc.desc: Verify the recorded key press and release details on a connected device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidInput0003', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0003', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#1 assert ' + "expect(manager.getOperationRecords().length).assertEqual(2)");
      expect(manager.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#2 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#3 assert ' + "expect(recordNames(manager)[1]).assertEqual('connect')");
      expect(recordNames(manager)[1]).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#4 assert ' + "expect(recordsOf(manager)[1].details).assertEqual(`Connected to ${DEVICE_A}`)");
      expect(recordsOf(manager)[1].details).assertEqual(`Connected to ${DEVICE_A}`);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#5 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#6 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, false)).assertTrue()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, false)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#7 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_ENTER, true)).assertTrue()");
      expect(await manager.sendKeyEvent(KEY_CODE_ENTER, true)).assertTrue();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#8 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#9 ' + "records[2].operationName" + ' = ' + JSON.stringify(records[2].operationName));
      expect(records[2].operationName).assertEqual('sendKeyEvent');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#10 ' + "records[2].details" + ' = ' + JSON.stringify(records[2].details));
      expect(records[2].details).assertEqual('Key 65 down');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#11 ' + "records[2].success" + ' = ' + JSON.stringify(records[2].success));
      expect(records[2].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#12 ' + "records[2].errorMessage" + ' = ' + JSON.stringify(records[2].errorMessage));
      expect(records[2].errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#13 ' + "records[3].details" + ' = ' + JSON.stringify(records[3].details));
      expect(records[3].details).assertEqual('Key 65 up');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#14 ' + "records[4].details" + ' = ' + JSON.stringify(records[4].details));
      expect(records[4].details).assertEqual('Key 13 down');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#15 ' + "records[2].operationId" + ' = ' + JSON.stringify(records[2].operationId));
      expect(records[2].operationId).assertEqual('mgr_op_3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#16 ' + "records[4].operationId" + ' = ' + JSON.stringify(records[4].operationId));
      expect(records[4].operationId).assertEqual('mgr_op_5');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#17 ' + "records[4].startTime" + ' = ' + JSON.stringify(records[4].startTime));
      expect(records[4].startTime).assertEqual(records[4].endTime);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#18 ' + "records[4].durationMs" + ' = ' + JSON.stringify(records[4].durationMs));
      expect(records[4].durationMs).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#19 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0003',
        '#20 assert ' + "expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect')");
      expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect');

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0003', 'end');
    });

    /*
     * @tc.number: SUB_HID_INPUT_0400
     * @tc.name: testHidInput0004
     * @tc.desc: Verify the recorded details of pointer, button, scroll and touch events.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidInput0004', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0004', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#1 assert ' + "expect(await manager.sendMouseMove(10, -5)).assertTrue()");
      expect(await manager.sendMouseMove(10, -5)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#2 assert ' + "expect(await manager.sendMouseMove(0, 0)).assertTrue()");
      expect(await manager.sendMouseMove(0, 0)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#3 assert ' + "expect(await manager.sendMouseButton(1, false)).assertTrue()");
      expect(await manager.sendMouseButton(1, false)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#4 assert ' + "expect(await manager.sendScrollEvent(0, 3)).assertTrue()");
      expect(await manager.sendScrollEvent(0, 3)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#5 assert ' + "expect(await manager.sendTouchEvent(120, 240, 0.8, true)).assertTrue()");
      expect(await manager.sendTouchEvent(120, 240, 0.8, true)).assertTrue();

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#6 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#7 ' + "records[2].operationName" + ' = ' + JSON.stringify(records[2].operationName));
      expect(records[2].operationName).assertEqual('sendMouseMove');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#8 ' + "records[2].details" + ' = ' + JSON.stringify(records[2].details));
      expect(records[2].details).assertEqual('Move delta(10, -5)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#9 ' + "records[3].details" + ' = ' + JSON.stringify(records[3].details));
      expect(records[3].details).assertEqual('Move delta(0, 0)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#10 ' + "records[4].operationName" + ' = ' + JSON.stringify(records[4].operationName));
      expect(records[4].operationName).assertEqual('sendMouseButton');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#11 ' + "records[4].details" + ' = ' + JSON.stringify(records[4].details));
      expect(records[4].details).assertEqual('Button 1 up');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#12 ' + "records[5].operationName" + ' = ' + JSON.stringify(records[5].operationName));
      expect(records[5].operationName).assertEqual('sendScrollEvent');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#13 ' + "records[5].details" + ' = ' + JSON.stringify(records[5].details));
      expect(records[5].details).assertEqual('Scroll(0, 3)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#14 ' + "records[6].operationName" + ' = ' + JSON.stringify(records[6].operationName));
      expect(records[6].operationName).assertEqual('sendTouchEvent');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#15 ' + "records[6].details" + ' = ' + JSON.stringify(records[6].details));
      expect(records[6].details).assertEqual('Touch(120, 240, p=0.8, true)');
      for (let i = 2; i < 7; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHidInput0004',
          '#16 ' + "records[i].success" + ' = ' + JSON.stringify(records[i].success));
        expect(records[i].success).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHidInput0004',
          '#17 ' + "records[i].errorMessage" + ' = ' + JSON.stringify(records[i].errorMessage));
        expect(records[i].errorMessage).assertEqual('');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#18 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(7)");
      expect(manager.getStatistics().totalOperations).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#19 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(0)");
      expect(manager.getStatistics().failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0004',
        '#20 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0004', 'end');
    });

    /*
     * @tc.number: SUB_HID_INPUT_0500
     * @tc.name: testHidInput0005
     * @tc.desc: Verify that out of range coordinates and key codes are accepted without validation.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHidInput0005', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0005', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#1 assert ' + "expect(await manager.sendTouchEvent(-1000, -1, 9.9, false)).assertTrue()");
      expect(await manager.sendTouchEvent(-1000, -1, 9.9, false)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#2 assert ' + "expect(lastRecord(manager).details).assertEqual('Touch(-1000, -1, p=9.9, false)')");
      expect(lastRecord(manager).details).assertEqual('Touch(-1000, -1, p=9.9, false)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#3 assert ' + "expect(await manager.sendKeyEvent(0, false)).assertTrue()");
      expect(await manager.sendKeyEvent(0, false)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#4 assert ' + "expect(lastRecord(manager).details).assertEqual('Key 0 up')");
      expect(lastRecord(manager).details).assertEqual('Key 0 up');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#5 assert ' + "expect(await manager.sendMouseButton(255, true)).assertTrue()");
      expect(await manager.sendMouseButton(255, true)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#6 assert ' + "expect(lastRecord(manager).details).assertEqual('Button 255 down')");
      expect(lastRecord(manager).details).assertEqual('Button 255 down');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#7 assert ' + "expect(await manager.sendScrollEvent(-120.5, 0.25)).assertTrue()");
      expect(await manager.sendScrollEvent(-120.5, 0.25)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#8 assert ' + "expect(lastRecord(manager).details).assertEqual('Scroll(-120.5, 0.25)')");
      expect(lastRecord(manager).details).assertEqual('Scroll(-120.5, 0.25)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#9 assert ' + "expect(await manager.sendMouseMove(-1, -1)).assertTrue()");
      expect(await manager.sendMouseMove(-1, -1)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#10 assert ' + "expect(lastRecord(manager).details).assertEqual('Move delta(-1, -1)')");
      expect(lastRecord(manager).details).assertEqual('Move delta(-1, -1)');

      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#11 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(7);
      for (let i = 2; i < 7; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHidInput0005',
          '#12 ' + "records[i].success" + ' = ' + JSON.stringify(records[i].success));
        expect(records[i].success).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHidInput0005',
          '#13 ' + "records[i].errorMessage" + ' = ' + JSON.stringify(records[i].errorMessage));
        expect(records[i].errorMessage).assertEqual('');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#14 assert ' + "expect(manager.getStatistics().failedOperations).assertEqual(0)");
      expect(manager.getStatistics().failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#15 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0005',
        '#16 assert ' + "expect(manager.getSupportedKeys().length).assertEqual(0)");
      expect(manager.getSupportedKeys().length).assertEqual(0);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0005', 'end');
    });

    /*
     * @tc.number: SUB_HID_INPUT_0600
     * @tc.name: testHidInput0006
     * @tc.desc: Verify the operation names recorded by the five injection methods in calling order.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidInput0006', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0006', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const actions: string[] = [];
      const results: boolean[] = [];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#1 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_ENTER, true)).assertTrue()");
      expect(await manager.sendKeyEvent(KEY_CODE_ENTER, true)).assertTrue();
      actions.push('sendKeyEvent');
      results.push(true);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#2 assert ' + "expect(await manager.sendMouseMove(2, 4)).assertTrue()");
      expect(await manager.sendMouseMove(2, 4)).assertTrue();
      actions.push('sendMouseMove');
      results.push(true);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#3 assert ' + "expect(await manager.sendMouseButton(0, true)).assertTrue()");
      expect(await manager.sendMouseButton(0, true)).assertTrue();
      actions.push('sendMouseButton');
      results.push(true);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#4 assert ' + "expect(await manager.sendScrollEvent(1, -1)).assertTrue()");
      expect(await manager.sendScrollEvent(1, -1)).assertTrue();
      actions.push('sendScrollEvent');
      results.push(true);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#5 assert ' + "expect(await manager.sendTouchEvent(5, 6, 0.5, false)).assertTrue()");
      expect(await manager.sendTouchEvent(5, 6, 0.5, false)).assertTrue();
      actions.push('sendTouchEvent');
      results.push(true);

      const names = recordNames(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#6 ' + "names.length" + ' = ' + JSON.stringify(names.length));
      expect(names.length).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#7 ' + "results.length" + ' = ' + JSON.stringify(results.length));
      expect(results.length).assertEqual(5);
      for (let i = 0; i < actions.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHidInput0006',
          '#8 ' + "names[i + 2]" + ' = ' + JSON.stringify(names[i + 2]));
        expect(names[i + 2]).assertEqual(actions[i]);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#9 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(7)");
      expect(manager.getStatistics().totalOperations).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#10 assert ' + "expect(recordsOf(manager).length).assertEqual(7)");
      expect(recordsOf(manager).length).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#11 assert ' + "expect(manager.getStatistics().successfulOperations).assertEqual(7)");
      expect(manager.getStatistics().successfulOperations).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#12 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);
      const stats: HidServiceStatistics = manager.getService().getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#13 ' + "stats.operationHistoryCount" + ' = ' + JSON.stringify(stats.operationHistoryCount));
      expect(stats.operationHistoryCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0006',
        '#14 ' + "stats.serviceName" + ' = ' + JSON.stringify(stats.serviceName));
      expect(stats.serviceName).assertEqual(SERVICE_NAME);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0006', 'end');
    });

    /*
     * @tc.number: SUB_HID_INPUT_0700
     * @tc.name: testHidInput0007
     * @tc.desc: Verify pointer speed clamping for values below and above the supported range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHidInput0007', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0007', 'begin');
      const manager = await readyManager();
      const inputs: number[] = [-3, 0, 0.05, 1.75, 5, 7.5];
      const expected: number[] = [0.1, 0.1, 0.1, 1.75, 5, 5];
      for (let i = 0; i < inputs.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHidInput0007',
          '#1 assert ' + "expect(await manager.setPointerSpeed(inputs[i])).assertTrue()");
        expect(await manager.setPointerSpeed(inputs[i])).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHidInput0007',
          '#2 assert ' + "expect(manager.getPointerSpeed()).assertEqual(expected[i])");
        expect(manager.getPointerSpeed()).assertEqual(expected[i]);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHidInput0007',
          '#3 assert ' + "expect(lastRecord(manager).details).assertEqual(`Speed: ${expected[i]}`)");
        expect(lastRecord(manager).details).assertEqual(`Speed: ${expected[i]}`);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testHidInput0007',
          '#4 assert ' + "expect(lastRecord(manager).operationName).assertEqual('setPointerSpeed')");
        expect(lastRecord(manager).operationName).assertEqual('setPointerSpeed');
      }
      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0007',
        '#5 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0007',
        '#6 ' + "records[6].operationId" + ' = ' + JSON.stringify(records[6].operationId));
      expect(records[6].operationId).assertEqual('mgr_op_7');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0007',
        '#7 assert ' + "expect(manager.getModel().pointerSpeed).assertEqual(DEFAULT_POINTER_SPEED)");
      expect(manager.getModel().pointerSpeed).assertEqual(DEFAULT_POINTER_SPEED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0007',
        '#8 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0007',
        '#9 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(7)");
      expect(manager.getStatistics().totalOperations).assertEqual(7);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0007', 'end');
    });

    /*
     * @tc.number: SUB_HID_INPUT_0800
     * @tc.name: testHidInput0008
     * @tc.desc: Verify that key mapping queries stay empty after injection and return independent arrays.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidInput0008', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0008', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#1 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#2 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_ENTER, false)).assertTrue()");
      expect(await manager.sendKeyEvent(KEY_CODE_ENTER, false)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#3 assert ' + "expect(manager.getKeyMappingCount()).assertEqual(0)");
      expect(manager.getKeyMappingCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#4 assert ' + "expect(manager.getSupportedKeys().length).assertEqual(0)");
      expect(manager.getSupportedKeys().length).assertEqual(0);
      const first: number[] = manager.getSupportedKeys();
      const second: number[] = manager.getSupportedKeys();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#5 ' + "first === second" + ' = ' + JSON.stringify(first === second));
      expect(first === second).assertFalse();
      first.push(KEY_CODE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#6 ' + "first.length" + ' = ' + JSON.stringify(first.length));
      expect(first.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#7 assert ' + "expect(manager.getSupportedKeys().length).assertEqual(0)");
      expect(manager.getSupportedKeys().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#8 ' + "second.length" + ' = ' + JSON.stringify(second.length));
      expect(second.length).assertEqual(0);

      const exposed: HidModel = manager.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#9 ' + "exposed.keyMappingCount" + ' = ' + JSON.stringify(exposed.keyMappingCount));
      expect(exposed.keyMappingCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#10 ' + "exposed.supportedKeys.length" + ' = ' + JSON.stringify(exposed.supportedKeys.length));
      expect(exposed.supportedKeys.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#11 ' + "exposed.pointerSpeed" + ' = ' + JSON.stringify(exposed.pointerSpeed));
      expect(exposed.pointerSpeed).assertEqual(DEFAULT_POINTER_SPEED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0008',
        '#12 assert ' + "expect(recordsOf(manager).length).assertEqual(4)");
      expect(recordsOf(manager).length).assertEqual(4);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0008', 'end');
    });

    /*
     * @tc.number: SUB_HID_INPUT_0900
     * @tc.name: testHidInput0009
     * @tc.desc: Verify that the pointer speed survives destroy and re-initialization of the manager.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHidInput0009', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0009', 'begin');
      const manager = await readyManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#1 assert ' + "expect(await manager.setPointerSpeed(3.5)).assertTrue()");
      expect(await manager.setPointerSpeed(3.5)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#2 assert ' + "expect(manager.getPointerSpeed()).assertEqual(3.5)");
      expect(manager.getPointerSpeed()).assertEqual(3.5);

      await manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#3 assert ' + "expect(manager.getPointerSpeed()).assertEqual(DEFAULT_POINTER_SPEED)");
      expect(manager.getPointerSpeed()).assertEqual(DEFAULT_POINTER_SPEED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#4 assert ' + "expect(manager.getKeyMappingCount()).assertEqual(0)");
      expect(manager.getKeyMappingCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#5 assert ' + "expect(manager.getSupportedKeys().length).assertEqual(0)");
      expect(manager.getSupportedKeys().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#6 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#7 assert ' + "expect(await manager.setPointerSpeed(4.5)).assertFalse()");
      expect(await manager.setPointerSpeed(4.5)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#8 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#9 assert ' + "expect(lastRecord(manager).operationName).assertEqual('reset')");
      expect(lastRecord(manager).operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#10 assert ' + "expect(lastRecord(manager).details).assertEqual('Manager reset')");
      expect(lastRecord(manager).details).assertEqual('Manager reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#11 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const stats: HidServiceStatistics = manager.getService().getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#12 ' + "stats.isInitialized" + ' = ' + JSON.stringify(stats.isInitialized));
      expect(stats.isInitialized).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#13 assert ' + "expect(await manager.initialize()).assertTrue()");
      expect(await manager.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#14 assert ' + "expect(manager.getPointerSpeed()).assertEqual(3.5)");
      expect(manager.getPointerSpeed()).assertEqual(3.5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#15 assert ' + "expect(manager.getOperationRecords().length).assertEqual(1)");
      expect(manager.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#16 assert ' + "expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1')");
      expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0009',
        '#17 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse();

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0009', 'end');
    });

    /*
     * @tc.number: SUB_HID_INPUT_1000
     * @tc.name: testHidInput0010
     * @tc.desc: Verify the record order when three injection calls are issued concurrently.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHidInput0010', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0010', 'begin');
      const manager = await connectedManager(DEVICE_A);
      const tasks: Promise<boolean>[] =
        [manager.sendKeyEvent(KEY_CODE_A, true), manager.sendMouseMove(1, 2), manager.sendMouseButton(2, true)];
      const results: boolean[] = await Promise.all(tasks);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0010',
        '#1 ' + "results.length" + ' = ' + JSON.stringify(results.length));
      expect(results.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0010',
        '#2 ' + "results[0]" + ' = ' + JSON.stringify(results[0]));
      expect(results[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0010',
        '#3 ' + "results[1]" + ' = ' + JSON.stringify(results[1]));
      expect(results[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0010',
        '#4 ' + "results[2]" + ' = ' + JSON.stringify(results[2]));
      expect(results[2]).assertTrue();

      const names = recordNames(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0010',
        '#5 ' + "names.length" + ' = ' + JSON.stringify(names.length));
      expect(names.length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0010',
        '#6 ' + "names[2]" + ' = ' + JSON.stringify(names[2]));
      expect(names[2]).assertEqual('sendKeyEvent');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0010',
        '#7 ' + "names[3]" + ' = ' + JSON.stringify(names[3]));
      expect(names[3]).assertEqual('sendMouseMove');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0010',
        '#8 ' + "names[4]" + ' = ' + JSON.stringify(names[4]));
      expect(names[4]).assertEqual('sendMouseButton');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0010',
        '#9 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(5)");
      expect(manager.getStatistics().totalOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0010',
        '#10 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(2)");
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0010', 'end');
    });

    /*
     * @tc.number: SUB_HID_INPUT_1100
     * @tc.name: testHidInput0011
     * @tc.desc: Verify that losing the device blocks injections but keeps the pointer speed setting usable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHidInput0011', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0011', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#1 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#2 assert ' + "expect(await manager.disconnect(DEVICE_A)).assertTrue()");
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#3 assert ' + "expect(manager.isConnected()).assertFalse()");
      expect(manager.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#4 assert ' +
        "expect(manager.getService().getConnectionState()) .assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(manager.getService().getConnectionState())
        .assertEqual(BluetoothConnectionState.DISCONNECTED);

      const recordsBefore = recordsOf(manager).length;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#5 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, false)).assertFalse()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, false)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#6 assert ' + "expect(await manager.sendMouseMove(3, 3)).assertFalse()");
      expect(await manager.sendMouseMove(3, 3)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#7 assert ' + "expect(await manager.sendMouseButton(0, false)).assertFalse()");
      expect(await manager.sendMouseButton(0, false)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#8 assert ' + "expect(await manager.sendScrollEvent(0, 1)).assertFalse()");
      expect(await manager.sendScrollEvent(0, 1)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#9 assert ' + "expect(await manager.sendTouchEvent(1, 2, 0.1, true)).assertFalse()");
      expect(await manager.sendTouchEvent(1, 2, 0.1, true)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#10 assert ' + "expect(recordsOf(manager).length).assertEqual(recordsBefore)");
      expect(recordsOf(manager).length).assertEqual(recordsBefore);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#11 assert ' + "expect(await manager.setPointerSpeed(2)).assertTrue()");
      expect(await manager.setPointerSpeed(2)).assertTrue();
      const records = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#12 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(recordsBefore + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#13 ' + "records[records.length - 1].details" + ' = ' + JSON.stringify(records[records.length - 1].details));
      expect(records[records.length - 1].details).assertEqual('Speed: 2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#14 assert ' + "expect(manager.getPointerSpeed()).assertEqual(2)");
      expect(manager.getPointerSpeed()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0011',
        '#15 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(records.length)");
      expect(manager.getStatistics().totalOperations).assertEqual(records.length);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0011', 'end');
    });

    /*
     * @tc.number: SUB_HID_INPUT_1200
     * @tc.name: testHidInput0012
     * @tc.desc: Verify that reset clears records and the identifier counter keeps increasing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHidInput0012', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0012', 'begin');
      const manager = await connectedManager(DEVICE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#1 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#2 assert ' + "expect(await manager.setPointerSpeed(1.5)).assertTrue()");
      expect(await manager.setPointerSpeed(1.5)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#3 assert ' + "expect(manager.getOperationRecords().length).assertEqual(4)");
      expect(manager.getOperationRecords().length).assertEqual(4);

      await manager.reset();
      const afterReset = recordsOf(manager);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#4 ' + "afterReset.length" + ' = ' + JSON.stringify(afterReset.length));
      expect(afterReset.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#5 ' + "afterReset[0].operationName" + ' = ' + JSON.stringify(afterReset[0].operationName));
      expect(afterReset[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#6 ' + "afterReset[0].operationId" + ' = ' + JSON.stringify(afterReset[0].operationId));
      expect(afterReset[0].operationId).assertEqual('mgr_op_6');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#7 ' + "afterReset[0].details" + ' = ' + JSON.stringify(afterReset[0].details));
      expect(afterReset[0].details).assertEqual('Manager reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#8 assert ' + "expect(manager.getManagedDeviceCount()).assertEqual(0)");
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#9 assert ' + "expect(manager.getPointerSpeed()).assertEqual(1.5)");
      expect(manager.getPointerSpeed()).assertEqual(1.5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#10 assert ' + "expect(serviceHistoryCount(manager)).assertEqual(1)");
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const history = manager.getService().getOperationHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#11 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#12 ' + "history[0].operation" + ' = ' + JSON.stringify(history[0].operation));
      expect(history[0].operation).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#13 ' + "history[0].details" + ' = ' + JSON.stringify(history[0].details));
      expect(history[0].details).assertEqual('Service reset');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#14 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#15 assert ' + "expect(recordsOf(manager).length).assertEqual(1)");
      expect(recordsOf(manager).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#16 assert ' + "expect(await manager.connect(DEVICE_B)).assertTrue()");
      expect(await manager.connect(DEVICE_B)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#17 assert ' + "expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_7')");
      expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_7');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#18 assert ' + "expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue()");
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#19 assert ' + "expect(lastRecord(manager).details).assertEqual('Key 65 down')");
      expect(lastRecord(manager).details).assertEqual('Key 65 down');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#20 assert ' + "expect(manager.getOperationRecords().length).assertEqual(3)");
      expect(manager.getOperationRecords().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testHidInput0012',
        '#21 assert ' + "expect(manager.getStatistics().totalOperations).assertEqual(8)");
      expect(manager.getStatistics().totalOperations).assertEqual(8);

      await manager.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testHidInput0012', 'end');
    });
  });
}
