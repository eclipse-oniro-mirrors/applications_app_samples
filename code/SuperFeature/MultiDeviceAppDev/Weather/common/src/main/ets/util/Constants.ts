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
 * 页面路由地址，与 resources/base/profile/main_pages.json 保持一致。
 */
export class RouteConstants {
  static readonly HOME: string = 'pages/Home'
  static readonly CITY_LIST: string = 'pages/CityList'
  static readonly ADD_CITY: string = 'pages/AddCity'
}

/**
 * AppStorage 全局状态键。
 * 注：ArkUI 的 @StorageLink/@StorageProp 装饰器参数只能写字符串字面量，
 * 新增或修改状态键时需同步修改各组件装饰器中的字面量。
 */
export class StorageKeys {
  static readonly CITY_LIST: string = 'cityList'
  static readonly CUR_BP: string = 'curBp'
  static readonly SWIPER_INDEX: string = 'swiperIndex'
  static readonly TITLE_TEXT: string = 'titleText'
  static readonly IS_REFRESH: string = 'isRefresh'
}

/**
 * 断点标识以及对应的媒体查询区间。
 */
export class BreakpointConstants {
  static readonly SM: string = 'sm'
  static readonly MD: string = 'md'
  static readonly LG: string = 'lg'
  static readonly SM_QUERY: string = '(320vp<width<=600vp)'
  static readonly MD_QUERY: string = '(600vp<width<=840vp)'
  static readonly LG_QUERY: string = '(840vp<width)'
}

/**
 * mock 数据中的天气类型，属于数据契约的一部分，不直接作为界面文案使用。
 */
export class WeatherType {
  static readonly SUNNY: string = '\u6674' // 晴
  static readonly CLOUDY: string = '\u591a\u4e91' // 多云
  static readonly OVERCAST: string = '\u9634' // 阴
  static readonly LIGHT_RAIN: string = '\u5c0f\u96e8' // 小雨
  static readonly MODERATE_RAIN: string = '\u4e2d\u96e8' // 中雨
  static readonly HEAVY_RAIN: string = '\u5927\u96e8' // 大雨
  static readonly THUNDER_SHOWER: string = '\u96f7\u9635\u96e8' // 雷阵雨
  static readonly SUNSET: string = '\u65e5\u843d' // 日落
  static readonly RAIN: string = '\u96e8' // 雨
}

/**
 * 温度、角度等符号。
 */
export class WeatherSymbol {
  static readonly CELSIUS: string = '℃'
  static readonly DEGREE: string = '°'
  static readonly TEMP_RANGE_SEPARATOR: string = ' / '
  static readonly TEMP_DASH: string = '-'
}

/**
 * mock 数据的分页与循环参数。
 */
export class MockConstants {
  static readonly TODAY_INDEX: number = 1
  static readonly WEATHER_CYCLE: number = 5
  static readonly DEFAULT_CITY_COUNT: number = 2
  static readonly HOUR_UNIT_LENGTH: number = 1
  static readonly SUNSET_HOUR: number = 17
  static readonly SUNSET_TIME: string = '17:32'
}

/**
 * 只能以字符串形式传入组件的资源路径。
 */
export class AssetPath {
  static readonly SEARCH_ICON: string = '/common/images/icon_search.svg'
}

/**
 * 首页菜单的跳转地址，空串表示不跳转、改为打开弹窗。
 */
export class MenuUrl {
  static readonly NONE: string = ''
}

/**
 * 首页菜单文案，由 mock 数据层下发。
 */
export class MenuLabel {
  static readonly MANAGE_CITY: string = '\u7ba1\u7406\u57ce\u5e02' // 管理城市
  static readonly UPDATE_INTERVAL: string = '\u66f4\u65b0\u95f4\u9694' // 更新间隔
}

/**
 * 更新时间间隔选项，由 mock 数据层下发。
 */
export class UpdateInterval {
  static readonly ONE_HOUR: string = '1\u5c0f\u65f6' // 1小时
  static readonly TWO_HOURS: string = '2\u5c0f\u65f6' // 2小时
  static readonly FOUR_HOURS: string = '4\u5c0f\u65f6' // 4小时
  static readonly SIX_HOURS: string = '6\u5c0f\u65f6' // 6小时
  static readonly TWELVE_HOURS: string = '12\u5c0f\u65f6' // 12小时
  static readonly ONE_DAY: string = '24\u5c0f\u65f6' // 24小时
  static readonly NEVER: string = '\u4e0d\u66f4\u65b0' // 不更新
}

/**
 * 时间节点称谓。
 */
export class TimeSlotLabel {
  static readonly EARLY_MORNING: string = '\u65e9\u4e0a' // 早上
  static readonly FORENOON: string = '\u4e0a\u5348' // 上午
  static readonly NOON: string = '\u4e2d\u5348' // 中午
  static readonly AFTERNOON: string = '\u4e0b\u5348' // 下午
  static readonly EVENING: string = '\u508d\u665a' // 傍晚
  static readonly NIGHT: string = '\u665a\u4e0a' // 晚上
}

/**
 * 时间节点称谓的小时边界，保持整数小时判定口径不变。
 */
export class TimeSlotBoundary {
  static readonly DAY_START: number = 0
  static readonly EARLY_MORNING_END: number = 8
  static readonly FORENOON_START: number = 9
  static readonly FORENOON_END: number = 11
  static readonly NOON_START: number = 11
  static readonly NOON_END: number = 13
  static readonly AFTERNOON_START: number = 14
  static readonly AFTERNOON_END: number = 16
  static readonly EVENING_START: number = 17
  static readonly EVENING_END: number = 19
  static readonly NIGHT_START: number = 19
  static readonly DAY_END: number = 23
}

/**
 * 星期文案，下标与 Date.getDay() 的 0-6 一一对应。
 */
export class WeekLabel {
  static readonly SUNDAY: string = '\u661f\u671f\u65e5' // 星期日
  static readonly MONDAY: string = '\u661f\u671f\u4e00' // 星期一
  static readonly TUESDAY: string = '\u661f\u671f\u4e8c' // 星期二
  static readonly WEDNESDAY: string = '\u661f\u671f\u4e09' // 星期三
  static readonly THURSDAY: string = '\u661f\u671f\u56db' // 星期四
  static readonly FRIDAY: string = '\u661f\u671f\u4e94' // 星期五
  static readonly SATURDAY: string = '\u661f\u671f\u516d' // 星期六
  static readonly ALL: string[] = [
    WeekLabel.SUNDAY,
    WeekLabel.MONDAY,
    WeekLabel.TUESDAY,
    WeekLabel.WEDNESDAY,
    WeekLabel.THURSDAY,
    WeekLabel.FRIDAY,
    WeekLabel.SATURDAY
  ]
}

/**
 * 更新时间弹窗中的单选按钮分组名。
 */
export class RadioGroup {
  static readonly UPDATE_TIME: string = 'time'
}
