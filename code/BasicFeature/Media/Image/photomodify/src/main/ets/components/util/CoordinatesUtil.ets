/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file src/main/ets/components/util/CoordinatesUtil.ets
 * 文件职责：CoordinatesUtil 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：transformCoordinates、offsetOrigin、Point。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * 转换坐标系
 */
export function transformCoordinates(point: Point, scale: number): Point {
  return new Point(point.x * scale, point.y * scale);
}

/**
 * 根据原点的偏移量，还原坐标
 * @param p
 * @param offX
 * @param offY
 */
export function offsetOrigin(p: Point, offX: number, offY: number): Point {
  return new Point(p.x - offX, p.y - offY);
}

/**
 * Point：类定义，承载本文件对应的逻辑与数据。
 */
export class Point {
  x: number
  y: number

  /** 构造 CoordinatesUtil 实例。 */
  constructor(x: number, y: number) {
    this.x = x
    this.y = y
  };
}
