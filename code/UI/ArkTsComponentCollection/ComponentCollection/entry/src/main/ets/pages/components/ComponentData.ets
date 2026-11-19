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
 * @file entry/src/main/ets/pages/components/ComponentData.ets
 * 文件职责：ComponentData 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：（无顶层声明）。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ThirdLevelCategory } from '../../model/CategoricalDataType'

const AUXILIARY: ThirdLevelCategory =
  {
    image: $r('app.media.ic_auxiliary'),
    // image：图标 / 图片资源
    title: $r('app.string.auxiliary'),
    // title：文本内容
    childNodes: [
      {
        title: $r('app.string.auxiliary_badge'),
        // title：文本内容
        url: 'pages/components/auxiliary/badgeSample/BadgeSample'
        // url：资源地址
      },
      {
        title: $r('app.string.scroll_bar'),
        // title：文本内容
        url: 'pages/components/auxiliary/scrollbarSample/ScrollBarSample'
        // url：资源地址
      },
      {
        title: $r('app.string.auxiliary_refresh'),
        // title：文本内容
        url: 'pages/components/auxiliary/refreshSample/RefreshSample'
        // url：资源地址
      },
      {
        title: $r('app.string.auxiliary_panel'),
        // title：文本内容
        url: 'pages/components/auxiliary/panelSample/PanelSample'
        // url：资源地址
      },
      {
        title: $r('app.string.auxiliary_alphabetIndexer'),
        // title：文本内容
        url: 'pages/components/auxiliary/alphabetIndexerSample/AlphabetIndexerSample'
        // url：资源地址
      }
    ]
  }

const CANVAS: ThirdLevelCategory =
  {
    image: $r('app.media.ic_pen'),
    // image：图标 / 图片资源
    title: $r('app.string.canvas_components'),
    // title：文本内容
    childNodes: [
      {
        title: $r('app.string.canvas_component_attributes'),
        // title：文本内容
        url: 'pages/components/canvas/attributesSample/AttributesSample'
        // url：资源地址
      },
      {
        title: $r('app.string.canvas_component_method'),
        // title：文本内容
        url: 'pages/components/canvas/methodsSample/MethodsSample',
        // url：资源地址
      },
      {
        title: $r('app.string.canvas_component_shadow'),
        // title：文本内容
        url: 'pages/components/canvas/shadowsSample/ShadowsSample',
        // url：资源地址
      },
      {
        title: $r('app.string.canvas_component_transform'),
        // title：文本内容
        url: 'pages/components/canvas/transformSample/TransformSample',
        // url：资源地址
      },
      {
        title: $r('app.string.canvas_component_gradient'),
        // title：文本内容
        url: 'pages/components/canvas/gradientSample/GradientSample',
        // url：资源地址
      },
      {
        title: $r('app.string.canvas_component_path_2d'),
        // title：文本内容
        url: 'pages/components/canvas/path2dSample/Path2dSample',
        // url：资源地址
      },
      {
        title: $r('app.string.canvas_component_image_bitmap'),
        // title：文本内容
        url: 'pages/components/canvas/imageBitmapSample/ImageBitmapSample',
        // url：资源地址
      }
    ]
  }

const BUTTON_AND_SELECTION: ThirdLevelCategory =
  {
    image: $r('app.media.ic_button_and_selection'),
    // image：图标 / 图片资源
    title: $r('app.string.button_and_selection'),
    // title：文本内容
    childNodes: [
      {
        title: $r('app.string.button_title'),
        // title：文本内容
        url: 'pages/components/buttonAndSelection/buttonSample/ButtonSample'
        // url：资源地址
      },
      {
        title: $r('app.string.date_picker_title'),
        // title：文本内容
        url: 'pages/components/buttonAndSelection/datePickerSample/DatePickerSample'
        // url：资源地址
      },
      {
        title: $r('app.string.radio_title'),
        // title：文本内容
        url: 'pages/components/buttonAndSelection/radioSample/RadioSample'
        // url：资源地址
      },
      {
        title: $r('app.string.select_title'),
        // title：文本内容
        url: 'pages/components/buttonAndSelection/selectSample/SelectSample'
        // url：资源地址
      },
      {
        title: $r('app.string.slider_title'),
        // title：文本内容
        url: 'pages/components/buttonAndSelection/sliderSample/SliderSample'
        // url：资源地址
      },
      {
        title: $r('app.string.toggle_title'),
        // title：文本内容
        url: 'pages/components/buttonAndSelection/toggleSample/ToggleSample'
        // url：资源地址
      },
      {
        title: $r('app.string.checkbox_checkboxgroup'),
        // title：文本内容
        url: 'pages/components/buttonAndSelection/checkboxSample/CheckboxSample'
        // url：资源地址
      },
      {
        title: $r('app.string.text_picker'),
        // title：文本内容
        url: 'pages/components/buttonAndSelection/textPickerSample/TextPickerSample'
        // url：资源地址
      },
      {
        title: $r('app.string.time_picker'),
        // title：文本内容
        url: 'pages/components/buttonAndSelection/timePickerSample/TimePickerSample'
        // url：资源地址
      },
      {
        title: $r('app.string.counter_name'),
        // title：文本内容
        url: 'pages/components/buttonAndSelection/counterSample/CounterSample'
        // url：资源地址
      },
      {
        title: $r('app.string.rating_name'),
        // title：文本内容
        url: 'pages/components/buttonAndSelection/ratingSample/RatingSample'
        // url：资源地址
      }
    ]
  }

const BLANK_AND_DIVIDER: ThirdLevelCategory =
  {
    image: $r('app.media.ic_blank_and_divider'),
    // image：图标 / 图片资源
    title: $r('app.string.blank_and_divider'),
    // title：文本内容
    childNodes: [
      {
        title: $r('app.string.divider_title'),
        // title：文本内容
        url: 'pages/components/blankAndDivider/dividerSample/DividerSample'
        // url：资源地址
      }
    ]
  }

const INFORMATION_PRESENTATION_AND_DYNAMIC_EFFECTS: ThirdLevelCategory =
  {
    image: $r('app.media.ic_information_presentation_and_dynamic_effects'),
    // image：图标 / 图片资源
    title: $r('app.string.information_presentation_and_dynamic_effects'),
    // title：文本内容
    childNodes: [
      {
        title: $r('app.string.qrcode_title'),
        // title：文本内容
        url: 'pages/components/informationPresentationAndDynamicEffects/qrCodeSample/QRCodeSample'
        // url：资源地址
      }, 
      {
        title: $r('app.string.loading_progress'),
        // title：文本内容
        url: 'pages/components/informationPresentationAndDynamicEffects/loadingProgressSample/LoadingProgressSample'
        // url：资源地址
      },
      {
        title: $r('app.string.marquee_name'),
        // title：文本内容
        url: 'pages/components/informationPresentationAndDynamicEffects/marqueeSample/MarqueeSample'
        // url：资源地址
      },
      {
        title: $r('app.string.text_timer'),
        // title：文本内容
        url: 'pages/components/informationPresentationAndDynamicEffects/textTimerSample/TextTimerSample'
        // url：资源地址
      },
      {
        title: $r('app.string.text_clock'),
        // title：文本内容
        url: 'pages/components/informationPresentationAndDynamicEffects/textclockSample/TextClockSample'
        // url：资源地址
      },
      {
        title: $r('app.string.progress_name'),
        // title：文本内容
        url: 'pages/components/informationPresentationAndDynamicEffects/progressSample/ProgressSample'
        // url：资源地址
      },
      {
        title: $r('app.string.gauge_name'),
        // title：文本内容
        url: 'pages/components/informationPresentationAndDynamicEffects/gaugeSample/GaugeSample'
        // url：资源地址
      },
      {
        title: $r('app.string.data_panel'),
        // title：文本内容
        url: 'pages/components/informationPresentationAndDynamicEffects/dataPanelSample/DataPanelSample'
        // url：资源地址
      },
      {
        title: $r('app.string.scroll_To_effect'),
        // title：文本内容
        url: "pages/components/informationPresentationAndDynamicEffects/scrollToSample/ScrollToSample"
        // url：资源地址
      },
      {
        title: $r('app.string.tabs_switch_effect'),
        // title：文本内容
        url: "pages/components/informationPresentationAndDynamicEffects/tapsSwitchSample/TapsSwitchSample"
        // url：资源地址
      },
      {
        title: $r('app.string.image_fit_Full_effect'),
        // title：文本内容
        url: "pages/components/informationPresentationAndDynamicEffects/imageFitFullSample/ImageFitFullSample"
        // url：资源地址
      },
      {
        title: $r('app.string.particle_effect'),
        // title：文本内容
        url: "pages/components/informationPresentationAndDynamicEffects/particleSample/ParticleSample"
        // url：资源地址
      },
      {
        title: $r('app.string.list'),
        // title：文本内容
        url: 'pages/components/informationPresentationAndDynamicEffects/listSample/ListSample'
        // url：资源地址
      }
    ]
  }

const TEXT_AND_INPUT: ThirdLevelCategory =
  {
    image: $r('app.media.ic_text_and_input'),
    // image：图标 / 图片资源
    title: $r('app.string.text_and_input'),
    // title：文本内容
    childNodes: [
      {
        title: $r('app.string.image_span_title'),
        // title：文本内容
        url: 'pages/components/textAndInput/imageSpanSample/ImageSpanSample'
        // url：资源地址
      },
      {
        title: $r('app.string.span_title'),
        // title：文本内容
        url: 'pages/components/textAndInput/spanSample/SpanSample'
        // url：资源地址
      },
      {
        title: $r('app.string.text_input_title'),
        // title：文本内容
        url: 'pages/components/textAndInput/textInputSample/TextInputSample',
        // url：资源地址
      },
      {
        title: $r('app.string.text_title'),
        // title：文本内容
        url: 'pages/components/textAndInput/textSample/TextSample'
        // url：资源地址
      },
      {
        title: $r('app.string.text_styled_string_title'),
        // title：文本内容
        url: 'pages/components/textAndInput/textStyledStringSample/TextStyledStringSample',
        // url：资源地址
      },
      {
        title: $r('app.string.rich_text'),
        // title：文本内容
        url: 'pages/components/textAndInput/richTextSample/RichTextSample'
        // url：资源地址
      },{
        title: $r('app.string.rich_editor'),
        // title：文本内容
        url: 'pages/components/textAndInput/richEditorSample/RichEditorSample'
        // url：资源地址
      }, {
        title: $r('app.string.textarea_title'),
        // title：文本内容
        url: 'pages/components/textAndInput/textAreaSample/TextAreaSample'
        // url：资源地址
    },{
        title: $r('app.string.patternlock_title'),
        // title：文本内容
        url: 'pages/components/textAndInput/patternLockSample/PattternLockSample'
        // url：资源地址
    },{
        title: $r('app.string.search_title'),
        // title：文本内容
        url: 'pages/components/textAndInput/searchSample/SearchSample'
        // url：资源地址
    }
    ]
  }

const SCOLL_SWIPE: ThirdLevelCategory =
  {
    image: $r('app.media.ic_blank_and_divider'),
    // image：图标 / 图片资源
    title: $r('app.string.scroll_swiper'),
    // title：文本内容
    childNodes: [
      {
        title: $r('app.string.scroll_name'),
        // title：文本内容
        url: 'pages/components/scrollAndSwipe/scrollSample/ScrollSample'
        // url：资源地址
      },
      {
        title: $r('app.string.swiper_name'),
        // title：文本内容
        url: 'pages/components/scrollAndSwipe/swiperSample/SwiperSample'
        // url：资源地址
      }
    ]
  }

const ROWS_AND_COLUMNS: ThirdLevelCategory =
  {
    image: $r('app.media.ic_rows_and_columns'),
    // image：图标 / 图片资源
    title: $r('app.string.rows_and_columns'),
    // title：文本内容
    childNodes: [
      {
        title: $r('app.string.row_title'),
        // title：文本内容
        url: 'pages/components/rowsAndColumns/rowSample/RowSample'
        // url：资源地址
      },
      {
        title: $r('app.string.rowsplit_title'),
        // title：文本内容
        url: 'pages/components/rowsAndColumns/rowSplitSample/RowSplitSample'
        // url：资源地址
      },
      {
        title: $r('app.string.column_title'),
        // title：文本内容
        url: 'pages/components/rowsAndColumns/columnSample/ColumnSample'
        // url：资源地址
      },
      {
        title: $r('app.string.columnsplit_title'),
        // title：文本内容
        url: 'pages/components/rowsAndColumns/columnSplitSample/ColumnSplitSample'
        // url：资源地址
      },
      {
        title: $r('app.string.sidebarcontainer_title'),
        // title：文本内容
        url: 'pages/components/rowsAndColumns/sideBarContainerSample/SideBarContainerSample'
        // url：资源地址
      }
    ]
  }

const STACK_FLEX_AND_GRID: ThirdLevelCategory =
  {
    image: $r('app.media.ic_stack_flex_and_grid'),
    // image：图标 / 图片资源
    title: $r('app.string.stack_flex_and_grid'),
    // title：文本内容
    childNodes: [
      {
        title: $r('app.string.stack_title'),
        // title：文本内容
        url: 'pages/components/stackFlexAndGrid/stackSample/StackSample'
        // url：资源地址
      },
      {
        title: $r('app.string.flex_title'),
        // title：文本内容
        url: 'pages/components/stackFlexAndGrid/flexSample/FlexSample'
        // url：资源地址
      },
      {
        title: $r('app.string.gridcontainer_title'),
        // title：文本内容
        url:'pages/components/stackFlexAndGrid/gridContainerSample/GridContainerSample'
        // url：资源地址
      }
    ]
  }

const LIST_AND_GRID: ThirdLevelCategory =
  {
    image: $r('app.media.ic_list_and_grid'),
    // image：图标 / 图片资源
    title: $r('app.string.list_and_grid'),
    // title：文本内容
    childNodes: [
      {
        title : $r('app.string.list_title'),
        // title：文本内容
        url : 'pages/components/listAndGrid/listSample/ListSample'
        // url：资源地址
      },
      {
        title: $r('app.string.list_item_title'),
        // title：文本内容
        url: 'pages/components/listAndGrid/listItemSample/ListItemSample'
        // url：资源地址
      },
      {
        title: $r('app.string.grid_title'),
        // title：文本内容
        url : 'pages/components/listAndGrid/gridSample/GridSample'
        // url：资源地址
      },
      {
        title: $r('app.string.grid_item_title'),
        // title：文本内容
        url: 'pages/components/listAndGrid/gridItemSample/GridItemSample'
        // url：资源地址
      },
      {
        title: $r('app.string.water_flow_title'),
        // title：文本内容
        url: 'pages/components/listAndGrid/waterFlowSample/WaterFlowSample'
        // url：资源地址
      }
    ]
  }

const NAVIGATION: ThirdLevelCategory =
  {
    image: $r('app.media.ic_navigation'),
    // image：图标 / 图片资源
    title: $r('app.string.navigation'),
    // title：文本内容
    childNodes : [
      {
        title: $r('app.string.navigation_title'),
        // title：文本内容
        url: 'pages/components/navigation/navigationSample/NavigationSample'
        // url：资源地址
      },
      {
        title: $r('app.string.navigator_title'),
        // title：文本内容
        url: 'pages/components/navigation/navigatorSample/NavigatorSample'
        // url：资源地址
      },
      {
        title: $r('app.string.tabs_title'),
        // title：文本内容
        url : "pages/components/navigation/tabSample/TabSample"
        // url：资源地址
      },
      {
        title: $r('app.string.tab_content_title'),
        // title：文本内容
        url: 'pages/components/navigation/tabContentSample/TabContentSample'
        // url：资源地址
      },
      {
        title: $r('app.string.stepper_title'),
        // title：文本内容
        url: "pages/components/navigation/stepperAndStepperItemSample/StepperAndStepperItemSample"
        // url：资源地址
      },
      {
        title: $r('app.string.navRouter_title'),
        // title：文本内容
        url: 'pages/components/navigation/navRouterSample/NavRouterSample'
        // url：资源地址
      }
    ]
  }

const CANVAS_AND_GRAPHIC_DRAWING: ThirdLevelCategory =
  {
    image: $r('app.media.ic_canvas_and_graphic_drawing'),
    // image：图标 / 图片资源
    title: $r('app.string.canvas_and_graphic_drawing'),
    // title：文本内容
    childNodes : [
      {
        title:$r('app.string.canvas_title'),
        // title：文本内容
        url:'pages/components/canvasAndGraphicDrawing/canvasSample/CanvasSample'
        // url：资源地址
      },
      {
        title:$r('app.string.circle_title'),
        // title：文本内容
        url:'pages/components/canvasAndGraphicDrawing/circleSample/CircleSample'
        // url：资源地址
      },
      {
        title:$r('app.string.ellipse_title'),
        // title：文本内容
        url:'pages/components/canvasAndGraphicDrawing/ellipseSample/EllipseSample'
        // url：资源地址
      },
      {
        title:$r('app.string.line_title'),
        // title：文本内容
        url:'pages/components/canvasAndGraphicDrawing/lineSample/LineSample'
        // url：资源地址
      },
      {
        title:$r('app.string.path_title'),
        // title：文本内容
        url:'pages/components/canvasAndGraphicDrawing/pathSample/PathSample'
        // url：资源地址
      },
      {
        title:$r('app.string.polygon_title'),
        // title：文本内容
        url:'pages/components/canvasAndGraphicDrawing/polygonSample/PolygonSample'
        // url：资源地址
      },
      {
        title:$r('app.string.polyline_title'),
        // title：文本内容
        url:'pages/components/canvasAndGraphicDrawing/polylineSample/PolylineSample'
        // url：资源地址
      },
      {
        title:$r('app.string.rect_title'),
        // title：文本内容
        url:'pages/components/canvasAndGraphicDrawing/rectSample/RectSample'
        // url：资源地址
      },
      {
        title:$r('app.string.shape_title'),
        // title：文本内容
        url:'pages/components/canvasAndGraphicDrawing/shapeSample/ShapeSample'
        // url：资源地址
      }
    ]
  }

const IMAGE_VIDEO_AND_MEDIA: ThirdLevelCategory =
  {
    image: $r('app.media.ic_image_video_media'),
    // image：图标 / 图片资源
    title: $r('app.string.image_video_and_media'),
    // title：文本内容
    childNodes:[
      {
        title: $r('app.string.image_title'),
        // title：文本内容
        url: 'pages/components/imageVideoAndMedia/imageSample/ImageSample'
        // url：资源地址
      },
      {
        title: $r('app.string.image_animator_title'),
        // title：文本内容
        url: 'pages/components/imageVideoAndMedia/imageAnimatorSample/ImageAnimatorSample'
        // url：资源地址
      },
      {
        title: $r('app.string.video_title'),
        // title：文本内容
        url: 'pages/components/imageVideoAndMedia/videoSample/VideoSample'
        // url：资源地址
      },
      {
        title: $r('app.string.xcomponent_title'),
        // title：文本内容
        url: 'pages/components/imageVideoAndMedia/xcomponentSample/XComponentSample'
        // url：资源地址
      }
      ,{
        title: $r('app.string.plugin_component_title'),
        // title：文本内容
        url: 'pages/components/imageVideoAndMedia/pluginComponentSample/PluginComponentSample'
        // url：资源地址
      }
    ]
}

const WEB:ThirdLevelCategory =
  {
    image:$r('app.media.ic_web'),
    // image：图标 / 图片资源
    title:$r('app.string.web'),
    // title：文本内容
    childNodes:[
      {
        title:$r('app.string.web_title'),
        // title：文本内容
        url:'pages/components/web/webSample/WebSample'
        // url：资源地址
      }
    ]
  }

export const COMPONENT_CATEGORIES: ThirdLevelCategory[] =
  [
    BLANK_AND_DIVIDER,
    BUTTON_AND_SELECTION,
    SCOLL_SWIPE,
    INFORMATION_PRESENTATION_AND_DYNAMIC_EFFECTS,
    TEXT_AND_INPUT,
    AUXILIARY,
    CANVAS,
    ROWS_AND_COLUMNS,
    STACK_FLEX_AND_GRID,
    LIST_AND_GRID,
    NAVIGATION,
    CANVAS_AND_GRAPHIC_DRAWING,
    IMAGE_VIDEO_AND_MEDIA,
    WEB
  ]
// 辅助/AlphabetIndexerSampleData
export let alphabetIndexerDataB: Resource[] = [$r('app.string.alphabetindexer_bu'), $r('app.string.alphabetindexer_bai'), $r('app.string.alphabetindexer_bao'), $r('app.string.alphabetindexer_bi'), $r('app.string.alphabetindexer_bing')]

export let alphabetIndexerDataC: Resource[] = [$r('app.string.alphabetindexer_cao'), $r('app.string.alphabetindexer_cheng'), $r('app.string.alphabetindexer_chen'), $r('app.string.alphabetindexer_cui')]

export let alphabetIndexerDataL: Resource[] = [$r('app.string.alphabetindexer_liu'), $r('app.string.alphabetindexer_li'), $r('app.string.alphabetindexer_lou'), $r('app.string.alphabetindexer_liang'), $r('app.string.alphabetindexer_lei'), $r('app.string.alphabetindexer_lv'), $r('app.string.alphabetindexer_liu3'), $r('app.string.alphabetindexer_lu')]

export let letterValue: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
  'H', 'I', 'J', 'K', 'L', 'M', 'N',
  'O', 'P', 'Q', 'R', 'S', 'T', 'U',
  'V', 'W', 'X', 'Y', 'Z']
// 辅助&按钮与选择/panel&textPickerArrayData
export let fruitArray: Resource[] = [$r('app.string.checkbox_apple'), $r('app.string.checkbox_banbana'), $r('app.string.checkbox_cherries'), $r('app.string.checkbox_durian')]

// 信息展示与动效/dataPanelSample
export let panelData: number[] = [10, 10, 30, 10, 10, 20]
// 文本与输入/spanSelectData
export let selectData: Resource[] = [$r('app.string.span_decoration_none'), $r('app.string.span_decoration_linethrough'), $r('app.string.span_decoration_underline'), $r('app.string.span_decoration_overline')]
// 三级类别 Scroll 通用 left padding
export const LEFT_PADDING: number = 16
// 三级类别 Scroll 通用 right padding
export const RIGHT_PADDING: number = 16
// 行列与分栏/rowAlignItemsData
export const ROW_ALIGNITEMS_DATA: Resource[] = [$r('app.string.row_alignitems_top'), $r('app.string.row_alignitems_center'), $r('app.string.row_alignitems_bottom')]
// 行列与分栏/rowJustifyContentData
export const ROW_JUSTIFYCONTENT_DATA: Resource[] = [$r('app.string.row_justifycontent_start'), $r('app.string.row_justifycontent_center'), $r('app.string.row_justifycontent_end'),
$r('app.string.row_justifycontent_spacebetween'), $r('app.string.row_justifycontent_spacearound'), $r('app.string.row_justifycontent_spaceevenly')]
// 行列与分栏/columnAlignItemsData
export const COLUMN_ALIGNITEMS_DATA: Resource[] = [$r('app.string.column_alignitems_start'), $r('app.string.column_alignitems_center'), $r('app.string.column_alignitems_end')]
// 行列与分栏/columnJustifyContentData
export const COLUMN_JUSTIFYCONTENT_DATA: Resource[] = [$r('app.string.column_justifycontent_start'), $r('app.string.column_justifycontent_center'), $r('app.string.column_justifycontent_end'),
$r('app.string.column_justifycontent_spacebetween'), $r('app.string.column_justifycontent_spacearound'), $r('app.string.column_justifycontent_spaceevenly')]
// 行列与分栏/sidebarContainerTypeData
export const SBC_TYPE_DATA: Resource[] = [$r('app.string.sidebarcontainer_type_embed'), $r('app.string.sidebarcontainer_type_overlay')]
// 行列与分栏/sidebarContainerPositionData
export const SBC_POSITION_DATA: Resource[] = [$r('app.string.sidebarcontainer_sidebar_show_position_start'), $r('app.string.sidebarcontainer_sidebar_show_position_end')]
// 堆叠、Flex与栅格/stackArgsSelectData
export const STACK_ARGUMENTS_SELECT_DATA: Resource[] = [$r('app.string.stack_alignments_topstart'),$r('app.string.stack_alignments_top'),
$r('app.string.stack_alignments_topend'),$r('app.string.stack_alignments_start'),$r('app.string.stack_alignment_center'),$r('app.string.stack_alignment_end'),
$r('app.string.stack_alignments_bottomstart'),$r('app.string.stack_alignments_bottom'),$r('app.string.stack_alignments_bottomend')]
// 堆叠、Flex与栅格/stackZIndexSelectData
export const STACK_ZIND_SELECT_DATA: Resource[] = [$r('app.string.stack_zindex_four'),$r('app.string.stack_zindex_one')]
// 堆叠、Flex与栅格/flexDirectionSelectData
export const FLEX_DIRECTION_SELECT_DATA: Resource[] = [$r('app.string.flex_argument_direction_row'),$r('app.string.flex_argument_direction_row_reverse'),
$r('app.string.flex_argument_direction_column'),$r('app.string.flex_argument_direction_column_reverse')]
// 堆叠、Flex与栅格/flexWrapSelectData
export const FLEX_WRAP_SELECT_DATA : Resource[] = [$r('app.string.flex_argument_wrap_no_wrap'),$r('app.string.flex_argument_wrap_wrap'),$r('app.string.flex_argument_wrap_wrap_reverse')]
// 堆叠、Flex与栅格/flexJustifyContentSelectData
export const FLEX_JUSTIFY_CONTENT_SELECT_DATA : Resource[] = [$r('app.string.flex_argument_justifycontent_start'),$r('app.string.flex_argument_justifycontent_center'),$r('app.string.flex_argument_justifycontent_End'),
$r('app.string.flex_argument_justifycontent_space_between'),$r('app.string.flex_argument_justifycontent_space_around'),$r('app.string.flex_argument_justifycontent_speac_evenly')]
// 堆叠、Flex与栅格/flexAlignItemsSelectData
export const FLEX_ALIGN_ITEMS_SELECT_DATA : Resource[] = [$r('app.string.flex_argumen_alignItems_auto'),$r('app.string.flex_argumen_alignItems_start'),$r('app.string.flex_argumen_alignItems_center'),
$r('app.string.flex_argumen_alignItems_end'),$r('app.string.flex_argumen_alignItems_stretch'),$r('app.string.flex_argumen_alignItems_baseline')]
// 堆叠、Flex与栅格/gridContainerSizeTypeSelectData
export const GRIDCONTAIER_SIZE_TYPE_SELECT_DATA : Resource[] = [$r('app.string.gridcontainer_sizetype_xs'),$r('app.string.gridcontainer_sizetype_sm'),$r('app.string.gridcontainer_sizetype_md'),$r('app.string.gridcontainer_sizetype_lg'),$r('app.string.gridcontainer_sizetype_auto'),]
//图片、视频与媒体/imageSelectObjectFit
export const OBJECT_FIT_SELECT: Resource[] = [$r('app.string.object_fit_none'),$r('app.string.object_fit_cover'),$r('app.string.object_fit_contain'),$r('app.string.object_fit_fill'),$r('app.string.object_fit_scale_down'),$r('app.string.object_fit_auto')]
//图片、视频与媒体/imageSelectRenderMode
export const RENDER_MODE_SELECT: Resource[] = [$r('app.string.image_rendermode_original'),$r('app.string.image_rendermode_template')]
//图片、视频与媒体/imageSelectRepeat
export const REPEAT_SELECT: Resource[] = [$r('app.string.image_repeat_no'),$r('app.string.image_repeat_x'),$r('app.string.image_repeat_y'),$r('app.string.image_repeat_xy')]
// 图片、视频与媒体/videoSelectCurrentRate
export const CURRENT_RATE: string[] = ['0.75X','1X','1.25X','1.75X','2X']
// 列表与宫格/listDirectionSelectData
export const LIST_DIRECTION_SELECT_DATA : Resource[] = [$r('app.string.list_properties_direction_vertical'),$r('app.string.list_properties_direction_Horizontal')]
// 列表与宫格/listScrollBarSelectData
export const LIST_SCROLLBAR_SELECT_DATA : Resource[] = [$r('app.string.list_properties_scroll_bar_off'),$r('app.string.list_properties_scroll_bar_on'),$r('app.string.list_properties_scroll_bar_auto')]
// 列表与宫格/listEdgeEffectSelectData
export const LIST_EDGE_EFFECT_SELECT_DATA : Resource[] = [$r('app.string.list_properties_edge_effect_spring'),$r('app.string.list_properties_edge_effect_fade'),$r('app.string.list_properties_edge_effect_none')]
// 列表与宫格/listAlignListItemSelectData
export const LIST_ALIGN_LIST_ITEM_SELECT_DATA : Resource[] =[$r('app.string.list_properties_align_list_item_start'),$r('app.string.list_properties_align_list_item_Center'),$r('app.string.list_properties_align_list_item_End')]
// 列表与宫格/gridLayoutDirectionSelectData
export const GRID_LAYOUT_DIRECTION_SELECT : Resource[] =[$r('app.string.grid_properties_layout_direction_row'),$r('app.string.grid_properties_layout_direction_column')
  ,$r('app.string.grid_properties_layout_direction_row_reverse'),$r('app.string.grid_properties_layout_direction_column_reverse')]
// 导航/tabsBarPositionSelectData
export const TABS_BAR_POSITION_SELECT : Resource[] = [$r('app.string.tabs_arguments_bar_position_start'),$r('app.string.tabs_arguments_bar_position_end')]
// 导航/tabsBarModeSelectData
export const TABS_BAR_MODE_SELECT : Resource[] = [$r('app.string.tabs_properties_bar_mode_fixed'),$r('app.string.tabs_properties_bar_scrollable')]
//画布与图形绘制/PathSelectCommands
export const PATH_SELECT_COMMANDS: Resource[] = [$r('app.string.path_line'),$r('app.string.path_triangle'),$r('app.string.path_square'),$r('app.string.path_polygon')
  ,$r('app.string.path_camber_first'),$r('app.string.path_camber_second'),$r('app.string.path_camber_third')]
// 列表与宫格/waterFlowScrollEdgeSelectData
export const WATER_FLOW_SCROLL_EDGE_SELECT_DATA : Resource[] = [$r('app.string.water_flow_controller_top'),$r('app.string.water_flow_controller_bottom')]
// 列表与宫格/waterFlowEdgeEffectSelectData
export const WATER_FLOW_EDGE_EFFECT_SELECT_DATA : Resource[] = [$r('app.string.water_flow_properties_edge_effect_spring'),$r('app.string.water_flow_properties_edge_effect_fade'),$r('app.string.water_flow_properties_edge_effect_none')]
