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
import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { TestLog } from '../Shared/DeviceTestKit';
import { analysisPayload, buildQueryStateRequest } from '@ohos/common/src/main/ets/inf/ControlCmd';
import { InfDeviceState } from '@ohos/common/src/main/ets/inf/InfDevicesBusiness';
import { ProtocolType, SubProtocolType, ScanProtocol, ServerType, EncryType, ConnectType, getProtocolCode } from '@ohos/common/src/main/ets/inf/TypeEnum';
import { CONNECT_DATABASE_NAME, TableType, DeviceLibraryField, SceneLibraryField } from '@ohos/common/src/main/ets/database/TableConfig';
import { GenericValues } from '@ohos/common/src/main/ets/database/GenericValues';
import { ClickCheck } from '@ohos/common/src/main/ets/utils/ClickCheck';
import { CountryCodeConfig } from '@ohos/common/src/main/ets/constants/CountryCodeItem';
import { InfConstants } from '@ohos/common/src/main/ets/inf/InfConstants';
import { EventConstants } from '@ohos/common/src/main/ets/constants/EventConstants';
import { Device, LibraryDevice, Manufacturer } from '@ohos/common/src/main/ets/database/entity/Device';
import { Project, CloudDeviceModel } from '@ohos/connect_cloud';
import BleConstants from '@ohos/connect_ble/src/main/ets/components/connect/ble/constants/BleConstants';
import WifiConstants from '@ohos/connect_wifi/src/main/ets/components/connect/wifi/constants/WifiConstants';
import ArrayBufferUtil from '@ohos/nearbydevice/src/main/ets/util/ArrayBufferUtil';
import StringUtil from '@ohos/nearbydevice/src/main/ets/util/StringUtil';
import { VirtualBleBroadcast } from '@ohos/nearbydevice/src/main/ets/model/virtual/VirtualBleBroadcast';
interface QuerySid {
  sid: string;
}
interface QueryRequest {
  seq: number;
  data: QuerySid[];
}
function log(message: string): void {
  TestLog.info(message);
}
function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}
export default function suite0() {

  describe('DeviceSecurity', () => {
    beforeAll(() => {
      TestLog.info('DeviceSecurity beforeAll');
    });
    afterAll(() => {
      TestLog.info('DeviceSecurity afterAll');
    });
    it('SE0_countryCode_0', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[0].pattern;
      expect(
        pattern.test('13800138000')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[0].code
      ).assertEqual(
        '+86'
      );
    });
    it('SE0_stringUtil_1', 0, () => {
      expect(
        StringUtil.replaceAll('hello world', ' ', '-')
      ).assertEqual(
        'hello-world'
      );
      expect(
        StringUtil.isEmpty('')
      ).assertEqual(
        true
      );
    });
    it('SE0_arrayBuffer_2', 0, () => {
      expect(
        ArrayBufferUtil.isValidHexString('0xff')
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex('0xff')
      ).assertEqual(
        255
      );
      const bytes: number[] = ArrayBufferUtil.getHexArr('0xff');
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr('0xff');
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xff'
      );
    });
    it('SE0_hexInvalid_3', 0, () => {
      expect(
        ArrayBufferUtil.isValidHexString('zz')
      ).assertFalse();
      expect(
        ArrayBufferUtil.getIntFromHex('zz')
      ).assertEqual(
        -1
      );
      expect(
        ArrayBufferUtil.getHexStrArr('zz').length
      ).assertEqual(
        0
      );
      expect(
        ArrayBufferUtil.formatHex('0xABC')
      ).assertEqual(
        '0abc'
      );
    });
    it('SE0_bleScanRegex_4', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-VENDOR-Smart TV-+YYYYYRRRR')
      ).assertEqual(
        false
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('SE0_protocol_5', 0, () => {
      expect(
        getProtocolCode(ProtocolType.WIFI)
      ).assertEqual(
        'wifi'
      );
      expect(
        getProtocolCode(ProtocolType.BLE)
      ).assertEqual(
        'ble'
      );
      expect(
        ProtocolType.ETHERNET
      ).assertEqual(
        8
      );
      expect(
        ConnectType.ONLINE
      ).assertEqual(
        2
      );
      expect(
        ConnectType.OFFLINE
      ).assertEqual(
        3
      );
    });
    it('SE0_countryCode_6', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[0].pattern;
      expect(
        pattern.test('13000000000')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[0].code
      ).assertEqual(
        '+86'
      );
    });
    it('SE0_stringUtil_7', 0, () => {
      expect(
        StringUtil.replaceAll('a-b-c', '-', '_')
      ).assertEqual(
        'a_b_c'
      );
      expect(
        StringUtil.isEmpty('  a ')
      ).assertEqual(
        false
      );
    });
    it('SE0_arrayBuffer_8', 0, () => {
      expect(
        ArrayBufferUtil.isValidHexString('0xABC')
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex('0xABC')
      ).assertEqual(
        2748
      );
      const bytes: number[] = ArrayBufferUtil.getHexArr('0xABC');
      expect(
        bytes.length
      ).assertEqual(
        2
      );
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr('0xABC');
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x0abc'
      );
    });
    it('SE0_bleScanRegex_10', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-ABCDE-1ABCDE1234')
      ).assertEqual(
        true
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('SE0_countryCode_12', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[0].pattern;
      expect(
        pattern.test('23800138000')
      ).assertEqual(
        false
      );
      expect(
        CountryCodeConfig.countryCodeConfig[0].code
      ).assertEqual(
        '+86'
      );
    });
    it('SE0_stringUtil_13', 0, () => {
      expect(
        StringUtil.replaceAll('sid:switch;sid:restart', ';', ',')
      ).assertEqual(
        'sid:switch,sid:restart'
      );
      expect(
        StringUtil.isEmpty('')
      ).assertEqual(
        true
      );
    });
    it('SE0_arrayBuffer_14', 0, () => {
      expect(
        ArrayBufferUtil.isValidHexString('0x00')
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex('0x00')
      ).assertEqual(
        0
      );
      const bytes: number[] = ArrayBufferUtil.getHexArr('0x00');
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr('0x00');
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x00'
      );
    });
    it('SE0_bleScanRegex_16', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Xh-ABCDE-1ABCDE1234')
      ).assertEqual(
        false
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('SE0_countryCode_18', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[1].pattern;
      expect(
        pattern.test('091234567')
      ).assertEqual(
        false
      );
      expect(
        CountryCodeConfig.countryCodeConfig[1].code
      ).assertEqual(
        '+886'
      );
    });
    it('SE0_stringUtil_19', 0, () => {
      expect(
        StringUtil.replaceAll('2026-01-01', '-', '/')
      ).assertEqual(
        '2026/01/01'
      );
      expect(
        StringUtil.isEmpty('  a ')
      ).assertEqual(
        false
      );
    });
    it('SE0_arrayBuffer_20', 0, () => {
      expect(
        ArrayBufferUtil.isValidHexString('0x0010')
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex('0x0010')
      ).assertEqual(
        16
      );
      const bytes: number[] = ArrayBufferUtil.getHexArr('0x0010');
      expect(
        bytes.length
      ).assertEqual(
        2
      );
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr('0x0010');
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x0010'
      );
    });
    it('SE0_bleScanRegex_22', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-S-WS-3YYYYYRRRR')
      ).assertEqual(
        false
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('SE0_countryCode_24', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[2].pattern;
      expect(
        pattern.test('91234567')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[2].code
      ).assertEqual(
        '+852'
      );
    });
  });
}
