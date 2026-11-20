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

import { END_FLAG } from './TestConstant';

/**
 * Faithful replica of the editing state kept by components/CustomInputText.ets.
 *
 * The component owns three visible slices - inputText, selectInput and
 * lastInput - plus two indices (cursorIndex, selectIndex) and the left offset of
 * the caret. Every controller callback (insertText, deleteLeft, deleteRight,
 * moveCursor, selectByMovement, selectByRange, handleExtendAction) rewrites
 * those fields with plain string operations, so the rules can be exercised
 * without a rendering context by injecting a width function instead of
 * CanvasRenderingContext2D.measureText.
 *
 * The replica intentionally keeps the quirks of the component: it appends on
 * insertText, it discards selectInput on deleteRight, it lets cursorIndex fall
 * to -1 on a left move at position 0, and it never clamps selectByRange's start
 * index. Assertions about those quirks therefore describe the real behaviour of
 * the sample rather than an idealised editor.
 */

/** Snapshot of the editable state. */
export interface TextState {
  inputText: string;
  selectInput: string;
  lastInput: string;
  cursorIndex: number;
  selectIndex: number;
  cursorLeft: number;
}

/** Stand-in for CanvasRenderingContext2D.measureText().width. */
export interface TextMeasure {
  widthOf(text: string): number;
}

/** Every character measures the same. */
export class UniformMeasure implements TextMeasure {
  private unit: number;

  constructor(unit: number) {
    this.unit = unit;
  }

  widthOf(text: string): number {
    return text.length * this.unit;
  }
}

/** ASCII characters use one width, all other code units use another. */
export class MixedMeasure implements TextMeasure {
  private asciiWidth: number;
  private wideWidth: number;

  constructor(asciiWidth: number, wideWidth: number) {
    this.asciiWidth = asciiWidth;
    this.wideWidth = wideWidth;
  }

  widthOf(text: string): number {
    let total: number = 0;
    let index: number = 0;
    while (index < text.length) {
      if (text.charCodeAt(index) < 128) {
        total += this.asciiWidth;
      } else {
        total += this.wideWidth;
      }
      index++;
    }
    return total;
  }
}

/** Width depends on the string length in a non-linear way (length * length). */
export class SquareMeasure implements TextMeasure {
  private unit: number;

  constructor(unit: number) {
    this.unit = unit;
  }

  widthOf(text: string): number {
    return text.length * text.length * this.unit;
  }
}

/** Constant width regardless of the string, including the empty string. */
export class FixedMeasure implements TextMeasure {
  private value: number;

  constructor(value: number) {
    this.value = value;
  }

  widthOf(text: string): number {
    return this.value;
  }
}

/** Records every measured string and forwards to another measure. */
export class SpyMeasure implements TextMeasure {
  calls: string[] = [];
  private inner: TextMeasure;

  constructor(inner: TextMeasure) {
    this.inner = inner;
  }

  widthOf(text: string): number {
    this.calls.push(text);
    return this.inner.widthOf(text);
  }

  callCount(): number {
    return this.calls.length;
  }

  reset(): void {
    this.calls = [];
  }

  countOf(text: string): number {
    let count: number = 0;
    let index: number = 0;
    while (index < this.calls.length) {
      if (this.calls[index] === text) {
        count++;
      }
      index++;
    }
    return count;
  }
}

/**
 * Replica of the component state and of the eight controller callbacks.
 * All methods are total; the only values that can become NaN are the ones the
 * component itself can produce (calculateCursor on an empty string, or a width
 * function returning NaN).
 */
export class TextEditingModel {
  inputText: string = '';
  selectInput: string = '';
  lastInput: string = '';
  cursorIndex: number = 0;
  selectIndex: number = 0;
  cursorLeft: number = 0;

  private measure: TextMeasure;
  private canvasWidth: number;

  constructor(measure: TextMeasure, canvasWidth: number) {
    this.measure = measure;
    this.canvasWidth = canvasWidth;
  }

  getCanvasWidth(): number {
    return this.canvasWidth;
  }

  setCanvasWidth(value: number): void {
    this.canvasWidth = value;
  }

  getMeasure(): TextMeasure {
    return this.measure;
  }

  /** The string the user sees: inputText + selectInput + lastInput. */
  message(): string {
    return this.inputText + this.selectInput + this.lastInput;
  }

  snapshot(): TextState {
    let state: TextState = {
      inputText: this.inputText,
      selectInput: this.selectInput,
      lastInput: this.lastInput,
      cursorIndex: this.cursorIndex,
      selectIndex: this.selectIndex,
      cursorLeft: this.cursorLeft
    };
    return state;
  }

  /**
   * Loads a state that satisfies the component's own invariant: the caret sits
   * at the end of inputText + selectInput and selectIndex marks the start of the
   * selected slice.
   */
  loadPlain(inputText: string, selectInput: string, lastInput: string): void {
    this.inputText = inputText;
    this.selectInput = selectInput;
    this.lastInput = lastInput;
    this.cursorIndex = inputText.length + selectInput.length;
    this.selectIndex = inputText.length;
    this.cursorLeft = this.measure.widthOf(inputText);
  }

  /** Loads an arbitrary, possibly inconsistent, state for boundary scenarios. */
  loadState(state: TextState): void {
    this.inputText = state.inputText;
    this.selectInput = state.selectInput;
    this.lastInput = state.lastInput;
    this.cursorIndex = state.cursorIndex;
    this.selectIndex = state.selectIndex;
    this.cursorLeft = state.cursorLeft;
  }

  /**
   * insertText callback. Returns true when the text was accepted, false when the
   * width guard rejected it. The component appends to inputText, ignores the
   * current cursor position and clears the selection slice.
   */
  insertText(text: string): boolean {
    let projected: number = this.cursorLeft + this.measure.widthOf(text) + this.measure.widthOf(this.lastInput);
    if (projected > this.canvasWidth) {
      return false;
    }
    this.inputText = this.inputText + text;
    this.cursorIndex = this.inputText.length;
    this.selectIndex = this.cursorIndex;
    this.selectInput = '';
    this.cursorLeft = this.measure.widthOf(this.inputText);
    return true;
  }

  /**
   * deleteLeft callback. Removes `length` characters from the end of inputText
   * only; selectInput and lastInput are untouched and the caret jumps to the new
   * end of inputText.
   */
  deleteLeft(length: number): void {
    this.inputText = this.inputText.substring(0, this.inputText.length - length);
    this.cursorIndex = this.inputText.length;
    this.selectIndex = this.cursorIndex;
    this.cursorLeft = this.measure.widthOf(this.inputText);
  }

  /**
   * deleteRight callback. Deletes forward from the caret inside the composed
   * message. The component clears selectInput without re-inserting its text, so
   * a non-empty selection loses its characters. cursorLeft is not recomputed.
   */
  deleteRight(length: number): void {
    let message: string = this.message();
    if (this.cursorIndex < message.length) {
      this.selectIndex = this.cursorIndex;
      this.selectInput = '';
      let deleteIndex: number = this.cursorIndex + length;
      if (deleteIndex > message.length) {
        deleteIndex = message.length;
      }
      this.lastInput = message.substring(this.cursorIndex + length, message.length);
    }
  }

  /**
   * moveCursor callback. UP and DOWN jump to the ends, LEFT and RIGHT step by
   * one. The selection slice is folded back into the message first.
   */
  moveCursor(direction: number): void {
    let message: string = this.message();
    this.selectInput = '';
    if (direction === 1) {
      this.cursorIndex = 0;
    }
    if (direction === 2) {
      this.cursorIndex = message.length;
    }
    if (direction === 3) {
      this.cursorIndex--;
    }
    if (direction === 4) {
      if (this.cursorIndex < message.length) {
        this.cursorIndex++;
      }
    }
    this.selectIndex = this.cursorIndex;
    this.inputText = message.substring(0, this.cursorIndex);
    this.lastInput = message.substring(this.cursorIndex, message.length);
    this.cursorLeft = this.measure.widthOf(this.inputText);
  }

  /**
   * selectByMovement callback. The selection anchor selectIndex is moved and
   * clamped to [0, message.length]; the caret itself is not moved.
   */
  selectByMovement(direction: number): void {
    let message: string = this.message();
    if (direction === 1) {
      this.selectIndex = 0;
    }
    if (direction === 3) {
      if (this.selectIndex > 0) {
        this.selectIndex--;
      }
    }
    if (direction === 4) {
      if (this.selectIndex < message.length) {
        this.selectIndex++;
      }
    }
    if (direction === 2) {
      this.selectIndex = message.length;
    }
    if (this.selectIndex > this.cursorIndex) {
      this.inputText = message.substring(0, this.cursorIndex);
      this.selectInput = message.substring(this.cursorIndex, this.selectIndex);
      this.lastInput = message.substring(this.selectIndex, message.length);
    } else {
      this.inputText = message.substring(0, this.selectIndex);
      this.selectInput = message.substring(this.selectIndex, this.cursorIndex);
      this.lastInput = message.substring(this.cursorIndex, message.length);
    }
  }

  /**
   * selectByRange callback. Four branches: the (0, 0) reset, a forward range
   * ending at END_FLAG, any other forward range, and the default branch that
   * selects nothing and puts the caret at the end.
   */
  selectByRange(start: number, end: number): void {
    let message: string = this.message();
    if (start === 0 && end === 0) {
      this.cursorIndex = 0;
      this.selectInput = '';
      this.selectIndex = this.cursorIndex;
      this.inputText = message.substring(0, this.cursorIndex);
      this.lastInput = message.substring(this.cursorIndex, message.length);
      this.cursorLeft = this.measure.widthOf(this.inputText);
    } else if (end > start) {
      if (end === END_FLAG) {
        this.lastInput = '';
        this.selectIndex = message.length;
        this.inputText = message.substring(0, this.cursorIndex);
        this.selectInput = message.substring(this.cursorIndex, this.selectIndex);
      } else {
        this.selectIndex = 0;
        this.inputText = '';
        this.selectInput = message.substring(0, this.cursorIndex);
        this.lastInput = message.substring(this.cursorIndex, message.length);
      }
    } else {
      this.cursorIndex = message.length;
      this.selectIndex = this.cursorIndex;
      this.inputText = message.substring(0, this.cursorIndex);
      this.lastInput = message.substring(this.cursorIndex, message.length);
      this.cursorLeft = this.measure.widthOf(this.inputText);
    }
  }

  /**
   * handleExtendAction callback. Only SELECT_ALL (0) is handled: everything is
   * moved into selectInput and the caret moves to the end.
   */
  handleExtendAction(action: number): void {
    if (action === 0) {
      let message: string = this.message();
      this.cursorIndex = message.length;
      this.selectIndex = 0;
      this.inputText = '';
      this.selectInput = message.substring(0, this.cursorIndex);
      this.lastInput = '';
      this.cursorLeft = this.measure.widthOf(this.selectInput);
    }
  }

  /**
   * Click-to-caret conversion. The component divides the click offset by the
   * average character width, floors it and clamps the result in two comparisons.
   * An empty message yields NaN for the caret because 0 / 0 is NaN.
   */
  calculateCursor(x: number): void {
    let message: string = this.message();
    let charWidth: number = this.measure.widthOf(message) / message.length;
    this.cursorIndex = Math.floor(x / charWidth);
    if (this.cursorIndex < 0) {
      this.cursorIndex = 0;
      this.inputText = '';
      this.lastInput = message;
    } else if (this.cursorIndex > message.length) {
      this.cursorIndex = message.length;
      this.inputText = message;
      this.lastInput = '';
    } else {
      this.inputText = message.substring(0, this.cursorIndex);
      this.lastInput = message.substring(this.cursorIndex, message.length);
    }
    this.selectIndex = this.cursorIndex;
    this.selectInput = '';
    this.cursorLeft = this.measure.widthOf(message.substring(0, this.cursorIndex));
  }

  /**
   * changeSelection callback. start/end are consumed as given: start is not
   * clamped, only a caret beyond the text length is clamped. The command flag is
   * modelled by PageStateModel; this method performs the rewrite itself.
   */
  changeSelection(start: number, end: number): void {
    let message: string = this.message();
    if (start <= end) {
      this.selectIndex = start;
      this.cursorIndex = end;
    }
    if (start > end) {
      this.selectIndex = end;
      this.cursorIndex = start;
    }
    if (this.cursorIndex > message.length) {
      this.cursorIndex = message.length;
    }
    this.inputText = message.substring(0, this.selectIndex);
    this.selectInput = message.substring(this.selectIndex, this.cursorIndex);
    this.lastInput = message.substring(this.cursorIndex, message.length);
    this.cursorLeft = this.measure.widthOf(this.inputText + this.selectInput);
  }
}
