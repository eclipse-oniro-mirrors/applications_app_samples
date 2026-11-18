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

import { abilityDelegatorRegistry } from '@kit.TestKit';
import type { TestRunner } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';

export default class OpenHarmonyTestRunner implements TestRunner {
  // 记录测试准备状态，便于识别当前测试包。
  onPrepare(): void {
    console.info('Virtual file drag tests prepared');
  }

  // 交由 Hypium 执行本工程注册的用例集。
  onRun(): void {
    Hypium.hypiumTest(abilityDelegatorRegistry.getAbilityDelegator(),
      abilityDelegatorRegistry.getArguments(), testsuite);
  }
}
