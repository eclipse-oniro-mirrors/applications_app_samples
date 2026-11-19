/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  getBundleName,
  logInfo,
  logError,
  sleepMs,
  launchEntryAbility,
  startAbilityByWant,
  buildEntryWant,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  waitForTextVisible,
  checkTextContent,
  checkComponentExists,
  checkComponentExistsByKey,
  pageComponentCount,
  tapComponentByText,
  measureElapsed,
  isWithinBudget,
  DELAY_AFTER_BACKGROUND,
  DELAY_AFTER_LAUNCH,
  DELAY_TOUCH_EVENT,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_TEXT_APPEAR,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_TEXT_KEY,
  INDEX_PAGE_PATH,
  ENTRY_ABILITY_NAME,
  BUNDLE_NAME
} from '../Shared/SharedDriver';

enum JourneyStep {
  COLD_LAUNCH = 'cold-launch',
  PAGE_RENDERED = 'page-rendered',
  TEXT_CLICKED = 'text-clicked',
  MOVED_BACKGROUND = 'moved-background',
  RETURNED_FOREGROUND = 'returned-foreground',
  TEXT_PRESERVED = 'text-preserved'
}

interface JourneyMilestone {
  step: JourneyStep;
  elapsedMs: number;
  detail: string;
}

interface JourneyReport {
  completedSteps: number;
  totalSteps: number;
  totalElapsedMs: number;
  finalText: string;
  passed: boolean;
}

class EndToEndJourney {
  private milestones: JourneyMilestone[] = [];
  private startedAt: number = 0;
  private finished: boolean = false;

  public begin(): void {
    this.milestones = [];
    this.startedAt = Date.now();
    this.finished = false;
  }

  public mark(step: JourneyStep, detail: string): JourneyMilestone {
    const milestone: JourneyMilestone = {
      step: step,
      elapsedMs: Date.now() - this.startedAt,
      detail: detail
    };
    this.milestones.push(milestone);
    return milestone;
  }

  public getMilestoneCount(): number {
    return this.milestones.length;
  }

  public hasStep(step: JourneyStep): boolean {
    return this.indexOfStep(step) >= 0;
  }

  public indexOfStep(step: JourneyStep): number {
    for (let i = 0; i < this.milestones.length; i++) {
      if (this.milestones[i].step === step) {
        return i;
      }
    }
    return -1;
  }

  public getStepAt(index: number): JourneyStep | null {
    if (index < 0 || index >= this.milestones.length) {
      return null;
    }
    return this.milestones[index].step;
  }

  public getElapsedAt(index: number): number {
    if (index < 0 || index >= this.milestones.length) {
      return -1;
    }
    return this.milestones[index].elapsedMs;
  }

  public getDetailAt(index: number): string {
    if (index < 0 || index >= this.milestones.length) {
      return '';
    }
    return this.milestones[index].detail;
  }

  public getDetailLengthAt(index: number): number {
    return this.getDetailAt(index).length;
  }

  public complete(finalText: string): JourneyReport {
    this.finished = true;
    const uniqueSteps: JourneyStep[] = [];
    for (let i = 0; i < this.milestones.length; i++) {
      if (uniqueSteps.indexOf(this.milestones[i].step) < 0) {
        uniqueSteps.push(this.milestones[i].step);
      }
    }
    const expected: number = 6;
    return {
      completedSteps: uniqueSteps.length,
      totalSteps: expected,
      totalElapsedMs: Date.now() - this.startedAt,
      finalText: finalText,
      passed: uniqueSteps.length === expected && this.isMonotonic() && finalText === PAGE_TEXT_CLICKED
    };
  }

  public isMonotonic(): boolean {
    for (let i = 1; i < this.milestones.length; i++) {
      if (this.milestones[i].elapsedMs < this.milestones[i - 1].elapsedMs) {
        return false;
      }
    }
    return true;
  }

  public isFinished(): boolean {
    return this.finished;
  }

  public getFinalText(): string {
    if (this.milestones.length === 0) {
      return '';
    }
    return this.milestones[this.milestones.length - 1].detail;
  }
}

class JourneyExpectation {
  private readonly expectedOrder: JourneyStep[] = [
    JourneyStep.COLD_LAUNCH,
    JourneyStep.PAGE_RENDERED,
    JourneyStep.TEXT_CLICKED,
    JourneyStep.MOVED_BACKGROUND,
    JourneyStep.RETURNED_FOREGROUND,
    JourneyStep.TEXT_PRESERVED
  ];

  public matches(step: JourneyStep, position: number): boolean {
    if (position < 0 || position >= this.expectedOrder.length) {
      return false;
    }
    return this.expectedOrder[position] === step;
  }

  public expectedLength(): number {
    return this.expectedOrder.length;
  }

  public expectedAt(position: number): JourneyStep | null {
    if (position < 0 || position >= this.expectedOrder.length) {
      return null;
    }
    return this.expectedOrder[position];
  }

  public indexOf(step: JourneyStep): number {
    return this.expectedOrder.indexOf(step);
  }
}

class LaunchChainModel {
  private readonly wantBundle: string;
  private readonly wantAbility: string;
  private reuses: number = 0;
  private launches: number = 0;

  constructor(bundle: string, ability: string) {
    this.wantBundle = bundle;
    this.wantAbility = ability;
  }

  public isSelfConsistent(): boolean {
    return this.wantBundle.length > 0 && this.wantAbility.length > 0;
  }

  public matchesBundle(candidate: string): boolean {
    return candidate === this.wantBundle;
  }

  public matchesAbility(candidate: string): boolean {
    return candidate === this.wantAbility;
  }

  public countLaunch(): number {
    this.launches++;
    return this.launches;
  }

  public countReuse(): number {
    this.reuses++;
    return this.reuses;
  }

  public getLaunches(): number {
    return this.launches;
  }

  public getReuses(): number {
    return this.reuses;
  }

  public getWantBundle(): string {
    return this.wantBundle;
  }

  public getWantAbility(): string {
    return this.wantAbility;
  }
}

class TapOutcomeModel {
  private tapsAttempted: number = 0;
  private tapsAccepted: number = 0;
  private transitions: number = 0;
  private currentText: string = PAGE_TEXT_INITIAL;

  public attemptTap(): number {
    this.tapsAttempted++;
    return this.tapsAttempted;
  }

  public acceptTap(): boolean {
    this.tapsAccepted++;
    if (this.currentText === PAGE_TEXT_INITIAL) {
      this.currentText = PAGE_TEXT_CLICKED;
      this.transitions++;
      return true;
    }
    return false;
  }

  public getTapsAttempted(): number {
    return this.tapsAttempted;
  }

  public getTapsAccepted(): number {
    return this.tapsAccepted;
  }

  public getTransitions(): number {
    return this.transitions;
  }

  public getCurrentText(): string {
    return this.currentText;
  }

  public resetText(): void {
    this.currentText = PAGE_TEXT_INITIAL;
  }
}

async function readPageText(driver: Driver): Promise<string> {
  const clicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
  if (clicked) {
    return PAGE_TEXT_CLICKED;
  }
  const initial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
  if (initial) {
    return PAGE_TEXT_INITIAL;
  }
  return '';
}

export default function abilityEndToEndTest(): void {
  describe('AbilityEndToEndTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      logInfo('AbilityEndToEndTest beforeAll: cold launching EntryAbility');
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver);
        await ensureIndexPageInitial(driver);
      } catch (error) {
        logError(`AbilityEndToEndTest beforeAll error: ${error}`);
      }
    })

    afterAll(async () => {
      try {
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
      } catch (error) {
        logError(`AbilityEndToEndTest afterAll error: ${error}`);
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_0100
     * @tc.name testE2EFullJourneyColdStartToWelcomePersisted
     * @tc.desc Verify cold start, render, tap, background, foreground keeps Welcome and all six steps recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2EFullJourneyColdStartToWelcomePersisted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const journey: EndToEndJourney = new EndToEndJourney();
          journey.begin();
          await launchEntryAbility();
          journey.mark(JourneyStep.COLD_LAUNCH, ENTRY_ABILITY_NAME);
          expect(journey.hasStep(JourneyStep.COLD_LAUNCH)).assertTrue();

          const rendered: boolean = await waitForIndexPageStable(driver);
          expect(rendered).assertTrue();
          journey.mark(JourneyStep.PAGE_RENDERED, await readPageText(driver));

          const tapped: boolean = await tapComponentByText(driver, PAGE_TEXT_INITIAL) ||
            await tapComponentByText(driver, PAGE_TEXT_CLICKED);
          expect(tapped).assertTrue();
          await sleepMs(DELAY_TOUCH_EVENT);
          const welcomed: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
          expect(welcomed).assertTrue();
          journey.mark(JourneyStep.TEXT_CLICKED, PAGE_TEXT_CLICKED);

          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          journey.mark(JourneyStep.MOVED_BACKGROUND, 'background');

          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          const returned: boolean = await waitForIndexPageStable(driver);
          expect(returned).assertTrue();
          journey.mark(JourneyStep.RETURNED_FOREGROUND, 'foreground');

          const preserved: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_ABILITY_LAUNCH);
          expect(preserved).assertTrue();
          journey.mark(JourneyStep.TEXT_PRESERVED, PAGE_TEXT_CLICKED);

          const report: JourneyReport = journey.complete(PAGE_TEXT_CLICKED);
          expect(report.completedSteps).assertEqual(6);
          expect(report.totalSteps).assertEqual(6);
          expect(report.passed).assertTrue();
          expect(report.finalText).assertEqual(PAGE_TEXT_CLICKED);
          expect(journey.getFinalText()).assertEqual(PAGE_TEXT_CLICKED);
          expect(journey.getDetailAt(5)).assertEqual(PAGE_TEXT_CLICKED);
          expect(journey.getDetailLengthAt(5)).assertEqual(PAGE_TEXT_CLICKED.length);
          expect(journey.isMonotonic()).assertTrue();
          logInfo(`testE2EFullJourneyColdStartToWelcomePersisted: elapsed ${report.totalElapsedMs} ms`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_0200
     * @tc.name testE2EStepOrderMatchesExpectation
     * @tc.desc Verify the six recorded journey steps match the expected execution order exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2EStepOrderMatchesExpectation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const journey: EndToEndJourney = new EndToEndJourney();
          const expectation: JourneyExpectation = new JourneyExpectation();
          journey.begin();
          journey.mark(JourneyStep.COLD_LAUNCH, 'launch');
          journey.mark(JourneyStep.PAGE_RENDERED, 'render');
          journey.mark(JourneyStep.TEXT_CLICKED, 'click');
          journey.mark(JourneyStep.MOVED_BACKGROUND, 'bg');
          journey.mark(JourneyStep.RETURNED_FOREGROUND, 'fg');
          journey.mark(JourneyStep.TEXT_PRESERVED, 'keep');
          expect(journey.getMilestoneCount()).assertEqual(6);
          expect(expectation.expectedLength()).assertEqual(6);
          for (let i = 0; i < journey.getMilestoneCount(); i++) {
            const step: JourneyStep | null = journey.getStepAt(i);
            expect(step !== null && expectation.matches(step, i)).assertTrue();
            expect(expectation.indexOf(step as JourneyStep)).assertEqual(i);
          }
          const overflowStep: JourneyStep | null = journey.getStepAt(6);
          expect(overflowStep === null).assertTrue();
          const overflowExpected: JourneyStep | null = expectation.expectedAt(6);
          expect(overflowExpected === null).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_0300
     * @tc.name testE2EJourneyElapsedMonotonic
     * @tc.desc Verify milestone elapsed values never decrease and total elapsed exceeds the first milestone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2EJourneyElapsedMonotonic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const journey: EndToEndJourney = new EndToEndJourney();
          journey.begin();
          journey.mark(JourneyStep.COLD_LAUNCH, 'a');
          await sleepMs(15);
          journey.mark(JourneyStep.PAGE_RENDERED, 'b');
          await sleepMs(15);
          journey.mark(JourneyStep.TEXT_CLICKED, 'c');
          expect(journey.getElapsedAt(0) >= 0).assertTrue();
          expect(journey.getElapsedAt(2) > journey.getElapsedAt(0)).assertTrue();
          expect(journey.isMonotonic()).assertTrue();
          expect(journey.getElapsedAt(-1)).assertEqual(-1);
          expect(journey.getElapsedAt(3)).assertEqual(-1);
          const report: JourneyReport = journey.complete(PAGE_TEXT_CLICKED);
          expect(report.totalElapsedMs >= journey.getElapsedAt(2)).assertTrue();
          expect(report.passed).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_0400
     * @tc.name testE2EJourneyReportRequiresWelcome
     * @tc.desc Verify a journey ending on Hello World is reported as not passed even with six steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2EJourneyReportRequiresWelcome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const journey: EndToEndJourney = new EndToEndJourney();
          journey.begin();
          journey.mark(JourneyStep.COLD_LAUNCH, 'a');
          journey.mark(JourneyStep.PAGE_RENDERED, 'b');
          journey.mark(JourneyStep.TEXT_CLICKED, 'c');
          journey.mark(JourneyStep.MOVED_BACKGROUND, 'd');
          journey.mark(JourneyStep.RETURNED_FOREGROUND, 'e');
          journey.mark(JourneyStep.TEXT_PRESERVED, PAGE_TEXT_INITIAL);
          const report: JourneyReport = journey.complete(PAGE_TEXT_INITIAL);
          expect(report.completedSteps).assertEqual(6);
          expect(report.finalText).assertEqual(PAGE_TEXT_INITIAL);
          expect(report.passed).assertFalse();
          expect(journey.isFinished()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_0500
     * @tc.name testE2ELaunchChainWantFields
     * @tc.desc Verify built want carries the runtime bundle name and EntryAbility name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2ELaunchChainWantFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: LaunchChainModel = new LaunchChainModel(getBundleName(), ENTRY_ABILITY_NAME);
          expect(model.isSelfConsistent()).assertTrue();
          expect(model.matchesBundle(BUNDLE_NAME)).assertTrue();
          expect(model.matchesAbility(ENTRY_ABILITY_NAME)).assertTrue();
          expect(model.getWantAbility()).assertEqual(ENTRY_ABILITY_NAME);
          expect(model.getWantBundle().length > 0).assertTrue();
          expect(model.matchesAbility('EntryBackupAbility')).assertFalse();
          expect(model.countLaunch()).assertEqual(1);
          expect(model.countReuse()).assertEqual(1);
          expect(model.getLaunches()).assertEqual(1);
          expect(model.getReuses()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_0600
     * @tc.name testE2ETapOutcomeSingleTransition
     * @tc.desc Verify tap model moves Hello World to Welcome once and a second accepted tap adds no transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2ETapOutcomeSingleTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: TapOutcomeModel = new TapOutcomeModel();
          expect(model.getCurrentText()).assertEqual(PAGE_TEXT_INITIAL);
          model.attemptTap();
          expect(model.acceptTap()).assertTrue();
          expect(model.getCurrentText()).assertEqual(PAGE_TEXT_CLICKED);
          model.attemptTap();
          expect(model.acceptTap()).assertFalse();
          expect(model.getTapsAttempted()).assertEqual(2);
          expect(model.getTapsAccepted()).assertEqual(2);
          expect(model.getTransitions()).assertEqual(1);
          model.resetText();
          expect(model.getCurrentText()).assertEqual(PAGE_TEXT_INITIAL);
          expect(model.getTransitions()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_0700
     * @tc.name testE2EHomepageRenderAssertions
     * @tc.desc Verify rendered homepage exposes Text component, HelloWorld key and positive component count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2EHomepageRenderAssertions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await sleepMs(DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          expect(await checkComponentExists(driver, 'Text')).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
          const count: number = await pageComponentCount(driver);
          expect(count > 0).assertTrue();
          const text: string = await readPageText(driver);
          expect(text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED).assertTrue();
          expect(INDEX_PAGE_PATH).assertEqual('pages/Index');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_0800
     * @tc.name testE2EColdLaunchRenderBudget
     * @tc.desc Verify startAbility to stable page completes within five times the launch timeout budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2EColdLaunchRenderBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const startTime: number = Date.now();
          await startAbilityByWant(buildEntryWant());
          const stable: boolean = await waitForIndexPageStable(driver);
          const elapsed: number = measureElapsed(startTime);
          expect(stable).assertTrue();
          expect(elapsed > 0).assertTrue();
          expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH * 5)).assertTrue();
          logInfo(`testE2EColdLaunchRenderBudget: elapsed ${elapsed} ms`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_0900
     * @tc.name testE2ETextClickChangesPageContent
     * @tc.desc Verify tapping the page text by content produces the Welcome message visible on screen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2ETextClickChangesPageContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await sleepMs(DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const beforeText: string = await readPageText(driver);
          const tapTarget: string = beforeText === PAGE_TEXT_CLICKED ? PAGE_TEXT_CLICKED : PAGE_TEXT_INITIAL;
          const tapped: boolean = await tapComponentByText(driver, tapTarget);
          expect(tapped).assertTrue();
          await sleepMs(DELAY_TOUCH_EVENT);
          const afterText: string = await readPageText(driver);
          expect(afterText).assertEqual(PAGE_TEXT_CLICKED);
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_1000
     * @tc.name testE2EBackgroundForegroundReadsWelcomeAgain
     * @tc.desc Verify Welcome text is read again after a background and foreground cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2EBackgroundForegroundReadsWelcomeAgain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(await waitForIndexPageStable(driver)).assertTrue();
          expect(await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR)).assertTrue();
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
          const text: string = await readPageText(driver);
          expect(text).assertEqual(PAGE_TEXT_CLICKED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_1100
     * @tc.name testE2EPageStateSurvivesTwoBackgroundCycles
     * @tc.desc Verify Welcome text is preserved after two consecutive background and foreground cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2EPageStateSurvivesTwoBackgroundCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(await waitForIndexPageStable(driver)).assertTrue();
          for (let cycle = 1; cycle <= 2; cycle++) {
            await doAbilityBackground();
            await sleepMs(DELAY_AFTER_BACKGROUND);
            await doAbilityForeground();
            await sleepMs(DELAY_AFTER_BACKGROUND);
            expect(await waitForIndexPageStable(driver)).assertTrue();
            expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
            logInfo(`testE2EPageStateSurvivesTwoBackgroundCycles: cycle ${cycle} preserved`);
          }
          const count: number = await pageComponentCount(driver);
          expect(count > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYE2E_1200
     * @tc.name testE2ERelaunchRestoresHomepage
     * @tc.desc Verify relaunching after background restores a readable homepage with Text component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testE2ERelaunchRestoresHomepage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await launchEntryAbility();
          await sleepMs(DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          expect(await checkComponentExists(driver, 'Text')).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
          const text: string = await readPageText(driver);
          expect(text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED).assertTrue();
          expect(await checkTextContent(driver, text)).assertTrue();
        } finally {
          done();
        }
      })
  })
}
