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

import { BackupExtensionAbility, BundleVersion } from '@kit.CoreFileKit';
import { AppLogger } from 'common';

const SCOPE: string = 'EntryBackupAbility';

/**
 * Backup extension ability for the MeetingScene sample.
 * Handles application data backup and restore lifecycle callbacks.
 */
export default class EntryBackupAbility extends BackupExtensionAbility {
  /**
   * Called when the system backs up application data.
   * Currently no custom backup data is required, so this method only logs.
   */
  async onBackup(): Promise<void> {
    AppLogger.info(SCOPE, 'onBackup start');
    try {
      // Yield to the event loop to keep the backup callback asynchronous as required.
      await Promise.resolve();
      AppLogger.info(SCOPE, 'onBackup ok');
    } catch (error) {
      // Log backup failures but never throw, so the system backup flow is not blocked.
      const detail: string = error instanceof Error ? error.message : 'unknown error';
      AppLogger.error(SCOPE, `onBackup failed: ${detail}`);
    }
  }

  /**
   * Called when the system restores application data from a backup.
   *
   * @param bundleVersion - version info of the bundle being restored.
   */
  async onRestore(bundleVersion: BundleVersion): Promise<void> {
    AppLogger.info(SCOPE, `onRestore start, bundleVersion: ${JSON.stringify(bundleVersion)}`);
    try {
      // Yield to the event loop to keep the restore callback asynchronous as required.
      await Promise.resolve();
      AppLogger.info(SCOPE, 'onRestore ok');
    } catch (error) {
      // Log restore failures but never throw, so the system restore flow is not blocked.
      const detail: string = error instanceof Error ? error.message : 'unknown error';
      AppLogger.error(SCOPE, `onRestore failed: ${detail}`);
    }
  }
}
