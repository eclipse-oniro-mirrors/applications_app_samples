/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
 * @file customanimationtab/src/main/ets/model/CustomAniamtionTabController.ets
 * 文件职责：CustomAniamtionTabController 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CustomAnimationTabController。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * 自定义动效tab控制器，控制自定义动效Tab组件进行页签切换
 *
 */
export class CustomAnimationTabController extends SwiperController {
  // 状态监听器
  private listener: (state: number) => void = (state: number) => {};

  /**
   * changeIndex：执行 changeIndex 相关逻辑。
   */
  public changeIndex(index: number, useAnimation?: boolean | undefined): void {
    this.listener(1);
    super.changeIndex(index, useAnimation);
  }

  /**
   * setListener：执行 setListener 相关逻辑。
   */
  public setListener(func: (state: number) => void) {
    this.listener = func;
  }
}