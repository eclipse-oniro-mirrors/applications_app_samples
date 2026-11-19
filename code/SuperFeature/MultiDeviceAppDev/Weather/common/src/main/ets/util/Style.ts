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

export class Style {
  /**
   * Grid item card height.
   */
  static readonly CARD_HEIGHT: number = 192

  /**
   * List item weather width.
   */
  static readonly WEATHER_ITEM_WIDTH: number = 80

  /**
   * normal padding.
   */
  static readonly NORMAL_PADDING: number = 14

  /**
   * normal margin.
   */
  static readonly NORMAL_MARGIN: number = 14

  /**
   * normal space.
   */
  static readonly NORMAL_SPACE: number = 12

  /**
   * grid gutter
   */
  static readonly GRID_GUTTER: number = 12

  /**
   * normal radius.
   */
  static readonly NORMAL_RADIUS: number = 16

  /**
   * normal radius.
   */
  static readonly CITY_TEXT_RADIUS: number = 18

  /**
   * normal margin.
   */
  static readonly ADD_CITY_BOTTOM: number = 6

  /**
   * normal margin.
   */
  static readonly ADD_CITY_BOTTOM_LG: number = 28

  /**
   * card background color.
   * 取值与资源 app.color.tag_background 一致，对外保持字符串形式以维持现有接口约定。
   */
  static readonly CARD_BACKGROUND_COLOR: string = '#24FFFFFF'

  /**
   * dialog padding out.
   */
  static readonly DIALOG_PADDING_OUT: number = 42

  /**
   * dialog padding.
   */
  static readonly DIALOG_PADDING: number = 24

  /**
   * weather big text weight.
   */
  static readonly BIG_FONT_WEIGHT: number = 300

  /**
   * time list height.
   */
  static readonly TIME_LIST_HEIGHT: number = 48

  /**
   * time list height.
   */
  static readonly TIME_LIST_MARGIN: number = 22

  /**
   * 标题栏高度.
   */
  static readonly TITLE_BAR_HEIGHT: number = 56

  /**
   * 侧边栏宽度占比.
   */
  static readonly SIDE_BAR_WIDTH: string = '33.3%'

  /**
   * 小图标尺寸.
   */
  static readonly ICON_SIZE_SMALL: number = 16

  /**
   * 常规图标尺寸.
   */
  static readonly ICON_SIZE_NORMAL: number = 24

  /**
   * 大图标尺寸.
   */
  static readonly ICON_SIZE_LARGE: number = 28

  /**
   * 字号：辅助说明.
   */
  static readonly FONT_SIZE_TINY: number = 10

  /**
   * 字号：次要信息.
   */
  static readonly FONT_SIZE_SMALL: number = 12

  /**
   * 字号：卡片标签.
   */
  static readonly FONT_SIZE_CAPTION: number = 13

  /**
   * 字号：正文.
   */
  static readonly FONT_SIZE_NORMAL: number = 14

  /**
   * 字号：小标题.
   */
  static readonly FONT_SIZE_MEDIUM: number = 16

  /**
   * 字号：页面副标题.
   */
  static readonly FONT_SIZE_LARGE: number = 18

  /**
   * 字号：页面标题.
   */
  static readonly FONT_SIZE_TITLE: number = 20

  /**
   * 字号：列表城市名.
   */
  static readonly FONT_SIZE_HEADLINE: number = 24

  /**
   * 字号：侧边栏标题.
   */
  static readonly FONT_SIZE_DISPLAY: number = 30

  /**
   * 字号：温度单位.
   */
  static readonly FONT_SIZE_TEMP_UNIT: number = 35

  /**
   * 字号：城市温度.
   */
  static readonly FONT_SIZE_TEMP: number = 38

  /**
   * 字号：侧边栏城市温度.
   */
  static readonly FONT_SIZE_CITY_TEMP: number = 54

  /**
   * 字号：首页主温度.
   */
  static readonly FONT_SIZE_MAIN_TEMP: number = 96

  /**
   * 大圆角.
   */
  static readonly LARGE_RADIUS: number = 24

  /**
   * 搜索框圆角.
   */
  static readonly SEARCH_RADIUS: number = 45

  /**
   * 标签圆角.
   */
  static readonly TAG_RADIUS: number = 11

  /**
   * 首页滚动淡出起始偏移量.
   */
  static readonly SCROLL_FADE_START: number = 45

  /**
   * 首页滚动淡出距离.
   */
  static readonly SCROLL_FADE_DISTANCE: number = 100

  /**
   * 首页菜单弹窗宽度.
   */
  static readonly MENU_POPUP_WIDTH: number = 160

  /**
   * 首页菜单弹窗内边距.
   */
  static readonly MENU_POPUP_PADDING: number = 15

  /**
   * 首页菜单弹窗右间距.
   */
  static readonly MENU_POPUP_RIGHT_PADDING: number = 12

  /**
   * 首页菜单分割线上下间距.
   */
  static readonly MENU_DIVIDER_MARGIN: number = 10

  /**
   * 城市卡片高度.
   */
  static readonly CITY_CARD_HEIGHT: number = 80

  /**
   * 侧边栏城市卡片高度.
   */
  static readonly CITY_SIDE_CARD_HEIGHT: number = 100

  /**
   * 城市标签高度.
   */
  static readonly CITY_CHIP_HEIGHT: number = 36

  /**
   * 热门城市网格横向间距.
   */
  static readonly HOT_CITY_GUTTER_X: number = 17

  /**
   * 热门城市网格纵向间距.
   */
  static readonly HOT_CITY_GUTTER_Y: number = 8

  /**
   * 单选按钮尺寸.
   */
  static readonly RADIO_SIZE: number = 20

  /**
   * 空气质量指标名称宽度.
   */
  static readonly AIR_INDEX_WIDTH: number = 48

  /**
   * 空气质量等级标签宽度.
   */
  static readonly AIR_TAG_WIDTH: number = 26

  /**
   * 空气质量等级标签高度.
   */
  static readonly AIR_TAG_HEIGHT: number = 16

  /**
   * 返回图标左边距.
   */
  static readonly BACK_ICON_MARGIN: number = 26

  /**
   * 标题文字左边距.
   */
  static readonly TITLE_TEXT_MARGIN: number = 25

  /**
   * 逐小时天气项额外宽度.
   */
  static readonly WEATHER_ITEM_EXTRA_WIDTH: number = 2

  /**
   * 次要内容透明度.
   */
  static readonly OPACITY_SECONDARY: number = 0.6

  /**
   * 生活指数列模板，与 8 项生活指数按 4 列 2 行排布一一对应.
   */
  static readonly LIFE_INDEX_COLUMNS: string = '1fr 1fr 1fr 1fr'

  /**
   * 生活指数行模板，与 8 项生活指数按 4 列 2 行排布一一对应.
   */
  static readonly LIFE_INDEX_ROWS: string = '1fr 1fr'

  /**
   * 分割线与描边宽度.
   */
  static readonly DIVIDER_WIDTH: number = 1

  /**
   * 逐小时天气：天气图标上间距.
   */
  static readonly HOURS_ICON_MARGIN_TOP: number = 25

  /**
   * 逐小时天气：温度与风向文字上间距.
   */
  static readonly HOURS_TEXT_MARGIN_TOP: number = 16

  /**
   * 逐小时天气：风速文字上间距.
   */
  static readonly HOURS_SPEED_MARGIN_TOP: number = 5

  /**
   * 逐小时天气：单项上下内边距.
   */
  static readonly HOURS_ITEM_PADDING: number = 18

  /**
   * 首页主温度：温度单位下间距.
   */
  static readonly TEMP_UNIT_MARGIN_BOTTOM: number = 36

  /**
   * 首页主温度：温度行上间距.
   */
  static readonly TEMP_ROW_MARGIN_TOP: number = 4

  /**
   * 首页主温度：温度行左内边距.
   */
  static readonly TEMP_ROW_PADDING_LEFT: number = 35

  /**
   * 首页头图：天气与空气质量行上间距.
   */
  static readonly HEADER_ROW_MARGIN_TOP: number = 6

  /**
   * 首页头图：提示图标左间距.
   */
  static readonly AIR_TIPS_ICON_MARGIN_LEFT: number = 8

  /**
   * 首页头图：提示行上间距.
   */
  static readonly AIR_TIPS_MARGIN_TOP: number = 48

  /**
   * 首页头图：内容整体上间距.
   */
  static readonly HEADER_CONTENT_MARGIN_TOP: number = 30

  /**
   * 首页页脚：版本文字上间距.
   */
  static readonly FOOTER_VERSION_MARGIN_TOP: number = 8

  /**
   * 首页页脚：声明与版权文字上间距.
   */
  static readonly FOOTER_TEXT_MARGIN_TOP: number = 4

  /**
   * 首页页脚：上内边距.
   */
  static readonly FOOTER_PADDING_TOP: number = 40

  /**
   * 首页页脚：下内边距.
   */
  static readonly FOOTER_PADDING_BOTTOM: number = 50

  /**
   * 生活指数：指标值上间距.
   */
  static readonly LIFE_INDEX_VALUE_MARGIN_TOP: number = 8

  /**
   * 生活指数：指标描述上间距.
   */
  static readonly LIFE_INDEX_DESC_MARGIN_TOP: number = 2

  /**
   * 多日天气：单项上内边距.
   */
  static readonly DAY_ITEM_PADDING_TOP: number = 16

  /**
   * 多日天气：单项下内边距.
   */
  static readonly DAY_ITEM_PADDING_BOTTOM: number = 13

  /**
   * 多日天气：日期上间距.
   */
  static readonly DAY_DATE_MARGIN_TOP: number = 4

  /**
   * 多日天气：天气图标上间距.
   */
  static readonly DAY_ICON_MARGIN_TOP: number = 8

  /**
   * 多日天气：天气文字上间距.
   */
  static readonly DAY_WEATHER_MARGIN_TOP: number = 8

  /**
   * 多日天气：温度上间距.
   */
  static readonly DAY_TEMP_MARGIN_TOP: number = 16

  /**
   * 多日天气：空气质量标签上间距.
   */
  static readonly DAY_AIR_MARGIN_TOP: number = 19

  /**
   * 侧边栏：搜索框上间距.
   */
  static readonly SEARCH_MARGIN_TOP: number = 4

  /**
   * 侧边栏：城市列表上间距.
   */
  static readonly CITY_LIST_MARGIN_TOP: number = 8

  /**
   * 侧边栏：温度单位下间距.
   */
  static readonly CITY_SIDE_TEMP_UNIT_MARGIN_BOTTOM: number = 28

  /**
   * 城市列表：温度单位下间距.
   */
  static readonly CITY_TEMP_UNIT_MARGIN_BOTTOM: number = 22

  /**
   * 空气质量：指标列表左间距.
   */
  static readonly AIR_LIST_MARGIN_LEFT: number = 10

  /**
   * 添加城市：城市网格上间距.
   */
  static readonly CITY_GRID_MARGIN_TOP: number = 18

  /**
   * 更新时间弹窗：取消按钮上间距.
   */
  static readonly DIALOG_CANCEL_MARGIN_TOP: number = 9

  /**
   * 更新时间弹窗：取消按钮下间距.
   */
  static readonly DIALOG_CANCEL_MARGIN_BOTTOM: number = 25

  /**
   * 更新时间弹窗：大屏两列之间的间隙.
   */
  static readonly DIALOG_LANE_GAP: number = 10

  /**
   * 更新时间弹窗：大屏列数.
   */
  static readonly UPDATE_TIME_LANES_LG: number = 2

  /**
   * 更新时间弹窗：非大屏列数.
   */
  static readonly UPDATE_TIME_LANES_DEFAULT: number = 1

  /**
   * 首页栅格：xs 断点总列数.
   */
  static readonly GRID_COLUMN_XS: number = 4

  /**
   * 首页栅格：sm 断点总列数.
   */
  static readonly GRID_COLUMN_SM: number = 4

  /**
   * 首页栅格：md 断点总列数.
   */
  static readonly GRID_COLUMN_MD: number = 8

  /**
   * 首页栅格：lg 断点总列数（无侧边栏）.
   */
  static readonly GRID_COLUMN_LG: number = 12

  /**
   * 首页栅格：lg 断点总列数（有侧边栏）.
   */
  static readonly GRID_COLUMN_LG_WITH_SIDEBAR: number = 8

  /**
   * 热门城市栅格：sm 断点总列数.
   */
  static readonly HOT_CITY_COLUMN_SM: number = 3

  /**
   * 热门城市栅格：md 断点总列数.
   */
  static readonly HOT_CITY_COLUMN_MD: number = 4

  /**
   * 热门城市栅格：lg 断点总列数.
   */
  static readonly HOT_CITY_COLUMN_LG: number = 7
}