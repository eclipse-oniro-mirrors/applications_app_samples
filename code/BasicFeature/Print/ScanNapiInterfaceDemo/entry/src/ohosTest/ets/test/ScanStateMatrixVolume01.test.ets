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
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanStateMatrixVolume01Test() {
  describe('ScanStateMatrix', () => {

    /**
     * @tc.name   testStateMatrix010001
     * @tc.number SUB_SCAN_STMATRIX_01_0001
     * @tc.desc   IDLE + DISCOVER transits to DISCOVERING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010001 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.DISCOVER)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.DISCOVER])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010001 end');
    });

    /**
     * @tc.name   testStateMatrix010002
     * @tc.number SUB_SCAN_STMATRIX_01_0002
     * @tc.desc   IDLE + DEVICE_FOUND transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010002 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DEVICE_FOUND);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.DEVICE_FOUND)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.DEVICE_FOUND])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010002 end');
    });

    /**
     * @tc.name   testStateMatrix010003
     * @tc.number SUB_SCAN_STMATRIX_01_0003
     * @tc.desc   IDLE + OPEN transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010003 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.OPEN);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.OPEN)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.OPEN])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010003 end');
    });

    /**
     * @tc.name   testStateMatrix010004
     * @tc.number SUB_SCAN_STMATRIX_01_0004
     * @tc.desc   IDLE + SCAN_START transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010004 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.SCAN_START);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.SCAN_START)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.SCAN_START])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010004 end');
    });

    /**
     * @tc.name   testStateMatrix010005
     * @tc.number SUB_SCAN_STMATRIX_01_0005
     * @tc.desc   IDLE + CANCEL transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010005 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.CANCEL);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.CANCEL)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.CANCEL])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010005 end');
    });

    /**
     * @tc.name   testStateMatrix010006
     * @tc.number SUB_SCAN_STMATRIX_01_0006
     * @tc.desc   IDLE + CLOSE transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010006 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.CLOSE);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.CLOSE)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.CLOSE])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010006 end');
    });

    /**
     * @tc.name   testStateMatrix010007
     * @tc.number SUB_SCAN_STMATRIX_01_0007
     * @tc.desc   IDLE + RESET transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010007 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.RESET);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.RESET)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.RESET])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010007 end');
    });

    /**
     * @tc.name   testStateMatrix010008
     * @tc.number SUB_SCAN_STMATRIX_01_0008
     * @tc.desc   IDLE + FAIL transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010008 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.FAIL);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.FAIL)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.FAIL])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010008 end');
    });

    /**
     * @tc.name   testStateMatrix010009
     * @tc.number SUB_SCAN_STMATRIX_01_0009
     * @tc.desc   IDLE + OPEN_SUCCESS transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010009 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.OPEN_SUCCESS);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.OPEN_SUCCESS)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.OPEN_SUCCESS])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010009 end');
    });

    /**
     * @tc.name   testStateMatrix010010
     * @tc.number SUB_SCAN_STMATRIX_01_0010
     * @tc.desc   IDLE + PROGRESS transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010010 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.PROGRESS);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.PROGRESS)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.PROGRESS])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010010 end');
    });

    /**
     * @tc.name   testStateMatrix010011
     * @tc.number SUB_SCAN_STMATRIX_01_0011
     * @tc.desc   IDLE + SCAN_FINISH transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010011 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.SCAN_FINISH);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.SCAN_FINISH)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.SCAN_FINISH])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010011 end');
    });

    /**
     * @tc.name   testStateMatrix010012
     * @tc.number SUB_SCAN_STMATRIX_01_0012
     * @tc.desc   IDLE + CANCEL_DONE transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010012 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.CANCEL_DONE);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.IDLE, ScanEvent.CANCEL_DONE)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.CANCEL_DONE])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010012 end');
    });

    /**
     * @tc.name   testStateMatrix010013
     * @tc.number SUB_SCAN_STMATRIX_01_0013
     * @tc.desc   DISCOVERING + DISCOVER transits to DISCOVERING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010013 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERING, ScanEvent.DISCOVER);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERING, ScanEvent.DISCOVER)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERING, [ScanEvent.DISCOVER])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010013 end');
    });

    /**
     * @tc.name   testStateMatrix010014
     * @tc.number SUB_SCAN_STMATRIX_01_0014
     * @tc.desc   DISCOVERING + DEVICE_FOUND transits to DISCOVERED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010014 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERING, ScanEvent.DEVICE_FOUND);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERING, ScanEvent.DEVICE_FOUND)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERING, [ScanEvent.DEVICE_FOUND])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010014 end');
    });

    /**
     * @tc.name   testStateMatrix010015
     * @tc.number SUB_SCAN_STMATRIX_01_0015
     * @tc.desc   DISCOVERING + OPEN transits to DISCOVERING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010015 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERING, ScanEvent.OPEN);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERING, ScanEvent.OPEN)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERING, [ScanEvent.OPEN])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010015 end');
    });

    /**
     * @tc.name   testStateMatrix010016
     * @tc.number SUB_SCAN_STMATRIX_01_0016
     * @tc.desc   DISCOVERING + CANCEL transits to DISCOVERING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010016 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERING, ScanEvent.CANCEL);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERING, ScanEvent.CANCEL)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERING, [ScanEvent.CANCEL])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010016 end');
    });

    /**
     * @tc.name   testStateMatrix010017
     * @tc.number SUB_SCAN_STMATRIX_01_0017
     * @tc.desc   DISCOVERING + FAIL transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010017 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERING, ScanEvent.FAIL);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERING, ScanEvent.FAIL)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERING, [ScanEvent.FAIL])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010017 end');
    });

    /**
     * @tc.name   testStateMatrix010018
     * @tc.number SUB_SCAN_STMATRIX_01_0018
     * @tc.desc   DISCOVERING + RESET transits to DISCOVERING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010018 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERING, ScanEvent.RESET);
      expect(result).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERING, ScanEvent.RESET)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERING, [ScanEvent.RESET])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010018 end');
    });

    /**
     * @tc.name   testStateMatrix010019
     * @tc.number SUB_SCAN_STMATRIX_01_0019
     * @tc.desc   DISCOVERED + OPEN transits to OPENING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010019 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERED, ScanEvent.OPEN);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERED, ScanEvent.OPEN)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERED, [ScanEvent.OPEN])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010019 end');
    });

    /**
     * @tc.name   testStateMatrix010020
     * @tc.number SUB_SCAN_STMATRIX_01_0020
     * @tc.desc   DISCOVERED + CLOSE transits to CLOSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010020 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERED, ScanEvent.CLOSE);
      expect(result).assertEqual(ScanState.CLOSED);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERED, ScanEvent.CLOSE)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERED, [ScanEvent.CLOSE])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010020 end');
    });

    /**
     * @tc.name   testStateMatrix010021
     * @tc.number SUB_SCAN_STMATRIX_01_0021
     * @tc.desc   DISCOVERED + DEVICE_FOUND transits to DISCOVERED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010021 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERED, ScanEvent.DEVICE_FOUND);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERED, ScanEvent.DEVICE_FOUND)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERED, [ScanEvent.DEVICE_FOUND])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010021 end');
    });

    /**
     * @tc.name   testStateMatrix010022
     * @tc.number SUB_SCAN_STMATRIX_01_0022
     * @tc.desc   DISCOVERED + SCAN_START transits to DISCOVERED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010022 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERED, ScanEvent.SCAN_START);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERED, ScanEvent.SCAN_START)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERED, [ScanEvent.SCAN_START])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010022 end');
    });

    /**
     * @tc.name   testStateMatrix010023
     * @tc.number SUB_SCAN_STMATRIX_01_0023
     * @tc.desc   DISCOVERED + FAIL transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010023 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERED, ScanEvent.FAIL);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERED, ScanEvent.FAIL)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERED, [ScanEvent.FAIL])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010023 end');
    });

    /**
     * @tc.name   testStateMatrix010024
     * @tc.number SUB_SCAN_STMATRIX_01_0024
     * @tc.desc   DISCOVERED + RESET transits to DISCOVERED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010024 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERED, ScanEvent.RESET);
      expect(result).assertEqual(ScanState.DISCOVERED);
      expect(ScanStateMachine.canTransit(ScanState.DISCOVERED, ScanEvent.RESET)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.DISCOVERED, [ScanEvent.RESET])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010024 end');
    });

    /**
     * @tc.name   testStateMatrix010025
     * @tc.number SUB_SCAN_STMATRIX_01_0025
     * @tc.desc   OPENING + OPEN_SUCCESS transits to OPENED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010025 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENING, ScanEvent.OPEN_SUCCESS);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(ScanState.OPENING, ScanEvent.OPEN_SUCCESS)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.OPENING, [ScanEvent.OPEN_SUCCESS])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010025 end');
    });

    /**
     * @tc.name   testStateMatrix010026
     * @tc.number SUB_SCAN_STMATRIX_01_0026
     * @tc.desc   OPENING + OPEN transits to OPENING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010026 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENING, ScanEvent.OPEN);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(ScanState.OPENING, ScanEvent.OPEN)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.OPENING, [ScanEvent.OPEN])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010026 end');
    });

    /**
     * @tc.name   testStateMatrix010027
     * @tc.number SUB_SCAN_STMATRIX_01_0027
     * @tc.desc   OPENING + SCAN_START transits to OPENING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010027 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENING, ScanEvent.SCAN_START);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(ScanState.OPENING, ScanEvent.SCAN_START)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.OPENING, [ScanEvent.SCAN_START])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010027 end');
    });

    /**
     * @tc.name   testStateMatrix010028
     * @tc.number SUB_SCAN_STMATRIX_01_0028
     * @tc.desc   OPENING + FAIL transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010028 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENING, ScanEvent.FAIL);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.OPENING, ScanEvent.FAIL)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.OPENING, [ScanEvent.FAIL])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010028 end');
    });

    /**
     * @tc.name   testStateMatrix010029
     * @tc.number SUB_SCAN_STMATRIX_01_0029
     * @tc.desc   OPENING + RESET transits to OPENING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010029 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENING, ScanEvent.RESET);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(ScanState.OPENING, ScanEvent.RESET)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.OPENING, [ScanEvent.RESET])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010029 end');
    });

    /**
     * @tc.name   testStateMatrix010030
     * @tc.number SUB_SCAN_STMATRIX_01_0030
     * @tc.desc   OPENING + DISCOVER transits to OPENING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010030 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENING, ScanEvent.DISCOVER);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(ScanState.OPENING, ScanEvent.DISCOVER)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.OPENING, [ScanEvent.DISCOVER])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010030 end');
    });

    /**
     * @tc.name   testStateMatrix010031
     * @tc.number SUB_SCAN_STMATRIX_01_0031
     * @tc.desc   OPENED + SCAN_START transits to SCANNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010031 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENED, ScanEvent.SCAN_START);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(ScanState.OPENED, ScanEvent.SCAN_START)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.OPENED, [ScanEvent.SCAN_START])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010031 end');
    });

    /**
     * @tc.name   testStateMatrix010032
     * @tc.number SUB_SCAN_STMATRIX_01_0032
     * @tc.desc   OPENED + OPEN transits to OPENING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010032 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENED, ScanEvent.OPEN);
      expect(result).assertEqual(ScanState.OPENING);
      expect(ScanStateMachine.canTransit(ScanState.OPENED, ScanEvent.OPEN)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.OPENED, [ScanEvent.OPEN])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010032 end');
    });

    /**
     * @tc.name   testStateMatrix010033
     * @tc.number SUB_SCAN_STMATRIX_01_0033
     * @tc.desc   OPENED + CLOSE transits to CLOSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010033 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENED, ScanEvent.CLOSE);
      expect(result).assertEqual(ScanState.CLOSED);
      expect(ScanStateMachine.canTransit(ScanState.OPENED, ScanEvent.CLOSE)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.OPENED, [ScanEvent.CLOSE])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010033 end');
    });

    /**
     * @tc.name   testStateMatrix010034
     * @tc.number SUB_SCAN_STMATRIX_01_0034
     * @tc.desc   OPENED + CANCEL transits to OPENED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010034 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENED, ScanEvent.CANCEL);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(ScanState.OPENED, ScanEvent.CANCEL)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.OPENED, [ScanEvent.CANCEL])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010034 end');
    });

    /**
     * @tc.name   testStateMatrix010035
     * @tc.number SUB_SCAN_STMATRIX_01_0035
     * @tc.desc   OPENED + SCAN_FINISH transits to OPENED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010035 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENED, ScanEvent.SCAN_FINISH);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(ScanState.OPENED, ScanEvent.SCAN_FINISH)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.OPENED, [ScanEvent.SCAN_FINISH])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010035 end');
    });

    /**
     * @tc.name   testStateMatrix010036
     * @tc.number SUB_SCAN_STMATRIX_01_0036
     * @tc.desc   OPENED + FAIL transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010036 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENED, ScanEvent.FAIL);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.OPENED, ScanEvent.FAIL)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.OPENED, [ScanEvent.FAIL])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010036 end');
    });

    /**
     * @tc.name   testStateMatrix010037
     * @tc.number SUB_SCAN_STMATRIX_01_0037
     * @tc.desc   SCANNING + PROGRESS transits to SCANNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010037 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.PROGRESS);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(ScanState.SCANNING, ScanEvent.PROGRESS)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.SCANNING, [ScanEvent.PROGRESS])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010037 end');
    });

    /**
     * @tc.name   testStateMatrix010038
     * @tc.number SUB_SCAN_STMATRIX_01_0038
     * @tc.desc   SCANNING + SCAN_FINISH transits to OPENED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010038 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.SCAN_FINISH);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(ScanState.SCANNING, ScanEvent.SCAN_FINISH)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.SCANNING, [ScanEvent.SCAN_FINISH])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010038 end');
    });

    /**
     * @tc.name   testStateMatrix010039
     * @tc.number SUB_SCAN_STMATRIX_01_0039
     * @tc.desc   SCANNING + CANCEL transits to CANCELLING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010039 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.CANCEL);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(ScanState.SCANNING, ScanEvent.CANCEL)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.SCANNING, [ScanEvent.CANCEL])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010039 end');
    });

    /**
     * @tc.name   testStateMatrix010040
     * @tc.number SUB_SCAN_STMATRIX_01_0040
     * @tc.desc   SCANNING + OPEN transits to SCANNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010040 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.OPEN);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(ScanState.SCANNING, ScanEvent.OPEN)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.SCANNING, [ScanEvent.OPEN])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010040 end');
    });

    /**
     * @tc.name   testStateMatrix010041
     * @tc.number SUB_SCAN_STMATRIX_01_0041
     * @tc.desc   SCANNING + CLOSE transits to SCANNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010041 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.CLOSE);
      expect(result).assertEqual(ScanState.SCANNING);
      expect(ScanStateMachine.canTransit(ScanState.SCANNING, ScanEvent.CLOSE)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.SCANNING, [ScanEvent.CLOSE])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010041 end');
    });

    /**
     * @tc.name   testStateMatrix010042
     * @tc.number SUB_SCAN_STMATRIX_01_0042
     * @tc.desc   SCANNING + FAIL transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010042 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.FAIL);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.SCANNING, ScanEvent.FAIL)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.SCANNING, [ScanEvent.FAIL])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010042 end');
    });

    /**
     * @tc.name   testStateMatrix010043
     * @tc.number SUB_SCAN_STMATRIX_01_0043
     * @tc.desc   CANCELLING + CANCEL_DONE transits to OPENED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010043 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CANCELLING, ScanEvent.CANCEL_DONE);
      expect(result).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.canTransit(ScanState.CANCELLING, ScanEvent.CANCEL_DONE)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.CANCELLING, [ScanEvent.CANCEL_DONE])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010043 end');
    });

    /**
     * @tc.name   testStateMatrix010044
     * @tc.number SUB_SCAN_STMATRIX_01_0044
     * @tc.desc   CANCELLING + CANCEL transits to CANCELLING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010044 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CANCELLING, ScanEvent.CANCEL);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(ScanState.CANCELLING, ScanEvent.CANCEL)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.CANCELLING, [ScanEvent.CANCEL])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010044 end');
    });

    /**
     * @tc.name   testStateMatrix010045
     * @tc.number SUB_SCAN_STMATRIX_01_0045
     * @tc.desc   CANCELLING + SCAN_FINISH transits to CANCELLING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010045 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CANCELLING, ScanEvent.SCAN_FINISH);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(ScanState.CANCELLING, ScanEvent.SCAN_FINISH)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.CANCELLING, [ScanEvent.SCAN_FINISH])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010045 end');
    });

    /**
     * @tc.name   testStateMatrix010046
     * @tc.number SUB_SCAN_STMATRIX_01_0046
     * @tc.desc   CANCELLING + FAIL transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010046 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CANCELLING, ScanEvent.FAIL);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.CANCELLING, ScanEvent.FAIL)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.CANCELLING, [ScanEvent.FAIL])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010046 end');
    });

    /**
     * @tc.name   testStateMatrix010047
     * @tc.number SUB_SCAN_STMATRIX_01_0047
     * @tc.desc   CANCELLING + RESET transits to CANCELLING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010047 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CANCELLING, ScanEvent.RESET);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(ScanState.CANCELLING, ScanEvent.RESET)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.CANCELLING, [ScanEvent.RESET])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010047 end');
    });

    /**
     * @tc.name   testStateMatrix010048
     * @tc.number SUB_SCAN_STMATRIX_01_0048
     * @tc.desc   CANCELLING + CLOSE transits to CANCELLING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010048 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CANCELLING, ScanEvent.CLOSE);
      expect(result).assertEqual(ScanState.CANCELLING);
      expect(ScanStateMachine.canTransit(ScanState.CANCELLING, ScanEvent.CLOSE)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.CANCELLING, [ScanEvent.CLOSE])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010048 end');
    });

    /**
     * @tc.name   testStateMatrix010049
     * @tc.number SUB_SCAN_STMATRIX_01_0049
     * @tc.desc   CLOSED + RESET transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010049 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CLOSED, ScanEvent.RESET);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.CLOSED, ScanEvent.RESET)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.CLOSED, [ScanEvent.RESET])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010049 end');
    });

    /**
     * @tc.name   testStateMatrix010050
     * @tc.number SUB_SCAN_STMATRIX_01_0050
     * @tc.desc   CLOSED + DISCOVER transits to CLOSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010050 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CLOSED, ScanEvent.DISCOVER);
      expect(result).assertEqual(ScanState.CLOSED);
      expect(ScanStateMachine.canTransit(ScanState.CLOSED, ScanEvent.DISCOVER)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.CLOSED, [ScanEvent.DISCOVER])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010050 end');
    });

    /**
     * @tc.name   testStateMatrix010051
     * @tc.number SUB_SCAN_STMATRIX_01_0051
     * @tc.desc   CLOSED + CLOSE transits to CLOSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010051 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CLOSED, ScanEvent.CLOSE);
      expect(result).assertEqual(ScanState.CLOSED);
      expect(ScanStateMachine.canTransit(ScanState.CLOSED, ScanEvent.CLOSE)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.CLOSED, [ScanEvent.CLOSE])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010051 end');
    });

    /**
     * @tc.name   testStateMatrix010052
     * @tc.number SUB_SCAN_STMATRIX_01_0052
     * @tc.desc   CLOSED + FAIL transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010052 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CLOSED, ScanEvent.FAIL);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.CLOSED, ScanEvent.FAIL)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.CLOSED, [ScanEvent.FAIL])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010052 end');
    });

    /**
     * @tc.name   testStateMatrix010053
     * @tc.number SUB_SCAN_STMATRIX_01_0053
     * @tc.desc   CLOSED + OPEN transits to CLOSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010053 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CLOSED, ScanEvent.OPEN);
      expect(result).assertEqual(ScanState.CLOSED);
      expect(ScanStateMachine.canTransit(ScanState.CLOSED, ScanEvent.OPEN)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.CLOSED, [ScanEvent.OPEN])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010053 end');
    });

    /**
     * @tc.name   testStateMatrix010054
     * @tc.number SUB_SCAN_STMATRIX_01_0054
     * @tc.desc   CLOSED + CANCEL_DONE transits to CLOSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010054 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CLOSED, ScanEvent.CANCEL_DONE);
      expect(result).assertEqual(ScanState.CLOSED);
      expect(ScanStateMachine.canTransit(ScanState.CLOSED, ScanEvent.CANCEL_DONE)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.CLOSED, [ScanEvent.CANCEL_DONE])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010054 end');
    });

    /**
     * @tc.name   testStateMatrix010055
     * @tc.number SUB_SCAN_STMATRIX_01_0055
     * @tc.desc   ERROR + RESET transits to IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010055 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.ERROR, ScanEvent.RESET);
      expect(result).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.canTransit(ScanState.ERROR, ScanEvent.RESET)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.ERROR, [ScanEvent.RESET])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010055 end');
    });

    /**
     * @tc.name   testStateMatrix010056
     * @tc.number SUB_SCAN_STMATRIX_01_0056
     * @tc.desc   ERROR + DISCOVER transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010056 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.ERROR, ScanEvent.DISCOVER);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.ERROR, ScanEvent.DISCOVER)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.ERROR, [ScanEvent.DISCOVER])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010056 end');
    });

    /**
     * @tc.name   testStateMatrix010057
     * @tc.number SUB_SCAN_STMATRIX_01_0057
     * @tc.desc   ERROR + FAIL transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010057 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.ERROR, ScanEvent.FAIL);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.ERROR, ScanEvent.FAIL)).assertEqual(true);
      expect(ScanStateMachine.countApplied(ScanState.ERROR, [ScanEvent.FAIL])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010057 end');
    });

    /**
     * @tc.name   testStateMatrix010058
     * @tc.number SUB_SCAN_STMATRIX_01_0058
     * @tc.desc   ERROR + OPEN transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010058 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.ERROR, ScanEvent.OPEN);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.ERROR, ScanEvent.OPEN)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.ERROR, [ScanEvent.OPEN])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010058 end');
    });

    /**
     * @tc.name   testStateMatrix010059
     * @tc.number SUB_SCAN_STMATRIX_01_0059
     * @tc.desc   ERROR + CANCEL_DONE transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010059 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.ERROR, ScanEvent.CANCEL_DONE);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.ERROR, ScanEvent.CANCEL_DONE)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.ERROR, [ScanEvent.CANCEL_DONE])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010059 end');
    });

    /**
     * @tc.name   testStateMatrix010060
     * @tc.number SUB_SCAN_STMATRIX_01_0060
     * @tc.desc   ERROR + CLOSE transits to ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010060 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.ERROR, ScanEvent.CLOSE);
      expect(result).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.canTransit(ScanState.ERROR, ScanEvent.CLOSE)).assertEqual(false);
      expect(ScanStateMachine.countApplied(ScanState.ERROR, [ScanEvent.CLOSE])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010060 end');
    });

    /**
     * @tc.name   testStateMatrix010061
     * @tc.number SUB_SCAN_STMATRIX_01_0061
     * @tc.desc   IDLE busy false terminal false start false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010061 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isBusy(ScanState.IDLE)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(ScanState.IDLE)).assertEqual(false);
      expect(ScanStateMachine.canStartScan(ScanState.IDLE)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010061 end');
    });

    /**
     * @tc.name   testStateMatrix010062
     * @tc.number SUB_SCAN_STMATRIX_01_0062
     * @tc.desc   IDLE recoverable false cancel false close false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010062 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isRecoverable(ScanState.IDLE)).assertEqual(false);
      expect(ScanStateMachine.canCancel(ScanState.IDLE)).assertEqual(false);
      expect(ScanStateMachine.canClose(ScanState.IDLE)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010062 end');
    });

    /**
     * @tc.name   testStateMatrix010063
     * @tc.number SUB_SCAN_STMATRIX_01_0063
     * @tc.desc   DISCOVERING busy false terminal false start false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010063 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERING, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isBusy(ScanState.DISCOVERING)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(ScanState.DISCOVERING)).assertEqual(false);
      expect(ScanStateMachine.canStartScan(ScanState.DISCOVERING)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010063 end');
    });

    /**
     * @tc.name   testStateMatrix010064
     * @tc.number SUB_SCAN_STMATRIX_01_0064
     * @tc.desc   DISCOVERING recoverable false cancel false close false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010064 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERING, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isRecoverable(ScanState.DISCOVERING)).assertEqual(false);
      expect(ScanStateMachine.canCancel(ScanState.DISCOVERING)).assertEqual(false);
      expect(ScanStateMachine.canClose(ScanState.DISCOVERING)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010064 end');
    });

    /**
     * @tc.name   testStateMatrix010065
     * @tc.number SUB_SCAN_STMATRIX_01_0065
     * @tc.desc   DISCOVERED busy false terminal false start false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010065 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERED, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isBusy(ScanState.DISCOVERED)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(ScanState.DISCOVERED)).assertEqual(false);
      expect(ScanStateMachine.canStartScan(ScanState.DISCOVERED)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010065 end');
    });

    /**
     * @tc.name   testStateMatrix010066
     * @tc.number SUB_SCAN_STMATRIX_01_0066
     * @tc.desc   DISCOVERED recoverable false cancel false close true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010066 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.DISCOVERED, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isRecoverable(ScanState.DISCOVERED)).assertEqual(false);
      expect(ScanStateMachine.canCancel(ScanState.DISCOVERED)).assertEqual(false);
      expect(ScanStateMachine.canClose(ScanState.DISCOVERED)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010066 end');
    });

    /**
     * @tc.name   testStateMatrix010067
     * @tc.number SUB_SCAN_STMATRIX_01_0067
     * @tc.desc   OPENING busy true terminal false start false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010067 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENING, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isBusy(ScanState.OPENING)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(ScanState.OPENING)).assertEqual(false);
      expect(ScanStateMachine.canStartScan(ScanState.OPENING)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010067 end');
    });

    /**
     * @tc.name   testStateMatrix010068
     * @tc.number SUB_SCAN_STMATRIX_01_0068
     * @tc.desc   OPENING recoverable false cancel false close false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010068 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENING, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isRecoverable(ScanState.OPENING)).assertEqual(false);
      expect(ScanStateMachine.canCancel(ScanState.OPENING)).assertEqual(false);
      expect(ScanStateMachine.canClose(ScanState.OPENING)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010068 end');
    });

    /**
     * @tc.name   testStateMatrix010069
     * @tc.number SUB_SCAN_STMATRIX_01_0069
     * @tc.desc   OPENED busy false terminal false start true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010069 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENED, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isBusy(ScanState.OPENED)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(ScanState.OPENED)).assertEqual(false);
      expect(ScanStateMachine.canStartScan(ScanState.OPENED)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010069 end');
    });

    /**
     * @tc.name   testStateMatrix010070
     * @tc.number SUB_SCAN_STMATRIX_01_0070
     * @tc.desc   OPENED recoverable false cancel false close true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010070 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENED, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isRecoverable(ScanState.OPENED)).assertEqual(false);
      expect(ScanStateMachine.canCancel(ScanState.OPENED)).assertEqual(false);
      expect(ScanStateMachine.canClose(ScanState.OPENED)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010070 end');
    });

    /**
     * @tc.name   testStateMatrix010071
     * @tc.number SUB_SCAN_STMATRIX_01_0071
     * @tc.desc   SCANNING busy true terminal false start false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010071 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isBusy(ScanState.SCANNING)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(ScanState.SCANNING)).assertEqual(false);
      expect(ScanStateMachine.canStartScan(ScanState.SCANNING)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010071 end');
    });

    /**
     * @tc.name   testStateMatrix010072
     * @tc.number SUB_SCAN_STMATRIX_01_0072
     * @tc.desc   SCANNING recoverable false cancel true close false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010072 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isRecoverable(ScanState.SCANNING)).assertEqual(false);
      expect(ScanStateMachine.canCancel(ScanState.SCANNING)).assertEqual(true);
      expect(ScanStateMachine.canClose(ScanState.SCANNING)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010072 end');
    });

    /**
     * @tc.name   testStateMatrix010073
     * @tc.number SUB_SCAN_STMATRIX_01_0073
     * @tc.desc   CANCELLING busy true terminal false start false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010073 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CANCELLING, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isBusy(ScanState.CANCELLING)).assertEqual(true);
      expect(ScanStateMachine.isTerminal(ScanState.CANCELLING)).assertEqual(false);
      expect(ScanStateMachine.canStartScan(ScanState.CANCELLING)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010073 end');
    });

    /**
     * @tc.name   testStateMatrix010074
     * @tc.number SUB_SCAN_STMATRIX_01_0074
     * @tc.desc   CANCELLING recoverable false cancel false close false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010074 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CANCELLING, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isRecoverable(ScanState.CANCELLING)).assertEqual(false);
      expect(ScanStateMachine.canCancel(ScanState.CANCELLING)).assertEqual(false);
      expect(ScanStateMachine.canClose(ScanState.CANCELLING)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010074 end');
    });

    /**
     * @tc.name   testStateMatrix010075
     * @tc.number SUB_SCAN_STMATRIX_01_0075
     * @tc.desc   CLOSED busy false terminal true start false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010075 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CLOSED, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isBusy(ScanState.CLOSED)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(ScanState.CLOSED)).assertEqual(true);
      expect(ScanStateMachine.canStartScan(ScanState.CLOSED)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010075 end');
    });

    /**
     * @tc.name   testStateMatrix010076
     * @tc.number SUB_SCAN_STMATRIX_01_0076
     * @tc.desc   CLOSED recoverable false cancel false close false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010076 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.CLOSED, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isRecoverable(ScanState.CLOSED)).assertEqual(false);
      expect(ScanStateMachine.canCancel(ScanState.CLOSED)).assertEqual(false);
      expect(ScanStateMachine.canClose(ScanState.CLOSED)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010076 end');
    });

    /**
     * @tc.name   testStateMatrix010077
     * @tc.number SUB_SCAN_STMATRIX_01_0077
     * @tc.desc   ERROR busy false terminal true start false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010077 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.ERROR, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isBusy(ScanState.ERROR)).assertEqual(false);
      expect(ScanStateMachine.isTerminal(ScanState.ERROR)).assertEqual(true);
      expect(ScanStateMachine.canStartScan(ScanState.ERROR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010077 end');
    });

    /**
     * @tc.name   testStateMatrix010078
     * @tc.number SUB_SCAN_STMATRIX_01_0078
     * @tc.desc   ERROR recoverable true cancel false close false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010078 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.ERROR, ScanEvent.DISCOVER);
      expect(ScanStateMachine.isRecoverable(ScanState.ERROR)).assertEqual(true);
      expect(ScanStateMachine.canCancel(ScanState.ERROR)).assertEqual(false);
      expect(ScanStateMachine.canClose(ScanState.ERROR)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010078 end');
    });

    /**
     * @tc.name   testStateMatrix010079
     * @tc.number SUB_SCAN_STMATRIX_01_0079
     * @tc.desc   apply 2 events from IDLE lands on DISCOVERED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010079 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(
        ScanStateMachine.apply(ScanState.IDLE, [ScanEvent.DISCOVER, ScanEvent.DEVICE_FOUND])
      ).assertEqual(ScanState.DISCOVERED);
      expect(
        ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.DISCOVER, ScanEvent.DEVICE_FOUND])
      ).assertEqual(2);
      expect(result).assertEqual(ScanState.DISCOVERING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010079 end');
    });

    /**
     * @tc.name   testStateMatrix010080
     * @tc.number SUB_SCAN_STMATRIX_01_0080
     * @tc.desc   apply 2 events from IDLE lands on DISCOVERING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010080 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(
        ScanStateMachine.apply(ScanState.IDLE, [ScanEvent.DISCOVER, ScanEvent.DISCOVER])
      ).assertEqual(ScanState.DISCOVERING);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.DISCOVER, ScanEvent.DISCOVER])).assertEqual(2);
      expect(result).assertEqual(ScanState.DISCOVERING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010080 end');
    });

    /**
     * @tc.name   testStateMatrix010081
     * @tc.number SUB_SCAN_STMATRIX_01_0081
     * @tc.desc   apply 1 events from IDLE lands on IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010081 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(ScanStateMachine.apply(ScanState.IDLE, [ScanEvent.DEVICE_FOUND])).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.DEVICE_FOUND])).assertEqual(0);
      expect(result).assertEqual(ScanState.DISCOVERING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010081 end');
    });

    /**
     * @tc.name   testStateMatrix010082
     * @tc.number SUB_SCAN_STMATRIX_01_0082
     * @tc.desc   apply 1 events from IDLE lands on IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010082 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(ScanStateMachine.apply(ScanState.IDLE, [ScanEvent.OPEN])).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.OPEN])).assertEqual(0);
      expect(result).assertEqual(ScanState.DISCOVERING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010082 end');
    });

    /**
     * @tc.name   testStateMatrix010083
     * @tc.number SUB_SCAN_STMATRIX_01_0083
     * @tc.desc   apply 3 events from IDLE lands on OPENING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010083 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(
        ScanStateMachine.apply(ScanState.IDLE, [ScanEvent.DISCOVER, ScanEvent.DEVICE_FOUND, ScanEvent.OPEN])
      ).assertEqual(ScanState.OPENING);
      expect(
        ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.DISCOVER, ScanEvent.DEVICE_FOUND, ScanEvent.OPEN])
      ).assertEqual(3);
      expect(result).assertEqual(ScanState.DISCOVERING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010083 end');
    });

    /**
     * @tc.name   testStateMatrix010084
     * @tc.number SUB_SCAN_STMATRIX_01_0084
     * @tc.desc   apply 3 events from IDLE lands on CLOSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010084 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(
        ScanStateMachine.apply(ScanState.IDLE, [ScanEvent.DISCOVER, ScanEvent.DEVICE_FOUND, ScanEvent.CLOSE])
      ).assertEqual(ScanState.CLOSED);
      expect(
        ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.DISCOVER, ScanEvent.DEVICE_FOUND, ScanEvent.CLOSE])
      ).assertEqual(3);
      expect(result).assertEqual(ScanState.DISCOVERING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010084 end');
    });

    /**
     * @tc.name   testStateMatrix010085
     * @tc.number SUB_SCAN_STMATRIX_01_0085
     * @tc.desc   apply 2 events from IDLE lands on ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010085 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(ScanStateMachine.apply(ScanState.IDLE, [ScanEvent.DISCOVER, ScanEvent.FAIL])).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.DISCOVER, ScanEvent.FAIL])).assertEqual(2);
      expect(result).assertEqual(ScanState.DISCOVERING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010085 end');
    });

    /**
     * @tc.name   testStateMatrix010086
     * @tc.number SUB_SCAN_STMATRIX_01_0086
     * @tc.desc   apply 1 events from IDLE lands on ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010086 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(ScanStateMachine.apply(ScanState.IDLE, [ScanEvent.FAIL])).assertEqual(ScanState.ERROR);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.FAIL])).assertEqual(1);
      expect(result).assertEqual(ScanState.DISCOVERING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010086 end');
    });

    /**
     * @tc.name   testStateMatrix010087
     * @tc.number SUB_SCAN_STMATRIX_01_0087
     * @tc.desc   apply 1 events from IDLE lands on IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010087 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(ScanStateMachine.apply(ScanState.IDLE, [ScanEvent.RESET])).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [ScanEvent.RESET])).assertEqual(0);
      expect(result).assertEqual(ScanState.DISCOVERING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010087 end');
    });

    /**
     * @tc.name   testStateMatrix010088
     * @tc.number SUB_SCAN_STMATRIX_01_0088
     * @tc.desc   apply 0 events from IDLE lands on IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010088 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.IDLE, ScanEvent.DISCOVER);
      expect(ScanStateMachine.apply(ScanState.IDLE, [])).assertEqual(ScanState.IDLE);
      expect(ScanStateMachine.countApplied(ScanState.IDLE, [])).assertEqual(0);
      expect(result).assertEqual(ScanState.DISCOVERING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010088 end');
    });

    /**
     * @tc.name   testStateMatrix010089
     * @tc.number SUB_SCAN_STMATRIX_01_0089
     * @tc.desc   apply 2 events from SCANNING lands on OPENED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010089 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.SCANNING, ScanEvent.DISCOVER);
      expect(
        ScanStateMachine.apply(ScanState.SCANNING, [ScanEvent.CANCEL, ScanEvent.CANCEL_DONE])
      ).assertEqual(ScanState.OPENED);
      expect(
        ScanStateMachine.countApplied(ScanState.SCANNING, [ScanEvent.CANCEL, ScanEvent.CANCEL_DONE])
      ).assertEqual(2);
      expect(result).assertEqual(ScanState.SCANNING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010089 end');
    });

    /**
     * @tc.name   testStateMatrix010090
     * @tc.number SUB_SCAN_STMATRIX_01_0090
     * @tc.desc   apply 2 events from OPENED lands on OPENED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStateMatrix010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010090 begin');
      const result: ScanState = ScanStateMachine.next(ScanState.OPENED, ScanEvent.DISCOVER);
      expect(
        ScanStateMachine.apply(ScanState.OPENED, [ScanEvent.OPEN, ScanEvent.OPEN_SUCCESS])
      ).assertEqual(ScanState.OPENED);
      expect(ScanStateMachine.countApplied(ScanState.OPENED, [ScanEvent.OPEN, ScanEvent.OPEN_SUCCESS])).assertEqual(2);
      expect(result).assertEqual(ScanState.OPENED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStateMatrix010090 end');
    });

  });
}
