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

import { LayoutConstants } from './Constants';

/** Provides Breakpoint Utils helpers for the sample. */
export class BreakpointUtils {
  static readonly SM: string = 'sm';
  static readonly MD: string = 'md';
  static readonly LG: string = 'lg';

  static resolve(widthVp: number): string {
    if (widthVp <= LayoutConstants.SM_MAX) {
      return BreakpointUtils.SM;
    }
    if (widthVp <= LayoutConstants.MD_MAX) {
      return BreakpointUtils.MD;
    }
    return BreakpointUtils.LG;
  }

  static describe(widthVp: number): string {
    const breakpoint = BreakpointUtils.resolve(widthVp);
    return `width=${Math.round(widthVp)}vp, breakpoint=${breakpoint}`;
  }

  static contentMaxWidth(widthVp: number): number {
    const breakpoint = BreakpointUtils.resolve(widthVp);
    if (breakpoint === BreakpointUtils.LG) {
      return 960;
    }
    if (breakpoint === BreakpointUtils.MD) {
      return 720;
    }
    return 560;
  }

  static pagePadding(widthVp: number): number {
    const breakpoint = BreakpointUtils.resolve(widthVp);
    if (breakpoint === BreakpointUtils.LG) {
      return 32;
    }
    if (breakpoint === BreakpointUtils.MD) {
      return 24;
    }
    return 16;
  }

  static isWide(widthVp: number): boolean {
    return widthVp > LayoutConstants.SM_MAX;
  }

  static gridTemplate(widthVp: number): string {
    const breakpoint = BreakpointUtils.resolve(widthVp);
    if (breakpoint === BreakpointUtils.LG) {
      return '1fr 1fr 1fr';
    }
    if (breakpoint === BreakpointUtils.MD) {
      return '1fr 1fr';
    }
    return '1fr';
  }

  static columnCount(widthVp: number): number {
    const breakpoint = BreakpointUtils.resolve(widthVp);
    if (breakpoint === BreakpointUtils.LG) {
      return 3;
    }
    if (breakpoint === BreakpointUtils.MD) {
      return 2;
    }
    return 1;
  }
}
