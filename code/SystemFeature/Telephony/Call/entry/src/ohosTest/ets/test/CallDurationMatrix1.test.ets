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
import { CallDurationFormatter } from '../../../main/ets/model/CallDurationFormatter';

const DOMAIN: number = 0xF814;
const TAG: string = 'CallDurationMatrix1';
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

export default function callDurationMatrix1Test(): void {
  describe('CallDurationMatrix1', () => {
    /**
     * @tc.number    SUB_CALL_DURATION_0001
     * @tc.name      testFormat0001
     * @tc.desc      format(0 seconds) -> 00:00
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0001 begin');
      const actual: string = CallDurationFormatter.format(0);
      expect(actual).assertEqual('00:00');
      log('testFormat0001 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0002
     * @tc.name      testFormat0002
     * @tc.desc      format(1 seconds) -> 00:01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0002 begin');
      const actual: string = CallDurationFormatter.format(1);
      expect(actual).assertEqual('00:01');
      log('testFormat0002 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0003
     * @tc.name      testFormat0003
     * @tc.desc      format(2 seconds) -> 00:02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0003 begin');
      const actual: string = CallDurationFormatter.format(2);
      expect(actual).assertEqual('00:02');
      log('testFormat0003 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0004
     * @tc.name      testFormat0004
     * @tc.desc      format(3 seconds) -> 00:03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0004 begin');
      const actual: string = CallDurationFormatter.format(3);
      expect(actual).assertEqual('00:03');
      log('testFormat0004 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0005
     * @tc.name      testFormat0005
     * @tc.desc      format(4 seconds) -> 00:04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0005 begin');
      const actual: string = CallDurationFormatter.format(4);
      expect(actual).assertEqual('00:04');
      log('testFormat0005 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0006
     * @tc.name      testFormat0006
     * @tc.desc      format(5 seconds) -> 00:05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0006 begin');
      const actual: string = CallDurationFormatter.format(5);
      expect(actual).assertEqual('00:05');
      log('testFormat0006 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0007
     * @tc.name      testFormat0007
     * @tc.desc      format(6 seconds) -> 00:06
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0007 begin');
      const actual: string = CallDurationFormatter.format(6);
      expect(actual).assertEqual('00:06');
      log('testFormat0007 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0008
     * @tc.name      testFormat0008
     * @tc.desc      format(7 seconds) -> 00:07
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0008 begin');
      const actual: string = CallDurationFormatter.format(7);
      expect(actual).assertEqual('00:07');
      log('testFormat0008 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0009
     * @tc.name      testFormat0009
     * @tc.desc      format(8 seconds) -> 00:08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0009 begin');
      const actual: string = CallDurationFormatter.format(8);
      expect(actual).assertEqual('00:08');
      log('testFormat0009 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0010
     * @tc.name      testFormat0010
     * @tc.desc      format(9 seconds) -> 00:09
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0010 begin');
      const actual: string = CallDurationFormatter.format(9);
      expect(actual).assertEqual('00:09');
      log('testFormat0010 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0011
     * @tc.name      testFormat0011
     * @tc.desc      format(10 seconds) -> 00:10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0011 begin');
      const actual: string = CallDurationFormatter.format(10);
      expect(actual).assertEqual('00:10');
      log('testFormat0011 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0012
     * @tc.name      testFormat0012
     * @tc.desc      format(11 seconds) -> 00:11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0012 begin');
      const actual: string = CallDurationFormatter.format(11);
      expect(actual).assertEqual('00:11');
      log('testFormat0012 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0013
     * @tc.name      testFormat0013
     * @tc.desc      format(12 seconds) -> 00:12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0013 begin');
      const actual: string = CallDurationFormatter.format(12);
      expect(actual).assertEqual('00:12');
      log('testFormat0013 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0014
     * @tc.name      testFormat0014
     * @tc.desc      format(13 seconds) -> 00:13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0014 begin');
      const actual: string = CallDurationFormatter.format(13);
      expect(actual).assertEqual('00:13');
      log('testFormat0014 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0015
     * @tc.name      testFormat0015
     * @tc.desc      format(14 seconds) -> 00:14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0015 begin');
      const actual: string = CallDurationFormatter.format(14);
      expect(actual).assertEqual('00:14');
      log('testFormat0015 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0016
     * @tc.name      testFormat0016
     * @tc.desc      format(15 seconds) -> 00:15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0016 begin');
      const actual: string = CallDurationFormatter.format(15);
      expect(actual).assertEqual('00:15');
      log('testFormat0016 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0017
     * @tc.name      testFormat0017
     * @tc.desc      format(16 seconds) -> 00:16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0017 begin');
      const actual: string = CallDurationFormatter.format(16);
      expect(actual).assertEqual('00:16');
      log('testFormat0017 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0018
     * @tc.name      testFormat0018
     * @tc.desc      format(17 seconds) -> 00:17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0018 begin');
      const actual: string = CallDurationFormatter.format(17);
      expect(actual).assertEqual('00:17');
      log('testFormat0018 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0019
     * @tc.name      testFormat0019
     * @tc.desc      format(18 seconds) -> 00:18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0019 begin');
      const actual: string = CallDurationFormatter.format(18);
      expect(actual).assertEqual('00:18');
      log('testFormat0019 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0020
     * @tc.name      testFormat0020
     * @tc.desc      format(19 seconds) -> 00:19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0020 begin');
      const actual: string = CallDurationFormatter.format(19);
      expect(actual).assertEqual('00:19');
      log('testFormat0020 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0021
     * @tc.name      testFormat0021
     * @tc.desc      format(20 seconds) -> 00:20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0021 begin');
      const actual: string = CallDurationFormatter.format(20);
      expect(actual).assertEqual('00:20');
      log('testFormat0021 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0022
     * @tc.name      testFormat0022
     * @tc.desc      format(21 seconds) -> 00:21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0022 begin');
      const actual: string = CallDurationFormatter.format(21);
      expect(actual).assertEqual('00:21');
      log('testFormat0022 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0023
     * @tc.name      testFormat0023
     * @tc.desc      format(22 seconds) -> 00:22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0023 begin');
      const actual: string = CallDurationFormatter.format(22);
      expect(actual).assertEqual('00:22');
      log('testFormat0023 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0024
     * @tc.name      testFormat0024
     * @tc.desc      format(23 seconds) -> 00:23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0024 begin');
      const actual: string = CallDurationFormatter.format(23);
      expect(actual).assertEqual('00:23');
      log('testFormat0024 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0025
     * @tc.name      testFormat0025
     * @tc.desc      format(24 seconds) -> 00:24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0025 begin');
      const actual: string = CallDurationFormatter.format(24);
      expect(actual).assertEqual('00:24');
      log('testFormat0025 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0026
     * @tc.name      testFormat0026
     * @tc.desc      format(25 seconds) -> 00:25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0026 begin');
      const actual: string = CallDurationFormatter.format(25);
      expect(actual).assertEqual('00:25');
      log('testFormat0026 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0027
     * @tc.name      testFormat0027
     * @tc.desc      format(26 seconds) -> 00:26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0027 begin');
      const actual: string = CallDurationFormatter.format(26);
      expect(actual).assertEqual('00:26');
      log('testFormat0027 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0028
     * @tc.name      testFormat0028
     * @tc.desc      format(27 seconds) -> 00:27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0028 begin');
      const actual: string = CallDurationFormatter.format(27);
      expect(actual).assertEqual('00:27');
      log('testFormat0028 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0029
     * @tc.name      testFormat0029
     * @tc.desc      format(28 seconds) -> 00:28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0029 begin');
      const actual: string = CallDurationFormatter.format(28);
      expect(actual).assertEqual('00:28');
      log('testFormat0029 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0030
     * @tc.name      testFormat0030
     * @tc.desc      format(29 seconds) -> 00:29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0030 begin');
      const actual: string = CallDurationFormatter.format(29);
      expect(actual).assertEqual('00:29');
      log('testFormat0030 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0031
     * @tc.name      testFormat0031
     * @tc.desc      format(30 seconds) -> 00:30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0031 begin');
      const actual: string = CallDurationFormatter.format(30);
      expect(actual).assertEqual('00:30');
      log('testFormat0031 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0032
     * @tc.name      testFormat0032
     * @tc.desc      format(31 seconds) -> 00:31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0032 begin');
      const actual: string = CallDurationFormatter.format(31);
      expect(actual).assertEqual('00:31');
      log('testFormat0032 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0033
     * @tc.name      testFormat0033
     * @tc.desc      format(32 seconds) -> 00:32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0033 begin');
      const actual: string = CallDurationFormatter.format(32);
      expect(actual).assertEqual('00:32');
      log('testFormat0033 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0034
     * @tc.name      testFormat0034
     * @tc.desc      format(33 seconds) -> 00:33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0034 begin');
      const actual: string = CallDurationFormatter.format(33);
      expect(actual).assertEqual('00:33');
      log('testFormat0034 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0035
     * @tc.name      testFormat0035
     * @tc.desc      format(34 seconds) -> 00:34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0035 begin');
      const actual: string = CallDurationFormatter.format(34);
      expect(actual).assertEqual('00:34');
      log('testFormat0035 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0036
     * @tc.name      testFormat0036
     * @tc.desc      format(35 seconds) -> 00:35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0036 begin');
      const actual: string = CallDurationFormatter.format(35);
      expect(actual).assertEqual('00:35');
      log('testFormat0036 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0037
     * @tc.name      testFormat0037
     * @tc.desc      format(36 seconds) -> 00:36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0037 begin');
      const actual: string = CallDurationFormatter.format(36);
      expect(actual).assertEqual('00:36');
      log('testFormat0037 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0038
     * @tc.name      testFormat0038
     * @tc.desc      format(37 seconds) -> 00:37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0038 begin');
      const actual: string = CallDurationFormatter.format(37);
      expect(actual).assertEqual('00:37');
      log('testFormat0038 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0039
     * @tc.name      testFormat0039
     * @tc.desc      format(38 seconds) -> 00:38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0039 begin');
      const actual: string = CallDurationFormatter.format(38);
      expect(actual).assertEqual('00:38');
      log('testFormat0039 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0040
     * @tc.name      testFormat0040
     * @tc.desc      format(39 seconds) -> 00:39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0040 begin');
      const actual: string = CallDurationFormatter.format(39);
      expect(actual).assertEqual('00:39');
      log('testFormat0040 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0041
     * @tc.name      testFormat0041
     * @tc.desc      format(40 seconds) -> 00:40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0041 begin');
      const actual: string = CallDurationFormatter.format(40);
      expect(actual).assertEqual('00:40');
      log('testFormat0041 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0042
     * @tc.name      testFormat0042
     * @tc.desc      format(41 seconds) -> 00:41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0042 begin');
      const actual: string = CallDurationFormatter.format(41);
      expect(actual).assertEqual('00:41');
      log('testFormat0042 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0043
     * @tc.name      testFormat0043
     * @tc.desc      format(42 seconds) -> 00:42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0043 begin');
      const actual: string = CallDurationFormatter.format(42);
      expect(actual).assertEqual('00:42');
      log('testFormat0043 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0044
     * @tc.name      testFormat0044
     * @tc.desc      format(43 seconds) -> 00:43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0044 begin');
      const actual: string = CallDurationFormatter.format(43);
      expect(actual).assertEqual('00:43');
      log('testFormat0044 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0045
     * @tc.name      testFormat0045
     * @tc.desc      format(44 seconds) -> 00:44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0045 begin');
      const actual: string = CallDurationFormatter.format(44);
      expect(actual).assertEqual('00:44');
      log('testFormat0045 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0046
     * @tc.name      testFormat0046
     * @tc.desc      format(45 seconds) -> 00:45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0046 begin');
      const actual: string = CallDurationFormatter.format(45);
      expect(actual).assertEqual('00:45');
      log('testFormat0046 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0047
     * @tc.name      testFormat0047
     * @tc.desc      format(46 seconds) -> 00:46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0047 begin');
      const actual: string = CallDurationFormatter.format(46);
      expect(actual).assertEqual('00:46');
      log('testFormat0047 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0048
     * @tc.name      testFormat0048
     * @tc.desc      format(47 seconds) -> 00:47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0048 begin');
      const actual: string = CallDurationFormatter.format(47);
      expect(actual).assertEqual('00:47');
      log('testFormat0048 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0049
     * @tc.name      testFormat0049
     * @tc.desc      format(48 seconds) -> 00:48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0049 begin');
      const actual: string = CallDurationFormatter.format(48);
      expect(actual).assertEqual('00:48');
      log('testFormat0049 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0050
     * @tc.name      testFormat0050
     * @tc.desc      format(49 seconds) -> 00:49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0050 begin');
      const actual: string = CallDurationFormatter.format(49);
      expect(actual).assertEqual('00:49');
      log('testFormat0050 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0051
     * @tc.name      testFormat0051
     * @tc.desc      format(50 seconds) -> 00:50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0051 begin');
      const actual: string = CallDurationFormatter.format(50);
      expect(actual).assertEqual('00:50');
      log('testFormat0051 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0052
     * @tc.name      testFormat0052
     * @tc.desc      format(51 seconds) -> 00:51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0052 begin');
      const actual: string = CallDurationFormatter.format(51);
      expect(actual).assertEqual('00:51');
      log('testFormat0052 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0053
     * @tc.name      testFormat0053
     * @tc.desc      format(52 seconds) -> 00:52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0053 begin');
      const actual: string = CallDurationFormatter.format(52);
      expect(actual).assertEqual('00:52');
      log('testFormat0053 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0054
     * @tc.name      testFormat0054
     * @tc.desc      format(53 seconds) -> 00:53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0054 begin');
      const actual: string = CallDurationFormatter.format(53);
      expect(actual).assertEqual('00:53');
      log('testFormat0054 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0055
     * @tc.name      testFormat0055
     * @tc.desc      format(54 seconds) -> 00:54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0055 begin');
      const actual: string = CallDurationFormatter.format(54);
      expect(actual).assertEqual('00:54');
      log('testFormat0055 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0056
     * @tc.name      testFormat0056
     * @tc.desc      format(55 seconds) -> 00:55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0056 begin');
      const actual: string = CallDurationFormatter.format(55);
      expect(actual).assertEqual('00:55');
      log('testFormat0056 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0057
     * @tc.name      testFormat0057
     * @tc.desc      format(56 seconds) -> 00:56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0057 begin');
      const actual: string = CallDurationFormatter.format(56);
      expect(actual).assertEqual('00:56');
      log('testFormat0057 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0058
     * @tc.name      testFormat0058
     * @tc.desc      format(57 seconds) -> 00:57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0058 begin');
      const actual: string = CallDurationFormatter.format(57);
      expect(actual).assertEqual('00:57');
      log('testFormat0058 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0059
     * @tc.name      testFormat0059
     * @tc.desc      format(58 seconds) -> 00:58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0059 begin');
      const actual: string = CallDurationFormatter.format(58);
      expect(actual).assertEqual('00:58');
      log('testFormat0059 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0060
     * @tc.name      testFormat0060
     * @tc.desc      format(59 seconds) -> 00:59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0060 begin');
      const actual: string = CallDurationFormatter.format(59);
      expect(actual).assertEqual('00:59');
      log('testFormat0060 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0061
     * @tc.name      testFormat0061
     * @tc.desc      format(60 seconds) -> 01:00
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0061 begin');
      const actual: string = CallDurationFormatter.format(60);
      expect(actual).assertEqual('01:00');
      log('testFormat0061 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0062
     * @tc.name      testFormat0062
     * @tc.desc      format(61 seconds) -> 01:01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0062 begin');
      const actual: string = CallDurationFormatter.format(61);
      expect(actual).assertEqual('01:01');
      log('testFormat0062 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0063
     * @tc.name      testFormat0063
     * @tc.desc      format(62 seconds) -> 01:02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0063 begin');
      const actual: string = CallDurationFormatter.format(62);
      expect(actual).assertEqual('01:02');
      log('testFormat0063 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0064
     * @tc.name      testFormat0064
     * @tc.desc      format(63 seconds) -> 01:03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0064 begin');
      const actual: string = CallDurationFormatter.format(63);
      expect(actual).assertEqual('01:03');
      log('testFormat0064 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0065
     * @tc.name      testFormat0065
     * @tc.desc      format(64 seconds) -> 01:04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0065 begin');
      const actual: string = CallDurationFormatter.format(64);
      expect(actual).assertEqual('01:04');
      log('testFormat0065 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0066
     * @tc.name      testFormat0066
     * @tc.desc      format(65 seconds) -> 01:05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0066 begin');
      const actual: string = CallDurationFormatter.format(65);
      expect(actual).assertEqual('01:05');
      log('testFormat0066 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0067
     * @tc.name      testFormat0067
     * @tc.desc      format(66 seconds) -> 01:06
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0067 begin');
      const actual: string = CallDurationFormatter.format(66);
      expect(actual).assertEqual('01:06');
      log('testFormat0067 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0068
     * @tc.name      testFormat0068
     * @tc.desc      format(67 seconds) -> 01:07
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0068 begin');
      const actual: string = CallDurationFormatter.format(67);
      expect(actual).assertEqual('01:07');
      log('testFormat0068 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0069
     * @tc.name      testFormat0069
     * @tc.desc      format(68 seconds) -> 01:08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0069 begin');
      const actual: string = CallDurationFormatter.format(68);
      expect(actual).assertEqual('01:08');
      log('testFormat0069 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0070
     * @tc.name      testFormat0070
     * @tc.desc      format(69 seconds) -> 01:09
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0070 begin');
      const actual: string = CallDurationFormatter.format(69);
      expect(actual).assertEqual('01:09');
      log('testFormat0070 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0071
     * @tc.name      testFormat0071
     * @tc.desc      format(70 seconds) -> 01:10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0071 begin');
      const actual: string = CallDurationFormatter.format(70);
      expect(actual).assertEqual('01:10');
      log('testFormat0071 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0072
     * @tc.name      testFormat0072
     * @tc.desc      format(71 seconds) -> 01:11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0072 begin');
      const actual: string = CallDurationFormatter.format(71);
      expect(actual).assertEqual('01:11');
      log('testFormat0072 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0073
     * @tc.name      testFormat0073
     * @tc.desc      format(72 seconds) -> 01:12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0073 begin');
      const actual: string = CallDurationFormatter.format(72);
      expect(actual).assertEqual('01:12');
      log('testFormat0073 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0074
     * @tc.name      testFormat0074
     * @tc.desc      format(73 seconds) -> 01:13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0074 begin');
      const actual: string = CallDurationFormatter.format(73);
      expect(actual).assertEqual('01:13');
      log('testFormat0074 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0075
     * @tc.name      testFormat0075
     * @tc.desc      format(74 seconds) -> 01:14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0075 begin');
      const actual: string = CallDurationFormatter.format(74);
      expect(actual).assertEqual('01:14');
      log('testFormat0075 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0076
     * @tc.name      testFormat0076
     * @tc.desc      format(75 seconds) -> 01:15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0076 begin');
      const actual: string = CallDurationFormatter.format(75);
      expect(actual).assertEqual('01:15');
      log('testFormat0076 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0077
     * @tc.name      testFormat0077
     * @tc.desc      format(76 seconds) -> 01:16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0077 begin');
      const actual: string = CallDurationFormatter.format(76);
      expect(actual).assertEqual('01:16');
      log('testFormat0077 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0078
     * @tc.name      testFormat0078
     * @tc.desc      format(77 seconds) -> 01:17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0078 begin');
      const actual: string = CallDurationFormatter.format(77);
      expect(actual).assertEqual('01:17');
      log('testFormat0078 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0079
     * @tc.name      testFormat0079
     * @tc.desc      format(78 seconds) -> 01:18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0079 begin');
      const actual: string = CallDurationFormatter.format(78);
      expect(actual).assertEqual('01:18');
      log('testFormat0079 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0080
     * @tc.name      testFormat0080
     * @tc.desc      format(79 seconds) -> 01:19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0080 begin');
      const actual: string = CallDurationFormatter.format(79);
      expect(actual).assertEqual('01:19');
      log('testFormat0080 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0081
     * @tc.name      testFormat0081
     * @tc.desc      format(80 seconds) -> 01:20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0081 begin');
      const actual: string = CallDurationFormatter.format(80);
      expect(actual).assertEqual('01:20');
      log('testFormat0081 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0082
     * @tc.name      testFormat0082
     * @tc.desc      format(81 seconds) -> 01:21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0082 begin');
      const actual: string = CallDurationFormatter.format(81);
      expect(actual).assertEqual('01:21');
      log('testFormat0082 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0083
     * @tc.name      testFormat0083
     * @tc.desc      format(82 seconds) -> 01:22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0083 begin');
      const actual: string = CallDurationFormatter.format(82);
      expect(actual).assertEqual('01:22');
      log('testFormat0083 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0084
     * @tc.name      testFormat0084
     * @tc.desc      format(83 seconds) -> 01:23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0084 begin');
      const actual: string = CallDurationFormatter.format(83);
      expect(actual).assertEqual('01:23');
      log('testFormat0084 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0085
     * @tc.name      testFormat0085
     * @tc.desc      format(84 seconds) -> 01:24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0085 begin');
      const actual: string = CallDurationFormatter.format(84);
      expect(actual).assertEqual('01:24');
      log('testFormat0085 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0086
     * @tc.name      testFormat0086
     * @tc.desc      format(85 seconds) -> 01:25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0086 begin');
      const actual: string = CallDurationFormatter.format(85);
      expect(actual).assertEqual('01:25');
      log('testFormat0086 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0087
     * @tc.name      testFormat0087
     * @tc.desc      format(86 seconds) -> 01:26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0087 begin');
      const actual: string = CallDurationFormatter.format(86);
      expect(actual).assertEqual('01:26');
      log('testFormat0087 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0088
     * @tc.name      testFormat0088
     * @tc.desc      format(87 seconds) -> 01:27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0088 begin');
      const actual: string = CallDurationFormatter.format(87);
      expect(actual).assertEqual('01:27');
      log('testFormat0088 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0089
     * @tc.name      testFormat0089
     * @tc.desc      format(88 seconds) -> 01:28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0089 begin');
      const actual: string = CallDurationFormatter.format(88);
      expect(actual).assertEqual('01:28');
      log('testFormat0089 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0090
     * @tc.name      testFormat0090
     * @tc.desc      format(89 seconds) -> 01:29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0090 begin');
      const actual: string = CallDurationFormatter.format(89);
      expect(actual).assertEqual('01:29');
      log('testFormat0090 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0091
     * @tc.name      testFormat0091
     * @tc.desc      format(90 seconds) -> 01:30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0091 begin');
      const actual: string = CallDurationFormatter.format(90);
      expect(actual).assertEqual('01:30');
      log('testFormat0091 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0092
     * @tc.name      testFormat0092
     * @tc.desc      format(91 seconds) -> 01:31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0092 begin');
      const actual: string = CallDurationFormatter.format(91);
      expect(actual).assertEqual('01:31');
      log('testFormat0092 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0093
     * @tc.name      testFormat0093
     * @tc.desc      format(92 seconds) -> 01:32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0093 begin');
      const actual: string = CallDurationFormatter.format(92);
      expect(actual).assertEqual('01:32');
      log('testFormat0093 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0094
     * @tc.name      testFormat0094
     * @tc.desc      format(93 seconds) -> 01:33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0094 begin');
      const actual: string = CallDurationFormatter.format(93);
      expect(actual).assertEqual('01:33');
      log('testFormat0094 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0095
     * @tc.name      testFormat0095
     * @tc.desc      format(94 seconds) -> 01:34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0095 begin');
      const actual: string = CallDurationFormatter.format(94);
      expect(actual).assertEqual('01:34');
      log('testFormat0095 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0096
     * @tc.name      testFormat0096
     * @tc.desc      format(95 seconds) -> 01:35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0096 begin');
      const actual: string = CallDurationFormatter.format(95);
      expect(actual).assertEqual('01:35');
      log('testFormat0096 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0097
     * @tc.name      testFormat0097
     * @tc.desc      format(96 seconds) -> 01:36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0097 begin');
      const actual: string = CallDurationFormatter.format(96);
      expect(actual).assertEqual('01:36');
      log('testFormat0097 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0098
     * @tc.name      testFormat0098
     * @tc.desc      format(97 seconds) -> 01:37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0098 begin');
      const actual: string = CallDurationFormatter.format(97);
      expect(actual).assertEqual('01:37');
      log('testFormat0098 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0099
     * @tc.name      testFormat0099
     * @tc.desc      format(98 seconds) -> 01:38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0099 begin');
      const actual: string = CallDurationFormatter.format(98);
      expect(actual).assertEqual('01:38');
      log('testFormat0099 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0100
     * @tc.name      testFormat0100
     * @tc.desc      format(99 seconds) -> 01:39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0100 begin');
      const actual: string = CallDurationFormatter.format(99);
      expect(actual).assertEqual('01:39');
      log('testFormat0100 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0101
     * @tc.name      testFormat0101
     * @tc.desc      format(100 seconds) -> 01:40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0101 begin');
      const actual: string = CallDurationFormatter.format(100);
      expect(actual).assertEqual('01:40');
      log('testFormat0101 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0102
     * @tc.name      testFormat0102
     * @tc.desc      format(101 seconds) -> 01:41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0102 begin');
      const actual: string = CallDurationFormatter.format(101);
      expect(actual).assertEqual('01:41');
      log('testFormat0102 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0103
     * @tc.name      testFormat0103
     * @tc.desc      format(102 seconds) -> 01:42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0103 begin');
      const actual: string = CallDurationFormatter.format(102);
      expect(actual).assertEqual('01:42');
      log('testFormat0103 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0104
     * @tc.name      testFormat0104
     * @tc.desc      format(103 seconds) -> 01:43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0104 begin');
      const actual: string = CallDurationFormatter.format(103);
      expect(actual).assertEqual('01:43');
      log('testFormat0104 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0105
     * @tc.name      testFormat0105
     * @tc.desc      format(104 seconds) -> 01:44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0105 begin');
      const actual: string = CallDurationFormatter.format(104);
      expect(actual).assertEqual('01:44');
      log('testFormat0105 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0106
     * @tc.name      testFormat0106
     * @tc.desc      format(105 seconds) -> 01:45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0106 begin');
      const actual: string = CallDurationFormatter.format(105);
      expect(actual).assertEqual('01:45');
      log('testFormat0106 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0107
     * @tc.name      testFormat0107
     * @tc.desc      format(106 seconds) -> 01:46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0107 begin');
      const actual: string = CallDurationFormatter.format(106);
      expect(actual).assertEqual('01:46');
      log('testFormat0107 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0108
     * @tc.name      testFormat0108
     * @tc.desc      format(107 seconds) -> 01:47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0108 begin');
      const actual: string = CallDurationFormatter.format(107);
      expect(actual).assertEqual('01:47');
      log('testFormat0108 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0109
     * @tc.name      testFormat0109
     * @tc.desc      format(108 seconds) -> 01:48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0109 begin');
      const actual: string = CallDurationFormatter.format(108);
      expect(actual).assertEqual('01:48');
      log('testFormat0109 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0110
     * @tc.name      testFormat0110
     * @tc.desc      format(109 seconds) -> 01:49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0110 begin');
      const actual: string = CallDurationFormatter.format(109);
      expect(actual).assertEqual('01:49');
      log('testFormat0110 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0111
     * @tc.name      testFormat0111
     * @tc.desc      format(110 seconds) -> 01:50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0111 begin');
      const actual: string = CallDurationFormatter.format(110);
      expect(actual).assertEqual('01:50');
      log('testFormat0111 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0112
     * @tc.name      testFormat0112
     * @tc.desc      format(111 seconds) -> 01:51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0112 begin');
      const actual: string = CallDurationFormatter.format(111);
      expect(actual).assertEqual('01:51');
      log('testFormat0112 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0113
     * @tc.name      testFormat0113
     * @tc.desc      format(112 seconds) -> 01:52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0113 begin');
      const actual: string = CallDurationFormatter.format(112);
      expect(actual).assertEqual('01:52');
      log('testFormat0113 end');
      await yieldToMain();
    })

    /**
     * @tc.number    SUB_CALL_DURATION_0114
     * @tc.name      testFormat0114
     * @tc.desc      format(113 seconds) -> 01:53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormat0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormat0114 begin');
      const actual: string = CallDurationFormatter.format(113);
      expect(actual).assertEqual('01:53');
      log('testFormat0114 end');
      await yieldToMain();
    })
  })
}
