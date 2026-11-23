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
 * @file src/main/ets/components/model/MaterialModels.ets
 * 文件职责：MaterialModels 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：getFontData、getImageData。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { FontColorData, ImageData } from './MaterialData';

/**
 * getFontData：函数定义，承载本文件对应的逻辑与数据。
 */
function getFontData(color: Resource, name: Resource) {
  // resourceManager.getStringValue 无法获取color的string形式，so。。
  return new FontColorData(color, name);
}

/**
 * getImageData：函数定义，承载本文件对应的逻辑与数据。
 */
function getImageData(image: Resource) {
  return new ImageData(image);
}

export const fontColors: FontColorData[] = [
getFontData($r('app.color.material_font_color_one'), $r('app.string.material_font_color_one')),
getFontData($r('app.color.material_font_color_two'), $r('app.string.material_font_color_two')),
getFontData($r('app.color.material_font_color_three'), $r('app.string.material_font_color_three')),
getFontData($r('app.color.material_font_color_four'), $r('app.string.material_font_color_four')),
getFontData($r('app.color.material_font_color_five'), $r('app.string.material_font_color_five')),
getFontData($r('app.color.material_font_color_six'), $r('app.string.material_font_color_six')),
getFontData($r('app.color.material_font_color_seven'), $r('app.string.material_font_color_seven')),
getFontData($r('app.color.material_font_color_eight'), $r('app.string.material_font_color_eight')),
getFontData($r('app.color.material_font_color_nine'), $r('app.string.material_font_color_nine')),
getFontData($r('app.color.material_font_color_ten'), $r('app.string.material_font_color_ten')),
getFontData($r('app.color.material_font_color_eleven'), $r('app.string.material_font_color_eleven')),
getFontData($r('app.color.material_font_color_twelve'), $r('app.string.material_font_color_twelve')),
getFontData($r('app.color.material_font_color_thirteen'), $r('app.string.material_font_color_thirteen'))
];

export const stickers: ImageData[] = [
getImageData($r('app.media.img_rocket')),
getImageData($r('app.media.img_love')),
getImageData($r('app.media.img_smile')),
getImageData($r('app.media.img_apple')),
getImageData($r('app.media.img_cake')),
getImageData($r('app.media.img_flag')),
getImageData($r('app.media.img_chat'))
];