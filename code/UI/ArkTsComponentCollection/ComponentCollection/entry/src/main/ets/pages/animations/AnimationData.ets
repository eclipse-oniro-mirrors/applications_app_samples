/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/animations/AnimationData.ets
 * 文件职责：AnimationData 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：（无顶层声明）。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ThirdLevelCategory } from '../../model/CategoricalDataType'

const TRANSITION_ANIMATION: ThirdLevelCategory =
  {
    image: $r('app.media.ic_transition_animation'),
    // image：图标 / 图片资源
    title: $r('app.string.transition_animation'),
    // title：文本内容
    childNodes: [
      {
        title: $r('app.string.page_transition'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/pageTransitionSample/PageTransitionSample'
        // url：资源地址
      },
      {
        title: $r('app.string.share_element_transition'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/shareElementTransitionSample/ShareElementTransitionSample'
        // url：资源地址
      },
      {
        title: $r('app.string.Multiplex_interface'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/multiplexSample/MultiplexSample',
        // url：资源地址
      },
      {
        title: $r('app.string.Floating_window'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/floatingSample/FloatingWindowSample',
        // url：资源地址
      },
      {
        title: $r('app.string.Folder_expansion'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/folderSample/FolderSample',
        // url：资源地址
      },
      {
        title: $r('app.string.System_icon'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/systemIcon/SystemIcon',
        // url：资源地址
      },
      {
        title: $r('app.string.Shop_card_expansion'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/shopSample/ShopCardSample',
        // url：资源地址
      },
      {
        title: $r('app.string.Gallery_card_expansion'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/gallerySample/GalleryCardSample',
        // url：资源地址
      },
      {
        title: $r('app.string.component_transition'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/componentTransitionSample/ComponentTransitionSample',
        // url：资源地址
      },
      {
        title: $r('app.string.layout_animation_expansion'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/layoutAnimationSample/LayoutAnimationSample',
        // url：资源地址
      },
      {
        title: $r('app.string.size_transition_expansion'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/sizeTransitionSample/SizeTransitionSample',
        // url：资源地址
      },
      {
        title: $r('app.string.side_bar_effects_title'),
        // title：文本内容
        url: 'pages/animations/TransitionAnimations/sideBarTransitionSample/SideBarTransitionSample',
        // url：资源地址
      }
    ]
  }

const INTERPOLATION_CALCULATION: ThirdLevelCategory =
  {
    image: $r('app.media.ic_interpolation_calculation'),
    // image：图标 / 图片资源
    title: $r('app.string.interpolation_calculation'),
    // title：文本内容
    url: 'pages/animations/interpolationCalculationSample/InterpolationCalculationSample',
    // url：资源地址
  }

const ANIMATE_TO: ThirdLevelCategory =
  {
    image: $r('app.media.ic_animations_animateto'),
    // image：图标 / 图片资源
    title: $r('app.string.animate_to'),
    // title：文本内容
    url: 'pages/animations/animateToSample/AnimateToSample'
    // url：资源地址
  }

const ANIMATION_ATTRIBUTE: ThirdLevelCategory =
  {
    image: $r('app.media.ic_animations_animation'),
    // image：图标 / 图片资源
    title: $r('app.string.attribute_animation'),
    // title：文本内容
    url: 'pages/animations/animationSample/AnimationSample'
    // url：资源地址
  }

const MOTION_PATH: ThirdLevelCategory =
  {
    image: $r('app.media.ic_animations_path'),
    // image：图标 / 图片资源
    title: $r('app.string.motion_path'),
    // title：文本内容
    url: 'pages/animations/motionPathSample/MotionPathSample'
    // url：资源地址
  }

// Animated classification data, second menu data
export const ANIMATION_CATEGORIES: ThirdLevelCategory[] = [TRANSITION_ANIMATION, INTERPOLATION_CALCULATION, ANIMATE_TO, ANIMATION_ATTRIBUTE, MOTION_PATH]