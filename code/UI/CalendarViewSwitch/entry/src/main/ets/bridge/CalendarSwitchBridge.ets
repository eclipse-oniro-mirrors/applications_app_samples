/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/bridge/CalendarSwitchBridge.ets
 * 文件职责：CalendarSwitchBridge 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：（无顶层声明）。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * CalendarSwitchBridge：纯 re-export 桥接文件（无业务逻辑）。
 * ohosTest 源码集禁止跨模块 import（Cannot import files from an external module）。
 * useNormalizedOHMUrl=true 下 entry main 使用 {pkgName}/xxxx 模块名深路径引用 calendarswitch HAR，
 * 测试文件统一从本桥接做模块内相对 import。
 */
export { TimeUtils } from 'calendarswitch/src/main/ets/customcalendar/utils/TimeUtils';

export { StyleUtils } from 'calendarswitch/src/main/ets/customcalendar/utils/StyleUtils';

export {
  DayInfo, CalendarController, CalendarViewType
} from 'calendarswitch/src/main/ets/customcalendar/components/CustomCalendar';

export {
  ScheduleInfo, DeviceType, Day, CalendarData, CalendarStyle
} from 'calendarswitch/src/main/ets/customcalendar/model/CalendarModel';

export { default as Constants } from 'calendarswitch/src/main/ets/customcalendar/constant/Constants';

export { default as CommonData } from 'calendarswitch/src/main/ets/customcalendar/common/CommonData';
