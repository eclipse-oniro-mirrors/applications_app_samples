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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  serializedDelay,
  ensureHomePage,
  backToHome,
  waitForAnyText,
  checkTextContent,
  componentCount,
  TIMEOUT_PAGE_RENDER,
  TEXT_CREATE_ISSUE_CANDIDATES,
  TEXT_ISSUE_LIST_CANDIDATES,
  TEXT_INTRODUCTION_CANDIDATES,
  TEXT_ATTACHMENT_CANDIDATES
} from '../Shared/BetaClubDriver';

const LOCALE_ZH: string = 'zh_CN';

const LOCALE_EN: string = 'en_US';

const LOCALE_BASE: string = 'base';

const KEY_CREATE: string = 'create_a_new_questionnaire';

const KEY_LIST: string = 'list_of_questions';

const KEY_INSTRUCTIONS: string = 'instructions';

const KEY_SUBMIT: string = 'submit';

const KEY_ATTACHMENT: string = 'attachment';

// Chinese resource values expressed as escapes to keep the file ASCII safe
const ZH_CREATE: string = '\u65b0\u5efa\u95ee\u9898\u5355';

const ZH_LIST: string = '\u95ee\u9898\u5355\u5217\u8868';

const ZH_INSTRUCTIONS: string = '\u4f7f\u7528\u8bf4\u660e';

const ZH_SUBMIT: string = '\u63d0\u4ea4';

const ZH_ATTACHMENT: string = '\u9644\u4ef6';

const EN_CREATE: string = 'create a new questionnaire';

const EN_LIST: string = 'list of questions';

const EN_INSTRUCTIONS: string = 'instructions';

const EN_SUBMIT: string = 'submit';

const EN_ATTACHMENT: string = 'attachment';

interface LocaleEntry {
  key: string;
  value: string;
}

// Normalizes system language tags to resource qualifiers
class LocaleResolver {
  public static normalize(languageTag: string): string {
    if (languageTag.length === 0) {
      return LOCALE_BASE;
    }
    const lower = languageTag.toLowerCase();
    if (lower.startsWith('zh')) {
      return LOCALE_ZH;
    }
    if (lower.startsWith('en')) {
      return LOCALE_EN;
    }
    return LOCALE_BASE;
  }

  public static fallbackChain(qualifier: string): string[] {
    if (qualifier === LOCALE_ZH) {
      return [LOCALE_ZH, LOCALE_BASE];
    }
    if (qualifier === LOCALE_EN) {
      return [LOCALE_EN, LOCALE_BASE];
    }
    return [LOCALE_BASE];
  }

  public static isSupported(qualifier: string): boolean {
    return qualifier === LOCALE_ZH || qualifier === LOCALE_EN || qualifier === LOCALE_BASE;
  }

  public static directionOf(qualifier: string): string {
    return qualifier === LOCALE_ZH ? 'ltr' : 'ltr';
  }
}

// Resolves localized strings with qualifier fallback
class StringCatalog {
  private entries: Map<string, Map<string, string>> = new Map<string, Map<string, string>>();

  public add(qualifier: string, key: string, value: string): boolean {
    if (qualifier.length === 0 || key.length === 0) {
      return false;
    }
    let bucket = this.entries.get(qualifier);
    if (bucket === undefined) {
      bucket = new Map<string, string>();
      this.entries.set(qualifier, bucket);
    }
    bucket.set(key, value);
    return true;
  }

  public get(qualifier: string, key: string): string {
    const chain = LocaleResolver.fallbackChain(qualifier);
    for (let i = 0; i < chain.length; i++) {
      const bucket = this.entries.get(chain[i]);
      if (bucket !== undefined) {
        const value = bucket.get(key);
        if (value !== undefined) {
          return value;
        }
      }
    }
    return '';
  }

  public has(qualifier: string, key: string): boolean {
    return this.get(qualifier, key).length > 0;
  }

  public keyCount(qualifier: string): number {
    const bucket = this.entries.get(qualifier);
    return bucket === undefined ? 0 : bucket.size;
  }

  public qualifiers(): string[] {
    const result: string[] = [];
    this.entries.forEach((bucket: Map<string, string>, qualifier: string) => {
      result.push(qualifier);
    });
    return result;
  }

  public clear(): void {
    this.entries = new Map<string, Map<string, string>>();
  }
}

// Normalizes UI text before comparison
class TextNormalizer {
  public static trim(value: string): string {
    return value.trim();
  }

  public static lower(value: string): string {
    return value.toLowerCase();
  }

  public static toHalfWidth(value: string): string {
    let result: string = '';
    for (let i = 0; i < value.length; i++) {
      const code = value.charCodeAt(i);
      if (code >= 0xFF01 && code <= 0xFF5E) {
        result += String.fromCharCode(code - 0xFEE0);
      } else if (code === 0x3000) {
        result += ' ';
      } else {
        result += value.charAt(i);
      }
    }
    return result;
  }

  public static normalize(value: string): string {
    return TextNormalizer.lower(TextNormalizer.toHalfWidth(TextNormalizer.trim(value)));
  }

  public static isEmpty(value: string): boolean {
    return TextNormalizer.trim(value).length === 0;
  }
}

// Matches localized UI text against candidate values
class LocalizedTextMatcher {
  public static matches(actual: string, expected: string): boolean {
    return TextNormalizer.normalize(actual) === TextNormalizer.normalize(expected);
  }

  public static matchesAny(actual: string, candidates: string[]): boolean {
    for (let i = 0; i < candidates.length; i++) {
      if (LocalizedTextMatcher.matches(actual, candidates[i])) {
        return true;
      }
    }
    return false;
  }

  public static containsFragment(actual: string, fragment: string): boolean {
    return TextNormalizer.normalize(actual).indexOf(TextNormalizer.normalize(fragment)) >= 0;
  }

  public static firstMatch(actualValues: string[], candidates: string[]): string {
    for (let i = 0; i < actualValues.length; i++) {
      if (LocalizedTextMatcher.matchesAny(actualValues[i], candidates)) {
        return actualValues[i];
      }
    }
    return '';
  }
}

export default function localizationIntegrationTest() {
  describe('LocalizationIntegration_Test', () => {
    let driver: Driver;
    let catalog: StringCatalog;

    beforeAll(async () => {
      driver = getDriver();
      catalog = new StringCatalog();
      catalog.add(LOCALE_ZH, KEY_CREATE, ZH_CREATE);
      catalog.add(LOCALE_ZH, KEY_LIST, ZH_LIST);
      catalog.add(LOCALE_ZH, KEY_INSTRUCTIONS, ZH_INSTRUCTIONS);
      catalog.add(LOCALE_ZH, KEY_SUBMIT, ZH_SUBMIT);
      catalog.add(LOCALE_ZH, KEY_ATTACHMENT, ZH_ATTACHMENT);
      catalog.add(LOCALE_EN, KEY_CREATE, EN_CREATE);
      catalog.add(LOCALE_EN, KEY_LIST, EN_LIST);
      catalog.add(LOCALE_EN, KEY_INSTRUCTIONS, EN_INSTRUCTIONS);
      catalog.add(LOCALE_EN, KEY_SUBMIT, EN_SUBMIT);
      catalog.add(LOCALE_EN, KEY_ATTACHMENT, EN_ATTACHMENT);
      await serializedDelay(driver, 300);
      await ensureHomePage(driver);
    });

    afterAll(async () => {
      await backToHome(driver, 3);
    });

    it('locale_resolver_should_normalize_language_tags', 0, () => {
      expect(LocaleResolver.normalize('zh-Hans-CN')).assertEqual(LOCALE_ZH);
      expect(LocaleResolver.normalize('zh')).assertEqual(LOCALE_ZH);
      expect(LocaleResolver.normalize('en-US')).assertEqual(LOCALE_EN);
      expect(LocaleResolver.normalize('en')).assertEqual(LOCALE_EN);
      expect(LocaleResolver.normalize('fr-FR')).assertEqual(LOCALE_BASE);
      expect(LocaleResolver.normalize('')).assertEqual(LOCALE_BASE);
    });

    it('locale_resolver_should_build_fallback_chain', 0, () => {
      expect(LocaleResolver.fallbackChain(LOCALE_ZH).length).assertEqual(2);
      expect(LocaleResolver.fallbackChain(LOCALE_ZH)[1]).assertEqual(LOCALE_BASE);
      expect(LocaleResolver.fallbackChain(LOCALE_EN)[0]).assertEqual(LOCALE_EN);
      expect(LocaleResolver.fallbackChain('fr').length).assertEqual(1);
      expect(LocaleResolver.isSupported(LOCALE_ZH)).assertTrue();
      expect(LocaleResolver.isSupported('fr')).assertFalse();
      expect(LocaleResolver.directionOf(LOCALE_ZH)).assertEqual('ltr');
    });

    it('catalog_should_return_localized_values', 0, () => {
      expect(catalog.get(LOCALE_ZH, KEY_CREATE)).assertEqual(ZH_CREATE);
      expect(catalog.get(LOCALE_EN, KEY_CREATE)).assertEqual(EN_CREATE);
      expect(catalog.get(LOCALE_ZH, KEY_LIST)).assertEqual(ZH_LIST);
      expect(catalog.get(LOCALE_EN, KEY_LIST)).assertEqual(EN_LIST);
      expect(catalog.has(LOCALE_ZH, KEY_SUBMIT)).assertTrue();
      expect(catalog.has(LOCALE_ZH, 'missing')).assertFalse();
    });

    it('catalog_should_fall_back_to_base_qualifier', 0, () => {
      catalog.add(LOCALE_BASE, KEY_SUBMIT, EN_SUBMIT);
      expect(catalog.get(LOCALE_ZH, KEY_SUBMIT)).assertEqual(ZH_SUBMIT);
      const fresh = new StringCatalog();
      fresh.add(LOCALE_BASE, KEY_SUBMIT, EN_SUBMIT);
      expect(fresh.get(LOCALE_ZH, KEY_SUBMIT)).assertEqual(EN_SUBMIT);
      expect(fresh.get(LOCALE_EN, KEY_SUBMIT)).assertEqual(EN_SUBMIT);
      expect(fresh.get(LOCALE_BASE, 'missing')).assertEqual('');
    });

    it('catalog_should_track_qualifiers_and_keys', 0, () => {
      expect(catalog.qualifiers().includes(LOCALE_ZH)).assertTrue();
      expect(catalog.qualifiers().includes(LOCALE_EN)).assertTrue();
      expect(catalog.keyCount(LOCALE_ZH)).assertEqual(5);
      expect(catalog.keyCount(LOCALE_EN)).assertEqual(5);
      expect(catalog.keyCount('fr')).assertEqual(0);
      catalog.add('', KEY_CREATE, 'value');
      expect(catalog.qualifiers().includes('')).assertFalse();
      catalog.add(LOCALE_ZH, '', 'value');
      expect(catalog.keyCount(LOCALE_ZH)).assertEqual(5);
    });

    it('catalog_should_overwrite_and_clear', 0, () => {
      const local = new StringCatalog();
      local.add(LOCALE_ZH, KEY_CREATE, 'first');
      local.add(LOCALE_ZH, KEY_CREATE, 'second');
      expect(local.get(LOCALE_ZH, KEY_CREATE)).assertEqual('second');
      expect(local.keyCount(LOCALE_ZH)).assertEqual(1);
      local.clear();
      expect(local.keyCount(LOCALE_ZH)).assertEqual(0);
      expect(local.qualifiers().length).assertEqual(0);
    });

    it('text_normalizer_should_trim_and_lowercase', 0, () => {
      expect(TextNormalizer.trim('  abc  ')).assertEqual('abc');
      expect(TextNormalizer.lower('ABC')).assertEqual('abc');
      expect(TextNormalizer.normalize('  SuBmIt  ')).assertEqual('submit');
      expect(TextNormalizer.isEmpty('   ')).assertTrue();
      expect(TextNormalizer.isEmpty('x')).assertFalse();
    });

    it('text_normalizer_should_convert_full_width', 0, () => {
      expect(TextNormalizer.toHalfWidth('\uff21\uff22\uff23')).assertEqual('ABC');
      expect(TextNormalizer.toHalfWidth('\u3000')).assertEqual(' ');
      expect(TextNormalizer.toHalfWidth('abc')).assertEqual('abc');
      expect(TextNormalizer.normalize('\uff21\uff22\uff23')).assertEqual('abc');
    });

    it('matcher_should_match_both_locales', 0, () => {
      expect(LocalizedTextMatcher.matches(ZH_CREATE, ZH_CREATE)).assertTrue();
      expect(LocalizedTextMatcher.matches(EN_CREATE, EN_CREATE)).assertTrue();
      expect(LocalizedTextMatcher.matches(ZH_CREATE, EN_CREATE)).assertFalse();
      expect(LocalizedTextMatcher.matchesAny(ZH_CREATE, TEXT_CREATE_ISSUE_CANDIDATES)).assertTrue();
      expect(LocalizedTextMatcher.matchesAny(EN_CREATE, TEXT_CREATE_ISSUE_CANDIDATES)).assertTrue();
    });

    it('matcher_should_ignore_case_and_spacing', 0, () => {
      expect(LocalizedTextMatcher.matches('  SUBMIT ', 'submit')).assertTrue();
      expect(LocalizedTextMatcher.matches('Submit', 'submit')).assertTrue();
      expect(LocalizedTextMatcher.matches('\uff33\uff55\uff42\uff4d\uff49\uff54', 'submit')).assertTrue();
      expect(LocalizedTextMatcher.containsFragment('create a new questionnaire', 'new')).assertTrue();
      expect(LocalizedTextMatcher.containsFragment('create a new questionnaire', 'delete')).assertFalse();
    });

    it('matcher_should_find_first_matching_value', 0, () => {
      const values: string[] = ['unknown', ZH_LIST, EN_CREATE];
      expect(LocalizedTextMatcher.firstMatch(values, TEXT_CREATE_ISSUE_CANDIDATES))
        .assertEqual(EN_CREATE);
      expect(LocalizedTextMatcher.firstMatch(values, TEXT_ISSUE_LIST_CANDIDATES))
        .assertEqual(ZH_LIST);
      expect(LocalizedTextMatcher.firstMatch(values, ['not-present'])).assertEqual('');
    });

    it('catalog_values_should_match_shared_candidates', 0, () => {
      expect(TEXT_CREATE_ISSUE_CANDIDATES.includes(catalog.get(LOCALE_ZH, KEY_CREATE))).assertTrue();
      expect(TEXT_CREATE_ISSUE_CANDIDATES.includes(catalog.get(LOCALE_EN, KEY_CREATE))).assertTrue();
      expect(TEXT_ISSUE_LIST_CANDIDATES.includes(catalog.get(LOCALE_ZH, KEY_LIST))).assertTrue();
      expect(TEXT_INTRODUCTION_CANDIDATES.includes(catalog.get(LOCALE_EN, KEY_INSTRUCTIONS))).assertTrue();
      expect(TEXT_ATTACHMENT_CANDIDATES.includes(catalog.get(LOCALE_ZH, KEY_ATTACHMENT))).assertTrue();
    });

    it('home_page_should_render_localized_create_entry', 0, async () => {
      const visible = await waitForAnyText(driver, TEXT_CREATE_ISSUE_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(visible !== '').assertTrue();
      const zhVisible = await checkTextContent(driver, ZH_CREATE);
      const enVisible = await checkTextContent(driver, EN_CREATE);
      expect(zhVisible || enVisible).assertTrue();
    });

    it('home_page_should_render_all_localized_entries', 0, async () => {
      await ensureHomePage(driver);
      const create = await waitForAnyText(driver, TEXT_CREATE_ISSUE_CANDIDATES, TIMEOUT_PAGE_RENDER);
      const list = await waitForAnyText(driver, TEXT_ISSUE_LIST_CANDIDATES, TIMEOUT_PAGE_RENDER);
      const intro = await waitForAnyText(driver, TEXT_INTRODUCTION_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(create !== '').assertTrue();
      expect(list !== '').assertTrue();
      expect(intro !== '').assertTrue();
      expect(await componentCount(driver)).assertLarger(0);
    });

    it('locale_constants_should_stay_consistent', 0, () => {
      expect(LOCALE_ZH).assertEqual('zh_CN');
      expect(LOCALE_EN).assertEqual('en_US');
      expect(LOCALE_BASE).assertEqual('base');
      expect(KEY_CREATE).assertEqual('create_a_new_questionnaire');
      expect(LocaleResolver.normalize(LOCALE_ZH)).assertEqual(LOCALE_ZH);
      expect(LocaleResolver.normalize(LOCALE_EN)).assertEqual(LOCALE_EN);
    });
  });
}

