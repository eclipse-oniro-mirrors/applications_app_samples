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

import { display } from '@kit.ArkUI';
import type { common } from '@kit.AbilityKit';
import type { Want } from '@kit.AbilityKit';
import type { window } from '@kit.ArkUI';

export class GlobalContext {
  private static TAG: string = '[GlobalContext]:';
  private static instance: GlobalContext;
  private _objects: Map<string, Object> = new Map<string, Object>();
  private mDisplay: display.Display | undefined = undefined;
  private mCutoutInfo: display.CutoutInfo | undefined = undefined;
  private cameraAbilityContext: common.Context | undefined = undefined;
  private cameraAbilityStageContext: common.AbilityStageContext | undefined = undefined;
  private cameraAbilityWant: Want | undefined = undefined;
  private cameraNewWant: Want | undefined = undefined;
  private windowStage: window.WindowStage | undefined = undefined;
  private cameraWinClass: window.Window | undefined = undefined;
  private cameraSettingContext: common.UIAbilityContext | undefined = undefined;
  private cameraWindowStageEvent: window.WindowStageEventType | undefined = undefined;
  private xComponentController: Object | undefined = undefined;
  private cameraFormParam: Object | undefined = undefined;

  private constructor() {
  }

  public static get(): GlobalContext {
    if (!Boolean(GlobalContext.instance).valueOf()) {
      GlobalContext.instance = new GlobalContext();
    }
    return GlobalContext.instance;
  }

  public getObject(value: string): Object {
    return this._objects.get(value) as Object;
  }

  public getT<T>(value: string): T {
    return this._objects.get(value) as T;
  }

  public setObject(key: string, objectClass: Object): void {
    this._objects.set(key, objectClass);
  }

  public apply(value: string): void {
    const func = this._objects.get(value);
    if (func) {
      (func as Function)();
    }
  }

  // 显示实例，在 phone设备上用 display获得的长宽与 State变量中 windowSize一致。
  public getDisplayInfo(): display.Display {
    if (!this.mDisplay) {
      this.mDisplay = display.getDefaultDisplaySync();
    }
    return this.mDisplay;
  }

  public async getCutoutInfo(): Promise<display.CutoutInfo> {
    if (!this.mCutoutInfo) {
      this.mCutoutInfo = await this.getDisplayInfo().getCutoutInfo();
    }
    return this.mCutoutInfo;
  }

  public getCameraAbilityContext(): common.Context | undefined {
    return this.cameraAbilityContext;
  }

  public setCameraAbilityContext(context: common.Context): void {
    this.cameraAbilityContext = context;
  }

  public getCameraAbilityWant(): Want | undefined {
    return this.cameraAbilityWant;
  }

  public setCameraAbilityWant(want: Want): void {
    this.cameraAbilityWant = want;
  }

  public getCameraNewWant(): Want | undefined {
    return this.cameraNewWant;
  }

  public setCameraNewWant(want: Want): void {
    this.cameraNewWant = want;
  }

  public getWindowStage(): window.WindowStage | undefined {
    return this.windowStage;
  }

  public setWindowStage(stage: window.WindowStage): void {
    this.windowStage = stage;
  }

  public getCameraAbilityStageContext(): common.AbilityStageContext | undefined {
    return this.cameraAbilityStageContext;
  }

  public setCameraAbilityStageContext(context: common.AbilityStageContext): void {
    this.cameraAbilityStageContext = context;
  }

  public getCameraWinClass(): window.Window | undefined {
    return this.cameraWinClass;
  }

  public setCameraWinClass(win: window.Window): void {
    this.cameraWinClass = win;
  }

  public getCameraSettingContext(): common.UIAbilityContext | undefined {
    return this.cameraSettingContext;
  }

  public setCameraSettingContext(context: common.UIAbilityContext): void {
    this.cameraSettingContext = context;
  }

  public getCameraWindowStageEvent(): window.WindowStageEventType | undefined {
    return this.cameraWindowStageEvent;
  }

  public setCameraWindowStageEvent(event: window.WindowStageEventType): void {
    this.cameraWindowStageEvent = event;
  }

  public getXComponentController(): Object | undefined {
    return this.xComponentController;
  }

  public setXComponentController(controller: Object): void {
    this.xComponentController = controller;
  }

  public getCameraFormParam(): Object | undefined {
    return this.cameraFormParam;
  }

  public setCameraFormParam(cameraParam: Object): void {
    this.cameraFormParam = cameraParam;
  }
}
