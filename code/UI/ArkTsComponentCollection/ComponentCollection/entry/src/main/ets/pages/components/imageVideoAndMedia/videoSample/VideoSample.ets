/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/imageVideoAndMedia/videoSample/VideoSample.ets
 * 文件职责：VideoSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：cardStyle、VideoSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import ShowToast from '../../../../util/ShowToast';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { AutoPlaySwitchPanel, VideoFitControlPanel, CurrentRateControlPanel } from '../videoSample/VideoControlPanel';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';

/**
 * cardStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Column)
function cardStyle() {
  .backgroundColor($r('app.color.white'))
  .borderRadius(16)
  .width('100%')
  .padding(12)
}

/**
 * VideoSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct VideoSample {
  // @State message：组件内部状态
  @State message: string = 'Hello World';

  // @State videoCurrent：组件内部状态
  @State videoCurrent: number = 1;

  // @State autoPlay：组件内部状态
  @State autoPlay: boolean = false;

  // @State controlsShow：组件内部状态
  @State controlsShow: boolean = true;

  // @State mutedShow：组件内部状态
  @State mutedShow: boolean = false;

  // @State videoFit：组件内部状态
  @State videoFit: ImageFit = ImageFit.Auto;

  // @State videoLoop：组件内部状态
  @State videoLoop: boolean = false;
  controller: VideoController = new VideoController();
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  //fixme:修复了视频组件全屏后，视频控制栏消失的情况，推测为被Scroll组件包裹后会出现之前的情况，目前仍出现问题为：全屏后视频播放栏与系统导航栏重合无法正常点击
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色、高度
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.video_title') }).id('video_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：布局权重、内边距、外边距
      Column() {
        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({ introduction: $r('app.string.video_show') }).id('video_sample_introduction_title_4')
        // Video：视频组件
        // 关键属性：高度、宽度、是否自动播放、controls、muted、objectFit
        Video({ src: $r('app.media.video_test'),
          currentProgressRate: this.videoCurrent,
          previewUri: $r('app.media.ic_image_alt'),
          controller: this.controller }).id('video_sample_video_5')
          // height：设置高度
          .height(300)
          // width：设置宽度
          .width('100%')
          // autoPlay：设置是否自动播放
          .autoPlay(this.autoPlay)
          .controls(this.controlsShow)
          .muted(this.mutedShow)
          // objectFit：设置图片填充模式
          .objectFit(this.videoFit)
          // loop：设置是否循环
          .loop(this.videoLoop)
          .onStart(() => {
            // 处理：ShowToast.shortToast('start')
            ShowToast.shortToast('start')
          // 结束当前组件块
          })
          .onPause(() => {
            // 处理：ShowToast.shortToast('Pause')
            ShowToast.shortToast('Pause')
          // 结束当前组件块
          })
          .onFinish(() => {
            // 处理：ShowToast.shortToast('Finish')
            ShowToast.shortToast('Finish')
          // 结束当前组件块
          })
          .onError(() => {
            // 处理：ShowToast.shortToast('Error')
            ShowToast.shortToast('Error')
          // 结束当前组件块
          })
          .onPrepared((video) => {
            // 处理：ShowToast.longToast('Video is Prepared and video
            ShowToast.longToast('Video is Prepared and video duration is ' + video.duration)
          // 结束当前组件块
          })
          .onSeeking((video) => {
            ShowToast.shortToast('' + video.time)
          })
          .onSeeked((video) => {
            ShowToast.shortToast('' + video.time)
          })
          .onUpdate((video) => {
          })
          .onFullscreenChange((event) => {
            if (event.fullscreen) {
              try {
                let promise = window.getLastWindow(this.context);
                promise.then((data) => {
                  let windowClass: window.Window = data;
                  console.info('Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
                  let names = [];
                  try {
                    let promise: Promise<void> = windowClass.setWindowSystemBarEnable(names);
                    promise.then(() => {
                      console.info('Succeeded in setting the system bar to be invisible.');
                    }).catch((err: Error) => {
                      console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
                    });
                  } catch (exception) {
                    console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
                  }
                }).catch((err: Error) => {
                  console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
                });
              } catch (exception) {
                console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
              }
              ShowToast.shortToast('FullScreen')
            }
            else {
              try {
                let promise = window.getLastWindow(this.context);
                promise.then((data) => {
                  let windowClass: window.Window = data;
                  console.info('Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
                  let names: Array<"status" | "navigation"> = ['status', 'navigation'];
                  try {
                    let promise: Promise<void> = windowClass.setWindowSystemBarEnable(names);
                    promise.then(() => {
                      console.info('Succeeded in setting the system bar to be invisible.');
                    }).catch((err: Error) => {
                      console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
                    });
                  } catch (exception) {
                    console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
                  }
                }).catch((err: Error) => {
                  console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
                });
              } catch (exception) {
                console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
              }
              ShowToast.shortToast('NotFullScreen')
            }
          })
        // Scroll：滚动容器
        // 关键属性：布局权重
        Scroll() {
          // Column：垂直布局容器
          // 关键属性：布局权重
          Column() {
            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.video_play_switch') })
              .id('video_sample_introduction_title_8')
            // Column：垂直布局容器
            // 关键属性：cardStyle
            Column() {
              // AutoPlaySwitchPanel：AutoPlaySwitchPanel 自定义组件
              // 关键属性：cardStyle
              AutoPlaySwitchPanel({
                AutoPlay: $autoPlay,
                controlsShow: $controlsShow,
                muted: $mutedShow,
                loop: $videoLoop
              }).id('video_sample_auto_play_switch_panel_10')
            }.id('video_sample_column_9').cardStyle()

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.video_play_mode') })
              .id('video_sample_introduction_title_11')
            // Column：垂直布局容器
            // 关键属性：cardStyle
            Column() {
              // VideoFitControlPanel：VideoFitControlPanel 自定义组件
              VideoFitControlPanel({ VideoObjectFit: $videoFit }).id('video_sample_video_fit_control_panel_13')
              // CurrentRateControlPanel：CurrentRateControlPanel 自定义组件
              // 关键属性：cardStyle
              CurrentRateControlPanel({ currentRate: $videoCurrent }).id('video_sample_current_rate_control_panel_14')
            }.id('video_sample_column_12').cardStyle()
          }.id('video_sample_column_7')
        }.id('video_sample_scroll_6').layoutWeight(1)
      }.id('video_sample_column_3').layoutWeight(1)
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .margin({ bottom: 5 })
    }.id('video_sample_column_1')
    .backgroundColor($r('app.color.background_grey'))
    .height('100%')
  }
}