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
// Constants
// ========================================
export { SystemConfigConstants } from './src/main/ets/constants/SystemConfigConstants';
export { PageConstants } from './src/main/ets/constants/PageConstants';

// ========================================
// Models
// ========================================
export { ChannelConfigStatus, ChannelConfigModel } from './src/main/ets/model/ChannelConfigModel';
export type { ChannelConfigJson } from './src/main/ets/model/ChannelConfigModel';
export { DoNotDisturbStatus, DoNotDisturbModel } from './src/main/ets/model/DoNotDisturbModel';
export type { DoNotDisturbModelJson } from './src/main/ets/model/DoNotDisturbModel';
export {
  SettingsItemType,
  SettingsOperationStatus,
  ClickResult,
  SettingsItemModel
} from './src/main/ets/model/SettingsItemModel';
export type { ClickCallback, SettingsItemModelJson } from './src/main/ets/model/SettingsItemModel';

// ========================================
// Services
// ========================================
export { CustomConfigService } from './src/main/ets/service/CustomConfigService';
export { IntelligentSceneService } from './src/main/ets/service/IntelligentSceneService';
export { SettingsLiteService } from './src/main/ets/service/SettingsLiteService';
export { TraceName, TraceService } from './src/main/ets/service/TraceService';
export { EventTypeName, EventService } from './src/main/ets/service/EventService';
export type { EventFilter, EventStatistics, EventListener, EventHistoryRecord } from './src/main/ets/service/EventService';

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
export type { PreferenceChangeListener } from './src/main/ets/utils/device/PreferenceUtils';
export { StorageUtils } from './src/main/ets/utils/device/StorageUtils';

// ========================================
// Utils - Network
// ========================================
export { EncryptionUtils } from './src/main/ets/utils/network/EncryptionUtils';
export { HttpMethod, HttpUtils } from './src/main/ets/utils/network/HttpUtils';
export type { HttpResponse, HttpRequestConfig, RequestInterceptor, ResponseInterceptor } from './src/main/ets/utils/network/HttpUtils';
export { NetworkType, NetworkState, NetworkUtils } from './src/main/ets/utils/network/NetworkUtils';
export type { NetworkCallback } from './src/main/ets/utils/network/NetworkUtils';
export { PermissionStatus, PermissionUtils } from './src/main/ets/utils/network/PermissionUtils';
export type { PermissionResultCallback, PermissionRequestCallback } from './src/main/ets/utils/network/PermissionUtils';

// ========================================
// Utils - Validation
// ========================================
export { ClipboardDataType, ClipboardUtils } from './src/main/ets/utils/validation/ClipboardUtils';
export type { ClipboardChangeListener } from './src/main/ets/utils/validation/ClipboardUtils';
export { FormValidator } from './src/main/ets/utils/validation/FormValidator';
export type { FormValidationResult, FieldRule } from './src/main/ets/utils/validation/FormValidator';
export { RandomUtils } from './src/main/ets/utils/validation/RandomUtils';
export { ValidationUtils } from './src/main/ets/utils/validation/ValidationUtils';
export type { ValidationResult } from './src/main/ets/utils/validation/ValidationUtils';
