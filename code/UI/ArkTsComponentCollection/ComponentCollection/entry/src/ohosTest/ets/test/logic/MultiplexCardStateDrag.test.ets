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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MultiplexCardState } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for MultiplexCardState.drag (49 cases). */
export default function multiplexCardStateDragTest(): void {
  describe('MultiplexCardStateDragTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0001
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0001
     * @tc.desc      MultiplexCardState.drag(offsetY=-100) yields 0.35108667882038136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_MultiplexCardStateDrag_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0001 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(-100);
      logInfo(`drag(offsetY=-100): actual=${actual}`);
      expect(actual).assertClose(0.35108667882038136, PRECISION);
      logInfo(`drag(offsetY=-100) state: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.8611111111111112, PRECISION);
      logInfo(`drag(offsetY=-100) state: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.35108667882038136, PRECISION);
      logInfo(`drag(offsetY=-100) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(17.3611111111111, PRECISION);
      logInfo(`drag(offsetY=-100) state: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-187.27650467740477, PRECISION);
      logInfo(`drag(offsetY=-100) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(-100);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0002
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0002
     * @tc.desc      MultiplexCardState.drag(offsetY=-1) yields 0.9903181933957332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_MultiplexCardStateDrag_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0002 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(-1);
      logInfo(`drag(offsetY=-1): actual=${actual}`);
      expect(actual).assertClose(0.9903181933957332, PRECISION);
      logInfo(`drag(offsetY=-1) state: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.9986111111111111, PRECISION);
      logInfo(`drag(offsetY=-1) state: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.9903181933957332, PRECISION);
      logInfo(`drag(offsetY=-1) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.0017361111111110989, PRECISION);
      logInfo(`drag(offsetY=-1) state: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-1.9986123957812292, PRECISION);
      logInfo(`drag(offsetY=-1) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(-1);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0003
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0003
     * @tc.desc      MultiplexCardState.drag(offsetY=0) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_MultiplexCardStateDrag_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0003 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(0);
      logInfo(`drag(offsetY=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0004
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0004
     * @tc.desc      MultiplexCardState.drag(offsetY=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_MultiplexCardStateDrag_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0004 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(1);
      logInfo(`drag(offsetY=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=1) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.0017361111111110989, PRECISION);
      logInfo(`drag(offsetY=1) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(1);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0005
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0005
     * @tc.desc      MultiplexCardState.drag(offsetY=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_MultiplexCardStateDrag_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0005 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(2);
      logInfo(`drag(offsetY=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=2) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.0069444444444443955, PRECISION);
      logInfo(`drag(offsetY=2) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(2);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0006
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0006
     * @tc.desc      MultiplexCardState.drag(offsetY=50) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0006 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(50);
      logInfo(`drag(offsetY=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=50) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(4.340277777777775, PRECISION);
      logInfo(`drag(offsetY=50) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(50);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0007
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0007
     * @tc.desc      MultiplexCardState.drag(offsetY=100) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0007 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(100);
      logInfo(`drag(offsetY=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=100) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(17.3611111111111, PRECISION);
      logInfo(`drag(offsetY=100) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(100);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0008
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0008
     * @tc.desc      MultiplexCardState.drag(offsetY=3) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0008 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(3);
      logInfo(`drag(offsetY=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=3) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.015624999999999889, PRECISION);
      logInfo(`drag(offsetY=3) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(3);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0009
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0009
     * @tc.desc      MultiplexCardState.drag(offsetY=10) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0009 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(10);
      logInfo(`drag(offsetY=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=10) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.17361111111110988, PRECISION);
      logInfo(`drag(offsetY=10) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(10);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0010
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0010
     * @tc.desc      MultiplexCardState.drag(offsetY=5) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0010 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(5);
      logInfo(`drag(offsetY=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=5) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.04340277777777747, PRECISION);
      logInfo(`drag(offsetY=5) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(5);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0011
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0011
     * @tc.desc      MultiplexCardState.drag(offsetY=15) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0011 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(15);
      logInfo(`drag(offsetY=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=15) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.3906249999999972, PRECISION);
      logInfo(`drag(offsetY=15) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(15);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0012
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0012
     * @tc.desc      MultiplexCardState.drag(offsetY=20) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0012 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(20);
      logInfo(`drag(offsetY=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=20) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.6944444444444395, PRECISION);
      logInfo(`drag(offsetY=20) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(20);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0013
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0013
     * @tc.desc      MultiplexCardState.drag(offsetY=25) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0013 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(25);
      logInfo(`drag(offsetY=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=25) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(1.0850694444444506, PRECISION);
      logInfo(`drag(offsetY=25) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(25);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0014
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0014
     * @tc.desc      MultiplexCardState.drag(offsetY=30) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0014 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(30);
      logInfo(`drag(offsetY=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=30) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(1.5625000000000056, PRECISION);
      logInfo(`drag(offsetY=30) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(30);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0015
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0015
     * @tc.desc      MultiplexCardState.drag(offsetY=35) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0015 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(35);
      logInfo(`drag(offsetY=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=35) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(2.1267361111111156, PRECISION);
      logInfo(`drag(offsetY=35) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(35);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0016
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0016
     * @tc.desc      MultiplexCardState.drag(offsetY=40) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0016 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(40);
      logInfo(`drag(offsetY=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=40) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(2.7777777777777803, PRECISION);
      logInfo(`drag(offsetY=40) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(40);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0017
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0017
     * @tc.desc      MultiplexCardState.drag(offsetY=45) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0017 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(45);
      logInfo(`drag(offsetY=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=45) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(3.515625, PRECISION);
      logInfo(`drag(offsetY=45) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(45);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0018
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0018
     * @tc.desc      MultiplexCardState.drag(offsetY=55) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0018 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(55);
      logInfo(`drag(offsetY=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=55) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(5.2517361111111045, PRECISION);
      logInfo(`drag(offsetY=55) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(55);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0019
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0019
     * @tc.desc      MultiplexCardState.drag(offsetY=60) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0019 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(60);
      logInfo(`drag(offsetY=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=60) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(6.249999999999989, PRECISION);
      logInfo(`drag(offsetY=60) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(60);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0020
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0020
     * @tc.desc      MultiplexCardState.drag(offsetY=65) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0020 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(65);
      logInfo(`drag(offsetY=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=65) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(7.335069444444429, PRECISION);
      logInfo(`drag(offsetY=65) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(65);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0021
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0021
     * @tc.desc      MultiplexCardState.drag(offsetY=70) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0021 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(70);
      logInfo(`drag(offsetY=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=70) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(8.506944444444462, PRECISION);
      logInfo(`drag(offsetY=70) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(70);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0022
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0022
     * @tc.desc      MultiplexCardState.drag(offsetY=75) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0022 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(75);
      logInfo(`drag(offsetY=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=75) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(9.765625000000014, PRECISION);
      logInfo(`drag(offsetY=75) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(75);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0023
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0023
     * @tc.desc      MultiplexCardState.drag(offsetY=80) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0023 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(80);
      logInfo(`drag(offsetY=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=80) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(11.111111111111121, PRECISION);
      logInfo(`drag(offsetY=80) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(80);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0024
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0024
     * @tc.desc      MultiplexCardState.drag(offsetY=85) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0024 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(85);
      logInfo(`drag(offsetY=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=85) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(12.543402777777784, PRECISION);
      logInfo(`drag(offsetY=85) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(85);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0025
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0025
     * @tc.desc      MultiplexCardState.drag(offsetY=90) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0025 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(90);
      logInfo(`drag(offsetY=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=90) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(14.0625, PRECISION);
      logInfo(`drag(offsetY=90) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(90);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0026
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0026
     * @tc.desc      MultiplexCardState.drag(offsetY=95) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0026 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(95);
      logInfo(`drag(offsetY=95): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=95) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(15.668402777777771, PRECISION);
      logInfo(`drag(offsetY=95) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(95);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0027
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0027
     * @tc.desc      MultiplexCardState.drag(offsetY=105) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0027 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(105);
      logInfo(`drag(offsetY=105): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=105) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(19.140624999999986, PRECISION);
      logInfo(`drag(offsetY=105) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(105);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0028
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0028
     * @tc.desc      MultiplexCardState.drag(offsetY=110) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0028 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(110);
      logInfo(`drag(offsetY=110): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=110) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(21.006944444444418, PRECISION);
      logInfo(`drag(offsetY=110) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(110);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0029
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0029
     * @tc.desc      MultiplexCardState.drag(offsetY=115) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0029 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(115);
      logInfo(`drag(offsetY=115): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=115) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(22.96006944444447, PRECISION);
      logInfo(`drag(offsetY=115) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(115);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0030
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0030
     * @tc.desc      MultiplexCardState.drag(offsetY=120) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0030 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(120);
      logInfo(`drag(offsetY=120): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=120) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(25.000000000000018, PRECISION);
      logInfo(`drag(offsetY=120) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(120);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0031
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0031
     * @tc.desc      MultiplexCardState.drag(offsetY=125) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0031 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(125);
      logInfo(`drag(offsetY=125): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=125) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(27.126736111111125, PRECISION);
      logInfo(`drag(offsetY=125) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(125);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0032
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0032
     * @tc.desc      MultiplexCardState.drag(offsetY=130) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0032 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(130);
      logInfo(`drag(offsetY=130): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=130) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(29.34027777777779, PRECISION);
      logInfo(`drag(offsetY=130) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(130);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0033
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0033
     * @tc.desc      MultiplexCardState.drag(offsetY=135) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0033 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(135);
      logInfo(`drag(offsetY=135): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=135) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(31.640625, PRECISION);
      logInfo(`drag(offsetY=135) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(135);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0034
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0034
     * @tc.desc      MultiplexCardState.drag(offsetY=140) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0034 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(140);
      logInfo(`drag(offsetY=140): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=140) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(34.027777777777764, PRECISION);
      logInfo(`drag(offsetY=140) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(140);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0035
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0035
     * @tc.desc      MultiplexCardState.drag(offsetY=145) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0035 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(145);
      logInfo(`drag(offsetY=145): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=145) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(36.50173611111109, PRECISION);
      logInfo(`drag(offsetY=145) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(145);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0036
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0036
     * @tc.desc      MultiplexCardState.drag(offsetY=150) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0036 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(150);
      logInfo(`drag(offsetY=150): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=150) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(39.06249999999998, PRECISION);
      logInfo(`drag(offsetY=150) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(150);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0037
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0037
     * @tc.desc      MultiplexCardState.drag(offsetY=155) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0037 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(155);
      logInfo(`drag(offsetY=155): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=155) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(41.71006944444441, PRECISION);
      logInfo(`drag(offsetY=155) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(155);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0038
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0038
     * @tc.desc      MultiplexCardState.drag(offsetY=160) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0038 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(160);
      logInfo(`drag(offsetY=160): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=160) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(44.444444444444485, PRECISION);
      logInfo(`drag(offsetY=160) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(160);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0039
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0039
     * @tc.desc      MultiplexCardState.drag(offsetY=165) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0039 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(165);
      logInfo(`drag(offsetY=165): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=165) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(47.26562500000002, PRECISION);
      logInfo(`drag(offsetY=165) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(165);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0040
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0040
     * @tc.desc      MultiplexCardState.drag(offsetY=170) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0040 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(170);
      logInfo(`drag(offsetY=170): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=170) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(50.173611111111136, PRECISION);
      logInfo(`drag(offsetY=170) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(170);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0041
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0041
     * @tc.desc      MultiplexCardState.drag(offsetY=175) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0041 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(175);
      logInfo(`drag(offsetY=175): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=175) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(53.16840277777779, PRECISION);
      logInfo(`drag(offsetY=175) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(175);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0042
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0042
     * @tc.desc      MultiplexCardState.drag(offsetY=180) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0042 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(180);
      logInfo(`drag(offsetY=180): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=180) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(56.25, PRECISION);
      logInfo(`drag(offsetY=180) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(180);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0043
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0043
     * @tc.desc      MultiplexCardState.drag(offsetY=185) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0043 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(185);
      logInfo(`drag(offsetY=185): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=185) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(59.41840277777776, PRECISION);
      logInfo(`drag(offsetY=185) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(185);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0044
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0044
     * @tc.desc      MultiplexCardState.drag(offsetY=190) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0044 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(190);
      logInfo(`drag(offsetY=190): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=190) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(62.673611111111086, PRECISION);
      logInfo(`drag(offsetY=190) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(190);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0045
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0045
     * @tc.desc      MultiplexCardState.drag(offsetY=195) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0045 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(195);
      logInfo(`drag(offsetY=195): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=195) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(66.01562499999997, PRECISION);
      logInfo(`drag(offsetY=195) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(195);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0046
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0046
     * @tc.desc      MultiplexCardState.drag(offsetY=200) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0046 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(200);
      logInfo(`drag(offsetY=200): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=200) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(69.4444444444444, PRECISION);
      logInfo(`drag(offsetY=200) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(200);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0047
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0047
     * @tc.desc      MultiplexCardState.drag(offsetY=-83) yields 0.4242760836078986
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_MultiplexCardStateDrag_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0047 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(-83);
      logInfo(`drag(offsetY=-83): actual=${actual}`);
      expect(actual).assertClose(0.4242760836078986, PRECISION);
      logInfo(`drag(offsetY=-83) state: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.8847222222222222, PRECISION);
      logInfo(`drag(offsetY=-83) state: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.4242760836078986, PRECISION);
      logInfo(`drag(offsetY=-83) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(11.960069444444452, PRECISION);
      logInfo(`drag(offsetY=-83) state: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-157.1090427887914, PRECISION);
      logInfo(`drag(offsetY=-83) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(-83);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0048
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0048
     * @tc.desc      MultiplexCardState.drag(offsetY=162) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0048 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(162);
      logInfo(`drag(offsetY=162): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=162) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(45.562500000000036, PRECISION);
      logInfo(`drag(offsetY=162) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(162);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_DRAG_0049
     * @tc.name      ComponentCollection_MultiplexCardStateDrag_0049
     * @tc.desc      MultiplexCardState.drag(offsetY=77.41) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateDrag_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0049 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const actual: number = subject.drag(77.41);
      logInfo(`drag(offsetY=77.41): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`drag(offsetY=77.41) state: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(10.403312673611115, PRECISION);
      logInfo(`drag(offsetY=77.41) state: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertClose(77.41, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateDrag_0049 end`);
    });
  });
}
