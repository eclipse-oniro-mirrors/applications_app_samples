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
 * 判断本次启动是否为恢复启动（应用被系统回收后，用户点击桌面图标重新拉起）。
 * 满足以下任一信号即为恢复启动：
 * 1. 系统键 ohos.ability.params.abilityRecoveryRestart 为 true（全版本可靠）；
 * 2. want.parameters 中存在本应用保存的恢复键（恢复键只在恢复启动时由系统合并回来）；
 * 3. launchReason 为 APP_RECOVERY 且设备 API 版本不低于 26（低版本设备重启后的启动
 *    也可能被误标为该值，不能单独采信）。
 * restoreKeys：本应用在 onSaveState 中写入 want.parameters 的全部键名。
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
/**
 * 超大数据（如长草稿）塞不进 want.parameters 时的落盘方法：
 * 数据本体写入应用沙箱文件，返回文件名。want.parameters 中只保存这个文件名。
 */
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
/**
 * 按文件名读回超大数据。文件不存在或读取失败（如设备重启后备份不还原）返回 null，
 * 调用方按空数据降级处理，不能白屏。
 */
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

/** 非恢复启动时清理历史落盘文件，防止残留堆积（超过 7 天未使用即删除）。 */
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
