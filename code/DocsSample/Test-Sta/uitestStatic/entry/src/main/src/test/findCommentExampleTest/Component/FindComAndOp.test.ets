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

// [Start findAndOp_sta_sample]
import { describe, it, TestType } from '../../../../../hypium/index';
// 导入测试依赖kit
import { Component, Driver, ON, On } from '@kit.TestKit';

export default function abilityTest(): void {
  describe('componentOperationTest', (): void => {
    /**
     * 查找类型为'Button'的控件，并进行控件点击操作
     */
    it('componentSearchAndOperation', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let button: Component | null = await driver.findComponent(ON.type('Button'));
      if (button != null) {
        await button.click();
      }
    })

    /**
     * 利用相对位置查找控件，查找'Scroll'类型控件中文本内容为'123'的控件
     */
    it('relativeComponentSearch', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      let on: On = ON.text('123').within(ON.type('Scroll'));
      let items: Array<Component> | null = await driver.findComponents(on);
    })

    /**
     * 查找类型为'Image'的控件，并进行对其进行双指放大操作
     */
    it('componentPinch', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      let image: Component | null = await driver.findComponent(ON.type('Image'));
      if (image != null) {
        await image.pinchOut(1.5);
      }
    })
  })
}

// [End findAndOp_sta_sample]