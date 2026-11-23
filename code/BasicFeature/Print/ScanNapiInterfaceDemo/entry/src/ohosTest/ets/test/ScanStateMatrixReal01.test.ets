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
import { ScanStateMachine, ScanState, ScanEvent } from '../../../main/ets/scan/model/ScanStateMachine';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanStateMatrixRealTest() {
  describe('ScanStateMatrixReal', () => {
    /**
     * @tc.number SUB_SCAN_STMATRIX_02_0001
     * @tc.name testStateMatrixReal0001
     * @tc.desc the full scan flow ends opened
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateMatrixReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0001 begin');
      let state: ScanState = ScanStateMachine.getInitialState();
      state = ScanStateMachine.next(state, ScanEvent.DISCOVER);
      state = ScanStateMachine.next(state, ScanEvent.DEVICE_FOUND);
      state = ScanStateMachine.next(state, ScanEvent.OPEN);
      state = ScanStateMachine.next(state, ScanEvent.OPEN_SUCCESS);
      state = ScanStateMachine.next(state, ScanEvent.SCAN_START);
      expect(state).assertEqual(ScanState.SCANNING);
      state = ScanStateMachine.next(state, ScanEvent.SCAN_FINISH);
      expect(state).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canClose(state)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0001 end');
    });

    /**
     * @tc.number SUB_SCAN_STMATRIX_02_0002
     * @tc.name testStateMatrixReal0002
     * @tc.desc fail from any state lands error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateMatrixReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0002 begin');
      const failed: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.FAIL);
      expect(failed).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.isTerminal(failed)).assertTrue();
      expect(ScanStateMachine.isRecoverable(failed)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0002 end');
    });

    /**
     * @tc.number SUB_SCAN_STMATRIX_02_0003
     * @tc.name testStateMatrixReal0003
     * @tc.desc the cancel flow returns to opened
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateMatrixReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0003 begin');
      const cancelling: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.CANCEL);
      expect(cancelling).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.isBusy(cancelling)).assertTrue();
      const back: ScanState = ScanStateMachine.next(cancelling, ScanEvent.CANCEL_DONE);
      expect(back).assertEqual(ScanState.OPENED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0003 end');
    });

    /**
     * @tc.number SUB_SCAN_STMATRIX_02_0004
     * @tc.name testStateMatrixReal0004
     * @tc.desc apply ignores illegal events
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateMatrixReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0004 begin');
      const state: ScanState = ScanStateMachine.apply(ScanState.IDLE,
        [ScanEvent.OPEN, ScanEvent.SCAN_START, ScanEvent.DISCOVER]);
      expect(state).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.countApplied(ScanState.IDLE,
        [ScanEvent.OPEN, ScanEvent.SCAN_START, ScanEvent.DISCOVER])).assertEqual(1);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.OPEN)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0004 end');
    });

    /**
     * @tc.number SUB_SCAN_STMATRIX_02_0005
     * @tc.name testStateMatrixReal0005
     * @tc.desc getLabelKey prefixes every state with scan_state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateMatrixReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0005 begin');
      expect(ScanStateMachine.getLabelKey(ScanState.IDLE)).assertEqual('scan_state_idle');
      expect(ScanStateMachine.getLabelKey(ScanState.ERROR)).assertEqual('scan_state_error');
      expect(ScanStateMachine.getLabelKey(ScanState.SCANNING)).assertEqual('scan_state_scanning');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0005 end');
    });

    /**
     * @tc.number SUB_SCAN_STMATRIX_02_0006
     * @tc.name testStateMatrixReal0006
     * @tc.desc countApplied counts only effective events
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateMatrixReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0006 begin');
      const applied: number = ScanStateMachine.countApplied(ScanState.IDLE, [
        ScanEvent.DISCOVER, ScanEvent.DISCOVER, ScanEvent.DEVICE_FOUND
      ]);
      expect(applied).assertEqual(3);
      const missed: number = ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.OPEN, ScanEvent.CLOSE]);
      expect(missed).assertEqual(0);
      expect(ScanStateMachine.canCancel(ScanState.SCANNING)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateMatrixReal0006 end');
    });
  });
}
