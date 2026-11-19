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
 * @file entry/src/main/ets/pages/universal/events/areaChangeEventSample/AreaChangeEventSample.ets
 * 文件职责：AreaChangeEventSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：AreaSideName、AreaChangeEventSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemSlider } from '../../../../common/AttributeModificationTool'
import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'
import Logger from '../../../../util/Logger'

/**
 * AreaSideName：枚举定义，承载本文件对应的逻辑与数据。
 */
enum AreaSideName {
  NONE,
  CORNER,
  TOP,
  LEFT,
  RIGHT,
  BOTTOM
}

const BALL_SIZE: number = 24

const BALL_DEFAULT_POS_X: number = 48

const BALL_DEFAULT_POS_Y: number = 48

const STEP_DISTANCE: number = 5

const MOVE_INTERVAL: number = 16 // ms

/**
 * AreaChangeEventSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct AreaChangeEventSample {
  // @State ballPositionX：组件内部状态
  @State ballPositionX: number = BALL_DEFAULT_POS_X
  // @State ballPositionY：组件内部状态
  @State ballPositionY: number = BALL_DEFAULT_POS_Y
  // @State areaCurrentWidthPercent：组件内部状态
  @State areaCurrentWidthPercent: number = 100
  // @State areaCurrentHeightPercent：组件内部状态
  @State areaCurrentHeightPercent: number = 30
  // @State areaChangedInfo：组件内部状态
  @State areaChangedInfo: string = ''
  private areaRight: number = 0
  private areaBottom: number = 0
  private motionStartingCheckingTimer: number = 0
  private motionTimer: number = 0
  private xDirection: number = 1 // 1 为正方向，-1 为负方向
  private yDirection: number = 1 // 1 为正方向，-1 为负方向

  /**
   * onPageShow：页面进入前台时回调。
   */
  onPageShow() {
    this.startMotionControlling()
  }

  /**
   * onPageHide：页面退到后台时回调。
   */
  onPageHide() {
    clearTimeout(this.motionStartingCheckingTimer)
    clearInterval(this.motionTimer)
  }

  /**
   * startMotionControlling：执行 startMotionControlling 相关逻辑。
   */
  startMotionControlling() {
    clearTimeout(this.motionStartingCheckingTimer)
    this.motionStartingCheckingTimer = setTimeout(() => {
      clearInterval(this.motionTimer)
      this.resetBallMotion()
      this.motionTimer = setInterval(() => {
        this.moveBall()
      }, MOVE_INTERVAL)
    }, 500)
  }

  /**
   * resetBallMotion：执行 resetBallMotion 相关逻辑。
   */
  resetBallMotion() {
    this.ballPositionX = BALL_DEFAULT_POS_X
    this.ballPositionY = BALL_DEFAULT_POS_Y
    this.xDirection = 1
    this.yDirection = 1
  }

  /**
   * isSideReached：执行 isSideReached 相关逻辑。
   */
  isSideReached(): boolean {
    if ((this.ballPositionX > 0) && (this.ballPositionX < this.areaRight - BALL_SIZE)
    && (this.ballPositionY > 0) && (this.ballPositionY < this.areaBottom - BALL_SIZE)) {
      return false
    }
    return true
  }

  /**
   * calculateReachedSide：执行 calculateReachedSide 相关逻辑。
   */
  calculateReachedSide(): AreaSideName {
    if (!this.isSideReached()) {
      return AreaSideName.NONE
    }
    if (this.ballPositionX <= 0) {
      if (this.ballPositionY <= 0 || this.ballPositionY >= (this.areaBottom - BALL_SIZE)) {
        // reached the corner
        return AreaSideName.CORNER
      }
      return AreaSideName.LEFT
    }
    if (this.ballPositionX >= (this.areaRight - BALL_SIZE)) {
      if (this.ballPositionY <= 0 || this.ballPositionY >= (this.areaBottom - BALL_SIZE)) {
        // reached the corner
        return AreaSideName.CORNER
      }
      return AreaSideName.RIGHT
    }
    if (this.ballPositionY <= 0) {
      if (this.ballPositionX <= 0 || this.ballPositionX >= (this.areaRight - BALL_SIZE)) {
        // reached the corner
        return AreaSideName.CORNER
      }
      return AreaSideName.TOP
    }
    if (this.ballPositionY >= (this.areaBottom - BALL_SIZE)) {
      if (this.ballPositionX <= 0 || this.ballPositionX >= (this.areaRight - BALL_SIZE)) {
        // reached the corner
        return AreaSideName.CORNER
      }
      return AreaSideName.BOTTOM
    }
    return AreaSideName.NONE
  }

  /**
   * decideMoveDirection：执行 decideMoveDirection 相关逻辑。
   */
  decideMoveDirection() {
    let reachedSide = this.calculateReachedSide()
    if (reachedSide === AreaSideName.NONE) {
      return
    }
    if (reachedSide === AreaSideName.CORNER) {
      this.xDirection = this.xDirection * -1
      this.yDirection = this.yDirection * -1
      return
    }

    // 再以当前运动方向生成新的方向
    if (reachedSide === AreaSideName.LEFT || reachedSide === AreaSideName.RIGHT) {
      this.xDirection = this.xDirection * -1
    } else {
      this.yDirection = this.yDirection * -1
    }
  }

  /**
   * moveBall：执行 moveBall 相关逻辑。
   */
  moveBall() {
    if (this.ballPositionX >= this.areaRight || this.ballPositionY >= this.areaBottom) {
      // reset
      this.resetBallMotion()
      return
    }
    this.decideMoveDirection()
    this.ballPositionX = this.ballPositionX + (STEP_DISTANCE * this.xDirection)
    this.ballPositionY = this.ballPositionY + (STEP_DISTANCE * this.yDirection)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.component_area_change_event') }).id('area_change_event_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：内边距、尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.component_area_change_action_tips') })
            .id('area_change_event_sample_introduction_title_5')
          // Column：垂直布局容器
          Column() {
            // slider for controlling the area width
            // CommonItemSlider：CommonItemSlider 自定义组件
            CommonItemSlider({
              changeValue: $areaCurrentWidthPercent,
              min: 30,
              max: 100,
              name: $r('app.string.size_width')
            }).id('area_change_event_sample_common_item_slider_7')
            // slider for controlling the area height
            // CommonItemSlider：CommonItemSlider 自定义组件
            CommonItemSlider({
              changeValue: $areaCurrentHeightPercent,
              min: 30,
              max: 100,
              name: $r('app.string.size_height')
            }).id('area_change_event_sample_common_item_slider_8')
          }.id('area_change_event_sample_column_6')

          // Column：垂直布局容器
          // 关键属性：内边距、圆角、背景色
          Column() {
            // Row：水平布局容器
            // 关键属性：高度、function toString() { [native code] }、宽度、背景色、区域变化回调
            Row() {
              // Button：按钮
              // 关键属性：宽度、高度、背景色、绝对定位
              Button({ type: ButtonType.Circle, stateEffect: false }).id('area_change_event_sample_button_11')
                .width(BALL_SIZE)
                .height(BALL_SIZE)
                .backgroundColor(0x317aff)
                .position({ x: this.ballPositionX, y: this.ballPositionY })
            }.id('area_change_event_sample_row_10')
            .height(`${this.areaCurrentHeightPercent.toString()}%`)
            .width(`${this.areaCurrentWidthPercent.toString()}%`)
            .backgroundColor($r('app.color.background_shallow_grey'))
            .onAreaChange((oldValue: Area, newValue: Area) => {
              this.areaRight = newValue.width as number
              this.areaBottom = newValue.height as number
              Logger.error(`ROW area: ${JSON.stringify(newValue)}`)
              this.areaChangedInfo
              = 'Area Info:\n' + '  globalPos:\n    x: ' + newValue.globalPosition.x + '\n    y: '
              + newValue.globalPosition.y + '\n' + '  width: ' + newValue.width + '\n  height: ' + newValue.height
              this.startMotionControlling()
            })
          }.id('area_change_event_sample_column_9')
          .padding(12)
          .borderRadius(24)
          .backgroundColor(Color.White)

          // touch location information
          // Text：文本
          // 关键属性：字号、宽度、文本对齐、内边距、外边距
          Text(this.areaChangedInfo).id('area_change_event_sample_text_12')
            .fontSize(18)
            .width('100%')
            .textAlign(TextAlign.Start)
            .padding({ left: 18, top: 30 })
            .margin({ bottom: 70 })
        }.id('area_change_event_sample_column_4')
        .padding({ left: 12, right: 12 })
        .constraintSize({ minHeight: '100%' })
      }.id('area_change_event_sample_scroll_3')
    }.id('area_change_event_sample_column_1')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
