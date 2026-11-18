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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { JumpState, SELF_BUNDLE_NAME, jumpTargetByKey, jumpStateName, jumpErrorHint, describeJumpResult, beginAttempt, isActiveAttempt } from '../../../main/ets/model/AbilityJump';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function AbilityJumpErrorMatrixPart1Test(): void {
  describe('AbilityJumpErrorMatrixPart1', () => {

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_0100
     * @tc.name      testTargetLookup0001
     * @tc.desc      Verify jump target settings resolves to com.ohos.settings.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTargetLookup0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetLookup0001 begin');
      await delayTick();
      const target = jumpTargetByKey('settings');
      expect(target !== null).assertTrue();
      if (target !== null) {
        expect(target.bundleName).assertEqual('com.ohos.settings');
        expect(target.abilityName).assertEqual('com.ohos.settings.MainAbility');
        expect(target.describe()).assertEqual('com.ohos.settings/com.ohos.settings.MainAbility');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetLookup0001 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_0200
     * @tc.name      testTargetLookup0002
     * @tc.desc      Verify jump target self resolves to com.samples.atomicservicecomponents.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTargetLookup0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetLookup0002 begin');
      await delayTick();
      const target = jumpTargetByKey('self');
      expect(target !== null).assertTrue();
      if (target !== null) {
        expect(target.bundleName).assertEqual('com.samples.atomicservicecomponents');
        expect(target.abilityName).assertEqual('EntryAbility');
        expect(target.describe()).assertEqual('com.samples.atomicservicecomponents/EntryAbility');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetLookup0002 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_0300
     * @tc.name      testTargetLookup0003
     * @tc.desc      Verify jump target missing resolves to com.samples.not.installed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTargetLookup0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetLookup0003 begin');
      await delayTick();
      const target = jumpTargetByKey('missing');
      expect(target !== null).assertTrue();
      if (target !== null) {
        expect(target.bundleName).assertEqual('com.samples.not.installed');
        expect(target.abilityName).assertEqual('EntryAbility');
        expect(target.describe()).assertEqual('com.samples.not.installed/EntryAbility');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetLookup0003 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_0400
     * @tc.name      testTargetMissing0004
     * @tc.desc      Verify jump target 'unknown' is not found.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTargetMissing0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetMissing0004 begin');
      await delayTick();
      expect(jumpTargetByKey('unknown') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetMissing0004 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_0500
     * @tc.name      testTargetMissing0005
     * @tc.desc      Verify jump target '' is not found.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTargetMissing0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetMissing0005 begin');
      await delayTick();
      expect(jumpTargetByKey('') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetMissing0005 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_0600
     * @tc.name      testTargetMissing0006
     * @tc.desc      Verify jump target 'SETTINGS' is not found.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTargetMissing0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetMissing0006 begin');
      await delayTick();
      expect(jumpTargetByKey('SETTINGS') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTargetMissing0006 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_0700
     * @tc.name      testJumpStateName0007
     * @tc.desc      Verify jumpStateName(IDLE) returns Idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpStateName0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpStateName0007 begin');
      await delayTick();
      expect(jumpStateName(JumpState.IDLE)).assertEqual('Idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpStateName0007 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_0800
     * @tc.name      testJumpStateName0008
     * @tc.desc      Verify jumpStateName(WAITING) returns Waiting for target.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpStateName0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpStateName0008 begin');
      await delayTick();
      expect(jumpStateName(JumpState.WAITING)).assertEqual('Waiting for target');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpStateName0008 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_0900
     * @tc.name      testJumpStateName0009
     * @tc.desc      Verify jumpStateName(SUCCESS) returns Launched.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpStateName0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpStateName0009 begin');
      await delayTick();
      expect(jumpStateName(JumpState.SUCCESS)).assertEqual('Launched');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpStateName0009 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_1000
     * @tc.name      testJumpStateName0010
     * @tc.desc      Verify jumpStateName(REJECTED) returns Launch rejected.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpStateName0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpStateName0010 begin');
      await delayTick();
      expect(jumpStateName(JumpState.REJECTED)).assertEqual('Launch rejected');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpStateName0010 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_1100
     * @tc.name      testJumpStateName0011
     * @tc.desc      Verify jumpStateName(TIMEOUT) returns Timed out.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpStateName0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpStateName0011 begin');
      await delayTick();
      expect(jumpStateName(JumpState.TIMEOUT)).assertEqual('Timed out');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpStateName0011 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_1200
     * @tc.name      testJumpErrorHint0012
     * @tc.desc      Verify jumpErrorHint(16000001) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpErrorHint0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0012 begin');
      await delayTick();
      expect(jumpErrorHint(16000001)).assertEqual('Target ability not found. Ensure the app is installed and the name is correct.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0012 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_1300
     * @tc.name      testJumpErrorHint0013
     * @tc.desc      Verify jumpErrorHint(16000002) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpErrorHint0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0013 begin');
      await delayTick();
      expect(jumpErrorHint(16000002)).assertEqual('Target ability type mismatch. Check the action and type.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0013 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_1400
     * @tc.name      testJumpErrorHint0014
     * @tc.desc      Verify jumpErrorHint(16000004) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpErrorHint0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0014 begin');
      await delayTick();
      expect(jumpErrorHint(16000004)).assertEqual('Target ability is not visible. Check the visibility configuration.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0014 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_1500
     * @tc.name      testJumpErrorHint0015
     * @tc.desc      Verify jumpErrorHint(16000011) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpErrorHint0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0015 begin');
      await delayTick();
      expect(jumpErrorHint(16000011)).assertEqual('Invalid Want parameters. Check bundleName and abilityName.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0015 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_1600
     * @tc.name      testJumpErrorHint0016
     * @tc.desc      Verify jumpErrorHint(16000019) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpErrorHint0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0016 begin');
      await delayTick();
      expect(jumpErrorHint(16000019)).assertEqual('No matching ability. Ensure the target is installed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0016 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_1700
     * @tc.name      testJumpErrorHint0017
     * @tc.desc      Verify jumpErrorHint(16000050) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpErrorHint0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0017 begin');
      await delayTick();
      expect(jumpErrorHint(16000050)).assertEqual('Internal error. Try again later.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0017 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_1800
     * @tc.name      testJumpErrorHint0018
     * @tc.desc      Verify jumpErrorHint(201) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpErrorHint0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0018 begin');
      await delayTick();
      expect(jumpErrorHint(201)).assertEqual('Missing permission required to launch another app.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0018 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_1900
     * @tc.name      testJumpErrorHint0019
     * @tc.desc      Verify jumpErrorHint(0) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpErrorHint0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0019 begin');
      await delayTick();
      expect(jumpErrorHint(0)).assertEqual('Check the target bundleName and abilityName.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0019 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_2000
     * @tc.name      testJumpErrorHint0020
     * @tc.desc      Verify jumpErrorHint(-1) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpErrorHint0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0020 begin');
      await delayTick();
      expect(jumpErrorHint(-1)).assertEqual('Check the target bundleName and abilityName.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0020 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_2100
     * @tc.name      testJumpErrorHint0021
     * @tc.desc      Verify jumpErrorHint(999) returns the mapped hint.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpErrorHint0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0021 begin');
      await delayTick();
      expect(jumpErrorHint(999)).assertEqual('Check the target bundleName and abilityName.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpErrorHint0021 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_2200
     * @tc.name      testDescribeJumpResult0022
     * @tc.desc      Verify describeJumpResult(0, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDescribeJumpResult0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0022 begin');
      await delayTick();
      expect(describeJumpResult(0, '')).assertEqual('Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0022 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_2300
     * @tc.name      testDescribeJumpResult0023
     * @tc.desc      Verify describeJumpResult(0, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDescribeJumpResult0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0023 begin');
      await delayTick();
      expect(describeJumpResult(0, 'x')).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0023 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_2400
     * @tc.name      testDescribeJumpResult0024
     * @tc.desc      Verify describeJumpResult(1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDescribeJumpResult0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0024 begin');
      await delayTick();
      expect(describeJumpResult(1, '')).assertEqual('[1] Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0024 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_2500
     * @tc.name      testDescribeJumpResult0025
     * @tc.desc      Verify describeJumpResult(1, 'x').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDescribeJumpResult0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0025 begin');
      await delayTick();
      expect(describeJumpResult(1, 'x')).assertEqual('[1] x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0025 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_2600
     * @tc.name      testDescribeJumpResult0026
     * @tc.desc      Verify describeJumpResult(-1, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDescribeJumpResult0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0026 begin');
      await delayTick();
      expect(describeJumpResult(-1, '')).assertEqual('Unknown error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0026 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_2700
     * @tc.name      testDescribeJumpResult0027
     * @tc.desc      Verify describeJumpResult(16000001, '中文').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDescribeJumpResult0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0027 begin');
      await delayTick();
      expect(describeJumpResult(16000001, '中文')).assertEqual('[16000001] 中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDescribeJumpResult0027 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_2800
     * @tc.name      testJumpAttempt0028
     * @tc.desc      Verify beginAttempt(-1) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpAttempt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpAttempt0028 begin');
      await delayTick();
      expect(beginAttempt(-1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpAttempt0028 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_2900
     * @tc.name      testJumpAttempt0029
     * @tc.desc      Verify beginAttempt(0) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpAttempt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpAttempt0029 begin');
      await delayTick();
      expect(beginAttempt(0)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpAttempt0029 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_3000
     * @tc.name      testJumpAttempt0030
     * @tc.desc      Verify beginAttempt(1) returns 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpAttempt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpAttempt0030 begin');
      await delayTick();
      expect(beginAttempt(1)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpAttempt0030 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_3100
     * @tc.name      testJumpAttempt0031
     * @tc.desc      Verify beginAttempt(99) returns 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpAttempt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpAttempt0031 begin');
      await delayTick();
      expect(beginAttempt(99)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpAttempt0031 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_3200
     * @tc.name      testJumpAttempt0032
     * @tc.desc      Verify beginAttempt(1000) returns 1001.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpAttempt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpAttempt0032 begin');
      await delayTick();
      expect(beginAttempt(1000)).assertEqual(1001);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpAttempt0032 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_3300
     * @tc.name      testJumpActive0033
     * @tc.desc      Verify isActiveAttempt(-1, -1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpActive0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0033 begin');
      await delayTick();
      expect(isActiveAttempt(-1, -1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0033 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_3400
     * @tc.name      testJumpActive0034
     * @tc.desc      Verify isActiveAttempt(-1, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpActive0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0034 begin');
      await delayTick();
      expect(isActiveAttempt(-1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0034 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_3500
     * @tc.name      testJumpActive0035
     * @tc.desc      Verify isActiveAttempt(-1, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpActive0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0035 begin');
      await delayTick();
      expect(isActiveAttempt(-1, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0035 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_3600
     * @tc.name      testJumpActive0036
     * @tc.desc      Verify isActiveAttempt(0, -1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpActive0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0036 begin');
      await delayTick();
      expect(isActiveAttempt(0, -1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0036 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_3700
     * @tc.name      testJumpActive0037
     * @tc.desc      Verify isActiveAttempt(0, 0) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpActive0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0037 begin');
      await delayTick();
      expect(isActiveAttempt(0, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0037 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_3800
     * @tc.name      testJumpActive0038
     * @tc.desc      Verify isActiveAttempt(0, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpActive0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0038 begin');
      await delayTick();
      expect(isActiveAttempt(0, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0038 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_3900
     * @tc.name      testJumpActive0039
     * @tc.desc      Verify isActiveAttempt(1, -1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpActive0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0039 begin');
      await delayTick();
      expect(isActiveAttempt(1, -1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0039 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_AJEP1_4000
     * @tc.name      testJumpActive0040
     * @tc.desc      Verify isActiveAttempt(1, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpActive0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0040 begin');
      await delayTick();
      expect(isActiveAttempt(1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0040 end');
    })

  })
}
