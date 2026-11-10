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
// Bluetooth Profile Manager Tests
// ========================================
import A2dpProfileManagerTest from './Bluetooth/A2dpProfileManager.test';
import HfpProfileManagerTest from './Bluetooth/HfpProfileManager.test';
import HidProfileManagerTest from './Bluetooth/HidProfileManager.test';
import PanProfileManagerTest from './Bluetooth/PanProfileManager.test';
import PbapProfileManagerTest from './Bluetooth/PbapProfileManager.test';
import MapProfileManagerTest from './Bluetooth/MapProfileManager.test';
import AvrcpProfileManagerTest from './Bluetooth/AvrcpProfileManager.test';
import HdpProfileManagerTest from './Bluetooth/HdpProfileManager.test';
import A2dpProfileControlTest from './Bluetooth/A2dpProfileControl.test';
import AvrcpProfileMediaTest from './Bluetooth/AvrcpProfileMedia.test';
import HdpProfileMeasureTest from './Bluetooth/HdpProfileMeasure.test';
import HfpProfileCallTest from './Bluetooth/HfpProfileCall.test';
import HidProfileInputTest from './Bluetooth/HidProfileInput.test';
import MapProfileMessageTest from './Bluetooth/MapProfileMessage.test';
import PanProfileNetworkTest from './Bluetooth/PanProfileNetwork.test';
import PbapProfilePhonebookTest from './Bluetooth/PbapProfilePhonebook.test';

// ========================================
// Service Tests
// ========================================
import A2dpServiceTest from './Service/A2dpService.test';
import HfpServiceTest from './Service/HfpService.test';
import HidServiceTest from './Service/HidService.test';
import PanServiceTest from './Service/PanService.test';
import PbapServiceTest from './Service/PbapService.test';
import MapServiceTest from './Service/MapService.test';
import AvrcpServiceTest from './Service/AvrcpService.test';
import HdpServiceTest from './Service/HdpService.test';
import BluetoothScanServiceTest from './Service/BluetoothScanService.test';
import ConnectionManagerTest from './Service/ConnectionManager.test';

// ========================================
// Constants Tests
// ========================================
import BluetoothConstantsTest from './Constants/BluetoothConstants.test';

// ========================================
// Utils Tests
// ========================================
import LoggerTest from './Utils/Logger.test';
import DateUtilsTest from './Utils/DateUtils.test';
import FormatUtilsTest from './Utils/FormatUtils.test';
import MathUtilsTest from './Utils/MathUtils.test';
import StringUtilsTest from './Utils/StringUtils.test';
import TypeUtilsTest from './Utils/TypeUtils.test';
import CommonUtilsTest from './Utils/CommonUtils.test';
import ConstantsTest from './Utils/Constants.test';

// ========================================
// Validation Tests
// ========================================
import FormValidatorTest from './Validation/FormValidator.test';
import ValidationUtilsTest from './Validation/ValidationUtils.test';
import ClipboardUtilsTest from './Validation/ClipboardUtils.test';
import RandomUtilsTest from './Validation/RandomUtils.test';

// ========================================
// Device Utils Tests
// ========================================
import DeviceUtilsTest from './Device/DeviceUtils.test';
import FileUtilsTest from './Device/FileUtils.test';
import PreferenceUtilsTest from './Device/PreferenceUtils.test';
import StorageUtilsTest from './Device/StorageUtils.test';

// ========================================
// Network Utils Tests
// ========================================
import EncryptionUtilsTest from './Network/EncryptionUtils.test';
import HttpUtilsTest from './Network/HttpUtils.test';
import NetworkUtilsTest from './Network/NetworkUtils.test';
import PermissionUtilsTest from './Network/PermissionUtils.test';

// ========================================
// Model Tests
// ========================================
import BluetoothDeviceModelTest from './Model/BluetoothDeviceModel.test';
import A2dpModelTest from './Model/A2dpModel.test';
import HfpModelTest from './Model/HfpModel.test';
import HidModelTest from './Model/HidModel.test';
import PanModelTest from './Model/PanModel.test';
import PbapModelTest from './Model/PbapModel.test';
import MapModelTest from './Model/MapModel.test';
import AvrcpModelTest from './Model/AvrcpModel.test';
import HdpModelTest from './Model/HdpModel.test';

// ========================================
// Integration Tests
// ========================================
import MultiProfileIntegrationTest from './Integration/MultiProfileIntegration.test';
import ErrorHandlingTest from './Integration/ErrorHandling.test';

/**
 * Test suite list.
 * Aggregates all test suites for the Hypium framework.
 */
export default function testsuite(): void {
  // Bluetooth Profile Manager Tests
  A2dpProfileManagerTest();
  HfpProfileManagerTest();
  HidProfileManagerTest();
  PanProfileManagerTest();
  PbapProfileManagerTest();
  MapProfileManagerTest();
  AvrcpProfileManagerTest();
  HdpProfileManagerTest();

  // Bluetooth Profile Specific Operation Tests
  A2dpProfileControlTest();
  AvrcpProfileMediaTest();
  HdpProfileMeasureTest();
  HfpProfileCallTest();
  HidProfileInputTest();
  MapProfileMessageTest();
  PanProfileNetworkTest();
  PbapProfilePhonebookTest();

  // Service Tests
  A2dpServiceTest();
  HfpServiceTest();
  HidServiceTest();
  PanServiceTest();
  PbapServiceTest();
  MapServiceTest();
  AvrcpServiceTest();
  HdpServiceTest();
  BluetoothScanServiceTest();
  ConnectionManagerTest();

  // Constants Tests
  BluetoothConstantsTest();

  // Utils Tests
  LoggerTest();
  DateUtilsTest();
  FormatUtilsTest();
  MathUtilsTest();
  StringUtilsTest();
  TypeUtilsTest();
  CommonUtilsTest();
  ConstantsTest();

  // Validation Tests
  FormValidatorTest();
  ValidationUtilsTest();
  ClipboardUtilsTest();
  RandomUtilsTest();

  // Device Utils Tests
  DeviceUtilsTest();
  FileUtilsTest();
  PreferenceUtilsTest();
  StorageUtilsTest();

  // Network Utils Tests
  EncryptionUtilsTest();
  HttpUtilsTest();
  NetworkUtilsTest();
  PermissionUtilsTest();

  // Model Tests
  BluetoothDeviceModelTest();
  A2dpModelTest();
  HfpModelTest();
  HidModelTest();
  PanModelTest();
  PbapModelTest();
  MapModelTest();
  AvrcpModelTest();
  HdpModelTest();

  // Integration Tests
  MultiProfileIntegrationTest();
  ErrorHandlingTest();
}
