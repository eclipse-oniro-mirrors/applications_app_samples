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
/*

* >查找控件属性
* | No. | API                                | 功能描述                       |
* |-----|------------------------------------|----------------------------|
* | 1   | getBundleName():Promise<string>    | 获取bundleName                      |
* | 2   | getBounds():Promise<Rect>          | 获取window的区域            |
* | 3   | getTitle():Promise<string>         | 获取指定window title                    |
* | 4   | getWindowMode():Promise<WindowMode> | 获取window类型。                  |
* | 5   | isFocused():Promise<boolean>       | 货物window状态。                 |
* | 6   | isActived():Promise<boolean>       | 获取当前window是否active。                 |
*
 */

import { beforeAll, describe, expect, it, TestType } from "../../../../../hypium/index";
import { abilityDelegatorRegistry, Driver, UiWindow } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const TAG: string = 'WindowAttr_Test';
const BUNDLE: string = 'WindowAttr_';
const waitUiReadyMs: int = 1000;

export default function WindowAttr(): void {
  describe('WindowAttr', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.number:WindowAttr_001
     * @tc.name: WindowAttr_Test_001
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 设置window指定的大小与方向测试
     */
    it('WindowAttr_Test_001', TestType.FUNCTION, async (): Promise<void> => {
      hilog.info(0x0000, TAG, `${BUNDLE}Test_001 start`);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let window: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
      // 获取widow bundle名称;
      await driver.delayMs(waitUiReadyMs);
      let name: string = await window!.getBundleName();
      // 断言bundleName
      expect(name == bundleName).assertTrue();
    })
  })
}
