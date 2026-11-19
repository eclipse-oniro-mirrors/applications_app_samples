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
 * @file entry/src/main/ets/uiextensionpages/UIExtensionContentSessionPage.ets
 * 文件职责：UIExtensionContentSessionPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：UIExtensionContentSessionPage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { promptAction } from '@kit.ArkUI';
import uiExtension from '@ohos.arkui.uiExtension';

// const 语句
const TAG: string = 'UIExtensionContentSession';

// const 语句
const DOMAIN: number = 0xFF00;

// let 语句
let storage: LocalStorage = LocalStorage.getShared();

/**
 * UIExtensionContentSessionPage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct UIExtensionContentSessionPage {
  // 字段 session：声明并维护该成员的状态
  private session: (UIExtensionContentSession | undefined) = storage.get<UIExtensionContentSession>('session');
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
          Text($r('app.string.UIExtensionAbilityContext')).id('uiextension_content_session_page_text_4')
            .fontSize(30)
            .fontWeight(700)
            .textAlign(TextAlign.Start)
            .margin({
              // 字段 top：声明并维护该成员的状态
              top: '12%',
              // 字段 left：声明并维护该成员的状态
              left: '2%'
            })
        }.id('uiextension_content_session_page_flex_3')
      }.id('uiextension_content_session_page_row_2')
      .width('100%')
      .height('18%')
      .justifyContent(FlexAlign.Start)
      .backgroundColor($r('app.color.backGrounding'))

      // 能力入口列表：每项演示 UIExtensionContentSession 的一个接口
      // 列表项之间通过 margin 与圆角形成卡片式分隔
      // 点击任一列表项即调用对应接口，并在日志与 toast 中反馈调用结果
      // List：列表容器
      // 关键属性：高度、背景色
      List({ initialIndex: 0 }) {
        // 列表项一：以 callback 方式结束自身并回传结果
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionContentSession_terminateSelfWithResultCallback'))
              .id('uiextension_content_session_page_text_7')
              .textAlign(TextAlign.Start)
              .fontWeight(500)
              .margin({
                // 字段 top：声明并维护该成员的状态
                top: 17,
                // 字段 bottom：声明并维护该成员的状态
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
            // 以 callback 形式结束当前 UIExtension，resultCode=99 作为回传结果码
            ((): void => {
              this.session?.terminateSelfWithResult({ resultCode: 99, want: this.want }, () => {
                hilog.info(DOMAIN, TAG, 'UIExtensionContentSession.terminateSelfWithResult(callback) called');
              })
            })()
          })
        }.id('uiextension_content_session_page_list_item_6')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

        // 列表项二：以 Promise 方式结束自身并回传结果
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionContentSession_terminateSelfWithResultPromise'))
              .id('uiextension_content_session_page_text_9')
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
            // 以 Promise 形式结束当前 UIExtension，resultCode=100 作为回传结果码
            ((): void => {
              this.session?.terminateSelfWithResult({ resultCode: 100, want: this.want }).then(() => {
                hilog.info(DOMAIN, TAG, 'UIExtensionContentSession.terminateSelfWithResult(promise) called');
              })
            })()
          })
        }.id('uiextension_content_session_page_list_item_8')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

        // 列表项三：以 callback 方式开启窗口隐私模式
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionContentSession_setWindowPrivacyModeCallback'))
              .id('uiextension_content_session_page_text_11')
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
          .id('setWindowPrivacyModeCallback')
          .onClick(() => {
            // 开启隐私模式：开启后该扩展窗口内容在截屏/录屏中不可见
            ((): void => {
              this.session?.setWindowPrivacyMode(true, () => {
                let msg = `UIExtensionContentSession.setWindowPrivacyMode(callback) called. isPrivacyMode: true`;
                hilog.info(DOMAIN, TAG, msg);
                promptAction.showToast({ message: msg, duration: this.promptDuration });
              })
            })()
          })
        }.id('uiextension_content_session_page_list_item_10')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

        // 列表项四：以 Promise 方式关闭窗口隐私模式
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionContentSession_setWindowPrivacyModePromise'))
              .id('uiextension_content_session_page_text_13')
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
          .id('setWindowPrivacyModePromise')
          .onClick(() => {
            // 关闭隐私模式：恢复窗口内容在截屏/录屏中的可见性
            ((): void => {
              this.session?.setWindowPrivacyMode(false).then(() => {
                let msg = `UIExtensionContentSession.setWindowPrivacyMode(promise) called. isPrivacyMode: false`;
                hilog.info(DOMAIN, TAG, msg);
                promptAction.showToast({ message: msg, duration: this.promptDuration });
              })
            })()
          })
        }.id('uiextension_content_session_page_list_item_12')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

        // 列表项五：获取当前 UI 扩展的窗口代理对象
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIExtensionContentSession_getUIExtensionWindowProxy'))
              .id('uiextension_content_session_page_text_15')
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
          .id('getUIExtensionWindowProxy')
          .onClick(() => {
            // 取回窗口代理后仅打印其类型，用于演示接口可用性
            ((): void => {
              let windowProxy: (uiExtension.WindowProxy | undefined) = this.session?.getUIExtensionWindowProxy();
              let msg = `UIExtensionContentSession.getUIExtensionWindowProxy called. proxy: ${typeof windowProxy}`;
              hilog.info(DOMAIN, TAG, msg);
              promptAction.showToast({ message: msg, duration: this.promptDuration });
            })()
          })
        }.id('uiextension_content_session_page_list_item_14')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

      }.id('uiextension_content_session_page_list_5')
      .height('86%')
      .backgroundColor($r('app.color.backGrounding'))
    }.id('uiextension_content_session_page_column_1')
    // 根容器铺满整屏，背景色与页面主题保持一致
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.backGrounding'))
  }
}
