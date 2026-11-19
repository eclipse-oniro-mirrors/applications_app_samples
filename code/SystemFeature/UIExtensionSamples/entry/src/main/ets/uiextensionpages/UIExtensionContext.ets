/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/uiextensionpages/UIExtensionContext.ets
 * 文件职责：UIExtensionContext 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：UIExtensionContext。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import hilog from '@ohos.hilog';
import { common, OpenLinkOptions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { promptAction } from '@kit.ArkUI';

const TAG: string = '[UIExtensionContext]';

const DOMAIN: number = 0xFF00;

/**
 * UIExtensionContext：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct UIExtensionContext {
  private promptDuration: number = 2000;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  private uiExtContext = getContext(this) as common.UIExtensionContext;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // 顶部标题栏：展示页面标题 UIExtensionContext
      // Row：水平布局容器
      // 关键属性：宽度、高度、主轴对齐、背景色
      Row() {
        // Flex：弹性布局容器
        Flex({ justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center }) {
          // Text：文本
          // 关键属性：字号、字重、文本对齐、外边距
          Text($r('app.string.UIExtensionContext')).id('uiextension_context_text_4')
            .fontSize(30)
            .fontWeight(700)
            .textAlign(TextAlign.Start)
            .margin({
              top: 8,
              bottom: 8,
              left: 12
            })
        }.id('uiextension_context_flex_3')
      }.id('uiextension_context_row_2')
      .width('100%')
      .height('14.36%')
      .justifyContent(FlexAlign.Start)
      .backgroundColor($r('app.color.backGrounding'))

      // 能力入口列表：每项对应一个 UIExtensionContext 接口的调用示例
      // List：列表容器
      // 关键属性：高度、背景色
      List({ initialIndex: 0 }) {
        // 列表项一：openLink 打开网页链接
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionAbilityContext_openLink')).id('uiextension_context_text_7')
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
            // 箭头图标：提示该行可点击进入
            // Row：水平布局容器
            Row() {
              // Image：图片
              // 关键属性：宽度、高度、外边距
              Image($r('app.media.ic_arrow')).id('uiextension_context_image_9')
                .width(24)
                .height(24)
                .margin({ top: 16, bottom: 16, right: 6 })
            }.id('uiextension_context_row_8')
          }
          .id('openLink')
          .onClick(() => {
            ((): void => {
              // 待打开的目标链接与打开选项：appLinkingOnly=false 表示允许用浏览器等普通方式打开
              let link: string = 'http://docs.openharmony.cn';
              let openLinkOptions: OpenLinkOptions = {
                appLinkingOnly: false
              };
              // 分支说明：调用成功 → 打印 resultCode；调用失败 → 打印 errCode；抛异常 → 打印异常码
              try {
                this.uiExtContext.openLink(
                  link,
                  openLinkOptions,
                  (err, result) => {
                    hilog.info(DOMAIN, TAG, 'openLink callback result:', JSON.stringify(result.resultCode));
                  }
                ).then(() => {
                  hilog.info(DOMAIN, TAG, 'open link success');
                }).catch((err: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'open link failed, errCode : %{public}s', JSON.stringify(err.code));
                });
              } catch (e) {
                hilog.info(DOMAIN, TAG, 'exception occurred, errCode : %{public}s', JSON.stringify(e.code));
              }

            })()
          })
        }.id('uiextension_context_list_item_6')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

        // 列表项二：requestModalUIExtension 拉起模态 UI 扩展
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionAbilityContext_requestModalUIExtension')).id('uiextension_context_text_11')
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

            // 箭头图标：提示该行可点击进入
            // Row：水平布局容器
            Row() {
              // Image：图片
              // 关键属性：宽度、高度、外边距
              Image($r('app.media.ic_arrow')).id('uiextension_context_image_13')
                .width(24)
                .height(24)
                .margin({ top: 16, bottom: 16, right: 6 })
            }.id('uiextension_context_row_12')
          }
          .id('startUIExtensionAbility')
          .onClick(() => {
            // 点击后拉起 ContextUIExtensionAbility，并以模态方式展示其 UI
            ((): void => {

              // 目标 UIExtensionAbility 的 Want 描述：type 为 sys/commonUI 表示通用 UI 扩展
              let want: Want = {
                bundleName: 'com.samples.uiextension',
                moduleName: 'entry',
                abilityName: 'ContextUIExtensionAbility',
                type: 'sys/commonUI',
                parameters: {
                  bundleName: 'com.samples.uiextension',
                  'ability.want.params.uiExtensionType': 'sys/commonUI',
                }
              };

              // 分支说明：拉起成功 → toast 成功提示；拉起失败 → toast 错误码与错误信息
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
        }.id('uiextension_context_list_item_10')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

      }.id('uiextension_context_list_5')
      .height('86%')
      .backgroundColor($r('app.color.backGrounding'))
    }.id('uiextension_context_column_1')
    // 根容器铺满整屏，背景色与页面主题保持一致
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.backGrounding'))
  }
}