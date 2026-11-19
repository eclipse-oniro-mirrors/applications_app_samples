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

import { AirQualityConfig, CanvasColor } from './CanvasConstants'

/** 空气质量环绘制所需的只读字段，main 的 AirData 与测试桩对象均满足该结构 */
export interface AirQualityLike {
  airQuality: string
  airDesc: string
}

export function initRound(context: CanvasRenderingContext2D, air: AirQualityLike) {
  const width = context.width
  const height = context.height
  // 百分比转换
  const percent = +air.airQuality * AirQualityConfig.PERCENT_FACTOR / AirQualityConfig.PERCENT_BASE +
    AirQualityConfig.PERCENT_OFFSET
  // 背景
  context.save()
  context.beginPath()
  context.lineWidth = AirQualityConfig.LINE_WIDTH
  context.lineCap = 'round'
  context.strokeStyle = CanvasColor.ROUND_BACKGROUND
  context.arc(width / 2, width / 2, width / 2 - AirQualityConfig.ARC_INSET,
    Math.PI * AirQualityConfig.BACKGROUND_START, Math.PI * AirQualityConfig.BACKGROUND_END, true)
  context.stroke()
  context.closePath()
  context.restore()

  // 绘制圆环
  context.save()
  context.lineWidth = AirQualityConfig.LINE_WIDTH
  context.lineCap = 'round'
  context.beginPath()
  // 渐变色
  const color = context.createLinearGradient(0, 0, width, height)
  color.addColorStop(0, CanvasColor.ROUND_START)
  color.addColorStop(AirQualityConfig.GRADIENT_MIDDLE_STOP, CanvasColor.ROUND_MIDDLE)
  color.addColorStop(1, CanvasColor.ROUND_END)
  context.strokeStyle = color

  context.arc(width / 2, width / 2, width / 2 - AirQualityConfig.ARC_INSET,
    Math.PI * AirQualityConfig.VALUE_START, Math.PI * percent, false)
  context.stroke()
  context.closePath()
  context.restore()

  // 中间文字
  context.font = AirQualityConfig.DESC_FONT
  context.fillStyle = CanvasColor.ROUND_VALUE
  context.textAlign = 'center'
  context.textBaseline = 'middle'
  context.fillText(air.airDesc, width / 2, height / 2 - AirQualityConfig.DESC_OFFSET_Y)

  // 中间文字
  context.font = AirQualityConfig.VALUE_FONT
  context.fillStyle = CanvasColor.ROUND_VALUE
  context.textAlign = 'center'
  context.textBaseline = 'middle'
  context.fillText(air.airQuality, width / 2, height / 2 + AirQualityConfig.VALUE_OFFSET_Y)

  context.font = AirQualityConfig.SCALE_FONT
  context.fillStyle = CanvasColor.ROUND_VALUE_TIP
  context.textAlign = 'center'
  context.textBaseline = 'middle'
  context.fillText(AirQualityConfig.MIN_LABEL, width / 2 - AirQualityConfig.MIN_LABEL_OFFSET_X,
    height - AirQualityConfig.LABEL_OFFSET_Y)

  context.font = AirQualityConfig.SCALE_FONT
  context.fillStyle = CanvasColor.ROUND_VALUE_TIP
  context.textAlign = 'center'
  context.textBaseline = 'middle'
  context.fillText(AirQualityConfig.MAX_LABEL, width / 2 + AirQualityConfig.MAX_LABEL_OFFSET_X,
    height - AirQualityConfig.LABEL_OFFSET_Y)
}
