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

export function assertClickLeftProbe(model: TextEditingModel): void {
  let measure: TextMeasure = model.getMeasure();
  let message: string = model.message();
  model.calculateCursor(-1);
  expect(model.inputText).assertEqual('');
  expect(model.lastInput).assertEqual(message);
  expectSameNumber(model.cursorLeft, measure.widthOf(''));
  if (message.length > 0) {
    expect(model.cursorIndex).assertEqual(0);
  } else {
    expect(Number.isNaN(model.cursorIndex)).assertTrue();
  }
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

export default function textInvariantPropertyTestExtra(): void {
  describe('CustomInputTextInvariantPropertyExtraTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0490
     * @tc.name invariantEditSweep049
     * @tc.desc A 12-step seeded run (seed 96, uniform 10 px per code unit, a one-million-pixel canvas that never closes the guard) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_049', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_049');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 1000000, 96);
      runSeeded(model, 96, 12, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_049');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0500
     * @tc.name invariantEditSweep050
     * @tc.desc A 16-step seeded run (seed 97, uniform 1 px per code unit, a negative-width canvas that rejects even empty insertions) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_050', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_050');
      let measure: TextMeasure = buildMeasure(1);
      let model: TextEditingModel = buildModel(measure, -5, 97);
      runSeeded(model, 97, 16, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_050');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0510
     * @tc.name invariantEditSweep051
     * @tc.desc A 8-step seeded run (seed 100, square-law widths of half a pixel times length squared, a canvas of 320 px) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_051', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_051');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 320, 100);
      runSeeded(model, 100, 8, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_051');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0520
     * @tc.name invariantEditSweep052
     * @tc.desc A 40-step seeded run (seed 104, uniform half-pixel per code unit, a zero-width canvas) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_052', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_052');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 0, 104);
      runSeeded(model, 104, 40, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_052');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0530
     * @tc.name invariantEditSweep053
     * @tc.desc A 12-step seeded run (seed 106, square-law widths of half a pixel times length squared, a one-million-pixel canvas that never closes the guard) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_053', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_053');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 1000000, 106);
      runSeeded(model, 106, 12, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_053');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0540
     * @tc.name invariantEditSweep054
     * @tc.desc A 16-step seeded run (seed 107, a constant 2 px width for every string, a negative-width canvas that rejects even empty insertions) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_054', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_054');
      let measure: TextMeasure = buildMeasure(5);
      let model: TextEditingModel = buildModel(measure, -5, 107);
      runSeeded(model, 107, 16, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_054');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0550
     * @tc.name invariantEditSweep055
     * @tc.desc A 40-step seeded run (seed 114, uniform 10 px per code unit, a zero-width canvas) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_055', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_055');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 0, 114);
      runSeeded(model, 114, 40, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_055');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0560
     * @tc.name invariantEditSweep056
     * @tc.desc A 12-step seeded run (seed 116, uniform half-pixel per code unit, a one-million-pixel canvas that never closes the guard) keeps the append rule and the truncation rule under repeated inserts and left deletes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantEditSweep_056', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantEditSweep_056');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 1000000, 116);
      runSeeded(model, 116, 12, 3);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertDeleteAllProbe(model);
      TestLogger.end(TAG, 'invariantEditSweep_056');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0570
     * @tc.name invariantTailSweep057
     * @tc.desc A 16-step seeded run (seed 117, 8 px ASCII and 16 px wide characters, a negative-width canvas that rejects even empty insertions) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_057', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_057');
      let measure: TextMeasure = buildMeasure(3);
      let model: TextEditingModel = buildModel(measure, -5, 117);
      runSeeded(model, 117, 16, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_057');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0580
     * @tc.name invariantTailSweep058
     * @tc.desc A 24-step seeded run (seed 118, square-law widths of half a pixel times length squared, a canvas of 320 px) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_058', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_058');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 320, 118);
      runSeeded(model, 118, 24, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_058');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0590
     * @tc.name invariantTailSweep059
     * @tc.desc A 40-step seeded run (seed 119, a constant 2 px width for every string, a canvas of 100 px) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_059', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_059');
      let measure: TextMeasure = buildMeasure(5);
      let model: TextEditingModel = buildModel(measure, 100, 119);
      runSeeded(model, 119, 40, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_059');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0600
     * @tc.name invariantTailSweep060
     * @tc.desc A 8-step seeded run (seed 120, uniform 10 px per code unit, a canvas of 320 px) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_060', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_060');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 320, 120);
      runSeeded(model, 120, 8, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_060');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0610
     * @tc.name invariantTailSweep061
     * @tc.desc A 12-step seeded run (seed 121, uniform 1 px per code unit, a canvas of 100 px) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_061', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_061');
      let measure: TextMeasure = buildMeasure(1);
      let model: TextEditingModel = buildModel(measure, 100, 121);
      runSeeded(model, 121, 12, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_061');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0620
     * @tc.name invariantTailSweep062
     * @tc.desc A 16-step seeded run (seed 122, uniform half-pixel per code unit, a canvas of 60 px) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_062', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_062');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 60, 122);
      runSeeded(model, 122, 16, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_062');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0630
     * @tc.name invariantTailSweep063
     * @tc.desc A 24-step seeded run (seed 123, 8 px ASCII and 16 px wide characters, a canvas of 1000 px) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_063', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_063');
      let measure: TextMeasure = buildMeasure(3);
      let model: TextEditingModel = buildModel(measure, 1000, 123);
      runSeeded(model, 123, 24, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_063');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0640
     * @tc.name invariantTailSweep064
     * @tc.desc A 40-step seeded run (seed 124, square-law widths of half a pixel times length squared, a zero-width canvas) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_064', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_064');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 0, 124);
      runSeeded(model, 124, 40, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_064');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0650
     * @tc.name invariantTailSweep065
     * @tc.desc A 12-step seeded run (seed 126, uniform 10 px per code unit, a one-million-pixel canvas that never closes the guard) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_065', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_065');
      let measure: TextMeasure = buildMeasure(0);
      let model: TextEditingModel = buildModel(measure, 1000000, 126);
      runSeeded(model, 126, 12, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_065');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0660
     * @tc.name invariantTailSweep066
     * @tc.desc A 16-step seeded run (seed 127, uniform 1 px per code unit, a negative-width canvas that rejects even empty insertions) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_066', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_066');
      let measure: TextMeasure = buildMeasure(1);
      let model: TextEditingModel = buildModel(measure, -5, 127);
      runSeeded(model, 127, 16, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_066');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0670
     * @tc.name invariantTailSweep067
     * @tc.desc A 40-step seeded run (seed 134, uniform half-pixel per code unit, a zero-width canvas) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_067', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_067');
      let measure: TextMeasure = buildMeasure(2);
      let model: TextEditingModel = buildModel(measure, 0, 134);
      runSeeded(model, 134, 40, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_067');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0680
     * @tc.name invariantTailSweep068
     * @tc.desc A 12-step seeded run (seed 136, square-law widths of half a pixel times length squared, a one-million-pixel canvas that never closes the guard) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_068', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_068');
      let measure: TextMeasure = buildMeasure(4);
      let model: TextEditingModel = buildModel(measure, 1000000, 136);
      runSeeded(model, 136, 12, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_068');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0690
     * @tc.name invariantTailSweep069
     * @tc.desc A 16-step seeded run (seed 137, a constant 2 px width for every string, a negative-width canvas that rejects even empty insertions) keeps forward deletion, click-to-caret and explicit selection rules
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantTailSweep_069', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantTailSweep_069');
      let measure: TextMeasure = buildMeasure(5);
      let model: TextEditingModel = buildModel(measure, -5, 137);
      runSeeded(model, 137, 16, 4);
      TestLogger.value(TAG, 'final', JSON.stringify(model.snapshot()));
      assertIntegralIndices(model);
      assertClickLeftProbe(model);
      TestLogger.end(TAG, 'invariantTailSweep_069');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0700
     * @tc.name invariantWidthMonotonic070
     * @tc.desc An insertion whose projected width equals the canvas is accepted while the same insertion one pixel over is rejected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantWidthMonotonic_070', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantWidthMonotonic_070');
      let measure: TextMeasure = new UniformMeasure(10);
      let exact: TextEditingModel = new TextEditingModel(measure, 30);
      let accepted: boolean = exact.insertText('abc');
      let tight: TextEditingModel = new TextEditingModel(measure, 29);
      let rejected: boolean = tight.insertText('abc');
      TestLogger.value(TAG, 'exact', String(accepted));
      TestLogger.value(TAG, 'tight', String(rejected));
      expect(accepted).assertTrue();
      expect(rejected).assertFalse();
      expect(exact.inputText).assertEqual('abc');
      expect(tight.inputText).assertEqual('');
      TestLogger.end(TAG, 'invariantWidthMonotonic_070');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0710
     * @tc.name invariantWidthMonotonic071
     * @tc.desc The trailing slice participates in the guard: 20 plus 10 plus 10 px fits 40 px exactly but not 39 px
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantWidthMonotonic_071', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantWidthMonotonic_071');
      let measure: TextMeasure = new UniformMeasure(10);
      let exact: TextEditingModel = new TextEditingModel(measure, 40);
      exact.loadPlain('ab', '', 'x');
      let accepted: boolean = exact.insertText('c');
      let tight: TextEditingModel = new TextEditingModel(measure, 39);
      tight.loadPlain('ab', '', 'x');
      let rejected: boolean = tight.insertText('c');
      expect(accepted).assertTrue();
      expect(rejected).assertFalse();
      expect(exact.inputText).assertEqual('abc');
      expect(tight.inputText).assertEqual('ab');
      TestLogger.end(TAG, 'invariantWidthMonotonic_071');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0720
     * @tc.name invariantWidthMonotonic072
     * @tc.desc Widening the canvas from 20 px to 30 px turns a rejected three-character insertion into an accepted one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantWidthMonotonic_072', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantWidthMonotonic_072');
      let measure: TextMeasure = new UniformMeasure(10);
      let model: TextEditingModel = new TextEditingModel(measure, 20);
      let first: boolean = model.insertText('abc');
      TestLogger.value(TAG, 'first', String(first));
      expect(first).assertFalse();
      expect(model.inputText).assertEqual('');
      model.setCanvasWidth(30);
      let second: boolean = model.insertText('abc');
      expect(second).assertTrue();
      expect(model.inputText).assertEqual('abc');
      expect(model.cursorLeft).assertEqual(30);
      TestLogger.end(TAG, 'invariantWidthMonotonic_072');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0730
     * @tc.name invariantWidthMonotonic073
     * @tc.desc Narrowing the canvas from 30 px to 29 px turns a further one-character insertion into a rejection without changing the text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantWidthMonotonic_073', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantWidthMonotonic_073');
      let measure: TextMeasure = new UniformMeasure(10);
      let model: TextEditingModel = new TextEditingModel(measure, 30);
      let first: boolean = model.insertText('abc');
      expect(first).assertTrue();
      model.setCanvasWidth(29);
      let second: boolean = model.insertText('d');
      TestLogger.value(TAG, 'second', String(second));
      expect(second).assertFalse();
      expect(model.inputText).assertEqual('abc');
      expect(model.cursorIndex).assertEqual(3);
      TestLogger.end(TAG, 'invariantWidthMonotonic_073');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0740
     * @tc.name invariantWidthMonotonic074
     * @tc.desc A constant five-pixel measure accepts any string at ten pixels but rejects it at four pixels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantWidthMonotonic_074', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantWidthMonotonic_074');
      let measure: TextMeasure = new FixedMeasure(5);
      let wide: TextEditingModel = new TextEditingModel(measure, 10);
      let accepted: boolean = wide.insertText('abcdefghij');
      let narrow: TextEditingModel = new TextEditingModel(measure, 4);
      let rejected: boolean = narrow.insertText('abcdefghij');
      expect(accepted).assertTrue();
      expect(rejected).assertFalse();
      expect(wide.cursorLeft).assertEqual(5);
      expect(narrow.cursorLeft).assertEqual(0);
      TestLogger.end(TAG, 'invariantWidthMonotonic_074');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0750
     * @tc.name invariantWidthMonotonic075
     * @tc.desc A zero-width measure makes an empty insertion pass at a zero canvas and fail at a negative canvas
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantWidthMonotonic_075', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantWidthMonotonic_075');
      let measure: TextMeasure = new FixedMeasure(0);
      let zero: TextEditingModel = new TextEditingModel(measure, 0);
      let accepted: boolean = zero.insertText('');
      let negative: TextEditingModel = new TextEditingModel(measure, -1);
      let rejected: boolean = negative.insertText('');
      TestLogger.value(TAG, 'accepted', String(accepted));
      TestLogger.value(TAG, 'rejected', String(rejected));
      expect(accepted).assertTrue();
      expect(rejected).assertFalse();
      TestLogger.end(TAG, 'invariantWidthMonotonic_075');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0760
     * @tc.name invariantWidthMonotonic076
     * @tc.desc Releasing ten pixels with a left delete makes a previously rejected insertion fit the same canvas
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantWidthMonotonic_076', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantWidthMonotonic_076');
      let measure: TextMeasure = new UniformMeasure(10);
      let model: TextEditingModel = new TextEditingModel(measure, 40);
      model.loadPlain('ab', '', 'cd');
      let rejected: boolean = model.insertText('e');
      expect(rejected).assertFalse();
      model.deleteLeft(1);
      let accepted: boolean = model.insertText('e');
      TestLogger.value(TAG, 'accepted', String(accepted));
      expect(accepted).assertTrue();
      expect(model.inputText).assertEqual('ae');
      expect(model.lastInput).assertEqual('cd');
      TestLogger.end(TAG, 'invariantWidthMonotonic_076');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0770
     * @tc.name invariantWidthMonotonic077
     * @tc.desc Wide characters count sixteen pixels each, so a wide insertion fits 48 px but not 47 px
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantWidthMonotonic_077', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantWidthMonotonic_077');
      let measure: TextMeasure = new MixedMeasure(8, 16);
      let exact: TextEditingModel = new TextEditingModel(measure, 48);
      exact.loadPlain('ab', '', '中');
      let accepted: boolean = exact.insertText('é');
      let tight: TextEditingModel = new TextEditingModel(measure, 47);
      tight.loadPlain('ab', '', '中');
      let rejected: boolean = tight.insertText('é');
      expect(accepted).assertTrue();
      expect(rejected).assertFalse();
      expect(exact.cursorLeft).assertEqual(32);
      TestLogger.end(TAG, 'invariantWidthMonotonic_077');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0780
     * @tc.name invariantWidthMonotonic078
     * @tc.desc Fractional half-pixel widths compare exactly: a projected 2.0 fits a 2.0 canvas but not a 1.999 canvas
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantWidthMonotonic_078', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantWidthMonotonic_078');
      let measure: TextMeasure = new UniformMeasure(0.5);
      let exact: TextEditingModel = new TextEditingModel(measure, 2.0);
      exact.loadPlain('ab', '', '');
      let accepted: boolean = exact.insertText('cd');
      let tight: TextEditingModel = new TextEditingModel(measure, 1.999);
      tight.loadPlain('ab', '', '');
      let rejected: boolean = tight.insertText('cd');
      expect(accepted).assertTrue();
      expect(rejected).assertFalse();
      expect(exact.cursorLeft).assertEqual(2.0);
      TestLogger.end(TAG, 'invariantWidthMonotonic_078');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0790
     * @tc.name invariantWidthMonotonic079
     * @tc.desc A one-million-pixel canvas accepts a thousand-character insertion while the default 320 px canvas rejects it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantWidthMonotonic_079', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantWidthMonotonic_079');
      let measure: TextMeasure = new UniformMeasure(1);
      let longText: string = '';
      let index: number = 0;
      while (index < 1000) {
        longText = longText + 'a';
        index++;
      }
      let wide: TextEditingModel = new TextEditingModel(measure, 1000000);
      let accepted: boolean = wide.insertText(longText);
      let normal: TextEditingModel = new TextEditingModel(measure, 320);
      let rejected: boolean = normal.insertText(longText);
      expect(accepted).assertTrue();
      expect(rejected).assertFalse();
      expect(wide.cursorLeft).assertEqual(1000);
      TestLogger.end(TAG, 'invariantWidthMonotonic_079');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0800
     * @tc.name invariantIdempotent080
     * @tc.desc Two consecutive move-to-start calls leave the caret at zero and the whole text in the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantIdempotent_080', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantIdempotent_080');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(10), 320);
      model.loadPlain('abcdef', '', '');
      model.moveCursor(1);
      let first: TextState = model.snapshot();
      model.moveCursor(1);
      let second: TextState = model.snapshot();
      expect(second.inputText).assertEqual(first.inputText);
      expect(second.lastInput).assertEqual('abcdef');
      expect(second.cursorIndex).assertEqual(0);
      expect(second.selectIndex).assertEqual(0);
      TestLogger.end(TAG, 'invariantIdempotent_080');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0810
     * @tc.name invariantIdempotent081
     * @tc.desc Two consecutive move-to-end calls leave the caret at the text length and an empty trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantIdempotent_081', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantIdempotent_081');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(10), 320);
      model.loadPlain('abcdef', '', '');
      model.moveCursor(2);
      let first: TextState = model.snapshot();
      model.moveCursor(2);
      let second: TextState = model.snapshot();
      expect(second.inputText).assertEqual(first.inputText);
      expect(second.lastInput).assertEqual('');
      expect(second.cursorIndex).assertEqual(6);
      expect(second.selectIndex).assertEqual(6);
      TestLogger.end(TAG, 'invariantIdempotent_081');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0820
     * @tc.name invariantIdempotent082
     * @tc.desc A second select-all leaves exactly the same slices as the first one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantIdempotent_082', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantIdempotent_082');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(10), 320);
      model.loadPlain('ab', '', 'cd');
      model.handleExtendAction(0);
      let first: TextState = model.snapshot();
      model.handleExtendAction(0);
      let second: TextState = model.snapshot();
      expect(second.inputText).assertEqual(first.inputText);
      expect(second.selectInput).assertEqual(first.selectInput);
      expect(second.lastInput).assertEqual(first.lastInput);
      expectSameNumber(second.cursorIndex, first.cursorIndex);
      expect(second.selectInput).assertEqual('abcd');
      TestLogger.end(TAG, 'invariantIdempotent_082');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0830
     * @tc.name invariantIdempotent083
     * @tc.desc Repeating the zero range reset keeps the caret at zero and the full text in the trailing slice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantIdempotent_083', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantIdempotent_083');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(10), 320);
      model.loadPlain('abcd', '', '');
      model.selectByRange(0, 0);
      let first: TextState = model.snapshot();
      model.selectByRange(0, 0);
      let second: TextState = model.snapshot();
      expect(second.cursorIndex).assertEqual(0);
      expect(second.lastInput).assertEqual('abcd');
      expect(second.inputText).assertEqual(first.inputText);
      expect(second.cursorLeft).assertEqual(0);
      TestLogger.end(TAG, 'invariantIdempotent_083');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0840
     * @tc.name invariantIdempotent084
     * @tc.desc A zero-length left delete twice keeps the text and indices fixed while refreshing the caret offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantIdempotent_084', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantIdempotent_084');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(10), 320);
      model.loadPlain('abcdef', '', '');
      model.deleteLeft(0);
      let first: TextState = model.snapshot();
      model.deleteLeft(0);
      let second: TextState = model.snapshot();
      expect(second.inputText).assertEqual(first.inputText);
      expectSameNumber(second.cursorIndex, first.cursorIndex);
      expectSameNumber(second.selectIndex, first.selectIndex);
      expect(second.cursorLeft).assertEqual(60);
      TestLogger.end(TAG, 'invariantIdempotent_084');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0850
     * @tc.name invariantIdempotent085
     * @tc.desc Two clicks at offset zero leave the caret at the first code unit both times
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantIdempotent_085', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantIdempotent_085');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(10), 320);
      model.loadPlain('abcdef', '', '');
      model.calculateCursor(0);
      let first: TextState = model.snapshot();
      model.calculateCursor(0);
      let second: TextState = model.snapshot();
      expect(first.cursorIndex).assertEqual(0);
      expect(second.cursorIndex).assertEqual(0);
      expect(second.inputText).assertEqual('');
      expect(second.lastInput).assertEqual('abcdef');
      TestLogger.end(TAG, 'invariantIdempotent_085');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0860
     * @tc.name invariantIdempotent086
     * @tc.desc Applying the same explicit range twice yields the same selection slices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantIdempotent_086', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantIdempotent_086');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(10), 320);
      model.loadPlain('abcdef', '', '');
      model.changeSelection(0, 2);
      let first: TextState = model.snapshot();
      model.changeSelection(0, 2);
      let second: TextState = model.snapshot();
      expect(second.inputText).assertEqual('');
      expect(second.selectInput).assertEqual('ab');
      expect(second.lastInput).assertEqual('cdef');
      expectSameNumber(second.cursorLeft, first.cursorLeft);
      expect(second.cursorIndex).assertEqual(2);
      TestLogger.end(TAG, 'invariantIdempotent_086');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0870
     * @tc.name invariantIdempotent087
     * @tc.desc Two right anchor moves advance the selection anchor by exactly two code units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantIdempotent_087', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantIdempotent_087');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(10), 320);
      model.loadPlain('abcdef', '', '');
      model.changeSelection(0, 0);
      model.selectByMovement(4);
      let first: TextState = model.snapshot();
      model.selectByMovement(4);
      let second: TextState = model.snapshot();
      expect(first.selectIndex).assertEqual(1);
      expect(second.selectIndex).assertEqual(2);
      expect(second.selectInput).assertEqual('ab');
      expect(second.cursorIndex).assertEqual(0);
      TestLogger.end(TAG, 'invariantIdempotent_087');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_INVARIANT_0880
     * @tc.name invariantIdempotent088
     * @tc.desc Two left cursor moves from the second code unit return the caret to zero and keep the suffix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'invariantIdempotent_088', 0, async (done: Function) => {
      TestLogger.begin(TAG, 'invariantIdempotent_088');
      let model: TextEditingModel = new TextEditingModel(new UniformMeasure(10), 320);
      model.loadPlain('abcdef', '', '');
      model.calculateCursor(20);
      model.moveCursor(3);
      let first: TextState = model.snapshot();
      model.moveCursor(3);
      let second: TextState = model.snapshot();
      expect(first.cursorIndex).assertEqual(1);
      expect(second.cursorIndex).assertEqual(0);
      expect(second.inputText).assertEqual('');
      expect(second.lastInput).assertEqual('abcdef');
      TestLogger.end(TAG, 'invariantIdempotent_088');
      await yieldToEventLoop();
      done();
    });
  });
}
