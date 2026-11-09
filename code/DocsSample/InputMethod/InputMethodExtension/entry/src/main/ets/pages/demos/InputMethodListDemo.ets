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

/**
 * NavDestination 容器页：把 InputMethodListDemoPage 挂到路由 pages/demos/InputMethodListDemo 上。
 * 演示逻辑都在 components 里，这一层只负责"页面"身份，便于首页统一导航。
 */

import { InputMethodListDemoPage } from '../../components/InputMethodListDemoPage';

@Component
export struct InputMethodListDemo {
  build() {
    Column() {
      InputMethodListDemoPage()
    }
    .width('100%')
    .height('100%')
  }
}
