/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// ========================================
// Constants
// ========================================
export { PageConstants } from './src/main/ets/constants/PageConstants';
export { BluetoothConstants } from './src/main/ets/constants/BluetoothConstants';
export {
  BluetoothConstants as BtConstants,
  BluetoothProfileType,
  BluetoothConnectionState,
  BluetoothScanState,
  A2dpConnectionState,
  HfpConnectionState,
  HidDeviceType,
  PanNetworkRole,
  PbapSortOrder,
  MapMessageType,
  AvrcpPlaybackState,
  HdpDataType
} from './src/main/ets/constants/BluetoothConstants';

// ========================================
// Models
// ========================================
export { BluetoothDeviceModel, BluetoothDeviceType, BluetoothMajorService } from './src/main/ets/model/BluetoothDeviceModel';
export type { BluetoothDeviceJson } from './src/main/ets/model/BluetoothDeviceModel';
export { A2dpModel, A2dpState } from './src/main/ets/model/A2dpModel';
export type { A2dpJson } from './src/main/ets/model/A2dpModel';
export { HfpModel, HfpState } from './src/main/ets/model/HfpModel';
export type { HfpJson } from './src/main/ets/model/HfpModel';
export { HidModel, HidState } from './src/main/ets/model/HidModel';
export { PanModel, PanState } from './src/main/ets/model/PanModel';
export { PbapModel, PbapState } from './src/main/ets/model/PbapModel';
export { MapModel, MapState } from './src/main/ets/model/MapModel';
export { AvrcpModel, AvrcpState } from './src/main/ets/model/AvrcpModel';
export { HdpModel, HdpState } from './src/main/ets/model/HdpModel';

// ========================================
// Services
// ========================================
export { A2dpService } from './src/main/ets/service/A2dpService';
export { HfpService } from './src/main/ets/service/HfpService';
export { HidService } from './src/main/ets/service/HidService';
export { PanService } from './src/main/ets/service/PanService';
export { PbapService } from './src/main/ets/service/PbapService';
export { MapService } from './src/main/ets/service/MapService';
export { AvrcpService } from './src/main/ets/service/AvrcpService';
export { HdpService } from './src/main/ets/service/HdpService';
export { BluetoothScanService } from './src/main/ets/service/BluetoothScanService';
export { BluetoothConnectionManager } from './src/main/ets/service/BluetoothConnectionManager';

// ========================================
// Bluetooth Profile Managers
// ========================================
export { A2dpProfileManager } from './src/main/ets/bluetooth/A2dpProfileManager';
export { HfpProfileManager } from './src/main/ets/bluetooth/HfpProfileManager';
export { HidProfileManager } from './src/main/ets/bluetooth/HidProfileManager';
export { PanProfileManager } from './src/main/ets/bluetooth/PanProfileManager';
export { PbapProfileManager } from './src/main/ets/bluetooth/PbapProfileManager';
export { MapProfileManager } from './src/main/ets/bluetooth/MapProfileManager';
export { AvrcpProfileManager } from './src/main/ets/bluetooth/AvrcpProfileManager';
export { HdpProfileManager } from './src/main/ets/bluetooth/HdpProfileManager';

// ========================================
// Utils - Basic
// ========================================
export { LogLevel, Logger } from './src/main/ets/utils/basic/Logger';
export type { LogEntry, LogListener } from './src/main/ets/utils/basic/Logger';
export { CommonUtils } from './src/main/ets/utils/basic/CommonUtils';
export { Constants } from './src/main/ets/utils/basic/Constants';
export { DateUtils } from './src/main/ets/utils/basic/DateUtils';
export { FormatUtils } from './src/main/ets/utils/basic/FormatUtils';
export { MathUtils } from './src/main/ets/utils/basic/MathUtils';
export { StringUtils } from './src/main/ets/utils/basic/StringUtils';
export { TypeUtils } from './src/main/ets/utils/basic/TypeUtils';

// ========================================
// Utils - Device
// ========================================
export { DeviceUtils } from './src/main/ets/utils/device/DeviceUtils';
export { FileUtils } from './src/main/ets/utils/device/FileUtils';
export { PreferenceUtils } from './src/main/ets/utils/device/PreferenceUtils';
export { StorageUtils } from './src/main/ets/utils/device/StorageUtils';

// ========================================
// Utils - Network
// ========================================
export { EncryptionUtils } from './src/main/ets/utils/network/EncryptionUtils';
export { HttpMethod, HttpUtils } from './src/main/ets/utils/network/HttpUtils';
export { NetworkType, NetworkState, NetworkUtils } from './src/main/ets/utils/network/NetworkUtils';
export { PermissionStatus, PermissionUtils } from './src/main/ets/utils/network/PermissionUtils';

// ========================================
// Utils - Validation
// ========================================
export { ClipboardDataType, ClipboardUtils } from './src/main/ets/utils/validation/ClipboardUtils';
export { FormValidator } from './src/main/ets/utils/validation/FormValidator';
export { RandomUtils } from './src/main/ets/utils/validation/RandomUtils';
export { ValidationUtils } from './src/main/ets/utils/validation/ValidationUtils';

// ========================================
// Mock Data
// ========================================
export { BluetoothMockDataGenerator } from './src/main/ets/mock/BluetoothMockDataGenerator';
export { DeviceMockData } from './src/main/ets/mock/DeviceMockData';
export { ConnectionMockData } from './src/main/ets/mock/ConnectionMockData';
export { ProfileMockData } from './src/main/ets/mock/ProfileMockData';
