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

// Deterministic logic of pages/Index.ets (Index + CustomDialogExample) and cpp/NativeNotificationAdaptor.cpp.

// Mirrors the texts of pages/Index.ets.
export const PAGE_MESSAGE: string = 'Native Notification Sample';
export const CHECK_BUTTON_LABEL: string = 'Check notification enabled';
export const DIALOG_TITLE: string = 'Native Notification Sample';
export const DIALOG_RESULT_PREFIX: string = 'Current application notification enabled: ';
export const OK_BUTTON_LABEL: string = 'OK';
// Mirrors the px values converted with px2vp() and the vp/fp literals of the layout.
export const TITLE_AREA_PX: number = 280;
export const DIALOG_TITLE_HEIGHT_PX: number = 100;
export const DIALOG_TEXT_MARGIN_PX: number = 84;
export const TITLE_FONT_SIZE: number = 30;
export const TITLE_FONT_WEIGHT: number = 700;
export const TITLE_MARGIN_TOP: number = 56;
export const SIDE_MARGIN: number = 16;
export const BUTTON_FONT_SIZE: number = 18;
export const DIALOG_TITLE_FONT_SIZE: number = 24;
export const DIALOG_TEXT_FONT_WEIGHT: number = 400;
export const DIALOG_BUTTON_FONT_WEIGHT: number = 500;
export const DIALOG_BUTTON_MARGIN: number = 5;
export const DIALOG_TEXT_WIDTH_PERCENT: number = 90;
// Mirrors the napi property registered by Init() in NativeNotificationAdaptor.cpp.
export const NAPI_METHOD_NAME: string = 'isNotificationEnabled';

// Mirrors px2vp(): a px length divided by the display density (vp per px scale).
export function px2vpAt(px: number, density: number): number {
  if (density <= 0) {
    return 0;
  }
  return px / density;
}

// Mirrors the inverse conversion used when the layout values are rendered (vp2px).
export function vp2pxAt(vp: number, density: number): number {
  return vp * density;
}

// Mirrors .height(px2vp(280)) of the title area.
export function titleAreaHeightAt(density: number): number {
  return px2vpAt(TITLE_AREA_PX, density);
}

// Mirrors .height(px2vp(100)) of the dialog title.
export function dialogTitleHeightAt(density: number): number {
  return px2vpAt(DIALOG_TITLE_HEIGHT_PX, density);
}

// Mirrors .margin({ left: px2vp(84), right: px2vp(84) }) of the dialog text.
export function dialogTextMarginAt(density: number): number {
  return px2vpAt(DIALOG_TEXT_MARGIN_PX, density);
}

// Mirrors the horizontal room left for the dialog text: width minus both px2vp(84) margins.
export function dialogTextRoomAt(dialogWidthVp: number, density: number): number {
  const room: number = dialogWidthVp - 2 * dialogTextMarginAt(density);
  return room > 0 ? room : 0;
}

// Mirrors .width('90%') of the dialog text for a given parent width.
export function dialogTextWidthOf(parentWidthVp: number): number {
  return parentWidthVp * DIALOG_TEXT_WIDTH_PERCENT / 100;
}

// Mirrors the check button row: full width minus the 16 vp side margins.
export function checkButtonWidthOf(rowWidthVp: number): number {
  const width: number = rowWidthVp - 2 * SIDE_MARGIN;
  return width > 0 ? width : 0;
}

// Mirrors the title text box: page width minus the 16 vp side margins.
export function titleTextWidthOf(pageWidthVp: number): number {
  return checkButtonWidthOf(pageWidthVp);
}

// Mirrors the space left between the title area and the bottom button row (SpaceBetween layout).
export function freeSpaceOf(pageHeightVp: number, density: number, buttonRowHeightVp: number): number {
  const free: number = pageHeightVp - titleAreaHeightAt(density) - buttonRowHeightVp - SIDE_MARGIN;
  return free > 0 ? free : 0;
}

// Mirrors String(this.result) concatenated into the dialog result text.
export function resultLabelOf(enabled: boolean): string {
  return enabled ? 'true' : 'false';
}

// Mirrors Text('Current application notification enabled: ' + this.result).
export function dialogResultTextOf(enabled: boolean): string {
  return DIALOG_RESULT_PREFIX + resultLabelOf(enabled);
}

// Mirrors the inverse reading of the dialog text (used by UI tests to check the rendered result).
export function parseDialogResult(text: string): number {
  if (!text.startsWith(DIALOG_RESULT_PREFIX)) {
    return -1;
  }
  const value: string = text.substring(DIALOG_RESULT_PREFIX.length);
  if (value === 'true') {
    return 1;
  }
  if (value === 'false') {
    return 0;
  }
  return -1;
}

// Mirrors IsNotificationEnabled(): the native bool is passed through napi_get_boolean unchanged.
export function napiBooleanOf(nativeEnabled: boolean): boolean {
  return nativeEnabled;
}

// Mirrors Init(): only the registered napi name is callable from ArkTS.
export function isExportedNapi(name: string): boolean {
  return name === NAPI_METHOD_NAME;
}

// Mirrors the font weight literals of the page: titles are bold (>= 700), dialog text regular (400).
export function isBoldWeight(weight: number): boolean {
  return weight >= TITLE_FONT_WEIGHT;
}

// Mirrors the title/dialog font sizes scaled by the system font scale (fp).
export function scaledFontOf(fontSizeFp: number, fontScale: number): number {
  return fontSizeFp * fontScale;
}

// Mirrors the Index page plus its CustomDialogExample: check opens the dialog, OK closes it.
export class NotificationPageState {
  result: boolean = false;
  dialogOpen: boolean = false;
  openCount: number = 0;
  closeCount: number = 0;
  hasController: boolean = true;

  // Mirrors the check Button.onClick(): result = isNotificationEnabled(); privacyDialogController.open().
  check(nativeEnabled: boolean): string {
    this.result = napiBooleanOf(nativeEnabled);
    this.dialogOpen = true;
    this.openCount++;
    return dialogResultTextOf(this.result);
  }

  // Mirrors the OK Button.onClick(): the dialog closes only when its controller is defined.
  confirm(): boolean {
    if (this.hasController && this.dialogOpen) {
      this.dialogOpen = false;
      this.closeCount++;
      return true;
    }
    return false;
  }

  // Mirrors a dialog instantiated without a controller (controller?: CustomDialogController).
  detachController(): void {
    this.hasController = false;
  }

  // Mirrors the Text bound to the @Link result of the dialog.
  dialogText(): string {
    return dialogResultTextOf(this.result);
  }

  // Mirrors autoCancel: false - the dialog stays open until OK is pressed.
  tapOutside(): boolean {
    return this.dialogOpen;
  }
}
