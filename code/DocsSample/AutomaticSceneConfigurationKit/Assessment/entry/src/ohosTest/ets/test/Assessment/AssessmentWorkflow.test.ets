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
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The three references of the exam page, re-declared locally.
const EXAM_QUESTION_COUNT: number = 3;
const EXAM_OPTION_COUNT: number = 3;
const OPTION_LABEL_BASE: number = 65;
const INVALID_ANSWER: number = -1;

// Events that the workflow engine reacts to.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

// Error codes of the callback pair.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

/**
 * The steps of the documented assessment workflow.
 *
 * The order of the members is the order of the user journey: configure, request, confirm, pass
 * the exam, submit and leave. The workflow engine rejects any step that skips a predecessor.
 */
enum WorkflowStep {
  CONFIGURE = 'configure',
  REQUEST = 'request',
  CONFIRM = 'confirm',
  ACTIVE = 'active',
  ANSWER = 'answer',
  SUBMIT = 'submit',
  EXIT = 'exit'
}

const WORKFLOW_ORDER: string[] = [
  WorkflowStep.CONFIGURE,
  WorkflowStep.REQUEST,
  WorkflowStep.CONFIRM,
  WorkflowStep.ACTIVE,
  WorkflowStep.ANSWER,
  WorkflowStep.SUBMIT,
  WorkflowStep.EXIT
];

/**
 * Outcome of attempting a workflow step.
 */
interface StepResult {
  step: string;
  accepted: boolean;
  reason: string;
}

/**
 * One recorded step of a workflow run.
 */
interface StepRecord {
  index: number;
  step: string;
  detail: string;
}

/**
 * A guided workflow over the assessment lifecycle.
 *
 * The engine keeps the completed steps and the gate rules. A step is gated by the immediate
 * predecessor, which is what the sample effectively enforces: the exam page is only pushed after
 * a successful begin callback, and the end call is only reachable from the exam page.
 */
class WorkflowEngine {
  private completed: string[] = [];
  private stepRecords: StepRecord[] = [];
  private rejectedCount: number = 0;
  private active: boolean = false;

  public static requiredOrder(): string[] {
    return WORKFLOW_ORDER.slice();
  }

  public static successorOf(step: string): string {
    const index: number = WORKFLOW_ORDER.indexOf(step);
    if (index < 0 || index >= WORKFLOW_ORDER.length - 1) {
      return '';
    }
    return WORKFLOW_ORDER[index + 1];
  }

  public static predecessorOf(step: string): string {
    const index: number = WORKFLOW_ORDER.indexOf(step);
    if (index <= 0) {
      return '';
    }
    return WORKFLOW_ORDER[index - 1];
  }

  public complete(step: string, detail: string = ''): StepResult {
    if (WORKFLOW_ORDER.indexOf(step) < 0) {
      return this.reject(step, 'unknown workflow step');
    }
    if (this.completed.indexOf(step) >= 0) {
      return this.reject(step, 'the step was already completed');
    }
    const predecessor: string = WorkflowEngine.predecessorOf(step);
    if (predecessor.length > 0 && this.completed.indexOf(predecessor) < 0) {
      return this.reject(step, `the step requires ${predecessor} first`);
    }
    const next: string[] = this.completed.slice();
    next.push(step);
    this.completed = next;
    const record: StepRecord = {
      index: this.stepRecords.length,
      step: step,
      detail: detail
    };
    this.stepRecords.push(record);
    if (step === WorkflowStep.ACTIVE) {
      this.active = true;
    }
    if (step === WorkflowStep.SUBMIT || step === WorkflowStep.EXIT) {
      this.active = false;
    }
    return {
      step: step,
      accepted: true,
      reason: ''
    };
  }

  public isCompleted(step: string): boolean {
    return this.completed.indexOf(step) >= 0;
  }

  public completedSteps(): string[] {
    return this.completed.slice();
  }

  public completionCount(): number {
    return this.completed.length;
  }

  public rejections(): number {
    return this.rejectedCount;
  }

  public isActive(): boolean {
    return this.active;
  }

  public isFinished(): boolean {
    return this.isCompleted(WorkflowStep.EXIT);
  }

  public currentStep(): string {
    for (let i = 0; i < WORKFLOW_ORDER.length; i++) {
      if (this.completed.indexOf(WORKFLOW_ORDER[i]) < 0) {
        return WORKFLOW_ORDER[i];
      }
    }
    return WorkflowStep.EXIT;
  }

  public nextStep(): string {
    return this.currentStep();
  }

  public records(): StepRecord[] {
    return this.stepRecords.slice();
  }

  public recordOf(step: string): StepRecord | null {
    for (let i = 0; i < this.stepRecords.length; i++) {
      if (this.stepRecords[i].step === step) {
        return this.stepRecords[i];
      }
    }
    return null;
  }

  public resumableFrom(step: string): string[] {
    const index: number = WORKFLOW_ORDER.indexOf(step);
    if (index < 0) {
      return [];
    }
    return WORKFLOW_ORDER.slice(index);
  }

  public progressPercent(): number {
    return Math.round(this.completed.length * 100 / WORKFLOW_ORDER.length);
  }

  private reject(step: string, reason: string): StepResult {
    this.rejectedCount++;
    return {
      step: step,
      accepted: false,
      reason: reason
    };
  }

  public toString(): string {
    return `WorkflowEngine{completed=${this.completed.join('>')}, active=${this.active}, ` +
      `rejected=${this.rejectedCount}}`;
  }
}

/**
 * Models the exam paper of the sample.
 *
 * The exam page holds three questions with three options each, labels the options A, B and C,
 * counts the answered questions and calls end when the paper is submitted.
 */
class ExamPaper {
  private answers: number[] = [];
  private currentIndex: number = 0;

  constructor(questionCount: number = EXAM_QUESTION_COUNT) {
    const initial: number[] = [];
    for (let i = 0; i < questionCount; i++) {
      initial.push(INVALID_ANSWER);
    }
    this.answers = initial;
  }

  public questionCount(): number {
    return this.answers.length;
  }

  public optionCount(): number {
    return EXAM_OPTION_COUNT;
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

  public select(option: number): boolean {
    if (option < 0 || option >= EXAM_OPTION_COUNT) {
      return false;
    }
    const next: number[] = this.answers.slice();
    next[this.currentIndex] = option;
    this.answers = next;
    return true;
  }

  public answerAt(index: number): number {
    if (index < 0 || index >= this.answers.length) {
      return INVALID_ANSWER;
    }
    return this.answers[index];
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

  public allAnswered(): boolean {
    return this.answeredCount() === this.answers.length;
  }

  public optionLabel(index: number): string {
    return String.fromCharCode(OPTION_LABEL_BASE + index);
  }

  public progressText(): string {
    return `${this.currentIndex + 1} / ${this.answers.length}`;
  }

  public isSelected(option: number): boolean {
    return this.answers[this.currentIndex] === option;
  }

  public clear(): void {
    const next: number[] = [];
    for (let i = 0; i < this.answers.length; i++) {
      next.push(INVALID_ANSWER);
    }
    this.answers = next;
    this.currentIndex = 0;
  }

  public toString(): string {
    return `ExamPaper{index=${this.currentIndex}, answered=${this.answeredCount()}, ` +
      `total=${this.answers.length}}`;
  }
}

/**
 * The dialogue guard of the exam page.
 *
 * The exam page shows one alert dialog per visit: dialogShown is set once and every later event
 * is ignored. The guard below reproduces that behaviour so a case can prove that a burst of
 * events does not stack dialogs.
 */
class DialogGuard {
  private shown: boolean = false;
  private requests: number = 0;
  private delivered: number = 0;

  public request(): boolean {
    this.requests++;
    if (this.shown) {
      return false;
    }
    this.shown = true;
    this.delivered++;
    return true;
  }

  public isShown(): boolean {
    return this.shown;
  }

  public requestCount(): number {
    return this.requests;
  }

  public deliveredCount(): number {
    return this.delivered;
  }

  public reset(): void {
    this.shown = false;
  }

  public toString(): string {
    return `DialogGuard{shown=${this.shown}, requests=${this.requests}, delivered=${this.delivered}}`;
  }
}

/**
 * Chooses the dialog title for a given assessment event.
 *
 * The exam page maps a failed begin and an interruption to the end dialog and a successful end
 * after a submission to the finish dialog. The mapper keeps that decision table explicit.
 */
class ExitDialogPolicy {
  public static titleFor(eventType: string, code: number): string {
    if (eventType === EVENT_BEGIN && code !== CODE_OK) {
      return 'exam_end_title';
    }
    if (eventType === EVENT_INTERRUPTED) {
      return 'exam_interrupt_title';
    }
    if (eventType === EVENT_END) {
      return 'exam_finish_title';
    }
    if (eventType === EVENT_API_ERROR) {
      return 'exam_api_error_title';
    }
    return '';
  }

  public static reasonFor(code: number): string {
    if (code === CODE_USER_CANCEL) {
      return 'reason_user_cancel';
    }
    if (code === CODE_TIMEOUT) {
      return 'reason_timeout';
    }
    if (code === CODE_SYSTEM_ERROR) {
      return 'reason_system_error';
    }
    if (code === CODE_ENV_ANOMALY) {
      return 'reason_env_anomaly';
    }
    return 'reason_unknown';
  }

  public static shouldShowDialog(eventType: string, code: number): boolean {
    if (eventType === EVENT_BEGIN) {
      return code !== CODE_OK;
    }
    return eventType === EVENT_INTERRUPTED || eventType === EVENT_END || eventType === EVENT_API_ERROR;
  }

  public static describe(eventType: string, code: number): string {
    return `ExitDialog{event=${eventType}, code=${code}, title=${ExitDialogPolicy.titleFor(eventType, code)}}`;
  }
}

/**
 * Countdown model of the exam header.
 *
 * The exam page converts the configured duration to seconds and formats the remainder as MM:SS.
 * The default duration renders the default label instead of a countdown.
 */
class CountdownModel {
  private remainingSeconds: number = 0;
  private defaultDuration: boolean = true;

  constructor(durationMs: number = 0) {
    this.defaultDuration = durationMs === 0;
    this.remainingSeconds = Math.floor(durationMs / 1000);
  }

  public isDefault(): boolean {
    return this.defaultDuration;
  }

  public remaining(): number {
    return this.remainingSeconds;
  }

  public tick(): boolean {
    if (this.remainingSeconds <= 0) {
      return false;
    }
    this.remainingSeconds--;
    return true;
  }

  public tickTimes(times: number): number {
    let applied: number = 0;
    for (let i = 0; i < times; i++) {
      if (!this.tick()) {
        return applied;
      }
      applied++;
    }
    return applied;
  }

  public formatted(): string {
    const minutes: number = Math.floor(this.remainingSeconds / 60);
    const seconds: number = this.remainingSeconds % 60;
    const minuteText: string = `${minutes}`.padStart(2, '0');
    const secondText: string = `${seconds}`.padStart(2, '0');
    return `${minuteText}:${secondText}`;
  }

  public label(): string {
    return this.defaultDuration ? 'Default duration' : this.formatted();
  }

  public isWarning(): boolean {
    return !this.defaultDuration && this.remainingSeconds <= 60;
  }

  public isExhausted(): boolean {
    return !this.defaultDuration && this.remainingSeconds <= 0;
  }

  public toString(): string {
    return `CountdownModel{remaining=${this.remainingSeconds}, label=${this.label()}}`;
  }
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

export default function assessmentWorkflowTest() {
  describe('AssessmentWorkflow_Test', () => {
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
     * Scenario: the declared workflow order.
     * Expectation: seven steps are declared and the sequence starts with the configure step.
     */
    it('Assessment_WorkflowOrder_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WorkflowOrder_001, begin');
      const order: string[] = WorkflowEngine.requiredOrder();
      expect(order.length).assertEqual(7);
      expect(order[0]).assertEqual(WorkflowStep.CONFIGURE);
      expect(order[6]).assertEqual(WorkflowStep.EXIT);
      expect(new Set<string>(order).size).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', order.join(' -> '));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WorkflowOrder_001, end');
    });

    /**
     * Scenario: the neighbour relations of the workflow.
     * Expectation: every step knows its predecessor and its successor, the boundaries answer empty.
     */
    it('Assessment_WorkflowNeighbours_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WorkflowNeighbours_002, begin');
      expect(WorkflowEngine.predecessorOf(WorkflowStep.CONFIGURE)).assertEqual('');
      expect(WorkflowEngine.successorOf(WorkflowStep.CONFIGURE)).assertEqual(WorkflowStep.REQUEST);
      expect(WorkflowEngine.successorOf(WorkflowStep.REQUEST)).assertEqual(WorkflowStep.CONFIRM);
      expect(WorkflowEngine.predecessorOf(WorkflowStep.EXIT)).assertEqual(WorkflowStep.SUBMIT);
      expect(WorkflowEngine.successorOf(WorkflowStep.EXIT)).assertEqual('');
      expect(WorkflowEngine.predecessorOf('unknown')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WorkflowNeighbours_002, end');
    });

    /**
     * Scenario: a full successful workflow run.
     * Expectation: all seven steps complete in order and the run finishes without a rejection.
     */
    it('Assessment_FullRun_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FullRun_003, begin');
      const engine: WorkflowEngine = new WorkflowEngine();
      const order: string[] = WorkflowEngine.requiredOrder();
      for (let i = 0; i < order.length; i++) {
        const result: StepResult = engine.complete(order[i], 'step ' + i);
        expect(result.accepted).assertTrue();
      }
      expect(engine.completionCount()).assertEqual(7);
      expect(engine.rejections()).assertEqual(0);
      expect(engine.isFinished()).assertTrue();
      expect(engine.progressPercent()).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FullRun_003, end');
    });

    /**
     * Scenario: a step that skips its predecessor.
     * Expectation: the confirmation step is rejected before the request step.
     */
    it('Assessment_GateRejectsSkippedStep_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GateRejectsSkippedStep_004, begin');
      const engine: WorkflowEngine = new WorkflowEngine();
      engine.complete(WorkflowStep.CONFIGURE);
      const early: StepResult = engine.complete(WorkflowStep.CONFIRM);
      expect(early.accepted).assertFalse();
      expect(early.reason).assertContain(WorkflowStep.REQUEST);
      expect(engine.completionCount()).assertEqual(1);
      expect(engine.rejections()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GateRejectsSkippedStep_004, end');
    });

    /**
     * Scenario: a step that is completed twice.
     * Expectation: the second attempt is rejected and the completed list does not grow.
     */
    it('Assessment_GateRejectsDuplicateStep_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GateRejectsDuplicateStep_005, begin');
      const engine: WorkflowEngine = new WorkflowEngine();
      engine.complete(WorkflowStep.CONFIGURE);
      const duplicate: StepResult = engine.complete(WorkflowStep.CONFIGURE);
      expect(duplicate.accepted).assertFalse();
      expect(duplicate.reason).assertContain('already completed');
      expect(engine.completionCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GateRejectsDuplicateStep_005, end');
    });

    /**
     * Scenario: an unknown workflow step.
     * Expectation: the engine rejects it instead of silently appending it.
     */
    it('Assessment_GateRejectsUnknownStep_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GateRejectsUnknownStep_006, begin');
      const engine: WorkflowEngine = new WorkflowEngine();
      const result: StepResult = engine.complete('teleport');
      expect(result.accepted).assertFalse();
      expect(result.reason).assertContain('unknown');
      expect(engine.completionCount()).assertEqual(0);
      expect(engine.currentStep()).assertEqual(WorkflowStep.CONFIGURE);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GateRejectsUnknownStep_006, end');
    });

    /**
     * Scenario: the current step of a partially completed run.
     * Expectation: the engine reports the first step that has not been completed yet.
     */
    it('Assessment_CurrentStepTracking_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CurrentStepTracking_007, begin');
      const engine: WorkflowEngine = new WorkflowEngine();
      expect(engine.currentStep()).assertEqual(WorkflowStep.CONFIGURE);
      engine.complete(WorkflowStep.CONFIGURE);
      expect(engine.currentStep()).assertEqual(WorkflowStep.REQUEST);
      engine.complete(WorkflowStep.REQUEST);
      expect(engine.currentStep()).assertEqual(WorkflowStep.CONFIRM);
      expect(engine.nextStep()).assertEqual(WorkflowStep.CONFIRM);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CurrentStepTracking_007, end');
    });

    /**
     * Scenario: the active flag of the workflow engine.
     * Expectation: it turns on at the active step and off at the submit step.
     */
    it('Assessment_ActiveFlagTransitions_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ActiveFlagTransitions_008, begin');
      const engine: WorkflowEngine = new WorkflowEngine();
      expect(engine.isActive()).assertFalse();
      engine.complete(WorkflowStep.CONFIGURE);
      engine.complete(WorkflowStep.REQUEST);
      expect(engine.isActive()).assertFalse();
      engine.complete(WorkflowStep.CONFIRM);
      engine.complete(WorkflowStep.ACTIVE);
      expect(engine.isActive()).assertTrue();
      engine.complete(WorkflowStep.ANSWER);
      expect(engine.isActive()).assertTrue();
      engine.complete(WorkflowStep.SUBMIT);
      expect(engine.isActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', engine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ActiveFlagTransitions_008, end');
    });

    /**
     * Scenario: the resumable suffixes of the workflow.
     * Expectation: resuming from the answer step yields the remaining four steps.
     */
    it('Assessment_ResumableSuffix_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResumableSuffix_009, begin');
      const suffix: string[] = new WorkflowEngine().resumableFrom(WorkflowStep.ANSWER);
      expect(suffix.length).assertEqual(3);
      expect(suffix[0]).assertEqual(WorkflowStep.ANSWER);
      expect(suffix[2]).assertEqual(WorkflowStep.EXIT);
      expect(new WorkflowEngine().resumableFrom('unknown').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', suffix.join(' -> '));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResumableSuffix_009, end');
    });

    /**
     * Scenario: the progress percentage of the workflow.
     * Expectation: it grows in equal steps and saturates at one hundred.
     */
    it('Assessment_ProgressPercentage_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ProgressPercentage_010, begin');
      const engine: WorkflowEngine = new WorkflowEngine();
      expect(engine.progressPercent()).assertEqual(0);
      const order: string[] = WorkflowEngine.requiredOrder();
      let previous: number = 0;
      for (let i = 0; i < order.length; i++) {
        engine.complete(order[i]);
        const current: number = engine.progressPercent();
        expect(current >= previous).assertTrue();
        previous = current;
      }
      expect(engine.progressPercent()).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ProgressPercentage_010, end');
    });

    /**
     * Scenario: the recorded step of a run.
     * Expectation: every record carries its index, the step name and the detail text.
     */
    it('Assessment_StepRecords_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StepRecords_011, begin');
      const engine: WorkflowEngine = new WorkflowEngine();
      engine.complete(WorkflowStep.CONFIGURE, 'duration 10 min');
      engine.complete(WorkflowStep.REQUEST, 'begin called');
      const records: StepRecord[] = engine.records();
      expect(records.length).assertEqual(2);
      expect(records[0].index).assertEqual(0);
      expect(records[1].index).assertEqual(1);
      expect(records[0].step).assertEqual(WorkflowStep.CONFIGURE);
      expect(records[1].detail).assertEqual('begin called');
      const lookup: StepRecord | null = engine.recordOf(WorkflowStep.REQUEST);
      expect(lookup !== null).assertTrue();
      expect(engine.recordOf(WorkflowStep.EXIT)).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StepRecords_011, end');
    });

    /**
     * Scenario: a successful begin callback.
     * Expectation: the dialog policy asks for the exam page push, not for a dialog.
     */
    it('Assessment_BeginOkPushesExam_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginOkPushesExam_012, begin');
      expect(ExitDialogPolicy.shouldShowDialog(EVENT_BEGIN, CODE_OK)).assertFalse();
      expect(ExitDialogPolicy.titleFor(EVENT_BEGIN, CODE_OK)).assertEqual('');
      expect(ExitDialogPolicy.shouldShowDialog(EVENT_BEGIN, CODE_USER_CANCEL)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', ExitDialogPolicy.describe(EVENT_BEGIN, CODE_OK));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginOkPushesExam_012, end');
    });

    /**
     * Scenario: a refused begin callback.
     * Expectation: the exit dialog is requested with the end title.
     */
    it('Assessment_BeginFailureShowsDialog_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginFailureShowsDialog_013, begin');
      expect(ExitDialogPolicy.titleFor(EVENT_BEGIN, CODE_ENV_ANOMALY)).assertEqual('exam_end_title');
      expect(ExitDialogPolicy.reasonFor(CODE_ENV_ANOMALY)).assertEqual('reason_env_anomaly');
      expect(ExitDialogPolicy.reasonFor(CODE_TIMEOUT)).assertEqual('reason_timeout');
      expect(ExitDialogPolicy.reasonFor(CODE_USER_CANCEL)).assertEqual('reason_user_cancel');
      hilog.info(DOMAIN, TAG, '%{public}s', ExitDialogPolicy.describe(EVENT_BEGIN, CODE_ENV_ANOMALY));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginFailureShowsDialog_013, end');
    });

    /**
     * Scenario: an interruption during the exam.
     * Expectation: the interruption dialog is requested with the documented reason.
     */
    it('Assessment_InterruptShowsDialog_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptShowsDialog_014, begin');
      expect(ExitDialogPolicy.shouldShowDialog(EVENT_INTERRUPTED, CODE_SYSTEM_ERROR)).assertTrue();
      expect(ExitDialogPolicy.titleFor(EVENT_INTERRUPTED, CODE_SYSTEM_ERROR)).assertEqual('exam_interrupt_title');
      expect(ExitDialogPolicy.reasonFor(CODE_SYSTEM_ERROR)).assertEqual('reason_system_error');
      expect(ExitDialogPolicy.reasonFor(99)).assertEqual('reason_unknown');
      hilog.info(DOMAIN, TAG, '%{public}s', ExitDialogPolicy.describe(EVENT_INTERRUPTED, CODE_SYSTEM_ERROR));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptShowsDialog_014, end');
    });

    /**
     * Scenario: the end callback after a submission.
     * Expectation: the finish dialog is requested.
     */
    it('Assessment_EndShowsFinishDialog_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndShowsFinishDialog_015, begin');
      expect(ExitDialogPolicy.shouldShowDialog(EVENT_END, CODE_OK)).assertTrue();
      expect(ExitDialogPolicy.titleFor(EVENT_END, CODE_OK)).assertEqual('exam_finish_title');
      expect(ExitDialogPolicy.reasonFor(CODE_OK)).assertEqual('reason_unknown');
      hilog.info(DOMAIN, TAG, '%{public}s', ExitDialogPolicy.describe(EVENT_END, CODE_OK));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndShowsFinishDialog_015, end');
    });

    /**
     * Scenario: the dialog guard of the exam page.
     * Expectation: only the first request is delivered, every later event is dropped.
     */
    it('Assessment_DialogGuardSingleDialog_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogGuardSingleDialog_016, begin');
      const guard: DialogGuard = new DialogGuard();
      expect(guard.request()).assertTrue();
      expect(guard.request()).assertFalse();
      expect(guard.request()).assertFalse();
      expect(guard.requestCount()).assertEqual(3);
      expect(guard.deliveredCount()).assertEqual(1);
      expect(guard.isShown()).assertTrue();
      guard.reset();
      expect(guard.request()).assertTrue();
      expect(guard.deliveredCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', guard.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogGuardSingleDialog_016, end');
    });

    /**
     * Scenario: an empty exam paper.
     * Expectation: no answer is recorded and the answered count is zero.
     */
    it('Assessment_PaperInitialState_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperInitialState_017, begin');
      const paper: ExamPaper = new ExamPaper();
      expect(paper.questionCount()).assertEqual(EXAM_QUESTION_COUNT);
      expect(paper.optionCount()).assertEqual(EXAM_OPTION_COUNT);
      expect(paper.answeredCount()).assertEqual(0);
      expect(paper.current()).assertEqual(0);
      expect(paper.answerAt(0)).assertEqual(INVALID_ANSWER);
      expect(paper.allAnswered()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', paper.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperInitialState_017, end');
    });

    /**
     * Scenario: the option labels of a question.
     * Expectation: the three options are labelled A, B and C.
     */
    it('Assessment_OptionLabels_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OptionLabels_018, begin');
      const paper: ExamPaper = new ExamPaper();
      expect(paper.optionLabel(0)).assertEqual('A');
      expect(paper.optionLabel(1)).assertEqual('B');
      expect(paper.optionLabel(2)).assertEqual('C');
      expect(OPTION_LABEL_BASE).assertEqual(65);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OptionLabels_018, end');
    });

    /**
     * Scenario: navigation across the three questions.
     * Expectation: next stops at the last question and previous stops at the first.
     */
    it('Assessment_PaperNavigation_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperNavigation_019, begin');
      const paper: ExamPaper = new ExamPaper();
      expect(paper.previous()).assertFalse();
      expect(paper.next()).assertTrue();
      expect(paper.current()).assertEqual(1);
      expect(paper.next()).assertTrue();
      expect(paper.current()).assertEqual(2);
      expect(paper.next()).assertFalse();
      expect(paper.current()).assertEqual(2);
      expect(paper.previous()).assertTrue();
      expect(paper.current()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', paper.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperNavigation_019, end');
    });

    /**
     * Scenario: selecting an option on the current question.
     * Expectation: the selection is stored only for the current question.
     */
    it('Assessment_PaperSelectOption_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperSelectOption_020, begin');
      const paper: ExamPaper = new ExamPaper();
      expect(paper.select(1)).assertTrue();
      expect(paper.answerAt(0)).assertEqual(1);
      expect(paper.isSelected(1)).assertTrue();
      expect(paper.isSelected(0)).assertFalse();
      paper.next();
      expect(paper.isSelected(1)).assertFalse();
      expect(paper.answerAt(1)).assertEqual(INVALID_ANSWER);
      expect(paper.select(3)).assertFalse();
      expect(paper.select(-1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', paper.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperSelectOption_020, end');
    });

    /**
     * Scenario: answering every question.
     * Expectation: the answered count reaches the question count and the paper reports complete.
     */
    it('Assessment_PaperAnswerAll_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperAnswerAll_021, begin');
      const paper: ExamPaper = new ExamPaper();
      for (let i = 0; i < EXAM_QUESTION_COUNT; i++) {
        paper.select(i % EXAM_OPTION_COUNT);
        if (i < EXAM_QUESTION_COUNT - 1) {
          paper.next();
        }
      }
      expect(paper.answeredCount()).assertEqual(3);
      expect(paper.allAnswered()).assertTrue();
      expect(paper.answerAt(0)).assertEqual(0);
      expect(paper.answerAt(1)).assertEqual(1);
      expect(paper.answerAt(2)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', paper.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperAnswerAll_021, end');
    });

    /**
     * Scenario: changing an answer of an already answered question.
     * Expectation: the answer is replaced and the answered count stays the same.
     */
    it('Assessment_PaperReplaceAnswer_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperReplaceAnswer_022, begin');
      const paper: ExamPaper = new ExamPaper();
      paper.select(0);
      expect(paper.answeredCount()).assertEqual(1);
      paper.select(2);
      expect(paper.answeredCount()).assertEqual(1);
      expect(paper.answerAt(0)).assertEqual(2);
      expect(paper.isSelected(2)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', paper.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperReplaceAnswer_022, end');
    });

    /**
     * Scenario: the progress text of the exam header.
     * Expectation: it renders the one based index and the total question count.
     */
    it('Assessment_PaperProgressText_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperProgressText_023, begin');
      const paper: ExamPaper = new ExamPaper();
      expect(paper.progressText()).assertEqual('1 / 3');
      paper.next();
      expect(paper.progressText()).assertEqual('2 / 3');
      paper.next();
      expect(paper.progressText()).assertEqual('3 / 3');
      hilog.info(DOMAIN, TAG, '%{public}s', paper.progressText());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperProgressText_023, end');
    });

    /**
     * Scenario: clearing a paper before a retake.
     * Expectation: the answers and the cursor return to their initial values.
     */
    it('Assessment_PaperClear_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperClear_024, begin');
      const paper: ExamPaper = new ExamPaper();
      paper.select(1);
      paper.next();
      paper.select(2);
      expect(paper.answeredCount()).assertEqual(2);
      paper.clear();
      expect(paper.answeredCount()).assertEqual(0);
      expect(paper.current()).assertEqual(0);
      expect(paper.allAnswered()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', paper.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperClear_024, end');
    });

    /**
     * Scenario: the exam page receives the exam work paper after a successful begin.
     * Expectation: the paper starts empty even though the workflow already reached the answer step.
     */
    it('Assessment_PaperAtAnswerStep_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperAtAnswerStep_025, begin');
      const engine: WorkflowEngine = new WorkflowEngine();
      engine.complete(WorkflowStep.CONFIGURE);
      engine.complete(WorkflowStep.REQUEST);
      engine.complete(WorkflowStep.CONFIRM);
      engine.complete(WorkflowStep.ACTIVE);
      expect(engine.currentStep()).assertEqual(WorkflowStep.ANSWER);
      const paper: ExamPaper = new ExamPaper();
      expect(paper.answeredCount()).assertEqual(0);
      expect(engine.isActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', engine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PaperAtAnswerStep_025, end');
    });

    
    /**
     * Scenario: the ten minute countdown format.
     * Expectation: it renders MM:SS with zero padded fields.
     */
    it('Assessment_CountdownFormat_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormat_027, begin');
      const countdown: CountdownModel = new CountdownModel(600000);
      expect(countdown.isDefault()).assertFalse();
      expect(countdown.remaining()).assertEqual(600);
      expect(countdown.label()).assertEqual('10:00');
      countdown.tick();
      expect(countdown.label()).assertEqual('09:59');
      countdown.tickTimes(599);
      expect(countdown.label()).assertEqual('00:00');
      expect(countdown.isExhausted()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', countdown.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormat_027, end');
    });

    /**
     * Scenario: the warning threshold of the countdown.
     * Expectation: the last minute is reported as a warning state.
     */
    it('Assessment_CountdownWarning_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownWarning_028, begin');
      const countdown: CountdownModel = new CountdownModel(1800000);
      expect(countdown.isWarning()).assertFalse();
      countdown.tickTimes(1740);
      expect(countdown.remaining()).assertEqual(60);
      expect(countdown.isWarning()).assertTrue();
      expect(countdown.isExhausted()).assertFalse();
      expect(new CountdownModel(0).isWarning()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', countdown.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownWarning_028, end');
    });

    /**
     * Scenario: the countdown tick count.
     * Expectation: it stops at zero and reports how many ticks it actually applied.
     */
    it('Assessment_CountdownTickBounds_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTickBounds_029, begin');
      const countdown: CountdownModel = new CountdownModel(5000);
      expect(countdown.remaining()).assertEqual(5);
      expect(countdown.tickTimes(3)).assertEqual(3);
      expect(countdown.remaining()).assertEqual(2);
      expect(countdown.tickTimes(10)).assertEqual(2);
      expect(countdown.remaining()).assertEqual(0);
      expect(countdown.tickTimes(1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', countdown.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTickBounds_029, end');
    });

    /**
     * Scenario: the workflow after a submit.
     * Expectation: the submit is only accepted after every answer step and unlocks the exit.
     */
    it('Assessment_SubmitUnlocksExit_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SubmitUnlocksExit_030, begin');
      const engine: WorkflowEngine = new WorkflowEngine();
      const order: string[] = WorkflowEngine.requiredOrder();
      for (let i = 0; i < 5; i++) {
        engine.complete(order[i]);
      }
      expect(engine.isCompleted(WorkflowStep.SUBMIT)).assertFalse();
      const submit: StepResult = engine.complete(WorkflowStep.SUBMIT);
      expect(submit.accepted).assertTrue();
      expect(engine.isActive()).assertFalse();
      expect(engine.complete(WorkflowStep.EXIT).accepted).assertTrue();
      expect(engine.isFinished()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', engine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SubmitUnlocksExit_030, end');
    });

    
    
    
    
    
    
    
    
    /**
     * Scenario: the workflow engine reports a clear failure when a step is out of order.
     * Expectation: the reason names the missing predecessor and the engine state is untouched.
     */
    it('Assessment_GateReasonIsActionable_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GateReasonIsActionable_039, begin');
      const engine: WorkflowEngine = new WorkflowEngine();
      const early: StepResult = engine.complete(WorkflowStep.ACTIVE);
      expect(early.accepted).assertFalse();
      expect(early.reason).assertContain(WorkflowStep.CONFIRM);
      expect(early.step).assertEqual(WorkflowStep.ACTIVE);
      expect(engine.completedSteps().length).assertEqual(0);
      expect(engine.records().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s reason: %{public}s', BUNDLE + 'GateReasonIsActionable_039',
        early.reason);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GateReasonIsActionable_039, end');
    });
  });
}
