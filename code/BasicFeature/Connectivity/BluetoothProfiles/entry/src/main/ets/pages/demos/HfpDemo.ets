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

import { ProfileDemoPage } from '../../components/ProfileDemoPage';
import { ProfileKind, metaOf } from '../../model/ProfileCatalog';

/** HFP 演示页：以 AG 角色创建实例，查询已连接的耳机/车机等 HF 设备 */
@Component
export struct HfpDemo {
  navPathStack: NavPathStack = new NavPathStack();

  build() {
    ProfileDemoPage({
      kind: ProfileKind.HFP,
      title: metaOf(ProfileKind.HFP).title,
      logSource: 'HFP',
      navPathStack: this.navPathStack
    })
  }
}
