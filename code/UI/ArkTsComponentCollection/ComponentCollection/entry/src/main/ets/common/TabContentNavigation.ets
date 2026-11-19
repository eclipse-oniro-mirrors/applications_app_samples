/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
 * @file entry/src/main/ets/common/TabContentNavigation.ets
 * 文件职责：TabContentNavigation 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ColumnStyle、TabContentNavigation、ThirdLevelNavigation、FourthLevelNavigation。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import Logger from '../util/Logger';
import { SecondLevelCategory, ThirdLevelCategory, FourthLevelCategory } from '../model/CategoricalDataType';

/**
 * ColumnStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Column)
function ColumnStyle() {
  .width('100%')
  .borderRadius(24)
  .backgroundColor(Color.White)
  .padding({ left: 12, right: 12, bottom: 4, top: 4 })
}

/**
 * TabContentNavigation：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct TabContentNavigation {
  private categories: ThirdLevelCategory[] | SecondLevelCategory[] = new Array<ThirdLevelCategory>();

  /**
   * hasSecondLevelCategory：执行 hasSecondLevelCategory 相关逻辑。
   */
  hasSecondLevelCategory(category: ThirdLevelCategory | SecondLevelCategory): boolean {
    return category && category.image ? false : true;
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、内边距
    Column() {
      // List：列表容器
      // 关键属性：宽度、布局权重、内边距
      List() {
        if (this.hasSecondLevelCategory(this.categories[0])) {
          ForEach(this.categories, (secondLevelCategory: SecondLevelCategory, secondLevelCategoryIndex: number) => {
            // ListItem：列表项
            ListItem() {
              // Column：垂直布局容器
              Column() {
                // Text：文本
                // 关键属性：高度、字号、宽度、文本对齐、字体、字体颜色
                Text(secondLevelCategory.title).id('tab_content_navigation_text_3')
                  .height(48)
                  .fontSize(14)
                  .width('100%')
                  .textAlign(TextAlign.Start)
                  .fontFamily('HarmonyHeiTi-Medium')
                  .fontColor($r('app.color.font_color_shallow'))
                  .padding({ bottom: 4, top: 4, left: 24 })

                // Column：垂直布局容器
                // 关键属性：ColumnStyle
                Column() {
                  ForEach(secondLevelCategory.childNodes, (thirdLevelCategory: ThirdLevelCategory,
                                                           thirdLevelCategoryIndex: number) => {
                    // ThirdLevelNavigation：ThirdLevelNavigation 自定义组件
                    ThirdLevelNavigation({
                      thirdLevelCategory: thirdLevelCategory,
                      secondLevelCategoryIndex: secondLevelCategoryIndex,
                      ThirdLevelNavigationIndex: thirdLevelCategoryIndex
                    }).id('tab_content_navigation_third_level_navigation_5')
                  })
                }.id('tab_content_navigation_column_4')
                .ColumnStyle()
              }.id('tab_content_navigation_column_2')
            }
            .id('ListItem' + secondLevelCategoryIndex)
          })
        } else {
          ForEach(this.categories, (thirdLevelCategory: ThirdLevelCategory) => {
            // ListItem：列表项
            // 关键属性：外边距
            ListItem() {
              // Column：垂直布局容器
              // 关键属性：ColumnStyle
              Column() {
                // ThirdLevelNavigation：ThirdLevelNavigation 自定义组件
                ThirdLevelNavigation({ thirdLevelCategory: thirdLevelCategory })
                  .id('tab_content_navigation_third_level_navigation_8')
              }.id('tab_content_navigation_column_7')
              .ColumnStyle()
            }.id('tab_content_navigation_list_item_6')
            .margin({ top: 6, bottom: 6 })
          })
        }
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16, top: 4 })
      .id('list_001')

      // Blank：占位空白
      Blank().id('tab_content_navigation_blank_9')
    }.id('tab_content_navigation_column_1')
    .height('100%')
    .padding({ top: 12 })
  }
}

/**
 * ThirdLevelNavigation：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct ThirdLevelNavigation {
  // @State isUnfold：组件内部状态
  @State isUnfold: boolean = false;
  private thirdLevelCategory!: ThirdLevelCategory;
  private ThirdLevelNavigationIndex: number = 0;
  private secondLevelCategoryIndex: number = 0;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // Row：水平布局容器
      // 关键属性：高度、宽度、点击事件回调
      // 交互：可点击交互
      Row() {
        // Image：图片
        // 关键属性：宽度、高度、objectFit
        Image(this.thirdLevelCategory.image).id('tab_content_navigation_image_12')
          .width(24)
          .height(24)
          .objectFit(ImageFit.Fill)

        // Text：文本
        // 关键属性：字号、外边距、字体、字体颜色
        Text(this.thirdLevelCategory.title).id('tab_content_navigation_text_13')
          .fontSize(16)
          .margin({ left: 16 })
          .fontFamily('HarmonyHeiTi-Medium')
          .fontColor($r('app.color.font_color_dark'))

        // Blank：占位空白
        Blank().id('tab_content_navigation_blank_14')

        if (this.thirdLevelCategory.childNodes) {
          // Image：图片
          // 关键属性：宽度、高度、外边距
          Image(this.isUnfold ? $r('app.media.ic_down_arrow') : $r('app.media.ic_right_arrow'))
            .id('tab_content_navigation_image_15')
            .width(this.isUnfold ? 24 : 12)
            .height(this.isUnfold ? 12 : 24)
            .margin({ right: this.isUnfold ? 0 : 6 })
        }
      }.id('tab_content_navigation_row_11')
      .height(56)
      .width('100%')
      .onClick(() => {
        if (this.thirdLevelCategory.childNodes === undefined) {
          router.pushUrl({
            url: this.thirdLevelCategory.url
          });
        } else {
          this.isUnfold = !this.isUnfold;
        }
      })

      // Click to expand the fourth-level category
      if (this.isUnfold) {
        ForEach(this.thirdLevelCategory.childNodes, (fourthLevelCategory: FourthLevelCategory) => {
          // Column：垂直布局容器
          Column() {
            // Divider：分割线
            // 关键属性：高度、透明度、外边距、color
            Divider().id('tab_content_navigation_divider_17')
              .height(1)
              .opacity(0.2)
              .margin({ left: 42, right: 8 })
              .color($r('app.color.font_color_dark'))

            // FourthLevelNavigation：FourthLevelNavigation 自定义组件
            FourthLevelNavigation({ fourthLevelCategory: fourthLevelCategory })
              .id('tab_content_navigation_fourth_level_navigation_18')
          }.id('tab_content_navigation_column_16')
        })
      }
    }.id('tab_content_navigation_column_10')
    // 整体字符串折行会被识别出来，导致功能异常，只能放在单独一行，1和0分别为首页标题层级index
    .id(`secondLevelMenu${this.secondLevelCategoryIndex}${this.secondLevelCategoryIndex === 1 ? 0 : this.ThirdLevelNavigationIndex}`)
  }
}

/**
 * FourthLevelNavigation：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct FourthLevelNavigation {
  private fourthLevelCategory!: FourthLevelCategory;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：高度、宽度、点击事件回调
    // 交互：可点击交互
    Row() {
      // Text：文本
      // 关键属性：字号、布局权重、外边距、align、字体、字体颜色
      Text(this.fourthLevelCategory.title).id('tab_content_navigation_text_19')
        .fontSize(16)
        .layoutWeight(1)
        .margin({ left: 42 })
        .align(Alignment.Start)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontColor($r('app.color.font_color_dark'))
      // Blank：占位空白
      Blank().id('tab_content_navigation_blank_20')
    }
    .height(48)
    .width('100%')
    .id(this.fourthLevelCategory.url)
    .onClick(() => {
      // Click to jump to the corresponding page
      router.pushUrl({
        url: this.fourthLevelCategory.url
      })
    })
  }
}