/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { AbilityConstant, Want } from '@kit.AbilityKit';
import { deviceInfo } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { cleanupBlob, isRestoreLaunch, loadBlob, saveBlob } from '../../../main/ets/common/RestoreUtil';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;

export default function abilityTest() {
  let driver = Driver.create();
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('UIAbility_Recover_01', 0, async (done: Function) => {
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await driver.delayMs(1000);
      // 获取当前top的ability
      let entryAbility = await delegator.getCurrentTopAbility();
      expect(entryAbility.context.abilityInfo.name).assertEqual('EntryAbility');
      done();
    })
    // 系统键为 true：全版本可靠，单独即可判定恢复启动
    it('RestoreUtil_isRestoreLaunch_sysKey', 0, () => {
      const params: Record<string, Object> = {};
      params['ohos.ability.params.abilityRecoveryRestart'] = true;
      const w: Want = { parameters: params };
      const lp: AbilityConstant.LaunchParam = {
        launchReason: AbilityConstant.LaunchReason.UNKNOWN,
        lastExitReason: AbilityConstant.LastExitReason.UNKNOWN
      };
      expect(isRestoreLaunch(w, lp, ['restore.reader'])).assertTrue();
    })
    // want.parameters 中存在恢复键：仅恢复启动时由系统带回
    it('RestoreUtil_isRestoreLaunch_restoreKey', 0, () => {
      const params: Record<string, Object> = {};
      params['restore.reader'] = 'demo';
      const w: Want = { parameters: params };
      const lp: AbilityConstant.LaunchParam = {
        launchReason: AbilityConstant.LaunchReason.UNKNOWN,
        lastExitReason: AbilityConstant.LastExitReason.UNKNOWN
      };
      expect(isRestoreLaunch(w, lp, ['restore.reader'])).assertTrue();
    })
    // 三信号全无：非恢复启动
    it('RestoreUtil_isRestoreLaunch_none', 0, () => {
      const w: Want = {};
      const lp: AbilityConstant.LaunchParam = {
        launchReason: AbilityConstant.LaunchReason.UNKNOWN,
        lastExitReason: AbilityConstant.LastExitReason.UNKNOWN
      };
      expect(isRestoreLaunch(w, lp, ['restore.reader'])).assertFalse();
    })
    // launchReason 为 APP_RECOVERY 仅在 API版本26 起可单独采信
    it('RestoreUtil_isRestoreLaunch_reason', 0, () => {
      const w: Want = {};
      const lp: AbilityConstant.LaunchParam = {
        launchReason: AbilityConstant.LaunchReason.APP_RECOVERY,
        lastExitReason: AbilityConstant.LastExitReason.UNKNOWN
      };
      expect(isRestoreLaunch(w, lp, ['restore.reader'])).assertEqual(deviceInfo.sdkApiVersion >= 26);
    })
    // 落盘写入-读回往返；读不到的文件按 null 降级；清理不抛异常
    it('RestoreUtil_blob_roundtrip', 0, async (done: Function) => {
      const ability = await delegator.getCurrentTopAbility();
      const ctx = ability.context;
      const fileName = saveBlob(ctx, 'utest', 'hello-restore');
      expect(fileName).assertEqual('restore_blob_utest.txt');
      expect(loadBlob(ctx, fileName)).assertEqual('hello-restore');
      expect(loadBlob(ctx, 'restore_blob_notexist.txt')).assertNull();
      cleanupBlob(ctx);
      done();
    })
  })
}