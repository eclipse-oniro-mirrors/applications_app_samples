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
import { Driver, Component } from '@ohos.UiTest';
import {
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_AFTER_LAUNCH,
  getDriver,
  launchEntryAbility,
  waitForIndexPageStable,
  waitForTextVisible,
  checkComponentExistsByKey,
  checkTextContent,
  findComponentsByText,
  collectAllTexts,
  tapComponentByText,
  getCurrentFocusIndex,
  checkFocusState,
  pageComponentCount,
  serializedDelay,
  logInfo,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum AccessibleRole {
  ROLE_TEXT = 'text',
  ROLE_BUTTON = 'button',
  ROLE_UNKNOWN = 'unknown'
}

enum PrivacyClass {
  CLASS_PUBLIC = 'public',
  CLASS_INTERNAL = 'internal',
  CLASS_SENSITIVE = 'sensitive'
}

interface AccessibleNode {
  nodeId: string;
  role: AccessibleRole;
  visibleText: string;
  description: string;
  privacy: PrivacyClass;
  focusable: boolean;
}

interface SensitivePattern {
  pattern: string;
  privacy: PrivacyClass;
}

const UNKNOWN_ID: string = 'NotDeclaredNodeId';

const EMPTY_TEXT: string = '';

const FALLBACK_DESCRIPTION_PREFIX: string = 'text:';

const SENSITIVE_PATTERNS: SensitivePattern[] = [
  { pattern: 'password', privacy: PrivacyClass.CLASS_SENSITIVE },
  { pattern: 'token', privacy: PrivacyClass.CLASS_SENSITIVE },
  { pattern: 'secret', privacy: PrivacyClass.CLASS_SENSITIVE },
  { pattern: 'bundleName', privacy: PrivacyClass.CLASS_INTERNAL },
  { pattern: 'versionCode', privacy: PrivacyClass.CLASS_INTERNAL },
  { pattern: 'com.samples', privacy: PrivacyClass.CLASS_INTERNAL }
];

const ALLOWED_PAGE_TEXTS: string[] = [PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED];

class AccessibilityIndex {
  private nodes: AccessibleNode[] = [];

  public add(node: AccessibleNode): boolean {
    if (this.indexOfNode(node.nodeId) >= 0) {
      return false;
    }
    this.nodes.push(node);
    return true;
  }

  public indexOfNode(nodeId: string): number {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].nodeId === nodeId) {
        return i;
      }
    }
    return -1;
  }

  public size(): number {
    return this.nodes.length;
  }

  public isQueryable(nodeId: string): boolean {
    return this.indexOfNode(nodeId) >= 0;
  }

  public textOf(nodeId: string): string {
    const index: number = this.indexOfNode(nodeId);
    if (index < 0) {
      return EMPTY_TEXT;
    }
    return this.nodes[index].visibleText;
  }

  public descriptionOf(nodeId: string): string {
    const index: number = this.indexOfNode(nodeId);
    if (index < 0) {
      return EMPTY_TEXT;
    }
    return this.nodes[index].description;
  }

  public effectiveDescription(nodeId: string): string {
    const declared: string = this.descriptionOf(nodeId);
    if (declared.length > 0) {
      return declared;
    }
    const visible: string = this.textOf(nodeId);
    if (visible.length > 0) {
      return FALLBACK_DESCRIPTION_PREFIX + visible;
    }
    return EMPTY_TEXT;
  }

  public focusableCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].focusable) {
        count++;
      }
    }
    return count;
  }

  public focusOrder(): string[] {
    const order: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].focusable) {
        order.push(this.nodes[i].nodeId);
      }
    }
    return order;
  }

  public focusIndexOf(nodeId: string): number {
    const order: string[] = this.focusOrder();
    for (let i = 0; i < order.length; i++) {
      if (order[i] === nodeId) {
        return i;
      }
    }
    return -1;
  }

  public privacyOf(nodeId: string): PrivacyClass {
    const index: number = this.indexOfNode(nodeId);
    if (index < 0) {
      return PrivacyClass.CLASS_PUBLIC;
    }
    return this.nodes[index].privacy;
  }

  public sensitiveNodes(): string[] {
    const found: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].privacy === PrivacyClass.CLASS_SENSITIVE) {
        found.push(this.nodes[i].nodeId);
      }
    }
    return found;
  }

  public roleOf(nodeId: string): AccessibleRole {
    const index: number = this.indexOfNode(nodeId);
    if (index < 0) {
      return AccessibleRole.ROLE_UNKNOWN;
    }
    return this.nodes[index].role;
  }
}

class DisclosureScanner {
  private allowed: string[] = [];

  constructor(allowed: string[]) {
    this.allowed = allowed;
  }

  public isAllowed(text: string): boolean {
    return this.allowed.indexOf(text) >= 0;
  }

  public violations(texts: string[]): string[] {
    const found: string[] = [];
    for (let i = 0; i < texts.length; i++) {
      if (!this.isAllowed(texts[i])) {
        found.push(texts[i]);
      }
    }
    return found;
  }

  public matchPrivacy(text: string): PrivacyClass {
    const lowered: string = text.toLowerCase();
    for (let i = 0; i < SENSITIVE_PATTERNS.length; i++) {
      if (lowered.indexOf(SENSITIVE_PATTERNS[i].pattern.toLowerCase()) >= 0) {
        return SENSITIVE_PATTERNS[i].privacy;
      }
    }
    return PrivacyClass.CLASS_PUBLIC;
  }

  public containsSensitiveMaterial(text: string): boolean {
    return this.matchPrivacy(text) === PrivacyClass.CLASS_SENSITIVE;
  }

  public highestPrivacy(texts: string[]): PrivacyClass {
    let highest: PrivacyClass = PrivacyClass.CLASS_PUBLIC;
    for (let i = 0; i < texts.length; i++) {
      const level: PrivacyClass = this.matchPrivacy(texts[i]);
      if (level === PrivacyClass.CLASS_SENSITIVE) {
        return PrivacyClass.CLASS_SENSITIVE;
      }
      if (level === PrivacyClass.CLASS_INTERNAL) {
        highest = PrivacyClass.CLASS_INTERNAL;
      }
    }
    return highest;
  }

  public allowedCount(): number {
    return this.allowed.length;
  }
}

class FocusTraversalModel {
  private order: string[] = [];

  private current: number = 0;

  public load(order: string[]): void {
    this.order = order;
    this.current = order.length > 0 ? 0 : -1;
  }

  public size(): number {
    return this.order.length;
  }

  public currentIndex(): number {
    return this.current;
  }

  public currentId(): string {
    if (this.current < 0 || this.current >= this.order.length) {
      return EMPTY_TEXT;
    }
    return this.order[this.current];
  }

  public moveNext(): number {
    if (this.order.length === 0) {
      return -1;
    }
    this.current = (this.current + 1) % this.order.length;
    return this.current;
  }

  public movePrevious(): number {
    if (this.order.length === 0) {
      return -1;
    }
    this.current = (this.current - 1 + this.order.length) % this.order.length;
    return this.current;
  }

  public cycleFull(): number {
    let visited: number = 1;
    const start: number = this.current;
    do {
      this.moveNext();
      visited++;
    } while (this.current !== start && visited <= this.order.length + 1);
    return visited - 1;
  }

  public isReachable(nodeId: string): boolean {
    return this.order.indexOf(nodeId) >= 0;
  }
}

class PrivacyMarker {
  private marked: string[] = [];

  public mark(nodeId: string): boolean {
    if (this.marked.indexOf(nodeId) >= 0) {
      return false;
    }
    this.marked.push(nodeId);
    return true;
  }

  public unmark(nodeId: string): boolean {
    const index: number = this.marked.indexOf(nodeId);
    if (index < 0) {
      return false;
    }
    this.marked.splice(index, 1);
    return true;
  }

  public isMarked(nodeId: string): boolean {
    return this.marked.indexOf(nodeId) >= 0;
  }

  public count(): number {
    return this.marked.length;
  }
}

function buildIndexPageIndex(): AccessibilityIndex {
  const index: AccessibilityIndex = new AccessibilityIndex();
  const pageText: AccessibleNode = {
    nodeId: INDEX_PAGE_TEXT_KEY,
    role: AccessibleRole.ROLE_TEXT,
    visibleText: PAGE_TEXT_INITIAL,
    description: 'page welcome text',
    privacy: PrivacyClass.CLASS_PUBLIC,
    focusable: true
  };
  index.add(pageText);
  return index;
}

export default function securityAccessibilityTest(): void {
  describe('SecurityAccessibilityTest', () => {
    let driver: Driver = getDriver();
    let pageIndex: AccessibilityIndex = buildIndexPageIndex();
    let scanner: DisclosureScanner = new DisclosureScanner(ALLOWED_PAGE_TEXTS);

    beforeAll(async (): Promise<void> => {
      driver = getDriver();
      pageIndex = buildIndexPageIndex();
      scanner = new DisclosureScanner(ALLOWED_PAGE_TEXTS);
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      logInfo('securityAccessibilityTest: a11y index prepared');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async (): Promise<void> => {
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      logInfo('securityAccessibilityTest: finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_0100
     * @tc.name testDeclaredNodeIdIsQueryable
     * @tc.desc Verify the declared a11y id HelloWorld resolves on the live page while an undeclared id does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeclaredNodeIdIsQueryable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const declared: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          const undeclared: boolean = await checkComponentExistsByKey(driver, UNKNOWN_ID);
          expect(declared).assertTrue();
          expect(undeclared).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_0200
     * @tc.name testDeclaredIdReadsDeclaredText
     * @tc.desc Verify the declared node id resolves to exactly one visible node whose text is one of the two allowed literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeclaredIdReadsDeclaredText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(pageIndex.isQueryable(INDEX_PAGE_TEXT_KEY)).assertTrue();
          expect(pageIndex.textOf(INDEX_PAGE_TEXT_KEY)).assertEqual(PAGE_TEXT_INITIAL);
          const initialNodes: Component[] = await findComponentsByText(driver, PAGE_TEXT_INITIAL);
          const clickedNodes: Component[] = await findComponentsByText(driver, PAGE_TEXT_CLICKED);
          expect(initialNodes.length + clickedNodes.length).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_0300
     * @tc.name testUnknownIdReturnsNoText
     * @tc.desc Verify an undeclared node id is not queryable, yields empty payloads, and is absent from the live tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnknownIdReturnsNoText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(pageIndex.isQueryable(UNKNOWN_ID)).assertFalse();
          expect(pageIndex.textOf(UNKNOWN_ID)).assertEqual('');
          expect(pageIndex.descriptionOf(UNKNOWN_ID)).assertEqual('');
          expect(pageIndex.roleOf(UNKNOWN_ID)).assertEqual(AccessibleRole.ROLE_UNKNOWN);
          expect(pageIndex.size()).assertEqual(1);
          expect(pageIndex.isQueryable(INDEX_PAGE_TEXT_KEY)).assertTrue();
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const liveUnknown: boolean = await checkComponentExistsByKey(driver, UNKNOWN_ID);
          expect(liveUnknown).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_0400
     * @tc.name testPageTextSetContainsOnlyAllowedValues
     * @tc.desc Verify the live page text set carries no entry outside the allowed Hello World and Welcome pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageTextSetContainsOnlyAllowedValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const texts: string[] = await collectAllTexts(driver);
          const violations: string[] = scanner.violations(texts);
          expect(violations.length).assertEqual(0);
          expect(scanner.allowedCount()).assertEqual(2);
          const initialSeen: boolean = texts.indexOf(PAGE_TEXT_INITIAL) >= 0;
          const clickedSeen: boolean = texts.indexOf(PAGE_TEXT_CLICKED) >= 0;
          expect(initialSeen || clickedSeen).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_0500
     * @tc.name testPageTextNeverCarriesBundleName
     * @tc.desc Verify the declared bundle identifier com.samples.abilitystage never surfaces as readable page text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageTextNeverCarriesBundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const bundleNodes: Component[] = await findComponentsByText(driver, 'com.samples.abilitystage');
          expect(bundleNodes.length).assertEqual(0);
          const texts: string[] = await collectAllTexts(driver);
          let bundleHits: number = 0;
          for (let i = 0; i < texts.length; i++) {
            if (texts[i].indexOf('com.samples') >= 0) {
              bundleHits++;
            }
          }
          expect(bundleHits).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_0600
     * @tc.name testScannerFlagsInjectedSecretText
     * @tc.desc Verify the disclosure scanner flags a token-bearing string as sensitive and a plain one as public
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScannerFlagsInjectedSecretText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(scanner.containsSensitiveMaterial('access token abc')).assertTrue();
          expect(scanner.containsSensitiveMaterial('user password field')).assertTrue();
          expect(scanner.matchPrivacy('access token abc')).assertEqual(PrivacyClass.CLASS_SENSITIVE);
          expect(scanner.matchPrivacy(PAGE_TEXT_INITIAL)).assertEqual(PrivacyClass.CLASS_PUBLIC);
          expect(scanner.containsSensitiveMaterial(PAGE_TEXT_INITIAL)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_0700
     * @tc.name testScannerClassifiesInternalIdentifier
     * @tc.desc Verify an internal identifier such as versionCode maps to internal while a clean string stays public
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScannerClassifiesInternalIdentifier', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(scanner.matchPrivacy('versionCode 1000000')).assertEqual(PrivacyClass.CLASS_INTERNAL);
          expect(scanner.matchPrivacy('bundleName com.samples.abilitystage'))
            .assertEqual(PrivacyClass.CLASS_INTERNAL);
          expect(scanner.containsSensitiveMaterial('versionCode 1000000')).assertFalse();
          expect(scanner.matchPrivacy('Welcome')).assertEqual(PrivacyClass.CLASS_PUBLIC);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_0800
     * @tc.name testHighestPrivacyOverMixedCollection
     * @tc.desc Verify the highest privacy of an empty set is public, a mixed set is sensitive, and internal-only set internal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHighestPrivacyOverMixedCollection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const emptyTexts: string[] = [];
          expect(scanner.highestPrivacy(emptyTexts)).assertEqual(PrivacyClass.CLASS_PUBLIC);
          const internalTexts: string[] = ['versionCode 1000000', PAGE_TEXT_INITIAL];
          expect(scanner.highestPrivacy(internalTexts)).assertEqual(PrivacyClass.CLASS_INTERNAL);
          const mixedTexts: string[] = [PAGE_TEXT_INITIAL, 'secret material', 'versionCode 1'];
          expect(scanner.highestPrivacy(mixedTexts)).assertEqual(PrivacyClass.CLASS_SENSITIVE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_0900
     * @tc.name testDescriptionFallsBackToVisibleText
     * @tc.desc Verify a node without a declared description falls back to a text-derived description, not an empty one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDescriptionFallsBackToVisibleText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const fallbackIndex: AccessibilityIndex = new AccessibilityIndex();
          const bareNode: AccessibleNode = {
            nodeId: INDEX_PAGE_TEXT_KEY,
            role: AccessibleRole.ROLE_TEXT,
            visibleText: PAGE_TEXT_INITIAL,
            description: EMPTY_TEXT,
            privacy: PrivacyClass.CLASS_PUBLIC,
            focusable: true
          };
          fallbackIndex.add(bareNode);
          expect(fallbackIndex.descriptionOf(INDEX_PAGE_TEXT_KEY)).assertEqual('');
          expect(fallbackIndex.effectiveDescription(INDEX_PAGE_TEXT_KEY))
            .assertEqual('text:' + PAGE_TEXT_INITIAL);
          expect(fallbackIndex.effectiveDescription(INDEX_PAGE_TEXT_KEY).indexOf('Hello World') >= 0)
            .assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_1000
     * @tc.name testDeclaredDescriptionWinsOverFallback
     * @tc.desc Verify a declared description is returned verbatim instead of the text fallback value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeclaredDescriptionWinsOverFallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(pageIndex.descriptionOf(INDEX_PAGE_TEXT_KEY)).assertEqual('page welcome text');
          expect(pageIndex.effectiveDescription(INDEX_PAGE_TEXT_KEY)).assertEqual('page welcome text');
          expect(pageIndex.effectiveDescription(INDEX_PAGE_TEXT_KEY))
            .assertEqual(pageIndex.descriptionOf(INDEX_PAGE_TEXT_KEY));
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_1100
     * @tc.name testEmptyNodeHasNoEffectiveDescription
     * @tc.desc Verify a node with neither description nor visible text produces an empty effective description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyNodeHasNoEffectiveDescription', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const sparseIndex: AccessibilityIndex = new AccessibilityIndex();
          const silentNode: AccessibleNode = {
            nodeId: 'SilentNode',
            role: AccessibleRole.ROLE_UNKNOWN,
            visibleText: EMPTY_TEXT,
            description: EMPTY_TEXT,
            privacy: PrivacyClass.CLASS_INTERNAL,
            focusable: false
          };
          sparseIndex.add(silentNode);
          expect(sparseIndex.effectiveDescription('SilentNode')).assertEqual('');
          expect(sparseIndex.focusableCount()).assertEqual(0);
          expect(sparseIndex.sensitiveNodes().length).assertEqual(0);
          expect(sparseIndex.roleOf('SilentNode')).assertEqual(AccessibleRole.ROLE_UNKNOWN);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_1200
     * @tc.name testDuplicateNodeIdIsRejected
     * @tc.desc Verify a second registration with the same node id is rejected and the index size stays at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDuplicateNodeIdIsRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localIndex: AccessibilityIndex = buildIndexPageIndex();
          const duplicate: AccessibleNode = {
            nodeId: INDEX_PAGE_TEXT_KEY,
            role: AccessibleRole.ROLE_BUTTON,
            visibleText: PAGE_TEXT_CLICKED,
            description: 'duplicate node',
            privacy: PrivacyClass.CLASS_SENSITIVE,
            focusable: false
          };
          expect(localIndex.add(duplicate)).assertFalse();
          expect(localIndex.size()).assertEqual(1);
          expect(localIndex.textOf(INDEX_PAGE_TEXT_KEY)).assertEqual(PAGE_TEXT_INITIAL);
          expect(localIndex.roleOf(INDEX_PAGE_TEXT_KEY)).assertEqual(AccessibleRole.ROLE_TEXT);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_1300
     * @tc.name testSensitiveNodeDiscovery
     * @tc.desc Verify exactly the sensitive-marked nodes are reported and plain nodes are excluded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSensitiveNodeDiscovery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localIndex: AccessibilityIndex = new AccessibilityIndex();
          const plainNode: AccessibleNode = {
            nodeId: 'PlainNode',
            role: AccessibleRole.ROLE_TEXT,
            visibleText: PAGE_TEXT_INITIAL,
            description: 'plain',
            privacy: PrivacyClass.CLASS_PUBLIC,
            focusable: false
          };
          const secretNode: AccessibleNode = {
            nodeId: 'SecretNode',
            role: AccessibleRole.ROLE_TEXT,
            visibleText: 'token value',
            description: 'secret',
            privacy: PrivacyClass.CLASS_SENSITIVE,
            focusable: false
          };
          localIndex.add(plainNode);
          localIndex.add(secretNode);
          expect(localIndex.sensitiveNodes().length).assertEqual(1);
          expect(localIndex.sensitiveNodes()[0]).assertEqual('SecretNode');
          expect(localIndex.privacyOf('PlainNode')).assertEqual(PrivacyClass.CLASS_PUBLIC);
          expect(localIndex.privacyOf('SecretNode')).assertEqual(PrivacyClass.CLASS_SENSITIVE);
          expect(localIndex.privacyOf(UNKNOWN_ID)).assertEqual(PrivacyClass.CLASS_PUBLIC);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_1400
     * @tc.name testFocusTraversalWrapsForward
     * @tc.desc Verify focus advances forward and wraps from the last node back to the first across 3 nodes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusTraversalWrapsForward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const traversal: FocusTraversalModel = new FocusTraversalModel();
          const order: string[] = ['nodeA', 'nodeB', 'nodeC'];
          traversal.load(order);
          expect(traversal.size()).assertEqual(3);
          expect(traversal.currentId()).assertEqual('nodeA');
          expect(traversal.moveNext()).assertEqual(1);
          expect(traversal.currentId()).assertEqual('nodeB');
          traversal.moveNext();
          expect(traversal.currentId()).assertEqual('nodeC');
          expect(traversal.moveNext()).assertEqual(0);
          expect(traversal.currentId()).assertEqual('nodeA');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_1500
     * @tc.name testFocusTraversalWrapsBackward
     * @tc.desc Verify focus moves backward and wraps from the first node to the last one across 3 nodes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusTraversalWrapsBackward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const traversal: FocusTraversalModel = new FocusTraversalModel();
          const order: string[] = ['nodeA', 'nodeB', 'nodeC'];
          traversal.load(order);
          expect(traversal.movePrevious()).assertEqual(2);
          expect(traversal.currentId()).assertEqual('nodeC');
          expect(traversal.movePrevious()).assertEqual(1);
          expect(traversal.currentId()).assertEqual('nodeB');
          expect(traversal.cycleFull()).assertEqual(3);
          expect(traversal.currentId()).assertEqual('nodeB');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_1600
     * @tc.name testFocusTraversalOnEmptyOrder
     * @tc.desc Verify an empty focus order yields index -1, an empty id, and moves that stay at -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusTraversalOnEmptyOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const traversal: FocusTraversalModel = new FocusTraversalModel();
          const emptyOrder: string[] = [];
          traversal.load(emptyOrder);
          expect(traversal.size()).assertEqual(0);
          expect(traversal.currentIndex()).assertEqual(-1);
          expect(traversal.currentId()).assertEqual('');
          expect(traversal.moveNext()).assertEqual(-1);
          expect(traversal.movePrevious()).assertEqual(-1);
          expect(traversal.isReachable('nodeA')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_1700
     * @tc.name testFocusOrderKeepsOnlyFocusableNodes
     * @tc.desc Verify the focus order is derived from focusable nodes only and exposes the page text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusOrderKeepsOnlyFocusableNodes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localIndex: AccessibilityIndex = new AccessibilityIndex();
          const focusableNode: AccessibleNode = {
            nodeId: INDEX_PAGE_TEXT_KEY,
            role: AccessibleRole.ROLE_TEXT,
            visibleText: PAGE_TEXT_INITIAL,
            description: 'page welcome text',
            privacy: PrivacyClass.CLASS_PUBLIC,
            focusable: true
          };
          const staticNode: AccessibleNode = {
            nodeId: 'StaticLabel',
            role: AccessibleRole.ROLE_TEXT,
            visibleText: 'static',
            description: 'static label',
            privacy: PrivacyClass.CLASS_PUBLIC,
            focusable: false
          };
          localIndex.add(focusableNode);
          localIndex.add(staticNode);
          expect(localIndex.focusableCount()).assertEqual(1);
          expect(localIndex.focusOrder().length).assertEqual(1);
          expect(localIndex.focusOrder()[0]).assertEqual(INDEX_PAGE_TEXT_KEY);
          expect(localIndex.focusIndexOf('StaticLabel')).assertEqual(-1);
          expect(localIndex.focusIndexOf(INDEX_PAGE_TEXT_KEY)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_1800
     * @tc.name testRuntimeFocusIsReachable
     * @tc.desc Verify the live page reports a reachable focus target within the focus change timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeFocusIsReachable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const hasFocus: boolean = await checkFocusState(driver, -1);
          expect(hasFocus).assertTrue();
          const focusIndex: number = await getCurrentFocusIndex(driver);
          const componentCount: number = await pageComponentCount(driver);
          expect(focusIndex >= 0).assertTrue();
          expect(focusIndex < componentCount).assertTrue();
          logInfo(`testRuntimeFocusIsReachable: focus index ${focusIndex} of ${componentCount}`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_1900
     * @tc.name testRuntimeFocusStableAfterIdle
     * @tc.desc Verify the focus index stays unchanged across an idle window shorter than the focus timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeFocusStableAfterIdle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const firstIndex: number = await getCurrentFocusIndex(driver);
          await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
          const secondIndex: number = await getCurrentFocusIndex(driver);
          expect(secondIndex).assertEqual(firstIndex);
          expect(firstIndex >= 0).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          expect(firstIndex < componentCount).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_2000
     * @tc.name testRuntimeClickRevealsOnlyAllowedText
     * @tc.desc Verify the page converges to Welcome on click and the readable text set stays inside the allow list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeClickRevealsOnlyAllowedText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const alreadyWelcome: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(initialVisible || alreadyWelcome).assertTrue();
          if (initialVisible) {
            const tapped: boolean = await tapComponentByText(driver, PAGE_TEXT_INITIAL);
            expect(tapped).assertTrue();
          }
          const welcome: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_ABILITY_LAUNCH);
          expect(welcome).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(scanner.violations(texts).length).assertEqual(0);
          expect(texts.indexOf(PAGE_TEXT_CLICKED) >= 0).assertTrue();
          expect(texts.indexOf(PAGE_TEXT_INITIAL)).assertEqual(-1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_2100
     * @tc.name testPrivacyMarkerLifecycle
     * @tc.desc Verify marking is idempotent, unmarking removes exactly once, and counting reflects each state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPrivacyMarkerLifecycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const marker: PrivacyMarker = new PrivacyMarker();
          expect(marker.count()).assertEqual(0);
          expect(marker.mark('SecretNode')).assertTrue();
          expect(marker.mark('SecretNode')).assertFalse();
          expect(marker.count()).assertEqual(1);
          expect(marker.isMarked('SecretNode')).assertTrue();
          expect(marker.unmark('SecretNode')).assertTrue();
          expect(marker.unmark('SecretNode')).assertFalse();
          expect(marker.count()).assertEqual(0);
          expect(marker.isMarked('SecretNode')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECA11Y_2200
     * @tc.name testPrivacyMarkerTracksMultipleNodes
     * @tc.desc Verify the marker tracks 2 distinct nodes independently and leaves an unmarked third node out
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPrivacyMarkerTracksMultipleNodes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const marker: PrivacyMarker = new PrivacyMarker();
          marker.mark('nodeAlpha');
          marker.mark('nodeBeta');
          expect(marker.count()).assertEqual(2);
          expect(marker.isMarked('nodeAlpha')).assertTrue();
          expect(marker.isMarked('nodeBeta')).assertTrue();
          expect(marker.isMarked('nodeGamma')).assertFalse();
          marker.unmark('nodeAlpha');
          expect(marker.count()).assertEqual(1);
          expect(marker.isMarked('nodeBeta')).assertTrue();
        } finally {
          done();
        }
      })
  })
}
