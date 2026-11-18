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
 * @file casesfeature/calendarswitch/src/main/ets/customcalendar/view/YearView.ets
 * 文件职责：YearView 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：YearView。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import Constants from '../constant/Constants';
import { CalendarViewType } from '../components/CustomCalendar';
import { CalendarSwitch } from '../model/CalendarModel';
import { YearViewItem } from './YearViewItem';

/**
 * 年视图
 */
/**
 * YearView：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct YearView {
  // swiper当前显示的子组件索引
  // @State swiperYearIndex：组件内部状态
  @State swiperYearIndex: number = 1;

  // 当前显示的年
  // @State currentShowYear：组件内部状态
  @State currentShowYear: number = Constants.TODAY_YEAR;

  // 上一年
  // @State lastYear：组件内部状态
  @State lastYear: number = Constants.TODAY_YEAR - 1;

  // 当前年
  // @State currentYear：组件内部状态
  @State currentYear: number = Constants.TODAY_YEAR;

  // 下一年
  // @State nextYear：组件内部状态
  @State nextYear: number = Constants.TODAY_YEAR + 1;

  // 记录swiper上一次显示的子组件索引。
  private oldYearViewIndex: number = 1;

  // 年、月、周视图切换场景的相关设置
  calendarSwitch: CalendarSwitch = { isYearMonthHidden: false };

  // 年、月、周视图左右滑动切换回调
  onChangeYearMonth: (year: number, month: number) => void = () => {
  };

  // 年视图月份点击回调
  onMonthClick: (year: number, month: number) => void = () => {
  };

  /**
   * 用于年、月、周视图间切换场景下刷新日期数据
   */
  private swiperRefresh = (value: CalendarViewType) => {
    if (value === CalendarViewType.YEAR) {
      if (this.calendarSwitch.currentSelectDay) {
        if (this.calendarSwitch.currentSelectDay.year === this.currentShowYear && this.swiperYearIndex === 1) {
          return;
        }
        this.currentShowYear = this.calendarSwitch.currentSelectDay.year;
        // 重置swiper索引
        this.swiperYearIndex = 1;
        this.oldYearViewIndex = 1;
        // 更新年月数据
        this.currentYear = this.calendarSwitch.currentSelectDay.year;
        this.lastYear = this.calendarSwitch.currentSelectDay.year - 1;
        this.nextYear = this.calendarSwitch.currentSelectDay.year + 1;
      }
    }
  }

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    if (this.calendarSwitch.controller) {
      // 给controller对应的方法赋值
      this.calendarSwitch.controller.swiperRefresh = this.swiperRefresh;
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // 年视图
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
      if (!this.calendarSwitch.isYearMonthHidden) {
        // 年月信息标题
        // Text：文本
        // 关键属性：字号、字重、字体颜色、宽度
        Text($r('app.string.calendar_switch_year', this.currentShowYear)).id('year_view_text_2')
          .fontSize($r('app.integer.calendar_switch_size_twenty_five'))
          .fontWeight(Constants.FONT_WEIGHT_EIGHT_HUNDRED)
          .fontColor(Color.Red)
          .width($r('app.string.calendar_switch_full_size'))
        // Divider：分割线
        // 关键属性：strokeWidth、外边距
        Divider().id('year_view_divider_3')
          .strokeWidth('1px')
          .margin({
            top: $r('app.integer.calendar_switch_size_four'),
            bottom: $r('app.integer.calendar_switch_size_four')
          })
      }
      // Swiper：轮播容器
      // 关键属性：onAnimationStart
      Swiper() {
        // 年视图子组件
        // YearViewItem：YearViewItem 自定义组件
        YearViewItem({
          year: this.lastYear,
          onMonthClick: (year: number, month: number) => {
            this.onMonthClick(year, month);
          }
        }).id('year_view_year_view_item_5')
        // YearViewItem：YearViewItem 自定义组件
        YearViewItem({
          year: this.currentYear,
          onMonthClick: (year: number, month: number) => {
            this.onMonthClick(year, month);
          }
        }).id('year_view_year_view_item_6')
        // YearViewItem：YearViewItem 自定义组件
        YearViewItem({
          year: this.nextYear,
          onMonthClick: (year: number, month: number) => {
            this.onMonthClick(year, month);
          },
        }).id('year_view_year_view_item_7')
      }.id('year_view_swiper_4')
      .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
        if (this.oldYearViewIndex === targetIndex) {
          // 如果手指滑动swiper松开时，targetIndex和之前记录子组件索引oldYearViewIndex一样，说明swiper没有切换子组件，不需要切换年份
          return;
        }
        // 记录子组件索引
        this.oldYearViewIndex = targetIndex;
        // 判断是否右滑切换年
        const IS_RIGHT_SLIDE: boolean = (index === 1 && targetIndex === 0) || (index === 0 && targetIndex === 2) ||
          (index === 2 && targetIndex === 1);
        // 手指右滑切换上一年
        if (IS_RIGHT_SLIDE) {
          // 滑到上一年，当前显示的年份-1
          this.currentShowYear = this.currentShowYear - 1;
          if (targetIndex === 0) {
            // swiper索引右滑到0时，修改swiper索引2的年为当前年（索引0）的上一年。比如，假设swiper索引0（2023年），swiper索引1（2024年）
            // ，swiper索引2（2025年）。当右滑切换到索引0（2023年）时，需要把索引2（2025年）改成2022年。
            this.nextYear = this.currentShowYear - 1;
          } else if (targetIndex === 1) {
            // swiper索引右滑到1时，修改swiper索引0的年为当前年（索引1）的上一年。
            this.lastYear = this.currentShowYear - 1;
          } else if (targetIndex === 2) {
            // swiper索引右滑到2时，修改swiper索引1的年为当前年（索引2）的上一年。
            this.currentYear = this.currentShowYear - 1;
          }
        } else {
          // 左滑切换下一年
          // 滑到下一年，当前显示的年份+1
          this.currentShowYear = this.currentShowYear + 1;
          if (targetIndex === 0) {
            // swiper索引左滑到0时，修改swiper索引1的年为当前年（索引0）的下一年。
            this.currentYear = this.currentShowYear + 1;
          } else if (targetIndex === 1) {
            // swiper索引左滑到1时，修改swiper索引2的年为当前年（索引1）的下一年。
            this.nextYear = this.currentShowYear + 1;
          } else if (targetIndex === 2) {
            // swiper索引左滑到2时，修改swiper索引0的年为当前年（索引2）的下一年。
            this.lastYear = this.currentShowYear + 1;
          }
        }
        this.onChangeYearMonth(this.currentShowYear, Constants.DEFAULT);
      })
      .indicator(false)
      .loop(true)
      .index($$this.swiperYearIndex)
    }.id('year_view_column_1')
    .width(Constants.YEAR_VIEW_WIDTH)
    .height(Constants.YEAR_VIEW_HEIGHT)
  }
}