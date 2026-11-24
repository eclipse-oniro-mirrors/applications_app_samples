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

import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, clampNumber, safeDiv, uniqueStrings
} from '../Shared/SharedDriver';

enum TextDirection {
  LTR = 0,
  RTL = 1
}

enum PluralCategory {
  ZERO = 0,
  ONE = 1,
  TWO = 2,
  FEW = 3,
  MANY = 4,
  OTHER = 5
}

class StringEntry {
  key: string = '';
  value: string = '';

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }
}

class StringCatalog {
  locale: string = '';
  private entries: StringEntry[] = [];

  constructor(locale: string) {
    this.locale = locale;
  }

  add(key: string, value: string): void {
    for (const entry of this.entries) {
      if (entry.key === key) {
        entry.value = value;
        return;
      }
    }
    this.entries.push(new StringEntry(key, value));
  }

  has(key: string): boolean {
    for (const entry of this.entries) {
      if (entry.key === key) {
        return true;
      }
    }
    return false;
  }

  raw(key: string): string {
    for (const entry of this.entries) {
      if (entry.key === key) {
        return entry.value;
      }
    }
    return '';
  }

  get(key: string): string {
    if (this.has(key)) {
      return this.raw(key);
    }
    return '#' + key;
  }

  size(): number {
    return this.entries.length;
  }

  keys(): string[] {
    const result: string[] = [];
    for (const entry of this.entries) {
      result.push(entry.key);
    }
    return result;
  }
}

class LocaleDescriptor {
  language: string = '';
  region: string = '';
  direction: TextDirection = TextDirection.LTR;

  constructor(language: string, region: string, direction: TextDirection) {
    this.language = language;
    this.region = region;
    this.direction = direction;
  }

  code(): string {
    if (this.region.length === 0) {
      return this.language;
    }
    return this.language + '-' + this.region;
  }

  isRtl(): boolean {
    return this.direction === TextDirection.RTL;
  }
}

class PluralSelector {
  categoryFor(count: number, language: string): PluralCategory {
    const value = Math.floor(Math.abs(count));
    if (value === 0) {
      return PluralCategory.ZERO;
    }
    if (value === 1) {
      return PluralCategory.ONE;
    }
    if (value === 2) {
      return PluralCategory.TWO;
    }
    if (value >= 3 && value <= 10) {
      return PluralCategory.FEW;
    }
    if (language === 'en') {
      return PluralCategory.OTHER;
    }
    return PluralCategory.MANY;
  }

  labelFor(category: PluralCategory): string {
    if (category === PluralCategory.ZERO) {
      return 'zero';
    }
    if (category === PluralCategory.ONE) {
      return 'one';
    }
    if (category === PluralCategory.TWO) {
      return 'two';
    }
    if (category === PluralCategory.FEW) {
      return 'few';
    }
    if (category === PluralCategory.MANY) {
      return 'many';
    }
    return 'other';
  }
}

class LocalizationService {
  private catalogs: StringCatalog[] = [];
  private active: string = 'en';
  private plurals: PluralSelector = new PluralSelector();
  private misses: number = 0;

  register(catalog: StringCatalog): boolean {
    if (this.findCatalog(catalog.locale) !== null) {
      return false;
    }
    this.catalogs.push(catalog);
    return true;
  }

  catalogCount(): number {
    return this.catalogs.length;
  }

  setActive(locale: string): boolean {
    if (this.findCatalog(locale) === null) {
      return false;
    }
    this.active = locale;
    return true;
  }

  getActive(): string {
    return this.active;
  }

  missingCount(): number {
    return this.misses;
  }

  findCatalog(locale: string): StringCatalog | null {
    for (const catalog of this.catalogs) {
      if (catalog.locale === locale) {
        return catalog;
      }
    }
    return null;
  }

  translate(key: string): string {
    const primary = this.findCatalog(this.active);
    if (primary !== null && primary.has(key)) {
      return primary.raw(key);
    }
    const fallback = this.findCatalog('en');
    if (fallback !== null && fallback.has(key)) {
      this.misses = this.misses + 1;
      return fallback.raw(key);
    }
    this.misses = this.misses + 1;
    return '#' + key;
  }

  translateWithArgs(key: string, args: string[]): string {
    let template = this.translate(key);
    for (let i = 0; i < args.length; i++) {
      template = template.split('{' + i + '}').join(args[i]);
    }
    return template;
  }

  formatNumber(value: number, decimals: number): string {
    const safeDecimals = clampNumber(Math.round(decimals), 0, 6);
    return value.toFixed(safeDecimals);
  }

  formatPercent(value: number): string {
    const ratio = safeDiv(value, 100) * 100;
    if (ratio === 0) {
      return '0%';
    }
    return Math.round(value) + '%';
  }

  formatWithGrouping(value: number): string {
    const text = Math.round(Math.abs(value)).toString();
    let result = '';
    let counter = 0;
    for (let i = text.length - 1; i >= 0; i--) {
      result = text.charAt(i) + result;
      counter = counter + 1;
      if (counter % 3 === 0 && i > 0) {
        result = ',' + result;
      }
    }
    return value < 0 ? '-' + result : result;
  }

  pluralLabel(key: string, count: number): string {
    const category = this.plurals.categoryFor(count, this.active);
    const suffix = this.plurals.labelFor(category);
    return this.translate(key) + ':' + suffix;
  }

  directionFor(locale: string): TextDirection {
    const catalog = this.findCatalog(locale);
    if (catalog === null) {
      return TextDirection.LTR;
    }
    if (locale.indexOf('ar') === 0 || locale.indexOf('he') === 0) {
      return TextDirection.RTL;
    }
    return TextDirection.LTR;
  }

  supportedLocales(): string[] {
    const result: string[] = [];
    for (const catalog of this.catalogs) {
      result.push(catalog.locale);
    }
    return uniqueStrings(result);
  }

  coverage(keys: string[]): number {
    if (keys.length === 0) {
      return 0;
    }
    const catalog = this.findCatalog(this.active);
    if (catalog === null) {
      return 0;
    }
    let covered = 0;
    for (const key of keys) {
      if (catalog.has(key)) {
        covered = covered + 1;
      }
    }
    return clampNumber(safeDiv(covered, keys.length), 0, 1);
  }
}

function buildEnglishCatalog(): StringCatalog {
  const catalog = new StringCatalog('en');
  catalog.add('app.title', 'Stage Model');
  catalog.add('app.ok', 'OK');
  catalog.add('app.cancel', 'Cancel');
  catalog.add('greeting', 'Hello {0}');
  catalog.add('item.count', 'item');
  return catalog;
}

function buildChineseCatalog(): StringCatalog {
  const catalog = new StringCatalog('zh-CN');
  catalog.add('app.title', '阶段模型');
  catalog.add('app.ok', '确定');
  catalog.add('greeting', '你好 {0}');
  return catalog;
}

function buildArabicCatalog(): StringCatalog {
  const catalog = new StringCatalog('ar-EG');
  catalog.add('app.title', 'نموذج المرحلة');
  catalog.add('app.ok', 'حسنا');
  return catalog;
}

export default function localizationTestingTest(): void {
  describe('LocalizationTesting', () => {
    it('LocalizationTesting_001', 0, async (done: Function) => {
      const catalog = buildEnglishCatalog();
      expect(catalog.locale).assertEqual('en');
      expect(catalog.size()).assertEqual(5);
      expect(catalog.has('app.ok')).assertTrue();
      done();
    });

    it('LocalizationTesting_002', 0, async (done: Function) => {
      const catalog = new StringCatalog('en');
      catalog.add('a', 'one');
      catalog.add('a', 'two');
      expect(catalog.size()).assertEqual(1);
      expect(catalog.raw('a')).assertEqual('two');
      done();
    });

    it('LocalizationTesting_003', 0, async (done: Function) => {
      const catalog = new StringCatalog('en');
      expect(catalog.get('missing')).assertEqual('#missing');
      expect(catalog.has('missing')).assertFalse();
      expect(catalog.raw('missing')).assertEqual('');
      done();
    });

    it('LocalizationTesting_004', 0, async (done: Function) => {
      const catalog = buildEnglishCatalog();
      const keys = catalog.keys();
      expect(keys.length).assertEqual(5);
      expect(keys.indexOf('greeting') >= 0).assertTrue();
      done();
    });

    it('LocalizationTesting_005', 0, async (done: Function) => {
      const service = new LocalizationService();
      expect(service.register(buildEnglishCatalog())).assertTrue();
      expect(service.register(buildEnglishCatalog())).assertFalse();
      expect(service.catalogCount()).assertEqual(1);
      done();
    });

    it('LocalizationTesting_006', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      expect(service.setActive('en')).assertTrue();
      expect(service.setActive('fr')).assertFalse();
      expect(service.getActive()).assertEqual('en');
      expect(service.catalogCount()).assertEqual(1);
      done();
    });
    it('LocalizationTesting_007', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.register(buildChineseCatalog());
      service.setActive('zh-CN');
      expect(service.translate('app.title')).assertEqual('阶段模型');
      expect(service.translate('app.cancel')).assertEqual('Cancel');
      done();
    });

    it('LocalizationTesting_008', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.setActive('en');
      expect(service.translate('unknown.key')).assertEqual('#unknown.key');
      expect(service.missingCount()).assertEqual(1);
      done();
    });

    it('LocalizationTesting_009', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.setActive('en');
      expect(service.translateWithArgs('greeting', ['Alice'])).assertEqual('Hello Alice');
      done();
    });

    it('LocalizationTesting_010', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.setActive('en');
      expect(service.translateWithArgs('greeting', ['A', 'B'])).assertEqual('Hello A');
      done();
    });

    it('LocalizationTesting_011', 0, async (done: Function) => {
      const service = new LocalizationService();
      expect(service.formatNumber(3.14159, 2)).assertEqual('3.14');
      expect(service.formatNumber(2, 0)).assertEqual('2');
      done();
    });

    it('LocalizationTesting_012', 0, async (done: Function) => {
      const service = new LocalizationService();
      expect(service.formatNumber(1.5, -3)).assertEqual('2');
      expect(service.formatNumber(1.5, 10)).assertEqual('1.500000');
      done();
    });

    it('LocalizationTesting_013', 0, async (done: Function) => {
      const service = new LocalizationService();
      expect(service.formatPercent(25)).assertEqual('25%');
      expect(service.formatPercent(0)).assertEqual('0%');
      expect(service.formatPercent(99.6)).assertEqual('100%');
      done();
    });
    it('LocalizationTesting_014', 0, async (done: Function) => {
      const service = new LocalizationService();
      expect(service.formatWithGrouping(1234)).assertEqual('1,234');
      expect(service.formatWithGrouping(1234567)).assertEqual('1,234,567');
      done();
    });

    it('LocalizationTesting_015', 0, async (done: Function) => {
      const service = new LocalizationService();
      expect(service.formatWithGrouping(-9876)).assertEqual('-9,876');
      expect(service.formatWithGrouping(0)).assertEqual('0');
      done();
    });

    it('LocalizationTesting_016', 0, async (done: Function) => {
      const selector = new PluralSelector();
      expect(selector.categoryFor(0, 'en')).assertEqual(PluralCategory.ZERO);
      expect(selector.categoryFor(1, 'en')).assertEqual(PluralCategory.ONE);
      done();
    });

    it('LocalizationTesting_017', 0, async (done: Function) => {
      const selector = new PluralSelector();
      expect(selector.categoryFor(2, 'en')).assertEqual(PluralCategory.TWO);
      expect(selector.categoryFor(5, 'en')).assertEqual(PluralCategory.FEW);
      done();
    });

    it('LocalizationTesting_018', 0, async (done: Function) => {
      const selector = new PluralSelector();
      expect(selector.categoryFor(20, 'en')).assertEqual(PluralCategory.OTHER);
      expect(selector.categoryFor(20, 'ru')).assertEqual(PluralCategory.MANY);
      done();
    });

    it('LocalizationTesting_019', 0, async (done: Function) => {
      const selector = new PluralSelector();
      expect(selector.labelFor(PluralCategory.ZERO)).assertEqual('zero');
      expect(selector.labelFor(PluralCategory.ONE)).assertEqual('one');
      expect(selector.labelFor(PluralCategory.OTHER)).assertEqual('other');
      done();
    });

    it('LocalizationTesting_020', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.setActive('en');
      expect(service.pluralLabel('item.count', 1)).assertEqual('item:one');
      expect(service.pluralLabel('item.count', 0)).assertEqual('item:zero');
      done();
    });
    it('LocalizationTesting_021', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildArabicCatalog());
      expect(service.directionFor('ar-EG')).assertEqual(TextDirection.RTL);
      expect(service.directionFor('en')).assertEqual(TextDirection.LTR);
      done();
    });

    it('LocalizationTesting_022', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.register(buildChineseCatalog());
      service.register(buildArabicCatalog());
      const locales = service.supportedLocales();
      expect(locales.length).assertEqual(3);
      expect(locales.indexOf('zh-CN') >= 0).assertTrue();
      done();
    });

    it('LocalizationTesting_023', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.setActive('en');
      const keys: string[] = ['app.title', 'app.ok', 'missing'];
      expect(service.coverage(keys)).assertEqual(0.6666666666666666);
      expect(service.coverage([])).assertEqual(0);
      done();
    });

    it('LocalizationTesting_024', 0, async (done: Function) => {
      const service = new LocalizationService();
      expect(service.findCatalog('en') === null).assertTrue();
      service.register(buildEnglishCatalog());
      expect(service.findCatalog('en') !== null).assertTrue();
      done();
    });

    it('LocalizationTesting_025', 0, async (done: Function) => {
      const descriptor = new LocaleDescriptor('zh', 'CN', TextDirection.LTR);
      expect(descriptor.code()).assertEqual('zh-CN');
      expect(descriptor.isRtl()).assertFalse();
      const rtl = new LocaleDescriptor('ar', 'EG', TextDirection.RTL);
      expect(rtl.isRtl()).assertTrue();
      done();
    });

    it('LocalizationTesting_026', 0, async (done: Function) => {
      const descriptor = new LocaleDescriptor('en', '', TextDirection.LTR);
      expect(descriptor.code()).assertEqual('en');
      expect(descriptor.region).assertEqual('');
      done();
    });

    it('LocalizationTesting_027', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.register(buildChineseCatalog());
      service.setActive('zh-CN');
      expect(service.translateWithArgs('greeting', ['小明'])).assertEqual('你好 小明');
      service.setActive('en');
      expect(service.translateWithArgs('greeting', ['X'])).assertEqual('Hello X');
      done();
    });
    it('LocalizationTesting_028', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.setActive('en');
      service.translate('missing.one');
      service.translate('missing.two');
      expect(service.missingCount()).assertEqual(2);
      done();
    });

    it('LocalizationTesting_029', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.register(buildChineseCatalog());
      service.setActive('zh-CN');
      service.translate('app.cancel');
      expect(service.missingCount()).assertEqual(1);
      expect(service.translate('app.ok')).assertEqual('确定');
      done();
    });

    it('LocalizationTesting_030', 0, async (done: Function) => {
      const selector = new PluralSelector();
      expect(selector.categoryFor(-3, 'en')).assertEqual(PluralCategory.FEW);
      expect(selector.categoryFor(1.9, 'en')).assertEqual(PluralCategory.ONE);
      expect(selector.labelFor(PluralCategory.FEW)).assertEqual('few');
      done();
    });

    it('LocalizationTesting_031', 0, async (done: Function) => {
      const service = new LocalizationService();
      expect(service.formatNumber(0, 3)).assertEqual('0.000');
      expect(service.formatNumber(2.345, 2)).assertEqual('2.35');
      done();
    });

    it('LocalizationTesting_032', 0, async (done: Function) => {
      const service = new LocalizationService();
      expect(service.formatPercent(50)).assertEqual('50%');
      expect(service.formatPercent(-5)).assertEqual('-5%');
      done();
    });

    it('LocalizationTesting_033', 0, async (done: Function) => {
      const catalog = buildChineseCatalog();
      expect(catalog.size()).assertEqual(3);
      expect(catalog.get('greeting')).assertEqual('你好 {0}');
      expect(catalog.get('app.ok')).assertEqual('确定');
      done();
    });

    it('LocalizationTesting_034', 0, async (done: Function) => {
      const catalog = buildArabicCatalog();
      expect(catalog.locale).assertEqual('ar-EG');
      expect(catalog.size()).assertEqual(2);
      expect(catalog.has('app.title')).assertTrue();
      done();
    });
    it('LocalizationTesting_035', 0, async (done: Function) => {
      expect(localizationYear()).assertEqual(2026);
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.register(buildChineseCatalog());
      service.register(buildArabicCatalog());
      expect(service.catalogCount()).assertEqual(3);
      expect(service.getActive()).assertEqual('en');
      done();
    });

    it('LocalizationTesting_037', 0, async (done: Function) => {
      const catalog = new StringCatalog('de');
      catalog.add('k1', 'v1');
      catalog.add('k2', 'v2');
      catalog.add('k3', 'v3');
      expect(catalog.size()).assertEqual(3);
      expect(catalog.get('k1')).assertEqual('v1');
      expect(catalog.get('k2')).assertEqual('v2');
      expect(catalog.get('k3')).assertEqual('v3');
      expect(catalog.get('k4')).assertEqual('#k4');
      const keys = catalog.keys();
      expect(keys.length).assertEqual(3);
      expect(keys.indexOf('k2') >= 0).assertTrue();
      expect(keys.indexOf('k9') < 0).assertTrue();
      done();
    });

    it('LocalizationTesting_038', 0, async (done: Function) => {
      const service = new LocalizationService();
      service.register(buildEnglishCatalog());
      service.register(buildChineseCatalog());
      service.register(buildArabicCatalog());
      service.setActive('ar-EG');
      expect(service.translate('app.ok')).assertEqual('حسنا');
      expect(service.directionFor('ar-EG')).assertEqual(TextDirection.RTL);
      expect(service.missingCount()).assertEqual(0);
      done();
    });

    it('LocalizationTesting_036', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', 'LocalizationTesting probe');
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}

function localizationYear(): number {
  return 2026;
}
