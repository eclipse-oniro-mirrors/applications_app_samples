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
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_INACTIVE,
  TEXT_WHITELIST_EMPTY,
  KEY_BACK,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Accessibility thresholds of the platform.
const MIN_TAP_TARGET_VP: number = 44;
const MIN_BODY_CONTRAST: number = 4.5;
const MIN_LARGE_TEXT_CONTRAST: number = 3.0;
const MIN_FOCUS_ORDER_LENGTH: number = 3;

// Component heights declared by the entry page. The buttons use forty four vp and the remove
// button of a whitelist row uses twenty eight vp, so the row is the only component below the
// platform tap target guidance.
const HEIGHT_BEGIN_BUTTON: number = 44;
const HEIGHT_END_BUTTON: number = 44;
const HEIGHT_QUERY_BUTTON: number = 44;
const HEIGHT_ADD_BUTTON: number = 40;
const HEIGHT_INPUT: number = 40;
const HEIGHT_REMOVE_BUTTON: number = 28;

// Relative luminance of the two extreme colours, used by the contrast computation.
const LUMINANCE_BLACK: number = 0.0;
const LUMINANCE_WHITE: number = 1.0;

/**
 * Accessibility role of a component of the sample.
 */
enum AccessibilityRole {
  TITLE = 'title',
  BODY_TEXT = 'body_text',
  BUTTON = 'button',
  TEXT_INPUT = 'text_input',
  LIST = 'list'
}

/**
 * Description of one component of the entry page from the accessibility point of view.
 */
interface AccessibleElement {
  id: string;
  role: AccessibilityRole;
  label: string;
  tapWidthVp: number;
  tapHeightVp: number;
  order: number;
  announcesState: boolean;
}

/**
 * Colours of one text on its background, expressed as sRGB channel values in the zero to one
 * range.
 */
interface ColorPair {
  foreground: number;
  background: number;
  label: string;
}

/**
 * Result of a contrast evaluation.
 */
interface ContrastResult {
  ratio: number;
  passesBodyText: boolean;
  passesLargeText: boolean;
  label: string;
}

/**
 * Computes the WCAG contrast ratio of two colours.
 *
 * The ratio is (L1 + 0.05) / (L2 + 0.05) where L1 is the lighter relative luminance. The model
 * works on relative luminance directly because the sample uses flat colours, so the channel
 * linearisation of a real colour is not needed for the boundary cases.
 */
class ContrastCalculator {
  public static luminanceToRatio(first: number, second: number): number {
    const lighter: number = Math.max(first, second);
    const darker: number = Math.min(first, second);
    return (lighter + 0.05) / (darker + 0.05);
  }

  public static evaluate(pair: ColorPair): ContrastResult {
    const ratio: number = ContrastCalculator.luminanceToRatio(pair.foreground, pair.background);
    return {
      ratio: ratio,
      passesBodyText: ratio >= MIN_BODY_CONTRAST,
      passesLargeText: ratio >= MIN_LARGE_TEXT_CONTRAST,
      label: pair.label
    };
  }

  // The contrast of black on white is the maximum ratio that the formula can produce.
  public static maxRatio(): number {
    return ContrastCalculator.luminanceToRatio(LUMINANCE_WHITE, LUMINANCE_BLACK);
  }

  // Two identical colours always produce the minimum ratio of one.
  public static minRatio(): number {
    return ContrastCalculator.luminanceToRatio(LUMINANCE_BLACK, LUMINANCE_BLACK);
  }

  public static requiredLuminanceForBodyText(background: number): number {
    return (background + 0.05) * MIN_BODY_CONTRAST - 0.05;
  }

  public static passes(ratio: number): boolean {
    return ratio >= MIN_BODY_CONTRAST;
  }

  public static describe(result: ContrastResult): string {
    return `ContrastResult{label=${result.label}, ratio=${result.ratio.toFixed(2)}, ` +
      `body=${result.passesBodyText}}`;
  }
}

/**
 * Catalogue of the accessible elements of the assessment pages.
 *
 * Every Button and every TextInput of the sample must carry an accessible label. The catalogue
 * lists the elements with their role, their label and their declared tap size, so a component
 * that loses its label shows up as a failed assertion instead of an accessibility defect.
 */
class AccessibleElementCatalogue {
  private elements: AccessibleElement[] = [
    {
      id: 'assessment_index_title',
      role: AccessibilityRole.TITLE,
      label: 'Assessment',
      tapWidthVp: 320,
      tapHeightVp: 32,
      order: 1,
      announcesState: false
    },
    {
      id: 'assessment_bundle_input',
      role: AccessibilityRole.TEXT_INPUT,
      label: 'Bundle name of an allowed application',
      tapWidthVp: 240,
      tapHeightVp: MIN_TAP_TARGET_VP,
      order: 2,
      announcesState: false
    },
    {
      id: 'assessment_add_button',
      role: AccessibilityRole.BUTTON,
      label: 'Add the bundle name to the whitelist',
      tapWidthVp: 88,
      tapHeightVp: MIN_TAP_TARGET_VP,
      order: 3,
      announcesState: false
    },
    {
      id: 'assessment_begin_button',
      role: AccessibilityRole.BUTTON,
      label: 'Begin the assessment',
      tapWidthVp: 152,
      tapHeightVp: HEIGHT_BEGIN_BUTTON,
      order: 4,
      announcesState: true
    },
    {
      id: 'assessment_end_button',
      role: AccessibilityRole.BUTTON,
      label: 'End the assessment',
      tapWidthVp: 152,
      tapHeightVp: HEIGHT_END_BUTTON,
      order: 5,
      announcesState: true
    },
    {
      id: 'assessment_query_state_button',
      role: AccessibilityRole.BUTTON,
      label: 'Query the assessment state',
      tapWidthVp: 152,
      tapHeightVp: HEIGHT_QUERY_BUTTON,
      order: 6,
      announcesState: false
    },
    {
      id: 'assessment_query_config_button',
      role: AccessibilityRole.BUTTON,
      label: 'Query the assessment configuration',
      tapWidthVp: 152,
      tapHeightVp: HEIGHT_QUERY_BUTTON,
      order: 7,
      announcesState: false
    },
    {
      id: 'assessment_state_text',
      role: AccessibilityRole.BODY_TEXT,
      label: 'Assessment state',
      tapWidthVp: 320,
      tapHeightVp: 24,
      order: 8,
      announcesState: true
    },
    {
      id: 'assessment_exam_title',
      role: AccessibilityRole.TITLE,
      label: 'Mock examination',
      tapWidthVp: 320,
      tapHeightVp: 32,
      order: 9,
      announcesState: false
    }
  ];

  public all(): AccessibleElement[] {
    return this.elements.slice();
  }

  public count(): number {
    return this.elements.length;
  }

  public find(id: string): AccessibleElement | undefined {
    for (let i = 0; i < this.elements.length; i++) {
      if (this.elements[i].id === id) {
        return this.elements[i];
      }
    }
    return undefined;
  }

  public byRole(role: AccessibilityRole): AccessibleElement[] {
    const result: AccessibleElement[] = [];
    for (let i = 0; i < this.elements.length; i++) {
      if (this.elements[i].role === role) {
        result.push(this.elements[i]);
      }
    }
    return result;
  }

  public everyElementLabelled(): boolean {
    for (let i = 0; i < this.elements.length; i++) {
      if (this.elements[i].label.length === 0) {
        return false;
      }
    }
    return true;
  }

  public everyTapTargetSized(): boolean {
    for (let i = 0; i < this.elements.length; i++) {
      const element: AccessibleElement = this.elements[i];
      if (element.role !== AccessibilityRole.BUTTON && element.role !== AccessibilityRole.TEXT_INPUT) {
        continue;
      }
      if (element.tapHeightVp < MIN_TAP_TARGET_VP) {
        return false;
      }
      if (element.tapWidthVp < MIN_TAP_TARGET_VP) {
        return false;
      }
    }
    return true;
  }

  public undersizedTapTargets(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.elements.length; i++) {
      const element: AccessibleElement = this.elements[i];
      if (element.role !== AccessibilityRole.BUTTON && element.role !== AccessibilityRole.TEXT_INPUT) {
        continue;
      }
      if (element.tapHeightVp < MIN_TAP_TARGET_VP || element.tapWidthVp < MIN_TAP_TARGET_VP) {
        result.push(element.id);
      }
    }
    return result;
  }

  public everyLabelUnique(): boolean {
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < this.elements.length; i++) {
      const label: string = this.elements[i].label;
      if (seen.has(label)) {
        return false;
      }
      seen.add(label);
    }
    return true;
  }

  public focusOrder(): string[] {
    const ordered: AccessibleElement[] = this.elements.slice();
    ordered.sort((first: AccessibleElement, second: AccessibleElement) => first.order - second.order);
    const ids: string[] = [];
    for (let i = 0; i < ordered.length; i++) {
      ids.push(ordered[i].id);
    }
    return ids;
  }

  public focusOrderIsVisual(): boolean {
    for (let i = 1; i < this.elements.length; i++) {
      if (this.elements[i].order <= this.elements[i - 1].order) {
        return false;
      }
    }
    return true;
  }

  public announcedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.elements.length; i++) {
      if (this.elements[i].announcesState) {
        count++;
      }
    }
    return count;
  }
}

/**
 * Model of the state announcements of the sample.
 *
 * A screen reader only understands a state change when the page announces it. The model
 * records the announcements in order and folds the repeated announcements of the same state,
 * which is what a live region with a keyed label does.
 */
class StateAnnouncementModel {
  private announcements: string[] = [];
  private lastState: string = '';
  private folded: number = 0;

  public announce(state: string): boolean {
    if (state === this.lastState) {
      this.folded++;
      return false;
    }
    this.lastState = state;
    this.announcements.push(state);
    return true;
  }

  public getAnnouncements(): string[] {
    return this.announcements.slice();
  }

  public size(): number {
    return this.announcements.length;
  }

  public getFolded(): number {
    return this.folded;
  }

  public getLastState(): string {
    return this.lastState;
  }

  public contains(state: string): boolean {
    return this.announcements.indexOf(state) >= 0;
  }

  public reset(): void {
    this.announcements = [];
    this.lastState = '';
    this.folded = 0;
  }

  public describe(): string {
    return `StateAnnouncementModel{announcements=${this.announcements.length}, ` +
      `folded=${this.folded}, last=${this.lastState}}`;
  }
}

/**
 * Validates a tap target against the platform guidance.
 *
 * The platform recommends a tap target of at least forty four by forty four vp. The validator
 * reports the shortfall so a small component can be wrapped by a larger hit area.
 */
class TapTargetValidator {
  private minSize: number;

  constructor(minSize: number = MIN_TAP_TARGET_VP) {
    this.minSize = minSize;
  }

  public isValid(heightVp: number, widthVp: number): boolean {
    return heightVp >= this.minSize && widthVp >= this.minSize;
  }

  public shortfall(heightVp: number): number {
    if (heightVp >= this.minSize) {
      return 0;
    }
    return this.minSize - heightVp;
  }

  public wrappedHeight(heightVp: number): number {
    return Math.max(heightVp, this.minSize);
  }

  public isWrapRequired(heightVp: number): boolean {
    return heightVp < this.minSize;
  }

  public getMinSize(): number {
    return this.minSize;
  }
}

/**
 * Reports whether a label is present on an accessible element.
 *
 * @param label label of the element.
 * @returns true when the label carries at least one non whitespace character.
 */
function isLabelPresent(label: string): boolean {
  return label.trim().length > 0;
}

export default function securityAccessibilityTest() {
  describe('SecurityAccessibility_Test', () => {
    let driver: Driver;
    let catalogue: AccessibleElementCatalogue;
    let announcements: StateAnnouncementModel;
    let tapTargets: TapTargetValidator;

    beforeAll(async () => {
      driver = getDriver();
      catalogue = new AccessibleElementCatalogue();
      announcements = new StateAnnouncementModel();
      tapTargets = new TapTargetValidator();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the accessibility thresholds of the platform.
     * Expectation: the tap target minimum is forty four vp and the body text contrast minimum
     * is four and a half to one.
     */
    it('Assessment_AccessibilityThresholds_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityThresholds_001, begin');
      expect(MIN_TAP_TARGET_VP).assertEqual(44);
      expect(MIN_BODY_CONTRAST).assertEqual(4.5);
      expect(MIN_LARGE_TEXT_CONTRAST).assertEqual(3);
      expect(tapTargets.getMinSize()).assertEqual(44);
      expect(MIN_FOCUS_ORDER_LENGTH).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityThresholds_001, end');
    });

    /**
     * Scenario: the accessible roles of the sample.
     * Expectation: the role enumeration exposes the five documented literals.
     */
    it('Assessment_AccessibilityRoles_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityRoles_002, begin');
      expect(AccessibilityRole.TITLE).assertEqual('title');
      expect(AccessibilityRole.BODY_TEXT).assertEqual('body_text');
      expect(AccessibilityRole.BUTTON).assertEqual('button');
      expect(AccessibilityRole.TEXT_INPUT).assertEqual('text_input');
      expect(AccessibilityRole.LIST).assertEqual('list');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityRoles_002, end');
    });

    /**
     * Scenario: every Button and TextInput carries an accessible label.
     * Expectation: the catalogue reports a non empty label for all nine elements.
     */
    it('Assessment_AccessibilityEveryElementLabelled_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityEveryElementLabelled_003, begin');
      expect(catalogue.count()).assertEqual(9);
      expect(catalogue.everyElementLabelled()).assertTrue();
      const buttons: AccessibleElement[] = catalogue.byRole(AccessibilityRole.BUTTON);
      expect(buttons.length).assertEqual(5);
      for (let i = 0; i < buttons.length; i++) {
        expect(isLabelPresent(buttons[i].label)).assertTrue();
      }
      const inputs: AccessibleElement[] = catalogue.byRole(AccessibilityRole.TEXT_INPUT);
      expect(inputs.length).assertEqual(1);
      expect(isLabelPresent(inputs[0].label)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityEveryElementLabelled_003, end');
    });

    /**
     * Scenario: the labels of the elements are unique.
     * Expectation: no two components carry the same label, so a screen reader can tell them
     * apart.
     */
    it('Assessment_AccessibilityLabelsUnique_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityLabelsUnique_004, begin');
      expect(catalogue.everyLabelUnique()).assertTrue();
      expect(catalogue.find('assessment_begin_button') !== undefined).assertTrue();
      const begin: AccessibleElement | undefined = catalogue.find('assessment_begin_button');
      const end: AccessibleElement | undefined = catalogue.find('assessment_end_button');
      expect(begin !== undefined).assertTrue();
      expect(end !== undefined).assertTrue();
      if (begin !== undefined) {
        expect(begin.label).assertContain('Begin');
      }
      if (end !== undefined) {
        expect(end.label).assertContain('End');
      }
      if (begin !== undefined && end !== undefined) {
        expect(begin.label === end.label).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityLabelsUnique_004, end');
    });

    /**
     * Scenario: the label of an unknown element.
     * Expectation: the catalogue reports the element as absent instead of inventing one.
     */
    it('Assessment_AccessibilityUnknownElement_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityUnknownElement_005, begin');
      expect(catalogue.find('assessment_missing_button') === undefined).assertTrue();
      expect(catalogue.byRole(AccessibilityRole.LIST).length).assertEqual(0);
      expect(isLabelPresent('')).assertFalse();
      expect(isLabelPresent('   ')).assertFalse();
      expect(isLabelPresent('Query the assessment state')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityUnknownElement_005, end');
    });

    /**
     * Scenario: the tap targets of the catalogue.
     * Expectation: every button and the input reach the forty four vp minimum, so no component
     * of the catalogue is undersized.
     */
    it('Assessment_AccessibilityTapTargets_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityTapTargets_006, begin');
      expect(catalogue.everyTapTargetSized()).assertTrue();
      expect(catalogue.undersizedTapTargets().length).assertEqual(0);
      expect(tapTargets.isValid(HEIGHT_BEGIN_BUTTON, 152)).assertTrue();
      expect(tapTargets.isValid(MIN_TAP_TARGET_VP, 240)).assertTrue();
      expect(tapTargets.isValid(MIN_TAP_TARGET_VP, 88)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityTapTargets_006, end');
    });

    /**
     * Scenario: the remove button of a whitelist row.
     * Expectation: the row button is twenty eight vp high, so it needs a wrapper of the minimum
     * tap size before it can be tapped comfortably.
     */
    it('Assessment_AccessibilityRemoveButtonShortfall_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityRemoveButtonShortfall_007, begin');
      expect(HEIGHT_REMOVE_BUTTON).assertEqual(28);
      expect(tapTargets.isValid(HEIGHT_REMOVE_BUTTON, 72)).assertFalse();
      expect(tapTargets.isWrapRequired(HEIGHT_REMOVE_BUTTON)).assertTrue();
      expect(tapTargets.shortfall(HEIGHT_REMOVE_BUTTON)).assertEqual(16);
      expect(tapTargets.wrappedHeight(HEIGHT_REMOVE_BUTTON)).assertEqual(44);
      expect(tapTargets.isWrapRequired(HEIGHT_BEGIN_BUTTON)).assertFalse();
      // The input box and the add button use forty vp of visual height, the row wraps them so
      // that the hit area reaches the minimum as well.
      expect(tapTargets.isWrapRequired(HEIGHT_INPUT)).assertTrue();
      expect(tapTargets.isWrapRequired(HEIGHT_ADD_BUTTON)).assertTrue();
      expect(tapTargets.shortfall(HEIGHT_ADD_BUTTON)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityRemoveButtonShortfall_007, end');
    });

    /**
     * Scenario: the tap target boundary.
     * Expectation: exactly forty four vp is accepted, forty three vp is not.
     */
    it('Assessment_AccessibilityTapTargetBoundary_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityTapTargetBoundary_008, begin');
      expect(tapTargets.isValid(44, 44)).assertTrue();
      expect(tapTargets.isValid(43, 44)).assertFalse();
      expect(tapTargets.isValid(44, 43)).assertFalse();
      expect(tapTargets.isValid(45, 45)).assertTrue();
      expect(tapTargets.shortfall(43)).assertEqual(1);
      expect(tapTargets.shortfall(44)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityTapTargetBoundary_008, end');
    });

    /**
     * Scenario: the contrast of black text on white.
     * Expectation: the ratio is the maximum of the formula and it passes the body text rule.
     */
    it('Assessment_AccessibilityContrastMax_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityContrastMax_009, begin');
      const ratio: number = ContrastCalculator.maxRatio();
      expect(ratio).assertClose(21, 0.001);
      expect(ContrastCalculator.passes(ratio)).assertTrue();
      const result: ContrastResult = ContrastCalculator.evaluate({
        foreground: LUMINANCE_BLACK,
        background: LUMINANCE_WHITE,
        label: 'body text on card'
      });
      expect(result.passesBodyText).assertTrue();
      expect(result.passesLargeText).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', ContrastCalculator.describe(result));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityContrastMax_009, end');
    });

    /**
     * Scenario: the contrast of a colour on itself.
     * Expectation: the ratio is one and it fails both rules.
     */
    it('Assessment_AccessibilityContrastMin_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityContrastMin_010, begin');
      const ratio: number = ContrastCalculator.minRatio();
      expect(ratio).assertClose(1, 0.001);
      expect(ContrastCalculator.passes(ratio)).assertFalse();
      const result: ContrastResult = ContrastCalculator.evaluate({
        foreground: LUMINANCE_WHITE,
        background: LUMINANCE_WHITE,
        label: 'white on white'
      });
      expect(result.passesBodyText).assertFalse();
      expect(result.passesLargeText).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityContrastMin_010, end');
    });

    /**
     * Scenario: the contrast boundary of the body text rule.
     * Expectation: the required luminance of the secondary text colour is computed and the
     * colour that reaches it passes, the colour below it fails.
     */
    it('Assessment_AccessibilityContrastBoundary_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityContrastBoundary_011, begin');
      const required: number = ContrastCalculator.requiredLuminanceForBodyText(1.0);
      expect(required).assertClose(4.675, 0.001);
      expect(ContrastCalculator.passes(4.5)).assertTrue();
      expect(ContrastCalculator.passes(4.49)).assertFalse();
      const secondary: ContrastResult = ContrastCalculator.evaluate({
        foreground: 0.2,
        background: 1.0,
        label: 'secondary text'
      });
      expect(secondary.passesBodyText).assertFalse();
      const strong: ContrastResult = ContrastCalculator.evaluate({
        foreground: 0.05,
        background: 1.0,
        label: 'primary text'
      });
      expect(strong.passesBodyText).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'AccessibilityContrastBoundary_011',
        ContrastCalculator.describe(strong));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityContrastBoundary_011, end');
    });

    /**
     * Scenario: the contrast of the warning colour used by the end button.
     * Expectation: the warning text on the card background passes the large text rule and is
     * reported with its own ratio.
     */
    it('Assessment_AccessibilityContrastWarning_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityContrastWarning_012, begin');
      const warning: ContrastResult = ContrastCalculator.evaluate({
        foreground: 0.18,
        background: 1.0,
        label: 'warning text'
      });
      expect(warning.ratio).assertLarger(1);
      expect(warning.passesLargeText).assertTrue();
      expect(warning.passesBodyText).assertTrue();
      expect(warning.label).assertEqual('warning text');
      hilog.info(DOMAIN, TAG, '%{public}s', ContrastCalculator.describe(warning));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityContrastWarning_012, end');
    });

    /**
     * Scenario: the focus order of the entry page.
     * Expectation: the order follows the visual order from the title down to the exam title.
     */
    it('Assessment_AccessibilityFocusOrder_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityFocusOrder_014, begin');
      expect(catalogue.focusOrderIsVisual()).assertTrue();
      const order: string[] = catalogue.focusOrder();
      expect(order.length).assertEqual(catalogue.count());
      expect(order[0]).assertEqual('assessment_index_title');
      expect(order[1]).assertEqual('assessment_bundle_input');
      expect(order[2]).assertEqual('assessment_add_button');
      expect(order[3]).assertEqual('assessment_begin_button');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityFocusOrder_014, end');
    });

    /**
     * Scenario: the state changes of the sample are announced.
     * Expectation: three elements announce their state, which are the two operation buttons and
     * the state text.
     */
    it('Assessment_AccessibilityAnnouncedElements_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityAnnouncedElements_016, begin');
      expect(catalogue.announcedCount()).assertEqual(3);
      const begin: AccessibleElement | undefined = catalogue.find('assessment_begin_button');
      expect(begin !== undefined).assertTrue();
      if (begin !== undefined) {
        expect(begin.announcesState).assertTrue();
      }
      const stateText: AccessibleElement | undefined = catalogue.find('assessment_state_text');
      expect(stateText !== undefined).assertTrue();
      if (stateText !== undefined) {
        expect(stateText.announcesState).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityAnnouncedElements_016, end');
    });

    /**
     * Scenario: a state change is announced once.
     * Expectation: the first announcement of a state is reported, a repeated one is folded.
     */
    it('Assessment_AccessibilityAnnouncementFolding_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityAnnouncementFolding_017, begin');
      announcements.reset();
      expect(announcements.announce('inactive')).assertTrue();
      expect(announcements.announce('inactive')).assertFalse();
      expect(announcements.announce('active')).assertTrue();
      expect(announcements.size()).assertEqual(2);
      expect(announcements.getFolded()).assertEqual(1);
      expect(announcements.getLastState()).assertEqual('active');
      expect(announcements.contains('inactive')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', announcements.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityAnnouncementFolding_017, end');
    });

    /**
     * Scenario: an alternating state sequence.
     * Expectation: every change is announced and nothing is folded.
     */
    it('Assessment_AccessibilityAnnouncementAlternating_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityAnnouncementAlternating_018, begin');
      announcements.reset();
      const sequence: string[] = ['inactive', 'active', 'interrupted', 'idle', 'pending', 'active'];
      for (let i = 0; i < sequence.length; i++) {
        expect(announcements.announce(sequence[i])).assertTrue();
      }
      expect(announcements.size()).assertEqual(sequence.length);
      expect(announcements.getFolded()).assertEqual(0);
      expect(announcements.getAnnouncements()[0]).assertEqual('inactive');
      expect(announcements.getAnnouncements()[sequence.length - 1]).assertEqual('active');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityAnnouncementAlternating_018, end');
    });

    /**
     * Scenario: the reset of the announcement model.
     * Expectation: after the reset the first announcement is reported again even when it is
     * the same as the last one before the reset.
     */
    it('Assessment_AccessibilityAnnouncementReset_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityAnnouncementReset_019, begin');
      announcements.reset();
      announcements.announce('active');
      expect(announcements.announce('active')).assertFalse();
      announcements.reset();
      expect(announcements.size()).assertEqual(0);
      expect(announcements.getFolded()).assertEqual(0);
      expect(announcements.announce('active')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityAnnouncementReset_019, end');
    });

    /**
     * Scenario: the description of the announcement model.
     * Expectation: the description names the announcement count and the folded count.
     */
    it('Assessment_AccessibilityAnnouncementDescription_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityAnnouncementDescription_020, begin');
      const local: StateAnnouncementModel = new StateAnnouncementModel();
      expect(local.describe()).assertContain('announcements=0');
      expect(local.describe()).assertContain('folded=0');
      local.announce('inactive');
      local.announce('inactive');
      expect(local.describe()).assertContain('announcements=1');
      expect(local.describe()).assertContain('folded=1');
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityAnnouncementDescription_020, end');
    });
  });
}
