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
export default function suite9() {

  describe('DeviceItemInfoModel', () => {
    beforeAll(() => {
      TestLog.info('DeviceItemInfoModel beforeAll');
    });
    afterAll(() => {
      TestLog.info('DeviceItemInfoModel afterAll');
    });
    it('CO9_arrayBuffer_0', 0, () => {
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
    it('CO9_buildQuery_1', 0, () => {
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
    it('CO9_analysisServices_2', 0, () => {
      const payload: string = '{"seq":3,"services":[{"sid":"cust.switchScreens","data":{"on":3}}]}';
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
        3
      );
    });
    it('CO9_analysisVendor_3', 0, () => {
      const payload: string = '{"seq":4,"vendor":[{"sid":"vendor3","data":{"v":4}}]}';
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
    it('CO9_protocol_4', 0, () => {
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
    it('CO9_enums_5', 0, () => {
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
    it('CO9_constants_6', 0, () => {
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
    it('CO9_bleScanRegex_7', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-AB-1ABCDE1234')
      ).assertEqual(
        false
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO9_wifiScanRegex_8', 0, () => {
      expect(
        new RegExp(WifiConstants.wifiScanRegStr).test('Oh-ABCDE-2ABCD1234')
      ).assertEqual(
        false
      );
      expect(
        WifiConstants.wifiScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO9_virtualBroadcast_9', 0, () => {
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
    it('CO9_buildQuery_11', 0, () => {
      const sids: string[] = ['restart', 'cust.switchScreens', 'cust.waterDetector', 'allservices'];
      const request: string = buildQueryStateRequest(12, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        12
      );
      expect(
        parsed.data.length
      ).assertEqual(
        4
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'restart'
      );
    });
    it('CO9_analysisServices_12', 0, () => {
      const payload: string = '{"seq":13,"services":[{"sid":"cust.switchScreens","data":{"on":4}}]}';
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
        4
      );
    });
    it('CO9_buildQuery_21', 0, () => {
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
    it('CO9_analysisServices_22', 0, () => {
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
    it('CO9_buildQuery_31', 0, () => {
      const sids: string[] = ['restart', 'cust.switchScreens', 'cust.waterDetector', 'allservices'];
      const request: string = buildQueryStateRequest(32, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        32
      );
      expect(
        parsed.data.length
      ).assertEqual(
        4
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'restart'
      );
    });
    it('CO9_analysisServices_32', 0, () => {
      const payload: string = '{"seq":33,"services":[{"sid":"cust.switchScreens","data":{"on":6}}]}';
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
        6
      );
    });
  });
}
