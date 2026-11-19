/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
 * @file entry/src/main/ets/model/CategoricalDataType.ets
 * 文件职责：CategoricalDataType 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FirstLevelCategory、SecondLevelCategory、ThirdLevelCategory、FourthLevelCategory。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

export interface FirstLevelCategory {
  childNodes: SecondLevelCategory[] | ThirdLevelCategory[],
  selectedImage: Resource, // The icon for the first-level category is selected
  unselectedImage: Resource, // The icon for the first-level category is not selected
  tabBarName: Resource // First-level category title
}

/**
 * SecondLevelCategory：接口定义，承载本文件对应的逻辑与数据。
 */
export interface SecondLevelCategory {
  title: Resource, // Second-level category titles
  childNodes: ThirdLevelCategory[],
  image?: Resource
}

/**
 * ThirdLevelCategory：接口定义，承载本文件对应的逻辑与数据。
 */
export interface ThirdLevelCategory {
  image: Resource, // Third-level category icon
  title: Resource, // Third-level category headings
  url?: string, // Third-level category detail page URL
  childNodes?: FourthLevelCategory[]
}

/**
 * FourthLevelCategory：接口定义，承载本文件对应的逻辑与数据。
 */
export interface FourthLevelCategory {
  title: Resource, // Fourth-level category titles
  url: string // Fourth-level category detail page URL
}