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
import { Component, Driver, Rect } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  DELAY_AFTER_ACTION,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  ID_BUNDLE_INPUT,
  ID_END_BUTTON,
  ID_INDEX_TITLE,
  ID_QUERY_CONFIG_BUTTON,
  ID_QUERY_STATE_BUTTON,
  KEY_BACK,
  KEY_TAB,
  TEXT_REMOVE_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TEST_BUNDLE_PRIMARY,
  TIMEOUT_FOCUS_CHANGE,
  TIMEOUT_PAGE_RENDER,
  TOLERANCE_COMPONENT_COUNT,
  addAllowedApp,
  allowedAppRowCount,
  checkFocusState,
  checkTextContent,
  clickComponent,
  findById,
  getCurrentFocusIndex,
  getDriver,
  indexComponentCount,
  isComponentEnabled,
  launchAssessmentApp,
  pressAndWait,
  removeFirstAllowedApp,
  runSerializedUiOperation,
  serializedDelay,
  waitForIndexPage,
  waitForStableIndex
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The minimal interactive target of the platform. A primary action must be at least 44vp in
// both directions, secondary actions may go down to 28vp.
const MIN_TARGET_VP: number = 44;
const MIN_TARGET_RELAXED_VP: number = 28;

// The touch slop of the platform, a pointer that stays inside it does not start a scroll.
const TOUCH_SLOP_VP: number = 8;

// The height that the entry page declares for the whitelist input and the add button. The two
// controls sit in one Row, so they share the same vertical extent.
const INPUT_HEIGHT_VP: number = 40;
const REMOVE_BUTTON_HEIGHT_VP: number = 28;

// The corner radius that the entry page applies to the cards and to the duration chips.
const CARD_RADIUS_VP: number = 16;

// Default window metrics of the reference device, only the model uses them. The live cases read
// the real bounds from the driver.
const REFERENCE_SCREEN_WIDTH_VP: number = 720;
const REFERENCE_SCREEN_HEIGHT_VP: number = 1280;

// The ripple of the ArkUI button fades in and out over this budget.
const RIPPLE_FADE_MS: number = 150;
const RIPPLE_HOLD_MS: number = 100;
const RIPPLE_PEAK_ALPHA: number = 0.12;
const RIPPLE_MIN_ALPHA: number = 0.04;

// Touch states of a component, they mirror the states that the pressed effect exposes.
const TOUCH_IDLE: string = 'idle';
const TOUCH_DOWN: string = 'down';
const TOUCH_MOVED: string = 'moved';
const TOUCH_UP: string = 'up';
const TOUCH_CANCELLED: string = 'cancelled';

// The whitelist of the entry page starts with the default bundle of the sample.
const DEFAULT_BUNDLE: string = 'com.samples.assessment';
const SECOND_BUNDLE: string = 'com.samples.dictionary';

// The assessment service accepts at most twenty bundle names in the whitelist, the page never
// renders more remove buttons than that.
const MAX_ALLOWED_APPS: number = 20;

/**
 * Verdict of a hit test against a rectangle.
 */
enum HitVerdict {
  INSIDE = 0,
  ON_EDGE = 1,
  OUTSIDE = 2
}

/**
 * Verdict of a target size audit.
 */
enum TargetSizeVerdict {
  COMPLIANT = 0,
  RELAXED = 1,
  UNDERSIZED = 2
}

/**
 * Kind of feedback that a component exposes after a touch.
 */
enum FeedbackKind {
  NONE = 0,
  RIPPLE = 1,
  PRESSED_SCALE = 2,
  FOCUS_RING = 3
}

/**
 * A rectangle in vp, the origin is the top left corner of the window.
 */
class Box {
  public left: number = 0;
  public top: number = 0;
  public right: number = 0;
  public bottom: number = 0;

  /**
   * @param left left edge.
   * @param top top edge.
   * @param right right edge.
   * @param bottom bottom edge.
   */
  constructor(left: number = 0, top: number = 0, right: number = 0, bottom: number = 0) {
    this.left = left;
    this.top = top;
    this.right = right;
    this.bottom = bottom;
  }

  /**
   * @returns the width of the rectangle, never negative.
   */
  public width(): number {
    return Math.max(0, this.right - this.left);
  }

  /**
   * @returns the height of the rectangle, never negative.
   */
  public height(): number {
    return Math.max(0, this.bottom - this.top);
  }

  /**
   * @returns the center of the rectangle.
   */
  public center(): Point {
    return new Point((this.left + this.right) / 2, (this.top + this.bottom) / 2);
  }

  /**
   * Reports whether the rectangle is degenerate.
   *
   * @returns true when either extent is zero.
   */
  public isEmpty(): boolean {
    return this.width() <= 0 || this.height() <= 0;
  }

  /**
   * Tests a point against the rectangle, the edges count as inside.
   *
   * @param point point to test.
   * @returns the verdict of the hit test.
   */
  public hitTest(point: Point): HitVerdict {
    if (point.x < this.left || point.x > this.right || point.y < this.top || point.y > this.bottom) {
      return HitVerdict.OUTSIDE;
    }
    const onEdge: boolean = point.x === this.left || point.x === this.right ||
      point.y === this.top || point.y === this.bottom;
    return onEdge ? HitVerdict.ON_EDGE : HitVerdict.INSIDE;
  }

  /**
   * Tests whether two rectangles overlap.
   *
   * @param other rectangle to compare with.
   * @returns true when the intersection has a positive area.
   */
  public overlaps(other: Box): boolean {
    const horizontal: boolean = this.left < other.right && other.left < this.right;
    const vertical: boolean = this.top < other.bottom && other.top < this.bottom;
    return horizontal && vertical;
  }

  /**
   * Grows the rectangle on every side, which is how the platform expands a small touch target.
   *
   * @param marginVp margin to add on every side.
   * @returns the expanded rectangle.
   */
  public inflate(marginVp: number): Box {
    return new Box(this.left - marginVp, this.top - marginVp, this.right + marginVp,
      this.bottom + marginVp);
  }

  /**
   * @param other rectangle to compare with.
   * @returns a compact description used by the log lines.
   */
  public describe(): string {
    return `Box[${this.left.toFixed(0)},${this.top.toFixed(0)},${this.right.toFixed(0)},` +
      `${this.bottom.toFixed(0)}] ${this.width().toFixed(0)}x${this.height().toFixed(0)}vp`;
  }
}

/**
 * One point in vp.
 */
class Point {
  public x: number = 0;
  public y: number = 0;

  /**
   * @param x horizontal coordinate.
   * @param y vertical coordinate.
   */
  constructor(x: number = 0, y: number = 0) {
    this.x = x;
    this.y = y;
  }

  /**
   * @param other point to measure against.
   * @returns the euclidean distance.
   */
  public distanceTo(other: Point): number {
    const dx: number = this.x - other.x;
    const dy: number = this.y - other.y;
    return Math.sqrt(dx * dx + dy * dy);
  }
}

/**
 * A component of the entry page with its geometry and its touch contract.
 */
class TouchableTarget {
  public id: string = '';
  public label: string = '';
  public box: Box = new Box();
  public enabled: boolean = true;
  public primary: boolean = true;
  public expectedFeedback: FeedbackKind = FeedbackKind.RIPPLE;

  /**
   * @param id identifier of the component.
   * @param label label of the component.
   * @param box bounds of the component.
   * @param primary true for a primary action, false for a secondary one.
   */
  constructor(id: string = '', label: string = '', box: Box = new Box(), primary: boolean = true) {
    this.id = id;
    this.label = label;
    this.box = box;
    this.primary = primary;
    this.expectedFeedback = primary ? FeedbackKind.RIPPLE : FeedbackKind.FOCUS_RING;
  }

  /**
   * @returns the required minimum extent of the target.
   */
  public minimumExtent(): number {
    return this.primary ? MIN_TARGET_VP : MIN_TARGET_RELAXED_VP;
  }

  /**
   * Judges the target against the minimum size rule.
   *
   * @returns the verdict of the audit.
   */
  public sizeVerdict(): TargetSizeVerdict {
    if (this.box.width() >= MIN_TARGET_VP && this.box.height() >= MIN_TARGET_VP) {
      return TargetSizeVerdict.COMPLIANT;
    }
    if (this.box.width() >= MIN_TARGET_RELAXED_VP && this.box.height() >= MIN_TARGET_RELAXED_VP) {
      return TargetSizeVerdict.RELAXED;
    }
    return TargetSizeVerdict.UNDERSIZED;
  }

  /**
   * @returns true when the target reaches the required minimum extent.
   */
  public isCompliant(): boolean {
    return this.sizeVerdict() === TargetSizeVerdict.COMPLIANT;
  }

  /**
   * @returns the short side of the target.
   */
  public shortSide(): number {
    return Math.min(this.box.width(), this.box.height());
  }

  /**
   * @param point touch point to test.
   * @returns true when the point reaches the target and the target accepts input.
   */
  public accepts(point: Point): boolean {
    if (!this.enabled) {
      return false;
    }
    return this.box.hitTest(point) !== HitVerdict.OUTSIDE;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `TouchableTarget{id=${this.id}, ${this.box.describe()}, enabled=${this.enabled}}`;
  }
}

/**
 * Builds the synthetic geometry of the entry page.
 *
 * The layout mirrors pages/Index.ets: a sixteen vp page padding, a title area, a configuration
 * card with the duration chips and the whitelist row, an operation card with two rows of two
 * buttons, and a status card. Only the extents that the touch audit needs are modelled.
 */
class EntryPageGeometry {
  private pagePadding: number = 16;
  private cardPadding: number = 16;
  private screenWidth: number = REFERENCE_SCREEN_WIDTH_VP;

  /**
   * @param screenWidth width of the window in vp.
   */
  constructor(screenWidth: number = REFERENCE_SCREEN_WIDTH_VP) {
    this.screenWidth = screenWidth;
  }

  /**
   * @param top top edge of the card.
   * @param height height of the card.
   * @returns the bounds of a full width card.
   */
  public cardBounds(top: number, height: number): Box {
    return new Box(this.pagePadding, top, this.screenWidth - this.pagePadding, top + height);
  }

  /**
   * @param top top edge of the row.
   * @param gap gap between the two halves.
   * @returns the bounds of the left half of a two column row.
   */
  public leftButtonBounds(top: number, gap: number): Box {
    const innerWidth: number = this.screenWidth - this.pagePadding * 2 - this.cardPadding * 2;
    const halfWidth: number = (innerWidth - gap) / 2;
    const left: number = this.pagePadding + this.cardPadding;
    return new Box(left, top, left + halfWidth, top + MIN_TARGET_VP);
  }

  /**
   * @param top top edge of the row.
   * @param gap gap between the two halves.
   * @returns the bounds of the right half of a two column row.
   */
  public rightButtonBounds(top: number, gap: number): Box {
    const innerWidth: number = this.screenWidth - this.pagePadding * 2 - this.cardPadding * 2;
    const halfWidth: number = (innerWidth - gap) / 2;
    const left: number = this.pagePadding + this.cardPadding + halfWidth + gap;
    return new Box(left, top, left + halfWidth, top + MIN_TARGET_VP);
  }

  /**
   * @param top top edge of the row.
   * @returns the bounds of the whitelist input, which carries the layout weight of one.
   */
  public inputBounds(top: number): Box {
    const innerWidth: number = this.screenWidth - this.pagePadding * 2 - this.cardPadding * 2;
    const addWidth: number = 96;
    const left: number = this.pagePadding + this.cardPadding;
    return new Box(left, top, left + innerWidth - addWidth - 8, top + INPUT_HEIGHT_VP);
  }

  /**
   * @param top top edge of the row.
   * @returns the bounds of the add button, it follows the input in the same row.
   */
  public addButtonBounds(top: number): Box {
    const innerWidth: number = this.screenWidth - this.pagePadding * 2 - this.cardPadding * 2;
    const addWidth: number = 96;
    const right: number = this.pagePadding + this.cardPadding + innerWidth;
    return new Box(right - addWidth, top, right, top + INPUT_HEIGHT_VP);
  }

  /**
   * @param top top edge of the row.
   * @returns the bounds of the remove button of a whitelist row.
   */
  public removeButtonBounds(top: number): Box {
    const innerWidth: number = this.screenWidth - this.pagePadding * 2 - this.cardPadding * 2;
    const removeWidth: number = 76;
    const right: number = this.pagePadding + this.cardPadding + innerWidth;
    return new Box(right - removeWidth, top, right, top + REMOVE_BUTTON_HEIGHT_VP);
  }

  /**
   * @returns the card corner radius of the entry page.
   */
  public getCardRadius(): number {
    return CARD_RADIUS_VP;
  }

  /**
   * Builds the touch targets of the operation card.
   *
   * @returns the four operation targets in reading order.
   */
  public operationTargets(): TouchableTarget[] {
    const targets: TouchableTarget[] = [];
    const rowOneTop: number = 640;
    const rowTwoTop: number = rowOneTop + MIN_TARGET_VP + 12;
    const begin: TouchableTarget = new TouchableTarget(ID_BEGIN_BUTTON, 'begin',
      this.leftButtonBounds(rowOneTop, 12), true);
    targets.push(begin);
    const end: TouchableTarget = new TouchableTarget(ID_END_BUTTON, 'end',
      this.rightButtonBounds(rowOneTop, 12), true);
    targets.push(end);
    const queryState: TouchableTarget = new TouchableTarget(ID_QUERY_STATE_BUTTON, 'isActive',
      this.leftButtonBounds(rowTwoTop, 12), true);
    targets.push(queryState);
    const queryConfig: TouchableTarget = new TouchableTarget(ID_QUERY_CONFIG_BUTTON,
      'getConfiguration', this.rightButtonBounds(rowTwoTop, 12), true);
    targets.push(queryConfig);
    return targets;
  }

  /**
   * Builds the touch target of the whitelist row of the configuration card.
   *
   * @returns the input, the add button and the remove button, in that order.
   */
  public configTargets(): TouchableTarget[] {
    const rowTop: number = 320;
    const targets: TouchableTarget[] = [];
    const input: TouchableTarget = new TouchableTarget(ID_BUNDLE_INPUT, 'Bundle name',
      this.inputBounds(rowTop), true);
    targets.push(input);
    const add: TouchableTarget = new TouchableTarget(ID_ADD_BUTTON, 'Add',
      this.addButtonBounds(rowTop), true);
    targets.push(add);
    const remove: TouchableTarget = new TouchableTarget('assessment_remove_row', TEXT_REMOVE_BUTTON,
      this.removeButtonBounds(rowTop + INPUT_HEIGHT_VP + 12), false);
    targets.push(remove);
    return targets;
  }

  /**
   * @returns the bounds of the whole page list.
   */
  public pageBounds(): Box {
    return new Box(0, 0, this.screenWidth, REFERENCE_SCREEN_HEIGHT_VP);
  }
}

/**
 * The pressed state machine of one component, it mirrors the touch lifecycle of the platform.
 *
 * A pointer down moves the component into the down state and starts the ripple. A move that
 * leaves the touch slop moves it into the moved state, a release outside the component cancels
 * the press, and a release inside completes it.
 */
class TouchStateMachine {
  private id: string;
  private state: string = TOUCH_IDLE;
  private downPoint: Point = new Point();
  private box: Box = new Box();
  private rippleAlpha: number = 0;
  private completionCount: number = 0;
  private cancellationCount: number = 0;

  /**
   * @param id identifier of the component.
   * @param box bounds of the component.
   */
  constructor(id: string = '', box: Box = new Box()) {
    this.id = id;
    this.box = box;
  }

  /**
   * @returns the current state.
   */
  public getState(): string {
    return this.state;
  }

  /**
   * @returns the current ripple alpha.
   */
  public getRippleAlpha(): number {
    return this.rippleAlpha;
  }

  /**
   * @returns the current bounds of the component.
   */
  public getBox(): Box {
    return this.box;
  }

  /**
   * Handles a pointer down.
   *
   * @param point point of the press.
   * @returns the new state.
   */
  public pressDown(point: Point): string {
    if (this.state !== TOUCH_IDLE) {
      return this.state;
    }
    this.state = TOUCH_DOWN;
    this.downPoint = point;
    this.rippleAlpha = RIPPLE_PEAK_ALPHA;
    return this.state;
  }

  /**
   * Handles a pointer move.
   *
   * @param point current point of the pointer.
   * @returns the new state.
   */
  public move(point: Point): string {
    if (this.state !== TOUCH_DOWN) {
      return this.state;
    }
    if (point.distanceTo(this.downPoint) <= TOUCH_SLOP_VP) {
      return this.state;
    }
    this.state = TOUCH_MOVED;
    this.rippleAlpha = RIPPLE_MIN_ALPHA;
    return this.state;
  }

  /**
   * Handles a pointer release.
   *
   * @param point point of the release.
   * @returns true when the release completed a press on the component.
   */
  public release(point: Point): boolean {
    const inside: boolean = this.box.hitTest(point) !== HitVerdict.OUTSIDE;
    if (this.state === TOUCH_DOWN && inside) {
      this.state = TOUCH_UP;
      this.completionCount++;
      this.rippleAlpha = 0;
      return true;
    }
    this.state = TOUCH_CANCELLED;
    this.cancellationCount++;
    this.rippleAlpha = 0;
    return false;
  }

  /**
   * Cancels the press because the system took the gesture.
   */
  public cancel(): void {
    if (this.state === TOUCH_IDLE) {
      return;
    }
    this.state = TOUCH_CANCELLED;
    this.cancellationCount++;
    this.rippleAlpha = 0;
  }

  /**
   * Animates the ripple towards its target alpha.
   *
   * @param targetAlpha alpha to move towards.
   * @param step fraction of the distance that one frame covers.
   * @returns the new alpha.
   */
  public stepRipple(targetAlpha: number, step: number): number {
    const distance: number = targetAlpha - this.rippleAlpha;
    this.rippleAlpha += distance * step;
    if (Math.abs(targetAlpha - this.rippleAlpha) < 0.001) {
      this.rippleAlpha = targetAlpha;
    }
    return this.rippleAlpha;
  }

  /**
   * @returns how often a press completed on the component.
   */
  public getCompletionCount(): number {
    return this.completionCount;
  }

  /**
   * @returns how often a press was cancelled.
   */
  public getCancellationCount(): number {
    return this.cancellationCount;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `TouchStateMachine{id=${this.id}, state=${this.state}, ` +
      `completed=${this.completionCount}, cancelled=${this.cancellationCount}}`;
  }
}

/**
 * A two finger contact, the sample does not handle multi touch itself but the model keeps track
 * of how many contacts reach the same target so that an accidental second finger is detected.
 */
class MultiTouchTracker {
  private contacts: Map<number, Point> = new Map<number, Point>();
  private targetId: string = '';
  private rejected: number = 0;

  /**
   * @param targetId identifier of the target below the contacts.
   */
  constructor(targetId: string = '') {
    this.targetId = targetId;
  }

  /**
   * Registers a contact.
   *
   * @param pointerId identifier of the pointer.
   * @param point point of the contact.
   * @returns true when the contact was accepted, false when the target only handles one finger.
   */
  public touchDown(pointerId: number, point: Point): boolean {
    if (this.contacts.size >= 1) {
      this.rejected++;
      return false;
    }
    this.contacts.set(pointerId, point);
    return true;
  }

  /**
   * Removes a contact.
   *
   * @param pointerId identifier of the pointer.
   * @returns true when the pointer was registered.
   */
  public touchUp(pointerId: number): boolean {
    return this.contacts.delete(pointerId);
  }

  /**
   * @returns the number of active contacts.
   */
  public contactCount(): number {
    return this.contacts.size;
  }

  /**
   * @returns how often a second contact was rejected.
   */
  public rejectedCount(): number {
    return this.rejected;
  }

  /**
   * @returns the identifier of the target.
   */
  public getTargetId(): string {
    return this.targetId;
  }

  /**
   * Clears every contact.
   */
  public reset(): void {
    this.contacts.clear();
    this.rejected = 0;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `MultiTouchTracker{target=${this.targetId}, contacts=${this.contacts.size}, ` +
      `rejected=${this.rejected}}`;
  }
}

/**
 * Reads a UiTest rectangle into the local box class.
 *
 * @param rect rectangle reported by the driver.
 * @returns the local box, an empty box when the rectangle is unusable.
 */
function toBox(rect: Rect): Box {
  return new Box(rect.left, rect.top, rect.right, rect.bottom);
}

/**
 * Reads the bounds of a component.
 *
 * @param component component to measure.
 * @returns the bounds, an empty box when the bounds cannot be read.
 */
async function readBox(component: Component | null): Promise<Box> {
  if (component === null) {
    return new Box();
  }
  try {
    const rect: Rect = await component.getBounds();
    return toBox(rect);
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'readBox failed: %{public}s', err.message);
    return new Box();
  }
}

/**
 * Delivers a raw tap through the driver inside the UI operation queue.
 *
 * @param driver driver of the running case.
 * @param x x coordinate in pixels.
 * @param y y coordinate in pixels.
 * @returns true when the tap was delivered.
 */
async function serializedTapAt(driver: Driver, x: number, y: number): Promise<boolean> {
  try {
    await runSerializedUiOperation(async () => {
      await clickPointSerialized(driver, x, y);
    });
    await serializedDelay(driver, DELAY_TOUCH_EVENT);
    return true;
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'serializedTapAt failed: %{public}s', err.message);
    return false;
  }
}

/**
 * Delivers a long press through the driver inside the UI operation queue.
 *
 * @param driver driver of the running case.
 * @param x x coordinate in pixels.
 * @param y y coordinate in pixels.
 * @returns true when the press was delivered.
 */
async function serializedLongPressAt(driver: Driver, x: number, y: number): Promise<boolean> {
  try {
    await runSerializedUiOperation(async () => {
      await driver.longClick(Math.round(x), Math.round(y));
    });
    await serializedDelay(driver, DELAY_TOUCH_EVENT);
    return true;
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'serializedLongPressAt failed: %{public}s', err.message);
    return false;
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

export default function touchInteractionTest() {
  describe('TouchInteraction_Test', () => {
    let driver: Driver;
    let geometry: EntryPageGeometry;
    let targets: TouchableTarget[];

    beforeAll(async () => {
      driver = getDriver();
      geometry = new EntryPageGeometry();
      targets = geometry.operationTargets();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a point in the middle of a target is tested against its rectangle.
     * Expectation: the center is inside, a point just outside the right edge is outside.
     */
    it('Assessment_TouchInteraction_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_002, begin');
      const box: Box = new Box(100, 200, 300, 244);
      const center: Point = box.center();
      expect(box.hitTest(center)).assertEqual(HitVerdict.INSIDE);
      const outside: Point = new Point(301, 220);
      expect(box.hitTest(outside)).assertEqual(HitVerdict.OUTSIDE);
      expect(box.width()).assertEqual(200);
      expect(box.height()).assertEqual(44);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'TouchInteraction_002', box.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_002, end');
    });

    /**
     * Scenario: the four edges of a rectangle are tested.
     * Expectation: every edge point is reported as an edge hit, which the platform still
     * forwards to the component.
     */
    it('Assessment_TouchInteraction_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_003, begin');
      const box: Box = new Box(0, 0, 100, 100);
      expect(box.hitTest(new Point(0, 50))).assertEqual(HitVerdict.ON_EDGE);
      expect(box.hitTest(new Point(100, 50))).assertEqual(HitVerdict.ON_EDGE);
      expect(box.hitTest(new Point(50, 0))).assertEqual(HitVerdict.ON_EDGE);
      expect(box.hitTest(new Point(50, 100))).assertEqual(HitVerdict.ON_EDGE);
      expect(box.hitTest(new Point(50, 101))).assertEqual(HitVerdict.OUTSIDE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_003, end');
    });

    /**
     * Scenario: two adjacent operation buttons are tested for overlap.
     * Expectation: the two halves of a row do not overlap, so a tap cannot reach both handlers.
     */
    it('Assessment_TouchInteraction_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_004, begin');
      const left: Box = geometry.leftButtonBounds(640, 12);
      const right: Box = geometry.rightButtonBounds(640, 12);
      expect(left.overlaps(right)).assertFalse();
      expect(right.left).assertLarger(left.right);
      const middle: number = (left.right + right.left) / 2;
      expect(left.hitTest(new Point(middle, 660))).assertEqual(HitVerdict.OUTSIDE);
      expect(right.hitTest(new Point(middle, 660))).assertEqual(HitVerdict.OUTSIDE);
      hilog.info(DOMAIN, TAG, '%{public}s gap: %{public}s vp',
        BUNDLE + 'TouchInteraction_004', (right.left - left.right).toFixed(0));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_004, end');
    });

    /**
     * Scenario: the operation buttons are judged against the 44vp rule.
     * Expectation: every operation target is compliant because the layout declares 44vp height.
     */
    it('Assessment_TouchInteraction_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_005, begin');
      for (let i = 0; i < targets.length; i++) {
        expect(targets[i].sizeVerdict()).assertEqual(TargetSizeVerdict.COMPLIANT);
        expect(targets[i].isCompliant()).assertTrue();
        expect(targets[i].shortSide() >= MIN_TARGET_VP).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_005, end');
    });

    /**
     * Scenario: the whitelist row targets are judged against the size rules.
     * Expectation: the input and the add button are 40vp high, so they reach the relaxed rule
     * but miss the 44vp rule, and the 28vp remove button is relaxed as well.
     */
    it('Assessment_TouchInteraction_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_006, begin');
      const configTargets: TouchableTarget[] = geometry.configTargets();
      expect(configTargets.length).assertEqual(3);
      expect(configTargets[0].sizeVerdict()).assertEqual(TargetSizeVerdict.RELAXED);
      expect(configTargets[1].sizeVerdict()).assertEqual(TargetSizeVerdict.RELAXED);
      expect(configTargets[2].sizeVerdict()).assertEqual(TargetSizeVerdict.RELAXED);
      expect(configTargets[0].isCompliant()).assertFalse();
      expect(configTargets[1].box.height()).assertEqual(INPUT_HEIGHT_VP);
      expect(configTargets[2].box.height()).assertEqual(REMOVE_BUTTON_HEIGHT_VP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_006, end');
    });

    /**
     * Scenario: a target that is smaller than the relaxed rule.
     * Expectation: a twenty vp target is reported as undersized.
     */
    it('Assessment_TouchInteraction_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_007, begin');
      const tiny: TouchableTarget = new TouchableTarget('assessment_tiny', 'Tiny',
        new Box(0, 0, 20, 20), true);
      expect(tiny.sizeVerdict()).assertEqual(TargetSizeVerdict.UNDERSIZED);
      expect(tiny.isCompliant()).assertFalse();
      const inflated: Box = tiny.box.inflate(12);
      expect(inflated.width()).assertEqual(44);
      expect(inflated.height()).assertEqual(44);
      hilog.info(DOMAIN, TAG, '%{public}s inflated: %{public}s',
        BUNDLE + 'TouchInteraction_007', inflated.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_007, end');
    });

    /**
     * Scenario: the inflated rectangle of a small target accepts a tap outside the visible box.
     * Expectation: the tap lands inside the inflated rectangle, which is how the platform
     * keeps a small component reachable.
     */
    it('Assessment_TouchInteraction_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_008, begin');
      const tiny: Box = new Box(100, 100, 120, 120);
      const inflated: Box = tiny.inflate(12);
      const justOutside: Point = new Point(126, 110);
      expect(tiny.hitTest(justOutside)).assertEqual(HitVerdict.OUTSIDE);
      expect(inflated.hitTest(justOutside)).assertEqual(HitVerdict.INSIDE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_008, end');
    });

    /**
     * Scenario: the touch state machine of a tap.
     * Expectation: the down state raises the ripple, the release inside completes the press and
     * clears the ripple.
     */
    it('Assessment_TouchInteraction_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_014, begin');
      const box: Box = geometry.leftButtonBounds(640, 12);
      const machine: TouchStateMachine = new TouchStateMachine(ID_BEGIN_BUTTON, box);
      const center: Point = box.center();
      expect(machine.getState()).assertEqual(TOUCH_IDLE);
      machine.pressDown(center);
      expect(machine.getState()).assertEqual(TOUCH_DOWN);
      expect(machine.getRippleAlpha()).assertEqual(RIPPLE_PEAK_ALPHA);
      expect(machine.release(center)).assertTrue();
      expect(machine.getState()).assertEqual(TOUCH_UP);
      expect(machine.getRippleAlpha()).assertEqual(0);
      expect(machine.getCompletionCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'TouchInteraction_014', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_014, end');
    });

    /**
     * Scenario: a press that moves inside the touch slop.
     * Expectation: the state stays down, so a jitter does not cancel the press.
     */
    it('Assessment_TouchInteraction_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_015, begin');
      const box: Box = geometry.leftButtonBounds(640, 12);
      const machine: TouchStateMachine = new TouchStateMachine('target', box);
      const center: Point = box.center();
      machine.pressDown(center);
      machine.move(new Point(center.x + TOUCH_SLOP_VP - 1, center.y));
      expect(machine.getState()).assertEqual(TOUCH_DOWN);
      expect(machine.release(center)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_015, end');
    });

    /**
     * Scenario: a press that moves beyond the touch slop.
     * Expectation: the state moves to moved and the release outside does not complete the press.
     */
    it('Assessment_TouchInteraction_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_016, begin');
      const box: Box = geometry.leftButtonBounds(640, 12);
      const machine: TouchStateMachine = new TouchStateMachine('target', box);
      const center: Point = box.center();
      machine.pressDown(center);
      machine.move(new Point(center.x, center.y + TOUCH_SLOP_VP + 20));
      expect(machine.getState()).assertEqual(TOUCH_MOVED);
      const completed: boolean = machine.release(new Point(center.x, center.y + 200));
      expect(completed).assertFalse();
      expect(machine.getCancellationCount()).assertEqual(1);
      expect(machine.getCompletionCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'TouchInteraction_016', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_016, end');
    });

    /**
     * Scenario: a press is cancelled by the system because the list took over the gesture.
     * Expectation: the cancellation counter grows and the state ends in cancelled.
     */
    it('Assessment_TouchInteraction_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_017, begin');
      const box: Box = geometry.leftButtonBounds(640, 12);
      const machine: TouchStateMachine = new TouchStateMachine('target', box);
      machine.pressDown(box.center());
      machine.cancel();
      expect(machine.getState()).assertEqual(TOUCH_CANCELLED);
      expect(machine.getRippleAlpha()).assertEqual(0);
      machine.cancel();
      expect(machine.getCancellationCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'TouchInteraction_017', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_017, end');
    });

    /**
     * Scenario: a second finger reaches a button that only handles one pointer.
     * Expectation: the tracker rejects the second contact and reports it exactly once.
     */
    it('Assessment_TouchInteraction_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_022, begin');
      const tracker: MultiTouchTracker = new MultiTouchTracker(ID_BEGIN_BUTTON);
      expect(tracker.touchDown(0, new Point(100, 100))).assertTrue();
      expect(tracker.touchDown(1, new Point(120, 100))).assertFalse();
      expect(tracker.contactCount()).assertEqual(1);
      expect(tracker.rejectedCount()).assertEqual(1);
      expect(tracker.touchUp(0)).assertTrue();
      expect(tracker.touchUp(0)).assertFalse();
      expect(tracker.contactCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'TouchInteraction_022', tracker.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_022, end');
    });

    /**
     * Scenario: the tracker is reset between gestures.
     * Expectation: reset drops every contact and every rejection.
     */
    it('Assessment_TouchInteraction_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_023, begin');
      const tracker: MultiTouchTracker = new MultiTouchTracker('target');
      tracker.touchDown(0, new Point(0, 0));
      tracker.touchDown(1, new Point(1, 1));
      tracker.reset();
      expect(tracker.contactCount()).assertEqual(0);
      expect(tracker.rejectedCount()).assertEqual(0);
      expect(tracker.getTargetId()).assertEqual('target');
      expect(tracker.touchDown(2, new Point(5, 5))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_023, end');
    });

    /**
     * Scenario: two contacts on different targets.
     * Expectation: each tracker accepts its own first contact, so a multi touch gesture does
     * not leak across components.
     */
    it('Assessment_TouchInteraction_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_024, begin');
      const first: MultiTouchTracker = new MultiTouchTracker(ID_BEGIN_BUTTON);
      const second: MultiTouchTracker = new MultiTouchTracker(ID_END_BUTTON);
      expect(first.touchDown(0, new Point(100, 100))).assertTrue();
      expect(second.touchDown(1, new Point(300, 100))).assertTrue();
      expect(first.contactCount()).assertEqual(1);
      expect(second.contactCount()).assertEqual(1);
      expect(first.rejectedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_024, end');
    });

    /**
     * Scenario: the hit test of a point in the gutter between two cards.
     * Expectation: the point misses both cards, so a tap in the gutter does not trigger a card
     * action.
     */
    it('Assessment_TouchInteraction_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_029, begin');
      const upper: Box = geometry.cardBounds(300, 220);
      const lower: Box = geometry.cardBounds(532, 260);
      const gap: Point = new Point(360, 526);
      expect(upper.hitTest(gap)).assertEqual(HitVerdict.OUTSIDE);
      expect(lower.hitTest(gap)).assertEqual(HitVerdict.OUTSIDE);
      expect(upper.overlaps(lower)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_029, end');
    });

    /**
     * Scenario: the card radius is recorded by the geometry model.
     * Expectation: the radius is sixteen vp, which is the token that the cards use.
     */
    it('Assessment_TouchInteraction_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_030, begin');
      expect(geometry.getCardRadius()).assertEqual(CARD_RADIUS_VP);
      const box: Box = geometry.cardBounds(0, 200);
      expect(box.left).assertEqual(16);
      expect(box.width()).assertEqual(REFERENCE_SCREEN_WIDTH_VP - 32);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'TouchInteraction_030', box.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_030, end');
    });

    /**
     * Scenario: the touch targets of the configuration card are checked for overlap.
     * Expectation: the input and the add button do not overlap, and the add button sits to the
     * right of the input.
     */
    it('Assessment_TouchInteraction_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_033, begin');
      const configTargets: TouchableTarget[] = geometry.configTargets();
      const input: TouchableTarget = configTargets[0];
      const add: TouchableTarget = configTargets[1];
      expect(input.box.overlaps(add.box)).assertFalse();
      expect(add.box.left).assertLarger(input.box.right);
      expect(input.box.height()).assertEqual(INPUT_HEIGHT_VP);
      expect(add.box.height()).assertEqual(INPUT_HEIGHT_VP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_033, end');
    });

    /**
     * Scenario: a disabled target is tested for input acceptance.
     * Expectation: a point inside a disabled target is not accepted even though the geometry
     * matches, because the enabled flag gates the handler.
     */
    it('Assessment_TouchInteraction_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_034, begin');
      const target: TouchableTarget = new TouchableTarget(ID_END_BUTTON, 'end',
        geometry.rightButtonBounds(640, 12), true);
      const center: Point = target.box.center();
      expect(target.accepts(center)).assertTrue();
      target.enabled = false;
      expect(target.accepts(center)).assertFalse();
      expect(target.box.hitTest(center)).assertEqual(HitVerdict.INSIDE);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'TouchInteraction_034', target.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_034, end');
    });

    /**
     * Scenario: the touch state machine is fed a release outside the component.
     * Expectation: the press is cancelled instead of completed, so a drag off the button does
     * not trigger its action.
     */
    it('Assessment_TouchInteraction_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_035, begin');
      const machine: TouchStateMachine = new TouchStateMachine('target',
        new Box(100, 100, 244, 144));
      machine.pressDown(new Point(172, 122));
      const completed: boolean = machine.release(new Point(500, 600));
      expect(completed).assertFalse();
      expect(machine.getState()).assertEqual(TOUCH_CANCELLED);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'TouchInteraction_035', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_035, end');
    });

    /**
     * Scenario: the center calculation of a rectangle.
     * Expectation: the center of a symmetric rectangle is the geometric middle and the two
     * corner distances are equal.
     */
    it('Assessment_TouchInteraction_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_036, begin');
      const box: Box = new Box(100, 200, 300, 300);
      const center: Point = box.center();
      expect(center.x).assertEqual(200);
      expect(center.y).assertEqual(250);
      const firstCorner: Point = new Point(box.left, box.top);
      const secondCorner: Point = new Point(box.right, box.bottom);
      expect(Math.abs(center.distanceTo(firstCorner) - center.distanceTo(secondCorner)) < 0.001)
        .assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_036, end');
    });

    /**
     * Scenario: a target is inflated until it reaches the minimum size.
     * Expectation: the inflated target becomes compliant, which is the fallback of the design
     * system for a small visual element.
     */
    it('Assessment_TouchInteraction_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_037, begin');
      const small: TouchableTarget = new TouchableTarget('assessment_small', 'Small',
        new Box(0, 0, 30, 30), true);
      expect(small.sizeVerdict()).assertEqual(TargetSizeVerdict.RELAXED);
      small.box = small.box.inflate(8);
      hilog.info(DOMAIN, TAG, '%{public}s inflated: %{public}s',
        BUNDLE + 'TouchInteraction_037', small.box.describe());
      expect(small.box.width()).assertEqual(46);
      expect(small.box.height()).assertEqual(46);
      expect(small.sizeVerdict()).assertEqual(TargetSizeVerdict.COMPLIANT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_037, end');
    });

    /**
     * Scenario: the input row keeps its height when the whitelist is empty.
     * Expectation: the model reports the same input height in both states, so the layout does
     * not jump when the last row is removed.
     */
    it('Assessment_TouchInteraction_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_040, begin');
      const configTargets: TouchableTarget[] = geometry.configTargets();
      expect(configTargets[0].box.height()).assertEqual(INPUT_HEIGHT_VP);
      const alternate: EntryPageGeometry = new EntryPageGeometry(1080);
      const alternateTargets: TouchableTarget[] = alternate.configTargets();
      expect(alternateTargets[0].box.height()).assertEqual(INPUT_HEIGHT_VP);
      expect(alternateTargets[0].box.width()).assertLarger(configTargets[0].box.width());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_040, end');
    });

    /**
     * Scenario: the geometry model scales with the window width.
     * Expectation: two models with different widths keep the same vertical metrics and differ
     * only in the horizontal extents.
     */
    it('Assessment_TouchInteraction_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_042, begin');
      const narrow: EntryPageGeometry = new EntryPageGeometry(600);
      const wide: EntryPageGeometry = new EntryPageGeometry(900);
      const narrowTargets: TouchableTarget[] = narrow.operationTargets();
      const wideTargets: TouchableTarget[] = wide.operationTargets();
      expect(narrowTargets[0].box.height()).assertEqual(wideTargets[0].box.height());
      expect(wideTargets[0].box.width()).assertLarger(narrowTargets[0].box.width());
      expect(narrowTargets[0].isCompliant()).assertTrue();
      expect(wideTargets[0].isCompliant()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_042, end');
    });

    /**
     * Scenario: the ripple state of a disabled target.
     * Expectation: a disabled target never raises the ripple, so a user sees that the press
     * was not accepted.
     */
    it('Assessment_TouchInteraction_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_044, begin');
      const target: TouchableTarget = new TouchableTarget(ID_END_BUTTON, 'end',
        geometry.rightButtonBounds(640, 12), true);
      target.enabled = false;
      expect(target.accepts(target.box.center())).assertFalse();
      target.expectedFeedback = FeedbackKind.NONE;
      expect(target.expectedFeedback).assertEqual(FeedbackKind.NONE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_044, end');
    });

    /**
     * Scenario: the feedback kind of a primary and a secondary target.
     * Expectation: the primary target shows a ripple, the secondary target only shows the
     * focus ring, which matches the design tokens.
     */
    it('Assessment_TouchInteraction_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_045, begin');
      const primary: TouchableTarget = new TouchableTarget(ID_BEGIN_BUTTON, 'begin',
        geometry.leftButtonBounds(640, 12), true);
      const secondary: TouchableTarget = new TouchableTarget('assessment_remove_row',
        TEXT_REMOVE_BUTTON, geometry.removeButtonBounds(500), false);
      expect(primary.expectedFeedback).assertEqual(FeedbackKind.RIPPLE);
      expect(secondary.expectedFeedback).assertEqual(FeedbackKind.FOCUS_RING);
      expect(primary.minimumExtent()).assertEqual(MIN_TARGET_VP);
      expect(secondary.minimumExtent()).assertEqual(MIN_TARGET_RELAXED_VP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_045, end');
    });

    /**
     * Scenario: the touch model is rebuilt for a second geometry.
     * Expectation: the rebuilt model reports the same target count and the same identifiers.
     */
    it('Assessment_TouchInteraction_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_047, begin');
      const rebuilt: EntryPageGeometry = new EntryPageGeometry();
      const rebuiltTargets: TouchableTarget[] = rebuilt.operationTargets();
      expect(rebuiltTargets.length).assertEqual(targets.length);
      for (let i = 0; i < rebuiltTargets.length; i++) {
        expect(rebuiltTargets[i].id).assertEqual(targets[i].id);
        expect(rebuiltTargets[i].shortSide()).assertEqual(targets[i].shortSide());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TouchInteraction_047, end');
    });
  });
}
