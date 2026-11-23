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

import { application } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(0x0000, 'testTag', 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    const context = delegator.getAppContext();
    const uid: number = Math.floor(context.applicationInfo.uid / 200000);
    // Coverage 插桩读取进程全局字段，字段名由插桩工具约定，不能用模块局部变量替代。
    new Function(
      'savePath', 'readPath', 'testMode',
      'this.__savePath__ = savePath; this.__readPath__ = readPath; this.__testMode__ = testMode;'
    )('/data/storage/el2/base/js_coverage.json',
      '/data/app/el2/' + uid + '/base/' + args.bundleName + '/js_coverage.json',
      'ohostest');

    try {
      await application.createModuleContext(context.getApplicationContext(), args.parameters['-m']);
      hilog.info(0x0000, 'testTag', 'Registering tests outside UIAbility lifecycle');
      Hypium.hypiumTest(delegator, args, testsuite);
    } catch (error) {
      const message: string = 'OpenHarmonyTestRunner failed: ' + String(error);
      hilog.error(0x0000, 'testTag', '%{public}s', message);
      delegator.finishTest(message, -1, () => {});
    }
  }
}
