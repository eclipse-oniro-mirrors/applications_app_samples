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

export default function CounterSequenceMatrixPart2Test(): void {
  describe('CounterSequenceMatrixPart2', () => {

    /**
     * @tc.number    SUB_CHIP_CSQP2_4100
     * @tc.name      testCounterSequence0041
     * @tc.desc      Verify counter config 1 sequence DDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0041 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.decrease()).assertEqual(1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.getValue()).assertEqual(0);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0041 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_4200
     * @tc.name      testCounterSequence0042
     * @tc.desc      Verify counter config 1 sequence DDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0042 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.decrease()).assertEqual(1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0042 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_4300
     * @tc.name      testCounterSequence0043
     * @tc.desc      Verify counter config 1 sequence DSI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0043 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(5);
      expect(counter.getValue()).assertEqual(5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0043 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_4400
     * @tc.name      testCounterSequence0044
     * @tc.desc      Verify counter config 1 sequence DSD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0044 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0044 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_4500
     * @tc.name      testCounterSequence0045
     * @tc.desc      Verify counter config 1 sequence DSS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0045 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0045 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_4600
     * @tc.name      testCounterSequence0046
     * @tc.desc      Verify counter config 1 sequence SII.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0046 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(5);
      expect(counter.increase()).assertEqual(7);
      expect(counter.getValue()).assertEqual(7);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0046 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_4700
     * @tc.name      testCounterSequence0047
     * @tc.desc      Verify counter config 1 sequence SID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0047 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(5);
      expect(counter.decrease()).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0047 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_4800
     * @tc.name      testCounterSequence0048
     * @tc.desc      Verify counter config 1 sequence SIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0048 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0048 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_4900
     * @tc.name      testCounterSequence0049
     * @tc.desc      Verify counter config 1 sequence SDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0049 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1);
      expect(counter.increase()).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0049 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_5000
     * @tc.name      testCounterSequence0050
     * @tc.desc      Verify counter config 1 sequence SDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0050 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1);
      expect(counter.decrease()).assertEqual(0);
      expect(counter.getValue()).assertEqual(0);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0050 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_5100
     * @tc.name      testCounterSequence0051
     * @tc.desc      Verify counter config 1 sequence SDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0051 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0051 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_5200
     * @tc.name      testCounterSequence0052
     * @tc.desc      Verify counter config 1 sequence SSI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0052 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(5);
      expect(counter.getValue()).assertEqual(5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0052 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_5300
     * @tc.name      testCounterSequence0053
     * @tc.desc      Verify counter config 1 sequence SSD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0053 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0053 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_5400
     * @tc.name      testCounterSequence0054
     * @tc.desc      Verify counter config 1 sequence SSS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0054 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0054 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_5500
     * @tc.name      testCounterSequence0055
     * @tc.desc      Verify counter config 2 sequence III.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0055 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.increase()).assertEqual(-1.5);
      expect(counter.increase()).assertEqual(0.0);
      expect(counter.increase()).assertEqual(1.5);
      expect(counter.getValue()).assertEqual(1.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0055 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_5600
     * @tc.name      testCounterSequence0056
     * @tc.desc      Verify counter config 2 sequence IID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0056 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.increase()).assertEqual(-1.5);
      expect(counter.increase()).assertEqual(0.0);
      expect(counter.decrease()).assertEqual(-1.5);
      expect(counter.getValue()).assertEqual(-1.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0056 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_5700
     * @tc.name      testCounterSequence0057
     * @tc.desc      Verify counter config 2 sequence IIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0057 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.increase()).assertEqual(-1.5);
      expect(counter.increase()).assertEqual(0.0);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0057 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_5800
     * @tc.name      testCounterSequence0058
     * @tc.desc      Verify counter config 2 sequence IDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0058 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.increase()).assertEqual(-1.5);
      expect(counter.decrease()).assertEqual(-3.0);
      expect(counter.increase()).assertEqual(-1.5);
      expect(counter.getValue()).assertEqual(-1.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0058 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_5900
     * @tc.name      testCounterSequence0059
     * @tc.desc      Verify counter config 2 sequence IDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0059 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.increase()).assertEqual(-1.5);
      expect(counter.decrease()).assertEqual(-3.0);
      expect(counter.decrease()).assertEqual(-4.5);
      expect(counter.getValue()).assertEqual(-4.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0059 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_6000
     * @tc.name      testCounterSequence0060
     * @tc.desc      Verify counter config 2 sequence IDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0060 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.increase()).assertEqual(-1.5);
      expect(counter.decrease()).assertEqual(-3.0);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0060 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_6100
     * @tc.name      testCounterSequence0061
     * @tc.desc      Verify counter config 2 sequence ISI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0061 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.increase()).assertEqual(-1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4.5);
      expect(counter.getValue()).assertEqual(4.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0061 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_6200
     * @tc.name      testCounterSequence0062
     * @tc.desc      Verify counter config 2 sequence ISD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0062 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.increase()).assertEqual(-1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1.5);
      expect(counter.getValue()).assertEqual(1.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0062 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_6300
     * @tc.name      testCounterSequence0063
     * @tc.desc      Verify counter config 2 sequence ISS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0063 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.increase()).assertEqual(-1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0063 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_6400
     * @tc.name      testCounterSequence0064
     * @tc.desc      Verify counter config 2 sequence DII.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0064 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.decrease()).assertEqual(-4.5);
      expect(counter.increase()).assertEqual(-3.0);
      expect(counter.increase()).assertEqual(-1.5);
      expect(counter.getValue()).assertEqual(-1.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0064 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_6500
     * @tc.name      testCounterSequence0065
     * @tc.desc      Verify counter config 2 sequence DID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0065 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.decrease()).assertEqual(-4.5);
      expect(counter.increase()).assertEqual(-3.0);
      expect(counter.decrease()).assertEqual(-4.5);
      expect(counter.getValue()).assertEqual(-4.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0065 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_6600
     * @tc.name      testCounterSequence0066
     * @tc.desc      Verify counter config 2 sequence DIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0066 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.decrease()).assertEqual(-4.5);
      expect(counter.increase()).assertEqual(-3.0);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0066 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_6700
     * @tc.name      testCounterSequence0067
     * @tc.desc      Verify counter config 2 sequence DDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0067 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.decrease()).assertEqual(-4.5);
      expect(counter.decrease()).assertEqual(-5);
      expect(counter.increase()).assertEqual(-3.5);
      expect(counter.getValue()).assertEqual(-3.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0067 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_6800
     * @tc.name      testCounterSequence0068
     * @tc.desc      Verify counter config 2 sequence DDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0068 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.decrease()).assertEqual(-4.5);
      expect(counter.decrease()).assertEqual(-5);
      expect(counter.decrease()).assertEqual(-5);
      expect(counter.getValue()).assertEqual(-5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0068 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_6900
     * @tc.name      testCounterSequence0069
     * @tc.desc      Verify counter config 2 sequence DDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0069 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.decrease()).assertEqual(-4.5);
      expect(counter.decrease()).assertEqual(-5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0069 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_7000
     * @tc.name      testCounterSequence0070
     * @tc.desc      Verify counter config 2 sequence DSI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0070 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.decrease()).assertEqual(-4.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4.5);
      expect(counter.getValue()).assertEqual(4.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0070 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_7100
     * @tc.name      testCounterSequence0071
     * @tc.desc      Verify counter config 2 sequence DSD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0071 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.decrease()).assertEqual(-4.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1.5);
      expect(counter.getValue()).assertEqual(1.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0071 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_7200
     * @tc.name      testCounterSequence0072
     * @tc.desc      Verify counter config 2 sequence DSS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0072 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.decrease()).assertEqual(-4.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0072 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_7300
     * @tc.name      testCounterSequence0073
     * @tc.desc      Verify counter config 2 sequence SII.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0073 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4.5);
      expect(counter.increase()).assertEqual(5);
      expect(counter.getValue()).assertEqual(5);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0073 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_7400
     * @tc.name      testCounterSequence0074
     * @tc.desc      Verify counter config 2 sequence SID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0074 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4.5);
      expect(counter.decrease()).assertEqual(3.0);
      expect(counter.getValue()).assertEqual(3.0);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0074 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_7500
     * @tc.name      testCounterSequence0075
     * @tc.desc      Verify counter config 2 sequence SIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0075 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0075 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_7600
     * @tc.name      testCounterSequence0076
     * @tc.desc      Verify counter config 2 sequence SDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0076 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1.5);
      expect(counter.increase()).assertEqual(3.0);
      expect(counter.getValue()).assertEqual(3.0);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0076 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_7700
     * @tc.name      testCounterSequence0077
     * @tc.desc      Verify counter config 2 sequence SDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0077 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1.5);
      expect(counter.decrease()).assertEqual(0.0);
      expect(counter.getValue()).assertEqual(0.0);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0077 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_7800
     * @tc.name      testCounterSequence0078
     * @tc.desc      Verify counter config 2 sequence SDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0078 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0078 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_7900
     * @tc.name      testCounterSequence0079
     * @tc.desc      Verify counter config 2 sequence SSI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0079 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.increase()).assertEqual(4.5);
      expect(counter.getValue()).assertEqual(4.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0079 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP2_8000
     * @tc.name      testCounterSequence0080
     * @tc.desc      Verify counter config 2 sequence SSD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0080 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.decrease()).assertEqual(1.5);
      expect(counter.getValue()).assertEqual(1.5);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0080 end');
    })

  })
}
