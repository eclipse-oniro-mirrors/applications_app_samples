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
 * @file entry/src/main/ets/pages/SubWindowPage.ets
 * 文件职责：SubWindowPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SubWindowPage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import emitter from '@ohos.events.emitter';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';

/**
 * SubWindowPage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SubWindowPage {
  SUB_WINDOW_INNER_EVENT_ID: number = 1001;
  videoController: VideoController = new VideoController();

  /**
   * startNewAbility：执行 startNewAbility 相关逻辑。
   */
  async startNewAbility() {
    let context = getContext(this) as common.UIAbilityContext; // UIAbilityContext
    let want: Want = {
      bundleName: 'com.samples.windowratio',
      abilityName: 'MainAbility',
    };
    try {
      context.startAbility(want)
        .then((data) => {
          console.info('startAbility succeed');
        })
        .catch((error: BusinessError) => {
          console.error('startAbility failed, error.code: ' + JSON.stringify(error.code) +
            ' error.message: ' + JSON.stringify(error.message));
        });
    } catch (paramError) {
      console.error('error.code: ' + JSON.stringify(paramError.code) +
        ' error.message: ' + JSON.stringify(paramError.message));
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：宽度、高度
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      // Button：按钮
      // 关键属性：点击事件回调、startNewAbility
      // 交互：可点击交互
      Button($r("app.string.startNewAbility"))
        .onClick(async () => {
          await this.startNewAbility();
        })
        .backgroundColor('#007dff')
        .id('startAbility')
        .fontSize('22px')
        .width('80%')
        .height('40px')
        .borderRadius(15)

      // Video：视频组件
      // 关键属性：宽度、布局权重、是否循环、muted、controls、是否自动播放
      // 交互：可点击交互
      Video({
        src: $rawfile('video.mp4'),
        currentProgressRate: PlaybackSpeed.Speed_Forward_1_00_X,
        controller: this.videoController
      })
        .id('smallVideo')
        .width(320)
        .layoutWeight(1)
        .loop(false)
        .muted(false)
        .controls(true)
        .autoPlay(true)
        .onTouch((event: TouchEvent | undefined) => {
          if (event !== undefined) {
            let eventData: emitter.EventData = {
              data: {
                x: event.touches[0].displayX,
                y: event.touches[0].displayY,
                type: event.type
              }
            };
            let innerEvent: emitter.InnerEvent = {
              eventId: this.SUB_WINDOW_INNER_EVENT_ID,
              priority: emitter.EventPriority.HIGH
            };
            emitter.emit(innerEvent, eventData);
          }
        })
    }.id('sub_window_page_flex_1')
    .width('100%').height('100%')
  }
}