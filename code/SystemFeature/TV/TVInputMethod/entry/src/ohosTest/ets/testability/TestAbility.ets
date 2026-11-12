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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { window } from '@kit.ArkUI';
import testsuite from '../test/List.test';
import { Hypium } from '@ohos/hypium';
import { logger } from '../util/Logger';

const TAG: string = 'TestAbility';

/**
 * 安全序列化：日志打印对象时避免 JSON.stringify 抛出的异常（如循环引用）中断用例进程
 */
function safeStringify(value: Object): string {
  try {
    return JSON.stringify(value);
  } catch (error) {
    return `stringify failed: ${error}`;
  }
}

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    logger.info(TAG, `TestAbility onCreate, want param: ${safeStringify(want)},launchParam: ${safeStringify(launchParam)}`);
    let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    logger.info(TAG, 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  onDestroy(): void {
    logger.info(TAG, 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    logger.info(TAG, 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        logger.error(TAG, `Failed to load the content. Cause: ${safeStringify(err)}`);
        return;
      }
      logger.info(TAG, `Succeeded in loading the content.`);
    });
  }

  onWindowStageDestroy(): void {
    logger.info(TAG, 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    logger.info(TAG, 'TestAbility onForeground');
  }

  onBackground(): void {
    logger.info(TAG, 'TestAbility onBackground');
  }
}
