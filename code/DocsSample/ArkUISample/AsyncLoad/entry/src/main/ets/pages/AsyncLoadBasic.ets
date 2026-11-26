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

// [Start AsyncLoadBasic]
import { UIUtils, ComponentInit } from '@kit.ArkUI';

// 构建耗时较长的自定义组件
@ComponentV2
struct HeavyComponent {
  @ComponentInit
  init() {
    // 仅构造期调用生效：组件进入异步加载，首个渲染帧不构建实际内容
    UIUtils.getCustomComponentContext(this).enableAsyncLoad();
  }

  build() {
    // build推迟至后续空闲时段分片执行
    Column() {
      Text('实际内容')
        .fontSize(24)
      // ...更多构建耗时较长的内容
    }
  }
}

@Entry
@ComponentV2
struct Index {
  build() {
    Column() {
      Text('页面其余内容首个渲染帧正常呈现')
      HeavyComponent()
    }
  }
}
// [End AsyncLoadBasic]
