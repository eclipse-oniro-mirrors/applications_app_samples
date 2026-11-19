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

/** Logic checks for MultiplexCardState flow (49 cases). */
export default function multiplexCardStateFlowTest(): void {
  describe('MultiplexCardStateFlowTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0001
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0001
     * @tc.desc      MultiplexCardState call flow drag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_MultiplexCardStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0001 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(162);
      logInfo(`step1 drag(162): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drag(10.11);
      logInfo(`step2 drag(10.11): step2=${step2}`);
      expect(step2).assertClose(0.19041430074887172, PRECISION);
      const step3: number = subject.drag(20);
      logInfo(`step3 drag(20): step3=${step3}`);
      expect(step3).assertClose(0.21486584908010964, PRECISION);
      logInfo(`drag>drag>drag final: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.8027777777777777, PRECISION);
      logInfo(`drag>drag>drag final: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.21486584908010964, PRECISION);
      logInfo(`drag>drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(35.00694444444447, PRECISION);
      logInfo(`drag>drag>drag final: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-259.20584446117283, PRECISION);
      logInfo(`drag>drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(20);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0002
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0002
     * @tc.desc      MultiplexCardState call flow drag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_MultiplexCardStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0002 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(60.77);
      logInfo(`step1 drag(60.77): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drag(145);
      logInfo(`step2 drag(145): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.drag(70);
      logInfo(`step3 drag(70): step3=${step3}`);
      expect(step3).assertClose(0.463010166848788, PRECISION);
      logInfo(`drag>drag>drag final: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.8958333333333334, PRECISION);
      logInfo(`drag>drag>drag final: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.463010166848788, PRECISION);
      logInfo(`drag>drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(9.765624999999995, PRECISION);
      logInfo(`drag>drag>drag final: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-142.69089980769232, PRECISION);
      logInfo(`drag>drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(70);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0003
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0003
     * @tc.desc      MultiplexCardState call flow drag > drag > release > drag > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0003 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(24);
      logInfo(`step1 drag(24): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drag(125);
      logInfo(`step2 drag(125): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: number = subject.drag(-44);
      logInfo(`step4 drag(-44): step4=${step4}`);
      expect(step4).assertClose(0.6431309300410623, PRECISION);
      const step5: string = subject.release();
      logInfo(`step5 release(): step5=${step5}`);
      expect(step5).assertEqual('restore');
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0004
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0004
     * @tc.desc      MultiplexCardState call flow drag > release > drag > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0004 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(-56);
      logInfo(`step1 drag(-56): step1=${step1}`);
      expect(step1).assertClose(0.5673474151646605, PRECISION);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('restore');
      const step3: number = subject.drag(-5);
      logInfo(`step3 drag(-5): step3=${step3}`);
      expect(step3).assertClose(0.9523899800016231, PRECISION);
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('restore');
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0005
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0005
     * @tc.desc      MultiplexCardState call flow drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0005 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(130);
      logInfo(`step1 drag(130): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drag(117);
      logInfo(`step2 drag(117): step2=${step2}`);
      expect(step2).assertClose(0.8802548397618468, PRECISION);
      logInfo(`drag>drag final: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.9819444444444444, PRECISION);
      logInfo(`drag>drag final: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.8802548397618468, PRECISION);
      logInfo(`drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.2934027777777793, PRECISION);
      logInfo(`drag>drag final: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-25.768065422232937, PRECISION);
      logInfo(`drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(117);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0006
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0006
     * @tc.desc      MultiplexCardState call flow release > drag > release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0006 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(0);
      logInfo(`step2 drag(0): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('none');
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0007
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0007
     * @tc.desc      MultiplexCardState call flow drag > release > release > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0007 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(55);
      logInfo(`step1 drag(55): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: number = subject.drag(109);
      logInfo(`step4 drag(109): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.drag(28);
      logInfo(`step5 drag(28): step5=${step5}`);
      expect(step5).assertClose(0.4336891249843119, PRECISION);
      logInfo(`drag>release>release>drag>drag final: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.8875, PRECISION);
      logInfo(`drag>release>release>drag>drag final: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.4336891249843119, PRECISION);
      logInfo(`drag>release>release>drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(11.390625000000009, PRECISION);
      logInfo(`drag>release>release>drag>drag final: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-153.51801848389192, PRECISION);
      logInfo(`drag>release>release>drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(28);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0008
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0008
     * @tc.desc      MultiplexCardState call flow drag > release > release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0008 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(149);
      logInfo(`step1 drag(149): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: number = subject.drag(90);
      logInfo(`step4 drag(90): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`drag>release>release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(14.0625, PRECISION);
      logInfo(`drag>release>release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(90);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0009
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0009
     * @tc.desc      MultiplexCardState call flow release > drag > drag > drag > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0009 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(172);
      logInfo(`step2 drag(172): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.drag(45);
      logInfo(`step3 drag(45): step3=${step3}`);
      expect(step3).assertClose(0.2570723564548758, PRECISION);
      const step4: number = subject.drag(24.53);
      logInfo(`step4 drag(24.53): step4=${step4}`);
      expect(step4).assertClose(0.20102971752764093, PRECISION);
      const step5: string = subject.release();
      logInfo(`step5 release(): step5=${step5}`);
      expect(step5).assertEqual('restore');
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0010
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0010
     * @tc.desc      MultiplexCardState call flow drag > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0010 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(-56);
      logInfo(`step1 drag(-56): step1=${step1}`);
      expect(step1).assertClose(0.5673474151646605, PRECISION);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('restore');
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0011
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0011
     * @tc.desc      MultiplexCardState call flow drag > drag > release > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0011 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(180);
      logInfo(`step1 drag(180): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drag(140);
      logInfo(`step2 drag(140): step2=${step2}`);
      expect(step2).assertClose(0.6702470542486266, PRECISION);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('restore');
      const step4: number = subject.drag(20);
      logInfo(`step4 drag(20): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.drag(-1);
      logInfo(`step5 drag(-1): step5=${step5}`);
      expect(step5).assertClose(0.8128543892944481, PRECISION);
      logInfo(`drag>drag>release>drag>drag final: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.9708333333333333, PRECISION);
      logInfo(`drag>drag>release>drag>drag final: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.8128543892944481, PRECISION);
      logInfo(`drag>drag>release>drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.7656250000000004, PRECISION);
      logInfo(`drag>drag>release>drag>drag final: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-41.39915513181985, PRECISION);
      logInfo(`drag>drag>release>drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(-1);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0012
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0012
     * @tc.desc      MultiplexCardState call flow drag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0012 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(-7);
      logInfo(`step1 drag(-7): step1=${step1}`);
      expect(step1).assertClose(0.9338975454299611, PRECISION);
      const step2: number = subject.drag(198);
      logInfo(`step2 drag(198): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.drag(38);
      logInfo(`step3 drag(38): step3=${step3}`);
      expect(step3).assertClose(0.17218238295084082, PRECISION);
      logInfo(`drag>drag>drag final: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.7777777777777778, PRECISION);
      logInfo(`drag>drag>drag final: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.17218238295084082, PRECISION);
      logInfo(`drag>drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(44.444444444444436, PRECISION);
      logInfo(`drag>drag>drag final: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-288.9658014654978, PRECISION);
      logInfo(`drag>drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(38);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0013
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0013
     * @tc.desc      MultiplexCardState call flow release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0013 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(84.31);
      logInfo(`step2 drag(84.31): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(12.340583506944437, PRECISION);
      logInfo(`release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertClose(84.31, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0014
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0014
     * @tc.desc      MultiplexCardState call flow drag > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0014 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(185);
      logInfo(`step1 drag(185): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      logInfo(`drag>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(59.41840277777776, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0015
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0015
     * @tc.desc      MultiplexCardState call flow release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0015 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0016
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0016
     * @tc.desc      MultiplexCardState call flow release > release > release > release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0016 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('none');
      const step5: number = subject.drag(3);
      logInfo(`step5 drag(3): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`release>release>release>release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.015624999999999889, PRECISION);
      logInfo(`release>release>release>release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(3);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0017
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0017
     * @tc.desc      MultiplexCardState call flow drag > release > release > release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0017 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(119);
      logInfo(`step1 drag(119): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('none');
      const step5: string = subject.release();
      logInfo(`step5 release(): step5=${step5}`);
      expect(step5).assertEqual('none');
      logInfo(`drag>release>release>release>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(24.585069444444468, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0018
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0018
     * @tc.desc      MultiplexCardState call flow drag > release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0018 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(100);
      logInfo(`step1 drag(100): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: number = subject.drag(90);
      logInfo(`step3 drag(90): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`drag>release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(14.0625, PRECISION);
      logInfo(`drag>release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(90);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0019
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0019
     * @tc.desc      MultiplexCardState call flow drag > release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0019 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(110);
      logInfo(`step1 drag(110): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      logInfo(`drag>release>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(21.006944444444418, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0020
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0020
     * @tc.desc      MultiplexCardState call flow release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0020 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(135);
      logInfo(`step2 drag(135): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(31.640625, PRECISION);
      logInfo(`release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(135);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0021
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0021
     * @tc.desc      MultiplexCardState call flow release > drag > release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0021 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(16.29);
      logInfo(`step2 drag(16.29): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: number = subject.drag(26.7);
      logInfo(`step4 drag(26.7): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`release>drag>release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(1.2376562500000017, PRECISION);
      logInfo(`release>drag>release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertClose(26.7, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0022
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0022
     * @tc.desc      MultiplexCardState call flow drag > release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0022 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(60);
      logInfo(`step1 drag(60): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      logInfo(`drag>release>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(6.249999999999989, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0023
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0023
     * @tc.desc      MultiplexCardState call flow release > release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0023 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0024
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0024
     * @tc.desc      MultiplexCardState call flow drag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0024 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(108);
      logInfo(`step1 drag(108): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drag(88.7);
      logInfo(`step2 drag(88.7): step2=${step2}`);
      expect(step2).assertClose(0.8267940592477421, PRECISION);
      const step3: number = subject.drag(131);
      logInfo(`step3 drag(131): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`drag>drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.918402777777784, PRECISION);
      logInfo(`drag>drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(131);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0025
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0025
     * @tc.desc      MultiplexCardState call flow release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0025 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(100);
      logInfo(`step2 drag(100): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(17.3611111111111, PRECISION);
      logInfo(`release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(100);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0026
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0026
     * @tc.desc      MultiplexCardState call flow drag > release > release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0026 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(195);
      logInfo(`step1 drag(195): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: number = subject.drag(25);
      logInfo(`step4 drag(25): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`drag>release>release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(1.0850694444444506, PRECISION);
      logInfo(`drag>release>release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(25);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0027
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0027
     * @tc.desc      MultiplexCardState call flow drag > drag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0027 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(77.41);
      logInfo(`step1 drag(77.41): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drag(11.29);
      logInfo(`step2 drag(11.29): step2=${step2}`);
      expect(step2).assertClose(0.5095172626261183, PRECISION);
      const step3: number = subject.drag(28.3);
      logInfo(`step3 drag(28.3): step3=${step3}`);
      expect(step3).assertClose(0.6098622540643991, PRECISION);
      const step4: number = subject.drag(117);
      logInfo(`step4 drag(117): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`drag>drag>drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(2.7211251736111177, PRECISION);
      logInfo(`drag>drag>drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(117);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0028
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0028
     * @tc.desc      MultiplexCardState call flow drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0028 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(-11);
      logInfo(`step1 drag(-11): step1=${step1}`);
      expect(step1).assertClose(0.8978342555737018, PRECISION);
      const step2: number = subject.drag(10.11);
      logInfo(`step2 drag(10.11): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.1774515625000016, PRECISION);
      logInfo(`drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertClose(10.11, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0029
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0029
     * @tc.desc      MultiplexCardState call flow drag > drag > release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0029 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(198);
      logInfo(`step1 drag(198): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drag(86.49);
      logInfo(`step2 drag(86.49): step2=${step2}`);
      expect(step2).assertClose(0.307926200033953, PRECISION);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('restore');
      const step4: number = subject.drag(13);
      logInfo(`step4 drag(13): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`drag>drag>release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.2934027777777757, PRECISION);
      logInfo(`drag>drag>release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(13);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0030
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0030
     * @tc.desc      MultiplexCardState call flow release > release > release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0030 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('none');
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0031
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0031
     * @tc.desc      MultiplexCardState call flow drag > release > drag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0031 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(-22);
      logInfo(`step1 drag(-22): step1=${step1}`);
      expect(step1).assertClose(0.8047490697651618, PRECISION);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('restore');
      const step3: number = subject.drag(106);
      logInfo(`step3 drag(106): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.drag(-56);
      logInfo(`step4 drag(-56): step4=${step4}`);
      expect(step4).assertClose(0.16792367011108403, PRECISION);
      const step5: number = subject.drag(88);
      logInfo(`step5 drag(88): step5=${step5}`);
      expect(step5).assertClose(0.8375915934997564, PRECISION);
      logInfo(`drag>release>drag>drag>drag final: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.9750000000000001, PRECISION);
      logInfo(`drag>release>drag>drag>drag final: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.8375915934997564, PRECISION);
      logInfo(`drag>release>drag>drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.562499999999996, PRECISION);
      logInfo(`drag>release>drag>drag>drag final: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-35.557362130134834, PRECISION);
      logInfo(`drag>release>drag>drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(88);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0032
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0032
     * @tc.desc      MultiplexCardState call flow release > drag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0032 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(-100);
      logInfo(`step2 drag(-100): step2=${step2}`);
      expect(step2).assertClose(0.35108667882038136, PRECISION);
      const step3: number = subject.drag(119);
      logInfo(`step3 drag(119): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.drag(105);
      logInfo(`step4 drag(105): step4=${step4}`);
      expect(step4).assertClose(0.8715763401234872, PRECISION);
      logInfo(`release>drag>drag>drag final: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.9805555555555555, PRECISION);
      logInfo(`release>drag>drag>drag final: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.8715763401234872, PRECISION);
      logInfo(`release>drag>drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.34027777777777923, PRECISION);
      logInfo(`release>drag>drag>drag final: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-27.731255910356907, PRECISION);
      logInfo(`release>drag>drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(105);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0033
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0033
     * @tc.desc      MultiplexCardState call flow drag > release > drag > release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0033 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(155);
      logInfo(`step1 drag(155): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: number = subject.drag(125);
      logInfo(`step3 drag(125): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('none');
      const step5: number = subject.drag(172);
      logInfo(`step5 drag(172): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`drag>release>drag>release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(51.36111111111113, PRECISION);
      logInfo(`drag>release>drag>release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(172);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0034
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0034
     * @tc.desc      MultiplexCardState call flow drag > release > drag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0034 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(106);
      logInfo(`step1 drag(106): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: number = subject.drag(-54);
      logInfo(`step3 drag(-54): step3=${step3}`);
      expect(step3).assertClose(0.5794181953918459, PRECISION);
      const step4: number = subject.drag(88.7);
      logInfo(`step4 drag(88.7): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.drag(4.31);
      logInfo(`step5 drag(4.31): step5=${step5}`);
      expect(step5).assertClose(0.4178376537152967, PRECISION);
      logInfo(`drag>release>drag>drag>drag final: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.8827916666666666, PRECISION);
      logInfo(`drag>release>drag>drag>drag final: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.4178376537152967, PRECISION);
      logInfo(`drag>release>drag>drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(12.364014062500006, PRECISION);
      logInfo(`drag>release>drag>drag>drag final: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-159.59954042649505, PRECISION);
      logInfo(`drag>release>drag>drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertClose(4.31, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0035
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0035
     * @tc.desc      MultiplexCardState call flow release > drag > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0035 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(131);
      logInfo(`step2 drag(131): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      logInfo(`release>drag>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(29.793402777777786, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0036
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0036
     * @tc.desc      MultiplexCardState call flow release > release > release > drag > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0036 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: number = subject.drag(198);
      logInfo(`step4 drag(198): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.release();
      logInfo(`step5 release(): step5=${step5}`);
      expect(step5).assertEqual('none');
      logInfo(`release>release>release>drag>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(68.06249999999994, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0037
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0037
     * @tc.desc      MultiplexCardState call flow release > drag > release > drag > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0037 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(4.31);
      logInfo(`step2 drag(4.31): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: number = subject.drag(154);
      logInfo(`step4 drag(154): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.release();
      logInfo(`step5 release(): step5=${step5}`);
      expect(step5).assertEqual('none');
      logInfo(`release>drag>release>drag>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(41.17361111111108, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0038
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0038
     * @tc.desc      MultiplexCardState call flow drag > release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0038 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(180);
      logInfo(`step1 drag(180): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: number = subject.drag(1);
      logInfo(`step3 drag(1): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`drag>release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.0017361111111110989, PRECISION);
      logInfo(`drag>release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(1);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0039
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0039
     * @tc.desc      MultiplexCardState call flow drag > drag > release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0039 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(38);
      logInfo(`step1 drag(38): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drag(65);
      logInfo(`step2 drag(65): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('none');
      logInfo(`drag>drag>release>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(1.265625000000006, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0040
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0040
     * @tc.desc      MultiplexCardState call flow release > release > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0040 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: number = subject.drag(10);
      logInfo(`step3 drag(10): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`release>release>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.17361111111110988, PRECISION);
      logInfo(`release>release>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(10);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0041
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0041
     * @tc.desc      MultiplexCardState call flow release > drag > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0041 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(-100);
      logInfo(`step2 drag(-100): step2=${step2}`);
      expect(step2).assertClose(0.35108667882038136, PRECISION);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('restore');
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0042
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0042
     * @tc.desc      MultiplexCardState call flow drag > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0042 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(30);
      logInfo(`step1 drag(30): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      logInfo(`drag>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(1.5625000000000056, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0043
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0043
     * @tc.desc      MultiplexCardState call flow drag > release > drag > release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0043 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(-38);
      logInfo(`step1 drag(-38): step1=${step1}`);
      expect(step1).assertClose(0.6841686145994845, PRECISION);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('restore');
      const step3: number = subject.drag(85);
      logInfo(`step3 drag(85): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('none');
      const step5: string = subject.release();
      logInfo(`step5 release(): step5=${step5}`);
      expect(step5).assertEqual('none');
      logInfo(`drag>release>drag>release>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(12.543402777777784, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0044
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0044
     * @tc.desc      MultiplexCardState call flow drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0044 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(162);
      logInfo(`step1 drag(162): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drag(135);
      logInfo(`step2 drag(135): step2=${step2}`);
      expect(step2).assertClose(0.7652532227922918, PRECISION);
      logInfo(`drag>drag final: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.9625, PRECISION);
      logInfo(`drag>drag final: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.7652532227922918, PRECISION);
      logInfo(`drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(1.2656249999999984, PRECISION);
      logInfo(`drag>drag final: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-53.01212129671161, PRECISION);
      logInfo(`drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(135);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0045
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0045
     * @tc.desc      MultiplexCardState call flow release > drag > release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0045 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(3);
      logInfo(`step2 drag(3): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('none');
      logInfo(`release>drag>release>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.015624999999999889, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0046
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0046
     * @tc.desc      MultiplexCardState call flow release > release > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0046 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('none');
      const step3: number = subject.drag(24);
      logInfo(`step3 drag(24): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.drag(190);
      logInfo(`step4 drag(190): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`release>release>drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(47.84027777777781, PRECISION);
      logInfo(`release>release>drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(190);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0047
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0047
     * @tc.desc      MultiplexCardState call flow drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0047 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(24.53);
      logInfo(`step1 drag(24.53): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drag(-33);
      logInfo(`step2 drag(-33): step2=${step2}`);
      expect(step2).assertClose(0.5582593903489589, PRECISION);
      logInfo(`drag>drag final: subject.sx=${subject.sx}`);
      expect(subject.sx).assertClose(0.9200972222222222, PRECISION);
      logInfo(`drag>drag final: subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertClose(0.5582593903489589, PRECISION);
      logInfo(`drag>drag final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(5.746008506944442, PRECISION);
      logInfo(`drag>drag final: subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertClose(-110.69426377137813, PRECISION);
      logInfo(`drag>drag final: subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(-33);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0048
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0048
     * @tc.desc      MultiplexCardState call flow release > drag > release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0048 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: string = subject.release();
      logInfo(`step1 release(): step1=${step1}`);
      expect(step1).assertEqual('none');
      const step2: number = subject.drag(10);
      logInfo(`step2 drag(10): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      const step4: string = subject.release();
      logInfo(`step4 release(): step4=${step4}`);
      expect(step4).assertEqual('none');
      logInfo(`release>drag>release>release final: subject.angle=${subject.angle}`);
      expect(subject.angle).assertClose(0.17361111111110988, PRECISION);
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_FLOW_0049
     * @tc.name      ComponentCollection_MultiplexCardStateFlow_0049
     * @tc.desc      MultiplexCardState call flow drag > release > release keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_MultiplexCardStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0049 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      const step1: number = subject.drag(-25);
      logInfo(`step1 drag(-25): step1=${step1}`);
      expect(step1).assertClose(0.7808473794180127, PRECISION);
      const step2: string = subject.release();
      logInfo(`step2 release(): step2=${step2}`);
      expect(step2).assertEqual('restore');
      const step3: string = subject.release();
      logInfo(`step3 release(): step3=${step3}`);
      expect(step3).assertEqual('none');
      logInfo(`${BUNDLE}MultiplexCardStateFlow_0049 end`);
    });
  });
}
