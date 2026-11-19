/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/uiextensionentry/ContextUIExtensionAbility.ets
 * 文件职责：ContextUIExtensionAbility 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ContextUIExtensionAbility。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { UIExtensionAbility, UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[UIExtAbility]';

const DOMAIN: number = 0xFF00;

/**
 * ContextUIExtensionAbility：类定义，承载本文件对应的逻辑与数据。
 */
export default class ContextUIExtensionAbility extends UIExtensionAbility {
  /**
   * onCreate：Ability 创建时回调。
   */
  onCreate() {
    hilog.info(DOMAIN, TAG, 'UIExtAbility onCreate');
  }

  /**
   * onForeground：应用进入前台时回调。
   */
  onForeground() {
    hilog.info(DOMAIN, TAG, `UIExtAbility onForeground`);
  }

  /**
   * onBackground：应用退到后台时回调。
   */
  onBackground() {
    hilog.info(DOMAIN, TAG, `UIExtAbility onBackground`);
  }

  /**
   * onDestroy：Ability 销毁时回调。
   */
  onDestroy() {
    hilog.info(DOMAIN, TAG, `UIExtAbility onDestroy`);
  }

  /**
   * onSessionCreate：执行 onSessionCreate 相关逻辑。
   */
  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    hilog.info(DOMAIN, TAG, `UIExtAbility onSessionCreate, want: ${JSON.stringify(want)}`);

    let param: Record<string, UIExtensionContentSession> = {
      'session': session
    };

    let storage: LocalStorage = new LocalStorage(param);
    session.loadContent('uiextensionpages/UIExtensionContextPage', storage);
  }

  /**
   * onSessionDestroy：执行 onSessionDestroy 相关逻辑。
   */
  onSessionDestroy(session: UIExtensionContentSession) {
    hilog.info(DOMAIN, TAG, `UIExtAbility onSessionDestroy`);
  }
};