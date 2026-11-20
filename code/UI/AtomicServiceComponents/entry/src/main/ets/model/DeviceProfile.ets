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
 
export enum DeviceForm {
  DEFAULT = 'default',
  PHONE = 'phone',
  TABLET = 'tablet',
  TWO_IN_ONE = '2in1'
}

export enum Breakpoint {
  SM = 'sm',
  MD = 'md',
  LG = 'lg'
}

export const BREAKPOINT_MD_VP: number = 600;
export const BREAKPOINT_LG_VP: number = 840;

export class DisplaySnapshot {
  public widthVp: number;
  public heightVp: number;
  public density: number;

  constructor(widthVp: number, heightVp: number, density: number) {
    this.widthVp = widthVp > 0 ? widthVp : 360;
    this.heightVp = heightVp > 0 ? heightVp : 780;
    this.density = density > 0 ? density : 1;
  }
}

export class LayoutProfile {
  public form: DeviceForm;
  public breakpoint: Breakpoint;
  public columns: number;
  public widthVp: number;
  public heightVp: number;
  public density: number;
  public pageMaxWidth: number;
  public webHeight: number;
  public tabsHeight: number;
  public navSplitDefault: boolean;
  public pickerSupported: boolean;

  constructor(form: DeviceForm, breakpoint: Breakpoint, columns: number, snapshot: DisplaySnapshot,
              pageMaxWidth: number, webHeight: number, tabsHeight: number,
              navSplitDefault: boolean, pickerSupported: boolean) {
    this.form = form;
    this.breakpoint = breakpoint;
    this.columns = columns;
    this.widthVp = snapshot.widthVp;
    this.heightVp = snapshot.heightVp;
    this.density = snapshot.density;
    this.pageMaxWidth = pageMaxWidth;
    this.webHeight = webHeight;
    this.tabsHeight = tabsHeight;
    this.navSplitDefault = navSplitDefault;
    this.pickerSupported = pickerSupported;
  }

  describe(): string {
    return `${this.form}/${this.breakpoint} ${this.widthVp.toFixed(0)}x${this.heightVp.toFixed(0)}vp ` +
      `x${this.density} ${this.columns} columns splitDefault:${this.navSplitDefault ? 'on' : 'off'} ` +
      `picker:${this.pickerSupported ? 'supported' : 'unavailable'}`;
  }
}

export function resolveDeviceForm(deviceType: string): DeviceForm {
  switch (deviceType) {
    case 'phone':
      return DeviceForm.PHONE;
    case 'tablet':
      return DeviceForm.TABLET;
    case '2in1':
      return DeviceForm.TWO_IN_ONE;
    default:
      return DeviceForm.DEFAULT;
  }
}

export function resolveBreakpoint(widthVp: number): Breakpoint {
  if (widthVp >= BREAKPOINT_LG_VP) {
    return Breakpoint.LG;
  }
  if (widthVp >= BREAKPOINT_MD_VP) {
    return Breakpoint.MD;
  }
  return Breakpoint.SM;
}

export function pxToVp(px: number, density: number): number {
  const safeDensity = density > 0 ? density : 1;
  return Math.round(px / safeDensity * 10) / 10;
}

export function resolveColumns(form: DeviceForm, breakpoint: Breakpoint): number {
  switch (form) {
    case DeviceForm.PHONE:
      return 1;
    case DeviceForm.TABLET:
      return breakpoint === Breakpoint.SM ? 1 : 2;
    case DeviceForm.TWO_IN_ONE:
      return breakpoint === Breakpoint.LG ? 3 : 2;
    default:
      return breakpoint === Breakpoint.SM ? 1 : 2;
  }
}

export function resolvePageMaxWidth(form: DeviceForm): number {
  switch (form) {
    case DeviceForm.PHONE:
      return 640;
    case DeviceForm.TABLET:
      return 840;
    case DeviceForm.TWO_IN_ONE:
      return 1200;
    default:
      return 960;
  }
}

function clamp(value: number, min: number, max: number): number {
  return Math.max(min, Math.min(max, value));
}

export function buildLayoutProfile(form: DeviceForm, snapshot: DisplaySnapshot): LayoutProfile {
  const breakpoint = resolveBreakpoint(snapshot.widthVp);
  const columns = resolveColumns(form, breakpoint);
  const pageMaxWidth = resolvePageMaxWidth(form);
  const webHeight = clamp(Math.round(snapshot.heightVp * 0.55), 320, 640);
  const tabsHeight = clamp(Math.round(snapshot.heightVp * 0.5), 300, 520);
  const navSplitDefault = (form === DeviceForm.TABLET || form === DeviceForm.TWO_IN_ONE) &&
    breakpoint !== Breakpoint.SM;
  const pickerSupported = form === DeviceForm.PHONE || form === DeviceForm.TABLET ||
    form === DeviceForm.TWO_IN_ONE;
  return new LayoutProfile(form, breakpoint, columns, snapshot, pageMaxWidth, webHeight, tabsHeight,
    navSplitDefault, pickerSupported);
}

export const DEFAULT_LAYOUT_PROFILE: LayoutProfile =
  buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 780, 1));
