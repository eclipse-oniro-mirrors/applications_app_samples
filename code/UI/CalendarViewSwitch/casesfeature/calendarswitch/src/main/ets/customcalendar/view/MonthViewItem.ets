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
 * @file casesfeature/calendarswitch/src/main/ets/customcalendar/view/MonthViewItem.ets
 * 文件职责：MonthViewItem 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MonthViewItem。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import Constants from '../constant/Constants';
import { CalendarController, CalendarViewType, DayInfo } from '../components/CustomCalendar';
import { CalendarStyle, Day } from '../model/CalendarModel';
import { StyleUtils } from '../utils/StyleUtils';
import { TimeUtils } from '../utils/TimeUtils'; // 时间计算工具类

/**
 * 月视图子组件
 */
/**
 * MonthViewItem：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct MonthViewItem {
  // 月视图日期数据
  // @State monthDays：组件内部状态
  @State monthDays: Day[][] = [];

  // 年月信息
  // @Link yearMonth：与父组件双向绑定的状态
  @Link @Watch('updateMonthData') yearMonth: string;

  // 当前选中的日期
  // @State currentSelectDay：组件内部状态
  @State currentSelectDay: DayInfo =
    new DayInfo(new Date().getFullYear(), new Date().getMonth() + 1, new Date().getDate(), 0); // 当前选中的日期
  // 当前选中的日期，格式'year-month-date-week'
  // @Link currentSelectDate：与父组件双向绑定的状态
  @Link @Watch('OnChangeSelectDate') currentSelectDate: string;
  private year: number = Constants.TODAY_YEAR;
  private month: number = Constants.TODAY_MONTH;

  // 自定义日历样式
  calendarStyle: CalendarStyle = {};

  // 日期点击回调
  onDateClick: (year: number, month: number, date: number) => void = () => {
  };

  // 日历控制器。这里用于控制添加日程后月视图数据刷新
  controller?: CalendarController;

  /**
   * 日期选择监听
   */
  // OnChangeSelectDate：OnChangeSelectDate 自定义组件
  /**
   * OnChangeSelectDate：执行 OnChangeSelectDate 相关逻辑。
   */
  OnChangeSelectDate() {
    const PARTS: string[] = this.currentSelectDate.split('-');
    this.currentSelectDay.year = Number(PARTS[0]);
    this.currentSelectDay.month = Number(PARTS[1]);
    this.currentSelectDay.date = Number(PARTS[2]);
  }

  /**
   * 获取指定月份数据
   */
  getMonthViewData(year: number, month: number) {
    this.monthDays = [...TimeUtils.byMonthDayForYear(year, month)];
  }

  /**
   * 更新月数据
   */
  updateMonthData() {
    const PARTS: string[] = this.yearMonth.split('-');
    this.year = Number(PARTS[0]);
    this.month = Number(PARTS[1]);
    this.getMonthViewData(this.year, this.month);
  }

  /**
   * 刷新日程点数据
   */
  private schedulePointRefresh = () => {
    this.updateMonthData();
  }

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    if (this.controller) {
      this.controller.schedulePointRefresh = this.schedulePointRefresh;
    }
    const PARTS: string[] = this.yearMonth.split('-');
    this.year = Number(PARTS[0]);
    this.month = Number(PARTS[1]);
    this.getMonthViewData(this.year, this.month);
  }

  /**
   * 月视图点击上个月或下个月日期切换月份
   * @param is true为下月，false为上一月
   */
  nextMouth(is: boolean) {
    if (is) {
      this.year =
        (this.month + 1 > 12) ? this.year + 1 : this.year;
      this.month = (this.month + 1 > 12) ? 1 : this.month + 1;
    } else {
      this.year =
        (this.month - 1 < 1) ? this.year - 1 : this.year;
      this.month = (this.month - 1 < 1) ? 12 : this.month - 1;
    }
    this.yearMonth = this.year + '-' + this.month;
  }

  /**
   * 月视图一天的子组件
   * @param day 日期
   * @param week 月视图周信息。0上个月，1当前月，2下个月
   */
  /**
   * monthDayBuilder：执行 monthDayBuilder 相关逻辑。
   */
  @Builder
  monthDayBuilder(day: Day, week: number) {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、圆角、边框颜色、边框宽度、getBorderWidth
    // 交互：可点击交互
    Column() {
      // Text：文本
      // 关键属性：字体颜色、getColor
      Text(day.dayNum + '').id('month_view_item_text_3')
        .fontColor(StyleUtils.getColor(day, this.month, this.currentSelectDay, CalendarViewType.MONTH,
          this.calendarStyle))
        .fontSize(Constants.DAY_FONT_SIZE *
          (this.calendarStyle.textScaling ? this.calendarStyle.textScaling : Constants.FONT_MULTIPLIER))
        .fontWeight(FontWeight.Medium)
      // Text：文本
      // 关键属性：字体颜色、getLunarDayColor
      Text(day.lunarDay).id('month_view_item_text_4')
        .fontColor(StyleUtils.getLunarDayColor(day, this.month, this.currentSelectDay, CalendarViewType.MONTH,
          this.calendarStyle))
        .fontSize(Constants.LUNAR_DAY_FONT_SIZE *
          (this.calendarStyle.textScaling ? this.calendarStyle.textScaling : Constants.FONT_MULTIPLIER))
    }.id('month_view_item_column_2')
    .width($r('app.integer.calendar_switch_size_forty'))
    .height($r('app.integer.calendar_switch_size_forty'))
    .borderRadius($r('app.integer.calendar_switch_size_forty'))
    .borderColor($r('app.color.calendar_switch_border_color'))
    .borderWidth(StyleUtils.getBorderWidth(day, this.month, this.currentSelectDay, CalendarViewType.MONTH))
    .backgroundColor(StyleUtils.getBackgroundColor(day, this.currentSelectDay, this.calendarStyle))
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.onDateClick(day.dayInfo.year, day.dayInfo.month, day.dayInfo.date);
      // 月视图需要拼接day.dayInfo.week
      this.currentSelectDate =
        day.dayInfo.year + '-' + day.dayInfo.month + '-' + day.dayInfo.date + '-' + day.dayInfo.week;
      this.currentSelectDay.year = day.dayInfo.year;
      this.currentSelectDay.month = day.dayInfo.month;
      this.currentSelectDay.date = day.dayInfo.date;
      // 必须记录点击日期的week值。CalendarSwitch的onSelectDayChange监听中需要根据week值点击的是上个月还是下个月的日期，从而进行相应的月份切换
      this.currentSelectDay.week = day.dayInfo.week;
      // 选中了上个月的日期，切换到上个月。1表示月视图第一周
      if (week == 1 && day.dayNum > Constants.DAYS_IN_WEEK) {
        this.nextMouth(false);
      }
      // 选中了下个月的日期，切换到下个月。2表示月视图第二周
      if (week > 2 && day.dayNum < Constants.DAYS_IN_WEEK) {
        this.nextMouth(true);
      }
    })
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度
    Column() {
      ForEach(this.monthDays, (items: Day[], index: number) => {
        // Row：水平布局容器
        // 关键属性：宽度、主轴对齐
        Row() {
          ForEach(items, (item: Day) => {
            // Column：垂直布局容器
            // 关键属性：高度
            Column() {
              this.monthDayBuilder(item, index + 1)
              if (item.isShowSchedulePoint) {
                // 日程点
                // Circle：圆形
                // 关键属性：fill、外边距
                Circle({ width: Constants.SCHEDULE_POINT_DIAMETER, height: Constants.SCHEDULE_POINT_DIAMETER })
                  .id('month_view_item_circle_8')
                  .fill($r('app.color.calendar_switch_schedule_point_color'))
                  .margin({ top: $r('app.integer.calendar_switch_size_one') })
              }
            }.id('month_view_item_column_7')
            .height($r('app.integer.calendar_switch_size_forty_six'))
          }, (item: Day, index: number) => {
            return item.dayNum + '' + index + item.isShowSchedulePoint;
          })
        }.id('month_view_item_row_6')
        .width($r('app.string.calendar_switch_full_size'))
        .justifyContent(FlexAlign.SpaceBetween)
      }, (item: Day[], index: number) => {
        return item.reduce((item1, item2) => {
          return item1 + item2.dayInfo.year + item2.dayInfo.month + item2.dayInfo.date + item2.isShowSchedulePoint
        }, '') + index
      })
    }.id('month_view_item_column_5').width($r('app.string.calendar_switch_full_size'))
  }
}