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
 * @file src/main/ets/components/model/AdjustData.ets
 * 文件职责：AdjustData 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Tasks、CropTasks、ScaleTasks、ColorSpaceTasks、TaskData。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

export enum Tasks {
  SCALE,
  CROP,
  ROTATE,
  TONING,
  TEXT,
  STICKER,
  ADJUST,
  MARK,
  COLORSPACE,
  HDR,
  ENCODEJS,
  DECODEJS,
  ENCODENDK,
  DECODENDK,
  NONE = 99
}

/**
 * CropTasks：枚举定义，承载本文件对应的逻辑与数据。
 */
export enum CropTasks {
  ORIGIN,
  ONE_ONE,
  THREE_FOUR,
  NINE_SIXTH,
  NONE = 99
}

/**
 * ScaleTasks：枚举定义，承载本文件对应的逻辑与数据。
 */
export enum ScaleTasks {
  AMPLIFICARION,
  NARROW,
  NONE = 99
}

/**
 * ColorSpaceTasks：枚举定义，承载本文件对应的逻辑与数据。
 */
export enum ColorSpaceTasks {
  ADOBERGB,
  SRGB,
  DCIP3,
  DISPLAYP3,
  NONE = 99
}

/**
 * TaskData：类定义，承载本文件对应的逻辑与数据。
 */
export class TaskData {
  task?: number
  image?: Resource
  text?: Resource
  name?: string

  /** 构造 AdjustData 实例。 */
  constructor(task?: number, image?: Resource, text?: Resource, name?: string) {
    this.task = task;
    this.image = image;
    this.text = text;
    this.name = name;
  }
}