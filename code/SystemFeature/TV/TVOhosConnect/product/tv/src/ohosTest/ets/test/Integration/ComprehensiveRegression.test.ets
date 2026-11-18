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
export default function suite1() {

  describe('ComprehensiveRegression', () => {
    beforeAll(() => {
      TestLog.info('ComprehensiveRegression beforeAll');
    });
    afterAll(() => {
      TestLog.info('ComprehensiveRegression afterAll');
    });
    it('IN1_analysisServices_0', 0, () => {
      const payload: string = '{"seq":1,"services":[{"sid":"switch","data":{"on":1}}]}';
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
        1
      );
    });
    it('IN1_analysisVendor_1', 0, () => {
      const payload: string = '{"seq":2,"vendor":[{"sid":"vendor1","data":{"v":2}}]}';
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
    it('IN1_virtualBroadcast_2', 0, () => {
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
    it('IN1_arrayBuffer_3', 0, () => {
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
    it('IN1_protocol_4', 0, () => {
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
    it('IN1_tableConfig_5', 0, () => {
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
    it('IN1_cloudModel_6', 0, () => {
      const project: Project = new Project();
      project.name = 'project6';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project6'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd6';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd6'
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
    it('IN1_buildQuery_7', 0, () => {
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
    it('IN1_analysisServices_8', 0, () => {
      const payload: string = '{"seq":9,"services":[{"sid":"snw","data":{"on":9}}]}';
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
        9
      );
    });
    it('IN1_analysisVendor_9', 0, () => {
      const payload: string = '{"seq":10,"vendor":[{"sid":"vendor4","data":{"v":3}}]}';
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
    it('IN1_arrayBuffer_11', 0, () => {
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
    it('IN1_cloudModel_14', 0, () => {
      const project: Project = new Project();
      project.name = 'project14';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project14'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd14';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd14'
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
    it('IN1_buildQuery_15', 0, () => {
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
    it('IN1_analysisServices_16', 0, () => {
      const payload: string = '{"seq":17,"services":[{"sid":"authSetup","data":{"on":8}}]}';
      const states: InfDeviceState[] = analysisPayload(payload);
      expect(
        states.length
      ).assertEqual(
        1
      );
      expect(
        states[0].sid
      ).assertEqual(
        'authSetup'
      );
      expect(
        states[0].data['on']
      ).assertEqual(
        8
      );
    });
    it('IN1_analysisVendor_17', 0, () => {
      const payload: string = '{"seq":18,"vendor":[{"sid":"vendor2","data":{"v":4}}]}';
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
    it('IN1_arrayBuffer_19', 0, () => {
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
  });
}
