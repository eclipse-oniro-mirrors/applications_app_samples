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
export default function suite7() {

  describe('KeyCodeValidation', () => {
    beforeAll(() => {
      TestLog.info('KeyCodeValidation beforeAll');
    });
    afterAll(() => {
      TestLog.info('KeyCodeValidation afterAll');
    });
    it('VA7_constants_0', 0, () => {
      expect(
        InfConstants.SID_ALL_SERVICES
      ).assertEqual(
        'allservices'
      );
      expect(
        InfConstants.ON_CONNECT_STATE_CHANGED
      ).assertEqual(
        'onConnectStateChanged'
      );
      expect(
        EventConstants.ON_FOREGROUND_EVENT
      ).assertEqual(
        999001
      );
      expect(
        ClickCheck.timeCheck
      ).assertEqual(
        600
      );
      expect(
        BleConstants.BROADCAST_DATA_SIZE
      ).assertEqual(
        37
      );
      expect(
        BleConstants.BLE_MTU_SIZE
      ).assertEqual(
        251
      );
    });
    it('VA7_tableConfig_1', 0, () => {
      expect(
        CONNECT_DATABASE_NAME
      ).assertEqual(
        'connect.db'
      );
      expect(
        TableType.SCENE_LIBRARY
      ).assertEqual(
        'scene_table'
      );
      expect(
        SceneLibraryField.SCENE_ID
      ).assertEqual(
        'scenario_card_id'
      );
      expect(
        DeviceLibraryField.VALUE
      ).assertEqual(
        'value'
      );
    });
    it('VA7_genericValues_2', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_2', 'v2');
      values.put('value_2', 'dev2');
      expect(
        values.get('pid_2')
      ).assertEqual(
        'v2'
      );
      expect(
        values.get('value_2')
      ).assertEqual(
        'dev2'
      );
      expect(
        values.get('missing2')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA7_countryCode_3', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[0].pattern;
      expect(
        pattern.test('+8613800138000')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[0].code
      ).assertEqual(
        '+86'
      );
    });
    it('VA7_arrayBuffer_4', 0, () => {
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
    it('VA7_hexInvalid_5', 0, () => {
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
    it('VA7_stringUtil_6', 0, () => {
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
    it('VA7_enums_7', 0, () => {
      expect(
        SubProtocolType.cloud
      ).assertEqual(
        5
      );
      expect(
        ScanProtocol.ALL
      ).assertEqual(
        255
      );
      expect(
        ServerType.speke
      ).assertEqual(
        7
      );
      expect(
        EncryType.AUTH_CODE
      ).assertEqual(
        4
      );
    });
    it('VA7_genericValues_10', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_10', 'v10');
      values.put('value_10', 'dev10');
      expect(
        values.get('pid_10')
      ).assertEqual(
        'v10'
      );
      expect(
        values.get('value_10')
      ).assertEqual(
        'dev10'
      );
      expect(
        values.get('missing10')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA7_countryCode_11', 0, () => {
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
    it('VA7_arrayBuffer_12', 0, () => {
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
    it('VA7_stringUtil_14', 0, () => {
      expect(
        StringUtil.replaceAll('a-b-c', '-', '_')
      ).assertEqual(
        'a_b_c'
      );
      expect(
        StringUtil.isEmpty('abc')
      ).assertEqual(
        false
      );
    });
    it('VA7_genericValues_18', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_18', 'v18');
      values.put('value_18', 'dev18');
      expect(
        values.get('pid_18')
      ).assertEqual(
        'v18'
      );
      expect(
        values.get('value_18')
      ).assertEqual(
        'dev18'
      );
      expect(
        values.get('missing18')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA7_countryCode_19', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[1].pattern;
      expect(
        pattern.test('0812345678')
      ).assertEqual(
        false
      );
      expect(
        CountryCodeConfig.countryCodeConfig[1].code
      ).assertEqual(
        '+886'
      );
    });
    it('VA7_arrayBuffer_20', 0, () => {
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
    it('VA7_stringUtil_22', 0, () => {
      expect(
        StringUtil.replaceAll('hello world', ' ', '-')
      ).assertEqual(
        'hello-world'
      );
      expect(
        StringUtil.isEmpty('abc')
      ).assertEqual(
        false
      );
    });
    it('VA7_genericValues_26', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_26', 'v26');
      values.put('value_26', 'dev26');
      expect(
        values.get('pid_26')
      ).assertEqual(
        'v26'
      );
      expect(
        values.get('value_26')
      ).assertEqual(
        'dev26'
      );
      expect(
        values.get('missing26')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA7_countryCode_27', 0, () => {
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
    it('VA7_arrayBuffer_28', 0, () => {
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
    it('VA7_stringUtil_30', 0, () => {
      expect(
        StringUtil.replaceAll('a.b.c.d', '.', '/')
      ).assertEqual(
        'a/b/c/d'
      );
      expect(
        StringUtil.isEmpty('abc')
      ).assertEqual(
        false
      );
    });
    it('VA7_genericValues_34', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_34', 'v34');
      values.put('value_34', 'dev34');
      expect(
        values.get('pid_34')
      ).assertEqual(
        'v34'
      );
      expect(
        values.get('value_34')
      ).assertEqual(
        'dev34'
      );
      expect(
        values.get('missing34')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA7_countryCode_35', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[0].pattern;
      expect(
        pattern.test('16612345678')
      ).assertEqual(
        false
      );
      expect(
        CountryCodeConfig.countryCodeConfig[0].code
      ).assertEqual(
        '+86'
      );
    });
    it('VA7_arrayBuffer_36', 0, () => {
      expect(
        ArrayBufferUtil.isValidHexString('0xdeadbeef')
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex('0xdeadbeef')
      ).assertEqual(
        3735928559
      );
      const bytes: number[] = ArrayBufferUtil.getHexArr('0xdeadbeef');
      expect(
        bytes.length
      ).assertEqual(
        4
      );
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr('0xdeadbeef');
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0xdeadbeef'
      );
    });
    it('VA7_stringUtil_38', 0, () => {
      expect(
        StringUtil.replaceAll('no-change', 'x', 'y')
      ).assertEqual(
        'no-change'
      );
      expect(
        StringUtil.isEmpty('abc')
      ).assertEqual(
        false
      );
    });
    it('VA7_genericValues_42', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_42', 'v42');
      values.put('value_42', 'dev42');
      expect(
        values.get('pid_42')
      ).assertEqual(
        'v42'
      );
      expect(
        values.get('value_42')
      ).assertEqual(
        'dev42'
      );
      expect(
        values.get('missing42')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA7_countryCode_43', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[1].pattern;
      expect(
        pattern.test('886912345678')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[1].code
      ).assertEqual(
        '+886'
      );
    });
    it('VA7_stringUtil_46', 0, () => {
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
    it('VA7_genericValues_50', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_50', 'v50');
      values.put('value_50', 'dev50');
      expect(
        values.get('pid_50')
      ).assertEqual(
        'v50'
      );
      expect(
        values.get('value_50')
      ).assertEqual(
        'dev50'
      );
      expect(
        values.get('missing50')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
  });
}
