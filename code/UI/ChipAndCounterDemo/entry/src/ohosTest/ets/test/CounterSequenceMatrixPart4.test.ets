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

export default function CounterSequenceMatrixPart4Test(): void {
  describe('CounterSequenceMatrixPart4', () => {

    /**
     * @tc.number    SUB_CHIP_CSQP4_12100
     * @tc.name      testCounterSequence0121
     * @tc.desc      Verify counter config 4 sequence DDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0121 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0121 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_12200
     * @tc.name      testCounterSequence0122
     * @tc.desc      Verify counter config 4 sequence DDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0122 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0122 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_12300
     * @tc.name      testCounterSequence0123
     * @tc.desc      Verify counter config 4 sequence DDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0123 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0123 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_12400
     * @tc.name      testCounterSequence0124
     * @tc.desc      Verify counter config 4 sequence DSI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0124 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0124 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_12500
     * @tc.name      testCounterSequence0125
     * @tc.desc      Verify counter config 4 sequence DSD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0125 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0125 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_12600
     * @tc.name      testCounterSequence0126
     * @tc.desc      Verify counter config 4 sequence DSS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0126 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0126 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_12700
     * @tc.name      testCounterSequence0127
     * @tc.desc      Verify counter config 4 sequence SII.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0127 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.increase()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0127 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_12800
     * @tc.name      testCounterSequence0128
     * @tc.desc      Verify counter config 4 sequence SID.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0128 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0128 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_12900
     * @tc.name      testCounterSequence0129
     * @tc.desc      Verify counter config 4 sequence SIS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0129 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0129 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_13000
     * @tc.name      testCounterSequence0130
     * @tc.desc      Verify counter config 4 sequence SDI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0130 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0130 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_13100
     * @tc.name      testCounterSequence0131
     * @tc.desc      Verify counter config 4 sequence SDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0131 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0131 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_13200
     * @tc.name      testCounterSequence0132
     * @tc.desc      Verify counter config 4 sequence SDS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0132 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0132 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_13300
     * @tc.name      testCounterSequence0133
     * @tc.desc      Verify counter config 4 sequence SSI.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0133 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.increase()).assertEqual(1);
      expect(counter.getValue()).assertEqual(1);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0133 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_13400
     * @tc.name      testCounterSequence0134
     * @tc.desc      Verify counter config 4 sequence SSD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0134 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.decrease()).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0134 end');
    })

    /**
     * @tc.number    SUB_CHIP_CSQP4_13500
     * @tc.name      testCounterSequence0135
     * @tc.desc      Verify counter config 4 sequence SSS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCounterSequence0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0135 begin');
      await delayTick();
      const counter: CounterLogic = new CounterLogic(2, 10, 1, 1);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.setValue(3)).assertEqual(10);
      expect(counter.getValue()).assertEqual(10);
      expect(counter.atMax()).assertEqual(true);
      expect(counter.atMin()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCounterSequence0135 end');
    })

  })
}
