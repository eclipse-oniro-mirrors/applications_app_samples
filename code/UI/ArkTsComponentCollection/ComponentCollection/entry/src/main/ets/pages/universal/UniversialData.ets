/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/universal/UniversialData.ets
 * 文件职责：UniversialData 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ResourceObjectType、PointerStyleName。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { SecondLevelCategory, ThirdLevelCategory } from '../../model/CategoricalDataType';
import pointer from '@ohos.multimodalInput.pointer';

/**
 * ResourceObjectType：接口定义，承载本文件对应的逻辑与数据。
 */
export interface ResourceObjectType {
  value: Resource
  // value：文本内容
}

/**
 * PointerStyleName：接口定义，承载本文件对应的逻辑与数据。
 */
export interface PointerStyleName {
  key: string
  value: pointer.PointerStyle
  // value：文本内容
}

const GRAPHIC_TRANSFORMATION: ThirdLevelCategory[] =
  [
    {
      image: $r('app.media.ic_prop_background'),
      // image：图标 / 图片资源
      title: $r('app.string.prop_foreground'),
      // title：文本内容
      url: 'pages/universal/properties/foregroundSample/ForegroundSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_prop_background'),
      // image：图标 / 图片资源
      title: $r('app.string.prop_background'),
      // title：文本内容
      url: 'pages/universal/properties/backgroundSample/BackgroundSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_prop_border'),
      // image：图标 / 图片资源
      title: $r('app.string.prop_border'),
      // title：文本内容
      url: 'pages/universal/properties/borderSample/BorderSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_prop_border'),
      // image：图标 / 图片资源
      title: $r('app.string.prop_outline'),
      // title：文本内容
      url: 'pages/universal/properties/outlineSample/OutlineSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_prop_font'),
      // image：图标 / 图片资源
      title: $r('app.string.prop_font'),
      // title：文本内容
      url: 'pages/universal/properties/fontSample/FontSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_prop_size'),
      // image：图标 / 图片资源
      title: $r('app.string.prop_size'),
      // title：文本内容
      url: 'pages/universal/properties/sizeSample/SizeSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_graphic_transformation'),
      // image：图标 / 图片资源
      title: $r('app.string.graphic_transformation'),
      // title：文本内容
      childNodes: [
        {
          title: $r('app.string.graphic_transformation_rotate'),
          // title：文本内容
          url: 'pages/universal/properties/rotateSample/RotateSample'
          // url：资源地址
        },
        {
          title: $r('app.string.graphic_transformation_translate'),
          // title：文本内容
          url: 'pages/universal/properties/translateSample/TranslateSample'
          // url：资源地址
        },
        {
          title: $r('app.string.scale'),
          // title：文本内容
          url: 'pages/universal/properties/scaleSample/ScaleSample'
          // url：资源地址
        },
        {
          title: $r('app.string.transform'),
          // title：文本内容
          url: 'pages/universal/properties/transformSample/TransformSample'
          // url：资源地址
        }
      ]
    },
    {
      image: $r('app.media.ic_display'),
      // image：图标 / 图片资源
      title: $r('app.string.components_display'),
      // title：文本内容
      url: "pages/universal/properties/displaySample/DisplaySample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_interaction'),
      // image：图标 / 图片资源
      title: $r('app.string.components_interaction'),
      // title：文本内容
      url: "pages/universal/properties/interactionSample/InteractionSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_image_effects'),
      // image：图标 / 图片资源
      title: $r('app.string.components_effects'),
      // title：文本内容
      url: "pages/universal/properties/effectsSample/EffectsSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_properties_location'),
      // image：图标 / 图片资源
      title: $r('app.string.location_settings'),
      // title：文本内容
      url: "pages/universal/properties/locationSample/LocationSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_properties_constraint'),
      // image：图标 / 图片资源
      title: $r('app.string.layout_constrain'),
      // title：文本内容
      url: "pages/universal/properties/layoutConstraintSample/LayoutConstraintSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_properties_flex'),
      // image：图标 / 图片资源
      title: $r('app.string.flex'),
      // title：文本内容
      url: "pages/universal/properties/flexSample/FlexSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_properties_border'),
      // image：图标 / 图片资源
      title: $r('app.string.picture_border'),
      // title：文本内容
      url: "pages/universal/properties/pictureBorderSample/PictureBorderSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_shape_crop'),
      // image：图标 / 图片资源
      title: $r('app.string.shape_crop'),
      // title：文本内容
      url: "pages/universal/properties/shapeCropSample/ShapeCropSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_grid_setting'),
      // image：图标 / 图片资源
      title: $r('app.string.grid_settings'),
      // title：文本内容
      url: "pages/universal/properties/gridSettingsSample/GridSettingsSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_focus'),
      // image：图标 / 图片资源
      title: $r('app.string.focus_control'),
      // title：文本内容
      url: "pages/universal/properties/focusControlSample/FocusControlSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_component_id'),
      // image：图标 / 图片资源
      title: $r('app.string.component_id'),
      // title：文本内容
      url: "pages/universal/properties/componentIDSample/ComponentIDSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_component_blurr'),
      // image：图标 / 图片资源
      title: $r('app.string.component_blurred'),
      // title：文本内容
      url: "pages/universal/properties/componentBlurredSample/ComponentBlurredSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_restore_id'),
      // image：图标 / 图片资源
      title: $r('app.string.restore_id'),
      // title：文本内容
      url: "pages/universal/properties/restoreIdSample/RestoreIdSample"
      // url：资源地址
    },
    {
      image: $r('app.media.ic_prop_background'),
      // image：图标 / 图片资源
      title: $r('app.string.safe_area'),
      // title：文本内容
      url: 'pages/universal/properties/safeAreaSample/SafeAreaSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_screenshot_arbitrarygraphics'),
      // image：图标 / 图片资源
      title: $r('app.string.attribute_modifier'),
      // title：文本内容
      url: 'pages/universal/properties/attributeModifierSample/AttributeModifierSample'
      // url：资源地址
    }
  ];

const COMMON_EVENTS: ThirdLevelCategory[] =
  [
    {
      image: $r('app.media.ic_click_event'),
      // image：图标 / 图片资源
      title: $r('app.string.click_event'),
      // title：文本内容
      url: 'pages/universal/events/clickEventSample/ClickEventSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_event_touch'),
      // image：图标 / 图片资源
      title: $r('app.string.touch_event'),
      // title：文本内容
      url: 'pages/universal/events/touchEventSample/TouchEventSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_event_drag'),
      // image：图标 / 图片资源
      title: $r('app.string.drag_drop_event'),
      // title：文本内容
      url: 'pages/universal/events/dragEventSample/DragEventSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_event_area_change'),
      // image：图标 / 图片资源
      title: $r('app.string.component_area_change_event'),
      // title：文本内容
      url: 'pages/universal/events/areaChangeEventSample/AreaChangeEventSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_mount_event'),
      // image：图标 / 图片资源
      title: $r('app.string.general_mount'),
      // title：文本内容
      url: 'pages/universal/events/mountUnmountEventSample/MountUnmountEventSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_focus_event'),
      // image：图标 / 图片资源
      title: $r('app.string.focus_event'),
      // title：文本内容
      url: 'pages/universal/events/focusEventSample/FocusEventSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_key_press'),
      // image：图标 / 图片资源
      title: $r('app.string.keyPress_event'),
      // title：文本内容
      url: 'pages/universal/events/keyPressEventSample/KeyPressEventSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_mouse_event'),
      // image：图标 / 图片资源
      title: $r('app.string.mouse_event'),
      // title：文本内容
      url: 'pages/universal/events/mouseEventSample/MouseEventSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_scroll_event'),
      // image：图标 / 图片资源
      title: $r('app.string.scroll_event'),
      // title：文本内容
      url: 'pages/universal/events/scrollEventSample/ScrollEventSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_gallery_free'),
      // image：图标 / 图片资源
      title: $r('app.string.custom_event'),
      // title：文本内容
      url: 'pages/universal/events/customEventSample/CustomEventHome'
      // url：资源地址
    }
  ];

const GESTURE: ThirdLevelCategory[] =
  [
    {
      image: $r('app.media.ic_click_event'),
      // image：图标 / 图片资源
      title: $r('app.string.bind_gesture_methods'),
      // title：文本内容
      url: 'pages/universal/gesture/bindGestureSample/BindGestureSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_basic_gestures'),
      // image：图标 / 图片资源
      title: $r('app.string.basic_gestures'),
      // title：文本内容
      childNodes: [
        {
          title: $r('app.string.tap_gesture'),
          // title：文本内容
          url: 'pages/universal/gesture/tapGestureSample/TapGestureSample'
          // url：资源地址
        },
        {
          title: $r('app.string.long_press_gesture'),
          // title：文本内容
          url: 'pages/universal/gesture/longPressSample/LongPressSample'
          // url：资源地址
        },
        {
          title: $r('app.string.pan_gesture'),
          // title：文本内容
          url: 'pages/universal/gesture/panSample/PanSample'
          // url：资源地址
        },
        {
          title: $r('app.string.pinch_gesture'),
          // title：文本内容
          url: 'pages/universal/gesture/pinchSample/PinchSample'
          // url：资源地址
        },
        {
          title: $r('app.string.rotation_gesture'),
          // title：文本内容
          url: 'pages/universal/gesture/rotationSample/RotationSample'
          // url：资源地址
        },
        {
          title: $r('app.string.swipe_gesture'),
          // title：文本内容
          url: 'pages/universal/gesture/swipeSample/SwipeSample'
          // url：资源地址
        }
      ]
    },
    {
      image: $r('app.media.ic_combined_gestures'),
      // image：图标 / 图片资源
      title: $r('app.string.combined_gestures'),
      // title：文本内容
      url: 'pages/universal/gesture/combinedSample/CombinedSample'
      // url：资源地址
    },
    {
      image: $r('app.media.ic_customGesture'),
      // image：图标 / 图片资源
      title: $r('app.string.custom_gesture'),
      // title：文本内容
      url: 'pages/universal/gesture/customGesture/CustomGestureJudge'
      // url：资源地址
    }
  ];

// Generic categorical data, second menu data
export const UNIVERSAL_CATEGORIES: SecondLevelCategory[] =
  [
    { title: $r('app.string.common_events'), childNodes: COMMON_EVENTS },
    { title: $r('app.string.common_properties'), childNodes: GRAPHIC_TRANSFORMATION },
    { title: $r('app.string.gesture_process'), childNodes: GESTURE }
  ];

// univesal/properties/DisplaySample
export let locationTypes: ResourceObjectType[] =
  [
    { value: $r('app.string.components_display_center') },
    { value: $r('app.string.components_display_topstart') },
    { value: $r('app.string.components_display_topend') },
    { value: $r('app.string.components_display_top') },
    { value: $r('app.string.components_display_start') },
    { value: $r('app.string.components_display_end') },
    { value: $r('app.string.components_display_bottomstart') },
    { value: $r('app.string.components_display_bottom') },
    { value: $r('app.string.components_display_bottomend') }
  ];

export let visibileTypes: ResourceObjectType[] =
  [
    { value: $r('app.string.components_display_visible') },
    { value: $r('app.string.components_display_hidden') },
    { value: $r('app.string.components_display_none') },
  ];

// univesal/properties/InteractionSample
export let placementsNameData = ['TopLeft', 'Top', 'TopRight', 'RightTop', 'Right', 'RightBottom', 'LeftTop', 'Left', 'LeftBottom', 'BottomLeft', 'Bottom', 'BottomRight'];

export let hitTestModeNameData = ['Default', 'Block', 'Transparent', 'None'];

export let hoverEffectNameData = ['None', 'Highlight', 'Auto', 'Scale'];

export let pointerStyleNameData: PointerStyleName[] = [
  { key: 'DEFAULT', value: pointer.PointerStyle.DEFAULT },
  { key: 'EAST', value: pointer.PointerStyle.EAST },
  { key: 'WEST', value: pointer.PointerStyle.WEST },
  { key: 'SOUTH', value: pointer.PointerStyle.SOUTH },
  { key: 'NORTH', value: pointer.PointerStyle.NORTH },
  { key: 'WEST_EAST', value: pointer.PointerStyle.WEST_EAST },
  { key: 'NORTH_SOUTH', value: pointer.PointerStyle.NORTH_SOUTH },
  { key: 'NORTH_EAST', value: pointer.PointerStyle.NORTH_EAST },
  { key: 'NORTH_WEST', value: pointer.PointerStyle.NORTH_WEST },
  { key: 'SOUTH_EAST', value: pointer.PointerStyle.SOUTH_EAST },
  { key: 'SOUTH_WEST', value: pointer.PointerStyle.SOUTH_WEST },
  { key: 'NORTH_EAST_SOUTH_WEST', value: pointer.PointerStyle.NORTH_EAST_SOUTH_WEST },
  { key: 'NORTH_WEST_SOUTH_EAST', value: pointer.PointerStyle.NORTH_WEST_SOUTH_EAST },
  { key: 'CROSS', value: pointer.PointerStyle.CROSS },
  { key: 'CURSOR_COPY', value: pointer.PointerStyle.CURSOR_COPY },
  { key: 'CURSOR_FORBID', value: pointer.PointerStyle.CURSOR_FORBID },
  { key: 'COLOR_SUCKER', value: pointer.PointerStyle.COLOR_SUCKER },
  { key: 'HAND_GRABBING', value: pointer.PointerStyle.HAND_GRABBING },
  { key: 'HAND_OPEN', value: pointer.PointerStyle.HAND_OPEN },
  { key: 'HAND_POINTING', value: pointer.PointerStyle.HAND_POINTING },
  { key: 'HELP', value: pointer.PointerStyle.HELP },
  { key: 'MOVE', value: pointer.PointerStyle.MOVE },
  { key: 'RESIZE_LEFT_RIGHT', value: pointer.PointerStyle.RESIZE_LEFT_RIGHT },
  { key: 'RESIZE_UP_DOWN', value: pointer.PointerStyle.RESIZE_UP_DOWN },
  { key: 'SCREENSHOT_CHOOSE', value: pointer.PointerStyle.SCREENSHOT_CHOOSE },
  { key: 'SCREENSHOT_CURSOR', value: pointer.PointerStyle.SCREENSHOT_CURSOR },
  { key: 'TEXT_CURSOR', value: pointer.PointerStyle.TEXT_CURSOR },
  { key: 'ZOOM_IN', value: pointer.PointerStyle.ZOOM_IN },
  { key: 'ZOOM_OUT', value: pointer.PointerStyle.ZOOM_OUT },
  { key: 'MIDDLE_BTN_EAST', value: pointer.PointerStyle.MIDDLE_BTN_EAST },
  { key: 'MIDDLE_BTN_WEST', value: pointer.PointerStyle.MIDDLE_BTN_WEST },
  { key: 'MIDDLE_BTN_SOUTH', value: pointer.PointerStyle.MIDDLE_BTN_SOUTH },
  { key: 'MIDDLE_BTN_NORTH', value: pointer.PointerStyle.MIDDLE_BTN_NORTH },
  { key: 'MIDDLE_BTN_NORTH_SOUTH', value: pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH },
  { key: 'MIDDLE_BTN_NORTH_EAST', value: pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST },
  { key: 'MIDDLE_BTN_NORTH_WEST', value: pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST },
  { key: 'MIDDLE_BTN_SOUTH_EAST', value: pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST },
  { key: 'MIDDLE_BTN_SOUTH_WEST', value: pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST },
  { key: 'MIDDLE_BTN_NORTH_SOUTH_WEST_EAST', value: pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST }
];

export let selectImageSizeData: Resource[] = [$r('app.string.background_image_size_cover'), $r('app.string.background_image_size_contain')];

export let selectImageAlignmentData: Resource[] = [$r('app.string.background_image_position_top_start'), $r('app.string.background_image_position_top'), $r('app.string.background_image_position_top_end'), $r('app.string.background_image_position_start'), $r('app.string.background_image_position_center'), $r('app.string.background_image_position_end'), $r('app.string.background_image_position_bottom_start'), $r('app.string.background_image_position_bottom'), $r('app.string.background_image_position_bottom_end')];

export let selectBlurStyleColorModeData: Resource[] = [$r('app.string.blur_style_system'), $r('app.string.blur_style_light'), $r('app.string.blur_style_dark')];

export let selectBlurStyleAdaptiveColorData: Resource[] = [$r('app.string.blur_style_default'), $r('app.string.blur_style_average')];

export let selectShadowTypeData: Resource[] = [$r('app.string.shadow_type_color'), $r('app.string.shadow_type_blur')];
