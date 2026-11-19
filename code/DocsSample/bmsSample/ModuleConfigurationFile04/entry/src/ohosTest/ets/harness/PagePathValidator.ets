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

import { MAX_ABILITIES } from './ConfigConstants';
import type { Finding } from './FindingTypes';
import { FindingUtils, Severity } from './FindingTypes';
import { NameUtils } from './NameUtils';

/**
 * Validator for the page list stored in the main_pages profile.
 */
export class PagePathValidator {
  /**
   * Runs every page list validation rule.
   */
  public static validate(pages: string[]): Finding[] {
    const findings: Finding[] = [];
    if (pages.length === 0) {
      findings.push(FindingUtils.create('PAGES_LIST_EMPTY', Severity.ERROR, 'pages',
        'Page list must not be empty'));
      return findings;
    }
    if (pages.length > MAX_ABILITIES) {
      findings.push(FindingUtils.create('PAGES_LIST_TOO_MANY', Severity.WARN, 'pages',
        'Page list contains more entries than the recommended limit'));
    }
    const seen: string[] = [];
    for (let index: number = 0; index < pages.length; index++) {
      FindingUtils.append(findings, PagePathValidator.validateOne(pages[index], index));
      if (seen.indexOf(pages[index]) >= 0) {
        findings.push(FindingUtils.create('PAGES_LIST_DUPLICATE', Severity.ERROR, `pages[${index}]`,
          `Page ${pages[index]} is declared more than once`));
      } else {
        seen.push(pages[index]);
      }
    }
    return findings;
  }

  /**
   * Validates one page path.
   */
  public static validateOne(page: string, index: number): Finding[] {
    const findings: Finding[] = [];
    const path: string = `pages[${index}]`;
    if (NameUtils.isBlank(page)) {
      findings.push(FindingUtils.create('PAGES_LIST_BLANK', Severity.ERROR, path, 'Page path must not be blank'));
      return findings;
    }
    if (NameUtils.hasWhitespace(page)) {
      findings.push(FindingUtils.create('PAGES_LIST_WHITESPACE', Severity.ERROR, path,
        'Page path must not contain whitespace'));
    }
    if (NameUtils.contains(page, '..')) {
      findings.push(FindingUtils.create('PAGES_LIST_TRAVERSAL', Severity.ERROR, path,
        'Page path must not contain parent directory traversal'));
    }
    if (NameUtils.contains(page, '\\')) {
      findings.push(FindingUtils.create('PAGES_LIST_BACKSLASH', Severity.ERROR, path,
        'Page path must use forward slashes'));
    }
    if (NameUtils.startsWith(page, '/')) {
      findings.push(FindingUtils.create('PAGES_LIST_LEADING_SLASH', Severity.ERROR, path,
        'Page path must be relative'));
    }
    if (!NameUtils.startsWith(page, 'pages/')) {
      findings.push(FindingUtils.create('PAGES_LIST_DIR_PREFIX', Severity.WARN, path,
        'Page path should be located under the pages directory'));
    }
    if (NameUtils.endsWith(page, '.ets')) {
      findings.push(FindingUtils.create('PAGES_LIST_EXTENSION', Severity.ERROR, path,
        'Page path must not contain the file extension'));
    }
    return findings;
  }

  /**
   * Returns true when the page list contains the requested path.
   */
  public static containsPage(pages: string[], page: string): boolean {
    return pages.indexOf(page) >= 0;
  }

  /**
   * Returns the duplicate entries of a page list.
   */
  public static duplicates(pages: string[]): string[] {
    const duplicates: string[] = [];
    for (let index: number = 0; index < pages.length; index++) {
      if (pages.indexOf(pages[index]) !== index && duplicates.indexOf(pages[index]) < 0) {
        duplicates.push(pages[index]);
      }
    }
    return duplicates;
  }

  /**
   * Returns the normalized page list without the file extensions.
   */
  public static normalize(pages: string[]): string[] {
    const normalized: string[] = [];
    for (let index: number = 0; index < pages.length; index++) {
      let page: string = pages[index].trim();
      if (NameUtils.endsWith(page, '.ets')) {
        page = page.substring(0, page.length - 4);
      }
      normalized.push(page);
    }
    return normalized;
  }

  /**
   * Returns the paths that are located outside the pages directory.
   */
  public static outsidePagesDir(pages: string[]): string[] {
    const outside: string[] = [];
    for (let index: number = 0; index < pages.length; index++) {
      if (!NameUtils.startsWith(pages[index], 'pages/')) {
        outside.push(pages[index]);
      }
    }
    return outside;
  }

  /**
   * Returns true when the page list has no duplicates.
   */
  public static hasUniquePages(pages: string[]): boolean {
    return PagePathValidator.duplicates(pages).length === 0;
  }
}
