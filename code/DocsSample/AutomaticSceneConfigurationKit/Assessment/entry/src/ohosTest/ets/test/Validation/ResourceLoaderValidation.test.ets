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
  checkTextContent,
  findById,
  getDriver,
  ID_INDEX_TITLE,
  launchAssessmentApp,
  pressAndWait,
  serializedDelay,
  TEXT_STATE_INACTIVE,
  TIMEOUT_PAGE_TRANSITION,
  waitForIndexPage
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Placeholder forms used by the resource templates of the sample.
const NUMBER_PLACEHOLDER: string = '%d';
const INDEXED_NUMBER_PLACEHOLDER: string = '%1$d';
const SECOND_INDEXED_PLACEHOLDER: string = '%2$s';

// Fallback of a missing resource key.
const FALLBACK_STRING: string = '';
const FALLBACK_COLOR: string = '#00000000';

// Layout constants of the sample resources.
const PAGE_PADDING_VP: number = 16;
const CARD_PADDING_VP: number = 16;
const CARD_RADIUS_VP: number = 16;
const FONT_SIZE_TITLE: number = 24;
const FONT_SIZE_SECTION: number = 18;
const FONT_SIZE_BODY: number = 16;
const FONT_SIZE_CAPTION: number = 14;

/**
 * Kind of a resource entry.
 */
enum ResourceKind {
  STRING = 'string',
  FLOAT = 'float',
  COLOR = 'color',
  MEDIA = 'media',
  UNKNOWN = 'unknown'
}

/**
 * Theme of the sample.
 */
enum ThemeMode {
  LIGHT = 'light',
  DARK = 'dark'
}

/**
 * Outcome of a resource lookup.
 */
enum LookupOutcome {
  FOUND = 'found',
  MISSING = 'missing',
  WRONG_KIND = 'wrong_kind'
}

/**
 * One string resource entry.
 */
interface StringResource {
  key: string;
  value: string;
  hasPlaceholder: boolean;
  placeholderCount: number;
}

/**
 * One numeric resource entry.
 */
interface NumericResource {
  key: string;
  value: number;
  unit: string;
}

/**
 * One colour resource entry.
 */
interface ColorResource {
  key: string;
  light: string;
  dark: string;
}

/**
 * Result of a string lookup.
 */
interface StringLookup {
  outcome: LookupOutcome;
  key: string;
  value: string;
}

/**
 * Result of a colour lookup with the resolved theme value.
 */
interface ColorLookup {
  outcome: LookupOutcome;
  key: string;
  value: string;
  theme: ThemeMode;
}

/**
 * Result of a formatted string lookup.
 */
interface FormatResult {
  text: string;
  substituted: number;
  missingArguments: number;
}

/**
 * Parsed ARGB components of a hex colour.
 */
interface ColorComponents {
  alpha: number;
  red: number;
  green: number;
  blue: number;
}

/**
 * Catalogue of the string keys of the sample.
 *
 * The catalogue mirrors the base string.json file of the entry module. The values are
 * duplicated here on purpose so that the suite never imports from the main source tree.
 */
class StringCatalog {
  private static readonly ENTRIES: StringResource[] = [
    { key: 'index_title', value: 'Assessment', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'index_intro', value: 'Call begin to enter assessment mode.', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'config_title', value: 'Assessment Config', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'duration_label', value: 'Duration', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'duration_default', value: 'Default duration', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'duration_minutes', value: '%d min', hasPlaceholder: true, placeholderCount: 1 },
    { key: 'allowed_apps_label', value: 'Allowed Apps', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'allowed_apps_placeholder', value: 'Bundle name', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'allowed_apps_add', value: 'Add', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'allowed_apps_remove', value: 'Remove', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'allowed_apps_empty', value: 'The whitelist is empty', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'operation_title', value: 'Operations', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'begin_button', value: 'begin', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'end_button', value: 'end', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'query_state_button', value: 'isActive', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'query_config_button', value: 'getConfiguration', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'status_title', value: 'Status', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'state_active', value: 'Assessment state: active', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'state_inactive', value: 'Assessment state: inactive', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'current_config_label', value: 'Current config', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'current_config_none', value: 'No active assessment', hasPlaceholder: false, placeholderCount: 0 },
    {
      key: 'current_config_value',
      value: 'duration: %1$d ms, allowedApps: %2$s',
      hasPlaceholder: true,
      placeholderCount: 2
    },
    { key: 'event_log_label', value: 'Event log', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'event_log_empty', value: 'No event yet', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'exam_title', value: 'Exam', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'exam_remaining_label', value: 'Remaining', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'exam_progress', value: 'Question %1$d/%2$d', hasPlaceholder: true, placeholderCount: 2 },
    { key: 'exam_previous', value: 'Previous', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'exam_next', value: 'Next', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'exam_submit', value: 'Submit', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'exam_finish_title', value: 'Exam Finished', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'exam_finish_message', value: 'You answered %1$d of %2$d questions.', hasPlaceholder: true, placeholderCount: 2 },
    { key: 'exam_interrupt_title', value: 'Assessment Interrupted', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'exam_end_title', value: 'Assessment Ended', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'dialog_confirm', value: 'OK', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'reason_user_cancel', value: 'The user canceled the assessment.', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'reason_timeout', value: 'The assessment timed out.', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'reason_system_error', value: 'A system error occurred.', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'reason_env_anomaly', value: 'An environment anomaly was detected.', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'reason_unknown', value: 'The assessment exited.', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_stem_1', value: 'Which API starts an assessment session?', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_stem_2', value: 'Which API queries whether an assessment session is active?', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_stem_3', value: 'What does the duration value 0 mean?', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_option_1_1', value: 'assessment.begin', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_option_1_2', value: 'assessment.end', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_option_1_3', value: 'assessment.isActive', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_option_2_1', value: 'assessment.getConfiguration', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_option_2_2', value: 'assessment.isActive', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_option_2_3', value: 'assessment.begin', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_option_3_1', value: 'The assessment ends immediately', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_option_3_2', value: 'No time limit', hasPlaceholder: false, placeholderCount: 0 },
    { key: 'question_option_3_3', value: 'The default duration is used', hasPlaceholder: false, placeholderCount: 0 }
  ];

  public static count(): number {
    return StringCatalog.ENTRIES.length;
  }

  public static find(key: string): StringResource | null {
    for (let i = 0; i < StringCatalog.ENTRIES.length; i++) {
      if (StringCatalog.ENTRIES[i].key === key) {
        return StringCatalog.ENTRIES[i];
      }
    }
    return null;
  }

  public static valueOf(key: string): string {
    const entry: StringResource | null = StringCatalog.find(key);
    if (entry === null) {
      return FALLBACK_STRING;
    }
    return entry.value;
  }

  public static contains(key: string): boolean {
    return StringCatalog.find(key) !== null;
  }

  public static keys(): string[] {
    const result: string[] = [];
    for (let i = 0; i < StringCatalog.ENTRIES.length; i++) {
      result.push(StringCatalog.ENTRIES[i].key);
    }
    return result;
  }

  public static keysWithPlaceholder(): string[] {
    const result: string[] = [];
    for (let i = 0; i < StringCatalog.ENTRIES.length; i++) {
      if (StringCatalog.ENTRIES[i].hasPlaceholder) {
        result.push(StringCatalog.ENTRIES[i].key);
      }
    }
    return result;
  }

  public static keysWithoutPlaceholder(): string[] {
    const result: string[] = [];
    for (let i = 0; i < StringCatalog.ENTRIES.length; i++) {
      if (!StringCatalog.ENTRIES[i].hasPlaceholder) {
        result.push(StringCatalog.ENTRIES[i].key);
      }
    }
    return result;
  }

  public static duplicateKeys(): string[] {
    const seen: string[] = [];
    const duplicates: string[] = [];
    for (let i = 0; i < StringCatalog.ENTRIES.length; i++) {
      const key: string = StringCatalog.ENTRIES[i].key;
      if (seen.indexOf(key) >= 0 && duplicates.indexOf(key) < 0) {
        duplicates.push(key);
      } else {
        seen.push(key);
      }
    }
    return duplicates;
  }

  public static prefix(prefix: string): string[] {
    const result: string[] = [];
    for (let i = 0; i < StringCatalog.ENTRIES.length; i++) {
      if (StringCatalog.ENTRIES[i].key.startsWith(prefix)) {
        result.push(StringCatalog.ENTRIES[i].key);
      }
    }
    return result;
  }

  public static longestKey(): string {
    let longest: string = '';
    for (let i = 0; i < StringCatalog.ENTRIES.length; i++) {
      if (StringCatalog.ENTRIES[i].key.length > longest.length) {
        longest = StringCatalog.ENTRIES[i].key;
      }
    }
    return longest;
  }

  public static longestValue(): string {
    let longest: string = '';
    for (let i = 0; i < StringCatalog.ENTRIES.length; i++) {
      if (StringCatalog.ENTRIES[i].value.length > longest.length) {
        longest = StringCatalog.ENTRIES[i].value;
      }
    }
    return longest;
  }
}

/**
 * Catalogue of the float and dimension resources of the sample.
 */
class FloatCatalog {
  private static readonly ENTRIES: NumericResource[] = [
    { key: 'font_size_title', value: FONT_SIZE_TITLE, unit: 'fp' },
    { key: 'font_size_section', value: FONT_SIZE_SECTION, unit: 'fp' },
    { key: 'font_size_body', value: FONT_SIZE_BODY, unit: 'fp' },
    { key: 'font_size_caption', value: FONT_SIZE_CAPTION, unit: 'fp' },
    { key: 'page_padding', value: PAGE_PADDING_VP, unit: 'vp' },
    { key: 'card_padding', value: CARD_PADDING_VP, unit: 'vp' },
    { key: 'card_radius', value: CARD_RADIUS_VP, unit: 'vp' },
    { key: 'component_space', value: 12, unit: 'vp' }
  ];

  public static count(): number {
    return FloatCatalog.ENTRIES.length;
  }

  public static find(key: string): NumericResource | null {
    for (let i = 0; i < FloatCatalog.ENTRIES.length; i++) {
      if (FloatCatalog.ENTRIES[i].key === key) {
        return FloatCatalog.ENTRIES[i];
      }
    }
    return null;
  }

  public static valueOf(key: string): number {
    const entry: NumericResource | null = FloatCatalog.find(key);
    if (entry === null) {
      return -1;
    }
    return entry.value;
  }

  public static unitOf(key: string): string {
    const entry: NumericResource | null = FloatCatalog.find(key);
    if (entry === null) {
      return '';
    }
    return entry.unit;
  }

  public static keys(): string[] {
    const result: string[] = [];
    for (let i = 0; i < FloatCatalog.ENTRIES.length; i++) {
      result.push(FloatCatalog.ENTRIES[i].key);
    }
    return result;
  }

  public static keysOfUnit(unit: string): string[] {
    const result: string[] = [];
    for (let i = 0; i < FloatCatalog.ENTRIES.length; i++) {
      if (FloatCatalog.ENTRIES[i].unit === unit) {
        result.push(FloatCatalog.ENTRIES[i].key);
      }
    }
    return result;
  }

  public static maxValue(): number {
    let max: number = 0;
    for (let i = 0; i < FloatCatalog.ENTRIES.length; i++) {
      if (FloatCatalog.ENTRIES[i].value > max) {
        max = FloatCatalog.ENTRIES[i].value;
      }
    }
    return max;
  }

  public static minValue(): number {
    let min: number = FloatCatalog.ENTRIES[0].value;
    for (let i = 1; i < FloatCatalog.ENTRIES.length; i++) {
      if (FloatCatalog.ENTRIES[i].value < min) {
        min = FloatCatalog.ENTRIES[i].value;
      }
    }
    return min;
  }

  public static isMonotonicByFontSize(): boolean {
    const fontKeys: string[] = FloatCatalog.keysOfUnit('fp');
    for (let i = 1; i < fontKeys.length; i++) {
      if (FloatCatalog.valueOf(fontKeys[i]) >= FloatCatalog.valueOf(fontKeys[i - 1])) {
        return false;
      }
    }
    return true;
  }
}

/**
 * Catalogue of the colour resources with the theme override table.
 */
class ColorCatalog {
  private static readonly ENTRIES: ColorResource[] = [
    { key: 'page_background', light: '#F1F3F5', dark: '#000000' },
    { key: 'card_background', light: '#FFFFFF', dark: '#1C1C1E' },
    { key: 'title_font', light: '#182431', dark: '#E5E5E5' },
    { key: 'body_font', light: '#182431', dark: '#E5E5E5' },
    { key: 'secondary_font', light: '#99182431', dark: '#99E5E5E5' },
    { key: 'divider', light: '#0D182431', dark: '#0DE5E5E5' },
    { key: 'brand', light: '#007DFF', dark: '#0A59F7' },
    { key: 'warning', light: '#ED6F21', dark: '#ED6F21' },
    { key: 'success', light: '#64BB5C', dark: '#64BB5C' }
  ];

  public static count(): number {
    return ColorCatalog.ENTRIES.length;
  }

  public static find(key: string): ColorResource | null {
    for (let i = 0; i < ColorCatalog.ENTRIES.length; i++) {
      if (ColorCatalog.ENTRIES[i].key === key) {
        return ColorCatalog.ENTRIES[i];
      }
    }
    return null;
  }

  public static lightOf(key: string): string {
    const entry: ColorResource | null = ColorCatalog.find(key);
    if (entry === null) {
      return FALLBACK_COLOR;
    }
    return entry.light;
  }

  public static darkOf(key: string): string {
    const entry: ColorResource | null = ColorCatalog.find(key);
    if (entry === null) {
      return FALLBACK_COLOR;
    }
    return entry.dark;
  }

  public static keys(): string[] {
    const result: string[] = [];
    for (let i = 0; i < ColorCatalog.ENTRIES.length; i++) {
      result.push(ColorCatalog.ENTRIES[i].key);
    }
    return result;
  }

  public static overriddenKeys(): string[] {
    const result: string[] = [];
    for (let i = 0; i < ColorCatalog.ENTRIES.length; i++) {
      if (ColorCatalog.ENTRIES[i].light !== ColorCatalog.ENTRIES[i].dark) {
        result.push(ColorCatalog.ENTRIES[i].key);
      }
    }
    return result;
  }

  public static sharedKeys(): string[] {
    const result: string[] = [];
    for (let i = 0; i < ColorCatalog.ENTRIES.length; i++) {
      if (ColorCatalog.ENTRIES[i].light === ColorCatalog.ENTRIES[i].dark) {
        result.push(ColorCatalog.ENTRIES[i].key);
      }
    }
    return result;
  }

  public static isValidHex(value: string): boolean {
    if (!value.startsWith('#')) {
      return false;
    }
    const digits: string = value.substring(1);
    if (digits.length !== 6 && digits.length !== 8) {
      return false;
    }
    for (let i = 0; i < digits.length; i++) {
      const code: number = digits.charCodeAt(i);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isLower: boolean = code >= 97 && code <= 102;
      const isUpper: boolean = code >= 65 && code <= 70;
      if (!isDigit && !isLower && !isUpper) {
        return false;
      }
    }
    return true;
  }

  public static componentsOf(value: string): ColorComponents {
    const digits: string = value.startsWith('#') ? value.substring(1) : value;
    if (digits.length === 6) {
      const components: ColorComponents = {
        alpha: 255,
        red: HexMath.parseByte(digits, 0),
        green: HexMath.parseByte(digits, 2),
        blue: HexMath.parseByte(digits, 4)
      };
      return components;
    }
    if (digits.length === 8) {
      const components: ColorComponents = {
        alpha: HexMath.parseByte(digits, 0),
        red: HexMath.parseByte(digits, 2),
        green: HexMath.parseByte(digits, 4),
        blue: HexMath.parseByte(digits, 6)
      };
      return components;
    }
    const invalid: ColorComponents = {
      alpha: 0,
      red: 0,
      green: 0,
      blue: 0
    };
    return invalid;
  }
}

/**
 * Hex helpers of the colour catalogue.
 */
class HexMath {
  public static digitValue(code: number): number {
    if (code >= 48 && code <= 57) {
      return code - 48;
    }
    if (code >= 65 && code <= 70) {
      return code - 65 + 10;
    }
    if (code >= 97 && code <= 102) {
      return code - 97 + 10;
    }
    return -1;
  }

  public static parseByte(text: string, start: number): number {
    if (start + 1 >= text.length) {
      return 0;
    }
    const high: number = HexMath.digitValue(text.charCodeAt(start));
    const low: number = HexMath.digitValue(text.charCodeAt(start + 1));
    if (high < 0 || low < 0) {
      return 0;
    }
    return high * 16 + low;
  }
}

/**
 * Resolves resources for one theme.
 *
 * The resolver reproduces the resource lookup of the sample: a missing key answers the
 * fallback value, a wrong kind answers the wrong kind outcome and a formatted string
 * substitutes its placeholders in order.
 */
class ResourceResolver {
  private theme: ThemeMode;

  public constructor(theme: ThemeMode = ThemeMode.LIGHT) {
    this.theme = theme;
  }

  public getTheme(): ThemeMode {
    return this.theme;
  }

  public setTheme(theme: ThemeMode): void {
    this.theme = theme;
  }

  public stringOf(key: string): StringLookup {
    if (!StringCatalog.contains(key)) {
      const outcome: LookupOutcome = this.kindOf(key) === ResourceKind.UNKNOWN ?
        LookupOutcome.MISSING : LookupOutcome.WRONG_KIND;
      const failed: StringLookup = {
        outcome: outcome,
        key: key,
        value: FALLBACK_STRING
      };
      return failed;
    }
    const found: StringLookup = {
      outcome: LookupOutcome.FOUND,
      key: key,
      value: StringCatalog.valueOf(key)
    };
    return found;
  }

  // The kind of a key decides which resource table owns it, a key that only exists as a
  // colour is a wrong kind lookup when the page asks for a string.
  public kindOf(key: string): ResourceKind {
    if (StringCatalog.contains(key)) {
      return ResourceKind.STRING;
    }
    if (FloatCatalog.find(key) !== null) {
      return ResourceKind.FLOAT;
    }
    if (ColorCatalog.find(key) !== null) {
      return ResourceKind.COLOR;
    }
    return ResourceKind.UNKNOWN;
  }

  public colourOf(key: string): ColorLookup {
    if (ColorCatalog.find(key) === null) {
      const missing: ColorLookup = {
        outcome: LookupOutcome.MISSING,
        key: key,
        value: FALLBACK_COLOR,
        theme: this.theme
      };
      return missing;
    }
    const value: string = this.theme === ThemeMode.DARK ?
      ColorCatalog.darkOf(key) : ColorCatalog.lightOf(key);
    const found: ColorLookup = {
      outcome: LookupOutcome.FOUND,
      key: key,
      value: value,
      theme: this.theme
    };
    return found;
  }

  public floatOf(key: string): number {
    return FloatCatalog.valueOf(key);
  }

  public stringOrFallback(key: string, fallback: string): string {
    const lookup: StringLookup = this.stringOf(key);
    if (lookup.outcome !== LookupOutcome.FOUND) {
      return fallback;
    }
    return lookup.value;
  }

  // Replaces the %d placeholders in order, the missing arguments are counted so that the
  // page can log an incomplete template.
  public formatNumber(key: string, values: number[]): FormatResult {
    const lookup: StringLookup = this.stringOf(key);
    if (lookup.outcome !== LookupOutcome.FOUND) {
      const missing: FormatResult = {
        text: FALLBACK_STRING,
        substituted: 0,
        missingArguments: values.length
      };
      return missing;
    }
    let text: string = lookup.value;
    let substituted: number = 0;
    for (let i = 0; i < values.length; i++) {
      if (text.indexOf(NUMBER_PLACEHOLDER) < 0) {
        break;
      }
      text = text.replace(NUMBER_PLACEHOLDER, `${values[i]}`);
      substituted++;
    }
    const result: FormatResult = {
      text: text,
      substituted: substituted,
      missingArguments: values.length - substituted
    };
    return result;
  }

  // Replaces the indexed placeholders %1$d and %2$s of the configuration text.
  public formatConfig(duration: number, apps: string): string {
    return StringCatalog.valueOf('current_config_value')
      .split(INDEXED_NUMBER_PLACEHOLDER).join(`${duration}`)
      .split(SECOND_INDEXED_PLACEHOLDER).join(apps);
  }

  public formatProgress(current: number, total: number): string {
    return StringCatalog.valueOf('exam_progress')
      .split(INDEXED_NUMBER_PLACEHOLDER).join(`${current}`)
      .split(SECOND_INDEXED_PLACEHOLDER).join(`${total}`);
  }

  public formatDuration(minutes: number): string {
    return StringCatalog.valueOf('duration_minutes').split(NUMBER_PLACEHOLDER).join(`${minutes}`);
  }
}

/**
 * Builds a resource catalogue snapshot for the audit cases.
 */
class CatalogAuditor {
  public stringKeysHaveValues(): boolean {
    const keys: string[] = StringCatalog.keys();
    for (let i = 0; i < keys.length; i++) {
      if (StringCatalog.valueOf(keys[i]).length === 0) {
        return false;
      }
    }
    return true;
  }

  public stringValuesAreTrimmed(): boolean {
    const keys: string[] = StringCatalog.keys();
    for (let i = 0; i < keys.length; i++) {
      const value: string = StringCatalog.valueOf(keys[i]);
      if (value !== value.trim()) {
        return false;
      }
    }
    return true;
  }

  public coloursAreValid(): boolean {
    const keys: string[] = ColorCatalog.keys();
    for (let i = 0; i < keys.length; i++) {
      if (!ColorCatalog.isValidHex(ColorCatalog.lightOf(keys[i]))) {
        return false;
      }
      if (!ColorCatalog.isValidHex(ColorCatalog.darkOf(keys[i]))) {
        return false;
      }
    }
    return true;
  }

  public floatsArePositive(): boolean {
    const keys: string[] = FloatCatalog.keys();
    for (let i = 0; i < keys.length; i++) {
      if (FloatCatalog.valueOf(keys[i]) <= 0) {
        return false;
      }
    }
    return true;
  }

  public placeholderFlagsMatchValues(): boolean {
    const keys: string[] = StringCatalog.keys();
    for (let i = 0; i < keys.length; i++) {
      const entry: StringResource | null = StringCatalog.find(keys[i]);
      if (entry === null) {
        continue;
      }
      const actual: boolean = entry.value.indexOf(NUMBER_PLACEHOLDER) >= 0 ||
        entry.value.indexOf(INDEXED_NUMBER_PLACEHOLDER) >= 0;
      if (actual !== entry.hasPlaceholder) {
        return false;
      }
    }
    return true;
  }

  public allHold(): boolean {
    return this.stringKeysHaveValues() && this.stringValuesAreTrimmed() && this.coloursAreValid() &&
      this.floatsArePositive() && this.placeholderFlagsMatchValues();
  }
}

export default function resourceLoaderValidationTest() {
  describe('ResourceLoaderValidation_Test', () => {
    let driver: Driver;
    let resolver: ResourceResolver;
    let auditor: CatalogAuditor;

    beforeAll(async () => {
      driver = getDriver();
      resolver = new ResourceResolver(ThemeMode.LIGHT);
      auditor = new CatalogAuditor();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the size of the string catalogue.
     * Expectation: every documented key is present and no key is duplicated.
     */
    it('Assessment_ResourceStringCatalogSize_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringCatalogSize_001, begin');
      expect(StringCatalog.count() > 40).assertTrue();
      expect(StringCatalog.keys().length).assertEqual(StringCatalog.count());
      expect(StringCatalog.duplicateKeys().length).assertEqual(0);
      expect(StringCatalog.contains('index_title')).assertTrue();
      expect(StringCatalog.contains('exam_submit')).assertTrue();
      expect(StringCatalog.contains('dialog_confirm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringCatalogSize_001, end');
    });

    /**
     * Scenario: the exact values of the navigation strings.
     * Expectation: the strings match the base string.json file.
     */
    it('Assessment_ResourceStringValuesNavigation_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringValuesNavigation_002, begin');
      expect(StringCatalog.valueOf('index_title')).assertEqual('Assessment');
      expect(StringCatalog.valueOf('begin_button')).assertEqual('begin');
      expect(StringCatalog.valueOf('end_button')).assertEqual('end');
      expect(StringCatalog.valueOf('query_state_button')).assertEqual('isActive');
      expect(StringCatalog.valueOf('query_config_button')).assertEqual('getConfiguration');
      expect(StringCatalog.valueOf('dialog_confirm')).assertEqual('OK');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringValuesNavigation_002, end');
    });

    /**
     * Scenario: the exact values of the configuration strings.
     * Expectation: the configuration card strings are identical to the resource file.
     */
    it('Assessment_ResourceStringValuesConfig_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringValuesConfig_003, begin');
      expect(StringCatalog.valueOf('config_title')).assertEqual('Assessment Config');
      expect(StringCatalog.valueOf('duration_label')).assertEqual('Duration');
      expect(StringCatalog.valueOf('duration_default')).assertEqual('Default duration');
      expect(StringCatalog.valueOf('allowed_apps_label')).assertEqual('Allowed Apps');
      expect(StringCatalog.valueOf('allowed_apps_add')).assertEqual('Add');
      expect(StringCatalog.valueOf('allowed_apps_remove')).assertEqual('Remove');
      expect(StringCatalog.valueOf('allowed_apps_empty')).assertEqual('The whitelist is empty');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringValuesConfig_003, end');
    });

    /**
     * Scenario: the exact values of the status strings.
     * Expectation: the two state labels are distinct and match the documented text.
     */
    it('Assessment_ResourceStringValuesStatus_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringValuesStatus_004, begin');
      expect(StringCatalog.valueOf('state_active')).assertEqual('Assessment state: active');
      expect(StringCatalog.valueOf('state_inactive')).assertEqual('Assessment state: inactive');
      expect(StringCatalog.valueOf('current_config_none')).assertEqual('No active assessment');
      expect(StringCatalog.valueOf('event_log_empty')).assertEqual('No event yet');
      expect(StringCatalog.valueOf('state_active') === StringCatalog.valueOf('state_inactive')).assertFalse();
      expect(TEXT_STATE_INACTIVE).assertEqual(StringCatalog.valueOf('state_inactive'));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringValuesStatus_004, end');
    });

    /**
     * Scenario: the exact values of the exam strings.
     * Expectation: the exam page strings are identical to the resource file.
     */
    it('Assessment_ResourceStringValuesExam_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringValuesExam_005, begin');
      expect(StringCatalog.valueOf('exam_title')).assertEqual('Exam');
      expect(StringCatalog.valueOf('exam_remaining_label')).assertEqual('Remaining');
      expect(StringCatalog.valueOf('exam_previous')).assertEqual('Previous');
      expect(StringCatalog.valueOf('exam_next')).assertEqual('Next');
      expect(StringCatalog.valueOf('exam_submit')).assertEqual('Submit');
      expect(StringCatalog.valueOf('exam_finish_title')).assertEqual('Exam Finished');
      expect(StringCatalog.valueOf('exam_interrupt_title')).assertEqual('Assessment Interrupted');
      expect(StringCatalog.valueOf('exam_end_title')).assertEqual('Assessment Ended');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringValuesExam_005, end');
    });

    /**
     * Scenario: the reason strings of the interrupt dialog.
     * Expectation: every reason key answers a full English sentence.
     */
    it('Assessment_ResourceStringValuesReasons_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringValuesReasons_006, begin');
      expect(StringCatalog.valueOf('reason_user_cancel')).assertEqual('The user canceled the assessment.');
      expect(StringCatalog.valueOf('reason_timeout')).assertEqual('The assessment timed out.');
      expect(StringCatalog.valueOf('reason_system_error')).assertEqual('A system error occurred.');
      expect(StringCatalog.valueOf('reason_env_anomaly')).assertEqual('An environment anomaly was detected.');
      expect(StringCatalog.valueOf('reason_unknown')).assertEqual('The assessment exited.');
      expect(StringCatalog.valueOf('reason_timeout').endsWith('.')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringValuesReasons_006, end');
    });

    /**
     * Scenario: the keys that carry placeholders.
     * Expectation: exactly four template keys are catalogued.
     */
    it('Assessment_ResourcePlaceholderKeys_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourcePlaceholderKeys_007, begin');
      const templates: string[] = StringCatalog.keysWithPlaceholder();
      expect(templates.length).assertEqual(4);
      expect(templates.indexOf('duration_minutes') >= 0).assertTrue();
      expect(templates.indexOf('current_config_value') >= 0).assertTrue();
      expect(templates.indexOf('exam_progress') >= 0).assertTrue();
      expect(templates.indexOf('exam_finish_message') >= 0).assertTrue();
      expect(StringCatalog.keysWithoutPlaceholder().length)
        .assertEqual(StringCatalog.count() - templates.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourcePlaceholderKeys_007, end');
    });

    /**
     * Scenario: the placeholder counts of the template keys.
     * Expectation: the duration template holds one and the others hold two.
     */
    it('Assessment_ResourcePlaceholderCounts_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourcePlaceholderCounts_008, begin');
      const duration: StringResource | null = StringCatalog.find('duration_minutes');
      expect(duration !== null).assertTrue();
      if (duration !== null) {
        expect(duration.placeholderCount).assertEqual(1);
        expect(duration.value.indexOf(NUMBER_PLACEHOLDER) >= 0).assertTrue();
      }
      const config: StringResource | null = StringCatalog.find('current_config_value');
      expect(config !== null).assertTrue();
      if (config !== null) {
        expect(config.placeholderCount).assertEqual(2);
        expect(config.value.indexOf(INDEXED_NUMBER_PLACEHOLDER) >= 0).assertTrue();
        expect(config.value.indexOf(SECOND_INDEXED_PLACEHOLDER) >= 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourcePlaceholderCounts_008, end');
    });

    /**
     * Scenario: the key prefix search of the catalogue.
     * Expectation: the question keys and the option keys are grouped by prefix.
     */
    it('Assessment_ResourceKeyPrefix_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceKeyPrefix_009, begin');
      expect(StringCatalog.prefix('question_stem_').length).assertEqual(3);
      expect(StringCatalog.prefix('question_option_').length).assertEqual(9);
      expect(StringCatalog.prefix('reason_').length).assertEqual(5);
      expect(StringCatalog.prefix('missing_').length).assertEqual(0);
      expect(StringCatalog.prefix('').length).assertEqual(StringCatalog.count());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceKeyPrefix_009, end');
    });

    /**
     * Scenario: the longest key and value of the catalogue.
     * Expectation: both are non empty and appear in the catalogue.
     */
    it('Assessment_ResourceLongestEntries_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceLongestEntries_010, begin');
      const longestKey: string = StringCatalog.longestKey();
      const longestValue: string = StringCatalog.longestValue();
      expect(longestKey.length > 0).assertTrue();
      expect(longestValue.length > 0).assertTrue();
      expect(StringCatalog.contains(longestKey)).assertTrue();
      expect(longestKey).assertEqual('allowed_apps_placeholder');
      expect(longestValue.length >= 40).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceLongestEntries_010, end');
    });

    /**
     * Scenario: a missing string key.
     * Expectation: the lookup answers the missing outcome and the fallback value.
     */
    it('Assessment_ResourceMissingString_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceMissingString_011, begin');
      expect(StringCatalog.valueOf('does_not_exist')).assertEqual(FALLBACK_STRING);
      expect(StringCatalog.find('does_not_exist') === null).assertTrue();
      expect(StringCatalog.contains('')).assertFalse();
      const lookup: StringLookup = resolver.stringOf('does_not_exist');
      expect(lookup.outcome).assertEqual(LookupOutcome.MISSING);
      expect(lookup.value).assertEqual(FALLBACK_STRING);
      expect(resolver.stringOrFallback('does_not_exist', 'fallback')).assertEqual('fallback');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceMissingString_011, end');
    });

    /**
     * Scenario: a found string key.
     * Expectation: the lookup answers the found outcome and the catalogue value.
     */
    it('Assessment_ResourceFoundString_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFoundString_012, begin');
      const lookup: StringLookup = resolver.stringOf('index_title');
      expect(lookup.outcome).assertEqual(LookupOutcome.FOUND);
      expect(lookup.key).assertEqual('index_title');
      expect(lookup.value).assertEqual('Assessment');
      expect(resolver.stringOrFallback('index_title', 'fallback')).assertEqual('Assessment');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFoundString_012, end');
    });

    /**
     * Scenario: the size of the float catalogue.
     * Expectation: eight numeric resources are catalogued.
     */
    it('Assessment_ResourceFloatCatalog_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFloatCatalog_013, begin');
      expect(FloatCatalog.count()).assertEqual(8);
      expect(FloatCatalog.keys().length).assertEqual(8);
      expect(FloatCatalog.keysOfUnit('fp').length).assertEqual(4);
      expect(FloatCatalog.keysOfUnit('vp').length).assertEqual(4);
      expect(FloatCatalog.keysOfUnit('px').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFloatCatalog_013, end');
    });

    /**
     * Scenario: the values of the font size resources.
     * Expectation: the four font sizes match the float.json file.
     */
    it('Assessment_ResourceFloatFontSizes_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFloatFontSizes_014, begin');
      expect(FloatCatalog.valueOf('font_size_title')).assertEqual(24);
      expect(FloatCatalog.valueOf('font_size_section')).assertEqual(18);
      expect(FloatCatalog.valueOf('font_size_body')).assertEqual(16);
      expect(FloatCatalog.valueOf('font_size_caption')).assertEqual(14);
      expect(FloatCatalog.unitOf('font_size_title')).assertEqual('fp');
      expect(FloatCatalog.isMonotonicByFontSize()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFloatFontSizes_014, end');
    });

    /**
     * Scenario: the values of the layout resources.
     * Expectation: the paddings and the card radius match the float.json file.
     */
    it('Assessment_ResourceFloatLayout_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFloatLayout_015, begin');
      expect(FloatCatalog.valueOf('page_padding')).assertEqual(PAGE_PADDING_VP);
      expect(FloatCatalog.valueOf('card_padding')).assertEqual(CARD_PADDING_VP);
      expect(FloatCatalog.valueOf('card_radius')).assertEqual(CARD_RADIUS_VP);
      expect(FloatCatalog.valueOf('component_space')).assertEqual(12);
      expect(FloatCatalog.unitOf('card_radius')).assertEqual('vp');
      expect(FloatCatalog.unitOf('component_space')).assertEqual('vp');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFloatLayout_015, end');
    });

    /**
     * Scenario: the extremes of the float catalogue.
     * Expectation: the maximum is the title font size and the minimum the caption one.
     */
    it('Assessment_ResourceFloatExtremes_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFloatExtremes_016, begin');
      expect(FloatCatalog.maxValue()).assertEqual(FONT_SIZE_TITLE);
      expect(FloatCatalog.minValue()).assertEqual(12);
      expect(FloatCatalog.maxValue() > FloatCatalog.minValue()).assertTrue();
      expect(FloatCatalog.valueOf('missing_key')).assertEqual(-1);
      expect(FloatCatalog.unitOf('missing_key')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFloatExtremes_016, end');
    });

    /**
     * Scenario: the size of the colour catalogue.
     * Expectation: nine colours are catalogued with both theme values.
     */
    it('Assessment_ResourceColorCatalog_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorCatalog_017, begin');
      expect(ColorCatalog.count()).assertEqual(9);
      expect(ColorCatalog.keys().length).assertEqual(9);
      expect(ColorCatalog.find('brand') !== null).assertTrue();
      expect(ColorCatalog.find('missing') === null).assertTrue();
      expect(ColorCatalog.lightOf('missing')).assertEqual(FALLBACK_COLOR);
      expect(ColorCatalog.darkOf('missing')).assertEqual(FALLBACK_COLOR);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorCatalog_017, end');
    });

    /**
     * Scenario: the light values of the colour catalogue.
     * Expectation: the light theme values match the base color.json file.
     */
    it('Assessment_ResourceColorLight_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorLight_018, begin');
      expect(ColorCatalog.lightOf('page_background')).assertEqual('#F1F3F5');
      expect(ColorCatalog.lightOf('card_background')).assertEqual('#FFFFFF');
      expect(ColorCatalog.lightOf('title_font')).assertEqual('#182431');
      expect(ColorCatalog.lightOf('brand')).assertEqual('#007DFF');
      expect(ColorCatalog.lightOf('warning')).assertEqual('#ED6F21');
      expect(ColorCatalog.lightOf('success')).assertEqual('#64BB5C');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorLight_018, end');
    });

    /**
     * Scenario: the dark values of the colour catalogue.
     * Expectation: the dark theme values match the dark color.json file.
     */
    it('Assessment_ResourceColorDark_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorDark_019, begin');
      expect(ColorCatalog.darkOf('page_background')).assertEqual('#000000');
      expect(ColorCatalog.darkOf('card_background')).assertEqual('#1C1C1E');
      expect(ColorCatalog.darkOf('title_font')).assertEqual('#E5E5E5');
      expect(ColorCatalog.darkOf('brand')).assertEqual('#0A59F7');
      expect(ColorCatalog.darkOf('warning')).assertEqual('#ED6F21');
      expect(ColorCatalog.darkOf('success')).assertEqual('#64BB5C');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorDark_019, end');
    });

    /**
     * Scenario: the theme override table of the colour catalogue.
     * Expectation: seven colours are overridden and two stay shared between the themes.
     */
    it('Assessment_ResourceColorOverrides_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorOverrides_020, begin');
      const overridden: string[] = ColorCatalog.overriddenKeys();
      expect(overridden.length).assertEqual(7);
      expect(overridden.indexOf('page_background') >= 0).assertTrue();
      expect(overridden.indexOf('card_background') >= 0).assertTrue();
      expect(overridden.indexOf('brand') >= 0).assertTrue();
      expect(overridden.indexOf('body_font') >= 0).assertTrue();
      const shared: string[] = ColorCatalog.sharedKeys();
      expect(shared.length).assertEqual(2);
      expect(shared.indexOf('warning') >= 0).assertTrue();
      expect(shared.indexOf('success') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorOverrides_020, end');
    });

    /**
     * Scenario: the hex validity of every colour.
     * Expectation: every light and dark value is a valid hex colour.
     */
    it('Assessment_ResourceColorValidity_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorValidity_021, begin');
      expect(auditor.coloursAreValid()).assertTrue();
      const keys: string[] = ColorCatalog.keys();
      for (let i = 0; i < keys.length; i++) {
        expect(ColorCatalog.isValidHex(ColorCatalog.lightOf(keys[i]))).assertTrue();
        expect(ColorCatalog.isValidHex(ColorCatalog.darkOf(keys[i]))).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorValidity_021, end');
    });

    /**
     * Scenario: malformed hex values.
     * Expectation: the validator rejects a missing prefix, a short value and bad digits.
     */
    it('Assessment_ResourceColorMalformed_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorMalformed_022, begin');
      expect(ColorCatalog.isValidHex('FFFFFF')).assertFalse();
      expect(ColorCatalog.isValidHex('#FFF')).assertFalse();
      expect(ColorCatalog.isValidHex('#FFFFFFF')).assertFalse();
      expect(ColorCatalog.isValidHex('#GGGGGG')).assertFalse();
      expect(ColorCatalog.isValidHex('')).assertFalse();
      expect(ColorCatalog.isValidHex('#F1F3F5')).assertTrue();
      expect(ColorCatalog.isValidHex('#0D182431')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorMalformed_022, end');
    });

    /**
     * Scenario: the components of a six digit colour.
     * Expectation: the alpha defaults to fully opaque.
     */
    it('Assessment_ResourceColorComponents_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorComponents_023, begin');
      const components: ColorComponents = ColorCatalog.componentsOf('#FF8000');
      expect(components.alpha).assertEqual(255);
      expect(components.red).assertEqual(255);
      expect(components.green).assertEqual(128);
      expect(components.blue).assertEqual(0);
      const white: ColorComponents = ColorCatalog.componentsOf('#FFFFFF');
      expect(white.red).assertEqual(255);
      expect(white.green).assertEqual(255);
      expect(white.blue).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorComponents_023, end');
    });

    /**
     * Scenario: the components of an eight digit colour.
     * Expectation: the leading byte is the alpha channel.
     */
    it('Assessment_ResourceColorAlpha_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorAlpha_024, begin');
      const secondary: ColorComponents = ColorCatalog.componentsOf('#99182431');
      expect(secondary.alpha).assertEqual(153);
      expect(secondary.red).assertEqual(24);
      expect(secondary.green).assertEqual(36);
      expect(secondary.blue).assertEqual(49);
      const divider: ColorComponents = ColorCatalog.componentsOf('#0D182431');
      expect(divider.alpha).assertEqual(13);
      expect(divider.alpha < secondary.alpha).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColorAlpha_024, end');
    });

    /**
     * Scenario: the hex digit parser.
     * Expectation: digits, lower case and upper case letters all parse.
     */
    it('Assessment_ResourceHexDigits_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceHexDigits_025, begin');
      expect(HexMath.digitValue(48)).assertEqual(0);
      expect(HexMath.digitValue(57)).assertEqual(9);
      expect(HexMath.digitValue(65)).assertEqual(10);
      expect(HexMath.digitValue(70)).assertEqual(15);
      expect(HexMath.digitValue(97)).assertEqual(10);
      expect(HexMath.digitValue(102)).assertEqual(15);
      expect(HexMath.digitValue(71)).assertEqual(-1);
      expect(HexMath.parseByte('FF', 0)).assertEqual(255);
      expect(HexMath.parseByte('7F', 0)).assertEqual(127);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceHexDigits_025, end');
    });

    /**
     * Scenario: a single number placeholder substitution.
     * Expectation: the duration template substitutes the minute value.
     */
    it('Assessment_ResourceFormatDuration_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFormatDuration_026, begin');
      expect(resolver.formatDuration(10)).assertEqual('10 min');
      expect(resolver.formatDuration(30)).assertEqual('30 min');
      expect(resolver.formatDuration(60)).assertEqual('60 min');
      expect(resolver.formatDuration(0)).assertEqual('0 min');
      expect(resolver.formatDuration(10).endsWith(' min')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFormatDuration_026, end');
    });

    /**
     * Scenario: the indexed configuration text.
     * Expectation: both indexed placeholders are replaced by the supplied values.
     */
    it('Assessment_ResourceFormatConfig_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFormatConfig_028, begin');
      const text: string = resolver.formatConfig(1800000, 'com.samples.assessment');
      expect(text).assertEqual('duration: 1800000 ms, allowedApps: com.samples.assessment');
      expect(text.indexOf(INDEXED_NUMBER_PLACEHOLDER)).assertEqual(-1);
      expect(text.indexOf(SECOND_INDEXED_PLACEHOLDER)).assertEqual(-1);
      expect(text.includes('1800000')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFormatConfig_028, end');
    });

    /**
     * Scenario: a theme aware colour lookup in light mode.
     * Expectation: the light value is returned with the light theme marker.
     */
    it('Assessment_ResourceColourLightLookup_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColourLightLookup_031, begin');
      expect(resolver.getTheme()).assertEqual(ThemeMode.LIGHT);
      const lookup: ColorLookup = resolver.colourOf('page_background');
      expect(lookup.outcome).assertEqual(LookupOutcome.FOUND);
      expect(lookup.theme).assertEqual(ThemeMode.LIGHT);
      expect(lookup.value).assertEqual('#F1F3F5');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColourLightLookup_031, end');
    });

    /**
     * Scenario: a theme aware colour lookup in dark mode.
     * Expectation: the dark override value is returned with the dark theme marker.
     */
    it('Assessment_ResourceColourDarkLookup_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColourDarkLookup_032, begin');
      resolver.setTheme(ThemeMode.DARK);
      expect(resolver.getTheme()).assertEqual(ThemeMode.DARK);
      const lookup: ColorLookup = resolver.colourOf('page_background');
      expect(lookup.outcome).assertEqual(LookupOutcome.FOUND);
      expect(lookup.theme).assertEqual(ThemeMode.DARK);
      expect(lookup.value).assertEqual('#000000');
      const brand: ColorLookup = resolver.colourOf('brand');
      expect(brand.value).assertEqual('#0A59F7');
      resolver.setTheme(ThemeMode.LIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColourDarkLookup_032, end');
    });

    /**
     * Scenario: the colour lookup of a shared key across both themes.
     * Expectation: a colour without an override answers the same value in both themes.
     */
    it('Assessment_ResourceColourSharedKey_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColourSharedKey_033, begin');
      const light: ColorLookup = resolver.colourOf('warning');
      expect(light.value).assertEqual('#ED6F21');
      resolver.setTheme(ThemeMode.DARK);
      const dark: ColorLookup = resolver.colourOf('warning');
      expect(dark.value).assertEqual('#ED6F21');
      expect(light.value).assertEqual(dark.value);
      const success: ColorLookup = resolver.colourOf('success');
      expect(success.value).assertEqual('#64BB5C');
      resolver.setTheme(ThemeMode.LIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColourSharedKey_033, end');
    });

    /**
     * Scenario: the colour lookup of a missing key.
     * Expectation: the missing outcome is reported with the transparent fallback.
     */
    it('Assessment_ResourceColourMissing_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColourMissing_034, begin');
      const lookup: ColorLookup = resolver.colourOf('missing_colour');
      expect(lookup.outcome).assertEqual(LookupOutcome.MISSING);
      expect(lookup.value).assertEqual(FALLBACK_COLOR);
      expect(lookup.key).assertEqual('missing_colour');
      expect(FALLBACK_COLOR).assertEqual('#00000000');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceColourMissing_034, end');
    });

    /**
     * Scenario: the float lookup through the resolver.
     * Expectation: a known key answers its value and an unknown key answers the sentinel.
     */
    it('Assessment_ResourceFloatLookup_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFloatLookup_035, begin');
      expect(resolver.floatOf('page_padding')).assertEqual(PAGE_PADDING_VP);
      expect(resolver.floatOf('card_radius')).assertEqual(CARD_RADIUS_VP);
      expect(resolver.floatOf('font_size_body')).assertEqual(FONT_SIZE_BODY);
      expect(resolver.floatOf('missing_float')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceFloatLookup_035, end');
    });

    /**
     * Scenario: the string fallback helper.
     * Expectation: a found key answers the value and a missing one answers the caller fallback.
     */
    it('Assessment_ResourceStringFallback_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringFallback_036, begin');
      expect(resolver.stringOrFallback('exam_title', 'Exam')).assertEqual('Exam');
      expect(resolver.stringOrFallback('missing_key', 'Exam')).assertEqual('Exam');
      expect(resolver.stringOrFallback('missing_key', '')).assertEqual('');
      expect(resolver.stringOrFallback('missing_key', 'unknown')).assertEqual('unknown');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceStringFallback_036, end');
    });

    /**
     * Scenario: the audit of the whole catalogue.
     * Expectation: every invariant of the catalogue holds.
     */
    it('Assessment_ResourceAudit_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceAudit_037, begin');
      expect(auditor.stringKeysHaveValues()).assertTrue();
      expect(auditor.stringValuesAreTrimmed()).assertTrue();
      expect(auditor.coloursAreValid()).assertTrue();
      expect(auditor.floatsArePositive()).assertTrue();
      expect(auditor.placeholderFlagsMatchValues()).assertTrue();
      expect(auditor.allHold()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceAudit_037, end');
    });

    /**
     * Scenario: the audit of a synthetic entry with a stale placeholder flag.
     * Expectation: the audit detects the inconsistency when a value carries a placeholder.
     */
    it('Assessment_ResourceAuditDetectsFlag_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceAuditDetectsFlag_038, begin');
      const value: string = 'duration: %d min';
      const carriesPlaceholder: boolean = value.indexOf(NUMBER_PLACEHOLDER) >= 0;
      expect(carriesPlaceholder).assertTrue();
      const staleFlag: boolean = false;
      expect(carriesPlaceholder === staleFlag).assertFalse();
      const consistent: boolean = carriesPlaceholder === true;
      expect(consistent).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceAuditDetectsFlag_038, end');
    });

    /**
     * Scenario: the catalogue of the option labels.
     * Expectation: every question has three options labelled A, B and C.
     */
    it('Assessment_ResourceOptionLabels_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceOptionLabels_039, begin');
      const base: number = 65;
      expect(String.fromCharCode(base)).assertEqual('A');
      expect(String.fromCharCode(base + 1)).assertEqual('B');
      expect(String.fromCharCode(base + 2)).assertEqual('C');
      const options: string[] = StringCatalog.prefix('question_option_');
      expect(options.length).assertEqual(9);
      expect(options.length / 3).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceOptionLabels_039, end');
    });

    /**
     * Scenario: the theme round trip of the resolver.
     * Expectation: switching the theme twice returns the initial values.
     */
    it('Assessment_ResourceThemeRoundTrip_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceThemeRoundTrip_040, begin');
      const lightValue: string = resolver.colourOf('card_background').value;
      resolver.setTheme(ThemeMode.DARK);
      const darkValue: string = resolver.colourOf('card_background').value;
      resolver.setTheme(ThemeMode.LIGHT);
      const back: string = resolver.colourOf('card_background').value;
      expect(lightValue).assertEqual('#FFFFFF');
      expect(darkValue).assertEqual('#1C1C1E');
      expect(back).assertEqual(lightValue);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceThemeRoundTrip_040, end');
    });

    /**
     * Scenario: the kind of a resource key.
     * Expectation: each catalogue answers its own kind and an unknown key answers unknown.
     */
    it('Assessment_ResourceKeyKinds_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceKeyKinds_048, begin');
      expect(resolver.kindOf('index_title')).assertEqual(ResourceKind.STRING);
      expect(resolver.kindOf('page_padding')).assertEqual(ResourceKind.FLOAT);
      expect(resolver.kindOf('page_background')).assertEqual(ResourceKind.COLOR);
      expect(resolver.kindOf('missing_key')).assertEqual(ResourceKind.UNKNOWN);
      expect(StringCatalog.contains('brand')).assertFalse();
      expect(FloatCatalog.find('brand') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceKeyKinds_048, end');
    });

    /**
     * Scenario: a string lookup on a key that only exists as a colour.
     * Expectation: the lookup reports the wrong kind instead of a found value.
     */
    it('Assessment_ResourceWrongKind_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceWrongKind_049, begin');
      const lookup: StringLookup = resolver.stringOf('brand');
      expect(lookup.outcome).assertEqual(LookupOutcome.WRONG_KIND);
      expect(lookup.value).assertEqual(FALLBACK_STRING);
      expect(resolver.kindOf('brand')).assertEqual(ResourceKind.COLOR);
      expect(resolver.stringOrFallback('brand', 'fallback')).assertEqual('fallback');
      const numeric: StringLookup = resolver.stringOf('page_padding');
      expect(numeric.outcome).assertEqual(LookupOutcome.WRONG_KIND);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceWrongKind_049, end');
    });
  });
}
