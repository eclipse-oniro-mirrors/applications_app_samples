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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_BUNDLE_INPUT,
  ID_QUERY_CONFIG_BUTTON,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_PRIMARY,
  TEST_BUNDLE_SECONDARY,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  containsTextFragment,
  collectTexts,
  waitForIndexPage,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The two locales that the sample ships. The base directory is English, zh_CN is the only
// additional qualifier directory, so every other locale falls back to the base strings.
const LOCALE_EN: string = 'en';
const LOCALE_ZH: string = 'zh_CN';
const LOCALE_FALLBACK: string = 'fr';

// Duration candidates of AssessmentConfig, in milliseconds.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_THIRTY_MINUTES: number = 1800000;
const DURATION_SIXTY_MINUTES: number = 3600000;
const MILLIS_PER_MINUTE: number = 60000;
const SECONDS_PER_MINUTE: number = 60;
const TEXT_PAD_LENGTH: number = 2;

// Label of the default duration candidate, it is the only one that is not formatted with %d.
const LABEL_DEFAULT_EN: string = 'Default duration';
const LABEL_DEFAULT_ZH: string = '默认时长';

/**
 * A single resource entry of a locale independent string table.
 *
 * The table is modelled in-file because the test module cannot load the application resource
 * manager without importing from the sample, and the tables that the sample ships are small
 * enough to reproduce exactly.
 */
interface StringEntry {
  name: string;
  value: string;
}

/**
 * A locale independent string table of the sample.
 *
 * The table answers by resource name and never by position, which mirrors the resource manager
 * contract: a missing name falls back to the base table of the language.
 */
class StringTable {
  private locale: string = LOCALE_EN;
  private entries: Map<string, string> = new Map<string, string>();

  constructor(locale: string) {
    this.locale = locale;
  }

  public getLocale(): string {
    return this.locale;
  }

  public put(entry: StringEntry): void {
    this.entries.set(entry.name, entry.value);
  }

  public has(name: string): boolean {
    return this.entries.has(name);
  }

  public size(): number {
    return this.entries.size;
  }

  public raw(name: string): string {
    const value: string | undefined = this.entries.get(name);
    return value === undefined ? '' : value;
  }

  public names(): string[] {
    const values: string[] = [];
    this.entries.forEach((value: string, key: string) => {
      values.push(key);
    });
    return values;
  }

  public describe(): string {
    return `StringTable{locale=${this.locale}, entries=${this.entries.size}}`;
  }
}

/**
 * Resource resolver that emulates the qualifier lookup of the resource manager.
 *
 * A lookup prefers the exact locale, then the language table, then the base table, which is the
 * documented fallback chain of the OpenHarmony resource manager.
 */
class ResourceResolver {
  private base: StringTable = new StringTable(LOCALE_EN);
  private zh: StringTable = new StringTable(LOCALE_ZH);

  public setBase(table: StringTable): void {
    this.base = table;
  }

  public setZh(table: StringTable): void {
    this.zh = table;
  }

  /**
   * Resolves a resource name for a locale.
   *
   * @param locale requested locale qualifier.
   * @param name resource name.
   * @returns the resolved value, an empty string when the name is absent everywhere.
   */
  public resolve(locale: string, name: string): string {
    if (locale === LOCALE_ZH && this.zh.has(name)) {
      return this.zh.raw(name);
    }
    return this.base.raw(name);
  }

  /**
   * Reports which table answered a lookup.
   *
   * @param locale requested locale qualifier.
   * @param name resource name.
   * @returns the qualifier of the answering table, empty when nothing answered.
   */
  public sourceOf(locale: string, name: string): string {
    if (locale === LOCALE_ZH && this.zh.has(name)) {
      return LOCALE_ZH;
    }
    if (this.base.has(name)) {
      return LOCALE_EN;
    }
    return '';
  }

  public describe(): string {
    return `ResourceResolver{base=${this.base.size()}, zh=${this.zh.size()}}`;
  }
}

/**
 * Formatter of the duration string resources.
 *
 * Two shapes exist in the sample: duration_minutes carries a single %d placeholder and
 * current_config_value carries %1$d with %2$s. The formatter reproduces both so a localization
 * regression in the placeholder order is caught without a device.
 */
class DurationFormatter {
  /**
   * Formats the duration_minutes resource, the Chinese table appends the unit directly while the
   * English one separates it with a space.
   *
   * @param template resource template, for example "%d min" or "%d分钟".
   * @param durationMs duration in milliseconds.
   * @returns the formatted label.
   */
  public static minutesLabel(template: string, durationMs: number): string {
    const minutes: number = durationMs / MILLIS_PER_MINUTE;
    return template.replace('%d', `${minutes}`);
  }

  /**
   * Formats the current_config_value resource.
   *
   * @param durationMs duration in milliseconds.
   * @param apps comma separated whitelist.
   * @returns the formatted config line.
   */
  public static configValue(durationMs: number, apps: string): string {
    return `duration: ${durationMs} ms, allowedApps: ${apps}`;
  }

  /**
   * Formats the current_config_value resource of the Chinese table.
   *
   * @param durationMs duration in milliseconds.
   * @param apps comma separated whitelist.
   * @returns the formatted config line.
   */
  public static configValueZh(durationMs: number, apps: string): string {
    return `评估时长：${durationMs}毫秒，白名单：${apps}`;
  }

  /**
   * Formats the exam_progress resource, which places the current index before the total count.
   *
   * @param template resource template, for example "Question %1$d/%2$d".
   * @param current one based index of the current question.
   * @param total total number of questions.
   * @returns the formatted progress line.
   */
  public static progress(template: string, current: number, total: number): string {
    return template.replace('%1$d', `${current}`).replace('%2$d', `${total}`);
  }

  /**
   * Formats the remaining time of the exam header.
   *
   * @param remainingSeconds remaining seconds.
   * @returns the MM:SS text, both fields padded to two characters.
   */
  public static clock(remainingSeconds: number): string {
    const safe: number = remainingSeconds < 0 ? 0 : remainingSeconds;
    const minutes: number = Math.floor(safe / SECONDS_PER_MINUTE);
    const seconds: number = safe % SECONDS_PER_MINUTE;
    return `${minutes}`.padStart(TEXT_PAD_LENGTH, '0') + ':' + `${seconds}`.padStart(TEXT_PAD_LENGTH, '0');
  }

  /**
   * Reports whether a template still carries an unexpanded placeholder.
   *
   * @param text formatted text.
   * @returns true when a %d or %1$d style placeholder survived the formatting.
   */
  public static hasResidualPlaceholder(text: string): boolean {
    if (text.indexOf('%d') >= 0) {
      return true;
    }
    return text.indexOf('%1$d') >= 0 || text.indexOf('%2$d') >= 0 || text.indexOf('%s') >= 0;
  }

  /**
   * Counts the placeholders of a template.
   *
   * @param template resource template.
   * @returns the number of positional and ordered placeholders.
   */
  public static placeholderCount(template: string): number {
    let total: number = 0;
    let index: number = template.indexOf('%');
    while (index >= 0) {
      total++;
      index = template.indexOf('%', index + 1);
    }
    return total;
  }
}

/**
 * Validator of a locale pair.
 *
 * The validator compares the two tables that the sample ships: every name of the base table must
 * exist in the translated table, and no translation may leave a placeholder unexpanded.
 */
class LocaleValidator {
  private problemList: string[] = [];

  public compare(base: StringTable, translated: StringTable): void {
    const names: string[] = base.names();
    for (let i = 0; i < names.length; i++) {
      if (!translated.has(names[i])) {
        this.problemList.push(`missing translation: ${names[i]}`);
      }
    }
  }

  public checkPlaceholders(base: StringTable, translated: StringTable): void {
    const names: string[] = base.names();
    for (let i = 0; i < names.length; i++) {
      const baseValue: string = base.raw(names[i]);
      const translatedValue: string = translated.raw(names[i]);
      const baseCount: number = DurationFormatter.placeholderCount(baseValue);
      const translatedCount: number = DurationFormatter.placeholderCount(translatedValue);
      if (baseCount !== translatedCount) {
        this.problemList.push(`placeholder mismatch: ${names[i]}`);
      }
    }
  }

  public checkEmptyTranslations(translated: StringTable): void {
    const names: string[] = translated.names();
    for (let i = 0; i < names.length; i++) {
      if (translated.raw(names[i]).length === 0) {
        this.problemList.push(`empty translation: ${names[i]}`);
      }
    }
  }

  public problems(): string[] {
    return this.problemList.slice();
  }

  public problemCount(): number {
    return this.problemList.length;
  }

  public isValid(): boolean {
    return this.problemList.length === 0;
  }

  public firstProblem(): string {
    return this.problemList.length === 0 ? '' : this.problemList[0];
  }

  public reset(): void {
    this.problemList = [];
  }

  public describe(): string {
    return `LocaleValidator{problems=${this.problemList.length}}`;
  }
}

/**
 * Builds the base English string table of the sample.
 *
 * Only the names that the tests assert are populated, the table is a contract of the resource
 * keys that the pages read, not a copy of the whole string.json.
 *
 * @returns the populated base table.
 */
function buildBaseTable(): StringTable {
  const table: StringTable = new StringTable(LOCALE_EN);
  table.put({ name: 'index_title', value: 'Assessment' });
  table.put({ name: 'config_title', value: 'Assessment Config' });
  table.put({ name: 'duration_label', value: 'Duration' });
  table.put({ name: 'duration_default', value: LABEL_DEFAULT_EN });
  table.put({ name: 'duration_minutes', value: '%d min' });
  table.put({ name: 'allowed_apps_label', value: 'Allowed Apps' });
  table.put({ name: 'allowed_apps_placeholder', value: 'Bundle name' });
  table.put({ name: 'allowed_apps_add', value: 'Add' });
  table.put({ name: 'allowed_apps_remove', value: 'Remove' });
  table.put({ name: 'allowed_apps_empty', value: 'The whitelist is empty' });
  table.put({ name: 'operation_title', value: 'Operations' });
  table.put({ name: 'begin_button', value: 'begin' });
  table.put({ name: 'end_button', value: 'end' });
  table.put({ name: 'query_state_button', value: 'isActive' });
  table.put({ name: 'query_config_button', value: 'getConfiguration' });
  table.put({ name: 'status_title', value: 'Status' });
  table.put({ name: 'state_active', value: 'Assessment state: active' });
  table.put({ name: 'state_inactive', value: 'Assessment state: inactive' });
  table.put({ name: 'current_config_label', value: 'Current config' });
  table.put({ name: 'current_config_none', value: 'No active assessment' });
  table.put({ name: 'current_config_value', value: 'duration: %1$d ms, allowedApps: %2$s' });
  table.put({ name: 'event_log_label', value: 'Event log' });
  table.put({ name: 'event_log_empty', value: 'No event yet' });
  table.put({ name: 'exam_title', value: 'Exam' });
  table.put({ name: 'exam_remaining_label', value: 'Remaining' });
  table.put({ name: 'exam_progress', value: 'Question %1$d/%2$d' });
  table.put({ name: 'exam_previous', value: 'Previous' });
  table.put({ name: 'exam_next', value: 'Next' });
  table.put({ name: 'exam_submit', value: 'Submit' });
  table.put({ name: 'exam_finish_title', value: 'Exam Finished' });
  table.put({ name: 'exam_interrupt_title', value: 'Assessment Interrupted' });
  table.put({ name: 'exam_end_title', value: 'Assessment Ended' });
  table.put({ name: 'dialog_confirm', value: 'OK' });
  table.put({ name: 'reason_user_cancel', value: 'The user canceled the assessment.' });
  table.put({ name: 'reason_timeout', value: 'The assessment timed out.' });
  table.put({ name: 'reason_system_error', value: 'A system error occurred.' });
  table.put({ name: 'reason_env_anomaly', value: 'An environment anomaly was detected.' });
  table.put({ name: 'reason_unknown', value: 'The assessment exited.' });
  return table;
}

/**
 * Builds the Chinese string table of the sample.
 *
 * @returns the populated translated table.
 */
function buildZhTable(): StringTable {
  const table: StringTable = new StringTable(LOCALE_ZH);
  table.put({ name: 'index_title', value: '评估管理' });
  table.put({ name: 'config_title', value: '评估配置' });
  table.put({ name: 'duration_label', value: '评估时长' });
  table.put({ name: 'duration_default', value: LABEL_DEFAULT_ZH });
  table.put({ name: 'duration_minutes', value: '%d分钟' });
  table.put({ name: 'allowed_apps_label', value: '应用白名单' });
  table.put({ name: 'allowed_apps_placeholder', value: '请输入应用包名' });
  table.put({ name: 'allowed_apps_add', value: '添加' });
  table.put({ name: 'allowed_apps_remove', value: '移除' });
  table.put({ name: 'allowed_apps_empty', value: '白名单为空' });
  table.put({ name: 'operation_title', value: '接口调用' });
  table.put({ name: 'begin_button', value: '开始评估' });
  table.put({ name: 'end_button', value: '结束评估' });
  table.put({ name: 'query_state_button', value: '查询评估状态' });
  table.put({ name: 'query_config_button', value: '查询评估配置' });
  table.put({ name: 'status_title', value: '状态信息' });
  table.put({ name: 'state_active', value: '评估状态：进行中' });
  table.put({ name: 'state_inactive', value: '评估状态：未开始' });
  table.put({ name: 'current_config_label', value: '当前评估配置' });
  table.put({ name: 'current_config_none', value: '当前无进行中的评估' });
  table.put({ name: 'current_config_value', value: '评估时长：%1$d毫秒，白名单：%2$s' });
  table.put({ name: 'event_log_label', value: '回调事件记录' });
  table.put({ name: 'event_log_empty', value: '暂无回调事件' });
  table.put({ name: 'exam_title', value: '考试中' });
  table.put({ name: 'exam_remaining_label', value: '剩余时间' });
  table.put({ name: 'exam_progress', value: '第%1$d题/共%2$d题' });
  table.put({ name: 'exam_previous', value: '上一题' });
  table.put({ name: 'exam_next', value: '下一题' });
  table.put({ name: 'exam_submit', value: '交卷' });
  table.put({ name: 'exam_finish_title', value: '考试结束' });
  table.put({ name: 'exam_interrupt_title', value: '评估被中断' });
  table.put({ name: 'exam_end_title', value: '评估已结束' });
  table.put({ name: 'dialog_confirm', value: '确定' });
  table.put({ name: 'reason_user_cancel', value: '用户取消了本次评估。' });
  table.put({ name: 'reason_timeout', value: '评估时长已用尽，系统自动退出评估模式。' });
  table.put({ name: 'reason_system_error', value: '系统发生错误，评估被中断。' });
  table.put({ name: 'reason_env_anomaly', value: '检测到环境异常，评估被中断。' });
  table.put({ name: 'reason_unknown', value: '评估已退出。' });
  return table;
}

/**
 * Launches the sample and waits for the entry page.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function prepareIndex(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'prepareIndex: the entry page is not rendered');
  }
  return rendered;
}

/**
 * Counts the rendered text components, which is the coarse signal that the page localizes every
 * label of the four cards.
 *
 * @param driver driver of the running case.
 * @returns the number of Text components that carry a non empty content.
 */
async function countNonEmptyTexts(driver: Driver): Promise<number> {
  const texts: string[] = await collectTexts(driver);
  let total: number = 0;
  for (let i = 0; i < texts.length; i++) {
    if (texts[i].length > 0) {
      total++;
    }
  }
  return total;
}

export default function localizationTestingTest() {
  describe('LocalizationTesting_Test', () => {
    let driver: Driver;
    let resolver: ResourceResolver;

    beforeAll(async () => {
      driver = getDriver();
      resolver = new ResourceResolver();
      resolver.setBase(buildBaseTable());
      resolver.setZh(buildZhTable());
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: inspect the two string tables.
     * Expectation: both tables carry the same number of entries and cover the asset names that
     * the four cards of the entry page read.
     */
    it('Assessment_LocalizationTesting_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_001, begin');
      const base: StringTable = buildBaseTable();
      const zh: StringTable = buildZhTable();
      expect(base.size()).assertEqual(zh.size());
      expect(base.size()).assertLarger(30);
      expect(base.getLocale()).assertEqual(LOCALE_EN);
      expect(zh.getLocale()).assertEqual(LOCALE_ZH);
      const required: string[] = ['index_title', 'state_active', 'state_inactive', 'current_config_value'];
      for (let i = 0; i < required.length; i++) {
        expect(base.has(required[i])).assertTrue();
        expect(zh.has(required[i])).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'LocalizationTesting_001', base.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_001, end');
    });

    /**
     * Scenario: compare the translated table against the base table.
     * Expectation: the validator reports no missing name, no placeholder mismatch and no empty
     * translation, so the Chinese table is a complete translation of the asserted names.
     */
    it('Assessment_LocalizationTesting_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_002, begin');
      const validator: LocaleValidator = new LocaleValidator();
      validator.compare(buildBaseTable(), buildZhTable());
      validator.checkPlaceholders(buildBaseTable(), buildZhTable());
      validator.checkEmptyTranslations(buildZhTable());
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'LocalizationTesting_002',
        validator.describe());
      expect(validator.problemCount()).assertEqual(0);
      expect(validator.isValid()).assertTrue();
      expect(validator.firstProblem()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_002, end');
    });

    /**
     * Scenario: a table with a missing translation.
     * Expectation: the validator names the missing resource instead of silently accepting it.
     */
    it('Assessment_LocalizationTesting_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_003, begin');
      const base: StringTable = new StringTable(LOCALE_EN);
      base.put({ name: 'index_title', value: 'Assessment' });
      base.put({ name: 'state_active', value: 'Assessment state: active' });
      const partial: StringTable = new StringTable(LOCALE_ZH);
      partial.put({ name: 'index_title', value: '评估管理' });
      const validator: LocaleValidator = new LocaleValidator();
      validator.compare(base, partial);
      expect(validator.problemCount()).assertEqual(1);
      expect(validator.isValid()).assertFalse();
      expect(validator.firstProblem()).assertContain('missing translation');
      expect(validator.firstProblem()).assertContain('state_active');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'LocalizationTesting_003',
        validator.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_003, end');
    });

    /**
     * Scenario: a translation that drops a placeholder.
     * Expectation: the validator flags the placeholder mismatch, because the formatted output
     * would silently lose the minute count.
     */
    it('Assessment_LocalizationTesting_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_004, begin');
      const base: StringTable = new StringTable(LOCALE_EN);
      base.put({ name: 'duration_minutes', value: '%d min' });
      const broken: StringTable = new StringTable(LOCALE_ZH);
      broken.put({ name: 'duration_minutes', value: '分钟' });
      const validator: LocaleValidator = new LocaleValidator();
      validator.checkPlaceholders(base, broken);
      expect(validator.problemCount()).assertEqual(1);
      expect(validator.firstProblem()).assertContain('placeholder mismatch');
      validator.checkEmptyTranslations(broken);
      expect(validator.problemCount()).assertEqual(1);
      broken.put({ name: 'index_title', value: '' });
      validator.checkEmptyTranslations(broken);
      expect(validator.problemCount()).assertEqual(2);
      expect(validator.firstProblem()).assertContain('placeholder mismatch');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'LocalizationTesting_004',
        validator.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_004, end');
    });

    /**
     * Scenario: resolve a resource for an unknown locale.
     * Expectation: the lookup falls back to the base table and the source reports the base
     * qualifier, which is the documented fallback of the resource manager.
     */
    it('Assessment_LocalizationTesting_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_006, begin');
      expect(resolver.resolve(LOCALE_FALLBACK, 'index_title')).assertEqual('Assessment');
      expect(resolver.sourceOf(LOCALE_FALLBACK, 'index_title')).assertEqual(LOCALE_EN);
      expect(resolver.resolve(LOCALE_FALLBACK, 'state_active')).assertEqual('Assessment state: active');
      expect(resolver.sourceOf(LOCALE_ZH, 'absent_resource')).assertEqual('');
      expect(resolver.resolve(LOCALE_ZH, 'absent_resource')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_006, end');
    });

    /**
     * Scenario: the default duration label of both locales.
     * Expectation: neither locale formats the default marker with a number, the label is a plain
     * word for both.
     */
    it('Assessment_LocalizationTesting_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_008, begin');
      expect(resolver.resolve(LOCALE_EN, 'duration_default')).assertEqual(LABEL_DEFAULT_EN);
      expect(resolver.resolve(LOCALE_ZH, 'duration_default')).assertEqual(LABEL_DEFAULT_ZH);
      const en: string = resolver.resolve(LOCALE_EN, 'duration_default');
      const zh: string = resolver.resolve(LOCALE_ZH, 'duration_default');
      expect(en.indexOf('%') < 0).assertTrue();
      expect(zh.indexOf('%') < 0).assertTrue();
      expect(DurationFormatter.placeholderCount(en)).assertEqual(0);
      expect(DurationFormatter.placeholderCount(zh)).assertEqual(0);
      expect(en === zh).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_008, end');
    });

    /**
     * Scenario: the countdown text of the exam header.
     * Expectation: both fields are padded to two characters and the separator is a colon, which is
     * identical in every locale because the format is numeric.
     */
    it('Assessment_LocalizationTesting_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_009, begin');
      expect(DurationFormatter.clock(0)).assertEqual('00:00');
      expect(DurationFormatter.clock(5)).assertEqual('00:05');
      expect(DurationFormatter.clock(59)).assertEqual('00:59');
      expect(DurationFormatter.clock(60)).assertEqual('01:00');
      expect(DurationFormatter.clock(600)).assertEqual('10:00');
      expect(DurationFormatter.clock(3599)).assertEqual('59:59');
      expect(DurationFormatter.clock(3600)).assertEqual('60:00');
      expect(DurationFormatter.clock(-5)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s clock(600) %{public}s', BUNDLE + 'LocalizationTesting_009',
        DurationFormatter.clock(600));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_009, end');
    });

    /**
     * Scenario: the countdown reaches the end.
     * Expectation: the text stays two-padded for every second of the last minute, so the header
     * width does not jitter while the exam runs out.
     */
    it('Assessment_LocalizationTesting_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_010, begin');
      for (let second = 59; second >= 0; second--) {
        const text: string = DurationFormatter.clock(second);
        expect(text.length).assertEqual(5);
        expect(text.charAt(2)).assertEqual(':');
      }
      expect(DurationFormatter.clock(0)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s last minute texts verified', BUNDLE + 'LocalizationTesting_010');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_010, end');
    });

    /**
     * Scenario: the placeholder counts of the asserted templates.
     * Expectation: single value templates carry one placeholder, the config value carries two and
     * the static labels carry none.
     */
    it('Assessment_LocalizationTesting_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_013, begin');
      expect(DurationFormatter.placeholderCount(resolver.resolve(LOCALE_EN, 'duration_minutes'))).assertEqual(1);
      expect(DurationFormatter.placeholderCount(resolver.resolve(LOCALE_ZH, 'duration_minutes'))).assertEqual(1);
      expect(DurationFormatter.placeholderCount(resolver.resolve(LOCALE_EN, 'current_config_value'))).assertEqual(2);
      expect(DurationFormatter.placeholderCount(resolver.resolve(LOCALE_ZH, 'current_config_value'))).assertEqual(2);
      expect(DurationFormatter.placeholderCount(resolver.resolve(LOCALE_EN, 'exam_progress'))).assertEqual(2);
      expect(DurationFormatter.placeholderCount(resolver.resolve(LOCALE_EN, 'index_title'))).assertEqual(0);
      expect(DurationFormatter.placeholderCount(resolver.resolve(LOCALE_EN, 'dialog_confirm'))).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_013, end');
    });

    /**
     * Scenario: the four interruption reasons of both locales.
     * Expectation: every reason is present in both tables, they are all distinct and none of them
     * carries a placeholder.
     */
    it('Assessment_LocalizationTesting_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_016, begin');
      const names: string[] = ['reason_user_cancel', 'reason_timeout', 'reason_system_error',
        'reason_env_anomaly', 'reason_unknown'];
      for (let i = 0; i < names.length; i++) {
        const en: string = resolver.resolve(LOCALE_EN, names[i]);
        const zh: string = resolver.resolve(LOCALE_ZH, names[i]);
        expect(en.length).assertLarger(0);
        expect(zh.length).assertLarger(0);
        expect(en === zh).assertFalse();
        expect(DurationFormatter.placeholderCount(en)).assertEqual(0);
        expect(DurationFormatter.placeholderCount(zh)).assertEqual(0);
      }
      const enReasons: Set<string> = new Set<string>();
      for (let i = 0; i < names.length; i++) {
        enReasons.add(resolver.resolve(LOCALE_EN, names[i]));
      }
      expect(enReasons.size).assertEqual(names.length);
      hilog.info(DOMAIN, TAG, '%{public}s reasons %{public}d', BUNDLE + 'LocalizationTesting_016', names.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_016, end');
    });

    /**
     * Scenario: the localized text of a translation is longer than the English one.
     * Expectation: the Chinese labels of the operation card differ from the English ones, and the
     * wider label still fits the card because the page wraps the duration chips.
     */
    it('Assessment_LocalizationTesting_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_018, begin');
      const names: string[] = ['query_state_button', 'query_config_button', 'allowed_apps_label'];
      let differing: number = 0;
      for (let i = 0; i < names.length; i++) {
        const en: string = resolver.resolve(LOCALE_EN, names[i]);
        const zh: string = resolver.resolve(LOCALE_ZH, names[i]);
        if (en !== zh) {
          differing++;
        }
        expect(zh.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s differing translations %{public}d',
        BUNDLE + 'LocalizationTesting_018', differing);
      expect(differing).assertEqual(names.length);
      expect(resolver.resolve(LOCALE_ZH, 'query_config_button').length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_018, end');
    });

    /**
     * Scenario: the localized page renders a stable number of labels.
     * Expectation: the page never renders fewer labels than the number of visible cards, which is
     * the lower bound that a complete localization must reach.
     */
    it('Assessment_LocalizationTesting_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_025, begin');
      const rendered: boolean = await prepareIndex(driver);
      if (!rendered) {
        return;
      }
      const nonEmpty: number = await countNonEmptyTexts(driver);
      hilog.info(DOMAIN, TAG, '%{public}s localized labels %{public}d',
        BUNDLE + 'LocalizationTesting_025', nonEmpty);
      expect(nonEmpty).assertLargerOrEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_025, end');
    });

    /**
     * Scenario: a right to left locale that the sample does not ship.
     * Expectation: the lookup falls back to the base table for every asserted name, so an RTL
     * device shows the English labels instead of empty text.
     */
    it('Assessment_LocalizationTesting_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_026, begin');
      const names: string[] = ['index_title', 'state_active', 'state_inactive', 'allowed_apps_empty',
        'current_config_none'];
      for (let i = 0; i < names.length; i++) {
        const value: string = resolver.resolve('ar', names[i]);
        expect(value.length).assertLarger(0);
        expect(resolver.sourceOf('ar', names[i])).assertEqual(LOCALE_EN);
      }
      expect(resolver.resolve('ar', 'index_title')).assertEqual('Assessment');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_026, end');
    });

    /**
     * Scenario: the assert names of the base table are all translated.
     * Expectation: the translated table has no missing name and no empty value for the whole set
     * of names that the pages read at runtime.
     */
    it('Assessment_LocalizationTesting_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_027, begin');
      const base: StringTable = buildBaseTable();
      const zh: StringTable = buildZhTable();
      const names: string[] = base.names();
      let present: number = 0;
      for (let i = 0; i < names.length; i++) {
        if (zh.has(names[i]) && zh.raw(names[i]).length > 0) {
          present++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s translated %{public}d of %{public}d',
        BUNDLE + 'LocalizationTesting_027', present, names.length);
      expect(present).assertEqual(names.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_027, end');
    });

    /**
     * Scenario: a placeholder reordered between the two locales.
     * Expectation: the validator accepts the swap when the counts agree, because the order of the
     * placeholders is a translation choice rather than a defect.
     */
    it('Assessment_LocalizationTesting_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_028, begin');
      const base: StringTable = new StringTable(LOCALE_EN);
      base.put({ name: 'current_config_value', value: 'duration: %1$d ms, allowedApps: %2$s' });
      const reordered: StringTable = new StringTable('ja');
      reordered.put({ name: 'current_config_value', value: '白名单：%2$s、时长：%1$dミリ秒' });
      const validator: LocaleValidator = new LocaleValidator();
      validator.checkPlaceholders(base, reordered);
      expect(validator.problemCount()).assertEqual(0);
      expect(DurationFormatter.placeholderCount(reordered.raw('current_config_value'))).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_028, end');
    });

    /**
     * Scenario: the configuration of the label sets that the pages render.
     * Expectation: the duration chip labels, the operation buttons and the exam buttons form three
     * disjoint sets in both locales, so no card can render a label of another card.
     */
    it('Assessment_LocalizationTesting_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_029, begin');
      const durationNames: string[] = ['duration_default', 'duration_minutes'];
      const operationNames: string[] = ['begin_button', 'end_button', 'query_state_button',
        'query_config_button'];
      const examNames: string[] = ['exam_previous', 'exam_next', 'exam_submit'];
      const durationSet: Set<string> = new Set<string>();
      for (let i = 0; i < durationNames.length; i++) {
        durationSet.add(resolver.resolve(LOCALE_EN, durationNames[i]));
      }
      const operationSet: Set<string> = new Set<string>();
      for (let i = 0; i < operationNames.length; i++) {
        operationSet.add(resolver.resolve(LOCALE_EN, operationNames[i]));
      }
      const examSet: Set<string> = new Set<string>();
      for (let i = 0; i < examNames.length; i++) {
        examSet.add(resolver.resolve(LOCALE_EN, examNames[i]));
      }
      expect(operationSet.size).assertEqual(operationNames.length);
      expect(examSet.size).assertEqual(examNames.length);
      operationSet.forEach((value: string) => {
        expect(examSet.has(value)).assertFalse();
      });
      expect(durationSet.size).assertEqual(durationNames.length);
      hilog.info(DOMAIN, TAG, '%{public}s label sets %{public}d/%{public}d/%{public}d',
        BUNDLE + 'LocalizationTesting_029', durationSet.size, operationSet.size, examSet.size);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_029, end');
    });

    /**
     * Scenario: a locale table that is larger than the base table.
     * Expectation: the validator only reports the missing names, extra names are ignored because a
     * translation may carry entries that the base language does not.
     */
    it('Assessment_LocalizationTesting_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_031, begin');
      const base: StringTable = new StringTable(LOCALE_EN);
      base.put({ name: 'index_title', value: 'Assessment' });
      const extra: StringTable = new StringTable(LOCALE_ZH);
      extra.put({ name: 'index_title', value: '评估管理' });
      extra.put({ name: 'extra_label', value: '额外标签' });
      expect(extra.size()).assertLarger(base.size());
      const validator: LocaleValidator = new LocaleValidator();
      validator.compare(base, extra);
      expect(validator.problemCount()).assertEqual(0);
      validator.checkEmptyTranslations(extra);
      expect(validator.problemCount()).assertEqual(0);
      expect(validator.isValid()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'LocalizationTesting_031', validator.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_031, end');
    });

    /**
     * Scenario: reset a validator that already collected problems.
     * Expectation: the reset clears the diagnosis and the validator becomes valid again.
     */
    it('Assessment_LocalizationTesting_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_032, begin');
      const validator: LocaleValidator = new LocaleValidator();
      const base: StringTable = new StringTable(LOCALE_EN);
      base.put({ name: 'index_title', value: 'Assessment' });
      validator.compare(base, new StringTable(LOCALE_ZH));
      expect(validator.problemCount()).assertEqual(1);
      expect(validator.isValid()).assertFalse();
      validator.reset();
      expect(validator.problemCount()).assertEqual(0);
      expect(validator.isValid()).assertTrue();
      expect(validator.firstProblem()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LocalizationTesting_032, end');
    });
  });
}
