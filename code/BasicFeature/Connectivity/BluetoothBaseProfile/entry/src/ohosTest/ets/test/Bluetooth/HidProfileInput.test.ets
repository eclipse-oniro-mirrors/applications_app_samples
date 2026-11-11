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
  HidModel,
  HidProfileManager,
  HidService
} from 'library';

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
  const manager = new HidProfileManager();
  await manager.initialize();
  return manager;
}

async function connectedManager(deviceId: string): Promise<HidProfileManager> {
  const manager = new HidProfileManager();
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
      const manager = new HidProfileManager();
      const service: HidService = manager.getService();
      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      expect(service.getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(manager.isConnected()).assertFalse();

      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse();
      expect(await manager.sendMouseMove(10, -5)).assertFalse();
      expect(await manager.sendMouseButton(1, false)).assertFalse();
      expect(await manager.sendScrollEvent(0, 3)).assertFalse();
      expect(await manager.sendTouchEvent(120, 240, 0.8, true)).assertFalse();
      expect(await manager.setPointerSpeed(2.5)).assertFalse();

      expect(manager.getKeyMappingCount()).assertEqual(0);
      expect(manager.getSupportedKeys().length).assertEqual(0);
      expect(manager.getPointerSpeed()).assertEqual(DEFAULT_POINTER_SPEED);

      expect(service.getOperationHistory().length).assertEqual(0);
      expect(manager.getOperationRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalOperations).assertEqual(0);
      expect(manager.getStatistics().failedOperations).assertEqual(0);
      expect(manager.getManagedDeviceCount()).assertEqual(0);
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
      const manager = await readyManager();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(lastRecord(manager).operationName).assertEqual('initialize');
      expect(lastRecord(manager).details).assertEqual('Manager initialized');
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.isConnected()).assertFalse();

      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse();
      expect(await manager.sendMouseMove(10, -5)).assertFalse();
      expect(await manager.sendMouseButton(1, false)).assertFalse();
      expect(await manager.sendScrollEvent(0, 3)).assertFalse();
      expect(await manager.sendTouchEvent(120, 240, 0.8, true)).assertFalse();

      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(1);
      expect(serviceHistoryCount(manager)).assertEqual(1);

      expect(await manager.setPointerSpeed(2.5)).assertTrue();
      expect(lastRecord(manager).operationName).assertEqual('setPointerSpeed');
      expect(lastRecord(manager).details).assertEqual('Speed: 2.5');
      expect(manager.getPointerSpeed()).assertEqual(2.5);
      expect(manager.getOperationRecords().length).assertEqual(2);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(manager.getOperationRecords().length).assertEqual(2);
      expect(serviceHistoryCount(manager)).assertEqual(2);
      expect(recordNames(manager)[1]).assertEqual('connect');
      expect(recordsOf(manager)[1].details).assertEqual(`Connected to ${DEVICE_A}`);

      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue();
      expect(await manager.sendKeyEvent(KEY_CODE_A, false)).assertTrue();
      expect(await manager.sendKeyEvent(KEY_CODE_ENTER, true)).assertTrue();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(5);
      expect(records[2].operationName).assertEqual('sendKeyEvent');
      expect(records[2].details).assertEqual('Key 65 down');
      expect(records[2].success).assertTrue();
      expect(records[2].errorMessage).assertEqual('');
      expect(records[3].details).assertEqual('Key 65 up');
      expect(records[4].details).assertEqual('Key 13 down');
      expect(records[2].operationId).assertEqual('mgr_op_3');
      expect(records[4].operationId).assertEqual('mgr_op_5');
      expect(records[4].startTime).assertEqual(records[4].endTime);
      expect(records[4].durationMs).assertEqual(0);

      expect(serviceHistoryCount(manager)).assertEqual(2);
      expect(manager.getService().getOperationHistory()[1].operation).assertEqual('connect');

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.sendMouseMove(10, -5)).assertTrue();
      expect(await manager.sendMouseMove(0, 0)).assertTrue();
      expect(await manager.sendMouseButton(1, false)).assertTrue();
      expect(await manager.sendScrollEvent(0, 3)).assertTrue();
      expect(await manager.sendTouchEvent(120, 240, 0.8, true)).assertTrue();

      const records = recordsOf(manager);
      expect(records.length).assertEqual(7);
      expect(records[2].operationName).assertEqual('sendMouseMove');
      expect(records[2].details).assertEqual('Move delta(10, -5)');
      expect(records[3].details).assertEqual('Move delta(0, 0)');
      expect(records[4].operationName).assertEqual('sendMouseButton');
      expect(records[4].details).assertEqual('Button 1 up');
      expect(records[5].operationName).assertEqual('sendScrollEvent');
      expect(records[5].details).assertEqual('Scroll(0, 3)');
      expect(records[6].operationName).assertEqual('sendTouchEvent');
      expect(records[6].details).assertEqual('Touch(120, 240, p=0.8, true)');
      for (let i = 2; i < 7; i++) {
        expect(records[i].success).assertTrue();
        expect(records[i].errorMessage).assertEqual('');
      }
      expect(manager.getStatistics().totalOperations).assertEqual(7);
      expect(manager.getStatistics().failedOperations).assertEqual(0);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.sendTouchEvent(-1000, -1, 9.9, false)).assertTrue();
      expect(lastRecord(manager).details).assertEqual('Touch(-1000, -1, p=9.9, false)');
      expect(await manager.sendKeyEvent(0, false)).assertTrue();
      expect(lastRecord(manager).details).assertEqual('Key 0 up');
      expect(await manager.sendMouseButton(255, true)).assertTrue();
      expect(lastRecord(manager).details).assertEqual('Button 255 down');
      expect(await manager.sendScrollEvent(-120.5, 0.25)).assertTrue();
      expect(lastRecord(manager).details).assertEqual('Scroll(-120.5, 0.25)');
      expect(await manager.sendMouseMove(-1, -1)).assertTrue();
      expect(lastRecord(manager).details).assertEqual('Move delta(-1, -1)');

      const records = recordsOf(manager);
      expect(records.length).assertEqual(7);
      for (let i = 2; i < 7; i++) {
        expect(records[i].success).assertTrue();
        expect(records[i].errorMessage).assertEqual('');
      }
      expect(manager.getStatistics().failedOperations).assertEqual(0);
      expect(serviceHistoryCount(manager)).assertEqual(2);
      expect(manager.getSupportedKeys().length).assertEqual(0);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      const actions: string[] = [];
      const results: boolean[] = [];
      expect(await manager.sendKeyEvent(KEY_CODE_ENTER, true)).assertTrue();
      actions.push('sendKeyEvent');
      results.push(true);
      expect(await manager.sendMouseMove(2, 4)).assertTrue();
      actions.push('sendMouseMove');
      results.push(true);
      expect(await manager.sendMouseButton(0, true)).assertTrue();
      actions.push('sendMouseButton');
      results.push(true);
      expect(await manager.sendScrollEvent(1, -1)).assertTrue();
      actions.push('sendScrollEvent');
      results.push(true);
      expect(await manager.sendTouchEvent(5, 6, 0.5, false)).assertTrue();
      actions.push('sendTouchEvent');
      results.push(true);

      const names = recordNames(manager);
      expect(names.length).assertEqual(7);
      expect(results.length).assertEqual(5);
      for (let i = 0; i < actions.length; i++) {
        expect(names[i + 2]).assertEqual(actions[i]);
      }
      expect(manager.getStatistics().totalOperations).assertEqual(7);
      expect(recordsOf(manager).length).assertEqual(7);
      expect(manager.getStatistics().successfulOperations).assertEqual(7);
      expect(serviceHistoryCount(manager)).assertEqual(2);
      const stats: ESObject = manager.getService().getStatistics();
      expect(stats.operationHistoryCount).assertEqual(2);
      expect(stats.serviceName).assertEqual(SERVICE_NAME);

      await manager.destroy();
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
      const manager = await readyManager();
      const inputs: number[] = [-3, 0, 0.05, 1.75, 5, 7.5];
      const expected: number[] = [0.1, 0.1, 0.1, 1.75, 5, 5];
      for (let i = 0; i < inputs.length; i++) {
        expect(await manager.setPointerSpeed(inputs[i])).assertTrue();
        expect(manager.getPointerSpeed()).assertEqual(expected[i]);
        expect(lastRecord(manager).details).assertEqual(`Speed: ${expected[i]}`);
        expect(lastRecord(manager).operationName).assertEqual('setPointerSpeed');
      }
      const records = recordsOf(manager);
      expect(records.length).assertEqual(7);
      expect(records[6].operationId).assertEqual('mgr_op_7');
      expect(manager.getModel().pointerSpeed).assertEqual(DEFAULT_POINTER_SPEED);
      expect(serviceHistoryCount(manager)).assertEqual(1);
      expect(manager.getStatistics().totalOperations).assertEqual(7);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue();
      expect(await manager.sendKeyEvent(KEY_CODE_ENTER, false)).assertTrue();

      expect(manager.getKeyMappingCount()).assertEqual(0);
      expect(manager.getSupportedKeys().length).assertEqual(0);
      const first: number[] = manager.getSupportedKeys();
      const second: number[] = manager.getSupportedKeys();
      expect(first === second).assertFalse();
      first.push(KEY_CODE_A);
      expect(first.length).assertEqual(1);
      expect(manager.getSupportedKeys().length).assertEqual(0);
      expect(second.length).assertEqual(0);

      const exposed: HidModel = manager.getModel();
      expect(exposed.keyMappingCount).assertEqual(0);
      expect(exposed.supportedKeys.length).assertEqual(0);
      expect(exposed.pointerSpeed).assertEqual(DEFAULT_POINTER_SPEED);
      expect(recordsOf(manager).length).assertEqual(4);

      await manager.destroy();
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
      const manager = await readyManager();
      expect(await manager.setPointerSpeed(3.5)).assertTrue();
      expect(manager.getPointerSpeed()).assertEqual(3.5);

      await manager.destroy();
      expect(manager.getPointerSpeed()).assertEqual(DEFAULT_POINTER_SPEED);
      expect(manager.getKeyMappingCount()).assertEqual(0);
      expect(manager.getSupportedKeys().length).assertEqual(0);
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse();
      expect(await manager.setPointerSpeed(4.5)).assertFalse();
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(lastRecord(manager).operationName).assertEqual('reset');
      expect(lastRecord(manager).details).assertEqual('Manager reset');
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const stats: ESObject = manager.getService().getStatistics();
      expect(stats.isInitialized).assertFalse();

      expect(await manager.initialize()).assertTrue();
      expect(manager.getPointerSpeed()).assertEqual(3.5);
      expect(manager.getOperationRecords().length).assertEqual(1);
      expect(recordsOf(manager)[0].operationId).assertEqual('mgr_op_1');
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse();

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      const tasks: Promise<boolean>[] =
        [manager.sendKeyEvent(KEY_CODE_A, true), manager.sendMouseMove(1, 2), manager.sendMouseButton(2, true)];
      const results: boolean[] = await Promise.all(tasks);
      expect(results.length).assertEqual(3);
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();

      const names = recordNames(manager);
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual('sendKeyEvent');
      expect(names[3]).assertEqual('sendMouseMove');
      expect(names[4]).assertEqual('sendMouseButton');
      expect(manager.getStatistics().totalOperations).assertEqual(5);
      expect(serviceHistoryCount(manager)).assertEqual(2);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue();
      expect(await manager.disconnect(DEVICE_A)).assertTrue();
      expect(manager.isConnected()).assertFalse();
      expect(manager.getService().getConnectionState())
        .assertEqual(BluetoothConnectionState.DISCONNECTED);

      const recordsBefore = recordsOf(manager).length;
      expect(await manager.sendKeyEvent(KEY_CODE_A, false)).assertFalse();
      expect(await manager.sendMouseMove(3, 3)).assertFalse();
      expect(await manager.sendMouseButton(0, false)).assertFalse();
      expect(await manager.sendScrollEvent(0, 1)).assertFalse();
      expect(await manager.sendTouchEvent(1, 2, 0.1, true)).assertFalse();
      expect(recordsOf(manager).length).assertEqual(recordsBefore);

      expect(await manager.setPointerSpeed(2)).assertTrue();
      const records = recordsOf(manager);
      expect(records.length).assertEqual(recordsBefore + 1);
      expect(records[records.length - 1].details).assertEqual('Speed: 2');
      expect(manager.getPointerSpeed()).assertEqual(2);
      expect(manager.getStatistics().totalOperations).assertEqual(records.length);

      await manager.destroy();
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
      const manager = await connectedManager(DEVICE_A);
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue();
      expect(await manager.setPointerSpeed(1.5)).assertTrue();
      expect(manager.getOperationRecords().length).assertEqual(4);

      await manager.reset();
      const afterReset = recordsOf(manager);
      expect(afterReset.length).assertEqual(1);
      expect(afterReset[0].operationName).assertEqual('reset');
      expect(afterReset[0].operationId).assertEqual('mgr_op_6');
      expect(afterReset[0].details).assertEqual('Manager reset');
      expect(manager.getManagedDeviceCount()).assertEqual(0);
      expect(manager.getPointerSpeed()).assertEqual(1.5);
      expect(serviceHistoryCount(manager)).assertEqual(1);
      const history = manager.getService().getOperationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].operation).assertEqual('reset');
      expect(history[0].details).assertEqual('Service reset');

      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertFalse();
      expect(recordsOf(manager).length).assertEqual(1);
      expect(await manager.connect(DEVICE_B)).assertTrue();
      expect(recordsOf(manager)[1].operationId).assertEqual('mgr_op_7');
      expect(await manager.sendKeyEvent(KEY_CODE_A, true)).assertTrue();
      expect(lastRecord(manager).details).assertEqual('Key 65 down');
      expect(manager.getOperationRecords().length).assertEqual(3);
      expect(manager.getStatistics().totalOperations).assertEqual(8);

      await manager.destroy();
    });
  });
}
