/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { AbilityConstant, Configuration, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { resourceManager } from '@kit.LocalizationKit';
import { Logger } from '../common/Logger';
import { normalizeLocale } from '../common/Common';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      Logger.error('Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }
    // Extract locale, dpi, and other environment info from Context and store to AppStorage.
    this.updateConfigurationToStorage(this.context.config);
    Logger.info('Ability onCreate');
    const fileUri: string | undefined = want.uri;
    AppStorage.setOrCreate('fileUri', fileUri);
  }

  onConfigurationUpdate(newConfig: Configuration): void {
    Logger.info('onConfigurationUpdated: %{public}s', JSON.stringify(newConfig));
    this.updateConfigurationToStorage(newConfig);
  }

  /**
   * Extract locale, screenDensity (dpi), and other info from Configuration and store to AppStorage.
   *
   * locale is obtained from resourceManager.getConfigurationSync(), returning a Java/ICU-style
   * locale string like "zh_Hans_CN"; it is stored normalized as "zh-cn" (see normalizeLocale);
   * screenDensity is obtained from config.screenDensity, a ScreenDensity enum value
   * (120/160/240/320/480/640).
   */
  private updateConfigurationToStorage(config: Configuration): void {
    // locale: language[-script]-country/region (e.g. "zh_Hans_CN" from resourceManager).
    // Stored normalized (see normalizeLocale): lowercased "language[-region]" like
    // "zh-cn", which is the format the native ContentEmbed query APIs accept.
    try {
      const rmConfig: resourceManager.Configuration = this.context.resourceManager.getConfigurationSync();
      const locale: string = normalizeLocale(rmConfig.locale);
      AppStorage.setOrCreate('locale', locale);
      Logger.info('locale: %{public}s', locale);
    } catch (err) {
      Logger.error('Failed to get locale from resourceManager. Cause: %{public}s', JSON.stringify(err));
    }
    // screenDensity (dpi): screen pixel density enum value.
    const screenDensity: ConfigurationConstant.ScreenDensity | undefined = config.screenDensity;
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

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability.
    Logger.info('Ability onWindowStageCreate');
    // Expose windowStage to pages for sub-window APIs like createSubWindowWithOptions.
    AppStorage.setOrCreate<window.WindowStage>('windowStage', windowStage);
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        Logger.error('Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      Logger.info('Succeeded in loading the content.');
    });
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
