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
import { InputHandler } from '../../../../main/ets/model/KeyboardController';

/**
 * Minimal KeyboardController stub.
 *
 * InputHandler only calls hide() on this object; the call count proves that a
 * keyboard-hide request reached the panel controller.
 */
export class FakeKeyboardController {
  public hideCount: number = 0;

  public hide(): Promise<void> {
    this.hideCount = this.hideCount + 1;
    return Promise.resolve();
  }
}

/**
 * Recording InputClient stub.
 *
 * Every editor-facing command sent by InputHandler is appended to a public
 * array so the test can assert the exact command and its arguments.
 */
export class FakeInputClient {
  /** Text passed to insertText(), in call order. */
  public insertedTexts: string[] = [];
  /** Lengths passed to deleteBackward(), in call order. */
  public backwardLengths: number[] = [];
  /** Lengths passed to deleteForward(), in call order. */
  public forwardLengths: number[] = [];
  /** Directions passed to moveCursor(), in call order. */
  public movedDirections: number[] = [];
  /** Actions passed to sendExtendAction(), in call order. */
  public extendActions: inputMethodEngine.ExtendAction[] = [];
  /** Enter-key types passed to sendKeyFunction(), in call order. */
  public keyFunctions: number[] = [];
  /** How many times getEditorAttribute() was requested. */
  public editorAttributeCount: number = 0;
  /** Every editor command in call order, encoded as kind:argument. */
  public journal: string[] = [];
  /** Enter-key type reported by the fake editor. */
  private enterKeyType: number = 0;
  /** Input pattern reported by the fake editor. */
  private inputPattern: number = 0;

  constructor(enterKeyType: number, inputPattern: number = 0) {
    this.enterKeyType = enterKeyType;
    this.inputPattern = inputPattern;
  }

  /**
   * Returns a stable editor attribute. InputHandler stores enterKeyType for
   * sendKeyFunction(), so tests can vary it through the constructor.
   */
  public getEditorAttribute(): Promise<inputMethodEngine.EditorAttribute> {
    this.editorAttributeCount = this.editorAttributeCount + 1;
    const attribute: inputMethodEngine.EditorAttribute = {
      inputPattern: this.inputPattern,
      enterKeyType: this.enterKeyType,
      isTextPreviewSupported: true
    };
    return Promise.resolve(attribute);
  }

  /** Text returned for characters after the caret. */
  public getForward(length: number): string {
    return 'FWD' + length;
  }

  /** Text returned for characters before the caret. */
  public getBackward(length: number): string {
    return 'BWD' + length;
  }

  /** Records an insertion request. */
  public insertText(text: string): Promise<boolean> {
    this.insertedTexts.push(text);
    this.journal.push('insert:' + text);
    return Promise.resolve(true);
  }

  /** Records a backward-deletion request. */
  public deleteBackward(length: number): Promise<boolean> {
    this.backwardLengths.push(length);
    this.journal.push('back:' + length);
    return Promise.resolve(true);
  }

  /** Records a forward-deletion request. */
  public deleteForward(length: number): Promise<boolean> {
    this.forwardLengths.push(length);
    this.journal.push('forward:' + length);
    return Promise.resolve(true);
  }

  /** Records a caret-movement request. */
  public moveCursor(direction: number): Promise<void> {
    this.movedDirections.push(direction);
    this.journal.push('move:' + direction);
    return Promise.resolve();
  }

  /** Records an extended edit action request. */
  public sendExtendAction(action: inputMethodEngine.ExtendAction): Promise<void> {
    this.extendActions.push(action);
    this.journal.push('extend:' + action);
    return Promise.resolve();
  }

  /** Records an enter-key request. */
  public sendKeyFunction(action: number): Promise<boolean> {
    this.keyFunctions.push(action);
    this.journal.push('enter:' + action);
    return Promise.resolve(true);
  }
}

/**
 * Attaches the fakes to the production InputHandler singleton.
 *
 * The double assertion is intentional: the production API exposes large
 * interfaces, while the tests only need the methods above.
 */
export class ClientHarness {
  public client: FakeInputClient;
  public keyboard: FakeKeyboardController;

  constructor(enterKeyType: number, inputPattern: number = 0) {
    this.client = new FakeInputClient(enterKeyType, inputPattern);
    this.keyboard = new FakeKeyboardController();
    InputHandler.getInstance().onInputStart(
      this.keyboard as object as inputMethodEngine.KeyboardController,
      this.client as object as inputMethodEngine.InputClient);
  }
}

/**
 * Creates a harness and lets onInputStart() finish its asynchronous
 * getEditorAttribute() callback before the test sends the enter key.
 */
export async function createClientHarness(enterKeyType: number, inputPattern: number = 0): Promise<ClientHarness> {
  const harness: ClientHarness = new ClientHarness(enterKeyType, inputPattern);
  await Promise.resolve();
  await Promise.resolve();
  return harness;
}
