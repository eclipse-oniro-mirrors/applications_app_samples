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
 * @file pageloading/src/main/ets/view/CommodityList.ets
 * 文件职责：CommodityList 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CommodityList、ItemView。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { PRODUCTS_DATA } from '../mock/CommodityMock';
import { CommodityDataModel } from '../model/CommodityDataModel';
import { CommodityDataSource } from '../model/CommodityDataSource';
import { promptAction } from '@kit.ArkUI';

// const 语句
const IMAGE_ASPECT_RATIO: number = 1; // 图片的宽高比

// const 语句
const OFFSET: number = -4; // 价格控件偏移量

// const 语句
const OFFSETX: number = 10; // banner阴影X轴偏移量

// const 语句
const OFFSETY: number = 10; // banner阴影Y轴偏移量

// const 语句
const LAYOUT_WEIGHT: number = 1; // 分配剩余空间

// const 语句
const ANGLE: number = 180; // 自上而下渐变

/**
 * CommodityList：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct CommodityList {
  // 字段 commodityData：声明并维护该成员的状态
  private commodityData: CommodityDataSource = new CommodityDataSource();

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    // 更新 commodityData
    this.commodityData.pushData(PRODUCTS_DATA)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // Column：垂直布局容器
      // 关键属性：内边距、背景色
      Column() {
        // Image：图片
        // 关键属性：objectFit、圆角、外边距、宽度、阴影
        Image($r('app.media.page_loading_light_mode_banner'))
          .id('commodityBanner')
          .objectFit(ImageFit.Contain)
          .borderRadius($r('app.integer.page_loading_banner_border_radius'))
          .margin({ top: $r('app.integer.page_loading_banner_margin_top') })
          .width('100%')
          .shadow({
            // 字段 radius：声明并维护该成员的状态
            radius: $r('app.integer.page_loading_banner_shadow_border_radius'),
            // 字段 color：声明并维护该成员的状态
            color: $r('app.color.page_loading_banner_shadow_color'),
            // 字段 offsetX：声明并维护该成员的状态
            offsetX: OFFSETX,
            // 字段 offsetY：声明并维护该成员的状态
            offsetY: OFFSETY
          })

        // Text：文本
        // 关键属性：字体颜色、字号、字重、高度、宽度、文本对齐
        Text($r('app.string.page_loading_goods_title_text'))
          .id('commodityGoodsTitle')
          .fontColor(Color.Black)
          .fontSize($r('app.integer.page_loading_commodity_font'))
          .fontWeight(FontWeight.Bold)
          .height($r('app.integer.page_loading_new_commodity_height'))
          .width('100%')
          .textAlign(TextAlign.Center)
      }.id('commodity_list_column_2')
      .padding({ left: $r('app.integer.page_loading_column_padding_left'), right: $r('app.integer.page_loading_column_padding_right') })
      .backgroundColor(Color.White)

      // List：列表容器
      // 关键属性：宽度、布局权重
      List() {
        LazyForEach(this.commodityData, (item: CommodityDataModel) => {
          // ListItem：列表项
          // 关键属性：内边距
          ListItem() {
            // ItemView：ItemView 自定义组件
            ItemView({ item: item }).id('commodity_list_item_view_4')
          }.id('commodity_list_list_item_3')
          .padding({
            left: $r('app.integer.page_loading_commodity_list_item_padding'),
            right: $r('app.integer.page_loading_commodity_list_item_padding')
          })
          .margin({ top: $r('app.integer.page_loading_commodity_list_item_margin_top') })
        }, (item: CommodityDataModel) => item.id.toString())
      }
      .id('commodity_list')
      .width('100%')
      .layoutWeight(LAYOUT_WEIGHT)
    }.id('commodity_list_column_1')
    // 设置背景颜色渐变
    .linearGradient({
      angle: ANGLE,
      colors: [[0xFFFFFF, 0.0], [0xdddddd, 1.0]]
    })
  }
}

/**
 * ItemView：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct ItemView {
  // @Prop item：父组件传入的属性
  @Prop item: CommodityDataModel;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // TODO: 知识点：相对布局组件，用于复杂场景中元素对齐的布局，容器内子组件区分水平方向，垂直方向子组件可以将容器或者其他子组件设为锚点。
    // RelativeContainer：相对布局容器
    // 关键属性：高度、圆角、宽度、背景色
    RelativeContainer() {
      // Image：图片
      // 关键属性：宽度、aspectRatio、objectFit、内边距
      Image(this.item.uri)
        .width($r('app.integer.page_loading_commodity_image_width'))
        .aspectRatio(IMAGE_ASPECT_RATIO)
        .objectFit(ImageFit.Contain)
        .padding({
          top: $r('app.integer.page_loading_commodity_image_padding_top'),
          bottom: $r('app.integer.page_loading_commodity_image_padding_bottom')
        })
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })
        .id('image')

      // Text：文本
      // 关键属性：字号、字体颜色、边框颜色、边框宽度、圆角、内边距
      Text(this.item.insurance)
        .fontSize($r('app.integer.page_loading_commodity_insurance_font_size'))
        .fontColor($r('app.color.page_loading_goods_insurance_text_color'))
        .borderColor($r('app.color.page_loading_goods_insurance_border_color'))
        .borderWidth($r('app.integer.page_loading_commodity_insurance_border_width'))
        .borderRadius($r('app.integer.page_loading_commodity_insurance_border_radius'))
        .padding({
          left: $r('app.integer.page_loading_commodity_insurance_padding_left'),
          right: $r('app.integer.page_loading_commodity_insurance_padding_right'),
          top: $r('app.integer.page_loading_commodity_insurance_padding_top'),
          bottom: $r('app.integer.page_loading_commodity_insurance_padding_bottom')
        })
        .margin({ right: $r('app.integer.page_loading_commodity_insurance_margin_right') })
        .alignRules({
          right: { anchor: '__container__', align: HorizontalAlign.End },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        .id('insurance')

      // Row：水平布局容器
      // 关键属性：高度、宽度、外边距、主轴对齐、相对对齐规则
      Row() {
        // Image：图片
        // 关键属性：宽度、aspectRatio、objectFit
        Image($r('app.media.page_loading_views')).id('commodity_list_image_6')
          .width($r('app.integer.page_loading_views_image_width'))
          .aspectRatio(IMAGE_ASPECT_RATIO)
          .objectFit(ImageFit.Contain)

        // Text：文本
        // 关键属性：字号、外边距、字体颜色
        Text(this.item.views).id('commodity_list_text_7')
          .fontSize($r('app.integer.page_loading_views_font'))
          .margin({ left: $r('app.integer.page_loading_views_margin_left') })
          .fontColor(Color.Black)
      }
      .height($r('app.integer.page_loading_views_height'))
      .width($r('app.integer.page_loading_views_width'))
      .margin({ top: $r('app.integer.page_loading_views_margin_top') })
      .justifyContent(FlexAlign.End)
      .alignRules({
        middle: { anchor: 'insurance', align: HorizontalAlign.Center },
        top: { anchor: 'insurance', align: VerticalAlign.Bottom }
      })
      .id('views')

      // Column：垂直布局容器
      // 关键属性：主轴对齐、相对对齐规则
      Column() {
        // Text：文本
        // 关键属性：字号、字重、字体颜色、宽度
        Text(this.item.title).id('commodity_list_text_8')
          .fontSize($r('app.integer.page_loading_commodity_title_text_font_size'))
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
          .width('100%')

        // Text：文本
        // 关键属性：字号、字重、偏移、字体颜色、外边距、宽度
        Text(this.item.price).id('commodity_list_text_9')
          .fontSize($r('app.integer.page_loading_commodity_price_text_font_size'))
          .fontWeight(FontWeight.Bold)
          .offset({ x: OFFSET })// 因为￥是中文字符，上面的是中文字符，占的宽度不一样，所以需要对齐，添加offset
          .fontColor($r('app.color.page_loading_goods_price_text_color'))
          .margin({ top: $r('app.integer.page_loading_commodity_price_margin_top') })
          .width('100%')
      }
      .justifyContent(FlexAlign.Start)
      .alignRules({
        left: { anchor: 'image', align: HorizontalAlign.End },
        right: { anchor: 'insurance', align: HorizontalAlign.Start },
        center: { anchor: 'image', align: VerticalAlign.Center }
      })
      .id('column')
      .onClick(() => {
        promptAction.showToast({ message: $r('app.string.page_loading_commodity_other_function') });
      })
    }.id('commodity_list_relative_container_5')
    .height($r('app.integer.page_loading_commodity_list_item_height'))
    .borderRadius($r('app.integer.page_loading_commodity_border_radius'))
    .width('100%')
    .backgroundColor(Color.White)
  }
}