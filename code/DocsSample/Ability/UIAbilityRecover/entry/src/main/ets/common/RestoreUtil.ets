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

import { AbilityConstant, Want, common } from '@kit.AbilityKit';
import { deviceInfo } from '@kit.BasicServicesKit';
import { fileIo as fs } from '@kit.CoreFileKit';

const BLOB_FILE_PREFIX = 'restore_blob_';
const BLOB_EXPIRE_MS = 7 * 24 * 60 * 60 * 1000; // 与系统备份数据 7 天过期时间对齐

// [Start restore_launch]
/**
 * 三信号合判是否恢复启动：系统键为 true（全版本可靠）/ want.parameters 中存在
 * 恢复键（仅恢复启动时由系统带回）/ launchReason 为 APP_RECOVERY（仅 API 26+
 * 可信，低版本可能误标，不能单独采信）。
 * restoreKeys：onSaveState 写入 want.parameters 的全部键名。
 */
export function isRestoreLaunch(want: Want, launchParam: AbilityConstant.LaunchParam,
  restoreKeys: string[]): boolean {
  const sysFlag = want?.parameters?.['ohos.ability.params.abilityRecoveryRestart'];
  const bySysKey: boolean = sysFlag === true || sysFlag === 'true';
  const byRestoreKey: boolean = restoreKeys.some(k => want?.parameters?.[k] !== undefined);
  const byReason: boolean = launchParam?.launchReason === AbilityConstant.LaunchReason.APP_RECOVERY
    && deviceInfo.sdkApiVersion >= 26;
  return bySysKey || byRestoreKey || byReason;
}
// [End restore_launch]

// [Start blob_save]
/** 超大数据落盘：数据本体写入沙箱文件，返回文件名，want.parameters 只保存文件名。 */
export function saveBlob(context: common.Context, key: string, data: string): string {
  const fileName = BLOB_FILE_PREFIX + key + '.txt';
  const file = context.filesDir + '/' + fileName;
  const f = fs.openSync(file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
  try {
    fs.writeSync(f.fd, data);
  } finally {
    fs.closeSync(f);
  }
  return fileName;
}
// [End blob_save]

// [Start blob_load]
/** 按文件名读回落盘数据；读不到（如设备重启后不还原）返回 null，调用方按空数据降级。 */
export function loadBlob(context: common.Context, fileName: string): string | null {
  try {
    const file = context.filesDir + '/' + fileName;
    if (!fs.accessSync(file)) {
      return null;
    }
    return fs.readTextSync(file);
  } catch (e) {
    return null;
  }
}
// [End blob_load]

/** 非恢复启动时清理超过 7 天的历史落盘文件。 */
export function cleanupBlob(context: common.Context): void {
  try {
    const names = fs.listFileSync(context.filesDir);
    const now = Date.now();
    for (let i = 0; i < names.length; i++) {
      const name = names[i];
      if (name.startsWith(BLOB_FILE_PREFIX)) {
        const file = context.filesDir + '/' + name;
        const stat = fs.statSync(file);
        if (now - stat.mtime * 1000 > BLOB_EXPIRE_MS) {
          fs.unlinkSync(file);
        }
      }
    }
  } catch (e) {
    // 清理失败不影响启动
  }
}
