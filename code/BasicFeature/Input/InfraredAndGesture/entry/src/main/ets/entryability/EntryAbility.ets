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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError, deviceInfo } from '@kit.BasicServicesKit';
import { AppLogger, StringResources } from 'common';
import { IrCapabilityProbe, IrLibraryRepository } from 'ircore';
import {
  AppDatabase,
  ConfigPackageService,
  DefaultConfigSeeder,
  RemoteTemplateSeeder
} from 'room';

const SCOPE: string = 'EntryAbility';
const MAIN_PAGE: string = 'pages/Index';
const TABLET_DEVICE: string = 'tablet';

export default class EntryAbility extends UIAbility {
  /** Ability onCreate: initialize string resources before any UI is loaded. */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // Initialize localized string resources with the application resource manager.
    StringResources.init(this.context.resourceManager);
    AppLogger.info(SCOPE, 'Ability onCreate');
  }

  /** Ability onDestroy: final lifecycle callback before the ability is destroyed. */
  onDestroy(): void {
    AppLogger.info(SCOPE, 'Ability onDestroy');
  }

  /** Ability onWindowStageCreate: main window created, load the index page. */
  onWindowStageCreate(windowStage: window.WindowStage): void {
    AppLogger.info(SCOPE, 'Ability onWindowStageCreate');
    // Bootstrap async dependencies first, then load the main page content.
    this.startApp(windowStage);
  }

  /** Ability onWindowStageDestroy: main window is about to be destroyed. */
  onWindowStageDestroy(): void {
    AppLogger.info(SCOPE, 'Ability onWindowStageDestroy');
  }

  /** Ability onForeground: the ability moves to the foreground and becomes interactive. */
  onForeground(): void {
    AppLogger.info(SCOPE, 'Ability onForeground');
  }

  /** Ability onBackground: the ability moves to the background and loses the focus. */
  onBackground(): void {
    AppLogger.info(SCOPE, 'Ability onBackground');
  }

  /** Bootstrap application services and then load the index page into the window stage. */
  private async startApp(windowStage: window.WindowStage): Promise<void> {
    // Run all one-time initialization before showing any UI.
    await this.bootstrap();
    windowStage.loadContent(MAIN_PAGE, (err: BusinessError) => {
      if (err.code) {
        // Loading failure is logged only; the window stays empty instead of crashing.
        AppLogger.error(SCOPE, `load index page failed: ${JSON.stringify(err)}`);
        return;
      }
      AppLogger.info(SCOPE, 'index page loaded');
    });
  }

  /** Startup wiring: failures are logged only and never block app start. */
  private async bootstrap(): Promise<void> {
    await this.guard('init database', async (): Promise<void> => {
      await AppDatabase.init(this.context);
    });
    await this.guard('seed default config', async (): Promise<void> => {
      await DefaultConfigSeeder.seedIfEmpty();
    });
    await this.guard('localize demo names', async (): Promise<void> => {
      await DefaultConfigSeeder.refreshDemoNames();
    });
    await this.guard('seed remote templates', async (): Promise<void> => {
      await RemoteTemplateSeeder.seedDefaults();
    });
    await this.guard('init ir library', async (): Promise<void> => {
      IrLibraryRepository.init(this.context);
    });
    await this.guard('init config package service', async (): Promise<void> => {
      ConfigPackageService.setContext(this.context);
    });
    if (EntryAbility.isOrchestrationDevice()) {
      return;
    }
    await this.guard('probe infrared capability', async (): Promise<void> => {
      await IrCapabilityProbe.probe();
    });
  }

  /**
   * True when running on a tablet, which hosts the orchestration UI only.
   * On non-tablet devices the infrared capability probe is executed additionally.
   */
  private static isOrchestrationDevice(): boolean {
    return deviceInfo.deviceType === TABLET_DEVICE;
  }

  /** Run an async action and swallow/log any error so startup never fails hard. */
  private async guard(name: string, action: () => Promise<void>): Promise<void> {
    try {
      await action();
    } catch (error) {
      // Normalize unknown throwables to a stable message before logging.
      const detail: string = error instanceof Error ? error.message : 'unknown error';
      AppLogger.error(SCOPE, `${name} failed: ${detail}`);
    }
  }
}
