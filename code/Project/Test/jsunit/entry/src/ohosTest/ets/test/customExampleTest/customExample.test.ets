/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, it, expect, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import EntryAbility from '../../../../main/ets/entryability/EntryAbility';
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
function sleep(time: number) {
  return new Promise<void>((resolve:Function) => setTimeout(resolve, time));
}
export default function customExampleTest() {
  describe('customExampleTest', ()=> {

    /**
     * @tc.number:customExampleTest_001
     * @tc.name: customExampleTest_function
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测EntryAbility对象自定义function功能
     */
    it('customExampleTest_function',TestType.FUNCTION, async (done: Function) => {
      console.info("uitest: TestUiExample begin");
      // start tested ability
      let want: Want = {
        bundleName : bundleName,
        abilityName : "EntryAbility"
      };
      await delegator.startAbility(want);
      await sleep(1000);
      // check top display ability
      await delegator.getCurrentTopAbility().then((ability: UIAbility)=>{
        console.info("get top ability");
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
        let testAbility: EntryAbility = ability as EntryAbility;
        let result: string = testAbility.customFun();
        // 验证自定义方法返回值
        expect(result).assertEqual("custom");
      })
      done();
    })
  })
}