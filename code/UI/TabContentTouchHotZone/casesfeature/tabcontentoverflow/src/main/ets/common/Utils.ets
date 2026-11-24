/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

/**
 * @file casesfeature/tabcontentoverflow/src/main/ets/common/Utils.ets
 * 文件职责：Utils 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Utils。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { promptAction } from '@kit.ArkUI';
import { CONFIGURATION } from './Constants';

/**
 * 通用功能类
 */
export class Utils {
  // 点击未开发功能按钮弹出提示函数
  /**
   * showPromptAction：执行 showPromptAction 相关逻辑。
   */
  showPromptAction() {
    promptAction.showToast({
      message: $r('app.string.tabcontentoverflow_toast_message'),
      duration: CONFIGURATION.TABCONTENT_OVERFLOW_DURATION
    });
  }
}
