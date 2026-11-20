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
import {
  getDriver,
  serializedDelay,
  ensureHomePage,
  backToHome,
  openCreateIssuePage,
  openIssueListPage,
  openIntroductionPage,
  pressAndWait,
  waitForAnyText,
  componentCount,
  KEY_BACK,
  DELAY_PAGE_SWITCH,
  TIMEOUT_PAGE_RENDER,
  TOLERANCE_COMPONENT_COUNT,
  TEXT_CREATE_ISSUE_CANDIDATES,
  TEXT_FORM_CANDIDATES,
  TEXT_HOME_HEADER_CANDIDATES,
  TEXT_ISSUE_LIST_CANDIDATES,
  TEXT_INTRODUCTION_CANDIDATES,
} from '../Shared/BetaClubDriver';

const PAGE_HOME: string = 'home';

const PAGE_CREATE: string = 'create';

const PAGE_LIST: string = 'list';

const PAGE_DETAIL: string = 'detail';

const PAGE_INTRO: string = 'intro';

interface JourneyStep {
  name: string;
  page: string;
  canSkip: boolean;
}

// Models a scripted user journey with forward/back navigation
class UserJourney {
  private steps: JourneyStep[] = [];
  private current: number = 0;
  private completed: boolean = false;
  private aborted: boolean = false;

  public addStep(name: string, page: string, canSkip: boolean = false): boolean {
    if (name.length === 0 || page.length === 0) {
      return false;
    }
    this.steps.push({ name: name, page: page, canSkip: canSkip });
    return true;
  }

  public currentStep(): JourneyStep | undefined {
    return this.steps.length === 0 || this.current >= this.steps.length ?
      undefined : this.steps[this.current];
  }

  public currentPage(): string {
    const step = this.currentStep();
    return step === undefined ? '' : step.page;
  }

  public next(): boolean {
    if (this.aborted || this.completed) {
      return false;
    }
    if (this.current >= this.steps.length - 1) {
      this.completed = true;
      return false;
    }
    this.current++;
    return true;
  }

  public skip(): boolean {
    const step = this.currentStep();
    if (step === undefined || !step.canSkip || this.aborted) {
      return false;
    }
    return this.next();
  }

  public back(): boolean {
    if (this.aborted || this.current <= 0) {
      return false;
    }
    this.current--;
    this.completed = false;
    return true;
  }

  public abort(): void {
    this.aborted = true;
  }

  public isCompleted(): boolean {
    return this.completed;
  }

  public isAborted(): boolean {
    return this.aborted;
  }

  public getIndex(): number {
    return this.current;
  }

  public size(): number {
    return this.steps.length;
  }

  public progress(): number {
    if (this.steps.length === 0) {
      return 0;
    }
    return Math.round((this.current + (this.completed ? 1 : 0)) * 100 / this.steps.length);
  }

  public visitedPages(): string[] {
    const pages: string[] = [];
    for (let i = 0; i <= this.current && i < this.steps.length; i++) {
      pages.push(this.steps[i].page);
    }
    return pages;
  }
}

// Provides the three home page scenarios as reusable scripts
class ScenarioCatalog {
  public static createIssue(): UserJourney {
    const journey = new UserJourney();
    journey.addStep('open home', PAGE_HOME);
    journey.addStep('open create form', PAGE_CREATE);
    journey.addStep('attach media', PAGE_CREATE, true);
    journey.addStep('submit issue', PAGE_CREATE);
    return journey;
  }

  public static browseList(): UserJourney {
    const journey = new UserJourney();
    journey.addStep('open home', PAGE_HOME);
    journey.addStep('open issue list', PAGE_LIST);
    journey.addStep('open detail', PAGE_DETAIL, true);
    return journey;
  }

  public static readIntroduction(): UserJourney {
    const journey = new UserJourney();
    journey.addStep('open home', PAGE_HOME);
    journey.addStep('open introduction', PAGE_INTRO);
    return journey;
  }

  public static scenarioNames(): string[] {
    return ['createIssue', 'browseList', 'readIntroduction'];
  }
}

// Tracks form completion for the create-issue scenario
class FormFillSession {
  private description: string = '';
  private probabilityId: string = '';
  private issueType: string = '';
  private faultTime: string = '';
  private attachments: number = 0;

  public fillDescription(value: string): void {
    this.description = value;
  }

  public fillProbability(id: string): void {
    this.probabilityId = id;
  }

  public fillIssueType(type: string): void {
    this.issueType = type;
  }

  public fillFaultTime(value: string): void {
    this.faultTime = value;
  }

  public addAttachment(): boolean {
    if (this.attachments >= 4) {
      return false;
    }
    this.attachments++;
    return true;
  }

  public removeAttachment(): boolean {
    if (this.attachments <= 0) {
      return false;
    }
    this.attachments--;
    return true;
  }

  public getAttachmentCount(): number {
    return this.attachments;
  }

  public missingFields(): string[] {
    const missing: string[] = [];
    if (this.description.length === 0) {
      missing.push('description');
    }
    if (this.probabilityId.length === 0) {
      missing.push('probability');
    }
    if (this.issueType.length === 0) {
      missing.push('type');
    }
    if (this.faultTime.length !== 14) {
      missing.push('faultTime');
    }
    return missing;
  }

  public isReady(): boolean {
    return this.missingFields().length === 0;
  }

  public getDescriptionLength(): number {
    return this.description.length;
  }

  public reset(): void {
    this.description = '';
    this.probabilityId = '';
    this.issueType = '';
    this.faultTime = '';
    this.attachments = 0;
  }
}

// Collects pass/fail results for a scenario run
class ScenarioResult {
  private checks: string[] = [];
  private failureItems: string[] = [];
  private startedAt: number = 0;
  private finishedAt: number = 0;

  public start(now: number = Date.now()): void {
    this.startedAt = now;
    this.finishedAt = 0;
  }

  public finish(now: number = Date.now()): void {
    this.finishedAt = now;
  }

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public getCheckCount(): number {
    return this.checks.length;
  }

  public getFailures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.failureItems.length === 0 && this.checks.length > 0;
  }

  public getDuration(): number {
    if (this.startedAt === 0 || this.finishedAt === 0) {
      return 0;
    }
    return this.finishedAt - this.startedAt;
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
    this.startedAt = 0;
    this.finishedAt = 0;
  }
}

export default function userScenariosTest() {
  describe('UserScenarios_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 300);
      await ensureHomePage(driver);
    });

    afterAll(async () => {
      await backToHome(driver, 3);
    });

    it('journey_should_walk_all_steps', 0, () => {
      const journey = ScenarioCatalog.readIntroduction();
      expect(journey.size()).assertEqual(2);
      expect(journey.currentPage()).assertEqual(PAGE_HOME);
      expect(journey.getIndex()).assertEqual(0);
      expect(journey.next()).assertTrue();
      expect(journey.currentPage()).assertEqual(PAGE_INTRO);
      expect(journey.next()).assertFalse();
      expect(journey.isCompleted()).assertTrue();
      expect(journey.progress()).assertEqual(100);
      expect(journey.visitedPages()).assertDeepEquals([PAGE_HOME, PAGE_INTRO]);
    });

    it('journey_should_support_back_navigation', 0, () => {
      const journey = ScenarioCatalog.browseList();
      journey.next();
      expect(journey.currentPage()).assertEqual(PAGE_LIST);
      expect(journey.back()).assertTrue();
      expect(journey.currentPage()).assertEqual(PAGE_HOME);
      expect(journey.back()).assertFalse();
      expect(journey.getIndex()).assertEqual(0);
      expect(journey.isCompleted()).assertFalse();
    });

    it('journey_should_respect_skippable_steps', 0, () => {
      const journey = ScenarioCatalog.createIssue();
      expect(journey.size()).assertEqual(4);
      journey.next();
      expect(journey.currentPage()).assertEqual(PAGE_CREATE);
      // The create form step is mandatory and cannot be skipped
      expect(journey.skip()).assertFalse();
      journey.next();
      expect(journey.getIndex()).assertEqual(2);
      // The attachment step is optional and can be skipped
      expect(journey.skip()).assertTrue();
      expect(journey.getIndex()).assertEqual(3);
      expect(journey.currentPage()).assertEqual(PAGE_CREATE);
      journey.next();
      expect(journey.isCompleted()).assertTrue();
    });

    it('journey_should_handle_abort', 0, () => {
      const journey = ScenarioCatalog.browseList();
      journey.next();
      journey.abort();
      expect(journey.isAborted()).assertTrue();
      expect(journey.next()).assertFalse();
      expect(journey.skip()).assertFalse();
      expect(journey.back()).assertFalse();
      expect(journey.getIndex()).assertEqual(1);
    });

    it('journey_should_reject_invalid_steps', 0, () => {
      const journey = new UserJourney();
      expect(journey.addStep('', PAGE_HOME)).assertFalse();
      expect(journey.addStep('name', '')).assertFalse();
      expect(journey.size()).assertEqual(0);
      expect(journey.currentStep() === undefined).assertTrue();
      expect(journey.currentPage()).assertEqual('');
      expect(journey.progress()).assertEqual(0);
      expect(journey.next()).assertFalse();
    });

    it('form_session_should_require_all_fields', 0, () => {
      const session = new FormFillSession();
      expect(session.isReady()).assertFalse();
      expect(session.missingFields().length).assertEqual(4);
      session.fillDescription('screen flickers');
      session.fillProbability('3');
      session.fillIssueType('issue');
      session.fillFaultTime('20260101120000');
      expect(session.isReady()).assertTrue();
      expect(session.missingFields().length).assertEqual(0);
      expect(session.getDescriptionLength()).assertEqual(15);
    });

    it('form_session_should_report_each_missing_field', 0, () => {
      const session = new FormFillSession();
      session.fillProbability('1');
      const missing = session.missingFields();
      expect(missing.includes('description')).assertTrue();
      expect(missing.includes('probability')).assertFalse();
      expect(missing.includes('type')).assertTrue();
      expect(missing.includes('faultTime')).assertTrue();
      expect(missing.length).assertEqual(3);
    });

    it('form_session_should_limit_attachments', 0, () => {
      const session = new FormFillSession();
      for (let i = 0; i < 4; i++) {
        expect(session.addAttachment()).assertTrue();
      }
      expect(session.getAttachmentCount()).assertEqual(4);
      expect(session.addAttachment()).assertFalse();
      expect(session.removeAttachment()).assertTrue();
      expect(session.getAttachmentCount()).assertEqual(3);
      session.reset();
      expect(session.getAttachmentCount()).assertEqual(0);
      expect(session.removeAttachment()).assertFalse();
    });

    it('form_session_reset_should_clear_fields', 0, () => {
      const session = new FormFillSession();
      session.fillDescription('text');
      session.fillProbability('2');
      session.fillIssueType('issue');
      session.fillFaultTime('20260101120000');
      session.addAttachment();
      expect(session.isReady()).assertTrue();
      session.reset();
      expect(session.isReady()).assertFalse();
      expect(session.missingFields().length).assertEqual(4);
      expect(session.getDescriptionLength()).assertEqual(0);
    });

    it('scenario_result_should_aggregate_checks', 0, () => {
      const result = new ScenarioResult();
      result.start(1000);
      result.check('home visible', true);
      result.check('list visible', true);
      result.finish(1500);
      expect(result.getCheckCount()).assertEqual(2);
      expect(result.isPassed()).assertTrue();
      expect(result.getFailures().length).assertEqual(0);
      expect(result.getDuration()).assertEqual(500);
    });

    it('scenario_result_should_track_failures', 0, () => {
      const result = new ScenarioResult();
      result.check('home visible', true);
      result.check('detail visible', false);
      expect(result.isPassed()).assertFalse();
      expect(result.getFailures()).assertDeepEquals(['detail visible']);
      result.reset();
      expect(result.getCheckCount()).assertEqual(0);
      expect(result.isPassed()).assertFalse();
      expect(result.getDuration()).assertEqual(0);
    });

    it('scenario_catalog_should_expose_all_scripts', 0, () => {
      const names = ScenarioCatalog.scenarioNames();
      expect(names.length).assertEqual(3);
      expect(names.includes('createIssue')).assertTrue();
      expect(ScenarioCatalog.createIssue().size()).assertEqual(4);
      expect(ScenarioCatalog.browseList().size()).assertEqual(3);
      expect(ScenarioCatalog.readIntroduction().size()).assertEqual(2);
    });

    it('create_issue_scenario_should_reach_form_on_device', 0, async () => {
      const journey = ScenarioCatalog.createIssue();
      const result = new ScenarioResult();
      result.start();
      await ensureHomePage(driver);
      result.check('home', journey.currentPage() === PAGE_HOME);
      journey.next();
      const opened = await openCreateIssuePage(driver);
      result.check('create form', opened);
      const formVisible = await waitForAnyText(driver, TEXT_FORM_CANDIDATES, TIMEOUT_PAGE_RENDER);
      result.check('form rendered', formVisible !== '');
      await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
      await backToHome(driver, 2);
      result.finish();
      expect(result.getCheckCount()).assertEqual(3);
      expect(result.getFailures().length).assertEqual(0);
      expect(result.getDuration()).assertLargerOrEqual(0);
    });

    it('browse_and_read_scenarios_should_return_home', 0, async () => {
      const result = new ScenarioResult();
      await ensureHomePage(driver);
      const listOpened = await openIssueListPage(driver);
      result.check('list', listOpened);
      const listVisible = await waitForAnyText(driver, TEXT_ISSUE_LIST_CANDIDATES, TIMEOUT_PAGE_RENDER);
      result.check('list text', listVisible !== '');
      await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
      const introOpened = await openIntroductionPage(driver);
      result.check('intro', introOpened);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
      const homeVisible = await waitForAnyText(driver, TEXT_HOME_HEADER_CANDIDATES, TIMEOUT_PAGE_RENDER);
      result.check('home restored', homeVisible !== '');
      expect(result.getCheckCount()).assertEqual(4);
      expect(result.getFailures().length).assertEqual(0);
    });

    it('repeated_scenarios_should_keep_layout_stable', 0, async () => {
      await ensureHomePage(driver);
      const before = await componentCount(driver);
      for (let i = 0; i < 2; i++) {
        await openIntroductionPage(driver);
        await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
        await ensureHomePage(driver);
      }
      const after = await componentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      const intro = await waitForAnyText(driver, TEXT_INTRODUCTION_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(intro !== '').assertTrue();
    });
  });
}

