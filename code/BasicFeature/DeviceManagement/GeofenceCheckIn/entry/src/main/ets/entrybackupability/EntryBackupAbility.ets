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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { BackupExtensionAbility, BundleVersion } from '@kit.CoreFileKit';
import { Logger } from 'library';

// Log domain used by the hilog output of this extension.
const DOMAIN = 0x0000;

/**
 * Backup extension ability that participates in system backup and restore.
 */
export default class EntryBackupAbility extends BackupExtensionAbility {
  /**
   * Called when the system performs a backup of the application data.
   */
  async onBackup() {
    Logger.info('EntryBackupAbility#onBackup: backup triggered');
    // Keep the original hilog output expected by the backup framework.
    hilog.info(DOMAIN, 'testTag', 'onBackup ok');
    // Yield immediately because no extra data handling is required.
    await Promise.resolve();
  }

  /**
   * Called when the system restores application data from a backup.
   *
   * @param bundleVersion - Version information of the restored bundle.
   */
  async onRestore(bundleVersion: BundleVersion) {
    Logger.info('EntryBackupAbility#onRestore: restore triggered');
    // Keep the original hilog output including the restored bundle version.
    hilog.info(DOMAIN, 'testTag', 'onRestore ok %{public}s', JSON.stringify(bundleVersion));
    // Yield immediately because no extra data handling is required.
    await Promise.resolve();
  }
}