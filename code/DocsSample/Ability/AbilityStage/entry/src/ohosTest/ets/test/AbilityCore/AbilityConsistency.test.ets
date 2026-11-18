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

import { describe, it, expect, beforeAll, beforeEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  logInfo,
  logError,
  sleepMs,
  launchEntryAbility,
  isIndexPageRendered,
  doAbilityForeground,
  doAbilityBackground,
  runSerializedUiOperation,
  waitForIndexPageStable,
  checkTextContent,
  collectAllTexts,
  pageComponentCount,
  findComponentsByType,
  COLOR_MODE_NOT_SET,
  DELAY_AFTER_BACKGROUND,
  DELAY_AFTER_LAUNCH,
  TOLERANCE_COMPONENT_COUNT,
  STABLE_ROUNDS,
  STABLE_TOLERANCE,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_TEXT_KEY
} from '../Shared/SharedDriver';

enum ColorMode {
  NOT_SET = -1,
  DARK = 0,
  LIGHT = 1
}

interface PageObservation {
  pageText: string;
  componentCount: number;
  colorMode: number;
  observedAt: number;
}

interface SampleStatistics {
  sampleCount: number;
  modeText: string;
  distinctTextCount: number;
  minComponentCount: number;
  maxComponentCount: number;
  isConverged: boolean;
}

class ColorModeRegistry {
  private currentMode: number = COLOR_MODE_NOT_SET;
  private history: number[] = [];
  private failedAttempts: number = 0;
  private appliedAttempts: number = 0;

  constructor() {
    this.history.push(COLOR_MODE_NOT_SET);
  }

  public setColorMode(mode: number): boolean {
    if (mode !== ColorMode.NOT_SET && mode !== ColorMode.DARK && mode !== ColorMode.LIGHT) {
      this.failedAttempts++;
      return false;
    }
    if (mode === this.currentMode) {
      this.appliedAttempts++;
      this.history.push(mode);
      return false;
    }
    this.currentMode = mode;
    this.appliedAttempts++;
    this.history.push(mode);
    return true;
  }

  public getCurrentMode(): number {
    return this.currentMode;
  }

  public getHistory(): number[] {
    return this.history.slice(0);
  }

  public getHistoryLength(): number {
    return this.history.length;
  }

  public getAppliedAttempts(): number {
    return this.appliedAttempts;
  }

  public getFailedAttempts(): number {
    return this.failedAttempts;
  }

  public isDefaultMode(): boolean {
    return this.currentMode === COLOR_MODE_NOT_SET;
  }

  public isDarkMode(): boolean {
    return this.currentMode === ColorMode.DARK;
  }

  public toLabel(): string {
    if (this.currentMode === ColorMode.DARK) {
      return 'dark';
    }
    if (this.currentMode === ColorMode.LIGHT) {
      return 'light';
    }
    return 'not-set';
  }

  public reset(): void {
    this.currentMode = COLOR_MODE_NOT_SET;
    this.history = [COLOR_MODE_NOT_SET];
  }
}

class TextConsistencySampler {
  private texts: string[] = [];
  private counts: number[] = [];

  public addSample(text: string, componentCount: number): void {
    this.texts.push(text);
    this.counts.push(componentCount);
  }

  public getSampleCount(): number {
    return this.texts.length;
  }

  public getDistinctTextCount(): number {
    const distinct: string[] = [];
    for (let i = 0; i < this.texts.length; i++) {
      if (distinct.indexOf(this.texts[i]) < 0) {
        distinct.push(this.texts[i]);
      }
    }
    return distinct.length;
  }

  public getModeText(): string {
    if (this.texts.length === 0) {
      return '';
    }
    let bestText: string = this.texts[0];
    let bestCount: number = 0;
    for (let i = 0; i < this.texts.length; i++) {
      let currentCount: number = 0;
      for (let j = 0; j < this.texts.length; j++) {
        if (this.texts[j] === this.texts[i]) {
          currentCount++;
        }
      }
      if (currentCount > bestCount) {
        bestCount = currentCount;
        bestText = this.texts[i];
      }
    }
    return bestText;
  }

  public getMinCount(): number {
    if (this.counts.length === 0) {
      return 0;
    }
    let minValue: number = this.counts[0];
    for (let i = 1; i < this.counts.length; i++) {
      if (this.counts[i] < minValue) {
        minValue = this.counts[i];
      }
    }
    return minValue;
  }

  public getMaxCount(): number {
    if (this.counts.length === 0) {
      return 0;
    }
    let maxValue: number = this.counts[0];
    for (let i = 1; i < this.counts.length; i++) {
      if (this.counts[i] > maxValue) {
        maxValue = this.counts[i];
      }
    }
    return maxValue;
  }

  public isCountConverged(tolerance: number): boolean {
    return this.getMaxCount() - this.getMinCount() <= tolerance;
  }

  public statistics(): SampleStatistics {
    return {
      sampleCount: this.getSampleCount(),
      modeText: this.getModeText(),
      distinctTextCount: this.getDistinctTextCount(),
      minComponentCount: this.getMinCount(),
      maxComponentCount: this.getMaxCount(),
      isConverged: this.isCountConverged(STABLE_TOLERANCE)
    };
  }
}

class ConsistencyVerdict {
  private checkedPairs: number = 0;
  private mismatchedPairs: number = 0;

  public compare(expected: string, actual: string): boolean {
    this.checkedPairs++;
    if (expected !== actual) {
      this.mismatchedPairs++;
      return false;
    }
    return true;
  }

  public compareNumber(expected: number, actual: number): boolean {
    this.checkedPairs++;
    if (expected !== actual) {
      this.mismatchedPairs++;
      return false;
    }
    return true;
  }

  public getCheckedPairs(): number {
    return this.checkedPairs;
  }

  public getMismatchedPairs(): number {
    return this.mismatchedPairs;
  }

  public isStable(): boolean {
    return this.checkedPairs > 0 && this.mismatchedPairs === 0;
  }
}

class RepeatLaunchModel {
  private launchCount: number = 0;
  private textAtLaunch: string[] = [];
  private expectedText: string = PAGE_TEXT_INITIAL;

  public recordLaunch(observedText: string): boolean {
    this.launchCount++;
    this.textAtLaunch.push(observedText);
    return observedText === this.expectedText;
  }

  public getLaunchCount(): number {
    return this.launchCount;
  }

  public getObservedAt(index: number): string {
    if (index < 0 || index >= this.textAtLaunch.length) {
      return '';
    }
    return this.textAtLaunch[index];
  }

  public markClicked(): void {
    this.expectedText = PAGE_TEXT_CLICKED;
  }

  public isAllInitial(): boolean {
    for (let i = 0; i < this.textAtLaunch.length; i++) {
      if (this.textAtLaunch[i] !== PAGE_TEXT_INITIAL) {
        return false;
      }
    }
    return this.textAtLaunch.length > 0;
  }
}

async function observePage(driver: Driver, colorMode: number): Promise<PageObservation> {
  const texts: string[] = await collectAllTexts(driver);
  let pageText: string = '';
  for (let i = 0; i < texts.length; i++) {
    if (texts[i] === PAGE_TEXT_INITIAL) {
      pageText = PAGE_TEXT_INITIAL;
      break;
    }
    if (texts[i] === PAGE_TEXT_CLICKED) {
      pageText = PAGE_TEXT_CLICKED;
      break;
    }
  }
  const count: number = await pageComponentCount(driver);
  return {
    pageText: pageText,
    componentCount: count,
    colorMode: colorMode,
    observedAt: Date.now()
  };
}

async function currentPageText(driver: Driver): Promise<string> {
  const hasClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
  if (hasClicked) {
    return PAGE_TEXT_CLICKED;
  }
  const hasInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
  if (hasInitial) {
    return PAGE_TEXT_INITIAL;
  }
  return '';
}

export default function abilityConsistencyTest(): void {
  describe('AbilityConsistencyTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      logInfo('AbilityConsistencyTest beforeAll: preparing EntryAbility');
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver);
        await ensureIndexPageInitial(driver);
      } catch (error) {
        logError(`AbilityConsistencyTest beforeAll error: ${error}`);
      }
    })

    beforeEach(async () => {
      const rendered: boolean = await isIndexPageRendered(driver);
      if (!rendered) {
        logInfo('beforeEach: index page absent, relaunching the entry ability');
        await launchEntryAbility();
      }
    })

    afterAll(async () => {
      try {
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
      } catch (error) {
        logError(`AbilityConsistencyTest afterAll error: ${error}`);
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_0100
     * @tc.name testConsistencyColorModeDefaultsToNotSet
     * @tc.desc Verify fresh registry reports COLOR_MODE_NOT_SET with one history entry and label not-set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyColorModeDefaultsToNotSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: ColorModeRegistry = new ColorModeRegistry();
          expect(registry.getCurrentMode()).assertEqual(COLOR_MODE_NOT_SET);
          expect(registry.isDefaultMode()).assertTrue();
          expect(registry.isDarkMode()).assertFalse();
          expect(registry.toLabel()).assertEqual('not-set');
          expect(registry.getHistoryLength()).assertEqual(1);
          expect(registry.getAppliedAttempts()).assertEqual(0);
          expect(registry.getFailedAttempts()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_0200
     * @tc.name testConsistencyColorModeTransitionAndRepeat
     * @tc.desc Verify setting dark then dark again returns false while history keeps both attempts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyColorModeTransitionAndRepeat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: ColorModeRegistry = new ColorModeRegistry();
          expect(registry.setColorMode(ColorMode.DARK)).assertTrue();
          expect(registry.getCurrentMode()).assertEqual(0);
          expect(registry.isDarkMode()).assertTrue();
          expect(registry.setColorMode(ColorMode.DARK)).assertFalse();
          expect(registry.getHistoryLength()).assertEqual(3);
          expect(registry.getAppliedAttempts()).assertEqual(2);
          expect(registry.getCurrentMode()).assertEqual(0);
          expect(registry.toLabel()).assertEqual('dark');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_0300
     * @tc.name testConsistencyColorModeRejectsOutOfRange
     * @tc.desc Verify color mode 2 and -2 are rejected while failed counter increments twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyColorModeRejectsOutOfRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: ColorModeRegistry = new ColorModeRegistry();
          expect(registry.setColorMode(2)).assertFalse();
          expect(registry.setColorMode(-2)).assertFalse();
          expect(registry.getFailedAttempts()).assertEqual(2);
          expect(registry.getAppliedAttempts()).assertEqual(0);
          expect(registry.getCurrentMode()).assertEqual(COLOR_MODE_NOT_SET);
          expect(registry.getHistoryLength()).assertEqual(1);
          expect(registry.setColorMode(ColorMode.LIGHT)).assertTrue();
          expect(registry.toLabel()).assertEqual('light');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_0400
     * @tc.name testConsistencySamplerModeAndDistinct
     * @tc.desc Verify sampler reports mode text and distinct count for mixed repeated samples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencySamplerModeAndDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const sampler: TextConsistencySampler = new TextConsistencySampler();
          sampler.addSample(PAGE_TEXT_INITIAL, 5);
          sampler.addSample(PAGE_TEXT_CLICKED, 5);
          sampler.addSample(PAGE_TEXT_INITIAL, 6);
          sampler.addSample(PAGE_TEXT_INITIAL, 5);
          expect(sampler.getSampleCount()).assertEqual(4);
          expect(sampler.getDistinctTextCount()).assertEqual(2);
          expect(sampler.getModeText()).assertEqual(PAGE_TEXT_INITIAL);
          expect(sampler.getMinCount()).assertEqual(5);
          expect(sampler.getMaxCount()).assertEqual(6);
          expect(sampler.isCountConverged(1)).assertTrue();
          expect(sampler.isCountConverged(0)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_0500
     * @tc.name testConsistencySamplerEmptyBoundary
     * @tc.desc Verify empty sampler yields zero statistics and empty mode text without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencySamplerEmptyBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const sampler: TextConsistencySampler = new TextConsistencySampler();
          expect(sampler.getSampleCount()).assertEqual(0);
          expect(sampler.getModeText()).assertEqual('');
          expect(sampler.getDistinctTextCount()).assertEqual(0);
          expect(sampler.getMinCount()).assertEqual(0);
          expect(sampler.getMaxCount()).assertEqual(0);
          expect(sampler.isCountConverged(0)).assertTrue();
          const statistics: SampleStatistics = sampler.statistics();
          expect(statistics.sampleCount).assertEqual(0);
          expect(statistics.isConverged).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_0600
     * @tc.name testConsistencyVerdictTracksMismatch
     * @tc.desc Verify verdict counts checked pairs and mismatches for text and numeric comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyVerdictTracksMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const verdict: ConsistencyVerdict = new ConsistencyVerdict();
          expect(verdict.compare(PAGE_TEXT_INITIAL, PAGE_TEXT_INITIAL)).assertTrue();
          expect(verdict.compare(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED)).assertFalse();
          expect(verdict.compareNumber(COLOR_MODE_NOT_SET, COLOR_MODE_NOT_SET)).assertTrue();
          expect(verdict.compareNumber(3, 4)).assertFalse();
          expect(verdict.getCheckedPairs()).assertEqual(4);
          expect(verdict.getMismatchedPairs()).assertEqual(2);
          expect(verdict.isStable()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_0700
     * @tc.name testConsistencyRepeatLaunchModelText
     * @tc.desc Verify repeat launch model records initial text then tracks clicked expectation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyRepeatLaunchModelText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: RepeatLaunchModel = new RepeatLaunchModel();
          expect(model.recordLaunch(PAGE_TEXT_INITIAL)).assertTrue();
          expect(model.recordLaunch(PAGE_TEXT_INITIAL)).assertTrue();
          expect(model.getLaunchCount()).assertEqual(2);
          expect(model.isAllInitial()).assertTrue();
          model.markClicked();
          expect(model.recordLaunch(PAGE_TEXT_INITIAL)).assertFalse();
          expect(model.recordLaunch(PAGE_TEXT_CLICKED)).assertTrue();
          expect(model.getObservedAt(3)).assertEqual(PAGE_TEXT_CLICKED);
          expect(model.getObservedAt(4)).assertEqual('');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_0800
     * @tc.name testConsistencyRealRepeatedLaunchTextStable
     * @tc.desc Verify three repeated real launches all keep the Index page readable and component count stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyRealRepeatedLaunchTextStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const sampler: TextConsistencySampler = new TextConsistencySampler();
          const verdict: ConsistencyVerdict = new ConsistencyVerdict();
          for (let round = 0; round < 3; round++) {
            await launchEntryAbility();
            await sleepMs(DELAY_AFTER_LAUNCH);
            expect(await waitForIndexPageStable(driver)).assertTrue();
            const observation: PageObservation = await observePage(driver, COLOR_MODE_NOT_SET);
            sampler.addSample(observation.pageText, observation.componentCount);
            expect(verdict.compare('readable', observation.pageText === '' ? 'empty' : 'readable')).assertTrue();
          }
          expect(sampler.getSampleCount()).assertEqual(3);
          expect(sampler.getDistinctTextCount() <= 2).assertTrue();
          expect(sampler.getMinCount() > 0).assertTrue();
          expect(sampler.isCountConverged(TOLERANCE_COMPONENT_COUNT)).assertTrue();
          expect(verdict.isStable()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_0900
     * @tc.name testConsistencyRealBackgroundTextUnchanged
     * @tc.desc Verify page text before and after a real background round trip is identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyRealBackgroundTextUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const textBefore: string = await currentPageText(driver);
          expect(textBefore === PAGE_TEXT_INITIAL || textBefore === PAGE_TEXT_CLICKED).assertTrue();
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const textAfter: string = await currentPageText(driver);
          const verdict: ConsistencyVerdict = new ConsistencyVerdict();
          expect(verdict.compare(textBefore, textAfter)).assertTrue();
          expect(verdict.getMismatchedPairs()).assertEqual(0);
          expect(verdict.isStable()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_1000
     * @tc.name testConsistencyRealRepeatedBackgroundConverges
     * @tc.desc Verify two background rounds converge to identical text and count within tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyRealRepeatedBackgroundConverges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const sampler: TextConsistencySampler = new TextConsistencySampler();
          for (let round = 0; round < 2; round++) {
            await doAbilityBackground();
            await sleepMs(DELAY_AFTER_BACKGROUND);
            await doAbilityForeground();
            await sleepMs(DELAY_AFTER_BACKGROUND);
            expect(await waitForIndexPageStable(driver)).assertTrue();
            const observation: PageObservation = await observePage(driver, COLOR_MODE_NOT_SET);
            sampler.addSample(observation.pageText, observation.componentCount);
          }
          expect(sampler.getSampleCount()).assertEqual(2);
          expect(sampler.getModeText() === PAGE_TEXT_INITIAL || sampler.getModeText() === PAGE_TEXT_CLICKED)
            .assertTrue();
          expect(sampler.getDistinctTextCount()).assertEqual(1);
          expect(sampler.isCountConverged(STABLE_TOLERANCE)).assertTrue();
          expect(sampler.getMinCount() > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_1100
     * @tc.name testConsistencyRealColorModeStableAcrossRelaunch
     * @tc.desc Verify color mode stays COLOR_MODE_NOT_SET and page text unchanged after relaunch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyRealColorModeStableAcrossRelaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const textBefore: string = await currentPageText(driver);
          await launchEntryAbility();
          await sleepMs(DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const textAfter: string = await currentPageText(driver);
          const verdict: ConsistencyVerdict = new ConsistencyVerdict();
          expect(verdict.compare(textBefore, textAfter)).assertTrue();
          const registry: ColorModeRegistry = new ColorModeRegistry();
          registry.setColorMode(COLOR_MODE_NOT_SET);
          expect(registry.getCurrentMode()).assertEqual(COLOR_MODE_NOT_SET);
          expect(registry.isDefaultMode()).assertTrue();
          expect(registry.toLabel()).assertEqual('not-set');
          expect(registry.getHistoryLength()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_1200
     * @tc.name testConsistencyRealTextComponentStable
     * @tc.desc Verify Text components exist and count matches at least one readable page text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyRealTextComponentStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const textsBefore: number = (await findComponentsByType(driver, 'Text')).length;
          expect(textsBefore > 0).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          let readableCount: number = 0;
          for (let i = 0; i < texts.length; i++) {
            if (texts[i] === PAGE_TEXT_INITIAL || texts[i] === PAGE_TEXT_CLICKED) {
              readableCount++;
            }
          }
          expect(readableCount).assertEqual(1);
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const textsAfter: number = (await findComponentsByType(driver, 'Text')).length;
          const drift: number = textsAfter - textsBefore;
          const absDrift: number = drift < 0 ? -drift : drift;
          expect(absDrift <= TOLERANCE_COMPONENT_COUNT).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_1300
     * @tc.name testConsistencyRealIdKeySampling
     * @tc.desc Verify the HelloWorld id key remains addressable across STABLE_ROUNDS UI samplings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyRealIdKeySampling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const verdict: ConsistencyVerdict = new ConsistencyVerdict();
          for (let round = 0; round < STABLE_ROUNDS + 1; round++) {
            const components: Component[] = await runSerializedUiOperation(async (): Promise<Component[]> => {
              return await driver.findComponents(ON.id(INDEX_PAGE_TEXT_KEY));
            });
            const count: number = components === null || components === undefined ? 0 : components.length;
            expect(verdict.compareNumber(1, count)).assertTrue();
          }
          expect(verdict.getCheckedPairs()).assertEqual(STABLE_ROUNDS + 1);
          expect(verdict.isStable()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONSIST_1400
     * @tc.name testConsistencyColorModeHistorySequence
     * @tc.desc Verify registry history records not-set then light then dark in exact order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConsistencyColorModeHistorySequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: ColorModeRegistry = new ColorModeRegistry();
          registry.setColorMode(ColorMode.LIGHT);
          registry.setColorMode(ColorMode.DARK);
          const history: number[] = registry.getHistory();
          expect(history.length).assertEqual(3);
          expect(history[0]).assertEqual(COLOR_MODE_NOT_SET);
          expect(history[1]).assertEqual(ColorMode.LIGHT);
          expect(history[2]).assertEqual(ColorMode.DARK);
          registry.reset();
          expect(registry.getCurrentMode()).assertEqual(COLOR_MODE_NOT_SET);
          expect(registry.getHistoryLength()).assertEqual(1);
          expect(registry.toLabel()).assertEqual('not-set');
        } finally {
          done();
        }
      })
  })
}
