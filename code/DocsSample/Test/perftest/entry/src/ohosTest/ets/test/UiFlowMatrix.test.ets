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
   * @tc.number    SUB_BMS_PERFTEST_UIFL_0001
   * @tc.name      testUiFlow0001
   * @tc.desc      Ui entry button 1 is reachable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testUiFlow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testUiFlow0001', 'ui button 1');
    const ability: UIAbility = await launchHome();
    expect(ability !== undefined).assertTrue();
    const driver: Driver = Driver.create();
    const target: Component = await driver.findComponent(ON.id('toPageList'));
    expect(target !== undefined).assertTrue();
    const label: string = await target.getText();
    expect(label.length > 0).assertTrue();
    expect(await target.isEnabled()).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UIFL_0002
   * @tc.name      testUiFlow0002
   * @tc.desc      Ui entry button 2 is reachable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testUiFlow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testUiFlow0002', 'ui button 2');
    const ability: UIAbility = await launchHome();
    expect(ability !== undefined).assertTrue();
    const driver: Driver = Driver.create();
    const target: Component = await driver.findComponent(ON.id('toNavigationPage'));
    expect(target !== undefined).assertTrue();
    const label: string = await target.getText();
    expect(label.length > 0).assertTrue();
    expect(await target.isEnabled()).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UIFL_0003
   * @tc.name      testUiFlow0003
   * @tc.desc      Ui bounds pass 1 checks non negative
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testUiFlow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testUiFlow0003', 'ui bounds 1');
    const ability: UIAbility = await launchHome();
    expect(ability !== undefined).assertTrue();
    const driver: Driver = Driver.create();
    const target: Component = await driver.findComponent(ON.id('toPageList'));
    const bounds: Rect = await target.getBounds();
    expect(bounds.left >= 0).assertTrue();
    expect(bounds.top >= 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UIFL_0004
   * @tc.name      testUiFlow0004
   * @tc.desc      Ui bounds pass 2 checks ordered corners
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testUiFlow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testUiFlow0004', 'ui bounds 2');
    const ability: UIAbility = await launchHome();
    expect(ability !== undefined).assertTrue();
    const driver: Driver = Driver.create();
    const target: Component = await driver.findComponent(ON.id('toPageList'));
    const bounds: Rect = await target.getBounds();
    expect(bounds.right > bounds.left).assertTrue();
    expect(bounds.bottom > bounds.top).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UIFL_0005
   * @tc.name      testUiFlow0005
   * @tc.desc      Ui bounds pass 3 checks inside screen
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testUiFlow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testUiFlow0005', 'ui bounds 3');
    const ability: UIAbility = await launchHome();
    expect(ability !== undefined).assertTrue();
    const driver: Driver = Driver.create();
    const target: Component = await driver.findComponent(ON.id('toPageList'));
    const bounds: Rect = await target.getBounds();
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(bounds.right <= screen.width).assertTrue();
    expect(bounds.bottom <= screen.height).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UIFL_0006
   * @tc.name      testUiFlow0006
   * @tc.desc      Ui bounds pass 4 checks positive extent
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testUiFlow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testUiFlow0006', 'ui bounds 4');
    const ability: UIAbility = await launchHome();
    expect(ability !== undefined).assertTrue();
    const driver: Driver = Driver.create();
    const target: Component = await driver.findComponent(ON.id('toPageList'));
    const bounds: Rect = await target.getBounds();
    const width: number = bounds.right - bounds.left;
    const height: number = bounds.bottom - bounds.top;
    expect(width > 0).assertTrue();
    expect(height > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UIFL_0007
   * @tc.name      testUiFlow0007
   * @tc.desc      Ui bounds pass 5 checks center inside
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testUiFlow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testUiFlow0007', 'ui bounds 5');
    const ability: UIAbility = await launchHome();
    expect(ability !== undefined).assertTrue();
    const driver: Driver = Driver.create();
    const target: Component = await driver.findComponent(ON.id('toPageList'));
    const bounds: Rect = await target.getBounds();
    const centerX: number = (bounds.left + bounds.right) / 2;
    const centerY: number = (bounds.top + bounds.bottom) / 2;
    expect(centerX >= bounds.left && centerX <= bounds.right).assertTrue();
    expect(centerY >= bounds.top && centerY <= bounds.bottom).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UIFL_0008
   * @tc.name      testUiFlow0008
   * @tc.desc      Ui bounds pass 6 checks right margin sane
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testUiFlow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testUiFlow0008', 'ui bounds 6');
    const ability: UIAbility = await launchHome();
    expect(ability !== undefined).assertTrue();
    const driver: Driver = Driver.create();
    const target: Component = await driver.findComponent(ON.id('toPageList'));
    const bounds: Rect = await target.getBounds();
    const screen: display.Display = display.getDefaultDisplaySync();
    expect(bounds.right - bounds.left < screen.width).assertTrue();
    expect(bounds.bottom - bounds.top < screen.height).assertTrue();
  });
  });
}
