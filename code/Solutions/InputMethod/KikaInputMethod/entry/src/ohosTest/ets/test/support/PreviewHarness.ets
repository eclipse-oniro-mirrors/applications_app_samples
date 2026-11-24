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

import inputMethodEngine from '@ohos.inputMethodEngine';
import { BusinessError } from '@ohos.base';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

/** One recorded setPreviewText() request. */
export interface PreviewCall {
  /** Text proposed to the editor. */
  text: string;
  /** First overwritten character index, inclusive. */
  start: number;
  /** Last overwritten character index, exclusive. */
  end: number;
}

/**
 * Minimal KeyboardController stub.
 *
 * InputHandler only calls hide() on this object; the call count proves that a
 * keyboard-hide request reached the panel controller.
 */
export class FakeKeyboardController {
  public hideCount: number = 0;
  /** When set, hide() rejects while still counting the request. */
  public failHide: boolean = false;

  public hide(): Promise<void> {
    this.hideCount = this.hideCount + 1;
    if (this.failHide) {
      return Promise.reject(new Error('hide rejected'));
    }
    return Promise.resolve();
  }
}

/**
 * Recording InputClient that also emulates a minimal text editor.
 *
 * The buffer is append-only until a preview is committed. The cursor is the
 * index of the last character, which is the convention the production preview
 * code relies on when it computes overwrite ranges.
 */
export class FakeInputClient {
  /** Current editor text, including any active preview overwrite. */
  public buffer: string = '';
  /** Index of the character under the cursor; -1 for an empty editor. */
  public cursor: number = -1;
  /** Preview overwrites requested by the handler, in call order. */
  public previewCalls: PreviewCall[] = [];
  /** Ranges passed to selectByRange(), in call order. */
  public selectedRanges: inputMethodEngine.Range[] = [];
  /** Directions passed to moveCursor(), in call order. */
  public movedDirections: number[] = [];
  /** Directions passed to selectByMovement(), in call order. */
  public movementDirections: number[] = [];
  /** Actions passed to sendExtendAction(), in call order. */
  public extendActions: inputMethodEngine.ExtendAction[] = [];
  /** Lengths passed to deleteBackward(), in call order. */
  public backwardLengths: number[] = [];
  /** Lengths passed to deleteForward(), in call order. */
  public forwardLengths: number[] = [];
  /** Text passed to insertTextSync(), in call order. */
  public insertedTexts: string[] = [];
  /** Enter-key types passed to sendKeyFunction(), in call order. */
  public keyFunctions: number[] = [];
  /** How many times finishTextPreview() was requested. */
  public finishCount: number = 0;
  /** How many times sendPrivateCommand() was requested. */
  public privateCommandCount: number = 0;
  /** Payloads passed to sendPrivateCommand(), in call order. */
  public privateCommands: Record<string, inputMethodEngine.CommandDataType>[] = [];
  /** How many times getEditorAttribute() was requested. */
  public editorAttributeCount: number = 0;
  /** Lengths passed to getForward(), in call order. */
  public forwardQueries: number[] = [];
  /** Lengths passed to getBackward(), in call order. */
  public backwardQueries: number[] = [];
  /** When set, setPreviewText() rejects to exercise the error branch. */
  public failPreview: boolean = false;
  /** When set, finishTextPreview() rejects to exercise the error branch. */
  public failFinish: boolean = false;
  /** When set, sendPrivateCommand() rejects to exercise the catch branch. */
  public failPrivateCommand: boolean = false;
  /** Enter-key type reported to InputHandler on attach. */
  private enterKeyType: number;
  /** Input pattern reported to InputHandler on attach. */
  private inputPattern: number;
  /** Whether the editor claims text-preview support. */
  private previewSupported: boolean;
  /** When set, getEditorAttribute() waits for resolveAttribute(). */
  private deferAttribute: boolean;
  private failPrivateCommandFlag: boolean;
  private attributeResolver: ((value: inputMethodEngine.EditorAttribute) => void) | undefined;

  constructor(initial: string, enterKeyType: number = 0, inputPattern: number = 0,
    previewSupported: boolean = true, deferAttribute: boolean = false,
    failPrivateCommand: boolean = false) {
    this.buffer = initial;
    this.cursor = initial.length === 0 ? -1 : initial.length - 1;
    this.enterKeyType = enterKeyType;
    this.inputPattern = inputPattern;
    this.previewSupported = previewSupported;
    this.deferAttribute = deferAttribute;
    this.failPrivateCommandFlag = failPrivateCommand;
    this.attributeResolver = undefined;
  }

  /**
   * Returns the configured editor attribute. InputHandler stores enterKeyType
   * for sendKeyFunction(); inputPattern is published to AppStorage on attach.
   */
  public getEditorAttribute(): Promise<inputMethodEngine.EditorAttribute> {
    this.editorAttributeCount = this.editorAttributeCount + 1;
    const attribute: inputMethodEngine.EditorAttribute = {
      inputPattern: this.inputPattern,
      enterKeyType: this.enterKeyType,
      isTextPreviewSupported: this.previewSupported
    };
    if (this.deferAttribute) {
      return new Promise<inputMethodEngine.EditorAttribute>(
        (resolve: (value: inputMethodEngine.EditorAttribute) => void) => {
          this.attributeResolver = resolve;
        });
    }
    return Promise.resolve(attribute);
  }

  /** Releases a deferred editor attribute so the attach callback can settle. */
  public resolveAttribute(): void {
    if (this.attributeResolver !== undefined) {
      const attribute: inputMethodEngine.EditorAttribute = {
        inputPattern: this.inputPattern,
        enterKeyType: this.enterKeyType,
        isTextPreviewSupported: this.previewSupported
      };
      const resolver = this.attributeResolver;
      this.attributeResolver = undefined;
      resolver(attribute);
    }
  }

  /** Records the private-command sent during onInputStart(). */
  public sendPrivateCommand(commandData: Record<string, inputMethodEngine.CommandDataType>): Promise<void> {
    this.privateCommandCount = this.privateCommandCount + 1;
    this.privateCommands.push(commandData);
    if (this.failPrivateCommandFlag) {
      return Promise.reject(new Error('private command rejected'));
    }
    return Promise.resolve();
  }

  /** Returns up to length characters before the cursor for the debug snapshot. */
  public getForward(length: number): string {
    this.forwardQueries.push(length);
    const endIndex: number = length < this.buffer.length ? length : this.buffer.length;
    return this.buffer.substring(0, endIndex);
  }

  /** Returns up to length characters after the cursor for the debug snapshot. */
  public getBackward(length: number): string {
    this.backwardQueries.push(length);
    const startIndex: number = this.buffer.length - length > 0 ? this.buffer.length - length : 0;
    return this.buffer.substring(startIndex);
  }

  /** Appends inserted text at the end and moves the cursor to the new last character. */
  public insertTextSync(text: string): void {
    this.insertedTexts.push(text);
    this.buffer = this.buffer + text;
    this.cursor = this.buffer.length - 1;
  }

  /** Returns the last-character cursor index used by the preview range math. */
  public getTextIndexAtCursorSync(): number {
    return this.cursor;
  }

  /** Asynchronous form of {@link getTextIndexAtCursorSync}. */
  public getTextIndexAtCursor(): Promise<number> {
    return Promise.resolve(this.cursor);
  }

  /**
   * Returns up to length characters before the cursor.
   *
   * The production preview code calls this with the cursor index to obtain the
   * already committed prefix.
   */
  public getForwardSync(length: number): string {
    const endIndex: number = length < this.buffer.length ? length : this.buffer.length;
    return this.buffer.substring(0, endIndex);
  }

  /**
   * Records a preview request, overwrites the requested range in the buffer and
   * moves the cursor to the last character of the preview text.
   */
  public setPreviewText(text: string, range: inputMethodEngine.Range): Promise<void> {
    if (this.failPreview) {
      return Promise.reject(new Error('preview rejected'));
    }
    const call: PreviewCall = { text: text, start: range.start, end: range.end };
    this.previewCalls.push(call);
    this.buffer = this.buffer.substring(0, range.start) + text + this.buffer.substring(range.end);
    this.cursor = range.start + text.length - 1;
    return Promise.resolve();
  }

  /** Records an enter-key request. */
  public sendKeyFunction(action: number): Promise<boolean> {
    this.keyFunctions.push(action);
    return Promise.resolve(true);
  }

  /** Records a preview-confirmation request. */
  public finishTextPreview(): Promise<void> {
    this.finishCount = this.finishCount + 1;
    if (this.failFinish) {
      return Promise.reject(new Error('finish rejected'));
    }
    return Promise.resolve();
  }

  /** Records a backward-deletion request. */
  public deleteBackward(length: number): Promise<boolean> {
    this.backwardLengths.push(length);
    return Promise.resolve(true);
  }

  /** Records a forward-deletion request. */
  public deleteForward(length: number): Promise<boolean> {
    this.forwardLengths.push(length);
    return Promise.resolve(true);
  }

  /** Records a caret-movement request. */
  public moveCursor(direction: number): Promise<void> {
    this.movedDirections.push(direction);
    return Promise.resolve();
  }

  /** Records a range-selection request. */
  public selectByRange(range: inputMethodEngine.Range): Promise<void> {
    const selected: inputMethodEngine.Range = { start: range.start, end: range.end };
    this.selectedRanges.push(selected);
    return Promise.resolve();
  }

  /** Records a selection-movement request; the production call uses the callback overload. */
  public selectByMovement(movement: inputMethodEngine.Movement, callback?: (err: BusinessError) => void): void {
    this.movementDirections.push(movement.direction);
  }

  /** Records an extended edit action request. */
  public sendExtendAction(action: inputMethodEngine.ExtendAction): Promise<void> {
    this.extendActions.push(action);
    return Promise.resolve();
  }
}

/**
 * Attaches the recording client and keyboard stub to the production
 * InputHandler singleton.
 *
 * The double assertion is intentional: the production API exposes large
 * interfaces, while the tests only need the methods above.
 */
export class PreviewHarness {
  public client: FakeInputClient;
  public keyboard: FakeKeyboardController;

  constructor(initial: string, enterKeyType: number = 0, inputPattern: number = 0,
    previewSupported: boolean = true, deferAttribute: boolean = false,
    failPrivateCommand: boolean = false) {
    this.client = new FakeInputClient(initial, enterKeyType, inputPattern, previewSupported,
      deferAttribute, failPrivateCommand);
    this.keyboard = new FakeKeyboardController();
    InputHandler.getInstance().onInputStart(
      this.keyboard as object as inputMethodEngine.KeyboardController,
      this.client as object as inputMethodEngine.InputClient);
  }
}

/**
 * Creates a harness seeded with initial editor text.
 *
 * Two microtask turns let onInputStart() finish its getEditorAttribute() and
 * sendPrivateCommand() callbacks before the test starts typing.
 */
export async function createPreviewHarness(initial: string, enterKeyType: number = 0,
  inputPattern: number = 0, previewSupported: boolean = true,
  deferAttribute: boolean = false, failPrivateCommand: boolean = false): Promise<PreviewHarness> {
  const harness: PreviewHarness = new PreviewHarness(initial, enterKeyType, inputPattern,
    previewSupported, deferAttribute, failPrivateCommand);
  await Promise.resolve();
  await Promise.resolve();
  return harness;
}

/**
 * Types text one character at a time through the production insertText() path.
 *
 * Character-by-character input is required by the preview trigger logic, which
 * inspects the last two characters plus the newly typed character.
 */
export function typeSequence(harness: PreviewHarness, text: string): void {
  const handler: InputHandler = InputHandler.getInstance();
  for (let i = 0; i < text.length; i++) {
    handler.insertText(text.charAt(i));
  }
}
