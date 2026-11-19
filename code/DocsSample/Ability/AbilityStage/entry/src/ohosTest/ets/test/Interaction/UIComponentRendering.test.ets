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
import { Driver, ON, Component } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  logInfo,
  logError,
  launchEntryAbility,
  waitForIndexPageStable,
  checkTextContent,
  checkComponentExists,
  checkComponentExistsByKey,
  findComponentsByType,
  findComponentsByText,
  pageComponentCount,
  collectAllTexts,
  runSerializedUiOperation,
  isIndexPageVisible,
  INDEX_PAGE_TEXT_KEY,
  INDEX_PAGE_PATH,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  MODULE_NAME,
  TOLERANCE_COMPONENT_COUNT,
  TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

const TEXT_COMPONENT_TYPE: string = 'Text';

const CONTAINER_COMPONENT_TYPE: string = 'RelativeContainer';

const EXPECTED_PAGE_PATH: string = 'pages/Index';

const EXPECTED_STATIC_COMPONENT_COUNT: number = 2;

const RENDER_ROUNDS: number = 5;

class ComponentDescriptor {
  private readonly componentType: string;
  private readonly componentKey: string;
  private readonly required: boolean;

  constructor(componentType: string, componentKey: string, required: boolean) {
    this.componentType = componentType;
    this.componentKey = componentKey;
    this.required = required;
  }

  public getComponentType(): string {
    return this.componentType;
  }

  public getComponentKey(): string {
    return this.componentKey;
  }

  public isRequired(): boolean {
    return this.required;
  }
}

class ComponentInventory {
  private readonly descriptors: ComponentDescriptor[] = [];

  public register(descriptor: ComponentDescriptor): void {
    this.descriptors.push(descriptor);
  }

  public getDescriptorCount(): number {
    return this.descriptors.length;
  }

  public getRequiredDescriptors(): ComponentDescriptor[] {
    const required: ComponentDescriptor[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].isRequired()) {
        required.push(this.descriptors[i]);
      }
    }
    return required;
  }

  public getOptionalDescriptors(): ComponentDescriptor[] {
    const optional: ComponentDescriptor[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      if (!this.descriptors[i].isRequired()) {
        optional.push(this.descriptors[i]);
      }
    }
    return optional;
  }

  public hasDescriptor(componentType: string): boolean {
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].getComponentType() === componentType) {
        return true;
      }
    }
    return false;
  }

  public findDescriptor(componentType: string): ComponentDescriptor | null {
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].getComponentType() === componentType) {
        return this.descriptors[i];
      }
    }
    return null;
  }
}

class RenderObservation {
  private readonly roundIndex: number;
  private readonly componentCount: number;
  private readonly textCount: number;
  private readonly idPresent: boolean;

  constructor(roundIndex: number, componentCount: number, textCount: number, idPresent: boolean) {
    this.roundIndex = roundIndex;
    this.componentCount = componentCount;
    this.textCount = textCount;
    this.idPresent = idPresent;
  }

  public getRoundIndex(): number {
    return this.roundIndex;
  }

  public getComponentCount(): number {
    return this.componentCount;
  }

  public getTextCount(): number {
    return this.textCount;
  }

  public isIdPresent(): boolean {
    return this.idPresent;
  }
}

class RenderLedger {
  private readonly observations: RenderObservation[] = [];

  public record(observation: RenderObservation): void {
    this.observations.push(observation);
  }

  public getRoundCount(): number {
    return this.observations.length;
  }

  public getObservations(): RenderObservation[] {
    return this.observations;
  }

  public getMinComponentCount(): number {
    if (this.observations.length === 0) {
      return 0;
    }
    let minCount: number = this.observations[0].getComponentCount();
    for (let i = 1; i < this.observations.length; i++) {
      if (this.observations[i].getComponentCount() < minCount) {
        minCount = this.observations[i].getComponentCount();
      }
    }
    return minCount;
  }

  public getMaxComponentCount(): number {
    if (this.observations.length === 0) {
      return 0;
    }
    let maxCount: number = this.observations[0].getComponentCount();
    for (let i = 1; i < this.observations.length; i++) {
      if (this.observations[i].getComponentCount() > maxCount) {
        maxCount = this.observations[i].getComponentCount();
      }
    }
    return maxCount;
  }

  public getSpread(): number {
    return this.getMaxComponentCount() - this.getMinComponentCount();
  }

  public allRoundsHaveId(): boolean {
    for (let i = 0; i < this.observations.length; i++) {
      if (!this.observations[i].isIdPresent()) {
        return false;
      }
    }
    return true;
  }

  public getTextCountTotal(): number {
    let total: number = 0;
    for (let i = 0; i < this.observations.length; i++) {
      total += this.observations[i].getTextCount();
    }
    return total;
  }

  public reset(): void {
    this.observations.splice(0, this.observations.length);
  }
}

class RenderExpectation {
  private readonly expectedMinimum: number;
  private readonly tolerance: number;

  constructor(expectedMinimum: number, tolerance: number) {
    this.expectedMinimum = expectedMinimum;
    this.tolerance = tolerance;
  }

  public isSatisfiedBy(actualCount: number): boolean {
    return actualCount >= this.expectedMinimum;
  }

  public isStableAgainst(otherCount: number, referenceCount: number): boolean {
    return Math.abs(otherCount - referenceCount) <= this.tolerance;
  }

  public describe(): string {
    return `min ${this.expectedMinimum} tolerance ${this.tolerance}`;
  }
}

function buildInventory(): ComponentInventory {
  const inventory: ComponentInventory = new ComponentInventory();
  inventory.register(new ComponentDescriptor(TEXT_COMPONENT_TYPE, INDEX_PAGE_TEXT_KEY, true));
  inventory.register(new ComponentDescriptor(CONTAINER_COMPONENT_TYPE, '', true));
  return inventory;
}

async function readLiveText(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
    return await component.getText();
  });
}

async function ensureWelcomeState(driver: Driver): Promise<void> {
  const current: string = await readLiveText(driver);
  if (current !== PAGE_TEXT_CLICKED) {
    await runSerializedUiOperation(async (): Promise<void> => {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      await component.click();
      await driver.delayMs(100);
    });
  }
}

export default function uiComponentRenderingTest(): void {
  describe('UIComponentRenderingTest', () => {
    let driver: Driver;
    let inventory: ComponentInventory;
    let ledger: RenderLedger;
    let expectation: RenderExpectation;


    beforeAll(async () => {
      driver = getDriver();
      inventory = buildInventory();
      ledger = new RenderLedger();
      expectation = new RenderExpectation(EXPECTED_STATIC_COMPONENT_COUNT, TOLERANCE_COMPONENT_COUNT);
      logInfo('UIComponentRenderingTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('UIComponentRenderingTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('UIComponentRenderingTest: afterAll start');
      await driver.delayMs(100);
      logInfo('UIComponentRenderingTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_0100
     * @tc.name testRenderPageVisible
     * @tc.desc Verify the index page is visible and the HelloWorld text is present after launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderPageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        const hasText: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL) ||
          await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(hasText).assertTrue();
      } catch (e) {
        logError(`testRenderPageVisible failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_0200
     * @tc.name testRenderTextNodeExists
     * @tc.desc Verify a Text component is rendered and the type query returns at least one instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderTextNodeExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const exists: boolean = await checkComponentExists(driver, TEXT_COMPONENT_TYPE);
        expect(exists).assertTrue();
        const textComponents: Component[] = await findComponentsByType(driver, TEXT_COMPONENT_TYPE);
        expect(textComponents.length >= 1).assertTrue();
        logInfo(`testRenderTextNodeExists: ${textComponents.length} text components`);
      } catch (e) {
        logError(`testRenderTextNodeExists failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_0300
     * @tc.name testRenderContainerNodeExists
     * @tc.desc Verify a RelativeContainer node is rendered as the root layout of the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderContainerNodeExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const exists: boolean = await checkComponentExists(driver, CONTAINER_COMPONENT_TYPE);
        expect(exists).assertTrue();
        const containers: Component[] = await findComponentsByType(driver, CONTAINER_COMPONENT_TYPE);
        expect(containers.length >= 1).assertTrue();
        logInfo(`testRenderContainerNodeExists: ${containers.length} containers`);
      } catch (e) {
        logError(`testRenderContainerNodeExists failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_0400
     * @tc.name testRenderHelloWorldIdLocatable
     * @tc.desc Verify the id HelloWorld resolves to exactly one component through the key query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderHelloWorldIdLocatable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(idExists).assertTrue();
        const byKey: Component[] = await runSerializedUiOperation(async (): Promise<Component[]> => {
          return await driver.findComponents(ON.id(INDEX_PAGE_TEXT_KEY));
        });
        expect(byKey.length).assertEqual(1);
        logInfo(`testRenderHelloWorldIdLocatable: ${byKey.length} component with id`);
      } catch (e) {
        logError(`testRenderHelloWorldIdLocatable failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_0500
     * @tc.name testRenderMissingKeyAbsent
     * @tc.desc Verify a non existent component id and type both report absence without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderMissingKeyAbsent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const missingKey: boolean = await checkComponentExistsByKey(driver, 'NotARealComponentId');
        expect(missingKey).assertFalse();
        const missingType: boolean = await checkComponentExists(driver, 'Video');
        expect(missingType).assertFalse();
      } catch (e) {
        logError(`testRenderMissingKeyAbsent failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_0600
     * @tc.name testRenderComponentCountAtLeastStaticNodes
     * @tc.desc Verify the live component count is at least the two statically authored nodes plus tolerance headroom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderComponentCountAtLeastStaticNodes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        expect(expectation.isSatisfiedBy(count)).assertTrue();
        expect(count >= EXPECTED_STATIC_COMPONENT_COUNT).assertTrue();
        expect(expectation.describe()).assertEqual('min 2 tolerance 3');
        logInfo(`testRenderComponentCountAtLeastStaticNodes: count ${count}`);
      } catch (e) {
        logError(`testRenderComponentCountAtLeastStaticNodes failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_0700
     * @tc.name testRenderComponentCountRepeatable
     * @tc.desc Verify three component count reads differ by no more than the shared tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderComponentCountRepeatable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const first: number = await pageComponentCount(driver);
        const second: number = await pageComponentCount(driver);
        const third: number = await pageComponentCount(driver);
        expect(expectation.isStableAgainst(second, first)).assertTrue();
        expect(expectation.isStableAgainst(third, first)).assertTrue();
        expect(first > 0).assertTrue();
        logInfo(`testRenderComponentCountRepeatable: ${first} ${second} ${third}`);
      } catch (e) {
        logError(`testRenderComponentCountRepeatable failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_0800
     * @tc.name testRenderRerenderIdempotent
     * @tc.desc Verify five render observation rounds keep the component count spread within tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderRerenderIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        ledger.reset();
        for (let round: number = 0; round < RENDER_ROUNDS; round++) {
          const count: number = await pageComponentCount(driver);
          const texts: Component[] = await findComponentsByType(driver, TEXT_COMPONENT_TYPE);
          const idPresent: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          ledger.record(new RenderObservation(round, count, texts.length, idPresent));
        }
        expect(ledger.getRoundCount()).assertEqual(RENDER_ROUNDS);
        expect(ledger.getSpread() <= TOLERANCE_COMPONENT_COUNT).assertTrue();
        expect(ledger.allRoundsHaveId()).assertTrue();
        expect(ledger.getMinComponentCount() > 0).assertTrue();
        logInfo(`testRenderRerenderIdempotent: spread ${ledger.getSpread()}`);
      } catch (e) {
        logError(`testRenderRerenderIdempotent failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_0900
     * @tc.name testRenderTextCountStableAcrossRounds
     * @tc.desc Verify the Text node count stays constant across three observation rounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderTextCountStableAcrossRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const firstRound: Component[] = await findComponentsByType(driver, TEXT_COMPONENT_TYPE);
        const secondRound: Component[] = await findComponentsByType(driver, TEXT_COMPONENT_TYPE);
        const thirdRound: Component[] = await findComponentsByType(driver, TEXT_COMPONENT_TYPE);
        expect(secondRound.length).assertEqual(firstRound.length);
        expect(thirdRound.length).assertEqual(firstRound.length);
        expect(firstRound.length >= 1).assertTrue();
      } catch (e) {
        logError(`testRenderTextCountStableAcrossRounds failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_1000
     * @tc.name testRenderTextQueryByInitialCopy
     * @tc.desc Verify a text query by an exact copy string returns either one live match or none
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderTextQueryByInitialCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const liveText: string = await readLiveText(driver);
        const matches: Component[] = await findComponentsByText(driver, liveText);
        expect(matches.length).assertEqual(1);
        const matchedText: string = await runSerializedUiOperation(async (): Promise<string> => {
          return await matches[0].getText();
        });
        expect(matchedText).assertEqual(liveText);
        expect(liveText.length).assertEqual(liveText === PAGE_TEXT_INITIAL ? 11 : 7);
      } catch (e) {
        logError(`testRenderTextQueryByInitialCopy failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_1100
     * @tc.name testRenderTextQueryByUnknownCopy
     * @tc.desc Verify querying an unknown string returns an empty component list rather than an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderTextQueryByUnknownCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const matches: Component[] = await findComponentsByText(driver, 'Goodbye Universe');
        expect(matches.length).assertEqual(0);
        const emptyCheck: boolean = await checkTextContent(driver, 'Goodbye Universe');
        expect(emptyCheck).assertFalse();
      } catch (e) {
        logError(`testRenderTextQueryByUnknownCopy failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_1200
     * @tc.name testRenderCollectedTextsContainInitial
     * @tc.desc Verify the collected text list holds exactly one node carrying one of the two bound copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderCollectedTextsContainInitial', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: string[] = await collectAllTexts(driver);
        let boundCount: number = 0;
        for (let i = 0; i < texts.length; i++) {
          if (texts[i] === PAGE_TEXT_INITIAL || texts[i] === PAGE_TEXT_CLICKED) {
            boundCount++;
          }
        }
        expect(boundCount).assertEqual(1);
        expect(texts.length).assertEqual(1);
        logInfo(`testRenderCollectedTextsContainInitial: ${texts.length} texts collected`);
      } catch (e) {
        logError(`testRenderCollectedTextsContainInitial failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_1300
     * @tc.name testRenderInventoryRequiredDescriptors
     * @tc.desc Verify the inventory declares two required descriptors for Text and RelativeContainer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderInventoryRequiredDescriptors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(inventory.getDescriptorCount()).assertEqual(2);
        expect(inventory.getRequiredDescriptors().length).assertEqual(2);
        expect(inventory.getOptionalDescriptors().length).assertEqual(0);
        expect(inventory.hasDescriptor(TEXT_COMPONENT_TYPE)).assertTrue();
        expect(inventory.hasDescriptor(CONTAINER_COMPONENT_TYPE)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_1400
     * @tc.name testRenderInventoryLookupKey
     * @tc.desc Verify the Text descriptor carries the HelloWorld key while an absent type yields null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderInventoryLookupKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const textDescriptor: ComponentDescriptor | null = inventory.findDescriptor(TEXT_COMPONENT_TYPE);
        expect(textDescriptor !== null).assertTrue();
        if (textDescriptor !== null) {
          expect(textDescriptor.getComponentKey()).assertEqual(INDEX_PAGE_TEXT_KEY);
          expect(textDescriptor.isRequired()).assertTrue();
        }
        expect(inventory.findDescriptor('Image')).assertNull();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_1500
     * @tc.name testRenderExpectationBoundary
     * @tc.desc Verify the expectation accepts count 2 rejects count 1 and tolerates a drift of exactly 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderExpectationBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(expectation.isSatisfiedBy(EXPECTED_STATIC_COMPONENT_COUNT)).assertTrue();
        expect(expectation.isSatisfiedBy(EXPECTED_STATIC_COMPONENT_COUNT - 1)).assertFalse();
        expect(expectation.isStableAgainst(5, 2)).assertTrue();
        expect(expectation.isStableAgainst(6, 2)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_1600
     * @tc.name testRenderPagePathConstant
     * @tc.desc Verify the module name and page path constants match the loaded Index page configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderPagePathConstant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(MODULE_NAME).assertEqual('entry');
        expect(INDEX_PAGE_PATH).assertEqual(EXPECTED_PAGE_PATH);
        expect(INDEX_PAGE_PATH.indexOf('pages/')).assertEqual(0);
        expect(INDEX_PAGE_PATH.length).assertEqual(11);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_1700
     * @tc.name testRenderIdSurvivesClick
     * @tc.desc Verify the HelloWorld id stays locatable after the text transitions to Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderIdSurvivesClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await runSerializedUiOperation(async (): Promise<void> => {
          const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
          await component.click();
          await driver.delayMs(100);
        });
        const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(idExists).assertTrue();
        const idComponents: Component[] = await runSerializedUiOperation(async (): Promise<Component[]> => {
          return await driver.findComponents(ON.id(INDEX_PAGE_TEXT_KEY));
        });
        expect(idComponents.length).assertEqual(1);
        const currentText: string = await runSerializedUiOperation(async (): Promise<string> => {
          return await idComponents[0].getText();
        });
        expect(currentText).assertEqual(PAGE_TEXT_CLICKED);
      } catch (e) {
        logError(`testRenderIdSurvivesClick failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_1800
     * @tc.name testRenderSingleTextAfterClick
     * @tc.desc Verify exactly one Text node remains rendered after the click driven re-render
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderSingleTextAfterClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await ensureWelcomeState(driver);
        const textComponents: Component[] = await findComponentsByType(driver, TEXT_COMPONENT_TYPE);
        expect(textComponents.length).assertEqual(1);
        const welcomeMatches: Component[] = await findComponentsByText(driver, PAGE_TEXT_CLICKED);
        expect(welcomeMatches.length).assertEqual(1);
        const initialMatches: Component[] = await findComponentsByText(driver, PAGE_TEXT_INITIAL);
        expect(initialMatches.length).assertEqual(0);
      } catch (e) {
        logError(`testRenderSingleTextAfterClick failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_1900
     * @tc.name testRenderContainerStillPresentAfterClick
     * @tc.desc Verify the RelativeContainer survives the state change and still holds the text child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderContainerStillPresentAfterClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const containerExists: boolean = await checkComponentExists(driver, CONTAINER_COMPONENT_TYPE);
        expect(containerExists).assertTrue();
        const textExists: boolean = await checkComponentExists(driver, TEXT_COMPONENT_TYPE);
        expect(textExists).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count >= EXPECTED_STATIC_COMPONENT_COUNT).assertTrue();
      } catch (e) {
        logError(`testRenderContainerStillPresentAfterClick failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_2000
     * @tc.name testRenderLedgerAccumulates
     * @tc.desc Verify the ledger records rounds, exposes its observations and clears on reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderLedgerAccumulates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        ledger.reset();
        expect(ledger.getRoundCount()).assertEqual(0);
        expect(ledger.getMinComponentCount()).assertEqual(0);
        ledger.record(new RenderObservation(0, 3, 1, true));
        ledger.record(new RenderObservation(1, 4, 1, true));
        ledger.record(new RenderObservation(2, 2, 1, false));
        expect(ledger.getRoundCount()).assertEqual(3);
        expect(ledger.getMinComponentCount()).assertEqual(2);
        expect(ledger.getMaxComponentCount()).assertEqual(4);
        expect(ledger.getSpread()).assertEqual(2);
        expect(ledger.getTextCountTotal()).assertEqual(3);
        expect(ledger.allRoundsHaveId()).assertFalse();
        ledger.reset();
        expect(ledger.getObservations().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_2100
     * @tc.name testRenderNoStaleTextAfterTransition
     * @tc.desc Verify the collected text list after the transition contains Welcome and not Hello World
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderNoStaleTextAfterTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await ensureWelcomeState(driver);
        const texts: string[] = await collectAllTexts(driver);
        let welcomeCount: number = 0;
        let initialCount: number = 0;
        for (let i = 0; i < texts.length; i++) {
          if (texts[i] === PAGE_TEXT_CLICKED) {
            welcomeCount++;
          }
          if (texts[i] === PAGE_TEXT_INITIAL) {
            initialCount++;
          }
        }
        expect(welcomeCount).assertEqual(1);
        expect(initialCount).assertEqual(0);
        expect(texts.length).assertEqual(1);
      } catch (e) {
        logError(`testRenderNoStaleTextAfterTransition failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_2200
     * @tc.name testRenderFullInventoryConsistent
     * @tc.desc Verify every required descriptor in the inventory is satisfiable on the live page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderFullInventoryConsistent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const required: ComponentDescriptor[] = inventory.getRequiredDescriptors();
        let satisfied: number = 0;
        for (let i = 0; i < required.length; i++) {
          const exists: boolean = await checkComponentExists(driver, required[i].getComponentType());
          if (exists) {
            satisfied++;
          }
        }
        expect(satisfied).assertEqual(required.length);
        expect(required.length).assertEqual(2);
        logInfo(`testRenderFullInventoryConsistent: ${satisfied} of ${required.length} descriptors satisfied`);
      } catch (e) {
        logError(`testRenderFullInventoryConsistent failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_2300
     * @tc.name testRenderTwoDistinctNodeTypes
     * @tc.desc Verify the page exposes two distinct node types and each query returns a non empty list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderTwoDistinctNodeTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: Component[] = await findComponentsByType(driver, TEXT_COMPONENT_TYPE);
        const containers: Component[] = await findComponentsByType(driver, CONTAINER_COMPONENT_TYPE);
        expect(texts.length).assertEqual(1);
        expect(containers.length).assertEqual(1);
        const typeNames: string[] = [TEXT_COMPONENT_TYPE, CONTAINER_COMPONENT_TYPE];
        expect(typeNames[0] !== typeNames[1]).assertTrue();
        expect(typeNames.length).assertEqual(2);
      } catch (e) {
        logError(`testRenderTwoDistinctNodeTypes failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RENDER_2400
     * @tc.name testRenderReentrantQueryIdempotent
     * @tc.desc Verify ten interleaved type and id queries return consistent results with no drift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRenderReentrantQueryIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        let consistentRounds: number = 0;
        for (let round: number = 0; round < 10; round++) {
          const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          const textExists: boolean = await checkComponentExists(driver, TEXT_COMPONENT_TYPE);
          if (idExists && textExists) {
            consistentRounds++;
          }
        }
        expect(consistentRounds).assertEqual(10);
        const recheckText: Component[] = await findComponentsByType(driver, TEXT_COMPONENT_TYPE);
        expect(recheckText.length).assertEqual(1);
        logInfo(`testRenderReentrantQueryIdempotent: ${consistentRounds} consistent rounds`);
      } catch (e) {
        logError(`testRenderReentrantQueryIdempotent failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })
  })
}
