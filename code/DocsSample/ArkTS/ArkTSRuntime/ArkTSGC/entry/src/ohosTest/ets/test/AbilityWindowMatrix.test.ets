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

import { describe, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { UIAbility } from '@kit.AbilityKit';
import { display, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { Component, Driver, ON, Rect } from '@kit.TestKit';
import { launchHome, stopHome } from './shared/AppProbe';
import { paceTurn, sleepMs } from './shared/TestPace';
import { logCase } from './shared/TestLog';

// The home page of the sample renders exactly one Text carrying this literal and one Button, so the
// text is used as the probe for "the page root content really reached the main window".
const PAGE_TEXT: string = 'Hello World';
const PAGE_TEXT_TYPE: string = 'Text';
const BOOLEAN_TYPE: string = 'boolean';

const OK_CODE: number = 0;
const ERR_PARAM: number = 401;
const ERR_CAPABILITY: number = 801;
const ERR_WINDOW_STATE: number = 1300002;
const ERR_WMS: number = 1300003;
const ERR_BAD_PARAM: number = 1300016;

const MISSING_ID: number = -1;
const ORIGIN: number = 0;
const MIN_SIDE_PX: number = 1;
const MAX_ROTATION_VALUE: number = 3;
const MIN_DENSITY_PIXELS: number = 0.5;
const MIN_DENSITY_DPI: number = 30;
const MIN_DENSITY_RATIO: number = 0.5;
const MAX_DENSITY_RATIO: number = 6;
const MIN_WINDOW_VP: number = 60;
const MAX_WINDOW_VP: number = 6000;
const DRAWABLE_MIN_RATIO: number = 0.4;
const AREA_DIVISOR: number = 32;
const LIMIT_UNSET: number = 0;
const MAX_PREFERRED_ORIENTATION: number = 17;
const BAD_DISPLAY_ID: number = 999999;
const MAX_MODE_MASK: number = 256;
const BRIGHTNESS_STEP: number = 0.3;
const MAX_WINDOW_ID: number = 1000000;
const MAX_DISPLAY_DPI: number = 2000;
const MIN_ASPECT_RATIO: number = 0.2;
const MAX_ASPECT_RATIO: number = 5;
const MIN_REFRESH_RATE: number = 24;

const IDLE_SETTLE_MS: number = 400;
const PROP_SETTLE_MS: number = 450;
const DRIVER_WAIT_MS: number = 5000;
const DRIVER_ABSENT_MS: number = 1200;
const REPEAT_READS: number = 3;
const LAUNCH_ROUNDS: number = 2;

const DEFAULT_BRIGHTNESS: number = -1;
const BRIGHTNESS_ZERO: number = 0;
const BRIGHTNESS_LOW: number = 0.2;
const BRIGHTNESS_MID: number = 0.5;
const BRIGHTNESS_HIGH: number = 0.7;
const BRIGHTNESS_FULL: number = 1;
const BRIGHTNESS_OVER: number = 1.5;
const BRIGHTNESS_UNDER: number = -2;
const BRIGHTNESS_TOLERANCE: number = 0.02;

const SINGLE_VALUE: number = 1;

const STATUS_VALUES: number[] = [
  Number(window.WindowStatusType.UNDEFINED),
  Number(window.WindowStatusType.FULL_SCREEN),
  Number(window.WindowStatusType.MAXIMIZE),
  Number(window.WindowStatusType.MINIMIZE),
  Number(window.WindowStatusType.FLOATING),
  Number(window.WindowStatusType.SPLIT_SCREEN)
];

const KNOWN_WINDOW_TYPES: number[] = [
  Number(window.WindowType.TYPE_MAIN),
  Number(window.WindowType.TYPE_SYSTEM_ALERT),
  Number(window.WindowType.TYPE_FLOAT),
  Number(window.WindowType.TYPE_DIALOG)
];

const MODE_BITS: number[] = [
  window.GlobalWindowMode.FULLSCREEN,
  window.GlobalWindowMode.SPLIT,
  window.GlobalWindowMode.FLOAT,
  window.GlobalWindowMode.PIP
];

const PREFERRED_ORIENTATIONS: number[] = [
  window.Orientation.UNSPECIFIED,
  window.Orientation.PORTRAIT,
  window.Orientation.LANDSCAPE,
  window.Orientation.PORTRAIT_INVERTED,
  window.Orientation.LANDSCAPE_INVERTED,
  window.Orientation.AUTO_ROTATION,
  window.Orientation.AUTO_ROTATION_PORTRAIT,
  window.Orientation.AUTO_ROTATION_LANDSCAPE,
  window.Orientation.AUTO_ROTATION_RESTRICTED,
  window.Orientation.AUTO_ROTATION_PORTRAIT_RESTRICTED,
  window.Orientation.AUTO_ROTATION_LANDSCAPE_RESTRICTED,
  window.Orientation.LOCKED,
  window.Orientation.AUTO_ROTATION_UNSPECIFIED,
  window.Orientation.USER_ROTATION_PORTRAIT,
  window.Orientation.USER_ROTATION_LANDSCAPE,
  window.Orientation.USER_ROTATION_PORTRAIT_INVERTED,
  window.Orientation.USER_ROTATION_LANDSCAPE_INVERTED,
  window.Orientation.FOLLOW_DESKTOP
];

const ORIENTATION_VALUES: number[] = [
  Number(display.Orientation.PORTRAIT),
  Number(display.Orientation.LANDSCAPE),
  Number(display.Orientation.PORTRAIT_INVERTED),
  Number(display.Orientation.LANDSCAPE_INVERTED)
];

const FOLD_STATUS_VALUES: number[] = [
  Number(display.FoldStatus.FOLD_STATUS_UNKNOWN),
  Number(display.FoldStatus.FOLD_STATUS_EXPANDED),
  Number(display.FoldStatus.FOLD_STATUS_FOLDED)
];

const DISPLAY_STATE_VALUES: number[] = [
  Number(display.DisplayState.STATE_UNKNOWN),
  Number(display.DisplayState.STATE_OFF),
  Number(display.DisplayState.STATE_ON),
  Number(display.DisplayState.STATE_DOZE),
  Number(display.DisplayState.STATE_DOZE_SUSPEND),
  Number(display.DisplayState.STATE_ON_SUSPEND),
  Number(display.DisplayState.STATE_VR)
];

let sharedDriver: Driver | null = null;

function driver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

function defaultDisplay(): display.Display {
  return display.getDefaultDisplaySync();
}

function fullRectOf(target: display.Display): window.Rect {
  const rect: window.Rect = {
    left: ORIGIN,
    top: ORIGIN,
    width: target.width,
    height: target.height
  };
  return rect;
}

function rectRight(rect: window.Rect): number {
  return rect.left + rect.width;
}

function rectBottom(rect: window.Rect): number {
  return rect.top + rect.height;
}

function rectPositive(rect: window.Rect): boolean {
  return rect.width >= MIN_SIDE_PX && rect.height >= MIN_SIDE_PX;
}

function rectEqual(first: window.Rect, second: window.Rect): boolean {
  return first.left === second.left && first.top === second.top &&
    first.width === second.width && first.height === second.height;
}

function rectInside(inner: window.Rect, outer: window.Rect): boolean {
  return inner.left >= outer.left && inner.top >= outer.top &&
    rectRight(inner) <= rectRight(outer) && rectBottom(inner) <= rectBottom(outer);
}

function rectArea(rect: window.Rect): number {
  return rect.width * rect.height;
}

function knownStatus(value: number): boolean {
  return STATUS_VALUES.indexOf(value) >= 0;
}

function knownWindowType(value: number): boolean {
  return KNOWN_WINDOW_TYPES.indexOf(value) >= 0;
}

function knownModeBitCount(mode: number): number {
  let count: number = 0;
  for (const bit of MODE_BITS) {
    if ((mode & bit) !== ORIGIN) {
      count++;
    }
  }
  return count;
}

function inBrightnessRange(value: number): boolean {
  return value >= DEFAULT_BRIGHTNESS && value <= BRIGHTNESS_FULL;
}

function aboutEqual(actual: number, expected: number): boolean {
  return Math.abs(actual - expected) <= BRIGHTNESS_TOLERANCE;
}

async function promiseCode(action: () => Promise<void>): Promise<number> {
  try {
    await action();
  } catch (error) {
    return Number((error as BusinessError).code);
  }
  return OK_CODE;
}

function syncCode(action: () => number): number {
  try {
    action();
  } catch (error) {
    return Number((error as BusinessError).code);
  }
  return OK_CODE;
}

function safeStatus(target: window.Window): number {
  try {
    return Number(target.getWindowStatus());
  } catch (error) {
    return MISSING_ID;
  }
}

async function pageRootVisible(): Promise<boolean> {
  const found: Component | null =
    await driver().waitForComponent(ON.text(PAGE_TEXT).type(PAGE_TEXT_TYPE), DRIVER_WAIT_MS);
  return found !== null;
}

async function pageRootBounds(): Promise<Rect> {
  const found: Component = await driver().waitForComponent(ON.text(PAGE_TEXT).type(PAGE_TEXT_TYPE), DRIVER_WAIT_MS);
  return await found.getBounds();
}

async function pageRootComponent(): Promise<Component> {
  return await driver().waitForComponent(ON.text(PAGE_TEXT).type(PAGE_TEXT_TYPE), DRIVER_WAIT_MS);
}

class PrimaryProbe {
  code: number = OK_CODE;
  id: number = MISSING_ID;
  width: number = ORIGIN;
  height: number = ORIGIN;
  densityDPI: number = ORIGIN;
  densityPixels: number = ORIGIN;
}

function primaryDisplay(): PrimaryProbe {
  const result: PrimaryProbe = new PrimaryProbe();
  try {
    const found: display.Display = display.getPrimaryDisplaySync();
    result.id = found.id;
    result.width = found.width;
    result.height = found.height;
    result.densityDPI = found.densityDPI;
    result.densityPixels = found.densityPixels;
  } catch (error) {
    result.code = Number((error as BusinessError).code);
  }
  return result;
}

class WindowProbe {
  readonly ability: UIAbility;
  readonly main: window.Window;

  constructor(ability: UIAbility, main: window.Window) {
    this.ability = ability;
    this.main = main;
  }

  props(): window.WindowProperties {
    return this.main.getWindowProperties();
  }

  rect(): window.Rect {
    return this.main.getWindowProperties().windowRect;
  }

  drawable(): window.Rect {
    return this.main.getWindowProperties().drawableRect;
  }

  showing(): boolean {
    return this.main.isWindowShowing();
  }

  status(): number {
    return Number(this.main.getWindowStatus());
  }

  statusSafe(): number {
    return safeStatus(this.main);
  }

  avoid(kind: window.AvoidAreaType): window.AvoidArea {
    return this.main.getWindowAvoidArea(kind);
  }
}

class AvoidFacts {
  declaredVisible: boolean = false;
  leftWidth: number = 0;
  topHeight: number = 0;
  rightWidth: number = 0;
  bottomHeight: number = 0;

  constructor(area: window.AvoidArea) {
    this.declaredVisible = area.visible;
    this.leftWidth = area.leftRect.width;
    this.topHeight = area.topRect.height;
    this.rightWidth = area.rightRect.width;
    this.bottomHeight = area.bottomRect.height;
  }
}

function avoidFactsOf(probe: WindowProbe, kind: window.AvoidAreaType): AvoidFacts {
  return new AvoidFacts(probe.avoid(kind));
}

class WindowFacts {
  code: number = OK_CODE;
  id: number = MISSING_ID;
  displayId: number = MISSING_ID;
  name: string = '';
  windowType: number = MISSING_ID;
  left: number = ORIGIN;
  top: number = ORIGIN;
  width: number = ORIGIN;
  height: number = ORIGIN;
  drawableWidth: number = ORIGIN;
  drawableHeight: number = ORIGIN;
  showing: boolean = false;
  status: number = MISSING_ID;
  brightness: number = DEFAULT_BRIGHTNESS;
  keepScreenOn: boolean = false;
  fullScreen: boolean = false;
  layoutFullScreen: boolean = false;
  focusable: boolean = false;
  touchable: boolean = false;
  transparent: boolean = false;

  constructor(target: window.Window) {
    try {
      const props: window.WindowProperties = target.getWindowProperties();
      this.id = props.id;
      this.windowType = Number(props.type);
      this.left = props.windowRect.left;
      this.top = props.windowRect.top;
      this.width = props.windowRect.width;
      this.height = props.windowRect.height;
      this.drawableWidth = props.drawableRect.width;
      this.drawableHeight = props.drawableRect.height;
      this.brightness = props.brightness;
      this.keepScreenOn = props.isKeepScreenOn;
      this.fullScreen = props.isFullScreen;
      this.layoutFullScreen = props.isLayoutFullScreen;
      this.focusable = props.focusable;
      this.touchable = props.touchable;
      const displayId: number | undefined = props.displayId;
      this.displayId = displayId === undefined ? MISSING_ID : displayId;
      const name: string | undefined = props.name;
      this.name = name === undefined ? '' : name;
      this.transparent = props.isTransparent;
      this.showing = target.isWindowShowing();
      this.status = safeStatus(target);
    } catch (error) {
      this.code = Number((error as BusinessError).code);
    }
  }
}

function capture(target: window.Window): WindowFacts {
  return new WindowFacts(target);
}

class LimitProbe {
  code: number = OK_CODE;
  minWidth: number = LIMIT_UNSET;
  maxWidth: number = LIMIT_UNSET;
  minHeight: number = LIMIT_UNSET;
  maxHeight: number = LIMIT_UNSET;
}

function limitsOf(target: window.Window): LimitProbe {
  const result: LimitProbe = new LimitProbe();
  try {
    const limits: window.WindowLimits = target.getWindowLimits();
    const minWidth: number | undefined = limits.minWidth;
    const maxWidth: number | undefined = limits.maxWidth;
    const minHeight: number | undefined = limits.minHeight;
    const maxHeight: number | undefined = limits.maxHeight;
    result.minWidth = minWidth === undefined ? LIMIT_UNSET : minWidth;
    result.maxWidth = maxWidth === undefined ? LIMIT_UNSET : maxWidth;
    result.minHeight = minHeight === undefined ? LIMIT_UNSET : minHeight;
    result.maxHeight = maxHeight === undefined ? LIMIT_UNSET : maxHeight;
  } catch (error) {
    result.code = Number((error as BusinessError).code);
  }
  return result;
}

class ModeProbe {
  code: number = OK_CODE;
  mode: number = ORIGIN;
}

async function globalMode(): Promise<ModeProbe> {
  const result: ModeProbe = new ModeProbe();
  try {
    result.mode = await window.getGlobalWindowMode();
  } catch (error) {
    result.code = Number((error as BusinessError).code);
  }
  return result;
}

async function scopedMode(displayId: number): Promise<ModeProbe> {
  const result: ModeProbe = new ModeProbe();
  try {
    result.mode = await window.getGlobalWindowMode(displayId);
  } catch (error) {
    result.code = Number((error as BusinessError).code);
  }
  return result;
}

function tolerantCode(code: number): boolean {
  return code === OK_CODE || code === ERR_CAPABILITY || code === ERR_WMS ||
    code === ERR_WINDOW_STATE || code === ERR_PARAM || code === ERR_BAD_PARAM;
}

class OrientationProbe {
  code: number = OK_CODE;
  value: number = MISSING_ID;
}

function preferredOrientationOf(target: window.Window): OrientationProbe {
  const result: OrientationProbe = new OrientationProbe();
  try {
    result.value = Number(target.getPreferredOrientation());
  } catch (error) {
    result.code = Number((error as BusinessError).code);
  }
  return result;
}

class FoldProbe {
  code: number = OK_CODE;
  foldable: boolean = false;
  status: number = MISSING_ID;
}

function foldState(): FoldProbe {
  const result: FoldProbe = new FoldProbe();
  try {
    result.foldable = display.isFoldable();
    result.status = Number(display.getFoldStatus());
  } catch (error) {
    result.code = Number((error as BusinessError).code);
  }
  return result;
}

class DisplayListProbe {
  code: number = OK_CODE;
  count: number = 0;
  ids: number[] = [];
  containsDefault: boolean = false;
}

async function displayList(): Promise<DisplayListProbe> {
  const result: DisplayListProbe = new DisplayListProbe();
  const defaultId: number = defaultDisplay().id;
  try {
    const all: display.Display[] = await display.getAllDisplays();
    result.count = all.length;
    result.ids = all.map((item: display.Display) => item.id);
    result.containsDefault = result.ids.indexOf(defaultId) >= 0;
  } catch (error) {
    result.code = Number((error as BusinessError).code);
  }
  return result;
}

class DisplayProbe {
  code: number = OK_CODE;
  id: number = MISSING_ID;
  width: number = ORIGIN;
  height: number = ORIGIN;
  densityDPI: number = ORIGIN;
  densityPixels: number = ORIGIN;
}

function displayById(id: number): DisplayProbe {
  const result: DisplayProbe = new DisplayProbe();
  try {
    const found: display.Display = display.getDisplayByIdSync(id);
    result.id = found.id;
    result.width = found.width;
    result.height = found.height;
    result.densityDPI = found.densityDPI;
    result.densityPixels = found.densityPixels;
  } catch (error) {
    result.code = Number((error as BusinessError).code);
  }
  return result;
}

class PhysicalProbe {
  code: number = OK_CODE;
  count: number = 0;
  widestWidth: number = ORIGIN;
  widestHeight: number = ORIGIN;
}

async function physicalResolution(): Promise<PhysicalProbe> {
  const result: PhysicalProbe = new PhysicalProbe();
  try {
    const all: display.DisplayPhysicalResolution[] = await display.getAllDisplayPhysicalResolution();
    result.count = all.length;
    for (const item of all) {
      result.widestWidth = Math.max(result.widestWidth, item.physicalWidth);
      result.widestHeight = Math.max(result.widestHeight, item.physicalHeight);
    }
  } catch (error) {
    result.code = Number((error as BusinessError).code);
  }
  return result;
}

async function openProbe(): Promise<WindowProbe> {
  const ability: UIAbility = await launchHome();
  const main: window.Window = await window.getLastWindow(ability.context);
  return new WindowProbe(ability, main);
}

async function setKeepScreenOn(target: window.Window, value: boolean): Promise<number> {
  return await promiseCode((): Promise<void> => target.setWindowKeepScreenOn(value));
}

async function setBrightness(target: window.Window, value: number): Promise<number> {
  return await promiseCode((): Promise<void> => target.setWindowBrightness(value));
}

async function setLayoutFullScreen(target: window.Window, value: boolean): Promise<number> {
  return await promiseCode((): Promise<void> => target.setWindowLayoutFullScreen(value));
}

export default function abilityWindowMatrixTest() {
  describe('AbilityWindowMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      await stopHome();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_0100
     * @tc.name      testWindowRectWidthPositive0001
     * @tc.desc      Check the main window width is a positive pixel count that spans at least one vp and never
     *               leaves the display
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowRectWidthPositive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const probe: WindowProbe = await openProbe();
      const rect: window.Rect = probe.rect();
      const screen: display.Display = defaultDisplay();
      const covered: boolean = rect.width >= screen.densityPixels;
      logCase('testWindowRectWidthPositive0001', `width=${rect.width} left=${rect.left} ` +
        `densityPixels=${screen.densityPixels} displayWidth=${screen.width} vpCovered=${covered}`);
      expect(rect.width >= MIN_SIDE_PX).assertTrue();
      expect(covered).assertTrue();
      expect(rect.width <= screen.width).assertTrue();
      expect(rect.left >= ORIGIN).assertTrue();
      expect(rect.width * rect.height > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_0200
     * @tc.name      testWindowRectHeightPositive0001
     * @tc.desc      Check the main window height is positive, covers at least one vp, stays inside the display
     *               and is never smaller than the drawable area hosted by the same window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowRectHeightPositive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const probe: WindowProbe = await openProbe();
      const rect: window.Rect = probe.rect();
      const drawable: window.Rect = probe.drawable();
      const screen: display.Display = defaultDisplay();
      logCase('testWindowRectHeightPositive0001', `height=${rect.height} drawableHeight=${drawable.height} ` +
        `top=${rect.top} displayHeight=${screen.height}`);
      expect(rect.height >= MIN_SIDE_PX).assertTrue();
      expect(rect.height >= screen.densityPixels).assertTrue();
      expect(rect.height >= drawable.height).assertTrue();
      expect(rect.height <= screen.height).assertTrue();
      expect(rect.top >= ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_0300
     * @tc.name      testWindowRectInsideDisplay0001
     * @tc.desc      Check every edge of the main window rectangle is contained by the default display rectangle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowRectInsideDisplay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const probe: WindowProbe = await openProbe();
      const rect: window.Rect = probe.rect();
      const screen: display.Display = defaultDisplay();
      const inside: boolean = rectInside(rect, fullRectOf(screen));
      logCase('testWindowRectInsideDisplay0001', `rect=${rect.left},${rect.top},${rect.width},${rect.height} ` +
        `inside=${inside} display=${screen.width}x${screen.height}`);
      expect(rectRight(rect) <= screen.width).assertTrue();
      expect(rectBottom(rect) <= screen.height).assertTrue();
      expect(rect.left >= ORIGIN).assertTrue();
      expect(rect.top >= ORIGIN).assertTrue();
      expect(rectArea(rect) <= screen.width * screen.height).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_0400
     * @tc.name      testWindowRectRepeatRead0001
     * @tc.desc      Read the window rectangle three times in a row and check the reads collapse into one single
     *               stable geometry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowRectRepeatRead0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const reads: window.Rect[] = [];
      for (let round = 0; round < REPEAT_READS; round++) {
        reads.push(probe.rect());
      }
      const widths: number[] = reads.map((item: window.Rect) => item.width);
      const distinctWidths: number = widths.filter((value: number, index: number) =>
        widths.indexOf(value) === index).length;
      logCase('testWindowRectRepeatRead0001', `reads=${reads.length} distinctWidths=${distinctWidths} ` +
        `first=${widths[0]} last=${widths[REPEAT_READS - 1]}`);
      expect(reads.length).assertEqual(REPEAT_READS);
      expect(distinctWidths).assertEqual(SINGLE_VALUE);
      expect(rectEqual(reads[0], reads[REPEAT_READS - 1])).assertTrue();
      expect(rectPositive(reads[0])).assertTrue();
      expect(rectInside(reads[0], fullRectOf(defaultDisplay()))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_0500
     * @tc.name      testWindowRectTwoHandles0001
     * @tc.desc      Ask for the main window twice and check both handles describe the very same window geometry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowRectTwoHandles0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const first: window.Window = await window.getLastWindow(ability.context);
      const second: window.Window = await window.getLastWindow(ability.context);
      const firstProps: window.WindowProperties = first.getWindowProperties();
      const secondProps: window.WindowProperties = second.getWindowProperties();
      logCase('testWindowRectTwoHandles0001', `firstId=${firstProps.id} secondId=${secondProps.id} ` +
        `equalRect=${rectEqual(firstProps.windowRect, secondProps.windowRect)}`);
      expect(firstProps.id).assertEqual(secondProps.id);
      expect(rectEqual(firstProps.windowRect, secondProps.windowRect)).assertTrue();
      expect(first.isWindowShowing()).assertTrue();
      expect(second.isWindowShowing()).assertTrue();
      expect(firstProps.displayId === secondProps.displayId).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_0600
     * @tc.name      testWindowRectDrawableInside0001
     * @tc.desc      Check the drawable rectangle of the main window is a positive rectangle nested inside the
     *               window rectangle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowRectDrawableInside0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const probe: WindowProbe = await openProbe();
      const rect: window.Rect = probe.rect();
      const drawable: window.Rect = probe.drawable();
      const nested: boolean = rectInside(drawable, rect);
      logCase('testWindowRectDrawableInside0001', `window=${rect.width}x${rect.height} ` +
        `drawable=${drawable.width}x${drawable.height} nested=${nested}`);
      expect(rectPositive(drawable)).assertTrue();
      expect(nested).assertTrue();
      expect(rectArea(drawable) <= rectArea(rect)).assertTrue();
      expect(drawable.width <= rect.width).assertTrue();
      expect(drawable.height <= rect.height).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_0700
     * @tc.name      testWindowRectDrawableArea0001
     * @tc.desc      Check the area the page can draw on keeps a sane share of the whole window instead of
     *               collapsing to a decoration only strip
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowRectDrawableArea0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const windowArea: number = rectArea(probe.rect());
      const drawableArea: number = rectArea(probe.drawable());
      const ratio: number = drawableArea / windowArea;
      logCase('testWindowRectDrawableArea0001', `windowArea=${windowArea} drawableArea=${drawableArea} ` +
        `ratio=${ratio}`);
      expect(windowArea > ORIGIN).assertTrue();
      expect(drawableArea > ORIGIN).assertTrue();
      expect(drawableArea <= windowArea).assertTrue();
      expect(ratio >= DRAWABLE_MIN_RATIO).assertTrue();
      expect(windowArea - drawableArea >= ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_0800
     * @tc.name      testWindowRectGlobalRect0001
     * @tc.desc      Read the global rectangle of the main window and check it is a positive rectangle rooted on
     *               the display
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowRectGlobalRect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const global: window.Rect = probe.main.getGlobalRect();
      const screen: display.Display = defaultDisplay();
      logCase('testWindowRectGlobalRect0001', `global=${global.left},${global.top},${global.width},` +
        `${global.height} display=${screen.width}x${screen.height}`);
      expect(rectPositive(global)).assertTrue();
      expect(global.left >= ORIGIN).assertTrue();
      expect(global.top >= ORIGIN).assertTrue();
      expect(rectRight(global) <= screen.width).assertTrue();
      expect(rectBottom(global) <= screen.height).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_0900
     * @tc.name      testWindowRectGlobalBounds0001
     * @tc.desc      Check the global rectangle is at least as large as the drawable rectangle and still fits the
     *               display
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowRectGlobalBounds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const global: window.Rect = probe.main.getGlobalRect();
      const drawable: window.Rect = probe.drawable();
      const screen: display.Display = defaultDisplay();
      logCase('testWindowRectGlobalBounds0001', `global=${global.width}x${global.height} ` +
        `drawable=${drawable.width}x${drawable.height} display=${screen.width}x${screen.height}`);
      expect(global.width >= drawable.width).assertTrue();
      expect(global.height >= drawable.height).assertTrue();
      expect(global.width <= screen.width).assertTrue();
      expect(global.height <= screen.height).assertTrue();
      expect(rectArea(global) >= rectArea(drawable)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_1000
     * @tc.name      testWindowRectAreaBudget0001
     * @tc.desc      Check the window area stays below the display area but still reserves a visible share of it
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowRectAreaBudget0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const windowArea: number = rectArea(probe.rect());
      const screen: display.Display = defaultDisplay();
      const displayArea: number = screen.width * screen.height;
      const share: number = displayArea / AREA_DIVISOR;
      logCase('testWindowRectAreaBudget0001', `windowArea=${windowArea} displayArea=${displayArea} ` +
        `minimumShare=${share}`);
      expect(windowArea <= displayArea).assertTrue();
      expect(windowArea >= share).assertTrue();
      expect(windowArea >= screen.densityPixels * screen.densityPixels).assertTrue();
      expect(probe.rect().height > ORIGIN).assertTrue();
      expect(probe.rect().width > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_1100
     * @tc.name      testWindowRectEdgesConsistent0001
     * @tc.desc      Check the right and bottom edges computed from origin plus size agree with the size fields and
     *               stay on the display
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowRectEdgesConsistent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const rect: window.Rect = probe.rect();
      const screen: display.Display = defaultDisplay();
      const right: number = rect.left + rect.width;
      const bottom: number = rect.top + rect.height;
      logCase('testWindowRectEdgesConsistent0001', `right=${right} bottom=${bottom} ` +
        `left=${rect.left} top=${rect.top}`);
      expect(right > rect.left).assertTrue();
      expect(right - rect.left).assertEqual(rect.width);
      expect(right <= screen.width).assertTrue();
      expect(bottom - rect.top).assertEqual(rect.height);
      expect(bottom <= screen.height).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_1200
     * @tc.name      testWindowRectIdleStable0001
     * @tc.desc      Let the main thread idle and check the window geometry and identity did not drift while the
     *               case was waiting
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowRectIdleStable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const before: WindowFacts = capture(probe.main);
      await sleepMs(IDLE_SETTLE_MS);
      const after: WindowFacts = capture(probe.main);
      logCase('testWindowRectIdleStable0001', `before=${before.width}x${before.height} ` +
        `after=${after.width}x${after.height} id=${after.id}`);
      expect(before.width).assertEqual(after.width);
      expect(before.height).assertEqual(after.height);
      expect(before.left).assertEqual(after.left);
      expect(before.id).assertEqual(after.id);
      expect(after.showing).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_1300
     * @tc.name      testWindowRectLimitsGuard0001
     * @tc.desc      Read the window limits and either verify the minimum and maximum pairs are ordered or accept a
     *               documented capability error on devices without the service
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowRectLimitsGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const limits: LimitProbe = limitsOf(probe.main);
      logCase('testWindowRectLimitsGuard0001', `code=${limits.code} minWidth=${limits.minWidth} ` +
        `maxWidth=${limits.maxWidth} minHeight=${limits.minHeight} maxHeight=${limits.maxHeight}`);
      expect(limits.code === OK_CODE || limits.code === ERR_CAPABILITY ||
        limits.code === ERR_WINDOW_STATE).assertTrue();
      if (limits.code === OK_CODE) {
        expect(limits.maxWidth >= limits.minWidth).assertTrue();
        expect(limits.maxHeight >= limits.minHeight).assertTrue();
        expect(limits.minWidth >= LIMIT_UNSET).assertTrue();
      } else {
        expect(limits.code > OK_CODE).assertTrue();
        expect(rectPositive(probe.rect())).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_1400
     * @tc.name      testWindowRectLimitEnvelope0001
     * @tc.desc      Check the live window rectangle respects the reported minimum and maximum window limits when the
     *               device publishes them
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowRectLimitEnvelope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const limits: LimitProbe = limitsOf(probe.main);
      const rect: window.Rect = probe.rect();
      logCase('testWindowRectLimitEnvelope0001', `code=${limits.code} rect=${rect.width}x${rect.height} ` +
        `min=${limits.minWidth}x${limits.minHeight} max=${limits.maxWidth}x${limits.maxHeight}`);
      expect(limits.code === OK_CODE || limits.code === ERR_CAPABILITY ||
        limits.code === ERR_WINDOW_STATE).assertTrue();
      if (limits.code === OK_CODE) {
        expect(limits.maxWidth === LIMIT_UNSET || rect.width <= limits.maxWidth).assertTrue();
        expect(limits.maxHeight === LIMIT_UNSET || rect.height <= limits.maxHeight).assertTrue();
        expect(rect.width >= limits.minWidth).assertTrue();
        expect(rect.height >= limits.minHeight).assertTrue();
      } else {
        expect(rect.width >= MIN_SIDE_PX).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_1500
     * @tc.name      testWindowRectRelaunchSize0001
     * @tc.desc      Kill and relaunch the ability and check the freshly created main window keeps the same window
     *               size while being a live window again
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowRectRelaunchSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: WindowProbe = await openProbe();
      const before: window.Rect = first.rect();
      const second: WindowProbe = await openProbe();
      const after: window.Rect = second.rect();
      logCase('testWindowRectRelaunchSize0001', `before=${before.width}x${before.height} ` +
        `after=${after.width}x${after.height} showing=${second.showing()}`);
      expect(after.width).assertEqual(before.width);
      expect(after.height).assertEqual(before.height);
      expect(rectPositive(after)).assertTrue();
      expect(second.showing()).assertTrue();
      expect(second.props().id >= ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_1600
     * @tc.name      testWindowShownFlag0001
     * @tc.desc      Check the launched main window reports itself visible, carries a valid identity, has a usable
     *               rectangle and already painted the page text
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowShownFlag0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const probe: WindowProbe = await openProbe();
      const statusCode: number = syncCode((): number => probe.status());
      const page: boolean = await pageRootVisible();
      const props: window.WindowProperties = probe.props();
      logCase('testWindowShownFlag0001', `showing=${probe.showing()} statusCode=${statusCode} ` +
        `id=${props.id} page=${page}`);
      expect(probe.showing()).assertTrue();
      expect(props.id >= ORIGIN).assertTrue();
      expect(rectPositive(props.windowRect)).assertTrue();
      expect(page).assertTrue();
      expect(statusCode === OK_CODE || statusCode === ERR_CAPABILITY).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_1700
     * @tc.name      testWindowShownTopHandle0001
     * @tc.desc      Compare the window returned by getLastWindow with the one returned by getTopWindow and check both
     *               handles point at the same visible window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowShownTopHandle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const top: window.Window = await window.getTopWindow(ability.context);
      const mainProps: window.WindowProperties = main.getWindowProperties();
      const topProps: window.WindowProperties = top.getWindowProperties();
      logCase('testWindowShownTopHandle0001', `mainId=${mainProps.id} topId=${topProps.id} ` +
        `mainShowing=${main.isWindowShowing()} topShowing=${top.isWindowShowing()}`);
      expect(main.isWindowShowing()).assertTrue();
      expect(top.isWindowShowing()).assertTrue();
      expect(topProps.id).assertEqual(mainProps.id);
      expect(topProps.type).assertEqual(mainProps.type);
      expect(topProps.windowRect.width > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_1800
     * @tc.name      testWindowShownBooleanType0001
     * @tc.desc      Check the visibility query is a plain boolean that stays true over an idle gap
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowShownBooleanType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const first: boolean = probe.showing();
      const kind: string = typeof first;
      await sleepMs(IDLE_SETTLE_MS);
      const second: boolean = probe.showing();
      logCase('testWindowShownBooleanType0001', `kind=${kind} first=${first} second=${second} ` +
        `id=${probe.props().id}`);
      expect(kind).assertEqual(BOOLEAN_TYPE);
      expect(first).assertEqual(second);
      expect(second).assertTrue();
      expect(probe.props().id >= ORIGIN).assertTrue();
      expect(probe.rect().width >= MIN_SIDE_PX).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_1900
     * @tc.name      testWindowShownNotMinimized0001
     * @tc.desc      Check a foreground ability is not reported in the minimized window status and still owns a
     *               positive rectangle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowShownNotMinimized0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const statusCode: number = syncCode((): number => probe.status());
      const status: number = probe.statusSafe();
      logCase('testWindowShownNotMinimized0001', `statusCode=${statusCode} status=${status} ` +
        `showing=${probe.showing()}`);
      expect(statusCode === OK_CODE || statusCode === ERR_CAPABILITY).assertTrue();
      if (statusCode === OK_CODE) {
        expect(status === Number(window.WindowStatusType.MINIMIZE)).assertFalse();
        expect(knownStatus(status)).assertTrue();
      }
      expect(probe.showing()).assertTrue();
      expect(rectPositive(probe.rect())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_2000
     * @tc.name      testWindowShownRepeatedLaunch0001
     * @tc.desc      Launch the ability twice and check both created main windows are visible, have an identity and a
     *               positive width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowShownRepeatedLaunch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flags: boolean[] = [];
      const ids: number[] = [];
      const widths: number[] = [];
      for (let round = 0; round < LAUNCH_ROUNDS; round++) {
        const ability: UIAbility = await launchHome();
        const win: window.Window = await window.getLastWindow(ability.context);
        flags.push(win.isWindowShowing());
        ids.push(win.getWindowProperties().id);
        widths.push(win.getWindowProperties().windowRect.width);
      }
      logCase('testWindowShownRepeatedLaunch0001', `rounds=${flags.length} flags=${flags.join(',')} ` +
        `ids=${ids.join(',')} widths=${widths.join(',')}`);
      expect(flags.length).assertEqual(LAUNCH_ROUNDS);
      expect(flags.every((value: boolean) => value)).assertTrue();
      expect(ids.every((value: number) => value >= ORIGIN)).assertTrue();
      expect(widths.every((value: number) => value >= MIN_SIDE_PX)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_2100
     * @tc.name      testWindowShownAfterRelaunch0001
     * @tc.desc      Snapshot the window, relaunch the ability and check the replacement main window is visible with
     *               the same width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowShownAfterRelaunch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: WindowProbe = await openProbe();
      const before: WindowFacts = capture(first.main);
      const second: WindowProbe = await openProbe();
      const after: WindowFacts = capture(second.main);
      logCase('testWindowShownAfterRelaunch0001', `beforeShowing=${before.showing} ` +
        `afterShowing=${after.showing} beforeWidth=${before.width} afterWidth=${after.width}`);
      expect(before.showing).assertTrue();
      expect(after.showing).assertTrue();
      expect(after.width).assertEqual(before.width);
      expect(after.code).assertEqual(OK_CODE);
      expect(after.id >= ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_2200
     * @tc.name      testWindowShownPagesLoaded0001
     * @tc.desc      Check the visible main window really hosts the loaded page, its drawable area and a known window
     *               type
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowShownPagesLoaded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const page: boolean = await pageRootVisible();
      const drawable: window.Rect = probe.drawable();
      const windowType: number = Number(probe.props().type);
      logCase('testWindowShownPagesLoaded0001', `page=${page} showing=${probe.showing()} ` +
        `drawable=${drawable.width}x${drawable.height} type=${windowType}`);
      expect(page).assertTrue();
      expect(probe.showing()).assertTrue();
      expect(rectPositive(drawable)).assertTrue();
      expect(probe.props().id >= ORIGIN).assertTrue();
      expect(knownWindowType(windowType)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_2300
     * @tc.name      testWindowShownDrawablePositive0001
     * @tc.desc      Check a visible window always exposes a non empty drawable rectangle inside the window and the
     *               display
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowShownDrawablePositive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const drawable: window.Rect = probe.drawable();
      const rect: window.Rect = probe.rect();
      const screen: display.Display = defaultDisplay();
      logCase('testWindowShownDrawablePositive0001', `drawable=${drawable.width}x${drawable.height} ` +
        `window=${rect.width}x${rect.height} display=${screen.width}x${screen.height}`);
      expect(probe.showing()).assertTrue();
      expect(drawable.width > ORIGIN).assertTrue();
      expect(drawable.height > ORIGIN).assertTrue();
      expect(rectInside(drawable, rect)).assertTrue();
      expect(drawable.width <= screen.width).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_2400
     * @tc.name      testWindowStatusKnown0001
     * @tc.desc      Check the window status enum value reported for the main window belongs to the declared enum
     *               range and is not a negative placeholder
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowStatusKnown0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const statusCode: number = syncCode((): number => probe.status());
      const status: number = probe.statusSafe();
      const withinEnum: boolean = knownStatus(status);
      logCase('testWindowStatusKnown0001', `code=${statusCode} status=${status} known=${withinEnum}`);
      expect(tolerantCode(statusCode)).assertTrue();
      if (statusCode === OK_CODE) {
        expect(status >= ORIGIN).assertTrue();
        expect(status <= Number(window.WindowStatusType.SPLIT_SCREEN)).assertTrue();
        expect(withinEnum).assertTrue();
      }
      expect(probe.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_2500
     * @tc.name      testWindowStatusStable0001
     * @tc.desc      Sample the window status three times and check it never changes while the window is foreground
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowStatusStable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const samples: number[] = [];
      for (let round = 0; round < REPEAT_READS; round++) {
        samples.push(probe.statusSafe());
        await sleepMs(50);
      }
      const distinct: number = samples.filter((value: number, index: number) =>
        samples.indexOf(value) === index).length;
      logCase('testWindowStatusStable0001', `samples=${samples.join(',')} distinct=${distinct} ` +
        `id=${probe.props().id}`);
      expect(samples.length).assertEqual(REPEAT_READS);
      expect(distinct).assertEqual(SINGLE_VALUE);
      expect(samples[0] === MISSING_ID || knownStatus(samples[0])).assertTrue();
      expect(probe.rect().width > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_2600
     * @tc.name      testWindowStatusCoverage0001
     * @tc.desc      Check that a full screen or maximized window status is backed by a window rectangle spanning the
     *               whole display width from the origin
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowStatusCoverage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const status: number = probe.statusSafe();
      const rect: window.Rect = probe.rect();
      const screen: display.Display = defaultDisplay();
      const wide: boolean = status === Number(window.WindowStatusType.FULL_SCREEN) ||
        status === Number(window.WindowStatusType.MAXIMIZE);
      logCase('testWindowStatusCoverage0001', `status=${status} wide=${wide} width=${rect.width} ` +
        `displayWidth=${screen.width} left=${rect.left}`);
      expect(knownStatus(status) || status === MISSING_ID).assertTrue();
      if (wide) {
        expect(rect.width).assertEqual(screen.width);
        expect(rect.left).assertEqual(ORIGIN);
      }
      expect(probe.showing()).assertTrue();
      expect(rectPositive(rect)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_2700
     * @tc.name      testWindowStatusTwoHandles0001
     * @tc.desc      Check the last window and the top window of the same ability agree on the window status and both
     *               report a declared status value
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowStatusTwoHandles0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const top: window.Window = await window.getTopWindow(ability.context);
      const mainStatus: number = safeStatus(main);
      const topStatus: number = safeStatus(top);
      logCase('testWindowStatusTwoHandles0001', `mainStatus=${mainStatus} topStatus=${topStatus} ` +
        `equal=${mainStatus === topStatus}`);
      expect(mainStatus).assertEqual(topStatus);
      expect(mainStatus === MISSING_ID || mainStatus >= ORIGIN).assertTrue();
      expect(mainStatus === MISSING_ID || knownStatus(mainStatus)).assertTrue();
      expect(main.isWindowShowing() && top.isWindowShowing()).assertTrue();
      expect(top.getWindowProperties().windowRect.height > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_2800
     * @tc.name      testWindowModeGlobalBits0001
     * @tc.desc      Query the global window mode and check the returned bit mask carries at least one declared mode
     *               bit and no more bits than the enum publishes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowModeGlobalBits0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const mode: ModeProbe = await globalMode();
      const bits: number = knownModeBitCount(mode.mode);
      logCase('testWindowModeGlobalBits0001', `code=${mode.code} mode=${mode.mode} bits=${bits} ` +
        `enumBits=${MODE_BITS.length}`);
      expect(tolerantCode(mode.code)).assertTrue();
      if (mode.code === OK_CODE) {
        expect(mode.mode > ORIGIN).assertTrue();
        expect(bits >= SINGLE_VALUE).assertTrue();
        expect(bits <= MODE_BITS.length).assertTrue();
      } else {
        expect(mode.code > OK_CODE).assertTrue();
      }
      expect(probe.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_2900
     * @tc.name      testWindowModeDisplayScoped0001
     * @tc.desc      Query the global window mode once without a display and once scoped to the default display and
     *               check both queries describe the same mode
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowModeDisplayScoped0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const global: ModeProbe = await globalMode();
      const scoped: ModeProbe = await scopedMode(defaultDisplay().id);
      const bothSucceeded: boolean = global.code === OK_CODE && scoped.code === OK_CODE;
      logCase('testWindowModeDisplayScoped0001', `globalCode=${global.code} scopedCode=${scoped.code} ` +
        `globalMode=${global.mode} scopedMode=${scoped.mode}`);
      expect(tolerantCode(global.code)).assertTrue();
      expect(tolerantCode(scoped.code)).assertTrue();
      if (bothSucceeded) {
        expect(scoped.mode).assertEqual(global.mode);
        expect(knownModeBitCount(scoped.mode) >= SINGLE_VALUE).assertTrue();
      } else {
        expect(global.code > OK_CODE || scoped.code > OK_CODE).assertTrue();
      }
      expect(probe.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_3000
     * @tc.name      testWindowModeMaskBound0001
     * @tc.desc      Check the global window mode mask fits the four declared mode bits instead of leaking unrelated
     *               flag bits
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowModeMaskBound0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const mode: ModeProbe = await globalMode();
      const rect: window.Rect = probe.rect();
      logCase('testWindowModeMaskBound0001', `code=${mode.code} mode=${mode.mode} ` +
        `maskBound=${MAX_MODE_MASK} rect=${rect.width}x${rect.height}`);
      expect(tolerantCode(mode.code)).assertTrue();
      if (mode.code === OK_CODE) {
        expect(mode.mode >= SINGLE_VALUE).assertTrue();
        expect(mode.mode < MAX_MODE_MASK).assertTrue();
        expect(knownModeBitCount(mode.mode) >= SINGLE_VALUE).assertTrue();
      }
      expect(probe.showing()).assertTrue();
      expect(rectPositive(rect)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_3100
     * @tc.name      testWindowModeBadDisplayId0001
     * @tc.desc      Ask for the window mode of a display id that does not exist and check the failure is a declared
     *               error code while the real window keeps working
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowModeBadDisplayId0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const bad: ModeProbe = await scopedMode(BAD_DISPLAY_ID);
      const valid: ModeProbe = await globalMode();
      const allowed: number[] = [OK_CODE, ERR_CAPABILITY, ERR_BAD_PARAM, ERR_WMS, ERR_PARAM];
      logCase('testWindowModeBadDisplayId0001', `badCode=${bad.code} badMode=${bad.mode} ` +
        `validCode=${valid.code} validMode=${valid.mode}`);
      expect(allowed.indexOf(bad.code) >= 0).assertTrue();
      expect(tolerantCode(valid.code)).assertTrue();
      expect(probe.showing()).assertTrue();
      expect(rectPositive(probe.rect())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_3200
     * @tc.name      testWindowPreferredOrientation0001
     * @tc.desc      Read the preferred orientation of the main window and check it is one of the declared window
     *               orientation values
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowPreferredOrientation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const orientation: OrientationProbe = preferredOrientationOf(probe.main);
      const declared: boolean = PREFERRED_ORIENTATIONS.indexOf(orientation.value) >= 0;
      logCase('testWindowPreferredOrientation0001', `code=${orientation.code} value=${orientation.value} ` +
        `declared=${declared}`);
      expect(tolerantCode(orientation.code)).assertTrue();
      if (orientation.code === OK_CODE) {
        expect(orientation.value >= ORIGIN).assertTrue();
        expect(declared).assertTrue();
        expect(orientation.value <= MAX_PREFERRED_ORIENTATION).assertTrue();
      } else {
        expect(orientation.code > OK_CODE).assertTrue();
      }
      expect(probe.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_3300
     * @tc.name      testWindowPreferredOrientationRange0001
     * @tc.desc      Check the preferred orientation stays inside the enum range and does not drift between two
     *               consecutive reads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowPreferredOrientationRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const first: OrientationProbe = preferredOrientationOf(probe.main);
      const second: OrientationProbe = preferredOrientationOf(probe.main);
      logCase('testWindowPreferredOrientationRange0001', `first=${first.value} second=${second.value} ` +
        `range=${ORIGIN}..${MAX_PREFERRED_ORIENTATION}`);
      expect(first.value).assertEqual(second.value);
      expect(first.value >= ORIGIN).assertTrue();
      expect(first.value <= MAX_PREFERRED_ORIENTATION).assertTrue();
      expect(first.value <= Number(window.Orientation.FOLLOW_DESKTOP)).assertTrue();
      expect(rectPositive(probe.rect())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_3400
     * @tc.name      testWindowLayoutFullScreenToggle0001
     * @tc.desc      Switch the layout full screen flag on and off and check the window property follows the request
     *               on devices that support the call
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowLayoutFullScreenToggle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const raisedCode: number = await setLayoutFullScreen(probe.main, true);
      await sleepMs(PROP_SETTLE_MS);
      const raised: boolean = probe.props().isLayoutFullScreen;
      const loweredCode: number = await setLayoutFullScreen(probe.main, false);
      await sleepMs(PROP_SETTLE_MS);
      const lowered: boolean = probe.props().isLayoutFullScreen;
      logCase('testWindowLayoutFullScreenToggle0001', `raisedCode=${raisedCode} raised=${raised} ` +
        `loweredCode=${loweredCode} lowered=${lowered}`);
      expect(tolerantCode(raisedCode)).assertTrue();
      expect(tolerantCode(loweredCode)).assertTrue();
      if (raisedCode === OK_CODE && loweredCode === OK_CODE) {
        expect(raised).assertTrue();
        expect(lowered).assertFalse();
      } else {
        expect(raisedCode === ERR_CAPABILITY || raisedCode === ERR_WINDOW_STATE).assertTrue();
      }
      expect(probe.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_3500
     * @tc.name      testWindowLayoutFullScreenRestore0001
     * @tc.desc      Flip the layout full screen flag and put the captured original value back, then verify the
     *               property returned to its starting state
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowLayoutFullScreenRestore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const original: boolean = probe.props().isLayoutFullScreen;
      const flippedCode: number = await setLayoutFullScreen(probe.main, !original);
      await sleepMs(PROP_SETTLE_MS);
      const restoreCode: number = await setLayoutFullScreen(probe.main, original);
      await sleepMs(PROP_SETTLE_MS);
      const final: boolean = probe.props().isLayoutFullScreen;
      logCase('testWindowLayoutFullScreenRestore0001', `original=${original} flippedCode=${flippedCode} ` +
        `restoreCode=${restoreCode} final=${final}`);
      expect(tolerantCode(flippedCode)).assertTrue();
      expect(tolerantCode(restoreCode)).assertTrue();
      expect(final).assertEqual(original);
      expect(probe.showing()).assertTrue();
      expect(rectPositive(probe.rect())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_3600
     * @tc.name      testWindowLayoutFullScreenDefault0001
     * @tc.desc      Check the two full screen flags of the main window are plain booleans that stay stable while the
     *               drawable area remains nested in the window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowLayoutFullScreenDefault0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const layoutFirst: boolean = probe.props().isLayoutFullScreen;
      const screenFirst: boolean = probe.props().isFullScreen;
      await sleepMs(IDLE_SETTLE_MS);
      const layoutSecond: boolean = probe.props().isLayoutFullScreen;
      const screenSecond: boolean = probe.props().isFullScreen;
      logCase('testWindowLayoutFullScreenDefault0001', `layout=${layoutFirst}/${layoutSecond} ` +
        `full=${screenFirst}/${screenSecond}`);
      expect(typeof layoutFirst).assertEqual(BOOLEAN_TYPE);
      expect(typeof screenFirst).assertEqual(BOOLEAN_TYPE);
      expect(layoutFirst).assertEqual(layoutSecond);
      expect(screenFirst).assertEqual(screenSecond);
      expect(rectInside(probe.drawable(), probe.rect())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_3700
     * @tc.name      testWindowKeepScreenOnEnable0001
     * @tc.desc      Turn keep screen on for the main window and check the property becomes true while the original
     *               value is restored afterwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowKeepScreenOnEnable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const original: boolean = probe.props().isKeepScreenOn;
      const enableCode: number = await setKeepScreenOn(probe.main, true);
      await sleepMs(PROP_SETTLE_MS);
      const enabled: boolean = probe.props().isKeepScreenOn;
      const restoreCode: number = await setKeepScreenOn(probe.main, original);
      logCase('testWindowKeepScreenOnEnable0001', `original=${original} enableCode=${enableCode} ` +
        `enabled=${enabled} restoreCode=${restoreCode}`);
      expect(tolerantCode(enableCode)).assertTrue();
      if (enableCode === OK_CODE) {
        expect(enabled).assertTrue();
      } else {
        expect(enableCode === ERR_CAPABILITY || enableCode === ERR_WINDOW_STATE).assertTrue();
      }
      expect(tolerantCode(restoreCode)).assertTrue();
      expect(probe.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_3800
     * @tc.name      testWindowKeepScreenOnDisable0001
     * @tc.desc      Turn keep screen on off explicitly and check the window reports the flag cleared before the
     *               captured value is put back
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowKeepScreenOnDisable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const original: boolean = probe.props().isKeepScreenOn;
      const disableCode: number = await setKeepScreenOn(probe.main, false);
      await sleepMs(PROP_SETTLE_MS);
      const disabled: boolean = probe.props().isKeepScreenOn;
      const restoreCode: number = await setKeepScreenOn(probe.main, original);
      logCase('testWindowKeepScreenOnDisable0001', `original=${original} disableCode=${disableCode} ` +
        `disabled=${disabled} restoreCode=${restoreCode}`);
      expect(tolerantCode(disableCode)).assertTrue();
      if (disableCode === OK_CODE) {
        expect(disabled).assertFalse();
      }
      expect(tolerantCode(restoreCode)).assertTrue();
      expect(rectPositive(probe.rect())).assertTrue();
      expect(probe.props().id >= ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_3900
     * @tc.name      testWindowKeepScreenOnRestore0001
     * @tc.desc      Record keep screen on, invert it, restore it and check the final property and window identity
     *               survive the round trip
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowKeepScreenOnRestore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const before: WindowFacts = capture(probe.main);
      const flipCode: number = await setKeepScreenOn(probe.main, !before.keepScreenOn);
      await sleepMs(PROP_SETTLE_MS);
      const backCode: number = await setKeepScreenOn(probe.main, before.keepScreenOn);
      await sleepMs(PROP_SETTLE_MS);
      const after: WindowFacts = capture(probe.main);
      logCase('testWindowKeepScreenOnRestore0001', `before=${before.keepScreenOn} flipCode=${flipCode} ` +
        `backCode=${backCode} after=${after.keepScreenOn}`);
      expect(tolerantCode(flipCode)).assertTrue();
      expect(tolerantCode(backCode)).assertTrue();
      expect(after.keepScreenOn).assertEqual(before.keepScreenOn);
      expect(after.id).assertEqual(before.id);
      expect(after.showing).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_4000
     * @tc.name      testWindowKeepScreenOnProperty0001
     * @tc.desc      Check the keep screen on property is a boolean that does not change on its own and does not
     *               disturb the window geometry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowKeepScreenOnProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const first: boolean = probe.props().isKeepScreenOn;
      const kind: string = typeof first;
      await sleepMs(IDLE_SETTLE_MS);
      const second: boolean = probe.props().isKeepScreenOn;
      const rect: window.Rect = probe.rect();
      logCase('testWindowKeepScreenOnProperty0001', `kind=${kind} first=${first} second=${second} ` +
        `rect=${rect.width}x${rect.height}`);
      expect(kind).assertEqual(BOOLEAN_TYPE);
      expect(first).assertEqual(second);
      expect(rectPositive(rect)).assertTrue();
      expect(probe.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_4100
     * @tc.name      testWindowBrightnessMid0001
     * @tc.desc      Set the main window brightness to the middle of the range and check the property follows, then
     *               restore the system default
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowBrightnessMid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const setCode: number = await setBrightness(probe.main, BRIGHTNESS_MID);
      await sleepMs(PROP_SETTLE_MS);
      const level: number = probe.props().brightness;
      const restoreCode: number = await setBrightness(probe.main, DEFAULT_BRIGHTNESS);
      logCase('testWindowBrightnessMid0001', `setCode=${setCode} level=${level} ` +
        `expected=${BRIGHTNESS_MID} restoreCode=${restoreCode}`);
      expect(tolerantCode(setCode)).assertTrue();
      if (setCode === OK_CODE) {
        expect(aboutEqual(level, BRIGHTNESS_MID)).assertTrue();
      } else {
        expect(setCode === ERR_WINDOW_STATE || setCode === ERR_WMS).assertTrue();
      }
      expect(tolerantCode(restoreCode)).assertTrue();
      expect(inBrightnessRange(probe.props().brightness)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_4200
     * @tc.name      testWindowBrightnessRestore0001
     * @tc.desc      Change the window brightness and hand the window back to the system default, then check the
     *               reported level is a legal brightness again
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowBrightnessRestore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const before: number = probe.props().brightness;
      const setCode: number = await setBrightness(probe.main, BRIGHTNESS_MID);
      await sleepMs(PROP_SETTLE_MS);
      const restoreCode: number = await setBrightness(probe.main, DEFAULT_BRIGHTNESS);
      await sleepMs(PROP_SETTLE_MS);
      const after: number = probe.props().brightness;
      logCase('testWindowBrightnessRestore0001', `before=${before} setCode=${setCode} ` +
        `restoreCode=${restoreCode} after=${after}`);
      expect(inBrightnessRange(before)).assertTrue();
      expect(tolerantCode(setCode)).assertTrue();
      expect(tolerantCode(restoreCode)).assertTrue();
      expect(inBrightnessRange(after)).assertTrue();
      expect(probe.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_4300
     * @tc.name      testWindowBrightnessRamp0001
     * @tc.desc      Raise the window brightness in two steps and check the reported level never moves backwards
     *               between the steps
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowBrightnessRamp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const lowCode: number = await setBrightness(probe.main, BRIGHTNESS_LOW);
      await sleepMs(PROP_SETTLE_MS);
      const lowLevel: number = probe.props().brightness;
      const midCode: number = await setBrightness(probe.main, BRIGHTNESS_MID);
      await sleepMs(PROP_SETTLE_MS);
      const midLevel: number = probe.props().brightness;
      const restoreCode: number = await setBrightness(probe.main, DEFAULT_BRIGHTNESS);
      logCase('testWindowBrightnessRamp0001', `lowCode=${lowCode} low=${lowLevel} midCode=${midCode} ` +
        `mid=${midLevel} restoreCode=${restoreCode}`);
      expect(tolerantCode(lowCode)).assertTrue();
      expect(tolerantCode(midCode)).assertTrue();
      if (lowCode === OK_CODE && midCode === OK_CODE) {
        expect(lowLevel <= midLevel).assertTrue();
        expect(aboutEqual(midLevel, BRIGHTNESS_MID)).assertTrue();
      }
      expect(tolerantCode(restoreCode)).assertTrue();
      expect(inBrightnessRange(probe.props().brightness)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_4400
     * @tc.name      testWindowBrightnessFull0001
     * @tc.desc      Drive the window brightness to the maximum of the legal range and check the reported level is the
     *               brightest legal value
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowBrightnessFull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const before: WindowFacts = capture(probe.main);
      const setCode: number = await setBrightness(probe.main, BRIGHTNESS_FULL);
      await sleepMs(PROP_SETTLE_MS);
      const after: WindowFacts = capture(probe.main);
      const restoreCode: number = await setBrightness(probe.main, DEFAULT_BRIGHTNESS);
      logCase('testWindowBrightnessFull0001', `before=${before.brightness} setCode=${setCode} ` +
        `after=${after.brightness} ceiling=${BRIGHTNESS_FULL} restoreCode=${restoreCode}`);
      expect(tolerantCode(setCode)).assertTrue();
      if (setCode === OK_CODE) {
        expect(aboutEqual(after.brightness, BRIGHTNESS_FULL)).assertTrue();
        expect(after.id).assertEqual(before.id);
      }
      expect(after.brightness <= BRIGHTNESS_FULL).assertTrue();
      expect(tolerantCode(restoreCode)).assertTrue();
      expect(after.showing).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_4500
     * @tc.name      testWindowBrightnessZero0001
     * @tc.desc      Drive the window brightness to the bottom of the legal range and check the reported level reaches
     *               zero without going negative
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowBrightnessZero0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const setCode: number = await setBrightness(probe.main, BRIGHTNESS_ZERO);
      await sleepMs(PROP_SETTLE_MS);
      const level: number = probe.props().brightness;
      const restoreCode: number = await setBrightness(probe.main, DEFAULT_BRIGHTNESS);
      logCase('testWindowBrightnessZero0001', `setCode=${setCode} level=${level} ` +
        `floor=${BRIGHTNESS_ZERO} restoreCode=${restoreCode}`);
      expect(tolerantCode(setCode)).assertTrue();
      if (setCode === OK_CODE) {
        expect(aboutEqual(level, BRIGHTNESS_ZERO)).assertTrue();
        expect(level <= BRIGHTNESS_LOW).assertTrue();
      }
      expect(tolerantCode(restoreCode)).assertTrue();
      expect(probe.props().brightness >= DEFAULT_BRIGHTNESS).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_4600
     * @tc.name      testWindowBrightnessOverRange0001
     * @tc.desc      Ask for a brightness above one and check the call is either rejected with a declared code or
     *               clamped to the legal maximum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowBrightnessOverRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const setCode: number = await setBrightness(probe.main, BRIGHTNESS_OVER);
      await sleepMs(PROP_SETTLE_MS);
      const level: number = probe.props().brightness;
      const restoreCode: number = await setBrightness(probe.main, DEFAULT_BRIGHTNESS);
      logCase('testWindowBrightnessOverRange0001', `setCode=${setCode} level=${level} ` +
        `requested=${BRIGHTNESS_OVER} restoreCode=${restoreCode}`);
      expect(tolerantCode(setCode)).assertTrue();
      expect(setCode === OK_CODE || setCode === ERR_PARAM || setCode === ERR_WINDOW_STATE).assertTrue();
      expect(level <= BRIGHTNESS_FULL).assertTrue();
      expect(inBrightnessRange(level)).assertTrue();
      expect(tolerantCode(restoreCode)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_4700
     * @tc.name      testWindowBrightnessUnderRange0001
     * @tc.desc      Ask for a brightness below minus one and check the request is rejected or clamped while the
     *               window keeps a legal brightness
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowBrightnessUnderRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const setCode: number = await setBrightness(probe.main, BRIGHTNESS_UNDER);
      await sleepMs(PROP_SETTLE_MS);
      const level: number = probe.props().brightness;
      const rejected: boolean = setCode === ERR_PARAM || setCode === ERR_WINDOW_STATE || setCode === ERR_WMS;
      logCase('testWindowBrightnessUnderRange0001', `setCode=${setCode} level=${level} ` +
        `requested=${BRIGHTNESS_UNDER} rejected=${rejected}`);
      expect(tolerantCode(setCode)).assertTrue();
      expect(rejected || setCode === OK_CODE).assertTrue();
      expect(level >= DEFAULT_BRIGHTNESS).assertTrue();
      expect(probe.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_4800
     * @tc.name      testWindowBrightnessDefaultRange0001
     * @tc.desc      Check the untouched window brightness starts inside the legal range and does not drift on its own
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowBrightnessDefaultRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const first: number = probe.props().brightness;
      await sleepMs(IDLE_SETTLE_MS);
      const second: number = probe.props().brightness;
      logCase('testWindowBrightnessDefaultRange0001', `first=${first} second=${second} ` +
        `range=${DEFAULT_BRIGHTNESS}..${BRIGHTNESS_FULL}`);
      expect(inBrightnessRange(first)).assertTrue();
      expect(second).assertEqual(first);
      expect(second <= BRIGHTNESS_FULL).assertTrue();
      expect(second >= DEFAULT_BRIGHTNESS).assertTrue();
      expect(rectPositive(probe.rect())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_4900
     * @tc.name      testWindowBrightnessRepeatSet0001
     * @tc.desc      Write two different window brightness values one after another and check the later write wins and
     *               the default is restored afterwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowBrightnessRepeatSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const firstCode: number = await setBrightness(probe.main, BRIGHTNESS_STEP);
      await sleepMs(PROP_SETTLE_MS);
      const firstLevel: number = probe.props().brightness;
      const secondCode: number = await setBrightness(probe.main, BRIGHTNESS_HIGH);
      await sleepMs(PROP_SETTLE_MS);
      const secondLevel: number = probe.props().brightness;
      const restoreCode: number = await setBrightness(probe.main, DEFAULT_BRIGHTNESS);
      logCase('testWindowBrightnessRepeatSet0001', `first=${firstLevel} (${firstCode}) ` +
        `second=${secondLevel} (${secondCode}) restoreCode=${restoreCode}`);
      expect(tolerantCode(firstCode)).assertTrue();
      expect(tolerantCode(secondCode)).assertTrue();
      if (firstCode === OK_CODE && secondCode === OK_CODE) {
        expect(secondLevel >= firstLevel).assertTrue();
        expect(aboutEqual(secondLevel, BRIGHTNESS_HIGH)).assertTrue();
      }
      expect(tolerantCode(restoreCode)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_5000
