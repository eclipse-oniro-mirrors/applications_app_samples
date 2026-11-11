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

import { ConfigurationConstant, UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { setTextResolver } from '../autostart/text/LocalizedText';
import { autoStartupService } from '../autostart/AutoStartupService';
import { PreferencesHistoryStorage } from '../autostart/AutoStartupRuntime';
import { capabilityDiagnostic } from '../autostart/diagnostics/DiagnosticRuntime';
import { startupArchiveRepository } from '../autostart/archive/StartupArchive';
import { StartupArchiveRdbStorage } from '../autostart/archive/StartupArchiveRdbStorage';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartupAuto]';
let archiveLifecycle: Promise<void> = Promise.resolve();

export default class EntryAbility extends UIAbility {
  private archiveGeneration: number = 0;

  onWindowStageCreate(windowStage: window.WindowStage): void {
    setTextResolver((key: string): string => this.context.resourceManager.getStringByNameSync(key));
    const archiveGeneration = ++this.archiveGeneration;
    autoStartupService.attachRecordSink(startupArchiveRepository);
    archiveLifecycle = archiveLifecycle.then(async (): Promise<void> => {
      if (archiveGeneration !== this.archiveGeneration) { return; }
      startupArchiveRepository.setConnector((): Promise<StartupArchiveRdbStorage> =>
        StartupArchiveRdbStorage.open(this.context));
      const attached = await startupArchiveRepository.reload();
      if (!attached || archiveGeneration !== this.archiveGeneration) { return; }
      // Queries can finish while RDB opens. Backfill only actual still-live evidence,
      // and only after the previously persisted opt-in has been read successfully.
      const live = autoStartupService.records();
      if (startupArchiveRepository.snapshot().automatic && live.length > 0) {
        await startupArchiveRepository.save(live);
      }
    }).catch((): void => {
      hilog.warn(DOMAIN, TAG, 'Private archive unavailable; live queries remain usable');
    });
    try {
      autoStartupService.attachHistory(new PreferencesHistoryStorage(this.context));
      autoStartupService.attachRevisit(new PreferencesHistoryStorage(this.context, 'autostart_revisit_v1'));
    } catch (_) {
      hilog.warn(DOMAIN, TAG, 'Private storage unavailable; queries remain usable');
    }
    try {
      this.context.getApplicationContext()
        .setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (error) {
      const cause = error as BusinessError;
      hilog.warn(DOMAIN, TAG, 'Set color mode failed: %{public}d %{public}s',
        cause.code, cause.message);
    }
    windowStage.loadContent('pages/Index', (error: BusinessError) => {
      if (error.code) {
        hilog.error(DOMAIN, TAG, 'Load page failed: %{public}d %{public}s',
          error.code, error.message);
      }
    });
  }

  onForeground(): void {
    autoStartupService.onForeground();
  }

  onBackground(): void {
    autoStartupService.onBackground();
  }

  onDestroy(): void {
    this.archiveGeneration++;
    autoStartupService.attachRecordSink(undefined);
    autoStartupService.dispose();
    capabilityDiagnostic.dispose();
    archiveLifecycle = archiveLifecycle.then((): Promise<void> => startupArchiveRepository.close()).catch((): void => {
      hilog.warn(DOMAIN, TAG, 'Private archive close failed');
    });
  }
}
