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

export default function CounterSequenceMatrixPart3Test(): void {
  describe('CounterSequenceMatrixPart3', () => {

    /**
     * @tc.number    SUB_CHIP_CSQP3_8100
     * @tc.name      testCounterSequence0081
     * @tc.desc      Verify counter config 2 sequence SSS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0081 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(-3, -5, 5, 1.5);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.setValue(3)).assertEqual(3);
      expect(counter.getValue()).assertEqual(3);
      expect(counter.atMax()).assertEqual(false);
      expect(counter.atMin()).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0081 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_8200
     * @tc.name      testCounterSequence0082
     * @tc.desc      Verify counter config 3 sequence III.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0082 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0082 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_8300
     * @tc.name      testCounterSequence0083
     * @tc.desc      Verify counter config 3 sequence IID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0083 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0083 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_8400
     * @tc.name      testCounterSequence0084
     * @tc.desc      Verify counter config 3 sequence IIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0084 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0084 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_8500
     * @tc.name      testCounterSequence0085
     * @tc.desc      Verify counter config 3 sequence IDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0085 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0085 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_8600
     * @tc.name      testCounterSequence0086
     * @tc.desc      Verify counter config 3 sequence IDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0086 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0086 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_8700
     * @tc.name      testCounterSequence0087
     * @tc.desc      Verify counter config 3 sequence IDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0087 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0087 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_8800
     * @tc.name      testCounterSequence0088
     * @tc.desc      Verify counter config 3 sequence ISI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0088 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0088 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_8900
     * @tc.name      testCounterSequence0089
     * @tc.desc      Verify counter config 3 sequence ISD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0089 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0089 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_9000
     * @tc.name      testCounterSequence0090
     * @tc.desc      Verify counter config 3 sequence ISS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0090 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0090 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_9100
     * @tc.name      testCounterSequence0091
     * @tc.desc      Verify counter config 3 sequence DII.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0091 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0091 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_9200
     * @tc.name      testCounterSequence0092
     * @tc.desc      Verify counter config 3 sequence DID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0092 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0092 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_9300
     * @tc.name      testCounterSequence0093
     * @tc.desc      Verify counter config 3 sequence DIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0093 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0093 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_9400
     * @tc.name      testCounterSequence0094
     * @tc.desc      Verify counter config 3 sequence DDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0094 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0094 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_9500
     * @tc.name      testCounterSequence0095
     * @tc.desc      Verify counter config 3 sequence DDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0095 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0095 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_9600
     * @tc.name      testCounterSequence0096
     * @tc.desc      Verify counter config 3 sequence DDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0096 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0096 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_9700
     * @tc.name      testCounterSequence0097
     * @tc.desc      Verify counter config 3 sequence DSI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0097 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0097 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_9800
     * @tc.name      testCounterSequence0098
     * @tc.desc      Verify counter config 3 sequence DSD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0098 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0098 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_9900
     * @tc.name      testCounterSequence0099
     * @tc.desc      Verify counter config 3 sequence DSS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0099 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0099 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_10000
     * @tc.name      testCounterSequence0100
     * @tc.desc      Verify counter config 3 sequence SII.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0100 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0100 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_10100
     * @tc.name      testCounterSequence0101
     * @tc.desc      Verify counter config 3 sequence SID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0101 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0101 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_10200
     * @tc.name      testCounterSequence0102
     * @tc.desc      Verify counter config 3 sequence SIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0102 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0102 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_10300
     * @tc.name      testCounterSequence0103
     * @tc.desc      Verify counter config 3 sequence SDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0103 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0103 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_10400
     * @tc.name      testCounterSequence0104
     * @tc.desc      Verify counter config 3 sequence SDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0104 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0104 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_10500
     * @tc.name      testCounterSequence0105
     * @tc.desc      Verify counter config 3 sequence SDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0105 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0105 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_10600
     * @tc.name      testCounterSequence0106
     * @tc.desc      Verify counter config 3 sequence SSI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0106 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0106 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_10700
     * @tc.name      testCounterSequence0107
     * @tc.desc      Verify counter config 3 sequence SSD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0107 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0107 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_10800
     * @tc.name      testCounterSequence0108
     * @tc.desc      Verify counter config 3 sequence SSS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0108 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(10, 10, 10, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0108 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_10900
     * @tc.name      testCounterSequence0109
     * @tc.desc      Verify counter config 4 sequence III.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0109 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0109 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_11000
     * @tc.name      testCounterSequence0110
     * @tc.desc      Verify counter config 4 sequence IID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0110 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0110 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_11100
     * @tc.name      testCounterSequence0111
     * @tc.desc      Verify counter config 4 sequence IIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0111 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0111 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_11200
     * @tc.name      testCounterSequence0112
     * @tc.desc      Verify counter config 4 sequence IDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0112 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0112 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_11300
     * @tc.name      testCounterSequence0113
     * @tc.desc      Verify counter config 4 sequence IDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0113 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0113 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_11400
     * @tc.name      testCounterSequence0114
     * @tc.desc      Verify counter config 4 sequence IDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0114 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0114 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_11500
     * @tc.name      testCounterSequence0115
     * @tc.desc      Verify counter config 4 sequence ISI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0115 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0115 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_11600
     * @tc.name      testCounterSequence0116
     * @tc.desc      Verify counter config 4 sequence ISD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0116 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0116 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_11700
     * @tc.name      testCounterSequence0117
     * @tc.desc      Verify counter config 4 sequence ISS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0117 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.increase()).assertEqual(1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0117 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_11800
     * @tc.name      testCounterSequence0118
     * @tc.desc      Verify counter config 4 sequence DII.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0118 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0118 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_11900
     * @tc.name      testCounterSequence0119
     * @tc.desc      Verify counter config 4 sequence DID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0119 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0119 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP3_12000
     * @tc.name      testCounterSequence0120
     * @tc.desc      Verify counter config 4 sequence DIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0120 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0120 end');
    })

  })
}
