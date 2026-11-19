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
     * @tc.name      testWindowAvoidSystemRect0001
     * @tc.desc      Read the system avoid area of the main window and check each of its four side rectangles stays
     *               inside the window bounds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowAvoidSystemRect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const area: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_SYSTEM);
      const rect: window.Rect = probe.rect();
      logCase('testWindowAvoidSystemRect0001', `top=${area.topRect.height} bottom=${area.bottomRect.height} ` +
        `left=${area.leftRect.width} right=${area.rightRect.width} window=${rect.width}x${rect.height}`);
      expect(area.topRect.width <= rect.width).assertTrue();
      expect(area.topRect.height <= rect.height).assertTrue();
      expect(area.bottomRect.height <= rect.height).assertTrue();
      expect(area.leftRect.width <= rect.width).assertTrue();
      expect(area.rightRect.width <= rect.width).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_5100
     * @tc.name      testWindowAvoidSystemFlag0001
     * @tc.desc      Check the system avoid area exposes a stable boolean visibility flag and a top band that sits on
     *               the display
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowAvoidSystemFlag0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const first: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_SYSTEM);
      const second: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_SYSTEM);
      const screen: display.Display = defaultDisplay();
      logCase('testWindowAvoidSystemFlag0001', `visible=${first.visible} ` +
        `top=${first.topRect.width}x${first.topRect.height} bottomHeight=${first.bottomRect.height}`);
      expect(typeof first.visible).assertEqual(BOOLEAN_TYPE);
      expect(first.visible).assertEqual(second.visible);
      expect(first.topRect.width >= ORIGIN).assertTrue();
      expect(rectInside(first.topRect, fullRectOf(screen))).assertTrue();
      expect(rectEqual(first.topRect, second.topRect)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_5200
     * @tc.name      testWindowAvoidCutout0001
     * @tc.desc      Read the cutout avoid area and check none of its side rectangles overflows the display
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowAvoidCutout0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const area: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_CUTOUT);
      const screen: display.Display = defaultDisplay();
      logCase('testWindowAvoidCutout0001', `visible=${area.visible} width=${area.topRect.width} ` +
        `height=${area.topRect.height} display=${screen.width}x${screen.height}`);
      expect(area.topRect.width <= screen.width).assertTrue();
      expect(area.topRect.height <= screen.height).assertTrue();
      expect(area.leftRect.width <= screen.width).assertTrue();
      expect(area.rightRect.width <= screen.width).assertTrue();
      expect(area.bottomRect.height <= screen.height).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_5300
     * @tc.name      testWindowAvoidNavigation0001
     * @tc.desc      Read the navigation indicator avoid area and check its bottom band is a legal strip of the display
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowAvoidNavigation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const area: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
      const screen: display.Display = defaultDisplay();
      const rect: window.Rect = probe.rect();
      logCase('testWindowAvoidNavigation0001', `height=${area.bottomRect.height} ` +
        `width=${area.bottomRect.width} top=${area.bottomRect.top} windowHeight=${rect.height}`);
      expect(area.bottomRect.height >= ORIGIN).assertTrue();
      expect(area.bottomRect.height <= rect.height).assertTrue();
      expect(area.bottomRect.width <= rect.width).assertTrue();
      expect(area.bottomRect.top <= screen.height).assertTrue();
      expect(typeof area.visible).assertEqual(BOOLEAN_TYPE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_5400
     * @tc.name      testWindowAvoidGesture0001
     * @tc.desc      Read the system gesture avoid area and check the two side bands together never exceed the window
     *               width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowAvoidGesture0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const area: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_SYSTEM_GESTURE);
      const facts: AvoidFacts = new AvoidFacts(area);
      const rect: window.Rect = probe.rect();
      logCase('testWindowAvoidGesture0001', `left=${facts.leftWidth} right=${facts.rightWidth} ` +
        `top=${facts.topHeight} bottom=${facts.bottomHeight}`);
      expect(facts.leftWidth >= ORIGIN).assertTrue();
      expect(facts.rightWidth >= ORIGIN).assertTrue();
      expect(facts.leftWidth + facts.rightWidth <= rect.width).assertTrue();
      expect(facts.topHeight + facts.bottomHeight <= rect.height).assertTrue();
      expect(area.bottomRect.height <= rect.height).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_5500
     * @tc.name      testWindowAvoidKeyboard0001
     * @tc.desc      Read the keyboard avoid area with no keyboard on screen and check it does not cover the page
     *               text and stays within the window width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowAvoidKeyboard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const area: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_KEYBOARD);
      const bounds: Rect = await pageRootBounds();
      const keyboardTop: number = area.bottomRect.top;
      const keyboardBottom: number = keyboardTop + area.bottomRect.height;
      const overlapsText: boolean = area.bottomRect.height > ORIGIN &&
        bounds.bottom > keyboardTop && bounds.top < keyboardBottom;
      logCase('testWindowAvoidKeyboard0001', `keyboardTop=${keyboardTop} keyboardHeight=${area.bottomRect.height} ` +
        `textTop=${bounds.top} textBottom=${bounds.bottom} overlaps=${overlapsText}`);
      expect(area.bottomRect.height >= ORIGIN).assertTrue();
      expect(area.bottomRect.width <= probe.rect().width).assertTrue();
      expect(overlapsText).assertFalse();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(probe.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_5600
     * @tc.name      testWindowAvoidIgnoringVisibility0001
     * @tc.desc      Compare the system avoid area with the variant that ignores visibility and check the ignoring one
     *               is at least as large
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowAvoidIgnoringVisibility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const visible: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_SYSTEM);
      const ignoring: window.AvoidArea =
        probe.main.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_SYSTEM);
      const rect: window.Rect = probe.rect();
      const visibleSpan: number = visible.topRect.height + visible.bottomRect.height;
      const ignoringSpan: number = ignoring.topRect.height + ignoring.bottomRect.height;
      logCase('testWindowAvoidIgnoringVisibility0001', `visibleSpan=${visibleSpan} ` +
        `ignoringSpan=${ignoringSpan} top=${ignoring.topRect.height}`);
      expect(ignoringSpan >= visibleSpan).assertTrue();
      expect(ignoring.topRect.height >= visible.topRect.height).assertTrue();
      expect(ignoring.bottomRect.height >= visible.bottomRect.height).assertTrue();
      expect(ignoring.topRect.width <= rect.width).assertTrue();
      expect(ignoring.leftRect.width <= rect.width).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_5700
     * @tc.name      testWindowAvoidHorizontalBudget0001
     * @tc.desc      Check the left and right system avoid rectangles never reach past the window width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowAvoidHorizontalBudget0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const area: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_SYSTEM);
      const rect: window.Rect = probe.rect();
      logCase('testWindowAvoidHorizontalBudget0001', `left=${area.leftRect.left},${area.leftRect.width} ` +
        `right=${area.rightRect.left},${area.rightRect.width} windowWidth=${rect.width}`);
      expect(area.leftRect.left >= ORIGIN).assertTrue();
      expect(rectRight(area.leftRect) <= rect.width).assertTrue();
      expect(area.rightRect.left >= ORIGIN).assertTrue();
      expect(area.rightRect.left <= rect.width).assertTrue();
      expect(area.leftRect.width + area.rightRect.width <= rect.width).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_5800
     * @tc.name      testWindowAvoidVerticalBudget0001
     * @tc.desc      Check the top and bottom system avoid rectangles never reach past the window height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowAvoidVerticalBudget0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const area: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_SYSTEM);
      const rect: window.Rect = probe.rect();
      logCase('testWindowAvoidVerticalBudget0001', `top=${area.topRect.top},${area.topRect.height} ` +
        `bottom=${area.bottomRect.top},${area.bottomRect.height} windowHeight=${rect.height}`);
      expect(area.topRect.top >= ORIGIN).assertTrue();
      expect(rectBottom(area.topRect) <= rect.height).assertTrue();
      expect(area.bottomRect.top >= ORIGIN).assertTrue();
      expect(area.bottomRect.top <= rect.height).assertTrue();
      expect(area.topRect.height + area.bottomRect.height <= rect.height).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_5900
     * @tc.name      testWindowAvoidStableReads0001
     * @tc.desc      Read the system avoid area three times and check the four side measurements collapse into one
     *               stable value
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowAvoidStableReads0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const tops: number[] = [];
      const bottoms: number[] = [];
      const visibles: boolean[] = [];
      for (let round = 0; round < REPEAT_READS; round++) {
        const area: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_SYSTEM);
        tops.push(area.topRect.height);
        bottoms.push(area.bottomRect.height);
        visibles.push(area.visible);
      }
      const distinctTops: number = tops.filter((value: number, index: number) =>
        tops.indexOf(value) === index).length;
      logCase('testWindowAvoidStableReads0001', `tops=${tops.join(',')} bottoms=${bottoms.join(',')} ` +
        `distinctTops=${distinctTops} visibles=${visibles.join(',')}`);
      expect(tops.length).assertEqual(REPEAT_READS);
      expect(distinctTops).assertEqual(SINGLE_VALUE);
      expect(bottoms[0]).assertEqual(bottoms[REPEAT_READS - 1]);
      expect(visibles[0]).assertEqual(visibles[REPEAT_READS - 1]);
      expect(tops[0] >= ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_6000
     * @tc.name      testWindowAvoidInsideDisplay0001
     * @tc.desc      Check the navigation indicator avoid rectangles live inside the display bounds on both axes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowAvoidInsideDisplay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const area: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
      const screen: display.Display = defaultDisplay();
      logCase('testWindowAvoidInsideDisplay0001', `bottom=${area.bottomRect.left},${area.bottomRect.top},` +
        `${area.bottomRect.width},${area.bottomRect.height} display=${screen.width}x${screen.height}`);
      expect(area.bottomRect.left >= ORIGIN).assertTrue();
      expect(area.bottomRect.top >= ORIGIN).assertTrue();
      expect(rectRight(area.bottomRect) <= screen.width).assertTrue();
      expect(rectBottom(area.bottomRect) <= screen.height).assertTrue();
      expect(area.bottomRect.width <= screen.width).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_6100
     * @tc.name      testWindowAvoidRelaunchSame0001
     * @tc.desc      Relaunch the ability and check the fresh window reports the same system avoid margins as the old
     *               one
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowAvoidRelaunchSame0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: WindowProbe = await openProbe();
      const before: AvoidFacts = avoidFactsOf(first, window.AvoidAreaType.TYPE_SYSTEM);
      const second: WindowProbe = await openProbe();
      const after: AvoidFacts = avoidFactsOf(second, window.AvoidAreaType.TYPE_SYSTEM);
      logCase('testWindowAvoidRelaunchSame0001', `beforeTop=${before.topHeight} afterTop=${after.topHeight} ` +
        `beforeBottom=${before.bottomHeight} afterBottom=${after.bottomHeight}`);
      expect(after.topHeight).assertEqual(before.topHeight);
      expect(after.bottomHeight).assertEqual(before.bottomHeight);
      expect(after.leftWidth).assertEqual(before.leftWidth);
      expect(after.rightWidth).assertEqual(before.rightWidth);
      expect(second.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_6200
     * @tc.name      testWindowAvoidSystemTopBand0001
     * @tc.desc      Check the top system avoid band is a horizontal strip whose height never exceeds the window and
     *               which reports a positive height whenever the area is declared visible
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowAvoidSystemTopBand0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const area: window.AvoidArea = probe.avoid(window.AvoidAreaType.TYPE_SYSTEM);
      const rect: window.Rect = probe.rect();
      logCase('testWindowAvoidSystemTopBand0001', `visible=${area.visible} topHeight=${area.topRect.height} ` +
        `topTop=${area.topRect.top} windowHeight=${rect.height}`);
      expect(area.topRect.width <= rect.width).assertTrue();
      expect(area.topRect.height <= rect.height).assertTrue();
      if (area.visible) {
        expect(area.topRect.height > ORIGIN).assertTrue();
      }
      expect(area.topRect.top >= ORIGIN).assertTrue();
      expect(area.topRect.top <= rect.height).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_6300
     * @tc.name      testWindowIdentityIdStable0001
     * @tc.desc      Read the window identity three times and check the id never changes for a live main window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowIdentityIdStable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const probe: WindowProbe = await openProbe();
      const ids: number[] = [];
      for (let round = 0; round < REPEAT_READS; round++) {
        ids.push(probe.props().id);
      }
      const distinct: number = ids.filter((value: number, index: number) =>
        ids.indexOf(value) === index).length;
      logCase('testWindowIdentityIdStable0001', `ids=${ids.join(',')} distinct=${distinct} ` +
        `showing=${probe.showing()}`);
      expect(ids.length).assertEqual(REPEAT_READS);
      expect(distinct).assertEqual(SINGLE_VALUE);
      expect(ids[0] >= ORIGIN).assertTrue();
      expect(probe.showing()).assertTrue();
      expect(rectPositive(probe.rect())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_6400
     * @tc.name      testWindowIdentityTopMatch0001
     * @tc.desc      Check the last window handles the same identity, display and type as the top window of the app
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowIdentityTopMatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const top: window.Window = await window.getTopWindow(ability.context);
      const mainProps: window.WindowProperties = main.getWindowProperties();
      const topProps: window.WindowProperties = top.getWindowProperties();
      logCase('testWindowIdentityTopMatch0001', `main=${mainProps.id} top=${topProps.id} ` +
        `mainDisplay=${mainProps.displayId} topDisplay=${topProps.displayId}`);
      expect(mainProps.id).assertEqual(topProps.id);
      expect(mainProps.id >= ORIGIN).assertTrue();
      expect(mainProps.displayId === topProps.displayId).assertTrue();
      expect(mainProps.type).assertEqual(topProps.type);
      expect(main.isWindowShowing() && top.isWindowShowing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_6500
     * @tc.name      testWindowIdentityIdRange0001
     * @tc.desc      Check the window id is a bounded non negative number and that it is not confused with the display
     *               id space
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowIdentityIdRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const props: window.WindowProperties = probe.props();
      const screen: display.Display = defaultDisplay();
      logCase('testWindowIdentityIdRange0001', `windowId=${props.id} displayId=${screen.id} ` +
        `bound=${MAX_WINDOW_ID} type=${props.type}`);
      expect(props.id >= ORIGIN).assertTrue();
      expect(props.id < MAX_WINDOW_ID).assertTrue();
      expect(screen.id >= ORIGIN).assertTrue();
      expect(screen.id < MAX_WINDOW_ID).assertTrue();
      expect(knownWindowType(Number(props.type))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_6600
     * @tc.name      testWindowIdentityDisplayId0001
     * @tc.desc      Check the window reports the default display as its home display whenever it publishes a display
     *               id
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowIdentityDisplayId0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const props: window.WindowProperties = probe.props();
      const screen: display.Display = defaultDisplay();
      const displayId: number | undefined = props.displayId;
      logCase('testWindowIdentityDisplayId0001', `displayId=${displayId} defaultId=${screen.id} ` +
        `width=${screen.width} height=${screen.height}`);
      expect(displayId === undefined || displayId === screen.id).assertTrue();
      expect(screen.width > ORIGIN).assertTrue();
      expect(screen.height > ORIGIN).assertTrue();
      expect(probe.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_6700
     * @tc.name      testWindowIdentityName0001
     * @tc.desc      Check the optional window name, when published, is a trimmed non empty label and the window type
     *               is a declared one
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowIdentityName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const facts: WindowFacts = capture(probe.main);
      logCase('testWindowIdentityName0001', `name=${facts.name} length=${facts.name.length} ` +
        `type=${facts.windowType}`);
      expect(facts.name === '' || facts.name.length >= SINGLE_VALUE).assertTrue();
      expect(facts.name.trim()).assertEqual(facts.name);
      expect(knownWindowType(facts.windowType)).assertTrue();
      expect(facts.showing).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_6800
     * @tc.name      testWindowIdentityType0001
     * @tc.desc      Check the main window reports a stable application window type that is neither a system alert nor
     *               a dialog
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowIdentityType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const first: number = Number(probe.props().type);
      const second: number = Number(probe.props().type);
      logCase('testWindowIdentityType0001', `first=${first} second=${second} ` +
        `alert=${Number(window.WindowType.TYPE_SYSTEM_ALERT)} dialog=${Number(window.WindowType.TYPE_DIALOG)}`);
      expect(first).assertEqual(second);
      expect(first >= ORIGIN).assertTrue();
      expect(knownWindowType(first)).assertTrue();
      expect(first === Number(window.WindowType.TYPE_SYSTEM_ALERT)).assertFalse();
      expect(first === Number(window.WindowType.TYPE_DIALOG)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_6900
     * @tc.name      testWindowIdentityTransparent0001
     * @tc.desc      Check the window publishes a background transparency flag that stays stable over an idle gap
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowIdentityTransparent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const before: WindowFacts = capture(probe.main);
      await sleepMs(IDLE_SETTLE_MS);
      const after: WindowFacts = capture(probe.main);
      const props: window.WindowProperties = probe.props();
      logCase('testWindowIdentityTransparent0001', `before=${before.transparent} after=${after.transparent} ` +
        `kind=${typeof props.isTransparent} id=${props.id}`);
      expect(typeof after.transparent).assertEqual(BOOLEAN_TYPE);
      expect(after.transparent).assertEqual(before.transparent);
      expect(after.transparent).assertEqual(props.isTransparent);
      expect(after.showing).assertTrue();
      expect(after.width > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_7000
     * @tc.name      testWindowIdentityFocusable0001
     * @tc.desc      Check the focusable flag of the foreground main window keeps its value over an idle gap and that
     *               the window is focusable or touchable at all times
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowIdentityFocusable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const focusBefore: boolean = probe.props().focusable;
      await sleepMs(IDLE_SETTLE_MS);
      const facts: WindowFacts = capture(probe.main);
      logCase('testWindowIdentityFocusable0001', `focusBefore=${focusBefore} focusAfter=${facts.focusable} ` +
        `touchable=${facts.touchable} status=${facts.status}`);
      expect(facts.focusable).assertEqual(focusBefore);
      expect(facts.focusable || facts.touchable).assertTrue();
      expect(facts.showing).assertTrue();
      expect(facts.height > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_7100
     * @tc.name      testWindowIdentityTouchable0001
     * @tc.desc      Check a visible main window accepts touches and keeps that flag while the rectangle stays valid
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowIdentityTouchable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const touchable: boolean = probe.props().touchable;
      const repeated: boolean = probe.props().touchable;
      const rect: window.Rect = probe.rect();
      logCase('testWindowIdentityTouchable0001', `touchable=${touchable} repeated=${repeated} ` +
        `showing=${probe.showing()} rect=${rect.width}x${rect.height}`);
      expect(typeof touchable).assertEqual(BOOLEAN_TYPE);
      expect(touchable).assertEqual(repeated);
      expect(probe.showing()).assertTrue();
      expect(rectPositive(rect)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_7200
     * @tc.name      testWindowIdentityBrightness0001
     * @tc.desc      Check the brightness reported before the first mutation is legal and identical across two captures
     *               of the same window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowIdentityBrightness0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const before: WindowFacts = capture(probe.main);
      const after: WindowFacts = capture(probe.main);
      logCase('testWindowIdentityBrightness0001', `before=${before.brightness} after=${after.brightness} ` +
        `range=${DEFAULT_BRIGHTNESS}..${BRIGHTNESS_FULL}`);
      expect(inBrightnessRange(before.brightness)).assertTrue();
      expect(after.brightness).assertEqual(before.brightness);
      expect(after.brightness <= BRIGHTNESS_FULL).assertTrue();
      expect(after.brightness >= DEFAULT_BRIGHTNESS).assertTrue();
      expect(after.showing).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_7300
     * @tc.name      testDisplayWidthHeight0001
     * @tc.desc      Check the default display publishes positive pixel dimensions that cover at least one density
     *               pixel each
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplayWidthHeight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const screen: display.Display = defaultDisplay();
      const area: number = screen.width * screen.height;
      logCase('testDisplayWidthHeight0001', `width=${screen.width} height=${screen.height} area=${area} ` +
        `densityPixels=${screen.densityPixels}`);
      expect(screen.width >= MIN_SIDE_PX).assertTrue();
      expect(screen.height >= MIN_SIDE_PX).assertTrue();
      expect(area > ORIGIN).assertTrue();
      expect(screen.width >= screen.densityPixels).assertTrue();
      expect(screen.height >= screen.densityPixels).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_7400
     * @tc.name      testDisplayDensityDpi0001
     * @tc.desc      Check the display dpi is a plausible positive value consistent with the reported density scale
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayDensityDpi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const screen: display.Display = defaultDisplay();
      const implied: number = screen.densityPixels * 160;
      const drift: number = Math.abs(screen.densityDPI - implied);
      logCase('testDisplayDensityDpi0001', `dpi=${screen.densityDPI} densityPixels=${screen.densityPixels} ` +
        `impliedDpi=${implied} drift=${drift}`);
      expect(screen.densityDPI > MIN_DENSITY_DPI).assertTrue();
      expect(screen.densityDPI < MAX_DISPLAY_DPI).assertTrue();
      expect(screen.densityPixels > ORIGIN).assertTrue();
      expect(drift <= implied * MIN_DENSITY_RATIO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_7500
     * @tc.name      testDisplayDensityPixels0001
     * @tc.desc      Check the display density scale is inside the supported band and implies a sane width in vp
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayDensityPixels0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const screen: display.Display = defaultDisplay();
      const widthVp: number = screen.width / screen.densityPixels;
      logCase('testDisplayDensityPixels0001', `densityPixels=${screen.densityPixels} width=${screen.width} ` +
        `widthVp=${widthVp}`);
      expect(screen.densityPixels >= MIN_DENSITY_PIXELS).assertTrue();
      expect(screen.densityPixels <= MAX_DENSITY_RATIO).assertTrue();
      expect(widthVp >= MIN_WINDOW_VP).assertTrue();
      expect(widthVp <= MAX_WINDOW_VP).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_7600
     * @tc.name      testDisplayScaledDensity0001
     * @tc.desc      Check the scaled density used for font sizing stays within a legal ratio of the base density
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayScaledDensity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const screen: display.Display = defaultDisplay();
      const ratio: number = screen.scaledDensity / screen.densityPixels;
      logCase('testDisplayScaledDensity0001', `scaledDensity=${screen.scaledDensity} ` +
        `densityPixels=${screen.densityPixels} ratio=${ratio}`);
      expect(screen.scaledDensity > ORIGIN).assertTrue();
      expect(ratio >= MIN_DENSITY_RATIO).assertTrue();
      expect(ratio <= MAX_DENSITY_RATIO).assertTrue();
      expect(screen.scaledDensity >= screen.densityPixels * MIN_DENSITY_RATIO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_7700
     * @tc.name      testDisplayAspectRatio0001
     * @tc.desc      Check the display aspect ratio is inside the range a phone, tablet or desktop panel can have
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayAspectRatio0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const screen: display.Display = defaultDisplay();
      const aspect: number = screen.width / screen.height;
      logCase('testDisplayAspectRatio0001', `width=${screen.width} height=${screen.height} aspect=${aspect} ` +
        `range=${MIN_ASPECT_RATIO}..${MAX_ASPECT_RATIO}`);
      expect(aspect >= MIN_ASPECT_RATIO).assertTrue();
      expect(aspect <= MAX_ASPECT_RATIO).assertTrue();
      expect(screen.width > ORIGIN).assertTrue();
      expect(screen.height > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_7800
     * @tc.name      testDisplayRotationRange0001
     * @tc.desc      Check the display rotation is an integer in the declared rotation range and stable between reads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayRotationRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: display.Display = defaultDisplay();
      const second: display.Display = defaultDisplay();
      const rotation: number = first.rotation;
      logCase('testDisplayRotationRange0001', `rotation=${rotation} second=${second.rotation} ` +
        `max=${MAX_ROTATION_VALUE} floor=${Math.floor(rotation)}`);
      expect(rotation >= ORIGIN).assertTrue();
      expect(rotation <= MAX_ROTATION_VALUE).assertTrue();
      expect(Math.floor(rotation)).assertEqual(rotation);
      expect(second.rotation).assertEqual(rotation);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_7900
     * @tc.name      testDisplayOrientationEnum0001
     * @tc.desc      Check the display orientation is a declared value and agrees with the width and height ordering
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayOrientationEnum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const screen: display.Display = defaultDisplay();
      const orientation: number = Number(screen.orientation);
      const portrait: boolean = orientation === Number(display.Orientation.PORTRAIT) ||
        orientation === Number(display.Orientation.PORTRAIT_INVERTED);
      const landscape: boolean = orientation === Number(display.Orientation.LANDSCAPE) ||
        orientation === Number(display.Orientation.LANDSCAPE_INVERTED);
      logCase('testDisplayOrientationEnum0001', `orientation=${orientation} portrait=${portrait} ` +
        `landscape=${landscape} size=${screen.width}x${screen.height}`);
      expect(ORIENTATION_VALUES.indexOf(orientation) >= 0).assertTrue();
      if (portrait) {
        expect(screen.height >= screen.width).assertTrue();
      }
      if (landscape) {
        expect(screen.width >= screen.height).assertTrue();
      }
      expect(screen.width > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_8000
     * @tc.name      testDisplayAvailableSize0001
     * @tc.desc      Check the display available size never exceeds the full size and still leaves a usable area
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayAvailableSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const screen: display.Display = defaultDisplay();
      const availableArea: number = screen.availableWidth * screen.availableHeight;
      const fullArea: number = screen.width * screen.height;
      logCase('testDisplayAvailableSize0001', `available=${screen.availableWidth}x${screen.availableHeight} ` +
        `full=${screen.width}x${screen.height} availableArea=${availableArea}`);
      expect(screen.availableWidth > ORIGIN).assertTrue();
      expect(screen.availableHeight > ORIGIN).assertTrue();
      expect(screen.availableWidth <= screen.width).assertTrue();
      expect(screen.availableHeight <= screen.height).assertTrue();
      expect(availableArea <= fullArea).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_8100
     * @tc.name      testDisplayByIdLookup0001
     * @tc.desc      Look the default display up by its own id and check the resolved object reports identical geometry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayByIdLookup0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const screen: display.Display = defaultDisplay();
      const probe: DisplayProbe = displayById(screen.id);
      logCase('testDisplayByIdLookup0001', `code=${probe.code} id=${probe.id} width=${probe.width} ` +
        `height=${probe.height} densityDPI=${probe.densityDPI}`);
      expect(probe.code).assertEqual(OK_CODE);
      expect(probe.id).assertEqual(screen.id);
      expect(probe.width).assertEqual(screen.width);
      expect(probe.height).assertEqual(screen.height);
      expect(probe.densityPixels).assertEqual(screen.densityPixels);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_8200
     * @tc.name      testDisplayAllContainsDefault0001
     * @tc.desc      Enumerate every display and check the default display id appears in the list with a valid
     *               positive count
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayAllContainsDefault0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const listed: DisplayListProbe = await displayList();
      const defaultId: number = defaultDisplay().id;
      logCase('testDisplayAllContainsDefault0001', `code=${listed.code} count=${listed.count} ` +
        `ids=${listed.ids.join(',')} defaultId=${defaultId}`);
      expect(listed.code).assertEqual(OK_CODE);
      expect(listed.count >= SINGLE_VALUE).assertTrue();
      expect(listed.containsDefault).assertTrue();
      expect(listed.ids.indexOf(defaultId) >= 0).assertTrue();
      expect(listed.ids.every((value: number) => value >= ORIGIN)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_8300
     * @tc.name      testDisplayPrimaryGeometry0001
     * @tc.desc      Read the primary display and check it publishes a positive size, dpi and density like the default
     *               display
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayPrimaryGeometry0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const primary: PrimaryProbe = primaryDisplay();
      logCase('testDisplayPrimaryGeometry0001', `code=${primary.code} id=${primary.id} ` +
        `size=${primary.width}x${primary.height} dpi=${primary.densityDPI} density=${primary.densityPixels}`);
      expect(primary.code).assertEqual(OK_CODE);
      expect(primary.width > ORIGIN).assertTrue();
      expect(primary.height > ORIGIN).assertTrue();
      expect(primary.densityDPI > MIN_DENSITY_DPI).assertTrue();
      expect(primary.densityPixels > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_8400
     * @tc.name      testDisplayAliveFlag0001
     * @tc.desc      Check the default display reports itself alive as a stable boolean
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayAliveFlag0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: display.Display = defaultDisplay();
      const second: display.Display = defaultDisplay();
      logCase('testDisplayAliveFlag0001', `alive=${first.alive} second=${second.alive} ` +
        `state=${Number(first.state)} width=${first.width}`);
      expect(typeof first.alive).assertEqual(BOOLEAN_TYPE);
      expect(first.alive).assertTrue();
      expect(second.alive).assertEqual(first.alive);
      expect(first.width > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_8500
     * @tc.name      testDisplayStateValue0001
     * @tc.desc      Check the default display power state is one of the declared states and is not the off state
     *               while the test drives the UI
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayStateValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const screen: display.Display = defaultDisplay();
      const state: number = Number(screen.state);
      logCase('testDisplayStateValue0001', `state=${state} declared=${DISPLAY_STATE_VALUES.join(',')} ` +
        `alive=${screen.alive}`);
      expect(DISPLAY_STATE_VALUES.indexOf(state) >= 0).assertTrue();
      expect(state === Number(display.DisplayState.STATE_OFF)).assertFalse();
      expect(state >= ORIGIN).assertTrue();
      expect(screen.alive).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_8600
     * @tc.name      testDisplayRefreshRate0001
     * @tc.desc      Check the default display refresh rate is a positive plausible frequency
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDisplayRefreshRate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const screen: display.Display = defaultDisplay();
      const rate: number = screen.refreshRate;
      logCase('testDisplayRefreshRate0001', `refreshRate=${rate} width=${screen.width} ` +
        `height=${screen.height}`);
      expect(rate > ORIGIN).assertTrue();
      expect(rate < MAX_DISPLAY_DPI).assertTrue();
      expect(rate >= MIN_REFRESH_RATE).assertTrue();
      expect(screen.alive).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_8700
     * @tc.name      testDisplayNameText0001
     * @tc.desc      Check the default display publishes a non empty trimmed name string
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDisplayNameText0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const screen: display.Display = defaultDisplay();
      const name: string = screen.name;
      logCase('testDisplayNameText0001', `name=${name} length=${name.length} id=${screen.id}`);
      expect(typeof name).assertEqual('string');
      expect(name.length >= SINGLE_VALUE).assertTrue();
      expect(name.trim()).assertEqual(name);
      expect(screen.id >= ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_8800
     * @tc.name      testDisplayXyDpi0001
     * @tc.desc      Check the horizontal and vertical dpi of the default display are positive and agree with each
     *               other
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDisplayXyDpi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const screen: display.Display = defaultDisplay();
      const ratio: number = screen.xDPI / screen.yDPI;
      logCase('testDisplayXyDpi0001', `xDPI=${screen.xDPI} yDPI=${screen.yDPI} ratio=${ratio} ` +
        `densityDPI=${screen.densityDPI}`);
      expect(screen.xDPI > ORIGIN).assertTrue();
      expect(screen.yDPI > ORIGIN).assertTrue();
      expect(ratio >= MIN_DENSITY_RATIO).assertTrue();
      expect(ratio <= MAX_DENSITY_RATIO).assertTrue();
      expect(screen.xDPI <= MAX_DISPLAY_DPI * 2).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_8900
     * @tc.name      testDisplayPhysicalSize0001
     * @tc.desc      Check the physical panel resolution is never smaller than the logical display size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDisplayPhysicalSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const screen: display.Display = defaultDisplay();
      const physical: PhysicalProbe = await physicalResolution();
      logCase('testDisplayPhysicalSize0001', `code=${physical.code} ` +
        `physical=${physical.widestWidth}x${physical.widestHeight} logical=${screen.width}x${screen.height}`);
      expect(tolerantCode(physical.code)).assertTrue();
      if (physical.code === OK_CODE) {
        expect(physical.count >= SINGLE_VALUE).assertTrue();
        expect(physical.widestWidth >= screen.width).assertTrue();
        expect(physical.widestHeight >= screen.height).assertTrue();
      } else {
        expect(physical.code > OK_CODE).assertTrue();
      }
      expect(screen.width > ORIGIN).assertTrue();
      expect(screen.height > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_9000
     * @tc.name      testDisplayIdStable0001
     * @tc.desc      Read the default display id three times and check the identity of the panel never changes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayIdStable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ids: number[] = [];
      for (let round = 0; round < REPEAT_READS; round++) {
        ids.push(defaultDisplay().id);
      }
      const distinct: number = ids.filter((value: number, index: number) =>
        ids.indexOf(value) === index).length;
      logCase('testDisplayIdStable0001', `ids=${ids.join(',')} distinct=${distinct} width=${defaultDisplay().width}`);
      expect(ids.length).assertEqual(REPEAT_READS);
      expect(distinct).assertEqual(SINGLE_VALUE);
      expect(ids[0] >= ORIGIN).assertTrue();
      expect(defaultDisplay().width > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_9100
     * @tc.name      testDisplayFoldStatus0001
     * @tc.desc      Check the fold status matches the foldable capability of the device and uses a declared enum value
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDisplayFoldStatus0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fold: FoldProbe = foldState();
      logCase('testDisplayFoldStatus0001', `code=${fold.code} foldable=${fold.foldable} status=${fold.status} ` +
        `declared=${FOLD_STATUS_VALUES.join(',')}`);
      expect(tolerantCode(fold.code)).assertTrue();
      if (fold.code === OK_CODE) {
        expect(FOLD_STATUS_VALUES.indexOf(fold.status) >= 0).assertTrue();
        if (!fold.foldable) {
          expect(fold.status).assertEqual(Number(display.FoldStatus.FOLD_STATUS_UNKNOWN));
        }
      }
      expect(defaultDisplay().width > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_9200
     * @tc.name      testDisplayVpExtent0001
     * @tc.desc      Convert both display dimensions to vp and check they land in a plausible window scale
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplayVpExtent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const screen: display.Display = defaultDisplay();
      const widthVp: number = screen.width / screen.densityPixels;
      const heightVp: number = screen.height / screen.densityPixels;
      logCase('testDisplayVpExtent0001', `widthVp=${widthVp} heightVp=${heightVp} ` +
        `densityPixels=${screen.densityPixels}`);
      expect(widthVp >= MIN_WINDOW_VP).assertTrue();
      expect(widthVp <= MAX_WINDOW_VP).assertTrue();
      expect(heightVp >= MIN_WINDOW_VP).assertTrue();
      expect(heightVp <= MAX_WINDOW_VP).assertTrue();
      expect(screen.densityPixels > ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_9300
     * @tc.name      testWindowDisplayCoupling0001
     * @tc.desc      Check the visible main window, its drawable area and its display id all agree with the default
     *               display geometry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplayCoupling0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const props: window.WindowProperties = probe.props();
      const screen: display.Display = defaultDisplay();
      const drawable: window.Rect = probe.drawable();
      const displayId: number | undefined = props.displayId;
      logCase('testWindowDisplayCoupling0001', `window=${props.windowRect.width}x${props.windowRect.height} ` +
        `drawable=${drawable.width}x${drawable.height} display=${screen.width}x${screen.height}`);
      expect(props.windowRect.width <= screen.width).assertTrue();
      expect(props.windowRect.height <= screen.height).assertTrue();
      expect(drawable.width <= screen.width).assertTrue();
      expect(drawable.height <= screen.height).assertTrue();
      expect(displayId === undefined || displayId === screen.id).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_9400
     * @tc.name      testPageRootTextShown0001
     * @tc.desc      Check the page text of the home page is present in the visible main window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testPageRootTextShown0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const probe: WindowProbe = await openProbe();
      const page: boolean = await pageRootVisible();
      logCase('testPageRootTextShown0001', `page=${page} showing=${probe.showing()} ` +
        `id=${probe.props().id}`);
      expect(page).assertTrue();
      expect(probe.showing()).assertTrue();
      expect(rectPositive(probe.rect())).assertTrue();
      expect(probe.props().id >= ORIGIN).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_9500
     * @tc.name      testPageRootTextBounds0001
     * @tc.desc      Check the bounds of the page text form a positive rectangle and that the text itself is the
     *               expected literal
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageRootTextBounds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await openProbe();
      const bounds: Rect = await pageRootBounds();
      const textComponent: Component = await pageRootComponent();
      const text: string = await textComponent.getText();
      logCase('testPageRootTextBounds0001', `left=${bounds.left} top=${bounds.top} ` +
        `right=${bounds.right} bottom=${bounds.bottom} text=${text}`);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(bounds.right - bounds.left >= MIN_SIDE_PX).assertTrue();
      expect(bounds.bottom - bounds.top >= MIN_SIDE_PX).assertTrue();
      expect(text).assertEqual(PAGE_TEXT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_9600
     * @tc.name      testPageRootTextWithinDisplay0001
     * @tc.desc      Check the page text is laid out inside the default display rectangle on both axes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageRootTextWithinDisplay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await openProbe();
      const bounds: Rect = await pageRootBounds();
      const screen: display.Display = defaultDisplay();
      logCase('testPageRootTextWithinDisplay0001', `bounds=${bounds.left},${bounds.top},${bounds.right},` +
        `${bounds.bottom} display=${screen.width}x${screen.height}`);
      expect(bounds.left >= ORIGIN).assertTrue();
      expect(bounds.top >= ORIGIN).assertTrue();
      expect(bounds.right <= screen.width).assertTrue();
      expect(bounds.bottom <= screen.height).assertTrue();
      expect((bounds.right - bounds.left) * (bounds.bottom - bounds.top) <= screen.width * screen.height)
        .assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_9700
     * @tc.name      testPageRootTextStableBounds0001
     * @tc.desc      Query the page text bounds twice and check the layout did not shift between the queries
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageRootTextStableBounds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await openProbe();
      const first: Rect = await pageRootBounds();
      const second: Rect = await pageRootBounds();
      logCase('testPageRootTextStableBounds0001', `first=${first.left},${first.top} ` +
        `second=${second.left},${second.top} firstRight=${first.right} secondRight=${second.right}`);
      expect(second.left).assertEqual(first.left);
      expect(second.top).assertEqual(first.top);
      expect(second.right).assertEqual(first.right);
      expect(second.bottom).assertEqual(first.bottom);
      expect(first.right > first.left).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_9800
     * @tc.name      testPageRootTextEnabled0001
     * @tc.desc      Check the page text component is enabled and not clickable while the window is showing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPageRootTextEnabled0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: WindowProbe = await openProbe();
      const text: Component = await pageRootComponent();
      const enabled: boolean = await text.isEnabled();
      const clickable: boolean = await text.isClickable();
      logCase('testPageRootTextEnabled0001', `enabled=${enabled} clickable=${clickable} ` +
        `showing=${probe.showing()}`);
      expect(enabled).assertTrue();
      expect(clickable).assertFalse();
      expect(probe.showing()).assertTrue();
      expect(rectPositive(probe.drawable())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_9900
     * @tc.name      testPageRootTextFocusedState0001
     * @tc.desc      Check the page text is not focused on its own and the window that hosts it stays visible with a
     *               valid rectangle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPageRootTextFocusedState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: WindowProbe = await openProbe();
      const text: Component = await pageRootComponent();
      const focused: boolean = await text.isFocused();
      const kind: string = typeof focused;
      logCase('testPageRootTextFocusedState0001', `focused=${focused} kind=${kind} ` +
        `touchable=${probe.props().touchable}`);
      expect(kind).assertEqual(BOOLEAN_TYPE);
      expect(focused).assertFalse();
      expect(probe.showing()).assertTrue();
      expect(rectPositive(probe.rect())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_10000
     * @tc.name      testPageRootTextAfterRelaunch0001
     * @tc.desc      Relaunch the ability and check the page text is delivered again into the new main window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPageRootTextAfterRelaunch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await openProbe();
      const before: boolean = await pageRootVisible();
      const second: WindowProbe = await openProbe();
      const after: boolean = await pageRootVisible();
      const bounds: Rect = await pageRootBounds();
      logCase('testPageRootTextAfterRelaunch0001', `before=${before} after=${after} ` +
        `bounds=${bounds.right - bounds.left}x${bounds.bottom - bounds.top} showing=${second.showing()}`);
      expect(before).assertTrue();
      expect(after).assertTrue();
      expect(bounds.right > bounds.left).assertTrue();
      expect(second.showing()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_10100
     * @tc.name      testPageRootTextGoneAfterStop0001
     * @tc.desc      Terminate the ability and check the page text disappears, then relaunch and check it comes back
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPageRootTextGoneAfterStop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await openProbe();
      const before: boolean = await pageRootVisible();
      await stopHome();
      const gone: Component | null =
        await driver().waitForComponent(ON.text(PAGE_TEXT).type(PAGE_TEXT_TYPE), DRIVER_ABSENT_MS);
      await openProbe();
      const back: boolean = await pageRootVisible();
      logCase('testPageRootTextGoneAfterStop0001', `before=${before} goneAfterStop=${gone === null} ` +
        `back=${back}`);
      expect(before).assertTrue();
      expect(gone === null).assertTrue();
      expect(back).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_10200
     * @tc.name      testWindowRelaunchBrightness0001
     * @tc.desc      Compare the untouched window brightness before and after a relaunch and check the fresh window
     *               starts from the same legal level
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowRelaunchBrightness0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: WindowProbe = await openProbe();
      const before: WindowFacts = capture(first.main);
      const second: WindowProbe = await openProbe();
      const after: WindowFacts = capture(second.main);
      logCase('testWindowRelaunchBrightness0001', `before=${before.brightness} after=${after.brightness} ` +
        `showing=${after.showing}`);
      expect(after.brightness).assertEqual(before.brightness);
      expect(inBrightnessRange(after.brightness)).assertTrue();
      expect(after.showing).assertTrue();
      expect(after.code).assertEqual(OK_CODE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_10300
     * @tc.name      testWindowRelaunchType0001
     * @tc.desc      Check a relaunched ability produces a main window of the same declared window type and width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowRelaunchType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: WindowProbe = await openProbe();
      const before: WindowFacts = capture(first.main);
      const second: WindowProbe = await openProbe();
      const after: WindowFacts = capture(second.main);
      logCase('testWindowRelaunchType0001', `beforeType=${before.windowType} afterType=${after.windowType} ` +
        `beforeWidth=${before.width} afterWidth=${after.width}`);
      expect(after.windowType).assertEqual(before.windowType);
      expect(knownWindowType(after.windowType)).assertTrue();
      expect(after.width).assertEqual(before.width);
      expect(after.showing).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_10400
     * @tc.name      testWindowRelaunchFullScreen0001
     * @tc.desc      Check the two full screen flags of the main window survive a relaunch unchanged
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowRelaunchFullScreen0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: WindowProbe = await openProbe();
      const before: WindowFacts = capture(first.main);
      const second: WindowProbe = await openProbe();
      const after: WindowFacts = capture(second.main);
      logCase('testWindowRelaunchFullScreen0001', `fullScreen=${before.fullScreen}/${after.fullScreen} ` +
        `layout=${before.layoutFullScreen}/${after.layoutFullScreen}`);
      expect(after.fullScreen).assertEqual(before.fullScreen);
      expect(after.layoutFullScreen).assertEqual(before.layoutFullScreen);
      expect(after.height).assertEqual(before.height);
      expect(after.showing).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_10500
     * @tc.name      testWindowRelaunchDisplayId0001
     * @tc.desc      Check the relaunched main window is bound to the same display and keeps the same width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowRelaunchDisplayId0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: WindowProbe = await openProbe();
      const before: WindowFacts = capture(first.main);
      const second: WindowProbe = await openProbe();
      const after: WindowFacts = capture(second.main);
      logCase('testWindowRelaunchDisplayId0001', `beforeDisplay=${before.displayId} ` +
        `afterDisplay=${after.displayId} width=${after.width}`);
      expect(after.displayId).assertEqual(before.displayId);
      expect(after.width).assertEqual(before.width);
      expect(after.id >= ORIGIN).assertTrue();
      expect(after.showing).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_10600
     * @tc.name      testWindowRelaunchStatus0001
     * @tc.desc      Check the window status of a relaunched ability equals the status before the relaunch
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowRelaunchStatus0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: WindowProbe = await openProbe();
      const beforeStatus: number = first.statusSafe();
      const second: WindowProbe = await openProbe();
      const afterStatus: number = second.statusSafe();
      logCase('testWindowRelaunchStatus0001', `before=${beforeStatus} after=${afterStatus} ` +
        `showing=${second.showing()}`);
      expect(afterStatus).assertEqual(beforeStatus);
      expect(afterStatus === MISSING_ID || knownStatus(afterStatus)).assertTrue();
      expect(second.showing()).assertTrue();
      expect(rectPositive(second.rect())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_10700
     * @tc.name      testWindowRelaunchFlags0001
     * @tc.desc      Check the focusable, touchable and keep screen on flags of a relaunched window match the old
     *               window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowRelaunchFlags0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: WindowProbe = await openProbe();
      const before: WindowFacts = capture(first.main);
      const second: WindowProbe = await openProbe();
      const after: WindowFacts = capture(second.main);
      logCase('testWindowRelaunchFlags0001', `focusable=${before.focusable}/${after.focusable} ` +
        `touchable=${before.touchable}/${after.touchable} keepOn=${before.keepScreenOn}/${after.keepScreenOn}`);
      expect(after.focusable).assertEqual(before.focusable);
      expect(after.touchable).assertEqual(before.touchable);
      expect(after.keepScreenOn).assertEqual(before.keepScreenOn);
      expect(after.showing).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WINDOW_10800
     * @tc.name      testWindowRelaunchDrawable0001
     * @tc.desc      Check the drawable area of the relaunched main window keeps the same size and stays inside the
     *               window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowRelaunchDrawable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: WindowProbe = await openProbe();
      const before: WindowFacts = capture(first.main);
      const second: WindowProbe = await openProbe();
      const after: WindowFacts = capture(second.main);
      logCase('testWindowRelaunchDrawable0001', `before=${before.drawableWidth}x${before.drawableHeight} ` +
        `after=${after.drawableWidth}x${after.drawableHeight}`);
      expect(after.drawableWidth).assertEqual(before.drawableWidth);
      expect(after.drawableHeight).assertEqual(before.drawableHeight);
      expect(rectInside(second.drawable(), second.rect())).assertTrue();
      expect(second.showing()).assertTrue();
    });

  });
}
