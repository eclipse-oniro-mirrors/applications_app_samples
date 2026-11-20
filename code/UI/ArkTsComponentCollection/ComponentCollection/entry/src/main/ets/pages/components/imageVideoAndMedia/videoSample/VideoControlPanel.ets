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
 * @file entry/src/main/ets/pages/components/imageVideoAndMedia/videoSample/VideoControlPanel.ets
 * 文件职责：VideoControlPanel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：AutoPlaySwitchPanel、VideoFitControlPanel、CurrentRateControlPanel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSlider, CommonItemSelect,CommonItemColorSelect,CommonSwitcher} from '../../../../common/AttributeModificationTool';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';
import {OBJECT_FIT_SELECT,CURRENT_RATE} from'../../../components/ComponentData';

/**
 * AutoPlaySwitchPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct AutoPlaySwitchPanel {
  // @Link AutoPlay：与父组件双向绑定的状态
  @Link AutoPlay:boolean ;

  // @Link controlsShow：与父组件双向绑定的状态
  @Link controlsShow:boolean;

  // @Link muted：与父组件双向绑定的状态
  @Link muted:boolean;

  // @Link loop：与父组件双向绑定的状态
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  @Link loop:boolean;
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({name:$r('app.string.video_auto_play'),bool:$AutoPlay,testId: 'video_switch_001'})
        .id('video_control_panel_common_switcher_2')
      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({name:$r('app.string.video_controls_show'),bool:$controlsShow,testId: 'video_switch_002'})
        .id('video_control_panel_common_switcher_3')
      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({name:$r('app.string.video_muted_show'),bool:$muted,testId: 'video_switch_003'})
        .id('video_control_panel_common_switcher_4')
      // CommonSwitcher：CommonSwitcher 自定义组件
      CommonSwitcher({name:$r('app.string.video_loop_show'),bool:$loop,testId: 'video_switch_004'})
        .id('video_control_panel_common_switcher_5')
    }.id('video_control_panel_column_1')
  }
}

/**
 * VideoFitControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct VideoFitControlPanel {
  // @Link VideoObjectFit：与父组件双向绑定的状态
  @Link VideoObjectFit: ImageFit;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.video_fit_change'),
        selects: getStringArrayData(OBJECT_FIT_SELECT),
        callback: (index) => {
          switch (index) {
            case 1:
              this.VideoObjectFit = ImageFit.None;
              break;
            case 2:
              this.VideoObjectFit = ImageFit.Cover;
              break;
            case 3:
              this.VideoObjectFit = ImageFit.Contain;
              break;
            case 4:
              this.VideoObjectFit = ImageFit.Fill;
              break;
            case 5:
              this.VideoObjectFit = ImageFit.ScaleDown;
            default:
              this.VideoObjectFit = ImageFit.Auto;
          }
        },testId: 'video_select_001'
      }).id('video_control_panel_common_item_select_7')
    }.id('video_control_panel_column_6')
  }
}@Component

/**
 * CurrentRateControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
export struct CurrentRateControlPanel {
  // @Link currentRate：与父组件双向绑定的状态
  @Link currentRate: number;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.video_current_rate_change'),
        selects: CURRENT_RATE,
        callback: (index) => {
          switch (index) {
            case 1:
              this.currentRate = 1;
              break;
            case 2:
              this.currentRate = 1.25;
              break;
            case 3:
              this.currentRate = 1.75;
              break;
            case 4:
              this.currentRate = 2;
              break;
            default:
              this.currentRate = 0.75;
          }
        },testId: 'video_select_002'
      }).id('video_control_panel_common_item_select_9')
    }.id('video_control_panel_column_8')
  }
}