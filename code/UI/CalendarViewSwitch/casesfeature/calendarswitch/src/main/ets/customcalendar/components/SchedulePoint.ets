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
 * @file casesfeature/calendarswitch/src/main/ets/customcalendar/components/SchedulePoint.ets
 * 文件职责：SchedulePoint 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SchedulePoint。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { CalendarController } from './CustomCalendar';
import { calendarManager } from '@kit.CalendarKit'; // 日程管理模块
import Constants from '../constant/Constants';
import CommonData from '../common/CommonData';
import { intl } from '@kit.LocalizationKit'; // 国际化模块
import { promptAction } from '@kit.ArkUI';
import { preferences } from '@kit.ArkData'; // 用户首选项
import { ScheduleInfo } from '../model/CalendarModel';
import { JSON } from '@kit.ArkTS';
import { TimeUtils } from '../utils/TimeUtils';
import { logger } from '../utils/Logger';

const TAG = 'Calendar_Switch';

const COLUMN_SPACE = 25;

const FONT_WEIGHT = 500;

const OPACITY = 0.5;

const STROKE_WIDTH = 1;

/**
 * 自定义添加日程组件SchedulePoint
 *
 * 功能描述：
 * 1.提供添加日程以及日程提醒功能，添加的日程会同步到系统日历，Calendar Kit日历服务会根据创建的日程自动进行相应的日程提醒。
 * 2.添加日程后，添加的日程点可以显示在CustomCalendar的月视图和周视图上。
 *
 * 实现思路
 * 1.通过Calendar Kit日历与日程管理能力，使用getCalendarManager获取管理日历对象，然后createCalendar创建日历账户。
 * 2.使用getCalendar获取日历对象，然后通过配置CalendarConfig中enableReminder为true启用日程提醒功能。
 * 3.配置日程参数calendarManager.Event，然后传入addEvent创建日程。Calendar Kit日历服务会根据创建的日程进行相应的日程提醒。
 *
 * 接口：
 * CustomCalendar({ monthViewController?: CalendarController, weekViewController?: CalendarController })
 *
 * 参数：
 * @param { CalendarController } monthViewController - 月视图控制器，用于控制日程点刷新。可选项。
 *
 * @param { CalendarController } weekViewController - 周视图控制器，用于控制日程点刷新。可选项。
 *
 * 基本用法：
 * SchedulePoint({
 *   monthViewController: this.calendarMonthController,
 *   weekViewController: this.calendarWeekController
 * })
 * 对于需要在月视图或者周视图上显示添加的日程点的场景，需要传入对应的控制器，否则新增的日程点不会刷新
 */
/**
 * SchedulePoint：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct SchedulePoint {
  // 是否显示半模态转场标志位
  // @State isShow：组件内部状态
  @State isShow: boolean = false;

  // 日程标题
  // @State title：组件内部状态
  @State title: string = '';

  // 日程地点
  // @State location：组件内部状态
  @State location: string = '';

  // 日程开始时间
  // @State startTime：组件内部状态
  @State startTime: Date = new Date();

  // 日程开始时间字符串
  // @State scheduleStartTime：组件内部状态
  @State scheduleStartTime: string = '';

  // 日程结束时间
  // @State endTime：组件内部状态
  @State endTime: Date = new Date();

  // 日程结束时间字符串
  // @State scheduleEndTime：组件内部状态
  @State scheduleEndTime: string = '';

  // 日程说明
  // @State describe：组件内部状态
  @State describe: string = '';

  // 日程提醒时间index
  // @State reminderTimeIndex：组件内部状态
  @State reminderTimeIndex: number = 0;

  // 日程提醒时间选项
  private reminderTimeArray: number[] = [0];

  // CalendarManager日程管理对象
  private calendarMgr: calendarManager.CalendarManager | null = null;

  // 用于添加日程时，刷新月视图数据的控制器
  private monthViewController = new CalendarController();

  // 用于添加日程时，刷新周视图数据的控制器
  private weekViewController = new CalendarController();

  // 创建时间、日期格式化对象。
  private dateFormat = new intl.DateTimeFormat('zh-CN', { dateStyle: 'short', timeStyle: 'short' });

  // Preferences对象
  private dataPreferences: preferences.Preferences | null = null;

  // 上下文context
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  // 日历Calendar对象
  private calendar: calendarManager.Calendar | undefined = undefined;

  // 日历配置信息
  private config: calendarManager.CalendarConfig = {
    // 打开日程提醒
    enableReminder: true,
    // 设置日历账户颜色。可选项
    color: Color.Green
  };

  // 日历账户信息
  private myCalendarAccount: calendarManager.CalendarAccount = {
    // 日历账户名称
    name: 'test',
    // 日历账户类型。LOCAL表示本地账户
    type: calendarManager.CalendarType.LOCAL,
    // 日历账户显示名称，该字段如果不填，创建的日历账户在界面显示为空字符串。
    displayName: 'test'
  };

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    const permissions: Permissions[] = ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'];
    // 获取AtManager实例
    let atManager = abilityAccessCtrl.createAtManager();
    // 向用户申请系统日历读写权限
    atManager.requestPermissionsFromUser(this.context, permissions).then((result: PermissionRequestResult) => {
      logger.info(TAG, `get Permission success, result: ${JSON.stringify(result)}`);
      // TODO 知识点：通过getCalendarManager获取管理日历对象，使用getCalendar获取日历对象，然后使用createCalendar创建自己的日历账户，
      // 通过配置CalendarConfig中enableReminder为true启用日程提醒功能。
      // 根据上下文获取CalendarManager对象，用于管理日历。
      this.calendarMgr = calendarManager.getCalendarManager(this.context);
      // 获取Calendar对象
      this.calendarMgr.getCalendar(this.myCalendarAccount).then((data: calendarManager.Calendar) => {
        this.calendar = data;
        // 设置日历配置信息
        this.calendar.setConfig(this.config).then(() => {
          logger.info(TAG, `Succeeded in setting config, data->${JSON.stringify(this.config)}`);
        }).catch((err: BusinessError) => {
          logger.error(TAG, `Failed to set config. Code: ${err.code}, message: ${err.message}`);
        });
      }).catch(() => {
        // 如果日历账户不存在，则创建日历账户
        this.calendarMgr?.createCalendar(this.myCalendarAccount).then((data: calendarManager.Calendar) => {
          // 请确保日历账户创建成功后，再进行后续相关操作
          this.calendar = data;
          // 设置日历账户
          this.calendar?.setConfig(this.config).then(() => {
            logger.info(TAG, `Succeeded in setting config, data->${JSON.stringify(this.config)}`);
          }).catch((err: BusinessError) => {
            logger.error(TAG, `Failed to set config. Code: ${err.code}, message: ${err.message}`);
          });
        }).catch((error: BusinessError) => {
          logger.error(TAG, `Failed to create calendar. Code: ${error.code}, message: ${error.message}`);
        });
      });
    }).catch((error: BusinessError) => {
      logger.error(TAG, `get Permission error, error. Code: ${error.code}, message: ${error.message}`);
    })
  }

  /**
   * 日程提醒时间菜单
   */
  /**
   * reminderTimeMenu：执行 reminderTimeMenu 相关逻辑。
   */
  @Builder
  reminderTimeMenu() {
    // Column：垂直布局容器
    // 关键属性：圆角、宽度、背景色、focusable
    Column() {
      ForEach(Constants.REMINDER_TIME_OPTION, (item: string, index: number) => {
        // Column：垂直布局容器
        // 关键属性：宽度、点击事件回调
        // 交互：可点击交互
        Column() {
          // Flex：弹性布局容器
          // 关键属性：高度
          Flex({
            direction: FlexDirection.Row,
            justifyContent: FlexAlign.SpaceBetween,
            alignItems: ItemAlign.Center
          }) {
            // Text：文本
            // 关键属性：字号
            Text(item).id('schedule_point_text_4')
              .fontSize($r('app.integer.calendar_switch_size_fifteen'))
            // Image：图片
            // 关键属性：可见性、宽度、高度
            Image($r('app.media.calendar_switch_ok')).id('schedule_point_image_5')
              .visibility(this.reminderTimeIndex === index ? Visibility.Visible : Visibility.Hidden)
              .width($r('app.integer.calendar_switch_size_twenty'))
              .height($r('app.integer.calendar_switch_size_twenty'))
          }.id('schedule_point_flex_3')
          .height($r('app.integer.calendar_switch_size_forty_eight'))

          // Divider：分割线
          // 关键属性：可见性、宽度
          Divider().id('schedule_point_divider_6')
            .visibility(index !== Constants.REMINDER_TIME_OPTION.length - 1 ? Visibility.Visible : Visibility.Hidden)
            .width($r('app.string.calendar_switch_full_size'))
        }.id('schedule_point_column_2')
        .width($r('app.integer.calendar_switch_size_ninety'))
        .onClick(() => {
          this.reminderTimeIndex = index;
          switch (item) {
            case '准时':
              this.reminderTimeArray = [0];
              break;
            case '1分钟前':
              this.reminderTimeArray = [1];
              break;
            case '5分钟前':
              this.reminderTimeArray = [5];
              break;
            case '30分钟前':
              this.reminderTimeArray = [30];
              break;
            case '1小时前':
              this.reminderTimeArray = [60];
              break;
          }
        })
      }, (item: string) => item)
    }.id('schedule_point_column_1')
    .borderRadius($r('app.integer.calendar_switch_size_ten'))
    .width($r('app.integer.calendar_switch_size_hundred'))
    .backgroundColor(Color.White)
    .focusable(false)
  }

  /**
   * 提醒时间设置项
   */
  /**
   * reminderTime：执行 reminderTime 相关逻辑。
   */
  @Builder
  reminderTime() {
    // Row：水平布局容器
    // 关键属性：宽度、高度、圆角、背景色、内边距
    Row() {
      // Text：文本
      // 关键属性：字号、字体颜色
      Text($r('app.string.calendar_switch_reminder_time')).id('schedule_point_text_8')
        .fontSize($r('app.integer.calendar_switch_size_sixteen'))
        .fontColor(Color.Gray)
      // Blank：占位空白
      Blank().id('schedule_point_blank_9')
      // Row：水平布局容器
      // 关键属性：bindMenu、reminderTimeMenu
      Row() {
        // Text：文本
        // 关键属性：字号
        Text(Constants.REMINDER_TIME_OPTION[this.reminderTimeIndex]).id('schedule_point_text_11')
          .fontSize($r('app.integer.calendar_switch_size_fifteen'))
        // Image：图片
        // 关键属性：宽度、高度、外边距
        Image($r('app.media.calendar_switch_spinner')).id('schedule_point_image_12')
          .width($r('app.integer.calendar_switch_size_twenty_two'))
          .height($r('app.integer.calendar_switch_size_sixteen'))
          .margin({
            left: $r('app.integer.calendar_switch_size_eight'),
            right: $r('app.integer.calendar_switch_size_eight')
          })
      }.id('schedule_point_row_10')
      .bindMenu(this.reminderTimeMenu(), { placement: Placement.Top })
    }.id('schedule_point_row_7')
    .width($r('app.string.calendar_switch_full_size'))
    .height($r('app.integer.calendar_switch_size_forty_eight'))
    .borderRadius($r('app.integer.calendar_switch_size_ten'))
    .backgroundColor(Color.White)
    .padding({
      left: $r('app.integer.calendar_switch_size_sixteen'),
      right: $r('app.integer.calendar_switch_size_sixteen')
    })
  }

  /**
   * 新建日程页面
   */
  /**
   * addScheduleInfo：执行 addScheduleInfo 相关逻辑。
   */
  @Builder
  addScheduleInfo() {
    // Column：垂直布局容器
    // 关键属性：高度、内边距
    Column({ space: COLUMN_SPACE }) {
      // Row：水平布局容器
      // 关键属性：宽度、高度、主轴对齐
      Row() {
        // Text：文本
        // 关键属性：字号、字体颜色、点击事件回调
        // 交互：可点击交互
        Text($r('app.string.calendar_switch_cancel')).id('schedule_point_text_15')
          .fontSize($r('app.integer.calendar_switch_size_eighteen'))
          .fontColor(Color.Red)
          .onClick(() => {
            this.isShow = false;
          })
        // Text：文本
        // 关键属性：字号、字重
        Text($r('app.string.calendar_switch_new_schedule')).id('schedule_point_text_16')
          .fontSize($r('app.integer.calendar_switch_size_twenty_two'))
          .fontWeight(FONT_WEIGHT)
        // Text：文本
        // 关键属性：字号、字体颜色、点击事件回调
        // 交互：可点击交互
        Text($r('app.string.calendar_switch_add')).id('schedule_point_text_17')
          .fontSize($r('app.integer.calendar_switch_size_eighteen'))
          .fontColor(this.title === '' ? Color.Gray : Color.Black)
          .onClick(() => {
            if (this.title === '') {
              AlertDialog.show({
                message: $r('app.string.calendar_switch_title_msg'),
                alignment: DialogAlignment.Center
              });
              return;
            }
            if (this.startTime.getTime() >= this.endTime.getTime()) {
              // 结束时间需要大于开始时间
              AlertDialog.show({
                message: $r('app.string.calendar_switch_time_msg'),
                alignment: DialogAlignment.Center
              });
              return;
            }
            // TODO 知识点：配置日程参数calendarManager.Event，然后传入addEvent创建日程，Calendar Kit日历服务会根据创建的日程进行相应
            //  的日程提醒。同时使用持久化preferences存储添加的日程信息，用于月视图和周视图中显示相应的日程点。
            // 配置日程参数。本案例中日程重复规则recurrenceRule未设置，表示不重复
            const EVENT_NOT_REPEATED: calendarManager.Event = {
              // 日程标题
              title: this.title,
              // 地点
              location: { location: this.location },
              // 日程类型，NORMAL：普通日程，例如会议，闹钟等日常提醒的日程。 IMPORTANT：重要日程，例如结婚纪念日等具有重要意义的日期，不推
              // 荐三方开发者使用，重要日程类型不支持一键服务跳转功能及无法自定义提醒时间。
              type: calendarManager.EventType.NORMAL,
              // 日程开始时间，需要13位时间戳。
              startTime: this.startTime.getTime(),
              // 日程结束时间，需要13位时间戳。
              endTime: this.endTime.getTime(),
              // 日程提醒时间，单位为分钟。填写x分钟，即距开始时间提前x分钟提醒，不填时，默认为不提醒。为负值时表示延期多长时间提醒。
              reminderTime: this.reminderTimeArray
            };
            // 创建日程
            this.calendar?.addEvent(EVENT_NOT_REPEATED).then((data: number) => {
              logger.info(TAG, `Succeeded in adding event, id -> ${data}`);
            }).catch((err: BusinessError) => {
              logger.error(TAG, `Failed to addEvent. Code: ${err.code}, message: ${err.message}`);
            });
            // 新增日程
            const PARTS: string[] = this.scheduleStartTime.split(' ');
            CommonData.SCHEDULE_DATA.push(new ScheduleInfo(this.title, this.location, this.startTime,
              this.endTime, this.describe, PARTS[0], this.reminderTimeArray));
            TimeUtils.addSchedule(this.startTime, this.endTime);
            // 获取Preferences实例
            let options: preferences.Options = { name: 'mySchedule' };
            this.dataPreferences = preferences.getPreferencesSync(this.context, options);
            // 将数据写入缓存的Preferences实例
            this.dataPreferences.putSync('schedule', CommonData.SCHEDULE_DATA);
            // 通过flush将Preferences实例持久化
            this.dataPreferences.flush();
            // 刷新月视图。用于更新日程点
            this.monthViewController?.schedulePointRefresh();
            // 刷新周视图。用于更新日程点
            this.weekViewController?.schedulePointRefresh();
            this.isShow = false;
            promptAction.showToast({
              message: $r('app.string.calendar_switch_add_completed')
            });
          })
      }.id('schedule_point_row_14')
      .width($r('app.string.calendar_switch_full_size'))
      .height($r('app.integer.calendar_switch_size_sixty'))
      .justifyContent(FlexAlign.SpaceBetween)

      // Column：垂直布局容器
      // 关键属性：内边距
      Column() {
        // TextInput：单行输入框
        // 关键属性：背景色、高度、内容变更回调
        // 交互：输入/提交回调
        TextInput({ placeholder: $r('app.string.calendar_switch_title') }).id('schedule_point_text_input_19')
          .backgroundColor(Color.White)
          .height($r('app.integer.calendar_switch_size_forty_eight'))
          .onChange((value: string) => {
            this.title = value;
          })
        // Divider：分割线
        // 关键属性：宽度、strokeWidth、透明度
        Divider().id('schedule_point_divider_20')
          .width($r('app.string.calendar_switch_full_size'))
          .strokeWidth(STROKE_WIDTH)
          .opacity(OPACITY)
        // TextInput：单行输入框
        // 关键属性：背景色、高度、内容变更回调
        // 交互：输入/提交回调
        TextInput({ placeholder: $r('app.string.calendar_switch_location') }).id('schedule_point_text_input_21')
          .backgroundColor(Color.White)
          .height($r('app.integer.calendar_switch_size_forty_eight'))
          .onChange((value: string) => {
            this.location = value;
          })
        // Divider：分割线
        // 关键属性：宽度、strokeWidth、透明度
        Divider().id('schedule_point_divider_22')
          .width($r('app.string.calendar_switch_full_size'))
          .strokeWidth(STROKE_WIDTH)
          .opacity(OPACITY)
        // Row：水平布局容器
        // 关键属性：主轴对齐、宽度、内边距
        Row() {
          // Text：文本
          // 关键属性：高度、字号、字体颜色
          Text($r('app.string.calendar_switch_start_time')).id('schedule_point_text_24')
            .height($r('app.integer.calendar_switch_size_forty_eight'))
            .fontSize($r('app.integer.calendar_switch_size_sixteen'))
            .fontColor(Color.Gray)
          // Text：文本
          // 关键属性：字号
          Text(this.scheduleStartTime).id('schedule_point_text_25')
            .fontSize($r('app.integer.calendar_switch_size_sixteen'))
        }.id('schedule_point_row_23')
        .justifyContent(FlexAlign.SpaceBetween)
        .width($r('app.string.calendar_switch_full_size'))
        .padding({
          left: $r('app.integer.calendar_switch_size_sixteen'),
          right: $r('app.integer.calendar_switch_size_sixteen')
        })
        .onClick(() => {
          DatePickerDialog.show({
            selected: this.startTime,
            showTime: true, // 是否展示时间项，true表示显示时间，false表示不显示时间。
            acceptButtonStyle: {
              // 设置确认按钮显示样式
              fontSize: $r('app.string.calendar_switch_button_style')
            },
            cancelButtonStyle: {
              // 设置取消按钮显示样式
              fontSize: $r('app.string.calendar_switch_button_style')
            },
            // 点击弹窗中的“确定”按钮时触发该回调。
            onDateAccept: (value: Date) => {
              // 格式化时间并保存
              this.startTime = value;
              this.scheduleStartTime = this.dateFormat.format(this.startTime);
            }
          })
        })

        // Divider：分割线
        // 关键属性：宽度、strokeWidth、透明度
        Divider().id('schedule_point_divider_26')
          .width($r('app.string.calendar_switch_full_size'))
          .strokeWidth(STROKE_WIDTH)
          .opacity(OPACITY)
        // Row：水平布局容器
        // 关键属性：点击事件回调、show
        // 交互：可点击交互
        Row() {
          // Text：文本
          // 关键属性：高度、字号、字体颜色
          Text($r('app.string.calendar_switch_end_time')).id('schedule_point_text_28')
            .height($r('app.integer.calendar_switch_size_forty_eight'))
            .fontSize($r('app.integer.calendar_switch_size_sixteen'))
            .fontColor(Color.Gray)
          // Text：文本
          // 关键属性：字号
          Text(this.scheduleEndTime).id('schedule_point_text_29')
            .fontSize($r('app.integer.calendar_switch_size_sixteen'))
        }.id('schedule_point_row_27')
        .onClick(() => {
          DatePickerDialog.show({
            selected: this.endTime,
            showTime: true,
            acceptButtonStyle: {
              fontSize: $r('app.string.calendar_switch_button_style')
            },
            cancelButtonStyle: {
              fontSize: $r('app.string.calendar_switch_button_style')
            },
            onDateAccept: (value: Date) => {
              this.endTime = value;
              this.scheduleEndTime = this.dateFormat.format(this.endTime);
            }
          })
        })
        .justifyContent(FlexAlign.SpaceBetween)
        .width($r('app.string.calendar_switch_full_size'))
        .padding({
          left: $r('app.integer.calendar_switch_size_sixteen'),
          right: $r('app.integer.calendar_switch_size_sixteen')
        })

        // Divider：分割线
        // 关键属性：宽度、strokeWidth、透明度、reminderTime
        Divider().id('schedule_point_divider_30')
          .width($r('app.string.calendar_switch_full_size'))
          .strokeWidth(STROKE_WIDTH)
          .opacity(OPACITY)
        this.reminderTime()
      }.id('schedule_point_column_18')
      .padding({
        top: $r('app.integer.calendar_switch_size_four'),
        bottom: $r('app.integer.calendar_switch_size_four'),
        left: $r('app.integer.calendar_switch_margin_size_twelve'),
        right: $r('app.integer.calendar_switch_margin_size_twelve')
      })
      .borderRadius($r('app.integer.calendar_switch_size_fourteen'))
      .backgroundColor(Color.White)
      .width($r('app.string.calendar_switch_full_size'))

      // Column：垂直布局容器
      // 关键属性：高度、背景色、内边距
      Column() {
        // TextArea：多行输入框
        // 关键属性：背景色、高度、内容变更回调
        // 交互：输入/提交回调
        TextArea({ placeholder: $r('app.string.calendar_switch_describe') }).id('schedule_point_text_area_32')
          .backgroundColor(Color.White)
          .height($r('app.string.calendar_switch_full_size'))
          .onChange((value: string) => {
            this.describe = value;
          })
      }.id('schedule_point_column_31')
      .height($r('app.integer.calendar_switch_two_hundred_fifty'))
      .backgroundColor(Color.White)
      .padding({
        top: $r('app.integer.calendar_switch_size_four'),
        bottom: $r('app.integer.calendar_switch_size_four'),
        left: $r('app.integer.calendar_switch_margin_size_twelve'),
        right: $r('app.integer.calendar_switch_margin_size_twelve')
      })
      .borderRadius($r('app.integer.calendar_switch_size_fourteen'))
    }.id('schedule_point_column_13')
    .height($r('app.string.calendar_switch_full_size'))
    .padding({
      top: $r('app.integer.calendar_switch_size_ten'),
      left: $r('app.integer.calendar_switch_size_twenty'),
      right: $r('app.integer.calendar_switch_size_twenty')
    })
    .width($r('app.string.calendar_switch_full_size'))
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // 添加日程按钮
    // Image：图片
    // 关键属性：bindSheet、addScheduleInfo
    Image($r('app.media.calendar_switch_add')).id('schedule_point_image_33')
      .bindSheet($$this.isShow, this.addScheduleInfo(), {
        height: $r('app.string.calendar_switch_full_size'),
        showClose: false,
      })
      .onClick(() => {
        // 初始化
        this.title = '';
        this.location = '';
        this.describe = '';
        this.reminderTimeIndex = 0;
        this.reminderTimeArray = [0];
        // 拉起添加日程页面
        this.isShow = true;
        if (CommonData.CURRENT_SELECT_DATE === '') {
          this.startTime = new Date();
        } else {
          const PARTS: string[] = CommonData.CURRENT_SELECT_DATE.split('-');
          if (Number(PARTS[0]) === Constants.TODAY_YEAR && Number(PARTS[1]) === Constants.TODAY_MONTH &&
            Number(PARTS[2]) === Constants.TODAY) {
            this.startTime = new Date();
          } else {
            this.startTime = new Date(Number(PARTS[0]), Number(PARTS[1]) - 1, Number(PARTS[2]));
          }
        }
        // 设置添加日程页面上显示的结束时间 = 开始时间 + 1h（60 * 60 * 1000）
        this.endTime.setTime(this.startTime.getTime() + 60 * 60 * 1000);
        // 格式化时间
        this.scheduleStartTime = this.dateFormat.format(this.startTime);
        this.scheduleEndTime = this.dateFormat.format(this.endTime);
      })
      .width($r('app.integer.calendar_switch_size_thirty'))
      .height($r('app.integer.calendar_switch_size_thirty'))
  }
}