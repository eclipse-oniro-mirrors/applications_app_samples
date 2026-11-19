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

import { PAINT_GROUP } from '../schema/CapabilityPaint';
import { GroupHost } from '../widgets/GroupHost';

// 画笔能力域页面：端点、拐角、线宽、混合模式、路径效果与阴影。
@Entry
@Component
struct CapabilityPaintDemo {
  build() {
    Column() {
      GroupHost({ group: PAINT_GROUP })
    }
    .width('100%')
    .height('100%')
  }
}
