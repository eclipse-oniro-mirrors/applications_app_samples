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
 * @file WindowComponent/src/main/ets/components/MainPage/MainPage.ets
 * 文件职责：MainPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Datastring、WindowComponent、VideoWindow。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import WindowManger from '../feature/WindowManger';
import { WindowEventId, WindowType } from "../util/WindowConst";
import Logger from '../util/Logger';

const windowAttribute: WindowType = {
  moveToWidth: 50, // 窗口移动X坐标
  moveToHeight: 250, // 窗口移动Y坐标
  setTouchable: true, // 窗口是否可触
  resetSizeWidth: 400, // 窗口宽
  resetSizeHeight: 300, // 窗口高
  setPrivacyMode: true, // 窗口是否为隐私模式
  setBrightness: 1 // 窗口亮度
};

/**
 * Datastring：接口定义，承载本文件对应的逻辑与数据。
 */
interface Datastring {
  context: common.UIAbilityContext | null,
  launchWant: string | null,
  subWindow: window.WindowStage | null
}

/**
 * WindowComponent：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct WindowComponent {
  // @StorageLink topHeight：与 AppStorage 双向绑定
  @StorageLink("topHeight") topHeight: number = 0; // 窗口规避区域高
  // @StorageLink topWidth：与 AppStorage 双向绑定
  @StorageLink("topWidth") topWidth: number = 0; // 窗口规避区域宽
  // @Link videoSrc：与父组件双向绑定的状态
  @Link videoSrc: Resource;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
      // 窗口顶部规避区域
      // Row：水平布局容器
      // 关键属性：宽度、高度
      Row().id('main_page_row_2')
        .width(px2vp(this.topWidth))
        .height(px2vp(this.topHeight))
      // video视频
      // VideoWindow：VideoWindow 自定义组件
      VideoWindow({ videoSrc: $videoSrc }).id('main_page_video_window_3')
    }.id('main_page_column_1')
    .width('100%')
    .height('100%')
  }
}

/**
 * VideoWindow：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct VideoWindow {
  // @State isPlaying：组件内部状态
  @State isPlaying: boolean = false;

  // @Link videoSrc：与父组件双向绑定的状态
  @Link videoSrc: Resource;

  // @StorageLink focusText：与 AppStorage 双向绑定
  @StorageLink('focusText') focusText: string = 'unknown';
  videoController: VideoController = new VideoController();
  private context: common.UIAbilityContext | null = null;
  private subWindow: window.WindowStage | null = null;

  // @StorageLink isPortrait：与 AppStorage 双向绑定
  @StorageLink('isPortrait') isPortrait: Boolean = true;
  private showSubWindow: Boolean = false;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    this.context = getContext(this) as common.UIAbilityContext;
    let data: Datastring = {
      context: this.context,
      launchWant: ' ',
      subWindow: this.subWindow
    };
    this.context.eventHub.emit("createWindow", data);
    this.subWindow = data.subWindow;
    WindowManger.updateDisplay();
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // Column：垂直布局容器
      // 关键属性：高度
      Column() {
        // Video：视频组件
        // 关键属性：宽度、高度、外边距、是否循环、objectFit、muted
        // 交互：可点击交互
        Video({
          src: this.videoSrc,
          currentProgressRate: PlaybackSpeed.Speed_Forward_1_00_X,
          controller: this.videoController
        })
          .id('mainVideo')
          .width(400)
          .height(250)
          .margin(5)
          .loop(false)
          .objectFit(ImageFit.Contain)
          .muted(false)
          .controls(true)
          .autoPlay(true)
          .onClick(async () => {
            Logger.info('onClick');
            if (this.showSubWindow) {
              this.videoController.start();
              let windows = await this.subWindow?.getSubWindow();
              if (windows !== undefined) {
                windows[0].destroyWindow();
                this.showSubWindow = false;
                WindowManger.destorySubWindowCallback();
              }
            } else {
              this.videoController.pause();
              WindowManger.initSubWindow(this.subWindow, windowAttribute, this.isPortrait);
              this.showSubWindow = true;
            }
            ;
          })
          .onStart(() => {
            this.isPlaying = true;
          })
          .onPause(() => {
            this.isPlaying = false;
          })

        // Button：按钮
        // 关键属性：点击事件回调
        // 交互：可点击交互
        Button($r("app.string.pages_textTwo"))
          .id('windowBtn')
          .onClick(() => {
            if (this.isPortrait) {
              this.videoController.requestFullscreen(true);
              WindowManger.changeWindowDirection(this.subWindow, window.Orientation.LANDSCAPE);
              this.isPortrait = false;
            } else {
              this.videoController.requestFullscreen(true);
              WindowManger.changeWindowDirection(this.subWindow, window.Orientation.PORTRAIT);
              this.isPortrait = true;
            }
            ;
          })
      }.id('main_page_column_5')
      .height('75%')

      // Column：垂直布局容器
      // 关键属性：宽度、高度、align
      Column() {
        // Text：文本
        // 关键属性：宽度、高度、文本对齐、字号、字体颜色
        Text(this.focusText)
          .id('focus')
          .width(300)
          .height(150)
          .textAlign(TextAlign.Center)
          .fontSize(50)
          .fontColor(Color.Black)
      }.id('main_page_column_6')
      .width(500)
      .height(300)
      .align(Alignment.Bottom)
    }.id('main_page_column_4')
  }
}
