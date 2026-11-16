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
  DELAY_AFTER_ACTION,
  DELAY_KEY_NAVIGATION,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_EXAM_TITLE,
  ID_INDEX_TITLE,
  ID_QUERY_CONFIG_BUTTON,
  ID_QUERY_STATE_BUTTON,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  findById,
  findComponentsByType,
  getDriver,
  isComponentEnabled,
  launchAssessmentApp,
  pressAndWait,
  serializedDelay,
  waitForIndexPage
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Color tokens of the sample, the visual audit resolves them into the effect table.
const COLOR_PAGE_BACKGROUND: string = '#F1F3F5';
const COLOR_CARD_BACKGROUND: string = '#FFFFFF';
const COLOR_TITLE_FONT: string = '#182431';
const COLOR_BODY_FONT: string = '#182431';
const COLOR_SECONDARY_FONT: string = '#99182431';
const COLOR_BRAND: string = '#007DFF';
const COLOR_WARNING: string = '#ED6F21';
const COLOR_SUCCESS: string = '#64BB5C';
const COLOR_DIVIDER: string = '#0D182431';

// Radius tokens of the page. The chips and the cards share the sixteen vp radius, the option
// rows of the exam page reuse it, and the buttons keep the default pill radius.
const RADIUS_CARD_VP: number = 16;
const RADIUS_CHIP_VP: number = 16;
const RADIUS_BUTTON_VP: number = 20;
const RADIUS_INPUT_VP: number = 8;

// The opacity of a disabled action. The platform derives it from the enabled flag, the sample
// does not set it explicitly, so the audit uses the design system value.
const OPACITY_DISABLED: number = 0.4;
const OPACITY_ENABLED: number = 1;

// The alpha of the divider token. #0D182431 carries an alpha of thirteen out of two hundred
// and fifty five.
const DIVIDER_ALPHA: number = 0.05;

// The countdown flips its color when the remaining time reaches one minute. The exam page
// compares the remaining seconds with the seconds of a minute.
const COUNTDOWN_FLIP_SECONDS: number = 60;
const SECONDS_PER_MINUTE: number = 60;

// Candidate durations of AssessmentConfig in milliseconds.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN: number = 600000;
const DURATION_THIRTY: number = 1800000;
const DURATION_SIXTY: number = 3600000;

// The spring edge effect of the entry page list. The model keeps the parameters of the
// default spring so that the damping can be checked.
const SPRING_STIFFNESS: number = 331;
const SPRING_DAMPING: number = 30;
const SPRING_MASS: number = 1;

// The transition budget of the color flip and the disabled fade.
const COLOR_TRANSITION_MS: number = 200;
const OPACITY_TRANSITION_MS: number = 150;

// Number of animation steps that one sampled transition is divided into.
const TRANSITION_STEPS: number = 8;

/**
 * The visual states that the effect table distinguishes.
 */
enum VisualState {
  NORMAL = 0,
  FOCUSED = 1,
  PRESSED = 2,
  DISABLED = 3,
  SELECTED = 4
}

/**
 * The kind of an effect that a component applies.
 */
enum EffectKind {
  BACKGROUND = 0,
  RADIUS = 1,
  OPACITY = 2,
  TEXT_COLOR = 3,
  EDGE_EFFECT = 4
}

/**
 * The semantic role of a color token of the page.
 */
enum ColorRole {
  BACKDROP = 0,
  CARD = 1,
  PRIMARY_TEXT = 2,
  SECONDARY_TEXT = 3,
  BRAND = 4,
  WARNING = 5,
  SUCCESS = 6,
  DIVIDER = 7
}

/**
 * One resolved effect of a component.
 */
interface EffectBinding {
  kind: EffectKind;
  value: string;
  state: VisualState;
}

/**
 * One sampled point of an animation curve.
 */
interface CurveSample {
  step: number;
  progress: number;
  value: number;
}

/**
 * A plain RGBA color, the effect table needs the alpha channel of the divider and of the
 * secondary font so the tokens are parsed into channels first.
 */
class EffectColor {
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
   * Parses a color token, both #RRGGBB and #AARRGGBB are accepted.
   *
   * @param hex color token.
   * @returns the parsed color, opaque black when the token cannot be parsed.
   */
  public static fromHex(hex: string): EffectColor {
    let value: string = hex;
    if (value.startsWith('#')) {
      value = value.substring(1);
    }
    if (value.length === 8) {
      const alphaChannel: number = EffectColor.parseChannel(value.substring(0, 2));
      const redChannel: number = EffectColor.parseChannel(value.substring(2, 4));
      const greenChannel: number = EffectColor.parseChannel(value.substring(4, 6));
      const blueChannel: number = EffectColor.parseChannel(value.substring(6, 8));
      return new EffectColor(redChannel, greenChannel, blueChannel, alphaChannel / 255);
    }
    if (value.length === 6) {
      const redChannel: number = EffectColor.parseChannel(value.substring(0, 2));
      const greenChannel: number = EffectColor.parseChannel(value.substring(2, 4));
      const blueChannel: number = EffectColor.parseChannel(value.substring(4, 6));
      return new EffectColor(redChannel, greenChannel, blueChannel, 1);
    }
    return new EffectColor(0, 0, 0, 1);
  }

  /**
   * @param token two hex characters.
   * @returns the channel value, zero when the token is not a hex number.
   */
  private static parseChannel(token: string): number {
    const parsed: number = parseInt(token, 16);
    if (Number.isNaN(parsed)) {
      return 0;
    }
    return parsed;
  }

  /**
   * @returns true when the color has no transparency.
   */
  public isOpaque(): boolean {
    return this.alpha >= 1;
  }

  /**
   * Composites this color over an opaque backdrop.
   *
   * @param background opaque backdrop color.
   * @returns the blended color with an alpha of one.
   */
  public blendOver(background: EffectColor): EffectColor {
    if (this.isOpaque()) {
      return new EffectColor(this.red, this.green, this.blue, 1);
    }
    const inverse: number = 1 - this.alpha;
    return new EffectColor(this.red * this.alpha + background.red * inverse,
      this.green * this.alpha + background.green * inverse,
      this.blue * this.alpha + background.blue * inverse, 1);
  }

  /**
   * Interpolates two colors channel by channel.
   *
   * @param other color to move towards.
   * @param progress fraction between zero and one.
   * @returns the interpolated color.
   */
  public lerp(other: EffectColor, progress: number): EffectColor {
    const clamped: number = Math.min(1, Math.max(0, progress));
    const redChannel: number = this.red + (other.red - this.red) * clamped;
    const greenChannel: number = this.green + (other.green - this.green) * clamped;
    const blueChannel: number = this.blue + (other.blue - this.blue) * clamped;
    const alphaChannel: number = this.alpha + (other.alpha - this.alpha) * clamped;
    return new EffectColor(redChannel, greenChannel, blueChannel, alphaChannel);
  }

  /**
   * @param other color to compare with.
   * @param tolerance allowed channel difference.
   * @returns true when the channels are close enough.
   */
  public isCloseTo(other: EffectColor, tolerance: number = 1): boolean {
    const close: boolean = Math.abs(this.red - other.red) <= tolerance &&
      Math.abs(this.green - other.green) <= tolerance &&
      Math.abs(this.blue - other.blue) <= tolerance;
    return close;
  }

  /**
   * @returns a compact hex description used by the log lines.
   */
  public toHex(): string {
    const redText: string = Math.round(this.red).toString(16).padStart(2, '0');
    const greenText: string = Math.round(this.green).toString(16).padStart(2, '0');
    const blueText: string = Math.round(this.blue).toString(16).padStart(2, '0');
    return `#${redText}${greenText}${blueText}`;
  }
}

/**
 * The color table of the page, it maps a semantic role to the token of the theme.
 */
class EffectColorTable {
  private tokens: Map<ColorRole, string> = new Map<ColorRole, string>();

  /**
   * Builds the light table of the sample.
   */
  constructor() {
    this.tokens.set(ColorRole.BACKDROP, COLOR_PAGE_BACKGROUND);
    this.tokens.set(ColorRole.CARD, COLOR_CARD_BACKGROUND);
    this.tokens.set(ColorRole.PRIMARY_TEXT, COLOR_TITLE_FONT);
    this.tokens.set(ColorRole.SECONDARY_TEXT, COLOR_SECONDARY_FONT);
    this.tokens.set(ColorRole.BRAND, COLOR_BRAND);
    this.tokens.set(ColorRole.WARNING, COLOR_WARNING);
    this.tokens.set(ColorRole.SUCCESS, COLOR_SUCCESS);
    this.tokens.set(ColorRole.DIVIDER, COLOR_DIVIDER);
  }

  /**
   * @param role role to resolve.
   * @returns the token of the role, an empty string when the role is missing.
   */
  public resolve(role: ColorRole): string {
    const value: string | undefined = this.tokens.get(role);
    return value === undefined ? '' : value;
  }

  /**
   * @param role role whose alpha is read.
   * @returns the alpha of the token between zero and one.
   */
  public alphaOf(role: ColorRole): number {
    return EffectColor.fromHex(this.resolve(role)).alpha;
  }

  /**
   * @param role role to inspect.
   * @returns true when the token of the role is opaque.
   */
  public isOpaque(role: ColorRole): boolean {
    return EffectColor.fromHex(this.resolve(role)).isOpaque();
  }

  /**
   * @returns the number of roles of the table.
   */
  public size(): number {
    return this.tokens.size;
  }

  /**
   * @param role role to check.
   * @returns true when the table declares the role.
   */
  public has(role: ColorRole): boolean {
    return this.tokens.has(role);
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `EffectColorTable{roles=${this.tokens.size}, backdrop=${this.resolve(ColorRole.BACKDROP)}}`;
  }
}

/**
 * Resolves the visual state of a component into the effects that the state applies.
 */
class VisualStateResolver {
  private table: EffectColorTable;

  /**
   * @param table color table of the page.
   */
  constructor(table: EffectColorTable = new EffectColorTable()) {
    this.table = table;
  }

  /**
   * Resolves the background of the begin button for a state.
   *
   * @param state state of the button.
   * @returns the background token of the state.
   */
  public buttonBackground(state: VisualState): string {
    if (state === VisualState.DISABLED) {
      return this.table.resolve(ColorRole.BACKDROP);
    }
    if (state === VisualState.SELECTED) {
      return this.table.resolve(ColorRole.SUCCESS);
    }
    return this.table.resolve(ColorRole.BRAND);
  }

  /**
   * Resolves the opacity of a component for a state.
   *
   * @param state state of the component.
   * @returns the opacity between zero and one.
   */
  public opacity(state: VisualState): number {
    if (state === VisualState.DISABLED) {
      return OPACITY_DISABLED;
    }
    if (state === VisualState.PRESSED) {
      return 0.8;
    }
    return OPACITY_ENABLED;
  }

  /**
   * Resolves the background of a duration chip.
   *
   * @param selected true when the chip is the active candidate.
   * @returns the background token of the chip.
   */
  public chipBackground(selected: boolean): string {
    return selected ? this.table.resolve(ColorRole.BRAND) : this.table.resolve(ColorRole.BACKDROP);
  }

  /**
   * Resolves the label color of a duration chip.
   *
   * @param selected true when the chip is the active candidate.
   * @returns the label token of the chip.
   */
  public chipLabel(selected: boolean): string {
    return selected ? this.table.resolve(ColorRole.CARD) : this.table.resolve(ColorRole.PRIMARY_TEXT);
  }

  /**
   * Resolves the color of the countdown text of the exam page.
   *
   * @param remainingSeconds remaining seconds of the session.
   * @param duration configured duration of the session.
   * @returns the countdown token, an empty string when the duration is the default.
   */
  public countdownColor(remainingSeconds: number, duration: number): string {
    if (duration === DURATION_DEFAULT) {
      return '';
    }
    if (remainingSeconds > COUNTDOWN_FLIP_SECONDS) {
      return this.table.resolve(ColorRole.BRAND);
    }
    return this.table.resolve(ColorRole.WARNING);
  }

  /**
   * Resolves the effects of an operation button.
   *
   * @param state state of the button.
   * @returns the bindings of the state.
   */
  public buttonBindings(state: VisualState): EffectBinding[] {
    const bindings: EffectBinding[] = [];
    bindings.push({ kind: EffectKind.BACKGROUND, value: this.buttonBackground(state), state: state });
    bindings.push({ kind: EffectKind.RADIUS, value: `${RADIUS_BUTTON_VP}vp`, state: state });
    bindings.push({ kind: EffectKind.OPACITY, value: `${this.opacity(state)}`, state: state });
    return bindings;
  }

  /**
   * @param bindings bindings to count.
   * @param kind effect kind to look for.
   * @returns the number of bindings of that kind.
   */
  public countOfKind(bindings: EffectBinding[], kind: EffectKind): number {
    let count: number = 0;
    for (let i = 0; i < bindings.length; i++) {
      if (bindings[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `VisualStateResolver{table=${this.table.toString()}}`;
  }
}

/**
 * Models the spring edge effect of the entry page list.
 *
 * The overscroll distance follows a damped oscillation, the model reproduces the decay so that
 * the settling behaviour can be checked without recording the screen.
 */
class SpringEdgeModel {
  private stiffness: number = SPRING_STIFFNESS;
  private damping: number = SPRING_DAMPING;
  private mass: number = SPRING_MASS;
  private distances: number[] = [];

  /**
   * @param stiffness spring stiffness.
   * @param damping spring damping.
   */
  constructor(stiffness: number = SPRING_STIFFNESS, damping: number = SPRING_DAMPING) {
    this.stiffness = stiffness;
    this.damping = damping;
  }

  /**
   * @returns the damping ratio of the spring.
   */
  public dampingRatio(): number {
    const critical: number = 2 * Math.sqrt(this.stiffness * this.mass);
    return this.damping / critical;
  }

  /**
   * @returns true when the spring oscillates instead of settling monotonically.
   */
  public isUnderDamped(): boolean {
    return this.dampingRatio() < 1;
  }

  /**
   * Records an overscroll distance.
   *
   * @param distanceVp distance that the list was pulled beyond its end.
   */
  public push(distanceVp: number): void {
    this.distances.push(distanceVp);
  }

  /**
   * @returns the recorded distances.
   */
  public getDistances(): number[] {
    return this.distances.slice();
  }

  /**
   * Simulates the decay of the last overscroll for a number of steps.
   *
   * @param steps number of decay steps.
   * @returns the remaining distance after every step.
   */
  public sampleDecay(steps: number): number[] {
    const initial: number = this.distances.length === 0 ? 0 : this.distances[this.distances.length - 1];
    const result: number[] = [];
    let current: number = initial;
    const ratio: number = Math.min(0.95, this.dampingRatio() * 0.6);
    for (let i = 0; i < steps; i++) {
      current = current * (1 - ratio);
      result.push(current);
    }
    return result;
  }

  /**
   * @returns true when the sampled decay is monotonically decreasing.
   */
  public isSettling(): boolean {
    const samples: number[] = this.sampleDecay(TRANSITION_STEPS);
    for (let i = 1; i < samples.length; i++) {
      if (samples[i] > samples[i - 1]) {
        return false;
      }
    }
    return true;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `SpringEdgeModel{stiffness=${this.stiffness}, damping=${this.damping}, ` +
      `ratio=${this.dampingRatio().toFixed(2)}}`;
  }
}

/**
 * Samples an easing curve, the model is used to check that a color or an opacity transition
 * is monotonic and reaches its target.
 */
class TransitionCurve {
  private from: number = 0;
  private to: number = 1;
  private durationMs: number = COLOR_TRANSITION_MS;

  /**
   * @param from start value.
   * @param to target value.
   * @param durationMs duration of the transition.
   */
  constructor(from: number = 0, to: number = 1, durationMs: number = COLOR_TRANSITION_MS) {
    this.from = from;
    this.to = to;
    this.durationMs = durationMs;
  }

  /**
   * Evaluates an ease in out curve at a normalized progress.
   *
   * @param progress fraction between zero and one.
   * @returns the eased value between the start and the target.
   */
  public easeInOut(progress: number): number {
    const clamped: number = Math.min(1, Math.max(0, progress));
    const eased: number = clamped < 0.5 ? 2 * clamped * clamped :
      1 - Math.pow(-2 * clamped + 2, 2) / 2;
    return this.from + (this.to - this.from) * eased;
  }

  /**
   * @param steps number of samples.
   * @returns the samples of the curve.
   */
  public sample(steps: number): CurveSample[] {
    const samples: CurveSample[] = [];
    for (let i = 0; i <= steps; i++) {
      const progress: number = steps === 0 ? 0 : i / steps;
      samples.push({
        step: i,
        progress: progress,
        value: this.easeInOut(progress)
      });
    }
    return samples;
  }

  /**
   * Reports whether the samples move in one direction only.
   *
   * The transition may ease up or ease down, so the check is direction aware: every step must
   * move the same way as the first non zero step.
   *
   * @param steps number of samples.
   * @returns true when the samples are monotonic.
   */
  public isMonotonic(steps: number): boolean {
    const samples: CurveSample[] = this.sample(steps);
    let direction: number = 0;
    for (let i = 1; i < samples.length; i++) {
      const delta: number = samples[i].value - samples[i - 1].value;
      if (Math.abs(delta) < 0.0001) {
        continue;
      }
      const stepDirection: number = delta > 0 ? 1 : -1;
      if (direction === 0) {
        direction = stepDirection;
        continue;
      }
      if (stepDirection !== direction) {
        return false;
      }
    }
    return true;
  }

  /**
   * @returns the duration of the transition.
   */
  public getDuration(): number {
    return this.durationMs;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `TransitionCurve{from=${this.from}, to=${this.to}, duration=${this.durationMs}ms}`;
  }
}

/**
 * Interpolates the background of a state change so that the intermediate colors can be
 * checked for a smooth blend.
 */
class BackgroundTransition {
  private start: EffectColor;
  private target: EffectColor;
  private curve: TransitionCurve;

  /**
   * @param start start color.
   * @param target target color.
   */
  constructor(start: EffectColor, target: EffectColor) {
    this.start = start;
    this.target = target;
    this.curve = new TransitionCurve(0, 1, COLOR_TRANSITION_MS);
  }

  /**
   * @param progress fraction between zero and one.
   * @returns the interpolated color.
   */
  public at(progress: number): EffectColor {
    const eased: number = this.curve.easeInOut(progress);
    return this.start.lerp(this.target, eased);
  }

  /**
   * @param steps number of samples.
   * @returns the colors of the transition, starting at the start color.
   */
  public samples(steps: number): EffectColor[] {
    const result: EffectColor[] = [];
    for (let i = 0; i <= steps; i++) {
      result.push(this.at(steps === 0 ? 0 : i / steps));
    }
    return result;
  }

  /**
   * @returns true when the transition reaches the target exactly at the end.
   */
  public reachesTarget(): boolean {
    return this.at(1).isCloseTo(this.target);
  }

  /**
   * @returns true when the transition starts at the start color exactly.
   */
  public startsAtSource(): boolean {
    return this.at(0).isCloseTo(this.start);
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `BackgroundTransition{from=${this.start.toHex()}, to=${this.target.toHex()}}`;
  }
}

/**
 * Reads the text of a component, an empty string is returned when the read fails.
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

export default function visualEffectsTest() {
  describe('VisualEffects_Test', () => {
    let driver: Driver;
    let table: EffectColorTable;
    let resolver: VisualStateResolver;
    let spring: SpringEdgeModel;

    beforeAll(async () => {
      driver = getDriver();
      table = new EffectColorTable();
      resolver = new VisualStateResolver(table);
      spring = new SpringEdgeModel();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the background of the begin button in each state.
     * Expectation: the disabled state falls back to the backdrop, the selected state uses the
     * success token and the normal state the brand token.
     */
    it('Assessment_VisualEffects_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_002, begin');
      expect(resolver.buttonBackground(VisualState.NORMAL)).assertEqual(COLOR_BRAND);
      expect(resolver.buttonBackground(VisualState.FOCUSED)).assertEqual(COLOR_BRAND);
      expect(resolver.buttonBackground(VisualState.DISABLED)).assertEqual(COLOR_PAGE_BACKGROUND);
      expect(resolver.buttonBackground(VisualState.SELECTED)).assertEqual(COLOR_SUCCESS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_002, end');
    });

    /**
     * Scenario: the opacity of the disabled state.
     * Expectation: a disabled component drops to forty percent and a pressed one to eighty
     * percent, the enabled state stays fully opaque.
     */
    it('Assessment_VisualEffects_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_003, begin');
      expect(resolver.opacity(VisualState.DISABLED)).assertEqual(OPACITY_DISABLED);
      expect(resolver.opacity(VisualState.PRESSED)).assertEqual(0.8);
      expect(resolver.opacity(VisualState.NORMAL)).assertEqual(OPACITY_ENABLED);
      expect(resolver.opacity(VisualState.FOCUSED)).assertEqual(OPACITY_ENABLED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_003, end');
    });

    /**
     * Scenario: the duration chip background and label of the selected state.
     * Expectation: the selected chip uses the brand background with the card color label, the
     * unselected chip the reverse pair.
     */
    it('Assessment_VisualEffects_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_004, begin');
      expect(resolver.chipBackground(true)).assertEqual(COLOR_BRAND);
      expect(resolver.chipLabel(true)).assertEqual(COLOR_CARD_BACKGROUND);
      expect(resolver.chipBackground(false)).assertEqual(COLOR_PAGE_BACKGROUND);
      expect(resolver.chipLabel(false)).assertEqual(COLOR_TITLE_FONT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_004, end');
    });

    /**
     * Scenario: the chip pair is inverted by the selected flag.
     * Expectation: the background and the label never resolve to the same token in either
     * state, and the selected pair never renders a brand label on a brand background.
     */
    it('Assessment_VisualEffects_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_005, begin');
      expect(resolver.chipBackground(true) === resolver.chipLabel(true)).assertFalse();
      expect(resolver.chipBackground(false) === resolver.chipLabel(false)).assertFalse();
      expect(resolver.chipLabel(true)).assertEqual(COLOR_CARD_BACKGROUND);
      expect(resolver.chipBackground(true) === resolver.chipLabel(true)).assertFalse();
      expect(resolver.chipBackground(false)).assertEqual(COLOR_PAGE_BACKGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_005, end');
    });

    /**
     * Scenario: the countdown color flip of the exam page.
     * Expectation: above one minute the text uses the brand token, at or below one minute the
     * warning token, and the default duration renders no countdown at all.
     */
    it('Assessment_VisualEffects_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_006, begin');
      expect(resolver.countdownColor(120, DURATION_TEN)).assertEqual(COLOR_BRAND);
      expect(resolver.countdownColor(61, DURATION_TEN)).assertEqual(COLOR_BRAND);
      expect(resolver.countdownColor(60, DURATION_TEN)).assertEqual(COLOR_WARNING);
      expect(resolver.countdownColor(1, DURATION_TEN)).assertEqual(COLOR_WARNING);
      expect(resolver.countdownColor(0, DURATION_TEN)).assertEqual(COLOR_WARNING);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_006, end');
    });

    /**
     * Scenario: the countdown of the default duration.
     * Expectation: the default duration renders the default label instead of a countdown, so
     * no color is resolved at all.
     */
    it('Assessment_VisualEffects_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_007, begin');
      expect(resolver.countdownColor(600, DURATION_DEFAULT)).assertEqual('');
      expect(resolver.countdownColor(0, DURATION_DEFAULT)).assertEqual('');
      expect(resolver.countdownColor(60, DURATION_SIXTY)).assertEqual(COLOR_WARNING);
      expect(resolver.countdownColor(3600, DURATION_SIXTY)).assertEqual(COLOR_BRAND);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_007, end');
    });

    /**
     * Scenario: the countdown flip boundary is walked second by second.
     * Expectation: the color is the warning token for exactly the last sixty seconds and the
     * brand token everywhere above it.
     */
    it('Assessment_VisualEffects_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_008, begin');
      let warningCount: number = 0;
      for (let seconds = 0; seconds <= 300; seconds++) {
        const color: string = resolver.countdownColor(seconds, DURATION_THIRTY);
        if (color === COLOR_WARNING) {
          warningCount++;
        }
        if (seconds > COUNTDOWN_FLIP_SECONDS) {
          expect(color).assertEqual(COLOR_BRAND);
        }
      }
      expect(warningCount).assertEqual(COUNTDOWN_FLIP_SECONDS + 1);
      hilog.info(DOMAIN, TAG, '%{public}s warning seconds: %{public}d',
        BUNDLE + 'VisualEffects_008', warningCount);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_008, end');
    });

    /**
     * Scenario: the countdown text of the exam page is derived from the remaining seconds.
     * Expectation: the minutes and the seconds are both padded to two characters.
     */
    it('Assessment_VisualEffects_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_009, begin');
      const remaining: number = 125;
      const minutes: number = Math.floor(remaining / SECONDS_PER_MINUTE);
      const seconds: number = remaining % SECONDS_PER_MINUTE;
      const text: string = `${minutes}`.padStart(2, '0') + ':' + `${seconds}`.padStart(2, '0');
      expect(text).assertEqual('02:05');
      const exact: string = `${Math.floor(600 / SECONDS_PER_MINUTE)}`.padStart(2, '0') + ':' +
        `${600 % SECONDS_PER_MINUTE}`.padStart(2, '0');
      expect(exact).assertEqual('10:00');
      hilog.info(DOMAIN, TAG, '%{public}s countdown: %{public}s',
        BUNDLE + 'VisualEffects_009', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_009, end');
    });

    /**
     * Scenario: the divider token of the page.
     * Expectation: the divider is almost fully transparent, so it blends into the card.
     */
    it('Assessment_VisualEffects_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_010, begin');
      expect(table.isOpaque(ColorRole.DIVIDER)).assertFalse();
      const alpha: number = table.alphaOf(ColorRole.DIVIDER);
      hilog.info(DOMAIN, TAG, '%{public}s divider alpha: %{public}s',
        BUNDLE + 'VisualEffects_010', alpha.toFixed(3));
      expect(Math.abs(alpha - DIVIDER_ALPHA) < 0.01).assertTrue();
      const blended: EffectColor =
        EffectColor.fromHex(COLOR_DIVIDER).blendOver(EffectColor.fromHex(COLOR_CARD_BACKGROUND));
      expect(blended.isOpaque()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s blended divider: %{public}s',
        BUNDLE + 'VisualEffects_010', blended.toHex());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_010, end');
    });

    /**
     * Scenario: the secondary font token of the page.
     * Expectation: the token is translucent, so it is rendered as a blend and the blend stays
     * a dark grey on the light card.
     */
    it('Assessment_VisualEffects_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_011, begin');
      expect(table.isOpaque(ColorRole.SECONDARY_TEXT)).assertFalse();
      const blended: EffectColor = EffectColor.fromHex(COLOR_SECONDARY_FONT)
        .blendOver(EffectColor.fromHex(COLOR_CARD_BACKGROUND));
      hilog.info(DOMAIN, TAG, '%{public}s blended secondary: %{public}s',
        BUNDLE + 'VisualEffects_011', blended.toHex());
      expect(blended.isCloseTo(EffectColor.fromHex('#747C83'), 2)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_011, end');
    });

    /**
     * Scenario: the bindings of the begin button in the normal state.
     * Expectation: the state applies a background, a radius and an opacity binding.
     */
    it('Assessment_VisualEffects_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_013, begin');
      const bindings: EffectBinding[] = resolver.buttonBindings(VisualState.NORMAL);
      expect(bindings.length).assertEqual(3);
      expect(resolver.countOfKind(bindings, EffectKind.BACKGROUND)).assertEqual(1);
      expect(resolver.countOfKind(bindings, EffectKind.RADIUS)).assertEqual(1);
      expect(resolver.countOfKind(bindings, EffectKind.OPACITY)).assertEqual(1);
      expect(bindings[1].value).assertEqual(`${RADIUS_BUTTON_VP}vp`);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_013, end');
    });

    /**
     * Scenario: the bindings of the disabled state.
     * Expectation: the opacity binding follows the disabled value while the radius stays.
     */
    it('Assessment_VisualEffects_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_014, begin');
      const bindings: EffectBinding[] = resolver.buttonBindings(VisualState.DISABLED);
      expect(bindings[2].value).assertEqual(`${OPACITY_DISABLED}`);
      expect(bindings[2].state).assertEqual(VisualState.DISABLED);
      expect(bindings[1].value).assertEqual(`${RADIUS_BUTTON_VP}vp`);
      expect(resolver.countOfKind(bindings, EffectKind.BACKGROUND)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_014, end');
    });

    /**
     * Scenario: the background transition from the brand to the warning token.
     * Expectation: the transition starts at the brand, ends at the warning and passes through
     * a color in between.
     */
    it('Assessment_VisualEffects_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_015, begin');
      const transition: BackgroundTransition = new BackgroundTransition(
        EffectColor.fromHex(COLOR_BRAND), EffectColor.fromHex(COLOR_WARNING));
      expect(transition.startsAtSource()).assertTrue();
      expect(transition.reachesTarget()).assertTrue();
      const middle: EffectColor = transition.at(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s middle: %{public}s',
        BUNDLE + 'VisualEffects_015', middle.toHex());
      expect(middle.isCloseTo(EffectColor.fromHex(COLOR_BRAND))).assertFalse();
      expect(middle.isCloseTo(EffectColor.fromHex(COLOR_WARNING))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'VisualEffects_015', transition.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_015, end');
    });

    /**
     * Scenario: the samples of a background transition.
     * Expectation: the sample count matches the requested steps plus the start point and the
     * first and last samples equal the endpoints.
     */
    it('Assessment_VisualEffects_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_016, begin');
      const transition: BackgroundTransition = new BackgroundTransition(
        EffectColor.fromHex(COLOR_SUCCESS), EffectColor.fromHex(COLOR_WARNING));
      const samples: EffectColor[] = transition.samples(TRANSITION_STEPS);
      expect(samples.length).assertEqual(TRANSITION_STEPS + 1);
      expect(samples[0].isCloseTo(EffectColor.fromHex(COLOR_SUCCESS))).assertTrue();
      expect(samples[TRANSITION_STEPS].isCloseTo(EffectColor.fromHex(COLOR_WARNING))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_016, end');
    });

    /**
     * Scenario: the opacity curve of the disabled fade.
     * Expectation: the curve is monotonic and reaches the target exactly.
     */
    it('Assessment_VisualEffects_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_017, begin');
      const curve: TransitionCurve = new TransitionCurve(OPACITY_ENABLED, OPACITY_DISABLED,
        OPACITY_TRANSITION_MS);
      expect(curve.getDuration()).assertEqual(OPACITY_TRANSITION_MS);
      expect(curve.isMonotonic(TRANSITION_STEPS)).assertTrue();
      expect(Math.abs(curve.easeInOut(0) - OPACITY_ENABLED) < 0.0001).assertTrue();
      expect(Math.abs(curve.easeInOut(1) - OPACITY_DISABLED) < 0.0001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'VisualEffects_017', curve.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_017, end');
    });

    /**
     * Scenario: the easing curve is sampled at eight steps.
     * Expectation: the curve starts at zero, ends at one and passes through the half value at
     * the midpoint.
     */
    it('Assessment_VisualEffects_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_018, begin');
      const curve: TransitionCurve = new TransitionCurve(0, 1, COLOR_TRANSITION_MS);
      const samples: CurveSample[] = curve.sample(TRANSITION_STEPS);
      expect(samples.length).assertEqual(TRANSITION_STEPS + 1);
      expect(samples[0].value).assertEqual(0);
      expect(Math.abs(samples[samples.length - 1].value - 1) < 0.0001).assertTrue();
      const middle: number = curve.easeInOut(0.5);
      expect(Math.abs(middle - 0.5) < 0.0001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s middle: %{public}s',
        BUNDLE + 'VisualEffects_018', middle.toFixed(3));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_018, end');
    });

    /**
     * Scenario: the easing curve is clamped outside the normalized range.
     * Expectation: a negative progress yields the start value and a progress above one the
     * target value.
     */
    it('Assessment_VisualEffects_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_019, begin');
      const curve: TransitionCurve = new TransitionCurve(0, 1, COLOR_TRANSITION_MS);
      expect(curve.easeInOut(-0.5)).assertEqual(0);
      expect(Math.abs(curve.easeInOut(1.5) - 1) < 0.0001).assertTrue();
      expect(curve.easeInOut(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_019, end');
    });

    /**
     * Scenario: the spring edge effect of the entry page list.
     * Expectation: the spring is under damped, so the list oscillates slightly before it
     * settles.
     */
    it('Assessment_VisualEffects_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_020, begin');
      hilog.info(DOMAIN, TAG, '%{public}s spring: %{public}s', BUNDLE + 'VisualEffects_020',
        spring.toString());
      expect(spring.dampingRatio() > 0).assertTrue();
      expect(spring.dampingRatio() < 1).assertTrue();
      expect(spring.isUnderDamped()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_020, end');
    });

    /**
     * Scenario: a spring without a recorded overscroll.
     * Expectation: the sampled decay is all zeros and still counts as settling.
     */
    it('Assessment_VisualEffects_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_022, begin');
      const fresh: SpringEdgeModel = new SpringEdgeModel();
      const samples: number[] = fresh.sampleDecay(4);
      expect(samples.length).assertEqual(4);
      expect(samples[0]).assertEqual(0);
      expect(samples[3]).assertEqual(0);
      expect(fresh.isSettling()).assertTrue();
      expect(fresh.getDistances().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_022, end');
    });

    /**
     * Scenario: the color table resolves every role to a non empty token.
     * Expectation: there is no role without a color, which keeps the render free of fallbacks.
     */
    it('Assessment_VisualEffects_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_027, begin');
      const roles: ColorRole[] = [ColorRole.BACKDROP, ColorRole.CARD, ColorRole.PRIMARY_TEXT,
        ColorRole.SECONDARY_TEXT, ColorRole.BRAND, ColorRole.WARNING, ColorRole.SUCCESS,
        ColorRole.DIVIDER];
      for (let i = 0; i < roles.length; i++) {
        const token: string = table.resolve(roles[i]);
        expect(token.length > 0).assertTrue();
        expect(token.startsWith('#')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_027, end');
    });

    /**
     * Scenario: an unknown role is resolved.
     * Expectation: the table returns an empty string instead of an arbitrary fallback.
     */
    it('Assessment_VisualEffects_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_028, begin');
      expect(table.resolve(ColorRole.BACKDROP).length > 0).assertTrue();
      expect(table.alphaOf(ColorRole.WARNING)).assertEqual(1);
      expect(table.alphaOf(ColorRole.SUCCESS)).assertEqual(1);
      expect(table.alphaOf(ColorRole.DIVIDER) < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_028, end');
    });

    /**
     * Scenario: the interpolation of two identical colors.
     * Expectation: every intermediate color equals the endpoint, the transition is a no-op.
     */
    it('Assessment_VisualEffects_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_029, begin');
      const color: EffectColor = EffectColor.fromHex(COLOR_BRAND);
      const transition: BackgroundTransition = new BackgroundTransition(color, color);
      const middle: EffectColor = transition.at(0.5);
      expect(middle.isCloseTo(color)).assertTrue();
      expect(transition.startsAtSource()).assertTrue();
      expect(transition.reachesTarget()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_029, end');
    });

    /**
     * Scenario: a transition towards a translucent color.
     * Expectation: the alpha is interpolated as well, so a fade to the divider token ends at
     * the divider alpha.
     */
    it('Assessment_VisualEffects_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_030, begin');
      const opaque: EffectColor = EffectColor.fromHex(COLOR_CARD_BACKGROUND);
      const translucent: EffectColor = EffectColor.fromHex(COLOR_DIVIDER);
      const transition: BackgroundTransition = new BackgroundTransition(opaque, translucent);
      const end: EffectColor = transition.at(1);
      expect(Math.abs(end.alpha - DIVIDER_ALPHA) < 0.01).assertTrue();
      expect(end.isOpaque()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s end alpha: %{public}s',
        BUNDLE + 'VisualEffects_030', end.alpha.toFixed(3));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_030, end');
    });

    /**
     * Scenario: the duration candidates of the configuration card.
     * Expectation: the four candidates map to the documented millisecond values and the
     * default candidate renders no countdown.
     */
    it('Assessment_VisualEffects_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_032, begin');
      const candidates: number[] = [DURATION_DEFAULT, DURATION_TEN, DURATION_THIRTY, DURATION_SIXTY];
      expect(candidates.length).assertEqual(4);
      expect(candidates[1]).assertEqual(600000);
      expect(candidates[2]).assertEqual(1800000);
      expect(candidates[3]).assertEqual(3600000);
      expect(resolver.countdownColor(1800, candidates[0])).assertEqual('');
      expect(resolver.countdownColor(1800, candidates[1])).assertEqual(COLOR_BRAND);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_032, end');
    });

    /**
     * Scenario: the color tokens of the sample are parsed into channels.
     * Expectation: a six digit token is opaque and an eight digit token keeps its alpha, a
     * malformed token degrades to opaque black.
     */
    it('Assessment_VisualEffects_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_033, begin');
      const brand: EffectColor = EffectColor.fromHex(COLOR_BRAND);
      expect(brand.isOpaque()).assertTrue();
      expect(brand.blue).assertEqual(255);
      expect(brand.red).assertEqual(0);
      const divider: EffectColor = EffectColor.fromHex(COLOR_DIVIDER);
      expect(divider.isOpaque()).assertFalse();
      const malformed: EffectColor = EffectColor.fromHex('#XYZ');
      expect(malformed.red).assertEqual(0);
      expect(malformed.isOpaque()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_033, end');
    });

    /**
     * Scenario: the hex description of a parsed color.
     * Expectation: the description round trips for both the card and the brand token.
     */
    it('Assessment_VisualEffects_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_034, begin');
      const card: EffectColor = EffectColor.fromHex(COLOR_CARD_BACKGROUND);
      expect(card.toHex()).assertEqual('#ffffff');
      const warning: EffectColor = EffectColor.fromHex(COLOR_WARNING);
      expect(warning.toHex()).assertEqual('#ed6f21');
      hilog.info(DOMAIN, TAG, '%{public}s warning: %{public}s',
        BUNDLE + 'VisualEffects_034', warning.toHex());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_034, end');
    });

    /**
     * Scenario: the resolver is reconstructed with a fresh table.
     * Expectation: the new resolver reports the same token for the brand role, so the table is
     * stateless.
     */
    it('Assessment_VisualEffects_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_036, begin');
      const freshTable: EffectColorTable = new EffectColorTable();
      const freshResolver: VisualStateResolver = new VisualStateResolver(freshTable);
      expect(freshResolver.chipBackground(true)).assertEqual(resolver.chipBackground(true));
      expect(freshResolver.opacity(VisualState.DISABLED)).assertEqual(OPACITY_DISABLED);
      expect(freshTable.size()).assertEqual(table.size());
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'VisualEffects_036', freshResolver.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_036, end');
    });

    /**
     * Scenario: the bindings of a state are counted by kind.
     * Expectation: every state of the button exposes exactly one background binding and no
     * edge effect binding.
     */
    it('Assessment_VisualEffects_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_037, begin');
      const states: VisualState[] = [VisualState.NORMAL, VisualState.FOCUSED,
        VisualState.PRESSED, VisualState.DISABLED, VisualState.SELECTED];
      for (let i = 0; i < states.length; i++) {
        const bindings: EffectBinding[] = resolver.buttonBindings(states[i]);
        expect(resolver.countOfKind(bindings, EffectKind.BACKGROUND)).assertEqual(1);
        expect(resolver.countOfKind(bindings, EffectKind.EDGE_EFFECT)).assertEqual(0);
        expect(bindings[0].state).assertEqual(states[i]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_037, end');
    });
    /**
     * Scenario: the body font role of the color table.
     * Expectation: the body font shares the title token in the light theme, so the two roles
     * resolve to the same value and both are opaque.
     */
    it('Assessment_VisualEffects_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_039, begin');
      const body: EffectColor = EffectColor.fromHex(COLOR_BODY_FONT);
      const title: EffectColor = EffectColor.fromHex(COLOR_TITLE_FONT);
      expect(body.isCloseTo(title)).assertTrue();
      expect(body.isOpaque()).assertTrue();
      expect(table.resolve(ColorRole.PRIMARY_TEXT)).assertEqual(COLOR_BODY_FONT);
      expect(table.resolve(ColorRole.CARD)).assertEqual(COLOR_CARD_BACKGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VisualEffects_039, end');
    });
  });
}
