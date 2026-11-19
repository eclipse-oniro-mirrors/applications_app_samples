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

import { AbilityConstant, ConfigurationConstant, Configuration, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { resourceManager } from '@kit.LocalizationKit';
import { Logger } from '../common/Logger';

export default class EntryAbility extends UIAbility {
  private windowStage?: window.WindowStage;
  private id: string = '';
  private uri: string = '';
  private isContentEmbed: boolean = false;
  private originalFilePath: string = '';

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      Logger.error('Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }
    // Read locale and dpi from Context, store to AppStorage.
    this.updateConfigurationToStorage(this.context.config);
    Logger.info('Ability onCreate');
    this.uri = (want.uri as string) ?? '';

    if (want.parameters) {
      this.isContentEmbed = (want.parameters['isContentEmbed'] as boolean) ?? false;
      this.id = (want.parameters.id as string) ?? '';
      // Original file path of a linking document, provided by server NativeOnDoEdit
      // via GetNativeFilePath and passed through Want. UIAbility must write the
      // edited result back to this file on save; otherwise only the
      // temp_{ole_id}.aaa cache is updated and the client sees stale content.
      // Empty for embedded documents.
      this.originalFilePath = (want.parameters['originalFilePath'] as string) ?? '';
    }
    Logger.info('EntryAbility want id:%{public}s isContentEmbed:%{public}s originalFilePath:%{private}s',
      this.id, String(this.isContentEmbed), this.originalFilePath);
  }

  /**
   * Extract locale, screenDensity (dpi) etc. from Configuration and store to AppStorage.
   * locale comes from resourceManager.getConfigurationSync() as a full region string
   * like "zh-Hans-CN"; screenDensity is a ScreenDensity enum (120/160/240/320/480/640).
   */
  private updateConfigurationToStorage(config: Configuration): void {
    // locale: language-script-region (e.g. "zh-Hans-CN", "en-US"), lowercased to match native API.
    try {
      const rmConfig: resourceManager.Configuration = this.context.resourceManager.getConfigurationSync();
      const locale: string = String(rmConfig.locale).toLowerCase();
      AppStorage.setOrCreate('locale', locale);
      Logger.info('locale: %{public}s', locale);
    } catch (err) {
      Logger.error('Failed to get locale from resourceManager. Cause: %{public}s', JSON.stringify(err));
    }
    // screenDensity (dpi): screen pixel density enum value.
    const screenDensity: number | undefined = config.screenDensity;
    AppStorage.setOrCreate('screenDensity', screenDensity);
    Logger.info('screenDensity: %{public}d', screenDensity);
    // Other environment variables.
    AppStorage.setOrCreate('language', config.language);
    AppStorage.setOrCreate('colorMode', config.colorMode);
    AppStorage.setOrCreate('direction', config.direction);
    AppStorage.setOrCreate('fontSizeScale', config.fontSizeScale);
  }

  onDestroy(): void {
    Logger.info('Ability onDestroy');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('Ability onNewWant');
    this.uri = (want.uri as string) ?? '';
    if (want.parameters) {
      this.isContentEmbed = (want.parameters['isContentEmbed'] as boolean) ?? false;
      this.id = (want.parameters.id as string) ?? '';
      this.originalFilePath = (want.parameters['originalFilePath'] as string) ?? '';
    }
    if (this.windowStage) {
      this.loadPage(this.windowStage);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability.
    Logger.info('Ability onWindowStageCreate');
    this.windowStage = windowStage;
    this.loadPage(windowStage);
  }

  loadPage(windowStage: window.WindowStage): void {
    let storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('fileUri', this.uri);
    storage.setOrCreate('ole_id', this.id);
    storage.setOrCreate('isContentEmbed', this.isContentEmbed);
    storage.setOrCreate('originalFilePath', this.originalFilePath);
    windowStage.loadContent('pages/Index', storage);
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources.
    Logger.info('Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground.
    Logger.info('Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background.
    Logger.info('Ability onBackground');
  }
}