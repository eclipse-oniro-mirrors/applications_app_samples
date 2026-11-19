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

import { CanvasColor, SunCanvasConfig } from './CanvasConstants'

/**
 * 日出日落图
 * @param context 画布上下文
 * @param img 太阳图标位图，调用方传入 ImageBitmap；形参标为 Object 以便测试桩复用同一入口
 */
function initSun(context: CanvasRenderingContext2D, img: Object) {
  /*
   * 根据日出日落时间点绘制
   * 获取两个时间点
   * 分割成一个半圆
   * 角度换算刻度
   * 绘制
   */

  const begin = SunCanvasConfig.BEGIN_LABEL
  const final = SunCanvasConfig.END_LABEL
  const now = new Date()
  const time: number = now.getHours()
  let flag = true // 太阳是否绘制
  let scale: number = Math.floor((time - SunCanvasConfig.SUNRISE_HOUR) * SunCanvasConfig.SCALE_MAX /
    SunCanvasConfig.SUN_SCALE_SPAN)
  if (now.getHours() < SunCanvasConfig.SUNRISE_HOUR || now.getHours() >= SunCanvasConfig.SUNSET_HOUR) {
    flag = false
    scale = 0
  }

  const width = context.width, height = context.height

  // 下线
  context.beginPath()
  context.strokeStyle = CanvasColor.AXIS_LINE
  context.setLineDash([])
  context.moveTo(0, height - SunCanvasConfig.BASELINE_OFFSET)
  context.lineTo(width, height - SunCanvasConfig.BASELINE_OFFSET)
  context.stroke()

  // 文字
  context.font = SunCanvasConfig.FONT
  context.fillStyle = CanvasColor.TEXT
  context.textAlign = 'center'
  context.textBaseline = 'middle'
  context.fillText(begin, width / SunCanvasConfig.TEXT_LEFT_DIVISOR, height - SunCanvasConfig.TEXT_BOTTOM_OFFSET)

  context.font = SunCanvasConfig.FONT
  context.fillStyle = CanvasColor.TEXT
  context.textAlign = 'center'
  context.textBaseline = 'middle'
  context.fillText(final, width / SunCanvasConfig.TEXT_LEFT_DIVISOR * SunCanvasConfig.TEXT_RIGHT_FACTOR,
    height - SunCanvasConfig.TEXT_BOTTOM_OFFSET)

  // 渐变色
  const color = context.createLinearGradient(0, 0, width, height)
  color.addColorStop(0, CanvasColor.GRADIENT_START)
  color.addColorStop(scale / SunCanvasConfig.SCALE_MAX, CanvasColor.GRADIENT_MIDDLE)
  color.addColorStop(1, CanvasColor.GRADIENT_END)
  context.save()
  context.beginPath()
  context.lineWidth = SunCanvasConfig.LINE_WIDTH
  if (flag) {
    context.strokeStyle = color
  } else {
    context.strokeStyle = CanvasColor.ARC_INACTIVE
  }
  context.arc(width / 2, height - SunCanvasConfig.ARC_BOTTOM_OFFSET, width * SunCanvasConfig.SUN_ARC_RADIUS_RATIO,
    Math.PI / 180 * SunCanvasConfig.SUN_ARC_START_DEGREE,
    Math.PI * 2 / 180 * SunCanvasConfig.SUN_ARC_END_DEGREE, false)
  context.setLineDash([SunCanvasConfig.DASH_LENGTH])
  context.stroke()
  context.restore()

  if (flag) {
    drawSun()
  }
  // color类型string
  function drawSun() {
    // x为刻度线
    context.save()
    // 弧度*π/180 得到弧度
    const deg = Math.PI / 180 * (SunCanvasConfig.SUN_ARC_START_DEGREE + scale * SunCanvasConfig.STEP_DEGREE)
    const offsetX = -(Math.cos(deg) * width * SunCanvasConfig.SUN_ARC_RADIUS_RATIO)
    const offsetY = -(Math.sin(deg) * width * SunCanvasConfig.SUN_ARC_RADIUS_RATIO)

    context.drawImage(img as ImageBitmap, 0, 0, SunCanvasConfig.ICON_SOURCE_SIZE, SunCanvasConfig.ICON_SOURCE_SIZE,
      width / 2 - offsetX - SunCanvasConfig.ICON_X_OFFSET,
      height - SunCanvasConfig.ICON_Y_OFFSET - offsetY,
      SunCanvasConfig.ICON_SIZE, SunCanvasConfig.ICON_SIZE)
  }
}

/**
 * 月出月落图
 * @param context 画布上下文
 * @param img 月亮图标位图，调用方传入 ImageBitmap
 * @param iconMoon 月相图标位图，调用方传入 ImageBitmap
 */
function initMoon(context: CanvasRenderingContext2D, img: Object, iconMoon: Object) {
  /*
    * 根据月出月落时间点绘制
    * 获取两个时间点
    * 分割成一个半圆
    * 角度换算刻度
    * 绘制
    */

  const begin = SunCanvasConfig.MOON_BEGIN_LABEL
  const final = SunCanvasConfig.MOON_END_LABEL
  const now = new Date()
  const time: number = now.getHours()
  let flag = true // 月亮是否绘制
  const index: number = time >= SunCanvasConfig.SUNSET_HOUR ? time - SunCanvasConfig.SUNSET_HOUR :
    time + SunCanvasConfig.MOON_NIGHT_OFFSET
  let scale = Math.floor(index * SunCanvasConfig.SCALE_MAX / SunCanvasConfig.MOON_SCALE_SPAN)
  if (now.getHours() >= SunCanvasConfig.SUNRISE_HOUR && now.getHours() < SunCanvasConfig.SUNSET_HOUR) {
    flag = false
    scale = 0
  }

  const width = context.width, height = context.height

  // 文字
  context.font = SunCanvasConfig.FONT
  context.fillStyle = CanvasColor.TEXT
  context.textAlign = 'center'
  context.textBaseline = 'middle'
  context.fillText(begin, width / SunCanvasConfig.TEXT_LEFT_DIVISOR, height - SunCanvasConfig.MOON_TEXT_BOTTOM_OFFSET)

  context.font = SunCanvasConfig.FONT
  context.fillStyle = CanvasColor.TEXT
  context.textAlign = 'center'
  context.textBaseline = 'middle'
  context.fillText(SunCanvasConfig.MOON_PHASE_LABEL, width / 2, height - SunCanvasConfig.MOON_TEXT_BOTTOM_OFFSET)

  context.font = SunCanvasConfig.FONT
  context.fillStyle = CanvasColor.TEXT
  context.textAlign = 'center'
  context.textBaseline = 'middle'
  context.fillText(final, width / SunCanvasConfig.TEXT_LEFT_DIVISOR * SunCanvasConfig.TEXT_RIGHT_FACTOR,
    height - SunCanvasConfig.MOON_TEXT_BOTTOM_OFFSET)

  context.drawImage(iconMoon as ImageBitmap, 0, 0, SunCanvasConfig.MOON_ICON_SOURCE_SIZE, SunCanvasConfig.MOON_ICON_SOURCE_SIZE,
    width / 2 - SunCanvasConfig.MOON_ICON_X_OFFSET, height - SunCanvasConfig.MOON_ICON_Y_OFFSET,
    SunCanvasConfig.MOON_ICON_SIZE, SunCanvasConfig.MOON_ICON_SIZE)

  // 渐变色
  const color = context.createLinearGradient(0, 0, width, height)
  color.addColorStop(0, CanvasColor.GRADIENT_START)
  color.addColorStop(scale / SunCanvasConfig.SCALE_MAX, CanvasColor.GRADIENT_MIDDLE)
  color.addColorStop(1, CanvasColor.GRADIENT_END)
  context.save()
  context.beginPath()
  context.lineWidth = SunCanvasConfig.LINE_WIDTH
  if (flag) {
    context.strokeStyle = color
  } else {
    context.strokeStyle = CanvasColor.ARC_INACTIVE
  }
  context.arc(width / 2, height - SunCanvasConfig.ARC_BOTTOM_OFFSET, width * SunCanvasConfig.MOON_ARC_RADIUS_RATIO,
    Math.PI / 180 * SunCanvasConfig.MOON_ARC_START_DEGREE,
    Math.PI * 2 / 180 * SunCanvasConfig.MOON_ARC_END_DEGREE, false)
  context.setLineDash([SunCanvasConfig.DASH_LENGTH])
  context.stroke()
  context.restore()

  if (flag) {
    drawMoon()
  }
  // color类型string
  function drawMoon() {
    // x为刻度线
    context.save()
    // 弧度*π/180 得到弧度
    const deg = Math.PI / 180 * (SunCanvasConfig.MOON_ARC_START_DEGREE + scale * SunCanvasConfig.STEP_DEGREE)
    const offsetX = -(Math.cos(deg) * width * SunCanvasConfig.MOON_ARC_RADIUS_RATIO)
    const offsetY = -(Math.sin(deg) * width * SunCanvasConfig.MOON_ARC_RADIUS_RATIO)

    context.drawImage(img as ImageBitmap, 0, 0, SunCanvasConfig.ICON_SOURCE_SIZE, SunCanvasConfig.ICON_SOURCE_SIZE,
      width / 2 - offsetX - SunCanvasConfig.ICON_X_OFFSET,
      height - SunCanvasConfig.ICON_Y_OFFSET - offsetY,
      SunCanvasConfig.ICON_SIZE, SunCanvasConfig.ICON_SIZE)
  }
}

export { initSun, initMoon }
