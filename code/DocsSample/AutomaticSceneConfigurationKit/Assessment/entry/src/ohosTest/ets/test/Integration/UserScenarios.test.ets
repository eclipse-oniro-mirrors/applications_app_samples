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
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TEXT_WHITELIST_EMPTY,
  TEXT_NO_ACTIVE_ASSESSMENT,
  TEXT_NO_EVENT,
  TEXT_REMOVE_BUTTON,
  TEXT_DIALOG_CONFIRM,
  TEXT_EXAM_PREVIOUS,
  TEXT_EXAM_NEXT,
  TEXT_EXAM_SUBMIT,
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  KEY_TAB,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_PRIMARY,
  TEST_BUNDLE_SECONDARY,
  TEST_BUNDLE_TERTIARY,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  collectTexts,
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

// Durations of AssessmentConfig, in milliseconds.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_THIRTY_MINUTES: number = 1800000;
const DURATION_SIXTY_MINUTES: number = 3600000;
const MILLIS_PER_MINUTE: number = 60000;
const SECONDS_PER_MINUTE: number = 60;
const TEXT_PAD_LENGTH: number = 2;

// Structural facts of the exam page.
const QUESTION_COUNT: number = 3;
const OPTIONS_PER_QUESTION: number = 3;
const OPTION_LABEL_BASE: number = 65;
const INVALID_ANSWER: number = -1;

// Assessment error codes of the kit.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Limits of the sample.
const MAX_ALLOWED_APPS: number = 20;
const MAX_EVENT_LOG: number = 20;

// Number of steps of the longest journey, it bounds the patience of the guarded runner.
const MAX_JOURNEY_STEPS: number = 12;

/**
 * Role of the person who drives the journey.
 *
 * The teacher configures and starts the session, the student answers the paper, the observer only
 * walks through the pages. The role is descriptive, it lets the report group the journeys.
 */
enum UserRole {
  TEACHER = 'teacher', STUDENT = 'student', OBSERVER = 'observer'
}

/**
 * One step of a user journey.
 *
 * A step is pure data: the name, the action that the guarded runner performs and the expected
 * outcome that the observation compares against.
 */
interface JourneyStep {
  name: string;
  action: string;
  expected: string;
}

/**
 * A user journey that the suite executes.
 *
 * The journey keeps the role, the duration of the session and the ordered steps. The definition is
 * independent of the driver so the journey catalogue can be validated without a device.
 */
class UserJourney {
  private id: string = '';
  private role: UserRole = UserRole.OBSERVER;
  private duration: number = DURATION_DEFAULT;
  private steps: JourneyStep[] = [];

  constructor(id: string, role: UserRole, duration: number) {
    this.id = id;
    this.role = role;
    this.duration = duration;
  }

  public getId(): string {
    return this.id;
  }

  public getRole(): UserRole {
    return this.role;
  }

  public getDuration(): number {
    return this.duration;
  }

  public addStep(name: string, action: string, expected: string): void {
    this.steps.push({
      name: name,
      action: action,
      expected: expected
    });
  }

  public stepCount(): number {
    return this.steps.length;
  }

  public stepNames(): string[] {
    const values: string[] = [];
    for (let i = 0; i < this.steps.length; i++) {
      values.push(this.steps[i].name);
    }
    return values;
  }

  public stepsSnapshot(): JourneyStep[] {
    return this.steps.slice();
  }

  public touchesExam(): boolean {
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].action.indexOf('exam') >= 0) {
        return true;
      }
    }
    return false;
  }

  public touchesWhitelist(): boolean {
    for (let i = 0; i < this.steps.length; i++) {
      const action: string = this.steps[i].action;
      if (action.indexOf('add') >= 0 || action.indexOf('remove') >= 0) {
        return true;
      }
    }
    return false;
  }

  public describe(): string {
    return `UserJourney{id=${this.id}, role=${this.role}, steps=${this.steps.length}}`;
  }
}

/**
 * Registry of the user journeys.
 *
 * The registry rejects a duplicate identifier and a journey that exceeds the step budget, because
 * a long journey hides the step that actually failed.
 */
class JourneyRegistry {
  private journeys: UserJourney[] = [];

  public register(journey: UserJourney): boolean {
    if (journey.getId().length === 0) {
      return false;
    }
    if (journey.stepCount() === 0 || journey.stepCount() > MAX_JOURNEY_STEPS) {
      return false;
    }
    for (let i = 0; i < this.journeys.length; i++) {
      if (this.journeys[i].getId() === journey.getId()) {
        return false;
      }
    }
    this.journeys.push(journey);
    return true;
  }

  public count(): number {
    return this.journeys.length;
  }

  public find(id: string): UserJourney | undefined {
    for (let i = 0; i < this.journeys.length; i++) {
      if (this.journeys[i].getId() === id) {
        return this.journeys[i];
      }
    }
    return undefined;
  }

  public ids(): string[] {
    const values: string[] = [];
    for (let i = 0; i < this.journeys.length; i++) {
      values.push(this.journeys[i].getId());
    }
    return values;
  }

  public countByRole(role: UserRole): number {
    let total: number = 0;
    for (let i = 0; i < this.journeys.length; i++) {
      if (this.journeys[i].getRole() === role) {
        total++;
      }
    }
    return total;
  }

  public examJourneys(): number {
    let total: number = 0;
    for (let i = 0; i < this.journeys.length; i++) {
      if (this.journeys[i].touchesExam()) {
        total++;
      }
    }
    return total;
  }

  public longestJourney(): number {
    let value: number = 0;
    for (let i = 0; i < this.journeys.length; i++) {
      if (this.journeys[i].stepCount() > value) {
        value = this.journeys[i].stepCount();
      }
    }
    return value;
  }

  public describe(): string {
    return `JourneyRegistry{journeys=${this.journeys.length}, longest=${this.longestJourney()}}`;
  }
}

/**
 * Answer sheet of the mock exam.
 *
 * The sheet mirrors the state of ExamPage: an array of answers initialized to the invalid marker,
 * a current index and the submit flag. The model is used to assert the flow that the student
 * performs before the paper is submitted.
 */
class AnswerSheet {
  private answers: number[] = [];
  private currentIndex: number = 0;
  private submitted: boolean = false;

  constructor(questionCount: number = QUESTION_COUNT) {
    for (let i = 0; i < questionCount; i++) {
      this.answers.push(INVALID_ANSWER);
    }
  }

  public questionCount(): number {
    return this.answers.length;
  }

  public current(): number {
    return this.currentIndex;
  }

  public next(): boolean {
    if (this.currentIndex >= this.answers.length - 1) {
      return false;
    }
    this.currentIndex++;
    return true;
  }

  public previous(): boolean {
    if (this.currentIndex <= 0) {
      return false;
    }
    this.currentIndex--;
    return true;
  }

  public select(optionIndex: number): boolean {
    if (optionIndex < 0 || optionIndex >= OPTIONS_PER_QUESTION) {
      return false;
    }
    if (this.currentIndex < 0 || this.currentIndex >= this.answers.length) {
      return false;
    }
    this.answers[this.currentIndex] = optionIndex;
    return true;
  }

  public selectedAt(index: number): number {
    if (index < 0 || index >= this.answers.length) {
      return INVALID_ANSWER;
    }
    return this.answers[index];
  }

  public answeredCount(): number {
    let total: number = 0;
    for (let i = 0; i < this.answers.length; i++) {
      if (this.answers[i] !== INVALID_ANSWER) {
        total++;
      }
    }
    return total;
  }

  public unansweredCount(): number {
    return this.answers.length - this.answeredCount();
  }

  public isAllAnswered(): boolean {
    return this.answeredCount() === this.answers.length;
  }

  public submit(): boolean {
    this.submitted = true;
    return this.answeredCount() > 0;
  }

  public isSubmitted(): boolean {
    return this.submitted;
  }

  public summary(): string {
    return `AnswerSheet{answered=${this.answeredCount()}/${this.answers.length}, ` +
      `submitted=${this.submitted}}`;
  }
}

/**
 * Countdown of the exam header.
 *
 * The page stores the remaining time in whole seconds and pads both fields to two characters, the
 * model reproduces the tick and the formatting so the journey can assert the header text.
 */
class ExamCountdown {
  private remainingSeconds: number = 0;
  private ticks: number = 0;

  constructor(durationMs: number) {
    this.remainingSeconds = Math.floor(durationMs / 1000);
  }

  public start(): boolean {
    return this.remainingSeconds > 0;
  }

  public tick(): boolean {
    if (this.remainingSeconds <= 0) {
      return false;
    }
    this.remainingSeconds--;
    this.ticks++;
    return true;
  }

  public tickMany(count: number): number {
    let applied: number = 0;
    for (let i = 0; i < count; i++) {
      if (this.tick()) {
        applied++;
      } else {
        break;
      }
    }
    return applied;
  }

  public remaining(): number {
    return this.remainingSeconds;
  }

  public isExpired(): boolean {
    return this.remainingSeconds === 0;
  }

  public text(): string {
    const minutes: number = Math.floor(this.remainingSeconds / SECONDS_PER_MINUTE);
    const seconds: number = this.remainingSeconds % SECONDS_PER_MINUTE;
    return `${minutes}`.padStart(TEXT_PAD_LENGTH, '0') + ':' +
      `${seconds}`.padStart(TEXT_PAD_LENGTH, '0');
  }

  public getTicks(): number {
    return this.ticks;
  }

  public describe(): string {
    return `ExamCountdown{remaining=${this.text()}, ticks=${this.ticks}}`;
  }
}

/**
 * Session state machine of the assessment.
 *
 * The machine models the four documented transitions: begin, confirm, interrupt and end. The
 * journey cases drive the machine to assert the expected state without depending on the system
 * confirmation dialog, which the runner never accepts.
 */
enum SessionState {
  IDLE = 'idle', PENDING = 'pending', ACTIVE = 'active', ENDED = 'ended'
}

/**
 * Model of one assessment session.
 *
 * The model tracks the state, the event log and the reason of the termination, so a journey can
 * assert the complete outcome of a session.
 */
class SessionMachine {
  private state: SessionState = SessionState.IDLE;
  private logs: string[] = [];
  private endReason: number = CODE_OK;
  private beginCount: number = 0;

  public getState(): SessionState {
    return this.state;
  }

  public begin(): boolean {
    if (this.state === SessionState.ACTIVE || this.state === SessionState.PENDING) {
      return false;
    }
    this.state = SessionState.PENDING;
    this.beginCount++;
    this.append('onBegin requested');
    return true;
  }

  public confirm(): boolean {
    if (this.state !== SessionState.PENDING) {
      return false;
    }
    this.state = SessionState.ACTIVE;
    this.append('onBegin code=0');
    return true;
  }

  public reject(code: number): boolean {
    if (this.state !== SessionState.PENDING) {
      return false;
    }
    this.state = SessionState.IDLE;
    this.endReason = code;
    this.append(`onBegin code=${code}`);
    return true;
  }

  public interrupt(code: number): boolean {
    if (this.state !== SessionState.ACTIVE) {
      return false;
    }
    this.state = SessionState.ENDED;
    this.endReason = code;
    this.append(`onInterrupted code=${code}`);
    return true;
  }

  public end(): boolean {
    if (this.state !== SessionState.ACTIVE) {
      return false;
    }
    this.state = SessionState.ENDED;
    this.endReason = CODE_OK;
    this.append('onEnd code=0');
    return true;
  }

  public isActive(): boolean {
    return this.state === SessionState.ACTIVE;
  }

  public isTerminal(): boolean {
    return this.state === SessionState.ENDED || this.state === SessionState.IDLE;
  }

  public getEndReason(): number {
    return this.endReason;
  }

  public getBeginCount(): number {
    return this.beginCount;
  }

  public logCount(): number {
    return this.logs.length;
  }

  public snapshotLogs(): string[] {
    return this.logs.slice();
  }

  private append(text: string): void {
    this.logs.push(text);
    if (this.logs.length > MAX_EVENT_LOG) {
      this.logs.shift();
    }
  }

  public describe(): string {
    return `SessionMachine{state=${this.state}, reason=${this.endReason}, logs=${this.logs.length}}`;
  }
}

/**
 * Outcome book of the journey run.
 *
 * A journey that cannot start because the page is absent is skipped, a journey that starts and
 * observes a mismatch is failed. The book keeps both counters so the final case can report them.
 */
class JourneyReport {
  private passed: number = 0;
  private failed: number = 0;
  private skipped: number = 0;

  public pass(): void {
    this.passed++;
  }

  public fail(): void {
    this.failed++;
  }

  public skip(): void {
    this.skipped++;
  }

  public getPassed(): number {
    return this.passed;
  }

  public getFailed(): number {
    return this.failed;
  }

  public getSkipped(): number {
    return this.skipped;
  }

  public total(): number {
    return this.passed + this.failed + this.skipped;
  }

  public isGreen(): boolean {
    return this.failed === 0;
  }

  public describe(): string {
    return `JourneyReport{passed=${this.passed}, failed=${this.failed}, skipped=${this.skipped}}`;
  }
}

/**
 * Builds the journey registry of the sample.
 *
 * Every journey is a realistic sequence of user actions: the teacher configures the whitelist and
 * starts the session, the student answers the paper, the session is interrupted and the student
 * leaves the exam page. The observer journeys only walk through the entry page.
 *
 * @returns the populated registry.
 */
function buildJourneys(): JourneyRegistry {
  const registry: JourneyRegistry = new JourneyRegistry();

  const teacherSetup: UserJourney = new UserJourney('teacher_setup', UserRole.TEACHER, DURATION_TEN_MINUTES);
  teacherSetup.addStep('open_app', 'launch the sample', 'the entry page is rendered');
  teacherSetup.addStep('read_title', 'find assessment_index_title', 'the title is visible');
  teacherSetup.addStep('add_student_app', 'add com.samples.dictionary', 'the whitelist grows');
  teacherSetup.addStep('query_config', 'query getConfiguration', 'the config card refreshes');
  teacherSetup.addStep('query_state', 'query isActive', 'the state stays inactive');
  registry.register(teacherSetup);

  const teacherStartSession: UserJourney =
    new UserJourney('teacher_start_session', UserRole.TEACHER, DURATION_THIRTY_MINUTES);
  teacherStartSession.addStep('open_app', 'launch the sample', 'the entry page is rendered');
  teacherStartSession.addStep('select_duration', 'select the thirty minute chip', 'the chip is active');
  teacherStartSession.addStep('add_exam_app', 'add com.samples.assessment', 'the whitelist contains the exam app');
  teacherStartSession.addStep('press_begin', 'click the begin button', 'the system dialog appears');
  teacherStartSession.addStep('confirm_begin', 'push exam/pages/ExamPage', 'the exam page is rendered');
  registry.register(teacherStartSession);

  const studentTakesExam: UserJourney =
    new UserJourney('student_takes_exam', UserRole.STUDENT, DURATION_TEN_MINUTES);
  studentTakesExam.addStep('open_exam', 'reach exam/pages/ExamPage', 'the exam page is rendered');
  studentTakesExam.addStep('answer_first', 'select option A of question 1', 'the option is highlighted');
  studentTakesExam.addStep('answer_second', 'select option B of question 2', 'the option is highlighted');
  studentTakesExam.addStep('answer_third', 'select option C of question 3', 'the option is highlighted');
  studentTakesExam.addStep('submit', 'click the submit button', 'the completion dialog appears');
  registry.register(studentTakesExam);

  const studentInterrupted: UserJourney =
    new UserJourney('student_interrupted', UserRole.STUDENT, DURATION_TEN_MINUTES);
  studentInterrupted.addStep('open_exam', 'reach exam/pages/ExamPage', 'the exam page is rendered');
  studentInterrupted.addStep('answer_first', 'select option A of question 1', 'the option is highlighted');
  studentInterrupted.addStep('timeout', 'wait for the interrupt callback', 'the interrupt dialog appears');
  studentInterrupted.addStep('confirm_dialog', 'click the OK button', 'the entry page is shown');
  registry.register(studentInterrupted);

  const observerWalk: UserJourney = new UserJourney('observer_walk', UserRole.OBSERVER, DURATION_DEFAULT);
  observerWalk.addStep('open_app', 'launch the sample', 'the entry page is rendered');
  observerWalk.addStep('scroll_down', 'press the down key', 'the list scrolls');
  observerWalk.addStep('scroll_up', 'press the up key', 'the list scrolls back');
  observerWalk.addStep('leave', 'press the back key', 'the sample is left');
  registry.register(observerWalk);

  return registry;
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
 * Counts the rendered texts that equal an expected value.
 *
 * @param driver driver of the running case.
 * @param expected text to count.
 * @returns the number of occurrences.
 */
async function countText(driver: Driver, expected: string): Promise<number> {
  const values: string[] = await collectTexts(driver);
  let total: number = 0;
  for (let i = 0; i < values.length; i++) {
    if (values[i] === expected) {
      total++;
    }
  }
  return total;
}

export default function userScenariosTest() {
  describe('UserScenarios_Test', () => {
    let driver: Driver;
    let journeys: JourneyRegistry;
    let report: JourneyReport;

    beforeAll(async () => {
      driver = getDriver();
      journeys = buildJourneys();
      report = new JourneyReport();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: register a malformed journey.
     * Expectation: an empty identifier, a journey without steps and a journey over the step budget
     * are all rejected, and a duplicated identifier is rejected on the second attempt.
     */
    it('Assessment_UserScenarios_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_002, begin');
      const local: JourneyRegistry = new JourneyRegistry();
      const unnamed: UserJourney = new UserJourney('', UserRole.OBSERVER, DURATION_DEFAULT);
      unnamed.addStep('a', 'launch', 'rendered');
      expect(local.register(unnamed)).assertFalse();
      const empty: UserJourney = new UserJourney('empty', UserRole.OBSERVER, DURATION_DEFAULT);
      expect(local.register(empty)).assertFalse();
      const valid: UserJourney = new UserJourney('valid', UserRole.TEACHER, DURATION_TEN_MINUTES);
      valid.addStep('a', 'launch', 'rendered');
      expect(local.register(valid)).assertTrue();
      expect(local.register(valid)).assertFalse();
      expect(local.count()).assertEqual(1);
      const tooLong: UserJourney = new UserJourney('too_long', UserRole.STUDENT, DURATION_DEFAULT);
      for (let i = 0; i < MAX_JOURNEY_STEPS + 1; i++) {
        tooLong.addStep(`step_${i}`, 'walk', 'rendered');
      }
      expect(local.register(tooLong)).assertFalse();
      expect(local.count()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_002', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_002, end');
    });

    /**
     * Scenario: the answer sheet of a new paper.
     * Expectation: every question starts unanswered, the previous button is refused on the first
     * question and the next button walks to the last question.
     */
    it('Assessment_UserScenarios_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_003, begin');
      const sheet: AnswerSheet = new AnswerSheet();
      expect(sheet.questionCount()).assertEqual(QUESTION_COUNT);
      expect(sheet.current()).assertEqual(0);
      expect(sheet.answeredCount()).assertEqual(0);
      expect(sheet.unansweredCount()).assertEqual(QUESTION_COUNT);
      expect(sheet.previous()).assertFalse();
      expect(sheet.next()).assertTrue();
      expect(sheet.current()).assertEqual(1);
      expect(sheet.next()).assertTrue();
      expect(sheet.next()).assertFalse();
      expect(sheet.current()).assertEqual(QUESTION_COUNT - 1);
      expect(sheet.isAllAnswered()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_003', sheet.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_003, end');
    });

    /**
     * Scenario: the student answers the complete paper.
     * Expectation: three answers make the sheet complete and the submit reports success.
     */
    it('Assessment_UserScenarios_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_004, begin');
      const sheet: AnswerSheet = new AnswerSheet();
      expect(sheet.select(0)).assertTrue();
      expect(sheet.next()).assertTrue();
      expect(sheet.select(1)).assertTrue();
      expect(sheet.next()).assertTrue();
      expect(sheet.select(2)).assertTrue();
      expect(sheet.selectedAt(0)).assertEqual(0);
      expect(sheet.selectedAt(1)).assertEqual(1);
      expect(sheet.selectedAt(2)).assertEqual(2);
      expect(sheet.answeredCount()).assertEqual(QUESTION_COUNT);
      expect(sheet.isAllAnswered()).assertTrue();
      expect(sheet.unansweredCount()).assertEqual(0);
      expect(sheet.submit()).assertTrue();
      expect(sheet.isSubmitted()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_004', sheet.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_004, end');
    });

    /**
     * Scenario: the student answers a partial paper.
     * Expectation: an empty paper cannot be submitted successfully, the submit of a partial paper
     * reports the partial answer count.
     */
    it('Assessment_UserScenarios_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_005, begin');
      const empty: AnswerSheet = new AnswerSheet();
      expect(empty.submit()).assertFalse();
      expect(empty.isSubmitted()).assertTrue();
      const partial: AnswerSheet = new AnswerSheet();
      partial.select(1);
      partial.next();
      partial.select(2);
      expect(partial.answeredCount()).assertEqual(2);
      expect(partial.unansweredCount()).assertEqual(1);
      expect(partial.isAllAnswered()).assertFalse();
      expect(partial.submit()).assertTrue();
      expect(partial.selectedAt(2)).assertEqual(INVALID_ANSWER);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_005', partial.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_005, end');
    });

    /**
     * Scenario: an out of range option selection.
     * Expectation: the selection is refused and the sheet keeps the previous answer, so a stray
     * tap cannot corrupt the answer array.
     */
    it('Assessment_UserScenarios_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_006, begin');
      const sheet: AnswerSheet = new AnswerSheet();
      expect(sheet.select(-1)).assertFalse();
      expect(sheet.select(OPTIONS_PER_QUESTION)).assertFalse();
      expect(sheet.answeredCount()).assertEqual(0);
      expect(sheet.select(OPTIONS_PER_QUESTION - 1)).assertTrue();
      expect(sheet.selectedAt(0)).assertEqual(OPTIONS_PER_QUESTION - 1);
      expect(sheet.selectedAt(-1)).assertEqual(INVALID_ANSWER);
      expect(sheet.selectedAt(QUESTION_COUNT)).assertEqual(INVALID_ANSWER);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_006, end');
    });

    /**
     * Scenario: the option labels of the exam page.
     * Expectation: the labels are the three letters A, B and C derived from the option label base.
     */
    it('Assessment_UserScenarios_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_007, begin');
      const labels: string[] = [];
      for (let i = 0; i < OPTIONS_PER_QUESTION; i++) {
        labels.push(String.fromCharCode(OPTION_LABEL_BASE + i));
      }
      expect(labels.length).assertEqual(3);
      expect(labels[0]).assertEqual('A');
      expect(labels[1]).assertEqual('B');
      expect(labels[2]).assertEqual('C');
      expect(labels.join('')).assertEqual('ABC');
      expect(OPTION_LABEL_BASE).assertEqual(65);
      hilog.info(DOMAIN, TAG, '%{public}s labels %{public}s', BUNDLE + 'UserScenarios_007', labels.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_007, end');
    });

    /**
     * Scenario: the countdown of a ten minute session.
     * Expectation: the countdown starts at 10:00, a single tick yields 09:59 and the full minute
     * boundary yields 09:00.
     */
    it('Assessment_UserScenarios_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_008, begin');
      const countdown: ExamCountdown = new ExamCountdown(DURATION_TEN_MINUTES);
      expect(countdown.start()).assertTrue();
      expect(countdown.text()).assertEqual('10:00');
      expect(countdown.tick()).assertTrue();
      expect(countdown.text()).assertEqual('09:59');
      countdown.tickMany(59);
      expect(countdown.text()).assertEqual('09:00');
      expect(countdown.getTicks()).assertEqual(60);
      expect(countdown.isExpired()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_008', countdown.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_008, end');
    });

    /**
     * Scenario: the countdown of a default duration session.
     * Expectation: the countdown does not start, every tick is refused and the text stays 00:00.
     */
    it('Assessment_UserScenarios_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_009, begin');
      const countdown: ExamCountdown = new ExamCountdown(DURATION_DEFAULT);
      expect(countdown.start()).assertFalse();
      expect(countdown.remaining()).assertEqual(0);
      expect(countdown.tick()).assertFalse();
      expect(countdown.tickMany(5)).assertEqual(0);
      expect(countdown.text()).assertEqual('00:00');
      expect(countdown.isExpired()).assertTrue();
      expect(countdown.getTicks()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_009', countdown.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_009, end');
    });

    /**
     * Scenario: a countdown that runs out.
     * Expectation: the ticks beyond zero are refused and the expired flag is raised exactly at the
     * last tick.
     */
    it('Assessment_UserScenarios_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_010, begin');
      const countdown: ExamCountdown = new ExamCountdown(3000);
      expect(countdown.text()).assertEqual('00:03');
      expect(countdown.tickMany(3)).assertEqual(3);
      expect(countdown.isExpired()).assertTrue();
      expect(countdown.text()).assertEqual('00:00');
      expect(countdown.tick()).assertFalse();
      expect(countdown.tickMany(5)).assertEqual(0);
      expect(countdown.getTicks()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_010', countdown.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_010, end');
    });

    /**
     * Scenario: the session machine of a confirmed begin.
     * Expectation: the state walks idle, pending, active, and the end returns to the terminal
     * state with the OK reason.
     */
    it('Assessment_UserScenarios_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_011, begin');
      const machine: SessionMachine = new SessionMachine();
      expect(machine.getState()).assertEqual(SessionState.IDLE);
      expect(machine.begin()).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.PENDING);
      expect(machine.isActive()).assertFalse();
      expect(machine.confirm()).assertTrue();
      expect(machine.isActive()).assertTrue();
      expect(machine.isTerminal()).assertFalse();
      expect(machine.end()).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.ENDED);
      expect(machine.getEndReason()).assertEqual(CODE_OK);
      expect(machine.isTerminal()).assertTrue();
      expect(machine.getBeginCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_011', machine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_011, end');
    });

    /**
     * Scenario: the user cancels the system confirmation dialog.
     * Expectation: the session returns to idle with the user cancel reason and the machine can be
     * started again.
     */
    it('Assessment_UserScenarios_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_012, begin');
      const machine: SessionMachine = new SessionMachine();
      machine.begin();
      expect(machine.reject(CODE_USER_CANCEL)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.IDLE);
      expect(machine.getEndReason()).assertEqual(CODE_USER_CANCEL);
      expect(machine.isActive()).assertFalse();
      expect(machine.begin()).assertTrue();
      expect(machine.getBeginCount()).assertEqual(2);
      expect(machine.logCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_012', machine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_012, end');
    });

    /**
     * Scenario: the teacher starts a session twice.
     * Expectation: the second begin is refused while the session is pending or active, so the
     * sample cannot open two sessions.
     */
    it('Assessment_UserScenarios_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_013, begin');
      const machine: SessionMachine = new SessionMachine();
      expect(machine.begin()).assertTrue();
      expect(machine.begin()).assertFalse();
      expect(machine.confirm()).assertTrue();
      expect(machine.begin()).assertFalse();
      expect(machine.getBeginCount()).assertEqual(1);
      expect(machine.isActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_013', machine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_013, end');
    });

    /**
     * Scenario: the environment anomaly interrupts the session.
     * Expectation: the interrupt terminates an active session with the environment reason and it
     * is refused when no session is active.
     */
    it('Assessment_UserScenarios_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_014, begin');
      const machine: SessionMachine = new SessionMachine();
      expect(machine.interrupt(CODE_ENV_ANOMALY)).assertFalse();
      machine.begin();
      machine.confirm();
      expect(machine.interrupt(CODE_ENV_ANOMALY)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.ENDED);
      expect(machine.getEndReason()).assertEqual(CODE_ENV_ANOMALY);
      expect(machine.end()).assertFalse();
      expect(machine.getEndReason()).assertEqual(CODE_ENV_ANOMALY);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_014', machine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_014, end');
    });

    /**
     * Scenario: the timeout reason of an interrupted session.
     * Expectation: the timeout and the system error both terminate an active session and their
     * reasons stay distinguishable.
     */
    it('Assessment_UserScenarios_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_015, begin');
      const timeoutMachine: SessionMachine = new SessionMachine();
      timeoutMachine.begin();
      timeoutMachine.confirm();
      timeoutMachine.interrupt(CODE_TIMEOUT);
      expect(timeoutMachine.getEndReason()).assertEqual(CODE_TIMEOUT);
      const errorMachine: SessionMachine = new SessionMachine();
      errorMachine.begin();
      errorMachine.confirm();
      errorMachine.interrupt(CODE_SYSTEM_ERROR);
      expect(errorMachine.getEndReason()).assertEqual(CODE_SYSTEM_ERROR);
      expect(timeoutMachine.getEndReason() === errorMachine.getEndReason()).assertFalse();
      expect(CODE_OK).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s reasons %{public}d and %{public}d',
        BUNDLE + 'UserScenarios_015', timeoutMachine.getEndReason(), errorMachine.getEndReason());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_015, end');
    });

    /**
     * Scenario: the journey report bookkeeping.
     * Expectation: a skipped journey does not make the book red, a failed one does.
     */
    it('Assessment_UserScenarios_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_016, begin');
      const local: JourneyReport = new JourneyReport();
      local.pass();
      local.skip();
      expect(local.total()).assertEqual(2);
      expect(local.isGreen()).assertTrue();
      local.fail();
      expect(local.total()).assertEqual(3);
      expect(local.isGreen()).assertFalse();
      expect(local.getFailed()).assertEqual(1);
      expect(local.getSkipped()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_016', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_016, end');
    });

    /**
     * Scenario: the journey snapshot is a defensive copy.
     * Expectation: mutating the returned step list does not change the journey, so a case cannot
     * shorten a journey by accident.
     */
    it('Assessment_UserScenarios_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_018, begin');
      const journey: UserJourney | undefined = journeys.find('teacher_setup');
      expect(journey !== undefined).assertTrue();
      if (journey === undefined) {
        return;
      }
      const before: number = journey.stepCount();
      const steps: JourneyStep[] = journey.stepsSnapshot();
      steps.push({
        name: 'injected',
        action: 'walk',
        expected: 'nothing'
      });
      expect(journey.stepCount()).assertEqual(before);
      expect(journey.stepNames()[0]).assertEqual('open_app');
      expect(journey.touchesWhitelist()).assertTrue();
      expect(journey.getRole()).assertEqual(UserRole.TEACHER);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UserScenarios_018', journey.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_018, end');
    });

    /**
     * Scenario: the label of the exam operation row.
     * Expectation: the three exam buttons carry the three documented labels, and none of them
     * collides with a button label of the entry page.
     */
    it('Assessment_UserScenarios_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_028, begin');
      expect(TEXT_EXAM_PREVIOUS).assertEqual('Previous');
      expect(TEXT_EXAM_NEXT).assertEqual('Next');
      expect(TEXT_EXAM_SUBMIT).assertEqual('Submit');
      expect(TEXT_DIALOG_CONFIRM).assertEqual('OK');
      const examLabels: Set<string> = new Set<string>([TEXT_EXAM_PREVIOUS, TEXT_EXAM_NEXT, TEXT_EXAM_SUBMIT]);
      expect(examLabels.size).assertEqual(3);
      expect(examLabels.has(TEXT_REMOVE_BUTTON)).assertFalse();
      expect(examLabels.has(TEXT_STATE_ACTIVE)).assertFalse();
      expect(examLabels.has(TEXT_STATE_INACTIVE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_028, end');
    });

    /**
     * Scenario: the end to end journey of a teacher who starts and finishes a session.
     * Expectation: the machine walks the full lifecycle and the reported answer count matches the
     * number of questions, which is the journey that the exam finish dialog describes.
     */
    it('Assessment_UserScenarios_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_029, begin');
      const machine: SessionMachine = new SessionMachine();
      const sheet: AnswerSheet = new AnswerSheet();
      expect(machine.begin()).assertTrue();
      expect(machine.confirm()).assertTrue();
      for (let i = 0; i < QUESTION_COUNT; i++) {
        expect(sheet.select(i % OPTIONS_PER_QUESTION)).assertTrue();
        if (i < QUESTION_COUNT - 1) {
          expect(sheet.next()).assertTrue();
        }
      }
      expect(sheet.answeredCount()).assertEqual(QUESTION_COUNT);
      expect(machine.end()).assertTrue();
      expect(machine.isTerminal()).assertTrue();
      expect(machine.logCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s, %{public}s',
        BUNDLE + 'UserScenarios_029', machine.describe(), sheet.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_029, end');
    });

    /**
     * Scenario: the journey catalogue selects the exam journeys.
     * Expectation: the three journeys that touch the exam page are the two student journeys and
     * the teacher start session journey, and the observer walk does not.
     */
    it('Assessment_UserScenarios_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_030, begin');
      const ids: string[] = journeys.ids();
      let examJourneys: number = 0;
      let whitelistJourneys: number = 0;
      for (let i = 0; i < ids.length; i++) {
        const journey: UserJourney | undefined = journeys.find(ids[i]);
        if (journey === undefined) {
          continue;
        }
        if (journey.touchesExam()) {
          examJourneys++;
        }
        if (journey.touchesWhitelist()) {
          whitelistJourneys++;
        }
      }
      expect(examJourneys).assertEqual(3);
      expect(whitelistJourneys).assertEqual(2);
      const observer: UserJourney | undefined = journeys.find('observer_walk');
      expect(observer !== undefined).assertTrue();
      if (observer !== undefined) {
        expect(observer.touchesExam()).assertFalse();
        expect(observer.touchesWhitelist()).assertFalse();
        expect(observer.getDuration()).assertEqual(DURATION_DEFAULT);
      }
      hilog.info(DOMAIN, TAG, '%{public}s exam journeys %{public}d',
        BUNDLE + 'UserScenarios_030', examJourneys);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_030, end');
    });

    /**
     * Scenario: the duration picker of the config card.
     * Expectation: the four chips map to the four documented durations and the minute conversion
     * of each chip is correct.
     */
    it('Assessment_UserScenarios_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_031, begin');
      const durations: number[] = [DURATION_DEFAULT, DURATION_TEN_MINUTES, DURATION_THIRTY_MINUTES,
        DURATION_SIXTY_MINUTES];
      const expectedMinutes: number[] = [0, 10, 30, 60];
      for (let i = 0; i < durations.length; i++) {
        const minutes: number = durations[i] / MILLIS_PER_MINUTE;
        expect(minutes).assertEqual(expectedMinutes[i]);
        expect(Number.isInteger(minutes)).assertTrue();
      }
      expect(durations[3] / durations[1]).assertEqual(6);
      expect(durations[2] - durations[1]).assertEqual(1200000);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UserScenarios_031, end');
    });
  });
}
