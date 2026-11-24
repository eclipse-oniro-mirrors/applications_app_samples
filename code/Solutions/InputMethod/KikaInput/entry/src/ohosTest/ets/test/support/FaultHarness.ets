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
 * Editor stub whose failure mode is selected per test.
 *
 * The production InputHandler never catches synchronous exceptions raised by
 * the editor, so these probes document which failures propagate to the caller
 * and which are silently ignored (a false return value).
 */
export class FaultInputClient {
  /** Throws synchronously from getEditorAttribute(). */
  public throwOnAttribute: boolean = false;
  /** Throws synchronously from getForward()/getBackward(). */
  public throwOnPreview: boolean = false;
  /** Returns a resolved false from every command instead of true. */
  public returnFalse: boolean = false;
  /** Returns empty preview strings from getForward()/getBackward(). */
  public emptyPreview: boolean = false;
  /** Text passed to insertText(), in call order. */
  public insertedTexts: string[] = [];
  /** Lengths passed to deleteBackward(), in call order. */
  public backwardLengths: number[] = [];
  /** Lengths passed to deleteForward(), in call order. */
  public forwardLengths: number[] = [];
  /** Every command accepted by the stub, encoded as kind:argument. */
  public journal: string[] = [];

  public getEditorAttribute(): Promise<inputMethodEngine.EditorAttribute> {
    if (this.throwOnAttribute) {
      throw new Error('attribute fault');
    }
    const attribute: inputMethodEngine.EditorAttribute = {
      inputPattern: 0,
      enterKeyType: 0,
      isTextPreviewSupported: true
    };
    return Promise.resolve(attribute);
  }

  public insertText(text: string): Promise<boolean> {
    this.insertedTexts.push(text);
    this.journal.push('insert:' + text);
    return Promise.resolve(!this.returnFalse);
  }

  public deleteBackward(length: number): Promise<boolean> {
    this.backwardLengths.push(length);
    this.journal.push('back:' + length);
    return Promise.resolve(!this.returnFalse);
  }

  public deleteForward(length: number): Promise<boolean> {
    this.forwardLengths.push(length);
    this.journal.push('forward:' + length);
    return Promise.resolve(!this.returnFalse);
  }

  public moveCursor(direction: number): Promise<void> {
    this.journal.push('move:' + direction);
    return Promise.resolve();
  }

  public sendExtendAction(action: inputMethodEngine.ExtendAction): Promise<void> {
    this.journal.push('extend:' + action);
    return Promise.resolve();
  }

  public sendKeyFunction(action: number): Promise<boolean> {
    this.journal.push('enter:' + action);
    return Promise.resolve(!this.returnFalse);
  }

  public getForward(length: number): string {
    if (this.throwOnPreview) {
      throw new Error('preview fault');
    }
    return this.emptyPreview ? '' : 'FWD' + length;
  }

  public getBackward(length: number): string {
    if (this.throwOnPreview) {
      throw new Error('preview fault');
    }
    return this.emptyPreview ? '' : 'BWD' + length;
  }
}

/** Keyboard stub whose hide() always raises synchronously. */
export class FaultKeyboardController {
  public hide(): Promise<void> {
    throw new Error('hide fault');
  }
}

/** Keyboard stub that counts successful hide requests. */
export class CountingKeyboardController {
  public hideCount: number = 0;

  public hide(): Promise<void> {
    this.hideCount = this.hideCount + 1;
    return Promise.resolve();
  }
}

/** Attaches the fault stubs to the InputHandler singleton. */
export function attachFaultClient(client: FaultInputClient, keyboard: object): void {
  InputHandler.getInstance().onInputStart(
    keyboard as object as inputMethodEngine.KeyboardController,
    client as object as inputMethodEngine.InputClient);
}
