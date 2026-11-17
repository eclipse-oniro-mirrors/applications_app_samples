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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * version info interface
 */
export interface VersionInfo {
  major: number;
  minor: number;
  patch: number;
  versionString: string;
  versionCode: number;
}

/**
 * application-level constants class
 * specify meaning respond use in general constant amount value
 */
export class Constants {
  static readonly API_VERSION_MAJOR: number = 1;
  static readonly API_VERSION_MINOR: number = 0;
  static readonly API_VERSION_PATCH: number = 0;
  static readonly API_VERSION_STRING: string = Constants.API_VERSION_MAJOR + '.' +
    Constants.API_VERSION_MINOR + '.' + Constants.API_VERSION_PATCH;
  static readonly API_VERSION_CODE: number = 100;
  static readonly DEFAULT_PAGE_SIZE: number = 20;
  static readonly DEFAULT_TIMEOUT_MS: number = 30000;
  static readonly DEFAULT_RETRY_COUNT: number = 3;
  static readonly DEFAULT_ANIMATION_DURATION: number = 300;
  static readonly DEFAULT_FONT_SIZE: number = 14;
  static readonly DEFAULT_BORDER_RADIUS: number = 8;
  static readonly DEFAULT_SPACING: number = 12;
  static readonly DEFAULT_MAX_CACHE_SIZE: number = 100;
  static readonly DEFAULT_LOG_LEVEL: number = 2;
  static readonly MILLISECONDS_PER_SECOND: number = 1000;
  static readonly MILLISECONDS_PER_MINUTE: number = 60000;
  static readonly MILLISECONDS_PER_HOUR: number = 3600000;
  static readonly MILLISECONDS_PER_DAY: number = 86400000;
  static readonly MILLISECONDS_PER_WEEK: number = 604800000;
  static readonly SECONDS_PER_MINUTE: number = 60;
  static readonly SECONDS_PER_HOUR: number = 3600;
  static readonly SECONDS_PER_DAY: number = 86400;
  static readonly KB: number = 1024;
  static readonly MB: number = 1048576;
  static readonly GB: number = 1073741824;
  static readonly TB: number = 1099511627776;
  static readonly EMPTY_STRING: string = '';
  static readonly SPACE_STRING: string = ' ';
  static readonly NEWLINE: string = '\n';
  static readonly TAB: string = '\t';
  static readonly EMAIL_REGEX: string = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';
  static readonly PHONE_REGEX: string = '^1[3-9]\\d{9}$';
  static readonly URL_REGEX: string = '^https?:\\/\\/[\\w\\-]+(\\.[\\w\\-]+)+';
  static readonly MAC_ADDRESS_REGEX: string = '^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$';
  static readonly UUID_REGEX: string = '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$';
  static readonly BLUETOOTH_ADDRESS_REGEX: string = '^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$';

  /**
   * initialize constant amount class
   */
  static initialize(): void {
    hilog.info(DOMAIN, TAG, 'Constants initialized, API version: ' + Constants.API_VERSION_STRING);
  }

  /**
   * get complete whole API version this info info against object
   * @returns version this info info
   */
  static getVersionInfo(): VersionInfo {
    return {
      major: Constants.API_VERSION_MAJOR,
      minor: Constants.API_VERSION_MINOR,
      patch: Constants.API_VERSION_PATCH,
      versionString: Constants.API_VERSION_STRING,
      versionCode: Constants.API_VERSION_CODE,
    };
  }

  /**
   * validate email address format
   * @param email - mail box ground address
   * @returns whether valid
   */
  static isValidEmail(email: string): boolean {
    const regex: RegExp = new RegExp(Constants.EMAIL_REGEX);
    return regex.test(email);
  }

  /**
   * validate MAC address format
   * @param mac - MAC ground address
   * @returns whether valid
   */
  static isValidMacAddress(mac: string): boolean {
    const regex: RegExp = new RegExp(Constants.BLUETOOTH_ADDRESS_REGEX);
    return regex.test(mac);
  }

  /**
   * validate UUID format
   * @param uuid - UUID string
   * @returns whether valid
   */
  static isValidUuid(uuid: string): boolean {
    const regex: RegExp = new RegExp(Constants.UUID_REGEX);
    return regex.test(uuid);
  }
}
