/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * @file casesfeature/immersive/src/main/ets/components/GoodsList.ets
 * 文件职责：GoodsList 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：GoodsList、ItemView。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { PRODUCT_DATA } from '../mock/GoodsMock';
import { ProductDataModel } from '../model/GoodsModel';
import { promptAction } from '@kit.ArkUI';

const GUTTER_X: number = 8; // 商品上下间隔

const GUTTER_Y: number = 8; // 商品左右间隔

const IMAGE_ASPECT_RATIO: number = 1; // 图片的宽高比

const OFFSET: number = -3; // 价格控件偏移量

const SPAN: number = 6; // 超过规定列数6时自动换行

/**
 * GoodsList：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct GoodsList {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // GridRow：栅格行
    // 关键属性：内边距
    // GridRow：栅格行
    // 关键属性：内边距
    GridRow({ gutter: { x: GUTTER_X, y: GUTTER_Y }, }) {
      // GridRow组件不支持LazyForEach方法
      ForEach(PRODUCT_DATA, (item: ProductDataModel) => {
        // GridCol：栅格列
        // 关键属性：function toString() { [native code] }
        // GridCol：栅格列
        // 关键属性：function toString() { [native code] }
        GridCol({ span: SPAN }) {
          // ItemView：ItemView 自定义组件
          ItemView({ item: item }).id('goods_list_item_view_3')
        }.id('goods_list_grid_col_2')
      }, (item: ProductDataModel) => item.id.toString())
    }.id('goods_list_grid_row_1')
    .padding({
      left: $r("app.integer.immersive_grid_row_padding"),
      right: $r("app.integer.immersive_grid_row_padding"),
      top: $r("app.integer.immersive_grid_row_padding")
    })
    .backgroundColor($r("app.color.immersive_list_bg_color"))
    // 设置列表绘制延伸至状态栏
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
  }
}

/**
 * ItemView：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct ItemView {
  // @Prop item：父组件传入的属性
  @Prop item: ProductDataModel;

  // @Consume navPathStack：消费祖先组件提供的状态
  @Consume navPathStack: NavPathStack;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：点击事件回调、pushPathByName
    // 交互：可点击交互
    // Column：垂直布局容器
    // 关键属性：点击事件回调、pushPathByName
    // 交互：可点击交互
    Column() {
      // 此处的商品图片需要根据父组件的宽度而变化，这里使用70%
      // Image：图片
      // 关键属性：宽度、aspectRatio、objectFit、外边距
      // Image：图片
      // 关键属性：宽度、aspectRatio、objectFit、外边距
      Image(this.item.uri).id('goods_list_image_4')
        .width('70%')
        .aspectRatio(IMAGE_ASPECT_RATIO)
        .objectFit(ImageFit.Contain)
        .margin({ bottom: $r("app.integer.immersive_goods_image_margin_bottom") })

      // Column：垂直布局容器
      // 关键属性：外边距、交叉轴对齐
      // Column：垂直布局容器
      // 关键属性：外边距、交叉轴对齐
      Column() {
        // Text：文本
        // 关键属性：宽度、字号、字体颜色
        // Text：文本
        // 关键属性：宽度、字号、字体颜色
        Text(this.item.title).id('goods_list_text_6')
          .width('100%')
          .fontSize($r("app.integer.immersive_goods_font"))
          .fontColor($r('sys.color.ohos_id_color_foreground'))
        // Flex：弹性布局容器
        // 关键属性：外边距
        // Flex：弹性布局容器
        // 关键属性：外边距
        Flex({ justifyContent: FlexAlign.SpaceBetween }) {
          // Text：文本
          // 关键属性：字号、偏移、字体颜色
          // Text：文本
          // 关键属性：字号、偏移、字体颜色
          Text(this.item.price).id('goods_list_text_8')
            .fontSize($r("app.integer.immersive_goods_font"))
            .offset({ x: OFFSET })// 因为￥是中文字符，上面的是中文字符，占的宽度不一样，所以需要对齐，添加offset
            .fontColor($r('sys.color.ohos_id_color_foreground'))
          // Row：水平布局容器
          // 关键属性：交叉轴对齐、外边距
          // Row：水平布局容器
          // 关键属性：交叉轴对齐、外边距
          Row() {
            // Image：图片
            // 关键属性：fillColor、宽度、aspectRatio、objectFit
            // Image：图片
            // 关键属性：fillColor、宽度、aspectRatio、objectFit
            Image($r("app.media.immersive_view")).id('goods_list_image_10')
              .fillColor($r("app.color.immersive_view_fill_color"))
              .width($r("app.integer.immersive_view_image_width"))
              .aspectRatio(IMAGE_ASPECT_RATIO)
              .objectFit(ImageFit.Contain)

            // Text：文本
            // 关键属性：字号、外边距、字体颜色、交叉轴对齐
            // Text：文本
            // 关键属性：字号、外边距、字体颜色、交叉轴对齐
            Text(this.item.views).id('goods_list_text_11')
              .fontSize($r("app.integer.immersive_view_font"))
              .margin({ left: $r("app.integer.immersive_view_margin_left") })
              .fontColor($r('sys.color.ohos_id_color_foreground'))
          }.id('goods_list_row_9').alignItems(VerticalAlign.Center)
        }.id('goods_list_flex_7').margin({ top: $r("app.integer.immersive_flex_margin_top") })

      }.id('goods_list_column_5')
      .margin({ left: $r("app.integer.immersive_goods_column_padding_left") })
      .alignItems(HorizontalAlign.Start)
    }
    .onClick(() => {
      this.navPathStack.pushPathByName('goodsDetail', this.item);
    })
    .borderRadius($r("app.integer.immersive_goods_border_radius"))
    .padding($r("app.integer.immersive_column_padding"))
    .backgroundColor($r('app.color.immersive_product_bg_color'))
    .id(`goodsItem${this.item.id}`)
  }
}