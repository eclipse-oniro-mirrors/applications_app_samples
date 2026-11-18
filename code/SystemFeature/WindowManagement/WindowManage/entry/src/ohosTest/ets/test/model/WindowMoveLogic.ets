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

// Deterministic logic of WindowComponent/src/main/ets/components/feature/WindowManger.ts (sub window drag,
// window event messages, start positions) and of entry/src/main/ets/pages/Index.ets. vp2px is expressed with an
// explicit density so that the arithmetic can be checked off-device.

// Mirrors the module constants of WindowManger.ts.
export const POINT_X: number = 50;
export const POINT_Y: number = 250;
export const SUB_WIDTH: number = 320;
export const SUB_HEIGHT: number = 240;
export const MOVE_X: number = 10;
export const MOVE_Y: number = 500;
export const MOVE_Y2: number = 300;
// Mirrors WindowEventId.SUB_WINDOW_INNER_EVENT_ID and WindowColor of WindowConst.ts.
export const SUB_WINDOW_INNER_EVENT_ID: number = 1001;
export const STATUS_BAR_COLOR: string = '#ffffff';
export const NAVIGATION_BAR_COLOR: string = '#ffffff';
export const BAR_CONTENT_COLOR: string = '#000000';
export const SUB_WINDOW_NAME: string = 'mySubWindow';
export const SUB_WINDOW_PAGE: string = 'pages/SubWindowPage';

// Mirrors vp2px(): vp multiplied by the display density.
export function vp2pxAt(vp: number, density: number): number {
  return vp * density;
}

// Mirrors the windowEvent switch (JSON.stringify(data)): the string resource shown as focusText.
export function windowEventMessageOf(eventCode: string): string {
  switch (eventCode) {
    case '1':
      return 'foreground';
    case '2':
      return 'get_focus';
    case '3':
      return 'lose_focus';
    case '4':
      return 'background';
    default:
      return 'unknown';
  }
}

// Mirrors subWindow.resize(vp2px(WIDTH), vp2px(HEIGHT)): the sub window width in px.
export function subWindowWidthPx(density: number): number {
  return vp2pxAt(SUB_WIDTH, density);
}

// Mirrors subWindow.resize(vp2px(WIDTH), vp2px(HEIGHT)): the sub window height in px.
export function subWindowHeightPx(density: number): number {
  return vp2pxAt(SUB_HEIGHT, density);
}

// Mirrors updateDisplay(): MOVE_Y becomes half of the display height.
export function displayMoveYOf(windowHeight: number): number {
  return windowHeight / 2;
}

// Mirrors initSubWindow(): portrait windows start at MOVE_Y, landscape windows at MOVE_Y2.
export function subWindowStartYOf(isPortrait: boolean, currentMoveY: number): number {
  return isPortrait ? currentMoveY : MOVE_Y2;
}

// Mirrors the drag callback: a touch restarts the gesture when no start point exists or the type is DOWN (0).
export function restartsGesture(startX: number, startY: number, touchType: number): boolean {
  return startX === 0 || startY === 0 || isNaN(startX) || isNaN(startY) || touchType === 0;
}

// Mirrors this.endX += vp2px(this.distanceX).
export function nextEndOf(end: number, current: number, previous: number, density: number): number {
  return end + vp2pxAt(current - previous, density);
}

// Mirrors the bound check of the drag callback before subWindow.moveWindowTo(endX, endY).
export function insideBounds(endX: number, endY: number, windowWidth: number, windowHeight: number, topHeight: number,
  density: number): boolean {
  return endX > 0 && endX < windowWidth - subWindowWidthPx(density) && endY > topHeight &&
    endY < windowHeight - subWindowHeightPx(density);
}

// Mirrors the Index page layout: justifyContent(this.isChangeWindow ? Start : Center).
export function indexAlignmentOf(isChangeWindow: boolean): string {
  return isChangeWindow ? 'Start' : 'Center';
}

// Mirrors the WindowType attributes applied by setSubWindowAttribute(): the resized area in px.
export function attributeAreaOf(resetSizeWidth: number, resetSizeHeight: number): number {
  return resetSizeWidth * resetSizeHeight;
}

// Mirrors setWindowBrightness(): values outside [0, 1] are rejected by the window manager (-1 resets).
export function isValidBrightness(brightness: number): boolean {
  return brightness === -1 || (brightness >= 0 && brightness <= 1);
}

// Mirrors the sub window drag handling of WindowManger.initSubWindow().
export class SubWindowDragModel {
  startX: number = 0;
  startY: number = 0;
  endX: number = MOVE_X;
  endY: number = MOVE_Y;
  windowWidth: number = 0;
  windowHeight: number = 0;
  topHeight: number = 0;
  density: number = 1;
  moves: number = 0;

  constructor(windowWidth: number, windowHeight: number, density: number) {
    this.windowWidth = windowWidth;
    this.windowHeight = windowHeight;
    this.density = density;
  }

  // Mirrors updateDisplay(): the display size is read and endY moves to half of the height.
  updateDisplay(windowWidth: number, windowHeight: number): number {
    this.windowWidth = windowWidth;
    this.windowHeight = windowHeight;
    this.endY = displayMoveYOf(windowHeight);
    return this.endY;
  }

  // Mirrors the avoidAreaChange listener storing topHeight.
  setTopHeight(topHeight: number): void {
    this.topHeight = topHeight;
  }

  // Mirrors the emitter callback for one touch event; returns true when moveWindowTo() is called.
  touch(x: number, y: number, touchType: number): boolean {
    if (restartsGesture(this.startX, this.startY, touchType)) {
      this.startX = x;
      this.startY = y;
      return false;
    }
    this.endX = nextEndOf(this.endX, x, this.startX, this.density);
    this.endY = nextEndOf(this.endY, y, this.startY, this.density);
    this.startX = x;
    this.startY = y;
    if (insideBounds(this.endX, this.endY, this.windowWidth, this.windowHeight, this.topHeight, this.density)) {
      this.moves++;
      return true;
    }
    return false;
  }
}
