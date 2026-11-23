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
import { ScanEvent, ScanState, ScanStateMachine } from '../../../main/ets/scan/model/ScanStateMachine';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

function allStates(): ScanState[] {
  const states: ScanState[] = [
    ScanState.IDLE, ScanState.DISCOVERING, ScanState.DISCOVERED, ScanState.OPENING,
    ScanState.OPENED, ScanState.SCANNING, ScanState.CANCELLING, ScanState.CLOSED, ScanState.ERROR
  ];
  return states;
}

export default function scanStateRealTest() {
  describe('ScanStateReal', () => {
    /**
     * @tc.number SUB_SCAN_STATE_02_0001
     * @tc.name testStateReal0001
     * @tc.desc a fresh session starts idle without any open action
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0001 begin');
      expect(ScanStateMachine.getInitialState()).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.isBusy(ScanState.IDLE)).assertFalse();
      expect(ScanStateMachine.canStartScan(ScanState.IDLE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0001 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0002
     * @tc.name testStateReal0002
     * @tc.desc the happy path reaches scanning in five steps
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0002 begin');
      const events: ScanEvent[] = [ScanEvent.DISCOVER, ScanEvent.DEVICE_FOUND, ScanEvent.OPEN,
        ScanEvent.OPEN_SUCCESS, ScanEvent.SCAN_START];
      const end: ScanState = ScanStateMachine.apply(ScanState.IDLE, events);
      expect(end).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, events)).assertEqual(5);
      expect(ScanStateMachine.isBusy(end)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0002 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0003
     * @tc.name testStateReal0003
     * @tc.desc a full scan session can be closed and ends terminal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0003 begin');
      const events: ScanEvent[] = [ScanEvent.DISCOVER, ScanEvent.DEVICE_FOUND, ScanEvent.OPEN,
        ScanEvent.OPEN_SUCCESS, ScanEvent.SCAN_START, ScanEvent.PROGRESS, ScanEvent.SCAN_FINISH,
        ScanEvent.CLOSE];
      const end: ScanState = ScanStateMachine.apply(ScanState.IDLE, events);
      expect(end).assertEqual(ScanState.CLOSED);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, events)).assertEqual(8);
      expect(ScanStateMachine.isTerminal(end)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0003 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0004
     * @tc.name testStateReal0004
     * @tc.desc countApplied skips events rejected by the current state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0004 begin');
      const events: ScanEvent[] = [ScanEvent.OPEN, ScanEvent.DISCOVER, ScanEvent.CLOSE];
      const end: ScanState = ScanStateMachine.apply(ScanState.IDLE, events);
      expect(end).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, events)).assertEqual(1);
      expect(ScanStateMachine.canClose(end)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0004 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0005
     * @tc.name testStateReal0005
     * @tc.desc failure is accepted from every state and lands on error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0005 begin');
      const states: ScanState[] = allStates();
      for (let index = 0; index < states.length; index++) {
        expect(ScanStateMachine.next(states[index], ScanEvent.FAIL)).assertEqual(ScanState.ERROR);
      }
      expect(ScanStateMachine.isRecoverable(ScanState.ERROR)).assertTrue();
      expect(ScanStateMachine.isTerminal(ScanState.ERROR)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0005 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0006
     * @tc.name testStateReal0006
     * @tc.desc reset brings error and closed sessions back to idle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0006 begin');
      const fromError: ScanState = ScanStateMachine.next(ScanState.ERROR, ScanEvent.RESET);
      const fromClosed: ScanState = ScanStateMachine.next(ScanState.CLOSED, ScanEvent.RESET);
      expect(fromError).assertEqual(ScanState.IDLE);
      expect(fromClosed).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.isBusy(fromError)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0006 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0007
     * @tc.name testStateReal0007
     * @tc.desc long running states are marked busy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0007 begin');
      expect(ScanStateMachine.isBusy(ScanState.OPENING)).assertTrue();
      expect(ScanStateMachine.isBusy(ScanState.SCANNING)).assertTrue();
      expect(ScanStateMachine.isBusy(ScanState.CANCELLING)).assertTrue();
      expect(ScanStateMachine.isBusy(ScanState.OPENED)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0007 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0008
     * @tc.name testStateReal0008
     * @tc.desc idle and discovery states stay interactive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0008 begin');
      const states: ScanState[] = allStates();
      let busyCount: number = 0;
      for (let index = 0; index < states.length; index++) {
        if (ScanStateMachine.isBusy(states[index])) {
          busyCount++;
        }
      }
      expect(busyCount).assertEqual(3);
      expect(ScanStateMachine.isBusy(ScanState.DISCOVERING)).assertFalse();
      expect(ScanStateMachine.isBusy(ScanState.DISCOVERED)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0008 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0009
     * @tc.name testStateReal0009
     * @tc.desc scanning can only start once the device is opened
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0009 begin');
      expect(ScanStateMachine.canStartScan(ScanState.OPENED)).assertTrue();
      expect(ScanStateMachine.canStartScan(ScanState.DISCOVERED)).assertFalse();
      expect(ScanStateMachine.canStartScan(ScanState.SCANNING)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0009 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0010
     * @tc.name testStateReal0010
     * @tc.desc cancel is offered only while scanning
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0010 begin');
      expect(ScanStateMachine.canCancel(ScanState.SCANNING)).assertTrue();
      expect(ScanStateMachine.canCancel(ScanState.OPENED)).assertFalse();
      expect(ScanStateMachine.canCancel(ScanState.CANCELLING)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0010 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0011
     * @tc.name testStateReal0011
     * @tc.desc close is offered for discovered and opened sessions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0011 begin');
      expect(ScanStateMachine.canClose(ScanState.DISCOVERED)).assertTrue();
      expect(ScanStateMachine.canClose(ScanState.OPENED)).assertTrue();
      expect(ScanStateMachine.canClose(ScanState.CLOSED)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0011 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0012
     * @tc.name testStateReal0012
     * @tc.desc cancelling returns to opened when the device confirms
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0012 begin');
      const pending: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.CANCEL);
      const done: ScanState = ScanStateMachine.next(pending, ScanEvent.CANCEL_DONE);
      expect(pending).assertEqual(ScanState.CANCELLING);
      expect(done).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.countApplied(ScanState.SCANNING,
        [ScanEvent.CANCEL, ScanEvent.CANCEL_DONE])).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0012 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0013
     * @tc.name testStateReal0013
     * @tc.desc repeated progress events keep the session scanning
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0013 begin');
      const progress: ScanEvent[] = [ScanEvent.PROGRESS, ScanEvent.PROGRESS, ScanEvent.PROGRESS];
      const end: ScanState = ScanStateMachine.apply(ScanState.SCANNING, progress);
      expect(end).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.countApplied(ScanState.SCANNING, progress)).assertEqual(3);
      expect(ScanStateMachine.canCancel(end)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0013 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0014
     * @tc.name testStateReal0014
     * @tc.desc closing an idle session leaves the state untouched
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0014 begin');
      const end: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.CLOSE);
      expect(end).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.CLOSE)).assertFalse();
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.CLOSE])).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0014 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0015
     * @tc.name testStateReal0015
     * @tc.desc a closed session still turns into error on failure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0015 begin');
      const end: ScanState = ScanStateMachine.next(ScanState.CLOSED, ScanEvent.FAIL);
      expect(end).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.CLOSED, ScanEvent.FAIL)).assertTrue();
      expect(ScanStateMachine.isRecoverable(end)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0015 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0016
     * @tc.name testStateReal0016
     * @tc.desc an errored session ignores close requests
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0016 begin');
      const end: ScanState = ScanStateMachine.next(ScanState.ERROR, ScanEvent.CLOSE);
      expect(end).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canClose(ScanState.ERROR)).assertFalse();
      expect(ScanStateMachine.canTransit(ScanState.ERROR, ScanEvent.CLOSE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0016 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0017
     * @tc.name testStateReal0017
     * @tc.desc an opened session can be reopened for another device
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0017 begin');
      const reopening: ScanState = ScanStateMachine.next(ScanState.OPENED, ScanEvent.OPEN);
      expect(reopening).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.countApplied(ScanState.OPENED, [ScanEvent.OPEN])).assertEqual(1);
      expect(ScanStateMachine.isBusy(reopening)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0017 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0018
     * @tc.name testStateReal0018
     * @tc.desc finishing a scan from the opened state is ignored
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0018 begin');
      const end: ScanState = ScanStateMachine.next(ScanState.OPENED, ScanEvent.SCAN_FINISH);
      expect(end).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(ScanState.OPENED, ScanEvent.SCAN_FINISH)).assertFalse();
      expect(ScanStateMachine.canStartScan(end)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0018 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0019
     * @tc.name testStateReal0019
     * @tc.desc a device found before discovery starts is ignored
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0019 begin');
      const end: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DEVICE_FOUND);
      expect(end).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.DEVICE_FOUND)).assertFalse();
      expect(ScanStateMachine.isBusy(end)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0019 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0020
     * @tc.name testStateReal0020
     * @tc.desc an empty event sequence keeps the state and applies nothing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0020 begin');
      const events: ScanEvent[] = [];
      const end: ScanState = ScanStateMachine.apply(ScanState.DISCOVERED, events);
      expect(end).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERED, events)).assertEqual(0);
      expect(ScanStateMachine.canClose(end)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0020 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0021
     * @tc.name testStateReal0021
     * @tc.desc label keys map one to one onto the state names
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0021 begin');
      expect(ScanStateMachine.getLabelKey(ScanState.OPENING)).assertEqual('scan_state_opening');
      expect(ScanStateMachine.getLabelKey(ScanState.ERROR)).assertEqual('scan_state_error');
      expect(ScanStateMachine.getLabelKey(ScanState.CANCELLING)).assertEqual('scan_state_cancelling');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0021 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0022
     * @tc.name testStateReal0022
     * @tc.desc noisy event streams only count the transitions that fire
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0022 begin');
      const events: ScanEvent[] = [ScanEvent.PROGRESS, ScanEvent.DISCOVER, ScanEvent.DEVICE_FOUND,
        ScanEvent.OPEN, ScanEvent.OPEN_SUCCESS, ScanEvent.DEVICE_FOUND];
      const end: ScanState = ScanStateMachine.apply(ScanState.IDLE, events);
      expect(end).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, events)).assertEqual(4);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, events)).assertEqual(events.length - 2);
      expect(ScanStateMachine.canStartScan(end)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0022 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0023
     * @tc.name testStateReal0023
     * @tc.desc a failure during cancellation lands on error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0023 begin');
      const events: ScanEvent[] = [ScanEvent.CANCEL, ScanEvent.FAIL];
      const end: ScanState = ScanStateMachine.apply(ScanState.SCANNING, events);
      expect(end).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.countApplied(ScanState.SCANNING, events)).assertEqual(2);
      expect(ScanStateMachine.isTerminal(end)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0023 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0024
     * @tc.name testStateReal0024
     * @tc.desc progress before a scan starts is ignored
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0024 begin');
      const end: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.PROGRESS);
      expect(end).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.PROGRESS)).assertFalse();
      expect(ScanStateMachine.getLabelKey(end)).assertEqual('scan_state_idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0024 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0025
     * @tc.name testStateReal0025
     * @tc.desc a discovered device can be closed before opening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0025 begin');
      const end: ScanState = ScanStateMachine.next(ScanState.DISCOVERED, ScanEvent.CLOSE);
      expect(end).assertEqual(ScanState.CLOSED);
      expect(ScanStateMachine.isTerminal(end)).assertTrue();
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERED, [ScanEvent.CLOSE])).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0025 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0026
     * @tc.name testStateReal0026
     * @tc.desc terminal states are never busy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0026 begin');
      expect(ScanStateMachine.isBusy(ScanState.CLOSED)).assertFalse();
      expect(ScanStateMachine.isBusy(ScanState.ERROR)).assertFalse();
      expect(ScanStateMachine.isTerminal(ScanState.CANCELLING)).assertFalse();
      expect(ScanStateMachine.isTerminal(ScanState.OPENED)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0026 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0027
     * @tc.name testStateReal0027
     * @tc.desc only the error state can be recovered
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0027 begin');
      expect(ScanStateMachine.isRecoverable(ScanState.ERROR)).assertTrue();
      expect(ScanStateMachine.isRecoverable(ScanState.CLOSED)).assertFalse();
      expect(ScanStateMachine.isRecoverable(ScanState.IDLE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0027 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0028
     * @tc.name testStateReal0028
     * @tc.desc a scan run returns to opened after finishing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0028 begin');
      const events: ScanEvent[] = [ScanEvent.SCAN_START, ScanEvent.PROGRESS, ScanEvent.PROGRESS,
        ScanEvent.SCAN_FINISH];
      const end: ScanState = ScanStateMachine.apply(ScanState.OPENED, events);
      expect(end).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.countApplied(ScanState.OPENED, events)).assertEqual(4);
      expect(ScanStateMachine.canClose(end)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0028 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0029
     * @tc.name testStateReal0029
     * @tc.desc cancelled scans stay open and can be started again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0029 begin');
      const end: ScanState = ScanStateMachine.apply(ScanState.SCANNING,
        [ScanEvent.CANCEL, ScanEvent.CANCEL_DONE]);
      expect(end).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canStartScan(end)).assertTrue();
      expect(ScanStateMachine.canCancel(end)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0029 end');
    });

    /**
     * @tc.number SUB_SCAN_STATE_02_0030
     * @tc.name testStateReal0030
     * @tc.desc nine events take a session from idle back to idle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testStateReal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0030 begin');
      const events: ScanEvent[] = [ScanEvent.DISCOVER, ScanEvent.DEVICE_FOUND, ScanEvent.OPEN,
        ScanEvent.OPEN_SUCCESS, ScanEvent.SCAN_START, ScanEvent.CANCEL, ScanEvent.CANCEL_DONE,
        ScanEvent.CLOSE, ScanEvent.RESET];
      const end: ScanState = ScanStateMachine.apply(ScanState.IDLE, events);
      expect(end).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, events)).assertEqual(9);
      expect(ScanStateMachine.isTerminal(end)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateReal0030 end');
    });
  });
}
