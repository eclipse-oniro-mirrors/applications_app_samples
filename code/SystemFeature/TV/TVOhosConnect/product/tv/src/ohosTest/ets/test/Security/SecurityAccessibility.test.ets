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
export default function suite1() {

  describe('SecurityAccessibility', () => {
    beforeAll(() => {
      TestLog.info('SecurityAccessibility beforeAll');
    });
    afterAll(() => {
      TestLog.info('SecurityAccessibility afterAll');
    });
    it('SE1_stringUtil_0', 0, () => {
      expect(
        StringUtil.replaceAll('a-b-c', '-', '_')
      ).assertEqual(
        'a_b_c'
      );
      expect(
        StringUtil.isEmpty('   ')
      ).assertEqual(
        true
      );
    });
    it('SE1_arrayBuffer_1', 0, () => {
      expect(
        ArrayBufferUtil.isValidHexString('0x1A2B')
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex('0x1A2B')
      ).assertEqual(
        6699
      );
      const bytes: number[] = ArrayBufferUtil.getHexArr('0x1A2B');
      expect(
        bytes.length
      ).assertEqual(
        2
      );
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr('0x1A2B');
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x1a2b'
      );
    });
    it('SE1_hexInvalid_2', 0, () => {
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
    it('SE1_bleScanRegex_3', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-VENDOR-Smart TV1234-4YYYYYRRRR')
      ).assertEqual(
        false
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('SE1_protocol_4', 0, () => {
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
    it('SE1_countryCode_5', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[0].pattern;
      expect(
        pattern.test('013800138000')
      ).assertEqual(
        false
      );
      expect(
        CountryCodeConfig.countryCodeConfig[0].code
      ).assertEqual(
        '+86'
      );
    });
    it('SE1_stringUtil_6', 0, () => {
      expect(
        StringUtil.replaceAll('sid:switch;sid:restart', ';', ',')
      ).assertEqual(
        'sid:switch,sid:restart'
      );
      expect(
        StringUtil.isEmpty('abc')
      ).assertEqual(
        false
      );
    });
    it('SE1_arrayBuffer_7', 0, () => {
      expect(
        ArrayBufferUtil.isValidHexString('0x0')
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex('0x0')
      ).assertEqual(
        0
      );
      const bytes: number[] = ArrayBufferUtil.getHexArr('0x0');
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr('0x0');
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x00'
      );
    });
    it('SE1_bleScanRegex_9', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-ABCDE-1ABCDE12345')
      ).assertEqual(
        true
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('SE1_countryCode_11', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[0].pattern;
      expect(
        pattern.test('1380013800')
      ).assertEqual(
        false
      );
      expect(
        CountryCodeConfig.countryCodeConfig[0].code
      ).assertEqual(
        '+86'
      );
    });
    it('SE1_stringUtil_12', 0, () => {
      expect(
        StringUtil.replaceAll('2026-01-01', '-', '/')
      ).assertEqual(
        '2026/01/01'
      );
      expect(
        StringUtil.isEmpty('   ')
      ).assertEqual(
        true
      );
    });
    it('SE1_arrayBuffer_13', 0, () => {
      expect(
        ArrayBufferUtil.isValidHexString('0xabcdef')
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex('0xabcdef')
      ).assertEqual(
        11259375
      );
      const bytes: number[] = ArrayBufferUtil.getHexArr('0xabcdef');
      expect(
        bytes.length
      ).assertEqual(
        3
      );
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr('0xabcdef');
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xabcdef'
      );
    });
    it('SE1_bleScanRegex_15', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-VENDOR-Smart TV-6YYY YRRRR')
      ).assertEqual(
        false
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('SE1_countryCode_17', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[1].pattern;
      expect(
        pattern.test('912345678')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[1].code
      ).assertEqual(
        '+886'
      );
    });
    it('SE1_stringUtil_18', 0, () => {
      expect(
        StringUtil.replaceAll('aaaa', 'a', 'b')
      ).assertEqual(
        'bbbb'
      );
      expect(
        StringUtil.isEmpty('abc')
      ).assertEqual(
        false
      );
    });
    it('SE1_arrayBuffer_19', 0, () => {
      expect(
        ArrayBufferUtil.isValidHexString('0x123456')
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex('0x123456')
      ).assertEqual(
        1193046
      );
      const bytes: number[] = ArrayBufferUtil.getHexArr('0x123456');
      expect(
        bytes.length
      ).assertEqual(
        3
      );
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr('0x123456');
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x123456'
      );
    });
    it('SE1_bleScanRegex_21', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-VENDOR-Smart TV-1YYYYYRRRR')
      ).assertEqual(
        true
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('SE1_countryCode_23', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[2].pattern;
      expect(
        pattern.test('61234567')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[2].code
      ).assertEqual(
        '+852'
      );
    });
    it('SE1_stringUtil_24', 0, () => {
      expect(
        StringUtil.replaceAll('no-change', 'x', 'y')
      ).assertEqual(
        'no-change'
      );
      expect(
        StringUtil.isEmpty('   ')
      ).assertEqual(
        true
      );
    });
  });
}
