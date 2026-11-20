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

import { describe, expect, it } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/YieldHelper';
import { TestLogger } from '../common/TestLogger';
import {
  CASE_PREFIX, TAG_CURSOR_GEOMETRY, CURSOR_DEFAULT_LEFT, CURSOR_DEFAULT_TOP, CURSOR_DEFAULT_WIDTH,
  CURSOR_DEFAULT_HEIGHT, DEFAULT_INPUT_WIDTH, LINE_HEIGHT, FONT_SIZE
} from '../common/TestConstant';

/**
 * Snapshot of the caret rectangle forwarded to InputMethodController.updateCursor().
 * Field names and units (physical pixels) match inputMethod.CursorInfo.
 */
export interface CursorRect {
  top: number;
  left: number;
  width: number;
  height: number;
}

/**
 * Replica of the caret view in components/CustomInputText.ets.
 *
 * The caret is a 45 px Stack over a Text whose width/height come from cursorInfo,
 * a horizontal offset taken from cursorLeft and margin top 5. Its onAreaChange
 * handler only pushes a new rectangle when the *global left* of the view differs
 * from the previously stored left, so a width-only or height-only relayout is
 * deliberately ignored by the component. The class keeps that comparison rule,
 * counts the updateCursor calls it would issue and exposes the last payload.
 */
export class CursorGeometryModel {
  cursorInfo: CursorRect = {
    top: CURSOR_DEFAULT_TOP,
    left: CURSOR_DEFAULT_LEFT,
    width: CURSOR_DEFAULT_WIDTH,
    height: CURSOR_DEFAULT_HEIGHT
  };
  cursorLeft: number = 0;
  updateCursorCalls: number = 0;
  lastPayload: CursorRect = {
    top: CURSOR_DEFAULT_TOP,
    left: CURSOR_DEFAULT_LEFT,
    width: CURSOR_DEFAULT_WIDTH,
    height: CURSOR_DEFAULT_HEIGHT
  };

  /**
   * One onAreaChange callback. globalX is newArea.globalPosition.x, positionY is
   * newArea.position.y, width and height come from the new area. Returns true
   * when the component would call updateCursor.
   */
  onAreaChange(globalX: number, positionY: number, width: number, height: number): boolean {
    if (globalX !== this.cursorInfo.left) {
      this.cursorInfo.left = globalX;
      this.cursorInfo.top = positionY;
      this.cursorInfo.width = width;
      this.cursorInfo.height = height;
      this.updateCursorCalls++;
      this.lastPayload = {
        top: this.cursorInfo.top,
        left: this.cursorInfo.left,
        width: this.cursorInfo.width,
        height: this.cursorInfo.height
      };
      return true;
    }
    return false;
  }

  /** Number of fields of the rectangle that differ from the defaults. */
  changedFieldCount(): number {
    let count: number = 0;
    if (this.cursorInfo.top !== CURSOR_DEFAULT_TOP) {
      count++;
    }
    if (this.cursorInfo.left !== CURSOR_DEFAULT_LEFT) {
      count++;
    }
    if (this.cursorInfo.width !== CURSOR_DEFAULT_WIDTH) {
      count++;
    }
    if (this.cursorInfo.height !== CURSOR_DEFAULT_HEIGHT) {
      count++;
    }
    return count;
  }

  /** Width of the caret view after a horizontal move equals the stored width. */
  caretWidth(): number {
    return this.cursorInfo.width;
  }

  /** Height of the caret view after a vertical resize equals the stored height. */
  caretHeight(): number {
    return this.cursorInfo.height;
  }

  reset(): void {
    this.cursorInfo = {
      top: CURSOR_DEFAULT_TOP,
      left: CURSOR_DEFAULT_LEFT,
      width: CURSOR_DEFAULT_WIDTH,
      height: CURSOR_DEFAULT_HEIGHT
    };
    this.cursorLeft = 0;
    this.updateCursorCalls = 0;
    this.lastPayload = {
      top: CURSOR_DEFAULT_TOP,
      left: CURSOR_DEFAULT_LEFT,
      width: CURSOR_DEFAULT_WIDTH,
      height: CURSOR_DEFAULT_HEIGHT
    };
  }
}

/**
 * Replica of the Canvas.onReady handler in components/CustomInputText.ets.
 * The handler converts 16 vp to physical pixels for the font and adopts the
 * measured canvas width as the editable width. Before it runs the component uses
 * the 320 px default declared on inputWidth.
 */
export class CanvasMetricsModel {
  inputWidth: number = DEFAULT_INPUT_WIDTH;
  fontString: string = '';
  readyCount: number = 0;
  lineHeight: number = LINE_HEIGHT;
  fontSizeVp: number = FONT_SIZE;
  private vpScale: number;

  constructor(vpScale: number) {
    this.vpScale = vpScale;
  }

  /** vp2px equivalent for the injected device density. */
  vpToPx(vp: number): number {
    return vp * this.vpScale;
  }

  /** Canvas onReady: sets the font to "<px>px sans-serif" and adopts canvas width. */
  onReady(canvasWidthPx: number): void {
    let px: number = this.vpToPx(this.fontSizeVp);
    this.fontString = px.toString() + 'px sans-serif';
    this.inputWidth = canvasWidthPx;
    this.readyCount++;
  }

  /** constraintSize maxWidth follows inputWidth. */
  maxWidth(): number {
    return this.inputWidth;
  }

  /** The container Row width follows inputWidth as well. */
  rowWidth(): number {
    return this.inputWidth;
  }
}

/**
 * Caret rectangle and editable-width contract of the custom editor.
 *
 * The caret view is a zero-text Text whose rectangle is pushed to
 * InputMethodController.updateCursor() from onAreaChange. The handler compares
 * only the global left position before rewriting all four fields, so a relayout
 * that keeps the left edge fixed is intentionally ignored. The Canvas onReady
 * handler in the same component converts 16 vp to physical pixels for the font
 * and adopts the measured canvas width as the editable width. This suite drives
 * both replicas to their edges: default values, ignored updates, NaN and
 * infinities, density scales, zero and negative widths, and the independence of
 * the two models.
 */

const SCALE_ONE: number = 1;
const SCALE_TWO: number = 2;
const SCALE_THREE: number = 3;
const SCALE_ONE_HALF: number = 1.5;
const NARROW_CANVAS: number = 1;
const EMPTY_CANVAS: number = 0;
const WIDE_CANVAS: number = 720;
const VERY_WIDE_CANVAS: number = 1080;
const NEGATIVE_CANVAS: number = -100;
const FRACTIONAL_LEFT: number = 12.5;
const FRACTIONAL_WIDTH: number = 2.5;
const FRACTIONAL_HEIGHT: number = 20.5;
const NEGATIVE_LEFT: number = -5;
const NEGATIVE_TOP: number = -3;
const NEGATIVE_WIDTH: number = -2;
const FIRST_LEFT: number = 10;
const FIRST_TOP: number = 5;
const FIRST_WIDTH: number = 3;
const FIRST_HEIGHT: number = 30;

function newGeometry(): CursorGeometryModel {
  let model: CursorGeometryModel = new CursorGeometryModel();
  return model;
}

function newCanvas(vpScale: number): CanvasMetricsModel {
  let model: CanvasMetricsModel = new CanvasMetricsModel(vpScale);
  return model;
}

function geometrySummary(model: CursorGeometryModel): string {
  return 'top=' + model.cursorInfo.top.toString() + ';left=' + model.cursorInfo.left.toString() +
    ';width=' + model.cursorInfo.width.toString() + ';height=' + model.cursorInfo.height.toString() +
    ';calls=' + model.updateCursorCalls.toString();
}

function canvasSummary(model: CanvasMetricsModel): string {
  return 'inputWidth=' + model.inputWidth.toString() + ';font=' + model.fontString +
    ';ready=' + model.readyCount.toString();
}

function logGeometry(caseName: string, model: CursorGeometryModel): void {
  TestLogger.value(TAG_CURSOR_GEOMETRY, caseName + ' rect', geometrySummary(model));
}

function logCanvas(caseName: string, model: CanvasMetricsModel): void {
  TestLogger.value(TAG_CURSOR_GEOMETRY, caseName + ' canvas', canvasSummary(model));
}

function changeAll(model: CursorGeometryModel, left: number, top: number, width: number,
  height: number): boolean {
  let changed: boolean = model.onAreaChange(left, top, width, height);
  return changed;
}

export default function cursorGeometryAndWidthTest(): void {
  describe('CustomInputTextCursorGeometryAndWidthTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0010
     * @tc.name cursorGeometryDefaultCaretWidth_001
     * @tc.desc The rendered caret width mirrors the rectangle width before any layout update
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryDefaultCaretWidth_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryDefaultCaretWidth_001');
      let model: CursorGeometryModel = newGeometry();
      TestLogger.value(TAG_CURSOR_GEOMETRY, 'caret width', model.caretWidth().toString());
      expect(model.caretWidth()).assertEqual(1);
      expect(model.caretWidth()).assertEqual(model.cursorInfo.width);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryDefaultCaretWidth_001');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0020
     * @tc.name cursorGeometryDefaultCaretHeight_002
     * @tc.desc The rendered caret height mirrors the rectangle height before any layout update
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryDefaultCaretHeight_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryDefaultCaretHeight_002');
      let model: CursorGeometryModel = newGeometry();
      TestLogger.value(TAG_CURSOR_GEOMETRY, 'caret height', model.caretHeight().toString());
      expect(model.caretHeight()).assertEqual(25);
      expect(model.caretHeight()).assertEqual(model.cursorInfo.height);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryDefaultCaretHeight_002');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0030
     * @tc.name cursorGeometryDefaultChangedFields_003
     * @tc.desc A fresh rectangle differs from the declared defaults on zero fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryDefaultChangedFields_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryDefaultChangedFields_003');
      let model: CursorGeometryModel = newGeometry();
      TestLogger.value(TAG_CURSOR_GEOMETRY, 'changed fields', model.changedFieldCount().toString());
      expect(model.changedFieldCount()).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryDefaultChangedFields_003');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0040
     * @tc.name cursorGeometryResetOnFreshModel_004
     * @tc.desc Resetting a fresh caret keeps every default and both counters at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryResetOnFreshModel_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryResetOnFreshModel_004');
      let model: CursorGeometryModel = newGeometry();
      model.reset();
      logGeometry('cursorGeometryResetOnFreshModel_004', model);
      expect(model.cursorInfo.left).assertEqual(0);
      expect(model.cursorInfo.top).assertEqual(0);
      expect(model.cursorInfo.width).assertEqual(1);
      expect(model.cursorInfo.height).assertEqual(25);
      expect(model.updateCursorCalls).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryResetOnFreshModel_004');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0050
     * @tc.name cursorGeometryFirstPayload_005
     * @tc.desc The payload forwarded to updateCursor mirrors the rectangle after the first change
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryFirstPayload_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryFirstPayload_005');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, FIRST_TOP, FIRST_WIDTH, FIRST_HEIGHT);
      logGeometry('cursorGeometryFirstPayload_005', model);
      expect(model.lastPayload.left).assertEqual(FIRST_LEFT);
      expect(model.lastPayload.top).assertEqual(FIRST_TOP);
      expect(model.lastPayload.width).assertEqual(FIRST_WIDTH);
      expect(model.lastPayload.height).assertEqual(FIRST_HEIGHT);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryFirstPayload_005');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0060
     * @tc.name cursorGeometryFirstChangedFields_006
     * @tc.desc After one full rewrite all four fields differ from the declared defaults
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryFirstChangedFields_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryFirstChangedFields_006');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, FIRST_TOP, FIRST_WIDTH, FIRST_HEIGHT);
      TestLogger.value(TAG_CURSOR_GEOMETRY, 'changed fields', model.changedFieldCount().toString());
      expect(model.changedFieldCount()).assertEqual(4);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryFirstChangedFields_006');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0070
     * @tc.name cursorGeometryNegativeLeft_007
     * @tc.desc A negative global left is accepted because the guard only compares equality
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryNegativeLeft_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryNegativeLeft_007');
      let model: CursorGeometryModel = newGeometry();
      let changed: boolean = changeAll(model, NEGATIVE_LEFT, 0, 1, 25);
      logGeometry('cursorGeometryNegativeLeft_007', model);
      expect(changed).assertTrue();
      expect(model.cursorInfo.left).assertEqual(NEGATIVE_LEFT);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryNegativeLeft_007');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0080
     * @tc.name cursorGeometryFractionalLeft_008
     * @tc.desc A fractional global left is stored without rounding
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryFractionalLeft_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryFractionalLeft_008');
      let model: CursorGeometryModel = newGeometry();
      let changed: boolean = changeAll(model, FRACTIONAL_LEFT, 0, 1, 25);
      logGeometry('cursorGeometryFractionalLeft_008', model);
      expect(changed).assertTrue();
      expect(model.cursorInfo.left).assertEqual(12.5);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryFractionalLeft_008');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0090
     * @tc.name cursorGeometryInfiniteLeft_009
     * @tc.desc A positive infinite left differs from the stored zero and is accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryInfiniteLeft_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryInfiniteLeft_009');
      let model: CursorGeometryModel = newGeometry();
      let changed: boolean = changeAll(model, Infinity, 0, 1, 25);
      logGeometry('cursorGeometryInfiniteLeft_009', model);
      expect(changed).assertTrue();
      expect(model.cursorInfo.left).assertEqual(Infinity);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryInfiniteLeft_009');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0100
     * @tc.name cursorGeometryNegativeInfiniteLeft_010
     * @tc.desc A negative infinite left differs from the stored zero and is accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryNegativeInfiniteLeft_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryNegativeInfiniteLeft_010');
      let model: CursorGeometryModel = newGeometry();
      let changed: boolean = changeAll(model, -Infinity, 0, 1, 25);
      logGeometry('cursorGeometryNegativeInfiniteLeft_010', model);
      expect(changed).assertTrue();
      expect(model.cursorInfo.left).assertEqual(-Infinity);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryNegativeInfiniteLeft_010');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0110
     * @tc.name cursorGeometrySameLeftAfterReset_011
     * @tc.desc After a reset a zero-left callback is ignored again, proving the comparison uses the stored left
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometrySameLeftAfterReset_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometrySameLeftAfterReset_011');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, FIRST_TOP, FIRST_WIDTH, FIRST_HEIGHT);
      model.reset();
      let changed: boolean = changeAll(model, 0, 3, 2, 26);
      logGeometry('cursorGeometrySameLeftAfterReset_011', model);
      expect(changed).assertFalse();
      expect(model.cursorInfo.left).assertEqual(0);
      expect(model.updateCursorCalls).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometrySameLeftAfterReset_011');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0120
     * @tc.name cursorGeometryRepeatedSameLeft_012
     * @tc.desc Two callbacks with the same non-zero left produce exactly one update
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryRepeatedSameLeft_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryRepeatedSameLeft_012');
      let model: CursorGeometryModel = newGeometry();
      let first: boolean = changeAll(model, FIRST_LEFT, FIRST_TOP, FIRST_WIDTH, FIRST_HEIGHT);
      let second: boolean = changeAll(model, FIRST_LEFT, 9, 7, 33);
      logGeometry('cursorGeometryRepeatedSameLeft_012', model);
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(model.updateCursorCalls).assertEqual(1);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryRepeatedSameLeft_012');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0130
     * @tc.name cursorGeometryNaNAccepted_013
     * @tc.desc A NaN left is not equal to the stored zero, so the callback is accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryNaNAccepted_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryNaNAccepted_013');
      let model: CursorGeometryModel = newGeometry();
      let changed: boolean = changeAll(model, NaN, 0, 1, 25);
      logGeometry('cursorGeometryNaNAccepted_013', model);
      expect(changed).assertTrue();
      expect(Number.isNaN(model.cursorInfo.left)).assertTrue();
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryNaNAccepted_013');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0140
     * @tc.name cursorGeometryNaNRepeated_014
     * @tc.desc NaN never equals itself, so every NaN callback is accepted and counted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryNaNRepeated_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryNaNRepeated_014');
      let model: CursorGeometryModel = newGeometry();
      let first: boolean = changeAll(model, NaN, 0, 1, 25);
      let second: boolean = changeAll(model, NaN, 1, 2, 26);
      logGeometry('cursorGeometryNaNRepeated_014', model);
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(model.updateCursorCalls).assertEqual(2);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryNaNRepeated_014');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0150
     * @tc.name cursorGeometryNaNThenNumber_015
     * @tc.desc A numeric left after NaN is accepted because a number is never equal to NaN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryNaNThenNumber_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryNaNThenNumber_015');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, NaN, 0, 1, 25);
      let changed: boolean = changeAll(model, FIRST_LEFT, 1, 2, 26);
      logGeometry('cursorGeometryNaNThenNumber_015', model);
      expect(changed).assertTrue();
      expect(model.cursorInfo.left).assertEqual(FIRST_LEFT);
      expect(model.updateCursorCalls).assertEqual(2);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryNaNThenNumber_015');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0160
     * @tc.name cursorGeometryNumberThenNaN_016
     * @tc.desc A NaN left after a number is accepted as well
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryNumberThenNaN_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryNumberThenNaN_016');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, 0, 1, 25);
      let changed: boolean = changeAll(model, NaN, 1, 2, 26);
      logGeometry('cursorGeometryNumberThenNaN_016', model);
      expect(changed).assertTrue();
      expect(Number.isNaN(model.cursorInfo.left)).assertTrue();
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryNumberThenNaN_016');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0170
     * @tc.name cursorGeometryNegativeZeroLeft_017
     * @tc.desc Negative zero compares equal to the stored zero, so the first callback is ignored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryNegativeZeroLeft_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryNegativeZeroLeft_017');
      let model: CursorGeometryModel = newGeometry();
      let changed: boolean = changeAll(model, -0, 4, 6, 28);
      logGeometry('cursorGeometryNegativeZeroLeft_017', model);
      expect(changed).assertFalse();
      expect(model.cursorInfo.left).assertEqual(0);
      expect(model.updateCursorCalls).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryNegativeZeroLeft_017');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0180
     * @tc.name cursorGeometryZeroAfterNegativeZero_018
     * @tc.desc Zero after negative zero is also ignored because both compare equal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryZeroAfterNegativeZero_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryZeroAfterNegativeZero_018');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, -0, 0, 1, 25);
      let changed: boolean = changeAll(model, 0, 2, 3, 27);
      logGeometry('cursorGeometryZeroAfterNegativeZero_018', model);
      expect(changed).assertFalse();
      expect(model.updateCursorCalls).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryZeroAfterNegativeZero_018');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0190
     * @tc.name cursorGeometryFractionalWidth_019
     * @tc.desc A fractional width is stored without rounding together with the accepted move
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryFractionalWidth_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryFractionalWidth_019');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, 0, FRACTIONAL_WIDTH, 25);
      logGeometry('cursorGeometryFractionalWidth_019', model);
      expect(model.cursorInfo.width).assertEqual(2.5);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryFractionalWidth_019');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0200
     * @tc.name cursorGeometryFractionalHeight_020
     * @tc.desc A fractional height is stored without rounding together with the accepted move
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryFractionalHeight_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryFractionalHeight_020');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, 0, 1, FRACTIONAL_HEIGHT);
      logGeometry('cursorGeometryFractionalHeight_020', model);
      expect(model.cursorInfo.height).assertEqual(20.5);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryFractionalHeight_020');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0210
     * @tc.name cursorGeometryNegativeTop_021
     * @tc.desc A negative position.y is stored because the handler only gates on the left edge
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryNegativeTop_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryNegativeTop_021');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, NEGATIVE_TOP, 1, 25);
      logGeometry('cursorGeometryNegativeTop_021', model);
      expect(model.cursorInfo.top).assertEqual(-3);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryNegativeTop_021');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0220
     * @tc.name cursorGeometryNegativeWidth_022
     * @tc.desc A negative width is stored as-is because no lower bound is applied
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryNegativeWidth_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryNegativeWidth_022');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, 0, NEGATIVE_WIDTH, 25);
      logGeometry('cursorGeometryNegativeWidth_022', model);
      expect(model.cursorInfo.width).assertEqual(-2);
      expect(model.caretWidth()).assertEqual(-2);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryNegativeWidth_022');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0230
     * @tc.name cursorGeometryPayloadSnapshotIsIndependent_023
     * @tc.desc The payload is a snapshot: editing cursorInfo afterwards does not rewrite the last payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryPayloadSnapshotIsIndependent_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryPayloadSnapshotIsIndependent_023');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, FIRST_TOP, FIRST_WIDTH, FIRST_HEIGHT);
      model.cursorInfo.width = 99;
      logGeometry('cursorGeometryPayloadSnapshotIsIndependent_023', model);
      expect(model.lastPayload.width).assertEqual(FIRST_WIDTH);
      expect(model.cursorInfo.width).assertEqual(99);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryPayloadSnapshotIsIndependent_023');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0240
     * @tc.name cursorGeometryResetClearsCount_024
     * @tc.desc Reset returns the call counter to zero after several accepted changes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryResetClearsCount_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryResetClearsCount_024');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, 1, 0, 1, 25);
      changeAll(model, 2, 0, 1, 25);
      model.reset();
      logGeometry('cursorGeometryResetClearsCount_024', model);
      expect(model.updateCursorCalls).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryResetClearsCount_024');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0250
     * @tc.name cursorGeometryCaretSizeAfterChange_025
     * @tc.desc The rendered caret size mirrors the rectangle after an accepted area change
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryCaretSizeAfterChange_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryCaretSizeAfterChange_025');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, FIRST_TOP, FIRST_WIDTH, FIRST_HEIGHT);
      logGeometry('cursorGeometryCaretSizeAfterChange_025', model);
      expect(model.caretWidth()).assertEqual(FIRST_WIDTH);
      expect(model.caretHeight()).assertEqual(FIRST_HEIGHT);
      expect(model.caretWidth()).assertEqual(model.cursorInfo.width);
      expect(model.caretHeight()).assertEqual(model.cursorInfo.height);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryCaretSizeAfterChange_025');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0260
     * @tc.name cursorGeometryRejectedKeepsSize_026
     * @tc.desc A rejected callback keeps the rendered caret size from the previous accepted change
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryRejectedKeepsSize_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryRejectedKeepsSize_026');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, FIRST_TOP, FIRST_WIDTH, FIRST_HEIGHT);
      changeAll(model, FIRST_LEFT, FIRST_TOP, 9, 44);
      logGeometry('cursorGeometryRejectedKeepsSize_026', model);
      expect(model.caretWidth()).assertEqual(FIRST_WIDTH);
      expect(model.caretHeight()).assertEqual(FIRST_HEIGHT);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryRejectedKeepsSize_026');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0270
     * @tc.name canvasVpToPxZero_027
     * @tc.desc Zero vp converts to zero physical pixels at any density
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'canvasVpToPxZero_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasVpToPxZero_027');
      let model: CanvasMetricsModel = newCanvas(SCALE_TWO);
      TestLogger.value(TAG_CURSOR_GEOMETRY, 'px of 0vp', model.vpToPx(0).toString());
      expect(model.vpToPx(0)).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasVpToPxZero_027');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0280
     * @tc.name canvasVpToPxFontSizeScaleTwo_028
     * @tc.desc 16 vp converts to 32 px on a density-2 device
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'canvasVpToPxFontSizeScaleTwo_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasVpToPxFontSizeScaleTwo_028');
      let model: CanvasMetricsModel = newCanvas(SCALE_TWO);
      TestLogger.value(TAG_CURSOR_GEOMETRY, 'px of 16vp', model.vpToPx(16).toString());
      expect(model.vpToPx(16)).assertEqual(32);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasVpToPxFontSizeScaleTwo_028');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0290
     * @tc.name canvasOnReadyZeroWidth_029
     * @tc.desc A zero measured width is adopted as-is, leaving the text with no room
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'canvasOnReadyZeroWidth_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasOnReadyZeroWidth_029');
      let model: CanvasMetricsModel = newCanvas(SCALE_TWO);
      model.onReady(EMPTY_CANVAS);
      logCanvas('canvasOnReadyZeroWidth_029', model);
      expect(model.inputWidth).assertEqual(0);
      expect(model.maxWidth()).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasOnReadyZeroWidth_029');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0300
     * @tc.name canvasOnReadyVeryWide_030
     * @tc.desc A 1080-pixel canvas width is adopted without clamping
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'canvasOnReadyVeryWide_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasOnReadyVeryWide_030');
      let model: CanvasMetricsModel = newCanvas(SCALE_THREE);
      model.onReady(VERY_WIDE_CANVAS);
      logCanvas('canvasOnReadyVeryWide_030', model);
      expect(model.inputWidth).assertEqual(1080);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasOnReadyVeryWide_030');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0310
     * @tc.name canvasOnReadyNegativeWidth_031
     * @tc.desc A negative measured width is adopted as-is because onReady has no guard
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'canvasOnReadyNegativeWidth_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasOnReadyNegativeWidth_031');
      let model: CanvasMetricsModel = newCanvas(SCALE_TWO);
      model.onReady(NEGATIVE_CANVAS);
      logCanvas('canvasOnReadyNegativeWidth_031', model);
      expect(model.inputWidth).assertEqual(-100);
      expect(model.rowWidth()).assertEqual(-100);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasOnReadyNegativeWidth_031');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0320
     * @tc.name canvasVpToPxNegative_032
     * @tc.desc A negative vp value converts to a negative pixel value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'canvasVpToPxNegative_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasVpToPxNegative_032');
      let model: CanvasMetricsModel = newCanvas(SCALE_TWO);
      TestLogger.value(TAG_CURSOR_GEOMETRY, 'px of -16vp', model.vpToPx(-16).toString());
      expect(model.vpToPx(-16)).assertEqual(-32);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasVpToPxNegative_032');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0330
     * @tc.name canvasVpToPxNaN_033
     * @tc.desc A NaN vp value stays NaN after the conversion
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'canvasVpToPxNaN_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasVpToPxNaN_033');
      let model: CanvasMetricsModel = newCanvas(SCALE_TWO);
      TestLogger.value(TAG_CURSOR_GEOMETRY, 'NaN conversion', model.vpToPx(NaN).toString());
      expect(Number.isNaN(model.vpToPx(NaN))).assertTrue();
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasVpToPxNaN_033');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0340
     * @tc.name canvasVpToPxInfinity_034
     * @tc.desc An infinite vp value stays infinite after the conversion
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'canvasVpToPxInfinity_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasVpToPxInfinity_034');
      let model: CanvasMetricsModel = newCanvas(SCALE_TWO);
      TestLogger.value(TAG_CURSOR_GEOMETRY, 'Infinity conversion', model.vpToPx(Infinity).toString());
      expect(model.vpToPx(Infinity)).assertEqual(Infinity);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasVpToPxInfinity_034');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0350
     * @tc.name cursorGeometryResetTwice_035
     * @tc.desc Resetting twice is idempotent and keeps both counters at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryResetTwice_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryResetTwice_035');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, FIRST_TOP, FIRST_WIDTH, FIRST_HEIGHT);
      model.reset();
      model.reset();
      logGeometry('cursorGeometryResetTwice_035', model);
      expect(model.updateCursorCalls).assertEqual(0);
      expect(model.cursorInfo.left).assertEqual(0);
      expect(model.lastPayload.left).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryResetTwice_035');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0360
     * @tc.name cursorGeometryTopFromPositionOnly_036
     * @tc.desc The stored top comes from position.y, so a large global left does not leak into the top field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryTopFromPositionOnly_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryTopFromPositionOnly_036');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, 88, 3, 1, 25);
      logGeometry('cursorGeometryTopFromPositionOnly_036', model);
      expect(model.cursorInfo.left).assertEqual(88);
      expect(model.cursorInfo.top).assertEqual(3);
      expect(model.cursorInfo.top !== 88).assertTrue();
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryTopFromPositionOnly_036');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0370
     * @tc.name cursorGeometryZeroWidth_037
     * @tc.desc A zero width is stored as-is, which renders an invisible caret
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryZeroWidth_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryZeroWidth_037');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, 0, 0, 25);
      logGeometry('cursorGeometryZeroWidth_037', model);
      expect(model.cursorInfo.width).assertEqual(0);
      expect(model.caretWidth()).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryZeroWidth_037');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0380
     * @tc.name cursorGeometryZeroHeight_038
     * @tc.desc A zero height is stored as-is
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryZeroHeight_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryZeroHeight_038');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, 0, 1, 0);
      logGeometry('cursorGeometryZeroHeight_038', model);
      expect(model.cursorInfo.height).assertEqual(0);
      expect(model.caretHeight()).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryZeroHeight_038');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0390
     * @tc.name cursorGeometryZeroIgnoredAfterReset_039
     * @tc.desc After a reset a zero-left callback is ignored again because zero equals the restored default
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'cursorGeometryZeroIgnoredAfterReset_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryZeroIgnoredAfterReset_039');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, FIRST_LEFT, 0, 1, 25);
      model.reset();
      let changed: boolean = changeAll(model, 0, 6, 4, 30);
      logGeometry('cursorGeometryZeroIgnoredAfterReset_039', model);
      expect(changed).assertFalse();
      expect(model.updateCursorCalls).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryZeroIgnoredAfterReset_039');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0400
     * @tc.name canvasMaxWidthAfterNegative_040
     * @tc.desc The maxWidth constraint follows a negative canvas width without clamping
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'canvasMaxWidthAfterNegative_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasMaxWidthAfterNegative_040');
      let model: CanvasMetricsModel = newCanvas(SCALE_ONE);
      model.onReady(NEGATIVE_CANVAS);
      TestLogger.value(TAG_CURSOR_GEOMETRY, 'maxWidth', model.maxWidth().toString());
      expect(model.maxWidth()).assertEqual(-100);
      expect(model.maxWidth()).assertEqual(model.inputWidth);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasMaxWidthAfterNegative_040');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0410
     * @tc.name canvasRowWidthAfterZero_041
     * @tc.desc The Row width follows a zero canvas width without falling back to the default
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'canvasRowWidthAfterZero_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasRowWidthAfterZero_041');
      let model: CanvasMetricsModel = newCanvas(SCALE_ONE);
      model.onReady(EMPTY_CANVAS);
      TestLogger.value(TAG_CURSOR_GEOMETRY, 'rowWidth', model.rowWidth().toString());
      expect(model.rowWidth()).assertEqual(0);
      expect(model.rowWidth() !== 320).assertTrue();
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasRowWidthAfterZero_041');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0420
     * @tc.name canvasFontUsesSansSerif_042
     * @tc.desc The font string ends with the sans-serif family used by the three text slices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'canvasFontUsesSansSerif_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasFontUsesSansSerif_042');
      let model: CanvasMetricsModel = newCanvas(SCALE_ONE);
      model.onReady(WIDE_CANVAS);
      logCanvas('canvasFontUsesSansSerif_042', model);
      expect(model.fontString.endsWith('sans-serif')).assertTrue();
      expect(model.fontString.indexOf('sans-serif')).assertEqual(5);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasFontUsesSansSerif_042');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0430
     * @tc.name cursorGeometryNaNNPayload_043
     * @tc.desc A NaN left is carried into the forwarded payload unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryNaNNPayload_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryNaNNPayload_043');
      let model: CursorGeometryModel = newGeometry();
      changeAll(model, NaN, 2, 3, 27);
      logGeometry('cursorGeometryNaNNPayload_043', model);
      expect(Number.isNaN(model.lastPayload.left)).assertTrue();
      expect(model.lastPayload.top).assertEqual(2);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryNaNNPayload_043');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0440
     * @tc.name cursorGeometryMutationThenSameIgnored_044
     * @tc.desc A callback equal to a mutated left is ignored, proving the guard reads the stored field
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'cursorGeometryMutationThenSameIgnored_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'cursorGeometryMutationThenSameIgnored_044');
      let model: CursorGeometryModel = newGeometry();
      model.cursorInfo.left = 13;
      let changed: boolean = changeAll(model, 13, 6, 2, 26);
      logGeometry('cursorGeometryMutationThenSameIgnored_044', model);
      expect(changed).assertFalse();
      expect(model.updateCursorCalls).assertEqual(0);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'cursorGeometryMutationThenSameIgnored_044');
      await yieldToEventLoop();
      done();
    })

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_CURSOR_GEOMETRY_0450
     * @tc.name canvasFontAfterWidthChange_045
     * @tc.desc Changing the canvas width does not affect the font that depends only on density
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'canvasFontAfterWidthChange_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_CURSOR_GEOMETRY, 'canvasFontAfterWidthChange_045');
      let model: CanvasMetricsModel = newCanvas(SCALE_ONE_HALF);
      model.onReady(NARROW_CANVAS);
      let fontAfterNarrow: string = model.fontString;
      model.onReady(VERY_WIDE_CANVAS);
      logCanvas('canvasFontAfterWidthChange_045', model);
      expect(fontAfterNarrow).assertEqual('24px sans-serif');
      expect(model.fontString).assertEqual(fontAfterNarrow);
      expect(model.inputWidth).assertEqual(1080);
      TestLogger.end(TAG_CURSOR_GEOMETRY, 'canvasFontAfterWidthChange_045');
      await yieldToEventLoop();
      done();
    })

  });
}
