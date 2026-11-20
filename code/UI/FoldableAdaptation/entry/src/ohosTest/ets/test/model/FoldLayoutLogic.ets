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

// Layout decisions of entryability/EntryAbility.ets (updateBreakpoint), pages/HomePage.ets (onWindowSizeChange,
// onModeChange, tab columns) and utils/RouterUtils.ets (popAppRouter branches) with display values passed in.

import { BreakpointConstants } from '../../../../main/ets/constants/BreakpointConstants';
import { NavMode } from '../../../../main/ets/utils/RouterUtils';

// Mirrors FULL_SCREEN_ROUTE of pages/HomePage.ets.
export const FULL_SCREEN_ROUTE: string[] = ['fullscreen'];
// Mirrors the item widths used by the tab columns of HomePage.onAreaChange().
export const FOLDABLE_ITEM_WIDTH: number = 158;
export const ITEM_WIDTH: number = 177;
// Mirrors DEFAULT_WINDOW_SIZE.width of constants/Constants.ets.
export const DEFAULT_WINDOW_WIDTH: number = 1280;

// Mirrors updateBreakpoint(windowWidth): px width / densityPixels compared with BREAKPOINT_RANGES[1] / [2].
export function breakpointOf(windowWidth: number, densityPixels: number): string {
  const windowWidthVp: number = windowWidth / densityPixels;
  if (windowWidthVp < BreakpointConstants.BREAKPOINT_RANGES[1]) {
    return BreakpointConstants.BREAKPOINT_SM;
  }
  if (windowWidthVp < BreakpointConstants.BREAKPOINT_RANGES[2]) {
    return BreakpointConstants.BREAKPOINT_MD;
  }
  return BreakpointConstants.BREAKPOINT_LG;
}

// Mirrors the GridRow columns per breakpoint (GRID_ROW_COLUMNS: sm 4, md 8, lg 12).
export function gridColumnsOf(breakpoint: string): number {
  if (breakpoint === BreakpointConstants.BREAKPOINT_SM) {
    return BreakpointConstants.GRID_ROW_COLUMNS[0];
  }
  if (breakpoint === BreakpointConstants.BREAKPOINT_MD) {
    return BreakpointConstants.GRID_ROW_COLUMNS[1];
  }
  return BreakpointConstants.GRID_ROW_COLUMNS[2];
}

// Mirrors onWindowSizeChange(): sm keeps the home page mode, larger breakpoints switch to fold mode.
export function navModeOfBreakpoint(breakpoint: string): number {
  return breakpoint === BreakpointConstants.BREAKPOINT_SM ? NavMode.HomePageMode : NavMode.FoldMode;
}

// Mirrors FULL_SCREEN_ROUTE.includes(routeName).
export function isFullScreenRoute(routeName: string): boolean {
  return FULL_SCREEN_ROUTE.includes(routeName);
}

// Mirrors onModeChange(): the NavigationMode ('Stack' or 'Split') chosen for a mode, routes and stack size.
export function navigationModeOf(navMode: number, lastRoute: string, enterRoute: string, breakpoint: string,
  stackSize: number): string {
  const isSm: boolean = breakpoint === BreakpointConstants.BREAKPOINT_SM;
  switch (navMode) {
    case NavMode.FoldMode:
      if (isFullScreenRoute(lastRoute)) {
        return 'Stack';
      }
      return !isSm && stackSize > 0 ? 'Split' : 'Stack';
    case NavMode.ChildPageMode:
      if (isFullScreenRoute(enterRoute)) {
        return 'Stack';
      }
      return isSm ? 'Stack' : 'Split';
    case NavMode.HomePageMode:
      return 'Stack';
    default:
      return '';
  }
}

// Mirrors onModeChange(): swiperDisplayCount (0 means unchanged by the branch).
export function swiperDisplayCountOf(navMode: number, lastRoute: string, enterRoute: string, breakpoint: string,
  stackSize: number): number {
  const isSm: boolean = breakpoint === BreakpointConstants.BREAKPOINT_SM;
  switch (navMode) {
    case NavMode.FoldMode:
      if (isFullScreenRoute(lastRoute)) {
        return 0;
      }
      if (!isSm) {
        return stackSize > 0 ? 1 : 2;
      }
      return 1;
    case NavMode.ChildPageMode:
      return isFullScreenRoute(enterRoute) ? 0 : 1;
    case NavMode.HomePageMode:
      return isSm ? 1 : 2;
    default:
      return 0;
  }
}

// Mirrors onAreaChange(): maxItemCount = Math.floor(width / (isFoldable ? 158 : 177)).
export function maxItemCountOf(width: number, isFoldable: boolean): number {
  return Math.floor(width / (isFoldable ? FOLDABLE_ITEM_WIDTH : ITEM_WIDTH));
}

// Mirrors tabColumns = '1fr' + ' 1fr'.repeat(maxItemCount - 1) (repeat throws for a negative count).
export function tabColumnsOf(width: number, isFoldable: boolean): string {
  const maxItemCount: number = maxItemCountOf(width, isFoldable);
  return `1fr${' 1fr'.repeat(maxItemCount - 1)}`;
}

// Mirrors the number of columns encoded by a columnsTemplate string.
export function columnCountOf(template: string): number {
  if (template.trim().length === 0) {
    return 0;
  }
  return template.trim().split(/\s+/).length;
}

// Mirrors popAppRouter(): which branch handles the back navigation.
export function popBranchOf(lastRoute: string, stackSize: number): string {
  if (!isFullScreenRoute(lastRoute) && stackSize === 1) {
    return 'popAndNotifyLater';
  }
  if (isFullScreenRoute(lastRoute)) {
    return 'popAndNotify';
  }
  return 'pop';
}

// Mirrors popAppRouter(): the pop animation is disabled on displays wider than DEFAULT_WINDOW_SIZE.width.
export function disablesPopAnimation(displayWidth: number): boolean {
  return displayWidth > DEFAULT_WINDOW_WIDTH;
}

// Mirrors the HomePage navigation state reacting to breakpoint and route changes.
export class FoldLayoutState {
  breakpoint: string = '';
  navMode: number = NavMode.DefaultMode;
  navigationMode: string = 'Stack';
  swiperDisplayCount: number = 1;
  stackSize: number = 0;
  lastRoute: string = '';
  enterRoute: string = '';

  // Mirrors updateBreakpoint() followed by the @Watch('onWindowSizeChange') callback and onModeChange().
  resize(windowWidth: number, densityPixels: number): string {
    this.breakpoint = breakpointOf(windowWidth, densityPixels);
    this.navMode = navModeOfBreakpoint(this.breakpoint);
    return this.applyMode();
  }

  // Mirrors RouterUtils.pushUri(): the child page mode is requested for the route.
  push(route: string): string {
    this.enterRoute = route;
    this.lastRoute = route;
    this.stackSize++;
    this.navMode = NavMode.ChildPageMode;
    return this.applyMode();
  }

  // Mirrors RouterUtils.popAppRouter(): back to the previous page; returns the branch taken.
  pop(): string {
    const branch: string = popBranchOf(this.lastRoute, this.stackSize);
    if (this.stackSize > 0) {
      this.stackSize--;
    }
    if (branch !== 'pop') {
      this.navMode = NavMode.HomePageMode;
      this.applyMode();
    }
    return branch;
  }

  // Mirrors onModeChange(): applies the mode and resets it to DefaultMode.
  applyMode(): string {
    const mode: string = navigationModeOf(this.navMode, this.lastRoute, this.enterRoute, this.breakpoint,
      this.stackSize);
    const count: number = swiperDisplayCountOf(this.navMode, this.lastRoute, this.enterRoute, this.breakpoint,
      this.stackSize);
    if (mode.length > 0) {
      this.navigationMode = mode;
    }
    if (count > 0) {
      this.swiperDisplayCount = count;
    }
    this.navMode = NavMode.DefaultMode;
    return this.navigationMode;
  }
}
