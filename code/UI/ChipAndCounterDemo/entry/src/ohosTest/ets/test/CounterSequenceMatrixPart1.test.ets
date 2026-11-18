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
import { CounterLogic } from '../../../main/ets/model/ChipModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF818;
const TAG: string = '[Sample_ChipCounter]';

export default function CounterSequenceMatrixPart1Test(): void {
  describe('CounterSequenceMatrixPart1', () => {

    /**
     * @tc.number    SUB_CHIP_CSQP1_0100
     * @tc.name      testCounterSequence0001
     * @tc.desc      Verify counter config 0 sequence III.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0001 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.increase()).assertEqual(2);
      expect(counter.increase()).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0001 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_0200
     * @tc.name      testCounterSequence0002
     * @tc.desc      Verify counter config 0 sequence IID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0002 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.increase()).assertEqual(2);
      expect(counter.decrease()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0002 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_0300
     * @tc.name      testCounterSequence0003
     * @tc.desc      Verify counter config 0 sequence IIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0003 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.increase()).assertEqual(2);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0003 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_0400
     * @tc.name      testCounterSequence0004
     * @tc.desc      Verify counter config 0 sequence IDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0004 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.increase()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0004 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_0500
     * @tc.name      testCounterSequence0005
     * @tc.desc      Verify counter config 0 sequence IDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0005 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.getValue()).assertEqual(0);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0005 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_0600
     * @tc.name      testCounterSequence0006
     * @tc.desc      Verify counter config 0 sequence IDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0006 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0006 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_0700
     * @tc.name      testCounterSequence0007
     * @tc.desc      Verify counter config 0 sequence ISI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0007 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4);
      expect(counter.getValue()).assertEqual(4);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0007 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_0800
     * @tc.name      testCounterSequence0008
     * @tc.desc      Verify counter config 0 sequence ISD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0008 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(2);
      expect(counter.getValue()).assertEqual(2);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0008 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_0900
     * @tc.name      testCounterSequence0009
     * @tc.desc      Verify counter config 0 sequence ISS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0009 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0009 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_1000
     * @tc.name      testCounterSequence0010
     * @tc.desc      Verify counter config 0 sequence DII.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0010 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.increase()).assertEqual(1);
      expect(counter.increase()).assertEqual(2);
      expect(counter.getValue()).assertEqual(2);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0010 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_1100
     * @tc.name      testCounterSequence0011
     * @tc.desc      Verify counter config 0 sequence DID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0011 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.increase()).assertEqual(1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.getValue()).assertEqual(0);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0011 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_1200
     * @tc.name      testCounterSequence0012
     * @tc.desc      Verify counter config 0 sequence DIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0012 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.increase()).assertEqual(1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0012 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_1300
     * @tc.name      testCounterSequence0013
     * @tc.desc      Verify counter config 0 sequence DDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0013 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.increase()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0013 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_1400
     * @tc.name      testCounterSequence0014
     * @tc.desc      Verify counter config 0 sequence DDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0014 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.getValue()).assertEqual(0);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0014 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_1500
     * @tc.name      testCounterSequence0015
     * @tc.desc      Verify counter config 0 sequence DDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0015 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0015 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_1600
     * @tc.name      testCounterSequence0016
     * @tc.desc      Verify counter config 0 sequence DSI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0016 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4);
      expect(counter.getValue()).assertEqual(4);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0016 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_1700
     * @tc.name      testCounterSequence0017
     * @tc.desc      Verify counter config 0 sequence DSD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0017 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(2);
      expect(counter.getValue()).assertEqual(2);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0017 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_1800
     * @tc.name      testCounterSequence0018
     * @tc.desc      Verify counter config 0 sequence DSS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0018 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0018 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_1900
     * @tc.name      testCounterSequence0019
     * @tc.desc      Verify counter config 0 sequence SII.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0019 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4);
      expect(counter.increase()).assertEqual(5);
      expect(counter.getValue()).assertEqual(5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0019 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_2000
     * @tc.name      testCounterSequence0020
     * @tc.desc      Verify counter config 0 sequence SID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0020 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0020 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_2100
     * @tc.name      testCounterSequence0021
     * @tc.desc      Verify counter config 0 sequence SIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0021 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0021 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_2200
     * @tc.name      testCounterSequence0022
     * @tc.desc      Verify counter config 0 sequence SDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0022 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(2);
      expect(counter.increase()).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0022 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_2300
     * @tc.name      testCounterSequence0023
     * @tc.desc      Verify counter config 0 sequence SDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0023 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(2);
      expect(counter.decrease()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0023 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_2400
     * @tc.name      testCounterSequence0024
     * @tc.desc      Verify counter config 0 sequence SDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0024 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(2);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0024 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_2500
     * @tc.name      testCounterSequence0025
     * @tc.desc      Verify counter config 0 sequence SSI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0025 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4);
      expect(counter.getValue()).assertEqual(4);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0025 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_2600
     * @tc.name      testCounterSequence0026
     * @tc.desc      Verify counter config 0 sequence SSD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0026 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(2);
      expect(counter.getValue()).assertEqual(2);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0026 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_2700
     * @tc.name      testCounterSequence0027
     * @tc.desc      Verify counter config 0 sequence SSS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0027 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(0, 0, 10, 1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0027 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_2800
     * @tc.name      testCounterSequence0028
     * @tc.desc      Verify counter config 1 sequence III.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0028 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.increase()).assertEqual(7);
      expect(counter.increase()).assertEqual(9);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0028 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_2900
     * @tc.name      testCounterSequence0029
     * @tc.desc      Verify counter config 1 sequence IID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0029 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.increase()).assertEqual(7);
      expect(counter.increase()).assertEqual(9);
      expect(counter.decrease()).assertEqual(7);
      expect(counter.getValue()).assertEqual(7);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0029 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_3000
     * @tc.name      testCounterSequence0030
     * @tc.desc      Verify counter config 1 sequence IIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0030 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.increase()).assertEqual(7);
      expect(counter.increase()).assertEqual(9);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0030 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_3100
     * @tc.name      testCounterSequence0031
     * @tc.desc      Verify counter config 1 sequence IDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0031 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.increase()).assertEqual(7);
      expect(counter.decrease()).assertEqual(5);
      expect(counter.increase()).assertEqual(7);
      expect(counter.getValue()).assertEqual(7);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0031 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_3200
     * @tc.name      testCounterSequence0032
     * @tc.desc      Verify counter config 1 sequence IDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0032 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.increase()).assertEqual(7);
      expect(counter.decrease()).assertEqual(5);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0032 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_3300
     * @tc.name      testCounterSequence0033
     * @tc.desc      Verify counter config 1 sequence IDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0033 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.increase()).assertEqual(7);
      expect(counter.decrease()).assertEqual(5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0033 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_3400
     * @tc.name      testCounterSequence0034
     * @tc.desc      Verify counter config 1 sequence ISI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0034 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.increase()).assertEqual(7);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(5);
      expect(counter.getValue()).assertEqual(5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0034 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_3500
     * @tc.name      testCounterSequence0035
     * @tc.desc      Verify counter config 1 sequence ISD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0035 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.increase()).assertEqual(7);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0035 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_3600
     * @tc.name      testCounterSequence0036
     * @tc.desc      Verify counter config 1 sequence ISS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0036 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.increase()).assertEqual(7);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0036 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_3700
     * @tc.name      testCounterSequence0037
     * @tc.desc      Verify counter config 1 sequence DII.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0037 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.increase()).assertEqual(5);
      expect(counter.increase()).assertEqual(7);
      expect(counter.getValue()).assertEqual(7);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0037 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_3800
     * @tc.name      testCounterSequence0038
     * @tc.desc      Verify counter config 1 sequence DID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0038 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.increase()).assertEqual(5);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0038 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_3900
     * @tc.name      testCounterSequence0039
     * @tc.desc      Verify counter config 1 sequence DIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0039 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.increase()).assertEqual(5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0039 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP1_4000
     * @tc.name      testCounterSequence0040
     * @tc.desc      Verify counter config 1 sequence DDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0040 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.decrease()).assertEqual(1);
      expect(counter.increase()).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0040 end');
    })

  })
}
