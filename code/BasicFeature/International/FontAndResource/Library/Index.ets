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

// Export the font and resource facades that aggregate every library service.
export { FontResource, ResourceBridge } from './src/main/ets/fontresource/FontResource';
// Export the unified logging facade used across the library and the entry module.
export { Logger, LogLevel } from './src/main/ets/fontresource/utils/Logger';
// Export the trace facade wrapping hiTraceMeter with paired log output.
export { TraceUtil } from './src/main/ets/fontresource/utils/TraceUtil';
// Export the error code registry used to explain font error codes.
export { ErrorCodeMap } from './src/main/ets/fontresource/common/ErrorCodeMap';
// Export the reusable label-value row component.
export { InfoRow } from './src/main/ets/fontresource/components/InfoRow';
// Export the reusable section card component.
export { SectionCard } from './src/main/ets/fontresource/components/SectionCard';
// Export the reusable on-screen log panel component.
export { LogPanel } from './src/main/ets/fontresource/components/LogPanel';
// Export the on-screen log entry model and its list helpers.
export { LogEntry, appendLog, nowTimeText } from './src/main/ets/fontresource/model/LogTypes';
// Export the font domain models and the default asset factory.
export { FontAsset, CapabilityCheck, ErrorExplain, FontOperation,
  createDefaultFontAsset } from './src/main/ets/fontresource/model/FontTypes';
// Export the resource domain models and the failure summary factory.
export { ResourceCarrier, ResourceEntry, ResourceSummary, RoundTripResult,
  createFailureSummary } from './src/main/ets/fontresource/model/ResourceTypes';
// Export the string helper utility class.
export { StringUtils } from './src/main/ets/fontresource/utils/StringUtils';
// Export the date and time helper utility class.
export { DateUtils } from './src/main/ets/fontresource/utils/DateUtils';
// Export the number helper utility class.
export { NumberUtils } from './src/main/ets/fontresource/utils/NumberUtils';
// Export the sandbox file helper utility class.
export { FileUtils } from './src/main/ets/fontresource/utils/FileUtils';
// Export the device information utility class.
export { DeviceUtils } from './src/main/ets/fontresource/utils/DeviceUtils';
// Export the screen density and unit conversion utility class.
export { DisplayUtils } from './src/main/ets/fontresource/utils/DisplayUtils';
// Export the key-value storage utility class.
export { PreferencesUtil } from './src/main/ets/fontresource/utils/PreferencesUtil';
// Export the network connectivity utility class.
export { NetworkUtils } from './src/main/ets/fontresource/utils/NetworkUtils';
// Export the runtime permission utility class.
export { PermissionUtils } from './src/main/ets/fontresource/utils/PermissionUtils';
// Export the encoding and digest utility class.
export { EncryptUtils } from './src/main/ets/fontresource/utils/EncryptUtils';
// Export the input validation utility class.
export { ValidateUtils } from './src/main/ets/fontresource/utils/ValidateUtils';
// Export the random value utility class.
export { RandomUtils } from './src/main/ets/fontresource/utils/RandomUtils';
// Export the clipboard utility class.
export { ClipboardUtil } from './src/main/ets/fontresource/utils/ClipboardUtil';
// Export the font file service so tests can verify sandbox path resolution.
export { FontFileService } from './src/main/ets/fontresource/feature/FontFileService';
// Export the capability probe service so tests can verify the check rows.
export { CapabilityService } from './src/main/ets/fontresource/feature/CapabilityService';
// Export the font manager service so tests can verify install and explain routing.
export { FontManagerService } from './src/main/ets/fontresource/feature/FontManagerService';
// Export the preview registration service so tests can verify idempotent registration.
export { FontPreviewService } from './src/main/ets/fontresource/feature/FontPreviewService';
// Export the resource conversion service so tests can verify summary assembly.
export { ResourceConvertService } from './src/main/ets/fontresource/feature/ResourceConvertService';
// Export the worker conversion client for public API tests.
export { ResourceWorkerClient } from './src/main/ets/fontresource/feature/ResourceWorkerClient';
