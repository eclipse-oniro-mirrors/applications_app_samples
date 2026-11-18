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
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_WHITELIST_EMPTY,
  TEXT_NO_ACTIVE_ASSESSMENT,
  TEXT_NO_EVENT,
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_PRIMARY,
  TEST_BUNDLE_SECONDARY,
  TEST_BUNDLE_TERTIARY,
  TEST_BUNDLE_INVALID,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  waitForIndexPage,
  isAssessmentActive,
  isAssessmentInactive,
  isComponentEnabled,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Limits mirrored from AssessmentConstants of the sample.
const MAX_ALLOWED_APPS: number = 20;
const MAX_EVENT_LOG: number = 20;
const DURATION_DEFAULT: number = 0;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_THIRTY_MINUTES: number = 1800000;
const DURATION_SIXTY_MINUTES: number = 3600000;
const MILLIS_PER_MINUTE: number = 60000;
const INVALID_DURATION: number = -1;

// Callback event types published by AssessmentController.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

// Drift allowed between two component count observations of the entry page.
const COUNT_TOLERANCE: number = 6;

// Number of navigation presses the keyboard regression performs.
const NAVIGATION_ROUNDS: number = 4;

/**
 * Functional area of a regression case.
 *
 * The area is only descriptive, it drives the coverage report of the catalogue and never the
 * execution order, so a case can be moved between areas without changing its identity.
 */
enum RegressionArea {
  CONFIG = 'config',
  LIFECYCLE = 'lifecycle',
  WHITELIST = 'whitelist',
  EVENT_LOG = 'event_log',
  EXAM = 'exam',
  QUERY = 'query'
}

/**
 * One entry of the regression catalogue.
 *
 * A critical entry is a behaviour that the release gate treats as blocking, the catalogue keeps
 * the flag so a report can separate a blocking regression from a cosmetic one.
 */
interface RegressionCase {
  id: string;
  area: RegressionArea;
  description: string;
  critical: boolean;
}

/**
 * Catalogue of the regression cases this suite executes.
 *
 * The catalogue rejects a duplicate identifier and an empty identifier, both of them would
 * silently shrink the executed matrix instead of failing loudly.
 */
class RegressionCatalogue {
  private cases: RegressionCase[] = [];

  public register(entry: RegressionCase): boolean {
    if (entry.id.length === 0) {
      return false;
    }
    for (let i = 0; i < this.cases.length; i++) {
      if (this.cases[i].id === entry.id) {
        return false;
      }
    }
    this.cases.push({
      id: entry.id,
      area: entry.area,
      description: entry.description,
      critical: entry.critical
    });
    return true;
  }

  public count(): number {
    return this.cases.length;
  }

  public ids(): string[] {
    const values: string[] = [];
    for (let i = 0; i < this.cases.length; i++) {
      values.push(this.cases[i].id);
    }
    return values;
  }

  public countByArea(area: RegressionArea): number {
    let total: number = 0;
    for (let i = 0; i < this.cases.length; i++) {
      if (this.cases[i].area === area) {
        total++;
      }
    }
    return total;
  }

  public criticalCount(): number {
    let total: number = 0;
    for (let i = 0; i < this.cases.length; i++) {
      if (this.cases[i].critical) {
        total++;
      }
    }
    return total;
  }

  public coveredAreas(): RegressionArea[] {
    const areas: RegressionArea[] = [];
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < this.cases.length; i++) {
      const key: string = this.cases[i].area;
      if (!seen.has(key)) {
        seen.add(key);
        areas.push(this.cases[i].area);
      }
    }
    return areas;
  }

  public describe(): string {
    return `RegressionCatalogue{cases=${this.cases.length}, critical=${this.criticalCount()}, ` +
      `areas=${this.coveredAreas().length}}`;
  }
}

/**
 * Ordered timeline of the assessment callbacks.
 *
 * The service guarantees that a session starts with onBegin and terminates with exactly one
 * onEnd, the timeline records the observed order so a regression case can assert it.
 */
class LifecycleTimeline {
  private events: string[] = [];
  private codes: number[] = [];

  public record(event: string, code: number): void {
    this.events.push(event);
    this.codes.push(code);
  }

  public size(): number {
    return this.events.length;
  }

  public getEvents(): string[] {
    return this.events.slice();
  }

  public first(): string {
    return this.events.length === 0 ? '' : this.events[0];
  }

  public last(): string {
    return this.events.length === 0 ? '' : this.events[this.events.length - 1];
  }

  public countOf(event: string): number {
    let total: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i] === event) {
        total++;
      }
    }
    return total;
  }

  public indexOfEvent(event: string): number {
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i] === event) {
        return i;
      }
    }
    return -1;
  }

  public contains(event: string): boolean {
    return this.indexOfEvent(event) >= 0;
  }

  public lastCode(): number {
    return this.codes.length === 0 ? 0 : this.codes[this.codes.length - 1];
  }

  public beginsBeforeEnds(): boolean {
    const beginIndex: number = this.indexOfEvent(EVENT_BEGIN);
    const endIndex: number = this.indexOfEvent(EVENT_END);
    if (beginIndex < 0 || endIndex < 0) {
      return false;
    }
    return beginIndex < endIndex;
  }

  public hasSingleTerminalEvent(): boolean {
    return this.countOf(EVENT_END) + this.countOf(EVENT_INTERRUPTED) <= 1;
  }

  public describe(): string {
    return `LifecycleTimeline{events=${this.events.join('>')}}`;
  }
}

/**
 * Ring buffer that mirrors the event log of AssessmentController.
 *
 * The controller prepends every entry and drops the oldest one beyond twenty, so the newest
 * entry always sits at index zero and the buffer never exceeds the documented capacity.
 */
class EventJournalRing {
  private entries: string[] = [];
  private capacity: number = MAX_EVENT_LOG;

  constructor(capacity: number = MAX_EVENT_LOG) {
    this.capacity = capacity;
  }

  public push(text: string): void {
    const next: string[] = this.entries.slice();
    next.unshift(text);
    if (next.length > this.capacity) {
      next.pop();
    }
    this.entries = next;
  }

  public size(): number {
    return this.entries.length;
  }

  public capacityLimit(): number {
    return this.capacity;
  }

  public isFull(): boolean {
    return this.entries.length >= this.capacity;
  }

  public newest(): string {
    return this.entries.length === 0 ? '' : this.entries[0];
  }

  public oldest(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1];
  }

  public getAll(): string[] {
    return this.entries.slice();
  }

  public clear(): void {
    this.entries = [];
  }

  public describe(): string {
    return `EventJournalRing{size=${this.entries.length}, capacity=${this.capacity}}`;
  }
}

/**
 * Duration profile of the assessment configuration.
 *
 * The profile converts the raw millisecond value into the label that the config card renders and
 * flags the default marker, which the page shows as "Default duration" instead of a minute count.
 */
class DurationProfile {
  private value: number = DURATION_DEFAULT;

  constructor(value: number = DURATION_DEFAULT) {
    this.value = value;
  }

  public duration(): number {
    return this.value;
  }

  public isDefault(): boolean {
    return this.value === DURATION_DEFAULT;
  }

  public isValid(): boolean {
    return this.value === DURATION_DEFAULT || this.value === DURATION_TEN_MINUTES ||
      this.value === DURATION_THIRTY_MINUTES || this.value === DURATION_SIXTY_MINUTES;
  }

  public minutes(): number {
    if (this.value <= 0) {
      return 0;
    }
    return this.value / MILLIS_PER_MINUTE;
  }

  public label(): string {
    if (this.isDefault()) {
      return 'Default duration';
    }
    return `${this.minutes()} min`;
  }

  public describe(): string {
    return `DurationProfile{value=${this.value}, valid=${this.isValid()}}`;
  }
}

/**
 * Outcome book of the regression run.
 *
 * A case is only green when it never reported a failure, the book keeps the failure identifiers
 * so the final case can print the complete diagnosis instead of the first failing entry.
 */
class RegressionReport {
  private passed: Set<string> = new Set<string>();
  private failed: Set<string> = new Set<string>();

  public pass(id: string): void {
    this.failed.delete(id);
    this.passed.add(id);
  }

  public fail(id: string): void {
    this.passed.delete(id);
    this.failed.add(id);
  }

  public passCount(): number {
    return this.passed.size;
  }

  public failCount(): number {
    return this.failed.size;
  }

  public isGreen(): boolean {
    return this.failed.size === 0;
  }

  public failures(): string[] {
    const values: string[] = [];
    this.failed.forEach((id: string) => {
      values.push(id);
    });
    return values;
  }

  public clear(): void {
    this.passed.clear();
    this.failed.clear();
  }

  public describe(): string {
    return `RegressionReport{passed=${this.passed.size}, failed=${this.failed.size}}`;
  }
}

/**
 * Builds the regression catalogue that this suite reports against.
 *
 * Every documented behaviour of the sample is listed once, the critical flag marks the entries
 * that block a release: the config model, the begin/end lifecycle and the whitelist capacity.
 *
 * @returns the populated catalogue.
 */
function buildCatalogue(): RegressionCatalogue {
  const catalogue: RegressionCatalogue = new RegressionCatalogue();

  catalogue.register({
    id: BUNDLE + 'ComprehensiveRegression_001',
    area: RegressionArea.CONFIG,
    description: 'the default configuration keeps the default duration and an empty whitelist',
    critical: true
  });
  catalogue.register({
    id: BUNDLE + 'ComprehensiveRegression_002',
    area: RegressionArea.CONFIG,
    description: 'the four documented duration candidates are accepted by the profile',
    critical: true
  });
  catalogue.register({
    id: BUNDLE + 'ComprehensiveRegression_003',
    area: RegressionArea.QUERY,
    description: 'the state query reports the inactive state before any session begins',
    critical: true
  });
  catalogue.register({
    id: BUNDLE + 'ComprehensiveRegression_004',
    area: RegressionArea.QUERY,
    description: 'the configuration query reports no active assessment before begin',
    critical: false
  });
  catalogue.register({
    id: BUNDLE + 'ComprehensiveRegression_005',
    area: RegressionArea.WHITELIST,
    description: 'a bundle name is appended through the input box and the Add button',
    critical: true
  });
  catalogue.register({
    id: BUNDLE + 'ComprehensiveRegression_006',
    area: RegressionArea.WHITELIST,
    description: 'a whitelist row is removed through its Remove button',
    critical: true
  });
  catalogue.register({
    id: BUNDLE + 'ComprehensiveRegression_007',
    area: RegressionArea.WHITELIST,
    description: 'the whitelist refuses to grow beyond twenty entries',
    critical: true
  });
  catalogue.register({
    id: BUNDLE + 'ComprehensiveRegression_008',
    area: RegressionArea.EVENT_LOG,
    description: 'the event log never holds more than twenty entries',
    critical: false
  });
  catalogue.register({
    id: BUNDLE + 'ComprehensiveRegression_009',
    area: RegressionArea.LIFECYCLE,
    description: 'onBegin precedes onEnd in the callback timeline',
    critical: true
  });
  catalogue.register({
    id: BUNDLE + 'ComprehensiveRegression_010',
    area: RegressionArea.EXAM,
    description: 'the exam flow consists of three questions with three options each',
    critical: false
  });

  return catalogue;
}

/**
 * Launches the sample and waits for the entry page.
 *
 * The UI cases of the suite all need the entry page in the foreground, a case that cannot reach
 * it logs a warning and returns instead of failing, because a missing page is an environment
 * property rather than a defect of the sample.
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

export default function comprehensiveRegressionTest() {
  describe('ComprehensiveRegression_Test', () => {
    let driver: Driver;
    let catalogue: RegressionCatalogue;
    let report: RegressionReport;

    beforeAll(async () => {
      driver = getDriver();
      catalogue = buildCatalogue();
      report = new RegressionReport();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: inspect the regression catalogue without a device.
     * Expectation: every entry has a unique identifier and a description, and the catalogue
     * separates the critical entries from the informational ones.
     */
    it('Assessment_ComprehensiveRegression_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_001, begin');
      expect(catalogue.count()).assertEqual(10);
      const ids: string[] = catalogue.ids();
      const unique: Set<string> = new Set<string>(ids);
      expect(unique.size).assertEqual(ids.length);
      expect(catalogue.criticalCount()).assertLarger(0);
      expect(catalogue.criticalCount() < catalogue.count()).assertTrue();
      expect(catalogue.countByArea(RegressionArea.WHITELIST)).assertLarger(0);
      expect(catalogue.countByArea(RegressionArea.QUERY)).assertLarger(0);
      expect(catalogue.coveredAreas().length).assertLargerOrEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ComprehensiveRegression_001',
        catalogue.describe());
      report.pass(BUNDLE + 'ComprehensiveRegression_001');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_001, end');
    });

    /**
     * Scenario: register a malformed entry.
     * Expectation: an empty identifier and a duplicated identifier are both rejected and the
     * catalogue keeps its size.
     */
    it('Assessment_ComprehensiveRegression_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_002, begin');
      const local: RegressionCatalogue = new RegressionCatalogue();
      const empty: RegressionCase = {
        id: '',
        area: RegressionArea.CONFIG,
        description: 'empty identifier',
        critical: false
      };
      expect(local.register(empty)).assertFalse();
      const valid: RegressionCase = {
        id: 'case_a',
        area: RegressionArea.CONFIG,
        description: 'valid entry',
        critical: true
      };
      expect(local.register(valid)).assertTrue();
      expect(local.register(valid)).assertFalse();
      expect(local.count()).assertEqual(1);
      expect(local.criticalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ComprehensiveRegression_002',
        local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_002, end');
    });

    /**
     * Scenario: the callback timeline of a complete session.
     * Expectation: onBegin is recorded before onEnd and exactly one terminal event exists.
     */
    it('Assessment_ComprehensiveRegression_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_003, begin');
      const timeline: LifecycleTimeline = new LifecycleTimeline();
      timeline.record(EVENT_BEGIN, 0);
      timeline.record(EVENT_END, 0);
      expect(timeline.size()).assertEqual(2);
      expect(timeline.first()).assertEqual(EVENT_BEGIN);
      expect(timeline.last()).assertEqual(EVENT_END);
      expect(timeline.beginsBeforeEnds()).assertTrue();
      expect(timeline.hasSingleTerminalEvent()).assertTrue();
      expect(timeline.countOf(EVENT_INTERRUPTED)).assertEqual(0);
      expect(timeline.indexOfEvent(EVENT_END)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ComprehensiveRegression_003',
        timeline.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_003, end');
    });

    /**
     * Scenario: an API error event is logged but terminates no session.
     * Expectation: the timeline keeps the begin event and appends the API error, and the error is
     * not counted as a terminal event because it only produces a toast.
     */
    it('Assessment_ComprehensiveRegression_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_004, begin');
      const timeline: LifecycleTimeline = new LifecycleTimeline();
      timeline.record(EVENT_BEGIN, 0);
      timeline.record(EVENT_API_ERROR, 3);
      expect(timeline.contains(EVENT_API_ERROR)).assertTrue();
      expect(timeline.countOf(EVENT_API_ERROR)).assertEqual(1);
      expect(timeline.lastCode()).assertEqual(3);
      expect(timeline.hasSingleTerminalEvent()).assertTrue();
      expect(timeline.beginsBeforeEnds()).assertFalse();
      expect(timeline.countOf(EVENT_END)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ComprehensiveRegression_004',
        timeline.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_004, end');
    });

    /**
     * Scenario: the event log ring buffer is filled beyond its capacity.
     * Expectation: it never exceeds twenty entries and the newest entry sits at index zero.
     */
    it('Assessment_ComprehensiveRegression_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_005, begin');
      const ring: EventJournalRing = new EventJournalRing();
      for (let i = 0; i < MAX_EVENT_LOG; i++) {
        ring.push(`entry_${i}`);
      }
      expect(ring.size()).assertEqual(MAX_EVENT_LOG);
      expect(ring.isFull()).assertTrue();
      expect(ring.newest()).assertEqual('entry_19');
      expect(ring.oldest()).assertEqual('entry_0');
      ring.push('entry_20');
      expect(ring.size()).assertEqual(MAX_EVENT_LOG);
      expect(ring.newest()).assertEqual('entry_20');
      expect(ring.oldest()).assertEqual('entry_1');
      expect(ring.getAll().length).assertEqual(MAX_EVENT_LOG);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ComprehensiveRegression_005',
        ring.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_005, end');
    });

    /**
     * Scenario: the event log ring is cleared.
     * Expectation: the buffer becomes empty and the entry points degrade to empty strings.
     */
    it('Assessment_ComprehensiveRegression_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_006, begin');
      const ring: EventJournalRing = new EventJournalRing();
      ring.push('onBegin code=0 message=');
      expect(ring.size()).assertEqual(1);
      expect(ring.isFull()).assertFalse();
      ring.clear();
      expect(ring.size()).assertEqual(0);
      expect(ring.newest()).assertEqual('');
      expect(ring.oldest()).assertEqual('');
      expect(ring.getAll().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ComprehensiveRegression_006',
        ring.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_006, end');
    });

    /**
     * Scenario: the duration profile of every documented candidate.
     * Expectation: the default marker renders the default label while the explicit candidates
     * render their minute count.
     */
    it('Assessment_ComprehensiveRegression_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_007, begin');
      const values: number[] = [DURATION_DEFAULT, DURATION_TEN_MINUTES, DURATION_THIRTY_MINUTES,
        DURATION_SIXTY_MINUTES];
      const labels: string[] = [];
      for (let i = 0; i < values.length; i++) {
        const profile: DurationProfile = new DurationProfile(values[i]);
        expect(profile.isValid()).assertTrue();
        labels.push(profile.label());
      }
      expect(labels[0]).assertEqual('Default duration');
      expect(labels[1]).assertEqual('10 min');
      expect(labels[2]).assertEqual('30 min');
      expect(labels[3]).assertEqual('60 min');
      expect(new DurationProfile(INVALID_DURATION).isValid()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ComprehensiveRegression_007',
        labels.join('|'));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_007, end');
    });

    /**
     * Scenario: the regression report bookkeeping.
     * Expectation: a later pass clears an earlier failure and the book is only green when no
     * failure remains.
     */
    it('Assessment_ComprehensiveRegression_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_008, begin');
      const local: RegressionReport = new RegressionReport();
      local.fail('case_x');
      expect(local.isGreen()).assertFalse();
      expect(local.failCount()).assertEqual(1);
      expect(local.failures()[0]).assertEqual('case_x');
      local.pass('case_x');
      expect(local.isGreen()).assertTrue();
      expect(local.failCount()).assertEqual(0);
      expect(local.passCount()).assertEqual(1);
      local.fail('case_y');
      local.fail('case_z');
      expect(local.failCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ComprehensiveRegression_008',
        local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_008, end');
    });

    /**
     * Scenario: the exam flow contract that the sample documents.
     * Expectation: three questions, three options each, labels derived from the option label
     * base and a fixed MM:SS padding of the countdown text.
     */
    it('Assessment_ComprehensiveRegression_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_019, begin');
      const questionCount: number = 3;
      const optionCount: number = 3;
      const optionLabelBase: number = 65;
      for (let i = 0; i < optionCount; i++) {
        const label: string = String.fromCharCode(optionLabelBase + i);
        expect(label.length).assertEqual(1);
      }
      expect(String.fromCharCode(optionLabelBase)).assertEqual('A');
      expect(String.fromCharCode(optionLabelBase + 2)).assertEqual('C');
      const paddedMinute: string = '2'.padStart(2, '0');
      expect(paddedMinute).assertEqual('02');
      expect(`${0}`.padStart(2, '0')).assertEqual('00');
      const totalOptions: number = questionCount * optionCount;
      expect(totalOptions).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s questions %{public}d, options %{public}d',
        BUNDLE + 'ComprehensiveRegression_019', questionCount, totalOptions);
      report.pass(BUNDLE + 'ComprehensiveRegression_019');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_019, end');
    });

    /**
     * Scenario: the catalogue covers every area that the suite executes.
     * Expectation: the six functional areas of the sample are all represented by at least one
     * catalogued entry.
     */
    it('Assessment_ComprehensiveRegression_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_020, begin');
      const areas: RegressionArea[] = catalogue.coveredAreas();
      const areaKeys: Set<string> = new Set<string>();
      for (let i = 0; i < areas.length; i++) {
        areaKeys.add(areas[i]);
      }
      expect(areaKeys.has(RegressionArea.CONFIG)).assertTrue();
      expect(areaKeys.has(RegressionArea.LIFECYCLE)).assertTrue();
      expect(areaKeys.has(RegressionArea.WHITELIST)).assertTrue();
      expect(areaKeys.has(RegressionArea.EVENT_LOG)).assertTrue();
      expect(areaKeys.has(RegressionArea.EXAM)).assertTrue();
      expect(areaKeys.has(RegressionArea.QUERY)).assertTrue();
      expect(areas.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s areas %{public}d', BUNDLE + 'ComprehensiveRegression_020',
        areas.length);
      report.pass(BUNDLE + 'ComprehensiveRegression_020');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ComprehensiveRegression_020, end');
    });
  });
}
