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
import bundleManager from '@ohos.bundle.bundleManager';
import {
  TextEditingModel, TextMeasure, TextState, UniformMeasure, MixedMeasure, SquareMeasure, FixedMeasure
} from '../common/TextEditingModel';
import { TestLogger } from '../common/TestLogger';
import { CASE_PREFIX, END_FLAG, TAG_COMPOSITION } from '../common/TestConstant';

/**
 * Seeded property suites for the editing state machine.
 *
 * Each case drives a deterministic sequence of controller callbacks and checks
 * the invariants that hold for that sequence family. The generator is a fixed
 * 32-bit linear congruential sequence seeded per case; no wall clock and no
 * Math.random() are involved, so the same case always executes the same steps.
 * The per-step helper asserts the rule of the action it just applied, while the
 * per-family probe at the end of a case pins an independent, easily readable
 * post-state (select-all, move-to-end, range reset, delete-everything or
 * click-at-zero).
 */

const TAG: string = TAG_COMPOSITION;
const SEED_MODULUS: number = 2147483648;
const LCG_MULTIPLIER: number = 1103515245;
const LCG_INCREMENT: number = 12345;

const FAMILY_NAVIGATION: number = 1;
const FAMILY_SELECTION: number = 2;
const FAMILY_EDITING: number = 3;
const FAMILY_TAIL: number = 4;

const FAMILY_ALL_ACTIONS: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8];
const FAMILY_NAVIGATION_ACTIONS: number[] = [3, 4];
const FAMILY_SELECTION_ACTIONS: number[] = [5, 6];
const FAMILY_EDITING_ACTIONS: number[] = [0, 1];
const FAMILY_TAIL_ACTIONS: number[] = [2, 7, 8];

const INSERT_TEXTS: string[] = ['a', 'ab', 'abc', 'hello', '12345', '中文', '😀', 'x y z', 'e\u0301', 'longer text'];
const DELETE_LENGTHS: number[] = [0, 1, 2, 3, 10, 100, -1, 1.5, NaN, Infinity];
const MOVE_DIRECTIONS: number[] = [1, 2, 3, 4, 0, 5, -1, NaN];
const MOVEMENT_DIRECTIONS: number[] = [1, 2, 3, 4, 0, 5, NaN];
const RANGE_PAIRS: number[][] = [
  [0, 0], [0, 6], [2, 5], [5, 2], [3, 3], [0, END_FLAG], [2, END_FLAG],
  [-1, 3], [2, -1], [NaN, 2], [2, NaN], [0, Infinity], [-Infinity, 5]
];
const EXTEND_ACTIONS: number[] = [0, 3, 4, 5, 1, -1, NaN];
const CALCULATE_POINTS: number[] = [-100, -5, 0, 5, 10, 25, 100, 1000, Infinity, -Infinity, NaN];
const CHANGE_PAIRS: number[][] = [
  [0, 0], [0, 5], [2, 4], [4, 2], [-1, 3], [3, 100], [1, 1],
  [NaN, 2], [2, NaN], [Infinity, 2], [2, Infinity], [-Infinity, -1]
];

/** Fixed 32-bit linear congruential generator. */
export class RandomSource {
  private state: number;

  constructor(seed: number) {
    let normalized: number = seed % SEED_MODULUS;
    if (normalized < 0) {
      normalized = normalized + SEED_MODULUS;
    }
    this.state = normalized;
  }

  next(): number {
    this.state = (this.state * LCG_MULTIPLIER + LCG_INCREMENT) % SEED_MODULUS;
    return this.state;
  }

  nextInt(bound: number): number {
    if (bound <= 0) {
      return 0;
    }
    return this.next() % bound;
  }
}

/** Six width behaviours: uniform scales, mixed, square and fixed. */
export function buildMeasure(kind: number): TextMeasure {
  if (kind === 0) {
    return new UniformMeasure(10);
  }
  if (kind === 1) {
    return new UniformMeasure(1);
  }
  if (kind === 2) {
    return new UniformMeasure(0.5);
  }
  if (kind === 3) {
    return new MixedMeasure(8, 16);
  }
  if (kind === 4) {
    return new SquareMeasure(0.5);
  }
  return new FixedMeasure(2);
}

/** Six preloaded editor states, selected by the seed. */
export function buildModel(measure: TextMeasure, width: number, seed: number): TextEditingModel {
  let model: TextEditingModel = new TextEditingModel(measure, width);
  let variant: number = seed % 6;
  if (variant === 0) {
    model.loadPlain('', '', '');
  }
  if (variant === 1) {
    model.loadPlain('abc', '', '');
  }
  if (variant === 2) {
    model.loadPlain('ab', 'cd', 'ef');
  }
  if (variant === 3) {
    model.loadPlain('', '', 'xyz');
  }
  if (variant === 4) {
    model.loadPlain('中文😀', '', '');
  }
  if (variant === 5) {
    model.loadPlain('hello', '', 'world');
  }
  return model;
}

function pickAction(rng: RandomSource, family: number): number {
  let pool: number[] = FAMILY_ALL_ACTIONS;
  if (family === FAMILY_NAVIGATION) {
    pool = FAMILY_NAVIGATION_ACTIONS;
  }
  if (family === FAMILY_SELECTION) {
    pool = FAMILY_SELECTION_ACTIONS;
  }
  if (family === FAMILY_EDITING) {
    pool = FAMILY_EDITING_ACTIONS;
  }
  if (family === FAMILY_TAIL) {
    pool = FAMILY_TAIL_ACTIONS;
  }
  let action: number = pool[rng.nextInt(pool.length)];
  return action;
}

/** Applies one callback and asserts the rule that callback promises. */
function applyStep(model: TextEditingModel, rng: RandomSource, family: number): void {
  let action: number = pickAction(rng, family);
  let measure: TextMeasure = model.getMeasure();
  if (action === 0) {
    let text: string = INSERT_TEXTS[rng.nextInt(INSERT_TEXTS.length)];
    let before: TextState = model.snapshot();
    let accepted: boolean = model.insertText(text);
    if (accepted) {
      expect(model.message()).assertEqual(before.inputText + text + before.lastInput);
      expect(model.cursorIndex).assertEqual(model.inputText.length);
      expectSameNumber(model.selectIndex, model.cursorIndex);
      expect(model.selectInput).assertEqual('');
      expectSameNumber(model.cursorLeft, measure.widthOf(model.inputText));
    } else {
      let after: TextState = model.snapshot();
      expect(after.inputText).assertEqual(before.inputText);
      expect(after.selectInput).assertEqual(before.selectInput);
      expect(after.lastInput).assertEqual(before.lastInput);
      expectSameNumber(after.cursorIndex, before.cursorIndex);
      expectSameNumber(after.selectIndex, before.selectIndex);
      expectSameNumber(after.cursorLeft, before.cursorLeft);
    }
    return;
  }
  if (action === 1) {
    let length: number = DELETE_LENGTHS[rng.nextInt(DELETE_LENGTHS.length)];
    let before: TextState = model.snapshot();
    model.deleteLeft(length);
    expect(model.inputText).assertEqual(before.inputText.substring(0, before.inputText.length - length));
    expect(model.selectInput).assertEqual(before.selectInput);
    expect(model.lastInput).assertEqual(before.lastInput);
    expect(model.cursorIndex).assertEqual(model.inputText.length);
    expectSameNumber(model.selectIndex, model.cursorIndex);
    expectSameNumber(model.cursorLeft, measure.widthOf(model.inputText));
    return;
  }
  if (action === 2) {
    let length: number = DELETE_LENGTHS[rng.nextInt(DELETE_LENGTHS.length)];
    let before: TextState = model.snapshot();
    let beforeMessage: string = model.message();
    model.deleteRight(length);
    if (before.cursorIndex < beforeMessage.length) {
      expect(model.inputText).assertEqual(before.inputText);
      expectSameNumber(model.cursorIndex, before.cursorIndex);
      expectSameNumber(model.cursorLeft, before.cursorLeft);
      let sameAnchor: boolean = model.selectIndex === before.cursorIndex ||
        (Number.isNaN(model.selectIndex) && Number.isNaN(before.cursorIndex));
      expect(sameAnchor).assertTrue();
      expect(model.selectInput).assertEqual('');
      expect(model.lastInput).assertEqual(beforeMessage.substring(before.cursorIndex + length));
    } else {
      let after: TextState = model.snapshot();
      expect(after.inputText).assertEqual(before.inputText);
      expect(after.selectInput).assertEqual(before.selectInput);
      expect(after.lastInput).assertEqual(before.lastInput);
      expectSameNumber(after.cursorIndex, before.cursorIndex);
      expectSameNumber(after.selectIndex, before.selectIndex);
      expectSameNumber(after.cursorLeft, before.cursorLeft);
    }
    return;
  }
  if (action === 3) {
    let direction: number = MOVE_DIRECTIONS[rng.nextInt(MOVE_DIRECTIONS.length)];
    let beforeMessage: string = model.message();
    model.moveCursor(direction);
    expect(model.message()).assertEqual(beforeMessage);
    expect(model.inputText + model.lastInput).assertEqual(beforeMessage);
    let sameCaret: boolean = model.selectIndex === model.cursorIndex ||
      (Number.isNaN(model.selectIndex) && Number.isNaN(model.cursorIndex));
    expect(sameCaret).assertTrue();
    expectSameNumber(model.cursorLeft, measure.widthOf(model.inputText));
    return;
  }
  if (action === 4) {
    let direction: number = MOVEMENT_DIRECTIONS[rng.nextInt(MOVEMENT_DIRECTIONS.length)];
    let beforeMessage: string = model.message();
    model.selectByMovement(direction);
    expect(model.message()).assertEqual(beforeMessage);
    expect(model.inputText + model.selectInput + model.lastInput).assertEqual(beforeMessage);
    return;
  }
  if (action === 5) {
    let pair: number[] = RANGE_PAIRS[rng.nextInt(RANGE_PAIRS.length)];
    let start: number = pair[0];
    let end: number = pair[1];
    let before: TextState = model.snapshot();
    let beforeMessage: string = model.message();
    model.selectByRange(start, end);
    if (start === 0 && end === 0) {
      expect(model.message()).assertEqual(beforeMessage);
      expect(model.cursorIndex).assertEqual(0);
      expect(model.selectIndex).assertEqual(0);
      expect(model.inputText).assertEqual('');
      expect(model.selectInput).assertEqual('');
      expect(model.lastInput).assertEqual(beforeMessage);
      expectSameNumber(model.cursorLeft, measure.widthOf(''));
    } else if (end > start && end === END_FLAG) {
      expect(model.message()).assertEqual(beforeMessage);
      expect(model.lastInput).assertEqual('');
      expect(model.selectIndex).assertEqual(beforeMessage.length);
      expect(model.inputText).assertEqual(beforeMessage.substring(0, before.cursorIndex));
      expect(model.selectInput).assertEqual(beforeMessage.substring(before.cursorIndex, beforeMessage.length));
      expectSameNumber(model.cursorLeft, before.cursorLeft);
    } else if (end > start) {
      expect(model.message()).assertEqual(beforeMessage);
      expect(model.selectIndex).assertEqual(0);
      expect(model.inputText).assertEqual('');
      expect(model.selectInput).assertEqual(beforeMessage.substring(0, before.cursorIndex));
      expect(model.lastInput).assertEqual(beforeMessage.substring(before.cursorIndex));
      expectSameNumber(model.cursorLeft, before.cursorLeft);
    } else {
      expect(model.cursorIndex).assertEqual(beforeMessage.length);
      expectSameNumber(model.selectIndex, model.cursorIndex);
      expect(model.inputText).assertEqual(beforeMessage);
      expect(model.lastInput).assertEqual('');
      expect(model.selectInput).assertEqual(before.selectInput);
      expectSameNumber(model.cursorLeft, measure.widthOf(beforeMessage));
    }
    return;
  }
  if (action === 6) {
    let extendAction: number = EXTEND_ACTIONS[rng.nextInt(EXTEND_ACTIONS.length)];
    let before: TextState = model.snapshot();
    let beforeMessage: string = model.message();
    model.handleExtendAction(extendAction);
    if (extendAction === 0) {
      expect(model.message()).assertEqual(beforeMessage);
      expect(model.inputText).assertEqual('');
      expect(model.lastInput).assertEqual('');
      expect(model.cursorIndex).assertEqual(beforeMessage.length);
      expect(model.selectIndex).assertEqual(0);
      expect(model.selectInput).assertEqual(beforeMessage);
      expectSameNumber(model.cursorLeft, measure.widthOf(beforeMessage));
    } else {
      let after: TextState = model.snapshot();
      expect(after.inputText).assertEqual(before.inputText);
      expect(after.selectInput).assertEqual(before.selectInput);
      expect(after.lastInput).assertEqual(before.lastInput);
      expectSameNumber(after.cursorIndex, before.cursorIndex);
      expectSameNumber(after.selectIndex, before.selectIndex);
      expectSameNumber(after.cursorLeft, before.cursorLeft);
    }
    return;
  }
  if (action === 7) {
    let point: number = CALCULATE_POINTS[rng.nextInt(CALCULATE_POINTS.length)];
    let beforeMessage: string = model.message();
    model.calculateCursor(point);
    expect(model.selectInput).assertEqual('');
    expect(model.inputText + model.lastInput).assertEqual(beforeMessage);
    expectSameNumber(model.cursorLeft, measure.widthOf(model.inputText));
    if (!Number.isNaN(model.cursorIndex)) {
      expect(model.cursorIndex >= 0).assertTrue();
      expect(model.cursorIndex <= beforeMessage.length).assertTrue();
    }
    return;
  }
  let pair: number[] = CHANGE_PAIRS[rng.nextInt(CHANGE_PAIRS.length)];
  let start: number = pair[0];
  let end: number = pair[1];
  let beforeMessage: string = model.message();
  model.changeSelection(start, end);
  expectSameNumber(model.cursorLeft, measure.widthOf(model.inputText + model.selectInput));
  if (!Number.isNaN(start) && !Number.isNaN(end)) {
    expect(model.message()).assertEqual(beforeMessage);
    expect(model.inputText + model.selectInput).assertEqual(beforeMessage.substring(0, model.cursorIndex));
    if (!Number.isNaN(model.cursorIndex)) {
      expect(model.cursorIndex <= beforeMessage.length).assertTrue();
    }
  }
}

export function runSeeded(model: TextEditingModel, seed: number, steps: number, family: number): void {
  let rng: RandomSource = new RandomSource(seed);
  let index: number = 0;
  while (index < steps) {
    applyStep(model, rng, family);
    index++;
  }
}

export function assertIntegralIndices(model: TextEditingModel): void {
  let cursorIntegral: boolean = Number.isNaN(model.cursorIndex) ||
    model.cursorIndex === Math.floor(model.cursorIndex);
  let selectIntegral: boolean = Number.isNaN(model.selectIndex) ||
    model.selectIndex === Math.floor(model.selectIndex);
  expect(cursorIntegral).assertTrue();
  expect(selectIntegral).assertTrue();
}

export function assertSelectAllProbe(model: TextEditingModel): void {
  let measure: TextMeasure = model.getMeasure();
  let message: string = model.message();
  model.handleExtendAction(0);
  expect(model.inputText).assertEqual('');
  expect(model.lastInput).assertEqual('');
  expect(model.cursorIndex).assertEqual(message.length);
  expect(model.selectIndex).assertEqual(0);
  expect(model.selectInput).assertEqual(message);
  expectSameNumber(model.cursorLeft, measure.widthOf(message));
}

export function assertMoveDownProbe(model: TextEditingModel): void {
  let measure: TextMeasure = model.getMeasure();
  let message: string = model.message();
  model.moveCursor(2);
  expect(model.inputText).assertEqual(message);
  expect(model.lastInput).assertEqual('');
  expect(model.cursorIndex).assertEqual(message.length);
  expectSameNumber(model.selectIndex, model.cursorIndex);
  expectSameNumber(model.cursorLeft, measure.widthOf(message));
}

export function assertRangeResetProbe(model: TextEditingModel): void {
  let measure: TextMeasure = model.getMeasure();
  let message: string = model.message();
  model.selectByRange(0, 0);
  expect(model.cursorIndex).assertEqual(0);
  expect(model.selectIndex).assertEqual(0);
  expect(model.inputText).assertEqual('');
  expect(model.selectInput).assertEqual('');
  expect(model.lastInput).assertEqual(message);
  expectSameNumber(model.cursorLeft, measure.widthOf(''));
}

export function assertDeleteAllProbe(model: TextEditingModel): void {
  let measure: TextMeasure = model.getMeasure();
  let message: string = model.message();
  let beforeLast: string = model.lastInput;
  model.deleteLeft(message.length + 1);
  expect(model.inputText).assertEqual('');
  expect(model.cursorIndex).assertEqual(0);
  expect(model.selectIndex).assertEqual(0);
  expectSameNumber(model.cursorLeft, measure.widthOf(''));
  expect(model.lastInput).assertEqual(beforeLast);
}

function expectSameNumber(actual: number, expected: number): void {
  let bothNaN: boolean = Number.isNaN(actual) && Number.isNaN(expected);
  expect(bothNaN || actual === expected).assertTrue();
}

async function yieldToEventLoop(): Promise<void> {
  try {
    await bundleManager.getBundleInfoForSelf(0);
    return;
  } catch (error) {
    // Fall through to the timer based yield when the bundle service fails.
  }
  await new Promise<void>((resolve: Function) => {
    setTimeout(() => {
      resolve();
    }, 5);
  });
}

export default function textInvariantPropertyTest(): void {
  describe('CustomInputTextInvariantPropertyTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0010
     * @tc.name invariantAllSweep001
     * @tc.desc A 12-step seeded run (seed 1, uniform 1 px per code unit, a canvas of 100 px) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_001', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_001');
      let measure: TextMeasure = buildMeasure(1);
      let model: TextEditingModel = buildModel(measure, 100, 1);
      runSeeded(model, 1, 12, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0020
     * @tc.name invariantAllSweep002
     * @tc.desc A 16-step seeded run (seed 2, uniform half-pixel per code unit, a canvas of 60 px) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_002', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_002');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 60, 2);
      runSeeded(model, 2, 16, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0030
     * @tc.name invariantAllSweep003
     * @tc.desc A 24-step seeded run (seed 3, 8 px ASCII and 16 px wide characters, a canvas of 1000 px) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_003', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_003');
      let measure: TextMeasure = buildMeasure(3);
      let model: TextEditingModel = buildModel(measure, 1000, 3);
      runSeeded(model, 3, 24, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0040
     * @tc.name invariantAllSweep004
     * @tc.desc A 40-step seeded run (seed 4, square-law widths of half a pixel times length squared, a zero-width canvas) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_004', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_004');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 0, 4);
      runSeeded(model, 4, 40, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0050
     * @tc.name invariantAllSweep005
     * @tc.desc A 8-step seeded run (seed 5, a constant 2 px width for every string, a canvas of 20 px) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_005', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_005');
      let measure: TextMeasure = buildMeasure(5);
      let model: TextEditingModel = buildModel(measure, 20, 5);
      runSeeded(model, 5, 8, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0060
     * @tc.name invariantAllSweep006
     * @tc.desc A 12-step seeded run (seed 6, uniform 10 px per code unit, a one-million-pixel canvas that never closes the guard) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_006', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_006');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 1000000, 6);
      runSeeded(model, 6, 12, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0070
     * @tc.name invariantAllSweep007
     * @tc.desc A 16-step seeded run (seed 7, uniform 1 px per code unit, a negative-width canvas that rejects even empty insertions) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_007', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_007');
      let measure: TextMeasure = buildMeasure(1);
      let model: TextEditingModel = buildModel(measure, -5, 7);
      runSeeded(model, 7, 16, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0080
     * @tc.name invariantAllSweep008
     * @tc.desc A 8-step seeded run (seed 10, square-law widths of half a pixel times length squared, a canvas of 320 px) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_008', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_008');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 320, 10);
      runSeeded(model, 10, 8, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0090
     * @tc.name invariantAllSweep009
     * @tc.desc A 16-step seeded run (seed 12, uniform 10 px per code unit, a canvas of 60 px) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_009', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_009');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 60, 12);
      runSeeded(model, 12, 16, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0100
     * @tc.name invariantAllSweep010
     * @tc.desc A 40-step seeded run (seed 14, uniform half-pixel per code unit, a zero-width canvas) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_010', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_010');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 0, 14);
      runSeeded(model, 14, 40, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0110
     * @tc.name invariantAllSweep011
     * @tc.desc A 12-step seeded run (seed 16, square-law widths of half a pixel times length squared, a one-million-pixel canvas that never closes the guard) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_011', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_011');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 1000000, 16);
      runSeeded(model, 16, 12, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0120
     * @tc.name invariantAllSweep012
     * @tc.desc A 16-step seeded run (seed 17, a constant 2 px width for every string, a negative-width canvas that rejects even empty insertions) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_012', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_012');
      let measure: TextMeasure = buildMeasure(5);
      let model: TextEditingModel = buildModel(measure, -5, 17);
      runSeeded(model, 17, 16, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0130
     * @tc.name invariantAllSweep013
     * @tc.desc A 40-step seeded run (seed 24, uniform 10 px per code unit, a zero-width canvas) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_013', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_013');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 0, 24);
      runSeeded(model, 24, 40, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0140
     * @tc.name invariantAllSweep014
     * @tc.desc A 12-step seeded run (seed 26, uniform half-pixel per code unit, a one-million-pixel canvas that never closes the guard) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_014', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_014');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 1000000, 26);
      runSeeded(model, 26, 12, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0150
     * @tc.name invariantAllSweep015
     * @tc.desc A 16-step seeded run (seed 27, 8 px ASCII and 16 px wide characters, a negative-width canvas that rejects even empty insertions) keeps composition, index integrality and cursor-left consistency across every callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantAllSweep_015', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantAllSweep_015');
      let measure: TextMeasure = buildMeasure(3);
      let model: TextEditingModel = buildModel(measure, -5, 27);
      runSeeded(model, 27, 16, 0);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertSelectAllProbe(model);
      TestLogger.end(TAG, 'invariantAllSweep_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0160
     * @tc.name invariantNavSweep016
     * @tc.desc A 12-step seeded run (seed 41, a constant 2 px width for every string, a canvas of 100 px) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_016', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_016');
      let measure: TextMeasure = buildMeasure(5);
      let model: TextEditingModel = buildModel(measure, 100, 41);
      runSeeded(model, 41, 12, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0170
     * @tc.name invariantNavSweep017
     * @tc.desc A 16-step seeded run (seed 42, uniform 10 px per code unit, a canvas of 60 px) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_017', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_017');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 60, 42);
      runSeeded(model, 42, 16, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0180
     * @tc.name invariantNavSweep018
     * @tc.desc A 24-step seeded run (seed 43, uniform 1 px per code unit, a canvas of 1000 px) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_018', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_018');
      let measure: TextMeasure = buildMeasure(1);
      let model: TextEditingModel = buildModel(measure, 1000, 43);
      runSeeded(model, 43, 24, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0190
     * @tc.name invariantNavSweep019
     * @tc.desc A 40-step seeded run (seed 44, uniform half-pixel per code unit, a zero-width canvas) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_019', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_019');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 0, 44);
      runSeeded(model, 44, 40, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0200
     * @tc.name invariantNavSweep020
     * @tc.desc A 8-step seeded run (seed 45, 8 px ASCII and 16 px wide characters, a canvas of 20 px) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_020', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_020');
      let measure: TextMeasure = buildMeasure(3);
      let model: TextEditingModel = buildModel(measure, 20, 45);
      runSeeded(model, 45, 8, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0210
     * @tc.name invariantNavSweep021
     * @tc.desc A 12-step seeded run (seed 46, square-law widths of half a pixel times length squared, a one-million-pixel canvas that never closes the guard) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_021', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_021');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 1000000, 46);
      runSeeded(model, 46, 12, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0220
     * @tc.name invariantNavSweep022
     * @tc.desc A 16-step seeded run (seed 47, a constant 2 px width for every string, a negative-width canvas that rejects even empty insertions) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_022', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_022');
      let measure: TextMeasure = buildMeasure(5);
      let model: TextEditingModel = buildModel(measure, -5, 47);
      runSeeded(model, 47, 16, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0230
     * @tc.name invariantNavSweep023
     * @tc.desc A 8-step seeded run (seed 50, uniform half-pixel per code unit, a canvas of 320 px) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_023', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_023');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 320, 50);
      runSeeded(model, 50, 8, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0240
     * @tc.name invariantNavSweep024
     * @tc.desc A 16-step seeded run (seed 52, square-law widths of half a pixel times length squared, a canvas of 60 px) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_024', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_024');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 60, 52);
      runSeeded(model, 52, 16, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0250
     * @tc.name invariantNavSweep025
     * @tc.desc A 40-step seeded run (seed 54, uniform 10 px per code unit, a zero-width canvas) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_025', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_025');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 0, 54);
      runSeeded(model, 54, 40, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0260
     * @tc.name invariantNavSweep026
     * @tc.desc A 12-step seeded run (seed 56, uniform half-pixel per code unit, a one-million-pixel canvas that never closes the guard) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_026', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_026');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 1000000, 56);
      runSeeded(model, 56, 12, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0270
     * @tc.name invariantNavSweep027
     * @tc.desc A 16-step seeded run (seed 57, 8 px ASCII and 16 px wide characters, a negative-width canvas that rejects even empty insertions) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_027', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_027');
      let measure: TextMeasure = buildMeasure(3);
      let model: TextEditingModel = buildModel(measure, -5, 57);
      runSeeded(model, 57, 16, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0280
     * @tc.name invariantNavSweep028
     * @tc.desc A 40-step seeded run (seed 64, square-law widths of half a pixel times length squared, a zero-width canvas) keeps message preservation through cursor moves and anchor movements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantNavSweep_028', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantNavSweep_028');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 0, 64);
      runSeeded(model, 64, 40, 1);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertMoveDownProbe(model);
      TestLogger.end(TAG, 'invariantNavSweep_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0290
     * @tc.name invariantSelectSweep029
     * @tc.desc A 8-step seeded run (seed 65, a constant 2 px width for every string, a canvas of 20 px) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_029', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_029');
      let measure: TextMeasure = buildMeasure(5);
      let model: TextEditingModel = buildModel(measure, 20, 65);
      runSeeded(model, 65, 8, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0300
     * @tc.name invariantSelectSweep030
     * @tc.desc A 12-step seeded run (seed 66, uniform 10 px per code unit, a one-million-pixel canvas that never closes the guard) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_030', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_030');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 1000000, 66);
      runSeeded(model, 66, 12, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0310
     * @tc.name invariantSelectSweep031
     * @tc.desc A 16-step seeded run (seed 67, uniform 1 px per code unit, a negative-width canvas that rejects even empty insertions) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_031', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_031');
      let measure: TextMeasure = buildMeasure(1);
      let model: TextEditingModel = buildModel(measure, -5, 67);
      runSeeded(model, 67, 16, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0320
     * @tc.name invariantSelectSweep032
     * @tc.desc A 24-step seeded run (seed 68, uniform half-pixel per code unit, a canvas of 320 px) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_032', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_032');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 320, 68);
      runSeeded(model, 68, 24, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_032');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0330
     * @tc.name invariantSelectSweep033
     * @tc.desc A 40-step seeded run (seed 69, 8 px ASCII and 16 px wide characters, a canvas of 100 px) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_033', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_033');
      let measure: TextMeasure = buildMeasure(3);
      let model: TextEditingModel = buildModel(measure, 100, 69);
      runSeeded(model, 69, 40, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_033');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0340
     * @tc.name invariantSelectSweep034
     * @tc.desc A 8-step seeded run (seed 70, square-law widths of half a pixel times length squared, a canvas of 320 px) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_034', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_034');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 320, 70);
      runSeeded(model, 70, 8, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_034');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0350
     * @tc.name invariantSelectSweep035
     * @tc.desc A 16-step seeded run (seed 72, uniform 10 px per code unit, a canvas of 60 px) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_035', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_035');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 60, 72);
      runSeeded(model, 72, 16, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_035');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0360
     * @tc.name invariantSelectSweep036
     * @tc.desc A 24-step seeded run (seed 73, uniform 1 px per code unit, a canvas of 1000 px) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_036', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_036');
      let measure: TextMeasure = buildMeasure(1);
      let model: TextEditingModel = buildModel(measure, 1000, 73);
      runSeeded(model, 73, 24, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_036');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0370
     * @tc.name invariantSelectSweep037
     * @tc.desc A 40-step seeded run (seed 74, uniform half-pixel per code unit, a zero-width canvas) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_037', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_037');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 0, 74);
      runSeeded(model, 74, 40, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_037');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0380
     * @tc.name invariantSelectSweep038
     * @tc.desc A 12-step seeded run (seed 76, square-law widths of half a pixel times length squared, a one-million-pixel canvas that never closes the guard) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_038', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_038');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 1000000, 76);
      runSeeded(model, 76, 12, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_038');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0390
     * @tc.name invariantSelectSweep039
     * @tc.desc A 16-step seeded run (seed 77, a constant 2 px width for every string, a negative-width canvas that rejects even empty insertions) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_039', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_039');
      let measure: TextMeasure = buildMeasure(5);
      let model: TextEditingModel = buildModel(measure, -5, 77);
      runSeeded(model, 77, 16, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_039');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0400
     * @tc.name invariantSelectSweep040
     * @tc.desc A 40-step seeded run (seed 84, uniform 10 px per code unit, a zero-width canvas) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_040', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_040');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 0, 84);
      runSeeded(model, 84, 40, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_040');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0410
     * @tc.name invariantSelectSweep041
     * @tc.desc A 12-step seeded run (seed 86, uniform half-pixel per code unit, a one-million-pixel canvas that never closes the guard) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_041', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_041');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 1000000, 86);
      runSeeded(model, 86, 12, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_041');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0420
     * @tc.name invariantSelectSweep042
     * @tc.desc A 16-step seeded run (seed 87, 8 px ASCII and 16 px wide characters, a negative-width canvas that rejects even empty insertions) keeps message preservation through range selections and extend actions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantSelectSweep_042', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantSelectSweep_042');
      let measure: TextMeasure = buildMeasure(3);
      let model: TextEditingModel = buildModel(measure, -5, 87);
      runSeeded(model, 87, 16, 2);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertRangeResetProbe(model);
      TestLogger.end(TAG, 'invariantSelectSweep_042');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0430
     * @tc.name invariantEditSweep043
     * @tc.desc A 40-step seeded run (seed 89, a constant 2 px width for every string, a canvas of 100 px) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_043', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_043');
      let measure: TextMeasure = buildMeasure(5);
      let model: TextEditingModel = buildModel(measure, 100, 89);
      runSeeded(model, 89, 40, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_043');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0440
     * @tc.name invariantEditSweep044
     * @tc.desc A 8-step seeded run (seed 90, uniform 10 px per code unit, a canvas of 320 px) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_044', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_044');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 320, 90);
      runSeeded(model, 90, 8, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_044');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0450
     * @tc.name invariantEditSweep045
     * @tc.desc A 12-step seeded run (seed 91, uniform 1 px per code unit, a canvas of 100 px) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_045', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_045');
      let measure: TextMeasure = buildMeasure(1);
      let model: TextEditingModel = buildModel(measure, 100, 91);
      runSeeded(model, 91, 12, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_045');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0460
     * @tc.name invariantEditSweep046
     * @tc.desc A 16-step seeded run (seed 92, uniform half-pixel per code unit, a canvas of 60 px) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_046', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_046');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 60, 92);
      runSeeded(model, 92, 16, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_046');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0470
     * @tc.name invariantEditSweep047
     * @tc.desc A 24-step seeded run (seed 93, 8 px ASCII and 16 px wide characters, a canvas of 1000 px) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_047', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_047');
      let measure: TextMeasure = buildMeasure(3);
      let model: TextEditingModel = buildModel(measure, 1000, 93);
      runSeeded(model, 93, 24, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_047');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0480
     * @tc.name invariantEditSweep048
     * @tc.desc A 40-step seeded run (seed 94, square-law widths of half a pixel times length squared, a zero-width canvas) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_048', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_048');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 0, 94);
      runSeeded(model, 94, 40, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_048');
      await yieldToEventLoop();
      done();
    });
  });
}
