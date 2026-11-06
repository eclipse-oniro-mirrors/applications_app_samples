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
export default function suite4() {

  describe('LongTermStability', () => {
    beforeAll(() => {
      TestLog.info('LongTermStability beforeAll');
    });
    afterAll(() => {
      TestLog.info('LongTermStability afterAll');
    });
    it('PE4_genericValues_0', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_0', 'v0');
      values.put('value_0', 'dev0');
      expect(
        values.get('pid_0')
      ).assertEqual(
        'v0'
      );
      expect(
        values.get('value_0')
      ).assertEqual(
        'dev0'
      );
      expect(
        values.get('missing0')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('PE4_asyncQuery_1', 0, async () => {
      const request: string = buildQueryStateRequest(2, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        2
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
    it('PE4_buildQuery_2', 0, () => {
      const sids: string[] = ['cust.switchScreens', 'cust.waterDetector', 'allservices'];
      const request: string = buildQueryStateRequest(3, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        3
      );
      expect(
        parsed.data.length
      ).assertEqual(
        3
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'cust.switchScreens'
      );
    });
    it('PE4_arrayBuffer_3', 0, () => {
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
    it('PE4_stringUtil_4', 0, () => {
      expect(
        StringUtil.replaceAll('aaaa', 'a', 'b')
      ).assertEqual(
        'bbbb'
      );
      expect(
        StringUtil.isEmpty('   ')
      ).assertEqual(
        true
      );
    });
    it('PE4_virtualBroadcast_5', 0, () => {
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
    it('PE4_genericValues_6', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_6', 'v6');
      values.put('value_6', 'dev6');
      expect(
        values.get('pid_6')
      ).assertEqual(
        'v6'
      );
      expect(
        values.get('value_6')
      ).assertEqual(
        'dev6'
      );
      expect(
        values.get('missing6')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('PE4_asyncQuery_7', 0, async () => {
      const request: string = buildQueryStateRequest(8, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        8
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
    it('PE4_buildQuery_8', 0, () => {
      const sids: string[] = ['snw'];
      const request: string = buildQueryStateRequest(9, sids);
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
        'snw'
      );
    });
    it('PE4_arrayBuffer_9', 0, () => {
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
    it('PE4_stringUtil_10', 0, () => {
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
    it('PE4_genericValues_12', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_12', 'v12');
      values.put('value_12', 'dev12');
      expect(
        values.get('pid_12')
      ).assertEqual(
        'v12'
      );
      expect(
        values.get('value_12')
      ).assertEqual(
        'dev12'
      );
      expect(
        values.get('missing12')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('PE4_asyncQuery_13', 0, async () => {
      const request: string = buildQueryStateRequest(14, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        14
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
    it('PE4_buildQuery_14', 0, () => {
      const sids: string[] = ['allservices', 'netCfg', 'authSetup'];
      const request: string = buildQueryStateRequest(15, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        15
      );
      expect(
        parsed.data.length
      ).assertEqual(
        3
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'allservices'
      );
    });
    it('PE4_arrayBuffer_15', 0, () => {
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
    it('PE4_stringUtil_16', 0, () => {
      expect(
        StringUtil.replaceAll('a.b.c.d', '.', '/')
      ).assertEqual(
        'a/b/c/d'
      );
      expect(
        StringUtil.isEmpty('   ')
      ).assertEqual(
        true
      );
    });
    it('PE4_genericValues_18', 0, () => {
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
    it('PE4_asyncQuery_19', 0, async () => {
      const request: string = buildQueryStateRequest(20, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        20
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
    it('PE4_buildQuery_20', 0, () => {
      const sids: string[] = ['switch'];
      const request: string = buildQueryStateRequest(21, sids);
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
