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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { cleanupBlob, isRestoreLaunch, loadBlob, saveBlob } from '../common/RestoreUtil';

const DOMAIN = 0x0010; // 0x0000 为系统保留域值，应用日志使用非零值
const TAG = 'RestoreAbility';

// 数据通道键：页面平时把状态发布到 AppStorage，onSaveState 同步读取
const KEY_READER_STATE = 'reader.state';
const KEY_READER_DRAFT = 'reader.draft';
const KEY_NAV_SNAPSHOT = 'reader.navSnapshot';
// 恢复键：onSaveState 写入 want.parameters 的键名，恢复启动时由系统带回
// （键名自定义，保存与读取两侧一致即可）
const KEY_RESTORE_READER = 'restore.reader';
const KEY_RESTORE_DRAFT = 'restore.reader.draft';
const KEY_RESTORE_DRAFT_FILE = 'restore.reader.draftFile';
const KEY_RESTORE_NAV_PATH = 'restore.navPath';

export default class RestoreAbility extends UIAbility {
  // [Start restore_on_create]
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // 开启备份恢复总开关：不开启则系统不会保存/恢复任何数据
    this.context.setRestoreEnabled(true);

    // 判断是否恢复启动（restoreKeys 传入本应用的全部恢复键）
    const restoreKeys: string[] = [KEY_RESTORE_READER, KEY_RESTORE_DRAFT,
      KEY_RESTORE_DRAFT_FILE, KEY_RESTORE_NAV_PATH];
    if (isRestoreLaunch(want, launchParam, restoreKeys)) {
      // 系统在恢复启动时把上次保存的数据放入 want.parameters 带回（仅此一次）；
      // 页面尚未创建，先经 AppStorage 中转，页面挂载后取用
      const reader = want?.parameters?.[KEY_RESTORE_READER] as Record<string, Object> | undefined;
      if (reader !== undefined) {
        AppStorage.setOrCreate(KEY_RESTORE_READER, reader);
      }
      // 短草稿随数据带回；超长草稿按文件名从沙箱读回（读不到降级为空）
      const draftInline = want?.parameters?.[KEY_RESTORE_DRAFT] as string | undefined;
      if (draftInline !== undefined) {
        AppStorage.setOrCreate(KEY_RESTORE_DRAFT, draftInline);
      }
      const draftFile = want?.parameters?.[KEY_RESTORE_DRAFT_FILE] as string | undefined;
      if (draftFile !== undefined) {
        AppStorage.setOrCreate(KEY_RESTORE_DRAFT, loadBlob(this.context, draftFile) ?? '');
      }
      // 深栈补推用的路径快照
      const navPath = want?.parameters?.[KEY_RESTORE_NAV_PATH] as string | undefined;
      if (navPath !== undefined) {
        AppStorage.setOrCreate(KEY_RESTORE_NAV_PATH, navPath);
      }
    } else {
      // 正常冷启：清理历史落盘文件
      cleanupBlob(this.context);
    }
  }
  // [End restore_on_create]

  // [Start restore_on_save_state]
  onSaveState(reason: AbilityConstant.StateType,
    wantParam: Record<string, Object>): AbilityConstant.OnSaveResult {
    // 只做同步读取：页面平时已把状态发布到 AppStorage（见 ReaderPage 的 reportState）
    const st = AppStorage.get<Record<string, Object>>(KEY_READER_STATE);
    if (st !== undefined) {
      wantParam[KEY_RESTORE_READER] = st;
    }
    // 草稿超过分流阈值（示例取 2048 字节，可按业务调整）走落盘引用，want.parameters 只放文件名
    const draft = AppStorage.get<string>(KEY_READER_DRAFT) ?? '';
    if (draft.length > 2048) {
      wantParam[KEY_RESTORE_DRAFT_FILE] = saveBlob(this.context, 'reader', draft);
    } else if (draft !== '') {
      wantParam[KEY_RESTORE_DRAFT] = draft;
    }
    // 深栈补推用的 Navigation 路径快照
    const navSnapshot = AppStorage.get<string>(KEY_NAV_SNAPSHOT);
    if (navSnapshot !== undefined) {
      wantParam[KEY_RESTORE_NAV_PATH] = navSnapshot;
    }
    // 必须返回 ALL_AGREE，否则数据不落盘
    return AbilityConstant.OnSaveResult.ALL_AGREE;
  }
  // [End restore_on_save_state]

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // 恢复启动时系统会自动恢复 Navigation 页面栈，正常加载首页即可；
    // 若工程入口是广告页/闪屏页，恢复启动时应绕过直接加载内容页
    // （按 isRestoreLaunch 的结果选择加载内容页还是广告页）。
    windowStage.loadContent('restore/RestoreIndex', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content.');
    });
  }
}
