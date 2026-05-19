'use static';
/**
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

// [Start waitForComp_sta_sample]
import { describe, it, Level, Size, TestType } from "../../../../../hypium/index";
// 导入测试依赖kit
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
// 指定被测应用包名、ability名，请开发者替换为被测应用包名和ability名
const bundleName: string = 'com.uitest.acts.static';

export default function abilityTest(): void {
  describe('waitForComp_sample', (): void => {
    it('testWaitForComponent_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (): Promise<void> => {
        // 拉起目标应用
        await startAbility(bundleName, 'EntryAbility');
        await Utils.msSleep(2000);
        let driver: Driver = Driver.create();
        await Utils.pushUrl('pages/Click', 'Click');
        await Utils.msSleep(2000);
        // 通过等待目标应用首页上的指定控件出现，判断应用拉起完成
        await driver.waitForComponent(ON.text('singleClick'), 1000);
      })
  })
}

// [End waitForComp_sta_sample]
