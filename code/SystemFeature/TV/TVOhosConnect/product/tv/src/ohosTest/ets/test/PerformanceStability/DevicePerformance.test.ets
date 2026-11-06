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
export default function suite2() {

  describe('DevicePerformance', () => {
    beforeAll(() => {
      TestLog.info('DevicePerformance beforeAll');
    });
    afterAll(() => {
      TestLog.info('DevicePerformance afterAll');
    });
    it('PE2_stringUtil_0', 0, () => {
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
    it('PE2_virtualBroadcast_1', 0, () => {
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
    it('PE2_genericValues_2', 0, () => {
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
    it('PE2_asyncQuery_3', 0, async () => {
      const request: string = buildQueryStateRequest(4, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        4
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
    it('PE2_buildQuery_4', 0, () => {
      const sids: string[] = ['allservices'];
      const request: string = buildQueryStateRequest(5, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        5
      );
      expect(
        parsed.data.length
      ).assertEqual(
        1
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'allservices'
      );
    });
    it('PE2_arrayBuffer_5', 0, () => {
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
    it('PE2_stringUtil_6', 0, () => {
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
    it('PE2_genericValues_8', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_8', 'val8');
      values.put('value_8', 'dev8');
      expect(
        values.get('pid_8')
      ).assertEqual(
        'val8'
      );
      expect(
        values.get('value_8')
      ).assertEqual(
        'dev8'
      );
      expect(
        values.get('missing8')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('PE2_asyncQuery_9', 0, async () => {
      const request: string = buildQueryStateRequest(10, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        10
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
    it('PE2_buildQuery_10', 0, () => {
      const sids: string[] = ['switch', 'restart', 'cust.switchScreens'];
      const request: string = buildQueryStateRequest(11, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        11
      );
      expect(
        parsed.data.length
      ).assertEqual(
        3
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'switch'
      );
    });
    it('PE2_arrayBuffer_11', 0, () => {
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
    it('PE2_stringUtil_12', 0, () => {
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
    it('PE2_genericValues_14', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_14', 'v14');
      values.put('value_14', 'dev14');
      expect(
        values.get('pid_14')
      ).assertEqual(
        'v14'
      );
      expect(
        values.get('value_14')
      ).assertEqual(
        'dev14'
      );
      expect(
        values.get('missing14')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('PE2_asyncQuery_15', 0, async () => {
      const request: string = buildQueryStateRequest(16, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        16
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
    it('PE2_buildQuery_16', 0, () => {
      const sids: string[] = ['authSetup'];
      const request: string = buildQueryStateRequest(17, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        17
      );
      expect(
        parsed.data.length
      ).assertEqual(
        1
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'authSetup'
      );
    });
    it('PE2_arrayBuffer_17', 0, () => {
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
    it('PE2_stringUtil_18', 0, () => {
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
    it('PE2_genericValues_20', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_20', 'v20');
      values.put('value_20', 'dev20');
      expect(
        values.get('pid_20')
      ).assertEqual(
        'v20'
      );
      expect(
        values.get('value_20')
      ).assertEqual(
        'dev20'
      );
      expect(
        values.get('missing20')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
  });
}
