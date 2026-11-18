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

  describe('ResourceManagement', () => {
    beforeAll(() => {
      TestLog.info('ResourceManagement beforeAll');
    });
    afterAll(() => {
      TestLog.info('ResourceManagement afterAll');
    });
    it('LI6_deviceEntity_0', 0, () => {
      const device: Device = new Device();
      device.productId = 'p0';
      device.deviceName = 'dev0';
      device.pinType = 0;
      expect(
        device.productId
      ).assertEqual(
        'p0'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev0'
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
      libraryDevice.manufacturerId = 'm0';
      libraryDevice.deviceIcons.push('icon0');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf0';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf0'
      );
    });
    it('LI6_cloudModel_1', 0, () => {
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
    it('LI6_genericValues_2', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_2', 'v2');
      values.put('value_2', 'dev2');
      expect(
        values.get('pid_2')
      ).assertEqual(
        'v2'
      );
      expect(
        values.get('value_2')
      ).assertEqual(
        'dev2'
      );
      expect(
        values.get('missing2')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI6_buildQuery_3', 0, () => {
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
    it('LI6_constants_4', 0, () => {
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
    it('LI6_asyncQuery_5', 0, async () => {
      const request: string = buildQueryStateRequest(6, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        6
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
    it('LI6_deviceEntity_6', 0, () => {
      const device: Device = new Device();
      device.productId = 'p6';
      device.deviceName = 'dev6';
      device.pinType = 1;
      expect(
        device.productId
      ).assertEqual(
        'p6'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev6'
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
      libraryDevice.manufacturerId = 'm6';
      libraryDevice.deviceIcons.push('icon6');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf6';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf6'
      );
    });
    it('LI6_cloudModel_7', 0, () => {
      const project: Project = new Project();
      project.name = 'project7';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project7'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd7';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd7'
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
    it('LI6_genericValues_8', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_8', 'val8');
      values.put('value_8', 'dev8');
      expect(
        values.get('pid_8')
      ).assertEqual(
        'val8'
      );
      expect(
        values.get('value_8')
      ).assertEqual(
        'dev8'
      );
      expect(
        values.get('missing8')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI6_buildQuery_9', 0, () => {
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
    it('LI6_asyncQuery_11', 0, async () => {
      const request: string = buildQueryStateRequest(12, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        12
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
    it('LI6_deviceEntity_12', 0, () => {
      const device: Device = new Device();
      device.productId = 'p12';
      device.deviceName = 'dev12';
      device.pinType = 2;
      expect(
        device.productId
      ).assertEqual(
        'p12'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev12'
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
      libraryDevice.manufacturerId = 'm12';
      libraryDevice.deviceIcons.push('icon12');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf12';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf12'
      );
    });
    it('LI6_cloudModel_13', 0, () => {
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
    it('LI6_genericValues_14', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_14', 'v14');
      values.put('value_14', 'dev14');
      expect(
        values.get('pid_14')
      ).assertEqual(
        'v14'
      );
      expect(
        values.get('value_14')
      ).assertEqual(
        'dev14'
      );
      expect(
        values.get('missing14')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
  });
}
