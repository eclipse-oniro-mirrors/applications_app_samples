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
import { Logger } from '../utils/Logger';

export default class EntryBackupAbility extends BackupExtensionAbility {
  async onBackup(): Promise<void> {
    Logger.info('Backup', 'backup', 'onBackup 开始');
    await Promise.resolve();
    Logger.info('Backup', 'backup', 'onBackup 完成');
  }

  async onRestore(bundleVersion: BundleVersion): Promise<void> {
    Logger.info('Backup', 'restore', `onRestore 开始：${JSON.stringify(bundleVersion)}`);
    await Promise.resolve();
    Logger.info('Backup', 'restore', 'onRestore 完成');
  }
}
