/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { buildImplicitViewWant, hasStartWithoutTipsFlag } from '../../../main/ets/model/LaunchIntent';
import {
  ENTRY_ABILITY,
  getAbilityName,
  getBundleName,
  getDelegator,
  getTopAbility,
  sleep,
  startEntryAbility,
  waitForTopAbility
} from './TestHelper';

const NO_MATCHING_ABILITY: number = 16000019;
const ABILITY_NOT_EXIST: number = 16000001;

interface StartFailure {
  code: number;
  message: string;
}

/** 执行一次启动并捕获错误码；成功时 code 为 0。 */
async function startAndCapture(want: Want): Promise<StartFailure> {
  try {
    await getDelegator().startAbility(want);
    return { code: 0, message: '' };
  } catch (error) {
    const failure: BusinessError = error as BusinessError;
    return { code: failure.code, message: failure.message };
  }
}

export default function implicitLaunchTest() {
  describe('AbilityFeatureImplicitLaunchTest', () => {
    beforeAll(async (done: Function) => {
      try {
        await startEntryAbility();
        await waitForTopAbility(ENTRY_ABILITY, 6000);
      } catch (error) {
        // 启动失败时由各用例的错误码断言暴露，这里不吞掉栈顶状态
      }
      await sleep(500);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_IMPLICIT_LAUNCH_0001
     * @tc.name      testImplicitWantCarriesFlag0001
     * @tc.desc      静默隐式启动的意图带 FLAG_START_WITHOUT_TIPS
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImplicitWantCarriesFlag0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const want: Want = buildImplicitViewWant(true);
      expect(hasStartWithoutTipsFlag(want)).assertTrue();
      expect(want.action !== undefined).assertTrue();
      expect(want.bundleName === undefined).assertTrue();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_IMPLICIT_LAUNCH_0002
     * @tc.name      testImplicitLaunchFailsSilently0002
     * @tc.desc      设备上无匹配应用时静默启动直接失败，错误码为 16000019
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImplicitLaunchFailsSilently0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const failure: StartFailure = await startAndCapture(buildImplicitViewWant(true));
      expect(failure.code).assertEqual(NO_MATCHING_ABILITY);
      expect(failure.code !== 0).assertTrue();
      expect(failure.message.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_IMPLICIT_LAUNCH_0003
     * @tc.name      testTopAbilityUnchangedAfterImplicit0003
     * @tc.desc      隐式启动失败不会改变栈顶，首页仍在前台
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTopAbilityUnchangedAfterImplicit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await startAndCapture(buildImplicitViewWant(true));
      const top = await waitForTopAbility(ENTRY_ABILITY, 3000);
      expect(getAbilityName(top)).assertEqual(ENTRY_ABILITY);
      expect(getAbilityName(top) === 'NewAbility').assertFalse();
      expect(top !== undefined).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_IMPLICIT_LAUNCH_0004
     * @tc.name      testInvalidAbilityNameRejects0004
     * @tc.desc      显式启动不存在的 Ability 返回 16000001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInvalidAbilityNameRejects0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const want: Want = {
        bundleName: getBundleName(),
        abilityName: 'NoSuchAbilityForTest'
      };
      const failure: StartFailure = await startAndCapture(want);
      expect(failure.code).assertEqual(ABILITY_NOT_EXIST);
      expect(failure.message.length > 0).assertTrue();
      expect(failure.code !== NO_MATCHING_ABILITY).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_IMPLICIT_LAUNCH_0005
     * @tc.name      testInvalidBundleNameRejects0005
     * @tc.desc      包名不存在时启动失败且返回 16000001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testInvalidBundleNameRejects0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const want: Want = {
        bundleName: 'com.samples.abilityFeature.nonexistent',
        abilityName: ENTRY_ABILITY
      };
      const failure: StartFailure = await startAndCapture(want);
      expect(failure.code).assertEqual(ABILITY_NOT_EXIST);
      expect(failure.code > 0).assertTrue();
      expect(failure.message.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_IMPLICIT_LAUNCH_0006
     * @tc.name      testImplicitFailureIsRepeatable0006
     * @tc.desc      连续两次静默隐式启动返回同一个错误码
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testImplicitFailureIsRepeatable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const first: StartFailure = await startAndCapture(buildImplicitViewWant(true));
      const second: StartFailure = await startAndCapture(buildImplicitViewWant(true));
      expect(first.code).assertEqual(second.code);
      expect(second.code).assertEqual(NO_MATCHING_ABILITY);
      expect(first.message.length > 0 && second.message.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_IMPLICIT_LAUNCH_0007
     * @tc.name      testExplicitStartEntryAbility0007
     * @tc.desc      显式启动首页 Ability 成功并回到栈顶
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExplicitStartEntryAbility0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const failure: StartFailure = await startAndCapture({
        bundleName: getBundleName(),
        abilityName: ENTRY_ABILITY
      });
      expect(failure.code).assertEqual(0);
      const top = await waitForTopAbility(ENTRY_ABILITY, 5000);
      expect(getAbilityName(top)).assertEqual(ENTRY_ABILITY);
      expect(getAbilityName(await getTopAbility())).assertEqual(ENTRY_ABILITY);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_IMPLICIT_LAUNCH_0008
     * @tc.name      testExplicitStartIsIdempotent0008
     * @tc.desc      重复显式启动首页不报错，栈顶保持首页
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExplicitStartIsIdempotent0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      // 上一条用例刚拉起过首页，Ability 还在启动流程中时紧接着 startAbility，真机返回 16000017；
      // 先等栈顶稳定，测的才是“重复启动”本身的语义。
      await waitForTopAbility(ENTRY_ABILITY, 5000);
      await sleep(800);
      const first: StartFailure = await startAndCapture({
        bundleName: getBundleName(),
        abilityName: ENTRY_ABILITY
      });
      await sleep(800);
      const second: StartFailure = await startAndCapture({
        bundleName: getBundleName(),
        abilityName: ENTRY_ABILITY
      });
      expect(first.code).assertEqual(0);
      expect(second.code).assertEqual(0);
      expect(getAbilityName(await waitForTopAbility(ENTRY_ABILITY, 5000))).assertEqual(ENTRY_ABILITY);
      done();
    })
  })
}
