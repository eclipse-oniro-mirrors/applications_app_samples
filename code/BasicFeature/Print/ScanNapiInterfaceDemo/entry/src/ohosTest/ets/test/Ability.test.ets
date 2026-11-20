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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SampleLogger } from '../../../main/ets/scan/utils/SampleLogger';
import {
  ScanEvent, ScanState, ScanStateMachine
} from '../../../main/ets/scan/model/ScanStateMachine';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function abilityTest() {
  describe('ScanFoundationTest', () => {
    /**
     * @tc.number SUB_SCAN_SMOKE_0101
     * @tc.name testAbilitySmoke0001
     * @tc.desc the shared logger pins the sample domain and tag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testAbilitySmoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilitySmoke0001 begin');
      expect(SampleLogger.getDomain()).assertEqual(0xF811);
      expect(SampleLogger.getTag()).assertEqual('[Sample_ScanNapiInterfaceDemo]');
      expect(SampleLogger.normalize('')).assertEqual('empty message');
      expect(SampleLogger.normalize('ready')).assertEqual('ready');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilitySmoke0001 end');
    });

    /**
     * @tc.number SUB_SCAN_SMOKE_0102
     * @tc.name testAbilitySmoke0002
     * @tc.desc a fresh state machine starts idle and rejects scanning before open
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testAbilitySmoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilitySmoke0002 begin');
      expect(ScanStateMachine.getInitialState()).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canStartScan(ScanState.IDLE)).assertFalse();
      expect(ScanStateMachine.isBusy(ScanState.IDLE)).assertFalse();
      expect(ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER)).assertEqual(ScanState.DISCOVERING);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilitySmoke0002 end');
    });

    /**
     * @tc.number SUB_SCAN_SMOKE_0103
     * @tc.name testAbilitySmoke0003
     * @tc.desc label keys stay stable for resource binding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testAbilitySmoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilitySmoke0003 begin');
      expect(ScanStateMachine.getLabelKey(ScanState.IDLE)).assertEqual('scan_state_idle');
      expect(ScanStateMachine.getLabelKey(ScanState.SCANNING)).assertEqual('scan_state_scanning');
      expect(ScanStateMachine.isTerminal(ScanState.CLOSED)).assertTrue();
      expect(ScanStateMachine.isRecoverable(ScanState.ERROR)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilitySmoke0003 end');
    });
  });
}
