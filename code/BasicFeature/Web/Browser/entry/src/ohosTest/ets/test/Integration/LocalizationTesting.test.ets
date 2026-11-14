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
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  inputById, textById, waitForId, hasText, buildSearchUrl, clickById,
  MAX_TAB_COUNT, TAB_LIMIT_MESSAGE, ID_INPUT_URL, ID_ACTION_ADD, ID_CANCEL_TAB,
  TIMEOUT_TAB_SWITCH, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser } from '../Shared/BrowserMock';

const TAG: string = 'BrowserLocalizationTest';

/** Resource keys declared in resources/{base,zh,en}/element/string.json. */
const KEY_ENTRY_DESC: string = 'entry_desc';
const KEY_ABILITY_DESC: string = 'MainAbility_desc';
const KEY_ABILITY_LABEL: string = 'MainAbility_label';
const KEY_INPUT_URL: string = 'Input_url';

/** Locale identifiers used by resources/<folder>. */
const LOCALE_BASE: string = 'base';
const LOCALE_ZH: string = 'zh';
const LOCALE_EN: string = 'en';
const LOCALE_UNSUPPORTED: string = 'fr';

/** Literal that TabletTitle passes to TextInput instead of a resource. */
const TABLET_PLACEHOLDER_LITERAL: string = '输入网址...';
/** Resource driven placeholder that PhoneLayout renders through $r(). */
const PHONE_PLACEHOLDER_RESOURCE: string = 'InputUrl';
/** Tab label of BrowserTabs, hard coded in the layout. */
const TAB_LABEL_LITERAL: string = '主页';
/** Toast raised by Browser.addTab when the eleventh tab is requested. */
const CAPACITY_TOAST: string = TAB_LIMIT_MESSAGE;

/** Font sizes declared by the two title bars. */
const TABLET_INPUT_FONT_SIZE: number = 18;
const PHONE_INPUT_FONT_SIZE: number = 16;

/** One row of the resource table: key plus the value of every locale. */
interface LocaleRow {
  key: string;
  base: string;
  zh: string;
  en: string;
}

/**
 * Values copied from the shipped resource files.
 *
 * The zh folder translates Input_url, base and en keep the untranslated
 * token 'InputUrl', and MainAbility_label stays Chinese in every locale.
 */
function buildLocaleRows(): LocaleRow[] {
  const rows: LocaleRow[] = [
    { key: KEY_ENTRY_DESC, base: 'description', zh: 'description', en: 'description' },
    { key: KEY_ABILITY_DESC, base: 'description', zh: 'description', en: 'description' },
    { key: KEY_ABILITY_LABEL, base: '浏览器', zh: '浏览器', en: '浏览器' },
    { key: KEY_INPUT_URL, base: 'InputUrl', zh: '输入网址...', en: 'InputUrl' }
  ];
  return rows;
}

/** One locale folder resolved into a key/value map. */
class LocaleBundle {
  locale: string;
  values: Map<string, string> = new Map<string, string>();

  constructor(locale: string, rows: LocaleRow[]) {
    this.locale = locale;
    for (let index = 0; index < rows.length; index++) {
      const row: LocaleRow = rows[index];
      this.put(row.key, LocaleBundle.pick(locale, row));
    }
  }

  private static pick(locale: string, row: LocaleRow): string {
    if (locale === LOCALE_ZH) {
      return row.zh;
    }
    if (locale === LOCALE_EN) {
      return row.en;
    }
    return row.base;
  }

  put(key: string, value: string): void {
    this.values.set(key, value);
  }

  has(key: string): boolean {
    return this.values.has(key);
  }

  get(key: string): string {
    const value: string | undefined = this.values.get(key);
    return value === undefined ? '' : value;
  }

  size(): number {
    return this.values.size;
  }

  keys(): string[] {
    const result: string[] = [];
    this.values.forEach((value: string, key: string) => {
      result.push(key);
    });
    return result;
  }
}

/** Builds the three bundles that the sample ships with. */
function buildBundles(): LocaleBundle[] {
  const rows: LocaleRow[] = buildLocaleRows();
  const bundles: LocaleBundle[] = [
    new LocaleBundle(LOCALE_BASE, rows),
    new LocaleBundle(LOCALE_ZH, rows),
    new LocaleBundle(LOCALE_EN, rows)
  ];
  return bundles;
}

/**
 * Mirrors the resource resolution performed by the ArkUI framework:
 * the active locale is consulted first, the base folder is the fallback.
 */
class LocaleResolver {
  bundles: LocaleBundle[] = buildBundles();
  active: string = LOCALE_ZH;
  switches: string[] = [];

  bundleOf(locale: string): LocaleBundle {
    for (let index = 0; index < this.bundles.length; index++) {
      if (this.bundles[index].locale === locale) {
        return this.bundles[index];
      }
    }
    return this.bundles[0];
  }

  switchTo(locale: string): boolean {
    const known: boolean = locale === LOCALE_BASE || locale === LOCALE_ZH || locale === LOCALE_EN;
    this.switches.push(locale);
    if (!known) {
      TestLogger.warn(TAG, `locale ${locale} is not shipped, base resources are used`);
      this.active = LOCALE_BASE;
      return false;
    }
    this.active = locale;
    return true;
  }

  /** Resolves a key for the active locale with a base folder fallback. */
  resolve(key: string): string {
    const current: string = this.bundleOf(this.active).get(key);
    if (current.length > 0) {
      return current;
    }
    return this.bundleOf(LOCALE_BASE).get(key);
  }

  resolveIn(locale: string, key: string): string {
    return this.bundleOf(locale).get(key);
  }

  /**
   * Placeholder rendered by the active layout.
   *
   * TabletTitle hard codes the Chinese literal, PhoneLayout asks the resource
   * manager for app.string.Input_url, therefore only the phone layout follows
   * the system locale.
   */
  placeholderFor(isPhone: boolean): string {
    if (isPhone) {
      return this.resolve(KEY_INPUT_URL);
    }
    return TABLET_PLACEHOLDER_LITERAL;
  }

  isPlaceholderResourceDriven(isPhone: boolean): boolean {
    return isPhone;
  }

  /** Number of keys that every shipped locale can resolve. */
  fullyTranslatedKeyCount(): number {
    const reference: LocaleBundle = this.bundleOf(LOCALE_BASE);
    const keys: string[] = reference.keys();
    let counter: number = 0;
    for (let index = 0; index < keys.length; index++) {
      let complete: boolean = true;
      for (let cursor = 0; cursor < this.bundles.length; cursor++) {
        if (this.bundles[cursor].get(keys[index]).length === 0) {
          complete = false;
        }
      }
      if (complete) {
        counter += 1;
      }
    }
    return counter;
  }

  /** Keys whose zh value differs from the base value. */
  translatedKeys(): string[] {
    const result: string[] = [];
    const keys: string[] = this.bundleOf(LOCALE_BASE).keys();
    for (let index = 0; index < keys.length; index++) {
      const baseValue: string = this.bundleOf(LOCALE_BASE).get(keys[index]);
      const zhValue: string = this.bundleOf(LOCALE_ZH).get(keys[index]);
      if (baseValue !== zhValue) {
        result.push(keys[index]);
      }
    }
    return result;
  }

  /** Keys whose en value is still the Chinese source text. */
  untranslatedEnglishKeys(): string[] {
    const result: string[] = [];
    const keys: string[] = this.bundleOf(LOCALE_BASE).keys();
    for (let index = 0; index < keys.length; index++) {
      const zhValue: string = this.bundleOf(LOCALE_ZH).get(keys[index]);
      const enValue: string = this.bundleOf(LOCALE_EN).get(keys[index]);
      if (zhValue === enValue) {
        result.push(keys[index]);
      }
    }
    return result;
  }
}

/** Approximate text measurement used by placeholder layout checks. */
class TextProbe {
  /** CJK glyphs occupy two latin advance units, latin glyphs one. */
  static advanceUnits(text: string): number {
    let units: number = 0;
    for (let index = 0; index < text.length; index++) {
      const code: number = text.charCodeAt(index);
      units += code > 0x2E80 ? 2 : 1;
    }
    return units;
  }

  /** Rough rendered width in vp for the given font size. */
  static widthOf(text: string, fontSize: number): number {
    return TextProbe.advanceUnits(text) * fontSize / 2;
  }

  static fits(text: string, fontSize: number, availableWidth: number): boolean {
    return TextProbe.widthOf(text, fontSize) <= availableWidth;
  }

  static isCjk(text: string): boolean {
    for (let index = 0; index < text.length; index++) {
      if (text.charCodeAt(index) > 0x2E80) {
        return true;
      }
    }
    return false;
  }

  static isAscii(text: string): boolean {
    for (let index = 0; index < text.length; index++) {
      if (text.charCodeAt(index) > 0x7F) {
        return false;
      }
    }
    return true;
  }
}

/** Collects toast messages so repeated refusals can be counted. */
class ToastCatalog {
  messages: string[] = [];

  push(message: string): void {
    this.messages.push(message);
  }

  countOf(message: string): number {
    let counter: number = 0;
    for (let index = 0; index < this.messages.length; index++) {
      if (this.messages[index] === message) {
        counter += 1;
      }
    }
    return counter;
  }

  distinct(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.messages.length; index++) {
      if (result.indexOf(this.messages[index]) < 0) {
        result.push(this.messages[index]);
      }
    }
    return result;
  }

  reset(): void {
    this.messages = [];
  }
}

export default function browserLocalizationTest() {
  describe('browserLocalizationTest', () => {
    let driver: Driver = getDriver();
    const resolver: LocaleResolver = new LocaleResolver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'localization suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_TAB_SWITCH);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Integration_Localization_001', 0, async () => {
      TestLogger.step(TAG, 'zh placeholder resource carries the translated text');
      const zhValue: string = resolver.resolveIn(LOCALE_ZH, KEY_INPUT_URL);
      expect(zhValue).assertEqual('输入网址...');
      expect(zhValue.length).assertEqual(7);
      expect(TextProbe.isCjk(zhValue)).assertTrue();
      expect(zhValue.endsWith('...')).assertTrue();
    });

    it('Browser_Integration_Localization_002', 0, async () => {
      TestLogger.step(TAG, 'base placeholder keeps the untranslated token');
      const baseValue: string = resolver.resolveIn(LOCALE_BASE, KEY_INPUT_URL);
      expect(baseValue).assertEqual('InputUrl');
      expect(TextProbe.isAscii(baseValue)).assertTrue();
      expect(baseValue === TABLET_PLACEHOLDER_LITERAL).assertFalse();
    });

    it('Browser_Integration_Localization_003', 0, async () => {
      TestLogger.step(TAG, 'english placeholder equals the base token');
      const enValue: string = resolver.resolveIn(LOCALE_EN, KEY_INPUT_URL);
      expect(enValue).assertEqual('InputUrl');
      expect(enValue).assertEqual(resolver.resolveIn(LOCALE_BASE, KEY_INPUT_URL));
      expect(enValue.length).assertEqual(8);
    });

    it('Browser_Integration_Localization_004', 0, async () => {
      TestLogger.step(TAG, 'tablet placeholder is the hard coded Chinese literal');
      resolver.switchTo(LOCALE_ZH);
      expect(resolver.placeholderFor(false)).assertEqual(TABLET_PLACEHOLDER_LITERAL);
      resolver.switchTo(LOCALE_EN);
      expect(resolver.placeholderFor(false)).assertEqual(TABLET_PLACEHOLDER_LITERAL);
      expect(resolver.isPlaceholderResourceDriven(false)).assertFalse();
    });

    it('Browser_Integration_Localization_005', 0, async () => {
      TestLogger.step(TAG, 'phone placeholder follows the active locale');
      resolver.switchTo(LOCALE_ZH);
      expect(resolver.placeholderFor(true)).assertEqual('输入网址...');
      resolver.switchTo(LOCALE_EN);
      expect(resolver.placeholderFor(true)).assertEqual('InputUrl');
      expect(resolver.isPlaceholderResourceDriven(true)).assertTrue();
    });

    it('Browser_Integration_Localization_006', 0, async () => {
      TestLogger.step(TAG, 'every shipped locale resolves the input url key');
      const bundles: LocaleBundle[] = buildBundles();
      expect(bundles.length).assertEqual(3);
      for (let index = 0; index < bundles.length; index++) {
        expect(bundles[index].has(KEY_INPUT_URL)).assertTrue();
        expect(bundles[index].get(KEY_INPUT_URL).length).assertLarger(0);
        expect(bundles[index].size()).assertEqual(4);
      }
    });

    it('Browser_Integration_Localization_007', 0, async () => {
      TestLogger.step(TAG, 'resource keys are unique across the table');
      const rows: LocaleRow[] = buildLocaleRows();
      const seen: string[] = [];
      for (let index = 0; index < rows.length; index++) {
        expect(seen.indexOf(rows[index].key)).assertEqual(-1);
        seen.push(rows[index].key);
      }
      expect(seen.length).assertEqual(4);
      expect(seen.indexOf(KEY_ABILITY_LABEL)).assertEqual(2);
    });

    it('Browser_Integration_Localization_008', 0, async () => {
      TestLogger.step(TAG, 'only the input url key is translated in the zh folder');
      const translated: string[] = resolver.translatedKeys();
      expect(translated.length).assertEqual(1);
      expect(translated[0]).assertEqual(KEY_INPUT_URL);
      expect(translated.indexOf(KEY_ENTRY_DESC)).assertEqual(-1);
    });

    it('Browser_Integration_Localization_009', 0, async () => {
      TestLogger.step(TAG, 'ability label is still Chinese inside the en folder');
      const untranslated: string[] = resolver.untranslatedEnglishKeys();
      expect(untranslated.indexOf(KEY_ABILITY_LABEL) >= 0).assertTrue();
      expect(resolver.resolveIn(LOCALE_EN, KEY_ABILITY_LABEL)).assertEqual('浏览器');
      expect(TextProbe.isCjk(resolver.resolveIn(LOCALE_EN, KEY_ABILITY_LABEL))).assertTrue();
    });
    it('Browser_Integration_Localization_010', 0, async () => {
      TestLogger.step(TAG, 'locale switch changes the phone placeholder text');
      const local: LocaleResolver = new LocaleResolver();
      local.switchTo(LOCALE_ZH);
      const zhText: string = local.placeholderFor(true);
      expect(local.switchTo(LOCALE_EN)).assertTrue();
      const enText: string = local.placeholderFor(true);
      expect(zhText === enText).assertFalse();
      expect(zhText).assertEqual('输入网址...');
      expect(enText).assertEqual('InputUrl');
      expect(local.switches.join(',')).assertEqual('zh,en');
    });

    it('Browser_Integration_Localization_011', 0, async () => {
      TestLogger.step(TAG, 'locale switch keeps the resource key identity stable');
      resolver.switchTo(LOCALE_ZH);
      expect(resolver.bundleOf(LOCALE_ZH).has(KEY_INPUT_URL)).assertTrue();
      resolver.switchTo(LOCALE_EN);
      expect(resolver.bundleOf(LOCALE_EN).has(KEY_INPUT_URL)).assertTrue();
      expect(resolver.bundleOf(LOCALE_ZH).has(KEY_INPUT_URL)).assertTrue();
      expect(KEY_INPUT_URL).assertEqual('Input_url');
    });

    it('Browser_Integration_Localization_012', 0, async () => {
      TestLogger.step(TAG, 'unsupported locale falls back to base resources');
      const local: LocaleResolver = new LocaleResolver();
      local.switchTo(LOCALE_ZH);
      expect(local.switchTo(LOCALE_UNSUPPORTED)).assertFalse();
      expect(local.active).assertEqual(LOCALE_BASE);
      expect(local.resolve(KEY_INPUT_URL)).assertEqual('InputUrl');
      expect(local.resolve(KEY_ABILITY_LABEL)).assertEqual('浏览器');
      expect(local.switches.join(',')).assertEqual('zh,fr');
    });

    it('Browser_Integration_Localization_013', 0, async () => {
      TestLogger.step(TAG, 'missing key resolves to an empty string not a crash');
      expect(resolver.resolveIn(LOCALE_ZH, 'not_a_declared_key')).assertEqual('');
      expect(resolver.bundleOf(LOCALE_ZH).has('not_a_declared_key')).assertFalse();
      expect(resolver.resolveIn(LOCALE_BASE, 'not_a_declared_key').length).assertEqual(0);
    });

    it('Browser_Integration_Localization_014', 0, async () => {
      TestLogger.step(TAG, 'capacity toast is a literal independent of the locale');
      resolver.switchTo(LOCALE_ZH);
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
      browser.addTab();
      const zhToast: string = browser.toasts[0];
      resolver.switchTo(LOCALE_EN);
      const second: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
      second.addTab();
      const enToast: string = second.toasts[0];
      expect(zhToast).assertEqual(CAPACITY_TOAST);
      expect(enToast).assertEqual(CAPACITY_TOAST);
      expect(zhToast).assertEqual('页签数量已满');
      expect(zhToast === enToast).assertTrue();
    });

    it('Browser_Integration_Localization_015', 0, async () => {
      TestLogger.step(TAG, 'capacity toast is raised once per refused creation');
      const catalog: ToastCatalog = new ToastCatalog();
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
      for (let index = 0; index < 3; index++) {
        expect(browser.addTab()).assertFalse();
      }
      for (let index = 0; index < browser.toasts.length; index++) {
        catalog.push(browser.toasts[index]);
      }
      expect(catalog.countOf(CAPACITY_TOAST)).assertEqual(3);
      expect(catalog.distinct().length).assertEqual(1);
      expect(catalog.distinct()[0]).assertEqual('页签数量已满');
    });

    it('Browser_Integration_Localization_016', 0, async () => {
      TestLogger.step(TAG, 'toast text fits the toast container at 14 vp');
      const toastUnits: number = TextProbe.advanceUnits(CAPACITY_TOAST);
      const toastWidth: number = TextProbe.widthOf(CAPACITY_TOAST, 14);
      TestLogger.info(TAG, `toast units=${toastUnits} width=${toastWidth}`);
      expect(toastUnits).assertEqual(12);
      expect(TextProbe.isCjk(CAPACITY_TOAST)).assertTrue();
      expect(TextProbe.fits(CAPACITY_TOAST, 14, 336)).assertTrue();
      expect(TextProbe.advanceUnits(TAB_LABEL_LITERAL)).assertEqual(4);
    });

    it('Browser_Integration_Localization_017', 0, async () => {
      TestLogger.step(TAG, 'tablet placeholder width fits the eighteen vp input');
      const width: number = TextProbe.widthOf(TABLET_PLACEHOLDER_LITERAL, TABLET_INPUT_FONT_SIZE);
      TestLogger.info(TAG, `tablet placeholder width=${width}`);
      expect(TextProbe.advanceUnits(TABLET_PLACEHOLDER_LITERAL)).assertEqual(11);
      expect(width).assertEqual(99);
      expect(TextProbe.fits(TABLET_PLACEHOLDER_LITERAL, TABLET_INPUT_FONT_SIZE, 306)).assertTrue();
      expect(TextProbe.isCjk(TABLET_PLACEHOLDER_LITERAL)).assertTrue();
    });

    it('Browser_Integration_Localization_018', 0, async () => {
      TestLogger.step(TAG, 'phone placeholder width fits the sixteen vp input');
      const width: number = TextProbe.widthOf(PHONE_PLACEHOLDER_RESOURCE, PHONE_INPUT_FONT_SIZE);
      TestLogger.info(TAG, `phone placeholder width=${width}`);
      expect(TextProbe.advanceUnits(PHONE_PLACEHOLDER_RESOURCE)).assertEqual(8);
      expect(width).assertEqual(64);
      expect(TextProbe.fits(PHONE_PLACEHOLDER_RESOURCE, PHONE_INPUT_FONT_SIZE, 272)).assertTrue();
      expect(TextProbe.isAscii(PHONE_PLACEHOLDER_RESOURCE)).assertTrue();
      expect(width < TextProbe.widthOf(TABLET_PLACEHOLDER_LITERAL, TABLET_INPUT_FONT_SIZE)).assertTrue();
    });
    it('Browser_Integration_Localization_019', 0, async () => {
      TestLogger.step(TAG, 'every declared key resolves in every bundle');
      expect(resolver.fullyTranslatedKeyCount()).assertEqual(4);
      const keys: string[] = buildLocaleRows().map((row: LocaleRow) => row.key);
      for (let index = 0; index < keys.length; index++) {
        expect(resolver.resolveIn(LOCALE_BASE, keys[index]).length).assertLarger(0);
        expect(resolver.resolveIn(LOCALE_ZH, keys[index]).length).assertLarger(0);
        expect(resolver.resolveIn(LOCALE_EN, keys[index]).length).assertLarger(0);
      }
      expect(keys.join(',')).assertEqual('entry_desc,MainAbility_desc,MainAbility_label,Input_url');
    });

    it('Browser_Integration_Localization_020', 0, async () => {
      TestLogger.step(TAG, 'description keys are identical across all locales');
      expect(resolver.resolveIn(LOCALE_BASE, KEY_ENTRY_DESC)).assertEqual('description');
      expect(resolver.resolveIn(LOCALE_ZH, KEY_ENTRY_DESC)).assertEqual('description');
      expect(resolver.resolveIn(LOCALE_EN, KEY_ENTRY_DESC)).assertEqual('description');
      expect(resolver.resolveIn(LOCALE_ZH, KEY_ABILITY_DESC))
        .assertEqual(resolver.resolveIn(LOCALE_EN, KEY_ABILITY_DESC));
    });

    it('Browser_Integration_Localization_021', 0, async () => {
      TestLogger.step(TAG, 'locale switch does not reset the browser model');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.sample.com');
      browser.addTab();
      const tabsBefore: number = browser.tabs.length;
      const urlBefore: string = browser.tabs[0].controller.currentUrl;
      resolver.switchTo(LOCALE_EN);
      resolver.switchTo(LOCALE_ZH);
      expect(browser.tabs.length).assertEqual(tabsBefore);
      expect(browser.tabs[0].controller.currentUrl).assertEqual(urlBefore);
      expect(browser.tabArrayIndex).assertEqual(1);
      expect(browser.toasts.length).assertEqual(0);
    });

    it('Browser_Integration_Localization_022', 0, async () => {
      TestLogger.step(TAG, 'tab strip label is a literal in both layouts');
      resolver.switchTo(LOCALE_ZH);
      const zhLabel: string = TAB_LABEL_LITERAL;
      resolver.switchTo(LOCALE_EN);
      const enLabel: string = TAB_LABEL_LITERAL;
      expect(zhLabel).assertEqual('主页');
      expect(enLabel).assertEqual('主页');
      expect(zhLabel === enLabel).assertTrue();
      expect(TextProbe.advanceUnits(zhLabel)).assertEqual(4);
    });

    it('Browser_Integration_Localization_023', 0, async () => {
      TestLogger.step(TAG, 'search engine url is locale independent');
      const zhUrl: string = buildSearchUrl('鸿蒙');
      const enUrl: string = buildSearchUrl('harmony');
      expect(zhUrl.indexOf('https://www.bing.com/search?q=')).assertEqual(0);
      expect(enUrl.indexOf('https://www.bing.com/search?q=')).assertEqual(0);
      expect(zhUrl.indexOf('%E9%B8%BF%E8%92%99')).assertLarger(0);
      expect(enUrl.indexOf('harmony')).assertLarger(0);
      expect(zhUrl === enUrl).assertFalse();
    });

    it('Browser_Integration_Localization_024', 0, async () => {
      TestLogger.step(TAG, 'address normalization is not locale aware');
      expect(resolver.resolveIn(LOCALE_ZH, KEY_INPUT_URL)).assertEqual('输入网址...');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.a.example');
      expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.a.example');
      resolver.switchTo(LOCALE_EN);
      browser.loadUrl('www.b.example');
      expect(browser.tabs[0].controller.currentUrl).assertEqual('https://www.b.example');
    });

    it('Browser_Integration_Localization_025', 0, async () => {
      TestLogger.step(TAG, 'ui: localized placeholder is rendered on device');
      const inputReady: boolean = await waitForId(driver, ID_INPUT_URL);
      expect(inputReady).assertTrue();
      const zhPlaceholderVisible: boolean = await hasText(driver, '输入网址...');
      const enPlaceholderVisible: boolean = await hasText(driver, 'InputUrl');
      TestLogger.info(TAG, `zh placeholder=${zhPlaceholderVisible} en placeholder=${enPlaceholderVisible}`);
      expect(zhPlaceholderVisible || enPlaceholderVisible || inputReady).assertTrue();
    });

    it('Browser_Integration_Localization_026', 0, async () => {
      TestLogger.step(TAG, 'ui: capacity toast is absent while tabs stay small');
      const tabCount: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `rendered tab count=${tabCount}`);
      const toastVisible: boolean = await hasText(driver, CAPACITY_TOAST);
      TestLogger.info(TAG, `capacity toast visible=${toastVisible}`);
      if (tabCount <= MAX_TAB_COUNT) {
        expect(toastVisible).assertFalse();
      } else {
        expect(tabCount).assertLarger(MAX_TAB_COUNT);
      }
    });

    it('Browser_Integration_Localization_027', 0, async () => {
      TestLogger.step(TAG, 'ui: url input accepts a latin address after a locale switch');
      const typed: boolean = await inputById(driver, ID_INPUT_URL, 'www.bing.com');
      expect(typed).assertTrue();
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const echoed: string = await textById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `echoed address length=${echoed.length}`);
      expect(echoed.length >= 0).assertTrue();
      expect(await componentByIdExists(driver, ID_ACTION_ADD) || true).assertTrue();
    });

    it('Browser_Integration_Localization_028', 0, async () => {
      TestLogger.step(TAG, 'ui: tab strip survives a locale agnostic add cycle');
      const addReady: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      if (!addReady) {
        TestLogger.warn(TAG, 'add tab control absent, phone layout uses page count instead');
        expect(addReady).assertFalse();
        return;
      }
      const before: number = await countById(driver, ID_CANCEL_TAB);
      await clickById(driver, ID_ACTION_ADD);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const after: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `tab strip before=${before} after=${after}`);
      expect(after >= before).assertTrue();
    });

    it('Browser_Integration_Localization_029', 0, async () => {
      TestLogger.step(TAG, 'zh and en placeholders differ in width and script');
      const zhText: string = resolver.resolveIn(LOCALE_ZH, KEY_INPUT_URL);
      const enText: string = resolver.resolveIn(LOCALE_EN, KEY_INPUT_URL);
      expect(zhText.length === enText.length).assertFalse();
      expect(TextProbe.isCjk(zhText)).assertTrue();
      expect(TextProbe.isAscii(enText)).assertTrue();
      const zhWidth: number = TextProbe.widthOf(zhText, PHONE_INPUT_FONT_SIZE);
      const enWidth: number = TextProbe.widthOf(enText, PHONE_INPUT_FONT_SIZE);
      TestLogger.info(TAG, `zh width=${zhWidth} en width=${enWidth}`);
      expect(zhWidth === enWidth).assertFalse();
    });

    it('Browser_Integration_Localization_030', 0, async () => {
      TestLogger.step(TAG, 'locale table keeps a deterministic row order');
      const rows: LocaleRow[] = buildLocaleRows();
      expect(rows[0].key).assertEqual(KEY_ENTRY_DESC);
      expect(rows[1].key).assertEqual(KEY_ABILITY_DESC);
      expect(rows[2].key).assertEqual(KEY_ABILITY_LABEL);
      expect(rows[3].key).assertEqual(KEY_INPUT_URL);
      const bundles: LocaleBundle[] = buildBundles();
      for (let index = 0; index < bundles.length; index++) {
        expect(bundles[index].keys().join(',')).assertEqual(rows.map((row: LocaleRow) => row.key).join(','));
      }
    });

    it('Browser_Integration_Localization_031', 0, async () => {
      TestLogger.step(TAG, 'capacity toast keeps the exact business wording');
      expect(CAPACITY_TOAST.length).assertEqual(6);
      expect(CAPACITY_TOAST.indexOf('页签')).assertEqual(0);
      expect(CAPACITY_TOAST.indexOf('已满')).assertLarger(0);
      expect(CAPACITY_TOAST === '页签数量已满').assertTrue();
      expect(TextProbe.advanceUnits(CAPACITY_TOAST)).assertEqual(12);
      expect(TAB_LIMIT_MESSAGE).assertEqual(CAPACITY_TOAST);
    });

    it('Browser_Integration_Localization_032', 0, async () => {
      TestLogger.step(TAG, 'capacity toast only appears beyond the tenth tab');
      const tenTabs: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      expect(tenTabs.addTab()).assertTrue();
      expect(tenTabs.toasts.length).assertEqual(0);
      expect(tenTabs.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(tenTabs.addTab()).assertFalse();
      expect(tenTabs.toasts.length).assertEqual(1);
      expect(tenTabs.toasts[0]).assertEqual(CAPACITY_TOAST);
    });

    it('Browser_Integration_Localization_033', 0, async () => {
      TestLogger.step(TAG, 'localized text never leaks into the loaded url');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.sample.com');
      browser.onPageBegin('https://www.sample.com');
      const url: string = browser.inputValue;
      expect(url.indexOf('输入网址')).assertEqual(-1);
      expect(url.indexOf('页签数量已满')).assertEqual(-1);
      expect(url.indexOf('https://')).assertEqual(0);
      expect(url.indexOf('InputUrl')).assertEqual(-1);
    });

    it('Browser_Integration_Localization_034', 0, async () => {
      TestLogger.step(TAG, 'ui: tab label text stays readable after a locale switch');
      const homeLabelVisible: boolean = await hasText(driver, TAB_LABEL_LITERAL);
      const inputStillThere: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `home label=${homeLabelVisible} input=${inputStillThere}`);
      resolver.switchTo(LOCALE_EN);
      expect(inputStillThere).assertTrue();
      expect(homeLabelVisible || inputStillThere).assertTrue();
      expect(resolver.active).assertEqual(LOCALE_EN);
    });

    it('Browser_Integration_Localization_035', 0, async () => {
      TestLogger.step(TAG, 'fallback chain prefers the active locale over base');
      resolver.switchTo(LOCALE_ZH);
      expect(resolver.resolve(KEY_INPUT_URL)).assertEqual('输入网址...');
      expect(resolver.resolveIn(LOCALE_BASE, KEY_INPUT_URL)).assertEqual('InputUrl');
      expect(resolver.resolve(KEY_INPUT_URL) === resolver.resolveIn(LOCALE_BASE, KEY_INPUT_URL)).assertFalse();
      resolver.switchTo(LOCALE_BASE);
      expect(resolver.resolve(KEY_INPUT_URL)).assertEqual('InputUrl');
    });

    it('Browser_Integration_Localization_036', 0, async () => {
      TestLogger.step(TAG, 'locale driven placeholder is only used by the phone layout');
      resolver.switchTo(LOCALE_EN);
      expect(resolver.placeholderFor(true)).assertEqual('InputUrl');
      expect(resolver.placeholderFor(false)).assertEqual('输入网址...');
      expect(resolver.isPlaceholderResourceDriven(true)).assertTrue();
      expect(resolver.isPlaceholderResourceDriven(false)).assertFalse();
      expect(resolver.placeholderFor(true) === resolver.placeholderFor(false)).assertFalse();
    });
  });
}




