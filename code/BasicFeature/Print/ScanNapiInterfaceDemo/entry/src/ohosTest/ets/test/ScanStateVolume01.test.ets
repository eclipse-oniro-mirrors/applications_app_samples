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
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanStateTransitionTest() {
  describe('ScanStateTransition', () => {

    /**
     * @tc.name   testStateNext0001
     * @tc.number SUB_SCAN_STATE_01_0001
     * @tc.desc   idle handles discover and ends in discovering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0001 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.DISCOVER;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0001 end');
    });

    /**
     * @tc.name   testStateNext0002
     * @tc.number SUB_SCAN_STATE_01_0002
     * @tc.desc   idle handles deviceFound and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0002 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.DEVICE_FOUND;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0002 end');
    });

    /**
     * @tc.name   testStateNext0003
     * @tc.number SUB_SCAN_STATE_01_0003
     * @tc.desc   idle handles open and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0003 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.OPEN;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0003 end');
    });

    /**
     * @tc.name   testStateNext0004
     * @tc.number SUB_SCAN_STATE_01_0004
     * @tc.desc   idle handles openSuccess and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0004 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.OPEN_SUCCESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0004 end');
    });

    /**
     * @tc.name   testStateNext0005
     * @tc.number SUB_SCAN_STATE_01_0005
     * @tc.desc   idle handles scanStart and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0005 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.SCAN_START;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0005 end');
    });

    /**
     * @tc.name   testStateNext0006
     * @tc.number SUB_SCAN_STATE_01_0006
     * @tc.desc   idle handles progress and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0006 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.PROGRESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0006 end');
    });

    /**
     * @tc.name   testStateNext0007
     * @tc.number SUB_SCAN_STATE_01_0007
     * @tc.desc   idle handles scanFinish and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0007 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.SCAN_FINISH;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0007 end');
    });

    /**
     * @tc.name   testStateNext0008
     * @tc.number SUB_SCAN_STATE_01_0008
     * @tc.desc   idle handles cancel and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0008 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.CANCEL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0008 end');
    });

    /**
     * @tc.name   testStateNext0009
     * @tc.number SUB_SCAN_STATE_01_0009
     * @tc.desc   idle handles cancelDone and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0009 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.CANCEL_DONE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0009 end');
    });

    /**
     * @tc.name   testStateNext0010
     * @tc.number SUB_SCAN_STATE_01_0010
     * @tc.desc   idle handles close and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0010 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.CLOSE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0010 end');
    });

    /**
     * @tc.name   testStateNext0011
     * @tc.number SUB_SCAN_STATE_01_0011
     * @tc.desc   idle handles fail and ends in error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0011 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.FAIL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0011 end');
    });

    /**
     * @tc.name   testStateNext0012
     * @tc.number SUB_SCAN_STATE_01_0012
     * @tc.desc   idle handles reset and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0012 begin');
      const state: ScanState = ScanState.IDLE;
      const event: ScanEvent = ScanEvent.RESET;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0012 end');
    });

    /**
     * @tc.name   testStateNext0013
     * @tc.number SUB_SCAN_STATE_01_0013
     * @tc.desc   discovering handles discover and ends in discovering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0013 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.DISCOVER;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0013 end');
    });

    /**
     * @tc.name   testStateNext0014
     * @tc.number SUB_SCAN_STATE_01_0014
     * @tc.desc   discovering handles deviceFound and ends in discovered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0014 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.DEVICE_FOUND;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0014 end');
    });

    /**
     * @tc.name   testStateNext0015
     * @tc.number SUB_SCAN_STATE_01_0015
     * @tc.desc   discovering handles open and ends in discovering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0015 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.OPEN;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0015 end');
    });

    /**
     * @tc.name   testStateNext0016
     * @tc.number SUB_SCAN_STATE_01_0016
     * @tc.desc   discovering handles openSuccess and ends in discovering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0016 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.OPEN_SUCCESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0016 end');
    });

    /**
     * @tc.name   testStateNext0017
     * @tc.number SUB_SCAN_STATE_01_0017
     * @tc.desc   discovering handles scanStart and ends in discovering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0017 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.SCAN_START;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0017 end');
    });

    /**
     * @tc.name   testStateNext0018
     * @tc.number SUB_SCAN_STATE_01_0018
     * @tc.desc   discovering handles progress and ends in discovering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0018 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.PROGRESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0018 end');
    });

    /**
     * @tc.name   testStateNext0019
     * @tc.number SUB_SCAN_STATE_01_0019
     * @tc.desc   discovering handles scanFinish and ends in discovering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0019 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.SCAN_FINISH;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0019 end');
    });

    /**
     * @tc.name   testStateNext0020
     * @tc.number SUB_SCAN_STATE_01_0020
     * @tc.desc   discovering handles cancel and ends in discovering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0020 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.CANCEL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0020 end');
    });

    /**
     * @tc.name   testStateNext0021
     * @tc.number SUB_SCAN_STATE_01_0021
     * @tc.desc   discovering handles cancelDone and ends in discovering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0021 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.CANCEL_DONE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0021 end');
    });

    /**
     * @tc.name   testStateNext0022
     * @tc.number SUB_SCAN_STATE_01_0022
     * @tc.desc   discovering handles close and ends in discovering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0022 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.CLOSE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0022 end');
    });

    /**
     * @tc.name   testStateNext0023
     * @tc.number SUB_SCAN_STATE_01_0023
     * @tc.desc   discovering handles fail and ends in error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0023 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.FAIL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0023 end');
    });

    /**
     * @tc.name   testStateNext0024
     * @tc.number SUB_SCAN_STATE_01_0024
     * @tc.desc   discovering handles reset and ends in discovering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0024 begin');
      const state: ScanState = ScanState.DISCOVERING;
      const event: ScanEvent = ScanEvent.RESET;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0024 end');
    });

    /**
     * @tc.name   testStateNext0025
     * @tc.number SUB_SCAN_STATE_01_0025
     * @tc.desc   discovered handles discover and ends in discovered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0025 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.DISCOVER;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0025 end');
    });

    /**
     * @tc.name   testStateNext0026
     * @tc.number SUB_SCAN_STATE_01_0026
     * @tc.desc   discovered handles deviceFound and ends in discovered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0026 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.DEVICE_FOUND;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0026 end');
    });

    /**
     * @tc.name   testStateNext0027
     * @tc.number SUB_SCAN_STATE_01_0027
     * @tc.desc   discovered handles open and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0027 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.OPEN;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0027 end');
    });

    /**
     * @tc.name   testStateNext0028
     * @tc.number SUB_SCAN_STATE_01_0028
     * @tc.desc   discovered handles openSuccess and ends in discovered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0028 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.OPEN_SUCCESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0028 end');
    });

    /**
     * @tc.name   testStateNext0029
     * @tc.number SUB_SCAN_STATE_01_0029
     * @tc.desc   discovered handles scanStart and ends in discovered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0029 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.SCAN_START;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0029 end');
    });

    /**
     * @tc.name   testStateNext0030
     * @tc.number SUB_SCAN_STATE_01_0030
     * @tc.desc   discovered handles progress and ends in discovered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0030 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.PROGRESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0030 end');
    });

    /**
     * @tc.name   testStateNext0031
     * @tc.number SUB_SCAN_STATE_01_0031
     * @tc.desc   discovered handles scanFinish and ends in discovered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0031 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.SCAN_FINISH;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0031 end');
    });

    /**
     * @tc.name   testStateNext0032
     * @tc.number SUB_SCAN_STATE_01_0032
     * @tc.desc   discovered handles cancel and ends in discovered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0032 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.CANCEL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0032 end');
    });

    /**
     * @tc.name   testStateNext0033
     * @tc.number SUB_SCAN_STATE_01_0033
     * @tc.desc   discovered handles cancelDone and ends in discovered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0033 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.CANCEL_DONE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0033 end');
    });

    /**
     * @tc.name   testStateNext0034
     * @tc.number SUB_SCAN_STATE_01_0034
     * @tc.desc   discovered handles close and ends in closed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0034 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.CLOSE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CLOSED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0034 end');
    });

    /**
     * @tc.name   testStateNext0035
     * @tc.number SUB_SCAN_STATE_01_0035
     * @tc.desc   discovered handles fail and ends in error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0035 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.FAIL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0035 end');
    });

    /**
     * @tc.name   testStateNext0036
     * @tc.number SUB_SCAN_STATE_01_0036
     * @tc.desc   discovered handles reset and ends in discovered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0036 begin');
      const state: ScanState = ScanState.DISCOVERED;
      const event: ScanEvent = ScanEvent.RESET;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0036 end');
    });

    /**
     * @tc.name   testStateNext0037
     * @tc.number SUB_SCAN_STATE_01_0037
     * @tc.desc   opening handles discover and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0037 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.DISCOVER;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0037 end');
    });

    /**
     * @tc.name   testStateNext0038
     * @tc.number SUB_SCAN_STATE_01_0038
     * @tc.desc   opening handles deviceFound and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0038 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.DEVICE_FOUND;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0038 end');
    });

    /**
     * @tc.name   testStateNext0039
     * @tc.number SUB_SCAN_STATE_01_0039
     * @tc.desc   opening handles open and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0039 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.OPEN;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0039 end');
    });

    /**
     * @tc.name   testStateNext0040
     * @tc.number SUB_SCAN_STATE_01_0040
     * @tc.desc   opening handles openSuccess and ends in opened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0040 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.OPEN_SUCCESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0040 end');
    });

    /**
     * @tc.name   testStateNext0041
     * @tc.number SUB_SCAN_STATE_01_0041
     * @tc.desc   opening handles scanStart and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0041 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.SCAN_START;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0041 end');
    });

    /**
     * @tc.name   testStateNext0042
     * @tc.number SUB_SCAN_STATE_01_0042
     * @tc.desc   opening handles progress and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0042 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.PROGRESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0042 end');
    });

    /**
     * @tc.name   testStateNext0043
     * @tc.number SUB_SCAN_STATE_01_0043
     * @tc.desc   opening handles scanFinish and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0043 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.SCAN_FINISH;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0043 end');
    });

    /**
     * @tc.name   testStateNext0044
     * @tc.number SUB_SCAN_STATE_01_0044
     * @tc.desc   opening handles cancel and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0044 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.CANCEL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0044 end');
    });

    /**
     * @tc.name   testStateNext0045
     * @tc.number SUB_SCAN_STATE_01_0045
     * @tc.desc   opening handles cancelDone and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0045 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.CANCEL_DONE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0045 end');
    });

    /**
     * @tc.name   testStateNext0046
     * @tc.number SUB_SCAN_STATE_01_0046
     * @tc.desc   opening handles close and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0046 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.CLOSE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0046 end');
    });

    /**
     * @tc.name   testStateNext0047
     * @tc.number SUB_SCAN_STATE_01_0047
     * @tc.desc   opening handles fail and ends in error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0047 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.FAIL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0047 end');
    });

    /**
     * @tc.name   testStateNext0048
     * @tc.number SUB_SCAN_STATE_01_0048
     * @tc.desc   opening handles reset and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0048 begin');
      const state: ScanState = ScanState.OPENING;
      const event: ScanEvent = ScanEvent.RESET;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0048 end');
    });

    /**
     * @tc.name   testStateNext0049
     * @tc.number SUB_SCAN_STATE_01_0049
     * @tc.desc   opened handles discover and ends in opened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0049 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.DISCOVER;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0049 end');
    });

    /**
     * @tc.name   testStateNext0050
     * @tc.number SUB_SCAN_STATE_01_0050
     * @tc.desc   opened handles deviceFound and ends in opened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0050 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.DEVICE_FOUND;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0050 end');
    });

    /**
     * @tc.name   testStateNext0051
     * @tc.number SUB_SCAN_STATE_01_0051
     * @tc.desc   opened handles open and ends in opening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0051 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.OPEN;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0051 end');
    });

    /**
     * @tc.name   testStateNext0052
     * @tc.number SUB_SCAN_STATE_01_0052
     * @tc.desc   opened handles openSuccess and ends in opened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0052 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.OPEN_SUCCESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0052 end');
    });

    /**
     * @tc.name   testStateNext0053
     * @tc.number SUB_SCAN_STATE_01_0053
     * @tc.desc   opened handles scanStart and ends in scanning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0053 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.SCAN_START;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0053 end');
    });

    /**
     * @tc.name   testStateNext0054
     * @tc.number SUB_SCAN_STATE_01_0054
     * @tc.desc   opened handles progress and ends in opened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0054 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.PROGRESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0054 end');
    });

    /**
     * @tc.name   testStateNext0055
     * @tc.number SUB_SCAN_STATE_01_0055
     * @tc.desc   opened handles scanFinish and ends in opened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0055 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.SCAN_FINISH;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0055 end');
    });

    /**
     * @tc.name   testStateNext0056
     * @tc.number SUB_SCAN_STATE_01_0056
     * @tc.desc   opened handles cancel and ends in opened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0056 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.CANCEL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0056 end');
    });

    /**
     * @tc.name   testStateNext0057
     * @tc.number SUB_SCAN_STATE_01_0057
     * @tc.desc   opened handles cancelDone and ends in opened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0057 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.CANCEL_DONE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0057 end');
    });

    /**
     * @tc.name   testStateNext0058
     * @tc.number SUB_SCAN_STATE_01_0058
     * @tc.desc   opened handles close and ends in closed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0058 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.CLOSE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CLOSED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0058 end');
    });

    /**
     * @tc.name   testStateNext0059
     * @tc.number SUB_SCAN_STATE_01_0059
     * @tc.desc   opened handles fail and ends in error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0059 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.FAIL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0059 end');
    });

    /**
     * @tc.name   testStateNext0060
     * @tc.number SUB_SCAN_STATE_01_0060
     * @tc.desc   opened handles reset and ends in opened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0060 begin');
      const state: ScanState = ScanState.OPENED;
      const event: ScanEvent = ScanEvent.RESET;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0060 end');
    });

    /**
     * @tc.name   testStateNext0061
     * @tc.number SUB_SCAN_STATE_01_0061
     * @tc.desc   scanning handles discover and ends in scanning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0061 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.DISCOVER;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0061 end');
    });

    /**
     * @tc.name   testStateNext0062
     * @tc.number SUB_SCAN_STATE_01_0062
     * @tc.desc   scanning handles deviceFound and ends in scanning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0062 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.DEVICE_FOUND;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0062 end');
    });

    /**
     * @tc.name   testStateNext0063
     * @tc.number SUB_SCAN_STATE_01_0063
     * @tc.desc   scanning handles open and ends in scanning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0063 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.OPEN;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0063 end');
    });

    /**
     * @tc.name   testStateNext0064
     * @tc.number SUB_SCAN_STATE_01_0064
     * @tc.desc   scanning handles openSuccess and ends in scanning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0064 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.OPEN_SUCCESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0064 end');
    });

    /**
     * @tc.name   testStateNext0065
     * @tc.number SUB_SCAN_STATE_01_0065
     * @tc.desc   scanning handles scanStart and ends in scanning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0065 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.SCAN_START;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0065 end');
    });

    /**
     * @tc.name   testStateNext0066
     * @tc.number SUB_SCAN_STATE_01_0066
     * @tc.desc   scanning handles progress and ends in scanning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0066 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.PROGRESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0066 end');
    });

    /**
     * @tc.name   testStateNext0067
     * @tc.number SUB_SCAN_STATE_01_0067
     * @tc.desc   scanning handles scanFinish and ends in opened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0067 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.SCAN_FINISH;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0067 end');
    });

    /**
     * @tc.name   testStateNext0068
     * @tc.number SUB_SCAN_STATE_01_0068
     * @tc.desc   scanning handles cancel and ends in cancelling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0068 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.CANCEL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0068 end');
    });

    /**
     * @tc.name   testStateNext0069
     * @tc.number SUB_SCAN_STATE_01_0069
     * @tc.desc   scanning handles cancelDone and ends in scanning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0069 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.CANCEL_DONE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0069 end');
    });

    /**
     * @tc.name   testStateNext0070
     * @tc.number SUB_SCAN_STATE_01_0070
     * @tc.desc   scanning handles close and ends in scanning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0070 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.CLOSE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0070 end');
    });

    /**
     * @tc.name   testStateNext0071
     * @tc.number SUB_SCAN_STATE_01_0071
     * @tc.desc   scanning handles fail and ends in error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0071 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.FAIL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0071 end');
    });

    /**
     * @tc.name   testStateNext0072
     * @tc.number SUB_SCAN_STATE_01_0072
     * @tc.desc   scanning handles reset and ends in scanning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0072 begin');
      const state: ScanState = ScanState.SCANNING;
      const event: ScanEvent = ScanEvent.RESET;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0072 end');
    });

    /**
     * @tc.name   testStateNext0073
     * @tc.number SUB_SCAN_STATE_01_0073
     * @tc.desc   cancelling handles discover and ends in cancelling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0073 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.DISCOVER;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0073 end');
    });

    /**
     * @tc.name   testStateNext0074
     * @tc.number SUB_SCAN_STATE_01_0074
     * @tc.desc   cancelling handles deviceFound and ends in cancelling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0074 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.DEVICE_FOUND;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0074 end');
    });

    /**
     * @tc.name   testStateNext0075
     * @tc.number SUB_SCAN_STATE_01_0075
     * @tc.desc   cancelling handles open and ends in cancelling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0075 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.OPEN;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0075 end');
    });

    /**
     * @tc.name   testStateNext0076
     * @tc.number SUB_SCAN_STATE_01_0076
     * @tc.desc   cancelling handles openSuccess and ends in cancelling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0076 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.OPEN_SUCCESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0076 end');
    });

    /**
     * @tc.name   testStateNext0077
     * @tc.number SUB_SCAN_STATE_01_0077
     * @tc.desc   cancelling handles scanStart and ends in cancelling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0077 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.SCAN_START;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0077 end');
    });

    /**
     * @tc.name   testStateNext0078
     * @tc.number SUB_SCAN_STATE_01_0078
     * @tc.desc   cancelling handles progress and ends in cancelling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0078 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.PROGRESS;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0078 end');
    });

    /**
     * @tc.name   testStateNext0079
     * @tc.number SUB_SCAN_STATE_01_0079
     * @tc.desc   cancelling handles scanFinish and ends in cancelling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0079 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.SCAN_FINISH;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0079 end');
    });

    /**
     * @tc.name   testStateNext0080
     * @tc.number SUB_SCAN_STATE_01_0080
     * @tc.desc   cancelling handles cancel and ends in cancelling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0080 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.CANCEL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0080 end');
    });

    /**
     * @tc.name   testStateNext0081
     * @tc.number SUB_SCAN_STATE_01_0081
     * @tc.desc   cancelling handles cancelDone and ends in opened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0081 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.CANCEL_DONE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0081 end');
    });

    /**
     * @tc.name   testStateNext0082
     * @tc.number SUB_SCAN_STATE_01_0082
     * @tc.desc   cancelling handles close and ends in cancelling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0082 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.CLOSE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0082 end');
    });

    /**
     * @tc.name   testStateNext0083
     * @tc.number SUB_SCAN_STATE_01_0083
     * @tc.desc   cancelling handles fail and ends in error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0083 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.FAIL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0083 end');
    });

    /**
     * @tc.name   testStateNext0084
     * @tc.number SUB_SCAN_STATE_01_0084
     * @tc.desc   cancelling handles reset and ends in cancelling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0084 begin');
      const state: ScanState = ScanState.CANCELLING;
      const event: ScanEvent = ScanEvent.RESET;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0084 end');
    });

    /**
     * @tc.name   testStateNext0085
     * @tc.number SUB_SCAN_STATE_01_0085
     * @tc.desc   closed handles close and ends in closed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0085 begin');
      const state: ScanState = ScanState.CLOSED;
      const event: ScanEvent = ScanEvent.CLOSE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.CLOSED);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0085 end');
    });

    /**
     * @tc.name   testStateNext0086
     * @tc.number SUB_SCAN_STATE_01_0086
     * @tc.desc   closed handles fail and ends in error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0086 begin');
      const state: ScanState = ScanState.CLOSED;
      const event: ScanEvent = ScanEvent.FAIL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0086 end');
    });

    /**
     * @tc.name   testStateNext0087
     * @tc.number SUB_SCAN_STATE_01_0087
     * @tc.desc   closed handles reset and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0087 begin');
      const state: ScanState = ScanState.CLOSED;
      const event: ScanEvent = ScanEvent.RESET;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0087 end');
    });

    /**
     * @tc.name   testStateNext0088
     * @tc.number SUB_SCAN_STATE_01_0088
     * @tc.desc   error handles close and ends in error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0088 begin');
      const state: ScanState = ScanState.ERROR;
      const event: ScanEvent = ScanEvent.CLOSE;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0088 end');
    });

    /**
     * @tc.name   testStateNext0089
     * @tc.number SUB_SCAN_STATE_01_0089
     * @tc.desc   error handles fail and ends in error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0089 begin');
      const state: ScanState = ScanState.ERROR;
      const event: ScanEvent = ScanEvent.FAIL;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0089 end');
    });

    /**
     * @tc.name   testStateNext0090
     * @tc.number SUB_SCAN_STATE_01_0090
     * @tc.desc   error handles reset and ends in idle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateNext0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0090 begin');
      const state: ScanState = ScanState.ERROR;
      const event: ScanEvent = ScanEvent.RESET;
      const result: ScanState = ScanStateMachine.next(state, event);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(state, event)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateNext0090 end');
    });

  });
}
