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

import { afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityFeature]';

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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartNewAbilityWithoutAnimation0001 begin');
      await startNewAbility(false);
      const top: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      const actual1: string = getAbilityName(top);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartNewAbilityWithoutAnimation0001 assert1 getAbilityName=${actual1}`);
      expect(actual1).assertEqual(NEW_ABILITY);
      const actual2: string = getAbilityName(top);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartNewAbilityWithoutAnimation0001 assert2 getAbilityName=${actual2}`);
      expect(actual2).assertEqual(NEW_ABILITY_NAME);
      const actual3: boolean = top !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartNewAbilityWithoutAnimation0001 assert3 value=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartNewAbilityWithoutAnimation0001 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartNewAbilityWithAnimation0002 begin');
      await startNewAbility(true);
      const top: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      const actual1: string = getAbilityName(top);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartNewAbilityWithAnimation0002 assert1 getAbilityName=${actual1}`);
      expect(actual1).assertEqual(NEW_ABILITY);
      const actual2: boolean | undefined = buildStartOptions(true).withAnimation;
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartNewAbilityWithAnimation0002 assert2 withAnimation=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean | undefined = buildStartOptions(false).withAnimation;
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartNewAbilityWithAnimation0002 assert3 withAnimation=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartNewAbilityWithAnimation0002 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTopAbilityInfoOfNewAbility0003 begin');
      await startNewAbility(false);
      const top: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      const actual1: string = getAbilityName(top);
      hilog.info(DOMAIN, TAG, '%{public}s', `testTopAbilityInfoOfNewAbility0003 assert1 getAbilityName=${actual1}`);
      expect(actual1).assertEqual(NEW_ABILITY);
      if (top !== undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', `testTopAbilityInfoOfNewAbility0003 assert2 top.context.abilityInfo.bundleName=${top.context.abilityInfo.bundleName}`);
        expect(top.context.abilityInfo.bundleName).assertEqual(getBundleName());
        hilog.info(DOMAIN, TAG, '%{public}s', `testTopAbilityInfoOfNewAbility0003 assert3 top.context.abilityInfo.moduleName=${top.context.abilityInfo.moduleName}`);
        expect(top.context.abilityInfo.moduleName).assertEqual('entry');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTopAbilityInfoOfNewAbility0003 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTerminateNewAbility0004 begin');
      await startNewAbility(false);
      const top: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      const actual1: string = getAbilityName(top);
      hilog.info(DOMAIN, TAG, '%{public}s', `testTerminateNewAbility0004 assert1 getAbilityName=${actual1}`);
      expect(actual1).assertEqual(NEW_ABILITY);
      if (top !== undefined) {
        await top.context.terminateSelf();
      }
      const entry: UIAbility | undefined = await waitForTopAbility(ENTRY_ABILITY, 6000);
      const actual2: string = getAbilityName(entry);
      hilog.info(DOMAIN, TAG, '%{public}s', `testTerminateNewAbility0004 assert2 getAbilityName=${actual2}`);
      expect(actual2).assertEqual(ENTRY_ABILITY);
      const actual3: boolean = getAbilityName(entry) === NEW_ABILITY;
      hilog.info(DOMAIN, TAG, '%{public}s', `testTerminateNewAbility0004 assert3 getAbilityName=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTerminateNewAbility0004 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedStartNewAbility0005 begin');
      await startNewAbility(false);
      const actual1: string = getAbilityName(await waitForTopAbility(NEW_ABILITY, 6000));
      hilog.info(DOMAIN, TAG, '%{public}s', `testRepeatedStartNewAbility0005 assert1 getAbilityName=${actual1}`);
      expect(actual1).assertEqual(NEW_ABILITY);
      await startNewAbility(true);
      const top: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      const actual2: string = getAbilityName(top);
      hilog.info(DOMAIN, TAG, '%{public}s', `testRepeatedStartNewAbility0005 assert2 getAbilityName=${actual2}`);
      expect(actual2).assertEqual(NEW_ABILITY);
      const actual3: boolean = top !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testRepeatedStartNewAbility0005 assert3 value=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedStartNewAbility0005 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartAfterReturnToEntry0006 begin');
      await startNewAbility(false);
      const first: UIAbility | undefined = await waitForTopAbility(NEW_ABILITY, 6000);
      const actual1: string = getAbilityName(first);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartAfterReturnToEntry0006 assert1 getAbilityName=${actual1}`);
      expect(actual1).assertEqual(NEW_ABILITY);
      if (first !== undefined) {
        await first.context.terminateSelf();
      }
      const actual2: string = getAbilityName(await waitForTopAbility(ENTRY_ABILITY, 6000));
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartAfterReturnToEntry0006 assert2 getAbilityName=${actual2}`);
      expect(actual2).assertEqual(ENTRY_ABILITY);
      await startNewAbility(true);
      const actual3: string = getAbilityName(await waitForTopAbility(NEW_ABILITY, 6000));
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartAfterReturnToEntry0006 assert3 getAbilityName=${actual3}`);
      expect(actual3).assertEqual(NEW_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartAfterReturnToEntry0006 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFieldsBeforeLaunch0007 begin');
      const options: StartOptions = buildStartOptions(true);
      const text: string = formatStartOptions(options);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsFieldsBeforeLaunch0007 assert1 options.displayId=${options.displayId}`);
      expect(options.displayId).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsFieldsBeforeLaunch0007 assert2 options.windowWidth=${options.windowWidth}`);
      expect(options.windowWidth).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsFieldsBeforeLaunch0007 assert3 options.windowHeight=${options.windowHeight}`);
      expect(options.windowHeight).assertEqual(400);
      const actual4: boolean = text.includes('withAnimation=true');
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsFieldsBeforeLaunch0007 assert4 text.includes=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = text.endsWith('height=400');
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsFieldsBeforeLaunch0007 assert5 text.endsWith=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsFieldsBeforeLaunch0007 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNewAbilityWantMatchesBundle0008 begin');
      const bundleName: string = getBundleName();
      const actual1: boolean = bundleName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `testNewAbilityWantMatchesBundle0008 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string | undefined = buildNewAbilityWant(bundleName).bundleName;
      hilog.info(DOMAIN, TAG, '%{public}s', `testNewAbilityWantMatchesBundle0008 assert2 bundleName=${actual2}`);
      expect(actual2).assertEqual(bundleName);
      const actual3: string | undefined = buildNewAbilityWant(bundleName).abilityName;
      hilog.info(DOMAIN, TAG, '%{public}s', `testNewAbilityWantMatchesBundle0008 assert3 abilityName=${actual3}`);
      expect(actual3).assertEqual(NEW_ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNewAbilityWantMatchesBundle0008 end');
    })
  })
}
