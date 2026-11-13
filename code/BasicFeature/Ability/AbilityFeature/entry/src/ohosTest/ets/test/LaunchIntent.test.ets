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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { StartOptions, Want, wantConstant } from '@kit.AbilityKit';
import {
  buildImplicitViewWant,
  buildNewAbilityWant,
  buildStartOptions,
  formatStartOptions,
  hasStartWithoutTipsFlag
} from '../../../main/ets/model/LaunchIntent';
import {
  NEW_ABILITY_NAME,
  START_OPTIONS_DISPLAY_ID,
  START_OPTIONS_WINDOW_HEIGHT,
  START_OPTIONS_WINDOW_LEFT,
  START_OPTIONS_WINDOW_TOP,
  START_OPTIONS_WINDOW_WIDTH,
  TEXT_PLAIN_TYPE,
  VIEW_DATA_ACTION,
  ZERO_MATCH_URI
} from '../../../main/ets/common/AppConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityFeature]';

const START_WITHOUT_TIPS: number = wantConstant.Flags.FLAG_START_WITHOUT_TIPS;

export default function launchIntentTest() {
  describe('AbilityFeatureLaunchWantTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0001
     * @tc.name      testImplicitWantBaseFields0001
     * @tc.desc      隐式启动意图携带 action、type 与 uri 参数
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImplicitWantBaseFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImplicitWantBaseFields0001 begin');
      const want: Want = buildImplicitViewWant(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantBaseFields0001 assert1 want.action=${want.action}`);
      expect(want.action).assertEqual(VIEW_DATA_ACTION);
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantBaseFields0001 assert2 want.type=${want.type}`);
      expect(want.type).assertEqual(TEXT_PLAIN_TYPE);
      const actual3: boolean = want.parameters !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantBaseFields0001 assert3 value=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImplicitWantBaseFields0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0002
     * @tc.name      testImplicitWantUriParameter0002
     * @tc.desc      parameters 里只带 uri 一项，值为零匹配的占位路径
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImplicitWantUriParameter0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImplicitWantUriParameter0002 begin');
      const serialized: string = JSON.stringify(buildImplicitViewWant(false).parameters);
      const actual1: boolean = serialized.includes('"uri"');
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantUriParameter0002 assert1 serialized.includes=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = serialized.includes(ZERO_MATCH_URI);
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantUriParameter0002 assert2 serialized.includes=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = serialized.startsWith('{');
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantUriParameter0002 assert3 serialized.startsWith=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImplicitWantUriParameter0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0003
     * @tc.name      testImplicitWantWithoutTipsFlag0003
     * @tc.desc      不要求静默时 want 不带 flags 字段
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImplicitWantWithoutTipsFlag0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImplicitWantWithoutTipsFlag0003 begin');
      const want: Want = buildImplicitViewWant(false);
      const actual1: boolean = want.flags === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantWithoutTipsFlag0003 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = hasStartWithoutTipsFlag(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantWithoutTipsFlag0003 assert2 hasStartWithoutTipsFlag=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: boolean = want.bundleName === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantWithoutTipsFlag0003 assert3 value=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImplicitWantWithoutTipsFlag0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0004
     * @tc.name      testImplicitWantWithTipsFlag0004
     * @tc.desc      静默启动时 flags 等于 FLAG_START_WITHOUT_TIPS
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImplicitWantWithTipsFlag0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImplicitWantWithTipsFlag0004 begin');
      const want: Want = buildImplicitViewWant(true);
      const actual1: boolean = want.flags !== undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantWithTipsFlag0004 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantWithTipsFlag0004 assert2 want.flags=${want.flags}`);
      expect(want.flags).assertEqual(START_WITHOUT_TIPS);
      const actual3: boolean = hasStartWithoutTipsFlag(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `testImplicitWantWithTipsFlag0004 assert3 hasStartWithoutTipsFlag=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testImplicitWantWithTipsFlag0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0005
     * @tc.name      testStartWithoutTipsFlagValue0005
     * @tc.desc      该 flag 是 0x40000000 的单 bit 掩码
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStartWithoutTipsFlagValue0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartWithoutTipsFlagValue0005 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartWithoutTipsFlagValue0005 assert1 START_WITHOUT_TIPS=${START_WITHOUT_TIPS}`);
      expect(START_WITHOUT_TIPS).assertEqual(0x40000000);
      const actual2: boolean = START_WITHOUT_TIPS > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartWithoutTipsFlagValue0005 assert2 value=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: number = START_WITHOUT_TIPS & (START_WITHOUT_TIPS - 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartWithoutTipsFlagValue0005 assert3 value=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartWithoutTipsFlagValue0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0006
     * @tc.name      testHasFlagWithArbitraryWant0006
     * @tc.desc      只有带该 bit 的 want 才判定为静默启动
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHasFlagWithArbitraryWant0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHasFlagWithArbitraryWant0006 begin');
      const empty: Want = { flags: 0 };
      const tipped: Want = { flags: START_WITHOUT_TIPS };
      const other: Want = { flags: 0x2 };
      const actual1: boolean = hasStartWithoutTipsFlag(empty);
      hilog.info(DOMAIN, TAG, '%{public}s', `testHasFlagWithArbitraryWant0006 assert1 hasStartWithoutTipsFlag=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: boolean = hasStartWithoutTipsFlag(tipped);
      hilog.info(DOMAIN, TAG, '%{public}s', `testHasFlagWithArbitraryWant0006 assert2 hasStartWithoutTipsFlag=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = hasStartWithoutTipsFlag(other);
      hilog.info(DOMAIN, TAG, '%{public}s', `testHasFlagWithArbitraryWant0006 assert3 hasStartWithoutTipsFlag=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHasFlagWithArbitraryWant0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0007
     * @tc.name      testHasFlagWithCombinedFlags0007
     * @tc.desc      多个 flag 按位叠加时仍能识别出静默启动位
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHasFlagWithCombinedFlags0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHasFlagWithCombinedFlags0007 begin');
      const combined: Want = { flags: (START_WITHOUT_TIPS | 0x2) };
      const flags: number = combined.flags === undefined ? 0 : combined.flags;
      const actual1: boolean = hasStartWithoutTipsFlag(combined);
      hilog.info(DOMAIN, TAG, '%{public}s', `testHasFlagWithCombinedFlags0007 assert1 hasStartWithoutTipsFlag=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: number = flags & 0x2;
      hilog.info(DOMAIN, TAG, '%{public}s', `testHasFlagWithCombinedFlags0007 assert2 value=${actual2}`);
      expect(actual2).assertEqual(2);
      const actual3: number = flags & START_WITHOUT_TIPS;
      hilog.info(DOMAIN, TAG, '%{public}s', `testHasFlagWithCombinedFlags0007 assert3 value=${actual3}`);
      expect(actual3).assertEqual(START_WITHOUT_TIPS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHasFlagWithCombinedFlags0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0008
     * @tc.name      testHasFlagWithoutFlagsField0008
     * @tc.desc      完全没有 flags 字段的 want 不会误判为静默启动
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHasFlagWithoutFlagsField0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHasFlagWithoutFlagsField0008 begin');
      const empty: Want = {};
      const actual1: boolean = hasStartWithoutTipsFlag(empty);
      hilog.info(DOMAIN, TAG, '%{public}s', `testHasFlagWithoutFlagsField0008 assert1 hasStartWithoutTipsFlag=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: boolean = empty.flags === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testHasFlagWithoutFlagsField0008 assert2 value=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = empty.action === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testHasFlagWithoutFlagsField0008 assert3 value=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHasFlagWithoutFlagsField0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0009
     * @tc.name      testNewAbilityWant0009
     * @tc.desc      显式启动意图带上传入的包名与 NewAbility 名称
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNewAbilityWant0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNewAbilityWant0009 begin');
      const want: Want = buildNewAbilityWant('com.samples.abilityFeature');
      hilog.info(DOMAIN, TAG, '%{public}s', `testNewAbilityWant0009 assert1 want.bundleName=${want.bundleName}`);
      expect(want.bundleName).assertEqual('com.samples.abilityFeature');
      hilog.info(DOMAIN, TAG, '%{public}s', `testNewAbilityWant0009 assert2 want.abilityName=${want.abilityName}`);
      expect(want.abilityName).assertEqual(NEW_ABILITY_NAME);
      const actual3: boolean = want.action === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `testNewAbilityWant0009 assert3 value=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNewAbilityWant0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0010
     * @tc.name      testNewAbilityWantWithEmptyBundle0010
     * @tc.desc      包名为空串时原样透传，Ability 名不受影响
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNewAbilityWantWithEmptyBundle0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNewAbilityWantWithEmptyBundle0010 begin');
      const actual1: string | undefined = buildNewAbilityWant('').bundleName;
      hilog.info(DOMAIN, TAG, '%{public}s', `testNewAbilityWantWithEmptyBundle0010 assert1 bundleName=${actual1}`);
      expect(actual1).assertEqual('');
      const actual2: string | undefined = buildNewAbilityWant('').abilityName;
      hilog.info(DOMAIN, TAG, '%{public}s', `testNewAbilityWantWithEmptyBundle0010 assert2 abilityName=${actual2}`);
      expect(actual2).assertEqual('NewAbility');
      const actual3: string | undefined = buildNewAbilityWant('abc').bundleName;
      hilog.info(DOMAIN, TAG, '%{public}s', `testNewAbilityWantWithEmptyBundle0010 assert3 bundleName=${actual3}`);
      expect(actual3).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNewAbilityWantWithEmptyBundle0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0011
     * @tc.name      testStartOptionsDefaultValues0011
     * @tc.desc      关闭动效时窗口位置与大小取常量值
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartOptionsDefaultValues0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsDefaultValues0011 begin');
      const options: StartOptions = buildStartOptions(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsDefaultValues0011 assert1 options.withAnimation=${options.withAnimation}`);
      expect(options.withAnimation).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsDefaultValues0011 assert2 options.displayId=${options.displayId}`);
      expect(options.displayId).assertEqual(START_OPTIONS_DISPLAY_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsDefaultValues0011 assert3 options.windowLeft=${options.windowLeft}`);
      expect(options.windowLeft).assertEqual(START_OPTIONS_WINDOW_LEFT);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsDefaultValues0011 assert4 options.windowTop=${options.windowTop}`);
      expect(options.windowTop).assertEqual(START_OPTIONS_WINDOW_TOP);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsDefaultValues0011 assert5 options.windowWidth=${options.windowWidth}`);
      expect(options.windowWidth).assertEqual(START_OPTIONS_WINDOW_WIDTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsDefaultValues0011 assert6 options.windowHeight=${options.windowHeight}`);
      expect(options.windowHeight).assertEqual(START_OPTIONS_WINDOW_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsDefaultValues0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0012
     * @tc.name      testStartOptionsWithAnimation0012
     * @tc.desc      开关动效只影响 withAnimation，其余字段保持一致
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartOptionsWithAnimation0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsWithAnimation0012 begin');
      const off: StartOptions = buildStartOptions(false);
      const on: StartOptions = buildStartOptions(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsWithAnimation0012 assert1 on.withAnimation=${on.withAnimation}`);
      expect(on.withAnimation).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsWithAnimation0012 assert2 off.withAnimation=${off.withAnimation}`);
      expect(off.withAnimation).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsWithAnimation0012 assert3 on.windowWidth=${on.windowWidth}`);
      expect(on.windowWidth).assertEqual(off.windowWidth);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStartOptionsWithAnimation0012 assert4 on.displayId=${on.displayId}`);
      expect(on.displayId).assertEqual(off.displayId);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartOptionsWithAnimation0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0013
     * @tc.name      testFormatStartOptionsWithAnimation0013
     * @tc.desc      描述串按固定顺序包含六个字段
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatStartOptionsWithAnimation0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatStartOptionsWithAnimation0013 begin');
      const text: string = formatStartOptions(buildStartOptions(true));
      const actual1: boolean = text.startsWith('displayId=0');
      hilog.info(DOMAIN, TAG, '%{public}s', `testFormatStartOptionsWithAnimation0013 assert1 text.startsWith=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = text.includes('withAnimation=true');
      hilog.info(DOMAIN, TAG, '%{public}s', `testFormatStartOptionsWithAnimation0013 assert2 text.includes=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = text.includes('left=50');
      hilog.info(DOMAIN, TAG, '%{public}s', `testFormatStartOptionsWithAnimation0013 assert3 text.includes=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = text.includes('top=100');
      hilog.info(DOMAIN, TAG, '%{public}s', `testFormatStartOptionsWithAnimation0013 assert4 text.includes=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = text.includes('width=300');
      hilog.info(DOMAIN, TAG, '%{public}s', `testFormatStartOptionsWithAnimation0013 assert5 text.includes=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = text.endsWith('height=400');
      hilog.info(DOMAIN, TAG, '%{public}s', `testFormatStartOptionsWithAnimation0013 assert6 text.endsWith=${actual6}`);
      expect(actual6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatStartOptionsWithAnimation0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0014
     * @tc.name      testFormatStartOptionsWithoutAnimation0014
     * @tc.desc      关闭动效时描述串里 withAnimation=false
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatStartOptionsWithoutAnimation0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatStartOptionsWithoutAnimation0014 begin');
      const text: string = formatStartOptions(buildStartOptions(false));
      const actual1: boolean = text.includes('withAnimation=false');
      hilog.info(DOMAIN, TAG, '%{public}s', `testFormatStartOptionsWithoutAnimation0014 assert1 text.includes=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = text.includes('height=400');
      hilog.info(DOMAIN, TAG, '%{public}s', `testFormatStartOptionsWithoutAnimation0014 assert2 text.includes=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = text.startsWith('displayId');
      hilog.info(DOMAIN, TAG, '%{public}s', `testFormatStartOptionsWithoutAnimation0014 assert3 text.startsWith=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatStartOptionsWithoutAnimation0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_LAUNCH_WANT_0015
     * @tc.name      testWantsAreIndependent0015
     * @tc.desc      每次构建都返回新对象，修改一个不影响另一个
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWantsAreIndependent0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantsAreIndependent0015 begin');
      const first: Want = buildImplicitViewWant(true);
      const second: Want = buildImplicitViewWant(true);
      const actual1: boolean = first === second;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantsAreIndependent0015 assert1 value=${actual1}`);
      expect(actual1).assertFalse();
      first.flags = 0;
      const actual2: boolean = hasStartWithoutTipsFlag(first);
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantsAreIndependent0015 assert2 hasStartWithoutTipsFlag=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: boolean = hasStartWithoutTipsFlag(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantsAreIndependent0015 assert3 hasStartWithoutTipsFlag=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantsAreIndependent0015 end');
    })
  })
}
