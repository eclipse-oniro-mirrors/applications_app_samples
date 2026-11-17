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
import { Logger, Trace } from 'photopickersendable';

// Module-scoped log tag so backup and restore sessions can be filtered from hilog.
const TAG: string = 'EntryBackupAbility';

/**
 * Backup extension ability.
 * The sample keeps user media inside the application sandbox, therefore backup and
 * restore only report their progress instead of moving any payload.
 */
export default class EntryBackupAbility extends BackupExtensionAbility {
  /**
   * Called by the framework when a backup session starts.
   * @returns A resolved promise because this sample has no data to export.
   */
  onBackup(): Promise<void> {
    // Trace the session so backup duration stays visible in the trace view.
    Trace.withSync('EntryBackupAbility.onBackup', () => {
      // Report success; nothing is copied because media never leaves the sandbox.
      Logger.info(TAG, 'onBackup ok');
    });
    // Resolve immediately so the framework does not wait for a payload.
    return Promise.resolve();
  }

  /**
   * Called by the framework when a restore session starts.
   * @param bundleVersion Version descriptor of the bundle that produced the backup.
   * @returns A resolved promise because no payload needs to be written back.
   */
  onRestore(bundleVersion: BundleVersion): Promise<void> {
    // Trace the session so restore duration stays visible next to the backup slice.
    Trace.withSync('EntryBackupAbility.onRestore', () => {
      // Log the bundle version descriptor, which contains no user data.
      Logger.info(TAG, 'onRestore ok ' + JSON.stringify(bundleVersion));
    });
    // Resolve immediately because there is no sandbox content to restore.
    return Promise.resolve();
  }
}
