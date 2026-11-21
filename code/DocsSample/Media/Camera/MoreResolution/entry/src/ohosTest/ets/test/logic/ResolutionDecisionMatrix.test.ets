/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  resolutionLabel,
  findResolutionIndex,
  resolutionRatio,
  configRatioForSelectedIndex,
  angleDiff,
  xComponentSizeText,
  switchCameraPosition,
} from '../model/ResolutionLogic';

/** ResolutionDecisionMatrixTest logic checks (480 cases). */
export default function resolutionDecisionMatrixTest(): void {
  describe('ResolutionDecisionMatrixTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0001
     * @tc.name      Resolution_DecisionMatrix_0001
     * @tc.desc      resolution decision -1 with rotation 0/0 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0001 begin`);
      logInfo("decision(-1,100,50,0.5,0,0,0,0.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(100, 50) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(0, 0) + '|' + xComponentSizeText(false, 0, 720, 1280, 0, 0, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0002
     * @tc.name      Resolution_DecisionMatrix_0002
     * @tc.desc      resolution decision 0 with rotation 37/53 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0002 begin`);
      logInfo("decision(0,103.1,52.7,0.75,37,53,1,1)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(103.1, 52.7) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(37, 53) + '|' + xComponentSizeText(false, 0, 720, 1280, 37, 53, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*720|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*720|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0003
     * @tc.name      Resolution_DecisionMatrix_0003
     * @tc.desc      resolution decision 1 with rotation 74/106 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0003 begin`);
      logInfo("decision(1,106.2,55.4,1,74,106,2,1.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(106.2, 55.4) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(74, 106) + '|' + xComponentSizeText(false, 0, 720, 1280, 74, 106, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|1920*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|1920*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0004
     * @tc.name      Resolution_DecisionMatrix_0004
     * @tc.desc      resolution decision 2 with rotation 111/159 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0004 begin`);
      logInfo("decision(2,109.3,58.1,1.25,111,159,0,2)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(109.3, 58.1) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(111, 159) + '|' + xComponentSizeText(false, 0, 720, 1280, 111, 159, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0005
     * @tc.name      Resolution_DecisionMatrix_0005
     * @tc.desc      resolution decision 3 with rotation 148/212 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0005 begin`);
      logInfo("decision(3,112.4,60.8,1.5,148,212,1,2.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(112.4, 60.8) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(148, 212) + '|' + xComponentSizeText(false, 0, 720, 1280, 148, 212, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|3200*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|3200*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0006
     * @tc.name      Resolution_DecisionMatrix_0006
     * @tc.desc      resolution decision 4 with rotation 185/265 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0006 begin`);
      logInfo("decision(4,115.5,63.5,1.75,185,265,2,3)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(115.5, 63.5) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(185, 265) + '|' + xComponentSizeText(false, 0, 720, 1280, 185, 265, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*2160|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*2160|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0007
     * @tc.name      Resolution_DecisionMatrix_0007
     * @tc.desc      resolution decision 5 with rotation 222/318 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0007 begin`);
      logInfo("decision(5,118.6,66.2,2,222,318,0,3.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(118.6, 66.2) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(222, 318) + '|' + xComponentSizeText(false, 0, 720, 1280, 222, 318, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0008
     * @tc.name      Resolution_DecisionMatrix_0008
     * @tc.desc      resolution decision 6 with rotation 259/11 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0008 begin`);
      logInfo("decision(6,121.7,68.9,2.25,259,11,1,0.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(121.7, 68.9) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(259, 11) + '|' + xComponentSizeText(false, 0, 720, 1280, 259, 11, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*360|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*360|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0009
     * @tc.name      Resolution_DecisionMatrix_0009
     * @tc.desc      resolution decision 7 with rotation 296/64 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0009 begin`);
      logInfo("decision(7,124.8,71.6,2.5,296,64,2,1)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(124.8, 71.6) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(296, 64) + '|' + xComponentSizeText(false, 0, 720, 1280, 296, 64, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|1280*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|1280*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0010
     * @tc.name      Resolution_DecisionMatrix_0010
     * @tc.desc      resolution decision 8 with rotation 333/117 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0010 begin`);
      logInfo("decision(8,127.9,74.3,0.5,333,117,0,1.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(127.9, 74.3) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(333, 117) + '|' + xComponentSizeText(false, 0, 720, 1280, 333, 117, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0011
     * @tc.name      Resolution_DecisionMatrix_0011
     * @tc.desc      resolution decision 9 with rotation 370/170 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0011 begin`);
      logInfo("decision(9,131,77,0.75,370,170,1,2)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(131, 77) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(370, 170) + '|' + xComponentSizeText(false, 0, 720, 1280, 370, 170, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|2560*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|2560*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0012
     * @tc.name      Resolution_DecisionMatrix_0012
     * @tc.desc      resolution decision 10 with rotation 407/223 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0012 begin`);
      logInfo("decision(10,134.1,79.7,1,407,223,2,2.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(134.1, 79.7) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(407, 223) + '|' + xComponentSizeText(false, 0, 720, 1280, 407, 223, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*1800|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*1800|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0013
     * @tc.name      Resolution_DecisionMatrix_0013
     * @tc.desc      resolution decision 11 with rotation 444/276 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0013 begin`);
      logInfo("decision(11,137.2,82.4,1.25,444,276,0,3)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(137.2, 82.4) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(444, 276) + '|' + xComponentSizeText(false, 0, 720, 1280, 444, 276, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0014
     * @tc.name      Resolution_DecisionMatrix_0014
     * @tc.desc      resolution decision 12 with rotation 481/329 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0014 begin`);
      logInfo("decision(12,140.3,85.1,1.5,481,329,1,3.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(140.3, 85.1) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(481, 329) + '|' + xComponentSizeText(false, 0, 720, 1280, 481, 329, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*2520|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*2520|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0015
     * @tc.name      Resolution_DecisionMatrix_0015
     * @tc.desc      resolution decision 13 with rotation 518/22 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0015 begin`);
      logInfo("decision(13,143.4,87.8,1.75,518,22,2,0.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(143.4, 87.8) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(518, 22) + '|' + xComponentSizeText(false, 0, 720, 1280, 518, 22, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|640*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|640*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0016
     * @tc.name      Resolution_DecisionMatrix_0016
     * @tc.desc      resolution decision 14 with rotation 555/75 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0016 begin`);
      logInfo("decision(14,146.5,90.5,2,555,75,0,1)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(146.5, 90.5) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(555, 75) + '|' + xComponentSizeText(false, 0, 720, 1280, 555, 75, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0017
     * @tc.name      Resolution_DecisionMatrix_0017
     * @tc.desc      resolution decision 15 with rotation 592/128 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0017 begin`);
      logInfo("decision(15,149.6,93.2,2.25,592,128,1,1.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(149.6, 93.2) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(592, 128) + '|' + xComponentSizeText(false, 0, 720, 1280, 592, 128, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|1920*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|1920*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0018
     * @tc.name      Resolution_DecisionMatrix_0018
     * @tc.desc      resolution decision 16 with rotation 629/181 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0018 begin`);
      logInfo("decision(16,152.7,95.9,2.5,629,181,2,2)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(152.7, 95.9) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(629, 181) + '|' + xComponentSizeText(false, 0, 720, 1280, 629, 181, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*1440|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*1440|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0019
     * @tc.name      Resolution_DecisionMatrix_0019
     * @tc.desc      resolution decision -1 with rotation 666/234 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0019 begin`);
      logInfo("decision(-1,155.8,98.6,0.5,666,234,0,2.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(155.8, 98.6) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(666, 234) + '|' + xComponentSizeText(false, 0, 720, 1280, 666, 234, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0020
     * @tc.name      Resolution_DecisionMatrix_0020
     * @tc.desc      resolution decision 0 with rotation 703/287 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0020 begin`);
      logInfo("decision(0,158.9,101.3,0.75,703,287,1,3)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(158.9, 101.3) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(703, 287) + '|' + xComponentSizeText(false, 0, 720, 1280, 703, 287, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*2160|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*2160|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0021
     * @tc.name      Resolution_DecisionMatrix_0021
     * @tc.desc      resolution decision 1 with rotation 20/340 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0021 begin`);
      logInfo("decision(1,162,104,1,20,340,2,3.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(162, 104) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(20, 340) + '|' + xComponentSizeText(false, 0, 720, 1280, 20, 340, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|4480*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|4480*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0022
     * @tc.name      Resolution_DecisionMatrix_0022
     * @tc.desc      resolution decision 2 with rotation 57/33 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0022 begin`);
      logInfo("decision(2,165.1,106.7,1.25,57,33,0,0.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(165.1, 106.7) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(57, 33) + '|' + xComponentSizeText(false, 0, 720, 1280, 57, 33, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0023
     * @tc.name      Resolution_DecisionMatrix_0023
     * @tc.desc      resolution decision 3 with rotation 94/86 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0023 begin`);
      logInfo("decision(3,168.2,109.4,1.5,94,86,1,1)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(168.2, 109.4) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(94, 86) + '|' + xComponentSizeText(false, 0, 720, 1280, 94, 86, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|1280*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|1280*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0024
     * @tc.name      Resolution_DecisionMatrix_0024
     * @tc.desc      resolution decision 4 with rotation 131/139 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0024 begin`);
      logInfo("decision(4,171.3,112.1,1.75,131,139,2,1.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(171.3, 112.1) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(131, 139) + '|' + xComponentSizeText(false, 0, 720, 1280, 131, 139, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*1080|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*1080|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0025
     * @tc.name      Resolution_DecisionMatrix_0025
     * @tc.desc      resolution decision 5 with rotation 168/192 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0025 begin`);
      logInfo("decision(5,174.4,114.8,2,168,192,0,2)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(174.4, 114.8) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(168, 192) + '|' + xComponentSizeText(false, 0, 720, 1280, 168, 192, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0026
     * @tc.name      Resolution_DecisionMatrix_0026
     * @tc.desc      resolution decision 6 with rotation 205/245 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0026 begin`);
      logInfo("decision(6,177.5,117.5,2.25,205,245,1,2.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(177.5, 117.5) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(205, 245) + '|' + xComponentSizeText(false, 0, 720, 1280, 205, 245, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*1800|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*1800|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0027
     * @tc.name      Resolution_DecisionMatrix_0027
     * @tc.desc      resolution decision 7 with rotation 242/298 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0027 begin`);
      logInfo("decision(7,180.6,120.2,2.5,242,298,2,3)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(180.6, 120.2) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(242, 298) + '|' + xComponentSizeText(false, 0, 720, 1280, 242, 298, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|3840*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|3840*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0028
     * @tc.name      Resolution_DecisionMatrix_0028
     * @tc.desc      resolution decision 8 with rotation 279/351 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0028 begin`);
      logInfo("decision(8,183.7,122.9,0.5,279,351,0,3.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(183.7, 122.9) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(279, 351) + '|' + xComponentSizeText(false, 0, 720, 1280, 279, 351, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0029
     * @tc.name      Resolution_DecisionMatrix_0029
     * @tc.desc      resolution decision 9 with rotation 316/44 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0029 begin`);
      logInfo("decision(9,186.8,125.6,0.75,316,44,1,0.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(186.8, 125.6) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(316, 44) + '|' + xComponentSizeText(false, 0, 720, 1280, 316, 44, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|640*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|640*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0030
     * @tc.name      Resolution_DecisionMatrix_0030
     * @tc.desc      resolution decision 10 with rotation 353/97 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0030 begin`);
      logInfo("decision(10,189.9,128.3,1,353,97,2,1)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(189.9, 128.3) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(353, 97) + '|' + xComponentSizeText(false, 0, 720, 1280, 353, 97, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*720|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*720|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0031
     * @tc.name      Resolution_DecisionMatrix_0031
     * @tc.desc      resolution decision 11 with rotation 390/150 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0031 begin`);
      logInfo("decision(11,193,131,1.25,390,150,0,1.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(193, 131) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(390, 150) + '|' + xComponentSizeText(false, 0, 720, 1280, 390, 150, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0032
     * @tc.name      Resolution_DecisionMatrix_0032
     * @tc.desc      resolution decision 12 with rotation 427/203 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0032 begin`);
      logInfo("decision(12,196.1,133.7,1.5,427,203,1,2)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(196.1, 133.7) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(427, 203) + '|' + xComponentSizeText(false, 0, 720, 1280, 427, 203, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*1440|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*1440|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0033
     * @tc.name      Resolution_DecisionMatrix_0033
     * @tc.desc      resolution decision 13 with rotation 464/256 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0033 begin`);
      logInfo("decision(13,199.2,136.4,1.75,464,256,2,2.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(199.2, 136.4) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(464, 256) + '|' + xComponentSizeText(false, 0, 720, 1280, 464, 256, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|3200*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|3200*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0034
     * @tc.name      Resolution_DecisionMatrix_0034
     * @tc.desc      resolution decision 14 with rotation 501/309 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0034 begin`);
      logInfo("decision(14,202.3,139.1,2,501,309,0,3)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(202.3, 139.1) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(501, 309) + '|' + xComponentSizeText(false, 0, 720, 1280, 501, 309, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0035
     * @tc.name      Resolution_DecisionMatrix_0035
     * @tc.desc      resolution decision 15 with rotation 538/2 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0035 begin`);
      logInfo("decision(15,205.4,141.8,2.25,538,2,1,3.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(205.4, 141.8) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(538, 2) + '|' + xComponentSizeText(false, 0, 720, 1280, 538, 2, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|4480*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|4480*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0036
     * @tc.name      Resolution_DecisionMatrix_0036
     * @tc.desc      resolution decision 16 with rotation 575/55 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0036 begin`);
      logInfo("decision(16,208.5,144.5,2.5,575,55,2,0.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(208.5, 144.5) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(575, 55) + '|' + xComponentSizeText(false, 0, 720, 1280, 575, 55, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*360|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*360|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0037
     * @tc.name      Resolution_DecisionMatrix_0037
     * @tc.desc      resolution decision -1 with rotation 612/108 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0037 begin`);
      logInfo("decision(-1,211.6,147.2,0.5,612,108,0,1)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(211.6, 147.2) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(612, 108) + '|' + xComponentSizeText(false, 0, 720, 1280, 612, 108, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0038
     * @tc.name      Resolution_DecisionMatrix_0038
     * @tc.desc      resolution decision 0 with rotation 649/161 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0038 begin`);
      logInfo("decision(0,214.7,149.9,0.75,649,161,1,1.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(214.7, 149.9) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(649, 161) + '|' + xComponentSizeText(false, 0, 720, 1280, 649, 161, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*1080|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*1080|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0039
     * @tc.name      Resolution_DecisionMatrix_0039
     * @tc.desc      resolution decision 1 with rotation 686/214 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0039 begin`);
      logInfo("decision(1,217.8,152.6,1,686,214,2,2)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(217.8, 152.6) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(686, 214) + '|' + xComponentSizeText(false, 0, 720, 1280, 686, 214, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|2560*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|2560*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0040
     * @tc.name      Resolution_DecisionMatrix_0040
     * @tc.desc      resolution decision 2 with rotation 3/267 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0040 begin`);
      logInfo("decision(2,220.9,155.3,1.25,3,267,0,2.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(220.9, 155.3) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(3, 267) + '|' + xComponentSizeText(false, 0, 720, 1280, 3, 267, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0041
     * @tc.name      Resolution_DecisionMatrix_0041
     * @tc.desc      resolution decision 3 with rotation 40/320 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0041 begin`);
      logInfo("decision(3,224,158,1.5,40,320,1,3)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(224, 158) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(40, 320) + '|' + xComponentSizeText(false, 0, 720, 1280, 40, 320, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|3840*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|3840*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0042
     * @tc.name      Resolution_DecisionMatrix_0042
     * @tc.desc      resolution decision 4 with rotation 77/13 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0042 begin`);
      logInfo("decision(4,227.1,160.7,1.75,77,13,2,3.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(227.1, 160.7) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(77, 13) + '|' + xComponentSizeText(false, 0, 720, 1280, 77, 13, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*2520|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*2520|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0043
     * @tc.name      Resolution_DecisionMatrix_0043
     * @tc.desc      resolution decision 5 with rotation 114/66 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0043 begin`);
      logInfo("decision(5,230.2,163.4,2,114,66,0,0.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(230.2, 163.4) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(114, 66) + '|' + xComponentSizeText(false, 0, 720, 1280, 114, 66, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0044
     * @tc.name      Resolution_DecisionMatrix_0044
     * @tc.desc      resolution decision 6 with rotation 151/119 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0044 begin`);
      logInfo("decision(6,233.3,166.1,2.25,151,119,1,1)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(233.3, 166.1) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(151, 119) + '|' + xComponentSizeText(false, 0, 720, 1280, 151, 119, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*720|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*720|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0045
     * @tc.name      Resolution_DecisionMatrix_0045
     * @tc.desc      resolution decision 7 with rotation 188/172 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0045 begin`);
      logInfo("decision(7,236.4,168.8,2.5,188,172,2,1.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(236.4, 168.8) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(188, 172) + '|' + xComponentSizeText(false, 0, 720, 1280, 188, 172, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|1920*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|1920*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0046
     * @tc.name      Resolution_DecisionMatrix_0046
     * @tc.desc      resolution decision 8 with rotation 225/225 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0046 begin`);
      logInfo("decision(8,239.5,171.5,0.5,225,225,0,2)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(239.5, 171.5) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(225, 225) + '|' + xComponentSizeText(false, 0, 720, 1280, 225, 225, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0046 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0047
     * @tc.name      Resolution_DecisionMatrix_0047
     * @tc.desc      resolution decision 9 with rotation 262/278 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0047 begin`);
      logInfo("decision(9,242.6,174.2,0.75,262,278,1,2.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(242.6, 174.2) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(262, 278) + '|' + xComponentSizeText(false, 0, 720, 1280, 262, 278, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|3200*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|3200*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0047 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0048
     * @tc.name      Resolution_DecisionMatrix_0048
     * @tc.desc      resolution decision 10 with rotation 299/331 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0048 begin`);
      logInfo("decision(10,245.7,176.9,1,299,331,2,3)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(245.7, 176.9) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(299, 331) + '|' + xComponentSizeText(false, 0, 720, 1280, 299, 331, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*2160|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*2160|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0048 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0049
     * @tc.name      Resolution_DecisionMatrix_0049
     * @tc.desc      resolution decision 11 with rotation 336/24 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0049 begin`);
      logInfo("decision(11,248.8,179.6,1.25,336,24,0,3.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(248.8, 179.6) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(336, 24) + '|' + xComponentSizeText(false, 0, 720, 1280, 336, 24, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0049 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0050
     * @tc.name      Resolution_DecisionMatrix_0050
     * @tc.desc      resolution decision 12 with rotation 373/77 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0050 begin`);
      logInfo("decision(12,251.9,182.3,1.5,373,77,1,0.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(251.9, 182.3) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(373, 77) + '|' + xComponentSizeText(false, 0, 720, 1280, 373, 77, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*360|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*360|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0050 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0051
     * @tc.name      Resolution_DecisionMatrix_0051
     * @tc.desc      resolution decision 13 with rotation 410/130 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0051 begin`);
      logInfo("decision(13,255,185,1.75,410,130,2,1)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(255, 185) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(410, 130) + '|' + xComponentSizeText(false, 0, 720, 1280, 410, 130, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|1280*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|1280*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0051 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0052
     * @tc.name      Resolution_DecisionMatrix_0052
     * @tc.desc      resolution decision 14 with rotation 447/183 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0052 begin`);
      logInfo("decision(14,258.1,187.7,2,447,183,0,1.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(258.1, 187.7) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(447, 183) + '|' + xComponentSizeText(false, 0, 720, 1280, 447, 183, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0052 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0053
     * @tc.name      Resolution_DecisionMatrix_0053
     * @tc.desc      resolution decision 15 with rotation 484/236 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0053 begin`);
      logInfo("decision(15,261.2,190.4,2.25,484,236,1,2)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(261.2, 190.4) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(484, 236) + '|' + xComponentSizeText(false, 0, 720, 1280, 484, 236, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|2560*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|2560*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0053 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0054
     * @tc.name      Resolution_DecisionMatrix_0054
     * @tc.desc      resolution decision 16 with rotation 521/289 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0054 begin`);
      logInfo("decision(16,264.3,193.1,2.5,521,289,2,2.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(264.3, 193.1) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(521, 289) + '|' + xComponentSizeText(false, 0, 720, 1280, 521, 289, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*1800|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*1800|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0054 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0055
     * @tc.name      Resolution_DecisionMatrix_0055
     * @tc.desc      resolution decision -1 with rotation 558/342 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0055 begin`);
      logInfo("decision(-1,267.4,195.8,0.5,558,342,0,3)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(267.4, 195.8) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(558, 342) + '|' + xComponentSizeText(false, 0, 720, 1280, 558, 342, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0055 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0056
     * @tc.name      Resolution_DecisionMatrix_0056
     * @tc.desc      resolution decision 0 with rotation 595/35 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0056 begin`);
      logInfo("decision(0,270.5,198.5,0.75,595,35,1,3.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(270.5, 198.5) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(595, 35) + '|' + xComponentSizeText(false, 0, 720, 1280, 595, 35, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*2520|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*2520|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0056 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0057
     * @tc.name      Resolution_DecisionMatrix_0057
     * @tc.desc      resolution decision 1 with rotation 632/88 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0057 begin`);
      logInfo("decision(1,273.6,201.2,1,632,88,2,0.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(273.6, 201.2) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(632, 88) + '|' + xComponentSizeText(false, 0, 720, 1280, 632, 88, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|640*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|640*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0057 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0058
     * @tc.name      Resolution_DecisionMatrix_0058
     * @tc.desc      resolution decision 2 with rotation 669/141 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0058 begin`);
      logInfo("decision(2,276.7,203.9,1.25,669,141,0,1)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(276.7, 203.9) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(669, 141) + '|' + xComponentSizeText(false, 0, 720, 1280, 669, 141, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0058 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0059
     * @tc.name      Resolution_DecisionMatrix_0059
     * @tc.desc      resolution decision 3 with rotation 706/194 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0059 begin`);
      logInfo("decision(3,279.8,206.6,1.5,706,194,1,1.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(279.8, 206.6) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(706, 194) + '|' + xComponentSizeText(false, 0, 720, 1280, 706, 194, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|1920*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|1920*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0059 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0060
     * @tc.name      Resolution_DecisionMatrix_0060
     * @tc.desc      resolution decision 4 with rotation 23/247 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0060 begin`);
      logInfo("decision(4,282.9,209.3,1.75,23,247,2,2)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(282.9, 209.3) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(23, 247) + '|' + xComponentSizeText(false, 0, 720, 1280, 23, 247, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*1440|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*1440|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0060 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0061
     * @tc.name      Resolution_DecisionMatrix_0061
     * @tc.desc      resolution decision 5 with rotation 60/300 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0061 begin`);
      logInfo("decision(5,286,212,2,60,300,0,2.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(286, 212) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(60, 300) + '|' + xComponentSizeText(false, 0, 720, 1280, 60, 300, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0061 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0062
     * @tc.name      Resolution_DecisionMatrix_0062
     * @tc.desc      resolution decision 6 with rotation 97/353 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0062 begin`);
      logInfo("decision(6,289.1,214.7,2.25,97,353,1,3)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(289.1, 214.7) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(97, 353) + '|' + xComponentSizeText(false, 0, 720, 1280, 97, 353, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*2160|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*2160|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0062 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0063
     * @tc.name      Resolution_DecisionMatrix_0063
     * @tc.desc      resolution decision 7 with rotation 134/46 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0063 begin`);
      logInfo("decision(7,292.2,217.4,2.5,134,46,2,3.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(292.2, 217.4) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(134, 46) + '|' + xComponentSizeText(false, 0, 720, 1280, 134, 46, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|4480*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|4480*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0063 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0064
     * @tc.name      Resolution_DecisionMatrix_0064
     * @tc.desc      resolution decision 8 with rotation 171/99 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0064 begin`);
      logInfo("decision(8,295.3,220.1,0.5,171,99,0,0.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(295.3, 220.1) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(171, 99) + '|' + xComponentSizeText(false, 0, 720, 1280, 171, 99, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0064 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0065
     * @tc.name      Resolution_DecisionMatrix_0065
     * @tc.desc      resolution decision 9 with rotation 208/152 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0065 begin`);
      logInfo("decision(9,298.4,222.8,0.75,208,152,1,1)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(298.4, 222.8) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(208, 152) + '|' + xComponentSizeText(false, 0, 720, 1280, 208, 152, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|1280*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|1280*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0065 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0066
     * @tc.name      Resolution_DecisionMatrix_0066
     * @tc.desc      resolution decision 10 with rotation 245/205 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0066 begin`);
      logInfo("decision(10,301.5,225.5,1,245,205,2,1.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(301.5, 225.5) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(245, 205) + '|' + xComponentSizeText(false, 0, 720, 1280, 245, 205, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*1080|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*1080|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0066 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0067
     * @tc.name      Resolution_DecisionMatrix_0067
     * @tc.desc      resolution decision 11 with rotation 282/258 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0067 begin`);
      logInfo("decision(11,304.6,228.2,1.25,282,258,0,2)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(304.6, 228.2) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(282, 258) + '|' + xComponentSizeText(false, 0, 720, 1280, 282, 258, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0067 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0068
     * @tc.name      Resolution_DecisionMatrix_0068
     * @tc.desc      resolution decision 12 with rotation 319/311 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0068 begin`);
      logInfo("decision(12,307.7,230.9,1.5,319,311,1,2.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(307.7, 230.9) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(319, 311) + '|' + xComponentSizeText(false, 0, 720, 1280, 319, 311, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*1800|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*1800|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0068 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0069
     * @tc.name      Resolution_DecisionMatrix_0069
     * @tc.desc      resolution decision 13 with rotation 356/4 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0069 begin`);
      logInfo("decision(13,310.8,233.6,1.75,356,4,2,3)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(310.8, 233.6) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(356, 4) + '|' + xComponentSizeText(false, 0, 720, 1280, 356, 4, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|3840*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|3840*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0069 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0070
     * @tc.name      Resolution_DecisionMatrix_0070
     * @tc.desc      resolution decision 14 with rotation 393/57 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0070 begin`);
      logInfo("decision(14,313.9,236.3,2,393,57,0,3.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(313.9, 236.3) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(393, 57) + '|' + xComponentSizeText(false, 0, 720, 1280, 393, 57, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0070 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0071
     * @tc.name      Resolution_DecisionMatrix_0071
     * @tc.desc      resolution decision 15 with rotation 430/110 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0071 begin`);
      logInfo("decision(15,317,239,2.25,430,110,1,0.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(317, 239) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(430, 110) + '|' + xComponentSizeText(false, 0, 720, 1280, 430, 110, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|640*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|640*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0071 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0072
     * @tc.name      Resolution_DecisionMatrix_0072
     * @tc.desc      resolution decision 16 with rotation 467/163 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0072 begin`);
      logInfo("decision(16,320.1,241.7,2.5,467,163,2,1)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(320.1, 241.7) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(467, 163) + '|' + xComponentSizeText(false, 0, 720, 1280, 467, 163, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*720|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*720|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0072 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0073
     * @tc.name      Resolution_DecisionMatrix_0073
     * @tc.desc      resolution decision -1 with rotation 504/216 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0073 begin`);
      logInfo("decision(-1,323.2,244.4,0.5,504,216,0,1.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(323.2, 244.4) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(504, 216) + '|' + xComponentSizeText(false, 0, 720, 1280, 504, 216, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0073 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0074
     * @tc.name      Resolution_DecisionMatrix_0074
     * @tc.desc      resolution decision 0 with rotation 541/269 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0074 begin`);
      logInfo("decision(0,326.3,247.1,0.75,541,269,1,2)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(326.3, 247.1) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(541, 269) + '|' + xComponentSizeText(false, 0, 720, 1280, 541, 269, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*1440|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*1440|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0074 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0075
     * @tc.name      Resolution_DecisionMatrix_0075
     * @tc.desc      resolution decision 1 with rotation 578/322 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0075 begin`);
      logInfo("decision(1,329.4,249.8,1,578,322,2,2.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(329.4, 249.8) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(578, 322) + '|' + xComponentSizeText(false, 0, 720, 1280, 578, 322, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|3200*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|3200*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0075 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0076
     * @tc.name      Resolution_DecisionMatrix_0076
     * @tc.desc      resolution decision 2 with rotation 615/15 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0076 begin`);
      logInfo("decision(2,332.5,252.5,1.25,615,15,0,3)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(332.5, 252.5) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(615, 15) + '|' + xComponentSizeText(false, 0, 720, 1280, 615, 15, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0076 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0077
     * @tc.name      Resolution_DecisionMatrix_0077
     * @tc.desc      resolution decision 3 with rotation 652/68 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0077 begin`);
      logInfo("decision(3,335.6,255.2,1.5,652,68,1,3.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(335.6, 255.2) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(652, 68) + '|' + xComponentSizeText(false, 0, 720, 1280, 652, 68, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|4480*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|4480*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0077 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0078
     * @tc.name      Resolution_DecisionMatrix_0078
     * @tc.desc      resolution decision 4 with rotation 689/121 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0078 begin`);
      logInfo("decision(4,338.7,257.9,1.75,689,121,2,0.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(338.7, 257.9) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(689, 121) + '|' + xComponentSizeText(false, 0, 720, 1280, 689, 121, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*360|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*360|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0078 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0079
     * @tc.name      Resolution_DecisionMatrix_0079
     * @tc.desc      resolution decision 5 with rotation 6/174 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0079 begin`);
      logInfo("decision(5,341.8,260.6,2,6,174,0,1)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(341.8, 260.6) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(6, 174) + '|' + xComponentSizeText(false, 0, 720, 1280, 6, 174, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0079 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0080
     * @tc.name      Resolution_DecisionMatrix_0080
     * @tc.desc      resolution decision 6 with rotation 43/227 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0080 begin`);
      logInfo("decision(6,344.9,263.3,2.25,43,227,1,1.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(344.9, 263.3) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(43, 227) + '|' + xComponentSizeText(false, 0, 720, 1280, 43, 227, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*1080|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*1080|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0080 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0081
     * @tc.name      Resolution_DecisionMatrix_0081
     * @tc.desc      resolution decision 7 with rotation 80/280 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0081 begin`);
      logInfo("decision(7,348,266,2.5,80,280,2,2)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(348, 266) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(80, 280) + '|' + xComponentSizeText(false, 0, 720, 1280, 80, 280, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|2560*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|2560*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0081 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0082
     * @tc.name      Resolution_DecisionMatrix_0082
     * @tc.desc      resolution decision 8 with rotation 117/333 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0082 begin`);
      logInfo("decision(8,351.1,268.7,0.5,117,333,0,2.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(351.1, 268.7) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(117, 333) + '|' + xComponentSizeText(false, 0, 720, 1280, 117, 333, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0082 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0083
     * @tc.name      Resolution_DecisionMatrix_0083
     * @tc.desc      resolution decision 9 with rotation 154/26 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0083 begin`);
      logInfo("decision(9,354.2,271.4,0.75,154,26,1,3)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(354.2, 271.4) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(154, 26) + '|' + xComponentSizeText(false, 0, 720, 1280, 154, 26, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|3840*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|3840*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0083 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0084
     * @tc.name      Resolution_DecisionMatrix_0084
     * @tc.desc      resolution decision 10 with rotation 191/79 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0084 begin`);
      logInfo("decision(10,357.3,274.1,1,191,79,2,3.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(357.3, 274.1) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(191, 79) + '|' + xComponentSizeText(false, 0, 720, 1280, 191, 79, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*2520|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*2520|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0084 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0085
     * @tc.name      Resolution_DecisionMatrix_0085
     * @tc.desc      resolution decision 11 with rotation 228/132 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0085 begin`);
      logInfo("decision(11,360.4,276.8,1.25,228,132,0,0.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(360.4, 276.8) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(228, 132) + '|' + xComponentSizeText(false, 0, 720, 1280, 228, 132, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0085 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0086
     * @tc.name      Resolution_DecisionMatrix_0086
     * @tc.desc      resolution decision 12 with rotation 265/185 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0086 begin`);
      logInfo("decision(12,363.5,279.5,1.5,265,185,1,1)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(363.5, 279.5) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(265, 185) + '|' + xComponentSizeText(false, 0, 720, 1280, 265, 185, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*720|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*720|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0086 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0087
     * @tc.name      Resolution_DecisionMatrix_0087
     * @tc.desc      resolution decision 13 with rotation 302/238 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0087 begin`);
      logInfo("decision(13,366.6,282.2,1.75,302,238,2,1.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(366.6, 282.2) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(302, 238) + '|' + xComponentSizeText(false, 0, 720, 1280, 302, 238, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|1920*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|1920*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0087 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0088
     * @tc.name      Resolution_DecisionMatrix_0088
     * @tc.desc      resolution decision 14 with rotation 339/291 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0088 begin`);
      logInfo("decision(14,369.7,284.9,2,339,291,0,2)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(369.7, 284.9) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(339, 291) + '|' + xComponentSizeText(false, 0, 720, 1280, 339, 291, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0088 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0089
     * @tc.name      Resolution_DecisionMatrix_0089
     * @tc.desc      resolution decision 15 with rotation 376/344 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0089 begin`);
      logInfo("decision(15,372.8,287.6,2.25,376,344,1,2.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(372.8, 287.6) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(376, 344) + '|' + xComponentSizeText(false, 0, 720, 1280, 376, 344, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|3200*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|3200*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0089 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0090
     * @tc.name      Resolution_DecisionMatrix_0090
     * @tc.desc      resolution decision 16 with rotation 413/37 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0090 begin`);
      logInfo("decision(16,375.9,290.3,2.5,413,37,2,3)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(375.9, 290.3) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(413, 37) + '|' + xComponentSizeText(false, 0, 720, 1280, 413, 37, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*2160|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*2160|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0090 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0091
     * @tc.name      Resolution_DecisionMatrix_0091
     * @tc.desc      resolution decision -1 with rotation 450/90 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0091 begin`);
      logInfo("decision(-1,379,293,0.5,450,90,0,3.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(379, 293) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(450, 90) + '|' + xComponentSizeText(false, 0, 720, 1280, 450, 90, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0091 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0092
     * @tc.name      Resolution_DecisionMatrix_0092
     * @tc.desc      resolution decision 0 with rotation 487/143 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0092 begin`);
      logInfo("decision(0,382.1,295.7,0.75,487,143,1,0.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(382.1, 295.7) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(487, 143) + '|' + xComponentSizeText(false, 0, 720, 1280, 487, 143, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*360|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*360|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0092 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0093
     * @tc.name      Resolution_DecisionMatrix_0093
     * @tc.desc      resolution decision 1 with rotation 524/196 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0093 begin`);
      logInfo("decision(1,385.2,298.4,1,524,196,2,1)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(385.2, 298.4) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(524, 196) + '|' + xComponentSizeText(false, 0, 720, 1280, 524, 196, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|1280*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|1280*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0093 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0094
     * @tc.name      Resolution_DecisionMatrix_0094
     * @tc.desc      resolution decision 2 with rotation 561/249 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0094 begin`);
      logInfo("decision(2,388.3,301.1,1.25,561,249,0,1.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(388.3, 301.1) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(561, 249) + '|' + xComponentSizeText(false, 0, 720, 1280, 561, 249, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0094 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0095
     * @tc.name      Resolution_DecisionMatrix_0095
     * @tc.desc      resolution decision 3 with rotation 598/302 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0095 begin`);
      logInfo("decision(3,391.4,303.8,1.5,598,302,1,2)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(391.4, 303.8) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(598, 302) + '|' + xComponentSizeText(false, 0, 720, 1280, 598, 302, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|2560*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|2560*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0095 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0096
     * @tc.name      Resolution_DecisionMatrix_0096
     * @tc.desc      resolution decision 4 with rotation 635/355 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0096 begin`);
      logInfo("decision(4,394.5,306.5,1.75,635,355,2,2.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(394.5, 306.5) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(635, 355) + '|' + xComponentSizeText(false, 0, 720, 1280, 635, 355, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*1800|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*1800|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0096 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0097
     * @tc.name      Resolution_DecisionMatrix_0097
     * @tc.desc      resolution decision 5 with rotation 672/48 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0097 begin`);
      logInfo("decision(5,397.6,309.2,2,672,48,0,3)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(397.6, 309.2) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(672, 48) + '|' + xComponentSizeText(false, 0, 720, 1280, 672, 48, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0097 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0098
     * @tc.name      Resolution_DecisionMatrix_0098
     * @tc.desc      resolution decision 6 with rotation 709/101 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0098 begin`);
      logInfo("decision(6,400.7,311.9,2.25,709,101,1,3.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(400.7, 311.9) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(709, 101) + '|' + xComponentSizeText(false, 0, 720, 1280, 709, 101, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*2520|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*2520|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0098 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0099
     * @tc.name      Resolution_DecisionMatrix_0099
     * @tc.desc      resolution decision 7 with rotation 26/154 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0099 begin`);
      logInfo("decision(7,403.8,314.6,2.5,26,154,2,0.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(403.8, 314.6) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(26, 154) + '|' + xComponentSizeText(false, 0, 720, 1280, 26, 154, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|640*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|640*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0099 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0100
     * @tc.name      Resolution_DecisionMatrix_0100
     * @tc.desc      resolution decision 8 with rotation 63/207 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0100 begin`);
      logInfo("decision(8,406.9,317.3,0.5,63,207,0,1)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(406.9, 317.3) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(63, 207) + '|' + xComponentSizeText(false, 0, 720, 1280, 63, 207, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0100 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0101
     * @tc.name      Resolution_DecisionMatrix_0101
     * @tc.desc      resolution decision 9 with rotation 100/260 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0101 begin`);
      logInfo("decision(9,410,320,0.75,100,260,1,1.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(410, 320) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(100, 260) + '|' + xComponentSizeText(false, 0, 720, 1280, 100, 260, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|1920*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|1920*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0101 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0102
     * @tc.name      Resolution_DecisionMatrix_0102
     * @tc.desc      resolution decision 10 with rotation 137/313 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0102 begin`);
      logInfo("decision(10,413.1,322.7,1,137,313,2,2)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(413.1, 322.7) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(137, 313) + '|' + xComponentSizeText(false, 0, 720, 1280, 137, 313, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*1440|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*1440|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0102 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0103
     * @tc.name      Resolution_DecisionMatrix_0103
     * @tc.desc      resolution decision 11 with rotation 174/6 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0103 begin`);
      logInfo("decision(11,416.2,325.4,1.25,174,6,0,2.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(416.2, 325.4) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(174, 6) + '|' + xComponentSizeText(false, 0, 720, 1280, 174, 6, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0103 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0104
     * @tc.name      Resolution_DecisionMatrix_0104
     * @tc.desc      resolution decision 12 with rotation 211/59 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0104 begin`);
      logInfo("decision(12,419.3,328.1,1.5,211,59,1,3)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(419.3, 328.1) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(211, 59) + '|' + xComponentSizeText(false, 0, 720, 1280, 211, 59, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*2160|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*2160|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0104 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0105
     * @tc.name      Resolution_DecisionMatrix_0105
     * @tc.desc      resolution decision 13 with rotation 248/112 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0105 begin`);
      logInfo("decision(13,422.4,330.8,1.75,248,112,2,3.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(422.4, 330.8) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(248, 112) + '|' + xComponentSizeText(false, 0, 720, 1280, 248, 112, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|4480*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|4480*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0105 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0106
     * @tc.name      Resolution_DecisionMatrix_0106
     * @tc.desc      resolution decision 14 with rotation 285/165 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0106 begin`);
      logInfo("decision(14,425.5,333.5,2,285,165,0,0.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(425.5, 333.5) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(285, 165) + '|' + xComponentSizeText(false, 0, 720, 1280, 285, 165, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0106 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0107
     * @tc.name      Resolution_DecisionMatrix_0107
     * @tc.desc      resolution decision 15 with rotation 322/218 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0107 begin`);
      logInfo("decision(15,428.6,336.2,2.25,322,218,1,1)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(428.6, 336.2) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(322, 218) + '|' + xComponentSizeText(false, 0, 720, 1280, 322, 218, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|1280*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|1280*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0107 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0108
     * @tc.name      Resolution_DecisionMatrix_0108
     * @tc.desc      resolution decision 16 with rotation 359/271 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0108 begin`);
      logInfo("decision(16,431.7,338.9,2.5,359,271,2,1.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(431.7, 338.9) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(359, 271) + '|' + xComponentSizeText(false, 0, 720, 1280, 359, 271, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*1080|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*1080|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0108 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0109
     * @tc.name      Resolution_DecisionMatrix_0109
     * @tc.desc      resolution decision -1 with rotation 396/324 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0109 begin`);
      logInfo("decision(-1,434.8,341.6,0.5,396,324,0,2)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(434.8, 341.6) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(396, 324) + '|' + xComponentSizeText(false, 0, 720, 1280, 396, 324, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0109 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0110
     * @tc.name      Resolution_DecisionMatrix_0110
     * @tc.desc      resolution decision 0 with rotation 433/17 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0110 begin`);
      logInfo("decision(0,437.9,344.3,0.75,433,17,1,2.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(437.9, 344.3) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(433, 17) + '|' + xComponentSizeText(false, 0, 720, 1280, 433, 17, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*1800|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*1800|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0110 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0111
     * @tc.name      Resolution_DecisionMatrix_0111
     * @tc.desc      resolution decision 1 with rotation 470/70 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0111 begin`);
      logInfo("decision(1,441,347,1,470,70,2,3)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(441, 347) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(470, 70) + '|' + xComponentSizeText(false, 0, 720, 1280, 470, 70, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|3840*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|3840*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0111 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0112
     * @tc.name      Resolution_DecisionMatrix_0112
     * @tc.desc      resolution decision 2 with rotation 507/123 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0112 begin`);
      logInfo("decision(2,444.1,349.7,1.25,507,123,0,3.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(444.1, 349.7) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(507, 123) + '|' + xComponentSizeText(false, 0, 720, 1280, 507, 123, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0112 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0113
     * @tc.name      Resolution_DecisionMatrix_0113
     * @tc.desc      resolution decision 3 with rotation 544/176 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0113 begin`);
      logInfo("decision(3,447.2,352.4,1.5,544,176,1,0.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(447.2, 352.4) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(544, 176) + '|' + xComponentSizeText(false, 0, 720, 1280, 544, 176, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|640*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|640*1280|2");
