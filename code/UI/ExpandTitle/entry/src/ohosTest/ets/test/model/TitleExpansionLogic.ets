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

// Scroll-driven title math of utils/TitleExpansion.ets (height change, scale, opacity, translate, settle and the
// animateTo throttle) with the timer replaced by explicit timestamps.

import { AnimationAttribute } from '../../../../main/ets/model/AnimationAttribute';
import Constants from '../../../../main/ets/constants/Constants';

// Mirrors private delay: number = 240 of the animateTo throttle.
export const THROTTLE_DELAY: number = 240;

// Mirrors thresholdValue = (normalTitleHeight + expandTitleHeight) / 2.
export function thresholdOf(normalTitleHeight: number, expandTitleHeight: number): number {
  return (normalTitleHeight + expandTitleHeight) / 2;
}

// Mirrors getTitleHeightChangeOptions(offset): the change clamped to the expand / normal heights.
export function heightChangeOf(offset: number, heightValue: number, normalTitleHeight: number,
  expandTitleHeight: number): number {
  return Math.max(Math.min(offset, expandTitleHeight - heightValue), normalTitleHeight - heightValue);
}

// Mirrors getTitleScaleOptions(): 1 + (titleScale - 1) * min((height - normal + max(-curOffset, 0)) / threshold, 1).
export function scaleRatioOf(heightValue: number, curOffset: number, normalTitleHeight: number, titleScale: number,
  continuePullThreshold: number): number {
  return 1 + (titleScale - 1) *
    Math.min((heightValue - normalTitleHeight + Math.max(-curOffset, 0)) / continuePullThreshold, 1);
}

// Mirrors getTitleOpacityOptions(): (height - normal) / (expand - normal).
export function titleOpacityOf(heightValue: number, normalTitleHeight: number, expandTitleHeight: number): number {
  return (heightValue - normalTitleHeight) / (expandTitleHeight - normalTitleHeight);
}

// Mirrors getMenuTranslateOptions() / getTitleTranslateOptions(): { y: Math.max(-curOffset, 0) }.
export function translateYOf(curOffset: number): number {
  return Math.max(-curOffset, 0);
}

// Mirrors onScrollFrameBegin(): listOffset = Math.max(offset, -yOffset) when scrolling back (offset < 0).
export function listOffsetOf(offset: number, yOffset: number): number {
  if (offset < 0) {
    return Math.max(offset, -yOffset);
  }
  return 0;
}

// Mirrors onScrollStop(): heights at or above the threshold expand, others collapse.
export function settleHeightOf(heightValue: number): number {
  const threshold: number = thresholdOf(Constants.NORMAL_TITLE_HEIGHT, Constants.EXPAND_TITLE_HEIGHT);
  return heightValue >= threshold ? Constants.EXPAND_TITLE_HEIGHT : Constants.NORMAL_TITLE_HEIGHT;
}

// Mirrors the default AnimationAttribute built from Constants for the Index page.
export function defaultAttribute(): AnimationAttribute {
  return new AnimationAttribute(Constants.NORMAL_TITLE_HEIGHT, Constants.EXPAND_TITLE_HEIGHT,
    Constants.CONTINUE_PULL_THRESHOLD, Constants.TITLE_SCALE_MAX_VALUE, Constants.ANIMATION_DURATION);
}

// Mirrors animateToThrottle(): one animation per THROTTLE_DELAY window.
export class ThrottleGate {
  open: boolean = true;
  openedAt: number = 0;
  passed: number = 0;
  blocked: number = 0;

  // Mirrors a throttled animateTo() request at time now (ms); the setTimeout reopens the gate after the delay.
  request(now: number): boolean {
    if (!this.open && now - this.openedAt >= THROTTLE_DELAY) {
      this.open = true;
    }
    if (this.open) {
      this.open = false;
      this.openedAt = now;
      this.passed++;
      return true;
    }
    this.blocked++;
    return false;
  }
}

// Mirrors the TitleExpansion component state driven by the List scroll callbacks.
export class TitleExpansionState {
  heightValue: number = Constants.NORMAL_TITLE_HEIGHT;
  curOffset: number = 0;
  normalTitleHeight: number = Constants.NORMAL_TITLE_HEIGHT;
  expandTitleHeight: number = Constants.EXPAND_TITLE_HEIGHT;
  titleScale: number = Constants.TITLE_SCALE_MAX_VALUE;
  continuePullThreshold: number = Constants.CONTINUE_PULL_THRESHOLD;

  // Mirrors onDidScroll(): curOffset follows the scroller y offset.
  didScroll(yOffset: number): number {
    this.curOffset = yOffset;
    return translateYOf(this.curOffset);
  }

  // Mirrors onScrollFrameBegin(offset): the title absorbs -offset within its height range.
  frameBegin(offset: number): number {
    const change: number = heightChangeOf(-offset, this.heightValue, this.normalTitleHeight, this.expandTitleHeight);
    this.heightValue += change;
    return this.heightValue;
  }

  // Mirrors onScrollStop(): snap to the expanded or normal height.
  stop(): number {
    this.heightValue = this.heightValue >= thresholdOf(this.normalTitleHeight, this.expandTitleHeight) ?
      this.expandTitleHeight : this.normalTitleHeight;
    return this.heightValue;
  }

  // Mirrors getTitleScaleOptions().x for the current state.
  scale(): number {
    return scaleRatioOf(this.heightValue, this.curOffset, this.normalTitleHeight, this.titleScale,
      this.continuePullThreshold);
  }

  // Mirrors getTitleOpacityOptions() for the current state.
  opacity(): number {
    return titleOpacityOf(this.heightValue, this.normalTitleHeight, this.expandTitleHeight);
  }
}
