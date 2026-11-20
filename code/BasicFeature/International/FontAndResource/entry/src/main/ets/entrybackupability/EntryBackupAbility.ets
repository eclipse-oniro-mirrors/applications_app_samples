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

// Import hilog directly because this extension may run outside the UI ability context.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the backup extension base class and the bundle version type.
import { BackupExtensionAbility, BundleVersion } from '@kit.CoreFileKit';

// The hilog domain used by the backup extension log lines.
const DOMAIN: number = 0x0000;
// The hilog tag that marks every backup extension log line.
const TAG: string = '[Sample_FontAndResource][Backup]';
// The hilog format string printing the message as a public string.
const FORMAT: string = '%{public}s';

// The backup extension that participates in system backup and restore flows.
export default class EntryBackupAbility extends BackupExtensionAbility {
  // Called when the system starts a backup of this application.
  async onBackup() {
    // Log the backup start for support diagnostics.
    hilog.info(DOMAIN, TAG, FORMAT, 'onBackup ok');
    // Yield once so the async contract is honored.
    await Promise.resolve();
  }

  // Called when the system restores this application from a backup.
  async onRestore(bundleVersion: BundleVersion) {
    // Log the restore together with the source bundle version.
    hilog.info(DOMAIN, TAG, FORMAT, `onRestore ok, version=${JSON.stringify(bundleVersion)}`);
    // Yield once so the async contract is honored.
    await Promise.resolve();
  }
}
