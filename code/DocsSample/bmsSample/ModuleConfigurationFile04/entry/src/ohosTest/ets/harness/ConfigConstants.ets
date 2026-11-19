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

export const KNOWN_DEVICE_TYPES: string[] = ['default', 'phone', 'tablet', '2in1', 'tv', 'wearable', 'car'];
export const KNOWN_MODULE_TYPES: string[] = ['entry', 'feature', 'shared'];
export const KNOWN_LAUNCH_TYPES: string[] = ['singleton', 'multiton', 'specified'];
export const KNOWN_ORIENTATIONS: string[] = [
  'unspecified',
  'landscape',
  'portrait',
  'follow_recent',
  'landscape_inverted',
  'portrait_inverted',
  'auto_rotation',
  'auto_rotation_restricted',
  'auto_rotation_landscape',
  'auto_rotation_portrait'
];
export const KNOWN_RESOURCE_KINDS: string[] = [
  'string',
  'media',
  'color',
  'profile',
  'float',
  'plural',
  'boolean',
  'integer',
  'pattern'
];
export const RESERVED_MODULE_NAMES: string[] = ['app', 'application', 'system'];
export const HOME_ENTITY: string = 'entity.system.home';
export const HOME_ACTION: string = 'ohos.want.action.home';
export const MAX_BUNDLE_NAME_LENGTH: number = 128;
export const MAX_BUNDLE_VENDOR_LENGTH: number = 64;
export const MAX_VERSION_NAME_LENGTH: number = 64;
export const MAX_MODULE_NAME_LENGTH: number = 32;
export const MAX_ABILITY_NAME_LENGTH: number = 128;
export const MAX_PROFILE_NAME_LENGTH: number = 64;
export const MAX_DEVICE_TYPES: number = 8;
export const MAX_MODULES: number = 50;
export const MAX_ABILITIES: number = 100;
export const MAX_PRELOADS: number = 20;
export const MAX_VERSION_CODE: number = 2147483647;
export const MIN_VERSION_CODE: number = 1;
export const DEFAULT_PROFILE_REF: string = '$profile:main_pages';
export const ENTRY_MODULE_NAME: string = 'entry';
export const FEATURE_MODULE_NAME: string = 'feature';
export const ENTRY_ABILITY_NAME: string = 'EntryAbility';
export const FEATURE_ABILITY_NAME: string = 'FeatureAbility';
export const SAMPLE_BUNDLE_NAME: string = 'com.example.moduleconfigurationfile04';
export const SAMPLE_VENDOR: string = 'example';
export const SAMPLE_VERSION_NAME: string = '1.0.0';
export const SAMPLE_VERSION_CODE: number = 1000000;
export const SRC_ENTRY_PREFIX: string = './ets/';
export const SRC_ENTRY_SUFFIX: string = '.ets';
export const DEVICE_TYPE_TABLET: string = 'tablet';
export const DEVICE_TYPE_PHONE: string = 'phone';
export const MODULE_TYPE_ENTRY: string = 'entry';
export const MODULE_TYPE_FEATURE: string = 'feature';
export const MODULE_TYPE_SHARED: string = 'shared';
