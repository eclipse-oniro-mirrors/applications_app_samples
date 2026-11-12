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
export default function suite8() {

  describe('StatePersistence', () => {
    beforeAll(() => {
      TestLog.info('StatePersistence beforeAll');
    });
    afterAll(() => {
      TestLog.info('StatePersistence afterAll');
    });
    it('LI8_genericValues_0', 0, () => {
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
    it('LI8_buildQuery_1', 0, () => {
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
    it('LI8_constants_2', 0, () => {
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
    it('LI8_asyncQuery_3', 0, async () => {
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
    it('LI8_deviceEntity_4', 0, () => {
      const device: Device = new Device();
      device.productId = 'p4';
      device.deviceName = 'dev4';
      device.pinType = 4;
      expect(
        device.productId
      ).assertEqual(
        'p4'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev4'
      );
      expect(
        device.pinType
      ).assertEqual(
        4
      );
      expect(
        device.manufacturer.manufacturerId
      ).assertEqual(
        ''
      );
      const libraryDevice: LibraryDevice = new LibraryDevice();
      libraryDevice.manufacturerId = 'm4';
      libraryDevice.deviceIcons.push('icon4');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf4';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf4'
      );
    });
    it('LI8_cloudModel_5', 0, () => {
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
    it('LI8_genericValues_6', 0, () => {
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
    it('LI8_buildQuery_7', 0, () => {
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
    it('LI8_asyncQuery_9', 0, async () => {
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
    it('LI8_deviceEntity_10', 0, () => {
      const device: Device = new Device();
      device.productId = 'p10';
      device.deviceName = 'dev10';
      device.pinType = 0;
      expect(
        device.productId
      ).assertEqual(
        'p10'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev10'
      );
      expect(
        device.pinType
      ).assertEqual(
        0
      );
      expect(
        device.manufacturer.manufacturerId
      ).assertEqual(
        ''
      );
      const libraryDevice: LibraryDevice = new LibraryDevice();
      libraryDevice.manufacturerId = 'm10';
      libraryDevice.deviceIcons.push('icon10');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf10';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf10'
      );
    });
    it('LI8_cloudModel_11', 0, () => {
      const project: Project = new Project();
      project.name = 'project11';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project11'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd11';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd11'
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
    it('LI8_genericValues_12', 0, () => {
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
    it('LI8_buildQuery_13', 0, () => {
      const sids: string[] = ['cust.waterDetector', 'allservices'];
      const request: string = buildQueryStateRequest(14, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        14
      );
      expect(
        parsed.data.length
      ).assertEqual(
        2
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'cust.waterDetector'
      );
    });
    it('LI8_asyncQuery_15', 0, async () => {
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
  });
}
