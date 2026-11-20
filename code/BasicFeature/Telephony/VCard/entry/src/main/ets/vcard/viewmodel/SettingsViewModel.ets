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

import { bundleManager, common } from '@kit.AbilityKit';
import { BusinessError, deviceInfo } from '@kit.BasicServicesKit';
import { Logger, PermissionState, VCardConstants, VCardManager, VCardSettings } from 'library';

/**
 * State orchestration of the settings page. Every change is persisted
 * immediately so the toolbox picks the new defaults up on its next visit.
 */
@ObservedV2
export class SettingsViewModel {
  @Trace public settings: VCardSettings = new VCardSettings();
  @Trace public permissionGranted: boolean = false;
  @Trace public permissionStates: PermissionState[] = [];
  @Trace public syscapOk: boolean = false;
  @Trace public apiLevel: number = 0;
  @Trace public bundleName: string = '';
  @Trace public ready: boolean = false;

  private context: common.Context | null = null;

  init(context: common.Context): void {
    this.context = context;
    const level: number = deviceInfo.sdkApiVersion;
    this.apiLevel = level > 0 ? level : 24;
    this.bundleName = this.readBundleName();
    this.syscapOk = canIUse(VCardConstants.VCARD_SYSCAP);
    this.load();
  }

  async load(): Promise<void> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return;
    }
    try {
      this.settings = await VCardManager.loadSettings(context);
      this.permissionStates = await VCardManager.getPermissionStates(context);
      this.permissionGranted = this.allGranted(this.permissionStates);
      this.ready = true;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[SettingsViewModel] load failed code=' + err.code + ' message=' + err.message);
    }
  }

  async requestPermission(): Promise<boolean> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return false;
    }
    const granted: boolean = await VCardManager.requestPermissions(context);
    await this.load();
    return granted && this.permissionGranted;
  }

  async updateVersion(value: number): Promise<boolean> {
    const next: VCardSettings = this.cloneSettings();
    next.defaultVersion = value;
    return await this.persist(next);
  }

  async updateCharset(value: string): Promise<boolean> {
    const next: VCardSettings = this.cloneSettings();
    next.defaultCharset = value;
    return await this.persist(next);
  }

  async updateAutoJump(value: boolean): Promise<boolean> {
    const next: VCardSettings = this.cloneSettings();
    next.autoJumpToContacts = value;
    return await this.persist(next);
  }

  async updateHistoryLimit(value: number): Promise<boolean> {
    const next: VCardSettings = this.cloneSettings();
    next.historyLimit = value;
    return await this.persist(next);
  }

  async clean(): Promise<number> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return 0;
    }
    return await VCardManager.cleanSandbox(context);
  }

  private async persist(next: VCardSettings): Promise<boolean> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return false;
    }
    try {
      await VCardManager.saveSettings(context, next);
      this.settings = next;
      return true;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[SettingsViewModel] save failed code=' + err.code + ' message=' + err.message);
      return false;
    }
  }

  private cloneSettings(): VCardSettings {
    const copy: VCardSettings = new VCardSettings();
    copy.defaultVersion = this.settings.defaultVersion;
    copy.defaultCharset = this.settings.defaultCharset;
    copy.autoJumpToContacts = this.settings.autoJumpToContacts;
    copy.historyLimit = this.settings.historyLimit;
    return copy;
  }

  private readBundleName(): string {
    try {
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
      return info.name;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[SettingsViewModel] getBundleInfoForSelfSync failed code=' + err.code);
      return '';
    }
  }

  private allGranted(states: PermissionState[]): boolean {
    if (states.length === 0) {
      return false;
    }
    for (const state of states) {
      if (!state.granted) {
        return false;
      }
    }
    return true;
  }
}
