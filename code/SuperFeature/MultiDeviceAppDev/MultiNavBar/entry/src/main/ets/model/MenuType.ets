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

export interface MenuType {
  name: Resource;
  icon?: Resource;
  subController?: TabsController;
  // 字段名沿用存量下划线写法，已有数十处用例按此名断言，改名收益低于改动成本，故保留。
  subController_sm?: TabsController;
  subTitleList?: MenuType[];
  menuContent?: string;
  isVisible?: boolean;
  parentNode?: number;
}
