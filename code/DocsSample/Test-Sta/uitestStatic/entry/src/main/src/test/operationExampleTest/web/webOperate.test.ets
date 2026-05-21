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

/**
 * uitest对web页面内的控件进行查询和操作
 */

import { beforeAll, describe, expect, it } from "../../../../../hypium/index";
import { abilityDelegatorRegistry, Component, Driver, ON, Rect, Point } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;

export default function webOperateTest(): void {
  describe('webOperateTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.number:testWebInputText_001
     * @tc.name: testWebInputText
     * @tc.desc: webview控件加载html页面，根据html中的控件id查询到控件，并对控件进行操作
     */
    it('testWebInputText', 0, async (): Promise<void> => {
      await Utils.pushUrl('pages/Web', 'Web');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      try {
        let webComponent: Component | null = await driver.findComponent(ON.id('webComponent'));
        let webComponentRect: Rect = await webComponent!.getBounds();
        let webComponentLeft: int = webComponentRect.left;
        let webComponentTop: int = webComponentRect.top;
        let webComponentWidth: int = webComponentRect.right - webComponentRect.left;
        let webComponentHeight: int = webComponentRect.bottom - webComponentRect.top;
        let webComponentCenter: Point = await webComponent!.getBoundsCenter();
        let text: string = 'hello';
        await driver.inputText({
          x: webComponentCenter.x, y: webComponentCenter.y
        }, text);
        await driver.delayMs(3000);
        expect(true).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      }
    })
  })
}
