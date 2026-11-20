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
 * 设备地址的形态网格。
 *
 * 四十八种输入覆盖「合法大小写、首尾空白、段数错位、分隔符替换、非十六进制字符、空串」六类形态，
 * 每条输入分别从校验视角与脱敏视角断言，脱敏视角额外数一遍三颗星是否真的出现三次。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  isSameDevice,
  isValidDeviceId,
  maskDeviceId,
  normalizeDeviceId,
  splitAddress
} from '../../../main/ets/model/DeviceAddress';

export default function bluetoothProfileAddressGridTest() {
  describe('BluetoothProfileAddressGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0001
     * @tc.name addressGrid0001
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0001', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F7';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F7')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0002
     * @tc.name addressGrid0002
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0002', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F7';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F7');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0003
     * @tc.name addressGrid0003
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0003', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F8';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F8');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F8')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0004
     * @tc.name addressGrid0004
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0004', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F8';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F8');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0005
     * @tc.name addressGrid0005
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0005', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F9';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F9');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F9')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0006
     * @tc.name addressGrid0006
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0006', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F9';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F9');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0007
     * @tc.name addressGrid0007
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0007', 0, () => {
      const raw: string = 'AB:CD:EF:AB:CD:EF';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('AB:CD:EF:AB:CD:EF');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'AB:CD:EF:AB:CD:EF')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0008
     * @tc.name addressGrid0008
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0008', 0, () => {
      const raw: string = 'AB:CD:EF:AB:CD:EF';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('AB:CD:**:**:**:EF');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0009
     * @tc.name addressGrid0009
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0009', 0, () => {
      const raw: string = '00:00:00:00:00:00';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('00:00:00:00:00:00');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '00:00:00:00:00:00')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0010
     * @tc.name addressGrid0010
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0010', 0, () => {
      const raw: string = '00:00:00:00:00:00';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('00:00:**:**:**:00');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0011
     * @tc.name addressGrid0011
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0011', 0, () => {
      const raw: string = 'FF:FF:FF:FF:FF:FF';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('FF:FF:FF:FF:FF:FF');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'FF:FF:FF:FF:FF:FF')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0012
     * @tc.name addressGrid0012
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0012', 0, () => {
      const raw: string = 'FF:FF:FF:FF:FF:FF';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('FF:FF:**:**:**:FF');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0013
     * @tc.name addressGrid0013
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0013', 0, () => {
      const raw: string = '7A:8B:9C:AD:BE:CF';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('7A:8B:9C:AD:BE:CF');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '7A:8B:9C:AD:BE:CF')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0014
     * @tc.name addressGrid0014
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0014', 0, () => {
      const raw: string = '7A:8B:9C:AD:BE:CF';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('7A:8B:**:**:**:CF');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0015
     * @tc.name addressGrid0015
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0015', 0, () => {
      const raw: string = '18:24:36:48:5A:6C';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('18:24:36:48:5A:6C');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '18:24:36:48:5A:6C')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0016
     * @tc.name addressGrid0016
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0016', 0, () => {
      const raw: string = '18:24:36:48:5A:6C';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('18:24:**:**:**:6C');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0017
     * @tc.name addressGrid0017
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0017', 0, () => {
      const raw: string = '3C:3D:3E:3F:40:41';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('3C:3D:3E:3F:40:41');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '3C:3D:3E:3F:40:41')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0018
     * @tc.name addressGrid0018
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0018', 0, () => {
      const raw: string = '3C:3D:3E:3F:40:41';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('3C:3D:**:**:**:41');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0019
     * @tc.name addressGrid0019
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0019', 0, () => {
      const raw: string = '10:10:10:10:10:10';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('10:10:10:10:10:10');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '10:10:10:10:10:10')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0020
     * @tc.name addressGrid0020
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0020', 0, () => {
      const raw: string = '10:10:10:10:10:10';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('10:10:**:**:**:10');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0021
     * @tc.name addressGrid0021
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0021', 0, () => {
      const raw: string = '5F:5F:5F:5F:5F:5F';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('5F:5F:5F:5F:5F:5F');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '5F:5F:5F:5F:5F:5F')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0022
     * @tc.name addressGrid0022
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0022', 0, () => {
      const raw: string = '5F:5F:5F:5F:5F:5F';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('5F:5F:**:**:**:5F');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0023
     * @tc.name addressGrid0023
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0023', 0, () => {
      const raw: string = '9A:9B:9C:9D:9E:9F';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('9A:9B:9C:9D:9E:9F');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '9A:9B:9C:9D:9E:9F')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0024
     * @tc.name addressGrid0024
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0024', 0, () => {
      const raw: string = '9A:9B:9C:9D:9E:9F';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('9A:9B:**:**:**:9F');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0025
     * @tc.name addressGrid0025
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0025', 0, () => {
      const raw: string = ' a1:b2:c3:d4:e5:f7';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F7')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0026
     * @tc.name addressGrid0026
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0026', 0, () => {
      const raw: string = ' a1:b2:c3:d4:e5:f7';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F7');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0027
     * @tc.name addressGrid0027
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0027', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F7 ';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F7')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0028
     * @tc.name addressGrid0028
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0028', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F7 ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F7');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0029
     * @tc.name addressGrid0029
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0029', 0, () => {
      const raw: string = '  A1:B2:C3:D4:E5:F7  ';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F7')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0030
     * @tc.name addressGrid0030
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0030', 0, () => {
      const raw: string = '  A1:B2:C3:D4:E5:F7  ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F7');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0031
     * @tc.name addressGrid0031
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0031', 0, () => {
      const raw: string = 'aB:Ab:aB:Ab:aB:Ab';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('AB:AB:AB:AB:AB:AB');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'AB:AB:AB:AB:AB:AB')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0032
     * @tc.name addressGrid0032
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0032', 0, () => {
      const raw: string = 'aB:Ab:aB:Ab:aB:Ab';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('AB:AB:**:**:**:AB');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0033
     * @tc.name addressGrid0033
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0033', 0, () => {
      const raw: string = 'eF:Fe:eF:Fe:eF:Fe';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('EF:FE:EF:FE:EF:FE');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'EF:FE:EF:FE:EF:FE')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0034
     * @tc.name addressGrid0034
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0034', 0, () => {
      const raw: string = 'eF:Fe:eF:Fe:eF:Fe';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('EF:FE:**:**:**:FE');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0035
     * @tc.name addressGrid0035
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0035', 0, () => {
      const raw: string = '0f:F0:0f:F0:0f:F0';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('0F:F0:0F:F0:0F:F0');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '0F:F0:0F:F0:0F:F0')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0036
     * @tc.name addressGrid0036
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0036', 0, () => {
      const raw: string = '0f:F0:0f:F0:0f:F0';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('0F:F0:**:**:**:F0');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0037
     * @tc.name addressGrid0037
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0037', 0, () => {
      const raw: string = 'A1 :B2:C3:D4:E5:F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1 :B2:C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1 :B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0038
     * @tc.name addressGrid0038
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0038', 0, () => {
      const raw: string = 'A1 :B2:C3:D4:E5:F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1 :B2:C3:D4:E5:F6');
      expect(masked.length).assertEqual(18);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0039
     * @tc.name addressGrid0039
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0039', 0, () => {
      const raw: string = 'A1: B2:C3:D4:E5:F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1: B2:C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1: B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0040
     * @tc.name addressGrid0040
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0040', 0, () => {
      const raw: string = 'A1: B2:C3:D4:E5:F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1: B2:C3:D4:E5:F6');
      expect(masked.length).assertEqual(18);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0041
     * @tc.name addressGrid0041
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0041', 0, () => {
      const raw: string = 'A1:B2: C3:D4:E5:F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2: C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2: C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0042
     * @tc.name addressGrid0042
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0042', 0, () => {
      const raw: string = 'A1:B2: C3:D4:E5:F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2: C3:D4:E5:F6');
      expect(masked.length).assertEqual(18);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0043
     * @tc.name addressGrid0043
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0043', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6:';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6:');
      expect(splitAddress(raw).length).assertEqual(7);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6:')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0044
     * @tc.name addressGrid0044
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0044', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6:';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F6:');
      expect(masked.length).assertEqual(18);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0045
     * @tc.name addressGrid0045
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0045', 0, () => {
      const raw: string = ':A1:B2:C3:D4:E5:F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual(':A1:B2:C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(7);
      expect(isSameDevice(raw, ':A1:B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0046
     * @tc.name addressGrid0046
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0046', 0, () => {
      const raw: string = ':A1:B2:C3:D4:E5:F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual(':A1:B2:C3:D4:E5:F6');
      expect(masked.length).assertEqual(18);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0047
     * @tc.name addressGrid0047
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0047', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6:A7';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6:A7');
      expect(splitAddress(raw).length).assertEqual(7);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6:A7')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0048
     * @tc.name addressGrid0048
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0048', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6:A7';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F6:A7');
      expect(masked.length).assertEqual(20);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0049
     * @tc.name addressGrid0049
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0049', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5');
      expect(splitAddress(raw).length).assertEqual(5);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0050
     * @tc.name addressGrid0050
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0050', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5');
      expect(masked.length).assertEqual(14);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0051
     * @tc.name addressGrid0051
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0051', 0, () => {
      const raw: string = 'A1:B2:C3:D4';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4');
      expect(splitAddress(raw).length).assertEqual(4);
      expect(isSameDevice(raw, 'A1:B2:C3:D4')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0052
     * @tc.name addressGrid0052
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0052', 0, () => {
      const raw: string = 'A1:B2:C3:D4';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4');
      expect(masked.length).assertEqual(11);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0053
     * @tc.name addressGrid0053
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0053', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6:G7:H8';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6:G7:H8');
      expect(splitAddress(raw).length).assertEqual(8);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6:G7:H8')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0054
     * @tc.name addressGrid0054
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0054', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6:G7:H8';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F6:G7:H8');
      expect(masked.length).assertEqual(23);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0055
     * @tc.name addressGrid0055
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0055', 0, () => {
      const raw: string = 'A:B2:C3:D4:E5:F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A:B2:C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A:B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0056
     * @tc.name addressGrid0056
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0056', 0, () => {
      const raw: string = 'A:B2:C3:D4:E5:F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A:B2:C3:D4:E5:F6');
      expect(masked.length).assertEqual(16);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0057
     * @tc.name addressGrid0057
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0057', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0058
     * @tc.name addressGrid0058
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0058', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F');
      expect(masked.length).assertEqual(16);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0059
     * @tc.name addressGrid0059
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0059', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6G';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6G');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6G')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0060
     * @tc.name addressGrid0060
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0060', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6G';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F6G');
      expect(masked.length).assertEqual(18);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0061
     * @tc.name addressGrid0061
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0061', 0, () => {
      const raw: string = 'A1.B2.C3.D4.E5.F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1.B2.C3.D4.E5.F6');
      expect(splitAddress(raw).length).assertEqual(1);
      expect(isSameDevice(raw, 'A1.B2.C3.D4.E5.F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0062
     * @tc.name addressGrid0062
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0062', 0, () => {
      const raw: string = 'A1.B2.C3.D4.E5.F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1.B2.C3.D4.E5.F6');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0063
     * @tc.name addressGrid0063
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0063', 0, () => {
      const raw: string = 'A1,B2,C3,D4,E5,F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1,B2,C3,D4,E5,F6');
      expect(splitAddress(raw).length).assertEqual(1);
      expect(isSameDevice(raw, 'A1,B2,C3,D4,E5,F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0064
     * @tc.name addressGrid0064
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0064', 0, () => {
      const raw: string = 'A1,B2,C3,D4,E5,F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1,B2,C3,D4,E5,F6');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0065
     * @tc.name addressGrid0065
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0065', 0, () => {
      const raw: string = 'A1/B2/C3/D4/E5/F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1/B2/C3/D4/E5/F6');
      expect(splitAddress(raw).length).assertEqual(1);
      expect(isSameDevice(raw, 'A1/B2/C3/D4/E5/F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0066
     * @tc.name addressGrid0066
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0066', 0, () => {
      const raw: string = 'A1/B2/C3/D4/E5/F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1/B2/C3/D4/E5/F6');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0067
     * @tc.name addressGrid0067
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0067', 0, () => {
      const raw: string = 'A1|B2|C3|D4|E5|F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1|B2|C3|D4|E5|F6');
      expect(splitAddress(raw).length).assertEqual(1);
      expect(isSameDevice(raw, 'A1|B2|C3|D4|E5|F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0068
     * @tc.name addressGrid0068
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0068', 0, () => {
      const raw: string = 'A1|B2|C3|D4|E5|F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1|B2|C3|D4|E5|F6');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0069
     * @tc.name addressGrid0069
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0069', 0, () => {
      const raw: string = 'A1_B2_C3_D4_E5_F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1_B2_C3_D4_E5_F6');
      expect(splitAddress(raw).length).assertEqual(1);
      expect(isSameDevice(raw, 'A1_B2_C3_D4_E5_F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0070
     * @tc.name addressGrid0070
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0070', 0, () => {
      const raw: string = 'A1_B2_C3_D4_E5_F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1_B2_C3_D4_E5_F6');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0071
     * @tc.name addressGrid0071
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0071', 0, () => {
      const raw: string = 'A1-B2-C3-D4-E5-F9';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1-B2-C3-D4-E5-F9');
      expect(splitAddress(raw).length).assertEqual(1);
      expect(isSameDevice(raw, 'A1-B2-C3-D4-E5-F9')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0072
     * @tc.name addressGrid0072
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0072', 0, () => {
      const raw: string = 'A1-B2-C3-D4-E5-F9';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1-B2-C3-D4-E5-F9');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0073
     * @tc.name addressGrid0073
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0073', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6;';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6;');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6;')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0074
     * @tc.name addressGrid0074
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0074', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6;';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F6;');
      expect(masked.length).assertEqual(18);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0075
     * @tc.name addressGrid0075
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0075', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6-';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6-');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6-')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0076
     * @tc.name addressGrid0076
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0076', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6-';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F6-');
      expect(masked.length).assertEqual(18);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0077
     * @tc.name addressGrid0077
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0077', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6#';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6#');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6#')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0078
     * @tc.name addressGrid0078
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0078', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6#';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F6#');
      expect(masked.length).assertEqual(18);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0079
     * @tc.name addressGrid0079
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0079', 0, () => {
      const raw: string = 'G1:B2:C3:D4:E5:F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('G1:B2:C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'G1:B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0080
     * @tc.name addressGrid0080
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0080', 0, () => {
      const raw: string = 'G1:B2:C3:D4:E5:F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('G1:B2:C3:D4:E5:F6');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0081
     * @tc.name addressGrid0081
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0081', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:Z6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:Z6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:Z6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0082
     * @tc.name addressGrid0082
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0082', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:Z6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:Z6');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0083
     * @tc.name addressGrid0083
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0083', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6 +';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6 +');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6 +')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0084
     * @tc.name addressGrid0084
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0084', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6 +';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F6 +');
      expect(masked.length).assertEqual(19);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0085
     * @tc.name addressGrid0085
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0085', 0, () => {
      const raw: string = '';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('');
      expect(splitAddress(raw).length).assertEqual(0);
      expect(isSameDevice(raw, '')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0086
     * @tc.name addressGrid0086
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0086', 0, () => {
      const raw: string = '';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('--');
      expect(masked.length).assertEqual(2);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0087
     * @tc.name addressGrid0087
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0087', 0, () => {
      const raw: string = ' ';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('');
      expect(splitAddress(raw).length).assertEqual(0);
      expect(isSameDevice(raw, '')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0088
     * @tc.name addressGrid0088
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0088', 0, () => {
      const raw: string = ' ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('--');
      expect(masked.length).assertEqual(2);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0089
     * @tc.name addressGrid0089
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0089', 0, () => {
      const raw: string = '   ';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('');
      expect(splitAddress(raw).length).assertEqual(0);
      expect(isSameDevice(raw, '')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0090
     * @tc.name addressGrid0090
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0090', 0, () => {
      const raw: string = '   ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('--');
      expect(masked.length).assertEqual(2);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0091
     * @tc.name addressGrid0091
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0091', 0, () => {
      const raw: string = '--';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('--');
      expect(splitAddress(raw).length).assertEqual(1);
      expect(isSameDevice(raw, '--')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0092
     * @tc.name addressGrid0092
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0092', 0, () => {
      const raw: string = '--';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('--');
      expect(masked.length).assertEqual(2);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0093
     * @tc.name addressGrid0093
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0093', 0, () => {
      const raw: string = '--:--:--:--:--:--';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('--:--:--:--:--:--');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '--:--:--:--:--:--')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0094
     * @tc.name addressGrid0094
     * @tc.desc Verify masking the grid input yields the bare text.
     */
    it('addressGrid0094', 0, () => {
      const raw: string = '--:--:--:--:--:--';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('--:--:--:--:--:--');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0095
     * @tc.name addressGrid0095
     * @tc.desc Verify the grid input keeps the validity, the case and the segment count it declares.
     */
    it('addressGrid0095', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6 ';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDRESS_GRID_0096
     * @tc.name addressGrid0096
     * @tc.desc Verify masking the grid input yields three stars.
     */
    it('addressGrid0096', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6 ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F6');
      expect(masked.length).assertEqual(17);
      expect(masked.split('**').length - 1).assertEqual(3);
    });
  });
}
