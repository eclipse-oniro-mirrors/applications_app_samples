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
 * @file ListExchange/src/main/ets/generated/RouterBuilder.ets
 * 文件职责：RouterBuilder 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：listExchangeViewBuilder、listExchangeViewRegister。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

// auto-generated
import { DynamicsRouter, AppRouterInfo } from 'routermodule/Index';
import { ListExchangeView } from '../FeatureComponent'

/**
 * listExchangeViewBuilder：函数定义，承载本文件对应的逻辑与数据。
 */
@Builder
function listExchangeViewBuilder() {
  // ListExchangeView：ListExchangeView 自定义组件
  /**
   * ListExchangeView：执行 ListExchangeView 相关逻辑。
   */
  ListExchangeView().id('router_builder_list_exchange_view_1');
}

/**
 * listExchangeViewRegister：函数定义，承载本文件对应的逻辑与数据。
 */
export function listExchangeViewRegister(routerInfo: AppRouterInfo) {
  DynamicsRouter.registerAppRouterPage(routerInfo, wrapBuilder(listExchangeViewBuilder));
}
