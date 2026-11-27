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
  ID_EXAM_TITLE,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TEXT_DIALOG_CONFIRM,
  TEXT_EXAM_PREVIOUS,
  TEXT_EXAM_NEXT,
  TEXT_EXAM_SUBMIT,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_SECONDARY,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  findComponentsByType,
  indexComponentCount,
  checkTextContent,
  collectTexts,
  waitForIndexPage,
  waitForExamPage,
  isComponentEnabled,
  addAllowedApp,
  allowedAppRowCount,
  clickComponent,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The paper of the exam page.
const QUESTION_COUNT: number = 3;
const OPTION_COUNT: number = 3;
const OPTION_LABEL_BASE: number = 65;
const INVALID_ANSWER: number = -1;

// Duration candidates and the default entry of the whitelist.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN: number = 600000;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';

/**
 * One stage of the end to end journey.
 */
interface JourneyStage {
  index: number;
  stage: string;
  page: string;
  reached: boolean;
  note: string;
}

/**
 * Builds and records the end to end journey of a single user.
 *
 * Every stage names the page that must be displayed, so a failure of the journey is reported at
 * the exact transition that did not happen instead of at the end of the run.
 */
class JourneyRecorder {
  private stages: JourneyStage[] = [];

  public add(stage: string, page: string, reached: boolean, note: string = ''): void {
    const entry: JourneyStage = {
      index: this.stages.length,
      stage: stage,
      page: page,
      reached: reached,
      note: note
    };
    this.stages.push(entry);
  }

  public size(): number {
    return this.stages.length;
  }

  public all(): JourneyStage[] {
    return this.stages.slice();
  }

  public reachedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.stages.length; i++) {
      if (this.stages[i].reached) {
        count++;
      }
    }
    return count;
  }

  public firstUnreached(): JourneyStage | null {
    for (let i = 0; i < this.stages.length; i++) {
      if (!this.stages[i].reached) {
        return this.stages[i];
      }
    }
    return null;
  }

  public reachedStages(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.stages.length; i++) {
      if (this.stages[i].reached) {
        names.push(this.stages[i].stage);
      }
    }
    return names;
  }

  public visitedPages(): string[] {
    const pages: string[] = [];
    for (let i = 0; i < this.stages.length; i++) {
      if (pages.indexOf(this.stages[i].page) < 0) {
        pages.push(this.stages[i].page);
      }
    }
    return pages;
  }

  public isComplete(): boolean {
    return this.stages.length > 0 && this.firstUnreached() === null;
  }

  public describe(): string {
    return `Journey{stages=${this.stages.length}, reached=${this.reachedCount()}}`;
  }
}

/**
 * The answers of one attempt at the paper.
 *
 * The paper mirrors the exam page: three questions with three options, A, B and C, an answered
 * count and a submission flag. The submitted count is what the page logs before calling end.
 */
class PaperSession {
  private answers: number[] = [];
  private cursor: number = 0;
  private submitted: boolean = false;
  private endCalls: number = 0;

  constructor() {
    for (let i = 0; i < QUESTION_COUNT; i++) {
      this.answers.push(INVALID_ANSWER);
    }
  }

  public select(option: number): boolean {
    if (option < 0 || option >= OPTION_COUNT || this.submitted) {
      return false;
    }
    this.answers[this.cursor] = option;
    return true;
  }

  public next(): boolean {
    if (this.cursor >= QUESTION_COUNT - 1) {
      return false;
    }
    this.cursor++;
    return true;
  }

  public previous(): boolean {
    if (this.cursor <= 0) {
      return false;
    }
    this.cursor--;
    return true;
  }

  public answerAll(): number {
    let count: number = 0;
    for (let i = 0; i < QUESTION_COUNT; i++) {
      if (this.answers[i] === INVALID_ANSWER) {
        this.answers[i] = i % OPTION_COUNT;
        count++;
      }
    }
    return count;
  }

  public answeredCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.answers.length; i++) {
      if (this.answers[i] !== INVALID_ANSWER) {
        count++;
      }
    }
    return count;
  }

  public currentCursor(): number {
    return this.cursor;
  }

  public submit(): boolean {
    if (this.submitted) {
      return false;
    }
    this.submitted = true;
    this.endCalls++;
    return true;
  }

  public isSubmitted(): boolean {
    return this.submitted;
  }

  public endCallCount(): number {
    return this.endCalls;
  }

  public optionLabel(index: number): string {
    return String.fromCharCode(OPTION_LABEL_BASE + index);
  }

  public progressText(): string {
    return `${this.cursor + 1} / ${QUESTION_COUNT}`;
  }

  public describe(): string {
    return `Paper{cursor=${this.cursor}, answered=${this.answeredCount()}, submitted=${this.submitted}}`;
  }
}

/**
 * The configuration the journey starts with.
 *
 * The default seed of the sample is one whitelist entry, and the journey adds a second entry
 * before it begins the assessment.
 */
class JourneyConfiguration {
  private duration: number = DURATION_DEFAULT;
  private apps: string[] = [DEFAULT_ALLOWED_APP];
  private added: string[] = [];

  public selectDuration(duration: number): boolean {
    if (duration !== DURATION_DEFAULT && duration !== DURATION_TEN) {
      return false;
    }
    this.duration = duration;
    return true;
  }

  public add(bundleName: string): boolean {
    const value: string = bundleName.trim();
    if (value.length === 0 || this.apps.indexOf(value) >= 0) {
      return false;
    }
    this.apps.push(value);
    this.added.push(value);
    return true;
  }

  public remove(bundleName: string): boolean {
    const index: number = this.apps.indexOf(bundleName);
    if (index < 0) {
      return false;
    }
    this.apps.splice(index, 1);
    return true;
  }

  public durationValue(): number {
    return this.duration;
  }

  public appsValue(): string[] {
    return this.apps.slice();
  }

  public addedApps(): string[] {
    return this.added.slice();
  }

  public size(): number {
    return this.apps.length;
  }

  public contains(bundleName: string): boolean {
    return this.apps.indexOf(bundleName) >= 0;
  }

  public describe(): string {
    return `JourneyConfig{duration=${this.duration}, apps=${this.apps.join(',')}}`;
  }
}

/**
 * The end to end result of a journey.
 *
 * The result aggregates the stages, the paper and the configuration so a single assertion can
 * state whether the full journey succeeded without listing every intermediate value again.
 */
class JourneyResult {
  private journey: JourneyRecorder;
  private paper: PaperSession;
  private config: JourneyConfiguration;
  private startedAt: number = 0;
  private finishedAt: number = 0;

  constructor(journey: JourneyRecorder, paper: PaperSession, config: JourneyConfiguration) {
    this.journey = journey;
    this.paper = paper;
    this.config = config;
  }

  public markStart(): void {
    this.startedAt = Date.now();
  }

  public markFinish(): void {
    this.finishedAt = Date.now();
  }

  public elapsedMs(): number {
    if (this.startedAt === 0 || this.finishedAt === 0) {
      return 0;
    }
    return this.finishedAt - this.startedAt;
  }

  public paperSubmitted(): boolean {
    return this.paper.isSubmitted();
  }

  public answeredCount(): number {
    return this.paper.answeredCount();
  }

  public journeyReached(): number {
    return this.journey.reachedCount();
  }

  public isSuccessful(): boolean {
    return this.journey.isComplete() && this.paper.isSubmitted() && this.config.size() >= 1;
  }

  public describe(): string {
    return `JourneyResult{stages=${this.journey.reachedCount()}/${this.journey.size()}, ` +
      `answered=${this.paper.answeredCount()}, submitted=${this.paper.isSubmitted()}}`;
  }
}

/**
 * Looks up a Button of the current page by its rendered text.
 *
 * The exam page does not declare identifiers for its three operation buttons, so the journey
 * cases resolve them through the label text that the paper renders.
 *
 * @param driver driver of the running case.
 * @param label text of the button.
 * @returns the button, or null when it is not rendered.
 */
async function findButtonByText(driver: Driver, label: string): Promise<Component | null> {
  const buttons: Component[] = await findComponentsByType(driver, 'Button');
  for (let i = 0; i < buttons.length; i++) {
    try {
      const text: string = await getTextSerialized(buttons[i]);
      if (text === label) {
        return buttons[i];
      }
    } catch (error) {
      hilog.warn(DOMAIN, TAG, 'findButtonByText: a button dropped out of the tree');
    }
  }
  return null;
}

/**
 * Starts the sample and waits for the entry page, the UI cases degrade to a skip when the page
 * never shows up.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function assessmentEndToEndTest() {
  describe('AssessmentEndToEnd_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the default configuration of the journey.
     * Expectation: one seeded application and the default duration.
     */
    it('Assessment_JourneyConfigSeed_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyConfigSeed_001, begin');
      const config: JourneyConfiguration = new JourneyConfiguration();
      expect(config.size()).assertEqual(1);
      expect(config.contains(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(config.durationValue()).assertEqual(DURATION_DEFAULT);
      expect(config.selectDuration(DURATION_TEN)).assertTrue();
      expect(config.durationValue()).assertEqual(DURATION_TEN);
      expect(config.selectDuration(1234)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', config.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyConfigSeed_001, end');
    });

    /**
     * Scenario: adding and removing entries of the journey configuration.
     * Expectation: the added entries are recorded and the removal keeps the order.
     */
    it('Assessment_JourneyConfigEdit_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyConfigEdit_002, begin');
      const config: JourneyConfiguration = new JourneyConfiguration();
      expect(config.add(TEST_BUNDLE_SECONDARY)).assertTrue();
      expect(config.add(TEST_BUNDLE_SECONDARY)).assertFalse();
      expect(config.add('')).assertFalse();
      expect(config.size()).assertEqual(2);
      expect(config.addedApps().length).assertEqual(1);
      expect(config.remove(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(config.size()).assertEqual(1);
      expect(config.contains(DEFAULT_ALLOWED_APP)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', config.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyConfigEdit_002, end');
    });

    /**
     * Scenario: the journey recorder starts empty.
     * Expectation: it reports no reached stage and no visited page.
     */
    it('Assessment_JourneyRecorderEmpty_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyRecorderEmpty_003, begin');
      const journey: JourneyRecorder = new JourneyRecorder();
      expect(journey.size()).assertEqual(0);
      expect(journey.reachedCount()).assertEqual(0);
      expect(journey.firstUnreached()).assertNull();
      expect(journey.isComplete()).assertFalse();
      expect(journey.visitedPages().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', journey.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyRecorderEmpty_003, end');
    });

    /**
     * Scenario: recording the six stages of the journey.
     * Expectation: the recorder keeps the order and reports the first unreached stage.
     */
    it('Assessment_JourneyRecorderStages_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyRecorderStages_004, begin');
      const journey: JourneyRecorder = new JourneyRecorder();
      journey.add('configure', 'Index', true, 'duration and whitelist');
      journey.add('begin', 'Index', true, 'begin button clicked');
      journey.add('confirm', 'Index', false, 'the system dialog was not answered');
      expect(journey.size()).assertEqual(3);
      expect(journey.reachedCount()).assertEqual(2);
      const first: JourneyStage | null = journey.firstUnreached();
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.stage).assertEqual('confirm');
        expect(first.index).assertEqual(2);
        expect(first.note).assertContain('not answered');
      }
      expect(journey.isComplete()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', journey.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyRecorderStages_004, end');
    });

    /**
     * Scenario: a fully reached journey.
     * Expectation: the recorder reports completion and the visited pages are unique.
     */
    it('Assessment_JourneyRecorderComplete_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyRecorderComplete_005, begin');
      const journey: JourneyRecorder = new JourneyRecorder();
      journey.add('configure', 'Index', true);
      journey.add('begin', 'Index', true);
      journey.add('exam', 'ExamPage', true);
      journey.add('submit', 'ExamPage', true);
      journey.add('back', 'Index', true);
      expect(journey.isComplete()).assertTrue();
      expect(journey.reachedCount()).assertEqual(5);
      expect(journey.visitedPages().length).assertEqual(2);
      expect(journey.visitedPages()[0]).assertEqual('Index');
      expect(journey.visitedPages()[1]).assertEqual('ExamPage');
      hilog.info(DOMAIN, TAG, '%{public}s', journey.reachedStages().join(' -> '));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyRecorderComplete_005, end');
    });

    /**
     * Scenario: an empty paper.
     * Expectation: no answer is recorded and the option labels are A, B and C.
     */
    it('Assessment_PaperEmpty_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperEmpty_006, begin');
      const paper: PaperSession = new PaperSession();
      expect(paper.answeredCount()).assertEqual(0);
      expect(paper.currentCursor()).assertEqual(0);
      expect(paper.isSubmitted()).assertFalse();
      expect(paper.progressText()).assertEqual('1 / 3');
      expect(paper.optionLabel(0)).assertEqual('A');
      expect(paper.optionLabel(2)).assertEqual('C');
      hilog.info(DOMAIN, TAG, '%{public}s', paper.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperEmpty_006, end');
    });

    /**
     * Scenario: walking through the three questions of the paper.
     * Expectation: the cursor moves forward and backward within the bounds.
     */
    it('Assessment_PaperWalk_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperWalk_007, begin');
      const paper: PaperSession = new PaperSession();
      expect(paper.previous()).assertFalse();
      paper.select(0);
      expect(paper.next()).assertTrue();
      expect(paper.progressText()).assertEqual('2 / 3');
      paper.select(1);
      expect(paper.next()).assertTrue();
      expect(paper.progressText()).assertEqual('3 / 3');
      expect(paper.next()).assertFalse();
      paper.select(2);
      expect(paper.answeredCount()).assertEqual(3);
      expect(paper.previous()).assertTrue();
      expect(paper.currentCursor()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', paper.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperWalk_007, end');
    });

    /**
     * Scenario: submitting the paper.
     * Expectation: the submission is accepted once and the end call is counted.
     */
    it('Assessment_PaperSubmit_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperSubmit_008, begin');
      const paper: PaperSession = new PaperSession();
      paper.answerAll();
      expect(paper.submit()).assertTrue();
      expect(paper.isSubmitted()).assertTrue();
      expect(paper.endCallCount()).assertEqual(1);
      expect(paper.submit()).assertFalse();
      expect(paper.endCallCount()).assertEqual(1);
      expect(paper.select(0)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', paper.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperSubmit_008, end');
    });

    /**
     * Scenario: a partially answered paper.
     * Expectation: the answered count matches the number of selections.
     */
    it('Assessment_PaperPartial_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperPartial_009, begin');
      const paper: PaperSession = new PaperSession();
      paper.select(2);
      paper.next();
      paper.select(0);
      expect(paper.answeredCount()).assertEqual(2);
      expect(paper.submit()).assertTrue();
      expect(paper.answeredCount()).assertEqual(2);
      expect(paper.answeredCount() < QUESTION_COUNT).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', paper.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperPartial_009, end');
    });

    /**
     * Scenario: a complete journey on the models.
     * Expectation: every stage is reached and the result reports success.
     */
    it('Assessment_JourneyModelSuccess_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyModelSuccess_010, begin');
      const journey: JourneyRecorder = new JourneyRecorder();
      const paper: PaperSession = new PaperSession();
      const config: JourneyConfiguration = new JourneyConfiguration();
      const result: JourneyResult = new JourneyResult(journey, paper, config);
      result.markStart();
      config.selectDuration(DURATION_TEN);
      config.add(TEST_BUNDLE_SECONDARY);
      journey.add('configure', 'Index', config.size() === 2);
      journey.add('begin', 'Index', true);
      journey.add('exam', 'ExamPage', true);
      paper.answerAll();
      journey.add('submit', 'ExamPage', paper.submit());
      journey.add('back', 'Index', true);
      result.markFinish();
      expect(result.isSuccessful()).assertTrue();
      expect(result.journeyReached()).assertEqual(5);
      expect(result.answeredCount()).assertEqual(3);
      expect(result.paperSubmitted()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', result.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyModelSuccess_010, end');
    });

    /**
     * Scenario: a journey that is abandoned before the confirmation.
     * Expectation: the result is not successful and the first unreached stage is reported.
     */
    it('Assessment_JourneyModelAbort_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyModelAbort_011, begin');
      const journey: JourneyRecorder = new JourneyRecorder();
      const paper: PaperSession = new PaperSession();
      const config: JourneyConfiguration = new JourneyConfiguration();
      const result: JourneyResult = new JourneyResult(journey, paper, config);
      journey.add('configure', 'Index', true);
      journey.add('begin', 'Index', true);
      journey.add('confirm', 'Index', false, 'the user cancelled');
      expect(result.isSuccessful()).assertFalse();
      const first: JourneyStage | null = journey.firstUnreached();
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.stage).assertEqual('confirm');
      }
      expect(result.paperSubmitted()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', result.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'JourneyModelAbort_011, end');
    });

    /**
     * Scenario: the paper answered in the reverse order.
     * Expectation: the answered count is independent of the answering order.
     */
    it('Assessment_PaperReverseOrder_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperReverseOrder_021, begin');
      const paper: PaperSession = new PaperSession();
      paper.next();
      paper.next();
      paper.select(2);
      paper.previous();
      paper.select(1);
      paper.previous();
      paper.select(0);
      expect(paper.answeredCount()).assertEqual(3);
      expect(paper.currentCursor()).assertEqual(0);
      expect(paper.progressText()).assertEqual('1 / 3');
      hilog.info(DOMAIN, TAG, '%{public}s', paper.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperReverseOrder_021, end');
    });

    /**
     * Scenario: the answer all helper of the paper.
     * Expectation: it fills every empty question and reports the number it filled.
     */
    it('Assessment_PaperAnswerAll_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperAnswerAll_022, begin');
      const paper: PaperSession = new PaperSession();
      paper.select(1);
      expect(paper.answerAll()).assertEqual(2);
      expect(paper.answeredCount()).assertEqual(3);
      expect(paper.answerAll()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', paper.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperAnswerAll_022, end');
    });

    /**
     * Scenario: the option selection bounds of the paper.
     * Expectation: only the three documented option indices are accepted.
     */
    it('Assessment_PaperOptionBounds_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperOptionBounds_023, begin');
      const paper: PaperSession = new PaperSession();
      expect(paper.select(0)).assertTrue();
      expect(paper.select(1)).assertTrue();
      expect(paper.select(2)).assertTrue();
      expect(paper.select(3)).assertFalse();
      expect(paper.select(-1)).assertFalse();
      expect(paper.answeredCount()).assertEqual(1);
      expect(OPTION_COUNT).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', paper.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperOptionBounds_023, end');
    });

    /**
     * Scenario: the second journey of the same user.
     * Expectation: a fresh recorder starts with no stage and completes independently.
     */
    it('Assessment_SecondJourney_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SecondJourney_027, begin');
      const first: JourneyRecorder = new JourneyRecorder();
      first.add('configure', 'Index', true);
      const second: JourneyRecorder = new JourneyRecorder();
      expect(second.size()).assertEqual(0);
      expect(first.size()).assertEqual(1);
      second.add('configure', 'Index', true);
      second.add('begin', 'Index', true);
      expect(second.reachedCount()).assertEqual(2);
      expect(second.firstUnreached()).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', second.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SecondJourney_027, end');
    });

    /**
     * Scenario: the journey result description.
     * Expectation: it carries the reached stage count and the submission flag.
     */
    it('Assessment_ResultDescription_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResultDescription_028, begin');
      const journey: JourneyRecorder = new JourneyRecorder();
      journey.add('configure', 'Index', true);
      const paper: PaperSession = new PaperSession();
      const result: JourneyResult = new JourneyResult(journey, paper, new JourneyConfiguration());
      const text: string = result.describe();
      expect(text).assertContain('stages=1/1');
      expect(text).assertContain('submitted=false');
      expect(text).assertContain('answered=0');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResultDescription_028, end');
    });

    /**
     * Scenario: the journey configuration description.
     * Expectation: it carries the duration and the comma separated whitelist.
     */
    it('Assessment_ConfigDescription_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigDescription_029, begin');
      const config: JourneyConfiguration = new JourneyConfiguration();
      config.selectDuration(DURATION_TEN);
      config.add(TEST_BUNDLE_SECONDARY);
      const text: string = config.describe();
      expect(text).assertContain(`${DURATION_TEN}`);
      expect(text).assertContain(DEFAULT_ALLOWED_APP);
      expect(text).assertContain(TEST_BUNDLE_SECONDARY);
      expect(config.size()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigDescription_029, end');
    });

    /**
     * Scenario: the tests are anchored on the entry page title.
     * Expectation: the title identifier is the documented one.
     */
    it('Assessment_TitleAnchor_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TitleAnchor_030, begin');
      expect(ID_INDEX_TITLE).assertEqual('assessment_index_title');
      expect(ID_EXAM_TITLE).assertEqual('assessment_exam_title');
      expect(ID_BEGIN_BUTTON).assertEqual('assessment_begin_button');
      expect(INVALID_ANSWER).assertEqual(-1);
      expect(QUESTION_COUNT).assertEqual(3);
      expect(OPTION_LABEL_BASE).assertEqual(65);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TitleAnchor_030, end');
    });
  });
}
