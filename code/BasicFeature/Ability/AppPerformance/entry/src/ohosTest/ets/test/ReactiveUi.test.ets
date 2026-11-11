import { describe, expect } from '@ohos/hypium';
import { Component, Driver, ON } from '@kit.TestKit';
import { scenario } from '../support/BoundedCase';
import { finishUiTestAbility, launchUiTestAbility, uiTestCase, uiTestFailure } from '../support/UiTestSupport';

async function waitText(driver: Driver, text: string): Promise<Component> {
  const component = await driver.waitForComponent(ON.text(text), 3000);
  if (component === undefined || component === null) {
    throw await uiTestFailure(driver, `Text not found: ${text}`);
  }
  return component;
}

async function clickId(driver: Driver, id: string): Promise<void> {
  const component = await driver.waitForComponent(ON.id(id), 3000);
  if (component === undefined || component === null) {
    throw await uiTestFailure(driver, `Control not found: ${id}`);
  }
  // A found node may still belong to an animating launch window. Do not click until idle.
  if (!await driver.waitForIdle(100, 2000)) {
    throw await uiTestFailure(driver, `UI did not become idle before clicking: ${id}`);
  }
  const ready = await driver.findComponent(ON.id(id));
  if (ready === undefined || ready === null) {
    throw await uiTestFailure(driver, `Control disappeared before click: ${id}`);
  }
  await ready.click();
}

export default function reactiveUiTests(): void {
  describe('AppPerformanceUI', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEUI_0100
     * @tc.name      testAppPerformanceUI0001
     * @tc.desc      Verify reactive component updates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceUI0001', uiTestCase(async (): Promise<void> => {
      const driver = await launchUiTestAbility();
      if (!await driver.waitForIdle(100, 2000)) {
        throw await uiTestFailure(driver, 'Test page did not become idle after launch');
      }
      const initialButton = await waitText(driver, '等待更新');
      expect(await initialButton.isEnabled()).assertFalse();
      await clickId(driver, 'ui-update');
      const updatedButton = await waitText(driver, '动作1');
      expect(await updatedButton.isEnabled()).assertTrue();
      await waitText(driver, '字段1');

      await clickId(driver, 'ui-show-memory');
      await waitText(driver, '内存结果1');
      await clickId(driver, 'ui-update');
      await waitText(driver, '内存结果2');

      await clickId(driver, 'ui-show-log');
      await waitText(driver, '日志结果2');
      await clickId(driver, 'ui-update');
      await waitText(driver, '日志结果3');
      await waitText(driver, '调用成功');
      await waitText(driver, '30 ms');
      const finalButton = await waitText(driver, '动作3');
      expect(await finalButton.isEnabled()).assertTrue();
    }, finishUiTestAbility));
  });
}
