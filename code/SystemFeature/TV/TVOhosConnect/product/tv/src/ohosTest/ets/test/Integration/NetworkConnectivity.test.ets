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

  describe('NetworkConnectivity', () => {
    beforeAll(() => {
      TestLog.info('NetworkConnectivity beforeAll');
    });
    afterAll(() => {
      TestLog.info('NetworkConnectivity afterAll');
    });
    it('IN6_tableConfig_0', 0, () => {
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
    it('IN6_cloudModel_1', 0, () => {
      const project: Project = new Project();
      project.name = 'project1';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project1'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd1';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd1'
      );
      expect(
        device.status
      ).assertEqual(
        'online'
      );
      expect(
        device.protocolType
      ).assertEqual(
        'ble'
      );
    });
    it('IN6_buildQuery_2', 0, () => {
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
    it('IN6_analysisServices_3', 0, () => {
      const payload: string = '{"seq":4,"services":[{"sid":"cust.waterDetector","data":{"on":4}}]}';
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
        4
      );
    });
    it('IN6_analysisVendor_4', 0, () => {
      const payload: string = '{"seq":5,"vendor":[{"sid":"vendor4","data":{"v":5}}]}';
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
    it('IN6_virtualBroadcast_5', 0, () => {
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
    it('IN6_arrayBuffer_6', 0, () => {
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
    it('IN6_protocol_7', 0, () => {
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
    it('IN6_cloudModel_9', 0, () => {
      const project: Project = new Project();
      project.name = 'project9';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project9'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd9';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd9'
      );
      expect(
        device.status
      ).assertEqual(
        'online'
      );
      expect(
        device.protocolType
      ).assertEqual(
        'ble'
      );
    });
    it('IN6_buildQuery_10', 0, () => {
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
    it('IN6_analysisServices_11', 0, () => {
      const payload: string = '{"seq":12,"services":[{"sid":"restart","data":{"on":3}}]}';
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
        3
      );
    });
    it('IN6_analysisVendor_12', 0, () => {
      const payload: string = '{"seq":13,"vendor":[{"sid":"vendor2","data":{"v":6}}]}';
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
    it('IN6_arrayBuffer_14', 0, () => {
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
    it('IN6_cloudModel_17', 0, () => {
      const project: Project = new Project();
      project.name = 'project17';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project17'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd17';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd17'
      );
      expect(
        device.status
      ).assertEqual(
        'online'
      );
      expect(
        device.protocolType
      ).assertEqual(
        'ble'
      );
    });
    it('IN6_buildQuery_18', 0, () => {
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
    it('IN6_analysisServices_19', 0, () => {
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
  });
}
