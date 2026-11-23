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

// Progress bar, counter and tab logic of casesfeature/tabcontentoverflow mainpage/TabContentOverFlow.ets and
// view/Side.ets; screenW (px2vp of the display width) is passed in explicitly.

// Mirrors CONFIGURATION values used by the progress bar.
export const INTERVAL_NUMBER: number = 30;
export const ZERO: number = 0;
export const TEN: number = 10;
export const TIME_ZERO: string = '0';
// Mirrors the Side.ets counter defaults.
export const DEFAULT_LIKE_COUNT: number = 1234;
export const DEFAULT_COMMENT_COUNT: number = 2234;
export const DEFAULT_FAVORITE_COUNT: number = 3234;
// Mirrors tabArray / imageArray / imageClickArray of TabContentOverFlow.ets.
export const TAB_NAMES: string[] = ['homepage', 'video', 'mall', 'mine'];
export const DEFAULT_TAB_INDEX: number = 1;

// Mirrors the usable track width: screenW - TABCONTENT_OVERFLOW_INTERVAL_NUMBER.
export function trackWidthOf(screenW: number): number {
  return screenW - INTERVAL_NUMBER;
}

// Mirrors Video.onUpdate(): offsetX = event.time / totalTime * (screenW - 30).
export function offsetForTimeOf(time: number, totalTime: number, screenW: number): number {
  return time / totalTime * trackWidthOf(screenW);
}

// Mirrors onActionUpdate(): offsetX = positionX + event.offsetX clamped to [0, screenW - 30].
export function clampedOffsetOf(positionX: number, deltaX: number, screenW: number): number {
  let offsetX: number = positionX + deltaX;
  if (offsetX <= ZERO) {
    offsetX = ZERO;
  }
  if (offsetX >= trackWidthOf(screenW)) {
    offsetX = trackWidthOf(screenW);
  }
  return offsetX;
}

// Mirrors onActionUpdate(): playTime = Math.floor(offsetX / (screenW - 30) * totalTime).
export function playSecondsOf(offsetX: number, screenW: number, totalTime: number): number {
  return Math.floor(offsetX / trackWidthOf(screenW) * totalTime);
}

// Mirrors the playTime text: values below 10 get the '0' prefix.
export function playTimeTextOf(playTime: number): string {
  if (playTime >= TEN) {
    return playTime.toString();
  }
  return TIME_ZERO + playTime.toString();
}

// Mirrors onActionEnd(): setCurrentTime(Number((offsetX / (screenW - 30) * totalTime).toFixed(3))).
export function seekTimeOf(offsetX: number, screenW: number, totalTime: number): number {
  return Number((offsetX / trackWidthOf(screenW) * totalTime).toFixed(3));
}

// Mirrors onActionEnd(): a seek is issued only when the bar moved.
export function seeksOnEnd(positionX: number, offsetX: number): boolean {
  return positionX !== offsetX;
}

// Mirrors the play button onClick(): isPlay toggles.
export function nextPlayState(isPlay: boolean): boolean {
  return !isPlay;
}

// Mirrors changeLikeCount() / changeFavoriteCount(): +1 when not yet active, -1 otherwise.
export function nextCountOf(count: number, isActive: boolean): number {
  return isActive ? count - 1 : count + 1;
}

// Mirrors the tab bar icon: the filled image for the selected index.
export function tabImageOf(index: number, selectedIndex: number): string {
  if (!Number.isInteger(index) || index < 0 || index >= TAB_NAMES.length) {
    return '';
  }
  const suffix: string = index === selectedIndex ? '_filled' : '';
  return `app.media.tabcontentoverflow_${TAB_NAMES[index]}${suffix}`;
}

// Mirrors the tab title resource of an index.
export function tabTitleOf(index: number): string {
  if (!Number.isInteger(index) || index < 0 || index >= TAB_NAMES.length) {
    return '';
  }
  return `app.string.tabcontentoverflow_${TAB_NAMES[index]}`;
}

// Mirrors the progress bar while dragging and playing (TabContentOverFlow).
export class ProgressBarState {
  screenW: number = 360;
  totalTime: number = 0;
  offsetX: number = 0;
  positionX: number = 0;
  playTime: string = '';
  isTouch: boolean = false;
  isSeek: boolean = false;
  isPlay: boolean = false;
  lastSeek: number = -1;

  constructor(screenW: number, totalTime: number) {
    this.screenW = screenW;
    this.totalTime = totalTime;
  }

  // Mirrors Video.onUpdate() outside a drag.
  update(time: number): number {
    if (this.isTouch) {
      return this.offsetX;
    }
    if (!this.isSeek) {
      this.offsetX = offsetForTimeOf(time, this.totalTime, this.screenW);
      this.positionX = this.offsetX;
    } else {
      this.isSeek = false;
    }
    return this.offsetX;
  }

  // Mirrors onActionStart().
  startDrag(): void {
    this.isSeek = true;
    this.isTouch = true;
  }

  // Mirrors onActionUpdate(event.offsetX).
  drag(deltaX: number): string {
    const playTime: number = playSecondsOf(this.offsetX, this.screenW, this.totalTime);
    this.offsetX = clampedOffsetOf(this.positionX, deltaX, this.screenW);
    this.playTime = playTimeTextOf(playTime);
    return this.playTime;
  }

  // Mirrors onActionEnd(); returns the seek time or -1 when the bar did not move.
  endDrag(): number {
    let seek: number = -1;
    if (this.positionX === this.offsetX) {
      this.isSeek = false;
    } else {
      seek = seekTimeOf(this.offsetX, this.screenW, this.totalTime);
      this.positionX = this.offsetX;
    }
    this.isTouch = false;
    this.lastSeek = seek;
    return seek;
  }

  // Mirrors the play button.
  togglePlay(): boolean {
    this.isPlay = nextPlayState(this.isPlay);
    return this.isPlay;
  }
}

// Mirrors the like / favorite / focus buttons of view/Side.ets.
export class SideBarState {
  likeCount: number = DEFAULT_LIKE_COUNT;
  favoriteCount: number = DEFAULT_FAVORITE_COUNT;
  isLike: boolean = false;
  isFavorite: boolean = false;
  isFocus: boolean = false;

  // Mirrors changeLikeCount().
  toggleLike(): number {
    this.likeCount = nextCountOf(this.likeCount, this.isLike);
    this.isLike = !this.isLike;
    return this.likeCount;
  }

  // Mirrors changeFavoriteCount().
  toggleFavorite(): number {
    this.favoriteCount = nextCountOf(this.favoriteCount, this.isFavorite);
    this.isFavorite = !this.isFavorite;
    return this.favoriteCount;
  }

  // Mirrors the focus button: isFocus toggles inside animateTo().
  toggleFocus(): boolean {
    this.isFocus = !this.isFocus;
    return this.isFocus;
  }
}
