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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  ENTRY_ABILITY_NAME,
  LANGUAGE_EN_US,
  LANGUAGE_ZH_CN,
  LOG_DOMAIN,
  LOG_PREFIX,
  NEW_ABILITY_NAME,
  SAMPLE_FILE_NAME,
  START_OPTIONS_DISPLAY_ID,
  START_OPTIONS_WINDOW_HEIGHT,
  START_OPTIONS_WINDOW_LEFT,
  START_OPTIONS_WINDOW_TOP,
  START_OPTIONS_WINDOW_WIDTH,
  TEXT_PLAIN_TYPE,
  TOAST_DURATION,
  VIEW_DATA_ACTION,
  ZERO_MATCH_URI
} from '../../../main/ets/common/AppConstants';
import {
  MENU_ID_LANGUAGE_ZH,
  MENU_ID_LANGUAGE_EN,
  MENU_ID_MODE_LIGHT,
  MENU_ID_MODE_DARK,
  MENU_ID_IMPLICIT_POPUP,
  MENU_ID_IMPLICIT_NO_POPUP,
  MENU_ID_STORAGE_CREATE,
  MENU_ID_STORAGE_CHECK,
  MENU_ID_STORAGE_CLEAR,
  MENU_ID_START_OPTIONS,
  MENU_ID_ANIMATION_TOGGLE,
  PAGE_ID_NEW_BACK
} from '../../../main/ets/common/MenuIds';
import {
  buildImplicitViewWant,
  buildNewAbilityWant,
  buildStartOptions,
  hasStartWithoutTipsFlag
} from '../../../main/ets/model/LaunchIntent';
import { joinStoragePath } from '../../../main/ets/model/StoragePath';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityFeature]';

const ALL_IDS: string[] = [
  MENU_ID_LANGUAGE_ZH,
  MENU_ID_LANGUAGE_EN,
  MENU_ID_MODE_LIGHT,
  MENU_ID_MODE_DARK,
  MENU_ID_IMPLICIT_POPUP,
  MENU_ID_IMPLICIT_NO_POPUP,
  MENU_ID_STORAGE_CREATE,
  MENU_ID_STORAGE_CHECK,
  MENU_ID_STORAGE_CLEAR,
  MENU_ID_START_OPTIONS,
  MENU_ID_ANIMATION_TOGGLE,
  PAGE_ID_NEW_BACK
];

export default function appConstantMatrixTest(): void {
  describe('AbilityFeatureAppConstantMatrixTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0001
     * @tc.name      testAppConstantMatrix0001
     * @tc.desc      包名 "com.samples.abilityFeature" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0001 begin');
      const want: Want = buildNewAbilityWant('com.samples.abilityFeature');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0001 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('com.samples.abilityFeature');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0002
     * @tc.name      testAppConstantMatrix0002
     * @tc.desc      包名 "com.example.a" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppConstantMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0002 begin');
      const want: Want = buildNewAbilityWant('com.example.a');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0002 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('com.example.a');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0003
     * @tc.name      testAppConstantMatrix0003
     * @tc.desc      包名 空串 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppConstantMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0003 begin');
      const want: Want = buildNewAbilityWant('');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0003 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0004
     * @tc.name      testAppConstantMatrix0004
     * @tc.desc      包名 "a" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppConstantMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0004 begin');
      const want: Want = buildNewAbilityWant('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0004 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('a');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0005
     * @tc.name      testAppConstantMatrix0005
     * @tc.desc      包名 "com.x.y.z.w" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppConstantMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0005 begin');
      const want: Want = buildNewAbilityWant('com.x.y.z.w');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0005 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('com.x.y.z.w');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0006
     * @tc.name      testAppConstantMatrix0006
     * @tc.desc      包名 "COM.UPPER.CASE" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppConstantMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0006 begin');
      const want: Want = buildNewAbilityWant('COM.UPPER.CASE');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0006 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('COM.UPPER.CASE');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0007
     * @tc.name      testAppConstantMatrix0007
     * @tc.desc      包名 "com.digits123" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppConstantMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0007 begin');
      const want: Want = buildNewAbilityWant('com.digits123');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0007 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('com.digits123');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0008
     * @tc.name      testAppConstantMatrix0008
     * @tc.desc      包名 "com.under_score" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppConstantMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0008 begin');
      const want: Want = buildNewAbilityWant('com.under_score');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0008 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('com.under_score');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0009
     * @tc.name      testAppConstantMatrix0009
     * @tc.desc      包名 "com.dash-name" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppConstantMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0009 begin');
      const want: Want = buildNewAbilityWant('com.dash-name');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0009 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('com.dash-name');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0010
     * @tc.name      testAppConstantMatrix0010
     * @tc.desc      包名 "中文包名" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppConstantMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0010 begin');
      const want: Want = buildNewAbilityWant('中文包名');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0010 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('中文包名');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0011
     * @tc.name      testAppConstantMatrix0011
     * @tc.desc      包名 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppConstantMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0011 begin');
      const want: Want = buildNewAbilityWant('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0011 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0012
     * @tc.name      testAppConstantMatrix0012
     * @tc.desc      包名 " com.space " 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppConstantMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0012 begin');
      const want: Want = buildNewAbilityWant(' com.space ');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0012 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual(' com.space ');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0013
     * @tc.name      testAppConstantMatrix0013
     * @tc.desc      包名 "com.samples.abilityFeature.extra" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppConstantMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0013 begin');
      const want: Want = buildNewAbilityWant('com.samples.abilityFeature.extra');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0013 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('com.samples.abilityFeature.extra');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0014
     * @tc.name      testAppConstantMatrix0014
     * @tc.desc      包名 "com.samples.abilityfeature" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppConstantMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0014 begin');
      const want: Want = buildNewAbilityWant('com.samples.abilityfeature');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0014 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('com.samples.abilityfeature');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0015
     * @tc.name      testAppConstantMatrix0015
     * @tc.desc      包名 "ohos.samples.demo" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testAppConstantMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0015 begin');
      const want: Want = buildNewAbilityWant('ohos.samples.demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0015 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('ohos.samples.demo');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0016
     * @tc.name      testAppConstantMatrix0016
     * @tc.desc      包名 "com..double.dot" 构造的 NewAbility Want 原样保留包名，只带包名与 Ability 名两项
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAppConstantMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0016 begin');
      const want: Want = buildNewAbilityWant('com..double.dot');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0016 params: want=${JSON.stringify(want)}`);
      expect(want.bundleName).assertEqual('com..double.dot');
      expect(want.abilityName).assertEqual('NewAbility');
      expect(want.action === undefined).assertTrue();
      expect(want.parameters === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0017
     * @tc.name      testAppConstantMatrix0017
     * @tc.desc      组件 id MENU_ID_LANGUAGE_ZH 取值为 menu_language_zh，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0017 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0017 params: MENU_ID_LANGUAGE_ZH=${MENU_ID_LANGUAGE_ZH}`);
      expect(MENU_ID_LANGUAGE_ZH).assertEqual('menu_language_zh');
      expect(MENU_ID_LANGUAGE_ZH.startsWith('menu_')).assertTrue();
      expect(/^[a-z_]+$/.test(MENU_ID_LANGUAGE_ZH)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === MENU_ID_LANGUAGE_ZH).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0018
     * @tc.name      testAppConstantMatrix0018
     * @tc.desc      组件 id MENU_ID_LANGUAGE_EN 取值为 menu_language_en，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0018 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0018 params: MENU_ID_LANGUAGE_EN=${MENU_ID_LANGUAGE_EN}`);
      expect(MENU_ID_LANGUAGE_EN).assertEqual('menu_language_en');
      expect(MENU_ID_LANGUAGE_EN.startsWith('menu_')).assertTrue();
      expect(/^[a-z_]+$/.test(MENU_ID_LANGUAGE_EN)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === MENU_ID_LANGUAGE_EN).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0019
     * @tc.name      testAppConstantMatrix0019
     * @tc.desc      组件 id MENU_ID_MODE_LIGHT 取值为 menu_mode_light，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0019 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0019 params: MENU_ID_MODE_LIGHT=${MENU_ID_MODE_LIGHT}`);
      expect(MENU_ID_MODE_LIGHT).assertEqual('menu_mode_light');
      expect(MENU_ID_MODE_LIGHT.startsWith('menu_')).assertTrue();
      expect(/^[a-z_]+$/.test(MENU_ID_MODE_LIGHT)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === MENU_ID_MODE_LIGHT).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0020
     * @tc.name      testAppConstantMatrix0020
     * @tc.desc      组件 id MENU_ID_MODE_DARK 取值为 menu_mode_dark，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0020 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0020 params: MENU_ID_MODE_DARK=${MENU_ID_MODE_DARK}`);
      expect(MENU_ID_MODE_DARK).assertEqual('menu_mode_dark');
      expect(MENU_ID_MODE_DARK.startsWith('menu_')).assertTrue();
      expect(/^[a-z_]+$/.test(MENU_ID_MODE_DARK)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === MENU_ID_MODE_DARK).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0021
     * @tc.name      testAppConstantMatrix0021
     * @tc.desc      组件 id MENU_ID_IMPLICIT_POPUP 取值为 menu_implicit_popup，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0021 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0021 params: MENU_ID_IMPLICIT_POPUP=${MENU_ID_IMPLICIT_POPUP}`);
      expect(MENU_ID_IMPLICIT_POPUP).assertEqual('menu_implicit_popup');
      expect(MENU_ID_IMPLICIT_POPUP.startsWith('menu_')).assertTrue();
      expect(/^[a-z_]+$/.test(MENU_ID_IMPLICIT_POPUP)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === MENU_ID_IMPLICIT_POPUP).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0022
     * @tc.name      testAppConstantMatrix0022
     * @tc.desc      组件 id MENU_ID_IMPLICIT_NO_POPUP 取值为 menu_implicit_no_popup，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0022 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0022 params: MENU_ID_IMPLICIT_NO_POPUP=${MENU_ID_IMPLICIT_NO_POPUP}`);
      expect(MENU_ID_IMPLICIT_NO_POPUP).assertEqual('menu_implicit_no_popup');
      expect(MENU_ID_IMPLICIT_NO_POPUP.startsWith('menu_')).assertTrue();
      expect(/^[a-z_]+$/.test(MENU_ID_IMPLICIT_NO_POPUP)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === MENU_ID_IMPLICIT_NO_POPUP).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0023
     * @tc.name      testAppConstantMatrix0023
     * @tc.desc      组件 id MENU_ID_STORAGE_CREATE 取值为 menu_storage_create，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0023 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0023 params: MENU_ID_STORAGE_CREATE=${MENU_ID_STORAGE_CREATE}`);
      expect(MENU_ID_STORAGE_CREATE).assertEqual('menu_storage_create');
      expect(MENU_ID_STORAGE_CREATE.startsWith('menu_')).assertTrue();
      expect(/^[a-z_]+$/.test(MENU_ID_STORAGE_CREATE)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === MENU_ID_STORAGE_CREATE).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0024
     * @tc.name      testAppConstantMatrix0024
     * @tc.desc      组件 id MENU_ID_STORAGE_CHECK 取值为 menu_storage_check，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0024 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0024 params: MENU_ID_STORAGE_CHECK=${MENU_ID_STORAGE_CHECK}`);
      expect(MENU_ID_STORAGE_CHECK).assertEqual('menu_storage_check');
      expect(MENU_ID_STORAGE_CHECK.startsWith('menu_')).assertTrue();
      expect(/^[a-z_]+$/.test(MENU_ID_STORAGE_CHECK)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === MENU_ID_STORAGE_CHECK).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0025
     * @tc.name      testAppConstantMatrix0025
     * @tc.desc      组件 id MENU_ID_STORAGE_CLEAR 取值为 menu_storage_clear，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0025 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0025 params: MENU_ID_STORAGE_CLEAR=${MENU_ID_STORAGE_CLEAR}`);
      expect(MENU_ID_STORAGE_CLEAR).assertEqual('menu_storage_clear');
      expect(MENU_ID_STORAGE_CLEAR.startsWith('menu_')).assertTrue();
      expect(/^[a-z_]+$/.test(MENU_ID_STORAGE_CLEAR)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === MENU_ID_STORAGE_CLEAR).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0026
     * @tc.name      testAppConstantMatrix0026
     * @tc.desc      组件 id MENU_ID_START_OPTIONS 取值为 menu_start_options，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0026 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0026 params: MENU_ID_START_OPTIONS=${MENU_ID_START_OPTIONS}`);
      expect(MENU_ID_START_OPTIONS).assertEqual('menu_start_options');
      expect(MENU_ID_START_OPTIONS.startsWith('menu_')).assertTrue();
      expect(/^[a-z_]+$/.test(MENU_ID_START_OPTIONS)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === MENU_ID_START_OPTIONS).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0027
     * @tc.name      testAppConstantMatrix0027
     * @tc.desc      组件 id MENU_ID_ANIMATION_TOGGLE 取值为 menu_animation_toggle，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0027 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0027 params: MENU_ID_ANIMATION_TOGGLE=${MENU_ID_ANIMATION_TOGGLE}`);
      expect(MENU_ID_ANIMATION_TOGGLE).assertEqual('menu_animation_toggle');
      expect(MENU_ID_ANIMATION_TOGGLE.startsWith('menu_')).assertTrue();
      expect(/^[a-z_]+$/.test(MENU_ID_ANIMATION_TOGGLE)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === MENU_ID_ANIMATION_TOGGLE).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0028
     * @tc.name      testAppConstantMatrix0028
     * @tc.desc      组件 id PAGE_ID_NEW_BACK 取值为 new_page_back，只含小写字母与下划线且在全部 id 中唯一
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0028 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0028 params: PAGE_ID_NEW_BACK=${PAGE_ID_NEW_BACK}`);
      expect(PAGE_ID_NEW_BACK).assertEqual('new_page_back');
      expect(PAGE_ID_NEW_BACK.startsWith('new_page_')).assertTrue();
      expect(/^[a-z_]+$/.test(PAGE_ID_NEW_BACK)).assertTrue();
      expect(ALL_IDS.filter((id: string) => id === PAGE_ID_NEW_BACK).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0029
     * @tc.name      testAppConstantMatrix0029
     * @tc.desc      LOG_DOMAIN 为 0xF811，落在 hilog 允许的 0~0xFFFF 区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0029 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0029 params: LOG_DOMAIN=${LOG_DOMAIN}`);
      expect(LOG_DOMAIN).assertEqual(0xF811);
      expect(LOG_DOMAIN <= 0xFFFF).assertTrue();
      expect(Number.isInteger(LOG_DOMAIN)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0030
     * @tc.name      testAppConstantMatrix0030
     * @tc.desc      LOG_PREFIX 为 [Sample_AbilityFeature]，不含空白
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0030 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0030 params: LOG_PREFIX=${LOG_PREFIX}`);
      expect(LOG_PREFIX).assertEqual('[Sample_AbilityFeature]');
      expect(LOG_PREFIX.length).assertEqual(23);
      expect(LOG_PREFIX.includes(' ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0031
     * @tc.name      testAppConstantMatrix0031
     * @tc.desc      ENTRY_ABILITY_NAME 为 EntryAbility，与 NewAbility 不同名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0031 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0031 params: ENTRY_ABILITY_NAME=${ENTRY_ABILITY_NAME}`);
      expect(ENTRY_ABILITY_NAME).assertEqual('EntryAbility');
      expect(ENTRY_ABILITY_NAME === NEW_ABILITY_NAME).assertFalse();
      expect(ENTRY_ABILITY_NAME.endsWith('Ability')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0032
     * @tc.name      testAppConstantMatrix0032
     * @tc.desc      NEW_ABILITY_NAME 为 NewAbility，与 NewAbility Want 的 abilityName 一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0032 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0032 params: NEW_ABILITY_NAME=${NEW_ABILITY_NAME}`);
      expect(NEW_ABILITY_NAME).assertEqual('NewAbility');
      expect(buildNewAbilityWant('com.samples.abilityFeature').abilityName).assertEqual(NEW_ABILITY_NAME);
      expect(NEW_ABILITY_NAME.endsWith('Ability')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0033
     * @tc.name      testAppConstantMatrix0033
     * @tc.desc      TOAST_DURATION 为 3000 毫秒，处于 Toast 允许的 1500~10000 区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0033 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0033 params: TOAST_DURATION=${TOAST_DURATION}`);
      expect(TOAST_DURATION).assertEqual(3000);
      expect(TOAST_DURATION >= 1500).assertTrue();
      expect(TOAST_DURATION <= 10000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0034
     * @tc.name      testAppConstantMatrix0034
     * @tc.desc      SAMPLE_FILE_NAME 为 /test.txt，拼接后只保留一个分隔符
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0034 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0034 params: SAMPLE_FILE_NAME=${SAMPLE_FILE_NAME}`);
      expect(SAMPLE_FILE_NAME).assertEqual('/test.txt');
      expect(SAMPLE_FILE_NAME.startsWith('/')).assertTrue();
      expect(joinStoragePath('/d', SAMPLE_FILE_NAME)).assertEqual('/d/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0035
     * @tc.name      testAppConstantMatrix0035
     * @tc.desc      LANGUAGE_ZH_CN 为 zh-cn，由语言与地区两段组成
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0035 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0035 params: LANGUAGE_ZH_CN=${LANGUAGE_ZH_CN}`);
      expect(LANGUAGE_ZH_CN).assertEqual('zh-cn');
      expect(LANGUAGE_ZH_CN.split('-').length).assertEqual(2);
      expect(LANGUAGE_ZH_CN === LANGUAGE_EN_US).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0036
     * @tc.name      testAppConstantMatrix0036
     * @tc.desc      LANGUAGE_EN_US 为 en-us，由语言与地区两段组成
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0036 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0036 params: LANGUAGE_EN_US=${LANGUAGE_EN_US}`);
      expect(LANGUAGE_EN_US).assertEqual('en-us');
      expect(LANGUAGE_EN_US.split('-')[0]).assertEqual('en');
      expect(LANGUAGE_EN_US.split('-')[1]).assertEqual('us');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0037
     * @tc.name      testAppConstantMatrix0037
     * @tc.desc      VIEW_DATA_ACTION 为 ohos.want.action.viewData，并被隐式 Want 采用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0037 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0037 params: VIEW_DATA_ACTION=${VIEW_DATA_ACTION}`);
      expect(VIEW_DATA_ACTION).assertEqual('ohos.want.action.viewData');
      expect(VIEW_DATA_ACTION.startsWith('ohos.want.action.')).assertTrue();
      expect(buildImplicitViewWant(true).action).assertEqual(VIEW_DATA_ACTION);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0038
     * @tc.name      testAppConstantMatrix0038
     * @tc.desc      TEXT_PLAIN_TYPE 为 text/plain，并被隐式 Want 采用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0038 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0038 params: TEXT_PLAIN_TYPE=${TEXT_PLAIN_TYPE}`);
      expect(TEXT_PLAIN_TYPE).assertEqual('text/plain');
      expect(TEXT_PLAIN_TYPE.split('/').length).assertEqual(2);
      expect(buildImplicitViewWant(false).type).assertEqual(TEXT_PLAIN_TYPE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0039
     * @tc.name      testAppConstantMatrix0039
     * @tc.desc      ZERO_MATCH_URI 为 filePath，作为隐式 Want 的 uri 参数
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0039 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0039 params: ZERO_MATCH_URI=${ZERO_MATCH_URI}`);
      expect(ZERO_MATCH_URI).assertEqual('filePath');
      expect(JSON.stringify(buildImplicitViewWant(true).parameters)).assertEqual('{"uri":"filePath"}');
      expect(ZERO_MATCH_URI.includes('/')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0040
     * @tc.name      testAppConstantMatrix0040
     * @tc.desc      START_OPTIONS_DISPLAY_ID 为 0，并被 StartOptions 采用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0040 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0040 params: START_OPTIONS_DISPLAY_ID=${START_OPTIONS_DISPLAY_ID}`);
      expect(START_OPTIONS_DISPLAY_ID).assertEqual(0);
      expect(buildStartOptions(true).displayId).assertEqual(START_OPTIONS_DISPLAY_ID);
      expect(Number.isInteger(START_OPTIONS_DISPLAY_ID)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0041
     * @tc.name      testAppConstantMatrix0041
     * @tc.desc      START_OPTIONS_WINDOW_LEFT 为 50，并被 StartOptions 采用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0041 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0041 params: START_OPTIONS_WINDOW_LEFT=${START_OPTIONS_WINDOW_LEFT}`);
      expect(START_OPTIONS_WINDOW_LEFT).assertEqual(50);
      expect(buildStartOptions(false).windowLeft).assertEqual(START_OPTIONS_WINDOW_LEFT);
      expect(START_OPTIONS_WINDOW_LEFT < START_OPTIONS_WINDOW_WIDTH).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0042
     * @tc.name      testAppConstantMatrix0042
     * @tc.desc      START_OPTIONS_WINDOW_TOP 为 100，并被 StartOptions 采用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0042 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0042 params: START_OPTIONS_WINDOW_TOP=${START_OPTIONS_WINDOW_TOP}`);
      expect(START_OPTIONS_WINDOW_TOP).assertEqual(100);
      expect(buildStartOptions(false).windowTop).assertEqual(START_OPTIONS_WINDOW_TOP);
      expect(START_OPTIONS_WINDOW_TOP < START_OPTIONS_WINDOW_HEIGHT).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0043
     * @tc.name      testAppConstantMatrix0043
     * @tc.desc      START_OPTIONS_WINDOW_WIDTH 为 300，并被 StartOptions 采用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0043 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0043 params: START_OPTIONS_WINDOW_WIDTH=${START_OPTIONS_WINDOW_WIDTH}`);
      expect(START_OPTIONS_WINDOW_WIDTH).assertEqual(300);
      expect(buildStartOptions(true).windowWidth).assertEqual(START_OPTIONS_WINDOW_WIDTH);
      expect(START_OPTIONS_WINDOW_WIDTH < START_OPTIONS_WINDOW_HEIGHT).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CONSTANT_0044
     * @tc.name      testAppConstantMatrix0044
     * @tc.desc      START_OPTIONS_WINDOW_HEIGHT 为 400，并被 StartOptions 采用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppConstantMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0044 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testAppConstantMatrix0044 params: START_OPTIONS_WINDOW_HEIGHT=${START_OPTIONS_WINDOW_HEIGHT}`);
      expect(START_OPTIONS_WINDOW_HEIGHT).assertEqual(400);
      expect(buildStartOptions(true).windowHeight).assertEqual(START_OPTIONS_WINDOW_HEIGHT);
      expect(START_OPTIONS_WINDOW_HEIGHT - START_OPTIONS_WINDOW_TOP).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAppConstantMatrix0044 end');
    })
  })
}
