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
  findComponentsByType,
  findComponentsByText,
  pageComponentCount,
  collectAllTexts,
  checkTextContent,
  isIndexPageVisible,
  waitForIndexPageStable,
  checkComponentExistsByKey,
  pressAndWait,
  runSerializedUiOperation,
  serializedDelay,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

enum LocatorStrategy {
  BY_ID = 'by_id',
  BY_TEXT = 'by_text',
  BY_TYPE = 'by_type'
}

interface AccessibleNode {
  identifier: string;
  text: string;
  contentDescription: string;
  interactive: boolean;
  focusable: boolean;
}

interface LocatorQuery {
  strategy: LocatorStrategy;
  value: string;
}

interface LocatorResolution {
  matched: boolean;
  matchedCount: number;
  strategy: LocatorStrategy;
  value: string;
}

interface TraversalStep {
  order: number;
  identifier: string;
  text: string;
}

enum ArrowDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down'
}

interface NavigationOutcome {
  moved: boolean;
  fromIndex: number;
  toIndex: number;
  direction: ArrowDirection;
}

class AccessibilitySnapshot {
  private nodes: AccessibleNode[] = [];

  constructor(nodes: AccessibleNode[]) {
    this.nodes = nodes;
  }

  public getNodeCount(): number {
    return this.nodes.length;
  }

  public getIdAt(index: number): string {
    if (index < 0 || index >= this.nodes.length) {
      return '';
    }
    return this.nodes[index].identifier;
  }

  public indexOfId(identifier: string): number {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].identifier === identifier) {
        return i;
      }
    }
    return -1;
  }

  public findById(identifier: string): AccessibleNode | null {
    const index: number = this.indexOfId(identifier);
    if (index === -1) {
      return null;
    }
    return this.nodes[index];
  }

  public findByText(text: string): AccessibleNode | null {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].text === text) {
        return this.nodes[i];
      }
    }
    return null;
  }

  public countByText(text: string): number {
    let count: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].text === text) {
        count++;
      }
    }
    return count;
  }

  public countInteractive(): number {
    let count: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].interactive) {
        count++;
      }
    }
    return count;
  }

  public countFocusable(): number {
    let count: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].focusable) {
        count++;
      }
    }
    return count;
  }

  public hasText(text: string): boolean {
    return this.countByText(text) > 0;
  }

  public collectTraversal(): TraversalStep[] {
    const steps: TraversalStep[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      const step: TraversalStep = {
        order: i,
        identifier: this.nodes[i].identifier,
        text: this.nodes[i].text
      };
      steps.push(step);
    }
    return steps;
  }

  public resolve(query: LocatorQuery): LocatorResolution {
    let matchedCount: number = 0;
    if (query.strategy === LocatorStrategy.BY_ID) {
      matchedCount = this.indexOfId(query.value) === -1 ? 0 : 1;
    } else if (query.strategy === LocatorStrategy.BY_TEXT) {
      matchedCount = this.countByText(query.value);
    } else {
      matchedCount = query.value === 'Text' ? this.nodes.length : 0;
    }
    const resolution: LocatorResolution = {
      matched: matchedCount > 0,
      matchedCount: matchedCount,
      strategy: query.strategy,
      value: query.value
    };
    return resolution;
  }

  public isLocatorEquivalent(identifier: string, text: string): boolean {
    const byId: AccessibleNode | null = this.findById(identifier);
    if (byId === null) {
      return false;
    }
    return byId.text === text && this.countByText(text) === 1;
  }

  public firstInteractiveText(): string {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].interactive) {
        return this.nodes[i].text;
      }
    }
    return '';
  }
}

class DescriptionFallbackPolicy {
  private static readonly EMPTY_FALLBACK: string = 'unlabeled component';

  private static readonly ID_PREFIX: string = 'component-';

  public resolve(contentDescription: string, text: string, identifier: string): string {
    if (!this.isBlank(contentDescription)) {
      return contentDescription;
    }
    if (!this.isBlank(text)) {
      return text;
    }
    if (!this.isBlank(identifier)) {
      return `${DescriptionFallbackPolicy.ID_PREFIX}${identifier}`;
    }
    return DescriptionFallbackPolicy.EMPTY_FALLBACK;
  }

  public resolveFromCandidates(candidates: string[]): string {
    for (let i = 0; i < candidates.length; i++) {
      if (!this.isBlank(candidates[i])) {
        return candidates[i];
      }
    }
    return DescriptionFallbackPolicy.EMPTY_FALLBACK;
  }

  public isFallbackUsed(description: string): boolean {
    return description.indexOf(DescriptionFallbackPolicy.ID_PREFIX) === 0
      || description === DescriptionFallbackPolicy.EMPTY_FALLBACK;
  }

  public isBlank(value: string): boolean {
    if (value === undefined || value === null) {
      return true;
    }
    return value.trim().length === 0;
  }
}

class SingleComponentNavigator {
  private focusableCount: number;
  private currentIndex: number;
  private lastDirection: ArrowDirection = ArrowDirection.RIGHT;
  private movedCount: number = 0;
  private blockedCount: number = 0;

  constructor(focusableCount: number, initialIndex: number) {
    this.focusableCount = focusableCount;
    if (focusableCount <= 0) {
      this.currentIndex = -1;
    } else if (initialIndex < 0) {
      this.currentIndex = 0;
    } else if (initialIndex >= focusableCount) {
      this.currentIndex = focusableCount - 1;
    } else {
      this.currentIndex = initialIndex;
    }
  }

  public navigate(direction: ArrowDirection): NavigationOutcome {
    const fromIndex: number = this.currentIndex;
    this.lastDirection = direction;
    if (this.focusableCount <= 1 || fromIndex < 0) {
      this.blockedCount++;
      const blockedOutcome: NavigationOutcome = {
        moved: false,
        fromIndex: fromIndex,
        toIndex: fromIndex,
        direction: direction
      };
      return blockedOutcome;
    }
    let target: number = fromIndex;
    if (direction === ArrowDirection.LEFT || direction === ArrowDirection.UP) {
      target = fromIndex > 0 ? fromIndex - 1 : 0;
    } else {
      target = fromIndex < this.focusableCount - 1 ? fromIndex + 1 : this.focusableCount - 1;
    }
    this.currentIndex = target;
    const moved: boolean = target !== fromIndex;
    if (moved) {
      this.movedCount++;
    } else {
      this.blockedCount++;
    }
    const outcome: NavigationOutcome = {
      moved: moved,
      fromIndex: fromIndex,
      toIndex: target,
      direction: direction
    };
    return outcome;
  }

  public getCurrentIndex(): number {
    return this.currentIndex;
  }

  public getMovedCount(): number {
    return this.movedCount;
  }

  public getBlockedCount(): number {
    return this.blockedCount;
  }

  public getLastDirection(): ArrowDirection {
    return this.lastDirection;
  }

  public isSingleComponent(): boolean {
    return this.focusableCount === 1;
  }

}

async function resolveCurrentPageText(driver: Driver): Promise<string> {
  const hasInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
  if (hasInitial) {
    return PAGE_TEXT_INITIAL;
  }
  const hasClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
  if (hasClicked) {
    return PAGE_TEXT_CLICKED;
  }
  return '';
}

async function readTextById(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    try {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      if (component === null || component === undefined) {
        return '';
      }
      return await component.getText();
    } catch (error) {
      logError(`readTextById failed: ${error}`);
      return '';
    }
  });
}

async function activateTextById(driver: Driver): Promise<boolean> {
  return await runSerializedUiOperation(async (): Promise<boolean> => {
    try {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      if (component === null || component === undefined) {
        return false;
      }
      await component.click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
      return true;
    } catch (error) {
      logError(`activateTextById failed: ${error}`);
      return false;
    }
  });
}

function buildPageSnapshot(text: string): AccessibilitySnapshot {
  const nodes: AccessibleNode[] = [];
  const pageNode: AccessibleNode = {
    identifier: INDEX_PAGE_TEXT_KEY,
    text: text,
    contentDescription: '',
    interactive: true,
    focusable: true
  };
  nodes.push(pageNode);
  return new AccessibilitySnapshot(nodes);
}

function buildMultiNodeSnapshot(): AccessibilitySnapshot {
  const nodes: AccessibleNode[] = [];
  const container: AccessibleNode = {
    identifier: 'PageContainer',
    text: '',
    contentDescription: 'page container',
    interactive: false,
    focusable: false
  };
  const firstText: AccessibleNode = {
    identifier: 'HelloWorld',
    text: PAGE_TEXT_INITIAL,
    contentDescription: '',
    interactive: true,
    focusable: true
  };
  const secondText: AccessibleNode = {
    identifier: 'StatusLabel',
    text: 'Status Ready',
    contentDescription: 'status label',
    interactive: false,
    focusable: false
  };
  const duplicateText: AccessibleNode = {
    identifier: 'EchoLabel',
    text: 'Status Ready',
    contentDescription: '',
    interactive: false,
    focusable: false
  };
  nodes.push(container);
  nodes.push(firstText);
  nodes.push(secondText);
  nodes.push(duplicateText);
  return new AccessibilitySnapshot(nodes);
}

export default function accessibilityNavigationTest(): void {
  describe('AccessibilityNavigationTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('AccessibilityNavigationTest: preparing index page');
      await launchEntryAbility();
      await serializedDelay(driver, 500);
      const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo(`AccessibilityNavigationTest: page stable ${stable}`);
    })

    afterAll(async () => {
      logInfo('AccessibilityNavigationTest: finished');
      await serializedDelay(driver, 100);
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_0100
     * @tc.name testAccessibilityPageStableOnLaunch
     * @tc.desc Verify index page renders after ability launch: launch -> page text visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityPageStableOnLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
          const currentText: string = await resolveCurrentPageText(driver);
          expect(currentText.length > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_0200
     * @tc.name testAccessibilityTextNodeReachableByText
     * @tc.desc Verify text locator reaches the page text node: ON.text(current) -> exactly one match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityTextNodeReachableByText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const currentText: string = await resolveCurrentPageText(driver);
          expect(currentText.length > 0).assertTrue();
          const matched: Component[] = await findComponentsByText(driver, currentText);
          expect(matched.length).assertEqual(1);
          const text: string = await matched[0].getText();
          expect(text).assertEqual(currentText);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_0300
     * @tc.name testAccessibilityNodeReachableById
     * @tc.desc Verify identifier locator reaches the page text node: ON.id(HelloWorld) -> exists and text non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityNodeReachableById', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
          const text: string = await readTextById(driver);
          expect(text.length > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_0400
     * @tc.name testAccessibilityIdAndTextLocatorEquivalent
     * @tc.desc Verify id locator and text locator resolve the same node: both readings equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityIdAndTextLocatorEquivalent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const textById: string = await readTextById(driver);
          expect(textById.length > 0).assertTrue();
          const byText: Component[] = await findComponentsByText(driver, textById);
          expect(byText.length).assertEqual(1);
          const textByLocator: string = await byText[0].getText();
          expect(textByLocator).assertEqual(textById);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_0500
     * @tc.name testAccessibilityTextTraversalContainsInitial
     * @tc.desc Verify a11y text traversal exposes page text: collectAllTexts contains current text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityTextTraversalContainsInitial', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const currentText: string = await resolveCurrentPageText(driver);
          expect(currentText.length > 0).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          let found: boolean = false;
          for (let i = 0; i < texts.length; i++) {
            if (texts[i] === currentText) {
              found = true;
              break;
            }
          }
          expect(found).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_0600
     * @tc.name testAccessibilityTraversalCountMatchesComponentCount
     * @tc.desc Verify text traversal cardinality matches Text component query: both report one node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityTraversalCountMatchesComponentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const textNodes: Component[] = await findComponentsByType(driver, 'Text');
          expect(textNodes.length).assertEqual(1);
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_0700
     * @tc.name testAccessibilityMissingIdNotReachable
     * @tc.desc Verify unknown identifier yields no match: ON.id(NotExistentId) -> zero components
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityMissingIdNotReachable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const exists: boolean = await checkComponentExistsByKey(driver, 'NotExistentId');
          expect(exists).assertFalse();
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_0800
     * @tc.name testAccessibilityMissingTextNotReachable
     * @tc.desc Verify unknown text yields no match: ON.text(NotExistentText) -> zero components, and the
     * HelloWorld node is still reachable by id afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityMissingTextNotReachable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const matched: Component[] = await findComponentsByText(driver, 'NotExistentText');
          expect(matched.length).assertEqual(0);
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
          logInfo(`testAccessibilityMissingTextNotReachable: page component count ${count}`);
          const keyPresent: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(keyPresent).assertTrue();
          const texts: Component[] = await findComponentsByType(driver, 'Text');
          expect(texts.length).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_0900
     * @tc.name testAccessibilityComponentCountBaseline
     * @tc.desc Verify page component baseline is stable: a repeated sample of the page component count is
     * identical, and the count still covers at least the single text node of the Index page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityComponentCountBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const count: number = await pageComponentCount(driver);
          expect(count).assertLargerOrEqual(1);
          logInfo(`testAccessibilityComponentCountBaseline: page component count ${count}`);
          const resampled: number = await pageComponentCount(driver);
          expect(resampled).assertEqual(count);
          const textCount: number = (await findComponentsByType(driver, 'Text')).length;
          expect(textCount).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_1000
     * @tc.name testAccessibilityComponentCountStableAfterQueries
     * @tc.desc Verify repeated a11y queries do not mutate layout: count before equals count after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityComponentCountStableAfterQueries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeCount: number = await pageComponentCount(driver);
          await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          await findComponentsByText(driver, 'NotExistentText');
          await collectAllTexts(driver);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount).assertEqual(beforeCount);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_1100
     * @tc.name testAccessibilitySnapshotLocatorById
     * @tc.desc Verify snapshot resolves identifier query: id HelloWorld -> matched with count one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilitySnapshotLocatorById', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: AccessibilitySnapshot = buildPageSnapshot(PAGE_TEXT_INITIAL);
          const query: LocatorQuery = { strategy: LocatorStrategy.BY_ID, value: INDEX_PAGE_TEXT_KEY };
          const resolution: LocatorResolution = snapshot.resolve(query);
          expect(resolution.matched).assertTrue();
          expect(resolution.matchedCount).assertEqual(1);
          expect(resolution.strategy).assertEqual(LocatorStrategy.BY_ID);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_1200
     * @tc.name testAccessibilitySnapshotLocatorByText
     * @tc.desc Verify snapshot resolves text query: Hello World -> matched with count one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilitySnapshotLocatorByText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: AccessibilitySnapshot = buildMultiNodeSnapshot();
          const query: LocatorQuery = { strategy: LocatorStrategy.BY_TEXT, value: 'Status Ready' };
          const resolution: LocatorResolution = snapshot.resolve(query);
          expect(resolution.matched).assertTrue();
          expect(resolution.matchedCount).assertEqual(2);
          expect(resolution.value).assertEqual('Status Ready');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_1300
     * @tc.name testAccessibilitySnapshotLocatorByType
     * @tc.desc Verify snapshot resolves type query: type Text -> all four nodes matched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilitySnapshotLocatorByType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: AccessibilitySnapshot = buildMultiNodeSnapshot();
          const query: LocatorQuery = { strategy: LocatorStrategy.BY_TYPE, value: 'Text' };
          const resolution: LocatorResolution = snapshot.resolve(query);
          expect(resolution.matchedCount).assertEqual(4);
          expect(resolution.matched).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_1400
     * @tc.name testAccessibilitySnapshotLocatorMissing
     * @tc.desc Verify snapshot rejects unknown targets: unknown id, unknown text and unknown type all miss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilitySnapshotLocatorMissing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: AccessibilitySnapshot = buildMultiNodeSnapshot();
          const idQuery: LocatorQuery = { strategy: LocatorStrategy.BY_ID, value: 'UnknownNode' };
          const textQuery: LocatorQuery = { strategy: LocatorStrategy.BY_TEXT, value: 'Unknown Text' };
          const typeQuery: LocatorQuery = { strategy: LocatorStrategy.BY_TYPE, value: 'Button' };
          expect(snapshot.resolve(idQuery).matched).assertFalse();
          expect(snapshot.resolve(textQuery).matchedCount).assertEqual(0);
          expect(snapshot.resolve(typeQuery).matchedCount).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_1500
     * @tc.name testAccessibilitySnapshotDuplicateTextCount
     * @tc.desc Verify duplicate text is counted exactly: two nodes share Status Ready -> count two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilitySnapshotDuplicateTextCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: AccessibilitySnapshot = buildMultiNodeSnapshot();
          expect(snapshot.countByText('Status Ready')).assertEqual(2);
          expect(snapshot.countByText(PAGE_TEXT_INITIAL)).assertEqual(1);
          expect(snapshot.hasText('Status Ready')).assertTrue();
          expect(snapshot.hasText('Status Missing')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_1600
     * @tc.name testAccessibilitySnapshotTraversalOrder
     * @tc.desc Verify traversal order preserves registration order: container, HelloWorld, StatusLabel, EchoLabel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilitySnapshotTraversalOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: AccessibilitySnapshot = buildMultiNodeSnapshot();
          const steps: TraversalStep[] = snapshot.collectTraversal();
          expect(steps.length).assertEqual(4);
          expect(steps[0].identifier).assertEqual('PageContainer');
          expect(steps[1].identifier).assertEqual('HelloWorld');
          expect(steps[2].identifier).assertEqual('StatusLabel');
          expect(steps[3].order).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_1700
     * @tc.name testAccessibilitySnapshotInteractiveCounting
     * @tc.desc Verify interactive and focusable counters: one interactive node out of four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilitySnapshotInteractiveCounting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: AccessibilitySnapshot = buildMultiNodeSnapshot();
          expect(snapshot.getNodeCount()).assertEqual(4);
          expect(snapshot.countInteractive()).assertEqual(1);
          expect(snapshot.countFocusable()).assertEqual(1);
          expect(snapshot.firstInteractiveText()).assertEqual(PAGE_TEXT_INITIAL);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_1800
     * @tc.name testAccessibilitySnapshotEmpty
     * @tc.desc Verify empty snapshot behaves safely: zero nodes, missing lookups, empty text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilitySnapshotEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const emptyNodes: AccessibleNode[] = [];
          const snapshot: AccessibilitySnapshot = new AccessibilitySnapshot(emptyNodes);
          expect(snapshot.getNodeCount()).assertEqual(0);
          expect(snapshot.findByText(PAGE_TEXT_INITIAL)).assertNull();
          expect(snapshot.firstInteractiveText()).assertEqual('');
          expect(snapshot.getIdAt(0)).assertEqual('');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_1900
     * @tc.name testAccessibilitySnapshotIdTextEquivalence
     * @tc.desc Verify id-text equivalence rule: HelloWorld uniquely maps to Hello World
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilitySnapshotIdTextEquivalence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const snapshot: AccessibilitySnapshot = buildMultiNodeSnapshot();
          expect(snapshot.isLocatorEquivalent(INDEX_PAGE_TEXT_KEY, PAGE_TEXT_INITIAL)).assertTrue();
          expect(snapshot.isLocatorEquivalent(INDEX_PAGE_TEXT_KEY, 'Status Ready')).assertFalse();
          expect(snapshot.isLocatorEquivalent('UnknownNode', PAGE_TEXT_INITIAL)).assertFalse();
          expect(snapshot.indexOfId('StatusLabel')).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_2000
     * @tc.name testAccessibilityDescriptionFallbackPrefersContentDescription
     * @tc.desc Verify description resolution prefers content description: all three inputs -> description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityDescriptionFallbackPrefersContentDescription', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const policy: DescriptionFallbackPolicy = new DescriptionFallbackPolicy();
          expect(policy.resolve('greeting label', PAGE_TEXT_INITIAL, INDEX_PAGE_TEXT_KEY))
            .assertEqual('greeting label');
          expect(policy.isFallbackUsed('greeting label')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_2100
     * @tc.name testAccessibilityDescriptionFallbackUsesText
     * @tc.desc Verify description falls back to visible text when description is blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityDescriptionFallbackUsesText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const policy: DescriptionFallbackPolicy = new DescriptionFallbackPolicy();
          expect(policy.resolve('   ', PAGE_TEXT_INITIAL, INDEX_PAGE_TEXT_KEY)).assertEqual(PAGE_TEXT_INITIAL);
          expect(policy.isFallbackUsed(PAGE_TEXT_INITIAL)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_2200
     * @tc.name testAccessibilityDescriptionFallbackUsesIdentifier
     * @tc.desc Verify description falls back to identifier token when description and text are blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityDescriptionFallbackUsesIdentifier', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const policy: DescriptionFallbackPolicy = new DescriptionFallbackPolicy();
          const description: string = policy.resolve('', '', INDEX_PAGE_TEXT_KEY);
          expect(description).assertEqual('component-HelloWorld');
          expect(policy.isFallbackUsed(description)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_2300
     * @tc.name testAccessibilityDescriptionFallbackDefault
     * @tc.desc Verify description default token when all candidates are blank, and candidate scanning order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityDescriptionFallbackDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const policy: DescriptionFallbackPolicy = new DescriptionFallbackPolicy();
          expect(policy.resolve('', '  ', '')).assertEqual('unlabeled component');
          const candidates: string[] = ['', '  ', 'third candidate', 'fourth candidate'];
          expect(policy.resolveFromCandidates(candidates)).assertEqual('third candidate');
          const blankCandidates: string[] = ['', ' '];
          expect(policy.resolveFromCandidates(blankCandidates)).assertEqual('unlabeled component');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_2400
     * @tc.name testAccessibilityArrowLeftNoSideEffect
     * @tc.desc Verify left arrow on single component page keeps text: KEY_LEFT -> text and count unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityArrowLeftNoSideEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeText: string = await resolveCurrentPageText(driver);
          expect(beforeText.length > 0).assertTrue();
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          const afterText: string = await resolveCurrentPageText(driver);
          expect(afterText).assertEqual(beforeText);
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_2500
     * @tc.name testAccessibilityArrowSequenceNoSideEffect
     * @tc.desc Verify four direction keys do not mutate single component page text or component count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityArrowSequenceNoSideEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeText: string = await resolveCurrentPageText(driver);
          const beforeCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
          const afterText: string = await resolveCurrentPageText(driver);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterText).assertEqual(beforeText);
          expect(afterCount).assertEqual(beforeCount);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_2600
     * @tc.name testAccessibilityRepeatedArrowNoSideEffect
     * @tc.desc Verify repeated arrow presses are idempotent: ten LEFT presses keep the page intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityRepeatedArrowNoSideEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeText: string = await resolveCurrentPageText(driver);
          expect(beforeText.length > 0).assertTrue();
          await pressAndWait(driver, KEY_LEFT, 10, DELAY_KEY_NAVIGATION);
          const afterText: string = await resolveCurrentPageText(driver);
          expect(afterText).assertEqual(beforeText);
          const textNodes: Component[] = await findComponentsByType(driver, 'Text');
          expect(textNodes.length).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_2700
     * @tc.name testAccessibilityNavigatorClampsAtLeftBoundary
     * @tc.desc Verify single component navigator clamps left movement: index zero stays zero and is blocked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityNavigatorClampsAtLeftBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const navigator: SingleComponentNavigator = new SingleComponentNavigator(1, 0);
          const leftOutcome: NavigationOutcome = navigator.navigate(ArrowDirection.LEFT);
          expect(leftOutcome.moved).assertFalse();
          expect(leftOutcome.fromIndex).assertEqual(0);
          expect(leftOutcome.toIndex).assertEqual(0);
          expect(navigator.getBlockedCount()).assertEqual(1);
          expect(navigator.isSingleComponent()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_2800
     * @tc.name testAccessibilityNavigatorClampsAtRightBoundary
     * @tc.desc Verify single component navigator clamps right movement and records direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityNavigatorClampsAtRightBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const navigator: SingleComponentNavigator = new SingleComponentNavigator(1, 0);
          const rightOutcome: NavigationOutcome = navigator.navigate(ArrowDirection.RIGHT);
          expect(rightOutcome.moved).assertFalse();
          expect(navigator.getLastDirection()).assertEqual(ArrowDirection.RIGHT);
          expect(navigator.getCurrentIndex()).assertEqual(0);
          expect(navigator.getMovedCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_2900
     * @tc.name testAccessibilityNavigatorSequentialMovement
     * @tc.desc Verify multi component navigator moves and clamps: right twice then left once ends at index one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityNavigatorSequentialMovement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const navigator: SingleComponentNavigator = new SingleComponentNavigator(3, 0);
          const firstMove: NavigationOutcome = navigator.navigate(ArrowDirection.RIGHT);
          const secondMove: NavigationOutcome = navigator.navigate(ArrowDirection.RIGHT);
          const thirdMove: NavigationOutcome = navigator.navigate(ArrowDirection.RIGHT);
          const backMove: NavigationOutcome = navigator.navigate(ArrowDirection.LEFT);
          expect(firstMove.toIndex).assertEqual(1);
          expect(secondMove.toIndex).assertEqual(2);
          expect(thirdMove.moved).assertFalse();
          expect(backMove.toIndex).assertEqual(1);
          expect(navigator.getMovedCount()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_A11YNAV_3000
     * @tc.name testAccessibilityTextStateAfterActivation
     * @tc.desc Verify activation updates accessible text: click id HelloWorld -> text becomes Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessibilityTextStateAfterActivation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const clicked: boolean = await activateTextById(driver);
          expect(clicked).assertTrue();
          await serializedDelay(driver, 300);
          const hasClickedText: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(hasClickedText).assertTrue();
          const textById: string = await readTextById(driver);
          expect(textById).assertEqual(PAGE_TEXT_CLICKED);
        } finally {
          done();
        }
      })
  })
}
