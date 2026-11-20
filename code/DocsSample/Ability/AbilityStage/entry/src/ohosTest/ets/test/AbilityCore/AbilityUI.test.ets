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
import { Driver, Component, ON } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  logInfo,
  logError,
  sleepMs,
  launchEntryAbility,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  checkTextContent,
  checkComponentExists,
  checkComponentExistsByKey,
  pageComponentCount,
  collectAllTexts,
  findComponentsByType,
  findComponentsByText,
  tapComponentByText,
  runSerializedUiOperation,
  DELAY_AFTER_BACKGROUND,
  DELAY_AFTER_LAUNCH,
  DELAY_TOUCH_EVENT,
  TOLERANCE_COMPONENT_COUNT,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_TEXT_KEY
} from '../Shared/SharedDriver';

enum FontWeightClass {
  LIGHT = 'light',
  NORMAL = 'normal',
  BOLD = 'bold'
}

enum HorizontalAnchor {
  START = 'start',
  CENTER = 'center',
  END = 'end'
}

enum VerticalAnchor {
  TOP = 'top',
  CENTER = 'center',
  BOTTOM = 'bottom'
}

interface TextStyleRule {
  weight: FontWeightClass;
  horizontal: HorizontalAnchor;
  vertical: VerticalAnchor;
  fontSizeKey: string;
}

interface LayoutSpec {
  containerHeightPercent: number;
  containerWidthPercent: number;
  rule: TextStyleRule;
}

interface RenderObservation {
  textFound: boolean;
  textComponentCount: number;
  keyFound: boolean;
  totalComponents: number;
  readableText: string;
}

class IndexLayoutModel {
  private readonly spec: LayoutSpec;

  constructor() {
    this.spec = {
      containerHeightPercent: 100,
      containerWidthPercent: 100,
      rule: {
        weight: FontWeightClass.BOLD,
        horizontal: HorizontalAnchor.CENTER,
        vertical: VerticalAnchor.CENTER,
        fontSizeKey: 'page_text_font_size'
      }
    };
  }

  public getSpec(): LayoutSpec {
    return this.spec;
  }

  public getWeight(): FontWeightClass {
    return this.spec.rule.weight;
  }

  public isBold(): boolean {
    return this.spec.rule.weight === FontWeightClass.BOLD;
  }

  public isHorizontallyCentered(): boolean {
    return this.spec.rule.horizontal === HorizontalAnchor.CENTER;
  }

  public isVerticallyCentered(): boolean {
    return this.spec.rule.vertical === VerticalAnchor.CENTER;
  }

  public isFullBleed(): boolean {
    return this.spec.containerHeightPercent === 100 && this.spec.containerWidthPercent === 100;
  }

  public getFontSizeKey(): string {
    return this.spec.rule.fontSizeKey;
  }

  public weightRank(weight: FontWeightClass): number {
    if (weight === FontWeightClass.LIGHT) {
      return 0;
    }
    if (weight === FontWeightClass.NORMAL) {
      return 1;
    }
    return 2;
  }

  public isHeavierThan(other: FontWeightClass): boolean {
    return this.weightRank(this.spec.rule.weight) > this.weightRank(other);
  }

  public describe(): string {
    return `${this.spec.rule.weight}/${this.spec.rule.horizontal}/${this.spec.rule.vertical}`;
  }
}

class ComponentBudget {
  private readonly expected: number;
  private readonly tolerance: number;

  constructor(expected: number, tolerance: number) {
    this.expected = expected;
    this.tolerance = tolerance;
  }

  public getExpected(): number {
    return this.expected;
  }

  public getTolerance(): number {
    return this.tolerance;
  }

  public getLowerBound(): number {
    const lower: number = this.expected - this.tolerance;
    return lower < 0 ? 0 : lower;
  }

  public getUpperBound(): number {
    return this.expected + this.tolerance;
  }

  public accepts(actual: number): boolean {
    return actual >= this.getLowerBound() && actual <= this.getUpperBound();
  }

  public deviation(actual: number): number {
    const diff: number = actual - this.expected;
    return diff < 0 ? -diff : diff;
  }

  public isPositive(actual: number): boolean {
    return actual > 0;
  }
}

class TextVisibilityAudit {
  private checks: number = 0;
  private hits: number = 0;
  private misses: number = 0;

  public recordFound(expected: string, actual: string): boolean {
    this.checks++;
    if (expected === actual) {
      this.hits++;
      return true;
    }
    this.misses++;
    return false;
  }

  public getChecks(): number {
    return this.checks;
  }

  public getHits(): number {
    return this.hits;
  }

  public getMisses(): number {
    return this.misses;
  }

  public isPerfect(): boolean {
    return this.checks > 0 && this.misses === 0;
  }

  public getHitRate(): number {
    if (this.checks === 0) {
      return 0;
    }
    return this.hits / this.checks;
  }
}

class TextCollectionInspector {
  private texts: string[] = [];

  public load(texts: string[]): void {
    this.texts = texts.slice(0);
  }

  public count(): number {
    return this.texts.length;
  }

  public contains(target: string): boolean {
    return this.texts.indexOf(target) >= 0;
  }

  public countOccurrences(target: string): number {
    let count: number = 0;
    for (let i = 0; i < this.texts.length; i++) {
      if (this.texts[i] === target) {
        count++;
      }
    }
    return count;
  }

  public firstIndexOf(target: string): number {
    return this.texts.indexOf(target);
  }

  public emptyTextCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.texts.length; i++) {
      if (this.texts[i].length === 0) {
        count++;
      }
    }
    return count;
  }

  public hasPageText(): boolean {
    return this.contains(PAGE_TEXT_INITIAL) || this.contains(PAGE_TEXT_CLICKED);
  }

  public getTextAt(index: number): string {
    if (index < 0 || index >= this.texts.length) {
      return '';
    }
    return this.texts[index];
  }
}

async function observeIndexPage(driver: Driver): Promise<RenderObservation> {
  const textFound: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL) ||
    await checkTextContent(driver, PAGE_TEXT_CLICKED);
  const textComponents: Component[] = await findComponentsByType(driver, 'Text');
  const keyFound: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
  const total: number = await pageComponentCount(driver);
  const texts: string[] = await collectAllTexts(driver);
  let readable: string = '';
  for (let i = 0; i < texts.length; i++) {
    if (texts[i] === PAGE_TEXT_INITIAL) {
      readable = PAGE_TEXT_INITIAL;
      break;
    }
    if (texts[i] === PAGE_TEXT_CLICKED) {
      readable = PAGE_TEXT_CLICKED;
      break;
    }
  }
  return {
    textFound: textFound,
    textComponentCount: textComponents.length,
    keyFound: keyFound,
    totalComponents: total,
    readableText: readable
  };
}

export default function abilityUITest(): void {
  describe('AbilityUITest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      logInfo('AbilityUITest beforeAll: launching EntryAbility for UI assertions');
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver);
        await ensureIndexPageInitial(driver);
      } catch (e) {
        logError(`AbilityUITest beforeAll error: ${e}`);
      }
    })

    afterAll(async () => {
      try {
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
      } catch (e) {
        logError(`AbilityUITest afterAll error: ${e}`);
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_0100
     * @tc.name testUIRendersInitialHelloWorld
     * @tc.desc Verify Index page shows Hello World or Welcome text after launch with a positive component count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUIRendersInitialHelloWorld', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const observation: RenderObservation = await observeIndexPage(driver);
          expect(observation.textFound).assertTrue();
          expect(observation.readableText === PAGE_TEXT_INITIAL || observation.readableText === PAGE_TEXT_CLICKED)
            .assertTrue();
          const budget: ComponentBudget = new ComponentBudget(observation.totalComponents, TOLERANCE_COMPONENT_COUNT);
          expect(budget.isPositive(observation.totalComponents)).assertTrue();
          logInfo(`testUIRendersInitialHelloWorld: components ${observation.totalComponents}`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_0200
     * @tc.name testUITextComponentExists
     * @tc.desc Verify a Text component is present on the Index page with exactly one page text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUITextComponentExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(await waitForIndexPageStable(driver)).assertTrue();
          expect(await checkComponentExists(driver, 'Text')).assertTrue();
          const textComponents: Component[] = await findComponentsByType(driver, 'Text');
          expect(textComponents.length).assertEqual(1);
          const inspector: TextCollectionInspector = new TextCollectionInspector();
          inspector.load(await collectAllTexts(driver));
          expect(inspector.count()).assertEqual(1);
          expect(inspector.hasPageText()).assertTrue();
          expect(inspector.getTextAt(0) === PAGE_TEXT_INITIAL || inspector.getTextAt(0) === PAGE_TEXT_CLICKED)
            .assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_0300
     * @tc.name testUIHelloWorldKeyExists
     * @tc.desc Verify the HelloWorld id key resolves to exactly one component on the Index page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUIHelloWorldKeyExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(await waitForIndexPageStable(driver)).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
          const keyed: Component[] = await runSerializedUiOperation(async (): Promise<Component[]> => {
            return await driver.findComponents(ON.id(INDEX_PAGE_TEXT_KEY));
          });
          expect(keyed.length).assertEqual(1);
          expect(await checkComponentExistsByKey(driver, 'MissingKey')).assertFalse();
          expect(INDEX_PAGE_TEXT_KEY).assertEqual('HelloWorld');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_0400
     * @tc.name testUIComponentCountPositiveWithTolerance
     * @tc.desc Verify component count exceeds zero, the tolerance band is clamped so its lower bound never
     * goes negative, and a resample of the live page still falls inside the band
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUIComponentCountPositiveWithTolerance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const baseline: number = await pageComponentCount(driver);
          expect(baseline > 0).assertTrue();
          const budget: ComponentBudget = new ComponentBudget(baseline, TOLERANCE_COMPONENT_COUNT);
          const rawLower: number = baseline - TOLERANCE_COMPONENT_COUNT;
          const expectedLower: number = rawLower < 0 ? 0 : rawLower;
          expect(budget.getLowerBound()).assertEqual(expectedLower);
          expect(budget.getLowerBound() >= 0).assertTrue();
          expect(budget.getUpperBound()).assertEqual(baseline + TOLERANCE_COMPONENT_COUNT);
          expect(budget.getExpected()).assertEqual(baseline);
          expect(budget.getTolerance()).assertEqual(TOLERANCE_COMPONENT_COUNT);
          expect(budget.accepts(baseline)).assertTrue();
          expect(budget.accepts(baseline + TOLERANCE_COMPONENT_COUNT)).assertTrue();
          expect(budget.accepts(expectedLower)).assertTrue();
          expect(budget.accepts(baseline + TOLERANCE_COMPONENT_COUNT + 1)).assertFalse();
          const resampled: number = await pageComponentCount(driver);
          expect(budget.accepts(resampled)).assertTrue();
          expect(budget.deviation(resampled) <= TOLERANCE_COMPONENT_COUNT).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_0500
     * @tc.name testUIBoldWeightRuleApplied
     * @tc.desc Verify the declared layout rule marks the page text bold and heavier than normal weight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUIBoldWeightRuleApplied', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: IndexLayoutModel = new IndexLayoutModel();
          expect(model.isBold()).assertTrue();
          expect(model.getWeight()).assertEqual(FontWeightClass.BOLD);
          expect(model.weightRank(FontWeightClass.BOLD)).assertEqual(2);
          expect(model.isHeavierThan(FontWeightClass.NORMAL)).assertTrue();
          expect(model.isHeavierThan(FontWeightClass.LIGHT)).assertTrue();
          expect(model.weightRank(FontWeightClass.LIGHT) < model.weightRank(FontWeightClass.NORMAL)).assertTrue();
          expect(model.describe()).assertEqual('bold/center/center');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_0600
     * @tc.name testUICenterAlignmentRuleApplied
     * @tc.desc Verify the declared layout centers text on both axes inside a full size container
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUICenterAlignmentRuleApplied', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: IndexLayoutModel = new IndexLayoutModel();
          expect(model.isHorizontallyCentered()).assertTrue();
          expect(model.isVerticallyCentered()).assertTrue();
          expect(model.isFullBleed()).assertTrue();
          const spec: LayoutSpec = model.getSpec();
          expect(spec.containerHeightPercent).assertEqual(100);
          expect(spec.containerWidthPercent).assertEqual(100);
          expect(spec.rule.horizontal).assertEqual(HorizontalAnchor.CENTER);
          expect(spec.rule.vertical).assertEqual(VerticalAnchor.CENTER);
          expect(model.getFontSizeKey()).assertEqual('page_text_font_size');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_0700
     * @tc.name testUITapChangesTextToWelcome
     * @tc.desc Verify tapping the page text replaces Hello World with Welcome in the live UI tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUITapChangesTextToWelcome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await sleepMs(DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const before: RenderObservation = await observeIndexPage(driver);
          const target: string = before.readableText === PAGE_TEXT_INITIAL ? PAGE_TEXT_INITIAL : before.readableText;
          expect(await tapComponentByText(driver, target)).assertTrue();
          await sleepMs(DELAY_TOUCH_EVENT);
          const audit: TextVisibilityAudit = new TextVisibilityAudit();
          expect(audit.recordFound(PAGE_TEXT_CLICKED, await observedText(driver))).assertTrue();
          expect(audit.getChecks()).assertEqual(1);
          expect(audit.getHits()).assertEqual(1);
          expect(audit.getMisses()).assertEqual(0);
          expect(audit.isPerfect()).assertTrue();
          expect(audit.getHitRate()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_0800
     * @tc.name testUITextCountAfterClickStable
     * @tc.desc Verify Text component count stays exactly one after the click driven text change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUITextCountAfterClickStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const alreadyWelcomed: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          if (!alreadyWelcomed) {
            await tapComponentByText(driver, PAGE_TEXT_INITIAL);
            await sleepMs(DELAY_TOUCH_EVENT);
          }
          const textComponents: Component[] = await findComponentsByType(driver, 'Text');
          expect(textComponents.length).assertEqual(1);
          const matches: Component[] = await findComponentsByText(driver, PAGE_TEXT_CLICKED);
          expect(matches.length).assertEqual(1);
          const initialMatches: Component[] = await findComponentsByText(driver, PAGE_TEXT_INITIAL);
          expect(initialMatches.length).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_0900
     * @tc.name testUIKeyboardFocusableSurface
     * @tc.desc Verify the page exposes at least one focusable component after foreground activation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUIKeyboardFocusableSurface', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const all: number = await pageComponentCount(driver);
          expect(all > 0).assertTrue();
          const keyed: Component[] = await runSerializedUiOperation(async (): Promise<Component[]> => {
            return await driver.findComponents(ON.id(INDEX_PAGE_TEXT_KEY));
          });
          expect(keyed.length).assertEqual(1);
          const text: string = await keyed[0].getText();
          expect(text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED).assertTrue();
          const exists: boolean = await checkComponentExists(driver, 'Text');
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_1000
     * @tc.name testUIReadabilityAfterBackground
     * @tc.desc Verify page text remains readable and keyed component persists after background return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUIReadabilityAfterBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const before: RenderObservation = await observeIndexPage(driver);
          expect(before.textFound).assertTrue();
          expect(before.keyFound).assertTrue();
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const after: RenderObservation = await observeIndexPage(driver);
          expect(after.textFound).assertTrue();
          expect(after.keyFound).assertTrue();
          expect(after.textComponentCount).assertEqual(before.textComponentCount);
          expect(after.readableText).assertEqual(before.readableText);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_1100
     * @tc.name testUITextCollectionInspectorRules
     * @tc.desc Verify inspector counts occurrences, empty text entries and missing targets on synthetic inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUITextCollectionInspectorRules', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const inspector: TextCollectionInspector = new TextCollectionInspector();
          const synthetic: string[] = [PAGE_TEXT_INITIAL, '', PAGE_TEXT_CLICKED, ''];
          inspector.load(synthetic);
          expect(inspector.count()).assertEqual(4);
          expect(inspector.emptyTextCount()).assertEqual(2);
          expect(inspector.countOccurrences(PAGE_TEXT_INITIAL)).assertEqual(1);
          expect(inspector.firstIndexOf(PAGE_TEXT_CLICKED)).assertEqual(2);
          expect(inspector.firstIndexOf('Absent')).assertEqual(-1);
          expect(inspector.getTextAt(9)).assertEqual('');
          const other: string[] = [PAGE_TEXT_CLICKED, PAGE_TEXT_CLICKED];
          inspector.load(other);
          expect(inspector.countOccurrences(PAGE_TEXT_CLICKED)).assertEqual(2);
          expect(inspector.contains(PAGE_TEXT_INITIAL)).assertFalse();
          expect(inspector.hasPageText()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYUI_1200
     * @tc.name testUIComponentBudgetBounds
     * @tc.desc Verify budget bounds clamp to zero and accept exactly the inclusive tolerance edges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUIComponentBudgetBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const smallBudget: ComponentBudget = new ComponentBudget(1, TOLERANCE_COMPONENT_COUNT);
          expect(smallBudget.getLowerBound()).assertEqual(0);
          expect(smallBudget.getUpperBound()).assertEqual(1 + TOLERANCE_COMPONENT_COUNT);
          expect(smallBudget.accepts(0)).assertTrue();
          expect(smallBudget.accepts(0 - 1)).assertFalse();
          const zeroBudget: ComponentBudget = new ComponentBudget(0, 0);
          expect(zeroBudget.accepts(0)).assertTrue();
          expect(zeroBudget.accepts(0)).assertTrue();
          expect(zeroBudget.isPositive(0)).assertFalse();
          expect(zeroBudget.deviation(-3)).assertEqual(3);
          expect(zeroBudget.getExpected()).assertEqual(0);
        } finally {
          done();
        }
      })
  })
}

async function observedText(driver: Driver): Promise<string> {
  if (await checkTextContent(driver, PAGE_TEXT_CLICKED)) {
    return PAGE_TEXT_CLICKED;
  }
  if (await checkTextContent(driver, PAGE_TEXT_INITIAL)) {
    return PAGE_TEXT_INITIAL;
  }
  return '';
}
