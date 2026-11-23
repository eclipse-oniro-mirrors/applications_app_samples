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
 * @file src/main/ets/components/model/MaterialData.ets
 * 文件职责：MaterialData 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MaterialData、FontColorData、ImageData。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

interface MaterialData {
  /**
   * getResource：执行 getResource 相关逻辑。
   */
  getResource(): Resource | undefined;

  /**
   * getName：执行 getName 相关逻辑。
   */
  getName(): Resource | undefined;
}

/**
 * FontColorData：类定义，承载本文件对应的逻辑与数据。
 */
class FontColorData implements MaterialData {
  fontColor?: Resource;
  name?: Resource;

  /** 构造 MaterialData 实例。 */
  constructor(fontColor?: Resource, name?: Resource) {
    this.fontColor = fontColor;
    this.name = name;
  }

  /**
   * getResource：执行 getResource 相关逻辑。
   */
  getResource(): Resource | undefined {
    return this.fontColor;
  }

  /**
   * getName：执行 getName 相关逻辑。
   */
  getName(): Resource | undefined {
    return this.name;
  }
}

/**
 * ImageData：类定义，承载本文件对应的逻辑与数据。
 */
class ImageData implements MaterialData {
  image?: Resource;
  name?: Resource;

  /** 构造 MaterialData 实例。 */
  constructor(image?: Resource, name?: Resource) {
    this.image = image;
  }

  /**
   * getResource：执行 getResource 相关逻辑。
   */
  getResource(): Resource | undefined {
    return this.image;
  }

  /**
   * getName：执行 getName 相关逻辑。
   */
  getName(): Resource | undefined {
    return this.name;
  }
}

export { MaterialData, FontColorData, ImageData };