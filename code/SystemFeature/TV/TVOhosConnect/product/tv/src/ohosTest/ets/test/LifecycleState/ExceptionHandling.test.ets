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

  describe('ExceptionHandling', () => {
    beforeAll(() => {
      TestLog.info('ExceptionHandling beforeAll');
    });
    afterAll(() => {
      TestLog.info('ExceptionHandling afterAll');
    });
    it('LI4_constants_0', 0, () => {
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
    it('LI4_asyncQuery_1', 0, async () => {
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
    it('LI4_deviceEntity_2', 0, () => {
      const device: Device = new Device();
      device.productId = 'p2';
      device.deviceName = 'dev2';
      device.pinType = 2;
      expect(
        device.productId
      ).assertEqual(
        'p2'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev2'
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
      libraryDevice.manufacturerId = 'm2';
      libraryDevice.deviceIcons.push('icon2');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf2';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf2'
      );
    });
    it('LI4_cloudModel_3', 0, () => {
      const project: Project = new Project();
      project.name = 'project3';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project3'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd3';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd3'
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
    it('LI4_genericValues_4', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_4', 'v4');
      values.put('value_4', 'dev4');
      expect(
        values.get('pid_4')
      ).assertEqual(
        'v4'
      );
      expect(
        values.get('value_4')
      ).assertEqual(
        'dev4'
      );
      expect(
        values.get('missing4')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI4_buildQuery_5', 0, () => {
      const sids: string[] = ['netCfg', 'authSetup'];
      const request: string = buildQueryStateRequest(6, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        6
      );
      expect(
        parsed.data.length
      ).assertEqual(
        2
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'netCfg'
      );
    });
    it('LI4_asyncQuery_7', 0, async () => {
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
    it('LI4_deviceEntity_8', 0, () => {
      const device: Device = new Device();
      device.productId = 'p8';
      device.deviceName = 'dev8';
      device.pinType = 3;
      expect(
        device.productId
      ).assertEqual(
        'p8'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev8'
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
      libraryDevice.manufacturerId = 'm8';
      libraryDevice.deviceIcons.push('icon8');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf8';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf8'
      );
    });
    it('LI4_cloudModel_9', 0, () => {
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
    it('LI4_genericValues_10', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_10', 'v10');
      values.put('value_10', 'dev10');
      expect(
        values.get('pid_10')
      ).assertEqual(
        'v10'
      );
      expect(
        values.get('value_10')
      ).assertEqual(
        'dev10'
      );
      expect(
        values.get('missing10')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI4_buildQuery_11', 0, () => {
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
    it('LI4_asyncQuery_13', 0, async () => {
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
    it('LI4_deviceEntity_14', 0, () => {
      const device: Device = new Device();
      device.productId = 'p14';
      device.deviceName = 'dev14';
      device.pinType = 4;
      expect(
        device.productId
      ).assertEqual(
        'p14'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev14'
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
      libraryDevice.manufacturerId = 'm14';
      libraryDevice.deviceIcons.push('icon14');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf14';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf14'
      );
    });
    it('LI4_cloudModel_15', 0, () => {
      const project: Project = new Project();
      project.name = 'project15';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project15'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd15';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd15'
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
    it('LI4_genericValues_16', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_16', 'v16');
      values.put('value_16', 'dev16');
      expect(
        values.get('pid_16')
      ).assertEqual(
        'v16'
      );
      expect(
        values.get('value_16')
      ).assertEqual(
        'dev16'
      );
      expect(
        values.get('missing16')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI4_buildQuery_17', 0, () => {
      const sids: string[] = ['deviceInfo', 'snw'];
      const request: string = buildQueryStateRequest(18, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        18
      );
      expect(
        parsed.data.length
      ).assertEqual(
        2
      );
      expect(
        parsed.data[0].sid
      ).assertEqual(
        'deviceInfo'
      );
    });
    it('LI4_asyncQuery_19', 0, async () => {
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
    it('LI4_deviceEntity_20', 0, () => {
      const device: Device = new Device();
      device.productId = 'p20';
      device.deviceName = 'dev20';
      device.pinType = 0;
      expect(
        device.productId
      ).assertEqual(
        'p20'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev20'
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
      libraryDevice.manufacturerId = 'm20';
      libraryDevice.deviceIcons.push('icon20');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf20';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf20'
      );
    });
    it('LI4_cloudModel_21', 0, () => {
      const project: Project = new Project();
      project.name = 'project21';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project21'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd21';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd21'
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
    it('LI4_genericValues_22', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_22', 'v22');
      values.put('value_22', 'dev22');
      expect(
        values.get('pid_22')
      ).assertEqual(
        'v22'
      );
      expect(
        values.get('value_22')
      ).assertEqual(
        'dev22'
      );
      expect(
        values.get('missing22')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI4_buildQuery_23', 0, () => {
      const sids: string[] = ['cust.waterDetector', 'allservices', 'netCfg', 'authSetup'];
      const request: string = buildQueryStateRequest(24, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        24
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
  });
}
