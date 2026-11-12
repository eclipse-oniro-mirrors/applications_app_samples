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

  describe('AnimationControllerValidation', () => {
    beforeAll(() => {
      TestLog.info('AnimationControllerValidation beforeAll');
    });
    afterAll(() => {
      TestLog.info('AnimationControllerValidation afterAll');
    });
    it('VA0_tableConfig_0', 0, () => {
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
    it('VA0_genericValues_1', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_1', 'v1');
      values.put('value_1', 'dev1');
      expect(
        values.get('pid_1')
      ).assertEqual(
        'v1'
      );
      expect(
        values.get('value_1')
      ).assertEqual(
        'dev1'
      );
      expect(
        values.get('missing1')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA0_countryCode_2', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[0].pattern;
      expect(
        pattern.test('18812345678')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[0].code
      ).assertEqual(
        '+86'
      );
    });
    it('VA0_arrayBuffer_3', 0, () => {
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
    it('VA0_hexInvalid_4', 0, () => {
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
    it('VA0_stringUtil_5', 0, () => {
      expect(
        StringUtil.replaceAll('2026-01-01', '-', '/')
      ).assertEqual(
        '2026/01/01'
      );
      expect(
        StringUtil.isEmpty('')
      ).assertEqual(
        true
      );
    });
    it('VA0_enums_6', 0, () => {
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
    it('VA0_constants_7', 0, () => {
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
    it('VA0_genericValues_9', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_9', 'v9');
      values.put('value_9', 'dev9');
      expect(
        values.get('pid_9')
      ).assertEqual(
        'v9'
      );
      expect(
        values.get('value_9')
      ).assertEqual(
        'dev9'
      );
      expect(
        values.get('missing9')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA0_countryCode_10', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[0].pattern;
      expect(
        pattern.test('12345')
      ).assertEqual(
        false
      );
      expect(
        CountryCodeConfig.countryCodeConfig[0].code
      ).assertEqual(
        '+86'
      );
    });
    it('VA0_arrayBuffer_11', 0, () => {
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
    it('VA0_stringUtil_13', 0, () => {
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
    it('VA0_genericValues_17', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_17', 'v17');
      values.put('value_17', 'dev17');
      expect(
        values.get('pid_17')
      ).assertEqual(
        'v17'
      );
      expect(
        values.get('value_17')
      ).assertEqual(
        'dev17'
      );
      expect(
        values.get('missing17')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA0_countryCode_18', 0, () => {
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
    it('VA0_arrayBuffer_19', 0, () => {
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
    it('VA0_stringUtil_21', 0, () => {
      expect(
        StringUtil.replaceAll('a-b-c', '-', '_')
      ).assertEqual(
        'a_b_c'
      );
      expect(
        StringUtil.isEmpty('')
      ).assertEqual(
        true
      );
    });
    it('VA0_genericValues_25', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_25', 'v25');
      values.put('value_25', 'dev25');
      expect(
        values.get('pid_25')
      ).assertEqual(
        'v25'
      );
      expect(
        values.get('value_25')
      ).assertEqual(
        'dev25'
      );
      expect(
        values.get('missing25')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA0_countryCode_26', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[2].pattern;
      expect(
        pattern.test('+85291234567')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[2].code
      ).assertEqual(
        '+852'
      );
    });
    it('VA0_arrayBuffer_27', 0, () => {
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
    it('VA0_stringUtil_29', 0, () => {
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
    it('VA0_genericValues_33', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_33', 'v33');
      values.put('value_33', 'dev33');
      expect(
        values.get('pid_33')
      ).assertEqual(
        'v33'
      );
      expect(
        values.get('value_33')
      ).assertEqual(
        'dev33'
      );
      expect(
        values.get('missing33')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA0_countryCode_34', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[0].pattern;
      expect(
        pattern.test('14512345678')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[0].code
      ).assertEqual(
        '+86'
      );
    });
    it('VA0_arrayBuffer_35', 0, () => {
      expect(
        ArrayBufferUtil.isValidHexString('0x7f')
      ).assertTrue();
      expect(
        ArrayBufferUtil.getIntFromHex('0x7f')
      ).assertEqual(
        127
      );
      const bytes: number[] = ArrayBufferUtil.getHexArr('0x7f');
      expect(
        bytes.length
      ).assertEqual(
        1
      );
      const buffer: ArrayBuffer = ArrayBufferUtil.getArrayBufferFromHexStr('0x7f');
      expect(
        ArrayBufferUtil.getHexStringFromArrayBuffer(buffer)
      ).assertEqual(
        '0x7f'
      );
    });
    it('VA0_stringUtil_37', 0, () => {
      expect(
        StringUtil.replaceAll('a.b.c.d', '.', '/')
      ).assertEqual(
        'a/b/c/d'
      );
      expect(
        StringUtil.isEmpty('')
      ).assertEqual(
        true
      );
    });
    it('VA0_genericValues_41', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_41', 'v41');
      values.put('value_41', 'dev41');
      expect(
        values.get('pid_41')
      ).assertEqual(
        'v41'
      );
      expect(
        values.get('value_41')
      ).assertEqual(
        'dev41'
      );
      expect(
        values.get('missing41')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA0_countryCode_42', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[1].pattern;
      expect(
        pattern.test('+886912345678')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[1].code
      ).assertEqual(
        '+886'
      );
    });
    it('VA0_stringUtil_45', 0, () => {
      expect(
        StringUtil.replaceAll('no-change', 'x', 'y')
      ).assertEqual(
        'no-change'
      );
      expect(
        StringUtil.isEmpty('')
      ).assertEqual(
        true
      );
    });
  });
}
