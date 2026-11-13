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

/**
 * System config sample constants.
 * Contains global constants related to logging, permissions and APIs.
 */
export class SystemConfigConstants {
  /** Log tag */
  static readonly TAG: string = '[Sample_SystemConfig]';
  /** Log domain */
  static readonly DOMAIN: number = 0xF811;
  /** Application bundleName */
  static readonly BUNDLE_NAME: string = 'com.samples.systemconfig';
  /** hiTraceMeter domain identifier */
  static readonly TRACE_DOMAIN: number = 0xF811;
  /** hiAppEvent domain identifier */
  static readonly EVENT_DOMAIN: number = 0xF811;
  /** hiAppEvent event group name */
  static readonly EVENT_GROUP: string = 'systemConfigEvent';
  /** Default channel id (value returned in the emulator environment) */
  static readonly DEFAULT_CHANNEL_ID: string = 'default';
  /** Do Not Disturb permission */
  static readonly PERMISSION_DND: string = 'ohos.permission.GET_DONOTDISTURB_STATE';
  /** Want action for the PIN settings page */
  static readonly SETTINGS_PIN_ACTION: string = 'action.settings.security';
  /** Want uri for the PIN settings page */
  static readonly SETTINGS_PIN_URI: string = 'systemui://security/pin';
  /** Want action for the NFC settings page */
  static readonly SETTINGS_NFC_ACTION: string = 'action.settings.nfc';
  /** Want uri for the NFC settings page */
  static readonly SETTINGS_NFC_URI: string = 'systemui://settings/nfc';
  /** Want action for the double-click settings page */
  static readonly SETTINGS_GESTURE_ACTION: string = 'action.settings.gesture';
  /** Want uri for the double-click settings page */
  static readonly SETTINGS_GESTURE_URI: string = 'systemui://settings/gesture';
  /** Error code - permission denied */
  static readonly ERROR_PERMISSION_DENIED: number = 201;
  /** Error code - internal error */
  static readonly ERROR_INTERNAL: number = 35200001;
  /** Maximum number of log entries */
  static readonly MAX_LOG_ENTRIES: number = 200;
  /** Maximum retry count */
  static readonly MAX_RETRY_COUNT: number = 3;
  /** Operation timeout (milliseconds) */
  static readonly OPERATION_TIMEOUT_MS: number = 10000;
  /** Status refresh interval (milliseconds) */
  static readonly REFRESH_INTERVAL_MS: number = 5000;
}
