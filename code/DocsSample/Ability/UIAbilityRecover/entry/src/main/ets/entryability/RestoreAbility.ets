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
import { RestoreJudge } from '../common/RestoreJudge';
import { BlobRef, RestoreBlob } from '../common/RestoreBlob';
import { ReaderState } from '../restore/ReaderPage';

const DOMAIN = 0x0000;
const TAG = 'RestoreAbility';

// 页面数据通道键（页面平时发布到 AppStorage，onSaveState 同步读取）
const KEY_READER_STATE = 'reader.state';
const KEY_NAV_SNAPSHOT = 'reader.navSnapshot';
// want.parameters 恢复键（onSaveState 写入，恢复启动时由系统合并回来）
const KEY_RESTORE_READER = 'restore.reader';
const KEY_RESTORE_READER_BLOB = 'restore.reader.blob';
const KEY_RESTORE_NAV_PATH = 'restore.navPath';

export default class RestoreAbility extends UIAbility {
  // [Start restore_on_create]
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // 1. 开启备份恢复：必须在应用初始化阶段最先调用
    this.context.setRestoreEnabled(true);

    // 2. 恢复判定（版本隔离）：不能单独依赖 launchReason
    RestoreJudge.init(want, launchParam, [KEY_RESTORE_READER, KEY_RESTORE_NAV_PATH]);

    if (RestoreJudge.isRestoring()) {
      // 3. 恢复数据经 AppStorage 中转给页面（数据先就绪，页面挂载后一次性消费）
      const reader = want?.parameters?.[KEY_RESTORE_READER] as ReaderState | undefined;
      if (reader !== undefined) {
        AppStorage.setOrCreate(KEY_RESTORE_READER, reader);
      }
      // 超限草稿走落盘引用（方案 D）：按引用读回，失效则降级为空
      const blobRef = want?.parameters?.[KEY_RESTORE_READER_BLOB] as BlobRef | undefined;
      if (blobRef !== undefined) {
        const draft = RestoreBlob.load(this.context, blobRef);
        AppStorage.setOrCreate('restore.reader.draft', draft ?? '');
      }
      // 深栈补推路径快照
      const navPath = want?.parameters?.[KEY_RESTORE_NAV_PATH] as string | undefined;
      if (navPath !== undefined) {
        AppStorage.setOrCreate(KEY_RESTORE_NAV_PATH, navPath);
      }
    } else {
      // 非恢复启动：清理过期的落盘引用文件
      RestoreBlob.cleanup(this.context);
    }
  }
  // [End restore_on_create]

  // [Start restore_on_save_state]
  onSaveState(reason: AbilityConstant.StateType,
    wantParam: Record<string, Object>): AbilityConstant.OnSaveResult {
    // 数据通道：只做同步读取，禁止在保存窗口做异步采集
    const st = AppStorage.get<ReaderState>(KEY_READER_STATE);
    if (st !== undefined) {
      if (st.draft.length > 2048) {
        // 超限草稿：本体落盘（方案 D），want.parameters 只放轻量引用
        const ref = RestoreBlob.save(this.context, 'reader', st.draft);
        wantParam[KEY_RESTORE_READER_BLOB] = ref;
        st.draft = '';
      }
      wantParam[KEY_RESTORE_READER] = st;
    }
    // 深栈补推：保存当前 Navigation 路径快照（系统只自动恢复栈顶前 2 页）
    const navSnapshot = AppStorage.get<string>(KEY_NAV_SNAPSHOT);
    if (navSnapshot !== undefined) {
      wantParam[KEY_RESTORE_NAV_PATH] = navSnapshot;
    }
    // 必须返回 ALL_AGREE，否则数据不落盘
    return AbilityConstant.OnSaveResult.ALL_AGREE;
  }
  // [End restore_on_save_state]

  // [Start restore_on_window_stage_create]
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // 若工程入口是广告页/闪屏页，恢复启动时应直接加载内容页绕过广告页：
    // const entry = RestoreJudge.isRestoring() ? 'restore/RestoreIndex' : 'pages/Advert';
    windowStage.loadContent('restore/RestoreIndex', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content.');
      // 注意：禁止在此回调中调用 RestoreJudge.finishRestore()——
      // 此时页面尚未挂载、系统 Navigation 栈恢复可能还未执行，守卫会过早失效。
      // finishRestore 的正确调用位置是首页的 onPageShow（见 restore/RestoreIndex.ets）。
    });
  }
  // [End restore_on_window_stage_create]
}
