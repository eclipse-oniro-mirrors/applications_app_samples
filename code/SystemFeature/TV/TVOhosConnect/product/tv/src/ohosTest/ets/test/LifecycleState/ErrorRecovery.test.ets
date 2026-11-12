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
export default function suite3() {

  describe('ErrorRecovery', () => {
    beforeAll(() => {
      TestLog.info('ErrorRecovery beforeAll');
    });
    afterAll(() => {
      TestLog.info('ErrorRecovery afterAll');
    });
    it('LI3_buildQuery_0', 0, () => {
      const sids: string[] = ['switch'];
      const request: string = buildQueryStateRequest(1, sids);
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
    it('LI3_constants_1', 0, () => {
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
    it('LI3_asyncQuery_2', 0, async () => {
      const request: string = buildQueryStateRequest(3, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        3
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
    it('LI3_deviceEntity_3', 0, () => {
      const device: Device = new Device();
      device.productId = 'p3';
      device.deviceName = 'dev3';
      device.pinType = 3;
      expect(
        device.productId
      ).assertEqual(
        'p3'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev3'
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
      libraryDevice.manufacturerId = 'm3';
      libraryDevice.deviceIcons.push('icon3');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf3';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf3'
      );
    });
    it('LI3_cloudModel_4', 0, () => {
      const project: Project = new Project();
      project.name = 'project4';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project4'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd4';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd4'
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
    it('LI3_genericValues_5', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_5', 'v5');
      values.put('value_5', 'dev5');
      expect(
        values.get('pid_5')
      ).assertEqual(
        'v5'
      );
      expect(
        values.get('value_5')
      ).assertEqual(
        'dev5'
      );
      expect(
        values.get('missing5')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI3_buildQuery_6', 0, () => {
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
    it('LI3_asyncQuery_8', 0, async () => {
      const request: string = buildQueryStateRequest(9, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        9
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
    it('LI3_deviceEntity_9', 0, () => {
      const device: Device = new Device();
      device.productId = 'p9';
      device.deviceName = 'dev9';
      device.pinType = 4;
      expect(
        device.productId
      ).assertEqual(
        'p9'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev9'
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
      libraryDevice.manufacturerId = 'm9';
      libraryDevice.deviceIcons.push('icon9');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf9';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf9'
      );
    });
    it('LI3_cloudModel_10', 0, () => {
      const project: Project = new Project();
      project.name = 'project10';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project10'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd10';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd10'
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
    it('LI3_genericValues_11', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_11', 'v11');
      values.put('value_11', 'dev11');
      expect(
        values.get('pid_11')
      ).assertEqual(
        'v11'
      );
      expect(
        values.get('value_11')
      ).assertEqual(
        'dev11'
      );
      expect(
        values.get('missing11')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI3_buildQuery_12', 0, () => {
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
    it('LI3_asyncQuery_14', 0, async () => {
      const request: string = buildQueryStateRequest(15, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        15
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
    it('LI3_deviceEntity_15', 0, () => {
      const device: Device = new Device();
      device.productId = 'p15';
      device.deviceName = 'dev15';
      device.pinType = 0;
      expect(
        device.productId
      ).assertEqual(
        'p15'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev15'
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
      libraryDevice.manufacturerId = 'm15';
      libraryDevice.deviceIcons.push('icon15');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf15';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf15'
      );
    });
    it('LI3_cloudModel_16', 0, () => {
      const project: Project = new Project();
      project.name = 'project16';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project16'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd16';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd16'
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
    it('LI3_genericValues_17', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_17', 'v17');
      values.put('value_17', 'dev17');
      expect(
        values.get('pid_17')
      ).assertEqual(
        'v17'
      );
      expect(
        values.get('value_17')
      ).assertEqual(
        'dev17'
      );
      expect(
        values.get('missing17')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI3_buildQuery_18', 0, () => {
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
    it('LI3_asyncQuery_20', 0, async () => {
      const request: string = buildQueryStateRequest(21, ['switch']);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        21
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
    it('LI3_deviceEntity_21', 0, () => {
      const device: Device = new Device();
      device.productId = 'p21';
      device.deviceName = 'dev21';
      device.pinType = 1;
      expect(
        device.productId
      ).assertEqual(
        'p21'
      );
      expect(
        device.deviceName
      ).assertEqual(
        'dev21'
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
      libraryDevice.manufacturerId = 'm21';
      libraryDevice.deviceIcons.push('icon21');
      expect(
        libraryDevice.deviceIcons.length
      ).assertEqual(
        1
      );
      expect(
        libraryDevice.oHConnectCertified
      ).assertFalse();
      const manufacturer: Manufacturer = new Manufacturer();
      manufacturer.manufacturerId = 'mf21';
      expect(
        manufacturer.manufacturerId
      ).assertEqual(
        'mf21'
      );
    });
    it('LI3_cloudModel_22', 0, () => {
      const project: Project = new Project();
      project.name = 'project22';
      project.longitude = '120.1';
      project.latitude = '30.2';
      expect(
        project.name
      ).assertEqual(
        'project22'
      );
      expect(
        project.longitude
      ).assertEqual(
        '120.1'
      );
      const device: CloudDeviceModel = new CloudDeviceModel();
      device.deviceId = 'd22';
      device.status = 'online';
      device.protocolType = 'ble';
      expect(
        device.deviceId
      ).assertEqual(
        'd22'
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
    it('LI3_genericValues_23', 0, () => {
      const values: GenericValues = new GenericValues();
      values.put('pid_23', 'v23');
      values.put('value_23', 'dev23');
      expect(
        values.get('pid_23')
      ).assertEqual(
        'v23'
      );
      expect(
        values.get('value_23')
      ).assertEqual(
        'dev23'
      );
      expect(
        values.get('missing23')
      ).assertEqual(
        ''
      );
      expect(
        values.toString().startsWith('genericValues:[')
      ).assertTrue();
    });
    it('LI3_buildQuery_24', 0, () => {
      const sids: string[] = ['allservices'];
      const request: string = buildQueryStateRequest(25, sids);
      const parsed: QueryRequest = JSON.parse(request) as QueryRequest;
      expect(
        parsed.seq
      ).assertEqual(
        25
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
  });
}
