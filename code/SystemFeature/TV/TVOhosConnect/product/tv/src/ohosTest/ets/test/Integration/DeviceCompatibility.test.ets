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

  describe('DeviceCompatibility', () => {
    beforeAll(() => {
      TestLog.info('DeviceCompatibility beforeAll');
    });
    afterAll(() => {
      TestLog.info('DeviceCompatibility afterAll');
    });
    it('IN2_analysisVendor_0', 0, () => {
      const payload: string = '{"seq":1,"vendor":[{"sid":"vendor0","data":{"v":1}}]}';
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
    it('IN2_virtualBroadcast_1', 0, () => {
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
    it('IN2_arrayBuffer_2', 0, () => {
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
    it('IN2_protocol_3', 0, () => {
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
    it('IN2_tableConfig_4', 0, () => {
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
    it('IN2_cloudModel_5', 0, () => {
      const project: Project = new Project();
      project.name = 'project5';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project5'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd5';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd5'
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
    it('IN2_buildQuery_6', 0, () => {
      const sids: string[] = ['authSetup', 'deviceInfo', 'snw'];
      const request: string = buildQueryStateRequest(7, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        7
      );
      expect(
        parsed.data.length
      ).assertEqual(
        3
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'authSetup'
      );
    });
    it('IN2_analysisServices_7', 0, () => {
      const payload: string = '{"seq":8,"services":[{"sid":"deviceInfo","data":{"on":8}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'deviceInfo'
      );
      expect(
        states[0].data['on']
      ).assertEqual(
        8
      );
    });
    it('IN2_analysisVendor_8', 0, () => {
      const payload: string = '{"seq":9,"vendor":[{"sid":"vendor3","data":{"v":2}}]}';
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
    it('IN2_arrayBuffer_10', 0, () => {
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
    it('IN2_cloudModel_13', 0, () => {
      const project: Project = new Project();
      project.name = 'project13';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project13'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd13';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd13'
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
    it('IN2_buildQuery_14', 0, () => {
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
    it('IN2_analysisServices_15', 0, () => {
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
    it('IN2_analysisVendor_16', 0, () => {
      const payload: string = '{"seq":17,"vendor":[{"sid":"vendor1","data":{"v":3}}]}';
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
    it('IN2_arrayBuffer_18', 0, () => {
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
  });
}
