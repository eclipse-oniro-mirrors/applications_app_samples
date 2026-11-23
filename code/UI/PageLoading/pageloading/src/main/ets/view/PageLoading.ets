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
 * @file pageloading/src/main/ets/view/PageLoading.ets
 * 文件职责：PageLoading 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PageLoadingComponent。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommodityList } from './CommodityList';
import { LoadingHUD } from './LoadingHUD';

/**
 *  功能描述：本示例介绍Stack堆叠组件和LoadingProgress加载组件模拟首次进入页面实现页面加载的效果。加载完成后，LoadingProgress组件会消失并展示加载结果页（即商品页）。
 *
 * 推荐场景：应用加载缓慢的页面，如商城页面首页等场景，为了提升用户点击响应的体验。
 *
 * 核心组件：
 * 1.LoadingHUD
 *
 *  实现步骤：
 * 1.创建一个Stack组件，LoadingHUD是加载页，内部的GoodsList为商品列表页。
 * 2.进入页面首先展示LoadingHUD加载页，5秒后，LoadingHUD加载页消失且出现GoodsList商品列表页。
 */

const MILLISECONDS: number = 5000; // 毫秒数

/**
 * PageLoadingComponent：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PageLoadingComponent {
  // @State isLoading：组件内部状态
  @State isLoading: Boolean = true;

  // @State nowProgress：组件内部状态
  @State nowProgress: number = 0;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear(): void {
    // 模拟网络请求操作，请求网络3秒后得到数据，通知组件，变更列表数据
    setTimeout(() => {
      this.isLoading = false;
    }, MILLISECONDS);
    //模拟进度，开发者可在实际业务中与服务端协调当前进度，自行实现
    setInterval(()=>{
      this.nowProgress += 10
    },MILLISECONDS / 10)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Stack：层叠布局容器
    // 关键属性：宽度、高度、背景色
    Stack() {
      if (this.isLoading) {
        // 加载页-HUD全称Heads-Up Display（抬头显示）
        // LoadingHUD：LoadingHUD 自定义组件
        LoadingHUD({nowProgress:this.nowProgress}).id('page_loading_loading_hud_1');
      } else {
        // 商品页
        // CommodityList：CommodityList 自定义组件
        CommodityList().id('page_loading_commodity_list_2');
      }
    }
    .id('pageLoadingStack')
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}