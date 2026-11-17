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

import abilityTest from './AbilityTest.test'
import msgModelTest from './model/MsgModelTest.test'
import dataSourceTest from './model/DataSourceTest.test'
import dataFactoryTest from './util/DataFactoryTest.test'
import chatFlowTest from './page/ChatFlowTest.test'
import secondaryPagesTest from './page/SecondaryPagesTest.test'
import mediaFlowTest from './page/MediaFlowTest.test'
import interactionMatrixTest from './page/InteractionMatrixTest.test'

export default function testsuite() {
  // 逻辑测试：模型、数据源、数据工厂
  msgModelTest()
  dataSourceTest()
  dataFactoryTest()
  // UI测试：聊天主链路 -> 次级页面 -> 媒体链路 -> 交互矩阵 -> 冒烟
  chatFlowTest()
  secondaryPagesTest()
  mediaFlowTest()
  interactionMatrixTest()
  abilityTest()
}
