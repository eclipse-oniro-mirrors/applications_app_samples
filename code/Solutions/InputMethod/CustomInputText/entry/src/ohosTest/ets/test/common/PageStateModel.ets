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

import {
  INPUT_TYPE_SELECT_ID, ENTER_KEY_SELECT_ID, STRING_ATTACH, STRING_DETACH, STRING_SHOW, STRING_HIDE,
  STRING_ON, STRING_OFF, STRING_NO_ATTACH_TIP, SELECT_OPTION_COUNT
} from './TestConstant';

/**
 * Snapshot of the four numbers the page pushes into InputMethodController.updateCursor().
 */
export interface CursorInfoState {
  top: number;
  left: number;
  width: number;
  height: number;
}

/** Operation names returned by the toggle helpers, mirroring the controller calls. */
export class PageOperation {
  static readonly ATTACH: string = 'attach';
  static readonly DETACH: string = 'detach';
  static readonly SHOW: string = 'showTextInput';
  static readonly HIDE: string = 'hideTextInput';
  static readonly LISTEN: string = 'initListener';
  static readonly UNLISTEN: string = 'off';
  static readonly TOAST_NO_ATTACH: string = 'toast:' + STRING_NO_ATTACH_TIP;
  static readonly NONE: string = 'none';
}

/** Field names accepted by setCursorField(). */
export class CursorField {
  static readonly LEFT: string = 'left';
  static readonly TOP: string = 'top';
  static readonly WIDTH: string = 'width';
  static readonly HEIGHT: string = 'height';
}

/**
 * Replica of the flag-driven part of pages/Index.ets.
 *
 * The page holds seven @Provide fields that are consumed by the editor
 * component through @Watch hooks, three buttons whose labels depend on those
 * flags, four cursor TextInputs that parse their text with Number(), two
 * selection TextInputs with the same parsing rule and two dropdowns that only
 * record their index and refocus themselves. The class models exactly that
 * state machine, including the guard that refuses to toggle show/on while the
 * editor is not attached and reports the noattach toast instead.
 */
export class PageStateModel {
  isAttached: boolean = false;
  isShow: boolean = false;
  isOn: boolean = false;
  isChangeSelection: boolean = false;
  inputTypeIndex: number = 0;
  enterKeyIndex: number = 0;
  selectStart: number = 0;
  selectEnd: number = 0;
  cursorInfo: CursorInfoState = { top: 0, left: 0, width: 0, height: 0 };

  /** Button labels follow the flag: attach/detach, show/hide, on/off. */
  attachLabel(): string {
    return this.isAttached ? STRING_DETACH : STRING_ATTACH;
  }

  showLabel(): string {
    return this.isShow ? STRING_HIDE : STRING_SHOW;
  }

  onLabel(): string {
    return this.isOn ? STRING_OFF : STRING_ON;
  }

  /**
   * Tap on btnAttach. Flipping the flag to false runs the component's detach
   * path, which also stops listening and hides the keyboard.
   */
  toggleAttach(): string {
    this.isAttached = !this.isAttached;
    if (this.isAttached) {
      return PageOperation.ATTACH;
    }
    this.isOn = false;
    this.isShow = false;
    return PageOperation.DETACH;
  }

  /** Tap on btnShow; refused with the noattach toast while detached. */
  toggleShow(): string {
    if (!this.isAttached) {
      return PageOperation.TOAST_NO_ATTACH;
    }
    this.isShow = !this.isShow;
    return this.isShow ? PageOperation.SHOW : PageOperation.HIDE;
  }

  /** Tap on btnOn; refused with the noattach toast while detached. */
  toggleOn(): string {
    if (!this.isAttached) {
      return PageOperation.TOAST_NO_ATTACH;
    }
    this.isOn = !this.isOn;
    return this.isOn ? PageOperation.LISTEN : PageOperation.UNLISTEN;
  }

  /** TextInput.onChange for one of the four cursor fields. */
  setCursorField(field: string, raw: string): void {
    let value: number = Number(raw).valueOf();
    if (field === CursorField.LEFT) {
      this.cursorInfo.left = value;
    }
    if (field === CursorField.TOP) {
      this.cursorInfo.top = value;
    }
    if (field === CursorField.WIDTH) {
      this.cursorInfo.width = value;
    }
    if (field === CursorField.HEIGHT) {
      this.cursorInfo.height = value;
    }
  }

  setSelectStart(raw: string): void {
    this.selectStart = Number(raw).valueOf();
  }

  setSelectEnd(raw: string): void {
    this.selectEnd = Number(raw).valueOf();
  }

  /** Tap on btnUpdateCursor: the current cursor info is sent as-is. */
  clickUpdateCursor(): CursorInfoState {
    let sent: CursorInfoState = {
      top: this.cursorInfo.top,
      left: this.cursorInfo.left,
      width: this.cursorInfo.width,
      height: this.cursorInfo.height
    };
    return sent;
  }

  /** Tap on btnChangeSelection: raises the command flag consumed by the editor. */
  clickChangeSelection(): boolean {
    this.isChangeSelection = true;
    return this.isChangeSelection;
  }

  /** Consumes the command flag, mirroring the @Watch reset in the component. */
  consumeChangeSelection(): boolean {
    let pending: boolean = this.isChangeSelection;
    this.isChangeSelection = false;
    return pending;
  }

  /** Dropdown onSelect for the input type; the page refocuses the dropdown. */
  selectInputType(index: number): string {
    this.inputTypeIndex = index;
    return INPUT_TYPE_SELECT_ID;
  }

  /** Dropdown onSelect for the enter key; the page refocuses the dropdown. */
  selectEnterKey(index: number): string {
    this.enterKeyIndex = index;
    return ENTER_KEY_SELECT_ID;
  }

  /** aboutToAppear pushes one SelectOption per input type source entry. */
  buildInputTypeOptions(): number {
    let options: number = 0;
    while (options < SELECT_OPTION_COUNT) {
      options++;
    }
    return options;
  }

  /** aboutToAppear pushes one SelectOption per enter key source entry. */
  buildEnterKeyOptions(): number {
    let options: number = 0;
    while (options < SELECT_OPTION_COUNT) {
      options++;
    }
    return options;
  }

  /** Select.value shown for the current input type index. */
  currentInputTypeLabel(): string {
    return this.inputTypeIndex.toString();
  }

  /** Select.value shown for the current enter key index. */
  currentEnterKeyLabel(): string {
    return this.enterKeyIndex.toString();
  }
}
