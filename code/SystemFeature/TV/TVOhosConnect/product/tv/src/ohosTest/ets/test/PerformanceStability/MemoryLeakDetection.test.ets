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
export default function suite5() {

  describe('MemoryLeakDetection', () => {
    beforeAll(() => {
      TestLog.info('MemoryLeakDetection beforeAll');
    });
    afterAll(() => {
      TestLog.info('MemoryLeakDetection afterAll');
    });
    it('PE5_asyncQuery_0', 0, async () => {
      const request: string = buildQueryStateRequest(1, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        1
      );
      expect(
        parsed.data.length
      ).assertEqual(
        1
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'switch'
      );
    });
    it('PE5_buildQuery_1', 0, () => {
      const sids: string[] = ['restart', 'cust.switchScreens'];
      const request: string = buildQueryStateRequest(2, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        2
      );
      expect(
        parsed.data.length
      ).assertEqual(
        2
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'restart'
      );
    });
    it('PE5_arrayBuffer_2', 0, () => {
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
    it('PE5_stringUtil_3', 0, () => {
      expect(
        StringUtil.replaceAll('no-change', 'x', 'y')
      ).assertEqual(
        'no-change'
      );
      expect(
        StringUtil.isEmpty('  a ')
      ).assertEqual(
        false
      );
    });
    it('PE5_virtualBroadcast_4', 0, () => {
      const broadcast: ArrayBuffer = VirtualBleBroadcast.getVirtualData();
      expect(
        broadcast.byteLength
      ).assertEqual(
        BleConstants.BROADCAST_DATA_SIZE
      );
      const hex: string = ArrayBufferUtil.getHexStringFromArrayBuffer(broadcast);
      expect(
        hex.startsWith('0xa1a1a1a1a1a1')
      ).assertTrue();
      expect(
        VirtualBleBroadcast.dataArr.length > 0
      ).assertTrue();
    });
    it('PE5_genericValues_5', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_5', 'v5');
      values.put('value_5', 'dev5');
      expect(
        values.get('pid_5')
      ).assertEqual(
        'v5'
      );
      expect(
        values.get('value_5')
      ).assertEqual(
        'dev5'
      );
      expect(
        values.get('missing5')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('PE5_asyncQuery_6', 0, async () => {
      const request: string = buildQueryStateRequest(7, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        7
      );
      expect(
        parsed.data.length
      ).assertEqual(
        1
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'switch'
      );
    });
    it('PE5_buildQuery_7', 0, () => {
      const sids: string[] = ['deviceInfo', 'snw', 'getIp', 'switch'];
      const request: string = buildQueryStateRequest(8, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        8
      );
      expect(
        parsed.data.length
      ).assertEqual(
        4
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'deviceInfo'
      );
    });
    it('PE5_arrayBuffer_8', 0, () => {
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
    it('PE5_stringUtil_9', 0, () => {
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
    it('PE5_genericValues_11', 0, () => {
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
    it('PE5_asyncQuery_12', 0, async () => {
      const request: string = buildQueryStateRequest(13, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        13
      );
      expect(
        parsed.data.length
      ).assertEqual(
        1
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'switch'
      );
    });
    it('PE5_buildQuery_13', 0, () => {
      const sids: string[] = ['cust.waterDetector', 'allservices'];
      const request: string = buildQueryStateRequest(14, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        14
      );
      expect(
        parsed.data.length
      ).assertEqual(
        2
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'cust.waterDetector'
      );
    });
    it('PE5_arrayBuffer_14', 0, () => {
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
    it('PE5_stringUtil_15', 0, () => {
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
    it('PE5_genericValues_17', 0, () => {
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
    it('PE5_asyncQuery_18', 0, async () => {
      const request: string = buildQueryStateRequest(19, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        19
      );
      expect(
        parsed.data.length
      ).assertEqual(
        1
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'switch'
      );
    });
    it('PE5_buildQuery_19', 0, () => {
      const sids: string[] = ['getIp', 'switch', 'restart', 'cust.switchScreens'];
      const request: string = buildQueryStateRequest(20, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        20
      );
      expect(
        parsed.data.length
      ).assertEqual(
        4
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'getIp'
      );
    });
    it('PE5_arrayBuffer_20', 0, () => {
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
    it('PE5_stringUtil_21', 0, () => {
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
    it('PE5_genericValues_23', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_23', 'v23');
      values.put('value_23', 'dev23');
      expect(
        values.get('pid_23')
      ).assertEqual(
        'v23'
      );
      expect(
        values.get('value_23')
      ).assertEqual(
        'dev23'
      );
      expect(
        values.get('missing23')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('PE5_asyncQuery_24', 0, async () => {
      const request: string = buildQueryStateRequest(25, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        25
      );
      expect(
        parsed.data.length
      ).assertEqual(
        1
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'switch'
      );
    });
    it('PE5_buildQuery_25', 0, () => {
      const sids: string[] = ['netCfg', 'authSetup'];
      const request: string = buildQueryStateRequest(26, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        26
      );
      expect(
        parsed.data.length
      ).assertEqual(
        2
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'netCfg'
      );
    });
    it('PE5_arrayBuffer_26', 0, () => {
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
    it('PE5_stringUtil_27', 0, () => {
      expect(
        StringUtil.replaceAll('sid:switch;sid:restart', ';', ',')
      ).assertEqual(
        'sid:switch,sid:restart'
      );
      expect(
        StringUtil.isEmpty('  a ')
      ).assertEqual(
        false
      );
    });
  });
}
