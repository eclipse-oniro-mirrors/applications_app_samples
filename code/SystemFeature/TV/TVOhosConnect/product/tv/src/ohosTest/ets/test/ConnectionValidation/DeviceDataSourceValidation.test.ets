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

  describe('DeviceDataSourceValidation', () => {
    beforeAll(() => {
      TestLog.info('DeviceDataSourceValidation beforeAll');
    });
    afterAll(() => {
      TestLog.info('DeviceDataSourceValidation afterAll');
    });
    it('CO6_virtualBroadcast_0', 0, () => {
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
    it('CO6_constants_1', 0, () => {
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
    it('CO6_protocol_2', 0, () => {
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
    it('CO6_buildQuery_3', 0, () => {
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
    it('CO6_analysisServices_4', 0, () => {
      const payload: string = '{"seq":5,"services":[{"sid":"allservices","data":{"on":5}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'allservices'
      );
      expect(
        states[0].data['on']
      ).assertEqual(
        5
      );
    });
    it('CO6_analysisVendor_5', 0, () => {
      const payload: string = '{"seq":6,"vendor":[{"sid":"vendor0","data":{"v":6}}]}';
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
    it('CO6_bleScanRegex_6', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Xh-ABCDE-1ABCDE1234')
      ).assertEqual(
        false
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO6_wifiScanRegex_7', 0, () => {
      expect(
        new RegExp(WifiConstants.wifiScanRegStr).test('Oh-AB-1ABCDE1234')
      ).assertEqual(
        false
      );
      expect(
        WifiConstants.wifiScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO6_arrayBuffer_8', 0, () => {
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
    it('CO6_buildQuery_12', 0, () => {
      const sids: string[] = ['cust.switchScreens'];
      const request: string = buildQueryStateRequest(13, sids);
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
        'cust.switchScreens'
      );
    });
    it('CO6_analysisServices_13', 0, () => {
      const payload: string = '{"seq":14,"services":[{"sid":"cust.waterDetector","data":{"on":5}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'cust.waterDetector'
      );
      expect(
        states[0].data['on']
      ).assertEqual(
        5
      );
    });
    it('CO6_analysisVendor_14', 0, () => {
      const payload: string = '{"seq":15,"vendor":[{"sid":"vendor4","data":{"v":1}}]}';
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
    it('CO6_bleScanRegex_15', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-VENDOR-Smart TV-6YYY YRRRR')
      ).assertEqual(
        false
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO6_wifiScanRegex_16', 0, () => {
      expect(
        new RegExp(WifiConstants.wifiScanRegStr).test('Xh-ABCDE-1ABCDE1234')
      ).assertEqual(
        false
      );
      expect(
        WifiConstants.wifiScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO6_arrayBuffer_17', 0, () => {
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
    it('CO6_buildQuery_21', 0, () => {
      const sids: string[] = ['restart', 'cust.switchScreens'];
      const request: string = buildQueryStateRequest(22, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        22
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
    it('CO6_analysisServices_22', 0, () => {
      const payload: string = '{"seq":23,"services":[{"sid":"cust.switchScreens","data":{"on":5}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'cust.switchScreens'
      );
      expect(
        states[0].data['on']
      ).assertEqual(
        5
      );
    });
    it('CO6_analysisVendor_23', 0, () => {
      const payload: string = '{"seq":24,"vendor":[{"sid":"vendor3","data":{"v":3}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'vendor3'
      );
    });
    it('CO6_bleScanRegex_24', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-VENDOR-Smart TV-+YYYYYRRRR')
      ).assertEqual(
        false
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO6_wifiScanRegex_25', 0, () => {
      expect(
        new RegExp(WifiConstants.wifiScanRegStr).test('Oh-VENDOR-Smart TV-6YYY YRRRR')
      ).assertEqual(
        false
      );
      expect(
        WifiConstants.wifiScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO6_arrayBuffer_26', 0, () => {
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
    it('CO6_buildQuery_30', 0, () => {
      const sids: string[] = ['switch', 'restart', 'cust.switchScreens'];
      const request: string = buildQueryStateRequest(31, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        31
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
    it('CO6_analysisServices_31', 0, () => {
      const payload: string = '{"seq":32,"services":[{"sid":"restart","data":{"on":5}}]}';
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
        5
      );
    });
    it('CO6_analysisVendor_32', 0, () => {
      const payload: string = '{"seq":33,"vendor":[{"sid":"vendor2","data":{"v":5}}]}';
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
  });
}
