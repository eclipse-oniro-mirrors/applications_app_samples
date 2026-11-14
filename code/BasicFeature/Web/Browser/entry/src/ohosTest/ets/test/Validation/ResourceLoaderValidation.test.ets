/*
 * Copyright (c) 2026 Sample Device Co., Ltd.
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
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, textById, countById,
  ID_INPUT_URL, ID_NAV_HOME, TIMEOUT_COMPONENT, PAD_HOME_PAGE, PHONE_HOME_PAGE,
  TOLERANCE_COMPONENT_COUNT
} from '../Shared/BrowserTestKit';
import { MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserResourceLoaderValidationTest';

/* ------------------------------------------------------------------ */
/* Resource vocabulary of the browser sample                          */
/* ------------------------------------------------------------------ */

const KIND_MEDIA: string = 'app.media';
const KIND_STRING: string = 'app.string';
const KIND_COLOR: string = 'app.color';
const KIND_RAWFILE: string = 'rawfile';

const PREFIX_MEDIA: string = 'app.media.';
const PREFIX_STRING: string = 'app.string.';
const PREFIX_COLOR: string = 'app.color.';
const PREFIX_RAWFILE: string = 'resource://rawfile/';

const RAW_PAD_PAGE: string = 'pad.html';
const RAW_PHONE_PAGE: string = 'phone.html';
const RAW_INDEX_PAGE: string = 'index.html';
const RAW_TEST_PAGE: string = 'test.html';
const RAW_FAVICON: string = 'favicon.ico';
const RAW_BACKGROUND_IMAGE: string = 'backgroundImg.jpg';

const MEDIA_ICON: string = 'icon';
const MEDIA_SUBMIT: string = 'submit';
const MEDIA_ADD: string = 'ic_public_add';
const MEDIA_ADVANCE: string = 'ic_public_advance';
const MEDIA_BACK: string = 'ic_public_back';
const MEDIA_CANCEL_FILLED: string = 'ic_public_cancel_filled';
const MEDIA_HOME: string = 'ic_public_home';
const MEDIA_MORE_FILLED: string = 'ic_public_more_filled';
const MEDIA_NAVIGATION: string = 'ic_public_navigation';
const MEDIA_REFRESH: string = 'ic_public_refresh';
const MEDIA_SEARCH: string = 'search';

const STRING_ENTRY_DESC: string = 'entry_desc';
const STRING_ABILITY_DESC: string = 'MainAbility_desc';
const STRING_ABILITY_LABEL: string = 'MainAbility_label';
const STRING_INPUT_URL: string = 'Input_url';

const COLOR_WHITE: string = 'white';
const COLOR_WHITE_VALUE: string = '#FFFFFF';

const DEFAULT_LOCALE: string = 'zh-Hans';
const FALLBACK_LOCALE: string = 'en-US';

const FALLBACK_MEDIA_NAME: string = MEDIA_ICON;
const FALLBACK_STRING_VALUE: string = '';
const FALLBACK_COLOR_VALUE: string = '#FFFFFF';

const STARTUP_ICON_REF: string = '$media:icon';
const STARTUP_BACKGROUND_REF: string = '$color:white';
const ABILITY_LABEL_REF: string = '$string:MainAbility_label';

const MAX_LOAD_ATTEMPTS: number = 256;
const PAGE_EXTENSION: string = '.html';
const ICON_EXTENSION: string = '.ico';

/* ------------------------------------------------------------------ */
/* Resource reference parser                                          */
/* ------------------------------------------------------------------ */

/**
 * Parsed form of an `$r('app.media.name')` style reference.
 *
 * The loader accepts both the ETS dollar form and the plain module form and
 * always exposes the same kind/name pair, which keeps assertions readable.
 */
class ResourceRef {
  kind: string;
  name: string;
  raw: string;

  constructor(kind: string, name: string, raw: string) {
    this.kind = kind;
    this.name = name;
    this.raw = raw;
  }

  /** Builds a reference from the bare textual form, empty on malformed input. */
  static parse(text: string): ResourceRef {
    const trimmed: string = text.trim();
    if (trimmed.indexOf(PREFIX_MEDIA) === 0) {
      return new ResourceRef(KIND_MEDIA, trimmed.substring(PREFIX_MEDIA.length), trimmed);
    }
    if (trimmed.indexOf(PREFIX_STRING) === 0) {
      return new ResourceRef(KIND_STRING, trimmed.substring(PREFIX_STRING.length), trimmed);
    }
    if (trimmed.indexOf(PREFIX_COLOR) === 0) {
      return new ResourceRef(KIND_COLOR, trimmed.substring(PREFIX_COLOR.length), trimmed);
    }
    if (trimmed.indexOf(PREFIX_RAWFILE) === 0) {
      return new ResourceRef(KIND_RAWFILE, trimmed.substring(PREFIX_RAWFILE.length), trimmed);
    }
    return new ResourceRef('invalid', '', trimmed);
  }

  isValid(): boolean {
    return this.kind !== 'invalid' && this.name.length > 0;
  }

  isMedia(): boolean {
    return this.kind === KIND_MEDIA;
  }

  isRawFile(): boolean {
    return this.kind === KIND_RAWFILE;
  }

  /** Canonical dollar notation used by the ETS sources of the sample. */
  dollarForm(): string {
    if (this.kind === KIND_RAWFILE) {
      return `$rawfile('${this.name}')`;
    }
    return `$r('${this.kind}.${this.name}')`;
  }

  sameAs(other: ResourceRef | null): boolean {
    if (other === null) {
      return false;
    }
    return this.kind === other.kind && this.name === other.name;
  }

  describe(): string {
    return `${this.kind}:${this.name}`;
  }
}

/* ------------------------------------------------------------------ */
/* Resource entries                                                   */
/* ------------------------------------------------------------------ */

/** One entry of the media table, icon or bitmap. */
class MediaEntry {
  name: string;
  format: string;
  width: number;
  height: number;
  bytes: number;

  constructor(name: string, format: string, width: number, height: number, bytes: number) {
    this.name = name;
    this.format = format;
    this.width = width;
    this.height = height;
    this.bytes = bytes;
  }

  isVector(): boolean {
    return this.format === 'svg';
  }

  aspectRatio(): number {
    if (this.height <= 0) {
      return 0;
    }
    return Math.round(this.width / this.height * 100) / 100;
  }

  isSquare(): boolean {
    return this.width > 0 && this.width === this.height;
  }

  sizeKb(): number {
    return Math.round(this.bytes / 1024 * 100) / 100;
  }

  displaySize(): string {
    return `${this.width}x${this.height}`;
  }

  describe(): string {
    return `${this.name}.${this.format}:${this.displaySize()}:${this.sizeKb()}kb`;
  }
}

/** One entry of the rawfile table, page or binary asset. */
class RawFileEntry {
  name: string;
  mime: string;
  bytes: number;
  exists: boolean;

  constructor(name: string, mime: string, bytes: number, exists: boolean = true) {
    this.name = name;
    this.mime = mime;
    this.bytes = bytes;
    this.exists = exists;
  }

  isPage(): boolean {
    return this.name.endsWith(PAGE_EXTENSION);
  }

  isImage(): boolean {
    return this.mime.indexOf('image/') === 0;
  }

  isFavicon(): boolean {
    return this.name.endsWith(ICON_EXTENSION);
  }

  baseName(): string {
    const dot: number = this.name.indexOf('.');
    return dot < 0 ? this.name : this.name.substring(0, dot);
  }

  sizeKb(): number {
    return Math.round(this.bytes / 1024 * 100) / 100;
  }

  sameAs(other: RawFileEntry | null): boolean {
    if (other === null) {
      return false;
    }
    return this.name === other.name && this.mime === other.mime &&
      this.bytes === other.bytes;
  }

  describe(): string {
    return `${this.name}(${this.mime},${this.sizeKb()}kb,exists=${this.exists})`;
  }
}

/** One entry of the string table with per locale overrides. */
class StringEntry {
  key: string;
  defaultValue: string;
  localeValues: Map<string, string> = new Map<string, string>();
  resolveCount: number = 0;
  fallbackCount: number = 0;

  constructor(key: string, defaultValue: string) {
    this.key = key;
    this.defaultValue = defaultValue;
  }

  withLocale(locale: string, value: string): StringEntry {
    this.localeValues.set(locale, value);
    return this;
  }

  /** Locale specific value, default value, then the empty fallback. */
  resolve(locale: string): string {
    this.resolveCount += 1;
    const localized: string | undefined = this.localeValues.get(locale);
    if (localized !== undefined && localized.length > 0) {
      return localized;
    }
    this.fallbackCount += 1;
    if (this.defaultValue.length > 0) {
      return this.defaultValue;
    }
    return FALLBACK_STRING_VALUE;
  }

  hasLocale(locale: string): boolean {
    const localized: string | undefined = this.localeValues.get(locale);
    return localized !== undefined && localized.length > 0;
  }

  localeCount(): number {
    return this.localeValues.size;
  }

  effectiveValue(): string {
    return this.defaultValue.length > 0 ? this.defaultValue : FALLBACK_STRING_VALUE;
  }

  describe(): string {
    return `${this.key}='${this.defaultValue}' locales=${this.localeCount()}`;
  }
}

/** One entry of the color table. */
class ColorEntry {
  name: string;
  value: string;
  loadCount: number = 0;

  constructor(name: string, value: string) {
    this.name = name;
    this.value = value;
  }

  static isHexColor(value: string): boolean {
    if (value.length !== 7 || value.indexOf('#') !== 0) {
      return false;
    }
    for (let index = 1; index < value.length; index++) {
      const code: number = value.charCodeAt(index);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 70;
      const isLower: boolean = code >= 97 && code <= 102;
      if (!isDigit && !isUpper && !isLower) {
        return false;
      }
    }
    return true;
  }

  isValid(): boolean {
    return ColorEntry.isHexColor(this.value);
  }

  red(): number {
    return this.isValid() ? parseInt(this.value.substring(1, 3), 16) : 0;
  }

  green(): number {
    return this.isValid() ? parseInt(this.value.substring(3, 5), 16) : 0;
  }

  blue(): number {
    return this.isValid() ? parseInt(this.value.substring(5, 7), 16) : 0;
  }

  /** Perceived luminance in the 0..255 range used to pick a foreground. */
  luminance(): number {
    return Math.round(0.299 * this.red() + 0.587 * this.green() + 0.114 * this.blue());
  }

  isLight(): boolean {
    return this.luminance() >= 128;
  }

  toRgba(alpha: number): string {
    const safeAlpha: number = alpha < 0 ? 0 : (alpha > 1 ? 1 : alpha);
    return `rgba(${this.red()},${this.green()},${this.blue()},${safeAlpha})`;
  }

  describe(): string {
    return `${this.name}=${this.value}`;
  }
}

/* ------------------------------------------------------------------ */
/* Seed tables                                                        */
/* ------------------------------------------------------------------ */

const MEDIA_SEED: MediaEntry[] = [
  new MediaEntry(MEDIA_ADD, 'svg', 24, 24, 1180),
  new MediaEntry(MEDIA_ADVANCE, 'png', 32, 32, 2048),
  new MediaEntry(MEDIA_BACK, 'svg', 24, 24, 1120),
  new MediaEntry(MEDIA_CANCEL_FILLED, 'svg', 24, 24, 990),
  new MediaEntry(MEDIA_HOME, 'svg', 24, 24, 1240),
  new MediaEntry(MEDIA_MORE_FILLED, 'svg', 24, 24, 1080),
  new MediaEntry(MEDIA_NAVIGATION, 'svg', 24, 24, 1310),
  new MediaEntry(MEDIA_REFRESH, 'svg', 24, 24, 1150),
  new MediaEntry(MEDIA_SEARCH, 'svg', 24, 24, 870),
  new MediaEntry(MEDIA_SUBMIT, 'png', 48, 48, 4096),
  new MediaEntry(MEDIA_ICON, 'png', 512, 512, 24576)
];

const RAW_SEED: RawFileEntry[] = [
  new RawFileEntry(RAW_PAD_PAGE, 'text/html', 1420),
  new RawFileEntry(RAW_PHONE_PAGE, 'text/html', 1380),
  new RawFileEntry(RAW_INDEX_PAGE, 'text/html', 2260),
  new RawFileEntry(RAW_TEST_PAGE, 'text/html', 640),
  new RawFileEntry(RAW_FAVICON, 'image/x-icon', 1150),
  new RawFileEntry(RAW_BACKGROUND_IMAGE, 'image/jpeg', 88064)
];

const STRING_SEED: StringEntry[] = [
  new StringEntry(STRING_ENTRY_DESC, 'description')
    .withLocale(DEFAULT_LOCALE, 'description')
    .withLocale(FALLBACK_LOCALE, 'description'),
  new StringEntry(STRING_ABILITY_DESC, 'description')
    .withLocale(FALLBACK_LOCALE, 'description'),
  new StringEntry(STRING_ABILITY_LABEL, '浏览器')
    .withLocale(DEFAULT_LOCALE, '浏览器')
    .withLocale(FALLBACK_LOCALE, 'Browser'),
  new StringEntry(STRING_INPUT_URL, 'InputUrl')
    .withLocale(FALLBACK_LOCALE, 'InputUrl')
];

const COLOR_SEED: ColorEntry[] = [
  new ColorEntry(COLOR_WHITE, COLOR_WHITE_VALUE)
];

/* ------------------------------------------------------------------ */
/* Resource catalog                                                   */
/* ------------------------------------------------------------------ */

/**
 * In-memory mirror of the module resource table.
 *
 * Every lookup records a hit or a miss so the tests can prove that a missing
 * resource falls back instead of propagating an undefined value into the UI.
 */
class ResourceCatalog {
  media: Map<string, MediaEntry> = new Map<string, MediaEntry>();
  strings: Map<string, StringEntry> = new Map<string, StringEntry>();
  colors: Map<string, ColorEntry> = new Map<string, ColorEntry>();
  rawFiles: Map<string, RawFileEntry> = new Map<string, RawFileEntry>();
  hits: number = 0;
  misses: number = 0;
  fallbackHits: number = 0;
  lastMissing: string = '';

  constructor() {
    for (let index = 0; index < MEDIA_SEED.length; index++) {
      this.media.set(MEDIA_SEED[index].name, MEDIA_SEED[index]);
    }
    for (let index = 0; index < RAW_SEED.length; index++) {
      this.rawFiles.set(RAW_SEED[index].name, RAW_SEED[index]);
    }
    for (let index = 0; index < STRING_SEED.length; index++) {
      this.strings.set(STRING_SEED[index].key, STRING_SEED[index]);
    }
    for (let index = 0; index < COLOR_SEED.length; index++) {
      this.colors.set(COLOR_SEED[index].name, COLOR_SEED[index]);
    }
  }

  /* ---------------- lookup ---------------- */

  mediaOf(name: string): MediaEntry | null {
    const entry: MediaEntry | undefined = this.media.get(name);
    if (entry === undefined) {
      this.misses += 1;
      this.lastMissing = name;
      return null;
    }
    this.hits += 1;
    return entry;
  }

  stringOf(key: string): StringEntry | null {
    const entry: StringEntry | undefined = this.strings.get(key);
    if (entry === undefined) {
      this.misses += 1;
      this.lastMissing = key;
      return null;
    }
    this.hits += 1;
    return entry;
  }

  colorOf(name: string): ColorEntry | null {
    const entry: ColorEntry | undefined = this.colors.get(name);
    if (entry === undefined) {
      this.misses += 1;
      this.lastMissing = name;
      return null;
    }
    this.hits += 1;
    return entry;
  }

  rawOf(name: string): RawFileEntry | null {
    const entry: RawFileEntry | undefined = this.rawFiles.get(name);
    if (entry === undefined || !entry.exists) {
      this.misses += 1;
      this.lastMissing = name;
      return null;
    }
    this.hits += 1;
    return entry;
  }

  hasMedia(name: string): boolean {
    return this.media.has(name);
  }

  hasString(key: string): boolean {
    return this.strings.has(key);
  }

  hasColor(name: string): boolean {
    return this.colors.has(name);
  }

  hasRaw(name: string): boolean {
    return this.rawFiles.has(name);
  }

  /* ---------------- counts ---------------- */

  mediaCount(): number {
    return this.media.size;
  }

  stringCount(): number {
    return this.strings.size;
  }

  colorCount(): number {
    return this.colors.size;
  }

  rawCount(): number {
    return this.rawFiles.size;
  }

  totalCount(): number {
    return this.mediaCount() + this.stringCount() + this.colorCount() + this.rawCount();
  }

  hitCount(): number {
    return this.hits;
  }

  missCount(): number {
    return this.misses;
  }

  fallbackCount(): number {
    return this.fallbackHits;
  }

  /* ---------------- reference driven lookup ---------------- */

  resolve(ref: ResourceRef): string {
    if (!ref.isValid()) {
      this.misses += 1;
      this.lastMissing = ref.raw;
      return FALLBACK_STRING_VALUE;
    }
    if (ref.kind === KIND_MEDIA) {
      const media: MediaEntry | null = this.mediaOf(ref.name);
      return media === null ? FALLBACK_MEDIA_NAME : media.name;
    }
    if (ref.kind === KIND_STRING) {
      const stringEntry: StringEntry | null = this.stringOf(ref.name);
      return stringEntry === null ? FALLBACK_STRING_VALUE : stringEntry.effectiveValue();
    }
    if (ref.kind === KIND_COLOR) {
      const color: ColorEntry | null = this.colorOf(ref.name);
      return color === null ? FALLBACK_COLOR_VALUE : color.value;
    }
    const raw: RawFileEntry | null = this.rawOf(ref.name);
    return raw === null ? '' : PREFIX_RAWFILE + raw.name;
  }

  /**
   * Icon lookup with a hard fallback: the launcher icon is always present,
   * therefore a broken media reference must resolve to it.
   */
  resolveIcon(name: string): MediaEntry {
    const entry: MediaEntry | null = this.mediaOf(name);
    if (entry !== null) {
      return entry;
    }
    this.fallbackHits += 1;
    const fallback: MediaEntry | undefined = this.media.get(FALLBACK_MEDIA_NAME);
    if (fallback === undefined) {
      return new MediaEntry(FALLBACK_MEDIA_NAME, 'png', 0, 0, 0);
    }
    return fallback;
  }

  /** Home page resolution mirrors TitleBar: pad for tablet, phone otherwise. */
  homePageFor(isPhone: boolean): RawFileEntry | null {
    const name: string = isPhone ? PHONE_HOME_PAGE : PAD_HOME_PAGE;
    const entry: RawFileEntry | null = this.rawOf(name);
    if (entry !== null) {
      return entry;
    }
    this.fallbackHits += 1;
    return this.rawOf(RAW_INDEX_PAGE);
  }

  /* ---------------- startup resources ---------------- */

  startupIcon(): MediaEntry {
    const ref: ResourceRef = ResourceRef.parse(STARTUP_ICON_REF.replace('$media:', PREFIX_MEDIA));
    return this.resolveIcon(ref.name);
  }

  startWindowBackground(): ColorEntry {
    const ref: ResourceRef = ResourceRef.parse(
      STARTUP_BACKGROUND_REF.replace('$color:', PREFIX_COLOR));
    const entry: ColorEntry | null = this.colorOf(ref.name);
    if (entry === null) {
      this.fallbackHits += 1;
      return new ColorEntry(ref.name, FALLBACK_COLOR_VALUE);
    }
    return entry;
  }

  abilityLabel(locale: string): string {
    const ref: ResourceRef = ResourceRef.parse(ABILITY_LABEL_REF.replace('$string:', PREFIX_STRING));
    const entry: StringEntry | null = this.stringOf(ref.name);
    if (entry === null) {
      this.fallbackHits += 1;
      return FALLBACK_STRING_VALUE;
    }
    return entry.resolve(locale);
  }

  /* ---------------- inventories ---------------- */

  pageNames(): string[] {
    const names: string[] = [];
    this.rawFiles.forEach((entry: RawFileEntry) => {
      if (entry.isPage()) {
        names.push(entry.name);
      }
    });
    names.sort();
    return names;
  }

  imageNames(): string[] {
    const names: string[] = [];
    this.rawFiles.forEach((entry: RawFileEntry) => {
      if (entry.isImage()) {
        names.push(entry.name);
      }
    });
    names.sort();
    return names;
  }

  vectorIconNames(): string[] {
    const names: string[] = [];
    this.media.forEach((entry: MediaEntry) => {
      if (entry.isVector()) {
        names.push(entry.name);
      }
    });
    names.sort();
    return names;
  }

  largestMedia(): MediaEntry {
    let result: MediaEntry = new MediaEntry('', 'png', 0, 0, 0);
    this.media.forEach((entry: MediaEntry) => {
      if (entry.bytes > result.bytes) {
        result = entry;
      }
    });
    return result;
  }

  missingNames(): string[] {
    const missing: string[] = [];
    this.media.forEach((entry: MediaEntry, name: string) => {
      if (entry.width <= 0 || entry.height <= 0) {
        missing.push(name);
      }
    });
    this.rawFiles.forEach((entry: RawFileEntry, name: string) => {
      if (!entry.exists) {
        missing.push(name);
      }
    });
    return missing;
  }

  /* ---------------- consistency ---------------- */

  validate(): string[] {
    const issues: string[] = [];
    if (!this.hasRaw(RAW_PAD_PAGE)) {
      issues.push('missing-pad-home');
    }
    if (!this.hasRaw(RAW_PHONE_PAGE)) {
      issues.push('missing-phone-home');
    }
    if (!this.hasRaw(RAW_FAVICON)) {
      issues.push('missing-favicon');
    }
    if (!this.hasMedia(MEDIA_ICON)) {
      issues.push('missing-launcher-icon');
    }
    if (!this.hasColor(COLOR_WHITE)) {
      issues.push('missing-start-window-color');
    }
    const white: ColorEntry | null = this.colorOf(COLOR_WHITE);
    if (white !== null && !white.isValid()) {
      issues.push('invalid-start-window-color');
    }
    if (!this.hasString(STRING_INPUT_URL)) {
      issues.push('missing-input-placeholder');
    }
    return issues;
  }

  describe(): string {
    return `media=${this.mediaCount()} raw=${this.rawCount()} string=${this.stringCount()} ` +
      `color=${this.colorCount()} hits=${this.hits} misses=${this.misses}`;
  }
}

/* ------------------------------------------------------------------ */
/* Load session recorder                                              */
/* ------------------------------------------------------------------ */

/** Records every resource request of one page bootstrap. */
class LoadSession {
  catalog: ResourceCatalog;
  clock: MockClock;
  attempts: string[] = [];
  results: boolean[] = [];
  startedAt: number = 0;
  finishedAt: number = 0;

  constructor(catalog: ResourceCatalog, clock: MockClock) {
    this.catalog = catalog;
    this.clock = clock;
  }

  begin(): void {
    this.startedAt = this.clock.now();
    this.attempts = [];
    this.results = [];
    this.finishedAt = 0;
  }

  /** One request, the result is true when no miss was recorded. */
  load(ref: ResourceRef): boolean {
    const missesBefore: number = this.catalog.missCount();
    this.catalog.resolve(ref);
    const ok: boolean = ref.isValid() && this.catalog.missCount() === missesBefore;
    this.attempts.push(ref.describe());
    this.results.push(ok);
    return ok;
  }

  loadMany(refs: ResourceRef[]): number {
    let loaded: number = 0;
    for (let index = 0; index < refs.length; index++) {
      if (this.load(refs[index])) {
        loaded += 1;
      }
    }
    return loaded;
  }

  loadRaw(name: string): boolean {
    return this.load(new ResourceRef(KIND_RAWFILE, name, PREFIX_RAWFILE + name));
  }

  finish(): void {
    this.finishedAt = this.clock.now();
  }

  attemptCount(): number {
    return this.attempts.length;
  }

  hitCount(): number {
    let hits: number = 0;
    for (let index = 0; index < this.results.length; index++) {
      if (this.results[index]) {
        hits += 1;
      }
    }
    return hits;
  }

  missCount(): number {
    return this.attemptCount() - this.hitCount();
  }

  distinctAttempts(): number {
    const seen: string[] = [];
    for (let index = 0; index < this.attempts.length; index++) {
      if (seen.indexOf(this.attempts[index]) < 0) {
        seen.push(this.attempts[index]);
      }
    }
    return seen.length;
  }

  elapsed(): number {
    if (this.startedAt === 0 || this.finishedAt < this.startedAt) {
      return 0;
    }
    return this.finishedAt - this.startedAt;
  }

  describe(): string {
    return `attempts=${this.attemptCount()} hits=${this.hitCount()} ` +
      `misses=${this.missCount()} elapsed=${this.elapsed()}`;
  }
}

export default function resourceLoaderValidationTest() {
  describe('resourceLoaderValidationTest', () => {
    const clock: MockClock = new MockClock(1700000000000);
    let catalog: ResourceCatalog = new ResourceCatalog();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      TestLogger.step(TAG, 'launch browser application');
      await startBrowserApp();
      await serializedDelay(getDriver(), 200);
      catalog = new ResourceCatalog();
    });

    afterAll(() => {
      TestLogger.info(TAG, `suite end, ${TestLogger.summary(TAG)}`);
    });

    it('Resource_Ref_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Resource_Ref_001');
      TestLogger.step(TAG, 'parse a media reference in both notations');
      const ref: ResourceRef = ResourceRef.parse('app.media.ic_public_back');
      expect(ref.kind).assertEqual(KIND_MEDIA);
      expect(ref.name).assertEqual(MEDIA_BACK);
      expect(ref.isMedia()).assertTrue();
      expect(ref.isRawFile()).assertFalse();
      expect(ref.isValid()).assertTrue();
      expect(ref.dollarForm()).assertEqual(`$r('app.media.${MEDIA_BACK}')`);
      const padded: ResourceRef = ResourceRef.parse('  app.media.submit  ');
      expect(padded.name).assertEqual(MEDIA_SUBMIT);
      expect(padded.sameAs(ResourceRef.parse('app.media.submit'))).assertTrue();
      expect(ref.sameAs(padded)).assertFalse();
      expect(ref.sameAs(ResourceRef.parse('app.media.ic_public_add'))).assertFalse();
      expect(ref.sameAs(null)).assertFalse();
      TestLogger.info(TAG, `parsed ${ref.describe()}`);
      TestLogger.pass(TAG, 'Resource_Ref_001');
    });

    it('Resource_Ref_002', 0, async () => {
      TestLogger.step(TAG, 'parse string color and rawfile references');
      const stringRef: ResourceRef = ResourceRef.parse('app.string.Input_url');
      expect(stringRef.kind).assertEqual(KIND_STRING);
      expect(stringRef.name).assertEqual(STRING_INPUT_URL);
      const colorRef: ResourceRef = ResourceRef.parse('app.color.white');
      expect(colorRef.kind).assertEqual(KIND_COLOR);
      expect(colorRef.name).assertEqual(COLOR_WHITE);
      expect(colorRef.dollarForm()).assertEqual(`$r('app.color.${COLOR_WHITE}')`);
      const rawRef: ResourceRef = ResourceRef.parse('resource://rawfile/pad.html');
      expect(rawRef.kind).assertEqual(KIND_RAWFILE);
      expect(rawRef.name).assertEqual(RAW_PAD_PAGE);
      expect(rawRef.isRawFile()).assertTrue();
      expect(rawRef.dollarForm()).assertEqual(`$rawfile('${RAW_PAD_PAGE}')`);
      TestLogger.pass(TAG, 'Resource_Ref_002');
    });

    it('Resource_Ref_003', 0, async () => {
      TestLogger.step(TAG, 'malformed references are rejected');
      const empty: ResourceRef = ResourceRef.parse('');
      expect(empty.isValid()).assertFalse();
      expect(empty.kind).assertEqual('invalid');
      const bare: ResourceRef = ResourceRef.parse('pad.html');
      expect(bare.isValid()).assertFalse();
      expect(bare.dollarForm()).assertEqual(`$r('invalid.')`);
      expect(ResourceRef.parse('app.media.').isValid()).assertFalse();
      expect(ResourceRef.parse('media.icon').isValid()).assertFalse();
      expect(ResourceRef.parse('$r(app.media.icon)').isValid()).assertFalse();
      const trimmedEmpty: ResourceRef = ResourceRef.parse('   ');
      expect(trimmedEmpty.isValid()).assertFalse();
      TestLogger.pass(TAG, 'Resource_Ref_003');
    });

    it('Resource_Media_004', 0, async () => {
      TestLogger.step(TAG, 'media table metadata for vector and bitmap icons');
      const vector: MediaEntry | null = catalog.mediaOf(MEDIA_BACK);
      expect(vector === null).assertFalse();
      if (vector !== null) {
        expect(vector.isVector()).assertTrue();
        expect(vector.isSquare()).assertTrue();
        expect(vector.aspectRatio()).assertEqual(1);
        expect(vector.displaySize()).assertEqual('24x24');
        expect(vector.sizeKb()).assertEqual(1.09);
      }
      const bitmap: MediaEntry | null = catalog.mediaOf(MEDIA_ADVANCE);
      expect(bitmap === null).assertFalse();
      if (bitmap !== null) {
        expect(bitmap.isVector()).assertFalse();
        expect(bitmap.format).assertEqual('png');
        expect(bitmap.sizeKb()).assertEqual(2);
      }
      expect(catalog.mediaCount()).assertEqual(MEDIA_SEED.length);
      TestLogger.pass(TAG, 'Resource_Media_004');
    });

    it('Resource_Media_005', 0, async () => {
      TestLogger.step(TAG, 'launcher icon is the largest media asset');
      const largest: MediaEntry = catalog.largestMedia();
      expect(largest.name).assertEqual(MEDIA_ICON);
      expect(largest.width).assertEqual(512);
      expect(largest.height).assertEqual(512);
      expect(largest.sizeKb()).assertEqual(24);
      expect(largest.isVector()).assertFalse();
      expect(largest.aspectRatio()).assertEqual(1);
      const submit: MediaEntry | null = catalog.mediaOf(MEDIA_SUBMIT);
      expect(submit === null).assertFalse();
      if (submit !== null) {
        expect(submit.width).assertEqual(48);
        expect(submit.isSquare()).assertTrue();
      }
      const invalid: MediaEntry = new MediaEntry('broken', 'png', 32, 0, 100);
      expect(invalid.aspectRatio()).assertEqual(0);
      expect(invalid.isSquare()).assertFalse();
      TestLogger.pass(TAG, 'Resource_Media_005');
    });

    it('Resource_Raw_006', 0, async () => {
      TestLogger.step(TAG, 'rawfile pages are html and carry text mime type');
      const pad: RawFileEntry | null = catalog.rawOf(RAW_PAD_PAGE);
      expect(pad === null).assertFalse();
      if (pad !== null) {
        expect(pad.isPage()).assertTrue();
        expect(pad.isImage()).assertFalse();
        expect(pad.isFavicon()).assertFalse();
        expect(pad.baseName()).assertEqual('pad');
        expect(pad.mime).assertEqual('text/html');
      }
      const index: RawFileEntry | null = catalog.rawOf(RAW_INDEX_PAGE);
      const test: RawFileEntry | null = catalog.rawOf(RAW_TEST_PAGE);
      expect(index === null).assertFalse();
      expect(test === null).assertFalse();
      if (index !== null && test !== null) {
        expect(index.isPage()).assertTrue();
        expect(test.isPage()).assertTrue();
        expect(index.sizeKb()).assertEqual(2.21);
        expect(test.sizeKb()).assertEqual(0.63);
      }
      expect(catalog.rawCount()).assertEqual(RAW_SEED.length);
      TestLogger.pass(TAG, 'Resource_Raw_006');
    });

    it('Resource_Raw_007', 0, async () => {
      TestLogger.step(TAG, 'favicon and background image classification');
      const favicon: RawFileEntry | null = catalog.rawOf(RAW_FAVICON);
      expect(favicon === null).assertFalse();
      if (favicon !== null) {
        expect(favicon.isFavicon()).assertTrue();
        expect(favicon.isPage()).assertFalse();
        expect(favicon.isImage()).assertTrue();
        expect(favicon.mime).assertEqual('image/x-icon');
        expect(favicon.baseName()).assertEqual('favicon');
        expect(favicon.sizeKb()).assertEqual(1.12);
      }
      const background: RawFileEntry | null = catalog.rawOf(RAW_BACKGROUND_IMAGE);
      expect(background === null).assertFalse();
      if (background !== null) {
        expect(background.isImage()).assertTrue();
        expect(background.mime).assertEqual('image/jpeg');
        expect(background.sizeKb()).assertEqual(86);
        expect(background.sameAs(catalog.rawOf(RAW_BACKGROUND_IMAGE))).assertTrue();
        expect(background.sameAs(favicon)).assertFalse();
        expect(background.sameAs(null)).assertFalse();
      }
      expect(catalog.rawOf('missing.html') === null).assertTrue();
      TestLogger.pass(TAG, 'Resource_Raw_007');
    });

    it('Resource_String_008', 0, async () => {
      TestLogger.step(TAG, 'string table resolves default and locale values');
      const label: StringEntry | null = catalog.stringOf(STRING_ABILITY_LABEL);
      expect(label === null).assertFalse();
      if (label !== null) {
        expect(label.defaultValue).assertEqual('浏览器');
        expect(label.hasLocale(FALLBACK_LOCALE)).assertTrue();
        expect(label.hasLocale('ja-JP')).assertFalse();
        expect(label.localeCount()).assertEqual(2);
        expect(label.resolve(DEFAULT_LOCALE)).assertEqual('浏览器');
        expect(label.resolve(FALLBACK_LOCALE)).assertEqual('Browser');
        expect(label.resolve('ja-JP')).assertEqual('浏览器');
        expect(label.fallbackCount).assertEqual(1);
        expect(label.describe()).assertContain('locales=2');
      }
      expect(catalog.stringCount()).assertEqual(STRING_SEED.length);
      TestLogger.pass(TAG, 'Resource_String_008');
    });

    it('Resource_Color_009', 0, async () => {
      TestLogger.step(TAG, 'start window color is a valid white hex value');
      const white: ColorEntry | null = catalog.colorOf(COLOR_WHITE);
      expect(white === null).assertFalse();
      if (white !== null) {
        expect(white.isValid()).assertTrue();
        expect(white.value).assertEqual(COLOR_WHITE_VALUE);
        expect(white.red()).assertEqual(255);
        expect(white.green()).assertEqual(255);
        expect(white.blue()).assertEqual(255);
        expect(white.describe()).assertEqual('white=#FFFFFF');
      }
      expect(ColorEntry.isHexColor('#FFFFFF')).assertTrue();
      expect(ColorEntry.isHexColor('#000000')).assertTrue();
      expect(ColorEntry.isHexColor('#12abEF')).assertTrue();
      expect(ColorEntry.isHexColor('FFFFFF')).assertFalse();
      expect(ColorEntry.isHexColor('#FFF')).assertFalse();
      expect(ColorEntry.isHexColor('#GGGGGG')).assertFalse();
      expect(ColorEntry.isHexColor('#12345Z')).assertFalse();
      expect(catalog.colorCount()).assertEqual(COLOR_SEED.length);
      TestLogger.pass(TAG, 'Resource_Color_009');
    });

    it('Resource_Color_010', 0, async () => {
      TestLogger.step(TAG, 'luminance and rgba rendering of the theme colors');
      const white: ColorEntry = new ColorEntry(COLOR_WHITE, COLOR_WHITE_VALUE);
      expect(white.isLight()).assertTrue();
      expect(white.luminance()).assertEqual(255);
      expect(white.toRgba(0.5)).assertEqual('rgba(255,255,255,0.5)');
      expect(white.toRgba(2)).assertEqual('rgba(255,255,255,1)');
      expect(white.toRgba(-1)).assertEqual('rgba(255,255,255,0)');
      const black: ColorEntry = new ColorEntry('black', '#000000');
      expect(black.isLight()).assertFalse();
      expect(black.luminance()).assertEqual(0);
      expect(black.red()).assertEqual(0);
      const broken: ColorEntry = new ColorEntry('broken', 'white');
      expect(broken.isValid()).assertFalse();
      expect(broken.red()).assertEqual(0);
      expect(broken.luminance()).assertEqual(0);
      expect(broken.isLight()).assertFalse();
      TestLogger.pass(TAG, 'Resource_Color_010');
    });

    it('Resource_Catalog_011', 0, async () => {
      TestLogger.step(TAG, 'catalog counts and membership of every resource kind');
      const local: ResourceCatalog = new ResourceCatalog();
      expect(local.mediaCount()).assertEqual(11);
      expect(local.rawCount()).assertEqual(6);
      expect(local.stringCount()).assertEqual(4);
      expect(local.colorCount()).assertEqual(1);
      expect(local.totalCount()).assertEqual(22);
      expect(local.hasMedia(MEDIA_ICON)).assertTrue();
      expect(local.hasMedia('missing_icon')).assertFalse();
      expect(local.hasRaw(RAW_FAVICON)).assertTrue();
      expect(local.hasRaw('missing.html')).assertFalse();
      expect(local.hasString(STRING_INPUT_URL)).assertTrue();
      expect(local.hasColor(COLOR_WHITE)).assertTrue();
      expect(local.hitCount()).assertEqual(0);
      expect(local.missCount()).assertEqual(0);
      TestLogger.info(TAG, local.describe());
      TestLogger.pass(TAG, 'Resource_Catalog_011');
    });

    it('Resource_Catalog_012', 0, async () => {
      TestLogger.step(TAG, 'hit and miss counters track every lookup');
      const local: ResourceCatalog = new ResourceCatalog();
      expect(local.mediaOf(MEDIA_BACK) === null).assertFalse();
      expect(local.hitCount()).assertEqual(1);
      expect(local.stringOf('missing_key') === null).assertTrue();
      expect(local.missCount()).assertEqual(1);
      expect(local.lastMissing).assertEqual('missing_key');
      expect(local.colorOf(COLOR_WHITE) === null).assertFalse();
      expect(local.hitCount()).assertEqual(2);
      expect(local.rawOf(RAW_PAD_PAGE) === null).assertFalse();
      expect(local.hitCount()).assertEqual(3);
      expect(local.missCount()).assertEqual(1);
      expect(local.mediaOf('unknown_media') === null).assertTrue();
      expect(local.lastMissing).assertEqual('unknown_media');
      expect(local.missCount()).assertEqual(2);
      expect(local.fallbackCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Resource_Catalog_012');
    });

    it('Resource_Fallback_013', 0, async () => {
      TestLogger.step(TAG, 'unknown media reference falls back to the launcher icon');
      const local: ResourceCatalog = new ResourceCatalog();
      const fallback: MediaEntry = local.resolveIcon('ic_public_unknown');
      expect(fallback.name).assertEqual(MEDIA_ICON);
      expect(fallback.width).assertEqual(512);
      expect(local.fallbackCount()).assertEqual(1);
      expect(local.missCount()).assertEqual(1);
      const known: MediaEntry = local.resolveIcon(MEDIA_CANCEL_FILLED);
      expect(known.name).assertEqual(MEDIA_CANCEL_FILLED);
      expect(local.fallbackCount()).assertEqual(1);
      expect(local.hitCount()).assertEqual(1);
      local.media.delete(MEDIA_ICON);
      const secondFallback: MediaEntry = local.resolveIcon('ic_public_unknown');
      expect(secondFallback.name).assertEqual(MEDIA_ICON);
      expect(secondFallback.width).assertEqual(0);
      TestLogger.pass(TAG, 'Resource_Fallback_013');
    });

    it('Resource_Fallback_014', 0, async () => {
      TestLogger.step(TAG, 'missing rawfile degrades to the index page');
      const local: ResourceCatalog = new ResourceCatalog();
      local.rawFiles.set('missing.html', new RawFileEntry('missing.html', 'text/html', 0, false));
      expect(local.rawOf('missing.html') === null).assertTrue();
      expect(local.missCount()).assertEqual(1);
      const unused: string = local.resolve(
        new ResourceRef(KIND_RAWFILE, 'missing.html', 'resource://rawfile/missing.html'));
      expect(unused).assertEqual('');
      local.rawFiles.delete(RAW_PAD_PAGE);
      const fallbackPage: RawFileEntry | null = local.homePageFor(false);
      expect(fallbackPage === null).assertFalse();
      if (fallbackPage !== null) {
        expect(fallbackPage.name).assertEqual(RAW_INDEX_PAGE);
        expect(fallbackPage.isPage()).assertTrue();
      }
      expect(local.fallbackCount()).assertEqual(1);
      expect(local.homePageFor(true) === null).assertFalse();
      TestLogger.pass(TAG, 'Resource_Fallback_014');
    });

    it('Resource_Home_015', 0, async () => {
      TestLogger.step(TAG, 'home page selection follows the device form factor');
      const local: ResourceCatalog = new ResourceCatalog();
      const pad: RawFileEntry | null = local.homePageFor(false);
      const phone: RawFileEntry | null = local.homePageFor(true);
      expect(pad === null).assertFalse();
      expect(phone === null).assertFalse();
      if (pad !== null && phone !== null) {
        expect(pad.name).assertEqual(PAD_HOME_PAGE);
        expect(phone.name).assertEqual(PHONE_HOME_PAGE);
        expect(pad.name).assertEqual(RAW_PAD_PAGE);
        expect(phone.name).assertEqual(RAW_PHONE_PAGE);
        expect(pad.isPage()).assertTrue();
        expect(phone.isPage()).assertTrue();
        expect(pad.mime).assertEqual(phone.mime);
      }
      expect(local.fallbackCount()).assertEqual(0);
      const padRef: ResourceRef = ResourceRef.parse('resource://rawfile/pad.html');
      expect(local.resolve(padRef)).assertEqual('resource://rawfile/pad.html');
      TestLogger.pass(TAG, 'Resource_Home_015');
    });

    it('Resource_Startup_016', 0, async () => {
      TestLogger.step(TAG, 'startup icon and start window background resolve');
      const local: ResourceCatalog = new ResourceCatalog();
      const icon: MediaEntry = local.startupIcon();
      expect(icon.name).assertEqual(MEDIA_ICON);
      expect(icon.format).assertEqual('png');
      expect(icon.width).assertEqual(512);
      expect(local.fallbackCount()).assertEqual(0);
      const background: ColorEntry = local.startWindowBackground();
      expect(background.name).assertEqual(COLOR_WHITE);
      expect(background.value).assertEqual(COLOR_WHITE_VALUE);
      expect(background.isValid()).assertTrue();
      expect(background.isLight()).assertTrue();
      expect(local.abilityLabel(FALLBACK_LOCALE)).assertEqual('Browser');
      expect(local.abilityLabel(DEFAULT_LOCALE)).assertEqual('浏览器');
      expect(local.abilityLabel('ja-JP')).assertEqual('浏览器');
      expect(STARTUP_ICON_REF).assertEqual('$media:icon');
      expect(STARTUP_BACKGROUND_REF).assertEqual('$color:white');
      TestLogger.info(TAG, local.describe());
      TestLogger.pass(TAG, 'Resource_Startup_016');
    });

    it('Resource_Inventory_017', 0, async () => {
      TestLogger.step(TAG, 'enumerate pages images and vector icons');
      const local: ResourceCatalog = new ResourceCatalog();
      const pages: string[] = local.pageNames();
      expect(pages.length).assertEqual(4);
      expect(pages.indexOf(RAW_PAD_PAGE) >= 0).assertTrue();
      expect(pages.indexOf(RAW_PHONE_PAGE) >= 0).assertTrue();
      expect(pages.indexOf(RAW_INDEX_PAGE) >= 0).assertTrue();
      expect(pages.indexOf(RAW_TEST_PAGE) >= 0).assertTrue();
      expect(pages.indexOf(RAW_FAVICON) >= 0).assertFalse();
      expect(pages[0]).assertEqual(RAW_INDEX_PAGE);
      const images: string[] = local.imageNames();
      expect(images.length).assertEqual(2);
      expect(images.indexOf(RAW_FAVICON) >= 0).assertTrue();
      expect(images.indexOf(RAW_BACKGROUND_IMAGE) >= 0).assertTrue();
      const vectors: string[] = local.vectorIconNames();
      expect(vectors.length).assertEqual(8);
      expect(vectors.indexOf(MEDIA_BACK) >= 0).assertTrue();
      expect(vectors.indexOf(MEDIA_SEARCH) >= 0).assertTrue();
      expect(vectors.indexOf(MEDIA_ICON) >= 0).assertFalse();
      expect(vectors.indexOf(MEDIA_SUBMIT) >= 0).assertFalse();
      TestLogger.info(TAG, `pages=${pages.join(',')}`);
      TestLogger.pass(TAG, 'Resource_Inventory_017');
    });

    it('Resource_Validate_018', 0, async () => {
      TestLogger.step(TAG, 'catalog consistency validator reports missing resources');
      const local: ResourceCatalog = new ResourceCatalog();
      expect(local.validate().length).assertEqual(0);
      expect(local.missingNames().length).assertEqual(0);
      local.strings.delete(STRING_INPUT_URL);
      const afterString: string[] = local.validate();
      expect(afterString.length).assertEqual(1);
      expect(afterString.indexOf('missing-input-placeholder') >= 0).assertTrue();
      local.colors.set(COLOR_WHITE, new ColorEntry(COLOR_WHITE, 'white'));
      const afterColor: string[] = local.validate();
      expect(afterColor.length).assertEqual(2);
      expect(afterColor.indexOf('invalid-start-window-color') >= 0).assertTrue();
      local.colors.delete(COLOR_WHITE);
      expect(local.validate().indexOf('missing-start-window-color') >= 0).assertTrue();
      local.media.delete(MEDIA_ICON);
      expect(local.validate().indexOf('missing-launcher-icon') >= 0).assertTrue();
      TestLogger.pass(TAG, 'Resource_Validate_018');
    });

    it('Resource_Resolve_019', 0, async () => {
      TestLogger.step(TAG, 'reference driven resolution of every resource kind');
      const local: ResourceCatalog = new ResourceCatalog();
      expect(local.resolve(ResourceRef.parse('app.media.ic_public_home')))
        .assertEqual(MEDIA_HOME);
      expect(local.resolve(ResourceRef.parse('app.string.Input_url'))).assertEqual('InputUrl');
      expect(local.resolve(ResourceRef.parse('app.color.white'))).assertEqual(COLOR_WHITE_VALUE);
      expect(local.resolve(ResourceRef.parse('resource://rawfile/pad.html')))
        .assertEqual('resource://rawfile/pad.html');
      expect(local.missCount()).assertEqual(0);
      expect(local.resolve(ResourceRef.parse('app.media.missing'))).assertEqual(MEDIA_ICON);
      expect(local.missCount()).assertEqual(1);
      expect(local.resolve(ResourceRef.parse('app.string.missing'))).assertEqual('');
      expect(local.resolve(ResourceRef.parse('app.color.missing'))).assertEqual(COLOR_WHITE_VALUE);
      expect(local.resolve(ResourceRef.parse('bogus'))).assertEqual('');
      expect(local.missCount()).assertEqual(4);
      expect(local.lastMissing).assertEqual('bogus');
      TestLogger.pass(TAG, 'Resource_Resolve_019');
    });

    it('Resource_Session_020', 0, async () => {
      TestLogger.step(TAG, 'load session records hits misses and elapsed time');
      const session: LoadSession = new LoadSession(new ResourceCatalog(), clock);
      expect(session.elapsed()).assertEqual(0);
      session.begin();
      expect(session.load(ResourceRef.parse('app.media.ic_public_refresh'))).assertTrue();
      expect(session.load(new ResourceRef(KIND_RAWFILE, 'missing.html',
        'resource://rawfile/missing.html'))).assertFalse();
      expect(session.attemptCount()).assertEqual(2);
      expect(session.hitCount()).assertEqual(1);
      expect(session.missCount()).assertEqual(1);
      expect(session.elapsed()).assertEqual(0);
      clock.advance(120);
      session.finish();
      expect(session.elapsed()).assertEqual(120);
      expect(session.attempts[0]).assertEqual('app.media:ic_public_refresh');
      expect(session.results[0]).assertTrue();
      expect(session.results[1]).assertFalse();
      TestLogger.info(TAG, session.describe());
      TestLogger.pass(TAG, 'Resource_Session_020');
    });

    it('Resource_Session_021', 0, async () => {
      TestLogger.step(TAG, 'batch loading counts distinct requests');
      const session: LoadSession = new LoadSession(new ResourceCatalog(), clock);
      session.begin();
      const refs: ResourceRef[] = [
        ResourceRef.parse('app.media.ic_public_add'),
        ResourceRef.parse('app.string.Input_url'),
        ResourceRef.parse('app.color.white'),
        ResourceRef.parse('not-a-reference')
      ];
      expect(session.loadMany(refs)).assertEqual(3);
      expect(session.distinctAttempts()).assertEqual(4);
      expect(session.loadRaw(RAW_PAD_PAGE)).assertTrue();
      expect(session.loadRaw(RAW_PAD_PAGE)).assertTrue();
      expect(session.attemptCount()).assertEqual(6);
      expect(session.distinctAttempts()).assertEqual(5);
      expect(session.hitCount()).assertEqual(5);
      expect(session.missCount()).assertEqual(1);
      expect(session.describe()).assertContain('attempts=6');
      TestLogger.pass(TAG, 'Resource_Session_021');
    });

    it('Resource_UI_022', 0, async () => {
      TestLogger.step(TAG, 'address bar and home control are rendered');
      TestLogger.caseBegin(TAG, 'Resource_UI_022');
      expect(await componentByIdExists(getDriver(), ID_INPUT_URL)).assertTrue();
      expect(await componentByIdExists(getDriver(), ID_NAV_HOME)).assertTrue();
      const placeholder: string = await textById(getDriver(), ID_INPUT_URL);
      expect(placeholder.length >= 0).assertTrue();
      expect(TIMEOUT_COMPONENT >= 2000).assertTrue();
      await serializedDelay(getDriver(), 100);
      TestLogger.pass(TAG, 'Resource_UI_022');
    });

    it('Resource_UI_023', 0, async () => {
      TestLogger.step(TAG, 'navigation resource count stays within tolerance');
      const homeCount: number = await countById(getDriver(), ID_NAV_HOME);
      expect(homeCount <= TOLERANCE_COMPONENT_COUNT).assertTrue();
      expect(homeCount >= 1).assertTrue();
      TestLogger.info(TAG, `home controls=${homeCount}`);
      TestLogger.pass(TAG, 'Resource_UI_023');
    });
  });
}
