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

// [Start AsyncLoadTimeoutSta]
import { UIUtils, ComponentInit, ComponentV2, Text } from '@kit.ArkUI';

@ComponentV2
struct HeavyComponent {
  @ComponentInit
  init() {
    // 3秒兜底：3秒内等待空闲分片构建，到期后强制加载
    UIUtils.getCustomComponentContext(this).enableAsyncLoad({ timeout: 3000 });
    // 不等待：组件在后续帧中被强制加载
    // UIUtils.getCustomComponentContext(this).enableAsyncLoad({ timeout: 0 });
    // 永不超时：持续等待空闲完成，配合占位组件呈现
    // UIUtils.getCustomComponentContext(this).enableAsyncLoad({ timeout: -1 });
  }

  build() {
    Text('实际内容')
  }
}

@Entry
@ComponentV2
struct Index {
  build() {
    Column() {
      HeavyComponent()
    }
  }
}
// [End AsyncLoadTimeoutSta]
