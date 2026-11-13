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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// App-level constants class
// ========================================

/**
 * App-level constants class
 * Defines common constants for the application, including API versions, default values,
 * time units, byte units and regular expressions
 * All constants are static readonly properties that never change during the app lifecycle
 */
export class Constants {
  // ========================================
  // API version constants
  // ========================================

  /** API major version */
  static readonly API_VERSION_MAJOR: number = 1;

  /** API minor version */
  static readonly API_VERSION_MINOR: number = 0;

  /** API patch version */
  static readonly API_VERSION_PATCH: number = 0;

  /** Full API version string */
  static readonly API_VERSION_STRING: string = `${Constants.API_VERSION_MAJOR}.${Constants.API_VERSION_MINOR}.${Constants.API_VERSION_PATCH}`;

  /** Numeric API version identifier */
  static readonly API_VERSION_CODE: number = 100;

  // ========================================
  // Default value constants
  // ========================================

  /** Default page size */
  static readonly DEFAULT_PAGE_SIZE: number = 20;

  /** Default timeout (milliseconds) */
  static readonly DEFAULT_TIMEOUT_MS: number = 30000;

  /** Default retry count */
  static readonly DEFAULT_RETRY_COUNT: number = 3;

  /** Default animation duration (milliseconds) */
  static readonly DEFAULT_ANIMATION_DURATION: number = 300;

  /** Default font size */
  static readonly DEFAULT_FONT_SIZE: number = 14;

  /** Default border radius */
  static readonly DEFAULT_BORDER_RADIUS: number = 8;

  /** Default spacing */
  static readonly DEFAULT_SPACING: number = 12;

  /** Default maximum cache size */
  static readonly DEFAULT_MAX_CACHE_SIZE: number = 100;

  /** Default log level */
  static readonly DEFAULT_LOG_LEVEL: number = 2;

  // ========================================
  // Time unit constants (milliseconds)
  // ========================================

  /** Milliseconds per second */
  static readonly MILLISECONDS_PER_SECOND: number = 1000;

  /** Milliseconds per minute */
  static readonly MILLISECONDS_PER_MINUTE: number = 60000;

  /** Milliseconds per hour */
  static readonly MILLISECONDS_PER_HOUR: number = 3600000;

  /** Milliseconds per day */
  static readonly MILLISECONDS_PER_DAY: number = 86400000;

  /** Milliseconds per week */
  static readonly MILLISECONDS_PER_WEEK: number = 604800000;

  /** Seconds per minute */
  static readonly SECONDS_PER_MINUTE: number = 60;

  /** Seconds per hour */
  static readonly SECONDS_PER_HOUR: number = 3600;

  /** Seconds per day */
  static readonly SECONDS_PER_DAY: number = 86400;

  // ========================================
  // Byte unit constants
  // ========================================

  /** Bytes in 1 KB */
  static readonly KB: number = 1024;

  /** Bytes in 1 MB */
  static readonly MB: number = 1048576;

  /** Bytes in 1 GB */
  static readonly GB: number = 1073741824;

  /** Bytes in 1 TB */
  static readonly TB: number = 1099511627776;

  // ========================================
  // Empty string constants
  // ========================================

  /** Empty string */
  static readonly EMPTY_STRING: string = '';

  /** Space string */
  static readonly SPACE_STRING: string = ' ';

  /** Newline character */
  static readonly NEWLINE: string = '\n';

  /** Tab character */
  static readonly TAB: string = '\t';

  // ========================================
  // Common regular expressions
  // ========================================

  /** Email address regex */
  static readonly EMAIL_REGEX: string = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';

  /** Mobile phone number regex (mainland China) */
  static readonly PHONE_REGEX: string = '^1[3-9]\\d{9}$';

  /** URL regex */
  static readonly URL_REGEX: string = '^https?:\\/\\/[\\w\\-]+(\\.[\\w\\-]+)+([\\/\\w\\-._~:?#\\[\\]@!$&\'()*+,;=%]*)*$';

  /** ID card number regex */
  static readonly ID_CARD_REGEX: string = '^[1-9]\\d{5}(18|19|20)\\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\\d|3[01])\\d{3}[\\dXx]$';

  /** Chinese name regex */
  static readonly CHINESE_NAME_REGEX: string = '^[\\u4e00-\\u9fa5]{2,20}$';

  /** Password strength regex (at least 8 characters with upper/lowercase letters and digits) */
  static readonly PASSWORD_REGEX: string = '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d!@#$%^&*]{8,}$';

  /** IPv4 address regex */
  static readonly IPV4_REGEX: string = '^((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$';

  /** Pure numeric regex */
  static readonly NUMERIC_REGEX: string = '^\\d+$';

  /** Alphanumeric regex */
  static readonly ALPHANUMERIC_REGEX: string = '^[a-zA-Z0-9]+$';

  // ========================================
  // Initialization methods
  // ========================================

  /**
   * Initializes the constants class
   * Logs that constants loading is complete
   */
  static initialize(): void {
    hilog.info(DOMAIN, TAG, 'Constants initialized, apiVersion=%{public}s', Constants.API_VERSION_STRING);
  }

  /**
   * Gets the full API version info object
   * @returns Version info containing major, minor and patch numbers
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
   * Validates the email address format
   * @param email - Email address to validate
   * @returns Whether the email format is valid
   */
  static isValidEmail(email: string): boolean {
    const regex: RegExp = new RegExp(Constants.EMAIL_REGEX);
    return regex.test(email);
  }

  /**
   * Validates the mobile phone number format
   * @param phone - Phone number to validate
   * @returns Whether the phone number format is valid
   */
  static isValidPhone(phone: string): boolean {
    const regex: RegExp = new RegExp(Constants.PHONE_REGEX);
    return regex.test(phone);
  }

  /**
   * Validates the URL format
   * @param url - URL string to validate
   * @returns Whether the URL format is valid
   */
  static isValidUrl(url: string): boolean {
    const regex: RegExp = new RegExp(Constants.URL_REGEX);
    return regex.test(url);
  }
}

// ========================================
// Version info interface
// ========================================

/**
 * Version info interface
 * Defines the structure of API version information
 */
export interface VersionInfo {
  /** Major version */
  major: number;
  /** Minor version */
  minor: number;
  /** Patch version */
  patch: number;
  /** Version string */
  versionString: string;
  /** Numeric version code */
  versionCode: number;
}
