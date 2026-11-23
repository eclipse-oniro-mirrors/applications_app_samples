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

// Input rules of casesfeature/verifycode view/VerifyCodeView.ets (insertText / deleteLeft listeners, display cells,
// keyboard toggling and back press) without the input method controller.

// Mirrors private verifyCodeLength: number = 6 and codeIndexArray [0 .. 5].
export const VERIFY_CODE_LENGTH: number = 6;
export const CODE_INDEXES: number[] = [0, 1, 2, 3, 4, 5];

// Mirrors the guard of the insertText listener: full code, non numeric text or a single space are ignored.
export function rejectsInsert(codeText: string, text: string): boolean {
  return codeText.length >= VERIFY_CODE_LENGTH || isNaN(Number(text)) || text === ' ';
}

// Mirrors the insertText listener: this.codeText += text unless the guard rejects it.
export function insertInto(codeText: string, text: string): string {
  if (rejectsInsert(codeText, text)) {
    return codeText;
  }
  return codeText + text;
}

// Mirrors the deleteLeft listener: substring(0, length - 1).
export function deleteLeftOf(codeText: string): string {
  return codeText.substring(0, codeText.length - 1);
}

// Mirrors the completion log: the code is complete when its length equals verifyCodeLength.
export function isComplete(codeText: string): boolean {
  return codeText.length === VERIFY_CODE_LENGTH;
}

// Mirrors Text(this.codeText[item]) of each cell ('' for an empty cell).
export function cellTextOf(codeText: string, index: number): string {
  if (!Number.isInteger(index) || index < 0 || index >= codeText.length) {
    return '';
  }
  return codeText.charAt(index);
}

// Mirrors the number of filled cells shown by the ForEach over codeIndexArray.
export function filledCellsOf(codeText: string): number {
  let filled: number = 0;
  for (const index of CODE_INDEXES) {
    if (cellTextOf(codeText, index) !== '') {
      filled++;
    }
  }
  return filled;
}

// Mirrors the ForEach key generator (item: number) => item.toString().
export function cellKeyOf(item: number): string {
  return item.toString();
}

// Mirrors applying a typed sequence of insertText events to an empty code.
export function typeSequence(texts: string[]): string {
  let code: string = '';
  for (const text of texts) {
    code = insertInto(code, text);
  }
  return code;
}

// Mirrors the back press handler: an open keyboard is hidden first, otherwise the page is popped.
export function backActionOf(isKeyboardShow: boolean): string {
  return isKeyboardShow ? 'hideKeyboard' : 'popRouter';
}

// Mirrors the VerifyCodeView component state.
export class VerifyCodeState {
  codeText: string = '';
  isKeyboardShow: boolean = false;
  isListen: boolean = false;
  completed: number = 0;
  rejected: number = 0;

  // Mirrors attachAndListen(): the controller is attached and the listeners are registered once.
  attach(): boolean {
    this.isKeyboardShow = true;
    if (this.isListen) {
      return false;
    }
    this.isListen = true;
    return true;
  }

  // Mirrors the insertText listener.
  insert(text: string): string {
    if (!this.isListen) {
      return this.codeText;
    }
    if (rejectsInsert(this.codeText, text)) {
      this.rejected++;
      return this.codeText;
    }
    this.codeText += text;
    if (isComplete(this.codeText)) {
      this.completed++;
    }
    return this.codeText;
  }

  // Mirrors the deleteLeft listener.
  deleteLeft(): string {
    if (this.isListen) {
      this.codeText = deleteLeftOf(this.codeText);
    }
    return this.codeText;
  }

  // Mirrors onBlur(): listeners are removed and the keyboard is hidden.
  detach(): void {
    this.isListen = false;
    this.isKeyboardShow = false;
  }

  // Mirrors the back press event of the page.
  backPress(): string {
    const action: string = backActionOf(this.isKeyboardShow);
    if (this.isKeyboardShow) {
      this.isKeyboardShow = false;
    }
    return action;
  }
}
