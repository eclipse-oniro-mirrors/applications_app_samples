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
import { Want, wantConstant } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  buildImplicitViewWant,
  buildNewAbilityWant,
  hasStartWithoutTipsFlag
} from '../../../main/ets/model/LaunchIntent';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityFeature]';

export default function wantFlagMatrixTest(): void {
  describe('AbilityFeatureWantFlagMatrixTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0001
     * @tc.name      testWantFlagMatrix0001
     * @tc.desc      flags 只置第 0 位（0x1）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0001 begin');
      const flags: number = 0x1;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0001 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x1 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0002
     * @tc.name      testWantFlagMatrix0002
     * @tc.desc      flags 只置第 1 位（0x2）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0002 begin');
      const flags: number = 0x2;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0002 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x2 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0003
     * @tc.name      testWantFlagMatrix0003
     * @tc.desc      flags 只置第 2 位（0x4）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0003 begin');
      const flags: number = 0x4;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0003 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x4 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0004
     * @tc.name      testWantFlagMatrix0004
     * @tc.desc      flags 只置第 3 位（0x8）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0004 begin');
      const flags: number = 0x8;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0004 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x8 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0005
     * @tc.name      testWantFlagMatrix0005
     * @tc.desc      flags 只置第 4 位（0x10）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0005 begin');
      const flags: number = 0x10;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0005 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x10 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0006
     * @tc.name      testWantFlagMatrix0006
     * @tc.desc      flags 只置第 5 位（0x20）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0006 begin');
      const flags: number = 0x20;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0006 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x20 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0007
     * @tc.name      testWantFlagMatrix0007
     * @tc.desc      flags 只置第 6 位（0x40）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0007 begin');
      const flags: number = 0x40;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0007 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x40 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0008
     * @tc.name      testWantFlagMatrix0008
     * @tc.desc      flags 只置第 7 位（0x80）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0008 begin');
      const flags: number = 0x80;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0008 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x80 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0009
     * @tc.name      testWantFlagMatrix0009
     * @tc.desc      flags 只置第 8 位（0x100）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0009 begin');
      const flags: number = 0x100;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0009 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x100 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0010
     * @tc.name      testWantFlagMatrix0010
     * @tc.desc      flags 只置第 9 位（0x200）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0010 begin');
      const flags: number = 0x200;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0010 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x200 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0011
     * @tc.name      testWantFlagMatrix0011
     * @tc.desc      flags 只置第 10 位（0x400）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0011 begin');
      const flags: number = 0x400;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0011 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x400 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0012
     * @tc.name      testWantFlagMatrix0012
     * @tc.desc      flags 只置第 11 位（0x800）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0012 begin');
      const flags: number = 0x800;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0012 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x800 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0013
     * @tc.name      testWantFlagMatrix0013
     * @tc.desc      flags 只置第 12 位（0x1000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0013 begin');
      const flags: number = 0x1000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0013 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x1000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0014
     * @tc.name      testWantFlagMatrix0014
     * @tc.desc      flags 只置第 13 位（0x2000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0014 begin');
      const flags: number = 0x2000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0014 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x2000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0015
     * @tc.name      testWantFlagMatrix0015
     * @tc.desc      flags 只置第 14 位（0x4000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0015 begin');
      const flags: number = 0x4000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0015 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x4000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0016
     * @tc.name      testWantFlagMatrix0016
     * @tc.desc      flags 只置第 15 位（0x8000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0016 begin');
      const flags: number = 0x8000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0016 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x8000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0017
     * @tc.name      testWantFlagMatrix0017
     * @tc.desc      flags 只置第 16 位（0x10000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0017 begin');
      const flags: number = 0x10000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0017 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x10000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0018
     * @tc.name      testWantFlagMatrix0018
     * @tc.desc      flags 只置第 17 位（0x20000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0018 begin');
      const flags: number = 0x20000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0018 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x20000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0019
     * @tc.name      testWantFlagMatrix0019
     * @tc.desc      flags 只置第 18 位（0x40000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0019 begin');
      const flags: number = 0x40000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0019 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x40000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0020
     * @tc.name      testWantFlagMatrix0020
     * @tc.desc      flags 只置第 19 位（0x80000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0020 begin');
      const flags: number = 0x80000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0020 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x80000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0021
     * @tc.name      testWantFlagMatrix0021
     * @tc.desc      flags 只置第 20 位（0x100000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0021 begin');
      const flags: number = 0x100000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0021 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x100000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0022
     * @tc.name      testWantFlagMatrix0022
     * @tc.desc      flags 只置第 21 位（0x200000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0022 begin');
      const flags: number = 0x200000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0022 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x200000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0023
     * @tc.name      testWantFlagMatrix0023
     * @tc.desc      flags 只置第 22 位（0x400000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0023 begin');
      const flags: number = 0x400000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0023 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x400000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0024
     * @tc.name      testWantFlagMatrix0024
     * @tc.desc      flags 只置第 23 位（0x800000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0024 begin');
      const flags: number = 0x800000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0024 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x800000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0025
     * @tc.name      testWantFlagMatrix0025
     * @tc.desc      flags 只置第 24 位（0x1000000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0025 begin');
      const flags: number = 0x1000000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0025 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x1000000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0026
     * @tc.name      testWantFlagMatrix0026
     * @tc.desc      flags 只置第 25 位（0x2000000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0026 begin');
      const flags: number = 0x2000000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0026 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x2000000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0027
     * @tc.name      testWantFlagMatrix0027
     * @tc.desc      flags 只置第 26 位（0x4000000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0027 begin');
      const flags: number = 0x4000000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0027 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x4000000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0028
     * @tc.name      testWantFlagMatrix0028
     * @tc.desc      flags 只置第 27 位（0x8000000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0028 begin');
      const flags: number = 0x8000000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0028 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x8000000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0029
     * @tc.name      testWantFlagMatrix0029
     * @tc.desc      flags 只置第 28 位（0x10000000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0029 begin');
      const flags: number = 0x10000000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0029 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x10000000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0030
     * @tc.name      testWantFlagMatrix0030
     * @tc.desc      flags 只置第 29 位（0x20000000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0030 begin');
      const flags: number = 0x20000000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0030 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x20000000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0031
     * @tc.name      testWantFlagMatrix0031
     * @tc.desc      flags 只置第 30 位（0x40000000）时判定为带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantFlagMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0031 begin');
      const flags: number = 0x40000000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0031 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x0 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0032
     * @tc.name      testWantFlagMatrix0032
     * @tc.desc      flags 只置第 31 位（0x80000000）时判定为不带静默标记，叠加 FLAG_START_WITHOUT_TIPS 后必带，清掉第 30 位后必不带
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0032 begin');
      const flags: number = 0x80000000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0032 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const withTips: Want = { flags: flags | 0x40000000 };
      const cleared: Want = { flags: 0x80000000 };
      expect(hasStartWithoutTipsFlag(withTips)).assertTrue();
      expect(hasStartWithoutTipsFlag(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0033
     * @tc.name      testWantFlagMatrix0033
     * @tc.desc      单独使用 wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION 时判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantFlagMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0033 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0033 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      expect(wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION).assertEqual(0x1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0034
     * @tc.name      testWantFlagMatrix0034
     * @tc.desc      单独使用 wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION 时判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantFlagMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0034 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0034 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      expect(wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION).assertEqual(0x2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0035
     * @tc.name      testWantFlagMatrix0035
     * @tc.desc      单独使用 wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION 时判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantFlagMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0035 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0035 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      expect(wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION).assertEqual(0x40);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0036
     * @tc.name      testWantFlagMatrix0036
     * @tc.desc      单独使用 wantConstant.Flags.FLAG_INSTALL_ON_DEMAND 时判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantFlagMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0036 begin');
      const flags: number = wantConstant.Flags.FLAG_INSTALL_ON_DEMAND;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0036 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      expect(wantConstant.Flags.FLAG_INSTALL_ON_DEMAND).assertEqual(0x800);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0037
     * @tc.name      testWantFlagMatrix0037
     * @tc.desc      单独使用 wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE 时判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantFlagMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0037 begin');
      const flags: number = wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0037 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      expect(wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE).assertEqual(0x2000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0038
     * @tc.name      testWantFlagMatrix0038
     * @tc.desc      单独使用 wantConstant.Flags.FLAG_START_WITHOUT_TIPS 时判定为带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantFlagMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0038 begin');
      const flags: number = wantConstant.Flags.FLAG_START_WITHOUT_TIPS;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0038 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      expect(wantConstant.Flags.FLAG_START_WITHOUT_TIPS).assertEqual(0x40000000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0039
     * @tc.name      testWantFlagMatrix0039
     * @tc.desc      FLAG_AUTH_READ_URI_PERMISSION 与 FLAG_AUTH_WRITE_URI_PERMISSION 组合时判定为不带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0039 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0039 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0040
     * @tc.name      testWantFlagMatrix0040
     * @tc.desc      FLAG_AUTH_READ_URI_PERMISSION 与 FLAG_AUTH_PERSISTABLE_URI_PERMISSION 组合时判定为不带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0040 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0040 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0041
     * @tc.name      testWantFlagMatrix0041
     * @tc.desc      FLAG_AUTH_READ_URI_PERMISSION 与 FLAG_INSTALL_ON_DEMAND 组合时判定为不带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0041 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_INSTALL_ON_DEMAND;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0041 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_INSTALL_ON_DEMAND };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0042
     * @tc.name      testWantFlagMatrix0042
     * @tc.desc      FLAG_AUTH_READ_URI_PERMISSION 与 FLAG_ABILITY_ON_COLLABORATE 组合时判定为不带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0042 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0042 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0043
     * @tc.name      testWantFlagMatrix0043
     * @tc.desc      FLAG_AUTH_READ_URI_PERMISSION 与 FLAG_START_WITHOUT_TIPS 组合时判定为带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0043 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_START_WITHOUT_TIPS;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0043 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0044
     * @tc.name      testWantFlagMatrix0044
     * @tc.desc      FLAG_AUTH_WRITE_URI_PERMISSION 与 FLAG_AUTH_PERSISTABLE_URI_PERMISSION 组合时判定为不带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0044 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0044 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0044 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0045
     * @tc.name      testWantFlagMatrix0045
     * @tc.desc      FLAG_AUTH_WRITE_URI_PERMISSION 与 FLAG_INSTALL_ON_DEMAND 组合时判定为不带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0045 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION | wantConstant.Flags.FLAG_INSTALL_ON_DEMAND;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0045 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_INSTALL_ON_DEMAND };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0045 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0046
     * @tc.name      testWantFlagMatrix0046
     * @tc.desc      FLAG_AUTH_WRITE_URI_PERMISSION 与 FLAG_ABILITY_ON_COLLABORATE 组合时判定为不带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0046 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION | wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0046 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0046 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0047
     * @tc.name      testWantFlagMatrix0047
     * @tc.desc      FLAG_AUTH_WRITE_URI_PERMISSION 与 FLAG_START_WITHOUT_TIPS 组合时判定为带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0047 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION | wantConstant.Flags.FLAG_START_WITHOUT_TIPS;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0047 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0047 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0048
     * @tc.name      testWantFlagMatrix0048
     * @tc.desc      FLAG_AUTH_PERSISTABLE_URI_PERMISSION 与 FLAG_INSTALL_ON_DEMAND 组合时判定为不带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0048 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION | wantConstant.Flags.FLAG_INSTALL_ON_DEMAND;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0048 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_INSTALL_ON_DEMAND };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0048 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0049
     * @tc.name      testWantFlagMatrix0049
     * @tc.desc      FLAG_AUTH_PERSISTABLE_URI_PERMISSION 与 FLAG_ABILITY_ON_COLLABORATE 组合时判定为不带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0049 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION | wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0049 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0049 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0050
     * @tc.name      testWantFlagMatrix0050
     * @tc.desc      FLAG_AUTH_PERSISTABLE_URI_PERMISSION 与 FLAG_START_WITHOUT_TIPS 组合时判定为带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0050 begin');
      const flags: number = wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION | wantConstant.Flags.FLAG_START_WITHOUT_TIPS;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0050 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0050 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0051
     * @tc.name      testWantFlagMatrix0051
     * @tc.desc      FLAG_INSTALL_ON_DEMAND 与 FLAG_ABILITY_ON_COLLABORATE 组合时判定为不带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0051 begin');
      const flags: number = wantConstant.Flags.FLAG_INSTALL_ON_DEMAND | wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0051 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_INSTALL_ON_DEMAND };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0051 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0052
     * @tc.name      testWantFlagMatrix0052
     * @tc.desc      FLAG_INSTALL_ON_DEMAND 与 FLAG_START_WITHOUT_TIPS 组合时判定为带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0052 begin');
      const flags: number = wantConstant.Flags.FLAG_INSTALL_ON_DEMAND | wantConstant.Flags.FLAG_START_WITHOUT_TIPS;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0052 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_INSTALL_ON_DEMAND };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0052 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0053
     * @tc.name      testWantFlagMatrix0053
     * @tc.desc      FLAG_ABILITY_ON_COLLABORATE 与 FLAG_START_WITHOUT_TIPS 组合时判定为带静默标记，且与各自单独判定的或结果一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0053 begin');
      const flags: number = wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE | wantConstant.Flags.FLAG_START_WITHOUT_TIPS;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0053 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      const onlyA: Want = { flags: wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE };
      const onlyB: Want = { flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS };
      expect(hasStartWithoutTipsFlag(onlyA) || hasStartWithoutTipsFlag(onlyB)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0053 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0054
     * @tc.name      testWantFlagMatrix0054
     * @tc.desc      flags 为零值（0）时按 32 位整数取位，判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0054 begin');
      const flags: number = 0;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0054 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0054 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0055
     * @tc.name      testWantFlagMatrix0055
     * @tc.desc      flags 为全 1 的 -1（-1）时按 32 位整数取位，判定为带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0055 begin');
      const flags: number = -1;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0055 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0055 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0056
     * @tc.name      testWantFlagMatrix0056
     * @tc.desc      flags 为有符号最大值（0x7FFFFFFF）时按 32 位整数取位，判定为带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0056 begin');
      const flags: number = 0x7FFFFFFF;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0056 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0056 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0057
     * @tc.name      testWantFlagMatrix0057
     * @tc.desc      flags 为第 30 位以下全 1（0x3FFFFFFF）时按 32 位整数取位，判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0057 begin');
      const flags: number = 0x3FFFFFFF;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0057 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0057 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0058
     * @tc.name      testWantFlagMatrix0058
     * @tc.desc      flags 为只缺第 30 位的 32 位全 1（0xBFFFFFFF）时按 32 位整数取位，判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0058 begin');
      const flags: number = 0xBFFFFFFF;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0058 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0058 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0059
     * @tc.name      testWantFlagMatrix0059
     * @tc.desc      flags 为32 位全 1（0xFFFFFFFF）时按 32 位整数取位，判定为带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0059 begin');
      const flags: number = 0xFFFFFFFF;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0059 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0059 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0060
     * @tc.name      testWantFlagMatrix0060
     * @tc.desc      flags 为静默位加最低位（0x40000001）时按 32 位整数取位，判定为带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0060 begin');
      const flags: number = 0x40000001;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0060 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0060 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0061
     * @tc.name      testWantFlagMatrix0061
     * @tc.desc      flags 为最高两位（0xC0000000）时按 32 位整数取位，判定为带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0061 begin');
      const flags: number = 0xC0000000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0061 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0061 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0062
     * @tc.name      testWantFlagMatrix0062
     * @tc.desc      flags 为超出 32 位后低位为静默位（0x140000000）时按 32 位整数取位，判定为带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0062 begin');
      const flags: number = 0x140000000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0062 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0062 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0063
     * @tc.name      testWantFlagMatrix0063
     * @tc.desc      flags 为超出 32 位后低位全 0（0x100000000）时按 32 位整数取位，判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0063 begin');
      const flags: number = 0x100000000;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0063 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0063 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0064
     * @tc.name      testWantFlagMatrix0064
     * @tc.desc      flags 为小数 1.5（1.5）时按 32 位整数取位，判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0064 begin');
      const flags: number = 1.5;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0064 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0064 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0065
     * @tc.name      testWantFlagMatrix0065
     * @tc.desc      flags 为静默位加小数（1073741824.75）时按 32 位整数取位，判定为带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0065 begin');
      const flags: number = 1073741824.75;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0065 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0065 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0066
     * @tc.name      testWantFlagMatrix0066
     * @tc.desc      flags 为负数 -2^30（-1073741824）时按 32 位整数取位，判定为带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0066 begin');
      const flags: number = -1073741824;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0066 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertTrue();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertTrue();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0066 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0067
     * @tc.name      testWantFlagMatrix0067
     * @tc.desc      flags 为NaN（Number.NaN）时按 32 位整数取位，判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0067 begin');
      const flags: number = Number.NaN;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0067 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0067 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0068
     * @tc.name      testWantFlagMatrix0068
     * @tc.desc      flags 为正无穷（Number.POSITIVE_INFINITY）时按 32 位整数取位，判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testWantFlagMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0068 begin');
      const flags: number = Number.POSITIVE_INFINITY;
      const plain: Want = { flags: flags };
      const implicitWant: Want = buildImplicitViewWant(false);
      implicitWant.flags = flags;
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      explicitWant.flags = flags;
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0068 params: flags=${flags}, plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0068 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_WANT_FLAG_0069
     * @tc.name      testWantFlagMatrix0069
     * @tc.desc      三种 Want 都不带 flags 字段时判定为不带静默标记
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWantFlagMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0069 begin');
      const plain: Want = {};
      const implicitWant: Want = buildImplicitViewWant(false);
      const explicitWant: Want = buildNewAbilityWant('com.samples.abilityFeature');
      hilog.info(DOMAIN, TAG, '%{public}s', `testWantFlagMatrix0069 params: plain=${JSON.stringify(plain)}, implicitWant=${JSON.stringify(implicitWant)}, explicitWant=${JSON.stringify(explicitWant)}`);
      expect(implicitWant.flags === undefined).assertTrue();
      expect(hasStartWithoutTipsFlag(plain)).assertFalse();
      expect(hasStartWithoutTipsFlag(implicitWant)).assertFalse();
      expect(hasStartWithoutTipsFlag(explicitWant)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWantFlagMatrix0069 end');
    })
  })
}
