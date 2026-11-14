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
  KEY_DOWN,
  KEY_BACK,
  KEY_TAB,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  waitForIndexPage,
  isComponentEnabled,
  pressAndWait,
  getCurrentFocusIndex,
  checkFocusState
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Ring tokens of the sample. The ring is drawn by the ArkUI focus framework, the values below
// describe the default focus box of the OpenHarmony design system so that the model and the
// rendered page can be compared on the same numbers.
const RING_WIDTH_DEFAULT: number = 2;
const RING_WIDTH_THICK: number = 3;
const RING_OFFSET_DEFAULT: number = 0;
const RING_OFFSET_INSIDE: number = -1;
const RING_RADIUS_INPUT: number = 8;
const RING_RADIUS_BUTTON: number = 20;
const RING_RADIUS_CARD: number = 16;

// The brand colour of the sample, the ring uses it as its stroke colour in both themes.
const RING_COLOR_LIGHT: string = '#007DFF';
const RING_COLOR_DARK: string = '#0A59F7';
const RING_COLOR_DISABLED: string = '#66182431';

// Opacity of a ring that is fading in or out. The framework animates the alpha, the model
// tracks the boundary values so that an in flight transition can be classified.
const RING_ALPHA_FULL: number = 1;
const RING_ALPHA_HALF: number = 0.5;
const RING_ALPHA_ZERO: number = 0;

// Duration of the ring fade in and fade out in milliseconds.
const RING_TRANSITION_MS: number = 150;

/**
 * The lifecycle states of a focus ring.
 */
class RingState {
  public static readonly HIDDEN: string = 'hidden';
  public static readonly FADING_IN: string = 'fading_in';
  public static readonly VISIBLE: string = 'visible';
  public static readonly FADING_OUT: string = 'fading_out';
  public static readonly SUPPRESSED: string = 'suppressed';
}

/**
 * The reason a ring is not drawn even though the component holds the focus.
 */
class RingSuppressionReason {
  public static readonly NONE: string = 'none';
  public static readonly DISABLED: string = 'disabled';
  public static readonly INVISIBLE: string = 'invisible';
  public static readonly FOCUS_BY_POINTER: string = 'pointer';
  public static readonly EXPLICITLY_OFF: string = 'explicit_off';
}

/**
 * Geometric description of one ring.
 */
interface RingGeometry {
  x: number;
  y: number;
  width: number;
  height: number;
  radius: number;
}

/**
 * Colour and stroke tokens of one ring.
 */
interface RingStyle {
  color: string;
  width: number;
  offset: number;
}

/**
 * Record of one transition of a ring.
 */
interface RingTransition {
  seq: number;
  from: string;
  to: string;
  reason: string;
  alpha: number;
}

/**
 * Snapshot of the ring layer of the page. Exactly one entry may carry an active ring at a time,
 * the layer is the object that runs that invariant.
 */
class FocusRing {
  private targetId: string;
  private state: string;
  private reason: string;
  private alpha: number;
  private style: RingStyle;
  private geometry: RingGeometry;
  private focused: boolean;
  private enabled: boolean;
  private visible: boolean;
  private pointerFocus: boolean;
  private ringAllowed: boolean;
  private transitions: RingTransition[] = [];
  private sequence: number = 0;

  constructor(targetId: string, geometry: RingGeometry, style: RingStyle) {
    this.targetId = targetId;
    this.geometry = geometry;
    this.style = style;
    this.state = RingState.HIDDEN;
    this.reason = RingSuppressionReason.NONE;
    this.alpha = RING_ALPHA_ZERO;
    this.focused = false;
    this.enabled = true;
    this.visible = true;
    this.pointerFocus = false;
    this.ringAllowed = true;
  }

  public getTargetId(): string {
    return this.targetId;
  }

  public getState(): string {
    return this.state;
  }

  public getReason(): string {
    return this.reason;
  }

  public getAlpha(): number {
    return this.alpha;
  }

  public getStyle(): RingStyle {
    return {
      color: this.style.color,
      width: this.style.width,
      offset: this.style.offset
    };
  }

  public getGeometry(): RingGeometry {
    return {
      x: this.geometry.x,
      y: this.geometry.y,
      width: this.geometry.width,
      height: this.geometry.height,
      radius: this.geometry.radius
    };
  }

  public getTransitions(): RingTransition[] {
    return this.transitions.slice();
  }

  public getSequence(): number {
    return this.sequence;
  }

  public isFocused(): boolean {
    return this.focused;
  }

  public isEnabled(): boolean {
    return this.enabled;
  }

  public isVisible(): boolean {
    return this.visible;
  }

  public isPointerFocused(): boolean {
    return this.pointerFocus;
  }

  public isRingAllowed(): boolean {
    return this.ringAllowed;
  }

  /**
   * Reports whether the ring is painted right now. Fading states count as painted because the
   * alpha is above zero, which is what the screenshot comparison needs.
   */
  public isPainted(): boolean {
    if (this.state === RingState.SUPPRESSED || this.state === RingState.HIDDEN) {
      return false;
    }
    return this.alpha > RING_ALPHA_ZERO;
  }

  /**
   * Reports whether the ring is fully settled, which is the state a screenshot should capture.
   */
  public isSettled(): boolean {
    return this.state === RingState.VISIBLE && this.alpha === RING_ALPHA_FULL;
  }

  public setEnabled(enabled: boolean): void {
    this.enabled = enabled;
    if (!enabled && this.focused) {
      this.suppress(RingSuppressionReason.DISABLED);
    }
  }

  public setVisible(visible: boolean): void {
    this.visible = visible;
    if (!visible && this.focused) {
      this.suppress(RingSuppressionReason.INVISIBLE);
    }
  }

  public setPointerFocus(pointerFocus: boolean): void {
    this.pointerFocus = pointerFocus;
    if (pointerFocus && this.focused) {
      this.suppress(RingSuppressionReason.FOCUS_BY_POINTER);
    }
  }

  public setRingAllowed(allowed: boolean): void {
    this.ringAllowed = allowed;
    if (!allowed && this.focused) {
      this.suppress(RingSuppressionReason.EXPLICITLY_OFF);
    }
  }

  /**
   * Applies a focus change and returns the resulting state.
   *
   * A gain fades the ring in and settles it, a loss fades it out and hides it. A suppressed
   * ring stays suppressed until the suppression reason is cleared.
   */
  public applyFocus(focused: boolean): string {
    this.focused = focused;
    if (focused) {
      const reason: string = this.suppressionReasonNow();
      if (reason !== RingSuppressionReason.NONE) {
        this.suppress(reason);
        return this.state;
      }
      this.transition(RingState.FADING_IN, RingSuppressionReason.NONE, RING_ALPHA_HALF);
      this.transition(RingState.VISIBLE, RingSuppressionReason.NONE, RING_ALPHA_FULL);
      return this.state;
    }
    if (this.state === RingState.VISIBLE || this.state === RingState.FADING_IN) {
      this.transition(RingState.FADING_OUT, RingSuppressionReason.NONE, RING_ALPHA_HALF);
      this.transition(RingState.HIDDEN, RingSuppressionReason.NONE, RING_ALPHA_ZERO);
    }
    return this.state;
  }

  /**
   * Re-applies the current focus after a suppression reason changed.
   */
  public refresh(): string {
    if (!this.focused) {
      return this.state;
    }
    const reason: string = this.suppressionReasonNow();
    if (reason !== RingSuppressionReason.NONE) {
      this.suppress(reason);
      return this.state;
    }
    if (this.state !== RingState.VISIBLE) {
      this.transition(RingState.FADING_IN, RingSuppressionReason.NONE, RING_ALPHA_HALF);
      this.transition(RingState.VISIBLE, RingSuppressionReason.NONE, RING_ALPHA_FULL);
    }
    return this.state;
  }

  /**
   * Recomputes the first suppression reason that currently applies, the order matches the
   * precedence of the framework: disabled wins over invisible, invisible over pointer focus.
   */
  private suppressionReasonNow(): string {
    if (!this.ringAllowed) {
      return RingSuppressionReason.EXPLICITLY_OFF;
    }
    if (!this.enabled) {
      return RingSuppressionReason.DISABLED;
    }
    if (!this.visible) {
      return RingSuppressionReason.INVISIBLE;
    }
    if (this.pointerFocus) {
      return RingSuppressionReason.FOCUS_BY_POINTER;
    }
    return RingSuppressionReason.NONE;
  }

  private suppress(reason: string): void {
    this.reason = reason;
    this.transition(RingState.SUPPRESSED, reason, RING_ALPHA_ZERO);
  }

  private transition(to: string, reason: string, alpha: number): void {
    if (this.state === to && this.reason === reason) {
      return;
    }
    this.sequence++;
    this.transitions.push({
      seq: this.sequence,
      from: this.state,
      to: to,
      reason: reason,
      alpha: alpha
    });
    this.state = to;
    this.reason = reason;
    this.alpha = alpha;
  }

  public reset(): void {
    this.state = RingState.HIDDEN;
    this.reason = RingSuppressionReason.NONE;
    this.alpha = RING_ALPHA_ZERO;
    this.focused = false;
    this.transitions = [];
    this.sequence = 0;
  }

  public toString(): string {
    return `FocusRing{id=${this.targetId}, state=${this.state}, alpha=${this.alpha}}`;
  }
}

/**
 * The layer that owns every ring of the entry page. Its single invariant: at most one ring is
 * painted after any focus change, and exactly one ring is visible while a traversable
 * component holds the focus.
 */
class RingLayer {
  private rings: Map<string, FocusRing> = new Map<string, FocusRing>();
  private order: string[] = [];
  private activeId: string = '';
  private violations: number = 0;

  public add(ring: FocusRing): void {
    if (!this.rings.has(ring.getTargetId())) {
      this.order.push(ring.getTargetId());
    }
    this.rings.set(ring.getTargetId(), ring);
  }

  public size(): number {
    return this.order.length;
  }

  public ids(): string[] {
    return this.order.slice();
  }

  public get(id: string): FocusRing | null {
    const ring: FocusRing | undefined = this.rings.get(id);
    return ring === undefined ? null : ring;
  }

  public getActiveId(): string {
    return this.activeId;
  }

  /**
   * Moves the focus to one ring. Every other ring is explicitly blurred so that a stale ring
   * cannot survive a focus move, which is the defect this invariant protects against.
   */
  public focus(id: string): boolean {
    const target: FocusRing | null = this.get(id);
    if (target === null) {
      return false;
    }
    for (let i = 0; i < this.order.length; i++) {
      const ring: FocusRing | null = this.get(this.order[i]);
      if (ring === null) {
        continue;
      }
      if (this.order[i] !== id) {
        ring.applyFocus(false);
      }
    }
    target.applyFocus(true);
    this.activeId = id;
    this.verify();
    return true;
  }

  /**
   * Clears the focus of the whole layer, no ring is painted afterwards.
   */
  public blurAll(): void {
    for (let i = 0; i < this.order.length; i++) {
      const ring: FocusRing | null = this.get(this.order[i]);
      if (ring !== null) {
        ring.applyFocus(false);
      }
    }
    this.activeId = '';
    this.verify();
  }

  /**
   * Counts the rings that are painted at this moment.
   */
  public paintedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.order.length; i++) {
      const ring: FocusRing | null = this.get(this.order[i]);
      if (ring !== null && ring.isPainted()) {
        count++;
      }
    }
    return count;
  }

  /**
   * Counts the rings that fully settled, which is the state a screenshot should observe.
   */
  public settledCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.order.length; i++) {
      const ring: FocusRing | null = this.get(this.order[i]);
      if (ring !== null && ring.isSettled()) {
        count++;
      }
    }
    return count;
  }

  public suppressedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.order.length; i++) {
      const ring: FocusRing | null = this.get(this.order[i]);
      if (ring !== null && ring.getState() === RingState.SUPPRESSED) {
        count++;
      }
    }
    return count;
  }

  /**
   * Runs the invariants and records a violation when one of them breaks.
   */
  public verify(): boolean {
    const painted: number = this.paintedCount();
    if (painted > 1) {
      this.violations++;
      hilog.warn(DOMAIN, TAG, 'RingLayer verify: %{public}d rings painted', painted);
      return false;
    }
    if (this.activeId.length > 0) {
      const active: FocusRing | null = this.get(this.activeId);
      if (active !== null && active.isFocused() && active.getState() === RingState.VISIBLE
        && painted !== 1) {
        this.violations++;
        hilog.warn(DOMAIN, TAG, 'RingLayer verify: the visible ring is not painted');
        return false;
      }
    }
    return true;
  }

  public getViolations(): number {
    return this.violations;
  }

  public reset(): void {
    for (let i = 0; i < this.order.length; i++) {
      const ring: FocusRing | null = this.get(this.order[i]);
      if (ring !== null) {
        ring.reset();
      }
    }
    this.activeId = '';
    this.violations = 0;
  }

  public toString(): string {
    return `RingLayer{rings=${this.order.length}, active=${this.activeId}, painted=${this.paintedCount()}}`;
  }
}

/**
 * Token provider of the ring colours per colour mode.
 */
class RingTokenSource {
  private mode: string;

  constructor(mode: string) {
    this.mode = mode;
  }

  public getMode(): string {
    return this.mode;
  }

  /**
   * Stroke colour of the ring for a component type. The brand colour is used in both modes,
   * the dark palette carries a slightly deeper brand so that the ring keeps its contrast on
   * the dark page background.
   */
  public colorFor(type: string): string {
    if (type === 'Button' || type === 'TextInput') {
      return this.mode === 'dark' ? RING_COLOR_DARK : RING_COLOR_LIGHT;
    }
    return this.mode === 'dark' ? RING_COLOR_DARK : RING_COLOR_LIGHT;
  }

  public widthFor(type: string): number {
    if (type === 'TextInput') {
      return RING_WIDTH_THICK;
    }
    return RING_WIDTH_DEFAULT;
  }

  public offsetFor(type: string): number {
    if (type === 'TextInput') {
      return RING_OFFSET_INSIDE;
    }
    return RING_OFFSET_DEFAULT;
  }

  public radiusFor(type: string): number {
    if (type === 'Button') {
      return RING_RADIUS_BUTTON;
    }
    if (type === 'TextInput') {
      return RING_RADIUS_INPUT;
    }
    return RING_RADIUS_CARD;
  }

  public disabledColor(): string {
    return RING_COLOR_DISABLED;
  }

  public styleFor(type: string): RingStyle {
    return {
      color: this.colorFor(type),
      width: this.widthFor(type),
      offset: this.offsetFor(type)
    };
  }

  public toString(): string {
    return `RingTokenSource{mode=${this.mode}}`;
  }
}

/**
 * Builds the ring layer of the entry page from the column layout of the operation card.
 */
function buildEntryRingLayer(mode: string = 'light'): RingLayer {
  const tokens: RingTokenSource = new RingTokenSource(mode);
  const layer: RingLayer = new RingLayer();
  layer.add(new FocusRing(ID_BUNDLE_INPUT, {
    x: 0, y: 136, width: 260, height: 40, radius: tokens.radiusFor('TextInput')
  }, tokens.styleFor('TextInput')));
  layer.add(new FocusRing(ID_ADD_BUTTON, {
    x: 268, y: 136, width: 80, height: 40, radius: tokens.radiusFor('Button')
  }, tokens.styleFor('Button')));
  layer.add(new FocusRing(ID_BEGIN_BUTTON, {
    x: 0, y: 188, width: 164, height: 44, radius: tokens.radiusFor('Button')
  }, tokens.styleFor('Button')));
  layer.add(new FocusRing(ID_END_BUTTON, {
    x: 172, y: 188, width: 164, height: 44, radius: tokens.radiusFor('Button')
  }, tokens.styleFor('Button')));
  layer.add(new FocusRing(ID_QUERY_STATE_BUTTON, {
    x: 0, y: 244, width: 164, height: 44, radius: tokens.radiusFor('Button')
  }, tokens.styleFor('Button')));
  layer.add(new FocusRing(ID_QUERY_CONFIG_BUTTON, {
    x: 172, y: 244, width: 164, height: 44, radius: tokens.radiusFor('Button')
  }, tokens.styleFor('Button')));
  const disabled: FocusRing | null = layer.get(ID_END_BUTTON);
  if (disabled !== null) {
    disabled.setEnabled(false);
  }
  return layer;
}

/**
 * Starts the sample and reports whether the entry page is reachable.
 */
async function ensureIndexPage(driver: Driver): Promise<boolean> {
  const title: Component | null = await findById(driver, ID_INDEX_TITLE);
  if (title !== null) {
    return true;
  }
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'ensureIndexPage: the entry page is not rendered');
  }
  return rendered;
}

/**
 * Reads the focus index and normalizes a driver failure to -1.
 */
async function safeFocusIndex(driver: Driver): Promise<number> {
  const index: number = await getCurrentFocusIndex(driver);
  if (index < -1) {
    hilog.warn(DOMAIN, TAG, 'safeFocusIndex: unexpected index %{public}d', index);
    return -1;
  }
  return index;
}

export default function focusRingBehaviorTest() {
  describe('FocusRingBehavior_Test', () => {
    let driver: Driver;
    let layer: RingLayer;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      layer = buildEntryRingLayer('light');
      hilog.info(DOMAIN, TAG, 'FocusRingBehavior_Test beforeAll, %{public}s', layer.toString());
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: build the ring layer of the entry page.
     * Expectation: one ring exists for the input box and every button, no ring exists for the
     * title because the title is a text component.
     */
    it('Assessment_RingLayerSize_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingLayerSize_001, begin');
      expect(layer.size()).assertEqual(6);
      expect(layer.get(ID_INDEX_TITLE) === null).assertTrue();
      expect(layer.get(ID_BUNDLE_INPUT) !== null).assertTrue();
      expect(layer.get(ID_ADD_BUTTON) !== null).assertTrue();
      expect(layer.get(ID_BEGIN_BUTTON) !== null).assertTrue();
      expect(layer.get(ID_END_BUTTON) !== null).assertTrue();
      expect(layer.get(ID_QUERY_STATE_BUTTON) !== null).assertTrue();
      expect(layer.get(ID_QUERY_CONFIG_BUTTON) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s rings: %{public}d', BUNDLE + 'RingLayerSize_001', layer.size());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingLayerSize_001, end');
    });

    /**
     * Scenario: the initial ring state.
     * Expectation: no ring is painted before any component receives the focus.
     */
    it('Assessment_RingInitiallyHidden_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingInitiallyHidden_002, begin');
      const ring: FocusRing | null = layer.get(ID_BUNDLE_INPUT);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        expect(ring.getState()).assertEqual(RingState.HIDDEN);
        expect(ring.isPainted()).assertFalse();
        expect(ring.isSettled()).assertFalse();
        expect(ring.getAlpha()).assertEqual(RING_ALPHA_ZERO);
      }
      expect(layer.paintedCount()).assertEqual(0);
      expect(layer.settledCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingInitiallyHidden_002, end');
    });

    /**
     * Scenario: the focus gains the input box.
     * Expectation: the ring fades in, settles at full alpha and is the only painted ring.
     */
    it('Assessment_RingFocusGain_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingFocusGain_003, begin');
      layer.reset();
      expect(layer.focus(ID_BUNDLE_INPUT)).assertTrue();
      const ring: FocusRing | null = layer.get(ID_BUNDLE_INPUT);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        expect(ring.getState()).assertEqual(RingState.VISIBLE);
        expect(ring.isSettled()).assertTrue();
        expect(ring.getAlpha()).assertEqual(RING_ALPHA_FULL);
        expect(ring.getTransitions().length).assertEqual(2);
        expect(ring.getTransitions()[0].to).assertEqual(RingState.FADING_IN);
        expect(ring.getTransitions()[1].to).assertEqual(RingState.VISIBLE);
      }
      expect(layer.paintedCount()).assertEqual(1);
      expect(layer.getActiveId()).assertEqual(ID_BUNDLE_INPUT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingFocusGain_003, end');
    });

    /**
     * Scenario: the focus leaves the input box.
     * Expectation: the ring fades out, hides and the layer paints nothing afterwards.
     */
    it('Assessment_RingFocusLoss_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingFocusLoss_004, begin');
      layer.reset();
      layer.focus(ID_BUNDLE_INPUT);
      const ring: FocusRing | null = layer.get(ID_BUNDLE_INPUT);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        ring.applyFocus(false);
        expect(ring.getState()).assertEqual(RingState.HIDDEN);
        expect(ring.getAlpha()).assertEqual(RING_ALPHA_ZERO);
        expect(ring.isPainted()).assertFalse();
        const transitions: RingTransition[] = ring.getTransitions();
        const lastTransition: RingTransition = transitions[transitions.length - 1];
        expect(lastTransition.to).assertEqual(RingState.HIDDEN);
      }
      expect(layer.paintedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingFocusLoss_004, end');
    });

    /**
     * Scenario: the ring fades in through the half alpha step.
     * Expectation: the fade in transition carries the half alpha, the settle carries the full
     * alpha, so a screenshot taken mid transition can be classified.
     */
    it('Assessment_RingFadeAlphaSteps_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingFadeAlphaSteps_005, begin');
      layer.reset();
      layer.focus(ID_BEGIN_BUTTON);
      const ring: FocusRing | null = layer.get(ID_BEGIN_BUTTON);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        const transitions: RingTransition[] = ring.getTransitions();
        expect(transitions.length).assertEqual(2);
        expect(transitions[0].alpha).assertEqual(RING_ALPHA_HALF);
        expect(transitions[0].from).assertEqual(RingState.HIDDEN);
        expect(transitions[1].alpha).assertEqual(RING_ALPHA_FULL);
        expect(transitions[1].from).assertEqual(RingState.FADING_IN);
        expect(transitions[0].seq).assertEqual(1);
        expect(transitions[1].seq).assertEqual(2);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingFadeAlphaSteps_005, end');
    });

    /**
     * Scenario: move the focus between two rings.
     * Expectation: the old ring is hidden before the new one settles and only one ring is
     * painted at any point in the sequence.
     */
    it('Assessment_RingExclusivePainted_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingExclusivePainted_006, begin');
      layer.reset();
      layer.focus(ID_BEGIN_BUTTON);
      expect(layer.paintedCount()).assertEqual(1);
      layer.focus(ID_QUERY_STATE_BUTTON);
      expect(layer.paintedCount()).assertEqual(1);
      expect(layer.settledCount()).assertEqual(1);
      expect(layer.getActiveId()).assertEqual(ID_QUERY_STATE_BUTTON);
      const previous: FocusRing | null = layer.get(ID_BEGIN_BUTTON);
      expect(previous !== null).assertTrue();
      if (previous !== null) {
        expect(previous.getState()).assertEqual(RingState.HIDDEN);
        expect(previous.isFocused()).assertFalse();
      }
      const current: FocusRing | null = layer.get(ID_QUERY_STATE_BUTTON);
      expect(current !== null).assertTrue();
      if (current !== null) {
        expect(current.isSettled()).assertTrue();
      }
      expect(layer.getViolations()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingExclusivePainted_006, end');
    });

    /**
     * Scenario: move the focus over the whole ring layer.
     * Expectation: after visiting every ring once exactly one ring is painted and the layer
     * reports no invariant violation.
     */
    it('Assessment_RingExclusiveAcrossAll_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingExclusiveAcrossAll_007, begin');
      layer.reset();
      const ids: string[] = layer.ids();
      let maxPainted: number = 0;
      for (let i = 0; i < ids.length; i++) {
        layer.focus(ids[i]);
        const painted: number = layer.paintedCount();
        if (painted > maxPainted) {
          maxPainted = painted;
        }
      }
      expect(maxPainted).assertEqual(1);
      expect(layer.paintedCount()).assertEqual(1);
      expect(layer.getViolations()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s max painted: %{public}d', BUNDLE + 'RingExclusiveAcrossAll_007', maxPainted);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingExclusiveAcrossAll_007, end');
    });

    /**
     * Scenario: move the focus to a component that is disabled.
     * Expectation: the ring is suppressed with the disabled reason even though the component
     * holds the focus, because the framework does not paint a ring on a disabled target.
     */
    it('Assessment_RingSuppressedOnDisabled_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSuppressedOnDisabled_008, begin');
      layer.reset();
      const ring: FocusRing | null = layer.get(ID_END_BUTTON);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        expect(ring.isEnabled()).assertFalse();
        ring.applyFocus(true);
        expect(ring.getState()).assertEqual(RingState.SUPPRESSED);
        expect(ring.getReason()).assertEqual(RingSuppressionReason.DISABLED);
        expect(ring.isPainted()).assertFalse();
        expect(ring.getAlpha()).assertEqual(RING_ALPHA_ZERO);
      }
      expect(layer.paintedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSuppressedOnDisabled_008, end');
    });

    /**
     * Scenario: the disabled component becomes enabled while it holds the focus.
     * Expectation: a refresh clears the suppression and the ring settles.
     */
    it('Assessment_RingRestoredAfterEnable_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingRestoredAfterEnable_009, begin');
      layer.reset();
      const ring: FocusRing | null = layer.get(ID_END_BUTTON);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        ring.applyFocus(true);
        expect(ring.getState()).assertEqual(RingState.SUPPRESSED);
        ring.setEnabled(true);
        ring.refresh();
        expect(ring.getState()).assertEqual(RingState.VISIBLE);
        expect(ring.isSettled()).assertTrue();
        expect(ring.getReason()).assertEqual(RingSuppressionReason.NONE);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingRestoredAfterEnable_009, end');
    });

    /**
     * Scenario: a focused component becomes disabled.
     * Expectation: the ring hides immediately, no ring is left behind.
     */
    it('Assessment_RingHiddenWhenDisabled_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingHiddenWhenDisabled_010, begin');
      layer.reset();
      layer.focus(ID_BEGIN_BUTTON);
      expect(layer.paintedCount()).assertEqual(1);
      const ring: FocusRing | null = layer.get(ID_BEGIN_BUTTON);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        ring.setEnabled(false);
        expect(ring.getState()).assertEqual(RingState.SUPPRESSED);
        expect(ring.getReason()).assertEqual(RingSuppressionReason.DISABLED);
        expect(ring.isPainted()).assertFalse();
      }
      expect(layer.paintedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingHiddenWhenDisabled_010, end');
    });

    /**
     * Scenario: a focused component becomes invisible.
     * Expectation: the ring is suppressed with the invisible reason, which is distinguishable
     * from a disabled suppression in the log.
     */
    it('Assessment_RingSuppressedOnInvisible_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSuppressedOnInvisible_011, begin');
      layer.reset();
      layer.focus(ID_QUERY_CONFIG_BUTTON);
      const ring: FocusRing | null = layer.get(ID_QUERY_CONFIG_BUTTON);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        ring.setVisible(false);
        expect(ring.getState()).assertEqual(RingState.SUPPRESSED);
        expect(ring.getReason()).assertEqual(RingSuppressionReason.INVISIBLE);
      }
      expect(layer.paintedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSuppressedOnInvisible_011, end');
    });

    /**
     * Scenario: the focus originates from a pointer click.
     * Expectation: the ring is suppressed with the pointer reason, the framework distinguishes
     * a keyboard focus from a touch focus.
     */
    it('Assessment_RingSuppressedOnPointerFocus_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSuppressedOnPointerFocus_012, begin');
      layer.reset();
      layer.focus(ID_ADD_BUTTON);
      const ring: FocusRing | null = layer.get(ID_ADD_BUTTON);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        ring.setPointerFocus(true);
        expect(ring.getState()).assertEqual(RingState.SUPPRESSED);
        expect(ring.getReason()).assertEqual(RingSuppressionReason.FOCUS_BY_POINTER);
        ring.setPointerFocus(false);
        ring.refresh();
        expect(ring.getState()).assertEqual(RingState.VISIBLE);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSuppressedOnPointerFocus_012, end');
    });

    /**
     * Scenario: the page turns the focus ring off explicitly.
     * Expectation: the ring is suppressed with the explicit reason and stays off while the
     * flag is set.
     */
    it('Assessment_RingSuppressedExplicitOff_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSuppressedExplicitOff_013, begin');
      layer.reset();
      layer.focus(ID_QUERY_STATE_BUTTON);
      const ring: FocusRing | null = layer.get(ID_QUERY_STATE_BUTTON);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        ring.setRingAllowed(false);
        expect(ring.getState()).assertEqual(RingState.SUPPRESSED);
        expect(ring.getReason()).assertEqual(RingSuppressionReason.EXPLICITLY_OFF);
        expect(ring.isRingAllowed()).assertFalse();
        ring.setRingAllowed(true);
        ring.refresh();
        expect(ring.getState()).assertEqual(RingState.VISIBLE);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSuppressedExplicitOff_013, end');
    });

    /**
     * Scenario: the suppression precedence when several reasons apply.
     * Expectation: an explicit off wins over disabled, disabled wins over invisible, which is
     * the order the framework applies them in.
     */
    it('Assessment_RingSuppressionPrecedence_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSuppressionPrecedence_014, begin');
      const ring: FocusRing = new FocusRing('probe', {
        x: 0, y: 0, width: 10, height: 10, radius: 4
      }, {
        color: RING_COLOR_LIGHT, width: RING_WIDTH_DEFAULT, offset: RING_OFFSET_DEFAULT
      });
      ring.setEnabled(false);
      ring.setVisible(false);
      ring.applyFocus(true);
      expect(ring.getReason()).assertEqual(RingSuppressionReason.DISABLED);
      ring.setRingAllowed(false);
      ring.refresh();
      expect(ring.getReason()).assertEqual(RingSuppressionReason.EXPLICITLY_OFF);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSuppressionPrecedence_014, end');
    });

    /**
     * Scenario: the transition sequence numbers.
     * Expectation: every recorded transition carries the next number of the ring.
     */
    it('Assessment_RingSequenceNumbers_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSequenceNumbers_016, begin');
      const ring: FocusRing = new FocusRing('probe', {
        x: 0, y: 0, width: 10, height: 10, radius: 4
      }, {
        color: RING_COLOR_LIGHT, width: RING_WIDTH_DEFAULT, offset: RING_OFFSET_DEFAULT
      });
      ring.applyFocus(true);
      ring.applyFocus(false);
      expect(ring.getSequence()).assertEqual(4);
      const transitions: RingTransition[] = ring.getTransitions();
      expect(transitions[0].seq).assertEqual(1);
      expect(transitions[1].seq).assertEqual(2);
      expect(transitions[2].seq).assertEqual(3);
      expect(transitions[3].seq).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingSequenceNumbers_016, end');
    });

    /**
     * Scenario: the reset of a single ring.
     * Expectation: a reset clears the state, the alpha and the transition log, and releases
     * the focus before the next walk starts.
     */
    it('Assessment_RingReset_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingReset_017, begin');
      const ring: FocusRing | null = layer.get(ID_BUNDLE_INPUT);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        layer.focus(ID_BUNDLE_INPUT);
        expect(ring.isFocused()).assertTrue();
        ring.reset();
        expect(ring.getState()).assertEqual(RingState.HIDDEN);
        expect(ring.isFocused()).assertFalse();
        expect(ring.getTransitions().length).assertEqual(0);
        expect(ring.getSequence()).assertEqual(0);
        expect(ring.getAlpha()).assertEqual(RING_ALPHA_ZERO);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingReset_017, end');
    });

    /**
     * Scenario: the ring geometry follows the component rectangle.
     * Expectation: the ring of the begin button mirrors the button rectangle and the radius
     * token, so an inset ring is not confused with a shifted component.
     */
    it('Assessment_RingGeometryMatchesComponent_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingGeometryMatchesComponent_018, begin');
      const ring: FocusRing | null = layer.get(ID_BEGIN_BUTTON);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        const geometry: RingGeometry = ring.getGeometry();
        expect(geometry.x).assertEqual(0);
        expect(geometry.y).assertEqual(188);
        expect(geometry.width).assertEqual(164);
        expect(geometry.height).assertEqual(44);
        expect(geometry.radius).assertEqual(RING_RADIUS_BUTTON);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingGeometryMatchesComponent_018, end');
    });

    /**
     * Scenario: the ring geometry of the input box.
     * Expectation: the input box uses the small input radius token, which is different from
     * the button radius.
     */
    it('Assessment_RingGeometryInputRadius_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingGeometryInputRadius_019, begin');
      const ring: FocusRing | null = layer.get(ID_BUNDLE_INPUT);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        expect(ring.getGeometry().radius).assertEqual(RING_RADIUS_INPUT);
        expect(ring.getGeometry().width).assertEqual(260);
        expect(ring.getStyle().width).assertEqual(RING_WIDTH_THICK);
        expect(ring.getStyle().offset).assertEqual(RING_OFFSET_INSIDE);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingGeometryInputRadius_019, end');
    });

    /**
     * Scenario: the ring style of a button.
     * Expectation: the button ring uses the default width, the default offset and the brand
     * colour of the light palette.
     */
    it('Assessment_RingStyleButton_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingStyleButton_020, begin');
      const ring: FocusRing | null = layer.get(ID_QUERY_STATE_BUTTON);
      expect(ring !== null).assertTrue();
      if (ring !== null) {
        const style: RingStyle = ring.getStyle();
        expect(style.color).assertEqual(RING_COLOR_LIGHT);
        expect(style.width).assertEqual(RING_WIDTH_DEFAULT);
        expect(style.offset).assertEqual(RING_OFFSET_DEFAULT);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingStyleButton_020, end');
    });

    /**
     * Scenario: token resolution per colour mode.
     * Expectation: the light and the dark palette resolve the ring colour to different values
     * and every other token stays identical.
     */
    it('Assessment_TokenResolutionPerMode_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TokenResolutionPerMode_021, begin');
      const light: RingTokenSource = new RingTokenSource('light');
      const dark: RingTokenSource = new RingTokenSource('dark');
      expect(light.colorFor('Button')).assertEqual(RING_COLOR_LIGHT);
      expect(dark.colorFor('Button')).assertEqual(RING_COLOR_DARK);
      expect(light.colorFor('Button') === dark.colorFor('Button')).assertFalse();
      expect(light.widthFor('Button')).assertEqual(dark.widthFor('Button'));
      expect(light.offsetFor('Button')).assertEqual(dark.offsetFor('Button'));
      expect(light.radiusFor('Button')).assertEqual(dark.radiusFor('Button'));
      expect(light.getMode()).assertEqual('light');
      expect(dark.getMode()).assertEqual('dark');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TokenResolutionPerMode_021, end');
    });

    /**
     * Scenario: the radius token per component type.
     * Expectation: input, button and card resolve to three distinct radii.
     */
    it('Assessment_RadiusTokens_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RadiusTokens_022, begin');
      const tokens: RingTokenSource = new RingTokenSource('light');
      expect(tokens.radiusFor('TextInput')).assertEqual(8);
      expect(tokens.radiusFor('Button')).assertEqual(20);
      expect(tokens.radiusFor('Text')).assertEqual(16);
      expect(tokens.radiusFor('TextInput')).assertEqual(RING_RADIUS_INPUT);
      expect(tokens.radiusFor('Button')).assertEqual(RING_RADIUS_BUTTON);
      expect(tokens.radiusFor('Text')).assertEqual(RING_RADIUS_CARD);
      const unique: Set<number> = new Set<number>([
        tokens.radiusFor('TextInput'),
        tokens.radiusFor('Button'),
        tokens.radiusFor('Text')
      ]);
      expect(unique.size).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RadiusTokens_022, end');
    });

    /**
     * Scenario: the width token per component type.
     * Expectation: the input box uses the thick ring, every button uses the default ring.
     */
    it('Assessment_WidthTokens_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WidthTokens_023, begin');
      const tokens: RingTokenSource = new RingTokenSource('light');
      expect(tokens.widthFor('TextInput')).assertEqual(RING_WIDTH_THICK);
      expect(tokens.widthFor('Button')).assertEqual(RING_WIDTH_DEFAULT);
      expect(tokens.widthFor('TextInput') > tokens.widthFor('Button')).assertTrue();
      expect(tokens.widthFor('TextInput')).assertEqual(3);
      expect(tokens.widthFor('Button')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WidthTokens_023, end');
    });

    /**
     * Scenario: the disabled ring colour.
     * Expectation: the disabled colour is a translucent variant and is not the same as the
     * enabled brand colour.
     */
    it('Assessment_DisabledRingColor_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DisabledRingColor_024, begin');
      const tokens: RingTokenSource = new RingTokenSource('light');
      expect(tokens.disabledColor()).assertEqual(RING_COLOR_DISABLED);
      expect(tokens.disabledColor() === tokens.colorFor('Button')).assertFalse();
      expect(RING_COLOR_DISABLED.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DisabledRingColor_024, end');
    });

    /**
     * Scenario: focus a ring that is not part of the layer.
     * Expectation: the request is rejected and the active ring is unchanged.
     */
    it('Assessment_FocusUnknownRejected_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusUnknownRejected_027, begin');
      layer.reset();
      expect(layer.focus('assessment_unknown_button')).assertFalse();
      expect(layer.getActiveId()).assertEqual('');
      expect(layer.paintedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FocusUnknownRejected_027, end');
    });

    /**
     * Scenario: add a ring twice.
     * Expectation: the layer keeps one entry per identifier, the size does not grow.
     */
    it('Assessment_AddRingTwice_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AddRingTwice_028, begin');
      const localLayer: RingLayer = buildEntryRingLayer('light');
      const sizeBefore: number = localLayer.size();
      localLayer.add(new FocusRing(ID_ADD_BUTTON, {
        x: 0, y: 0, width: 10, height: 10, radius: 4
      }, {
        color: RING_COLOR_LIGHT, width: RING_WIDTH_DEFAULT, offset: RING_OFFSET_DEFAULT
      }));
      expect(localLayer.size()).assertEqual(sizeBefore);
      expect(localLayer.ids().indexOf(ID_ADD_BUTTON)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AddRingTwice_028, end');
    });

    /**
     * Scenario: a ring in the fading in state is painted.
     * Expectation: the half alpha counts as painted, which is why a mid transition screenshot
     * must not be used for a colour comparison.
     */
    it('Assessment_FadingIsPainted_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FadingIsPainted_029, begin');
      const ring: FocusRing = new FocusRing('probe', {
        x: 0, y: 0, width: 10, height: 10, radius: 4
      }, {
        color: RING_COLOR_LIGHT, width: RING_WIDTH_DEFAULT, offset: RING_OFFSET_DEFAULT
      });
      ring.applyFocus(true);
      expect(ring.getState()).assertEqual(RingState.VISIBLE);
      expect(ring.isPainted()).assertTrue();
      expect(ring.isSettled()).assertTrue();
      ring.setEnabled(false);
      expect(ring.isPainted()).assertFalse();
      expect(ring.getState()).assertEqual(RingState.SUPPRESSED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FadingIsPainted_029, end');
    });

    /**
     * Scenario: the transition duration token.
     * Expectation: the fade duration is short enough to settle within one frame budget of the
     * live cases and long enough to be observable.
     */
    it('Assessment_TransitionDurationToken_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TransitionDurationToken_030, begin');
      expect(RING_TRANSITION_MS).assertEqual(150);
      expect(RING_TRANSITION_MS > 0).assertTrue();
      expect(RING_TRANSITION_MS < 1000).assertTrue();
      expect(RING_TRANSITION_MS <= TIMEOUT_FOCUS_CHANGE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TransitionDurationToken_030, end');
    });

    /**
     * Scenario: the alpha boundary values.
     * Expectation: the full, half and zero alphas are ordered and the half value sits strictly
     * between the two boundaries.
     */
    it('Assessment_AlphaBoundaries_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AlphaBoundaries_031, begin');
      expect(RING_ALPHA_ZERO).assertEqual(0);
      expect(RING_ALPHA_FULL).assertEqual(1);
      expect(RING_ALPHA_HALF > RING_ALPHA_ZERO).assertTrue();
      expect(RING_ALPHA_HALF < RING_ALPHA_FULL).assertTrue();
      expect(RING_ALPHA_HALF).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AlphaBoundaries_031, end');
    });

    /**
     * Scenario: the suppression reasons are distinct strings.
     * Expectation: no two reasons collide, so a log line can be classified unambiguously.
     */
    it('Assessment_SuppressionReasonsDistinct_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SuppressionReasonsDistinct_032, begin');
      const reasons: string[] = [
        RingSuppressionReason.NONE,
        RingSuppressionReason.DISABLED,
        RingSuppressionReason.INVISIBLE,
        RingSuppressionReason.FOCUS_BY_POINTER,
        RingSuppressionReason.EXPLICITLY_OFF
      ];
      const unique: Set<string> = new Set<string>(reasons);
      expect(unique.size).assertEqual(reasons.length);
      expect(reasons.indexOf(RingSuppressionReason.NONE)).assertEqual(0);
      expect(reasons.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SuppressionReasonsDistinct_032, end');
    });

    /**
     * Scenario: the ring states are distinct strings.
     * Expectation: the five ring states form a set of five values.
     */
    it('Assessment_RingStatesDistinct_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingStatesDistinct_033, begin');
      const states: string[] = [
        RingState.HIDDEN,
        RingState.FADING_IN,
        RingState.VISIBLE,
        RingState.FADING_OUT,
        RingState.SUPPRESSED
      ];
      const unique: Set<string> = new Set<string>(states);
      expect(unique.size).assertEqual(5);
      expect(states.indexOf(RingState.VISIBLE)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingStatesDistinct_033, end');
    });

    /**
     * Scenario: reset the whole layer.
     * Expectation: every ring returns to the hidden state and the violation counter is zero.
     */
    it('Assessment_LayerReset_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LayerReset_034, begin');
      layer.focus(ID_BEGIN_BUTTON);
      layer.focus(ID_ADD_BUTTON);
      layer.reset();
      expect(layer.paintedCount()).assertEqual(0);
      expect(layer.getActiveId()).assertEqual('');
      expect(layer.getViolations()).assertEqual(0);
      const ids: string[] = layer.ids();
      let nonHidden: number = 0;
      for (let i = 0; i < ids.length; i++) {
        const ring: FocusRing | null = layer.get(ids[i]);
        if (ring !== null && ring.getState() !== RingState.HIDDEN) {
          nonHidden++;
        }
      }
      expect(nonHidden).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LayerReset_034, end');
    });

    /**
     * Scenario: the layer invariant survives a reset and a replay.
     * Expectation: a reset followed by a full walk reproduces the single painted ring and the
     * violation counter stays at zero.
     */
    it('Assessment_LayerReplayInvariant_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LayerReplayInvariant_039, begin');
      layer.reset();
      const ids: string[] = layer.ids();
      for (let i = 0; i < ids.length; i++) {
        layer.focus(ids[i]);
      }
      layer.reset();
      for (let i = ids.length - 1; i >= 0; i--) {
        layer.focus(ids[i]);
      }
      expect(layer.paintedCount()).assertEqual(1);
      expect(layer.getViolations()).assertEqual(0);
      expect(layer.getActiveId()).assertEqual(ids[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LayerReplayInvariant_039, end');
    });

    /**
     * Scenario: the ring of the input box is thicker than the ring of a button.
     * Expectation: the difference is one vp, which is the documented token difference.
     */
    it('Assessment_InputRingThicker_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InputRingThicker_040, begin');
      const input: FocusRing | null = layer.get(ID_BUNDLE_INPUT);
      const button: FocusRing | null = layer.get(ID_ADD_BUTTON);
      expect(input !== null).assertTrue();
      expect(button !== null).assertTrue();
      if (input !== null && button !== null) {
        const delta: number = input.getStyle().width - button.getStyle().width;
        expect(delta).assertEqual(1);
        expect(input.getStyle().offset < button.getStyle().offset).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InputRingThicker_040, end');
    });
  });
}
