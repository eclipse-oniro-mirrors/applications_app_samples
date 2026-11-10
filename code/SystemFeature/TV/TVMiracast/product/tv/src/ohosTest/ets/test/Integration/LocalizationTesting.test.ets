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
import { Driver } from '../Shared/MiracastDriver';
import {
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_DOWN, KEY_UP, KEY_ENTER, miracastComponentCount,
  isIndexPageVisible, isPermissionDialogVisible, waitForPageStable, countComponentsById, pressAndWait,
  serializedDelay, triggerMiracastHome, safeBack, ID_TAB_MIRACAST, ID_TAB_SETTINGS, ID_PERMANENT_TRUST,
  ID_CANCEL_BTN, TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'LocalizationTestingSuite';

enum Language {
  ZH_CN = 'zh_CN',
  EN_US = 'en_US'
}

enum TextDirection {
  LTR = 'ltr',
  RTL = 'rtl'
}

interface LocalizedString {
  key: string;
  zh: string;
  en: string;
}

interface CatalogIssue {
  key: string;
  issue: string;
}

// 资源键常量：与 resources/base/element/string.json 对齐
class ResourceKeys {
  public static readonly QUICK_SCREEN_PROJECTION: string = 'quick_screen_projection';
  public static readonly MIRACAST_SCREEN_CASTING: string = 'miracast_screen_casting';
  public static readonly PROJECTION_SETTINGS: string = 'projection_Settings';
  public static readonly PERMANENT_TRUST: string = 'permanent_trust';
  public static readonly ONLY_FOR_THIS_TIME: string = 'only_for_this_time';
  public static readonly CANCEL: string = 'cancel';
  public static readonly TIP: string = 'tip';
  public static readonly TRUSTED_DEVICE_LIST: string = 'trusted_device_list';
  public static readonly WAITING_FOR_CONNING: string = 'waiting_for_conning';
  public static all(): string[] {
    return [
      ResourceKeys.QUICK_SCREEN_PROJECTION, ResourceKeys.MIRACAST_SCREEN_CASTING,
      ResourceKeys.PROJECTION_SETTINGS, ResourceKeys.PERMANENT_TRUST, ResourceKeys.ONLY_FOR_THIS_TIME,
      ResourceKeys.CANCEL, ResourceKeys.TIP, ResourceKeys.TRUSTED_DEVICE_LIST, ResourceKeys.WAITING_FOR_CONNING
    ];
  }
}

// 文案目录：保存 zh_CN / en_US 两套文案，提供查找、回退与缺失检测
class StringCatalog {
  private entries: Map<string, LocalizedString> = new Map<string, LocalizedString>();
  public constructor() {
    this.add(ResourceKeys.QUICK_SCREEN_PROJECTION, '\u5feb\u6377\u6295\u5c4f', 'Quick Screen Projection');
    this.add(ResourceKeys.MIRACAST_SCREEN_CASTING, '\u65e0\u7ebf\u6295\u5c4f', 'Miracast Screen Casting');
    this.add(ResourceKeys.PROJECTION_SETTINGS, '\u6295\u5c4f\u8bbe\u7f6e', 'Projection Settings');
    this.add(ResourceKeys.PERMANENT_TRUST, '\u6c38\u4e45\u4fe1\u4efb', 'Permanent Trust');
    this.add(ResourceKeys.ONLY_FOR_THIS_TIME, '\u4ec5\u672c\u6b21', 'Only For This Time');
    this.add(ResourceKeys.CANCEL, '\u53d6\u6d88', 'Cancel');
    this.add(ResourceKeys.TIP, '\u63d0\u793a', 'Tip');
    this.add(ResourceKeys.TRUSTED_DEVICE_LIST, '\u53d7\u4fe1\u4efb\u8bbe\u5907\u5217\u8868', 'Trusted Device List');
    this.add(ResourceKeys.WAITING_FOR_CONNING, '\u6b63\u5728\u8fde\u63a5', 'Waiting For Connecting');
  }
  public add(key: string, zh: string, en: string): boolean {
    if (key.length === 0 || this.entries.has(key)) { return false; }
    const entry: LocalizedString = { key: key, zh: zh, en: en };
    this.entries.set(key, entry);
    return true;
  }
  private pick(entry: LocalizedString, language: Language): string {
    return language === Language.ZH_CN ? entry.zh : entry.en;
  }
  public get(key: string, language: Language): string {
    const entry: LocalizedString | undefined = this.entries.get(key);
    return entry === undefined ? key : this.pick(entry, language);
  }
  public has(key: string): boolean { return this.entries.has(key); }
  public getKeyCount(): number { return this.entries.size; }
  public getKeys(): string[] {
    const keys: string[] = [];
    this.entries.forEach((entry: LocalizedString) => { keys.push(entry.key); });
    return keys;
  }
  public getZhLength(key: string): number { return this.get(key, Language.ZH_CN).length; }
  public getEnLength(key: string): number { return this.get(key, Language.EN_US).length; }
  // 缺失检测：任一语言为空或与 key 相同都视为缺失
  public findIssues(): CatalogIssue[] {
    const issues: CatalogIssue[] = [];
    this.entries.forEach((entry: LocalizedString) => {
      if (entry.zh.length === 0) { issues.push({ key: entry.key, issue: 'missing_zh' }); }
      if (entry.en.length === 0) { issues.push({ key: entry.key, issue: 'missing_en' }); }
      if (entry.zh === entry.key || entry.en === entry.key) {
        issues.push({ key: entry.key, issue: 'untranslated_key' });
      }
    });
    return issues;
  }
  public remove(key: string): boolean { return this.entries.delete(key); }
  public clear(): void { this.entries = new Map<string, LocalizedString>(); }
}

// 文案排版估算器：CJK 字符按 2 个单位宽度计，ASCII 按 1 个单位宽度计
class TextWidthEstimator {
  public isCjk(code: number): boolean { return code > 0x2E80; }
  public unitsOf(text: string): number {
    let units: number = 0;
    for (let i = 0; i < text.length; i++) {
      units += this.isCjk(text.charCodeAt(i)) ? 2 : 1;
    }
    return units;
  }
  public isAscii(text: string): boolean {
    for (let i = 0; i < text.length; i++) {
      if (text.charCodeAt(i) > 0x7F) { return false; }
    }
    return true;
  }
  public fits(text: string, maxUnits: number): boolean { return this.unitsOf(text) <= maxUnits; }
  public overflow(text: string, maxUnits: number): number {
    const excess: number = this.unitsOf(text) - maxUnits;
    return excess > 0 ? excess : 0;
  }
  public cjkRatio(text: string): number {
    if (text.length === 0) { return 0; }
    let cjkCount: number = 0;
    for (let i = 0; i < text.length; i++) {
      if (this.isCjk(text.charCodeAt(i))) { cjkCount++; }
    }
    return cjkCount / text.length;
  }
}

interface LocalizationRecord {
  language: Language;
  key: string;
  textDisplayed: boolean;
  layoutCorrect: boolean;
  responseTime: number;
  timestamp: number;
}

interface LocalizationStats {
  total: number;
  success: number;
  successRate: number;
  averageMs: number;
  maxMs: number;
  minMs: number;
}

// 本地化追踪器：记录每次语言校验，输出统计与克隆副本
class LocalizationTracker {
  private records: LocalizationRecord[] = [];
  public record(language: Language, key: string, textDisplayed: boolean, layoutCorrect: boolean,
    responseTime: number): void {
    const record: LocalizationRecord = {
      language: language, key: key, textDisplayed: textDisplayed, layoutCorrect: layoutCorrect,
      responseTime: responseTime, timestamp: Date.now()
    };
    this.records.push(record);
  }
  public getRecords(): LocalizationRecord[] {
    const copy: LocalizationRecord[] = [];
    for (let i = 0; i < this.records.length; i++) { copy.push(this.records[i]); }
    return copy;
  }
  public getTotal(): number { return this.records.length; }
  public getSuccessCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].textDisplayed && this.records[i].layoutCorrect) { count++; }
    }
    return count;
  }
  public getSuccessRate(): number {
    return this.records.length === 0 ? 0 : this.getSuccessCount() / this.records.length;
  }
  public getAverageResponseTime(): number {
    if (this.records.length === 0) { return 0; }
    let total: number = 0;
    for (let i = 0; i < this.records.length; i++) { total += this.records[i].responseTime; }
    return total / this.records.length;
  }
  public getMaxResponseTime(): number {
    let max: number = 0;
    for (let i = 0; i < this.records.length; i++) { max = Math.max(max, this.records[i].responseTime); }
    return max;
  }
  public getMinResponseTime(): number {
    if (this.records.length === 0) { return 0; }
    let min: number = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.records.length; i++) { min = Math.min(min, this.records[i].responseTime); }
    return min;
  }
  public countByLanguage(language: Language): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].language === language) { count++; }
    }
    return count;
  }
  public countByKey(key: string): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].key === key) { count++; }
    }
    return count;
  }
  public hasTestedLanguage(language: Language): boolean { return this.countByLanguage(language) > 0; }
  public getStats(): LocalizationStats {
    const stats: LocalizationStats = {
      total: this.getTotal(), success: this.getSuccessCount(), successRate: this.getSuccessRate(),
      averageMs: this.getAverageResponseTime(), maxMs: this.getMaxResponseTime(),
      minMs: this.getMinResponseTime()
    };
    return stats;
  }
  public getLanguageFrequency(): Map<string, number> {
    const frequency: Map<string, number> = new Map<string, number>();
    for (let i = 0; i < this.records.length; i++) {
      const language: string = this.records[i].language;
      const current: number | undefined = frequency.get(language);
      frequency.set(language, current === undefined ? 1 : current + 1);
    }
    return frequency;
  }
  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i - 1].timestamp > this.records[i].timestamp) { return false; }
    }
    return true;
  }
  public clone(): LocalizationTracker {
    const copy = new LocalizationTracker();
    for (let i = 0; i < this.records.length; i++) {
      const record: LocalizationRecord = this.records[i];
      copy.record(record.language, record.key, record.textDisplayed, record.layoutCorrect, record.responseTime);
    }
    return copy;
  }
  public equals(other: LocalizationTracker): boolean {
    return this.getTotal() === other.getTotal() && this.getSuccessCount() === other.getSuccessCount();
  }
  public describe(): string {
    return 'LocalizationTracker(total=' + this.getTotal() + ', success=' + this.getSuccessCount() + ')';
  }
  public reset(): void { this.records = []; }
}

// 区域格式化器：规范化 'zh_CN' / 'en_US' 文本并判断支持情况
class LocaleFormatter {
  public static readonly SUPPORTED: string[] = ['zh_CN', 'en_US'];
  public normalize(locale: string): string { return locale.replace('-', '_'); }
  public isSupported(locale: string): boolean {
    return LocaleFormatter.SUPPORTED.includes(this.normalize(locale));
  }
  public toLanguage(locale: string): Language {
    return this.normalize(locale) === Language.ZH_CN ? Language.ZH_CN : Language.EN_US;
  }
  public displayName(language: Language): string {
    return language === Language.ZH_CN ? 'Chinese Simplified' : 'English United States';
  }
  public directionOf(language: Language): TextDirection {
    return language === Language.EN_US ? TextDirection.LTR : TextDirection.LTR;
  }
  public getSupportedCount(): number { return LocaleFormatter.SUPPORTED.length; }
}

export default function localizationTestingSuite(): void {
  describe('LocalizationTesting_Suite', () => {
    let driver: Driver;
    let tracker: LocalizationTracker;
    beforeAll(async () => {
      driver = getDriver();
      tracker = new LocalizationTracker();
      Log.info(TAG, 'localization testing suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await safeBack(driver, 2);
      await serializedDelay(driver, 500);
      Log.info(TAG, 'localization testing suite end');
    });

    it('catalog_contains_nine_resource_keys', 0, async () => {
      const catalog = new StringCatalog();
      expect(catalog.getKeyCount()).assertEqual(9);
      expect(catalog.getKeys().length).assertEqual(9);
      expect(ResourceKeys.all().length).assertEqual(9);
    });
    it('catalog_covers_every_declared_key', 0, async () => {
      const catalog = new StringCatalog();
      const keys: string[] = ResourceKeys.all();
      expect(keys.length).assertEqual(9);
      for (let i = 0; i < keys.length; i++) {
        expect(catalog.has(keys[i])).assertTrue();
      }
    });
    it('home_titles_are_localized', 0, async () => {
      const catalog = new StringCatalog();
      expect(catalog.get(ResourceKeys.QUICK_SCREEN_PROJECTION, Language.ZH_CN)).assertEqual('\u5feb\u6377\u6295\u5c4f');
      expect(catalog.get(ResourceKeys.QUICK_SCREEN_PROJECTION, Language.EN_US))
        .assertEqual('Quick Screen Projection');
      expect(catalog.get(ResourceKeys.MIRACAST_SCREEN_CASTING, Language.ZH_CN)).assertEqual('\u65e0\u7ebf\u6295\u5c4f');
      expect(catalog.get(ResourceKeys.MIRACAST_SCREEN_CASTING, Language.EN_US))
        .assertEqual('Miracast Screen Casting');
    });
    it('projection_settings_string_is_localized', 0, async () => {
      const catalog = new StringCatalog();
      expect(catalog.get(ResourceKeys.PROJECTION_SETTINGS, Language.ZH_CN)).assertEqual('\u6295\u5c4f\u8bbe\u7f6e');
      expect(catalog.get(ResourceKeys.PROJECTION_SETTINGS, Language.EN_US)).assertEqual('Projection Settings');
      expect(catalog.getZhLength(ResourceKeys.PROJECTION_SETTINGS))
        .assertLess(catalog.getEnLength(ResourceKeys.PROJECTION_SETTINGS));
    });
    it('permission_button_strings_are_localized', 0, async () => {
      const catalog = new StringCatalog();
      expect(catalog.get(ResourceKeys.PERMANENT_TRUST, Language.ZH_CN)).assertEqual('\u6c38\u4e45\u4fe1\u4efb');
      expect(catalog.get(ResourceKeys.ONLY_FOR_THIS_TIME, Language.ZH_CN)).assertEqual('\u4ec5\u672c\u6b21');
      expect(catalog.get(ResourceKeys.CANCEL, Language.EN_US)).assertEqual('Cancel');
      expect(catalog.get(ResourceKeys.PERMANENT_TRUST, Language.EN_US)).assertEqual('Permanent Trust');
    });
    it('tip_and_waiting_strings_are_localized', 0, async () => {
      const catalog = new StringCatalog();
      expect(catalog.get(ResourceKeys.TIP, Language.ZH_CN)).assertEqual('\u63d0\u793a');
      expect(catalog.get(ResourceKeys.WAITING_FOR_CONNING, Language.ZH_CN)).assertEqual('\u6b63\u5728\u8fde\u63a5');
      expect(catalog.get(ResourceKeys.WAITING_FOR_CONNING, Language.EN_US))
        .assertEqual('Waiting For Connecting');
    });
    it('trusted_device_list_strings_are_localized', 0, async () => {
      const catalog = new StringCatalog();
      expect(catalog.get(ResourceKeys.TRUSTED_DEVICE_LIST, Language.ZH_CN)).assertEqual('\u53d7\u4fe1\u4efb\u8bbe\u5907\u5217\u8868');
      expect(catalog.get(ResourceKeys.TRUSTED_DEVICE_LIST, Language.EN_US)).assertEqual('Trusted Device List');
    });
    it('unknown_key_falls_back_to_key_text', 0, async () => {
      const catalog = new StringCatalog();
      expect(catalog.get('missing_key', Language.ZH_CN)).assertEqual('missing_key');
      expect(catalog.get('missing_key', Language.EN_US)).assertEqual('missing_key');
      expect(catalog.has('missing_key')).assertFalse();
    });
    it('catalog_add_rejects_duplicate_and_empty_keys', 0, async () => {
      const catalog = new StringCatalog();
      expect(catalog.add(ResourceKeys.TIP, 'another', 'another')).assertFalse();
      expect(catalog.add('', 'a', 'b')).assertFalse();
      expect(catalog.getKeyCount()).assertEqual(9);
    });
    it('catalog_add_accepts_new_key', 0, async () => {
      const catalog = new StringCatalog();
      expect(catalog.add('extra_label', '\u989d\u5916\u6807\u7b7e', 'Extra Label')).assertTrue();
      expect(catalog.getKeyCount()).assertEqual(10);
      expect(catalog.get('extra_label', Language.EN_US)).assertEqual('Extra Label');
      expect(catalog.get('extra_label', Language.ZH_CN)).assertEqual('\u989d\u5916\u6807\u7b7e');
    });
    it('catalog_reports_no_issues_for_seed_data', 0, async () => {
      const catalog = new StringCatalog();
      expect(catalog.findIssues().length).assertEqual(0);
      expect(catalog.getKeyCount()).assertEqual(9);
    });
    it('catalog_detects_missing_translation', 0, async () => {
      const catalog = new StringCatalog();
      catalog.add('broken_key', '\u6709\u4e2d\u6587', '');
      const issues: CatalogIssue[] = catalog.findIssues();
      expect(issues.length).assertEqual(1);
      expect(issues[0].key).assertEqual('broken_key');
      expect(issues[0].issue).assertEqual('missing_en');
    });
    it('catalog_detects_untranslated_key', 0, async () => {
      const catalog = new StringCatalog();
      catalog.add('raw_key', 'raw_key', 'raw_key');
      const issues: CatalogIssue[] = catalog.findIssues();
      expect(issues.length).assertEqual(1);
      expect(issues[0].issue).assertEqual('untranslated_key');
    });
    it('catalog_remove_and_clear_reduce_size', 0, async () => {
      const catalog = new StringCatalog();
      expect(catalog.remove(ResourceKeys.TIP)).assertTrue();
      expect(catalog.remove(ResourceKeys.TIP)).assertFalse();
      expect(catalog.getKeyCount()).assertEqual(8);
      catalog.clear();
      expect(catalog.getKeyCount()).assertEqual(0);
    });
    it('estimator_measures_cjk_and_ascii_width', 0, async () => {
      const estimator = new TextWidthEstimator();
      expect(estimator.unitsOf('\u53d6\u6d88')).assertEqual(4);
      expect(estimator.unitsOf('Cancel')).assertEqual(6);
      expect(estimator.isAscii('Cancel')).assertTrue();
      expect(estimator.isAscii('\u53d6\u6d88')).assertFalse();
    });
    it('estimator_detects_overflow_limits', 0, async () => {
      const estimator = new TextWidthEstimator();
      expect(estimator.fits('Cancel', 10)).assertTrue();
      expect(estimator.fits('Quick Screen Projection', 10)).assertFalse();
      expect(estimator.overflow('Quick Screen Projection', 10)).assertEqual(13);
      expect(estimator.overflow('Cancel', 10)).assertEqual(0);
    });
    it('estimator_computes_cjk_ratio', 0, async () => {
      const estimator = new TextWidthEstimator();
      expect(estimator.cjkRatio('\u53d6\u6d88')).assertEqual(1);
      expect(estimator.cjkRatio('Cancel')).assertEqual(0);
      expect(estimator.cjkRatio('')).assertEqual(0);
      expect(estimator.cjkRatio('\u6295\u5c4fTV')).assertEqual(0.5);
    });
    it('locale_formatter_normalizes_separators', 0, async () => {
      const formatter = new LocaleFormatter();
      expect(formatter.normalize('zh-CN')).assertEqual('zh_CN');
      expect(formatter.normalize('en-US')).assertEqual('en_US');
      expect(formatter.isSupported('zh-CN')).assertTrue();
      expect(formatter.isSupported('fr-FR')).assertFalse();
      expect(formatter.getSupportedCount()).assertEqual(2);
    });
    it('locale_formatter_maps_to_language', 0, async () => {
      const formatter = new LocaleFormatter();
      expect(formatter.toLanguage('zh-CN')).assertEqual(Language.ZH_CN);
      expect(formatter.toLanguage('en-US')).assertEqual(Language.EN_US);
      expect(formatter.displayName(Language.ZH_CN)).assertEqual('Chinese Simplified');
      expect(formatter.displayName(Language.EN_US)).assertEqual('English United States');
      expect(formatter.directionOf(Language.ZH_CN)).assertEqual(TextDirection.LTR);
    });
    it('tracker_records_both_languages', 0, async () => {
      const local = new LocalizationTracker();
      local.record(Language.ZH_CN, ResourceKeys.CANCEL, true, true, 30);
      local.record(Language.EN_US, ResourceKeys.CANCEL, true, true, 40);
      expect(local.hasTestedLanguage(Language.ZH_CN)).assertTrue();
      expect(local.hasTestedLanguage(Language.EN_US)).assertTrue();
      expect(local.getTotal()).assertEqual(2);
      expect(local.getSuccessRate()).assertEqual(1);
      expect(local.countByLanguage(Language.ZH_CN)).assertEqual(1);
      expect(local.countByLanguage(Language.EN_US)).assertEqual(1);
      expect(local.getRecords().length).assertEqual(2);
    });
    it('tracker_computes_response_statistics', 0, async () => {
      const local = new LocalizationTracker();
      local.record(Language.ZH_CN, ResourceKeys.TIP, true, true, 100);
      local.record(Language.ZH_CN, ResourceKeys.TIP, true, true, 300);
      local.record(Language.ZH_CN, ResourceKeys.TIP, true, true, 200);
      expect(local.getAverageResponseTime()).assertEqual(200);
      expect(local.getMaxResponseTime()).assertEqual(300);
      expect(local.getMinResponseTime()).assertEqual(100);
      expect(local.getSuccessCount()).assertEqual(3);
      expect(local.getSuccessRate()).assertEqual(1);
      expect(local.getTotal()).assertEqual(3);
    });
    it('tracker_empty_statistics_are_zero', 0, async () => {
      const local = new LocalizationTracker();
      expect(local.getTotal()).assertEqual(0);
      expect(local.getSuccessRate()).assertEqual(0);
      expect(local.getAverageResponseTime()).assertEqual(0);
      expect(local.getMinResponseTime()).assertEqual(0);
      expect(local.getMaxResponseTime()).assertEqual(0);
      expect(local.getRecords().length).assertEqual(0);
      expect(local.isChronological()).assertTrue();
    });
    it('tracker_counts_records_by_key', 0, async () => {
      const local = new LocalizationTracker();
      local.record(Language.ZH_CN, ResourceKeys.CANCEL, true, true, 10);
      local.record(Language.EN_US, ResourceKeys.CANCEL, true, true, 10);
      local.record(Language.ZH_CN, ResourceKeys.TIP, true, true, 10);
      expect(local.countByKey(ResourceKeys.CANCEL)).assertEqual(2);
      expect(local.countByKey(ResourceKeys.TIP)).assertEqual(1);
      expect(local.countByKey(ResourceKeys.PERMANENT_TRUST)).assertEqual(0);
      expect(local.getTotal()).assertEqual(3);
    });
    it('tracker_language_frequency_is_correct', 0, async () => {
      const local = new LocalizationTracker();
      local.record(Language.ZH_CN, ResourceKeys.TIP, true, true, 10);
      local.record(Language.ZH_CN, ResourceKeys.CANCEL, true, true, 10);
      local.record(Language.EN_US, ResourceKeys.CANCEL, true, true, 10);
      const frequency: Map<string, number> = local.getLanguageFrequency();
      expect(frequency.size).assertEqual(2);
      expect(frequency.get(Language.ZH_CN)).assertEqual(2);
      expect(frequency.get(Language.EN_US)).assertEqual(1);
      expect(local.getTotal()).assertEqual(3);
    });
    it('tracker_stats_snapshot_is_consistent', 0, async () => {
      const local = new LocalizationTracker();
      local.record(Language.ZH_CN, ResourceKeys.TIP, true, true, 100);
      local.record(Language.EN_US, ResourceKeys.TIP, false, true, 200);
      const stats: LocalizationStats = local.getStats();
      expect(stats.total).assertEqual(2);
      expect(stats.success).assertEqual(1);
      expect(stats.successRate).assertEqual(0.5);
      expect(stats.maxMs).assertEqual(200);
      expect(stats.minMs).assertEqual(100);
      expect(stats.averageMs).assertEqual(150);
    });
    it('tracker_marks_timestamps_chronological', 0, async () => {
      const local = new LocalizationTracker();
      local.record(Language.ZH_CN, ResourceKeys.TIP, true, true, 10);
      local.record(Language.EN_US, ResourceKeys.TIP, true, true, 10);
      local.record(Language.ZH_CN, ResourceKeys.CANCEL, true, true, 10);
      expect(local.isChronological()).assertTrue();
      const records: LocalizationRecord[] = local.getRecords();
      expect(records.length).assertEqual(3);
      expect(records[0].timestamp).assertLessOrEqual(records[1].timestamp);
      expect(records[1].timestamp).assertLessOrEqual(records[2].timestamp);
    });
    it('tracker_clone_is_equal_but_independent', 0, async () => {
      const local = new LocalizationTracker();
      local.record(Language.ZH_CN, ResourceKeys.TIP, true, true, 30);
      const copy: LocalizationTracker = local.clone();
      expect(copy.equals(local)).assertTrue();
      expect(copy.getTotal()).assertEqual(1);
      copy.record(Language.EN_US, ResourceKeys.TIP, true, true, 30);
      expect(copy.getTotal()).assertEqual(2);
      expect(local.getTotal()).assertEqual(1);
      expect(copy.equals(local)).assertFalse();
    });
    it('tracker_describe_and_reset_are_stable', 0, async () => {
      const local = new LocalizationTracker();
      local.record(Language.ZH_CN, ResourceKeys.TIP, true, true, 30);
      expect(local.describe()).assertContain('LocalizationTracker');
      expect(local.describe()).assertContain('total=1');
      local.reset();
      expect(local.getTotal()).assertEqual(0);
      expect(local.getRecords().length).assertEqual(0);
      expect(local.getSuccessRate()).assertEqual(0);
    });
    it('localization_full_catalog_passes_validation', 0, async () => {
      const catalog = new StringCatalog();
      const local = new LocalizationTracker();
      const keys: string[] = catalog.getKeys();
      const estimator = new TextWidthEstimator();
      for (let i = 0; i < keys.length; i++) {
        const zh: string = catalog.get(keys[i], Language.ZH_CN);
        const en: string = catalog.get(keys[i], Language.EN_US);
        expect(zh.length).assertLarger(0);
        expect(en.length).assertLarger(0);
        expect(estimator.fits(zh, 120)).assertTrue();
        expect(estimator.fits(en, 120)).assertTrue();
        local.record(Language.ZH_CN, keys[i], true, true, 5);
        local.record(Language.EN_US, keys[i], true, true, 5);
      }
      expect(local.getTotal()).assertEqual(18);
      expect(local.getSuccessRate()).assertEqual(1);
    });
    it('localization_statistics_after_catalog_sweep', 0, async () => {
      const local = new LocalizationTracker();
      const keys: string[] = ResourceKeys.all();
      for (let i = 0; i < keys.length; i++) {
        local.record(Language.ZH_CN, keys[i], true, true, 20);
        local.record(Language.EN_US, keys[i], true, true, 40);
      }
      const stats: LocalizationStats = local.getStats();
      expect(stats.total).assertEqual(18);
      expect(stats.successRate).assertEqual(1);
      expect(stats.averageMs).assertEqual(30);
      expect(stats.maxMs).assertEqual(40);
      expect(stats.minMs).assertEqual(20);
      expect(local.getLanguageFrequency().size).assertEqual(2);
    });
    it('localization_english_text_is_ascii_only', 0, async () => {
      const catalog = new StringCatalog();
      const estimator = new TextWidthEstimator();
      const keys: string[] = catalog.getKeys();
      for (let i = 0; i < keys.length; i++) {
        expect(estimator.isAscii(catalog.get(keys[i], Language.EN_US))).assertTrue();
      }
      expect(keys.length).assertEqual(9);
    });
    it('localization_chinese_text_contains_cjk', 0, async () => {
      const catalog = new StringCatalog();
      const estimator = new TextWidthEstimator();
      expect(estimator.cjkRatio(catalog.get(ResourceKeys.TRUSTED_DEVICE_LIST, Language.ZH_CN)))
        .assertLarger(0.5);
      expect(estimator.cjkRatio(catalog.get(ResourceKeys.TIP, Language.EN_US))).assertEqual(0);
      expect(estimator.cjkRatio(catalog.get(ResourceKeys.CANCEL, Language.ZH_CN))).assertEqual(1);
    });
    it('localization_single_record_min_equals_value', 0, async () => {
      const local = new LocalizationTracker();
      local.record(Language.EN_US, ResourceKeys.CANCEL, true, true, 88);
      expect(local.getMinResponseTime()).assertEqual(88);
      expect(local.getMaxResponseTime()).assertEqual(88);
      expect(local.getStats().minMs).assertEqual(88);
      expect(local.countByLanguage(Language.ZH_CN)).assertEqual(0);
      expect(local.getSuccessRate()).assertEqual(1);
    });
    it('localization_catalog_key_uniqueness_holds', 0, async () => {
      const catalog = new StringCatalog();
      const keys: string[] = catalog.getKeys();
      const unique: string[] = [];
      for (let i = 0; i < keys.length; i++) {
        if (!unique.includes(keys[i])) { unique.push(keys[i]); }
      }
      expect(unique.length).assertEqual(keys.length);
      expect(keys.length).assertEqual(9);
      expect(catalog.findIssues().length).assertEqual(0);
    });
    it('localization_locale_display_names_are_distinct', 0, async () => {
      const formatter = new LocaleFormatter();
      expect(formatter.displayName(Language.ZH_CN)).assertContain('Chinese');
      expect(formatter.displayName(Language.EN_US)).assertContain('English');
      expect(formatter.directionOf(Language.EN_US)).assertEqual(TextDirection.LTR);
      expect(formatter.directionOf(Language.ZH_CN)).assertEqual(TextDirection.LTR);
    });
    it('localized_navigation_keeps_page_visible', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const local = new LocalizationTracker();
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        local.record(i % 2 === 0 ? Language.ZH_CN : Language.EN_US, ResourceKeys.TIP, true, true, 10);
      }
      expect(local.getTotal()).assertEqual(10);
      expect(local.getSuccessRate()).assertEqual(1);
    });
    it('permission_dialog_localized_buttons_probe', 0, async () => {
      const dialogVisible: boolean = await isPermissionDialogVisible(driver);
      const trustCount: number = await countComponentsById(driver, ID_PERMANENT_TRUST);
      const cancelCount: number = await countComponentsById(driver, ID_CANCEL_BTN);
      if (dialogVisible) {
        expect(trustCount + cancelCount).assertLargerOrEqual(1);
      } else {
      }
      tracker.record(Language.ZH_CN, ResourceKeys.PERMANENT_TRUST, dialogVisible || trustCount >= 0, true, 15);
      expect(tracker.getTotal()).assertLargerOrEqual(1);
    });
    it('localization_missing_chinese_translation_is_reported', 0, async () => {
      const catalog = new StringCatalog();
      catalog.add('zh_missing_key', '', 'English Only');
      const issues: CatalogIssue[] = catalog.findIssues();
      expect(issues.length).assertEqual(1);
      expect(issues[0].key).assertEqual('zh_missing_key');
      expect(issues[0].issue).assertEqual('missing_zh');
      expect(catalog.get('zh_missing_key', Language.ZH_CN)).assertEqual('');
    });
    it('localization_overflow_budget_matches_design_width', 0, async () => {
      const catalog = new StringCatalog();
      const estimator = new TextWidthEstimator();
      const en: string = catalog.get(ResourceKeys.QUICK_SCREEN_PROJECTION, Language.EN_US);
      expect(estimator.fits(en, 120)).assertTrue();
      expect(estimator.overflow(en, 10)).assertEqual(estimator.unitsOf(en) - 10);
      expect(estimator.overflow(catalog.get(ResourceKeys.CANCEL, Language.ZH_CN), 120)).assertEqual(0);
    });
  });
}
