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

import { KNOWN_RESOURCE_KINDS } from './ConfigConstants';
import type { Finding } from './FindingTypes';
import { FindingUtils, Severity } from './FindingTypes';
import { NameUtils } from './NameUtils';

/**
 * Parsed representation of a resource reference such as $string:app_name.
 */
export interface ParsedResourceRef {
  valid: boolean;
  kind: string;
  name: string;
  raw: string;
}

/**
 * Validator for the resource references used by module.json5 and app.json5.
 */
export class ResourceReference {
  /**
   * Parses a raw resource reference into its kind and name parts.
   */
  public static parse(raw: string): ParsedResourceRef {
    const parsed: ParsedResourceRef = {
      valid: false,
      kind: '',
      name: '',
      raw: raw
    };
    if (raw.length === 0 || raw.trim().length === 0) {
      return parsed;
    }
    if (raw.substring(0, 1) !== '$') {
      return parsed;
    }
    const body: string = raw.substring(1);
    const separatorIndex: number = body.indexOf(':');
    if (separatorIndex < 0) {
      return parsed;
    }
    const kind: string = body.substring(0, separatorIndex);
    const name: string = body.substring(separatorIndex + 1);
    if (kind.length === 0 || name.length === 0) {
      return parsed;
    }
    if (KNOWN_RESOURCE_KINDS.indexOf(kind) < 0) {
      return parsed;
    }
    if (!NameUtils.isSegmentSafe(name)) {
      return parsed;
    }
    parsed.valid = true;
    parsed.kind = kind;
    parsed.name = name;
    return parsed;
  }

  /**
   * Returns true when the raw reference parses successfully.
   */
  public static isValid(raw: string): boolean {
    return ResourceReference.parse(raw).valid;
  }

  /**
   * Validates a resource reference and optionally checks the expected kind.
   */
  public static validate(raw: string, expectedKind: string, path: string): Finding[] {
    const findings: Finding[] = [];
    if (raw === undefined || raw === null) {
      findings.push(FindingUtils.create('RESOURCE_REF_EMPTY', Severity.ERROR, path,
        'Resource reference must not be null'));
      return findings;
    }
    if (raw.length === 0 || raw.trim().length === 0) {
      findings.push(FindingUtils.create('RESOURCE_REF_EMPTY', Severity.ERROR, path,
        'Resource reference must not be empty'));
      return findings;
    }
    if (raw !== raw.trim()) {
      findings.push(FindingUtils.create('RESOURCE_REF_WHITESPACE', Severity.ERROR, path,
        'Resource reference must not contain leading or trailing whitespace'));
    }
    const value: string = raw.trim();
    if (value.substring(0, 1) !== '$') {
      findings.push(FindingUtils.create('RESOURCE_REF_NO_DOLLAR', Severity.ERROR, path,
        'Resource reference must start with a dollar sign'));
      return findings;
    }
    const body: string = value.substring(1);
    const separatorIndex: number = body.indexOf(':');
    if (separatorIndex < 0) {
      findings.push(FindingUtils.create('RESOURCE_REF_NO_SEPARATOR', Severity.ERROR, path,
        'Resource reference must contain a kind separator'));
      return findings;
    }
    const kind: string = body.substring(0, separatorIndex);
    const name: string = body.substring(separatorIndex + 1);
    if (kind.length === 0) {
      findings.push(FindingUtils.create('RESOURCE_REF_EMPTY_KIND', Severity.ERROR, path,
        'Resource reference kind must not be empty'));
    } else if (KNOWN_RESOURCE_KINDS.indexOf(kind) < 0) {
      findings.push(FindingUtils.create('RESOURCE_REF_UNKNOWN_KIND', Severity.ERROR, path,
        `Resource reference kind ${kind} is not supported`));
    }
    if (name.length === 0) {
      findings.push(FindingUtils.create('RESOURCE_REF_EMPTY_NAME', Severity.ERROR, path,
        'Resource reference name must not be empty'));
    } else if (NameUtils.startsWithDigit(name)) {
      findings.push(FindingUtils.create('RESOURCE_REF_LEADING_DIGIT', Severity.ERROR, path,
        'Resource reference name must not start with a digit'));
    } else if (!NameUtils.isSegmentSafe(name)) {
      findings.push(FindingUtils.create('RESOURCE_REF_ILLEGAL_NAME', Severity.ERROR, path,
        'Resource reference name contains illegal characters'));
    }
    if (expectedKind.length > 0 && kind !== expectedKind) {
      findings.push(FindingUtils.create('RESOURCE_REF_KIND_MISMATCH', Severity.ERROR, path,
        `Resource reference kind ${kind} does not match the expected kind ${expectedKind}`));
    }
    return findings;
  }

  /**
   * Returns the kind of a raw reference, or an empty string when invalid.
   */
  public static kindOf(raw: string): string {
    return ResourceReference.parse(raw).kind;
  }

  /**
   * Returns the name of a raw reference, or an empty string when invalid.
   */
  public static nameOf(raw: string): string {
    return ResourceReference.parse(raw).name;
  }

  /**
   * Returns true when the reference kind matches the requested kind.
   */
  public static hasKind(raw: string, kind: string): boolean {
    return ResourceReference.parse(raw).kind === kind;
  }
}
