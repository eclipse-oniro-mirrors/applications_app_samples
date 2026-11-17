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
import { CallNumberFormatter } from '../../../main/ets/model/CallNumberFormatter';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallNumberFormatMatrixA1';
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

export default function callNumberFormatMatrixA1Test(): void {
  describe('CallNumberFormatMatrixA1', () => {
    /**
     * @tc.number    SUB_CALL_NUMFMTA_0001
     * @tc.name      testFormatNational0001
     * @tc.desc      formatNational(13810000000) -> 138 1000 0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0001 begin');
      const actual: string = CallNumberFormatter.formatNational('13810000000');
      expect(actual).assertEqual('138 1000 0000');
      log('testFormatNational0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0002
     * @tc.name      testFormatNational0002
     * @tc.desc      formatNational(13810000137) -> 138 1000 0137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0002 begin');
      const actual: string = CallNumberFormatter.formatNational('13810000137');
      expect(actual).assertEqual('138 1000 0137');
      log('testFormatNational0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0003
     * @tc.name      testFormatNational0003
     * @tc.desc      formatNational(13810000274) -> 138 1000 0274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0003 begin');
      const actual: string = CallNumberFormatter.formatNational('13810000274');
      expect(actual).assertEqual('138 1000 0274');
      log('testFormatNational0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0004
     * @tc.name      testFormatNational0004
     * @tc.desc      formatNational(13810000411) -> 138 1000 0411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0004 begin');
      const actual: string = CallNumberFormatter.formatNational('13810000411');
      expect(actual).assertEqual('138 1000 0411');
      log('testFormatNational0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0005
     * @tc.name      testFormatNational0005
     * @tc.desc      formatNational(13810000548) -> 138 1000 0548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0005 begin');
      const actual: string = CallNumberFormatter.formatNational('13810000548');
      expect(actual).assertEqual('138 1000 0548');
      log('testFormatNational0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0006
     * @tc.name      testFormatNational0006
     * @tc.desc      formatNational(13810000685) -> 138 1000 0685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0006 begin');
      const actual: string = CallNumberFormatter.formatNational('13810000685');
      expect(actual).assertEqual('138 1000 0685');
      log('testFormatNational0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0007
     * @tc.name      testFormatNational0007
     * @tc.desc      formatNational(13810000822) -> 138 1000 0822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0007 begin');
      const actual: string = CallNumberFormatter.formatNational('13810000822');
      expect(actual).assertEqual('138 1000 0822');
      log('testFormatNational0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0008
     * @tc.name      testFormatNational0008
     * @tc.desc      formatNational(13810000959) -> 138 1000 0959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0008 begin');
      const actual: string = CallNumberFormatter.formatNational('13810000959');
      expect(actual).assertEqual('138 1000 0959');
      log('testFormatNational0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0009
     * @tc.name      testFormatNational0009
     * @tc.desc      formatNational(13810001096) -> 138 1000 1096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0009 begin');
      const actual: string = CallNumberFormatter.formatNational('13810001096');
      expect(actual).assertEqual('138 1000 1096');
      log('testFormatNational0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0010
     * @tc.name      testFormatNational0010
     * @tc.desc      formatNational(13810001233) -> 138 1000 1233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0010 begin');
      const actual: string = CallNumberFormatter.formatNational('13810001233');
      expect(actual).assertEqual('138 1000 1233');
      log('testFormatNational0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0011
     * @tc.name      testFormatNational0011
     * @tc.desc      formatNational(13810001370) -> 138 1000 1370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0011 begin');
      const actual: string = CallNumberFormatter.formatNational('13810001370');
      expect(actual).assertEqual('138 1000 1370');
      log('testFormatNational0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0012
     * @tc.name      testFormatNational0012
     * @tc.desc      formatNational(13810001507) -> 138 1000 1507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0012 begin');
      const actual: string = CallNumberFormatter.formatNational('13810001507');
      expect(actual).assertEqual('138 1000 1507');
      log('testFormatNational0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0013
     * @tc.name      testFormatNational0013
     * @tc.desc      formatNational(13810001644) -> 138 1000 1644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0013 begin');
      const actual: string = CallNumberFormatter.formatNational('13810001644');
      expect(actual).assertEqual('138 1000 1644');
      log('testFormatNational0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0014
     * @tc.name      testFormatNational0014
     * @tc.desc      formatNational(13810001781) -> 138 1000 1781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0014 begin');
      const actual: string = CallNumberFormatter.formatNational('13810001781');
      expect(actual).assertEqual('138 1000 1781');
      log('testFormatNational0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0015
     * @tc.name      testFormatNational0015
     * @tc.desc      formatNational(13810001918) -> 138 1000 1918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0015 begin');
      const actual: string = CallNumberFormatter.formatNational('13810001918');
      expect(actual).assertEqual('138 1000 1918');
      log('testFormatNational0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0016
     * @tc.name      testFormatNational0016
     * @tc.desc      formatNational(13810002055) -> 138 1000 2055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0016 begin');
      const actual: string = CallNumberFormatter.formatNational('13810002055');
      expect(actual).assertEqual('138 1000 2055');
      log('testFormatNational0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0017
     * @tc.name      testFormatNational0017
     * @tc.desc      formatNational(13810002192) -> 138 1000 2192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0017 begin');
      const actual: string = CallNumberFormatter.formatNational('13810002192');
      expect(actual).assertEqual('138 1000 2192');
      log('testFormatNational0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0018
     * @tc.name      testFormatNational0018
     * @tc.desc      formatNational(13810002329) -> 138 1000 2329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0018 begin');
      const actual: string = CallNumberFormatter.formatNational('13810002329');
      expect(actual).assertEqual('138 1000 2329');
      log('testFormatNational0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0019
     * @tc.name      testFormatNational0019
     * @tc.desc      formatNational(13810002466) -> 138 1000 2466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0019 begin');
      const actual: string = CallNumberFormatter.formatNational('13810002466');
      expect(actual).assertEqual('138 1000 2466');
      log('testFormatNational0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0020
     * @tc.name      testFormatNational0020
     * @tc.desc      formatNational(13810002603) -> 138 1000 2603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0020 begin');
      const actual: string = CallNumberFormatter.formatNational('13810002603');
      expect(actual).assertEqual('138 1000 2603');
      log('testFormatNational0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0021
     * @tc.name      testFormatNational0021
     * @tc.desc      formatNational(13810002740) -> 138 1000 2740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0021 begin');
      const actual: string = CallNumberFormatter.formatNational('13810002740');
      expect(actual).assertEqual('138 1000 2740');
      log('testFormatNational0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0022
     * @tc.name      testFormatNational0022
     * @tc.desc      formatNational(13810002877) -> 138 1000 2877
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0022 begin');
      const actual: string = CallNumberFormatter.formatNational('13810002877');
      expect(actual).assertEqual('138 1000 2877');
      log('testFormatNational0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0023
     * @tc.name      testFormatNational0023
     * @tc.desc      formatNational(13810003014) -> 138 1000 3014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0023 begin');
      const actual: string = CallNumberFormatter.formatNational('13810003014');
      expect(actual).assertEqual('138 1000 3014');
      log('testFormatNational0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0024
     * @tc.name      testFormatNational0024
     * @tc.desc      formatNational(13810003151) -> 138 1000 3151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0024 begin');
      const actual: string = CallNumberFormatter.formatNational('13810003151');
      expect(actual).assertEqual('138 1000 3151');
      log('testFormatNational0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0025
     * @tc.name      testFormatNational0025
     * @tc.desc      formatNational(13810003288) -> 138 1000 3288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0025 begin');
      const actual: string = CallNumberFormatter.formatNational('13810003288');
      expect(actual).assertEqual('138 1000 3288');
      log('testFormatNational0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0026
     * @tc.name      testFormatNational0026
     * @tc.desc      formatNational(13810003425) -> 138 1000 3425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0026 begin');
      const actual: string = CallNumberFormatter.formatNational('13810003425');
      expect(actual).assertEqual('138 1000 3425');
      log('testFormatNational0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0027
     * @tc.name      testFormatNational0027
     * @tc.desc      formatNational(13810003562) -> 138 1000 3562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0027 begin');
      const actual: string = CallNumberFormatter.formatNational('13810003562');
      expect(actual).assertEqual('138 1000 3562');
      log('testFormatNational0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0028
     * @tc.name      testFormatNational0028
     * @tc.desc      formatNational(13810003699) -> 138 1000 3699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0028 begin');
      const actual: string = CallNumberFormatter.formatNational('13810003699');
      expect(actual).assertEqual('138 1000 3699');
      log('testFormatNational0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0029
     * @tc.name      testFormatNational0029
     * @tc.desc      formatNational(13810003836) -> 138 1000 3836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0029 begin');
      const actual: string = CallNumberFormatter.formatNational('13810003836');
      expect(actual).assertEqual('138 1000 3836');
      log('testFormatNational0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0030
     * @tc.name      testFormatNational0030
     * @tc.desc      formatNational(13810003973) -> 138 1000 3973
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0030 begin');
      const actual: string = CallNumberFormatter.formatNational('13810003973');
      expect(actual).assertEqual('138 1000 3973');
      log('testFormatNational0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0031
     * @tc.name      testFormatNational0031
     * @tc.desc      formatNational(13810004110) -> 138 1000 4110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0031 begin');
      const actual: string = CallNumberFormatter.formatNational('13810004110');
      expect(actual).assertEqual('138 1000 4110');
      log('testFormatNational0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0032
     * @tc.name      testFormatNational0032
     * @tc.desc      formatNational(13810004247) -> 138 1000 4247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0032 begin');
      const actual: string = CallNumberFormatter.formatNational('13810004247');
      expect(actual).assertEqual('138 1000 4247');
      log('testFormatNational0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0033
     * @tc.name      testFormatNational0033
     * @tc.desc      formatNational(13810004384) -> 138 1000 4384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0033 begin');
      const actual: string = CallNumberFormatter.formatNational('13810004384');
      expect(actual).assertEqual('138 1000 4384');
      log('testFormatNational0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0034
     * @tc.name      testFormatNational0034
     * @tc.desc      formatNational(13810004521) -> 138 1000 4521
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0034 begin');
      const actual: string = CallNumberFormatter.formatNational('13810004521');
      expect(actual).assertEqual('138 1000 4521');
      log('testFormatNational0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0035
     * @tc.name      testFormatNational0035
     * @tc.desc      formatNational(15920000000) -> 159 2000 0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0035 begin');
      const actual: string = CallNumberFormatter.formatNational('15920000000');
      expect(actual).assertEqual('159 2000 0000');
      log('testFormatNational0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0036
     * @tc.name      testFormatNational0036
     * @tc.desc      formatNational(15920000731) -> 159 2000 0731
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0036 begin');
      const actual: string = CallNumberFormatter.formatNational('15920000731');
      expect(actual).assertEqual('159 2000 0731');
      log('testFormatNational0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0037
     * @tc.name      testFormatNational0037
     * @tc.desc      formatNational(15920001462) -> 159 2000 1462
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0037 begin');
      const actual: string = CallNumberFormatter.formatNational('15920001462');
      expect(actual).assertEqual('159 2000 1462');
      log('testFormatNational0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0038
     * @tc.name      testFormatNational0038
     * @tc.desc      formatNational(15920002193) -> 159 2000 2193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0038 begin');
      const actual: string = CallNumberFormatter.formatNational('15920002193');
      expect(actual).assertEqual('159 2000 2193');
      log('testFormatNational0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0039
     * @tc.name      testFormatNational0039
     * @tc.desc      formatNational(15920002924) -> 159 2000 2924
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0039 begin');
      const actual: string = CallNumberFormatter.formatNational('15920002924');
      expect(actual).assertEqual('159 2000 2924');
      log('testFormatNational0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0040
     * @tc.name      testFormatNational0040
     * @tc.desc      formatNational(15920003655) -> 159 2000 3655
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0040 begin');
      const actual: string = CallNumberFormatter.formatNational('15920003655');
      expect(actual).assertEqual('159 2000 3655');
      log('testFormatNational0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0041
     * @tc.name      testFormatNational0041
     * @tc.desc      formatNational(15920004386) -> 159 2000 4386
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0041 begin');
      const actual: string = CallNumberFormatter.formatNational('15920004386');
      expect(actual).assertEqual('159 2000 4386');
      log('testFormatNational0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0042
     * @tc.name      testFormatNational0042
     * @tc.desc      formatNational(15920005117) -> 159 2000 5117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0042 begin');
      const actual: string = CallNumberFormatter.formatNational('15920005117');
      expect(actual).assertEqual('159 2000 5117');
      log('testFormatNational0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0043
     * @tc.name      testFormatNational0043
     * @tc.desc      formatNational(15920005848) -> 159 2000 5848
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0043 begin');
      const actual: string = CallNumberFormatter.formatNational('15920005848');
      expect(actual).assertEqual('159 2000 5848');
      log('testFormatNational0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0044
     * @tc.name      testFormatNational0044
     * @tc.desc      formatNational(15920006579) -> 159 2000 6579
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0044 begin');
      const actual: string = CallNumberFormatter.formatNational('15920006579');
      expect(actual).assertEqual('159 2000 6579');
      log('testFormatNational0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0045
     * @tc.name      testFormatNational0045
     * @tc.desc      formatNational(15920007310) -> 159 2000 7310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0045 begin');
      const actual: string = CallNumberFormatter.formatNational('15920007310');
      expect(actual).assertEqual('159 2000 7310');
      log('testFormatNational0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0046
     * @tc.name      testFormatNational0046
     * @tc.desc      formatNational(15920008041) -> 159 2000 8041
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0046 begin');
      const actual: string = CallNumberFormatter.formatNational('15920008041');
      expect(actual).assertEqual('159 2000 8041');
      log('testFormatNational0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0047
     * @tc.name      testFormatNational0047
     * @tc.desc      formatNational(15920008772) -> 159 2000 8772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0047 begin');
      const actual: string = CallNumberFormatter.formatNational('15920008772');
      expect(actual).assertEqual('159 2000 8772');
      log('testFormatNational0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0048
     * @tc.name      testFormatNational0048
     * @tc.desc      formatNational(15920009503) -> 159 2000 9503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0048 begin');
      const actual: string = CallNumberFormatter.formatNational('15920009503');
      expect(actual).assertEqual('159 2000 9503');
      log('testFormatNational0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0049
     * @tc.name      testFormatNational0049
     * @tc.desc      formatNational(15920010234) -> 159 2001 0234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0049 begin');
      const actual: string = CallNumberFormatter.formatNational('15920010234');
      expect(actual).assertEqual('159 2001 0234');
      log('testFormatNational0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0050
     * @tc.name      testFormatNational0050
     * @tc.desc      formatNational(15920010965) -> 159 2001 0965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0050 begin');
      const actual: string = CallNumberFormatter.formatNational('15920010965');
      expect(actual).assertEqual('159 2001 0965');
      log('testFormatNational0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0051
     * @tc.name      testFormatNational0051
     * @tc.desc      formatNational(1000000000) -> 100 000 0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0051 begin');
      const actual: string = CallNumberFormatter.formatNational('1000000000');
      expect(actual).assertEqual('100 000 0000');
      log('testFormatNational0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0052
     * @tc.name      testFormatNational0052
     * @tc.desc      formatNational(1001234567) -> 100 123 4567
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0052 begin');
      const actual: string = CallNumberFormatter.formatNational('1001234567');
      expect(actual).assertEqual('100 123 4567');
      log('testFormatNational0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0053
     * @tc.name      testFormatNational0053
     * @tc.desc      formatNational(1002469134) -> 100 246 9134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0053 begin');
      const actual: string = CallNumberFormatter.formatNational('1002469134');
      expect(actual).assertEqual('100 246 9134');
      log('testFormatNational0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0054
     * @tc.name      testFormatNational0054
     * @tc.desc      formatNational(1003703701) -> 100 370 3701
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0054 begin');
      const actual: string = CallNumberFormatter.formatNational('1003703701');
      expect(actual).assertEqual('100 370 3701');
      log('testFormatNational0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0055
     * @tc.name      testFormatNational0055
     * @tc.desc      formatNational(1004938268) -> 100 493 8268
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0055 begin');
      const actual: string = CallNumberFormatter.formatNational('1004938268');
      expect(actual).assertEqual('100 493 8268');
      log('testFormatNational0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0056
     * @tc.name      testFormatNational0056
     * @tc.desc      formatNational(1006172835) -> 100 617 2835
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0056 begin');
      const actual: string = CallNumberFormatter.formatNational('1006172835');
      expect(actual).assertEqual('100 617 2835');
      log('testFormatNational0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0057
     * @tc.name      testFormatNational0057
     * @tc.desc      formatNational(1007407402) -> 100 740 7402
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0057 begin');
      const actual: string = CallNumberFormatter.formatNational('1007407402');
      expect(actual).assertEqual('100 740 7402');
      log('testFormatNational0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0058
     * @tc.name      testFormatNational0058
     * @tc.desc      formatNational(1008641969) -> 100 864 1969
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0058 begin');
      const actual: string = CallNumberFormatter.formatNational('1008641969');
      expect(actual).assertEqual('100 864 1969');
      log('testFormatNational0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0059
     * @tc.name      testFormatNational0059
     * @tc.desc      formatNational(1009876536) -> 100 987 6536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0059 begin');
      const actual: string = CallNumberFormatter.formatNational('1009876536');
      expect(actual).assertEqual('100 987 6536');
      log('testFormatNational0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0060
     * @tc.name      testFormatNational0060
     * @tc.desc      formatNational(1011111103) -> 101 111 1103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0060 begin');
      const actual: string = CallNumberFormatter.formatNational('1011111103');
      expect(actual).assertEqual('101 111 1103');
      log('testFormatNational0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0061
     * @tc.name      testFormatNational0061
     * @tc.desc      formatNational(1012345670) -> 101 234 5670
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0061 begin');
      const actual: string = CallNumberFormatter.formatNational('1012345670');
      expect(actual).assertEqual('101 234 5670');
      log('testFormatNational0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0062
     * @tc.name      testFormatNational0062
     * @tc.desc      formatNational(1013580237) -> 101 358 0237
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0062 begin');
      const actual: string = CallNumberFormatter.formatNational('1013580237');
      expect(actual).assertEqual('101 358 0237');
      log('testFormatNational0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0063
     * @tc.name      testFormatNational0063
     * @tc.desc      formatNational(1014814804) -> 101 481 4804
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0063 begin');
      const actual: string = CallNumberFormatter.formatNational('1014814804');
      expect(actual).assertEqual('101 481 4804');
      log('testFormatNational0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0064
     * @tc.name      testFormatNational0064
     * @tc.desc      formatNational(1016049371) -> 101 604 9371
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0064 begin');
      const actual: string = CallNumberFormatter.formatNational('1016049371');
      expect(actual).assertEqual('101 604 9371');
      log('testFormatNational0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0065
     * @tc.name      testFormatNational0065
     * @tc.desc      formatNational(1017283938) -> 101 728 3938
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0065 begin');
      const actual: string = CallNumberFormatter.formatNational('1017283938');
      expect(actual).assertEqual('101 728 3938');
      log('testFormatNational0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0066
     * @tc.name      testFormatNational0066
     * @tc.desc      formatNational(1018518505) -> 101 851 8505
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0066 begin');
      const actual: string = CallNumberFormatter.formatNational('1018518505');
      expect(actual).assertEqual('101 851 8505');
      log('testFormatNational0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0067
     * @tc.name      testFormatNational0067
     * @tc.desc      formatNational(1019753072) -> 101 975 3072
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0067 begin');
      const actual: string = CallNumberFormatter.formatNational('1019753072');
      expect(actual).assertEqual('101 975 3072');
      log('testFormatNational0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0068
     * @tc.name      testFormatNational0068
     * @tc.desc      formatNational(1020987639) -> 102 098 7639
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0068 begin');
      const actual: string = CallNumberFormatter.formatNational('1020987639');
      expect(actual).assertEqual('102 098 7639');
      log('testFormatNational0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0069
     * @tc.name      testFormatNational0069
     * @tc.desc      formatNational(1022222206) -> 102 222 2206
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0069 begin');
      const actual: string = CallNumberFormatter.formatNational('1022222206');
      expect(actual).assertEqual('102 222 2206');
      log('testFormatNational0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0070
     * @tc.name      testFormatNational0070
     * @tc.desc      formatNational(1023456773) -> 102 345 6773
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0070 begin');
      const actual: string = CallNumberFormatter.formatNational('1023456773');
      expect(actual).assertEqual('102 345 6773');
      log('testFormatNational0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0071
     * @tc.name      testFormatNational0071
     * @tc.desc      formatNational(1024691340) -> 102 469 1340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0071 begin');
      const actual: string = CallNumberFormatter.formatNational('1024691340');
      expect(actual).assertEqual('102 469 1340');
      log('testFormatNational0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0072
     * @tc.name      testFormatNational0072
     * @tc.desc      formatNational(1025925907) -> 102 592 5907
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0072 begin');
      const actual: string = CallNumberFormatter.formatNational('1025925907');
      expect(actual).assertEqual('102 592 5907');
      log('testFormatNational0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0073
     * @tc.name      testFormatNational0073
     * @tc.desc      formatNational(10000000) -> 1000 0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0073 begin');
      const actual: string = CallNumberFormatter.formatNational('10000000');
      expect(actual).assertEqual('1000 0000');
      log('testFormatNational0073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0074
     * @tc.name      testFormatNational0074
     * @tc.desc      formatNational(10076543) -> 1007 6543
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0074 begin');
      const actual: string = CallNumberFormatter.formatNational('10076543');
      expect(actual).assertEqual('1007 6543');
      log('testFormatNational0074 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0075
     * @tc.name      testFormatNational0075
     * @tc.desc      formatNational(10153086) -> 1015 3086
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0075 begin');
      const actual: string = CallNumberFormatter.formatNational('10153086');
      expect(actual).assertEqual('1015 3086');
      log('testFormatNational0075 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0076
     * @tc.name      testFormatNational0076
     * @tc.desc      formatNational(10229629) -> 1022 9629
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0076 begin');
      const actual: string = CallNumberFormatter.formatNational('10229629');
      expect(actual).assertEqual('1022 9629');
      log('testFormatNational0076 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0077
     * @tc.name      testFormatNational0077
     * @tc.desc      formatNational(10306172) -> 1030 6172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0077 begin');
      const actual: string = CallNumberFormatter.formatNational('10306172');
      expect(actual).assertEqual('1030 6172');
      log('testFormatNational0077 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0078
     * @tc.name      testFormatNational0078
     * @tc.desc      formatNational(10382715) -> 1038 2715
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0078 begin');
      const actual: string = CallNumberFormatter.formatNational('10382715');
      expect(actual).assertEqual('1038 2715');
      log('testFormatNational0078 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0079
     * @tc.name      testFormatNational0079
     * @tc.desc      formatNational(10459258) -> 1045 9258
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0079 begin');
      const actual: string = CallNumberFormatter.formatNational('10459258');
      expect(actual).assertEqual('1045 9258');
      log('testFormatNational0079 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0080
     * @tc.name      testFormatNational0080
     * @tc.desc      formatNational(10535801) -> 1053 5801
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0080 begin');
      const actual: string = CallNumberFormatter.formatNational('10535801');
      expect(actual).assertEqual('1053 5801');
      log('testFormatNational0080 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0081
     * @tc.name      testFormatNational0081
     * @tc.desc      formatNational(10612344) -> 1061 2344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0081 begin');
      const actual: string = CallNumberFormatter.formatNational('10612344');
      expect(actual).assertEqual('1061 2344');
      log('testFormatNational0081 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0082
     * @tc.name      testFormatNational0082
     * @tc.desc      formatNational(10688887) -> 1068 8887
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0082 begin');
      const actual: string = CallNumberFormatter.formatNational('10688887');
      expect(actual).assertEqual('1068 8887');
      log('testFormatNational0082 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0083
     * @tc.name      testFormatNational0083
     * @tc.desc      formatNational(10765430) -> 1076 5430
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0083 begin');
      const actual: string = CallNumberFormatter.formatNational('10765430');
      expect(actual).assertEqual('1076 5430');
      log('testFormatNational0083 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0084
     * @tc.name      testFormatNational0084
     * @tc.desc      formatNational(10841973) -> 1084 1973
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0084 begin');
      const actual: string = CallNumberFormatter.formatNational('10841973');
      expect(actual).assertEqual('1084 1973');
      log('testFormatNational0084 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0085
     * @tc.name      testFormatNational0085
     * @tc.desc      formatNational(1234567) -> 1234567
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0085 begin');
      const actual: string = CallNumberFormatter.formatNational('1234567');
      expect(actual).assertEqual('1234567');
      log('testFormatNational0085 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0086
     * @tc.name      testFormatNational0086
     * @tc.desc      formatNational(123456789) -> 123456789
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0086 begin');
      const actual: string = CallNumberFormatter.formatNational('123456789');
      expect(actual).assertEqual('123456789');
      log('testFormatNational0086 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0087
     * @tc.name      testFormatNational0087
     * @tc.desc      formatNational(123456789012) -> 123456789012
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0087 begin');
      const actual: string = CallNumberFormatter.formatNational('123456789012');
      expect(actual).assertEqual('123456789012');
      log('testFormatNational0087 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0088
     * @tc.name      testFormatNational0088
     * @tc.desc      formatNational(123) -> 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0088 begin');
      const actual: string = CallNumberFormatter.formatNational('123');
      expect(actual).assertEqual('123');
      log('testFormatNational0088 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0089
     * @tc.name      testFormatNational0089
     * @tc.desc      formatNational(12345) -> 12345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0089 begin');
      const actual: string = CallNumberFormatter.formatNational('12345');
      expect(actual).assertEqual('12345');
      log('testFormatNational0089 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0090
     * @tc.name      testFormatNational0090
     * @tc.desc      formatNational(1) -> 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0090 begin');
      const actual: string = CallNumberFormatter.formatNational('1');
      expect(actual).assertEqual('1');
      log('testFormatNational0090 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0091
     * @tc.name      testFormatNational0091
     * @tc.desc      formatNational(138 0013 8000) -> 138 0013 8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0091 begin');
      const actual: string = CallNumberFormatter.formatNational('138 0013 8000');
      expect(actual).assertEqual('138 0013 8000');
      log('testFormatNational0091 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0092
     * @tc.name      testFormatNational0092
     * @tc.desc      formatNational(138-0013-8000) -> 138 0013 8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0092 begin');
      const actual: string = CallNumberFormatter.formatNational('138-0013-8000');
      expect(actual).assertEqual('138 0013 8000');
      log('testFormatNational0092 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0093
     * @tc.name      testFormatNational0093
     * @tc.desc      formatNational(138.0013.8000) -> 138 0013 8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0093 begin');
      const actual: string = CallNumberFormatter.formatNational('138.0013.8000');
      expect(actual).assertEqual('138 0013 8000');
      log('testFormatNational0093 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0094
     * @tc.name      testFormatNational0094
     * @tc.desc      formatNational((138)0013-8000) -> 138 0013 8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0094 begin');
      const actual: string = CallNumberFormatter.formatNational('(138)0013-8000');
      expect(actual).assertEqual('138 0013 8000');
      log('testFormatNational0094 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0095
     * @tc.name      testFormatNational0095
     * @tc.desc      formatNational( +86 138 0013 8000 ) -> +8613800138000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0095 begin');
      const actual: string = CallNumberFormatter.formatNational(' +86 138 0013 8000 ');
      expect(actual).assertEqual('+8613800138000');
      log('testFormatNational0095 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0096
     * @tc.name      testFormatNational0096
     * @tc.desc      formatNational(+8613800138000) -> +8613800138000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0096 begin');
      const actual: string = CallNumberFormatter.formatNational('+8613800138000');
      expect(actual).assertEqual('+8613800138000');
      log('testFormatNational0096 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0097
     * @tc.name      testFormatNational0097
     * @tc.desc      formatNational(+8613912345678) -> +8613912345678
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0097 begin');
      const actual: string = CallNumberFormatter.formatNational('+8613912345678');
      expect(actual).assertEqual('+8613912345678');
      log('testFormatNational0097 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0098
     * @tc.name      testFormatNational0098
     * @tc.desc      formatNational(+14155550123) -> +141 5555 0123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0098 begin');
      const actual: string = CallNumberFormatter.formatNational('+14155550123');
      expect(actual).assertEqual('+141 5555 0123');
      log('testFormatNational0098 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0099
     * @tc.name      testFormatNational0099
     * @tc.desc      formatNational(+442071838750) -> +442071838750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNational0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatNational0099 begin');
      const actual: string = CallNumberFormatter.formatNational('+442071838750');
      expect(actual).assertEqual('+442071838750');
      log('testFormatNational0099 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0100
     * @tc.name      testFormatDashes0100
     * @tc.desc      formatDashes(13810000000) -> 138-1000-0000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0100 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810000000');
      expect(actual).assertEqual('138-1000-0000');
      log('testFormatDashes0100 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0101
     * @tc.name      testFormatDashes0101
     * @tc.desc      formatDashes(13810000137) -> 138-1000-0137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0101 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810000137');
      expect(actual).assertEqual('138-1000-0137');
      log('testFormatDashes0101 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0102
     * @tc.name      testFormatDashes0102
     * @tc.desc      formatDashes(13810000274) -> 138-1000-0274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0102 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810000274');
      expect(actual).assertEqual('138-1000-0274');
      log('testFormatDashes0102 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0103
     * @tc.name      testFormatDashes0103
     * @tc.desc      formatDashes(13810000411) -> 138-1000-0411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0103 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810000411');
      expect(actual).assertEqual('138-1000-0411');
      log('testFormatDashes0103 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0104
     * @tc.name      testFormatDashes0104
     * @tc.desc      formatDashes(13810000548) -> 138-1000-0548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0104 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810000548');
      expect(actual).assertEqual('138-1000-0548');
      log('testFormatDashes0104 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0105
     * @tc.name      testFormatDashes0105
     * @tc.desc      formatDashes(13810000685) -> 138-1000-0685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0105 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810000685');
      expect(actual).assertEqual('138-1000-0685');
      log('testFormatDashes0105 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0106
     * @tc.name      testFormatDashes0106
     * @tc.desc      formatDashes(13810000822) -> 138-1000-0822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0106 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810000822');
      expect(actual).assertEqual('138-1000-0822');
      log('testFormatDashes0106 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0107
     * @tc.name      testFormatDashes0107
     * @tc.desc      formatDashes(13810000959) -> 138-1000-0959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0107 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810000959');
      expect(actual).assertEqual('138-1000-0959');
      log('testFormatDashes0107 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0108
     * @tc.name      testFormatDashes0108
     * @tc.desc      formatDashes(13810001096) -> 138-1000-1096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0108 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810001096');
      expect(actual).assertEqual('138-1000-1096');
      log('testFormatDashes0108 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0109
     * @tc.name      testFormatDashes0109
     * @tc.desc      formatDashes(13810001233) -> 138-1000-1233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0109 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810001233');
      expect(actual).assertEqual('138-1000-1233');
      log('testFormatDashes0109 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0110
     * @tc.name      testFormatDashes0110
     * @tc.desc      formatDashes(13810001370) -> 138-1000-1370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0110 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810001370');
      expect(actual).assertEqual('138-1000-1370');
      log('testFormatDashes0110 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0111
     * @tc.name      testFormatDashes0111
     * @tc.desc      formatDashes(13810001507) -> 138-1000-1507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0111 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810001507');
      expect(actual).assertEqual('138-1000-1507');
      log('testFormatDashes0111 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0112
     * @tc.name      testFormatDashes0112
     * @tc.desc      formatDashes(13810001644) -> 138-1000-1644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0112 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810001644');
      expect(actual).assertEqual('138-1000-1644');
      log('testFormatDashes0112 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0113
     * @tc.name      testFormatDashes0113
     * @tc.desc      formatDashes(13810001781) -> 138-1000-1781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0113 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810001781');
      expect(actual).assertEqual('138-1000-1781');
      log('testFormatDashes0113 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTA_0114
     * @tc.name      testFormatDashes0114
     * @tc.desc      formatDashes(13810001918) -> 138-1000-1918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatDashes0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormatDashes0114 begin');
      const actual: string = CallNumberFormatter.formatDashes('13810001918');
      expect(actual).assertEqual('138-1000-1918');
      log('testFormatDashes0114 end');
      await yieldToMain();
    })
  })
}
