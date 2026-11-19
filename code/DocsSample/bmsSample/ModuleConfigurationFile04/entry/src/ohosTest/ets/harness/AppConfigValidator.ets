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

import {
  MAX_BUNDLE_NAME_LENGTH,
  MAX_BUNDLE_VENDOR_LENGTH,
  MAX_VERSION_CODE,
  MAX_VERSION_NAME_LENGTH
} from './ConfigConstants';
import type { AppConfig } from './ConfigModels';
import type { Finding } from './FindingTypes';
import { FindingUtils, Severity } from './FindingTypes';
import { NameUtils } from './NameUtils';
import { ResourceReference } from './ResourceReference';

/**
 * Validator for the app.json5 configuration content.
 */
export class AppConfigValidator {
  /**
   * Runs every app level validation rule.
   */
  public static validate(config: AppConfig): Finding[] {
    const findings: Finding[] = [];
    AppConfigValidator.append(findings, AppConfigValidator.validateBundleName(config));
    AppConfigValidator.append(findings, AppConfigValidator.validateVendor(config));
    AppConfigValidator.append(findings, AppConfigValidator.validateVersionCode(config));
    AppConfigValidator.append(findings, AppConfigValidator.validateVersionName(config));
    AppConfigValidator.append(findings, AppConfigValidator.validateIcon(config));
    AppConfigValidator.append(findings, AppConfigValidator.validateLabel(config));
    return findings;
  }

  /**
   * Validates the bundleName field.
   */
  public static validateBundleName(config: AppConfig): Finding[] {
    const findings: Finding[] = [];
    const value: string = config.bundleName;
    if (NameUtils.isBlank(value)) {
      findings.push(FindingUtils.create('APP_BUNDLE_NAME_EMPTY', Severity.ERROR, 'app.bundleName',
        'Bundle name must not be empty'));
      return findings;
    }
    const trimmed: string = value.trim();
    if (trimmed.length > MAX_BUNDLE_NAME_LENGTH) {
      findings.push(FindingUtils.create('APP_BUNDLE_NAME_TOO_LONG', Severity.ERROR, 'app.bundleName',
        'Bundle name exceeds the maximum length'));
    }
    if (NameUtils.hasUppercase(trimmed)) {
      findings.push(FindingUtils.create('APP_BUNDLE_NAME_UPPERCASE', Severity.ERROR, 'app.bundleName',
        'Bundle name must be lower case'));
    }
    if (NameUtils.hasWhitespace(trimmed)) {
      findings.push(FindingUtils.create('APP_BUNDLE_NAME_WHITESPACE', Severity.ERROR, 'app.bundleName',
        'Bundle name must not contain whitespace'));
    }
    if (NameUtils.startsWith(trimmed, '.') || NameUtils.endsWith(trimmed, '.')) {
      findings.push(FindingUtils.create('APP_BUNDLE_NAME_EMPTY_SEGMENT', Severity.ERROR, 'app.bundleName',
        'Bundle name must not start or end with a dot'));
    } else if (NameUtils.hasEmptySegment(trimmed, '.')) {
      findings.push(FindingUtils.create('APP_BUNDLE_NAME_EMPTY_SEGMENT', Severity.ERROR, 'app.bundleName',
        'Bundle name must not contain consecutive dots'));
    }
    if (!NameUtils.hasOnlyAllowedChars(trimmed, 'abcdefghijklmnopqrstuvwxyz0123456789._')) {
      findings.push(FindingUtils.create('APP_BUNDLE_NAME_ILLEGAL_CHAR', Severity.ERROR, 'app.bundleName',
        'Bundle name contains characters outside the supported set'));
    }
    const segments: string[] = NameUtils.splitRaw(trimmed, '.');
    if (segments.length < 2) {
      findings.push(FindingUtils.create('APP_BUNDLE_NAME_TOO_FEW_SEGMENTS', Severity.ERROR, 'app.bundleName',
        'Bundle name must contain at least two segments'));
    }
    for (let index: number = 0; index < segments.length; index++) {
      if (NameUtils.startsWithDigit(segments[index])) {
        findings.push(FindingUtils.create('APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT', Severity.ERROR,
          'app.bundleName', `Bundle name segment ${index} must not start with a digit`));
      }
    }
    return findings;
  }

  /**
   * Validates the vendor field.
   */
  public static validateVendor(config: AppConfig): Finding[] {
    const findings: Finding[] = [];
    const value: string = config.vendor;
    if (NameUtils.isBlank(value)) {
      findings.push(FindingUtils.create('APP_VENDOR_EMPTY', Severity.ERROR, 'app.vendor',
        'Vendor must not be empty'));
      return findings;
    }
    const trimmed: string = value.trim();
    if (trimmed.length > MAX_BUNDLE_VENDOR_LENGTH) {
      findings.push(FindingUtils.create('APP_VENDOR_TOO_LONG', Severity.ERROR, 'app.vendor',
        'Vendor exceeds the maximum length'));
    }
    if (!NameUtils.hasOnlyAllowedChars(trimmed, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 _-')) {
      findings.push(FindingUtils.create('APP_VENDOR_ILLEGAL_CHAR', Severity.ERROR, 'app.vendor',
        'Vendor contains unsupported characters'));
    }
    return findings;
  }

  /**
   * Validates the versionCode field.
   */
  public static validateVersionCode(config: AppConfig): Finding[] {
    const findings: Finding[] = [];
    const value: number = config.versionCode;
    if (!Number.isInteger(value)) {
      findings.push(FindingUtils.create('APP_VERSION_CODE_NOT_INTEGER', Severity.ERROR, 'app.versionCode',
        'Version code must be an integer'));
      return findings;
    }
    if (value <= 0) {
      findings.push(FindingUtils.create('APP_VERSION_CODE_NOT_POSITIVE', Severity.ERROR, 'app.versionCode',
        'Version code must be positive'));
    }
    if (value > MAX_VERSION_CODE) {
      findings.push(FindingUtils.create('APP_VERSION_CODE_OUT_OF_RANGE', Severity.ERROR, 'app.versionCode',
        'Version code exceeds the supported range'));
    }
    return findings;
  }

  /**
   * Validates the versionName field.
   */
  public static validateVersionName(config: AppConfig): Finding[] {
    const findings: Finding[] = [];
    const value: string = config.versionName;
    if (NameUtils.isBlank(value)) {
      findings.push(FindingUtils.create('APP_VERSION_NAME_EMPTY', Severity.ERROR, 'app.versionName',
        'Version name must not be empty'));
      return findings;
    }
    const trimmed: string = value.trim();
    if (trimmed.length > MAX_VERSION_NAME_LENGTH) {
      findings.push(FindingUtils.create('APP_VERSION_NAME_TOO_LONG', Severity.ERROR, 'app.versionName',
        'Version name exceeds the maximum length'));
    }
    const pattern: RegExp = new RegExp('^[0-9]+\\.[0-9]+\\.[0-9]+$');
    if (!pattern.test(trimmed)) {
      findings.push(FindingUtils.create('APP_VERSION_NAME_NOT_SEMVER', Severity.ERROR, 'app.versionName',
        'Version name must follow the major.minor.patch pattern'));
    }
    return findings;
  }

  /**
   * Validates the application icon reference.
   */
  public static validateIcon(config: AppConfig): Finding[] {
    return ResourceReference.validate(config.icon, 'media', 'app.icon');
  }

  /**
   * Validates the application label reference.
   */
  public static validateLabel(config: AppConfig): Finding[] {
    return ResourceReference.validate(config.label, 'string', 'app.label');
  }

  /**
   * Appends source findings into the destination list.
   */
  public static append(destination: Finding[], source: Finding[]): void {
    for (let index: number = 0; index < source.length; index++) {
      destination.push(source[index]);
    }
  }
}
