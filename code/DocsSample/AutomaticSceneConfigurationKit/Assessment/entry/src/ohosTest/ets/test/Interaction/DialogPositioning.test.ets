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
  ID_BEGIN_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  ID_EXAM_TITLE,
  TEXT_DIALOG_CONFIRM,
  TEXT_EXAM_PREVIOUS,
  TEXT_EXAM_SUBMIT,
  KEY_ENTER,
  KEY_BACK,
  KEY_ESCAPE,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_TRANSITION,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_ACTION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  waitForIndexPage,
  waitForExamPage,
  isComponentEnabled,
  clickComponent,
  findComponentsByType,
  TYPE_BUTTON,
  hideSoftKeyboard,
  isAlertDialogVisible,
  waitForAlertDialog,
  pressAndWait,
  waitUntil
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The alert dialog of the exam page is declared with DialogAlignment.Center and autoCancel false,
// so it cannot be dismissed by a tap on the mask and is only closed through its confirm button.
const DIALOG_ALIGNMENT: string = 'center';
const DIALOG_AUTO_CANCEL: boolean = false;

// Geometry of the reference window. The dialog is a modal window that sits above the page, its
// width is eighty percent of the window width on the reference device and it is vertically
// centered inside the safe area.
const WINDOW_WIDTH_VP: number = 360;
const WINDOW_HEIGHT_VP: number = 780;
const DIALOG_WIDTH_RATIO: number = 0.8;
const DIALOG_MAX_WIDTH_VP: number = 336;
const DIALOG_MIN_HEIGHT_VP: number = 120;
const DIALOG_TITLE_HEIGHT_VP: number = 28;
const DIALOG_MESSAGE_LINE_VP: number = 22;
const DIALOG_BUTTON_HEIGHT_VP: number = 40;
const DIALOG_VERTICAL_PADDING_VP: number = 24;
const DIALOG_HORIZONTAL_MARGIN_VP: number = 16;

// The safe area of the window. A notch cuts the top edge and the navigation bar the bottom one,
// the dialog must never overlap either of them.
const SAFE_AREA_TOP_VP: number = 32;
const SAFE_AREA_BOTTOM_VP: number = 24;
const SAFE_AREA_LEFT_VP: number = 0;
const SAFE_AREA_RIGHT_VP: number = 0;

// The keyboard occupies roughly the lower half of the window when the whitelist input is focused.
const KEYBOARD_HEIGHT_VP: number = 320;

// The button of the dialog is a single confirm button, its hit rect grows with the horizontal
// padding of the button so that the whole row is tappable.
const DIALOG_BUTTON_PADDING_VP: number = 12;

// The dialog enters with a fade and a scale animation, the model tracks both boundary values.
const DIALOG_ANIMATION_MS: number = 200;
const DIALOG_ANIMATION_ALPHA_FROM: number = 0.6;
const DIALOG_ANIMATION_ALPHA_TO: number = 1;
const DIALOG_ANIMATION_SCALE_FROM: number = 0.9;

// The sample shows at most one dialog at a time, the exam page guards the second call with the
// dialogShown flag.
const MAX_DIALOG_INSTANCES: number = 1;

/**
 * A point in vp coordinates with the origin in the top left corner of the window.
 */
interface DialogPoint {
  x: number;
  y: number;
}

/**
 * An axis aligned rectangle of the dialog window.
 */
interface DialogRect {
  x: number;
  y: number;
  width: number;
  height: number;
}

/**
 * The safe area of the window, the parts that the dialog must not overlap.
 */
interface SafeArea {
  top: number;
  bottom: number;
  left: number;
  right: number;
}

/**
 * The dismissal path of a dialog that the suite exercises.
 */
enum DismissalPath {
  CONFIRM_BUTTON = 0,
  BACK_KEY = 1,
  MASK_TAP = 2,
  AUTO_CANCEL = 3,
  ESCAPE_KEY = 4,
  ENTER_KEY = 5
}

/**
 * The verdict of a placement audit.
 */
enum PlacementVerdict {
  PLACED = 0,
  CLIPPED_TOP = 1,
  CLIPPED_BOTTOM = 2,
  CLIPPED_LEFT = 3,
  CLIPPED_RIGHT = 4,
  UNDER_KEYBOARD = 5
}

/**
 * The lifecycle states of one dialog instance.
 */
class DialogState {
  public static readonly HIDDEN: string = 'hidden';
  public static readonly OPENING: string = 'opening';
  public static readonly SHOWN: string = 'shown';
  public static readonly CLOSING: string = 'closing';
  public static readonly CLOSED: string = 'closed';
}

/**
 * The content model of the alert dialog of the exam page.
 */
class DialogContent {
  public title: string = '';
  public message: string = '';
  public confirmLabel: string = TEXT_DIALOG_CONFIRM;

  constructor(title: string = '', message: string = '', confirmLabel: string = TEXT_DIALOG_CONFIRM) {
    this.title = title;
    this.message = message;
    this.confirmLabel = confirmLabel;
  }

  /**
   * Scenario: the dialog is measured before it is placed.
   * Expectation: the height grows with the number of message lines and never falls below the
   * minimum height of the alert dialog style.
   *
   * @param messageLines number of rendered message lines.
   * @returns the measured height in vp.
   */
  public measuredHeightVp(messageLines: number): number {
    const body: number = DIALOG_TITLE_HEIGHT_VP + messageLines * DIALOG_MESSAGE_LINE_VP;
    const total: number = body + DIALOG_BUTTON_HEIGHT_VP + 2 * DIALOG_VERTICAL_PADDING_VP;
    return Math.max(DIALOG_MIN_HEIGHT_VP, total);
  }

  /**
   * Scenario: the dialog is laid out horizontally.
   * Expectation: the width is eighty percent of the window but capped by the maximum width.
   *
   * @param windowWidthVp width of the window in vp.
   * @returns the measured width in vp.
   */
  public measuredWidthVp(windowWidthVp: number): number {
    return Math.min(windowWidthVp * DIALOG_WIDTH_RATIO, DIALOG_MAX_WIDTH_VP);
  }

  /**
   * Scenario: the message of the dialog is too long for a single line.
   * Expectation: the line count grows and the measured height stays a multiple of the line box.
   *
   * @param messageWidthVp estimated width of the message in vp.
   * @param columnVp available width of the message column.
   * @returns the estimated number of lines.
   */
  public messageLines(messageWidthVp: number, columnVp: number): number {
    if (columnVp <= 0) {
      return 1;
    }
    const lines: number = Math.ceil(messageWidthVp / columnVp);
    return lines < 1 ? 1 : lines;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `DialogContent{title=${this.title}, confirm=${this.confirmLabel}}`;
  }
}

/**
 * Placement of a dialog window inside the safe area of the host window.
 *
 * The placement reproduces the geometry of an alert dialog with DialogAlignment.Center: the
 * dialog is centered inside the safe area, it is shifted up when the keyboard covers the lower
 * half of the window and it is clamped so that neither the top nor the bottom edge leaves the
 * safe area.
 */
class DialogPlacement {
  /**
   * Scenario: the dialog is placed while no keyboard is displayed.
   * Expectation: the top and bottom gaps are equal and both edges stay inside the safe area.
   *
   * @param widthVp dialog width.
   * @param heightVp dialog height.
   * @param windowWidthVp host window width.
   * @param windowHeightVp host window height.
   * @param safeArea safe area of the window.
   * @returns the placed rectangle.
   */
  public static centered(widthVp: number, heightVp: number, windowWidthVp: number, windowHeightVp: number,
    safeArea: SafeArea): DialogRect {
    const usableTop: number = safeArea.top;
    const usableHeight: number = windowHeightVp - safeArea.top - safeArea.bottom;
    const x: number = (windowWidthVp - widthVp) / 2;
    const centeredY: number = usableTop + (usableHeight - heightVp) / 2;
    return {
      x: x,
      y: DialogPlacement.clampY(centeredY, heightVp, usableTop, usableHeight),
      width: widthVp,
      height: heightVp
    };
  }

  /**
   * Scenario: the keyboard is displayed below the dialog.
   * Expectation: the dialog is lifted above the keyboard while it stays inside the safe area.
   *
   * @param widthVp dialog width.
   * @param heightVp dialog height.
   * @param windowWidthVp host window width.
   * @param windowHeightVp host window height.
   * @param safeArea safe area of the window.
   * @param keyboardHeightVp height of the keyboard in vp.
   * @returns the placed rectangle.
   */
  public static withKeyboard(widthVp: number, heightVp: number, windowWidthVp: number,
    windowHeightVp: number, safeArea: SafeArea, keyboardHeightVp: number): DialogRect {
    const usableTop: number = safeArea.top;
    const usableHeight: number = windowHeightVp - safeArea.top - safeArea.bottom - keyboardHeightVp;
    const x: number = (windowWidthVp - widthVp) / 2;
    const centeredY: number = usableTop + (usableHeight - heightVp) / 2;
    return {
      x: x,
      y: DialogPlacement.clampY(centeredY, heightVp, usableTop, usableHeight),
      width: widthVp,
      height: heightVp
    };
  }

  /**
   * Scenario: a dialog that is taller than the usable area.
   * Expectation: the dialog is pinned to the top of the safe area, the overflow is reported by
   * the placement audit instead of pushing the top edge out of the window.
   *
   * @param proposedY proposed top edge.
   * @param heightVp dialog height.
   * @param usableTop top edge of the usable area.
   * @param usableHeight height of the usable area.
   * @returns the clamped top edge.
   */
  public static clampY(proposedY: number, heightVp: number, usableTop: number,
    usableHeight: number): number {
    const maxY: number = usableTop + Math.max(0, usableHeight - heightVp);
    if (proposedY < usableTop) {
      return usableTop;
    }
    if (proposedY > maxY) {
      return maxY;
    }
    return proposedY;
  }

  /**
   * Scenario: a placed dialog is audited against the safe area and the keyboard.
   * Expectation: a fully inside dialog is reported as placed, every escape produces the
   * specific clipping verdict.
   *
   * @param rect placed rectangle.
   * @param safeArea safe area of the window.
   * @param windowHeightVp host window height.
   * @param keyboardTopVp top edge of the keyboard, negative when no keyboard is shown.
   * @returns the verdict of the audit.
   */
  public static audit(rect: DialogRect, safeArea: SafeArea, windowHeightVp: number,
    keyboardTopVp: number): PlacementVerdict {
    if (rect.y < safeArea.top) {
      return PlacementVerdict.CLIPPED_TOP;
    }
    if (rect.y + rect.height > windowHeightVp - safeArea.bottom) {
      return PlacementVerdict.CLIPPED_BOTTOM;
    }
    if (rect.x < safeArea.left) {
      return PlacementVerdict.CLIPPED_LEFT;
    }
    if (rect.x + rect.width > WINDOW_WIDTH_VP - safeArea.right) {
      return PlacementVerdict.CLIPPED_RIGHT;
    }
    if (keyboardTopVp >= 0 && rect.y + rect.height > keyboardTopVp) {
      return PlacementVerdict.UNDER_KEYBOARD;
    }
    return PlacementVerdict.PLACED;
  }
}

/**
 * One dialog instance with its state, its content and its placed rectangle.
 */
class DialogInstance {
  private content: DialogContent;
  private state: string = DialogState.HIDDEN;
  private rect: DialogRect;
  private opens: number = 0;
  private dismissals: number = 0;

  constructor(content: DialogContent, rect: DialogRect) {
    this.content = content;
    this.rect = rect;
  }

  /**
   * Scenario: the dialog is opened.
   * Expectation: the state moves to opening, a second open while it is visible is refused.
   *
   * @returns true when the dialog accepted the open request.
   */
  public open(): boolean {
    if (this.state === DialogState.OPENING || this.state === DialogState.SHOWN) {
      return false;
    }
    this.state = DialogState.OPENING;
    this.opens++;
    return true;
  }

  /**
   * Scenario: the opening animation finished.
   * Expectation: the dialog becomes visible and tappable.
   */
  public animationFinished(): void {
    if (this.state !== DialogState.OPENING) {
      return;
    }
    this.state = DialogState.SHOWN;
  }

  /**
   * Scenario: the dialog is dismissed through one of the documented paths.
   * Expectation: the confirm button and the back key close the dialog, the mask tap and the
   * auto cancel are refused because the dialog declares autoCancel false.
   *
   * @param path dismissal path.
   * @returns true when the dialog closed.
   */
  public dismiss(path: DismissalPath): boolean {
    if (this.state !== DialogState.SHOWN) {
      return false;
    }
    if (path === DismissalPath.MASK_TAP || path === DismissalPath.AUTO_CANCEL) {
      return false;
    }
    this.state = DialogState.CLOSING;
    return true;
  }

  /**
   * Scenario: the closing animation finished.
   * Expectation: the dialog reaches the closed state and frees its instance slot.
   */
  public closeFinished(): void {
    if (this.state !== DialogState.CLOSING) {
      return;
    }
    this.state = DialogState.CLOSED;
    this.dismissals++;
  }

  public getState(): string {
    return this.state;
  }

  public getRect(): DialogRect {
    return {
      x: this.rect.x,
      y: this.rect.y,
      width: this.rect.width,
      height: this.rect.height
    };
  }

  public getContent(): DialogContent {
    return this.content;
  }

  public getOpenCount(): number {
    return this.opens;
  }

  public getDismissalCount(): number {
    return this.dismissals;
  }

  /**
   * Scenario: the confirm button is hit tested.
   * Expectation: the button row is the bottom block of the dialog, its hit rect grows with the
   * declared horizontal padding.
   *
   * @returns the hit rectangle of the confirm button in window coordinates.
   */
  public confirmHitRect(): DialogRect {
    return {
      x: this.rect.x + DIALOG_BUTTON_PADDING_VP,
      y: this.rect.y + this.rect.height - DIALOG_VERTICAL_PADDING_VP - DIALOG_BUTTON_HEIGHT_VP,
      width: this.rect.width - 2 * DIALOG_BUTTON_PADDING_VP,
      height: DIALOG_BUTTON_HEIGHT_VP
    };
  }

  /**
   * Scenario: a pointer lands on the dialog.
   * Expectation: a point inside the confirm hit rect activates the dialog, the title area never
   * does and a point outside the dialog reaches the mask instead.
   *
   * @param point pointer position in window coordinates.
   * @returns true when the point activates the confirm action.
   */
  public hitsConfirm(point: DialogPoint): boolean {
    const hit: DialogRect = this.confirmHitRect();
    const insideX: boolean = point.x >= hit.x && point.x <= hit.x + hit.width;
    const insideY: boolean = point.y >= hit.y && point.y <= hit.y + hit.height;
    return insideX && insideY;
  }

  /**
   * Scenario: a pointer lands outside the dialog.
   * Expectation: the pointer reaches the mask and the dialog stays open.
   *
   * @param point pointer position in window coordinates.
   * @returns true when the point is outside the dialog frame.
   */
  public hitsMask(point: DialogPoint): boolean {
    const insideX: boolean = point.x >= this.rect.x && point.x <= this.rect.x + this.rect.width;
    const insideY: boolean = point.y >= this.rect.y && point.y <= this.rect.y + this.rect.height;
    return !(insideX && insideY);
  }

  /**
   * Scenario: the dialog describes itself for the log lines.
   * Expectation: the description carries the state, the open count and the rectangle origin.
   *
   * @returns a compact description.
   */
  public toString(): string {
    return `DialogInstance{state=${this.state}, opens=${this.opens}, x=${this.rect.x.toFixed(1)}, ` +
      `y=${this.rect.y.toFixed(1)}, w=${this.rect.width.toFixed(1)}}`;
  }
}

/**
 * Timing model of the dialog animation and the dismissal budget.
 */
class DialogTiming {
  private enterMs: number = 0;
  private exitMs: number = 0;
  private openCount: number = 0;

  /**
   * Scenario: the enter animation is timed.
   * Expectation: the measured duration is kept and the open counter grows.
   *
   * @param durationMs duration of the enter animation.
   */
  public recordEnter(durationMs: number): void {
    this.enterMs += durationMs;
    this.openCount++;
  }

  /**
   * Scenario: the exit animation is timed.
   * Expectation: the measured duration is accumulated separately from the enter animation.
   *
   * @param durationMs duration of the exit animation.
   */
  public recordExit(durationMs: number): void {
    this.exitMs += durationMs;
  }

  /**
   * @returns the average enter duration, zero when nothing was recorded.
   */
  public averageEnterMs(): number {
    if (this.openCount === 0) {
      return 0;
    }
    return this.enterMs / this.openCount;
  }

  /**
   * @returns the total exit duration.
   */
  public getExitMs(): number {
    return this.exitMs;
  }

  /**
   * @returns the number of recorded openings.
   */
  public getOpenCount(): number {
    return this.openCount;
  }

  /**
   * Scenario: the enter duration is compared with the declared animation duration.
   * Expectation: a duration inside one animation frame window is accepted, a longer one is
   * reported as a slow dialog.
   *
   * @param durationMs measured duration.
   * @returns true when the dialog entered inside the budget.
   */
  public isEnterWithinBudget(durationMs: number): boolean {
    return durationMs <= DIALOG_ANIMATION_MS + 16;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `DialogTiming{opens=${this.openCount}, enter=${this.enterMs}ms, exit=${this.exitMs}ms}`;
  }
}

/**
 * Builds the safe area of the reference window.
 *
 * @returns the safe area.
 */
function buildSafeArea(): SafeArea {
  return {
    top: SAFE_AREA_TOP_VP,
    bottom: SAFE_AREA_BOTTOM_VP,
    left: SAFE_AREA_LEFT_VP,
    right: SAFE_AREA_RIGHT_VP
  };
}

/**
 * Builds the alert dialog that the exam page shows when the assessment ended.
 *
 * @returns the positioned instance.
 */
function buildEndDialog(): DialogInstance {
  const content: DialogContent = new DialogContent('Assessment Ended', 'The assessment exited.', 'OK');
  const width: number = content.measuredWidthVp(WINDOW_WIDTH_VP);
  const height: number = content.measuredHeightVp(1);
  const rect: DialogRect = DialogPlacement.centered(width, height, WINDOW_WIDTH_VP, WINDOW_HEIGHT_VP,
    buildSafeArea());
  return new DialogInstance(content, rect);
}

/**
 * Builds the alert dialog that the exam page shows when the assessment is interrupted.
 *
 * @returns the positioned instance.
 */
function buildInterruptDialog(): DialogInstance {
  const content: DialogContent = new DialogContent('Assessment Interrupted',
    'The assessment timed out.', 'OK');
  const width: number = content.measuredWidthVp(WINDOW_WIDTH_VP);
  const height: number = content.measuredHeightVp(2);
  const rect: DialogRect = DialogPlacement.centered(width, height, WINDOW_WIDTH_VP, WINDOW_HEIGHT_VP,
    buildSafeArea());
  return new DialogInstance(content, rect);
}

/**
 * @param rect rectangle to inspect.
 * @returns true when the rectangle lies inside the window frame.
 */
function insideWindow(rect: DialogRect): boolean {
  const insideX: boolean = rect.x >= 0 && rect.x + rect.width <= WINDOW_WIDTH_VP;
  const insideY: boolean = rect.y >= 0 && rect.y + rect.height <= WINDOW_HEIGHT_VP;
  return insideX && insideY;
}

/**
 * @param rect rectangle to inspect.
 * @returns the area of the rectangle in square vp.
 */
function areaOf(rect: DialogRect): number {
  return rect.width * rect.height;
}

/**
 * Makes sure that the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
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
 * Brings the sample back to the entry page after a dialog was dismissed.
 *
 * @param driver driver of the running case.
 * @param confirmFirst whether the confirm button should be pressed first.
 */
async function leaveDialog(driver: Driver, confirmFirst: boolean): Promise<void> {
  if (confirmFirst && await isAlertDialogVisible(driver)) {
    const confirm: Component | null = await findButtonByText(driver, TEXT_DIALOG_CONFIRM);
    if (confirm !== null) {
      await clickComponent(confirm);
      await serializedDelay(driver, DELAY_AFTER_ACTION);
    }
  }
  await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
  await serializedDelay(driver, DELAY_AFTER_ACTION);
}

/**
 * Finds the confirm button of the alert dialog.
 *
 * The UiTest framework composes the dialog from platform widgets, the confirm button is the
 * component whose text equals the confirm label of the sample.
 *
 * @param driver driver of the running case.
 * @param label label of the button.
 * @returns the component, or null when it cannot be found.
 */
async function findButtonByText(driver: Driver, label: string): Promise<Component | null> {
  const buttons: Component[] = await findComponentsByType(driver, TYPE_BUTTON);
  for (let i = 0; i < buttons.length; i++) {
    try {
      const text: string = await getTextSerialized(buttons[i]);
      if (text === label) {
        return buttons[i];
      }
    } catch (error) {
      // Skip the component that dropped out of the tree.
    }
  }
  return null;
}

export default function dialogPositioningTest() {
  describe('DialogPositioning_Test', () => {
    let driver: Driver;
    let safeArea: SafeArea;
    let timing: DialogTiming;

    beforeAll(async () => {
      driver = getDriver();
      safeArea = buildSafeArea();
      timing = new DialogTiming();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
      hilog.info(DOMAIN, TAG, 'DialogPositioning_Test beforeAll, safe top %{public}d, bottom %{public}d',
        safeArea.top, safeArea.bottom);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the dialog content measures itself.
     * Expectation: a single line message yields a height above the minimum and a two line
     * message is a line box taller.
     */
    it('Assessment_DialogPositioning_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_001, begin');
      const content: DialogContent = new DialogContent('Assessment Ended', 'The assessment exited.');
      const oneLine: number = content.measuredHeightVp(1);
      const twoLines: number = content.measuredHeightVp(2);
      hilog.info(DOMAIN, TAG, '%{public}s one line: %{public}d, two lines: %{public}d',
        BUNDLE + 'DialogPositioning_001', oneLine, twoLines);
      expect(oneLine >= DIALOG_MIN_HEIGHT_VP).assertTrue();
      expect(twoLines - oneLine).assertEqual(DIALOG_MESSAGE_LINE_VP);
      expect(content.confirmLabel).assertEqual(TEXT_DIALOG_CONFIRM);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DialogPositioning_001', content.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_001, end');
    });

    /**
     * Scenario: the dialog width is measured.
     * Expectation: the width follows the eighty percent ratio up to the maximum width and a
     * narrower window produces a proportionally narrower dialog.
     */
    it('Assessment_DialogPositioning_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_002, begin');
      const content: DialogContent = new DialogContent('Assessment Ended', 'text');
      expect(content.measuredWidthVp(WINDOW_WIDTH_VP)).assertEqual(WINDOW_WIDTH_VP * DIALOG_WIDTH_RATIO);
      expect(content.measuredWidthVp(1000)).assertEqual(DIALOG_MAX_WIDTH_VP);
      expect(content.measuredWidthVp(200)).assertEqual(200 * DIALOG_WIDTH_RATIO);
      expect(content.measuredWidthVp(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_002, end');
    });

    /**
     * Scenario: the centered placement of an end dialog.
     * Expectation: the top and bottom gaps inside the safe area are equal and the rectangle
     * stays fully inside the window.
     */
    it('Assessment_DialogPositioning_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_003, begin');
      const dialog: DialogInstance = buildEndDialog();
      const rect: DialogRect = dialog.getRect();
      const topGap: number = rect.y - safeArea.top;
      const bottomGap: number = WINDOW_HEIGHT_VP - safeArea.bottom - (rect.y + rect.height);
      hilog.info(DOMAIN, TAG, '%{public}s top gap %{public}s, bottom gap %{public}s',
        BUNDLE + 'DialogPositioning_003', topGap.toFixed(1), bottomGap.toFixed(1));
      expect(Math.abs(topGap - bottomGap) < 0.001).assertTrue();
      expect(insideWindow(rect)).assertTrue();
      expect(DIALOG_ALIGNMENT).assertEqual('center');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DialogPositioning_003', dialog.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_003, end');
    });

    /**
     * Scenario: the horizontal centering of the dialog.
     * Expectation: the left and right margins of the dialog are equal and the dialog never
     * touches the window edge.
     */
    it('Assessment_DialogPositioning_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_004, begin');
      const rect: DialogRect = buildEndDialog().getRect();
      const leftMargin: number = rect.x;
      const rightMargin: number = WINDOW_WIDTH_VP - (rect.x + rect.width);
      hilog.info(DOMAIN, TAG, '%{public}s left %{public}s, right %{public}s',
        BUNDLE + 'DialogPositioning_004', leftMargin.toFixed(1), rightMargin.toFixed(1));
      expect(Math.abs(leftMargin - rightMargin) < 0.001).assertTrue();
      expect(leftMargin >= DIALOG_HORIZONTAL_MARGIN_VP).assertTrue();
      expect(rightMargin >= DIALOG_HORIZONTAL_MARGIN_VP).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_004, end');
    });

    /**
     * Scenario: the placement verdict of a well formed dialog.
     * Expectation: the centered dialog is reported as placed against the safe area and the
     * keyboard free window.
     */
    it('Assessment_DialogPositioning_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_005, begin');
      const rect: DialogRect = buildInterruptDialog().getRect();
      const verdict: PlacementVerdict = DialogPlacement.audit(rect, safeArea, WINDOW_HEIGHT_VP, -1);
      expect(verdict).assertEqual(PlacementVerdict.PLACED);
      hilog.info(DOMAIN, TAG, '%{public}s audit verdict: %{public}d',
        BUNDLE + 'DialogPositioning_005', verdict);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_005, end');
    });

    /**
     * Scenario: a dialog that is taller than the usable safe area.
     * Expectation: the clamp pins the dialog to the safe top and the audit reports the bottom
     * clipping instead of returning a negative offset.
     */
    it('Assessment_DialogPositioning_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_006, begin');
      const content: DialogContent = new DialogContent('Ended', 'a very long message');
      const height: number = content.measuredHeightVp(40);
      const rect: DialogRect = DialogPlacement.centered(content.measuredWidthVp(WINDOW_WIDTH_VP), height,
        WINDOW_WIDTH_VP, WINDOW_HEIGHT_VP, safeArea);
      hilog.info(DOMAIN, TAG, '%{public}s tall dialog y %{public}s, height %{public}d',
        BUNDLE + 'DialogPositioning_006', rect.y.toFixed(1), height);
      expect(rect.y).assertEqual(SAFE_AREA_TOP_VP);
      expect(height > WINDOW_HEIGHT_VP - SAFE_AREA_TOP_VP - SAFE_AREA_BOTTOM_VP).assertTrue();
      expect(DialogPlacement.audit(rect, safeArea, WINDOW_HEIGHT_VP, -1))
        .assertEqual(PlacementVerdict.CLIPPED_BOTTOM);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_006, end');
    });

    /**
     * Scenario: the clamp of a proposed top edge above the safe top.
     * Expectation: a negative proposal is raised to the safe top, a proposal beyond the maximum
     * is lowered and a proposal inside the range is returned untouched.
     */
    it('Assessment_DialogPositioning_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_007, begin');
      const usableHeight: number = WINDOW_HEIGHT_VP - safeArea.top - safeArea.bottom;
      expect(DialogPlacement.clampY(-50, 200, SAFE_AREA_TOP_VP, usableHeight)).assertEqual(SAFE_AREA_TOP_VP);
      expect(DialogPlacement.clampY(5000, 200, SAFE_AREA_TOP_VP, usableHeight))
        .assertEqual(SAFE_AREA_TOP_VP + usableHeight - 200);
      expect(DialogPlacement.clampY(300, 200, SAFE_AREA_TOP_VP, usableHeight)).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_007, end');
    });

    /**
     * Scenario: the dialog is placed while the keyboard is displayed.
     * Expectation: the dialog is lifted above the keyboard, the audit reports no overlap and the
     * rectangle stays inside the window.
     */
    it('Assessment_DialogPositioning_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_008, begin');
      const content: DialogContent = new DialogContent('Ended', 'message');
      const width: number = content.measuredWidthVp(WINDOW_WIDTH_VP);
      const height: number = content.measuredHeightVp(1);
      const keyboardTop: number = WINDOW_HEIGHT_VP - KEYBOARD_HEIGHT_VP;
      const rect: DialogRect = DialogPlacement.withKeyboard(width, height, WINDOW_WIDTH_VP, WINDOW_HEIGHT_VP,
        safeArea, KEYBOARD_HEIGHT_VP);
      hilog.info(DOMAIN, TAG, '%{public}s keyboard top %{public}d, dialog bottom %{public}s',
        BUNDLE + 'DialogPositioning_008', keyboardTop, (rect.y + rect.height).toFixed(1));
      expect(rect.y + rect.height <= keyboardTop).assertTrue();
      expect(rect.y >= safeArea.top).assertTrue();
      expect(insideWindow(rect)).assertTrue();
      expect(DialogPlacement.audit(rect, safeArea, WINDOW_HEIGHT_VP, keyboardTop))
        .assertEqual(PlacementVerdict.PLACED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_008, end');
    });

    /**
     * Scenario: a dialog that was not lifted for the keyboard.
     * Expectation: the audit reports the overlap with the keyboard, which is the failure that
     * keyboard avoidance prevents.
     */
    it('Assessment_DialogPositioning_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_009, begin');
      const rect: DialogRect = buildEndDialog().getRect();
      const keyboardTop: number = WINDOW_HEIGHT_VP - KEYBOARD_HEIGHT_VP;
      const verdict: PlacementVerdict = DialogPlacement.audit(rect, safeArea, WINDOW_HEIGHT_VP, keyboardTop);
      hilog.info(DOMAIN, TAG, '%{public}s verdict without avoidance: %{public}d',
        BUNDLE + 'DialogPositioning_009', verdict);
      expect(rect.y + rect.height > keyboardTop).assertTrue();
      expect(verdict).assertEqual(PlacementVerdict.UNDER_KEYBOARD);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_009, end');
    });

    /**
     * Scenario: the keyboard shrinks the usable height.
     * Expectation: a dialog that fits the window without the keyboard is taller than the usable
     * area with the keyboard, which is why the content must stay scrollable.
     */
    it('Assessment_DialogPositioning_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_010, begin');
      const content: DialogContent = new DialogContent('Ended', 'message');
      const height: number = content.measuredHeightVp(14);
      const usableWithoutKeyboard: number = WINDOW_HEIGHT_VP - safeArea.top - safeArea.bottom;
      const usableWithKeyboard: number = usableWithoutKeyboard - KEYBOARD_HEIGHT_VP;
      hilog.info(DOMAIN, TAG, '%{public}s height %{public}d, usable %{public}d -> %{public}d',
        BUNDLE + 'DialogPositioning_010', height, usableWithoutKeyboard, usableWithKeyboard);
      expect(height < usableWithoutKeyboard).assertTrue();
      expect(height > usableWithKeyboard).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_010, end');
    });

    /**
     * Scenario: the hit rect of the confirm button.
     * Expectation: the rect sits at the bottom of the dialog, is inset by the button padding and
     * keeps the declared button height.
     */
    it('Assessment_DialogPositioning_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_011, begin');
      const dialog: DialogInstance = buildEndDialog();
      const rect: DialogRect = dialog.getRect();
      const hit: DialogRect = dialog.confirmHitRect();
      hilog.info(DOMAIN, TAG, '%{public}s hit y %{public}s, height %{public}d',
        BUNDLE + 'DialogPositioning_011', hit.y.toFixed(1), hit.height);
      expect(hit.height).assertEqual(DIALOG_BUTTON_HEIGHT_VP);
      expect(hit.x).assertEqual(rect.x + DIALOG_BUTTON_PADDING_VP);
      expect(hit.width).assertEqual(rect.width - 2 * DIALOG_BUTTON_PADDING_VP);
      expect(hit.y + hit.height <= rect.y + rect.height).assertTrue();
      expect(areaOf(hit) < areaOf(rect)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_011, end');
    });

    /**
     * Scenario: a pointer lands on the confirm button.
     * Expectation: the center of the hit rect activates the dialog, the title area does not and
     * a point on the mask stays outside the dialog.
     */
    it('Assessment_DialogPositioning_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_012, begin');
      const dialog: DialogInstance = buildEndDialog();
      const hit: DialogRect = dialog.confirmHitRect();
      const center: DialogPoint = {
        x: hit.x + hit.width / 2,
        y: hit.y + hit.height / 2
      };
      const title: DialogPoint = {
        x: hit.x + 4,
        y: dialog.getRect().y + 8
      };
      const mask: DialogPoint = {
        x: 1,
        y: 1
      };
      expect(dialog.hitsConfirm(center)).assertTrue();
      expect(dialog.hitsConfirm(title)).assertFalse();
      expect(dialog.hitsConfirm(mask)).assertFalse();
      expect(dialog.hitsMask(mask)).assertTrue();
      expect(dialog.hitsMask(center)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s center %{public}s/%{public}s',
        BUNDLE + 'DialogPositioning_012', center.x.toFixed(1), center.y.toFixed(1));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_012, end');
    });

    /**
     * Scenario: the dialog lifecycle of an accepted dismissal.
     * Expectation: the dialog opens, shows and closes through the confirm button, the open and
     * the dismissal counters both reach one.
     */
    it('Assessment_DialogPositioning_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_013, begin');
      const dialog: DialogInstance = buildEndDialog();
      expect(dialog.getState()).assertEqual(DialogState.HIDDEN);
      expect(dialog.open()).assertTrue();
      expect(dialog.getState()).assertEqual(DialogState.OPENING);
      dialog.animationFinished();
      expect(dialog.getState()).assertEqual(DialogState.SHOWN);
      expect(dialog.dismiss(DismissalPath.CONFIRM_BUTTON)).assertTrue();
      expect(dialog.getState()).assertEqual(DialogState.CLOSING);
      dialog.closeFinished();
      expect(dialog.getState()).assertEqual(DialogState.CLOSED);
      expect(dialog.getOpenCount()).assertEqual(1);
      expect(dialog.getDismissalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DialogPositioning_013', dialog.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_013, end');
    });

    /**
     * Scenario: a second open while the dialog is visible.
     * Expectation: the second request is refused, which is the guard that the dialogShown flag
     * of the exam page implements.
     */
    it('Assessment_DialogPositioning_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_014, begin');
      const dialog: DialogInstance = buildEndDialog();
      expect(dialog.open()).assertTrue();
      expect(dialog.open()).assertFalse();
      dialog.animationFinished();
      expect(dialog.open()).assertFalse();
      expect(dialog.getOpenCount()).assertEqual(1);
      expect(MAX_DIALOG_INSTANCES).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_014, end');
    });

    /**
     * Scenario: the mask tap and the auto cancel dismissal paths.
     * Expectation: both are refused because the dialog declares autoCancel false, the dialog
     * stays visible.
     */
    it('Assessment_DialogPositioning_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_015, begin');
      const dialog: DialogInstance = buildEndDialog();
      dialog.open();
      dialog.animationFinished();
      expect(dialog.dismiss(DismissalPath.MASK_TAP)).assertFalse();
      expect(dialog.dismiss(DismissalPath.AUTO_CANCEL)).assertFalse();
      expect(dialog.getState()).assertEqual(DialogState.SHOWN);
      expect(DIALOG_AUTO_CANCEL).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_015, end');
    });

    /**
     * Scenario: the back key and the enter key dismissal paths.
     * Expectation: both close the visible dialog, a close from the hidden state is refused.
     */
    it('Assessment_DialogPositioning_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_016, begin');
      const dialog: DialogInstance = buildEndDialog();
      expect(dialog.dismiss(DismissalPath.BACK_KEY)).assertFalse();
      dialog.open();
      dialog.animationFinished();
      expect(dialog.dismiss(DismissalPath.BACK_KEY)).assertTrue();
      dialog.closeFinished();
      dialog.open();
      dialog.animationFinished();
      expect(dialog.dismiss(DismissalPath.ENTER_KEY)).assertTrue();
      dialog.closeFinished();
      expect(dialog.getDismissalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DialogPositioning_016',
        dialog.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_016, end');
    });

    /**
     * Scenario: the closing animation is finished twice.
     * Expectation: the second call is ignored, the dismissal counter is not incremented twice.
     */
    it('Assessment_DialogPositioning_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_017, begin');
      const dialog: DialogInstance = buildEndDialog();
      dialog.open();
      dialog.animationFinished();
      dialog.dismiss(DismissalPath.CONFIRM_BUTTON);
      dialog.closeFinished();
      dialog.closeFinished();
      expect(dialog.getDismissalCount()).assertEqual(1);
      dialog.animationFinished();
      expect(dialog.getState()).assertEqual(DialogState.CLOSED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_017, end');
    });

    /**
     * Scenario: the animation boundary values.
     * Expectation: the alpha grows from sixty percent to full and the scale grows from ninety
     * percent to one, the two curves move in the same direction.
     */
    it('Assessment_DialogPositioning_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_018, begin');
      expect(DIALOG_ANIMATION_ALPHA_FROM < DIALOG_ANIMATION_ALPHA_TO).assertTrue();
      expect(DIALOG_ANIMATION_SCALE_FROM < 1).assertTrue();
      expect(DIALOG_ANIMATION_ALPHA_TO).assertEqual(1);
      const halfwayAlpha: number = (DIALOG_ANIMATION_ALPHA_FROM + DIALOG_ANIMATION_ALPHA_TO) / 2;
      expect(halfwayAlpha > DIALOG_ANIMATION_ALPHA_FROM).assertTrue();
      expect(halfwayAlpha < DIALOG_ANIMATION_ALPHA_TO).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s duration: %{public}d ms', BUNDLE + 'DialogPositioning_018',
        DIALOG_ANIMATION_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_018, end');
    });

    /**
     * Scenario: the enter and exit durations of a dialog.
     * Expectation: the timings are accumulated separately, the average enter duration is inside
     * the animation budget and an empty timing model answers with zero.
     */
    it('Assessment_DialogPositioning_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_019, begin');
      const local: DialogTiming = new DialogTiming();
      expect(local.averageEnterMs()).assertEqual(0);
      local.recordEnter(DIALOG_ANIMATION_MS);
      local.recordEnter(DIALOG_ANIMATION_MS + 20);
      local.recordExit(DIALOG_ANIMATION_MS);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DialogPositioning_019', local.toString());
      expect(local.getOpenCount()).assertEqual(2);
      expect(local.averageEnterMs()).assertEqual(DIALOG_ANIMATION_MS + 10);
      expect(local.getExitMs()).assertEqual(DIALOG_ANIMATION_MS);
      expect(local.isEnterWithinBudget(DIALOG_ANIMATION_MS)).assertTrue();
      expect(local.isEnterWithinBudget(DIALOG_ANIMATION_MS + 100)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_019, end');
    });

    /**
     * Scenario: the audit of the four clipping verdicts.
     * Expectation: a rectangle above, below, left and right of the window each yields its own
     * verdict, so the audit can localize a misplaced dialog.
     */
    it('Assessment_DialogPositioning_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_020, begin');
      const above: DialogRect = { x: 20, y: 0, width: 100, height: 100 };
      const below: DialogRect = { x: 20, y: WINDOW_HEIGHT_VP - 10, width: 100, height: 100 };
      const left: DialogRect = { x: -5, y: 100, width: 100, height: 100 };
      const right: DialogRect = { x: WINDOW_WIDTH_VP - 50, y: 100, width: 100, height: 100 };
      expect(DialogPlacement.audit(above, safeArea, WINDOW_HEIGHT_VP, -1))
        .assertEqual(PlacementVerdict.CLIPPED_TOP);
      expect(DialogPlacement.audit(below, safeArea, WINDOW_HEIGHT_VP, -1))
        .assertEqual(PlacementVerdict.CLIPPED_BOTTOM);
      expect(DialogPlacement.audit(left, safeArea, WINDOW_HEIGHT_VP, -1))
        .assertEqual(PlacementVerdict.CLIPPED_LEFT);
      expect(DialogPlacement.audit(right, safeArea, WINDOW_HEIGHT_VP, -1))
        .assertEqual(PlacementVerdict.CLIPPED_RIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_020, end');
    });

    /**
     * Scenario: the safe area guards the top edge.
     * Expectation: a dialog that sits just below the window top but above the safe top is
     * reported as clipped, because the notch area is not usable.
     */
    it('Assessment_DialogPositioning_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_021, begin');
      const rect: DialogRect = { x: 20, y: SAFE_AREA_TOP_VP - 1, width: 200, height: 100 };
      expect(DialogPlacement.audit(rect, safeArea, WINDOW_HEIGHT_VP, -1))
        .assertEqual(PlacementVerdict.CLIPPED_TOP);
      const safe: DialogRect = { x: 20, y: SAFE_AREA_TOP_VP, width: 200, height: 100 };
      expect(DialogPlacement.audit(safe, safeArea, WINDOW_HEIGHT_VP, -1))
        .assertEqual(PlacementVerdict.PLACED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogPositioning_021, end');
    });
  });
}

/**
 * Leaves the dialog through the bottom most path: the confirm button when it is rendered and the
 * back key otherwise, followed by a second back that leaves a stray exam page.
 *
 * @param driver driver of the running case.
 */
async function leaveDialogBottomMost(driver: Driver): Promise<void> {
  if (await isAlertDialogVisible(driver)) {
    const confirm: Component | null = await findButtonByText(driver, TEXT_DIALOG_CONFIRM);
    if (confirm !== null) {
      await clickComponent(confirm);
      await serializedDelay(driver, DELAY_AFTER_ACTION);
    }
  }
  await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
  await serializedDelay(driver, DELAY_AFTER_ACTION);
}
