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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { CallCapabilityModel } from '../../../main/ets/model/CallCapabilityModel';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallCapabilityMatrix';
const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

let caseCounter: number = 0;

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// Breaking the JS micro-task chain every 20 cases: Hypium runs all `it` callbacks as
// promise continuations inside one native task, so a real async call is required to
// hand the main thread back to the EventHandler before THREAD_BLOCK_3S/6S fires.
async function yieldToMain(): Promise<void> {
  caseCounter++;
  if (caseCounter % 20 === 0) {
    try {
      await delegator.getCurrentTopAbility();
    } catch (error) {
      log('yield point failed');
    }
  }
}

export default function callCapabilityMatrixTest(): void {
  describe('CallCapabilityMatrix', () => {
    /**
     * @tc.number    SUB_CALL_CAPABILITY_0001
     * @tc.name      testCanDial0001
     * @tc.desc      canDial("13800138000", permission=true, sim=true) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0001 begin');
      const actual: string = CallCapabilityModel.canDial('13800138000', true, true);
      expect(actual).assertEqual('OK');
      log('testCanDial0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0002
     * @tc.name      testCanDial0002
     * @tc.desc      canDial("13800138000", permission=true, sim=false) -> NO_SIM
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0002 begin');
      const actual: string = CallCapabilityModel.canDial('13800138000', true, false);
      expect(actual).assertEqual('NO_SIM');
      log('testCanDial0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0003
     * @tc.name      testCanDial0003
     * @tc.desc      canDial("13800138000", permission=false, sim=true) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0003 begin');
      const actual: string = CallCapabilityModel.canDial('13800138000', false, true);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0004
     * @tc.name      testCanDial0004
     * @tc.desc      canDial("13800138000", permission=false, sim=false) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0004 begin');
      const actual: string = CallCapabilityModel.canDial('13800138000', false, false);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0005
     * @tc.name      testCanDial0005
     * @tc.desc      canDial("1234567", permission=true, sim=true) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0005 begin');
      const actual: string = CallCapabilityModel.canDial('1234567', true, true);
      expect(actual).assertEqual('OK');
      log('testCanDial0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0006
     * @tc.name      testCanDial0006
     * @tc.desc      canDial("1234567", permission=true, sim=false) -> NO_SIM
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0006 begin');
      const actual: string = CallCapabilityModel.canDial('1234567', true, false);
      expect(actual).assertEqual('NO_SIM');
      log('testCanDial0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0007
     * @tc.name      testCanDial0007
     * @tc.desc      canDial("1234567", permission=false, sim=true) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0007 begin');
      const actual: string = CallCapabilityModel.canDial('1234567', false, true);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0008
     * @tc.name      testCanDial0008
     * @tc.desc      canDial("1234567", permission=false, sim=false) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0008 begin');
      const actual: string = CallCapabilityModel.canDial('1234567', false, false);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0009
     * @tc.name      testCanDial0009
     * @tc.desc      canDial("12345678901", permission=true, sim=true) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0009 begin');
      const actual: string = CallCapabilityModel.canDial('12345678901', true, true);
      expect(actual).assertEqual('OK');
      log('testCanDial0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0010
     * @tc.name      testCanDial0010
     * @tc.desc      canDial("12345678901", permission=true, sim=false) -> NO_SIM
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0010 begin');
      const actual: string = CallCapabilityModel.canDial('12345678901', true, false);
      expect(actual).assertEqual('NO_SIM');
      log('testCanDial0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0011
     * @tc.name      testCanDial0011
     * @tc.desc      canDial("12345678901", permission=false, sim=true) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0011 begin');
      const actual: string = CallCapabilityModel.canDial('12345678901', false, true);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0012
     * @tc.name      testCanDial0012
     * @tc.desc      canDial("12345678901", permission=false, sim=false) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0012 begin');
      const actual: string = CallCapabilityModel.canDial('12345678901', false, false);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0013
     * @tc.name      testCanDial0013
     * @tc.desc      canDial("+8613800138000", permission=true, sim=true) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0013 begin');
      const actual: string = CallCapabilityModel.canDial('+8613800138000', true, true);
      expect(actual).assertEqual('OK');
      log('testCanDial0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0014
     * @tc.name      testCanDial0014
     * @tc.desc      canDial("+8613800138000", permission=true, sim=false) -> NO_SIM
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0014 begin');
      const actual: string = CallCapabilityModel.canDial('+8613800138000', true, false);
      expect(actual).assertEqual('NO_SIM');
      log('testCanDial0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0015
     * @tc.name      testCanDial0015
     * @tc.desc      canDial("+8613800138000", permission=false, sim=true) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0015 begin');
      const actual: string = CallCapabilityModel.canDial('+8613800138000', false, true);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0016
     * @tc.name      testCanDial0016
     * @tc.desc      canDial("+8613800138000", permission=false, sim=false) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0016 begin');
      const actual: string = CallCapabilityModel.canDial('+8613800138000', false, false);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0017
     * @tc.name      testCanDial0017
     * @tc.desc      canDial("110", permission=true, sim=true) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0017 begin');
      const actual: string = CallCapabilityModel.canDial('110', true, true);
      expect(actual).assertEqual('OK');
      log('testCanDial0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0018
     * @tc.name      testCanDial0018
     * @tc.desc      canDial("110", permission=true, sim=false) -> NO_SIM
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0018 begin');
      const actual: string = CallCapabilityModel.canDial('110', true, false);
      expect(actual).assertEqual('NO_SIM');
      log('testCanDial0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0019
     * @tc.name      testCanDial0019
     * @tc.desc      canDial("110", permission=false, sim=true) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0019 begin');
      const actual: string = CallCapabilityModel.canDial('110', false, true);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0020
     * @tc.name      testCanDial0020
     * @tc.desc      canDial("110", permission=false, sim=false) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0020 begin');
      const actual: string = CallCapabilityModel.canDial('110', false, false);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0021
     * @tc.name      testCanDial0021
     * @tc.desc      canDial("911", permission=true, sim=true) -> OK
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0021 begin');
      const actual: string = CallCapabilityModel.canDial('911', true, true);
      expect(actual).assertEqual('OK');
      log('testCanDial0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0022
     * @tc.name      testCanDial0022
     * @tc.desc      canDial("911", permission=true, sim=false) -> NO_SIM
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0022 begin');
      const actual: string = CallCapabilityModel.canDial('911', true, false);
      expect(actual).assertEqual('NO_SIM');
      log('testCanDial0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0023
     * @tc.name      testCanDial0023
     * @tc.desc      canDial("911", permission=false, sim=true) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0023 begin');
      const actual: string = CallCapabilityModel.canDial('911', false, true);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0024
     * @tc.name      testCanDial0024
     * @tc.desc      canDial("911", permission=false, sim=false) -> NO_PERMISSION
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0024 begin');
      const actual: string = CallCapabilityModel.canDial('911', false, false);
      expect(actual).assertEqual('NO_PERMISSION');
      log('testCanDial0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0025
     * @tc.name      testCanDial0025
     * @tc.desc      canDial("", permission=true, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0025 begin');
      const actual: string = CallCapabilityModel.canDial('', true, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0026
     * @tc.name      testCanDial0026
     * @tc.desc      canDial("", permission=true, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0026 begin');
      const actual: string = CallCapabilityModel.canDial('', true, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0027
     * @tc.name      testCanDial0027
     * @tc.desc      canDial("", permission=false, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0027 begin');
      const actual: string = CallCapabilityModel.canDial('', false, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0028
     * @tc.name      testCanDial0028
     * @tc.desc      canDial("", permission=false, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0028 begin');
      const actual: string = CallCapabilityModel.canDial('', false, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0029
     * @tc.name      testCanDial0029
     * @tc.desc      canDial("1", permission=true, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0029 begin');
      const actual: string = CallCapabilityModel.canDial('1', true, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0030
     * @tc.name      testCanDial0030
     * @tc.desc      canDial("1", permission=true, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0030 begin');
      const actual: string = CallCapabilityModel.canDial('1', true, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0031
     * @tc.name      testCanDial0031
     * @tc.desc      canDial("1", permission=false, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0031 begin');
      const actual: string = CallCapabilityModel.canDial('1', false, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0032
     * @tc.name      testCanDial0032
     * @tc.desc      canDial("1", permission=false, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0032 begin');
      const actual: string = CallCapabilityModel.canDial('1', false, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0033
     * @tc.name      testCanDial0033
     * @tc.desc      canDial("12", permission=true, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0033 begin');
      const actual: string = CallCapabilityModel.canDial('12', true, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0034
     * @tc.name      testCanDial0034
     * @tc.desc      canDial("12", permission=true, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0034 begin');
      const actual: string = CallCapabilityModel.canDial('12', true, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0035
     * @tc.name      testCanDial0035
     * @tc.desc      canDial("12", permission=false, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0035 begin');
      const actual: string = CallCapabilityModel.canDial('12', false, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0036
     * @tc.name      testCanDial0036
     * @tc.desc      canDial("12", permission=false, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0036 begin');
      const actual: string = CallCapabilityModel.canDial('12', false, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0037
     * @tc.name      testCanDial0037
     * @tc.desc      canDial("12a", permission=true, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0037 begin');
      const actual: string = CallCapabilityModel.canDial('12a', true, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0038
     * @tc.name      testCanDial0038
     * @tc.desc      canDial("12a", permission=true, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0038 begin');
      const actual: string = CallCapabilityModel.canDial('12a', true, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0039
     * @tc.name      testCanDial0039
     * @tc.desc      canDial("12a", permission=false, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0039 begin');
      const actual: string = CallCapabilityModel.canDial('12a', false, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0040
     * @tc.name      testCanDial0040
     * @tc.desc      canDial("12a", permission=false, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0040 begin');
      const actual: string = CallCapabilityModel.canDial('12a', false, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0041
     * @tc.name      testCanDial0041
     * @tc.desc      canDial("123456789012", permission=true, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0041 begin');
      const actual: string = CallCapabilityModel.canDial('123456789012', true, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0042
     * @tc.name      testCanDial0042
     * @tc.desc      canDial("123456789012", permission=true, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0042 begin');
      const actual: string = CallCapabilityModel.canDial('123456789012', true, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0043
     * @tc.name      testCanDial0043
     * @tc.desc      canDial("123456789012", permission=false, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0043 begin');
      const actual: string = CallCapabilityModel.canDial('123456789012', false, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0044
     * @tc.name      testCanDial0044
     * @tc.desc      canDial("123456789012", permission=false, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0044 begin');
      const actual: string = CallCapabilityModel.canDial('123456789012', false, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0045
     * @tc.name      testCanDial0045
     * @tc.desc      canDial("+123456", permission=true, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0045 begin');
      const actual: string = CallCapabilityModel.canDial('+123456', true, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0046
     * @tc.name      testCanDial0046
     * @tc.desc      canDial("+123456", permission=true, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0046 begin');
      const actual: string = CallCapabilityModel.canDial('+123456', true, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0047
     * @tc.name      testCanDial0047
     * @tc.desc      canDial("+123456", permission=false, sim=true) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0047 begin');
      const actual: string = CallCapabilityModel.canDial('+123456', false, true);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0048
     * @tc.name      testCanDial0048
     * @tc.desc      canDial("+123456", permission=false, sim=false) -> INVALID_NUMBER
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCanDial0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCanDial0048 begin');
      const actual: string = CallCapabilityModel.canDial('+123456', false, false);
      expect(actual).assertEqual('INVALID_NUMBER');
      log('testCanDial0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0049
     * @tc.name      testDescribe0049
     * @tc.desc      describe(OK) returns a readable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribe0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribe0049 begin');
      const actual: string = CallCapabilityModel.describe('OK');
      expect(actual).assertEqual('ready to place the call');
      log('testDescribe0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0050
     * @tc.name      testDescribe0050
     * @tc.desc      describe(NO_PERMISSION) returns a readable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribe0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribe0050 begin');
      const actual: string = CallCapabilityModel.describe('NO_PERMISSION');
      expect(actual).assertEqual('place call permission is not granted');
      log('testDescribe0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0051
     * @tc.name      testDescribe0051
     * @tc.desc      describe(NO_SIM) returns a readable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribe0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribe0051 begin');
      const actual: string = CallCapabilityModel.describe('NO_SIM');
      expect(actual).assertEqual('no sim card detected');
      log('testDescribe0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0052
     * @tc.name      testDescribe0052
     * @tc.desc      describe(INVALID_NUMBER) returns a readable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribe0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribe0052 begin');
      const actual: string = CallCapabilityModel.describe('INVALID_NUMBER');
      expect(actual).assertEqual('phone number is invalid');
      log('testDescribe0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0053
     * @tc.name      testDescribe0053
     * @tc.desc      describe(UNKNOWN) returns a readable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribe0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDescribe0053 begin');
      const actual: string = CallCapabilityModel.describe('UNKNOWN');
      expect(actual).assertEqual('unknown status');
      log('testDescribe0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0054
     * @tc.name      testRequiresPermission0054
     * @tc.desc      requiresPermission(dial) -> ohos.permission.PLACE_CALL
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRequiresPermission0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRequiresPermission0054 begin');
      const actual: string = CallCapabilityModel.requiresPermission('dial');
      expect(actual).assertEqual('ohos.permission.PLACE_CALL');
      log('testRequiresPermission0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0055
     * @tc.name      testRequiresPermission0055
     * @tc.desc      requiresPermission(state) -> none
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRequiresPermission0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRequiresPermission0055 begin');
      const actual: string = CallCapabilityModel.requiresPermission('state');
      expect(actual).assertEqual('');
      log('testRequiresPermission0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0056
     * @tc.name      testRequiresPermission0056
     * @tc.desc      requiresPermission(format) -> none
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRequiresPermission0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRequiresPermission0056 begin');
      const actual: string = CallCapabilityModel.requiresPermission('format');
      expect(actual).assertEqual('');
      log('testRequiresPermission0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0057
     * @tc.name      testRequiresPermission0057
     * @tc.desc      requiresPermission(emergency) -> none
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRequiresPermission0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRequiresPermission0057 begin');
      const actual: string = CallCapabilityModel.requiresPermission('emergency');
      expect(actual).assertEqual('');
      log('testRequiresPermission0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0058
     * @tc.name      testRequiresPermission0058
     * @tc.desc      requiresPermission(unknown) -> none
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRequiresPermission0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRequiresPermission0058 begin');
      const actual: string = CallCapabilityModel.requiresPermission('unknown');
      expect(actual).assertEqual('');
      log('testRequiresPermission0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0059
     * @tc.name      testFeaturesForSdk0059
     * @tc.desc      featuresForSdk(0) lists 4 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0059 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(0);
      expect(actual.length).assertEqual(4);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0060
     * @tc.name      testFeaturesForSdk0060
     * @tc.desc      featuresForSdk(1) lists 4 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0060 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(1);
      expect(actual.length).assertEqual(4);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0061
     * @tc.name      testFeaturesForSdk0061
     * @tc.desc      featuresForSdk(2) lists 4 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0061 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(2);
      expect(actual.length).assertEqual(4);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0062
     * @tc.name      testFeaturesForSdk0062
     * @tc.desc      featuresForSdk(3) lists 4 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0062 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(3);
      expect(actual.length).assertEqual(4);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0063
     * @tc.name      testFeaturesForSdk0063
     * @tc.desc      featuresForSdk(4) lists 4 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0063 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(4);
      expect(actual.length).assertEqual(4);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0064
     * @tc.name      testFeaturesForSdk0064
     * @tc.desc      featuresForSdk(5) lists 4 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0064 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(5);
      expect(actual.length).assertEqual(4);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0065
     * @tc.name      testFeaturesForSdk0065
     * @tc.desc      featuresForSdk(6) lists 4 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0065 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(6);
      expect(actual.length).assertEqual(4);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0066
     * @tc.name      testFeaturesForSdk0066
     * @tc.desc      featuresForSdk(7) lists 4 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0066 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(7);
      expect(actual.length).assertEqual(4);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0067
     * @tc.name      testFeaturesForSdk0067
     * @tc.desc      featuresForSdk(8) lists 4 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0067 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(8);
      expect(actual.length).assertEqual(4);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0068
     * @tc.name      testFeaturesForSdk0068
     * @tc.desc      featuresForSdk(9) lists 5 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0068 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(9);
      expect(actual.length).assertEqual(5);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0069
     * @tc.name      testFeaturesForSdk0069
     * @tc.desc      featuresForSdk(10) lists 6 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0069 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(10);
      expect(actual.length).assertEqual(6);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0070
     * @tc.name      testFeaturesForSdk0070
     * @tc.desc      featuresForSdk(11) lists 7 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0070 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(11);
      expect(actual.length).assertEqual(7);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(false);
      log('testFeaturesForSdk0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0071
     * @tc.name      testFeaturesForSdk0071
     * @tc.desc      featuresForSdk(12) lists 8 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0071 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(12);
      expect(actual.length).assertEqual(8);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(true);
      log('testFeaturesForSdk0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0072
     * @tc.name      testFeaturesForSdk0072
     * @tc.desc      featuresForSdk(13) lists 8 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0072 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(13);
      expect(actual.length).assertEqual(8);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(true);
      log('testFeaturesForSdk0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0073
     * @tc.name      testFeaturesForSdk0073
     * @tc.desc      featuresForSdk(14) lists 8 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0073 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(14);
      expect(actual.length).assertEqual(8);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(true);
      log('testFeaturesForSdk0073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_CAPABILITY_0074
     * @tc.name      testFeaturesForSdk0074
     * @tc.desc      featuresForSdk(15) lists 8 features
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFeaturesForSdk0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFeaturesForSdk0074 begin');
      const actual: string[] = CallCapabilityModel.featuresForSdk(15);
      expect(actual.length).assertEqual(8);
      expect(actual.indexOf('dial') >= 0).assertTrue();
      expect(actual.indexOf('getCallStateSync') >= 0).assertEqual(true);
      log('testFeaturesForSdk0074 end');
      await yieldToMain();
    })

  })
}
