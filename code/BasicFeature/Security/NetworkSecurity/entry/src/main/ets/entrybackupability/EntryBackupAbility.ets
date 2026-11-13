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

// Log domain used by the backup extension hilog output.
const DOMAIN: number = 0x0000;

/**
 * Backup extension ability that logs the system backup and restore callbacks of the sample.
 */
export default class EntryBackupAbility extends BackupExtensionAbility {
  /**
   * Called by the system when application data is backed up.
   * @returns a promise that resolves when the backup step finishes.
   */
  async onBackup(): Promise<void> {
    Logger.enter('[EntryBackupAbility#onBackup]');
    // Report the backup step through hilog for the system backup flow.
    hilog.info(DOMAIN, 'testTag', 'onBackup ok');
    // Yield once so the async method always returns a resolved promise.
    await Promise.resolve();
    Logger.exit('[EntryBackupAbility#onBackup]');
  }

  /**
   * Called by the system when application data is restored from a backup.
   * @param bundleVersion version information of the backup bundle.
   * @returns a promise that resolves when the restore step finishes.
   */
  async onRestore(bundleVersion: BundleVersion): Promise<void> {
    Logger.enter('[EntryBackupAbility#onRestore]');
    // Print the restored bundle version for troubleshooting.
    hilog.info(DOMAIN, 'testTag', 'onRestore ok %{public}s', JSON.stringify(bundleVersion));
    // Yield once so the async method always returns a resolved promise.
    await Promise.resolve();
    Logger.exit('[EntryBackupAbility#onRestore]');
  }
}
