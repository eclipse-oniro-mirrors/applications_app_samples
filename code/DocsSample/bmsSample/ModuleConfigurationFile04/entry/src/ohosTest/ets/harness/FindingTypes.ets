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
 * Severity attached to a configuration finding.
 */
export enum Severity {
  INFO = 1,
  WARN = 2,
  ERROR = 3
}

/**
 * One configuration finding produced by a validator.
 */
export interface Finding {
  code: string;
  severity: Severity;
  path: string;
  message: string;
}

/**
 * Helpers shared by all validators and test suites.
 */
export class FindingUtils {
  /**
   * Creates an immutable finding record.
   */
  public static create(code: string, severity: Severity, path: string, message: string): Finding {
    const finding: Finding = {
      code: code,
      severity: severity,
      path: path,
      message: message
    };
    return finding;
  }

  /**
   * Returns true when the findings contain the requested code.
   */
  public static hasCode(findings: Finding[], code: string): boolean {
    for (let index: number = 0; index < findings.length; index++) {
      if (findings[index].code === code) {
        return true;
      }
    }
    return false;
  }

  /**
   * Returns all findings matching the requested code.
   */
  public static filterByCode(findings: Finding[], code: string): Finding[] {
    const matched: Finding[] = [];
    for (let index: number = 0; index < findings.length; index++) {
      if (findings[index].code === code) {
        matched.push(findings[index]);
      }
    }
    return matched;
  }

  /**
   * Returns all findings matching the requested severity.
   */
  public static filterBySeverity(findings: Finding[], severity: Severity): Finding[] {
    const matched: Finding[] = [];
    for (let index: number = 0; index < findings.length; index++) {
      if (findings[index].severity === severity) {
        matched.push(findings[index]);
      }
    }
    return matched;
  }

  /**
   * Counts findings that carry the requested code.
   */
  public static countCode(findings: Finding[], code: string): number {
    return FindingUtils.filterByCode(findings, code).length;
  }

  /**
   * Collects the distinct codes of the findings in first seen order.
   */
  public static codes(findings: Finding[]): string[] {
    const codes: string[] = [];
    for (let index: number = 0; index < findings.length; index++) {
      if (codes.indexOf(findings[index].code) < 0) {
        codes.push(findings[index].code);
      }
    }
    return codes;
  }

  /**
   * Collects the distinct paths of the findings in first seen order.
   */
  public static paths(findings: Finding[]): string[] {
    const paths: string[] = [];
    for (let index: number = 0; index < findings.length; index++) {
      if (paths.indexOf(findings[index].path) < 0) {
        paths.push(findings[index].path);
      }
    }
    return paths;
  }

  /**
   * Returns true when every finding exposes a code, a path and a message.
   */
  public static allWellFormed(findings: Finding[]): boolean {
    for (let index: number = 0; index < findings.length; index++) {
      const finding: Finding = findings[index];
      if (finding.code.length === 0 || finding.path.length === 0 || finding.message.length === 0) {
        return false;
      }
    }
    return true;
  }

  /**
   * Returns true when no two findings share the same code and path pair.
   */
  public static hasUniqueCodeAndPath(findings: Finding[]): boolean {
    const keys: string[] = [];
    for (let index: number = 0; index < findings.length; index++) {
      const key: string = `${findings[index].code}|${findings[index].path}`;
      if (keys.indexOf(key) >= 0) {
        return false;
      }
      keys.push(key);
    }
    return true;
  }

  /**
   * Sorts findings by severity descending and code ascending.
   */
  public static sort(findings: Finding[]): Finding[] {
    const sorted: Finding[] = findings.slice(0);
    sorted.sort((left: Finding, right: Finding): number => {
      if (left.severity !== right.severity) {
        return right.severity - left.severity;
      }
      if (left.code !== right.code) {
        return left.code.localeCompare(right.code);
      }
      return left.path.localeCompare(right.path);
    });
    return sorted;
  }

  /**
   * Returns the highest severity present in the findings.
   */
  public static maxSeverity(findings: Finding[]): Severity {
    let highest: Severity = Severity.INFO;
    for (let index: number = 0; index < findings.length; index++) {
      if (findings[index].severity > highest) {
        highest = findings[index].severity;
      }
    }
    return highest;
  }

  /**
   * Returns true when at least one finding is an error.
   */
  public static hasError(findings: Finding[]): boolean {
    return FindingUtils.filterBySeverity(findings, Severity.ERROR).length > 0;
  }

  /**
   * Returns true when at least one finding is a warning.
   */
  public static hasWarning(findings: Finding[]): boolean {
    return FindingUtils.filterBySeverity(findings, Severity.WARN).length > 0;
  }

  /**
   * Appends source findings into the destination list.
   */
  public static append(destination: Finding[], source: Finding[]): void {
    for (let index: number = 0; index < source.length; index++) {
      destination.push(source[index]);
    }
  }

  /**
   * Builds a stable textual signature for a finding.
   */
  public static signature(finding: Finding): string {
    return `${finding.severity}:${finding.code}:${finding.path}`;
  }

  /**
   * Joins the finding signatures of a list with a comma separator.
   */
  public static signatureList(findings: Finding[]): string {
    const parts: string[] = [];
    for (let index: number = 0; index < findings.length; index++) {
      parts.push(FindingUtils.signature(findings[index]));
    }
    return parts.join(',');
  }
}
