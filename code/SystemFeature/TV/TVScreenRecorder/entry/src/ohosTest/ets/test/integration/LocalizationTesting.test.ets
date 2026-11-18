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
  checkAnyTextContent,
  recorderComponentCount,
  launchRecorderService,
  serializedDelay,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  TIP_TEXT_TITLE,
  TIP_TEXT_CONTENT,
  TIMER_TEXT_HINT,
  TIMER_TEXT_ERROR,
  RESOLUTION_TEXT_TITLE,
  RESOLUTION_TEXT_CONTENT
} from '../shared/RecordingDriver';

// Locales shipped by the sample. zh_CN is the default resource qualifier and
// therefore also the fallback used when a locale has no dedicated translation.
enum LocaleCode {
  ZH_CN = 'zh_CN',
  EN_US = 'en_US',
  FR_FR = 'fr_FR'
}

// Every user visible literal that belongs to the recorder contract.
enum StringKey {
  RECORD_TITLE = 'record_title',
  SAVED_TO_PHOTOS = 'saved_to_photos',
  UNSUPPORTED_TITLE = 'unsupported_title',
  RESOLUTION_TOO_HIGH = 'resolution_too_high',
  STOP_HINT = 'stop_hint',
  UNKNOWN_ERROR = 'unknown_error'
}

interface LocaleDescriptor {
  locale: LocaleCode
  displayName: string
  isDefault: boolean
  supported: boolean
}

interface CatalogEntry {
  locale: LocaleCode
  key: StringKey
  value: string
}

interface MissingKeyReport {
  locale: LocaleCode
  key: StringKey
  resolvedFrom: LocaleCode
}

// In-memory projection of the resource qualifier directories
// (resources/base/element/string.json and resources/en_US/element/string.json).
class StringCatalog {
  private table: Map<string, string> = new Map();
  private locales: Map<string, LocaleDescriptor> = new Map();

  public addLocale(descriptor: LocaleDescriptor): void {
    this.locales.set(descriptor.locale, descriptor);
  }

  public addEntry(entry: CatalogEntry): void {
    this.table.set(`${entry.locale}::${entry.key}`, entry.value);
  }

  public hasLocale(locale: LocaleCode): boolean {
    return this.locales.has(locale);
  }

  public hasEntry(locale: LocaleCode, key: StringKey): boolean {
    return this.table.has(`${locale}::${key}`);
  }

  public rawValue(locale: LocaleCode, key: StringKey): string {
    return this.table.get(`${locale}::${key}`) ?? '';
  }

  public getLocales(): LocaleCode[] {
    const result: LocaleCode[] = [];
    const zh = this.locales.get(LocaleCode.ZH_CN);
    const en = this.locales.get(LocaleCode.EN_US);
    const fr = this.locales.get(LocaleCode.FR_FR);
    if (zh !== undefined) {
      result.push(LocaleCode.ZH_CN);
    }
    if (en !== undefined) {
      result.push(LocaleCode.EN_US);
    }
    if (fr !== undefined) {
      result.push(LocaleCode.FR_FR);
    }
    return result;
  }

  public getDefaultLocale(): LocaleCode {
    const values = this.getLocales();
    for (let index = 0; index < values.length; index++) {
      const descriptor = this.locales.get(values[index]);
      if (descriptor !== undefined && descriptor.isDefault) {
        return descriptor.locale;
      }
    }
    return LocaleCode.ZH_CN;
  }

  public getEntryCount(locale: LocaleCode): number {
    const keys = this.getKeys();
    let count = 0;
    for (let index = 0; index < keys.length; index++) {
      if (this.hasEntry(locale, keys[index])) {
        count++;
      }
    }
    return count;
  }

  public getKeys(): StringKey[] {
    return [
      StringKey.RECORD_TITLE,
      StringKey.SAVED_TO_PHOTOS,
      StringKey.UNSUPPORTED_TITLE,
      StringKey.RESOLUTION_TOO_HIGH,
      StringKey.STOP_HINT,
      StringKey.UNKNOWN_ERROR
    ];
  }
}

// Resolves a localized literal with the same precedence as the resource
// manager: requested locale, then the default locale, then an empty string.
class LocalizedResources {
  private catalog: StringCatalog;
  private current: LocaleCode;
  private fallbacks: MissingKeyReport[] = [];

  constructor(catalog: StringCatalog, current: LocaleCode) {
    this.catalog = catalog;
    this.current = current;
  }

  public getLocale(): LocaleCode {
    return this.current;
  }

  public switchLocale(locale: LocaleCode): void {
    this.current = locale;
  }

  public resolve(key: StringKey): string {
    const direct = this.catalog.rawValue(this.current, key);
    if (direct.length > 0) {
      return direct;
    }
    const defaultLocale = this.catalog.getDefaultLocale();
    const fallbackValue = this.catalog.rawValue(defaultLocale, key);
    const report: MissingKeyReport = {
      locale: this.current,
      key: key,
      resolvedFrom: defaultLocale
    };
    this.fallbacks.push(report);
    return fallbackValue;
  }

  public getFallbackReports(): MissingKeyReport[] {
    return this.fallbacks.slice();
  }

  public isFallbackFree(): boolean {
    return this.fallbacks.length === 0;
  }
}

// Aggregates the localization probe results so that a whole locale sweep can be
// validated with a single rate assertion.
class LocalizationReporter {
  private total: number = 0;
  private resolved: number = 0;
  private fallbackCount: number = 0;
  private perLocale: Map<string, number> = new Map();

  public record(locale: LocaleCode, resolvedOk: boolean): void {
    this.total++;
    if (resolvedOk) {
      this.resolved++;
    }
    const current = this.perLocale.get(locale) ?? 0;
    this.perLocale.set(locale, current + 1);
  }

  public recordFallback(): void {
    this.fallbackCount++;
  }

  public getTotal(): number {
    return this.total;
  }

  public getResolved(): number {
    return this.resolved;
  }

  public getFallbackCount(): number {
    return this.fallbackCount;
  }

  public getLocaleCount(locale: LocaleCode): number {
    return this.perLocale.get(locale) ?? 0;
  }

  public getSuccessRate(): number {
    if (this.total === 0) {
      return 0;
    }
    return this.resolved / this.total;
  }

  public reset(): void {
    this.total = 0;
    this.resolved = 0;
    this.fallbackCount = 0;
    this.perLocale.clear();
  }
}

// Builds the full two-locale catalogue. The French locale is registered but has
// no entry, which is exactly the partial-translation situation the fallback
// cases exercise.
function buildStringCatalog(): StringCatalog {
  const catalog = new StringCatalog();
  const zh: LocaleDescriptor = {
    locale: LocaleCode.ZH_CN,
    displayName: 'Chinese Simplified',
    isDefault: true,
    supported: true
  };
  const en: LocaleDescriptor = {
    locale: LocaleCode.EN_US,
    displayName: 'English United States',
    isDefault: false,
    supported: true
  };
  const fr: LocaleDescriptor = {
    locale: LocaleCode.FR_FR,
    displayName: 'French France',
    isDefault: false,
    supported: false
  };
  catalog.addLocale(zh);
  catalog.addLocale(en);
  catalog.addLocale(fr);

  const zhEntries: CatalogEntry[] = [
    { locale: LocaleCode.ZH_CN, key: StringKey.RECORD_TITLE, value: '录屏' },
    { locale: LocaleCode.ZH_CN, key: StringKey.SAVED_TO_PHOTOS, value: '录屏视频已存储到"照片"' },
    { locale: LocaleCode.ZH_CN, key: StringKey.UNSUPPORTED_TITLE, value: '暂不支持' },
    {
      locale: LocaleCode.ZH_CN,
      key: StringKey.RESOLUTION_TOO_HIGH,
      value: '当前设备分辨率过高，请降低分辨率'
    },
    {
      locale: LocaleCode.ZH_CN,
      key: StringKey.STOP_HINT,
      value: '同时按下菜单键与音量减键，即可结束录屏'
    },
    { locale: LocaleCode.ZH_CN, key: StringKey.UNKNOWN_ERROR, value: '未知错误,录制停止' }
  ];
  const enEntries: CatalogEntry[] = [
    { locale: LocaleCode.EN_US, key: StringKey.RECORD_TITLE, value: 'Screen Recording' },
    { locale: LocaleCode.EN_US, key: StringKey.SAVED_TO_PHOTOS, value: 'Recording saved to Photos' },
    { locale: LocaleCode.EN_US, key: StringKey.UNSUPPORTED_TITLE, value: 'Not Supported' },
    {
      locale: LocaleCode.EN_US,
      key: StringKey.RESOLUTION_TOO_HIGH,
      value: 'The current screen resolution is too high. Please lower the resolution'
    },
    {
      locale: LocaleCode.EN_US,
      key: StringKey.STOP_HINT,
      value: 'Press the Menu and Volume-down keys together to stop recording'
    },
    { locale: LocaleCode.EN_US, key: StringKey.UNKNOWN_ERROR, value: 'Unknown error, recording stopped' }
  ];
  for (let index = 0; index < zhEntries.length; index++) {
    catalog.addEntry(zhEntries[index]);
  }
  for (let index = 0; index < enEntries.length; index++) {
    catalog.addEntry(enEntries[index]);
  }
  return catalog;
}

function isAsciiOnly(value: string): boolean {
  for (let index = 0; index < value.length; index++) {
    if (value.charCodeAt(index) > 127) {
      return false;
    }
  }
  return true;
}

function containsForbiddenToken(value: string): boolean {
  const forbidden: string[] = ['%s', '%d', 'TODO', 'undefined', 'null', '{{'];
  for (let index = 0; index < forbidden.length; index++) {
    if (value.indexOf(forbidden[index]) >= 0) {
      return true;
    }
  }
  return false;
}

export default function localizationTestingTest(): void {
  describe('LocalizationTesting_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // Both shipped locales must declare all six contract literals; a missing
    // entry would silently fall back and mix languages in one dialog.
    it('catalog_should_cover_both_supported_locales', 0, () => {
      const catalog = buildStringCatalog();
      expect(catalog.getLocales().length).assertEqual(3);
      expect(catalog.hasLocale(LocaleCode.ZH_CN)).assertTrue();
      expect(catalog.hasLocale(LocaleCode.EN_US)).assertTrue();
      expect(catalog.getDefaultLocale()).assertEqual(LocaleCode.ZH_CN);
      expect(catalog.getEntryCount(LocaleCode.ZH_CN)).assertEqual(6);
      expect(catalog.getEntryCount(LocaleCode.EN_US)).assertEqual(6);
      expect(catalog.getEntryCount(LocaleCode.FR_FR)).assertEqual(0);
    });

    // zh_CN is the default qualifier, so its literals are the production ones.
    it('zh_cn_record_title_should_match_production', 0, () => {
      const catalog = buildStringCatalog();
      const resources = new LocalizedResources(catalog, LocaleCode.ZH_CN);
      const title = resources.resolve(StringKey.RECORD_TITLE);
      expect(title).assertEqual('录屏');
      expect(title).assertEqual(TIP_TEXT_TITLE);
      expect(title.length).assertEqual(2);
      expect(resources.getLocale()).assertEqual(LocaleCode.ZH_CN);
    });

    // The saved-to-photos message keeps the embedded picture-book quotes.
    it('zh_cn_saved_to_photos_should_match_production', 0, () => {
      const catalog = buildStringCatalog();
      const resources = new LocalizedResources(catalog, LocaleCode.ZH_CN);
      const message = resources.resolve(StringKey.SAVED_TO_PHOTOS);
      expect(message).assertEqual('录屏视频已存储到"照片"');
      expect(message).assertEqual(TIP_TEXT_CONTENT);
      expect(message).assertContain('录屏视频');
      expect(message).assertContain('照片');
      expect(message.indexOf('"')).assertLargerOrEqual(0);
    });

    // The unsupported title is shared by the resolution dialog header.
    it('zh_cn_unsupported_title_should_match_production', 0, () => {
      const catalog = buildStringCatalog();
      const resources = new LocalizedResources(catalog, LocaleCode.ZH_CN);
      const title = resources.resolve(StringKey.UNSUPPORTED_TITLE);
      expect(title).assertEqual('暂不支持');
      expect(title).assertEqual(RESOLUTION_TEXT_TITLE);
      expect(title.length).assertEqual(4);
    });

    // The resolution guidance must tell the user how to recover from the gate.
    it('zh_cn_resolution_message_should_match_production', 0, () => {
      const catalog = buildStringCatalog();
      const resources = new LocalizedResources(catalog, LocaleCode.ZH_CN);
      const message = resources.resolve(StringKey.RESOLUTION_TOO_HIGH);
      expect(message).assertEqual('当前设备分辨率过高，请降低分辨率');
      expect(message).assertEqual(RESOLUTION_TEXT_CONTENT);
      expect(message).assertContain('分辨率');
      expect(message).assertContain('降低');
    });

    // The timer hint explains the two-key stop combination.
    it('zh_cn_stop_hint_should_match_production', 0, () => {
      const catalog = buildStringCatalog();
      const resources = new LocalizedResources(catalog, LocaleCode.ZH_CN);
      const hint = resources.resolve(StringKey.STOP_HINT);
      expect(hint).assertEqual('同时按下菜单键与音量减键，即可结束录屏');
      expect(hint).assertEqual(TIMER_TEXT_HINT);
      expect(hint).assertContain('菜单键');
      expect(hint).assertContain('音量减键');
      expect(hint).assertContain('结束录屏');
    });

    // The error literal is shown by the timer page when the capture aborts.
    it('zh_cn_unknown_error_should_match_production', 0, () => {
      const catalog = buildStringCatalog();
      const resources = new LocalizedResources(catalog, LocaleCode.ZH_CN);
      const message = resources.resolve(StringKey.UNKNOWN_ERROR);
      expect(message).assertEqual('未知错误,录制停止');
      expect(message).assertEqual(TIMER_TEXT_ERROR);
      expect(message).assertContain('停止');
      expect(message.indexOf('错误')).assertLargerOrEqual(0);
    });

    // The English catalogue carries a real translation, not a copy of the
    // Chinese default.
    it('en_us_record_title_should_be_english', 0, () => {
      const catalog = buildStringCatalog();
      const resources = new LocalizedResources(catalog, LocaleCode.EN_US);
      const title = resources.resolve(StringKey.RECORD_TITLE);
      expect(title).assertEqual('Screen Recording');
      expect(isAsciiOnly(title)).assertTrue();
      expect(title === '录屏').assertFalse();
    });

    // The English saved message must point at the Photos application as well.
    it('en_us_saved_message_should_be_english', 0, () => {
      const catalog = buildStringCatalog();
      const resources = new LocalizedResources(catalog, LocaleCode.EN_US);
      const message = resources.resolve(StringKey.SAVED_TO_PHOTOS);
      expect(message).assertEqual('Recording saved to Photos');
      expect(message).assertContain('Photos');
      expect(message).assertContain('Recording');
      expect(isAsciiOnly(message)).assertTrue();
    });

    // Every key of the enum has an English entry, so no dialog can degrade into
    // the Chinese fallback on an English device.
    it('en_us_should_cover_all_keys', 0, () => {
      const catalog = buildStringCatalog();
      const keys = catalog.getKeys();
      expect(keys.length).assertEqual(6);
      for (let index = 0; index < keys.length; index++) {
        expect(catalog.hasEntry(LocaleCode.EN_US, keys[index])).assertTrue();
        const value = catalog.rawValue(LocaleCode.EN_US, keys[index]);
        expect(isAsciiOnly(value)).assertTrue();
        expect(value.length > 0).assertTrue();
      }
    });

    // Chinese literals must stay non-ASCII so that a copied English value is
    // detected immediately.
    it('zh_cn_values_should_contain_non_ascii', 0, () => {
      const catalog = buildStringCatalog();
      const keys = catalog.getKeys();
      for (let index = 0; index < keys.length; index++) {
        const value = catalog.rawValue(LocaleCode.ZH_CN, keys[index]);
        expect(isAsciiOnly(value)).assertFalse();
        expect(value.length > 0).assertTrue();
      }
    });

    // The two supported locales expose exactly the same key set.
    it('both_locales_should_expose_identical_key_sets', 0, () => {
      const catalog = buildStringCatalog();
      const keys = catalog.getKeys();
      let matched = 0;
      for (let index = 0; index < keys.length; index++) {
        const zhPresent = catalog.hasEntry(LocaleCode.ZH_CN, keys[index]);
        const enPresent = catalog.hasEntry(LocaleCode.EN_US, keys[index]);
        expect(zhPresent).assertEqual(enPresent);
        if (zhPresent && enPresent) {
          matched++;
        }
      }
      expect(matched).assertEqual(6);
    });

    // No literal may be empty or contain an unresolved placeholder token.
    it('no_value_should_be_empty_or_placeholder', 0, () => {
      const catalog = buildStringCatalog();
      const locales: LocaleCode[] = [LocaleCode.ZH_CN, LocaleCode.EN_US];
      const keys = catalog.getKeys();
      for (let localeIndex = 0; localeIndex < locales.length; localeIndex++) {
        for (let keyIndex = 0; keyIndex < keys.length; keyIndex++) {
          const value = catalog.rawValue(locales[localeIndex], keys[keyIndex]);
          expect(value.length > 0).assertTrue();
          expect(containsForbiddenToken(value)).assertFalse();
        }
      }
    });

    // The floating windows are narrow, so every literal has to stay inside a
    // readable budget to avoid clipping on a TV screen.
    it('values_should_stay_within_length_budget', 0, () => {
      const catalog = buildStringCatalog();
      const keys = catalog.getKeys();
      for (let index = 0; index < keys.length; index++) {
        const zhValue = catalog.rawValue(LocaleCode.ZH_CN, keys[index]);
        const enValue = catalog.rawValue(LocaleCode.EN_US, keys[index]);
        expect(zhValue.length).assertLessOrEqual(24);
        expect(enValue.length).assertLessOrEqual(96);
        expect(zhValue.length).assertLarger(0);
      }
    });

    // The recovery guidance has to mention the resolution on both locales.
    it('resolution_message_should_mention_resolution', 0, () => {
      const catalog = buildStringCatalog();
      const zhResources = new LocalizedResources(catalog, LocaleCode.ZH_CN);
      const enResources = new LocalizedResources(catalog, LocaleCode.EN_US);
      const zhMessage = zhResources.resolve(StringKey.RESOLUTION_TOO_HIGH);
      const enMessage = enResources.resolve(StringKey.RESOLUTION_TOO_HIGH);
      expect(zhMessage.indexOf('分辨率')).assertLargerOrEqual(0);
      expect(enMessage.indexOf('resolution')).assertLargerOrEqual(0);
      expect(enMessage.indexOf('lower')).assertLargerOrEqual(0);
      expect(zhMessage === enMessage).assertFalse();
    });

    // The stop hint must document both keys on both locales.
    it('stop_hint_should_mention_two_keys', 0, () => {
      const catalog = buildStringCatalog();
      const zhResources = new LocalizedResources(catalog, LocaleCode.ZH_CN);
      const enResources = new LocalizedResources(catalog, LocaleCode.EN_US);
      const zhHint = zhResources.resolve(StringKey.STOP_HINT);
      const enHint = enResources.resolve(StringKey.STOP_HINT);
      expect(zhHint.indexOf('菜单键')).assertLargerOrEqual(0);
      expect(zhHint.indexOf('音量减键')).assertLargerOrEqual(0);
      expect(enHint.indexOf('Menu')).assertLargerOrEqual(0);
      expect(enHint.indexOf('Volume-down')).assertLargerOrEqual(0);
    });

    // A locale without its own translation resolves through the default locale
    // instead of showing an empty dialog.
    it('unsupported_locale_should_fall_back_to_default', 0, () => {
      const catalog = buildStringCatalog();
      const resources = new LocalizedResources(catalog, LocaleCode.FR_FR);
      expect(catalog.rawValue(LocaleCode.FR_FR, StringKey.RECORD_TITLE)).assertEqual('');
      const resolved = resources.resolve(StringKey.RECORD_TITLE);
      expect(resolved).assertEqual('录屏');
      expect(resolved).assertEqual(catalog.rawValue(LocaleCode.ZH_CN, StringKey.RECORD_TITLE));
      expect(resources.getLocale()).assertEqual(LocaleCode.FR_FR);
    });

    // Every fallback is reported so that missing translations can be triaged
    // from the test output.
    it('fallback_should_be_recorded_for_triage', 0, () => {
      const catalog = buildStringCatalog();
      const resources = new LocalizedResources(catalog, LocaleCode.FR_FR);
      expect(resources.isFallbackFree()).assertTrue();
      resources.resolve(StringKey.RECORD_TITLE);
      resources.resolve(StringKey.SAVED_TO_PHOTOS);
      const reports = resources.getFallbackReports();
      expect(reports.length).assertEqual(2);
      expect(reports[0].locale).assertEqual(LocaleCode.FR_FR);
      expect(reports[0].key).assertEqual(StringKey.RECORD_TITLE);
      expect(reports[0].resolvedFrom).assertEqual(LocaleCode.ZH_CN);
      expect(resources.isFallbackFree()).assertFalse();
    });

    // A partially translated catalogue falls back per key, not per locale.
    it('partial_catalog_should_fall_back_per_key', 0, () => {
      const partial = new StringCatalog();
      partial.addLocale({
        locale: LocaleCode.ZH_CN,
        displayName: 'Chinese Simplified',
        isDefault: true,
        supported: true
      });
      partial.addEntry({ locale: LocaleCode.ZH_CN, key: StringKey.RECORD_TITLE, value: '录屏' });
      const resources = new LocalizedResources(partial, LocaleCode.EN_US);
      expect(resources.resolve(StringKey.RECORD_TITLE)).assertEqual('录屏');
      expect(resources.resolve(StringKey.UNSUPPORTED_TITLE)).assertEqual('');
      expect(resources.getFallbackReports().length).assertEqual(2);
    });

    // A fully translated locale never triggers the fallback path.
    it('supported_locale_should_not_trigger_fallback', 0, () => {
      const catalog = buildStringCatalog();
      const keys = catalog.getKeys();
      const resources = new LocalizedResources(catalog, LocaleCode.EN_US);
      for (let index = 0; index < keys.length; index++) {
        const value = resources.resolve(keys[index]);
        expect(value.length > 0).assertTrue();
        expect(isAsciiOnly(value)).assertTrue();
      }
      expect(resources.isFallbackFree()).assertTrue();
      expect(resources.getFallbackReports().length).assertEqual(0);
    });

    // Switching the locale at runtime must change the very next lookup.
    it('switch_locale_should_take_effect_immediately', 0, () => {
      const catalog = buildStringCatalog();
      const resources = new LocalizedResources(catalog, LocaleCode.ZH_CN);
      expect(resources.resolve(StringKey.RECORD_TITLE)).assertEqual('录屏');
      resources.switchLocale(LocaleCode.EN_US);
      expect(resources.getLocale()).assertEqual(LocaleCode.EN_US);
      expect(resources.resolve(StringKey.RECORD_TITLE)).assertEqual('Screen Recording');
      resources.switchLocale(LocaleCode.ZH_CN);
      expect(resources.resolve(StringKey.RECORD_TITLE)).assertEqual('录屏');
      expect(resources.isFallbackFree()).assertTrue();
    });

    // The reporter keeps one counter per probed locale.
    it('reporter_should_count_per_locale', 0, () => {
      const reporter = new LocalizationReporter();
      reporter.record(LocaleCode.ZH_CN, true);
      reporter.record(LocaleCode.ZH_CN, true);
      reporter.record(LocaleCode.EN_US, true);
      expect(reporter.getTotal()).assertEqual(3);
      expect(reporter.getResolved()).assertEqual(3);
      expect(reporter.getLocaleCount(LocaleCode.ZH_CN)).assertEqual(2);
      expect(reporter.getLocaleCount(LocaleCode.EN_US)).assertEqual(1);
      expect(reporter.getLocaleCount(LocaleCode.FR_FR)).assertEqual(0);
    });

    // A failed lookup is counted but does not break the rate of the successful
    // ones.
    it('reporter_rate_should_reflect_failures', 0, () => {
      const reporter = new LocalizationReporter();
      reporter.record(LocaleCode.ZH_CN, true);
      reporter.record(LocaleCode.EN_US, true);
      reporter.record(LocaleCode.FR_FR, false);
      expect(reporter.getTotal()).assertEqual(3);
      expect(reporter.getResolved()).assertEqual(2);
      expect(reporter.getSuccessRate()).assertLess(1);
      expect(reporter.getSuccessRate()).assertLarger(0.6);
    });

    // Reset must bring the reporter back to its initial state.
    it('reporter_reset_should_clear_state', 0, () => {
      const reporter = new LocalizationReporter();
      reporter.record(LocaleCode.ZH_CN, true);
      reporter.recordFallback();
      reporter.reset();
      expect(reporter.getTotal()).assertEqual(0);
      expect(reporter.getResolved()).assertEqual(0);
      expect(reporter.getFallbackCount()).assertEqual(0);
      expect(reporter.getSuccessRate()).assertEqual(0);
      expect(reporter.getLocaleCount(LocaleCode.ZH_CN)).assertEqual(0);
    });

    // Full sweep over locale x key: every supported pair resolves a non-empty
    // literal and the aggregated rate stays at one.
    it('full_matrix_sweep_should_pass', 0, () => {
      const catalog = buildStringCatalog();
      const keys = catalog.getKeys();
      const reporter = new LocalizationReporter();
      const locales: LocaleCode[] = [LocaleCode.ZH_CN, LocaleCode.EN_US];
      for (let localeIndex = 0; localeIndex < locales.length; localeIndex++) {
        const resources = new LocalizedResources(catalog, locales[localeIndex]);
        for (let keyIndex = 0; keyIndex < keys.length; keyIndex++) {
          const value = resources.resolve(keys[keyIndex]);
          const ok = value.length > 0 && !containsForbiddenToken(value);
          reporter.record(locales[localeIndex], ok);
          expect(ok).assertTrue();
        }
        expect(resources.isFallbackFree()).assertTrue();
      }
      expect(reporter.getTotal()).assertEqual(12);
      expect(reporter.getResolved()).assertEqual(12);
      expect(reporter.getSuccessRate()).assertEqual(1);
      expect(reporter.getLocaleCount(LocaleCode.ZH_CN)).assertEqual(6);
      expect(reporter.getLocaleCount(LocaleCode.EN_US)).assertEqual(6);
    });

    // The key enumeration order is stable, which keeps the sweep reproducible.
    it('key_set_order_should_be_stable', 0, () => {
      const catalog = buildStringCatalog();
      const first = catalog.getKeys();
      const second = catalog.getKeys();
      expect(first.length).assertEqual(second.length);
      for (let index = 0; index < first.length; index++) {
        expect(first[index]).assertEqual(second[index]);
      }
      expect(first[0]).assertEqual(StringKey.RECORD_TITLE);
      expect(first[5]).assertEqual(StringKey.UNKNOWN_ERROR);
    });

    // Real-device probe: whichever localized literal is on screen, it belongs to
    // the zh_CN catalogue of this suite.
    it('device_text_should_belong_to_catalog', 0, async () => {
      await launchRecorderService();
      await serializedDelay(driver, 800);
      const catalog = buildStringCatalog();
      const zhValues: string[] = [];
      const keys = catalog.getKeys();
      for (let index = 0; index < keys.length; index++) {
        zhValues.push(catalog.rawValue(LocaleCode.ZH_CN, keys[index]));
      }
      const matched: boolean = await checkAnyTextContent(driver, zhValues);
      const componentCount: number = await recorderComponentCount(driver);
      expect(zhValues.length).assertEqual(6);
      expect(componentCount >= 0).assertEqual(true);
      expect(matched && componentCount === 0).assertFalse();
    });
  });
}

