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
 * Parsed three segment semantic version value.
 */
export interface SemverValue {
  major: number;
  minor: number;
  patch: number;
}

/**
 * Parser and comparator for the versionName field of app.json5.
 */
export class SemverUtils {
  /**
   * Parses a version string of the form major.minor.patch.
   */
  public static parse(value: string): SemverValue | null {
    if (value.length === 0) {
      return null;
    }
    const pattern: RegExp = new RegExp('^(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)$');
    if (!pattern.test(value)) {
      return null;
    }
    const segments: string[] = value.split('.');
    const major: number = Number(segments[0]);
    const minor: number = Number(segments[1]);
    const patch: number = Number(segments[2]);
    if (!Number.isSafeInteger(major) || !Number.isSafeInteger(minor) || !Number.isSafeInteger(patch)) {
      return null;
    }
    const parsed: SemverValue = {
      major: major,
      minor: minor,
      patch: patch
    };
    return parsed;
  }

  /**
   * Returns true when the value can be parsed as a semantic version.
   */
  public static isValid(value: string): boolean {
    return SemverUtils.parse(value) !== null;
  }

  /**
   * Compares two version strings, returning -1, 0 or 1.
   */
  public static compare(left: string, right: string): number {
    const leftValue: SemverValue | null = SemverUtils.parse(left);
    const rightValue: SemverValue | null = SemverUtils.parse(right);
    if (leftValue === null || rightValue === null) {
      return 0;
    }
    if (leftValue.major !== rightValue.major) {
      return leftValue.major > rightValue.major ? 1 : -1;
    }
    if (leftValue.minor !== rightValue.minor) {
      return leftValue.minor > rightValue.minor ? 1 : -1;
    }
    if (leftValue.patch !== rightValue.patch) {
      return leftValue.patch > rightValue.patch ? 1 : -1;
    }
    return 0;
  }

  /**
   * Returns true when the left version is greater than the right version.
   */
  public static greaterThan(left: string, right: string): boolean {
    return SemverUtils.compare(left, right) > 0;
  }

  /**
   * Returns true when the left version is smaller than the right version.
   */
  public static lessThan(left: string, right: string): boolean {
    return SemverUtils.compare(left, right) < 0;
  }

  /**
   * Returns true when both versions are equal.
   */
  public static equal(left: string, right: string): boolean {
    return SemverUtils.compare(left, right) === 0;
  }

  /**
   * Returns true when the version is compatible with the target major version.
   */
  public static isCompatible(value: string, targetMajor: number): boolean {
    const parsed: SemverValue | null = SemverUtils.parse(value);
    if (parsed === null) {
      return false;
    }
    return parsed.major >= targetMajor;
  }

  /**
   * Returns true when the version has a zero major segment.
   */
  public static isMajorZero(value: string): boolean {
    const parsed: SemverValue | null = SemverUtils.parse(value);
    if (parsed === null) {
      return false;
    }
    return parsed.major === 0;
  }

  /**
   * Increases the major segment and resets the remaining segments.
   */
  public static increaseMajor(value: string): string {
    const parsed: SemverValue | null = SemverUtils.parse(value);
    if (parsed === null) {
      return '';
    }
    return `${parsed.major + 1}.0.0`;
  }

  /**
   * Increases the minor segment and resets the patch segment.
   */
  public static increaseMinor(value: string): string {
    const parsed: SemverValue | null = SemverUtils.parse(value);
    if (parsed === null) {
      return '';
    }
    return `${parsed.major}.${parsed.minor + 1}.0`;
  }

  /**
   * Increases the patch segment.
   */
  public static increasePatch(value: string): string {
    const parsed: SemverValue | null = SemverUtils.parse(value);
    if (parsed === null) {
      return '';
    }
    return `${parsed.major}.${parsed.minor}.${parsed.patch + 1}`;
  }

  /**
   * Returns the normalized text of a parsed version.
   */
  public static format(value: SemverValue): string {
    return `${value.major}.${value.minor}.${value.patch}`;
  }

  /**
   * Returns true when the version has a leading zero segment.
   */
  public static hasLeadingZero(value: string): boolean {
    const segments: string[] = value.split('.');
    for (let index: number = 0; index < segments.length; index++) {
      const segment: string = segments[index];
      if (segment.length > 1 && segment.substring(0, 1) === '0') {
        return true;
      }
    }
    return false;
  }

  /**
   * Returns the numeric value of the requested segment, or -1 when invalid.
   */
  public static segmentValue(value: string, segmentIndex: number): number {
    const parsed: SemverValue | null = SemverUtils.parse(value);
    if (parsed === null) {
      return -1;
    }
    if (segmentIndex === 0) {
      return parsed.major;
    }
    if (segmentIndex === 1) {
      return parsed.minor;
    }
    if (segmentIndex === 2) {
      return parsed.patch;
    }
    return -1;
  }
}
