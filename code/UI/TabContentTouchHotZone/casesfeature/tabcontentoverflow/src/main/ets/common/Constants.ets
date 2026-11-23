/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License"),
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
 * @file casesfeature/tabcontentoverflow/src/main/ets/common/Constants.ets
 * 文件职责：Constants 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：（无顶层声明）。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

// 数值型配置表：集中管理动画时长、间距、透明度等可调参数
export const CONFIGURATION: Record<string, number> = {
  // toast 提示的展示时长（毫秒）
  'TABCONTENT_OVERFLOW_TOAST_DURATION': 300,
  // 进度条两端预留的间隔宽度，用于计算可拖动区间
  'TABCONTENT_OVERFLOW_INTERVAL_NUMBER': 30,
  // Tabs 的层级，设为 2 使 TabContent 外溢部分覆盖在 tabBar 之上
  'TABCONTENT_OVERFLOW_ZINDEX': 2,
  // Tabs 切换动画时长（毫秒）
  'TABCONTENT_OVERFLOW_TABS_DURATION': 100,
  // 灰色背景条的透明度
  'TABCONTENT_OVERFLOW_OPACITY': 0.5,
  // 点赞/评论/收藏等计数文本的透明度
  'TABCONTENT_OVERFLOW_TEXT_OPACITY': 0.7,
  // 进度条未触摸时的纵向平移量
  'TABCONTENT_OVERFLOW_TEXT_TRANSLATE': 0,
  // 进度条触摸态下的纵向平移量，使进度条上移更易操作
  'TABCONTENT_OVERFLOW_TEXT_TOUCH_TRANSLATE': -15,
  // 第三个进度条 Text 的上外边距
  'TABCONTENT_OVERFLOW_TEXT_THREE_MARGIN_TOP': -7.5,
  // 第三个进度条 Text 的左外边距
  'TABCONTENT_OVERFLOW_TEXT_THREE_MARGIN_LEFT': -10,
  // 常量 0：用于边界判断与初始值
  'TABCONTENT_OVERFLOW_ZERO': 0,
  // 常量 1：分割线宽度等单像素场景
  'TABCONTENT_OVERFLOW_ONE': 1,
  // 常量 2：顶部视图分割线宽度
  'TABCONTENT_OVERFLOW_TWO': 2,
  // 常量 10：播放时间补零判断阈值
  'TABCONTENT_OVERFLOW_TEN': 10,
  // 通用动画时长（毫秒）
  'TABCONTENT_OVERFLOW_DURATION': 200,
  // 头像圆角半径
  'TABCONTENT_OVERFLOW_HEADIMAGE_BORDER_RADIUS': 22.5,
  // 头像左边距
  'TABCONTENT_OVERFLOW_HEADIMAGE_MARGIN_LEFT': 7.5,
  // 视频文案最大显示行数
  'TABCONTENT_OVERFLOW_MAXLINE': 2,
}

// 字符串型配置表：集中管理组件 id、展示文案与相对布局锚点名
export const STRINGCONFIGURATION: Record<string, string> = {
  // 视频组件 id，同时作为其他组件的相对布局锚点
  'TABCONTENT_OVERFLOW_VIDEO': 'video',
  // 右侧互动栏组件 id
  'TABCONTENT_OVERFLOW_SIDE': 'side',
  // 视频信息组件 id
  'TABCONTENT_OVERFLOW_VIDEODES': 'videoDes',
  // 顶部视图组件 id
  'TABCONTENT_OVERFLOW_TOPVIEW': 'topView',
  // 当前播放时间文本 id
  'TABCONTENT_OVERFLOW_PLAYTIME_TEXT_ID': 'playTimeText',
  // 视频总时长文本 id
  'TABCONTENT_OVERFLOW_TOTALTIME_TEXT_ID': 'totalTimeText',
  // 进度条底槽 Text 的 id
  'TABCONTENT_OVERFLOW_TEXTONE_ID': 'text1',
  // 进度条已播放部分 Text 的 id
  'TABCONTENT_OVERFLOW_TEXTTWO_ID': 'text2',
  // 进度条拖拽指示点 Text 的 id
  'TABCONTENT_OVERFLOW_TEXTTHREE_ID': 'text3',
  // 进度条容器 id
  'TABCONTENT_OVERFLOW_RELATIVE_CONTAINER': 'RelativeContainer',
  // 用户头像图片 id
  'TABCONTENT_OVERFLOW_HEAD_IMAGE': 'headImage',
  // 关注按钮图片 id
  'TABCONTENT_OVERFLOW_FOCUS_IMAGE': 'focusImage',
  // 点赞图标 id
  'TABCONTENT_OVERFLOW_LIKE_IMAGE': 'likeImage',
  // 点赞数量文本 id
  'TABCONTENT_OVERFLOW_LIKE_TEXT': 'likeText',
  // 评论图标 id
  'TABCONTENT_OVERFLOW_COMMENT_IMAGE': 'commentImage',
  // 评论数量文本 id
  'TABCONTENT_OVERFLOW_COMMENT_TEXT': 'commentText',
  // 收藏图标 id
  'TABCONTENT_OVERFLOW_FAVORITE_IMAGE': 'favoriteImage',
  // 收藏数量文本 id
  'TABCONTEN_TOVERFLOW_FAVORITE_TEXT': 'favoriteText',
  // 分享图标 id
  'TABCONTENT_OVERFLOW_SHARE_IMAGE': 'shareImage',
  // 分享文本 id
  'TABCONTENT_OVERFLOW_SHARE_TEXT': 'shareText',
  // 视频作者昵称文本 id
  'TABCONTENT_OVERFLOW_NAME_TEXT': 'nameText',
  // 视频文案文本 id
  'TABCONTENT_OVERFLOW_DESCRIPTION_TEXT': 'descriptionText',
  // 发布时间文本 id
  'TABCONTENT_OVERFLOW_TIME_TEXT': 'timeText',
  // 灰色背景条 id
  'TABCONTENT_OVERFLOW_GRAY_BACKGROUND': 'grayBackGround',
  // 上升热点图标 id
  'TABCONTENT_OVERFLOW_HOT_IMAGE': 'hotImage',
  // 上升热点标题文本 id
  'TABCONTENT_OVERFLOW_HOT_TEXT': 'hotText',
  // 上升热点内容文本 id
  'TABCONTENT_OVERFLOW_HOT_SPOT': 'hotSpot',
  // 在线人数箭头图标 id
  'TABCONTENT_OVERFLOW_PEOPLE_NUMARROW': 'peopleNumArrow',
  // 在线人数文本 id
  'TABCONTENT_OVERFLOW_PEOPLE_NUM': 'peopleNum',
  // 竖分割线 id
  'TABCONTENT_OVERFLOW_DIVIDER': 'divider',
  // 顶部搜索图标 id
  'TABCONTENT_OVERFLOW_SEARCH_IMAGE': 'searchImage',
  // 顶部「关注」文本 id
  'TABCONTENT_OVERFLOW_FOLLOW_TEXT': 'followText',
  // 顶部「精选」文本 id
  'TABCONTENT_OVERFLOW_SELECTED_TEXT': 'selectedText',
  // 顶部「推荐」文本 id
  'TABCONTENT_OVERFLOW_RECOMMENDATION_TEXT': 'recommendationText',
  // 顶部「放映厅」文本 id
  'TABCONTENT_OVERFLOW_SCREENINGHALL_TEXT': 'screeningHallText',
  // 顶部视图分割线 id
  'TABCONTENT_OVERFLOW_TOPVIEW_DIVIDER': 'divider',
  // 顶部新增图标 id
  'TABCONTENT_OVERFLOW_ADD_IMAGE': 'addImage',
  // Tabs 容器 id
  'TABCONTENT_OVERFLOW_TABS': 'tabs',
  // 自定义 tabBar 容器 id
  'TABCONTENT_OVERFLOW_TABBAR': 'tabbar',
  // 播放时间前缀文案
  'TABCONTENT_OVERFLOW_PLAYTIME_TEXT': '00:',
  // 总时长前缀文案
  'TABCONTENT_OVERFLOW_TOTALTIME_TEXT': '/00:',
  // 相对布局根容器锚点名
  'TABCONTENT_OVERFLOW_CONTAINER': '__container__',
  // 播放按钮图片 id
  'TABCONTENT_OVERFLOW_IMAGE': 'image',
  // 首页页签占位文案
  'TABCONTENT_OVERFLOW_HOMEPAGE': '首页界面，仅供Tabs展示。',
  // 商城页签占位文案
  'TABCONTENT_OVERFLOW_MALL': '商城界面，仅供Tabs展示。',
  // 我的页签占位文案
  'TABCONTENT_OVERFLOW_MINE': '我的界面，仅供Tabs展示。',
  // 示例视频作者昵称
  'TABCONTENT_OVERFLOW_VIDEO_DES_NAME': '@北大是只猫',
  // 示例视频文案
  'TABCONTENT_OVERFLOW_VIDEO_DES_DESCRIPTION': '今天天气是阴天。',
  // 示例上升热点文案
  'TABCONTENT_OVERFLOW_VIDEO_DES_HOTSPOT': ' · 猫长藓要多晒太阳',
  // 示例视频发布时间
  'TABCONTENT_OVERFLOW_VIDEO_DES_TIME': '2024-1-3 14:52',
  // 白色色值
  'TABCONTENT_OVERFLOW_WHITE': '#FFFFFF',
  // 黑色色值
  'TABCONTENT_OVERFLOW_BLACK': '#000000',
  // AppStorage 中窗口舞台的键名
  'TABCONTENT_OVERFLOW_WINDOW_STAGE': 'windowStage',
  // 播放时间补零字符
  'TABCONTENT_OVERFLOW_TIME_ZERO': '0',
  // 播放时间补零字符（历史别名，保持兼容）
  'TABCONTENTOVERFLOWTIMEZERO': '0',
}