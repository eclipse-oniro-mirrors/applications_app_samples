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
 * @file pageloading/src/main/ets/model/CommodityDataModel.ets
 * 文件职责：CommodityDataModel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CommodityDataModel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * 商品的数据类
 */
export class CommodityDataModel {
  public id: number;
  public uri: ResourceStr;
  public title: ResourceStr;
  public price: ResourceStr;
  public views: ResourceStr;
  public insurance: ResourceStr;

  /** 构造 CommodityDataModel 实例。 */
  constructor(id: number, uri: ResourceStr, title: ResourceStr, price: ResourceStr, views: ResourceStr,
    insurance: ResourceStr) {
    this.id = id;
    this.uri = uri;
    this.title = title;
    this.price = price;
    this.views = views;
    this.insurance = insurance;
  }

  /**
   * toString：function toString() { [native code] }
   */
  toString(): string {
    return this.id.toString() + '  ' + this.title;
  }
}