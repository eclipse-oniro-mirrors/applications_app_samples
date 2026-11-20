/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * 状态谓词与文本摘要的矩阵。
 *
 * 这些谓词决定页面是否允许继续查询、是否显示「订阅」还是「取消订阅」，
 * 因此除了逐值断言布尔结果，还把「谓词结论」与「同源文案」交叉断言一次，
 * 保证两者不会出现一个说可用、一个说不可用的分裂。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  bluetoothStateName,
  isBluetoothUsable,
  nextSubscriptionAction,
  summarizeDeviceList
} from '../../../main/ets/model/ProfileState';

/** 构造指定数量的设备地址，供摘要用例使用 */
function buildDevices(count: number): string[] {
  const devices: string[] = [];
  for (let index = 0; index < count; index++) {
    const tail = index < 10 ? `0${index}` : `${index}`;
    devices.push(`A1:B2:C3:D4:E5:${tail}`);
  }
  return devices;
}

export default function bluetoothProfileStatePredicateTest() {
  describe('BluetoothProfileStatePredicateTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0001
     * @tc.name statePredicate0001
     * @tc.desc Verify bluetooth usability for state -3 agrees with its rendered text.
     */
    it('statePredicate0001', 0, () => {
      expect(isBluetoothUsable(-3)).assertEqual(false);
      expect(bluetoothStateName(-3)).assertEqual('未知状态');
      expect(isBluetoothUsable(-3) === (bluetoothStateName(-3) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0002
     * @tc.name statePredicate0002
     * @tc.desc Verify bluetooth usability for state -2 agrees with its rendered text.
     */
    it('statePredicate0002', 0, () => {
      expect(isBluetoothUsable(-2)).assertEqual(false);
      expect(bluetoothStateName(-2)).assertEqual('未知状态');
      expect(isBluetoothUsable(-2) === (bluetoothStateName(-2) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0003
     * @tc.name statePredicate0003
     * @tc.desc Verify bluetooth usability for state -1 agrees with its rendered text.
     */
    it('statePredicate0003', 0, () => {
      expect(isBluetoothUsable(-1)).assertEqual(false);
      expect(bluetoothStateName(-1)).assertEqual('未知状态');
      expect(isBluetoothUsable(-1) === (bluetoothStateName(-1) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0004
     * @tc.name statePredicate0004
     * @tc.desc Verify bluetooth usability for state 0 agrees with its rendered text.
     */
    it('statePredicate0004', 0, () => {
      expect(isBluetoothUsable(0)).assertEqual(false);
      expect(bluetoothStateName(0)).assertEqual('蓝牙已关闭');
      expect(isBluetoothUsable(0) === (bluetoothStateName(0) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0005
     * @tc.name statePredicate0005
     * @tc.desc Verify bluetooth usability for state 1 agrees with its rendered text.
     */
    it('statePredicate0005', 0, () => {
      expect(isBluetoothUsable(1)).assertEqual(false);
      expect(bluetoothStateName(1)).assertEqual('蓝牙正在开启');
      expect(isBluetoothUsable(1) === (bluetoothStateName(1) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0006
     * @tc.name statePredicate0006
     * @tc.desc Verify bluetooth usability for state 2 agrees with its rendered text.
     */
    it('statePredicate0006', 0, () => {
      expect(isBluetoothUsable(2)).assertEqual(true);
      expect(bluetoothStateName(2)).assertEqual('蓝牙已开启');
      expect(isBluetoothUsable(2) === (bluetoothStateName(2) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0007
     * @tc.name statePredicate0007
     * @tc.desc Verify bluetooth usability for state 3 agrees with its rendered text.
     */
    it('statePredicate0007', 0, () => {
      expect(isBluetoothUsable(3)).assertEqual(false);
      expect(bluetoothStateName(3)).assertEqual('蓝牙正在关闭');
      expect(isBluetoothUsable(3) === (bluetoothStateName(3) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0008
     * @tc.name statePredicate0008
     * @tc.desc Verify bluetooth usability for state 4 agrees with its rendered text.
     */
    it('statePredicate0008', 0, () => {
      expect(isBluetoothUsable(4)).assertEqual(false);
      expect(bluetoothStateName(4)).assertEqual('BLE 正在开启');
      expect(isBluetoothUsable(4) === (bluetoothStateName(4) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0009
     * @tc.name statePredicate0009
     * @tc.desc Verify bluetooth usability for state 5 agrees with its rendered text.
     */
    it('statePredicate0009', 0, () => {
      expect(isBluetoothUsable(5)).assertEqual(false);
      expect(bluetoothStateName(5)).assertEqual('仅 BLE 模式');
      expect(isBluetoothUsable(5) === (bluetoothStateName(5) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0010
     * @tc.name statePredicate0010
     * @tc.desc Verify bluetooth usability for state 6 agrees with its rendered text.
     */
    it('statePredicate0010', 0, () => {
      expect(isBluetoothUsable(6)).assertEqual(false);
      expect(bluetoothStateName(6)).assertEqual('BLE 正在关闭');
      expect(isBluetoothUsable(6) === (bluetoothStateName(6) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0011
     * @tc.name statePredicate0011
     * @tc.desc Verify bluetooth usability for state 7 agrees with its rendered text.
     */
    it('statePredicate0011', 0, () => {
      expect(isBluetoothUsable(7)).assertEqual(false);
      expect(bluetoothStateName(7)).assertEqual('未知状态');
      expect(isBluetoothUsable(7) === (bluetoothStateName(7) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0012
     * @tc.name statePredicate0012
     * @tc.desc Verify bluetooth usability for state 8 agrees with its rendered text.
     */
    it('statePredicate0012', 0, () => {
      expect(isBluetoothUsable(8)).assertEqual(false);
      expect(bluetoothStateName(8)).assertEqual('未知状态');
      expect(isBluetoothUsable(8) === (bluetoothStateName(8) === '蓝牙已开启')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0013
     * @tc.name statePredicate0013
     * @tc.desc Verify the next subscription action for false is the documented opposite.
     */
    it('statePredicate0013', 0, () => {
      expect(nextSubscriptionAction(false)).assertEqual('订阅状态变化');
      expect(nextSubscriptionAction(false).length).assertEqual(6);
      expect(nextSubscriptionAction(false) === nextSubscriptionAction(true)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0014
     * @tc.name statePredicate0014
     * @tc.desc Verify the next subscription action for true is the documented opposite.
     */
    it('statePredicate0014', 0, () => {
      expect(nextSubscriptionAction(true)).assertEqual('取消订阅');
      expect(nextSubscriptionAction(true).length).assertEqual(4);
      expect(nextSubscriptionAction(true) === nextSubscriptionAction(false)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0015
     * @tc.name statePredicate0015
     * @tc.desc Verify summarizeDeviceList for 0 entries renders the expected text.
     */
    it('statePredicate0015', 0, () => {
      const devices: string[] = buildDevices(0);
      expect(devices.length).assertEqual(0);
      expect(summarizeDeviceList(devices)).assertEqual('暂无已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(7);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0016
     * @tc.name statePredicate0016
     * @tc.desc Verify summarizeDeviceList for 1 entries renders the expected text.
     */
    it('statePredicate0016', 0, () => {
      const devices: string[] = buildDevices(1);
      expect(devices.length).assertEqual(1);
      expect(summarizeDeviceList(devices)).assertEqual('1 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0017
     * @tc.name statePredicate0017
     * @tc.desc Verify summarizeDeviceList for 2 entries renders the expected text.
     */
    it('statePredicate0017', 0, () => {
      const devices: string[] = buildDevices(2);
      expect(devices.length).assertEqual(2);
      expect(summarizeDeviceList(devices)).assertEqual('2 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0018
     * @tc.name statePredicate0018
     * @tc.desc Verify summarizeDeviceList for 3 entries renders the expected text.
     */
    it('statePredicate0018', 0, () => {
      const devices: string[] = buildDevices(3);
      expect(devices.length).assertEqual(3);
      expect(summarizeDeviceList(devices)).assertEqual('3 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0019
     * @tc.name statePredicate0019
     * @tc.desc Verify summarizeDeviceList for 4 entries renders the expected text.
     */
    it('statePredicate0019', 0, () => {
      const devices: string[] = buildDevices(4);
      expect(devices.length).assertEqual(4);
      expect(summarizeDeviceList(devices)).assertEqual('4 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0020
     * @tc.name statePredicate0020
     * @tc.desc Verify summarizeDeviceList for 5 entries renders the expected text.
     */
    it('statePredicate0020', 0, () => {
      const devices: string[] = buildDevices(5);
      expect(devices.length).assertEqual(5);
      expect(summarizeDeviceList(devices)).assertEqual('5 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0021
     * @tc.name statePredicate0021
     * @tc.desc Verify summarizeDeviceList for 6 entries renders the expected text.
     */
    it('statePredicate0021', 0, () => {
      const devices: string[] = buildDevices(6);
      expect(devices.length).assertEqual(6);
      expect(summarizeDeviceList(devices)).assertEqual('6 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0022
     * @tc.name statePredicate0022
     * @tc.desc Verify summarizeDeviceList for 7 entries renders the expected text.
     */
    it('statePredicate0022', 0, () => {
      const devices: string[] = buildDevices(7);
      expect(devices.length).assertEqual(7);
      expect(summarizeDeviceList(devices)).assertEqual('7 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0023
     * @tc.name statePredicate0023
     * @tc.desc Verify summarizeDeviceList for 8 entries renders the expected text.
     */
    it('statePredicate0023', 0, () => {
      const devices: string[] = buildDevices(8);
      expect(devices.length).assertEqual(8);
      expect(summarizeDeviceList(devices)).assertEqual('8 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0024
     * @tc.name statePredicate0024
     * @tc.desc Verify summarizeDeviceList for 12 entries renders the expected text.
     */
    it('statePredicate0024', 0, () => {
      const devices: string[] = buildDevices(12);
      expect(devices.length).assertEqual(12);
      expect(summarizeDeviceList(devices)).assertEqual('12 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(9);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_PREDICATE_0025
     * @tc.name statePredicate0025
     * @tc.desc Verify summarizeDeviceList for 32 entries renders the expected text.
     */
    it('statePredicate0025', 0, () => {
      const devices: string[] = buildDevices(32);
      expect(devices.length).assertEqual(32);
      expect(summarizeDeviceList(devices)).assertEqual('32 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(9);
    });
  });
}
