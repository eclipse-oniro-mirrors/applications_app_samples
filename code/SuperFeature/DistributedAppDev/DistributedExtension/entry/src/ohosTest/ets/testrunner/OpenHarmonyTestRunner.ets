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

import { TestRunner } from '@kit.TestKit';
import { DistributedTestRunner } from './DistributedTestRunner';

/**
 * 测试框架的入口文件：DevEco 运行测试时固定下发 `-s unittest OpenHarmonyTestRunner`，
 * 框架按这个名字拼出 `ets/testrunner/OpenHarmonyTestRunner.abc` 再直接 new 出默认导出，
 * 所以文件名不能改。真正的驱动逻辑在同目录的 DistributedTestRunner.ets，这里只做转发。
 */
export default class OpenHarmonyTestRunner implements TestRunner {
  private runner: DistributedTestRunner = new DistributedTestRunner();

  onPrepare(): void {
    this.runner.onPrepare();
  }

  async onRun(): Promise<void> {
    await this.runner.onRun();
  }
}
