/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { COLOR_GROUP } from '../schema/CapabilityColor';
import { GroupHost } from '../widgets/GroupHost';

// 颜色能力域页面：调色板、透明度阶梯、混色与分量重排。
@Entry
@Component
struct CapabilityColorDemo {
  build() {
    Column() {
      GroupHost({ group: COLOR_GROUP })
    }
    .width('100%')
    .height('100%')
  }
}
