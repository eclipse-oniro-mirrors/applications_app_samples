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
const TAG: string = 'CallNumberFormatMatrixB1';
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

export default function callNumberFormatMatrixB1Test(): void {
  describe('CallNumberFormatMatrixB1', () => {
    /**
     * @tc.number    SUB_CALL_NUMFMTB_0001
     * @tc.name      testMaskMiddle0001
     * @tc.desc      maskMiddle(13810000822,11,0) -> 13810000822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0001 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000822', 11, 0);
      expect(actual).assertEqual('13810000822');
      log('testMaskMiddle0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0002
     * @tc.name      testMaskMiddle0002
     * @tc.desc      maskMiddle(13810000822,12,0) -> 13810000822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0002 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000822', 12, 0);
      expect(actual).assertEqual('13810000822');
      log('testMaskMiddle0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0003
     * @tc.name      testMaskMiddle0003
     * @tc.desc      maskMiddle(13810000822,6,6) -> 13810000822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0003 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000822', 6, 6);
      expect(actual).assertEqual('13810000822');
      log('testMaskMiddle0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0004
     * @tc.name      testMaskMiddle0004
     * @tc.desc      maskMiddle(13810000822,2,3) -> 13******822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0004 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000822', 2, 3);
      expect(actual).assertEqual('13******822');
      log('testMaskMiddle0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0005
     * @tc.name      testMaskMiddle0005
     * @tc.desc      maskMiddle(13810000822,5,5) -> 13810*00822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0005 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000822', 5, 5);
      expect(actual).assertEqual('13810*00822');
      log('testMaskMiddle0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0006
     * @tc.name      testMaskMiddle0006
     * @tc.desc      maskMiddle(13810000959,3,4) -> 138****0959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0006 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000959', 3, 4);
      expect(actual).assertEqual('138****0959');
      log('testMaskMiddle0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0007
     * @tc.name      testMaskMiddle0007
     * @tc.desc      maskMiddle(13810000959,4,4) -> 1381***0959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0007 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000959', 4, 4);
      expect(actual).assertEqual('1381***0959');
      log('testMaskMiddle0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0008
     * @tc.name      testMaskMiddle0008
     * @tc.desc      maskMiddle(13810000959,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0008 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000959', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0009
     * @tc.name      testMaskMiddle0009
     * @tc.desc      maskMiddle(13810000959,0,4) -> *******0959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0009 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000959', 0, 4);
      expect(actual).assertEqual('*******0959');
      log('testMaskMiddle0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0010
     * @tc.name      testMaskMiddle0010
     * @tc.desc      maskMiddle(13810000959,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0010 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000959', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0011
     * @tc.name      testMaskMiddle0011
     * @tc.desc      maskMiddle(13810000959,11,0) -> 13810000959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0011 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000959', 11, 0);
      expect(actual).assertEqual('13810000959');
      log('testMaskMiddle0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0012
     * @tc.name      testMaskMiddle0012
     * @tc.desc      maskMiddle(13810000959,12,0) -> 13810000959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0012 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000959', 12, 0);
      expect(actual).assertEqual('13810000959');
      log('testMaskMiddle0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0013
     * @tc.name      testMaskMiddle0013
     * @tc.desc      maskMiddle(13810000959,6,6) -> 13810000959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0013 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000959', 6, 6);
      expect(actual).assertEqual('13810000959');
      log('testMaskMiddle0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0014
     * @tc.name      testMaskMiddle0014
     * @tc.desc      maskMiddle(13810000959,2,3) -> 13******959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0014 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000959', 2, 3);
      expect(actual).assertEqual('13******959');
      log('testMaskMiddle0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0015
     * @tc.name      testMaskMiddle0015
     * @tc.desc      maskMiddle(13810000959,5,5) -> 13810*00959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0015 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810000959', 5, 5);
      expect(actual).assertEqual('13810*00959');
      log('testMaskMiddle0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0016
     * @tc.name      testMaskMiddle0016
     * @tc.desc      maskMiddle(13810001096,3,4) -> 138****1096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0016 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001096', 3, 4);
      expect(actual).assertEqual('138****1096');
      log('testMaskMiddle0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0017
     * @tc.name      testMaskMiddle0017
     * @tc.desc      maskMiddle(13810001096,4,4) -> 1381***1096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0017 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001096', 4, 4);
      expect(actual).assertEqual('1381***1096');
      log('testMaskMiddle0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0018
     * @tc.name      testMaskMiddle0018
     * @tc.desc      maskMiddle(13810001096,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0018 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001096', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0019
     * @tc.name      testMaskMiddle0019
     * @tc.desc      maskMiddle(13810001096,0,4) -> *******1096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0019 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001096', 0, 4);
      expect(actual).assertEqual('*******1096');
      log('testMaskMiddle0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0020
     * @tc.name      testMaskMiddle0020
     * @tc.desc      maskMiddle(13810001096,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0020 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001096', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0021
     * @tc.name      testMaskMiddle0021
     * @tc.desc      maskMiddle(13810001096,11,0) -> 13810001096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0021 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001096', 11, 0);
      expect(actual).assertEqual('13810001096');
      log('testMaskMiddle0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0022
     * @tc.name      testMaskMiddle0022
     * @tc.desc      maskMiddle(13810001096,12,0) -> 13810001096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0022 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001096', 12, 0);
      expect(actual).assertEqual('13810001096');
      log('testMaskMiddle0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0023
     * @tc.name      testMaskMiddle0023
     * @tc.desc      maskMiddle(13810001096,6,6) -> 13810001096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0023 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001096', 6, 6);
      expect(actual).assertEqual('13810001096');
      log('testMaskMiddle0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0024
     * @tc.name      testMaskMiddle0024
     * @tc.desc      maskMiddle(13810001096,2,3) -> 13******096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0024 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001096', 2, 3);
      expect(actual).assertEqual('13******096');
      log('testMaskMiddle0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0025
     * @tc.name      testMaskMiddle0025
     * @tc.desc      maskMiddle(13810001096,5,5) -> 13810*01096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0025 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001096', 5, 5);
      expect(actual).assertEqual('13810*01096');
      log('testMaskMiddle0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0026
     * @tc.name      testMaskMiddle0026
     * @tc.desc      maskMiddle(13810001233,3,4) -> 138****1233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0026 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001233', 3, 4);
      expect(actual).assertEqual('138****1233');
      log('testMaskMiddle0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0027
     * @tc.name      testMaskMiddle0027
     * @tc.desc      maskMiddle(13810001233,4,4) -> 1381***1233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0027 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001233', 4, 4);
      expect(actual).assertEqual('1381***1233');
      log('testMaskMiddle0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0028
     * @tc.name      testMaskMiddle0028
     * @tc.desc      maskMiddle(13810001233,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0028 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001233', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0029
     * @tc.name      testMaskMiddle0029
     * @tc.desc      maskMiddle(13810001233,0,4) -> *******1233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0029 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001233', 0, 4);
      expect(actual).assertEqual('*******1233');
      log('testMaskMiddle0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0030
     * @tc.name      testMaskMiddle0030
     * @tc.desc      maskMiddle(13810001233,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0030 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001233', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0031
     * @tc.name      testMaskMiddle0031
     * @tc.desc      maskMiddle(13810001233,11,0) -> 13810001233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0031 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001233', 11, 0);
      expect(actual).assertEqual('13810001233');
      log('testMaskMiddle0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0032
     * @tc.name      testMaskMiddle0032
     * @tc.desc      maskMiddle(13810001233,12,0) -> 13810001233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0032 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001233', 12, 0);
      expect(actual).assertEqual('13810001233');
      log('testMaskMiddle0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0033
     * @tc.name      testMaskMiddle0033
     * @tc.desc      maskMiddle(13810001233,6,6) -> 13810001233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0033 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001233', 6, 6);
      expect(actual).assertEqual('13810001233');
      log('testMaskMiddle0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0034
     * @tc.name      testMaskMiddle0034
     * @tc.desc      maskMiddle(13810001233,2,3) -> 13******233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0034 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001233', 2, 3);
      expect(actual).assertEqual('13******233');
      log('testMaskMiddle0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0035
     * @tc.name      testMaskMiddle0035
     * @tc.desc      maskMiddle(13810001233,5,5) -> 13810*01233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0035 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001233', 5, 5);
      expect(actual).assertEqual('13810*01233');
      log('testMaskMiddle0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0036
     * @tc.name      testMaskMiddle0036
     * @tc.desc      maskMiddle(13810001370,3,4) -> 138****1370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0036 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001370', 3, 4);
      expect(actual).assertEqual('138****1370');
      log('testMaskMiddle0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0037
     * @tc.name      testMaskMiddle0037
     * @tc.desc      maskMiddle(13810001370,4,4) -> 1381***1370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0037 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001370', 4, 4);
      expect(actual).assertEqual('1381***1370');
      log('testMaskMiddle0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0038
     * @tc.name      testMaskMiddle0038
     * @tc.desc      maskMiddle(13810001370,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0038 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001370', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0039
     * @tc.name      testMaskMiddle0039
     * @tc.desc      maskMiddle(13810001370,0,4) -> *******1370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0039 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001370', 0, 4);
      expect(actual).assertEqual('*******1370');
      log('testMaskMiddle0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0040
     * @tc.name      testMaskMiddle0040
     * @tc.desc      maskMiddle(13810001370,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0040 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001370', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0041
     * @tc.name      testMaskMiddle0041
     * @tc.desc      maskMiddle(13810001370,11,0) -> 13810001370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0041 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001370', 11, 0);
      expect(actual).assertEqual('13810001370');
      log('testMaskMiddle0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0042
     * @tc.name      testMaskMiddle0042
     * @tc.desc      maskMiddle(13810001370,12,0) -> 13810001370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0042 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001370', 12, 0);
      expect(actual).assertEqual('13810001370');
      log('testMaskMiddle0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0043
     * @tc.name      testMaskMiddle0043
     * @tc.desc      maskMiddle(13810001370,6,6) -> 13810001370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0043 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001370', 6, 6);
      expect(actual).assertEqual('13810001370');
      log('testMaskMiddle0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0044
     * @tc.name      testMaskMiddle0044
     * @tc.desc      maskMiddle(13810001370,2,3) -> 13******370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0044 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001370', 2, 3);
      expect(actual).assertEqual('13******370');
      log('testMaskMiddle0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0045
     * @tc.name      testMaskMiddle0045
     * @tc.desc      maskMiddle(13810001370,5,5) -> 13810*01370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0045 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001370', 5, 5);
      expect(actual).assertEqual('13810*01370');
      log('testMaskMiddle0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0046
     * @tc.name      testMaskMiddle0046
     * @tc.desc      maskMiddle(13810001507,3,4) -> 138****1507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0046 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001507', 3, 4);
      expect(actual).assertEqual('138****1507');
      log('testMaskMiddle0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0047
     * @tc.name      testMaskMiddle0047
     * @tc.desc      maskMiddle(13810001507,4,4) -> 1381***1507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0047 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001507', 4, 4);
      expect(actual).assertEqual('1381***1507');
      log('testMaskMiddle0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0048
     * @tc.name      testMaskMiddle0048
     * @tc.desc      maskMiddle(13810001507,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0048 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001507', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0049
     * @tc.name      testMaskMiddle0049
     * @tc.desc      maskMiddle(13810001507,0,4) -> *******1507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0049 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001507', 0, 4);
      expect(actual).assertEqual('*******1507');
      log('testMaskMiddle0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0050
     * @tc.name      testMaskMiddle0050
     * @tc.desc      maskMiddle(13810001507,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0050 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001507', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0051
     * @tc.name      testMaskMiddle0051
     * @tc.desc      maskMiddle(13810001507,11,0) -> 13810001507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0051 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001507', 11, 0);
      expect(actual).assertEqual('13810001507');
      log('testMaskMiddle0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0052
     * @tc.name      testMaskMiddle0052
     * @tc.desc      maskMiddle(13810001507,12,0) -> 13810001507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0052 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001507', 12, 0);
      expect(actual).assertEqual('13810001507');
      log('testMaskMiddle0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0053
     * @tc.name      testMaskMiddle0053
     * @tc.desc      maskMiddle(13810001507,6,6) -> 13810001507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0053 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001507', 6, 6);
      expect(actual).assertEqual('13810001507');
      log('testMaskMiddle0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0054
     * @tc.name      testMaskMiddle0054
     * @tc.desc      maskMiddle(13810001507,2,3) -> 13******507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0054 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001507', 2, 3);
      expect(actual).assertEqual('13******507');
      log('testMaskMiddle0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0055
     * @tc.name      testMaskMiddle0055
     * @tc.desc      maskMiddle(13810001507,5,5) -> 13810*01507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0055 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001507', 5, 5);
      expect(actual).assertEqual('13810*01507');
      log('testMaskMiddle0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0056
     * @tc.name      testMaskMiddle0056
     * @tc.desc      maskMiddle(13810001644,3,4) -> 138****1644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0056 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001644', 3, 4);
      expect(actual).assertEqual('138****1644');
      log('testMaskMiddle0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0057
     * @tc.name      testMaskMiddle0057
     * @tc.desc      maskMiddle(13810001644,4,4) -> 1381***1644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0057 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001644', 4, 4);
      expect(actual).assertEqual('1381***1644');
      log('testMaskMiddle0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0058
     * @tc.name      testMaskMiddle0058
     * @tc.desc      maskMiddle(13810001644,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0058 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001644', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0059
     * @tc.name      testMaskMiddle0059
     * @tc.desc      maskMiddle(13810001644,0,4) -> *******1644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0059 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001644', 0, 4);
      expect(actual).assertEqual('*******1644');
      log('testMaskMiddle0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0060
     * @tc.name      testMaskMiddle0060
     * @tc.desc      maskMiddle(13810001644,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0060 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001644', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0061
     * @tc.name      testMaskMiddle0061
     * @tc.desc      maskMiddle(13810001644,11,0) -> 13810001644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0061 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001644', 11, 0);
      expect(actual).assertEqual('13810001644');
      log('testMaskMiddle0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0062
     * @tc.name      testMaskMiddle0062
     * @tc.desc      maskMiddle(13810001644,12,0) -> 13810001644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0062 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001644', 12, 0);
      expect(actual).assertEqual('13810001644');
      log('testMaskMiddle0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0063
     * @tc.name      testMaskMiddle0063
     * @tc.desc      maskMiddle(13810001644,6,6) -> 13810001644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0063 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001644', 6, 6);
      expect(actual).assertEqual('13810001644');
      log('testMaskMiddle0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0064
     * @tc.name      testMaskMiddle0064
     * @tc.desc      maskMiddle(13810001644,2,3) -> 13******644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0064 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001644', 2, 3);
      expect(actual).assertEqual('13******644');
      log('testMaskMiddle0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0065
     * @tc.name      testMaskMiddle0065
     * @tc.desc      maskMiddle(13810001644,5,5) -> 13810*01644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0065 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001644', 5, 5);
      expect(actual).assertEqual('13810*01644');
      log('testMaskMiddle0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0066
     * @tc.name      testMaskMiddle0066
     * @tc.desc      maskMiddle(13810001781,3,4) -> 138****1781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0066 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001781', 3, 4);
      expect(actual).assertEqual('138****1781');
      log('testMaskMiddle0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0067
     * @tc.name      testMaskMiddle0067
     * @tc.desc      maskMiddle(13810001781,4,4) -> 1381***1781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0067 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001781', 4, 4);
      expect(actual).assertEqual('1381***1781');
      log('testMaskMiddle0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0068
     * @tc.name      testMaskMiddle0068
     * @tc.desc      maskMiddle(13810001781,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0068 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001781', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0069
     * @tc.name      testMaskMiddle0069
     * @tc.desc      maskMiddle(13810001781,0,4) -> *******1781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0069 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001781', 0, 4);
      expect(actual).assertEqual('*******1781');
      log('testMaskMiddle0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0070
     * @tc.name      testMaskMiddle0070
     * @tc.desc      maskMiddle(13810001781,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0070 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001781', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0071
     * @tc.name      testMaskMiddle0071
     * @tc.desc      maskMiddle(13810001781,11,0) -> 13810001781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0071 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001781', 11, 0);
      expect(actual).assertEqual('13810001781');
      log('testMaskMiddle0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0072
     * @tc.name      testMaskMiddle0072
     * @tc.desc      maskMiddle(13810001781,12,0) -> 13810001781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0072 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001781', 12, 0);
      expect(actual).assertEqual('13810001781');
      log('testMaskMiddle0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0073
     * @tc.name      testMaskMiddle0073
     * @tc.desc      maskMiddle(13810001781,6,6) -> 13810001781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0073 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001781', 6, 6);
      expect(actual).assertEqual('13810001781');
      log('testMaskMiddle0073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0074
     * @tc.name      testMaskMiddle0074
     * @tc.desc      maskMiddle(13810001781,2,3) -> 13******781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0074 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001781', 2, 3);
      expect(actual).assertEqual('13******781');
      log('testMaskMiddle0074 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0075
     * @tc.name      testMaskMiddle0075
     * @tc.desc      maskMiddle(13810001781,5,5) -> 13810*01781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0075 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001781', 5, 5);
      expect(actual).assertEqual('13810*01781');
      log('testMaskMiddle0075 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0076
     * @tc.name      testMaskMiddle0076
     * @tc.desc      maskMiddle(13810001918,3,4) -> 138****1918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0076 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001918', 3, 4);
      expect(actual).assertEqual('138****1918');
      log('testMaskMiddle0076 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0077
     * @tc.name      testMaskMiddle0077
     * @tc.desc      maskMiddle(13810001918,4,4) -> 1381***1918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0077 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001918', 4, 4);
      expect(actual).assertEqual('1381***1918');
      log('testMaskMiddle0077 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0078
     * @tc.name      testMaskMiddle0078
     * @tc.desc      maskMiddle(13810001918,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0078 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001918', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0078 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0079
     * @tc.name      testMaskMiddle0079
     * @tc.desc      maskMiddle(13810001918,0,4) -> *******1918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0079 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001918', 0, 4);
      expect(actual).assertEqual('*******1918');
      log('testMaskMiddle0079 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0080
     * @tc.name      testMaskMiddle0080
     * @tc.desc      maskMiddle(13810001918,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0080 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001918', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0080 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0081
     * @tc.name      testMaskMiddle0081
     * @tc.desc      maskMiddle(13810001918,11,0) -> 13810001918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0081 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001918', 11, 0);
      expect(actual).assertEqual('13810001918');
      log('testMaskMiddle0081 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0082
     * @tc.name      testMaskMiddle0082
     * @tc.desc      maskMiddle(13810001918,12,0) -> 13810001918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0082 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001918', 12, 0);
      expect(actual).assertEqual('13810001918');
      log('testMaskMiddle0082 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0083
     * @tc.name      testMaskMiddle0083
     * @tc.desc      maskMiddle(13810001918,6,6) -> 13810001918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0083 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001918', 6, 6);
      expect(actual).assertEqual('13810001918');
      log('testMaskMiddle0083 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0084
     * @tc.name      testMaskMiddle0084
     * @tc.desc      maskMiddle(13810001918,2,3) -> 13******918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0084 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001918', 2, 3);
      expect(actual).assertEqual('13******918');
      log('testMaskMiddle0084 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0085
     * @tc.name      testMaskMiddle0085
     * @tc.desc      maskMiddle(13810001918,5,5) -> 13810*01918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0085 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810001918', 5, 5);
      expect(actual).assertEqual('13810*01918');
      log('testMaskMiddle0085 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0086
     * @tc.name      testMaskMiddle0086
     * @tc.desc      maskMiddle(13810002055,3,4) -> 138****2055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0086 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002055', 3, 4);
      expect(actual).assertEqual('138****2055');
      log('testMaskMiddle0086 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0087
     * @tc.name      testMaskMiddle0087
     * @tc.desc      maskMiddle(13810002055,4,4) -> 1381***2055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0087 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002055', 4, 4);
      expect(actual).assertEqual('1381***2055');
      log('testMaskMiddle0087 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0088
     * @tc.name      testMaskMiddle0088
     * @tc.desc      maskMiddle(13810002055,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0088 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002055', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0088 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0089
     * @tc.name      testMaskMiddle0089
     * @tc.desc      maskMiddle(13810002055,0,4) -> *******2055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0089 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002055', 0, 4);
      expect(actual).assertEqual('*******2055');
      log('testMaskMiddle0089 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0090
     * @tc.name      testMaskMiddle0090
     * @tc.desc      maskMiddle(13810002055,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0090 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002055', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0090 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0091
     * @tc.name      testMaskMiddle0091
     * @tc.desc      maskMiddle(13810002055,11,0) -> 13810002055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0091 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002055', 11, 0);
      expect(actual).assertEqual('13810002055');
      log('testMaskMiddle0091 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0092
     * @tc.name      testMaskMiddle0092
     * @tc.desc      maskMiddle(13810002055,12,0) -> 13810002055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0092 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002055', 12, 0);
      expect(actual).assertEqual('13810002055');
      log('testMaskMiddle0092 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0093
     * @tc.name      testMaskMiddle0093
     * @tc.desc      maskMiddle(13810002055,6,6) -> 13810002055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0093 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002055', 6, 6);
      expect(actual).assertEqual('13810002055');
      log('testMaskMiddle0093 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0094
     * @tc.name      testMaskMiddle0094
     * @tc.desc      maskMiddle(13810002055,2,3) -> 13******055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0094 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002055', 2, 3);
      expect(actual).assertEqual('13******055');
      log('testMaskMiddle0094 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0095
     * @tc.name      testMaskMiddle0095
     * @tc.desc      maskMiddle(13810002055,5,5) -> 13810*02055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0095 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002055', 5, 5);
      expect(actual).assertEqual('13810*02055');
      log('testMaskMiddle0095 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0096
     * @tc.name      testMaskMiddle0096
     * @tc.desc      maskMiddle(13810002192,3,4) -> 138****2192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0096 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002192', 3, 4);
      expect(actual).assertEqual('138****2192');
      log('testMaskMiddle0096 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0097
     * @tc.name      testMaskMiddle0097
     * @tc.desc      maskMiddle(13810002192,4,4) -> 1381***2192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0097 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002192', 4, 4);
      expect(actual).assertEqual('1381***2192');
      log('testMaskMiddle0097 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0098
     * @tc.name      testMaskMiddle0098
     * @tc.desc      maskMiddle(13810002192,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0098 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002192', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0098 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0099
     * @tc.name      testMaskMiddle0099
     * @tc.desc      maskMiddle(13810002192,0,4) -> *******2192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0099 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002192', 0, 4);
      expect(actual).assertEqual('*******2192');
      log('testMaskMiddle0099 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0100
     * @tc.name      testMaskMiddle0100
     * @tc.desc      maskMiddle(13810002192,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0100 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002192', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0100 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0101
     * @tc.name      testMaskMiddle0101
     * @tc.desc      maskMiddle(13810002192,11,0) -> 13810002192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0101 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002192', 11, 0);
      expect(actual).assertEqual('13810002192');
      log('testMaskMiddle0101 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0102
     * @tc.name      testMaskMiddle0102
     * @tc.desc      maskMiddle(13810002192,12,0) -> 13810002192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0102 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002192', 12, 0);
      expect(actual).assertEqual('13810002192');
      log('testMaskMiddle0102 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0103
     * @tc.name      testMaskMiddle0103
     * @tc.desc      maskMiddle(13810002192,6,6) -> 13810002192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0103 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002192', 6, 6);
      expect(actual).assertEqual('13810002192');
      log('testMaskMiddle0103 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0104
     * @tc.name      testMaskMiddle0104
     * @tc.desc      maskMiddle(13810002192,2,3) -> 13******192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0104 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002192', 2, 3);
      expect(actual).assertEqual('13******192');
      log('testMaskMiddle0104 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0105
     * @tc.name      testMaskMiddle0105
     * @tc.desc      maskMiddle(13810002192,5,5) -> 13810*02192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0105 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002192', 5, 5);
      expect(actual).assertEqual('13810*02192');
      log('testMaskMiddle0105 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0106
     * @tc.name      testMaskMiddle0106
     * @tc.desc      maskMiddle(13810002329,3,4) -> 138****2329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0106 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002329', 3, 4);
      expect(actual).assertEqual('138****2329');
      log('testMaskMiddle0106 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0107
     * @tc.name      testMaskMiddle0107
     * @tc.desc      maskMiddle(13810002329,4,4) -> 1381***2329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0107 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002329', 4, 4);
      expect(actual).assertEqual('1381***2329');
      log('testMaskMiddle0107 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0108
     * @tc.name      testMaskMiddle0108
     * @tc.desc      maskMiddle(13810002329,3,0) -> 138********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0108 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002329', 3, 0);
      expect(actual).assertEqual('138********');
      log('testMaskMiddle0108 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0109
     * @tc.name      testMaskMiddle0109
     * @tc.desc      maskMiddle(13810002329,0,4) -> *******2329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0109 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002329', 0, 4);
      expect(actual).assertEqual('*******2329');
      log('testMaskMiddle0109 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0110
     * @tc.name      testMaskMiddle0110
     * @tc.desc      maskMiddle(13810002329,0,0) -> ***********
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0110 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002329', 0, 0);
      expect(actual).assertEqual('***********');
      log('testMaskMiddle0110 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0111
     * @tc.name      testMaskMiddle0111
     * @tc.desc      maskMiddle(13810002329,11,0) -> 13810002329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0111 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002329', 11, 0);
      expect(actual).assertEqual('13810002329');
      log('testMaskMiddle0111 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0112
     * @tc.name      testMaskMiddle0112
     * @tc.desc      maskMiddle(13810002329,12,0) -> 13810002329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0112 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002329', 12, 0);
      expect(actual).assertEqual('13810002329');
      log('testMaskMiddle0112 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0113
     * @tc.name      testMaskMiddle0113
     * @tc.desc      maskMiddle(13810002329,6,6) -> 13810002329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0113 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002329', 6, 6);
      expect(actual).assertEqual('13810002329');
      log('testMaskMiddle0113 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_NUMFMTB_0114
     * @tc.name      testMaskMiddle0114
     * @tc.desc      maskMiddle(13810002329,2,3) -> 13******329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMiddle0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMaskMiddle0114 begin');
      const actual: string = CallNumberFormatter.maskMiddle('13810002329', 2, 3);
      expect(actual).assertEqual('13******329');
      log('testMaskMiddle0114 end');
      await yieldToMain();
    })
  })
}
