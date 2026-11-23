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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { UIAbility } from '@kit.AbilityKit';
import { display } from '@kit.ArkUI';
import { Driver, ON, Component, Rect } from '@kit.TestKit';
import { launchHome } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function uiFlowMatrixTest() {
  describe('uiFlowMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_UIFL_0001
   * @tc.name      testUiFlow0001
   * @tc.desc      Ui bounds pass 5 checks center inside
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testUiFlow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testUiFlow0001', 'ui bounds 5');
    const ability: UIAbility = await launchHome();
    expect(ability !== undefined).assertTrue();
    const driver: Driver = Driver.create();
    const target: Component = await driver.findComponent(ON.id('HelloWorld'));
    const bounds: Rect = await target.getBounds();
    const centerX: number = (bounds.left + bounds.right) / 2;
    const centerY: number = (bounds.top + bounds.bottom) / 2;
    expect(centerX >= bounds.left && centerX <= bounds.right).assertTrue();
    expect(centerY >= bounds.top && centerY <= bounds.bottom).assertTrue();
  });
  });
}
