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
 * @file ListExchange/src/main/ets/model/ListInfo.ets
 * 文件职责：ListInfo 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ListInfo。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * 列表信息，包括图标、名字、是否可见
 * icon: 列表项图标
 * name: 列表项名称
 */
// @Observed：可观察对象
/**
 * ListInfo：类定义，承载本文件对应的逻辑与数据。
 */
@Observed
export class ListInfo {
  public icon: ResourceStr = '';
  public name: ResourceStr = '';

  /** 构造 ListInfo 实例。 */
  constructor(icon: ResourceStr = '', name: ResourceStr = '') {
    this.icon = icon;
    this.name = name;
  }
}