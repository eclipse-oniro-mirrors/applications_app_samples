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

import { TitleBarConstants } from './Constants';

/** Provides Title Bar Utils helpers for the sample. */
export class TitleBarUtils {
  static clampIndex(index: number, length: number): number {
    if (length <= 0) {
      return 0;
    }
    if (index < 0) {
      return 0;
    }
    if (index >= length) {
      return length - 1;
    }
    return index;
  }

  static nextIndex(index: number, length: number): number {
    if (length <= 0) {
      return 0;
    }
    return (TitleBarUtils.clampIndex(index, length) + 1) % length;
  }

  static badgeText(value: number): string {
    if (value <= 0) {
      return '';
    }
    if (value > TitleBarConstants.BADGE_MAX) {
      return `${TitleBarConstants.BADGE_MAX}+`;
    }
    return `${Math.round(value)}`;
  }

  static formatAction(action: string, count: number): string {
    return `action=${action}, count=${count}`;
  }

  static describeIndex(label: string, index: number, length: number): string {
    return `${label}=${TitleBarUtils.clampIndex(index, length)}/${length}`;
  }

  static describeTab(index: number, title: string): string {
    return `tab=${TitleBarUtils.clampIndex(index, TitleBarConstants.TAB_COUNT)}, title=${title}`;
  }

  static describeToolbar(index: number, label: string, count: number): string {
    return `index=${index}, label=${label}, count=${count}`;
  }
}
