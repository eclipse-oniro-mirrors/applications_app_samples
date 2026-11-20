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
export default function suite3() {

  describe('DeviceResourceConsumption', () => {
    beforeAll(() => {
      TestLog.info('DeviceResourceConsumption beforeAll');
    });
    afterAll(() => {
      TestLog.info('DeviceResourceConsumption afterAll');
    });
    it('PE3_virtualBroadcast_0', 0, () => {
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
    it('PE3_genericValues_1', 0, () => {
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
    it('PE3_asyncQuery_2', 0, async () => {
      const request: string = buildQueryStateRequest(3, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        3
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
    it('PE3_buildQuery_3', 0, () => {
      const sids: string[] = ['cust.waterDetector', 'allservices', 'netCfg', 'authSetup'];
      const request: string = buildQueryStateRequest(4, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        4
      );
      expect(
        parsed.data.length
      ).assertEqual(
        4
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'cust.waterDetector'
      );
    });
    it('PE3_arrayBuffer_4', 0, () => {
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
    it('PE3_stringUtil_5', 0, () => {
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
    it('PE3_genericValues_7', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_7', 'v7');
      values.put('value_7', 'dev7');
      expect(
        values.get('pid_7')
      ).assertEqual(
        'v7'
      );
      expect(
        values.get('value_7')
      ).assertEqual(
        'dev7'
      );
      expect(
        values.get('missing7')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('PE3_asyncQuery_8', 0, async () => {
      const request: string = buildQueryStateRequest(9, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        9
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
    it('PE3_buildQuery_9', 0, () => {
      const sids: string[] = ['getIp', 'switch'];
      const request: string = buildQueryStateRequest(10, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        10
      );
      expect(
        parsed.data.length
      ).assertEqual(
        2
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'getIp'
      );
    });
    it('PE3_arrayBuffer_10', 0, () => {
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
    it('PE3_stringUtil_11', 0, () => {
      expect(
        StringUtil.replaceAll('aaaa', 'a', 'b')
      ).assertEqual(
        'bbbb'
      );
      expect(
        StringUtil.isEmpty('  a ')
      ).assertEqual(
        false
      );
    });
    it('PE3_genericValues_13', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_13', 'v13');
      values.put('value_13', 'dev13');
      expect(
        values.get('pid_13')
      ).assertEqual(
        'v13'
      );
      expect(
        values.get('value_13')
      ).assertEqual(
        'dev13'
      );
      expect(
        values.get('missing13')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('PE3_asyncQuery_14', 0, async () => {
      const request: string = buildQueryStateRequest(15, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        15
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
    it('PE3_buildQuery_15', 0, () => {
      const sids: string[] = ['netCfg', 'authSetup', 'deviceInfo', 'snw'];
      const request: string = buildQueryStateRequest(16, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        16
      );
      expect(
        parsed.data.length
      ).assertEqual(
        4
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'netCfg'
      );
    });
    it('PE3_arrayBuffer_16', 0, () => {
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
    it('PE3_stringUtil_17', 0, () => {
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
    it('PE3_genericValues_19', 0, () => {
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
    it('PE3_asyncQuery_20', 0, async () => {
      const request: string = buildQueryStateRequest(21, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        21
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
  });
}
