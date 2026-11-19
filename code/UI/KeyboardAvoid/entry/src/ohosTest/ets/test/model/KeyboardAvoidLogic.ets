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

// State and size logic of casesfeature/keyboardavoid components/KeyboardAvoidIndex.ets; px2vp() is expressed with
// an explicit density and KeyboardAvoidMode.RESIZE with explicit window heights.

// Mirrors the @State contentData of KeyboardAvoidIndex.ets.
export const CONTENT_DATA: string[] = ['\u7b2c\u4e00\u6761\u6570\u636e', '\u7b2c\u4e8c\u6761\u6570\u636e',
  '\u7b2c\u4e09\u6761\u6570\u636e', '\u7b2c\u56db\u6761\u6570\u636e', '\u7b2c\u4e94\u6761\u6570\u636e',
  '\u7b2c\u516d\u6761\u6570\u636e', '\u7b2c\u4e03\u6761\u6570\u636e', '\u7b2c\u516b\u6761\u6570\u636e',
  '\u7b2c\u4e5d\u6761\u6570\u636e', '\u7b2c\u5341\u6761\u6570\u636e', '\u7b2c\u5341\u4e00\u6761\u6570\u636e',
  '\u7b2c\u5341\u4e8c\u6761\u6570\u636e'];
// Mirrors the opacity of the pop-up button while the keyboard is shown.
export const SHOWN_OPACITY: number = 0.5;
export const HIDDEN_OPACITY: number = 1;

// Mirrors this.keyboardHeight = px2vp(data) of the keyboardHeightChange listener.
export function keyboardHeightVpOf(heightPx: number, density: number): number {
  if (density <= 0) {
    return 0;
  }
  return heightPx / density;
}

// Mirrors .opacity(this.keyboardHeight > 0 ? 0.5 : 1) of KeyboardAvoidButtonPopUpKeyboard.
export function popUpOpacityOf(keyboardHeightVp: number): number {
  return keyboardHeightVp > 0 ? SHOWN_OPACITY : HIDDEN_OPACITY;
}

// Mirrors whether the soft keyboard currently occupies space.
export function isKeyboardShown(keyboardHeightVp: number): boolean {
  return keyboardHeightVp > 0;
}

// Mirrors .padding({ bottom: px2vp(this.avoidAreaBottomToModule) }).
export function bottomPaddingVpOf(avoidAreaBottomPx: number, density: number): number {
  return keyboardHeightVpOf(avoidAreaBottomPx, density);
}

// Mirrors KeyboardAvoidMode.RESIZE: the page height shrinks by the keyboard height (never below zero).
export function resizedHeightOf(windowHeightVp: number, keyboardHeightVp: number): number {
  const height: number = windowHeightVp - keyboardHeightVp;
  return height > 0 ? height : 0;
}

// Mirrors the content area above the input row: resized height minus the bottom padding and the input row height.
export function contentHeightOf(windowHeightVp: number, keyboardHeightVp: number, bottomPaddingVp: number,
  inputRowHeightVp: number): number {
  const height: number = resizedHeightOf(windowHeightVp, keyboardHeightVp) - bottomPaddingVp - inputRowHeightVp;
  return height > 0 ? height : 0;
}

// Mirrors the lift-up / scaling buttons: exactly one presentation is shown after a press.
export function liftUpShownAfter(pressed: string, current: boolean): boolean {
  if (pressed === 'liftUp') {
    return true;
  }
  if (pressed === 'scaling') {
    return false;
  }
  return current;
}

// Mirrors the scaling flag after a button press.
export function scalingShownAfter(pressed: string, current: boolean): boolean {
  if (pressed === 'scaling') {
    return true;
  }
  if (pressed === 'liftUp') {
    return false;
  }
  return current;
}

// Mirrors .fontColor(selected ? Color.White : Color.Black) of the mode buttons.
export function buttonFontColorOf(selected: boolean): string {
  return selected ? 'White' : 'Black';
}

// Mirrors the LazyForEach key generator (item: string) => item and the item lookup.
export function contentItemAt(index: number): string {
  if (!Number.isInteger(index) || index < 0 || index >= CONTENT_DATA.length) {
    return '';
  }
  return CONTENT_DATA[index];
}

// Mirrors the rows of the scaling Grid for a column count.
export function gridRowsOf(itemCount: number, columns: number): number {
  if (columns <= 0) {
    return 0;
  }
  return Math.ceil(itemCount / columns);
}

// Mirrors the lift-up list: items that stay visible above the keyboard for a given item height.
export function visibleItemsOf(windowHeightVp: number, keyboardHeightVp: number, itemHeightVp: number): number {
  if (itemHeightVp <= 0) {
    return 0;
  }
  return Math.floor(resizedHeightOf(windowHeightVp, keyboardHeightVp) / itemHeightVp);
}

// Mirrors the KeyboardAvoid component state.
export class KeyboardAvoidState {
  keyboardHeight: number = 0;
  isLiftUpShow: boolean = true;
  isScalingShow: boolean = false;
  avoidAreaBottom: number = 0;
  density: number = 3;

  // Mirrors the keyboardHeightChange listener.
  onKeyboardHeightChange(heightPx: number): number {
    this.keyboardHeight = keyboardHeightVpOf(heightPx, this.density);
    return popUpOpacityOf(this.keyboardHeight);
  }

  // Mirrors the KeyboardAvoidButtonLiftUp onClick().
  pressLiftUp(): boolean {
    this.isLiftUpShow = true;
    this.isScalingShow = false;
    return this.isLiftUpShow;
  }

  // Mirrors the KeyboardAvoidButtonScaling onClick().
  pressScaling(): boolean {
    this.isScalingShow = true;
    this.isLiftUpShow = false;
    return this.isScalingShow;
  }

  // Mirrors the @StorageLink('avoidAreaBottomToModule') update.
  setAvoidAreaBottom(px: number): number {
    this.avoidAreaBottom = px;
    return bottomPaddingVpOf(px, this.density);
  }

  // Mirrors the visible content height for a window height in vp (input row of 56 vp).
  contentHeight(windowHeightVp: number): number {
    const bottomPadding: number = bottomPaddingVpOf(this.avoidAreaBottom, this.density);
    return contentHeightOf(windowHeightVp, this.keyboardHeight, bottomPadding, 56);
  }
}
