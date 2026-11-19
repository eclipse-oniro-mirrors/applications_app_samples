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
 * @file entry/src/main/ets/uiextensionpages/UIExtensionContextPage.ets
 * 文件职责：UIExtensionContextPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：UIExtensionContextPage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { common, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { promptAction } from '@kit.ArkUI';

// const 语句
const TAG: string = 'UIExtensionContent';

// const 语句
const DOMAIN: number = 0xFF00;

// let 语句
let storage: LocalStorage = LocalStorage.getShared();

/**
 * UIExtensionContextPage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct UIExtensionContextPage {
  // 字段 context：声明并维护该成员的状态
  private context = getContext(this) as common.UIExtensionContext;
  // 字段 want：声明并维护该成员的状态
  private want: (Want | undefined) = storage.get<Want>('want');
  // 字段 promptDuration：声明并维护该成员的状态
  private promptDuration: number = 2000;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // 顶部标题栏：展示页面标题 UIExtensionAbilityContext
      // Row：水平布局容器
      // 关键属性：宽度、高度、主轴对齐、背景色
      Row() {
        // Flex：弹性布局容器
        Flex({ justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center }) {
          // Text：文本
          // 关键属性：字号、字重、文本对齐、外边距
          Text($r('app.string.UIExtensionAbilityContext')).id('uiextension_context_page_text_4')
            .fontSize(30)
            .fontWeight(700)
            .textAlign(TextAlign.Start)
            .margin({
              // 字段 top：声明并维护该成员的状态
              top: '12%',
              // 字段 left：声明并维护该成员的状态
              left: '2%'
            })
        }.id('uiextension_context_page_flex_3')
      }.id('uiextension_context_page_row_2')
      .width('100%')
      .height('18%')
      .justifyContent(FlexAlign.Start)
      .backgroundColor($r('app.color.backGrounding'))

      // 能力入口列表：每项演示 UIExtensionContent 的一个接口
      // 列表项以卡片样式呈现，点击即触发对应接口调用
      // 调用结果统一通过 hilog 与 toast 反馈，便于验证接口行为
      // 列表高度占页面剩余空间，超出部分可滚动查看
      // List：列表容器
      // 关键属性：高度、背景色
      List({ initialIndex: 0 }) {
        // 列表项一：上报首帧绘制完成
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionContent_reportDrawnCompleted')).id('uiextension_context_page_text_7')
              .textAlign(TextAlign.Start)
              .fontWeight(500)
              .margin({
                // 字段 top：声明并维护该成员的状态
                top: 17,
                bottom: 17,
                left: 12
              })
              .fontSize(16)
              .width('77.87%')
              .height('39.29%')
              .fontColor($r('app.color.text_color'))
          }
          .id('reportDrawnCompleted')
          .onClick(() => {
            // 通知宿主首帧已绘制完成，失败时区分业务错误与参数异常
            ((): void => {
              try {
                this.context.reportDrawnCompleted((err) => {
                  if (err.code) {
                    // 处理业务逻辑错误
                    let msg =
                      `UIExtensionContent.reportDrawnCompleted failed, code is ${err.code}, message is ${err.message}`;
                    hilog.info(DOMAIN, TAG, msg);
                    promptAction.showToast({ message: msg, duration: this.promptDuration });
                    return;
                  }
                  // 执行正常业务
                  let msg = `UIExtensionContent.reportDrawnCompleted succeed.`;
                  hilog.info(DOMAIN, TAG, msg);
                  promptAction.showToast({ message: msg, duration: this.promptDuration });
                });
              } catch (err) {
                // 捕获同步的参数错误
                let msg = `UIExtensionContent.reportDrawnCompleted failed,err is ${JSON.stringify(err)}`;
                hilog.info(DOMAIN, TAG, msg);
                promptAction.showToast({ message: msg, duration: this.promptDuration });
              }
            })()
          })
        }.id('uiextension_context_page_list_item_6')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

        // 列表项二：以 callback 方式结束当前 UIExtension
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionContent_terminateSelfCallback')).id('uiextension_context_page_text_9')
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
          }
          .id('terminateSelfCallback')
          .onClick(() => {
            // 结束当前 UIExtension 实例，回调中仅打印调用日志
            ((): void => {
              this.context?.terminateSelf(() => {
                hilog.info(DOMAIN, TAG, 'UIExtensionContent_terminateSelfCallback(callback) called');
              })
            })()
          })
        }.id('uiextension_context_page_list_item_8')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

        // 列表项三：以 Promise 方式结束当前 UIExtension
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionContent_terminateSelfPromise')).id('uiextension_context_page_text_11')
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
          }
          .id('terminateSelfPromise')
          .onClick(() => {
            // 以 Promise 形式结束当前 UIExtension 实例
            ((): void => {
              this.context?.terminateSelf().then(() => {
                hilog.info(DOMAIN, TAG, 'UIExtensionContent_terminateSelfPromise(promise) called');
              })
            })()
          })
        }.id('uiextension_context_page_list_item_10')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

        // 列表项四：以 callback 方式结束自身并回传结果
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionContent_terminateSelfWithResultCallback'))
              .id('uiextension_context_page_text_13')
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
          }
          .id('terminateSelfWithResultCallback')
          .onClick(() => {
            // 以 callback 形式结束并回传结果，resultCode=99
            ((): void => {
              this.context?.terminateSelfWithResult({ resultCode: 99, want: this.want }, () => {
                hilog.info(DOMAIN, TAG, 'UIExtensionContent_terminateSelfWithResultCallback(callback) called');
              })
            })()
          })
        }.id('uiextension_context_page_list_item_12')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

        // 列表项五：以 Promise 方式结束自身并回传结果
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionContent_terminateSelfWithResultPromise'))
              .id('uiextension_context_page_text_15')
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
          }
          .id('terminateSelfWithResultPromise')
          .onClick(() => {
            // 以 Promise 形式结束并回传结果，resultCode=100
            ((): void => {
              this.context?.terminateSelfWithResult({ resultCode: 100, want: this.want }).then(() => {
                hilog.info(DOMAIN, TAG, 'UIExtensionContent.terminateSelfWithResult(promise) called');
              })
            })()
          })
        }.id('uiextension_context_page_list_item_14')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

      }.id('uiextension_context_page_list_5')
      .height('86%')
      .backgroundColor($r('app.color.backGrounding'))
    }.id('uiextension_context_page_column_1')
    // 根容器铺满整屏，背景色与页面主题保持一致
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.backGrounding'))
  }
}