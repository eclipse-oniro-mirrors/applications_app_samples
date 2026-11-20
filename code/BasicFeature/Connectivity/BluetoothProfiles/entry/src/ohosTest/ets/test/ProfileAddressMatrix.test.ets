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
 * 蓝牙设备地址处理矩阵。
 *
 * 同一批输入同时穿过归一化、格式校验、分段与脱敏四个函数，
 * 这样任何一个函数单独回归都会立刻暴露；另外单独覆盖「两个地址是否同一台设备」的等价判定。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  DEVICE_ID_SEGMENT_COUNT,
  EMPTY_DEVICE_ID_TEXT,
  isSameDevice,
  isValidDeviceId,
  maskDeviceId,
  normalizeDeviceId,
  splitAddress
} from '../../../main/ets/model/DeviceAddress';

export default function bluetoothProfileAddressMatrixTest() {
  describe('BluetoothProfileAddressMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0001
     * @tc.name addressMatrix0001
     * @tc.desc Verify address "canonical uppercase" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0001', 0, () => {
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(isValidDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual(true);
      expect(splitAddress('A1:B2:C3:D4:E5:F6').length).assertEqual(6);
      expect(maskDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:**:**:**:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0002
     * @tc.name addressMatrix0002
     * @tc.desc Verify address "all lowercase" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0002', 0, () => {
      expect(normalizeDeviceId('a1:b2:c3:d4:e5:f6')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(isValidDeviceId('a1:b2:c3:d4:e5:f6')).assertEqual(true);
      expect(splitAddress('a1:b2:c3:d4:e5:f6').length).assertEqual(6);
      expect(maskDeviceId('a1:b2:c3:d4:e5:f6')).assertEqual('A1:B2:**:**:**:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0003
     * @tc.name addressMatrix0003
     * @tc.desc Verify address "surrounding blanks" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0003', 0, () => {
      expect(normalizeDeviceId('  A1:B2:C3:D4:E5:F6  ')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(isValidDeviceId('  A1:B2:C3:D4:E5:F6  ')).assertEqual(true);
      expect(splitAddress('  A1:B2:C3:D4:E5:F6  ').length).assertEqual(6);
      expect(maskDeviceId('  A1:B2:C3:D4:E5:F6  ')).assertEqual('A1:B2:**:**:**:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0004
     * @tc.name addressMatrix0004
     * @tc.desc Verify address "all digits" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0004', 0, () => {
      expect(normalizeDeviceId('00:11:22:33:44:55')).assertEqual('00:11:22:33:44:55');
      expect(isValidDeviceId('00:11:22:33:44:55')).assertEqual(true);
      expect(splitAddress('00:11:22:33:44:55').length).assertEqual(6);
      expect(maskDeviceId('00:11:22:33:44:55')).assertEqual('00:11:**:**:**:55');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0005
     * @tc.name addressMatrix0005
     * @tc.desc Verify address "descending hex" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0005', 0, () => {
      expect(normalizeDeviceId('FF:FE:FD:FC:FB:FA')).assertEqual('FF:FE:FD:FC:FB:FA');
      expect(isValidDeviceId('FF:FE:FD:FC:FB:FA')).assertEqual(true);
      expect(splitAddress('FF:FE:FD:FC:FB:FA').length).assertEqual(6);
      expect(maskDeviceId('FF:FE:FD:FC:FB:FA')).assertEqual('FF:FE:**:**:**:FA');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0006
     * @tc.name addressMatrix0006
     * @tc.desc Verify address "mixed case" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0006', 0, () => {
      expect(normalizeDeviceId('aB:Cd:eF:01:23:45')).assertEqual('AB:CD:EF:01:23:45');
      expect(isValidDeviceId('aB:Cd:eF:01:23:45')).assertEqual(true);
      expect(splitAddress('aB:Cd:eF:01:23:45').length).assertEqual(6);
      expect(maskDeviceId('aB:Cd:eF:01:23:45')).assertEqual('AB:CD:**:**:**:45');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0007
     * @tc.name addressMatrix0007
     * @tc.desc Verify address "aligned hex pairs" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0007', 0, () => {
      expect(normalizeDeviceId('0A:1B:2C:3D:4E:5F')).assertEqual('0A:1B:2C:3D:4E:5F');
      expect(isValidDeviceId('0A:1B:2C:3D:4E:5F')).assertEqual(true);
      expect(splitAddress('0A:1B:2C:3D:4E:5F').length).assertEqual(6);
      expect(maskDeviceId('0A:1B:2C:3D:4E:5F')).assertEqual('0A:1B:**:**:**:5F');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0008
     * @tc.name addressMatrix0008
     * @tc.desc Verify address "word like segments" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0008', 0, () => {
      expect(normalizeDeviceId('DE:AD:BE:EF:00:01')).assertEqual('DE:AD:BE:EF:00:01');
      expect(isValidDeviceId('DE:AD:BE:EF:00:01')).assertEqual(true);
      expect(splitAddress('DE:AD:BE:EF:00:01').length).assertEqual(6);
      expect(maskDeviceId('DE:AD:BE:EF:00:01')).assertEqual('DE:AD:**:**:**:01');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0009
     * @tc.name addressMatrix0009
     * @tc.desc Verify address "leading tab" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0009', 0, () => {
      expect(normalizeDeviceId('\tA1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(isValidDeviceId('\tA1:B2:C3:D4:E5:F6')).assertEqual(true);
      expect(splitAddress('\tA1:B2:C3:D4:E5:F6').length).assertEqual(6);
      expect(maskDeviceId('\tA1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:**:**:**:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0010
     * @tc.name addressMatrix0010
     * @tc.desc Verify address "trailing newline" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0010', 0, () => {
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6\n')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(isValidDeviceId('A1:B2:C3:D4:E5:F6\n')).assertEqual(true);
      expect(splitAddress('A1:B2:C3:D4:E5:F6\n').length).assertEqual(6);
      expect(maskDeviceId('A1:B2:C3:D4:E5:F6\n')).assertEqual('A1:B2:**:**:**:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0011
     * @tc.name addressMatrix0011
     * @tc.desc Verify address "single letter pairs" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0011', 0, () => {
      expect(normalizeDeviceId('AB:CD:EF:01:23:45')).assertEqual('AB:CD:EF:01:23:45');
      expect(isValidDeviceId('AB:CD:EF:01:23:45')).assertEqual(true);
      expect(splitAddress('AB:CD:EF:01:23:45').length).assertEqual(6);
      expect(maskDeviceId('AB:CD:EF:01:23:45')).assertEqual('AB:CD:**:**:**:45');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0012
     * @tc.name addressMatrix0012
     * @tc.desc Verify address "empty string" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0012', 0, () => {
      expect(normalizeDeviceId('')).assertEqual('');
      expect(isValidDeviceId('')).assertEqual(false);
      expect(splitAddress('').length).assertEqual(0);
      expect(maskDeviceId('')).assertEqual('--');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0013
     * @tc.name addressMatrix0013
     * @tc.desc Verify address "blank string" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0013', 0, () => {
      expect(normalizeDeviceId('   ')).assertEqual('');
      expect(isValidDeviceId('   ')).assertEqual(false);
      expect(splitAddress('   ').length).assertEqual(0);
      expect(maskDeviceId('   ')).assertEqual('--');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0014
     * @tc.name addressMatrix0014
     * @tc.desc Verify address "five segments" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0014', 0, () => {
      expect(normalizeDeviceId('A1:B2:C3:D4:E5')).assertEqual('A1:B2:C3:D4:E5');
      expect(isValidDeviceId('A1:B2:C3:D4:E5')).assertEqual(false);
      expect(splitAddress('A1:B2:C3:D4:E5').length).assertEqual(5);
      expect(maskDeviceId('A1:B2:C3:D4:E5')).assertEqual('A1:B2:C3:D4:E5');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0015
     * @tc.name addressMatrix0015
     * @tc.desc Verify address "seven segments" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0015', 0, () => {
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6:07')).assertEqual('A1:B2:C3:D4:E5:F6:07');
      expect(isValidDeviceId('A1:B2:C3:D4:E5:F6:07')).assertEqual(false);
      expect(splitAddress('A1:B2:C3:D4:E5:F6:07').length).assertEqual(7);
      expect(maskDeviceId('A1:B2:C3:D4:E5:F6:07')).assertEqual('A1:B2:C3:D4:E5:F6:07');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0016
     * @tc.name addressMatrix0016
     * @tc.desc Verify address "non hex leading segment" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0016', 0, () => {
      expect(normalizeDeviceId('G1:B2:C3:D4:E5:F6')).assertEqual('G1:B2:C3:D4:E5:F6');
      expect(isValidDeviceId('G1:B2:C3:D4:E5:F6')).assertEqual(false);
      expect(splitAddress('G1:B2:C3:D4:E5:F6').length).assertEqual(6);
      expect(maskDeviceId('G1:B2:C3:D4:E5:F6')).assertEqual('G1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0017
     * @tc.name addressMatrix0017
     * @tc.desc Verify address "non hex trailing segment" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0017', 0, () => {
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:FG')).assertEqual('A1:B2:C3:D4:E5:FG');
      expect(isValidDeviceId('A1:B2:C3:D4:E5:FG')).assertEqual(false);
      expect(splitAddress('A1:B2:C3:D4:E5:FG').length).assertEqual(6);
      expect(maskDeviceId('A1:B2:C3:D4:E5:FG')).assertEqual('A1:B2:C3:D4:E5:FG');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0018
     * @tc.name addressMatrix0018
     * @tc.desc Verify address "no separators" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0018', 0, () => {
      expect(normalizeDeviceId('A1B2C3D4E5F6')).assertEqual('A1B2C3D4E5F6');
      expect(isValidDeviceId('A1B2C3D4E5F6')).assertEqual(false);
      expect(splitAddress('A1B2C3D4E5F6').length).assertEqual(1);
      expect(maskDeviceId('A1B2C3D4E5F6')).assertEqual('A1B2C3D4E5F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0019
     * @tc.name addressMatrix0019
     * @tc.desc Verify address "single hex digit segment" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0019', 0, () => {
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F')).assertEqual('A1:B2:C3:D4:E5:F');
      expect(isValidDeviceId('A1:B2:C3:D4:E5:F')).assertEqual(false);
      expect(splitAddress('A1:B2:C3:D4:E5:F').length).assertEqual(6);
      expect(maskDeviceId('A1:B2:C3:D4:E5:F')).assertEqual('A1:B2:C3:D4:E5:F');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0020
     * @tc.name addressMatrix0020
     * @tc.desc Verify address "three hex digit segment" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0020', 0, () => {
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F66')).assertEqual('A1:B2:C3:D4:E5:F66');
      expect(isValidDeviceId('A1:B2:C3:D4:E5:F66')).assertEqual(false);
      expect(splitAddress('A1:B2:C3:D4:E5:F66').length).assertEqual(6);
      expect(maskDeviceId('A1:B2:C3:D4:E5:F66')).assertEqual('A1:B2:C3:D4:E5:F66');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0021
     * @tc.name addressMatrix0021
     * @tc.desc Verify address "hyphen separators" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0021', 0, () => {
      expect(normalizeDeviceId('A1-B2-C3-D4-E5-F6')).assertEqual('A1-B2-C3-D4-E5-F6');
      expect(isValidDeviceId('A1-B2-C3-D4-E5-F6')).assertEqual(false);
      expect(splitAddress('A1-B2-C3-D4-E5-F6').length).assertEqual(1);
      expect(maskDeviceId('A1-B2-C3-D4-E5-F6')).assertEqual('A1-B2-C3-D4-E5-F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0022
     * @tc.name addressMatrix0022
     * @tc.desc Verify address "empty middle segment" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0022', 0, () => {
      expect(normalizeDeviceId('A1::C3:D4:E5:F6')).assertEqual('A1::C3:D4:E5:F6');
      expect(isValidDeviceId('A1::C3:D4:E5:F6')).assertEqual(false);
      expect(splitAddress('A1::C3:D4:E5:F6').length).assertEqual(6);
      expect(maskDeviceId('A1::C3:D4:E5:F6')).assertEqual('A1::C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0023
     * @tc.name addressMatrix0023
     * @tc.desc Verify address "dot separators" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0023', 0, () => {
      expect(normalizeDeviceId('A1.B2.C3.D4.E5.F6')).assertEqual('A1.B2.C3.D4.E5.F6');
      expect(isValidDeviceId('A1.B2.C3.D4.E5.F6')).assertEqual(false);
      expect(splitAddress('A1.B2.C3.D4.E5.F6').length).assertEqual(1);
      expect(maskDeviceId('A1.B2.C3.D4.E5.F6')).assertEqual('A1.B2.C3.D4.E5.F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0024
     * @tc.name addressMatrix0024
     * @tc.desc Verify address "inner blank" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0024', 0, () => {
      expect(normalizeDeviceId('A1 :B2:C3:D4:E5:F6')).assertEqual('A1 :B2:C3:D4:E5:F6');
      expect(isValidDeviceId('A1 :B2:C3:D4:E5:F6')).assertEqual(false);
      expect(splitAddress('A1 :B2:C3:D4:E5:F6').length).assertEqual(6);
      expect(maskDeviceId('A1 :B2:C3:D4:E5:F6')).assertEqual('A1 :B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0025
     * @tc.name addressMatrix0025
     * @tc.desc Verify address "letters outside hex" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0025', 0, () => {
      expect(normalizeDeviceId('ZZ:YY:XX:WW:VV:UU')).assertEqual('ZZ:YY:XX:WW:VV:UU');
      expect(isValidDeviceId('ZZ:YY:XX:WW:VV:UU')).assertEqual(false);
      expect(splitAddress('ZZ:YY:XX:WW:VV:UU').length).assertEqual(6);
      expect(maskDeviceId('ZZ:YY:XX:WW:VV:UU')).assertEqual('ZZ:YY:XX:WW:VV:UU');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0026
     * @tc.name addressMatrix0026
     * @tc.desc Verify address "lowercase single digit tail" normalizes, validates, splits and masks as expected.
     */
    it('addressMatrix0026', 0, () => {
      expect(normalizeDeviceId('a1:b2:c3:d4:e5:f')).assertEqual('A1:B2:C3:D4:E5:F');
      expect(isValidDeviceId('a1:b2:c3:d4:e5:f')).assertEqual(false);
      expect(splitAddress('a1:b2:c3:d4:e5:f').length).assertEqual(6);
      expect(maskDeviceId('a1:b2:c3:d4:e5:f')).assertEqual('A1:B2:C3:D4:E5:F');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0027
     * @tc.name addressMatrix0027
     * @tc.desc Verify isSameDevice treats the pair differing by case only as true.
     */
    it('addressMatrix0027', 0, () => {
      expect(isSameDevice('A1:B2:C3:D4:E5:F6', 'a1:b2:c3:d4:e5:f6')).assertEqual(true);
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(normalizeDeviceId('a1:b2:c3:d4:e5:f6')).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0028
     * @tc.name addressMatrix0028
     * @tc.desc Verify isSameDevice treats the pair differing by blanks only as true.
     */
    it('addressMatrix0028', 0, () => {
      expect(isSameDevice('A1:B2:C3:D4:E5:F6', '  A1:B2:C3:D4:E5:F6  ')).assertEqual(true);
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(normalizeDeviceId('  A1:B2:C3:D4:E5:F6  ')).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0029
     * @tc.name addressMatrix0029
     * @tc.desc Verify isSameDevice treats the pair differing by last byte as false.
     */
    it('addressMatrix0029', 0, () => {
      expect(isSameDevice('A1:B2:C3:D4:E5:F6', 'A1:B2:C3:D4:E5:F7')).assertEqual(false);
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F7')).assertEqual('A1:B2:C3:D4:E5:F7');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0030
     * @tc.name addressMatrix0030
     * @tc.desc Verify isSameDevice treats the pair differing by near last byte as false.
     */
    it('addressMatrix0030', 0, () => {
      expect(isSameDevice('A1:B2:C3:D4:E5:F6', 'A1:B2:C3:D4:E5:F5')).assertEqual(false);
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F5')).assertEqual('A1:B2:C3:D4:E5:F5');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0031
     * @tc.name addressMatrix0031
     * @tc.desc Verify isSameDevice treats the pair differing by swapped head as false.
     */
    it('addressMatrix0031', 0, () => {
      expect(isSameDevice('A1:B2:C3:D4:E5:F6', 'B1:A2:C3:D4:E5:F6')).assertEqual(false);
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(normalizeDeviceId('B1:A2:C3:D4:E5:F6')).assertEqual('B1:A2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0032
     * @tc.name addressMatrix0032
     * @tc.desc Verify isSameDevice treats the pair differing by both empty as true.
     */
    it('addressMatrix0032', 0, () => {
      expect(isSameDevice('', '')).assertEqual(true);
      expect(normalizeDeviceId('')).assertEqual('');
      expect(normalizeDeviceId('')).assertEqual('');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0033
     * @tc.name addressMatrix0033
     * @tc.desc Verify isSameDevice treats the pair differing by empty against address as false.
     */
    it('addressMatrix0033', 0, () => {
      expect(isSameDevice('', 'A1:B2:C3:D4:E5:F6')).assertEqual(false);
      expect(normalizeDeviceId('')).assertEqual('');
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0034
     * @tc.name addressMatrix0034
     * @tc.desc Verify isSameDevice treats the pair differing by tail digit as false.
     */
    it('addressMatrix0034', 0, () => {
      expect(isSameDevice('00:11:22:33:44:55', '00:11:22:33:44:56')).assertEqual(false);
      expect(normalizeDeviceId('00:11:22:33:44:55')).assertEqual('00:11:22:33:44:55');
      expect(normalizeDeviceId('00:11:22:33:44:56')).assertEqual('00:11:22:33:44:56');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0035
     * @tc.name addressMatrix0035
     * @tc.desc Verify isSameDevice treats the pair differing by word pairs case as true.
     */
    it('addressMatrix0035', 0, () => {
      expect(isSameDevice('DE:AD:BE:EF:00:01', 'de:ad:be:ef:00:01')).assertEqual(true);
      expect(normalizeDeviceId('DE:AD:BE:EF:00:01')).assertEqual('DE:AD:BE:EF:00:01');
      expect(normalizeDeviceId('de:ad:be:ef:00:01')).assertEqual('DE:AD:BE:EF:00:01');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0036
     * @tc.name addressMatrix0036
     * @tc.desc Verify isSameDevice treats the pair differing by single trailing blank as true.
     */
    it('addressMatrix0036', 0, () => {
      expect(isSameDevice('A1:B2:C3:D4:E5:F6', 'A1:B2:C3:D4:E5:F6 ')).assertEqual(true);
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6 ')).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0037
     * @tc.name addressMatrix0037
     * @tc.desc Verify the deviceId contract locks six segments and the empty placeholder text.
     */
    it('addressMatrix0037', 0, () => {
      expect(DEVICE_ID_SEGMENT_COUNT).assertEqual(6);
      expect(EMPTY_DEVICE_ID_TEXT).assertEqual('--');
      expect(splitAddress('A1:B2:C3:D4:E5:F6').length).assertEqual(DEVICE_ID_SEGMENT_COUNT);
      expect(maskDeviceId('')).assertEqual(EMPTY_DEVICE_ID_TEXT);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_0038
     * @tc.name addressMatrix0038
     * @tc.desc Verify the mask keeps the first two and the last segment and hides the middle three.
     */
    it('addressMatrix0038', 0, () => {
      const masked: string = maskDeviceId('DE:AD:BE:EF:00:01');
      expect(masked).assertEqual('DE:AD:**:**:**:01');
      expect(masked.split(':').length).assertEqual(DEVICE_ID_SEGMENT_COUNT);
      expect(masked.indexOf('BE:EF:00')).assertEqual(-1);
    });
  });
}
