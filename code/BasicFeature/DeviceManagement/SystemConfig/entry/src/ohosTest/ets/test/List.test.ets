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

// ========================================
// CustomConfig test suite
// ========================================
import CustomConfigGetChannelIdTest from './CustomConfig/CustomConfigGetChannelId.test';
import ChannelConfigModelTest from './CustomConfig/ChannelConfigModel.test';
import ChannelConfigModelExtendedTest from './CustomConfig/ChannelConfigModelExtended.test';
import CustomConfigPageUITest from './CustomConfig/CustomConfigPageUI.test';

// ========================================
// IntelligentScene test suite
// ========================================
import IntelligentSceneDndTest from './IntelligentScene/IntelligentSceneDnd.test';
import DoNotDisturbModelTest from './IntelligentScene/DoNotDisturbModel.test';
import DoNotDisturbModelExtendedTest from './IntelligentScene/DoNotDisturbModelExtended.test';
import IntelligentScenePageUITest from './IntelligentScene/IntelligentScenePageUI.test';

// ========================================
// SettingsLite test suite
// ========================================
import SettingsLitePinSettingTest from './SettingsLite/SettingsLitePinSetting.test';
import SettingsLiteNfcSettingTest from './SettingsLite/SettingsLiteNfcSetting.test';
import SettingsLiteDoubleClickTest from './SettingsLite/SettingsLiteDoubleClick.test';
import SettingsItemModelTest from './SettingsLite/SettingsItemModel.test';
import SettingsItemModelExtendedTest from './SettingsLite/SettingsItemModelExtended.test';
import SettingsLitePageUITest from './SettingsLite/SettingsLitePageUI.test';

// ========================================
// Validation test suite
// ========================================
import ValidateChannelIdTest from './Validation/ValidationChannelId.test';
import ValidateDeviceIdTest from './Validation/ValidationDeviceId.test';
import FormValidatorTest from './Validation/ValidationFormValidator.test';
import ValidationUtilsComprehensiveTest from './Validation/ValidationUtilsComprehensive.test';
import ClipboardUtilsTest from './Validation/ValidationClipboardUtils.test';
import ValidationUtilsMethodsTest from './Validation/ValidationUtilsMethods.test';

// ========================================
// Utils utility test suite
// ========================================
import UtilsStringUtilsTest from './Utils/UtilsStringUtils.test';
import UtilsMathUtilsTest from './Utils/UtilsMathUtils.test';
import UtilsDateUtilsTest from './Utils/UtilsDateUtils.test';
import UtilsFormatUtilsTest from './Utils/UtilsFormatUtils.test';
import UtilsTypeUtilsTest from './Utils/UtilsTypeUtils.test';
import UtilsCommonUtilsTest from './Utils/UtilsCommonUtils.test';
import UtilsRandomUtilsTest from './Utils/UtilsRandomUtils.test';
import UtilsLoggerTest from './Utils/UtilsLogger.test';
import UtilsConstantsTest from './Utils/UtilsConstants.test';
import BoundaryValueTest from './Utils/UtilsBoundaryValue.test';

// ========================================
// Service layer test suite (new)
// ========================================
import CustomConfigServiceTest from './Service/CustomConfigService.test';
import EventServiceTest from './Service/EventService.test';
import TraceServiceTest from './Service/TraceService.test';
import HistoryClearTest from './Service/HistoryClearTest.test';
import IntelligentSceneServiceTest from './Service/IntelligentSceneService.test';
import SettingsLiteServiceTest from './Service/SettingsLiteService.test';
import EventServiceExtendedTest from './Service/EventServiceExtended.test';
import TraceServiceExtendedTest from './Service/TraceServiceExtended.test';
import CustomConfigServiceExtendedTest from './Service/CustomConfigServiceExtended.test';
import IntelligentSceneServiceExtendedTest from './Service/IntelligentSceneServiceExtended.test';
import SettingsLiteServiceExtendedTest from './Service/SettingsLiteServiceExtended.test';
import SettingsLiteServiceOperationTest from './Service/SettingsLiteServiceOperation.test';

// ========================================
// Device utility test suite (new)
// ========================================
import DeviceUtilsTest from './Device/DeviceUtils.test';
import DeviceFileUtilsTest from './Device/DeviceFileUtils.test';
import DeviceStorageUtilsTest from './Device/DeviceStorageUtils.test';
import DevicePreferenceUtilsTest from './Device/DevicePreferenceUtils.test';

// ========================================
// Network utility test suite (new)
// ========================================
import EncryptionUtilsTest from './Network/EncryptionUtils.test';
import HttpUtilsTest from './Network/HttpUtils.test';
import NetworkUtilsTest from './Network/NetworkUtils.test';
import PermissionUtilsTest from './Network/PermissionUtils.test';

// ========================================
// Integration test suite (new)
// ========================================
import MultiServiceIntegrationTest from './Integration/MultiServiceIntegration.test';
import ErrorHandlingCombinationTest from './Integration/ErrorHandlingCombination.test';
import IntegrationExtendedTest from './Integration/MultiServiceIntegrationExtended.test';
import HomeNavigationUITest from './Integration/HomeNavigationUI.test';

/**
 * Test case list.
 * Aggregates and exports all test suites for the Hypium framework to load and run.
 */
export default function testsuite(): void {
  // CustomConfig tests
  CustomConfigGetChannelIdTest();
  ChannelConfigModelTest();
  ChannelConfigModelExtendedTest();
  
  // IntelligentScene tests
  IntelligentSceneDndTest();
  DoNotDisturbModelTest();
  DoNotDisturbModelExtendedTest();
  
  // SettingsLite tests
  SettingsLitePinSettingTest();
  SettingsLiteNfcSettingTest();
  SettingsLiteDoubleClickTest();
  SettingsItemModelTest();
  SettingsItemModelExtendedTest();
  
  // Validation tests
  ValidateChannelIdTest();
  ValidateDeviceIdTest();
  FormValidatorTest();
  ValidationUtilsComprehensiveTest();
  ClipboardUtilsTest();
  ValidationUtilsMethodsTest();
  
  // Utils utility tests
  UtilsStringUtilsTest();
  UtilsMathUtilsTest();
  UtilsDateUtilsTest();
  UtilsFormatUtilsTest();
  UtilsTypeUtilsTest();
  UtilsCommonUtilsTest();
  UtilsRandomUtilsTest();
  UtilsLoggerTest();
  UtilsConstantsTest();
  BoundaryValueTest();
  
  // Service layer tests
  CustomConfigServiceTest();
  EventServiceTest();
  TraceServiceTest();
  HistoryClearTest();
  IntelligentSceneServiceTest();
  SettingsLiteServiceTest();
  EventServiceExtendedTest();
  TraceServiceExtendedTest();
  CustomConfigServiceExtendedTest();
  IntelligentSceneServiceExtendedTest();
  SettingsLiteServiceExtendedTest();
  SettingsLiteServiceOperationTest();
  
  // Device utility tests
  DeviceUtilsTest();
  DeviceFileUtilsTest();
  DeviceStorageUtilsTest();
  DevicePreferenceUtilsTest();
  
  // Network utility tests
  EncryptionUtilsTest();
  HttpUtilsTest();
  NetworkUtilsTest();
  PermissionUtilsTest();
  
  // Integration tests
  MultiServiceIntegrationTest();
  ErrorHandlingCombinationTest();
  IntegrationExtendedTest();

  // Real page UI tests
  HomeNavigationUITest();
  CustomConfigPageUITest();
  IntelligentScenePageUITest();
  SettingsLitePageUITest();
}
