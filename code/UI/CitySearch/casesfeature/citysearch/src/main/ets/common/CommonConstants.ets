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
 * @file casesfeature/citysearch/src/main/ets/common/CommonConstants.ets
 * 文件职责：CommonConstants 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CommonConstants。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

export class CommonConstants {
  // 列表间隔
  static readonly LIST_SPACE: number = 14;

  // 列表项初始化index
  static readonly INITIAL_INDEX: number = 0;

  // 透明度
  static readonly OPACITY: number = 0.6;

  // layoutWeight
  static readonly LAYOUT_WEIGHT: number = 1;

  // 字母大小
  static readonly ALPHABET_SIZE: number = 20;

  // 字母margin-right
  static readonly ALPHABET_MARGIN_RIGHT_SIZE: number = -8;

  // 100%
  static readonly VIEW_FULL: string = '100%';

  // 最大行数
  static readonly MAX_LINES: number = 3;

  // 字体粗细
  static readonly WEIGHT: number = 400;

  // 搜索框初始化内容
  static readonly PLACE_HOLDER_TEXT: string = '长沙';

  // 热门城市标签宽度
  static readonly HOT_CITY_TEXT_WIDTH: string = '22%';

  // 初始化城市value值
  static readonly INIT_VALUE: string = '洛阳';
}