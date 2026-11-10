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
// CustomConfig 测试套件
// ========================================
import CustomConfigGetChannelIdTest from './CustomConfig/CustomConfigGetChannelId.test';
import ChannelConfigModelTest from './CustomConfig/ChannelConfigModel.test';
import ChannelConfigModelExtendedTest from './CustomConfig/ChannelConfigModelExtended.test';
import CustomConfigPageUITest from './CustomConfig/CustomConfigPageUI.test';

// ========================================
// IntelligentScene 测试套件
// ========================================
import IntelligentSceneDndTest from './IntelligentScene/IntelligentSceneDnd.test';
import DoNotDisturbModelTest from './IntelligentScene/DoNotDisturbModel.test';
import DoNotDisturbModelExtendedTest from './IntelligentScene/DoNotDisturbModelExtended.test';
import IntelligentScenePageUITest from './IntelligentScene/IntelligentScenePageUI.test';

// ========================================
// SettingsLite 测试套件
// ========================================
import SettingsLitePinSettingTest from './SettingsLite/SettingsLitePinSetting.test';
import SettingsLiteNfcSettingTest from './SettingsLite/SettingsLiteNfcSetting.test';
import SettingsLiteDoubleClickTest from './SettingsLite/SettingsLiteDoubleClick.test';
import SettingsItemModelTest from './SettingsLite/SettingsItemModel.test';
import SettingsItemModelExtendedTest from './SettingsLite/SettingsItemModelExtended.test';
import SettingsLitePageUITest from './SettingsLite/SettingsLitePageUI.test';

// ========================================
// Validation 测试套件
// ========================================
import ValidateChannelIdTest from './Validation/ValidationChannelId.test';
import ValidateDeviceIdTest from './Validation/ValidationDeviceId.test';
import FormValidatorTest from './Validation/ValidationFormValidator.test';
import ValidationUtilsComprehensiveTest from './Validation/ValidationUtilsComprehensive.test';
import ClipboardUtilsTest from './Validation/ValidationClipboardUtils.test';
import ValidationUtilsMethodsTest from './Validation/ValidationUtilsMethods.test';

// ========================================
// Utils 工具类测试套件
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
// Service 服务层测试套件（新增）
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
// Device 设备工具测试套件（新增）
// ========================================
import DeviceUtilsTest from './Device/DeviceUtils.test';
import DeviceFileUtilsTest from './Device/DeviceFileUtils.test';
import DeviceStorageUtilsTest from './Device/DeviceStorageUtils.test';
import DevicePreferenceUtilsTest from './Device/DevicePreferenceUtils.test';

// ========================================
// Network 网络工具测试套件（新增）
// ========================================
import EncryptionUtilsTest from './Network/EncryptionUtils.test';
import HttpUtilsTest from './Network/HttpUtils.test';
import NetworkUtilsTest from './Network/NetworkUtils.test';
import PermissionUtilsTest from './Network/PermissionUtils.test';

// ========================================
// Integration 集成测试套件（新增）
// ========================================
import MultiServiceIntegrationTest from './Integration/MultiServiceIntegration.test';
import ErrorHandlingCombinationTest from './Integration/ErrorHandlingCombination.test';
import IntegrationExtendedTest from './Integration/MultiServiceIntegrationExtended.test';
import HomeNavigationUITest from './Integration/HomeNavigationUI.test';

/**
 * 测试用例列表。
 * 汇总所有测试套件并导出，供 Hypium 框架加载执行。
 */
export default function testsuite(): void {
  // CustomConfig 测试
  CustomConfigGetChannelIdTest();
  ChannelConfigModelTest();
  ChannelConfigModelExtendedTest();
  
  // IntelligentScene 测试
  IntelligentSceneDndTest();
  DoNotDisturbModelTest();
  DoNotDisturbModelExtendedTest();
  
  // SettingsLite 测试
  SettingsLitePinSettingTest();
  SettingsLiteNfcSettingTest();
  SettingsLiteDoubleClickTest();
  SettingsItemModelTest();
  SettingsItemModelExtendedTest();
  
  // Validation 测试
  ValidateChannelIdTest();
  ValidateDeviceIdTest();
  FormValidatorTest();
  ValidationUtilsComprehensiveTest();
  ClipboardUtilsTest();
  ValidationUtilsMethodsTest();
  
  // Utils 工具类测试
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
  
  // Service 服务层测试
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
  
  // Device 设备工具测试
  DeviceUtilsTest();
  DeviceFileUtilsTest();
  DeviceStorageUtilsTest();
  DevicePreferenceUtilsTest();
  
  // Network 网络工具测试
  EncryptionUtilsTest();
  HttpUtilsTest();
  NetworkUtilsTest();
  PermissionUtilsTest();
  
  // Integration 集成测试
  MultiServiceIntegrationTest();
  ErrorHandlingCombinationTest();
  IntegrationExtendedTest();

  // 真实页面 UI 测试
  HomeNavigationUITest();
  CustomConfigPageUITest();
  IntelligentScenePageUITest();
  SettingsLitePageUITest();
}
