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

// Public surface of the HAR; every symbol the HAP may import must be re-exported here.
// Feature layer: picker entry, access helpers and the image editing pipeline.
export { PhotoPickerFeature } from './src/main/ets/photopicker/PhotoPickerFeature';
// Reusable rounded thumbnail component rendered by the picker pages.
export { MediaThumb } from './src/main/ets/photopicker/components/MediaThumb';
// Colour matrix helpers used by the editor preview and the export pipeline.
export { ColorMatrixUtil } from './src/main/ets/photopicker/feature/ColorMatrixUtil';
// Factory that turns UI switches into picker options without leaking kit types.
export { PickerOptionFactory } from './src/main/ets/photopicker/feature/PickerOptionFactory';
// Data contracts shared between the HAR and the HAP; re-exported as a block because they are
// consumed together and keeping them listed once makes the dependency obvious.
export {
  MediaMeta,
  MediaFilterType,
  EditParams,
  EditOutcome,
  ProcessOutput,
  CacheFile,
  ExportResult
} from './src/main/ets/photopicker/feature/MediaModels';
// Media access helper covering media library queries and permission friendly reads.
export { PhotoAccessFeature } from './src/main/ets/photopicker/feature/PhotoAccessFeature';
// Image editing engine that decodes, transforms and re-encodes media.
export { ImageEditEngine } from './src/main/ets/photopicker/feature/ImageEditEngine';
// Sandbox storage helper that owns the cache directory used by the sample.
export { SandboxStore } from './src/main/ets/photopicker/feature/SandboxStore';
// Observability layer: logger and trace meter are part of the public contract because the HAP
// needs the very same tag and slice conventions as the HAR.
export { Logger } from './src/main/ets/utils/Logger';
// Trace wrapper around hiTraceMeter used on every key path of the sample.
export { Trace } from './src/main/ets/utils/Trace';
// Generic helpers; exported even when unused so downstream modules can reuse them directly.
export { StringUtils } from './src/main/ets/utils/StringUtils';
// Date and time formatting helpers with no dependency on the system locale database.
export { DateUtils } from './src/main/ets/utils/DateUtils';
// Array helpers that keep the call sites free of inline loops.
export { ArrayUtils } from './src/main/ets/utils/ArrayUtils';
// Object helpers limited to reflection free operations that ArkTS allows.
export { ObjectUtils } from './src/main/ets/utils/ObjectUtils';
// Numeric helpers covering clamping, parsing and human readable formatting.
export { NumberUtils } from './src/main/ets/utils/NumberUtils';
// Input validation helpers used before any value reaches a kit API.
export { ValidateUtils } from './src/main/ets/utils/ValidateUtils';
// Json helpers that degrade safely instead of throwing on malformed input.
export { JsonUtils } from './src/main/ets/utils/JsonUtils';
// File helpers wrapping @kit.CoreFileKit so call sites never handle raw file descriptors.
export { FileUtils } from './src/main/ets/utils/FileUtils';
// Device helpers exposing read only device properties.
export { DeviceUtils } from './src/main/ets/utils/DeviceUtils';
// Preferences helpers binding one context to the lightweight key value store.
export { PreferencesUtils } from './src/main/ets/utils/PreferencesUtils';
// Toast helpers wrapping promptAction to keep message duration consistent.
export { ToastUtils } from './src/main/ets/utils/ToastUtils';
// Throttle and debounce helpers keyed by a caller supplied string.
export { ThrottleUtils } from './src/main/ets/utils/ThrottleUtils';
// Random helpers used by sample data generation and by the tests.
export { RandomUtils } from './src/main/ets/utils/RandomUtils';
// Colour conversion helpers shared by the editor UI and the colour matrix util.
export { ColorUtils } from './src/main/ets/utils/ColorUtils';
