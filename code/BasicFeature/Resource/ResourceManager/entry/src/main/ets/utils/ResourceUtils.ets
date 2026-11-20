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

import { resourceManager } from '@kit.LocalizationKit';

/**
 * Resource related pure helpers.
 *
 * Every method is a stateless static function that neither touches Context nor
 * ResourceManager, so the rules can be verified directly from ohosTest without
 * an ability context.
 */
export class ResourceUtils {
  /** Screen density buckets that the system ships pre-built media for. */
  public static readonly DENSITY_BUCKETS: number[] = [120, 160, 240, 320, 480, 640];
  /** Fallback bucket used when the requested density is not a positive integer. */
  public static readonly DEFAULT_DENSITY: number = 320;
  /** Baseline density used to turn a bucket into a scale factor. */
  public static readonly BASE_DENSITY: number = 160;
  /** Raw bytes carried by one base64 group. */
  public static readonly BASE64_GROUP_BYTES: number = 3;
  /** Characters produced by one base64 group. */
  public static readonly BASE64_GROUP_CHARS: number = 4;
  /** Maximum length kept by sanitizeWorld before ellipsis is appended. */
  public static readonly WORLD_MAX_LENGTH: number = 16;
  /** Replacement used when the placeholder word is empty or blank. */
  public static readonly DEFAULT_WORLD: string = 'world';
  /** Marker used by resourceKey when a field is missing. */
  public static readonly MISSING_FIELD: string = '-';

  private static readonly KB: number = 1024;
  private static readonly MB: number = 1024 * 1024;

  /**
   * Maps any density request onto the nearest bucket that is not greater than it,
   * clamped into [120, 640]. Non positive or non integer input falls back to
   * DEFAULT_DENSITY.
   */
  static normalizeDensity(density: number): number {
    if (!Number.isInteger(density) || density <= 0) {
      return ResourceUtils.DEFAULT_DENSITY;
    }
    if (density <= ResourceUtils.DENSITY_BUCKETS[0]) {
      return ResourceUtils.DENSITY_BUCKETS[0];
    }
    let chosen: number = ResourceUtils.DENSITY_BUCKETS[0];
    for (let index: number = 0; index < ResourceUtils.DENSITY_BUCKETS.length; index++) {
      if (ResourceUtils.DENSITY_BUCKETS[index] <= density) {
        chosen = ResourceUtils.DENSITY_BUCKETS[index];
      }
    }
    return chosen;
  }

  /** True only when the exact bucket exists, i.e. normalizeDensity is an identity. */
  static isDensitySupported(density: number): boolean {
    return ResourceUtils.DENSITY_BUCKETS.indexOf(density) !== -1;
  }

  /** Scale factor of a normalized bucket against BASE_DENSITY. */
  static densityToScale(density: number): number {
    return ResourceUtils.normalizeDensity(density) / ResourceUtils.BASE_DENSITY;
  }

  /** Human readable size with exactly one fractional digit above 1 KB. */
  static formatByteSize(bytes: number): string {
    if (!Number.isInteger(bytes) || bytes <= 0) {
      return '0 B';
    }
    if (bytes < ResourceUtils.KB) {
      return `${bytes} B`;
    }
    let divisor: number = ResourceUtils.KB;
    let unit: string = 'KB';
    if (bytes >= ResourceUtils.MB) {
      divisor = ResourceUtils.MB;
      unit = 'MB';
    }
    const tenths: number = Math.floor(bytes * 10 / divisor);
    return `${Math.floor(tenths / 10)}.${tenths % 10} ${unit}`;
  }

  /** Encoded length of a media payload: 4 characters per 3 bytes, padded. */
  static expectedBase64Length(byteLength: number): number {
    if (!Number.isInteger(byteLength) || byteLength <= 0) {
      return 0;
    }
    const groups: number = Math.ceil(byteLength / ResourceUtils.BASE64_GROUP_BYTES);
    return groups * ResourceUtils.BASE64_GROUP_CHARS;
  }

  /** Inverse of expectedBase64Length, returns -1 when the input is not base64 shaped. */
  static decodedByteLength(base64: string): number {
    if (!base64 || base64.length % ResourceUtils.BASE64_GROUP_CHARS !== 0) {
      return -1;
    }
    let padding: number = 0;
    if (base64.endsWith('==')) {
      padding = 2;
    } else if (base64.endsWith('=')) {
      padding = 1;
    }
    return base64.length / ResourceUtils.BASE64_GROUP_CHARS * ResourceUtils.BASE64_GROUP_BYTES - padding;
  }

  /** Plural category the sample relies on: zero / one / other, invalid for bad input. */
  static pluralBranchOf(num: number): string {
    if (!ResourceUtils.isValidPluralNum(num)) {
      return 'invalid';
    }
    if (num === 0) {
      return 'zero';
    }
    if (num === 1) {
      return 'one';
    }
    return 'other';
  }

  /** Plural quantity must be a non negative integer. */
  static isValidPluralNum(num: number): boolean {
    return Number.isInteger(num) && num >= 0;
  }

  /** Trims the placeholder word, keeps at most WORLD_MAX_LENGTH chars, never empty. */
  static sanitizeWorld(world: string): string {
    if (!world) {
      return ResourceUtils.DEFAULT_WORLD;
    }
    const trimmed: string = world.trim();
    if (trimmed.length === 0) {
      return ResourceUtils.DEFAULT_WORLD;
    }
    if (trimmed.length > ResourceUtils.WORLD_MAX_LENGTH) {
      return `${trimmed.substring(0, ResourceUtils.WORLD_MAX_LENGTH)}...`;
    }
    return trimmed;
  }

  /** Stable identity of a resource triple. */
  static resourceKey(resource: resourceManager.Resource): string {
    const bundle: string = resource.bundleName ? resource.bundleName : ResourceUtils.MISSING_FIELD;
    const module: string = resource.moduleName ? resource.moduleName : ResourceUtils.MISSING_FIELD;
    return `${bundle}:${module}:${resource.id}`;
  }

  /** True when both triples address the same resource. */
  static isSameResource(left: resourceManager.Resource, right: resourceManager.Resource): boolean {
    return ResourceUtils.resourceKey(left) === ResourceUtils.resourceKey(right);
  }
}
