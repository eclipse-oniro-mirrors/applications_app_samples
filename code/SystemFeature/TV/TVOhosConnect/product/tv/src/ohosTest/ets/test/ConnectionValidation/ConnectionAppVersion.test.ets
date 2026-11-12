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

  describe('ConnectionAppVersion', () => {
    beforeAll(() => {
      TestLog.info('ConnectionAppVersion beforeAll');
    });
    afterAll(() => {
      TestLog.info('ConnectionAppVersion afterAll');
    });
    it('CO0_buildQuery_0', 0, () => {
      const sids: string[] = ['switch'];
      const request: string = buildQueryStateRequest(1, sids);
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
    it('CO0_analysisServices_1', 0, () => {
      const payload: string = '{"seq":2,"services":[{"sid":"restart","data":{"on":2}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'restart'
      );
      expect(
        states[0].data['on']
      ).assertEqual(
        2
      );
    });
    it('CO0_analysisVendor_2', 0, () => {
      const payload: string = '{"seq":3,"vendor":[{"sid":"vendor2","data":{"v":3}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'vendor2'
      );
    });
    it('CO0_bleScanRegex_3', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-VENDOR-Smart TV1234-4YYYYYRRRR')
      ).assertEqual(
        false
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO0_wifiScanRegex_4', 0, () => {
      expect(
        new RegExp(WifiConstants.wifiScanRegStr).test('Oh-VENDOR-Smart TV-+YYYYYRRRR')
      ).assertEqual(
        false
      );
      expect(
        WifiConstants.wifiScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO0_arrayBuffer_5', 0, () => {
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
    it('CO0_virtualBroadcast_6', 0, () => {
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
    it('CO0_constants_7', 0, () => {
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
    it('CO0_protocol_8', 0, () => {
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
    it('CO0_buildQuery_9', 0, () => {
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
    it('CO0_analysisServices_10', 0, () => {
      const payload: string = '{"seq":11,"services":[{"sid":"switch","data":{"on":2}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'switch'
      );
      expect(
        states[0].data['on']
      ).assertEqual(
        2
      );
    });
    it('CO0_analysisVendor_11', 0, () => {
      const payload: string = '{"seq":12,"vendor":[{"sid":"vendor1","data":{"v":5}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'vendor1'
      );
    });
    it('CO0_bleScanRegex_12', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-S-WS-3YYYYYRRRR')
      ).assertEqual(
        false
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO0_wifiScanRegex_13', 0, () => {
      expect(
        new RegExp(WifiConstants.wifiScanRegStr).test('Oh-VENDOR-Smart TV1234-4YYYYYRRRR')
      ).assertEqual(
        false
      );
      expect(
        WifiConstants.wifiScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO0_arrayBuffer_14', 0, () => {
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
    it('CO0_buildQuery_18', 0, () => {
      const sids: string[] = ['snw', 'getIp', 'switch'];
      const request: string = buildQueryStateRequest(19, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        19
      );
      expect(
        parsed.data.length
      ).assertEqual(
        3
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'snw'
      );
    });
    it('CO0_analysisServices_19', 0, () => {
      const payload: string = '{"seq":20,"services":[{"sid":"getIp","data":{"on":2}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'getIp'
      );
      expect(
        states[0].data['on']
      ).assertEqual(
        2
      );
    });
    it('CO0_analysisVendor_20', 0, () => {
      const payload: string = '{"seq":21,"vendor":[{"sid":"vendor0","data":{"v":7}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'vendor0'
      );
    });
    it('CO0_bleScanRegex_21', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-VENDOR-Smart TV-1YYYYYRRRR')
      ).assertEqual(
        true
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO0_wifiScanRegex_22', 0, () => {
      expect(
        new RegExp(WifiConstants.wifiScanRegStr).test('Oh-S-WS-3YYYYYRRRR')
      ).assertEqual(
        false
      );
      expect(
        WifiConstants.wifiScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO0_arrayBuffer_23', 0, () => {
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
    it('CO0_buildQuery_27', 0, () => {
      const sids: string[] = ['deviceInfo', 'snw', 'getIp', 'switch'];
      const request: string = buildQueryStateRequest(28, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        28
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
    it('CO0_analysisServices_28', 0, () => {
      const payload: string = '{"seq":29,"services":[{"sid":"snw","data":{"on":2}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'snw'
      );
      expect(
        states[0].data['on']
      ).assertEqual(
        2
      );
    });
    it('CO0_analysisVendor_29', 0, () => {
      const payload: string = '{"seq":30,"vendor":[{"sid":"vendor4","data":{"v":2}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'vendor4'
      );
    });
    it('CO0_bleScanRegex_30', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-ABCDE-1ABCDE1234')
      ).assertEqual(
        true
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO0_wifiScanRegex_31', 0, () => {
      expect(
        new RegExp(WifiConstants.wifiScanRegStr).test('Oh-VENDOR-Smart TV-1YYYYYRRRR')
      ).assertEqual(
        true
      );
      expect(
        WifiConstants.wifiScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO0_arrayBuffer_32', 0, () => {
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
  });
}
