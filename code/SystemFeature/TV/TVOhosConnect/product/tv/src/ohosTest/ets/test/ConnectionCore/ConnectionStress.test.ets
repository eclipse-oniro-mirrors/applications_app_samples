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

  describe('ConnectionStress', () => {
    beforeAll(() => {
      TestLog.info('ConnectionStress beforeAll');
    });
    afterAll(() => {
      TestLog.info('ConnectionStress afterAll');
    });
    it('CO6_bleScanRegex_0', 0, () => {
      expect(
        new RegExp(BleConstants.bleScanRegStr).test('Oh-ABCDE-1ABCDE1234')
      ).assertEqual(
        true
      );
      expect(
        BleConstants.bleScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO6_wifiScanRegex_1', 0, () => {
      expect(
        new RegExp(WifiConstants.wifiScanRegStr).test('Oh-VENDOR-Smart TV-1YYYYYRRRR')
      ).assertEqual(
        true
      );
      expect(
        WifiConstants.wifiScanRegStr.startsWith('^Oh')
      ).assertTrue();
    });
    it('CO6_virtualBroadcast_2', 0, () => {
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
    it('CO6_arrayBuffer_3', 0, () => {
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
    it('CO6_buildQuery_4', 0, () => {
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
    it('CO6_analysisServices_5', 0, () => {
      const payload: string = '{"seq":6,"services":[{"sid":"netCfg","data":{"on":6}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'netCfg'
      );
      expect(
        states[0].data['on']
      ).assertEqual(
        6
      );
    });
    it('CO6_analysisVendor_6', 0, () => {
      const payload: string = '{"seq":7,"vendor":[{"sid":"vendor1","data":{"v":7}}]}';
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
    it('CO6_protocol_7', 0, () => {
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
    it('CO6_enums_8', 0, () => {
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
    it('CO6_constants_9', 0, () => {
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
    it('CO6_buildQuery_14', 0, () => {
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
    it('CO6_analysisServices_15', 0, () => {
      const payload: string = '{"seq":16,"services":[{"sid":"netCfg","data":{"on":7}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'netCfg'
      );
      expect(
        states[0].data['on']
      ).assertEqual(
        7
      );
    });
  });
}
