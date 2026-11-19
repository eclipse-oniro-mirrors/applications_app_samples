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
 * @file casesfeature/immersive/src/main/ets/view/GoodsDetails.ets
 * 文件职责：GoodsDetails 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：GoodsDetails、ProductInfo。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { promptAction } from '@kit.ArkUI';
import { ProductDataModel } from '../model/GoodsModel';
import { ImmersiveDialog } from '../dialog/ImmersiveDialog';

const COLUMN_SPACE = 20; // column间隙

/**
 * GoodsDetails：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct GoodsDetails {
  // @State item：组件内部状态
  @State item: ProductDataModel | undefined = undefined;

  // @Consume navPathStack：消费祖先组件提供的状态
  @Consume navPathStack: NavPathStack;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear(): void {
    this.item = this.navPathStack.getParamByIndex(this.navPathStack.size() - 1) as ProductDataModel;
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Stack：层叠布局容器
    // 关键属性：高度、宽度
    // Stack：层叠布局容器
    // 关键属性：高度、宽度
    Stack({ alignContent: Alignment.Top }) {
      // Stack：层叠布局容器
      // 关键属性：高度
      // Stack：层叠布局容器
      // 关键属性：高度
      Stack({ alignContent: Alignment.Bottom }) {
        // Column：垂直布局容器
        // 关键属性：宽度、高度
        // Column：垂直布局容器
        // 关键属性：宽度、高度
        Column() {
          // 商品图片
          // Image：图片
          // 关键属性：宽度、高度、点击事件回调、showToast
          // 交互：可点击交互
          // Image：图片
          // 关键属性：宽度、高度、点击事件回调、showToast
          // 交互：可点击交互
          Image(this.item?.uri)
            .width($r('app.string.immersive_max_size'))
            .height('60%')
            .id('goodsDetailImage')
            .onClick(() => {
              promptAction.showToast({ message: $r('app.string.immersive_only_show') });
            })
          // 商品详情区
          // ProductInfo：ProductInfo 自定义组件
          ProductInfo({ item: this.item }).id('goods_details_product_info_4')
        }.id('goods_details_column_3')
        .width($r('app.string.immersive_max_size'))
        .height($r('app.string.immersive_max_size'))

        // 底部购买区
        // Row：水平布局容器
        // 关键属性：宽度、内边距、背景色、主轴对齐、边框
        // Row：水平布局容器
        // 关键属性：宽度、内边距、背景色、主轴对齐、边框
        Row() {
          // Button：按钮
          // 关键属性：高度、字号、线性渐变
          // Button：按钮
          // 关键属性：高度、字号、线性渐变
          Button($r('app.string.immersive_add_cart'))
            .height($r('app.string.immersive_vp_30'))
            .fontSize($r('app.string.immersive_vp_15'))
            .linearGradient({
              angle: 90,
              colors: [[$r('app.color.immersive_buttonColor'), 0.5], [$r('app.color.immersive_orange'), 1.0]]
            })
            .margin({ right: $r('app.string.immersive_vp_10') })
            .id('goodsDetailAddCart')
            .onClick(() => {
              promptAction.showToast({ message: $r('app.string.immersive_only_show') });
            })

          // Button：按钮
          // 关键属性：高度、字号、线性渐变
          // Button：按钮
          // 关键属性：高度、字号、线性渐变
          Button($r('app.string.immersive_settlement'))
            .height($r('app.string.immersive_vp_30'))
            .fontSize($r('app.string.immersive_vp_15'))
            .linearGradient({
              angle: 90,
              colors: [[$r('app.color.immersive_buttonColor'), 0.5], [$r('app.color.immersive_orange'), 1.0]]
            })
            .id('goodsDetailSettlement')
            .onClick(() => {
              promptAction.showToast({ message: $r('app.string.immersive_only_show') });
            })
        }.id('goods_details_row_5')
        .width($r('app.string.immersive_max_size'))
        .padding({ top: $r('app.string.immersive_vp_15'), left: $r('app.string.immersive_vp_15'), right: $r('app.string.immersive_vp_15')})
        .backgroundColor($r('app.color.immersive_barColor'))
        .justifyContent(FlexAlign.End)
        .border({
          width: { top: $r('app.string.immersive_vp_1') },
          color: { top: $r('sys.color.ohos_id_color_component_normal') },
        })
        // 设置底部绘制延伸至导航条
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
      }.id('goods_details_stack_2')
      .height('100%')

      // Row：水平布局容器
      // 关键属性：宽度、主轴对齐、内边距
      // Row：水平布局容器
      // 关键属性：宽度、主轴对齐、内边距
      Row() {
        // Image：图片
        // 关键属性：宽度、高度、圆角、背景色、透明度、点击事件回调
        // 交互：可点击交互
        // Image：图片
        // 关键属性：宽度、高度、圆角、背景色、透明度、点击事件回调
        // 交互：可点击交互
        Image($r('app.media.immersive_back')).id('goods_details_image_6')
          .width(30)
          .height(30)
          .borderRadius(15)
          .backgroundColor(Color.Gray)
          .opacity(0.5)
          .onClick(() => {
            this.navPathStack.pop();
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ left: 10 })
      .id('goodsDetailBack')
    }.id('goods_details_stack_1')
    .height('100%')
    .width('100%')
  }
}

/**
 * ProductInfo：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct ProductInfo {
  // @Link item：与父组件双向绑定的状态
  @Link item: ProductDataModel;

  // 底部弹框
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: ImmersiveDialog(),
    cancel: () => {
      this.dialogController?.close();
    },
    isModal: true,
    alignment: DialogAlignment.Bottom,
    customStyle: true
  });

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：背景色、内边距、高度、宽度
    // Row：水平布局容器
    // 关键属性：背景色、内边距、高度、宽度
    Row() {
      // Column：垂直布局容器
      // 关键属性：背景色、内边距、圆角、高度、交叉轴对齐
      // Column：垂直布局容器
      // 关键属性：背景色、内边距、圆角、高度、交叉轴对齐
      Column({ space: COLUMN_SPACE }) {
        // Row：水平布局容器
        // 关键属性：宽度、主轴对齐
        // Row：水平布局容器
        // 关键属性：宽度、主轴对齐
        Row() {
          // Text：文本
          // 关键属性：字号、字体颜色、字重
          // Text：文本
          // 关键属性：字号、字体颜色、字重
          Text(this.item.price).id('goods_details_text_10')// 动态设置组件样式
            .fontSize($r('app.string.immersive_vp_30'))
            .fontColor($r('app.color.immersive_orange'))
            .fontWeight(FontWeight.Bolder)
            .id('goodsDetailPrice')

          // Text：文本
          // 关键属性：字体颜色、字号、字重
          // Text：文本
          // 关键属性：字体颜色、字号、字重
          Text($r('app.string.immersive_sold')).id('goods_details_text_11')
            .fontColor(Color.Gray)
            .fontSize($r('app.string.immersive_vp_15'))
            .fontWeight(FontWeight.Normal);
        }.id('goods_details_row_9')
        .width($r('app.string.immersive_max_size'))
        .justifyContent(FlexAlign.SpaceBetween)

        // Row：水平布局容器
        // 关键属性：主轴对齐、宽度
        // Row：水平布局容器
        // 关键属性：主轴对齐、宽度
        Row() {
          // Text：文本
          // 关键属性：字号、字体颜色、文本对齐、边框
          // Text：文本
          // 关键属性：字号、字体颜色、文本对齐、边框
          Text($r('app.string.immersive_full_reduction')).id('goods_details_text_13')
            .fontSize($r('app.string.immersive_vp_15'))
            .fontColor($r('app.color.immersive_orange'))
            .textAlign(TextAlign.Center)
            .border({
              width: $r('app.string.immersive_vp_1'),
              color: $r('app.color.immersive_orange'),
              style: BorderStyle.Solid
            })
            .margin({ right: $r('app.string.immersive_vp_10') });

          // Button：按钮
          // 关键属性：高度、背景色、点击事件回调、showToast
          // 交互：可点击交互
          // Button：按钮
          // 关键属性：高度、背景色、点击事件回调、showToast
          // 交互：可点击交互
          Button($r('app.string.immersive_coupon_collection')).id('goods_details_button_14')
            .height($r('app.string.immersive_vp_15'))
            .backgroundColor($r('app.color.immersive_red'))
            .onClick(() => {
              promptAction.showToast({ message: $r('app.string.immersive_only_show') });
            })
        }.id('goods_details_row_12')
        .justifyContent(FlexAlign.SpaceBetween)
        .width($r('app.string.immersive_max_size'))

        // Text：文本
        // 关键属性：字号、字重、字体颜色
        // Text：文本
        // 关键属性：字号、字重、字体颜色
        Text(this.item.title).id('goods_details_text_15')
          .fontSize($r('app.string.immersive_vp_20'))
          .fontWeight(FontWeight.Bold)
          .fontColor($r('sys.color.ohos_id_counter_title_font_color'))

        // Text：文本
        // 关键属性：字体颜色、字号、字重、点击事件回调、open
        // 交互：可点击交互
        // Text：文本
        // 关键属性：字体颜色、字号、字重、点击事件回调、open
        // 交互：可点击交互
        Text($r('app.string.immersive_commodity_model'))
          .fontColor(Color.Gray)
          .fontSize($r('app.string.immersive_vp_20'))
          .fontWeight(FontWeight.Normal)
          .id('goodsDetailModelEntry')
          .onClick(() => {
            this.dialogController?.open();
          })
      }.id('goods_details_column_8')
      .backgroundColor($r('app.color.immersive_white'))
      .padding($r('app.string.immersive_vp_10'))
      .borderRadius($r('app.string.immersive_vp_10'))
      .height($r('app.string.immersive_max_size'))
      .alignItems(HorizontalAlign.Start)
    }.id('goods_details_row_7')
    .backgroundColor($r('sys.color.ohos_id_color_component_normal'))
    .padding($r('app.string.immersive_vp_10'))
    .height($r('app.string.immersive_text_proportion'))
    .width($r('app.string.immersive_max_size'))
  }
}
