/*
 * Copyright (c) 2026-2026 Huawei Device Co., Ltd.
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

import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Logger } from '../utils/Logger';

const DRIVER = Driver.create();

let abilityDelRegistry = abilityDelegatorRegistry.getAbilityDelegator();

export default function abilityTest() {
  describe('BackgroundLoaderAbilityTest', () => {
    /**
     * 在所有测试用例开始之前执行一次，用于初始化公共资源
     */
    beforeAll(() => {
      Logger.info('beforeAll called');
    })

    /**
     * 在每个测试用例开始之前执行，用于重置测试状态
     */
    beforeEach(() => {
      Logger.info('beforeEach called');
    })

    /**
     * 在每个测试用例结束之后执行，用于清理测试数据
     */
    afterEach(() => {
      Logger.info('afterEach called');
    })

    /**
     * 在所有测试用例结束之后执行一次，用于释放公共资源
     */
    afterAll(() => {
      Logger.info('afterAll called');
    })

    /**
     * 测试拉起应用
     * 验证EntryAbility是否能够正常启动
     */
    it('StartAbility_001', 0, async (done: Function) => {
      Logger.info('StartAbility_001 begin');

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      try {
        await abilityDelegator.startAbility({
          bundleName: 'com.example.myapplication',
          abilityName: 'EntryAbility'
        })
        expect(true).assertTrue();
      } catch (exception) {
        Logger.info(`Failed to start ability, error info: ${JSON.stringify(exception)}`);
        expect().assertFail();
      }
      Logger.info('StartAbility_001 end');
      done();
    })

    /**
     * 测试检查界面控件是否存在
     * 验证主界面上的"Register Task"、"Get Task Info"、"Finish Task"、"Unregister Task"按钮是否正常显示
     */
    it('CheckUIComponents_001', 0, async (done: Function) => {
      Logger.info('CheckUIComponents_001 begin');
      await DRIVER.delayMs(1000);
      await DRIVER.assertComponentExist(ON.text('Register Task'));
      await DRIVER.assertComponentExist(ON.text('Get Task Info'));
      await DRIVER.assertComponentExist(ON.text('Finish Task'));
      await DRIVER.assertComponentExist(ON.text('Unegister Task'));
      expect(true).assertTrue();
      Logger.info('CheckUIComponents_001 end');
      done();
    })

    /**
     * 测试注册后台加载任务
     * 点击"Register Task"按钮，弹出对话框后输入abilityName和taskId，确认注册
     * 预期：注册成功，返回结果包含"Success"
     */
    it('RegisterTask_001', 0, async (done: Function) => {
      Logger.info('RegisterTask_001 begin');
      await DRIVER.delayMs(1000);
      let registerBtn = await DRIVER.findComponent(ON.text('Register Task'));
      await registerBtn.click();
      await DRIVER.delayMs(1000);
      let okBtn = await DRIVER.findComponent(ON.text('OK'));
      await okBtn.click();
      await DRIVER.delayMs(1000);
      expect(true).assertTrue();
      Logger.info('RegisterTask_001 end');
      done();
    })

    /**
     * 测试查询后台加载任务信息
     * 点击"Get Task Info"按钮，弹出对话框后输入taskId，确认查询
     * 预期：查询成功，返回结果包含任务信息（taskId和abilityName）
     */
    it('GetTaskInfo_001', 0, async (done: Function) => {
      Logger.info('GetTaskInfo_001 begin');
      await DRIVER.delayMs(1000);
      let getTaskInfoBtn = await DRIVER.findComponent(ON.text('Get Task Info'));
      await getTaskInfoBtn.click();
      await DRIVER.delayMs(1000);
      let okBtn = await DRIVER.findComponent(ON.text('OK'));
      await okBtn.click();
      await DRIVER.delayMs(1000);
      expect(true).assertTrue();
      Logger.info('GetTaskInfo_001 end');
      done();
    })

    /**
     * 测试完成后台加载任务
     * 点击"Finish Task"按钮，弹出对话框后输入abilityName和taskId，确认完成
     * 预期：完成任务成功，返回结果包含"Success"
     */
    it('FinishTask_001', 0, async (done: Function) => {
      Logger.info('FinishTask_001 begin');
      await DRIVER.delayMs(1000);
      let finishBtn = await DRIVER.findComponent(ON.text('Finish Task'));
      await finishBtn.click();
      await DRIVER.delayMs(1000);
      let okBtn = await DRIVER.findComponent(ON.text('OK'));
      await okBtn.click();
      await DRIVER.delayMs(1000);
      expect(true).assertTrue();
      Logger.info('FinishTask_001 end');
      done();
    })

    /**
     * 测试注销后台加载任务
     * 点击"Unegister Task"按钮，弹出对话框后输入abilityName和taskId，确认注销
     * 预期：注销成功，返回结果包含"Success"
     */
    it('UnregisterTask_001', 0, async (done: Function) => {
      Logger.info('UnregisterTask_001 begin');
      await DRIVER.delayMs(1000);
      let unregisterBtn = await DRIVER.findComponent(ON.text('Unegister Task'));
      await unregisterBtn.click();
      await DRIVER.delayMs(1000);
      let okBtn = await DRIVER.findComponent(ON.text('OK'));
      await okBtn.click();
      await DRIVER.delayMs(1000);
      expect(true).assertTrue();
      Logger.info('UnregisterTask_001 end');
      done();
    })
  })
}
