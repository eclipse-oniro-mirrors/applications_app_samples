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

import { afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { common, StartOptions, UIAbility } from '@kit.AbilityKit';
import { buildNewAbilityWant, buildStartOptions, formatStartOptions } from '../../../main/ets/model/LaunchIntent';
import { NEW_ABILITY_NAME } from '../../../main/ets/common/AppConstants';
import {
  ENTRY_ABILITY,
  NEW_ABILITY,
  getAbilityName,
  getBundleName,
  getTopAbility,
  loadEntryContext,
  waitForTopAbility
} from './TestHelper';


async function startNewAbility(withAnimation: boolean): Promise<void> {
  const context: common.UIAbilityContext = await loadEntryContext();
  const options: StartOptions = buildStartOptions(withAnimation);
  await context.startAbility(buildNewAbilityWant(getBundleName()), options);
}

export default function startOptionsTest() {
  describe('AbilityFeatureStartOptionsTest', () => {
    afterAll(async (done: Function) => {
      const top: UIAbility | undefined = await getTopAbility();
      if (top !== undefined && getAbilityName(top) === NEW_ABILITY) {
        await top.context.terminateSelf();
        await waitForTopAbility(ENTRY_ABILITY, 5000);
      }
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_START_OPTIONS_0001
     * @tc.name      testStartNewAbilityWithoutAnimation0001
     * @tc.desc      关闭动效时按 StartOptions 启动 NewAbility 成功
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartNewAbilityWithoutAnimation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await startNewAbility(false);
      const top: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      expect(getAbilityName(top)).assertEqual(NEW_ABILITY);
      expect(getAbilityName(top)).assertEqual(NEW_ABILITY_NAME);
      expect(top !== undefined).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_START_OPTIONS_0002
     * @tc.name      testStartNewAbilityWithAnimation0002
     * @tc.desc      开启动效时同样能启动 NewAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartNewAbilityWithAnimation0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await startNewAbility(true);
      const top: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      expect(getAbilityName(top)).assertEqual(NEW_ABILITY);
      expect(buildStartOptions(true).withAnimation).assertTrue();
      expect(buildStartOptions(false).withAnimation).assertFalse();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_START_OPTIONS_0003
     * @tc.name      testTopAbilityInfoOfNewAbility0003
     * @tc.desc      栈顶 Ability 的名称、包名与模块名符合预期
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTopAbilityInfoOfNewAbility0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await startNewAbility(false);
      const top: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      expect(getAbilityName(top)).assertEqual(NEW_ABILITY);
      if (top !== undefined) {
        expect(top.context.abilityInfo.bundleName).assertEqual(getBundleName());
        expect(top.context.abilityInfo.moduleName).assertEqual('entry');
      }
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_START_OPTIONS_0004
     * @tc.name      testTerminateNewAbility0004
     * @tc.desc      结束 NewAbility 后首页重新回到栈顶
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testTerminateNewAbility0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await startNewAbility(false);
      const top: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      expect(getAbilityName(top)).assertEqual(NEW_ABILITY);
      if (top !== undefined) {
        await top.context.terminateSelf();
      }
      const entry: UIAbility | undefined = await waitForTopAbility(ENTRY_ABILITY, 6000);
      expect(getAbilityName(entry)).assertEqual(ENTRY_ABILITY);
      expect(getAbilityName(entry) === NEW_ABILITY).assertFalse();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_START_OPTIONS_0005
     * @tc.name      testRepeatedStartNewAbility0005
     * @tc.desc      连续两次启动 NewAbility 都不报错，栈顶保持 NewAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRepeatedStartNewAbility0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await startNewAbility(false);
      expect(getAbilityName(await waitForTopAbility(NEW_ABILITY, 6000))).assertEqual(NEW_ABILITY);
      await startNewAbility(true);
      const top: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      expect(getAbilityName(top)).assertEqual(NEW_ABILITY);
      expect(top !== undefined).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_START_OPTIONS_0006
     * @tc.name      testStartAfterReturnToEntry0006
     * @tc.desc      回到首页后可再次按 StartOptions 启动 NewAbility
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStartAfterReturnToEntry0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await startNewAbility(false);
      const first: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      expect(getAbilityName(first)).assertEqual(NEW_ABILITY);
      if (first !== undefined) {
        await first.context.terminateSelf();
      }
      expect(getAbilityName(await waitForTopAbility(ENTRY_ABILITY, 6000))).assertEqual(ENTRY_ABILITY);
      await startNewAbility(true);
      expect(getAbilityName(await waitForTopAbility(NEW_ABILITY, 6000))).assertEqual(NEW_ABILITY);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_START_OPTIONS_0007
     * @tc.name      testStartOptionsFieldsBeforeLaunch0007
     * @tc.desc      启动前校验 StartOptions 与描述串的字段取值
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStartOptionsFieldsBeforeLaunch0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const options: StartOptions = buildStartOptions(true);
      const text: string = formatStartOptions(options);
      expect(options.displayId).assertEqual(0);
      expect(options.windowWidth).assertEqual(300);
      expect(options.windowHeight).assertEqual(400);
      expect(text.includes('withAnimation=true')).assertTrue();
      expect(text.endsWith('height=400')).assertTrue();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_START_OPTIONS_0008
     * @tc.name      testNewAbilityWantMatchesBundle0008
     * @tc.desc      显式启动意图的包名取自当前应用
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNewAbilityWantMatchesBundle0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bundleName: string = getBundleName();
      expect(bundleName.length > 0).assertTrue();
      expect(buildNewAbilityWant(bundleName).bundleName).assertEqual(bundleName);
      expect(buildNewAbilityWant(bundleName).abilityName).assertEqual(NEW_ABILITY);
    })
  })
}
