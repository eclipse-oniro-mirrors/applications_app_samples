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
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index、FileItemComponent。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { common, Want } from '@kit.AbilityKit';
import { picker } from '@kit.CoreFileKit';
import { logger } from '../log/Logger';
import { promptAction } from '@kit.ArkUI';

const FONT_WEIGHT = 400;

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  // @State fileArray：组件内部状态
  @State fileArray: Array<string> = [];

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色、expandSafeArea
    Column() {
      // Row：水平布局容器
      // 关键属性：交叉轴对齐、高度、宽度、主轴对齐、背景色、内边距
      Row() {
        // Image：图片
        // 关键属性：宽度、高度、点击事件回调
        // 交互：可点击交互
        Image($r("app.media.file_preview_dlp_add"))
          .id('addButton')
          .width($r('app.integer.file_preview_dlp_integer_28'))
          .height($r('app.integer.file_preview_dlp_integer_28'))
          .onClick(() => {
            // 打开文件管理选择dlp文件
            this.selectDlp()
          })
        // Blank：占位空白
        Blank().id('index_blank_2')
        // Text：文本
        // 关键属性：字号、字重、字体颜色
        Text($r('app.string.file_preview_dlp_text'))
          .id('titleText')
          .fontSize($r('app.integer.file_preview_dlp_integer_20'))
          .fontWeight(FONT_WEIGHT)
          .fontColor(Color.Black)
        // Blank：占位空白
        Blank().id('index_blank_3')
        // Image：图片
        // 关键属性：宽度、高度、点击事件回调
        // 交互：可点击交互
        Image($r("app.media.file_preview_dlp_sift"))
          .id('filterButton')
          .width($r('app.integer.file_preview_dlp_integer_28'))
          .height($r('app.integer.file_preview_dlp_integer_28'))
          .onClick(() => {
            // 当前调用Toast显示提示:此样式仅为案例展示
            promptAction.showToast({ message: $r('app.string.file_preview_dlp_show_ui') });
          })
      }.id('index_row_1')
      .alignItems(VerticalAlign.Center)
      .height($r('app.integer.file_preview_dlp_integer_69'))
      .width($r('app.string.file_preview_dlp_hundred_percent'))
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor($r('sys.color.comp_background_list_card'))
      .padding({
        left: $r('app.integer.file_preview_dlp_integer_20'),
        right: $r('app.integer.file_preview_dlp_integer_20')
      })

      // List：列表容器
      // 关键属性：布局权重、背景色、内边距
      List() {
        ForEach(this.fileArray, (files: string, index: number) => {
          // FileItemComponent：FileItemComponent 自定义组件
          // 关键属性：点击事件回调
          // 交互：可点击交互
          FileItemComponent({ index: index }).id('index_file_item_component_4')
            .onClick(() => {
              // 点击DLP文件打开该文件
              this.viewDlp(files)
            })
        })
      }
      .id('fileList')
      .layoutWeight(1)
      .backgroundColor('#F5F7FA')
      .padding({
        left: $r('app.integer.file_preview_dlp_integer_15'),
        right: $r('app.integer.file_preview_dlp_integer_15'),
        top: $r('app.integer.file_preview_dlp_integer_24')
      })

    }
    .width($r('app.string.file_preview_dlp_hundred_percent'))
    .height($r('app.string.file_preview_dlp_hundred_percent'))
    .backgroundColor($r('sys.color.comp_background_list_card'))
    .id('pageRoot')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
  }

  /**
   * selectDlp：执行 selectDlp 相关逻辑。
   */
  selectDlp() {
    try {
      let context = getContext(this) as common.UIAbilityContext;
      // 文档选择选项
      let documentSelectOptions = new picker.DocumentSelectOptions();
      // 可以选择三个文件
      documentSelectOptions.maxSelectNumber = 3;
      // 文件选择器对象，用来支撑选择和保存各种格式文档
      let documentPicker = new picker.DocumentViewPicker(context);
      documentPicker.select(documentSelectOptions).then((documentSelectResult: Array<string>) => {
        // 将选择的文件路径保存到本地数组中
        for (let index = 0; index < documentSelectResult.length; index++) {
          this.fileArray.push(documentSelectResult[index]);
        }
      })
    } catch (err) {
      logger.error('Select DLP failed ' + JSON.stringify(err))
    }
  }

  /**
   * viewDlp：执行 viewDlp 相关逻辑。
   */
  viewDlp(dlpUri: string) {
    let context = getContext(this) as common.UIAbilityContext;
    // 构造want参数
    let want: Want = {
      'action': 'ohos.want.action.viewData',
      'uri': dlpUri,
    }
    try {
      // 通过调用startAbility接口，由系统从已安装的应用中寻找文件预览，打开选定的文件
      context.startAbility(want);
    } catch (err) {
      logger.error('View DLP failed ' + JSON.stringify(err))
    }
  }
}

/**
 * FileItemComponent：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct FileItemComponent {
  // @State index：组件内部状态
  @State index: number = 0;

  /**
   * getTime：执行 getTime 相关逻辑。
   */
  getTime() {
    const now = new Date();
    // 获取年、月、日
    const year = now.getFullYear();
    const month = now.getMonth() + 1; // 月份是从0开始的，所以需要加1
    const day = now.getDate();

    // 转换为字符串
    const formattedDate = `${year}-${month.toString().padStart(2, '0')}-${day.toString().padStart(2, '0')}`;
    return formattedDate
  }

  /**
   * getSize：执行 getSize 相关逻辑。
   */
  getSize() {
    return (Math.random() * 10).toFixed(1) + 'MB';
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：内边距
    Row() {
      // Image：图片
      // 关键属性：宽度、高度、objectFit、draggable、外边距
      Image($r('app.media.file_preview_dlp_word')).id('index_image_6')
        .width($r('app.integer.file_preview_dlp_integer_50'))
        .height($r('app.integer.file_preview_dlp_integer_50'))
        .objectFit(ImageFit.Cover)
        .draggable(false)// TODO：知识点：保持默认值true时，图片有默认拖拽效果，会影响Grid子组件拖拽判断，所以修改为false
        .margin({ left: $r('app.integer.file_preview_dlp_integer_21') })
      // Column：垂直布局容器
      // 关键属性：交叉轴对齐、主轴对齐、外边距、高度
      Column() {
        // Text：文本
        // 关键属性：字体颜色、字号、字重、文本对齐
        Text(`Text${this.index + 1}`).id('index_text_8')
          .fontColor(Color.Black)
          .fontSize($r('app.integer.file_preview_dlp_integer_15'))
          .fontWeight(FONT_WEIGHT)
          .textAlign(TextAlign.Start)

        // Text：文本
        // 关键属性：字号、字重、字体颜色、外边距
        Text(this.getTime()).id('index_text_9')
          .fontSize($r('app.integer.file_preview_dlp_integer_13'))
          .fontWeight(FONT_WEIGHT)
          .fontColor($r('app.color.file_preview_dlp_color_8A9095'))
          .margin({ top: $r('app.integer.file_preview_dlp_integer_10') })
      }.id('index_column_7')
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ left: $r('app.integer.file_preview_dlp_integer_15') })
      .height($r('app.integer.file_preview_dlp_integer_50'))

      // Blank：占位空白
      Blank().id('index_blank_10')
      // Column：垂直布局容器
      Column() {
        // Text：文本
        // 关键属性：字号、字体颜色、外边距
        Text($r('app.string.file_preview_dlp_show_text')).id('index_text_12')
          .fontSize($r('app.integer.file_preview_dlp_integer_13'))
          .fontColor($r('app.color.file_preview_dlp_color_8A9095'))
          .margin({
            right: $r('app.integer.file_preview_dlp_integer_15')
          })
        // 仅做样式调整，开发者可根据文件实际大小来渲染
        // Text：文本
        // 关键属性：字号、字体颜色、外边距
        Text(this.getSize()).id('index_text_13')
          .fontSize($r('app.integer.file_preview_dlp_integer_13'))
          .fontColor($r('app.color.file_preview_dlp_color_8A9095'))
          .margin({
            right: $r('app.integer.file_preview_dlp_integer_15'),
            top: $r('app.integer.file_preview_dlp_integer_15')
          })
      }.id('index_column_11')

    }.id('index_row_5')
    .padding({
      top: $r('app.integer.file_preview_dlp_integer_12'),
      bottom: $r('app.integer.file_preview_dlp_integer_12')
    })
    .margin({ bottom: $r('app.integer.file_preview_dlp_integer_12') })
    .borderRadius($r('app.integer.file_preview_dlp_integer_12'))
    .width($r('app.string.file_preview_dlp_hundred_percent'))
    .backgroundColor($r('sys.color.white'))
  }
}
