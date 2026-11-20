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
 * 设备地址的双视角矩阵。
 *
 * 同一个入参既要过格式校验，又要能安全脱敏：合法地址保留前后段、非法地址原样回显，
 * 两种情况都不能抛异常、不能返回 undefined。
 * 这一组把合法、空白、段数不足、非十六进制、带分隔符错误等写法逐条交叉验证。
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

export default function bluetoothProfileAddressCrossTest() {
  describe('BluetoothProfileAddressCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0001
     * @tc.name addressCross0001
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5:F6 with 6 segments.
     */
    it('addressCross0001', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0002
     * @tc.name addressCross0002
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0002', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0003
     * @tc.name addressCross0003
     * @tc.desc Verify address case normalizes to 00:11:22:33:44:55 with 6 segments.
     */
    it('addressCross0003', 0, () => {
      const raw: string = '00:11:22:33:44:55';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('00:11:22:33:44:55');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '00:11:22:33:44:55')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0004
     * @tc.name addressCross0004
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0004', 0, () => {
      const raw: string = '00:11:22:33:44:55';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('00:11:**:**:**:55');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0005
     * @tc.name addressCross0005
     * @tc.desc Verify address case normalizes to AA:BB:CC:DD:EE:FF with 6 segments.
     */
    it('addressCross0005', 0, () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'AA:BB:CC:DD:EE:FF')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0006
     * @tc.name addressCross0006
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0006', 0, () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('AA:BB:**:**:**:FF');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0007
     * @tc.name addressCross0007
     * @tc.desc Verify address case normalizes to FF:FE:FD:FC:FB:FA with 6 segments.
     */
    it('addressCross0007', 0, () => {
      const raw: string = 'FF:FE:FD:FC:FB:FA';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('FF:FE:FD:FC:FB:FA');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'FF:FE:FD:FC:FB:FA')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0008
     * @tc.name addressCross0008
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0008', 0, () => {
      const raw: string = 'FF:FE:FD:FC:FB:FA';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('FF:FE:**:**:**:FA');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0009
     * @tc.name addressCross0009
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5:F6 with 6 segments.
     */
    it('addressCross0009', 0, () => {
      const raw: string = 'a1:b2:c3:d4:e5:f6';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0010
     * @tc.name addressCross0010
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0010', 0, () => {
      const raw: string = 'a1:b2:c3:d4:e5:f6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0011
     * @tc.name addressCross0011
     * @tc.desc Verify address case normalizes to 12:34:56:78:9A:BC with 6 segments.
     */
    it('addressCross0011', 0, () => {
      const raw: string = '12:34:56:78:9A:BC';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('12:34:56:78:9A:BC');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '12:34:56:78:9A:BC')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0012
     * @tc.name addressCross0012
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0012', 0, () => {
      const raw: string = '12:34:56:78:9A:BC';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('12:34:**:**:**:BC');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0013
     * @tc.name addressCross0013
     * @tc.desc Verify address case normalizes to DE:AD:BE:EF:00:01 with 6 segments.
     */
    it('addressCross0013', 0, () => {
      const raw: string = 'DE:AD:BE:EF:00:01';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('DE:AD:BE:EF:00:01');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'DE:AD:BE:EF:00:01')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0014
     * @tc.name addressCross0014
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0014', 0, () => {
      const raw: string = 'DE:AD:BE:EF:00:01';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('DE:AD:**:**:**:01');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0015
     * @tc.name addressCross0015
     * @tc.desc Verify address case normalizes to 0A:0B:0C:0D:0E:0F with 6 segments.
     */
    it('addressCross0015', 0, () => {
      const raw: string = '0A:0B:0C:0D:0E:0F';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('0A:0B:0C:0D:0E:0F');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '0A:0B:0C:0D:0E:0F')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0016
     * @tc.name addressCross0016
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0016', 0, () => {
      const raw: string = '0A:0B:0C:0D:0E:0F';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('0A:0B:**:**:**:0F');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0017
     * @tc.name addressCross0017
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5:F6 with 6 segments.
     */
    it('addressCross0017', 0, () => {
      const raw: string = ' A1:B2:C3:D4:E5:F6 ';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0018
     * @tc.name addressCross0018
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0018', 0, () => {
      const raw: string = ' A1:B2:C3:D4:E5:F6 ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0019
     * @tc.name addressCross0019
     * @tc.desc Verify address case normalizes to 00:11:22:33:44:55 with 6 segments.
     */
    it('addressCross0019', 0, () => {
      const raw: string = ' 00:11:22:33:44:55';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('00:11:22:33:44:55');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '00:11:22:33:44:55')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0020
     * @tc.name addressCross0020
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0020', 0, () => {
      const raw: string = ' 00:11:22:33:44:55';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('00:11:**:**:**:55');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0021
     * @tc.name addressCross0021
     * @tc.desc Verify address case normalizes to DE:AD:BE:EF:00:01 with 6 segments.
     */
    it('addressCross0021', 0, () => {
      const raw: string = 'DE:AD:BE:EF:00:01  ';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('DE:AD:BE:EF:00:01');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'DE:AD:BE:EF:00:01')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0022
     * @tc.name addressCross0022
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0022', 0, () => {
      const raw: string = 'DE:AD:BE:EF:00:01  ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('DE:AD:**:**:**:01');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0023
     * @tc.name addressCross0023
     * @tc.desc Verify address case normalizes to 0F:0E:0D:0C:0B:0A with 6 segments.
     */
    it('addressCross0023', 0, () => {
      const raw: string = ' 0f:0e:0d:0c:0b:0a ';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('0F:0E:0D:0C:0B:0A');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '0F:0E:0D:0C:0B:0A')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0024
     * @tc.name addressCross0024
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0024', 0, () => {
      const raw: string = ' 0f:0e:0d:0c:0b:0a ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('0F:0E:**:**:**:0A');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0025
     * @tc.name addressCross0025
     * @tc.desc Verify address case normalizes to 99:88:77:66:55:44 with 6 segments.
     */
    it('addressCross0025', 0, () => {
      const raw: string = '99:88:77:66:55:44';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('99:88:77:66:55:44');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '99:88:77:66:55:44')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0026
     * @tc.name addressCross0026
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0026', 0, () => {
      const raw: string = '99:88:77:66:55:44';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('99:88:**:**:**:44');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0027
     * @tc.name addressCross0027
     * @tc.desc Verify address case normalizes to AB:CD:EF:01:23:45 with 6 segments.
     */
    it('addressCross0027', 0, () => {
      const raw: string = 'AB:CD:EF:01:23:45';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('AB:CD:EF:01:23:45');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'AB:CD:EF:01:23:45')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0028
     * @tc.name addressCross0028
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0028', 0, () => {
      const raw: string = 'AB:CD:EF:01:23:45';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('AB:CD:**:**:**:45');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0029
     * @tc.name addressCross0029
     * @tc.desc Verify address case normalizes to 5A:5B:5C:5D:5E:5F with 6 segments.
     */
    it('addressCross0029', 0, () => {
      const raw: string = '5A:5B:5C:5D:5E:5F';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('5A:5B:5C:5D:5E:5F');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '5A:5B:5C:5D:5E:5F')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0030
     * @tc.name addressCross0030
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0030', 0, () => {
      const raw: string = '5A:5B:5C:5D:5E:5F';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('5A:5B:**:**:**:5F');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0031
     * @tc.name addressCross0031
     * @tc.desc Verify address case normalizes to A0:A1:A2:A3:A4:A5 with 6 segments.
     */
    it('addressCross0031', 0, () => {
      const raw: string = 'A0:A1:A2:A3:A4:A5';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A0:A1:A2:A3:A4:A5');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A0:A1:A2:A3:A4:A5')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0032
     * @tc.name addressCross0032
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0032', 0, () => {
      const raw: string = 'A0:A1:A2:A3:A4:A5';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A0:A1:**:**:**:A5');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0033
     * @tc.name addressCross0033
     * @tc.desc Verify address case normalizes to B1:B2:B3:B4:B5:B6 with 6 segments.
     */
    it('addressCross0033', 0, () => {
      const raw: string = 'B1:B2:B3:B4:B5:B6';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('B1:B2:B3:B4:B5:B6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'B1:B2:B3:B4:B5:B6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0034
     * @tc.name addressCross0034
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0034', 0, () => {
      const raw: string = 'B1:B2:B3:B4:B5:B6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('B1:B2:**:**:**:B6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0035
     * @tc.name addressCross0035
     * @tc.desc Verify address case normalizes to C1:C2:C3:C4:C5:C6 with 6 segments.
     */
    it('addressCross0035', 0, () => {
      const raw: string = 'C1:C2:C3:C4:C5:C6';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('C1:C2:C3:C4:C5:C6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'C1:C2:C3:C4:C5:C6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0036
     * @tc.name addressCross0036
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0036', 0, () => {
      const raw: string = 'C1:C2:C3:C4:C5:C6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('C1:C2:**:**:**:C6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0037
     * @tc.name addressCross0037
     * @tc.desc Verify address case normalizes to D1:D2:D3:D4:D5:D6 with 6 segments.
     */
    it('addressCross0037', 0, () => {
      const raw: string = 'D1:D2:D3:D4:D5:D6';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('D1:D2:D3:D4:D5:D6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'D1:D2:D3:D4:D5:D6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0038
     * @tc.name addressCross0038
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0038', 0, () => {
      const raw: string = 'D1:D2:D3:D4:D5:D6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('D1:D2:**:**:**:D6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0039
     * @tc.name addressCross0039
     * @tc.desc Verify address case normalizes to E1:E2:E3:E4:E5:E6 with 6 segments.
     */
    it('addressCross0039', 0, () => {
      const raw: string = 'E1:E2:E3:E4:E5:E6';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('E1:E2:E3:E4:E5:E6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'E1:E2:E3:E4:E5:E6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0040
     * @tc.name addressCross0040
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0040', 0, () => {
      const raw: string = 'E1:E2:E3:E4:E5:E6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('E1:E2:**:**:**:E6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0041
     * @tc.name addressCross0041
     * @tc.desc Verify address case normalizes to F1:F2:F3:F4:F5:F6 with 6 segments.
     */
    it('addressCross0041', 0, () => {
      const raw: string = 'F1:F2:F3:F4:F5:F6';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('F1:F2:F3:F4:F5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'F1:F2:F3:F4:F5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0042
     * @tc.name addressCross0042
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0042', 0, () => {
      const raw: string = 'F1:F2:F3:F4:F5:F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('F1:F2:**:**:**:F6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0043
     * @tc.name addressCross0043
     * @tc.desc Verify address case normalizes to 10:20:30:40:50:60 with 6 segments.
     */
    it('addressCross0043', 0, () => {
      const raw: string = '10:20:30:40:50:60';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('10:20:30:40:50:60');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '10:20:30:40:50:60')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0044
     * @tc.name addressCross0044
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0044', 0, () => {
      const raw: string = '10:20:30:40:50:60';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('10:20:**:**:**:60');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0045
     * @tc.name addressCross0045
     * @tc.desc Verify address case normalizes to 01:02:03:04:05:06 with 6 segments.
     */
    it('addressCross0045', 0, () => {
      const raw: string = '01:02:03:04:05:06';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('01:02:03:04:05:06');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '01:02:03:04:05:06')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0046
     * @tc.name addressCross0046
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0046', 0, () => {
      const raw: string = '01:02:03:04:05:06';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('01:02:**:**:**:06');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0047
     * @tc.name addressCross0047
     * @tc.desc Verify address case normalizes to 1A:2B:3C:4D:5E:6F with 6 segments.
     */
    it('addressCross0047', 0, () => {
      const raw: string = '1A:2B:3C:4D:5E:6F';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('1A:2B:3C:4D:5E:6F');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '1A:2B:3C:4D:5E:6F')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0048
     * @tc.name addressCross0048
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0048', 0, () => {
      const raw: string = '1A:2B:3C:4D:5E:6F';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('1A:2B:**:**:**:6F');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0049
     * @tc.name addressCross0049
     * @tc.desc Verify address case normalizes to an empty string with 0 segments.
     */
    it('addressCross0049', 0, () => {
      const raw: string = '';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('');
      expect(splitAddress(raw).length).assertEqual(0);
      expect(isSameDevice(raw, '')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0050
     * @tc.name addressCross0050
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0050', 0, () => {
      const raw: string = '';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('--');
      expect(masked.length).assertEqual(2);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0051
     * @tc.name addressCross0051
     * @tc.desc Verify address case normalizes to an empty string with 0 segments.
     */
    it('addressCross0051', 0, () => {
      const raw: string = ' ';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('');
      expect(splitAddress(raw).length).assertEqual(0);
      expect(isSameDevice(raw, '')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0052
     * @tc.name addressCross0052
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0052', 0, () => {
      const raw: string = ' ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('--');
      expect(masked.length).assertEqual(2);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0053
     * @tc.name addressCross0053
     * @tc.desc Verify address case normalizes to an empty string with 0 segments.
     */
    it('addressCross0053', 0, () => {
      const raw: string = '   ';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('');
      expect(splitAddress(raw).length).assertEqual(0);
      expect(isSameDevice(raw, '')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0054
     * @tc.name addressCross0054
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0054', 0, () => {
      const raw: string = '   ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('--');
      expect(masked.length).assertEqual(2);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0055
     * @tc.name addressCross0055
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5 with 5 segments.
     */
    it('addressCross0055', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5');
      expect(splitAddress(raw).length).assertEqual(5);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0056
     * @tc.name addressCross0056
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0056', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5');
      expect(masked.length).assertEqual(14);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0057
     * @tc.name addressCross0057
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5:F6:07 with 7 segments.
     */
    it('addressCross0057', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6:07';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6:07');
      expect(splitAddress(raw).length).assertEqual(7);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6:07')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0058
     * @tc.name addressCross0058
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0058', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6:07';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F6:07');
      expect(masked.length).assertEqual(20);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0059
     * @tc.name addressCross0059
     * @tc.desc Verify address case normalizes to A1-B2-C3-D4-E5-F6 with 1 segments.
     */
    it('addressCross0059', 0, () => {
      const raw: string = 'A1-B2-C3-D4-E5-F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1-B2-C3-D4-E5-F6');
      expect(splitAddress(raw).length).assertEqual(1);
      expect(isSameDevice(raw, 'A1-B2-C3-D4-E5-F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0060
     * @tc.name addressCross0060
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0060', 0, () => {
      const raw: string = 'A1-B2-C3-D4-E5-F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1-B2-C3-D4-E5-F6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0061
     * @tc.name addressCross0061
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5:G6 with 6 segments.
     */
    it('addressCross0061', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:G6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:G6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:G6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0062
     * @tc.name addressCross0062
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0062', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:G6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:G6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0063
     * @tc.name addressCross0063
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5:F with 6 segments.
     */
    it('addressCross0063', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0064
     * @tc.name addressCross0064
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0064', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F');
      expect(masked.length).assertEqual(16);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0065
     * @tc.name addressCross0065
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5:F67 with 6 segments.
     */
    it('addressCross0065', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F67';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F67');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F67')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0066
     * @tc.name addressCross0066
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0066', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F67';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F67');
      expect(masked.length).assertEqual(18);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0067
     * @tc.name addressCross0067
     * @tc.desc Verify address case normalizes to A1B2C3D4E5F6 with 1 segments.
     */
    it('addressCross0067', 0, () => {
      const raw: string = 'A1B2C3D4E5F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1B2C3D4E5F6');
      expect(splitAddress(raw).length).assertEqual(1);
      expect(isSameDevice(raw, 'A1B2C3D4E5F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0068
     * @tc.name addressCross0068
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0068', 0, () => {
      const raw: string = 'A1B2C3D4E5F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1B2C3D4E5F6');
      expect(masked.length).assertEqual(12);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0069
     * @tc.name addressCross0069
     * @tc.desc Verify address case normalizes to :: with 3 segments.
     */
    it('addressCross0069', 0, () => {
      const raw: string = '::';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('::');
      expect(splitAddress(raw).length).assertEqual(3);
      expect(isSameDevice(raw, '::')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0070
     * @tc.name addressCross0070
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0070', 0, () => {
      const raw: string = '::';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('::');
      expect(masked.length).assertEqual(2);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0071
     * @tc.name addressCross0071
     * @tc.desc Verify address case normalizes to A1::C3:D4:E5:F6 with 6 segments.
     */
    it('addressCross0071', 0, () => {
      const raw: string = 'A1::C3:D4:E5:F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1::C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1::C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0072
     * @tc.name addressCross0072
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0072', 0, () => {
      const raw: string = 'A1::C3:D4:E5:F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1::C3:D4:E5:F6');
      expect(masked.length).assertEqual(15);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0073
     * @tc.name addressCross0073
     * @tc.desc Verify address case normalizes to ZZ:11:22:33:44:55 with 6 segments.
     */
    it('addressCross0073', 0, () => {
      const raw: string = 'ZZ:11:22:33:44:55';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('ZZ:11:22:33:44:55');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'ZZ:11:22:33:44:55')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0074
     * @tc.name addressCross0074
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0074', 0, () => {
      const raw: string = 'ZZ:11:22:33:44:55';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('ZZ:11:22:33:44:55');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0075
     * @tc.name addressCross0075
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5: with 6 segments.
     */
    it('addressCross0075', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0076
     * @tc.name addressCross0076
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0076', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:');
      expect(masked.length).assertEqual(15);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0077
     * @tc.name addressCross0077
     * @tc.desc Verify address case normalizes to :A1:B2:C3:D4:E5 with 6 segments.
     */
    it('addressCross0077', 0, () => {
      const raw: string = ':A1:B2:C3:D4:E5';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual(':A1:B2:C3:D4:E5');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, ':A1:B2:C3:D4:E5')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0078
     * @tc.name addressCross0078
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0078', 0, () => {
      const raw: string = ':A1:B2:C3:D4:E5';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual(':A1:B2:C3:D4:E5');
      expect(masked.length).assertEqual(15);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0079
     * @tc.name addressCross0079
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5:F6; with 6 segments.
     */
    it('addressCross0079', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6;';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6;');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6;')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0080
     * @tc.name addressCross0080
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0080', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6;';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:C3:D4:E5:F6;');
      expect(masked.length).assertEqual(18);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0081
     * @tc.name addressCross0081
     * @tc.desc Verify address case normalizes to 设备地址 with 1 segments.
     */
    it('addressCross0081', 0, () => {
      const raw: string = '设备地址';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('设备地址');
      expect(splitAddress(raw).length).assertEqual(1);
      expect(isSameDevice(raw, '设备地址')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0082
     * @tc.name addressCross0082
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0082', 0, () => {
      const raw: string = '设备地址';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('设备地址');
      expect(masked.length).assertEqual(4);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0083
     * @tc.name addressCross0083
     * @tc.desc Verify address case normalizes to A1 B2 C3 D4 E5 F6 with 1 segments.
     */
    it('addressCross0083', 0, () => {
      const raw: string = 'A1 B2 C3 D4 E5 F6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('A1 B2 C3 D4 E5 F6');
      expect(splitAddress(raw).length).assertEqual(1);
      expect(isSameDevice(raw, 'A1 B2 C3 D4 E5 F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0084
     * @tc.name addressCross0084
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0084', 0, () => {
      const raw: string = 'A1 B2 C3 D4 E5 F6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1 B2 C3 D4 E5 F6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0085
     * @tc.name addressCross0085
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5:F6 with 6 segments.
     */
    it('addressCross0085', 0, () => {
      const raw: string = 'a1:b2:c3:d4:e5:f6 ';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0086
     * @tc.name addressCross0086
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0086', 0, () => {
      const raw: string = 'a1:b2:c3:d4:e5:f6 ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0087
     * @tc.name addressCross0087
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5:F0 with 6 segments.
     */
    it('addressCross0087', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F0';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F0');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F0')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0088
     * @tc.name addressCross0088
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0088', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F0';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F0');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0089
     * @tc.name addressCross0089
     * @tc.desc Verify address case normalizes to 11:22:33:44:55:6 with 6 segments.
     */
    it('addressCross0089', 0, () => {
      const raw: string = '11:22:33:44:55:6';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('11:22:33:44:55:6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, '11:22:33:44:55:6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0090
     * @tc.name addressCross0090
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0090', 0, () => {
      const raw: string = '11:22:33:44:55:6';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('11:22:33:44:55:6');
      expect(masked.length).assertEqual(16);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0091
     * @tc.name addressCross0091
     * @tc.desc Verify address case normalizes to GG:HH:II:JJ:KK:LL with 6 segments.
     */
    it('addressCross0091', 0, () => {
      const raw: string = 'GG:HH:II:JJ:KK:LL';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('GG:HH:II:JJ:KK:LL');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'GG:HH:II:JJ:KK:LL')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0092
     * @tc.name addressCross0092
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0092', 0, () => {
      const raw: string = 'GG:HH:II:JJ:KK:LL';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('GG:HH:II:JJ:KK:LL');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0093
     * @tc.name addressCross0093
     * @tc.desc Verify address case normalizes to an empty string with 0 segments.
     */
    it('addressCross0093', 0, () => {
      const raw: string = '  ';
      expect(isValidDeviceId(raw)).assertEqual(false);
      expect(normalizeDeviceId(raw)).assertEqual('');
      expect(splitAddress(raw).length).assertEqual(0);
      expect(isSameDevice(raw, '')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0094
     * @tc.name addressCross0094
     * @tc.desc Verify masking the same address keeps the raw text intact.
     */
    it('addressCross0094', 0, () => {
      const raw: string = '  ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('--');
      expect(masked.length).assertEqual(2);
      expect(masked.indexOf('**') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0095
     * @tc.name addressCross0095
     * @tc.desc Verify address case normalizes to A1:B2:C3:D4:E5:F6 with 6 segments.
     */
    it('addressCross0095', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6 ';
      expect(isValidDeviceId(raw)).assertEqual(true);
      expect(normalizeDeviceId(raw)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(splitAddress(raw).length).assertEqual(6);
      expect(isSameDevice(raw, 'A1:B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ADDR_CROSS_0096
     * @tc.name addressCross0096
     * @tc.desc Verify masking the same address keeps the head and the tail intact.
     */
    it('addressCross0096', 0, () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6 ';
      const masked: string = maskDeviceId(raw);
      expect(masked).assertEqual('A1:B2:**:**:**:F6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf('**') >= 0).assertEqual(true);
    });
  });
}
