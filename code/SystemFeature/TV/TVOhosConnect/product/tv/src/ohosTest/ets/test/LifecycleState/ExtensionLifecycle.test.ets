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
export default function suite5() {

  describe('ExtensionLifecycle', () => {
    beforeAll(() => {
      TestLog.info('ExtensionLifecycle beforeAll');
    });
    afterAll(() => {
      TestLog.info('ExtensionLifecycle afterAll');
    });
    it('LI5_asyncQuery_0', 0, async () => {
      const request: string = buildQueryStateRequest(1, ['switch']);
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
    it('LI5_deviceEntity_1', 0, () => {
      const device: Device = new Device();
      device.productId = 'p1';
      device.deviceName = 'dev1';
      device.pinType = 1;
      expect(
        device.productId
      ).assertEqual(
        'p1'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev1'
      );
      expect(
        device.pinType
      ).assertEqual(
        1
      );
      expect(
        device.manufacturer.manufacturerId
      ).assertEqual(
        ''
      );
      const libraryDevice: LibraryDevice = new LibraryDevice();
      libraryDevice.manufacturerId = 'm1';
      libraryDevice.deviceIcons.push('icon1');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf1';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf1'
      );
    });
    it('LI5_cloudModel_2', 0, () => {
      const project: Project = new Project();
      project.name = 'project2';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project2'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd2';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd2'
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
    it('LI5_genericValues_3', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_3', 'v3');
      values.put('value_3', 'dev3');
      expect(
        values.get('pid_3')
      ).assertEqual(
        'v3'
      );
      expect(
        values.get('value_3')
      ).assertEqual(
        'dev3'
      );
      expect(
        values.get('missing3')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI5_buildQuery_4', 0, () => {
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
    it('LI5_constants_5', 0, () => {
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
    it('LI5_asyncQuery_6', 0, async () => {
      const request: string = buildQueryStateRequest(7, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        7
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
    it('LI5_deviceEntity_7', 0, () => {
      const device: Device = new Device();
      device.productId = 'p7';
      device.deviceName = 'dev7';
      device.pinType = 2;
      expect(
        device.productId
      ).assertEqual(
        'p7'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev7'
      );
      expect(
        device.pinType
      ).assertEqual(
        2
      );
      expect(
        device.manufacturer.manufacturerId
      ).assertEqual(
        ''
      );
      const libraryDevice: LibraryDevice = new LibraryDevice();
      libraryDevice.manufacturerId = 'm7';
      libraryDevice.deviceIcons.push('icon7');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf7';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf7'
      );
    });
    it('LI5_cloudModel_8', 0, () => {
      const project: Project = new Project();
      project.name = 'project8';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project8'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'dev8';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'dev8'
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
    it('LI5_genericValues_9', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_9', 'v9');
      values.put('value_9', 'dev9');
      expect(
        values.get('pid_9')
      ).assertEqual(
        'v9'
      );
      expect(
        values.get('value_9')
      ).assertEqual(
        'dev9'
      );
      expect(
        values.get('missing9')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI5_buildQuery_10', 0, () => {
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
    it('LI5_asyncQuery_12', 0, async () => {
      const request: string = buildQueryStateRequest(13, ['switch']);
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
        'switch'
      );
    });
    it('LI5_deviceEntity_13', 0, () => {
      const device: Device = new Device();
      device.productId = 'p13';
      device.deviceName = 'dev13';
      device.pinType = 3;
      expect(
        device.productId
      ).assertEqual(
        'p13'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev13'
      );
      expect(
        device.pinType
      ).assertEqual(
        3
      );
      expect(
        device.manufacturer.manufacturerId
      ).assertEqual(
        ''
      );
      const libraryDevice: LibraryDevice = new LibraryDevice();
      libraryDevice.manufacturerId = 'm13';
      libraryDevice.deviceIcons.push('icon13');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf13';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf13'
      );
    });
    it('LI5_cloudModel_14', 0, () => {
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
    it('LI5_genericValues_15', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_15', 'v15');
      values.put('value_15', 'dev15');
      expect(
        values.get('pid_15')
      ).assertEqual(
        'v15'
      );
      expect(
        values.get('value_15')
      ).assertEqual(
        'dev15'
      );
      expect(
        values.get('missing15')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI5_buildQuery_16', 0, () => {
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
  });
}
