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
export default function suite6() {

  describe('InputValidation', () => {
    beforeAll(() => {
      TestLog.info('InputValidation beforeAll');
    });
    afterAll(() => {
      TestLog.info('InputValidation afterAll');
    });
    it('VA6_enums_0', 0, () => {
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
    it('VA6_constants_1', 0, () => {
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
    it('VA6_tableConfig_2', 0, () => {
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
    it('VA6_genericValues_3', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_3', 'v3');
      values.put('value_3', 'dev3');
      expect(
        values.get('pid_3')
      ).assertEqual(
        'v3'
      );
      expect(
        values.get('value_3')
      ).assertEqual(
        'dev3'
      );
      expect(
        values.get('missing3')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA6_countryCode_4', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[0].pattern;
      expect(
        pattern.test('8613800138000')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[0].code
      ).assertEqual(
        '+86'
      );
    });
    it('VA6_arrayBuffer_5', 0, () => {
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
    it('VA6_hexInvalid_6', 0, () => {
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
    it('VA6_stringUtil_7', 0, () => {
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
    it('VA6_genericValues_11', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_11', 'v11');
      values.put('value_11', 'dev11');
      expect(
        values.get('pid_11')
      ).assertEqual(
        'v11'
      );
      expect(
        values.get('value_11')
      ).assertEqual(
        'dev11'
      );
      expect(
        values.get('missing11')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA6_countryCode_12', 0, () => {
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
    it('VA6_arrayBuffer_13', 0, () => {
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
    it('VA6_stringUtil_15', 0, () => {
      expect(
        StringUtil.replaceAll('hello world', ' ', '-')
      ).assertEqual(
        'hello-world'
      );
      expect(
        StringUtil.isEmpty('  a ')
      ).assertEqual(
        false
      );
    });
    it('VA6_genericValues_19', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_19', 'v19');
      values.put('value_19', 'dev19');
      expect(
        values.get('pid_19')
      ).assertEqual(
        'v19'
      );
      expect(
        values.get('value_19')
      ).assertEqual(
        'dev19'
      );
      expect(
        values.get('missing19')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('VA6_countryCode_20', 0, () => {
      const pattern: RegExp = CountryCodeConfig.countryCodeConfig[2].pattern;
      expect(
        pattern.test('51234567')
      ).assertEqual(
        true
      );
      expect(
        CountryCodeConfig.countryCodeConfig[2].code
      ).assertEqual(
        '+852'
      );
    });
    it('VA6_arrayBuffer_21', 0, () => {
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
    it('VA6_stringUtil_23', 0, () => {
      expect(
        StringUtil.replaceAll('a.b.c.d', '.', '/')
      ).assertEqual(
        'a/b/c/d'
      );
      expect(
        StringUtil.isEmpty('  a ')
      ).assertEqual(
        false
      );
    });
  });
}
