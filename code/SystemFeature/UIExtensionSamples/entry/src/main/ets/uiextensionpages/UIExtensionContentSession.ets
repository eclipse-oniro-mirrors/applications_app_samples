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
 * @file entry/src/main/ets/uiextensionpages/UIExtensionContentSession.ets
 * 文件职责：UIExtensionContentSession 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：UIExtensionContentSession。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { BusinessError } from '@kit.BasicServicesKit';
import { common, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { promptAction } from '@kit.ArkUI';

const TAG: string = '[UIExtensionContentSession]';

const DOMAIN: number = 0xFF00;

/**
 * UIExtensionContentSession：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct UIExtensionContentSession {
  private promptDuration: number = 2000;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // Row：水平布局容器
      // 关键属性：宽度、高度、主轴对齐、背景色
      Row() {
        // Flex：弹性布局容器
        Flex({ justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center }) {
          // Text：文本
          // 关键属性：字号、字重、文本对齐、外边距
          Text($r('app.string.UIExtensionContentSession')).id('uiextension_content_session_text_4')
            .fontSize(30)
            .fontWeight(700)
            .textAlign(TextAlign.Start)
            .margin({
              top: 8,
              bottom: 8,
              left: 12
            })
        }.id('uiextension_content_session_flex_3')
      }.id('uiextension_content_session_row_2')
      .width('100%')
      .height('14.36%')
      .justifyContent(FlexAlign.Start)
      .backgroundColor($r('app.color.backGrounding'))

      // List：列表容器
      // 关键属性：高度、背景色
      List({ initialIndex: 0 }) {
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionAbilityContext_requestModalUIExtension'))
              .id('uiextension_content_session_text_7')
              .textAlign(TextAlign.Start)
              .fontWeight(500)
              .margin({
                top: 17,
                bottom: 17,
                left: 12
              })
              .fontSize(16)
              .width('77.87%')
              .height('39.29%')
              .fontColor($r('app.color.text_color'))

            // Row：水平布局容器
            Row() {
              // Image：图片
              // 关键属性：宽度、高度、外边距
              Image($r('app.media.ic_arrow')).id('uiextension_content_session_image_9')
                .width(24)
                .height(24)
                .margin({ top: 16, bottom: 16, right: 6 })
            }.id('uiextension_content_session_row_8')
          }
          .id('startUIExtensionAbility')
          .onClick(() => {
            ((): void => {
              let want: Want = {
                bundleName: 'com.samples.uiextension',
                moduleName: 'entry',
                abilityName: 'SessionUIExtensionAbility',
                type: 'sys/commonUI',
                parameters: {
                  bundleName: 'com.samples.uiextension',
                  'ability.want.params.uiExtensionType': 'sys/commonUI',
                }
              };

              this.context.requestModalUIExtension(want)
                .then(() => {
                  let msg: string = `requestModalUIExtension succeed.`;
                  hilog.info(DOMAIN, TAG, msg);
                  promptAction.showToast({ message: msg, duration: this.promptDuration });
                })
                .catch((err: BusinessError) => {
                  let msg = `requestModalUIExtension failed, code is ${err.code}, message is ${err.message}`;
                  hilog.info(DOMAIN, TAG, msg);
                  promptAction.showToast({ message: msg, duration: this.promptDuration });
                })
            })()
          })
        }.id('uiextension_content_session_list_item_6')
        .height('8.86%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

      }.id('uiextension_content_session_list_5')
      .height('86%')
      .backgroundColor($r('app.color.backGrounding'))
    }.id('uiextension_content_session_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.backGrounding'))
  }
}