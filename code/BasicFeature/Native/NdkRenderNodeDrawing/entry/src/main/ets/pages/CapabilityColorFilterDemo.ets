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

import { COLOR_FILTER_GROUP } from '../schema/CapabilityColorFilter';
import { GroupHost } from '../widgets/GroupHost';

// 颜色滤波器能力域页面：混合模式、颜色矩阵、亮度、组合与光照。
@Entry
@Component
struct CapabilityColorFilterDemo {
  build() {
    Column() {
      GroupHost({ group: COLOR_FILTER_GROUP })
    }
    .width('100%')
    .height('100%')
  }
}
