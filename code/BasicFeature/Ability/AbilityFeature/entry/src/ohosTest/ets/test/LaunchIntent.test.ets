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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
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
      const want: Want = buildImplicitViewWant(false);
      expect(want.action).assertEqual(VIEW_DATA_ACTION);
      expect(want.type).assertEqual(TEXT_PLAIN_TYPE);
      expect(want.parameters !== undefined).assertTrue();
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
      const serialized: string = JSON.stringify(buildImplicitViewWant(false).parameters);
      expect(serialized.includes('"uri"')).assertTrue();
      expect(serialized.includes(ZERO_MATCH_URI)).assertTrue();
      expect(serialized.startsWith('{')).assertTrue();
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
      const want: Want = buildImplicitViewWant(false);
      expect(want.flags === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(want)).assertFalse();
      expect(want.bundleName === undefined).assertTrue();
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
      const want: Want = buildImplicitViewWant(true);
      expect(want.flags !== undefined).assertTrue();
      expect(want.flags).assertEqual(START_WITHOUT_TIPS);
      expect(hasStartWithoutTipsFlag(want)).assertTrue();
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
      expect(START_WITHOUT_TIPS).assertEqual(0x40000000);
      expect(START_WITHOUT_TIPS > 0).assertTrue();
      expect(START_WITHOUT_TIPS & (START_WITHOUT_TIPS - 1)).assertEqual(0);
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
      const empty: Want = { flags: 0 };
      const tipped: Want = { flags: START_WITHOUT_TIPS };
      const other: Want = { flags: 0x2 };
      expect(hasStartWithoutTipsFlag(empty)).assertFalse();
      expect(hasStartWithoutTipsFlag(tipped)).assertTrue();
      expect(hasStartWithoutTipsFlag(other)).assertFalse();
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
      const combined: Want = { flags: (START_WITHOUT_TIPS | 0x2) };
      const flags: number = combined.flags === undefined ? 0 : combined.flags;
      expect(hasStartWithoutTipsFlag(combined)).assertTrue();
      expect(flags & 0x2).assertEqual(2);
      expect(flags & START_WITHOUT_TIPS).assertEqual(START_WITHOUT_TIPS);
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
      const empty: Want = {};
      expect(hasStartWithoutTipsFlag(empty)).assertFalse();
      expect(empty.flags === undefined).assertTrue();
      expect(empty.action === undefined).assertTrue();
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
      const want: Want = buildNewAbilityWant('com.samples.abilityFeature');
      expect(want.bundleName).assertEqual('com.samples.abilityFeature');
      expect(want.abilityName).assertEqual(NEW_ABILITY_NAME);
      expect(want.action === undefined).assertTrue();
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
      expect(buildNewAbilityWant('').bundleName).assertEqual('');
      expect(buildNewAbilityWant('').abilityName).assertEqual('NewAbility');
      expect(buildNewAbilityWant('abc').bundleName).assertEqual('abc');
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
      const options: StartOptions = buildStartOptions(false);
      expect(options.withAnimation).assertFalse();
      expect(options.displayId).assertEqual(START_OPTIONS_DISPLAY_ID);
      expect(options.windowLeft).assertEqual(START_OPTIONS_WINDOW_LEFT);
      expect(options.windowTop).assertEqual(START_OPTIONS_WINDOW_TOP);
      expect(options.windowWidth).assertEqual(START_OPTIONS_WINDOW_WIDTH);
      expect(options.windowHeight).assertEqual(START_OPTIONS_WINDOW_HEIGHT);
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
      const off: StartOptions = buildStartOptions(false);
      const on: StartOptions = buildStartOptions(true);
      expect(on.withAnimation).assertTrue();
      expect(off.withAnimation).assertFalse();
      expect(on.windowWidth).assertEqual(off.windowWidth);
      expect(on.displayId).assertEqual(off.displayId);
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
      const text: string = formatStartOptions(buildStartOptions(true));
      expect(text.startsWith('displayId=0')).assertTrue();
      expect(text.includes('withAnimation=true')).assertTrue();
      expect(text.includes('left=50')).assertTrue();
      expect(text.includes('top=100')).assertTrue();
      expect(text.includes('width=300')).assertTrue();
      expect(text.endsWith('height=400')).assertTrue();
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
      const text: string = formatStartOptions(buildStartOptions(false));
      expect(text.includes('withAnimation=false')).assertTrue();
      expect(text.includes('height=400')).assertTrue();
      expect(text.startsWith('displayId')).assertTrue();
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
      const first: Want = buildImplicitViewWant(true);
      const second: Want = buildImplicitViewWant(true);
      expect(first === second).assertFalse();
      first.flags = 0;
      expect(hasStartWithoutTipsFlag(first)).assertFalse();
      expect(hasStartWithoutTipsFlag(second)).assertTrue();
    })
  })
}
