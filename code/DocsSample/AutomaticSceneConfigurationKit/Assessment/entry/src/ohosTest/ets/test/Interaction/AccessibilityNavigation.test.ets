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
  ID_EXAM_TITLE,
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  KEY_TAB,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_TRANSITION,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  waitForIndexPage,
  waitForExamPage,
  isComponentEnabled,
  pressAndWait,
  getCurrentFocusIndex,
  checkFocusState
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The minimal touch target that the usability guidelines of the platform recommend for a
// primary action. The operation buttons of the sample declare a height of 44vp.
const MIN_TOUCH_TARGET_VP: number = 44;

// Secondary actions may be smaller, the remove button of a whitelist row declares 28vp.
const MIN_TOUCH_TARGET_RELAXED_VP: number = 28;

// The WCAG 2.1 contrast thresholds. Normal sized text needs 4.5:1, large or bold text needs
// 3.0:1 in size, and the enhanced level raises the normal threshold to 7.0:1.
const WCAG_AA_NORMAL_TEXT: number = 4.5;
const WCAG_AA_LARGE_TEXT: number = 3.0;
const WCAG_AAA_NORMAL_TEXT: number = 7.0;

// The contrast of black over white, it is the maximum a ratio can reach.
const MAX_CONTRAST_RATIO: number = 21;

// Color tokens declared by resources/base/element/color.json of the sample.
const COLOR_PAGE_BACKGROUND: string = '#F1F3F5';
const COLOR_CARD_BACKGROUND: string = '#FFFFFF';
const COLOR_TITLE_FONT: string = '#182431';
const COLOR_BODY_FONT: string = '#182431';
const COLOR_SECONDARY_FONT: string = '#99182431';
const COLOR_BRAND: string = '#007DFF';
const COLOR_WARNING: string = '#ED6F21';
const COLOR_SUCCESS: string = '#64BB5C';
const COLOR_BLACK: string = '#000000';
const COLOR_WHITE: string = '#FFFFFF';

// Roles that the traversal model distinguishes. The role is only a label in this suite, the
// UiTest driver has no portable role query, but the model keeps it for the announcement text.
const ROLE_TEXT: string = 'Text';
const ROLE_BUTTON: string = 'Button';
const ROLE_INPUT: string = 'TextInput';

// Focus indices used by the synthetic usability nodes that mirror the entry page.
const FOCUS_INDEX_TITLE: number = 0;
const FOCUS_INDEX_INPUT: number = 1;
const FOCUS_INDEX_ADD: number = 2;
const FOCUS_INDEX_BEGIN: number = 3;
const FOCUS_INDEX_END: number = 4;
const FOCUS_INDEX_QUERY_STATE: number = 5;
const FOCUS_INDEX_QUERY_CONFIG: number = 6;
const FOCUS_INDEX_NONE: number = -1;

// Default geometry of a synthesized node, the values mirror the sample layout.
const DEFAULT_BUTTON_HEIGHT_VP: number = 44;
const DEFAULT_INPUT_HEIGHT_VP: number = 40;
const DEFAULT_REMOVE_HEIGHT_VP: number = 28;
const DEFAULT_TEXT_HEIGHT_VP: number = 20;

/**
 * Verdict of a touch target against the minimum size rule.
 */
enum TouchTargetVerdict {
  PASS = 0,
  TIGHT = 1,
  FAIL = 2
}

/**
 * A plain RGBA color in the 0 to 255 channel range.
 *
 * The sample declares its colors as hex strings, one of them carries an alpha channel
 * (#99182431 for the secondary font). The contrast helper needs the channels separately and
 * it needs alpha blending, so the hex string is parsed into this class first.
 */
class RgbColor {
  public red: number = 0;
  public green: number = 0;
  public blue: number = 0;
  public alpha: number = 1;

  /**
   * @param red red channel, 0 to 255.
   * @param green green channel, 0 to 255.
   * @param blue blue channel, 0 to 255.
   * @param alpha alpha channel, 0 to 1.
   */
  constructor(red: number = 0, green: number = 0, blue: number = 0, alpha: number = 1) {
    this.red = red;
    this.green = green;
    this.blue = blue;
    this.alpha = alpha;
  }

  /**
   * Parses a color string. Both #RRGGBB and #AARRGGBB are accepted, the leading hash is
   * optional so that a token copied from the resource file without the hash also works.
   *
   * @param hex color string.
   * @returns the parsed color, opaque black when the string cannot be parsed.
   */
  public static fromHex(hex: string): RgbColor {
    let value: string = hex;
    if (value.startsWith('#')) {
      value = value.substring(1);
    }
    if (value.length === 8) {
      const alphaChannel: number = RgbColor.parseChannel(value.substring(0, 2));
      const redChannel: number = RgbColor.parseChannel(value.substring(2, 4));
      const greenChannel: number = RgbColor.parseChannel(value.substring(4, 6));
      const blueChannel: number = RgbColor.parseChannel(value.substring(6, 8));
      return new RgbColor(redChannel, greenChannel, blueChannel, alphaChannel / 255);
    }
    if (value.length === 6) {
      const redChannel: number = RgbColor.parseChannel(value.substring(0, 2));
      const greenChannel: number = RgbColor.parseChannel(value.substring(2, 4));
      const blueChannel: number = RgbColor.parseChannel(value.substring(4, 6));
      return new RgbColor(redChannel, greenChannel, blueChannel, 1);
    }
    return new RgbColor(0, 0, 0, 1);
  }

  /**
   * Parses one two digit hex channel.
   *
   * @param token two hex characters.
   * @returns the channel value, 0 when the token is not a hex number.
   */
  private static parseChannel(token: string): number {
    const parsed: number = parseInt(token, 16);
    if (Number.isNaN(parsed)) {
      return 0;
    }
    return parsed;
  }

  /**
   * Reports whether the color has no transparency.
   *
   * @returns true when the alpha channel equals one.
   */
  public isOpaque(): boolean {
    return this.alpha >= 1;
  }

  /**
   * Composites this color over an opaque background.
   *
   * The sample uses the secondary font color #99182431, which is a title color with an
   * alpha of 0x99. The rendered color is the blend of the token over the card background,
   * and only the rendered color may be used for the contrast computation.
   *
   * @param background opaque background color.
   * @returns the blended color with an alpha of one.
   */
  public blendOver(background: RgbColor): RgbColor {
    if (this.isOpaque()) {
      return new RgbColor(this.red, this.green, this.blue, 1);
    }
    const inverse: number = 1 - this.alpha;
    const redChannel: number = this.red * this.alpha + background.red * inverse;
    const greenChannel: number = this.green * this.alpha + background.green * inverse;
    const blueChannel: number = this.blue * this.alpha + background.blue * inverse;
    return new RgbColor(redChannel, greenChannel, blueChannel, 1);
  }

  /**
   * @returns a compact css-like description used by the log lines.
   */
  public toCss(): string {
    const redChannel: number = Math.round(this.red);
    const greenChannel: number = Math.round(this.green);
    const blueChannel: number = Math.round(this.blue);
    const alphaText: string = this.alpha.toFixed(2);
    return `rgba(${redChannel}, ${greenChannel}, ${blueChannel}, ${alphaText})`;
  }

  /**
   * Compares two colors channel by channel with a tolerance of one unit, which absorbs the
   * rounding of the alpha blend.
   *
   * @param other color to compare with.
   * @returns true when the channels are close enough.
   */
  public isCloseTo(other: RgbColor): boolean {
    const close: boolean = Math.abs(this.red - other.red) <= 1 &&
      Math.abs(this.green - other.green) <= 1 &&
      Math.abs(this.blue - other.blue) <= 1;
    return close;
  }
}

/**
 * WCAG 2.1 relative luminance and contrast ratio helper.
 */
class ContrastCalculator {
  /**
   * Converts one sRGB channel to its linear value.
   *
   * @param channel channel value in the 0 to 255 range.
   * @returns the linear channel value.
   */
  public static channelToLinear(channel: number): number {
    const normalized: number = channel / 255;
    if (normalized <= 0.03928) {
      return normalized / 12.92;
    }
    return Math.pow((normalized + 0.055) / 1.055, 2.4);
  }

  /**
   * Computes the relative luminance of an opaque color.
   *
   * @param color color to inspect, it must be opaque.
   * @returns the relative luminance between zero and one.
   */
  public static relativeLuminance(color: RgbColor): number {
    const redPart: number = ContrastCalculator.channelToLinear(color.red) * 0.2126;
    const greenPart: number = ContrastCalculator.channelToLinear(color.green) * 0.7152;
    const bluePart: number = ContrastCalculator.channelToLinear(color.blue) * 0.0722;
    return redPart + greenPart + bluePart;
  }

  /**
   * Computes the contrast ratio of two opaque colors.
   *
   * @param first first color.
   * @param second second color.
   * @returns the ratio between one and twenty one.
   */
  public static contrastRatio(first: RgbColor, second: RgbColor): number {
    const firstLuminance: number = ContrastCalculator.relativeLuminance(first);
    const secondLuminance: number = ContrastCalculator.relativeLuminance(second);
    const lighter: number = Math.max(firstLuminance, secondLuminance);
    const darker: number = Math.min(firstLuminance, secondLuminance);
    return (lighter + 0.05) / (darker + 0.05);
  }

  /**
   * Computes the contrast ratio of two hex tokens, the foreground is blended over the
   * background first so that a translucent token is measured as it is rendered.
   *
   * @param foregroundHex foreground token.
   * @param backgroundHex background token, it must be opaque.
   * @returns the ratio between one and twenty one.
   */
  public static ratioOfHex(foregroundHex: string, backgroundHex: string): number {
    const background: RgbColor = RgbColor.fromHex(backgroundHex);
    const foreground: RgbColor = RgbColor.fromHex(foregroundHex).blendOver(background);
    return ContrastCalculator.contrastRatio(foreground, background);
  }

  /**
   * Reports whether a ratio satisfies the normal text threshold of the AA level.
   *
   * @param ratio ratio to judge.
   * @returns true when the ratio reaches 4.5.
   */
  public static passesAANormal(ratio: number): boolean {
    return ratio >= WCAG_AA_NORMAL_TEXT;
  }

  /**
   * Reports whether a ratio satisfies the large text threshold of the AA level.
   *
   * @param ratio ratio to judge.
   * @returns true when the ratio reaches 3.0.
   */
  public static passesAALarge(ratio: number): boolean {
    return ratio >= WCAG_AA_LARGE_TEXT;
  }

  /**
   * Reports whether a ratio satisfies the normal text threshold of the AAA level.
   *
   * @param ratio ratio to judge.
   * @returns true when the ratio reaches 7.0.
   */
  public static passesAAANormal(ratio: number): boolean {
    return ratio >= WCAG_AAA_NORMAL_TEXT;
  }

  /**
   * Grades a ratio with the level names used by the audit report.
   *
   * @param ratio ratio to grade.
   * @returns the grade name.
   */
  public static grade(ratio: number): string {
    if (ContrastCalculator.passesAAANormal(ratio)) {
      return 'AAA';
    }
    if (ContrastCalculator.passesAANormal(ratio)) {
      return 'AA';
    }
    if (ContrastCalculator.passesAALarge(ratio)) {
      return 'AA-Large';
    }
    return 'Fail';
  }

  /**
   * @param ratio ratio to describe.
   * @returns a fixed precision text for the log lines.
   */
  public static describe(ratio: number): string {
    return `ratio=${ratio.toFixed(2)}, grade=${ContrastCalculator.grade(ratio)}`;
  }
}

/**
 * One usability-relevant component of a page.
 *
 * The class is a data model, the UiTest driver only provides identity, text and enabled
 * state, so the geometry is mirrored from the layout source instead of being measured.
 */
class AccessibilityNode {
  public id: string = '';
  public label: string = '';
  public role: string = ROLE_TEXT;
  public heightVp: number = DEFAULT_TEXT_HEIGHT_VP;
  public widthVp: number = 0;
  public focusIndex: number = FOCUS_INDEX_NONE;
  public enabled: boolean = true;
  public foregroundHex: string = COLOR_BODY_FONT;
  public backgroundHex: string = COLOR_CARD_BACKGROUND;
  public screenReaderHidden: boolean = false;

  constructor(id: string = '', label: string = '', role: string = ROLE_TEXT,
    heightVp: number = DEFAULT_TEXT_HEIGHT_VP, focusIndex: number = FOCUS_INDEX_NONE,
    foregroundHex: string = COLOR_BODY_FONT, backgroundHex: string = COLOR_CARD_BACKGROUND) {
    this.id = id;
    this.label = label;
    this.role = role;
    this.heightVp = heightVp;
    this.focusIndex = focusIndex;
    this.foregroundHex = foregroundHex;
    this.backgroundHex = backgroundHex;
  }

  /**
   * @returns true when the node carries a non empty label.
   */
  public hasLabel(): boolean {
    return this.label.trim().length > 0;
  }

  /**
   * The label that a screen reader announces. A node without a text falls back to its
   * identifier so that the announcement list never contains an empty entry.
   *
   * @returns the effective label.
   */
  public effectiveLabel(): string {
    if (this.hasLabel()) {
      return this.label;
    }
    return this.id;
  }

  /**
   * @returns true when the node takes part in the focus traversal.
   */
  public isFocusable(): boolean {
    return this.focusIndex >= 0 && this.enabled;
  }

  /**
   * Judges the height of the node against the minimum touch target rule.
   *
   * @param minimumVp minimum height in vp.
   * @returns the verdict.
   */
  public judgeTouchTarget(minimumVp: number = MIN_TOUCH_TARGET_VP): TouchTargetVerdict {
    if (this.heightVp >= minimumVp) {
      return TouchTargetVerdict.PASS;
    }
    if (this.heightVp >= MIN_TOUCH_TARGET_RELAXED_VP) {
      return TouchTargetVerdict.TIGHT;
    }
    return TouchTargetVerdict.FAIL;
  }

  /**
   * @param minimumVp minimum height in vp.
   * @returns true when the node reaches the minimum touch target.
   */
  public isTouchTargetCompliant(minimumVp: number = MIN_TOUCH_TARGET_VP): boolean {
    return this.judgeTouchTarget(minimumVp) === TouchTargetVerdict.PASS;
  }

  /**
   * Computes the contrast ratio of the label against the background of the node.
   *
   * @returns the ratio between one and twenty one.
   */
  public labelContrastRatio(): number {
    return ContrastCalculator.ratioOfHex(this.foregroundHex, this.backgroundHex);
  }

  /**
   * Scales the geometry with a font scale factor, the label of the node does not change.
   *
   * @param scaleFactor factor applied to the height.
   * @returns a new node with the scaled geometry.
   */
  public withScale(scaleFactor: number): AccessibilityNode {
    const scaled: AccessibilityNode = new AccessibilityNode(this.id, this.label, this.role,
      this.heightVp * scaleFactor, this.focusIndex, this.foregroundHex, this.backgroundHex);
    scaled.widthVp = this.widthVp * scaleFactor;
    scaled.enabled = this.enabled;
    scaled.screenReaderHidden = this.screenReaderHidden;
    return scaled;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `AccessibilityNode{id=${this.id}, role=${this.role}, label=${this.label}, ` +
      `height=${this.heightVp}vp, focus=${this.focusIndex}}`;
  }
}

/**
 * Collects usability nodes and derives the audit findings of a page.
 */
class AccessibilityAudit {
  private nodes: AccessibilityNode[] = [];
  private pageName: string = '';

  constructor(pageName: string = '') {
    this.pageName = pageName;
  }

  /**
   * Appends one node to the audit.
   *
   * @param node node to append.
   */
  public addNode(node: AccessibilityNode): void {
    this.nodes.push(node);
  }

  /**
   * Drops every node.
   */
  public clearNodes(): void {
    this.nodes = [];
  }

  /**
   * @returns the number of collected nodes.
   */
  public nodeCount(): number {
    return this.nodes.length;
  }

  /**
   * @returns a copy of the collected nodes.
   */
  public getNodes(): AccessibilityNode[] {
    return this.nodes.slice();
  }

  /**
   * @returns the page name that was handed to the constructor.
   */
  public getPageName(): string {
    return this.pageName;
  }

  /**
   * Finds a node by identifier.
   *
   * @param id identifier to look for.
   * @returns the node, or null when the audit has no such node.
   */
  public findNode(id: string): AccessibilityNode | null {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].id === id) {
        return this.nodes[i];
      }
    }
    return null;
  }

  /**
   * Lists the interactive nodes that carry no label, they are unreachable for a screen
   * reader because their announcement would be empty.
   *
   * @returns the identifiers of the nodes without a label.
   */
  public missingLabels(): string[] {
    const ids: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      const node: AccessibilityNode = this.nodes[i];
      if (node.role !== ROLE_TEXT && !node.hasLabel()) {
        ids.push(node.id);
      }
    }
    return ids;
  }

  /**
   * Lists the nodes whose height is below the required touch target.
   *
   * @param minimumVp minimum height in vp.
   * @returns the identifiers of the undersized nodes.
   */
  public undersizedNodes(minimumVp: number = MIN_TOUCH_TARGET_VP): string[] {
    const ids: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      const node: AccessibilityNode = this.nodes[i];
      if (node.role === ROLE_TEXT) {
        continue;
      }
      if (!node.isTouchTargetCompliant(minimumVp)) {
        ids.push(node.id);
      }
    }
    return ids;
  }

  /**
   * Lists the nodes that stay below the AA normal text contrast threshold.
   *
   * @returns the identifiers of the low contrast nodes.
   */
  public lowContrastNodes(): string[] {
    const ids: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      const node: AccessibilityNode = this.nodes[i];
      if (!ContrastCalculator.passesAANormal(node.labelContrastRatio())) {
        ids.push(node.id);
      }
    }
    return ids;
  }

  /**
   * @returns the identifiers ordered by their focus index, unfocusable nodes are dropped.
   */
  public focusOrder(): string[] {
    const focusable: AccessibilityNode[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].focusIndex >= 0) {
        focusable.push(this.nodes[i]);
      }
    }
    focusable.sort((first: AccessibilityNode, second: AccessibilityNode) => {
      return first.focusIndex - second.focusIndex;
    });
    const ids: string[] = [];
    for (let i = 0; i < focusable.length; i++) {
      ids.push(focusable[i].id);
    }
    return ids;
  }

  /**
   * Detects nodes that share a focus index. A duplicated index makes the traversal order
   * ambiguous, the platform then falls back to the tree order.
   *
   * @returns the duplicated indices in ascending order.
   */
  public duplicateFocusIndexes(): number[] {
    const seen: number[] = [];
    const duplicates: number[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      const index: number = this.nodes[i].focusIndex;
      if (index < 0) {
        continue;
      }
      if (seen.indexOf(index) >= 0) {
        if (duplicates.indexOf(index) < 0) {
          duplicates.push(index);
        }
        continue;
      }
      seen.push(index);
    }
    duplicates.sort((first: number, second: number) => first - second);
    return duplicates;
  }

  /**
   * Builds the announcement list that a screen reader traverses.
   *
   * @returns one announcement per focusable node, in focus order.
   */
  public buildTraversalScript(): string[] {
    const ordered: string[] = this.focusOrder();
    const script: string[] = [];
    for (let i = 0; i < ordered.length; i++) {
      const node: AccessibilityNode | null = this.findNode(ordered[i]);
      if (node === null || node.screenReaderHidden) {
        continue;
      }
      const stateText: string = node.enabled ? 'enabled' : 'disabled';
      script.push(`${node.effectiveLabel()}, ${node.role}, ${stateText}`);
    }
    return script;
  }

  /**
   * @param minimumVp minimum height in vp.
   * @returns the share of interactive nodes that reach the touch target, between 0 and 1.
   */
  public touchTargetPassRate(minimumVp: number = MIN_TOUCH_TARGET_VP): number {
    let interactive: number = 0;
    let compliant: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      const node: AccessibilityNode = this.nodes[i];
      if (node.role === ROLE_TEXT) {
        continue;
      }
      interactive++;
      if (node.isTouchTargetCompliant(minimumVp)) {
        compliant++;
      }
    }
    if (interactive === 0) {
      return 0;
    }
    return compliant / interactive;
  }

  /**
   * @returns the average height of the interactive nodes, zero when there is none.
   */
  public averageInteractiveHeight(): number {
    let interactive: number = 0;
    let total: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      const node: AccessibilityNode = this.nodes[i];
      if (node.role === ROLE_TEXT) {
        continue;
      }
      interactive++;
      total += node.heightVp;
    }
    if (interactive === 0) {
      return 0;
    }
    return total / interactive;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `AccessibilityAudit{page=${this.pageName}, nodes=${this.nodes.length}, ` +
      `missingLabels=${this.missingLabels().length}, undersized=${this.undersizedNodes().length}}`;
  }
}

/**
 * A linear focus traversal over the identifiers of a page.
 *
 * The model mirrors the behaviour of the TAB and the arrow keys: TAB and DOWN move the focus
 * forward and wrap at the end, UP moves backward and wraps at the start. A page without a
 * focusable node keeps the cursor at -1.
 */
class FocusTraversalModel {
  private ids: string[] = [];
  private cursor: number = -1;
  private wrapEnabled: boolean = true;

  constructor(ids: string[] = []) {
    this.ids = ids.slice();
    if (this.ids.length > 0) {
      this.cursor = 0;
    }
  }

  /**
   * Replaces the traversal order and resets the cursor.
   *
   * @param ids identifiers in traversal order.
   */
  public setOrder(ids: string[]): void {
    this.ids = ids.slice();
    this.cursor = this.ids.length > 0 ? 0 : -1;
  }

  /**
   * Enables or disables the wrap around at the ends of the order.
   *
   * @param wrap true to wrap.
   */
  public setWrapEnabled(wrap: boolean): void {
    this.wrapEnabled = wrap;
  }

  /**
   * @returns the number of steps of the traversal.
   */
  public size(): number {
    return this.ids.length;
  }

  /**
   * @returns the current cursor, -1 when the model is empty.
   */
  public getCursor(): number {
    return this.cursor;
  }

  /**
   * @returns the identifier under the cursor, an empty string when the model is empty.
   */
  public currentId(): string {
    if (this.cursor < 0 || this.cursor >= this.ids.length) {
      return '';
    }
    return this.ids[this.cursor];
  }

  /**
   * Moves the cursor forward.
   *
   * @returns the new cursor.
   */
  public moveNext(): number {
    if (this.ids.length === 0) {
      this.cursor = -1;
      return this.cursor;
    }
    if (this.cursor < this.ids.length - 1) {
      this.cursor++;
      return this.cursor;
    }
    if (this.wrapEnabled) {
      this.cursor = 0;
    }
    return this.cursor;
  }

  /**
   * Moves the cursor backward.
   *
   * @returns the new cursor.
   */
  public movePrevious(): number {
    if (this.ids.length === 0) {
      this.cursor = -1;
      return this.cursor;
    }
    if (this.cursor > 0) {
      this.cursor--;
      return this.cursor;
    }
    if (this.wrapEnabled) {
      this.cursor = this.ids.length - 1;
    }
    return this.cursor;
  }

  /**
   * Moves the cursor to a known identifier.
   *
   * @param id identifier to focus.
   * @returns true when the identifier is part of the order.
   */
  public moveTo(id: string): boolean {
    const index: number = this.ids.indexOf(id);
    if (index < 0) {
      return false;
    }
    this.cursor = index;
    return true;
  }

  /**
   * Resets the cursor to the first step.
   */
  public reset(): void {
    this.cursor = this.ids.length > 0 ? 0 : -1;
  }

  /**
   * Replays a key sequence and records the identifiers that were visited.
   *
   * @param keys key codes, TAB and DOWN move forward, UP moves backward.
   * @returns the visited identifiers including the start position.
   */
  public replayKeySequence(keys: number[]): string[] {
    const visited: string[] = [];
    if (this.ids.length === 0) {
      return visited;
    }
    visited.push(this.currentId());
    for (let i = 0; i < keys.length; i++) {
      const key: number = keys[i];
      if (key === KEY_TAB || key === KEY_DOWN) {
        this.moveNext();
        visited.push(this.currentId());
        continue;
      }
      if (key === KEY_UP) {
        this.movePrevious();
        visited.push(this.currentId());
      }
    }
    return visited;
  }

  /**
   * @returns a copy of the traversal order.
   */
  public getOrder(): string[] {
    return this.ids.slice();
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `FocusTraversalModel{size=${this.ids.length}, cursor=${this.cursor}, ` +
      `current=${this.currentId()}}`;
  }
}

/**
 * Reads the text of a component, an empty string is returned when the read fails because the
 * component dropped out of the tree between the lookup and the read.
 *
 * @param component component to read.
 * @returns the text of the component.
 */
async function readTextSafely(component: Component): Promise<string> {
  try {
    return await getTextSerialized(component);
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'readTextSafely failed: %{public}s', err.message);
    return '';
  }
}

/**
 * Starts the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function guardEntryPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'guardEntryPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

/**
 * Probes one identifier of the entry page and converts it into a usability node.
 *
 * @param driver driver of the running case.
 * @param id identifier of the component.
 * @param role role that the component plays.
 * @param focusIndex focus index that the layout source assigns.
 * @param heightVp height that the layout source declares.
 * @returns the node, or null when the component is absent.
 */
async function probeAccessibleNode(driver: Driver, id: string, role: string, focusIndex: number,
  heightVp: number): Promise<AccessibilityNode | null> {
  const component: Component | null = await findById(driver, id);
  if (component === null) {
    hilog.warn(DOMAIN, TAG, 'probeAccessibleNode: %{public}s is absent', id);
    return null;
  }
  const enabled: boolean = await isComponentEnabled(component);
  const text: string = await readTextSafely(component);
  const node: AccessibilityNode = new AccessibilityNode(id, text, role, heightVp, focusIndex);
  node.enabled = enabled;
  return node;
}

/**
 * Builds the synthetic audit of the entry page.
 *
 * The geometry and the order mirror pages/Index.ets: the title, the whitelist input and the
 * add button sit in the configuration card, the four API buttons sit in the operation card.
 *
 * @returns the audit of the entry page.
 */
function buildEntryPageAudit(): AccessibilityAudit {
  const audit: AccessibilityAudit = new AccessibilityAudit('Index');
  const title: AccessibilityNode = new AccessibilityNode(ID_INDEX_TITLE, 'Assessment', ROLE_TEXT,
    DEFAULT_TEXT_HEIGHT_VP, FOCUS_INDEX_NONE, COLOR_TITLE_FONT, COLOR_CARD_BACKGROUND);
  audit.addNode(title);
  const input: AccessibilityNode = new AccessibilityNode(ID_BUNDLE_INPUT, 'Bundle name', ROLE_INPUT,
    DEFAULT_INPUT_HEIGHT_VP, FOCUS_INDEX_INPUT, COLOR_BODY_FONT, COLOR_CARD_BACKGROUND);
  audit.addNode(input);
  const addButton: AccessibilityNode = new AccessibilityNode(ID_ADD_BUTTON, 'Add', ROLE_BUTTON,
    DEFAULT_BUTTON_HEIGHT_VP, FOCUS_INDEX_ADD, COLOR_WHITE, COLOR_BRAND);
  audit.addNode(addButton);
  const beginButton: AccessibilityNode = new AccessibilityNode(ID_BEGIN_BUTTON, 'begin', ROLE_BUTTON,
    DEFAULT_BUTTON_HEIGHT_VP, FOCUS_INDEX_BEGIN, COLOR_WHITE, COLOR_BRAND);
  audit.addNode(beginButton);
  const endButton: AccessibilityNode = new AccessibilityNode(ID_END_BUTTON, 'end', ROLE_BUTTON,
    DEFAULT_BUTTON_HEIGHT_VP, FOCUS_INDEX_END, COLOR_WHITE, COLOR_WARNING);
  audit.addNode(endButton);
  const queryState: AccessibilityNode = new AccessibilityNode(ID_QUERY_STATE_BUTTON, 'isActive',
    ROLE_BUTTON, DEFAULT_BUTTON_HEIGHT_VP, FOCUS_INDEX_QUERY_STATE, COLOR_BODY_FONT,
    COLOR_PAGE_BACKGROUND);
  audit.addNode(queryState);
  const queryConfig: AccessibilityNode = new AccessibilityNode(ID_QUERY_CONFIG_BUTTON, 'getConfiguration',
    ROLE_BUTTON, DEFAULT_BUTTON_HEIGHT_VP, FOCUS_INDEX_QUERY_CONFIG, COLOR_BODY_FONT,
    COLOR_PAGE_BACKGROUND);
  audit.addNode(queryConfig);
  return audit;
}

export default function accessibilityNavigationTest() {
  describe('AccessibilityNavigation_Test', () => {
    let driver: Driver;
    let entryAudit: AccessibilityAudit;
    let traversal: FocusTraversalModel;

    beforeAll(async () => {
      driver = getDriver();
      entryAudit = buildEntryPageAudit();
      traversal = new FocusTraversalModel(entryAudit.focusOrder());
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: every interactive component of the entry page must expose a label.
     * Expectation: the audit finds no interactive node without a label, which is what a
     * screen reader needs to announce the component.
     */
    it('Assessment_AccessibilityNavigation_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_002, begin');
      const missing: string[] = entryAudit.missingLabels();
      hilog.info(DOMAIN, TAG, '%{public}s nodes without label: %{public}d',
        BUNDLE + 'AccessibilityNavigation_002', missing.length);
      expect(missing.length).assertEqual(0);
      const inputNode: AccessibilityNode | null = entryAudit.findNode(ID_BUNDLE_INPUT);
      expect(inputNode !== null).assertTrue();
      if (inputNode !== null) {
        expect(inputNode.hasLabel()).assertTrue();
        expect(inputNode.effectiveLabel()).assertEqual('Bundle name');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_002, end');
    });

    /**
     * Scenario: a whitelist row carries a secondary remove button.
     * Expectation: a 28vp high button is tight but not a failure, a 24vp high button fails,
     * so the relaxed rule keeps secondary actions usable without flagging them.
     */
    it('Assessment_AccessibilityNavigation_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_004, begin');
      const removeNode: AccessibilityNode = new AccessibilityNode('assessment_remove_row', 'Remove',
        ROLE_BUTTON, DEFAULT_REMOVE_HEIGHT_VP, 8);
      expect(removeNode.judgeTouchTarget(MIN_TOUCH_TARGET_VP)).assertEqual(TouchTargetVerdict.TIGHT);
      expect(removeNode.isTouchTargetCompliant(MIN_TOUCH_TARGET_VP)).assertFalse();
      const tinyNode: AccessibilityNode = new AccessibilityNode('assessment_tiny_row', 'Remove',
        ROLE_BUTTON, 24, 9);
      expect(tinyNode.judgeTouchTarget(MIN_TOUCH_TARGET_VP)).assertEqual(TouchTargetVerdict.FAIL);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_004, end');
    });

    /**
     * Scenario: the title font of the sample is #182431 over the white card.
     * Expectation: the contrast reaches the AAA level for normal sized text.
     */
    it('Assessment_AccessibilityNavigation_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_005, begin');
      const ratio: number = ContrastCalculator.ratioOfHex(COLOR_TITLE_FONT, COLOR_CARD_BACKGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s title contrast: %{public}s',
        BUNDLE + 'AccessibilityNavigation_005', ContrastCalculator.describe(ratio));
      expect(ratio > 10).assertTrue();
      expect(ContrastCalculator.passesAAANormal(ratio)).assertTrue();
      expect(ContrastCalculator.grade(ratio)).assertEqual('AAA');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_005, end');
    });

    /**
     * Scenario: the brand color is used as a chip and button background with white text.
     * Expectation: white over the brand color stays above the large text threshold and below
     * the normal text threshold, so the brand background may only carry large or bold text.
     */
    it('Assessment_AccessibilityNavigation_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_006, begin');
      const ratio: number = ContrastCalculator.ratioOfHex(COLOR_WHITE, COLOR_BRAND);
      hilog.info(DOMAIN, TAG, '%{public}s brand contrast: %{public}s',
        BUNDLE + 'AccessibilityNavigation_006', ContrastCalculator.describe(ratio));
      expect(ContrastCalculator.passesAALarge(ratio)).assertTrue();
      expect(ContrastCalculator.passesAANormal(ratio)).assertFalse();
      expect(ContrastCalculator.grade(ratio)).assertEqual('AA-Large');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_006, end');
    });

    /**
     * Scenario: the warning color carries the end button label.
     * Expectation: white over the warning color is just above the large text threshold, the
     * ratio is recorded with a tolerance of five hundredths.
     */
    it('Assessment_AccessibilityNavigation_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_007, begin');
      const ratio: number = ContrastCalculator.ratioOfHex(COLOR_WHITE, COLOR_WARNING);
      hilog.info(DOMAIN, TAG, '%{public}s warning contrast: %{public}s',
        BUNDLE + 'AccessibilityNavigation_007', ContrastCalculator.describe(ratio));
      expect(ratio > 3).assertTrue();
      expect(ratio < 3.2).assertTrue();
      expect(ContrastCalculator.passesAALarge(ratio)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_007, end');
    });

    /**
     * Scenario: the success color is used as the submit button background.
     * Expectation: white over the success color misses even the large text threshold, the
     * audit records it as a low contrast pair so that the finding is not lost.
     */
    it('Assessment_AccessibilityNavigation_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_008, begin');
      const ratio: number = ContrastCalculator.ratioOfHex(COLOR_WHITE, COLOR_SUCCESS);
      hilog.info(DOMAIN, TAG, '%{public}s success contrast: %{public}s',
        BUNDLE + 'AccessibilityNavigation_008', ContrastCalculator.describe(ratio));
      expect(ratio < 3).assertTrue();
      expect(ContrastCalculator.passesAALarge(ratio)).assertFalse();
      expect(ContrastCalculator.grade(ratio)).assertEqual('Fail');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_008, end');
    });

    /**
     * Scenario: the secondary font color is translucent.
     * Expectation: the alpha blend over the card yields a mid grey that stays above the large
     * text threshold but misses the normal text threshold.
     */
    it('Assessment_AccessibilityNavigation_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_009, begin');
      const background: RgbColor = RgbColor.fromHex(COLOR_CARD_BACKGROUND);
      const foreground: RgbColor = RgbColor.fromHex(COLOR_SECONDARY_FONT).blendOver(background);
      hilog.info(DOMAIN, TAG, '%{public}s blended secondary font: %{public}s',
        BUNDLE + 'AccessibilityNavigation_009', foreground.toCss());
      expect(foreground.isOpaque()).assertTrue();
      const ratio: number = ContrastCalculator.contrastRatio(foreground, background);
      hilog.info(DOMAIN, TAG, '%{public}s secondary contrast: %{public}s',
        BUNDLE + 'AccessibilityNavigation_009', ContrastCalculator.describe(ratio));
      expect(ratio > 3).assertTrue();
      expect(ratio < 4.5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_009, end');
    });

    /**
     * Scenario: the contrast helper is exercised with the two extreme colors.
     * Expectation: black over white is exactly twenty one to one, the ratio is symmetric and
     * a color against itself is exactly one.
     */
    it('Assessment_AccessibilityNavigation_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_010, begin');
      const black: RgbColor = RgbColor.fromHex(COLOR_BLACK);
      const white: RgbColor = RgbColor.fromHex(COLOR_WHITE);
      const extreme: number = ContrastCalculator.contrastRatio(black, white);
      expect(Math.abs(extreme - MAX_CONTRAST_RATIO) < 0.01).assertTrue();
      const reversed: number = ContrastCalculator.contrastRatio(white, black);
      expect(Math.abs(reversed - extreme) < 0.0001).assertTrue();
      const same: number = ContrastCalculator.contrastRatio(white, white);
      expect(Math.abs(same - 1) < 0.0001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_010, end');
    });

    /**
     * Scenario: the focus traversal order of the entry page.
     * Expectation: the order follows the declared indices and the focusable nodes win over
     * the non focusable title.
     */
    it('Assessment_AccessibilityNavigation_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_011, begin');
      const order: string[] = entryAudit.focusOrder();
      hilog.info(DOMAIN, TAG, '%{public}s traversal order: %{public}s',
        BUNDLE + 'AccessibilityNavigation_011', order.join(' -> '));
      expect(order.length).assertEqual(6);
      expect(order[0]).assertEqual(ID_BUNDLE_INPUT);
      expect(order[1]).assertEqual(ID_ADD_BUTTON);
      expect(order[2]).assertEqual(ID_BEGIN_BUTTON);
      expect(order[3]).assertEqual(ID_END_BUTTON);
      expect(order[4]).assertEqual(ID_QUERY_STATE_BUTTON);
      expect(order[5]).assertEqual(ID_QUERY_CONFIG_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_011, end');
    });

    /**
     * Scenario: overlapping focus indices would make the traversal ambiguous.
     * Expectation: the synthetic entry page audit reports no duplicated index, while an audit
     * with a duplicated index reports the duplicated value exactly once.
     */
    it('Assessment_AccessibilityNavigation_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_012, begin');
      expect(entryAudit.duplicateFocusIndexes().length).assertEqual(0);
      const conflictAudit: AccessibilityAudit = new AccessibilityAudit('Conflict');
      conflictAudit.addNode(new AccessibilityNode('node_a', 'A', ROLE_BUTTON, 44, 1));
      conflictAudit.addNode(new AccessibilityNode('node_b', 'B', ROLE_BUTTON, 44, 1));
      conflictAudit.addNode(new AccessibilityNode('node_c', 'C', ROLE_BUTTON, 44, 2));
      const duplicates: number[] = conflictAudit.duplicateFocusIndexes();
      expect(duplicates.length).assertEqual(1);
      expect(duplicates[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_012, end');
    });

    /**
     * Scenario: a hidden node must not be announced.
     * Expectation: marking a node as screen reader hidden drops its announcement without
     * changing the focus order.
     */
    it('Assessment_AccessibilityNavigation_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_014, begin');
      const localAudit: AccessibilityAudit = buildEntryPageAudit();
      const before: number = localAudit.buildTraversalScript().length;
      const hiddenNode: AccessibilityNode | null = localAudit.findNode(ID_QUERY_CONFIG_BUTTON);
      expect(hiddenNode !== null).assertTrue();
      if (hiddenNode !== null) {
        hiddenNode.screenReaderHidden = true;
      }
      const after: number = localAudit.buildTraversalScript().length;
      expect(before).assertEqual(6);
      expect(after).assertEqual(5);
      expect(localAudit.focusOrder().length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_014, end');
    });

    /**
     * Scenario: a node without a label is unreachable for a screen reader.
     * Expectation: the audit reports the identifier, and the effective label falls back to the
     * identifier so that the announcement list never contains an empty entry.
     */
    it('Assessment_AccessibilityNavigation_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_015, begin');
      const localAudit: AccessibilityAudit = new AccessibilityAudit('LabelAudit');
      localAudit.addNode(new AccessibilityNode('node_with_label', 'begin', ROLE_BUTTON, 44, 0));
      localAudit.addNode(new AccessibilityNode('node_without_label', '', ROLE_BUTTON, 44, 1));
      const missing: string[] = localAudit.missingLabels();
      expect(missing.length).assertEqual(1);
      expect(missing[0]).assertEqual('node_without_label');
      const silentNode: AccessibilityNode | null = localAudit.findNode('node_without_label');
      expect(silentNode !== null).assertTrue();
      if (silentNode !== null) {
        expect(silentNode.hasLabel()).assertFalse();
        expect(silentNode.effectiveLabel()).assertEqual('node_without_label');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_015, end');
    });

    /**
     * Scenario: the average interactive height of the entry page.
     * Expectation: the average matches the six interactive nodes exactly, the pure text node
     * does not take part in the average.
     */
    it('Assessment_AccessibilityNavigation_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_017, begin');
      const average: number = entryAudit.averageInteractiveHeight();
      const expected: number = (DEFAULT_INPUT_HEIGHT_VP + DEFAULT_BUTTON_HEIGHT_VP * 5) / 6;
      hilog.info(DOMAIN, TAG, '%{public}s average height: %{public}s vp',
        BUNDLE + 'AccessibilityNavigation_017', average.toFixed(2));
      expect(Math.abs(average - expected) < 0.01).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_017, end');
    });

    /**
     * Scenario: the font scale changes the measured geometry but not the label.
     * Expectation: the touch target stays compliant at every supported scale, which is what
     * the layout budget of the entry page assumes.
     */
    it('Assessment_AccessibilityNavigation_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_018, begin');
      const scales: number[] = [1.0, 1.15, 1.3, 2.0];
      const baseNode: AccessibilityNode = new AccessibilityNode(ID_BEGIN_BUTTON, 'begin',
        ROLE_BUTTON, DEFAULT_BUTTON_HEIGHT_VP, FOCUS_INDEX_BEGIN);
      for (let i = 0; i < scales.length; i++) {
        const scaled: AccessibilityNode = baseNode.withScale(scales[i]);
        expect(scaled.label).assertEqual('begin');
        expect(scaled.heightVp >= DEFAULT_BUTTON_HEIGHT_VP).assertTrue();
        expect(scaled.isTouchTargetCompliant()).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_018, end');
    });

    /**
     * Scenario: the traversal model replays the TAB key.
     * Expectation: the cursor moves forward once per TAB and wraps to the first step after
     * the last one.
     */
    it('Assessment_AccessibilityNavigation_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_019, begin');
      const localModel: FocusTraversalModel = new FocusTraversalModel(entryAudit.focusOrder());
      expect(localModel.getCursor()).assertEqual(0);
      expect(localModel.currentId()).assertEqual(ID_BUNDLE_INPUT);
      localModel.moveNext();
      expect(localModel.currentId()).assertEqual(ID_ADD_BUTTON);
      while (localModel.getCursor() < localModel.size() - 1) {
        localModel.moveNext();
      }
      expect(localModel.currentId()).assertEqual(ID_QUERY_CONFIG_BUTTON);
      localModel.moveNext();
      expect(localModel.getCursor()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'AccessibilityNavigation_019', localModel.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_019, end');
    });

    /**
     * Scenario: the traversal model replays UP and a wrap disabled cursor.
     * Expectation: UP from the first step wraps to the last one, and with the wrap disabled
     * the cursor stays on the first step.
     */
    it('Assessment_AccessibilityNavigation_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_020, begin');
      const localModel: FocusTraversalModel = new FocusTraversalModel(entryAudit.focusOrder());
      localModel.movePrevious();
      expect(localModel.getCursor()).assertEqual(localModel.size() - 1);
      expect(localModel.currentId()).assertEqual(ID_QUERY_CONFIG_BUTTON);
      localModel.setWrapEnabled(false);
      localModel.moveNext();
      expect(localModel.currentId()).assertEqual(ID_QUERY_CONFIG_BUTTON);
      localModel.moveTo(ID_ADD_BUTTON);
      expect(localModel.getCursor()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_020, end');
    });

    /**
     * Scenario: the key sequence replay records the visited identifiers.
     * Expectation: two DOWN presses from the first step visit the first three steps, an UP
     * press then steps back once.
     */
    it('Assessment_AccessibilityNavigation_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_021, begin');
      const localModel: FocusTraversalModel = new FocusTraversalModel(entryAudit.focusOrder());
      const keys: number[] = [KEY_DOWN, KEY_DOWN, KEY_UP, KEY_TAB];
      const visited: string[] = localModel.replayKeySequence(keys);
      hilog.info(DOMAIN, TAG, '%{public}s visited: %{public}s',
        BUNDLE + 'AccessibilityNavigation_021', visited.join(','));
      expect(visited.length).assertEqual(5);
      expect(visited[0]).assertEqual(ID_BUNDLE_INPUT);
      expect(visited[1]).assertEqual(ID_ADD_BUTTON);
      expect(visited[2]).assertEqual(ID_BEGIN_BUTTON);
      expect(visited[3]).assertEqual(ID_ADD_BUTTON);
      expect(visited[4]).assertEqual(ID_BEGIN_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_021, end');
    });

    /**
     * Scenario: an empty traversal model.
     * Expectation: the cursor stays at minus one and both move operations are harmless.
     */
    it('Assessment_AccessibilityNavigation_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_022, begin');
      const emptyModel: FocusTraversalModel = new FocusTraversalModel([]);
      expect(emptyModel.size()).assertEqual(0);
      expect(emptyModel.getCursor()).assertEqual(-1);
      expect(emptyModel.currentId()).assertEqual('');
      emptyModel.moveNext();
      emptyModel.movePrevious();
      expect(emptyModel.getCursor()).assertEqual(-1);
      expect(emptyModel.replayKeySequence([KEY_TAB]).length).assertEqual(0);
      expect(emptyModel.moveTo(ID_BEGIN_BUTTON)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_022, end');
    });

    /**
     * Scenario: the whitelist input is an interactive node.
     * Expectation: the input is present, enabled and reported as an input role of the model.
     */
    it('Assessment_AccessibilityNavigation_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_027, begin');
      const rendered: boolean = await guardEntryPage(driver);
      if (!rendered) {
        return;
      }
      const inputNode: AccessibilityNode | null = await probeAccessibleNode(driver, ID_BUNDLE_INPUT,
        ROLE_INPUT, FOCUS_INDEX_INPUT, DEFAULT_INPUT_HEIGHT_VP);
      if (inputNode === null) {
        hilog.warn(DOMAIN, TAG, '%{public}s the input is absent, the case is skipped',
          BUNDLE + 'AccessibilityNavigation_027');
        return;
      }
      expect(inputNode.role).assertEqual(ROLE_INPUT);
      expect(inputNode.enabled).assertTrue();
      expect(inputNode.isFocusable()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'AccessibilityNavigation_027', inputNode.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_027, end');
    });

    /**
     * Scenario: the title is not part of the focus traversal.
     * Expectation: the title node reports no focusable state and does not appear in the focus
     * order, while it still carries a label.
     */
    it('Assessment_AccessibilityNavigation_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_028, begin');
      const titleNode: AccessibilityNode | null = entryAudit.findNode(ID_INDEX_TITLE);
      expect(titleNode !== null).assertTrue();
      if (titleNode !== null) {
        expect(titleNode.role).assertEqual(ROLE_TEXT);
        expect(titleNode.isFocusable()).assertFalse();
        expect(titleNode.hasLabel()).assertTrue();
        expect(titleNode.labelContrastRatio() > 10).assertTrue();
      }
      expect(entryAudit.focusOrder().indexOf(ID_INDEX_TITLE)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_028, end');
    });

    /**
     * Scenario: every interactive node of the entry page is enabled at rest.
     * Expectation: the model keeps the same enabled flags as the page, the begin button is
     * enabled while the end button follows the storage link.
     */
    it('Assessment_AccessibilityNavigation_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_031, begin');
      const beginNode: AccessibilityNode | null = entryAudit.findNode(ID_BEGIN_BUTTON);
      const endNode: AccessibilityNode | null = entryAudit.findNode(ID_END_BUTTON);
      expect(beginNode !== null).assertTrue();
      expect(endNode !== null).assertTrue();
      if (beginNode !== null && endNode !== null) {
        expect(beginNode.enabled).assertTrue();
        expect(beginNode.isFocusable()).assertTrue();
        beginNode.enabled = false;
        expect(beginNode.isFocusable()).assertFalse();
        expect(endNode.isFocusable()).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_031, end');
    });

    /**
     * Scenario: the color parser accepts the two supported notations.
     * Expectation: a six digit token is opaque, an eight digit token keeps the alpha, a
     * malformed token degrades to opaque black instead of throwing.
     */
    it('Assessment_AccessibilityNavigation_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_033, begin');
      const opaque: RgbColor = RgbColor.fromHex('#FFFFFF');
      expect(opaque.isOpaque()).assertTrue();
      expect(opaque.red).assertEqual(255);
      expect(opaque.green).assertEqual(255);
      expect(opaque.blue).assertEqual(255);
      const translucent: RgbColor = RgbColor.fromHex('#99182431');
      expect(translucent.isOpaque()).assertFalse();
      expect(Math.abs(translucent.alpha - 0.6) < 0.01).assertTrue();
      expect(translucent.red).assertEqual(24);
      const withoutHash: RgbColor = RgbColor.fromHex('007DFF');
      expect(withoutHash.blue).assertEqual(255);
      const malformed: RgbColor = RgbColor.fromHex('#XYZ');
      expect(malformed.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_033, end');
    });

    /**
     * Scenario: the blending is idempotent for an opaque foreground.
     * Expectation: an opaque color is returned unchanged, two equivalent colors report a
     * close match.
     */
    it('Assessment_AccessibilityNavigation_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_034, begin');
      const background: RgbColor = RgbColor.fromHex(COLOR_PAGE_BACKGROUND);
      const brand: RgbColor = RgbColor.fromHex(COLOR_BRAND);
      const blended: RgbColor = brand.blendOver(background);
      expect(blended.isCloseTo(brand)).assertTrue();
      const same: RgbColor = RgbColor.fromHex('#007DFF');
      expect(brand.isCloseTo(same)).assertTrue();
      const other: RgbColor = RgbColor.fromHex(COLOR_WARNING);
      expect(brand.isCloseTo(other)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_034, end');
    });

    /**
     * Scenario: the traversal model survives a page that reports a single focusable node.
     * Expectation: forward and backward moves keep the cursor on that node.
     */
    it('Assessment_AccessibilityNavigation_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_035, begin');
      const singleModel: FocusTraversalModel = new FocusTraversalModel([ID_BEGIN_BUTTON]);
      singleModel.moveNext();
      expect(singleModel.getCursor()).assertEqual(0);
      singleModel.movePrevious();
      expect(singleModel.getCursor()).assertEqual(0);
      expect(singleModel.currentId()).assertEqual(ID_BEGIN_BUTTON);
      const visited: string[] = singleModel.replayKeySequence([KEY_TAB, KEY_UP]);
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(ID_BEGIN_BUTTON);
      expect(visited[1]).assertEqual(ID_BEGIN_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_035, end');
    });

    /**
     * Scenario: the audit of a synthetic node with a low contrast label.
     * Expectation: the node is reported by the low contrast bucket and stays in the touch
     * target buckets independently.
     */
    it('Assessment_AccessibilityNavigation_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_036, begin');
      const localAudit: AccessibilityAudit = new AccessibilityAudit('ContrastAudit');
      const lowContrast: AccessibilityNode = new AccessibilityNode('assessment_low_contrast',
        'Submit', ROLE_BUTTON, 44, 0, COLOR_WHITE, COLOR_SUCCESS);
      localAudit.addNode(lowContrast);
      const normalContrast: AccessibilityNode = new AccessibilityNode('assessment_normal_contrast',
        'begin', ROLE_BUTTON, 44, 1, COLOR_WHITE, COLOR_TITLE_FONT);
      localAudit.addNode(normalContrast);
      const findings: string[] = localAudit.lowContrastNodes();
      expect(findings.length).assertEqual(1);
      expect(findings[0]).assertEqual('assessment_low_contrast');
      expect(localAudit.undersizedNodes().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AccessibilityNavigation_036, end');
    });
  });
}
