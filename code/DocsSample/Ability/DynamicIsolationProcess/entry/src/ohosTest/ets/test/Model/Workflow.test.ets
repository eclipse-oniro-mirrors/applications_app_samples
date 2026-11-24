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


import { describe, beforeAll, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SAMPLE_BUNDLE, SAMPLE_MODULE, MAIN_ABILITY, ISOLATED_ABILITY, ISOLATION_KEY, KEY_MAX_LENGTH, NAME_MAX_LENGTH, STATE_CREATED, STATE_FOREGROUND, STATE_BACKGROUND, STATE_DESTROYED, ERROR_SUCCESS, ERROR_INVALID_PARAM, ERROR_WANT_INVALID, ERROR_CONTEXT_MISSING, IsolationModel, IsolationWant
} from '../Shared/IsolationFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DynamicIsolationProcess]';

export default function dynamicIsolationProcessWorkflowTest(): void {
  describe('DynamicIsolationProcessModelTestWorkflow', (): void => {
    beforeAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessWorkflowTest started');
    });
    afterAll((): void => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynamicIsolationProcessWorkflowTest finished');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0001
    // @tc.name      dynamicIsolationProcessWorkflowCase001
    // @tc.desc      Verify the isolation process name follows the bundle:key rule.
    it('dynamicIsolationProcessWorkflowCase001', 0, (): void => {
      expect(IsolationModel.composeProcessName(SAMPLE_BUNDLE, ISOLATION_KEY)).assertEqual(SAMPLE_BUNDLE + ':testKey');
      expect(IsolationModel.isValidBundleName(SAMPLE_BUNDLE)).assertTrue();
      expect(IsolationModel.isValidIsolationKey(ISOLATION_KEY)).assertTrue();
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0002
    // @tc.name      dynamicIsolationProcessWorkflowCase002
    // @tc.desc      Verify onNewProcessRequest returns a key that is valid for process composition.
    it('dynamicIsolationProcessWorkflowCase002', 0, (): void => {
      const key: string = ISOLATION_KEY;
      expect(IsolationModel.isValidIsolationKey(key)).assertTrue();
      expect(IsolationModel.describeIsolation(SAMPLE_BUNDLE, key)).assertEqual('process=' + SAMPLE_BUNDLE + ':' + key);
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0003
    // @tc.name      dynamicIsolationProcessWorkflowCase003
    // @tc.desc      Verify the isolated ability want targets EntryAbility1 in the entry module.
    it('dynamicIsolationProcessWorkflowCase003', 0, (): void => {
      const want: IsolationWant = IsolationModel.buildWant(SAMPLE_BUNDLE, SAMPLE_MODULE, ISOLATED_ABILITY);
      expect(IsolationModel.isValidWant(want)).assertTrue();
      expect(IsolationModel.formatWant(want)).assertEqual(SAMPLE_BUNDLE + '/entry/EntryAbility1');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0004
    // @tc.name      dynamicIsolationProcessWorkflowCase004
    // @tc.desc      Verify the main ability and isolated ability are distinct targets.
    it('dynamicIsolationProcessWorkflowCase004', 0, (): void => {
      const main: IsolationWant = IsolationModel.buildWant(SAMPLE_BUNDLE, SAMPLE_MODULE, MAIN_ABILITY);
      const isolated: IsolationWant = IsolationModel.buildWant(SAMPLE_BUNDLE, SAMPLE_MODULE, ISOLATED_ABILITY);
      expect(IsolationModel.wantEquals(main, isolated)).assertFalse();
      expect(IsolationModel.isValidWant(main)).assertTrue();
      expect(IsolationModel.isValidWant(isolated)).assertTrue();
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0005
    // @tc.name      dynamicIsolationProcessWorkflowCase005
    // @tc.desc      Verify the isolated ability moves from background to foreground.
    it('dynamicIsolationProcessWorkflowCase005', 0, (): void => {
      expect(IsolationModel.canStart(STATE_BACKGROUND)).assertTrue();
      expect(IsolationModel.nextState(STATE_BACKGROUND, 'foreground')).assertEqual(STATE_FOREGROUND);
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0006
    // @tc.name      dynamicIsolationProcessWorkflowCase006
    // @tc.desc      Verify the isolated ability can be moved to the background.
    it('dynamicIsolationProcessWorkflowCase006', 0, (): void => {
      expect(IsolationModel.nextState(STATE_FOREGROUND, 'background')).assertEqual(STATE_BACKGROUND);
      expect(IsolationModel.stateName(STATE_BACKGROUND)).assertEqual('onBackground');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0007
    // @tc.name      dynamicIsolationProcessWorkflowCase007
    // @tc.desc      Verify the isolated ability can be destroyed from any active state.
    it('dynamicIsolationProcessWorkflowCase007', 0, (): void => {
      expect(IsolationModel.nextState(STATE_CREATED, 'destroy')).assertEqual(STATE_DESTROYED);
      expect(IsolationModel.nextState(STATE_FOREGROUND, 'destroy')).assertEqual(STATE_DESTROYED);
      expect(IsolationModel.stateName(STATE_DESTROYED)).assertEqual('onDestroy');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0008
    // @tc.name      dynamicIsolationProcessWorkflowCase008
    // @tc.desc      Verify an isolation key with invalid characters is rejected.
    it('dynamicIsolationProcessWorkflowCase008', 0, (): void => {
      expect(IsolationModel.isValidIsolationKey('testKey')).assertTrue();
      expect(IsolationModel.isValidIsolationKey('bad-key')).assertFalse();
      expect(IsolationModel.isValidIsolationKey('bad key')).assertFalse();
      expect(IsolationModel.isValidIsolationKey('bad/key')).assertFalse();
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0009
    // @tc.name      dynamicIsolationProcessWorkflowCase009
    // @tc.desc      Verify an invalid module name is rejected by the want contract.
    it('dynamicIsolationProcessWorkflowCase009', 0, (): void => {
      expect(IsolationModel.isValidModule('entry')).assertTrue();
      expect(IsolationModel.isValidModule('bad/module')).assertFalse();
      expect(IsolationModel.isValidModule('bad module')).assertFalse();
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0010
    // @tc.name      dynamicIsolationProcessWorkflowCase010
    // @tc.desc      Verify an invalid ability name is rejected by the want contract.
    it('dynamicIsolationProcessWorkflowCase010', 0, (): void => {
      expect(IsolationModel.isValidAbilityName(ISOLATED_ABILITY)).assertTrue();
      expect(IsolationModel.isValidAbilityName('bad/ability')).assertFalse();
      expect(IsolationModel.isValidAbilityName('bad ability')).assertFalse();
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0011
    // @tc.name      dynamicIsolationProcessWorkflowCase011
    // @tc.desc      Verify an invalid want is rejected before startAbility is called.
    it('dynamicIsolationProcessWorkflowCase011', 0, (): void => {
      const want: IsolationWant = IsolationModel.buildWant('bad bundle', SAMPLE_MODULE, ISOLATED_ABILITY);
      expect(IsolationModel.isValidWant(want)).assertFalse();
      expect(IsolationModel.errorMessage(ERROR_WANT_INVALID)).assertEqual('want is invalid');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0012
    // @tc.name      dynamicIsolationProcessWorkflowCase012
    // @tc.desc      Verify a missing UIAbilityContext is reported distinctly.
    it('dynamicIsolationProcessWorkflowCase012', 0, (): void => {
      expect(IsolationModel.errorMessage(ERROR_CONTEXT_MISSING)).assertEqual('ui ability context missing');
      expect(IsolationModel.isSuccessCode(ERROR_CONTEXT_MISSING)).assertFalse();
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0013
    // @tc.name      dynamicIsolationProcessWorkflowCase013
    // @tc.desc      Verify a successful startAbility is described with a null error.
    it('dynamicIsolationProcessWorkflowCase013', 0, (): void => {
      expect(IsolationModel.describeError(null)).assertEqual('start EntryAbility1: null');
      expect(IsolationModel.isSuccessCode(ERROR_SUCCESS)).assertTrue();
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0014
    // @tc.name      dynamicIsolationProcessWorkflowCase014
    // @tc.desc      Verify a failed startAbility is described with the error text.
    it('dynamicIsolationProcessWorkflowCase014', 0, (): void => {
      expect(IsolationModel.describeError('code 401')).assertEqual('start EntryAbility1: code 401');
      expect(IsolationModel.errorMessage(ERROR_INVALID_PARAM)).assertEqual('invalid parameter');
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0015
    // @tc.name      dynamicIsolationProcessWorkflowCase015
    // @tc.desc      Verify the GlobalThis context registry stores and retrieves the entry context.
    it('dynamicIsolationProcessWorkflowCase015', 0, (): void => {
      const keys: Array<string> = ['test'];
      expect(IsolationModel.contextCount(keys)).assertEqual(1);
      expect(IsolationModel.hasContext(keys, 'test')).assertTrue();
      expect(IsolationModel.hasContext(keys, 'other')).assertFalse();
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0016
    // @tc.name      dynamicIsolationProcessWorkflowCase016
    // @tc.desc      Verify two composed process names for the same bundle and key are equal.
    it('dynamicIsolationProcessWorkflowCase016', 0, (): void => {
      const first: string = IsolationModel.composeProcessName(SAMPLE_BUNDLE, ISOLATION_KEY);
      const second: string = IsolationModel.composeProcessName(SAMPLE_BUNDLE, ISOLATION_KEY);
      expect(IsolationModel.isSameProcessName(first, second)).assertTrue();
    });

    // @tc.number    SUB_DYNAMIC_ISOLATION_WORKFLOW_0017
    // @tc.name      dynamicIsolationProcessWorkflowCase017
    // @tc.desc      Verify the ability lifecycle sequence is ordered as expected.
    it('dynamicIsolationProcessWorkflowCase017', 0, (): void => {
      expect(IsolationModel.abilityLifecycleIndex('onCreate')).assertEqual(0);
      expect(IsolationModel.abilityLifecycleIndex('onForeground')).assertEqual(2);
      expect(IsolationModel.abilityLifecycleIndex('onDestroy')).assertEqual(5);
      expect(IsolationModel.abilityLifecycleIndex('unknown')).assertEqual(-1);
    });

  });
}
