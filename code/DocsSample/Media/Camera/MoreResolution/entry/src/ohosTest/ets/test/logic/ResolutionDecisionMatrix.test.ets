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
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0113 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0114
     * @tc.name      Resolution_DecisionMatrix_0114
     * @tc.desc      resolution decision 4 with rotation 581/229 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0114 begin`);
      logInfo("decision(4,450.3,355.1,1.75,581,229,2,1)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(450.3, 355.1) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(581, 229) + '|' + xComponentSizeText(false, 0, 720, 1280, 581, 229, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*720|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*720|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0114 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0115
     * @tc.name      Resolution_DecisionMatrix_0115
     * @tc.desc      resolution decision 5 with rotation 618/282 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0115 begin`);
      logInfo("decision(5,453.4,357.8,2,618,282,0,1.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(453.4, 357.8) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(618, 282) + '|' + xComponentSizeText(false, 0, 720, 1280, 618, 282, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0115 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0116
     * @tc.name      Resolution_DecisionMatrix_0116
     * @tc.desc      resolution decision 6 with rotation 655/335 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0116 begin`);
      logInfo("decision(6,456.5,360.5,2.25,655,335,1,2)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(456.5, 360.5) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(655, 335) + '|' + xComponentSizeText(false, 0, 720, 1280, 655, 335, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*1440|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*1440|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0116 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0117
     * @tc.name      Resolution_DecisionMatrix_0117
     * @tc.desc      resolution decision 7 with rotation 692/28 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0117 begin`);
      logInfo("decision(7,459.6,363.2,2.5,692,28,2,2.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(459.6, 363.2) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(692, 28) + '|' + xComponentSizeText(false, 0, 720, 1280, 692, 28, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|3200*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|3200*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0117 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0118
     * @tc.name      Resolution_DecisionMatrix_0118
     * @tc.desc      resolution decision 8 with rotation 9/81 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0118 begin`);
      logInfo("decision(8,462.7,365.9,0.5,9,81,0,3)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(462.7, 365.9) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(9, 81) + '|' + xComponentSizeText(false, 0, 720, 1280, 9, 81, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0118 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0119
     * @tc.name      Resolution_DecisionMatrix_0119
     * @tc.desc      resolution decision 9 with rotation 46/134 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0119 begin`);
      logInfo("decision(9,465.8,368.6,0.75,46,134,1,3.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(465.8, 368.6) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(46, 134) + '|' + xComponentSizeText(false, 0, 720, 1280, 46, 134, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|4480*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|4480*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0119 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0120
     * @tc.name      Resolution_DecisionMatrix_0120
     * @tc.desc      resolution decision 10 with rotation 83/187 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0120 begin`);
      logInfo("decision(10,468.9,371.3,1,83,187,2,0.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(468.9, 371.3) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(83, 187) + '|' + xComponentSizeText(false, 0, 720, 1280, 83, 187, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*360|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*360|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0120 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0121
     * @tc.name      Resolution_DecisionMatrix_0121
     * @tc.desc      resolution decision 11 with rotation 120/240 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0121 begin`);
      logInfo("decision(11,472,374,1.25,120,240,0,1)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(472, 374) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(120, 240) + '|' + xComponentSizeText(false, 0, 720, 1280, 120, 240, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0121 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0122
     * @tc.name      Resolution_DecisionMatrix_0122
     * @tc.desc      resolution decision 12 with rotation 157/293 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0122 begin`);
      logInfo("decision(12,475.1,376.7,1.5,157,293,1,1.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(475.1, 376.7) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(157, 293) + '|' + xComponentSizeText(false, 0, 720, 1280, 157, 293, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*1080|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*1080|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0122 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0123
     * @tc.name      Resolution_DecisionMatrix_0123
     * @tc.desc      resolution decision 13 with rotation 194/346 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0123 begin`);
      logInfo("decision(13,478.2,379.4,1.75,194,346,2,2)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(478.2, 379.4) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(194, 346) + '|' + xComponentSizeText(false, 0, 720, 1280, 194, 346, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|2560*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|2560*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0123 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0124
     * @tc.name      Resolution_DecisionMatrix_0124
     * @tc.desc      resolution decision 14 with rotation 231/39 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0124 begin`);
      logInfo("decision(14,481.3,382.1,2,231,39,0,2.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(481.3, 382.1) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(231, 39) + '|' + xComponentSizeText(false, 0, 720, 1280, 231, 39, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0124 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0125
     * @tc.name      Resolution_DecisionMatrix_0125
     * @tc.desc      resolution decision 15 with rotation 268/92 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0125 begin`);
      logInfo("decision(15,484.4,384.8,2.25,268,92,1,3)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(484.4, 384.8) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(268, 92) + '|' + xComponentSizeText(false, 0, 720, 1280, 268, 92, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|3840*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|3840*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0125 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0126
     * @tc.name      Resolution_DecisionMatrix_0126
     * @tc.desc      resolution decision 16 with rotation 305/145 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0126 begin`);
      logInfo("decision(16,487.5,387.5,2.5,305,145,2,3.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(487.5, 387.5) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(305, 145) + '|' + xComponentSizeText(false, 0, 720, 1280, 305, 145, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*2520|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*2520|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0126 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0127
     * @tc.name      Resolution_DecisionMatrix_0127
     * @tc.desc      resolution decision -1 with rotation 342/198 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0127 begin`);
      logInfo("decision(-1,490.6,390.2,0.5,342,198,0,0.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(490.6, 390.2) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(342, 198) + '|' + xComponentSizeText(false, 0, 720, 1280, 342, 198, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0127 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0128
     * @tc.name      Resolution_DecisionMatrix_0128
     * @tc.desc      resolution decision 0 with rotation 379/251 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0128 begin`);
      logInfo("decision(0,493.7,392.9,0.75,379,251,1,1)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(493.7, 392.9) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(379, 251) + '|' + xComponentSizeText(false, 0, 720, 1280, 379, 251, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*720|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*720|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0128 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0129
     * @tc.name      Resolution_DecisionMatrix_0129
     * @tc.desc      resolution decision 1 with rotation 416/304 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0129 begin`);
      logInfo("decision(1,496.8,395.6,1,416,304,2,1.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(496.8, 395.6) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(416, 304) + '|' + xComponentSizeText(false, 0, 720, 1280, 416, 304, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|1920*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|1920*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0129 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0130
     * @tc.name      Resolution_DecisionMatrix_0130
     * @tc.desc      resolution decision 2 with rotation 453/357 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0130 begin`);
      logInfo("decision(2,499.9,398.3,1.25,453,357,0,2)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(499.9, 398.3) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(453, 357) + '|' + xComponentSizeText(false, 0, 720, 1280, 453, 357, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0130 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0131
     * @tc.name      Resolution_DecisionMatrix_0131
     * @tc.desc      resolution decision 3 with rotation 490/50 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0131 begin`);
      logInfo("decision(3,503,401,1.5,490,50,1,2.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(503, 401) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(490, 50) + '|' + xComponentSizeText(false, 0, 720, 1280, 490, 50, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|3200*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|3200*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0131 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0132
     * @tc.name      Resolution_DecisionMatrix_0132
     * @tc.desc      resolution decision 4 with rotation 527/103 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0132 begin`);
      logInfo("decision(4,506.1,403.7,1.75,527,103,2,3)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(506.1, 403.7) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(527, 103) + '|' + xComponentSizeText(false, 0, 720, 1280, 527, 103, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*2160|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*2160|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0132 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0133
     * @tc.name      Resolution_DecisionMatrix_0133
     * @tc.desc      resolution decision 5 with rotation 564/156 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0133 begin`);
      logInfo("decision(5,509.2,406.4,2,564,156,0,3.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(509.2, 406.4) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(564, 156) + '|' + xComponentSizeText(false, 0, 720, 1280, 564, 156, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0133 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0134
     * @tc.name      Resolution_DecisionMatrix_0134
     * @tc.desc      resolution decision 6 with rotation 601/209 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0134 begin`);
      logInfo("decision(6,512.3,409.1,2.25,601,209,1,0.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(512.3, 409.1) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(601, 209) + '|' + xComponentSizeText(false, 0, 720, 1280, 601, 209, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*360|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*360|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0134 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0135
     * @tc.name      Resolution_DecisionMatrix_0135
     * @tc.desc      resolution decision 7 with rotation 638/262 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0135 begin`);
      logInfo("decision(7,515.4,411.8,2.5,638,262,2,1)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(515.4, 411.8) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(638, 262) + '|' + xComponentSizeText(false, 0, 720, 1280, 638, 262, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|1280*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|1280*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0135 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0136
     * @tc.name      Resolution_DecisionMatrix_0136
     * @tc.desc      resolution decision 8 with rotation 675/315 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0136 begin`);
      logInfo("decision(8,518.5,414.5,0.5,675,315,0,1.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(518.5, 414.5) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(675, 315) + '|' + xComponentSizeText(false, 0, 720, 1280, 675, 315, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0136 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0137
     * @tc.name      Resolution_DecisionMatrix_0137
     * @tc.desc      resolution decision 9 with rotation 712/8 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0137 begin`);
      logInfo("decision(9,521.6,417.2,0.75,712,8,1,2)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(521.6, 417.2) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(712, 8) + '|' + xComponentSizeText(false, 0, 720, 1280, 712, 8, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|2560*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|2560*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0137 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0138
     * @tc.name      Resolution_DecisionMatrix_0138
     * @tc.desc      resolution decision 10 with rotation 29/61 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0138 begin`);
      logInfo("decision(10,524.7,419.9,1,29,61,2,2.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(524.7, 419.9) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(29, 61) + '|' + xComponentSizeText(false, 0, 720, 1280, 29, 61, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*1800|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*1800|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0138 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0139
     * @tc.name      Resolution_DecisionMatrix_0139
     * @tc.desc      resolution decision 11 with rotation 66/114 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0139 begin`);
      logInfo("decision(11,527.8,422.6,1.25,66,114,0,3)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(527.8, 422.6) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(66, 114) + '|' + xComponentSizeText(false, 0, 720, 1280, 66, 114, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0139 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0140
     * @tc.name      Resolution_DecisionMatrix_0140
     * @tc.desc      resolution decision 12 with rotation 103/167 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0140 begin`);
      logInfo("decision(12,530.9,425.3,1.5,103,167,1,3.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(530.9, 425.3) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(103, 167) + '|' + xComponentSizeText(false, 0, 720, 1280, 103, 167, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*2520|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*2520|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0140 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0141
     * @tc.name      Resolution_DecisionMatrix_0141
     * @tc.desc      resolution decision 13 with rotation 140/220 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0141 begin`);
      logInfo("decision(13,534,428,1.75,140,220,2,0.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(534, 428) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(140, 220) + '|' + xComponentSizeText(false, 0, 720, 1280, 140, 220, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|640*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|640*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0141 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0142
     * @tc.name      Resolution_DecisionMatrix_0142
     * @tc.desc      resolution decision 14 with rotation 177/273 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0142 begin`);
      logInfo("decision(14,537.1,430.7,2,177,273,0,1)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(537.1, 430.7) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(177, 273) + '|' + xComponentSizeText(false, 0, 720, 1280, 177, 273, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0142 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0143
     * @tc.name      Resolution_DecisionMatrix_0143
     * @tc.desc      resolution decision 15 with rotation 214/326 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0143 begin`);
      logInfo("decision(15,540.2,433.4,2.25,214,326,1,1.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(540.2, 433.4) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(214, 326) + '|' + xComponentSizeText(false, 0, 720, 1280, 214, 326, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|1920*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|1920*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0143 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0144
     * @tc.name      Resolution_DecisionMatrix_0144
     * @tc.desc      resolution decision 16 with rotation 251/19 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0144 begin`);
      logInfo("decision(16,543.3,436.1,2.5,251,19,2,2)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(543.3, 436.1) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(251, 19) + '|' + xComponentSizeText(false, 0, 720, 1280, 251, 19, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*1440|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*1440|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0144 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0145
     * @tc.name      Resolution_DecisionMatrix_0145
     * @tc.desc      resolution decision -1 with rotation 288/72 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0145 begin`);
      logInfo("decision(-1,546.4,438.8,0.5,288,72,0,2.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(546.4, 438.8) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(288, 72) + '|' + xComponentSizeText(false, 0, 720, 1280, 288, 72, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0145 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0146
     * @tc.name      Resolution_DecisionMatrix_0146
     * @tc.desc      resolution decision 0 with rotation 325/125 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0146 begin`);
      logInfo("decision(0,549.5,441.5,0.75,325,125,1,3)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(549.5, 441.5) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(325, 125) + '|' + xComponentSizeText(false, 0, 720, 1280, 325, 125, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*2160|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*2160|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0146 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0147
     * @tc.name      Resolution_DecisionMatrix_0147
     * @tc.desc      resolution decision 1 with rotation 362/178 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0147 begin`);
      logInfo("decision(1,552.6,444.2,1,362,178,2,3.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(552.6, 444.2) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(362, 178) + '|' + xComponentSizeText(false, 0, 720, 1280, 362, 178, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|4480*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|4480*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0147 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0148
     * @tc.name      Resolution_DecisionMatrix_0148
     * @tc.desc      resolution decision 2 with rotation 399/231 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0148 begin`);
      logInfo("decision(2,555.7,446.9,1.25,399,231,0,0.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(555.7, 446.9) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(399, 231) + '|' + xComponentSizeText(false, 0, 720, 1280, 399, 231, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0148 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0149
     * @tc.name      Resolution_DecisionMatrix_0149
     * @tc.desc      resolution decision 3 with rotation 436/284 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0149 begin`);
      logInfo("decision(3,558.8,449.6,1.5,436,284,1,1)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(558.8, 449.6) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(436, 284) + '|' + xComponentSizeText(false, 0, 720, 1280, 436, 284, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|1280*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|1280*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0149 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0150
     * @tc.name      Resolution_DecisionMatrix_0150
     * @tc.desc      resolution decision 4 with rotation 473/337 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0150 begin`);
      logInfo("decision(4,561.9,452.3,1.75,473,337,2,1.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(561.9, 452.3) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(473, 337) + '|' + xComponentSizeText(false, 0, 720, 1280, 473, 337, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*1080|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*1080|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0150 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0151
     * @tc.name      Resolution_DecisionMatrix_0151
     * @tc.desc      resolution decision 5 with rotation 510/30 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0151 begin`);
      logInfo("decision(5,565,455,2,510,30,0,2)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(565, 455) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(510, 30) + '|' + xComponentSizeText(false, 0, 720, 1280, 510, 30, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0151 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0152
     * @tc.name      Resolution_DecisionMatrix_0152
     * @tc.desc      resolution decision 6 with rotation 547/83 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0152 begin`);
      logInfo("decision(6,568.1,457.7,2.25,547,83,1,2.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(568.1, 457.7) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(547, 83) + '|' + xComponentSizeText(false, 0, 720, 1280, 547, 83, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*1800|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*1800|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0152 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0153
     * @tc.name      Resolution_DecisionMatrix_0153
     * @tc.desc      resolution decision 7 with rotation 584/136 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0153 begin`);
      logInfo("decision(7,571.2,460.4,2.5,584,136,2,3)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(571.2, 460.4) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(584, 136) + '|' + xComponentSizeText(false, 0, 720, 1280, 584, 136, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|3840*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|3840*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0153 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0154
     * @tc.name      Resolution_DecisionMatrix_0154
     * @tc.desc      resolution decision 8 with rotation 621/189 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0154 begin`);
      logInfo("decision(8,574.3,463.1,0.5,621,189,0,3.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(574.3, 463.1) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(621, 189) + '|' + xComponentSizeText(false, 0, 720, 1280, 621, 189, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0154 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0155
     * @tc.name      Resolution_DecisionMatrix_0155
     * @tc.desc      resolution decision 9 with rotation 658/242 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0155 begin`);
      logInfo("decision(9,577.4,465.8,0.75,658,242,1,0.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(577.4, 465.8) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(658, 242) + '|' + xComponentSizeText(false, 0, 720, 1280, 658, 242, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|640*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|640*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0155 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0156
     * @tc.name      Resolution_DecisionMatrix_0156
     * @tc.desc      resolution decision 10 with rotation 695/295 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0156 begin`);
      logInfo("decision(10,580.5,468.5,1,695,295,2,1)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(580.5, 468.5) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(695, 295) + '|' + xComponentSizeText(false, 0, 720, 1280, 695, 295, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*720|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*720|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0156 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0157
     * @tc.name      Resolution_DecisionMatrix_0157
     * @tc.desc      resolution decision 11 with rotation 12/348 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0157 begin`);
      logInfo("decision(11,583.6,471.2,1.25,12,348,0,1.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(583.6, 471.2) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(12, 348) + '|' + xComponentSizeText(false, 0, 720, 1280, 12, 348, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0157 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0158
     * @tc.name      Resolution_DecisionMatrix_0158
     * @tc.desc      resolution decision 12 with rotation 49/41 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0158 begin`);
      logInfo("decision(12,586.7,473.9,1.5,49,41,1,2)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(586.7, 473.9) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(49, 41) + '|' + xComponentSizeText(false, 0, 720, 1280, 49, 41, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*1440|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*1440|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0158 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0159
     * @tc.name      Resolution_DecisionMatrix_0159
     * @tc.desc      resolution decision 13 with rotation 86/94 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0159 begin`);
      logInfo("decision(13,589.8,476.6,1.75,86,94,2,2.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(589.8, 476.6) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(86, 94) + '|' + xComponentSizeText(false, 0, 720, 1280, 86, 94, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|3200*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|3200*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0159 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0160
     * @tc.name      Resolution_DecisionMatrix_0160
     * @tc.desc      resolution decision 14 with rotation 123/147 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0160 begin`);
      logInfo("decision(14,592.9,479.3,2,123,147,0,3)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(592.9, 479.3) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(123, 147) + '|' + xComponentSizeText(false, 0, 720, 1280, 123, 147, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0160 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0161
     * @tc.name      Resolution_DecisionMatrix_0161
     * @tc.desc      resolution decision 15 with rotation 160/200 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0161 begin`);
      logInfo("decision(15,596,482,2.25,160,200,1,3.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(596, 482) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(160, 200) + '|' + xComponentSizeText(false, 0, 720, 1280, 160, 200, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|4480*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|4480*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0161 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0162
     * @tc.name      Resolution_DecisionMatrix_0162
     * @tc.desc      resolution decision 16 with rotation 197/253 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0162 begin`);
      logInfo("decision(16,599.1,484.7,2.5,197,253,2,0.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(599.1, 484.7) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(197, 253) + '|' + xComponentSizeText(false, 0, 720, 1280, 197, 253, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*360|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*360|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0162 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0163
     * @tc.name      Resolution_DecisionMatrix_0163
     * @tc.desc      resolution decision -1 with rotation 234/306 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0163 begin`);
      logInfo("decision(-1,602.2,487.4,0.5,234,306,0,1)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(602.2, 487.4) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(234, 306) + '|' + xComponentSizeText(false, 0, 720, 1280, 234, 306, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0163 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0164
     * @tc.name      Resolution_DecisionMatrix_0164
     * @tc.desc      resolution decision 0 with rotation 271/359 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0164 begin`);
      logInfo("decision(0,605.3,490.1,0.75,271,359,1,1.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(605.3, 490.1) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(271, 359) + '|' + xComponentSizeText(false, 0, 720, 1280, 271, 359, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*1080|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*1080|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0164 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0165
     * @tc.name      Resolution_DecisionMatrix_0165
     * @tc.desc      resolution decision 1 with rotation 308/52 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0165 begin`);
      logInfo("decision(1,608.4,492.8,1,308,52,2,2)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(608.4, 492.8) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(308, 52) + '|' + xComponentSizeText(false, 0, 720, 1280, 308, 52, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|2560*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|2560*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0165 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0166
     * @tc.name      Resolution_DecisionMatrix_0166
     * @tc.desc      resolution decision 2 with rotation 345/105 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0166 begin`);
      logInfo("decision(2,611.5,495.5,1.25,345,105,0,2.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(611.5, 495.5) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(345, 105) + '|' + xComponentSizeText(false, 0, 720, 1280, 345, 105, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0166 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0167
     * @tc.name      Resolution_DecisionMatrix_0167
     * @tc.desc      resolution decision 3 with rotation 382/158 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0167 begin`);
      logInfo("decision(3,614.6,498.2,1.5,382,158,1,3)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(614.6, 498.2) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(382, 158) + '|' + xComponentSizeText(false, 0, 720, 1280, 382, 158, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|3840*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|3840*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0167 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0168
     * @tc.name      Resolution_DecisionMatrix_0168
     * @tc.desc      resolution decision 4 with rotation 419/211 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0168 begin`);
      logInfo("decision(4,617.7,500.9,1.75,419,211,2,3.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(617.7, 500.9) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(419, 211) + '|' + xComponentSizeText(false, 0, 720, 1280, 419, 211, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*2520|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*2520|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0168 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0169
     * @tc.name      Resolution_DecisionMatrix_0169
     * @tc.desc      resolution decision 5 with rotation 456/264 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0169 begin`);
      logInfo("decision(5,620.8,503.6,2,456,264,0,0.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(620.8, 503.6) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(456, 264) + '|' + xComponentSizeText(false, 0, 720, 1280, 456, 264, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0169 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0170
     * @tc.name      Resolution_DecisionMatrix_0170
     * @tc.desc      resolution decision 6 with rotation 493/317 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0170 begin`);
      logInfo("decision(6,623.9,506.3,2.25,493,317,1,1)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(623.9, 506.3) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(493, 317) + '|' + xComponentSizeText(false, 0, 720, 1280, 493, 317, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*720|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*720|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0170 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0171
     * @tc.name      Resolution_DecisionMatrix_0171
     * @tc.desc      resolution decision 7 with rotation 530/10 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0171 begin`);
      logInfo("decision(7,627,509,2.5,530,10,2,1.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(627, 509) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(530, 10) + '|' + xComponentSizeText(false, 0, 720, 1280, 530, 10, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|1920*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|1920*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0171 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0172
     * @tc.name      Resolution_DecisionMatrix_0172
     * @tc.desc      resolution decision 8 with rotation 567/63 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0172 begin`);
      logInfo("decision(8,630.1,511.7,0.5,567,63,0,2)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(630.1, 511.7) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(567, 63) + '|' + xComponentSizeText(false, 0, 720, 1280, 567, 63, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0172 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0173
     * @tc.name      Resolution_DecisionMatrix_0173
     * @tc.desc      resolution decision 9 with rotation 604/116 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0173 begin`);
      logInfo("decision(9,633.2,514.4,0.75,604,116,1,2.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(633.2, 514.4) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(604, 116) + '|' + xComponentSizeText(false, 0, 720, 1280, 604, 116, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|3200*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|3200*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0173 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0174
     * @tc.name      Resolution_DecisionMatrix_0174
     * @tc.desc      resolution decision 10 with rotation 641/169 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0174 begin`);
      logInfo("decision(10,636.3,517.1,1,641,169,2,3)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(636.3, 517.1) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(641, 169) + '|' + xComponentSizeText(false, 0, 720, 1280, 641, 169, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*2160|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*2160|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0174 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0175
     * @tc.name      Resolution_DecisionMatrix_0175
     * @tc.desc      resolution decision 11 with rotation 678/222 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0175 begin`);
      logInfo("decision(11,639.4,519.8,1.25,678,222,0,3.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(639.4, 519.8) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(678, 222) + '|' + xComponentSizeText(false, 0, 720, 1280, 678, 222, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0175 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0176
     * @tc.name      Resolution_DecisionMatrix_0176
     * @tc.desc      resolution decision 12 with rotation 715/275 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0176 begin`);
      logInfo("decision(12,642.5,522.5,1.5,715,275,1,0.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(642.5, 522.5) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(715, 275) + '|' + xComponentSizeText(false, 0, 720, 1280, 715, 275, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*360|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*360|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0176 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0177
     * @tc.name      Resolution_DecisionMatrix_0177
     * @tc.desc      resolution decision 13 with rotation 32/328 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0177 begin`);
      logInfo("decision(13,645.6,525.2,1.75,32,328,2,1)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(645.6, 525.2) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(32, 328) + '|' + xComponentSizeText(false, 0, 720, 1280, 32, 328, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|1280*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|1280*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0177 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0178
     * @tc.name      Resolution_DecisionMatrix_0178
     * @tc.desc      resolution decision 14 with rotation 69/21 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0178 begin`);
      logInfo("decision(14,648.7,527.9,2,69,21,0,1.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(648.7, 527.9) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(69, 21) + '|' + xComponentSizeText(false, 0, 720, 1280, 69, 21, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0178 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0179
     * @tc.name      Resolution_DecisionMatrix_0179
     * @tc.desc      resolution decision 15 with rotation 106/74 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0179 begin`);
      logInfo("decision(15,651.8,530.6,2.25,106,74,1,2)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(651.8, 530.6) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(106, 74) + '|' + xComponentSizeText(false, 0, 720, 1280, 106, 74, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|2560*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|2560*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0179 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0180
     * @tc.name      Resolution_DecisionMatrix_0180
     * @tc.desc      resolution decision 16 with rotation 143/127 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0180 begin`);
      logInfo("decision(16,654.9,533.3,2.5,143,127,2,2.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(654.9, 533.3) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(143, 127) + '|' + xComponentSizeText(false, 0, 720, 1280, 143, 127, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*1800|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*1800|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0180 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0181
     * @tc.name      Resolution_DecisionMatrix_0181
     * @tc.desc      resolution decision -1 with rotation 180/180 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0181 begin`);
      logInfo("decision(-1,658,536,0.5,180,180,0,3)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(658, 536) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(180, 180) + '|' + xComponentSizeText(false, 0, 720, 1280, 180, 180, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0181 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0182
     * @tc.name      Resolution_DecisionMatrix_0182
     * @tc.desc      resolution decision 0 with rotation 217/233 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0182 begin`);
      logInfo("decision(0,661.1,538.7,0.75,217,233,1,3.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(661.1, 538.7) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(217, 233) + '|' + xComponentSizeText(false, 0, 720, 1280, 217, 233, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*2520|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*2520|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0182 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0183
     * @tc.name      Resolution_DecisionMatrix_0183
     * @tc.desc      resolution decision 1 with rotation 254/286 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0183 begin`);
      logInfo("decision(1,664.2,541.4,1,254,286,2,0.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(664.2, 541.4) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(254, 286) + '|' + xComponentSizeText(false, 0, 720, 1280, 254, 286, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|640*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|640*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0183 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0184
     * @tc.name      Resolution_DecisionMatrix_0184
     * @tc.desc      resolution decision 2 with rotation 291/339 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0184 begin`);
      logInfo("decision(2,667.3,544.1,1.25,291,339,0,1)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(667.3, 544.1) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(291, 339) + '|' + xComponentSizeText(false, 0, 720, 1280, 291, 339, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0184 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0185
     * @tc.name      Resolution_DecisionMatrix_0185
     * @tc.desc      resolution decision 3 with rotation 328/32 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0185 begin`);
      logInfo("decision(3,670.4,546.8,1.5,328,32,1,1.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(670.4, 546.8) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(328, 32) + '|' + xComponentSizeText(false, 0, 720, 1280, 328, 32, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|1920*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|1920*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0185 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0186
     * @tc.name      Resolution_DecisionMatrix_0186
     * @tc.desc      resolution decision 4 with rotation 365/85 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0186 begin`);
      logInfo("decision(4,673.5,549.5,1.75,365,85,2,2)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(673.5, 549.5) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(365, 85) + '|' + xComponentSizeText(false, 0, 720, 1280, 365, 85, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*1440|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*1440|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0186 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0187
     * @tc.name      Resolution_DecisionMatrix_0187
     * @tc.desc      resolution decision 5 with rotation 402/138 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0187 begin`);
      logInfo("decision(5,676.6,552.2,2,402,138,0,2.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(676.6, 552.2) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(402, 138) + '|' + xComponentSizeText(false, 0, 720, 1280, 402, 138, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0187 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0188
     * @tc.name      Resolution_DecisionMatrix_0188
     * @tc.desc      resolution decision 6 with rotation 439/191 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0188 begin`);
      logInfo("decision(6,679.7,554.9,2.25,439,191,1,3)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(679.7, 554.9) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(439, 191) + '|' + xComponentSizeText(false, 0, 720, 1280, 439, 191, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*2160|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*2160|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0188 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0189
     * @tc.name      Resolution_DecisionMatrix_0189
     * @tc.desc      resolution decision 7 with rotation 476/244 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0189 begin`);
      logInfo("decision(7,682.8,557.6,2.5,476,244,2,3.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(682.8, 557.6) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(476, 244) + '|' + xComponentSizeText(false, 0, 720, 1280, 476, 244, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|4480*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|4480*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0189 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0190
     * @tc.name      Resolution_DecisionMatrix_0190
     * @tc.desc      resolution decision 8 with rotation 513/297 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0190 begin`);
      logInfo("decision(8,685.9,560.3,0.5,513,297,0,0.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(685.9, 560.3) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(513, 297) + '|' + xComponentSizeText(false, 0, 720, 1280, 513, 297, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0190 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0191
     * @tc.name      Resolution_DecisionMatrix_0191
     * @tc.desc      resolution decision 9 with rotation 550/350 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0191 begin`);
      logInfo("decision(9,689,563,0.75,550,350,1,1)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(689, 563) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(550, 350) + '|' + xComponentSizeText(false, 0, 720, 1280, 550, 350, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|1280*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|1280*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0191 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0192
     * @tc.name      Resolution_DecisionMatrix_0192
     * @tc.desc      resolution decision 10 with rotation 587/43 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0192 begin`);
      logInfo("decision(10,692.1,565.7,1,587,43,2,1.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(692.1, 565.7) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(587, 43) + '|' + xComponentSizeText(false, 0, 720, 1280, 587, 43, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*1080|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*1080|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0192 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0193
     * @tc.name      Resolution_DecisionMatrix_0193
     * @tc.desc      resolution decision 11 with rotation 624/96 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0193 begin`);
      logInfo("decision(11,695.2,568.4,1.25,624,96,0,2)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(695.2, 568.4) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(624, 96) + '|' + xComponentSizeText(false, 0, 720, 1280, 624, 96, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0193 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0194
     * @tc.name      Resolution_DecisionMatrix_0194
     * @tc.desc      resolution decision 12 with rotation 661/149 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0194 begin`);
      logInfo("decision(12,698.3,571.1,1.5,661,149,1,2.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(698.3, 571.1) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(661, 149) + '|' + xComponentSizeText(false, 0, 720, 1280, 661, 149, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*1800|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*1800|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0194 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0195
     * @tc.name      Resolution_DecisionMatrix_0195
     * @tc.desc      resolution decision 13 with rotation 698/202 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0195 begin`);
      logInfo("decision(13,701.4,573.8,1.75,698,202,2,3)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(701.4, 573.8) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(698, 202) + '|' + xComponentSizeText(false, 0, 720, 1280, 698, 202, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|3840*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|3840*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0195 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0196
     * @tc.name      Resolution_DecisionMatrix_0196
     * @tc.desc      resolution decision 14 with rotation 15/255 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0196 begin`);
      logInfo("decision(14,704.5,576.5,2,15,255,0,3.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(704.5, 576.5) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(15, 255) + '|' + xComponentSizeText(false, 0, 720, 1280, 15, 255, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0196 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0197
     * @tc.name      Resolution_DecisionMatrix_0197
     * @tc.desc      resolution decision 15 with rotation 52/308 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0197 begin`);
      logInfo("decision(15,707.6,579.2,2.25,52,308,1,0.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(707.6, 579.2) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(52, 308) + '|' + xComponentSizeText(false, 0, 720, 1280, 52, 308, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|640*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|640*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0197 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0198
     * @tc.name      Resolution_DecisionMatrix_0198
     * @tc.desc      resolution decision 16 with rotation 89/1 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0198 begin`);
      logInfo("decision(16,710.7,581.9,2.5,89,1,2,1)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(710.7, 581.9) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(89, 1) + '|' + xComponentSizeText(false, 0, 720, 1280, 89, 1, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*720|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*720|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0198 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0199
     * @tc.name      Resolution_DecisionMatrix_0199
     * @tc.desc      resolution decision -1 with rotation 126/54 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0199 begin`);
      logInfo("decision(-1,713.8,584.6,0.5,126,54,0,1.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(713.8, 584.6) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(126, 54) + '|' + xComponentSizeText(false, 0, 720, 1280, 126, 54, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0199 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0200
     * @tc.name      Resolution_DecisionMatrix_0200
     * @tc.desc      resolution decision 0 with rotation 163/107 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0200 begin`);
      logInfo("decision(0,716.9,587.3,0.75,163,107,1,2)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(716.9, 587.3) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(163, 107) + '|' + xComponentSizeText(false, 0, 720, 1280, 163, 107, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*1440|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*1440|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0200 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0201
     * @tc.name      Resolution_DecisionMatrix_0201
     * @tc.desc      resolution decision 1 with rotation 200/160 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0201 begin`);
      logInfo("decision(1,720,590,1,200,160,2,2.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(720, 590) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(200, 160) + '|' + xComponentSizeText(false, 0, 720, 1280, 200, 160, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|3200*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|3200*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0201 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0202
     * @tc.name      Resolution_DecisionMatrix_0202
     * @tc.desc      resolution decision 2 with rotation 237/213 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0202 begin`);
      logInfo("decision(2,723.1,592.7,1.25,237,213,0,3)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(723.1, 592.7) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(237, 213) + '|' + xComponentSizeText(false, 0, 720, 1280, 237, 213, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0202 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0203
     * @tc.name      Resolution_DecisionMatrix_0203
     * @tc.desc      resolution decision 3 with rotation 274/266 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0203 begin`);
      logInfo("decision(3,726.2,595.4,1.5,274,266,1,3.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(726.2, 595.4) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(274, 266) + '|' + xComponentSizeText(false, 0, 720, 1280, 274, 266, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|4480*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|4480*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0203 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0204
     * @tc.name      Resolution_DecisionMatrix_0204
     * @tc.desc      resolution decision 4 with rotation 311/319 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0204 begin`);
      logInfo("decision(4,729.3,598.1,1.75,311,319,2,0.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(729.3, 598.1) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(311, 319) + '|' + xComponentSizeText(false, 0, 720, 1280, 311, 319, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*360|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*360|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0204 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0205
     * @tc.name      Resolution_DecisionMatrix_0205
     * @tc.desc      resolution decision 5 with rotation 348/12 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0205 begin`);
      logInfo("decision(5,732.4,600.8,2,348,12,0,1)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(732.4, 600.8) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(348, 12) + '|' + xComponentSizeText(false, 0, 720, 1280, 348, 12, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0205 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0206
     * @tc.name      Resolution_DecisionMatrix_0206
     * @tc.desc      resolution decision 6 with rotation 385/65 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0206 begin`);
      logInfo("decision(6,735.5,603.5,2.25,385,65,1,1.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(735.5, 603.5) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(385, 65) + '|' + xComponentSizeText(false, 0, 720, 1280, 385, 65, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*1080|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*1080|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0206 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0207
     * @tc.name      Resolution_DecisionMatrix_0207
     * @tc.desc      resolution decision 7 with rotation 422/118 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0207 begin`);
      logInfo("decision(7,738.6,606.2,2.5,422,118,2,2)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(738.6, 606.2) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(422, 118) + '|' + xComponentSizeText(false, 0, 720, 1280, 422, 118, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|2560*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|2560*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0207 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0208
     * @tc.name      Resolution_DecisionMatrix_0208
     * @tc.desc      resolution decision 8 with rotation 459/171 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0208 begin`);
      logInfo("decision(8,741.7,608.9,0.5,459,171,0,2.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(741.7, 608.9) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(459, 171) + '|' + xComponentSizeText(false, 0, 720, 1280, 459, 171, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0208 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0209
     * @tc.name      Resolution_DecisionMatrix_0209
     * @tc.desc      resolution decision 9 with rotation 496/224 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0209 begin`);
      logInfo("decision(9,744.8,611.6,0.75,496,224,1,3)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(744.8, 611.6) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(496, 224) + '|' + xComponentSizeText(false, 0, 720, 1280, 496, 224, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|3840*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|3840*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0209 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0210
     * @tc.name      Resolution_DecisionMatrix_0210
     * @tc.desc      resolution decision 10 with rotation 533/277 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0210 begin`);
      logInfo("decision(10,747.9,614.3,1,533,277,2,3.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(747.9, 614.3) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(533, 277) + '|' + xComponentSizeText(false, 0, 720, 1280, 533, 277, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*2520|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*2520|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0210 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0211
     * @tc.name      Resolution_DecisionMatrix_0211
     * @tc.desc      resolution decision 11 with rotation 570/330 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0211 begin`);
      logInfo("decision(11,751,617,1.25,570,330,0,0.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(751, 617) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(570, 330) + '|' + xComponentSizeText(false, 0, 720, 1280, 570, 330, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0211 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0212
     * @tc.name      Resolution_DecisionMatrix_0212
     * @tc.desc      resolution decision 12 with rotation 607/23 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0212 begin`);
      logInfo("decision(12,754.1,619.7,1.5,607,23,1,1)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(754.1, 619.7) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(607, 23) + '|' + xComponentSizeText(false, 0, 720, 1280, 607, 23, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*720|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*720|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0212 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0213
     * @tc.name      Resolution_DecisionMatrix_0213
     * @tc.desc      resolution decision 13 with rotation 644/76 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0213 begin`);
      logInfo("decision(13,757.2,622.4,1.75,644,76,2,1.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(757.2, 622.4) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(644, 76) + '|' + xComponentSizeText(false, 0, 720, 1280, 644, 76, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|1920*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|1920*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0213 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0214
     * @tc.name      Resolution_DecisionMatrix_0214
     * @tc.desc      resolution decision 14 with rotation 681/129 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0214 begin`);
      logInfo("decision(14,760.3,625.1,2,681,129,0,2)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(760.3, 625.1) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(681, 129) + '|' + xComponentSizeText(false, 0, 720, 1280, 681, 129, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0214 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0215
     * @tc.name      Resolution_DecisionMatrix_0215
     * @tc.desc      resolution decision 15 with rotation 718/182 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0215 begin`);
      logInfo("decision(15,763.4,627.8,2.25,718,182,1,2.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(763.4, 627.8) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(718, 182) + '|' + xComponentSizeText(false, 0, 720, 1280, 718, 182, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|3200*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|3200*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0215 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0216
     * @tc.name      Resolution_DecisionMatrix_0216
     * @tc.desc      resolution decision 16 with rotation 35/235 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0216 begin`);
      logInfo("decision(16,766.5,630.5,2.5,35,235,2,3)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(766.5, 630.5) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(35, 235) + '|' + xComponentSizeText(false, 0, 720, 1280, 35, 235, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*2160|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*2160|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0216 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0217
     * @tc.name      Resolution_DecisionMatrix_0217
     * @tc.desc      resolution decision -1 with rotation 72/288 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0217 begin`);
      logInfo("decision(-1,769.6,633.2,0.5,72,288,0,3.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(769.6, 633.2) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(72, 288) + '|' + xComponentSizeText(false, 0, 720, 1280, 72, 288, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0217 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0218
     * @tc.name      Resolution_DecisionMatrix_0218
     * @tc.desc      resolution decision 0 with rotation 109/341 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0218 begin`);
      logInfo("decision(0,772.7,635.9,0.75,109,341,1,0.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(772.7, 635.9) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(109, 341) + '|' + xComponentSizeText(false, 0, 720, 1280, 109, 341, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*360|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*360|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0218 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0219
     * @tc.name      Resolution_DecisionMatrix_0219
     * @tc.desc      resolution decision 1 with rotation 146/34 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0219 begin`);
      logInfo("decision(1,775.8,638.6,1,146,34,2,1)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(775.8, 638.6) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(146, 34) + '|' + xComponentSizeText(false, 0, 720, 1280, 146, 34, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|1280*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|1280*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0219 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0220
     * @tc.name      Resolution_DecisionMatrix_0220
     * @tc.desc      resolution decision 2 with rotation 183/87 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0220 begin`);
      logInfo("decision(2,778.9,641.3,1.25,183,87,0,1.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(778.9, 641.3) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(183, 87) + '|' + xComponentSizeText(false, 0, 720, 1280, 183, 87, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0220 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0221
     * @tc.name      Resolution_DecisionMatrix_0221
     * @tc.desc      resolution decision 3 with rotation 220/140 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0221 begin`);
      logInfo("decision(3,782,644,1.5,220,140,1,2)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(782, 644) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(220, 140) + '|' + xComponentSizeText(false, 0, 720, 1280, 220, 140, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|2560*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|2560*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0221 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0222
     * @tc.name      Resolution_DecisionMatrix_0222
     * @tc.desc      resolution decision 4 with rotation 257/193 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0222 begin`);
      logInfo("decision(4,785.1,646.7,1.75,257,193,2,2.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(785.1, 646.7) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(257, 193) + '|' + xComponentSizeText(false, 0, 720, 1280, 257, 193, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*1800|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*1800|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0222 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0223
     * @tc.name      Resolution_DecisionMatrix_0223
     * @tc.desc      resolution decision 5 with rotation 294/246 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0223 begin`);
      logInfo("decision(5,788.2,649.4,2,294,246,0,3)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(788.2, 649.4) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(294, 246) + '|' + xComponentSizeText(false, 0, 720, 1280, 294, 246, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0223 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0224
     * @tc.name      Resolution_DecisionMatrix_0224
     * @tc.desc      resolution decision 6 with rotation 331/299 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0224 begin`);
      logInfo("decision(6,791.3,652.1,2.25,331,299,1,3.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(791.3, 652.1) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(331, 299) + '|' + xComponentSizeText(false, 0, 720, 1280, 331, 299, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*2520|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*2520|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0224 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0225
     * @tc.name      Resolution_DecisionMatrix_0225
     * @tc.desc      resolution decision 7 with rotation 368/352 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0225 begin`);
      logInfo("decision(7,794.4,654.8,2.5,368,352,2,0.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(794.4, 654.8) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(368, 352) + '|' + xComponentSizeText(false, 0, 720, 1280, 368, 352, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|640*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|640*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0225 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0226
     * @tc.name      Resolution_DecisionMatrix_0226
     * @tc.desc      resolution decision 8 with rotation 405/45 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0226 begin`);
      logInfo("decision(8,797.5,657.5,0.5,405,45,0,1)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(797.5, 657.5) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(405, 45) + '|' + xComponentSizeText(false, 0, 720, 1280, 405, 45, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0226 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0227
     * @tc.name      Resolution_DecisionMatrix_0227
     * @tc.desc      resolution decision 9 with rotation 442/98 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0227 begin`);
      logInfo("decision(9,800.6,660.2,0.75,442,98,1,1.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(800.6, 660.2) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(442, 98) + '|' + xComponentSizeText(false, 0, 720, 1280, 442, 98, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|1920*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|1920*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0227 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0228
     * @tc.name      Resolution_DecisionMatrix_0228
     * @tc.desc      resolution decision 10 with rotation 479/151 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0228 begin`);
      logInfo("decision(10,803.7,662.9,1,479,151,2,2)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(803.7, 662.9) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(479, 151) + '|' + xComponentSizeText(false, 0, 720, 1280, 479, 151, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*1440|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*1440|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0228 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0229
     * @tc.name      Resolution_DecisionMatrix_0229
     * @tc.desc      resolution decision 11 with rotation 516/204 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0229 begin`);
      logInfo("decision(11,806.8,665.6,1.25,516,204,0,2.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(806.8, 665.6) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(516, 204) + '|' + xComponentSizeText(false, 0, 720, 1280, 516, 204, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0229 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0230
     * @tc.name      Resolution_DecisionMatrix_0230
     * @tc.desc      resolution decision 12 with rotation 553/257 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0230 begin`);
      logInfo("decision(12,809.9,668.3,1.5,553,257,1,3)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(809.9, 668.3) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(553, 257) + '|' + xComponentSizeText(false, 0, 720, 1280, 553, 257, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*2160|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*2160|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0230 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0231
     * @tc.name      Resolution_DecisionMatrix_0231
     * @tc.desc      resolution decision 13 with rotation 590/310 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0231 begin`);
      logInfo("decision(13,813,671,1.75,590,310,2,3.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(813, 671) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(590, 310) + '|' + xComponentSizeText(false, 0, 720, 1280, 590, 310, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|4480*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|4480*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0231 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0232
     * @tc.name      Resolution_DecisionMatrix_0232
     * @tc.desc      resolution decision 14 with rotation 627/3 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0232 begin`);
      logInfo("decision(14,816.1,673.7,2,627,3,0,0.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(816.1, 673.7) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(627, 3) + '|' + xComponentSizeText(false, 0, 720, 1280, 627, 3, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0232 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0233
     * @tc.name      Resolution_DecisionMatrix_0233
     * @tc.desc      resolution decision 15 with rotation 664/56 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0233 begin`);
      logInfo("decision(15,819.2,676.4,2.25,664,56,1,1)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(819.2, 676.4) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(664, 56) + '|' + xComponentSizeText(false, 0, 720, 1280, 664, 56, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|1280*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|1280*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0233 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0234
     * @tc.name      Resolution_DecisionMatrix_0234
     * @tc.desc      resolution decision 16 with rotation 701/109 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0234 begin`);
      logInfo("decision(16,822.3,679.1,2.5,701,109,2,1.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(822.3, 679.1) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(701, 109) + '|' + xComponentSizeText(false, 0, 720, 1280, 701, 109, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*1080|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*1080|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0234 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0235
     * @tc.name      Resolution_DecisionMatrix_0235
     * @tc.desc      resolution decision -1 with rotation 18/162 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0235 begin`);
      logInfo("decision(-1,825.4,681.8,0.5,18,162,0,2)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(825.4, 681.8) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(18, 162) + '|' + xComponentSizeText(false, 0, 720, 1280, 18, 162, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0235 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0236
     * @tc.name      Resolution_DecisionMatrix_0236
     * @tc.desc      resolution decision 0 with rotation 55/215 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0236 begin`);
      logInfo("decision(0,828.5,684.5,0.75,55,215,1,2.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(828.5, 684.5) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(55, 215) + '|' + xComponentSizeText(false, 0, 720, 1280, 55, 215, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*1800|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*1800|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0236 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0237
     * @tc.name      Resolution_DecisionMatrix_0237
     * @tc.desc      resolution decision 1 with rotation 92/268 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0237 begin`);
      logInfo("decision(1,831.6,687.2,1,92,268,2,3)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(831.6, 687.2) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(92, 268) + '|' + xComponentSizeText(false, 0, 720, 1280, 92, 268, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|3840*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|3840*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0237 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0238
     * @tc.name      Resolution_DecisionMatrix_0238
     * @tc.desc      resolution decision 2 with rotation 129/321 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0238 begin`);
      logInfo("decision(2,834.7,689.9,1.25,129,321,0,3.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(834.7, 689.9) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(129, 321) + '|' + xComponentSizeText(false, 0, 720, 1280, 129, 321, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0238 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0239
     * @tc.name      Resolution_DecisionMatrix_0239
     * @tc.desc      resolution decision 3 with rotation 166/14 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0239 begin`);
      logInfo("decision(3,837.8,692.6,1.5,166,14,1,0.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(837.8, 692.6) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(166, 14) + '|' + xComponentSizeText(false, 0, 720, 1280, 166, 14, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|640*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|640*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0239 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0240
     * @tc.name      Resolution_DecisionMatrix_0240
     * @tc.desc      resolution decision 4 with rotation 203/67 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0240 begin`);
      logInfo("decision(4,840.9,695.3,1.75,203,67,2,1)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(840.9, 695.3) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(203, 67) + '|' + xComponentSizeText(false, 0, 720, 1280, 203, 67, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*720|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*720|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0240 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0241
     * @tc.name      Resolution_DecisionMatrix_0241
     * @tc.desc      resolution decision 5 with rotation 240/120 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0241 begin`);
      logInfo("decision(5,844,698,2,240,120,0,1.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(844, 698) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(240, 120) + '|' + xComponentSizeText(false, 0, 720, 1280, 240, 120, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0241 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0242
     * @tc.name      Resolution_DecisionMatrix_0242
     * @tc.desc      resolution decision 6 with rotation 277/173 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0242 begin`);
      logInfo("decision(6,847.1,700.7,2.25,277,173,1,2)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(847.1, 700.7) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(277, 173) + '|' + xComponentSizeText(false, 0, 720, 1280, 277, 173, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*1440|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*1440|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0242 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0243
     * @tc.name      Resolution_DecisionMatrix_0243
     * @tc.desc      resolution decision 7 with rotation 314/226 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0243 begin`);
      logInfo("decision(7,850.2,703.4,2.5,314,226,2,2.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(850.2, 703.4) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(314, 226) + '|' + xComponentSizeText(false, 0, 720, 1280, 314, 226, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|3200*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|3200*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0243 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0244
     * @tc.name      Resolution_DecisionMatrix_0244
     * @tc.desc      resolution decision 8 with rotation 351/279 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0244 begin`);
      logInfo("decision(8,853.3,706.1,0.5,351,279,0,3)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(853.3, 706.1) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(351, 279) + '|' + xComponentSizeText(false, 0, 720, 1280, 351, 279, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0244 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0245
     * @tc.name      Resolution_DecisionMatrix_0245
     * @tc.desc      resolution decision 9 with rotation 388/332 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0245 begin`);
      logInfo("decision(9,856.4,708.8,0.75,388,332,1,3.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(856.4, 708.8) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(388, 332) + '|' + xComponentSizeText(false, 0, 720, 1280, 388, 332, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|4480*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|4480*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0245 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0246
     * @tc.name      Resolution_DecisionMatrix_0246
     * @tc.desc      resolution decision 10 with rotation 425/25 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0246 begin`);
      logInfo("decision(10,859.5,711.5,1,425,25,2,0.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(859.5, 711.5) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(425, 25) + '|' + xComponentSizeText(false, 0, 720, 1280, 425, 25, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*360|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*360|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0246 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0247
     * @tc.name      Resolution_DecisionMatrix_0247
     * @tc.desc      resolution decision 11 with rotation 462/78 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0247 begin`);
      logInfo("decision(11,862.6,714.2,1.25,462,78,0,1)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(862.6, 714.2) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(462, 78) + '|' + xComponentSizeText(false, 0, 720, 1280, 462, 78, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0247 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0248
     * @tc.name      Resolution_DecisionMatrix_0248
     * @tc.desc      resolution decision 12 with rotation 499/131 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0248 begin`);
      logInfo("decision(12,865.7,716.9,1.5,499,131,1,1.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(865.7, 716.9) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(499, 131) + '|' + xComponentSizeText(false, 0, 720, 1280, 499, 131, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*1080|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*1080|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0248 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0249
     * @tc.name      Resolution_DecisionMatrix_0249
     * @tc.desc      resolution decision 13 with rotation 536/184 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0249 begin`);
      logInfo("decision(13,868.8,719.6,1.75,536,184,2,2)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(868.8, 719.6) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(536, 184) + '|' + xComponentSizeText(false, 0, 720, 1280, 536, 184, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|2560*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|2560*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0249 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0250
     * @tc.name      Resolution_DecisionMatrix_0250
     * @tc.desc      resolution decision 14 with rotation 573/237 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0250 begin`);
      logInfo("decision(14,871.9,722.3,2,573,237,0,2.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(871.9, 722.3) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(573, 237) + '|' + xComponentSizeText(false, 0, 720, 1280, 573, 237, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0250 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0251
     * @tc.name      Resolution_DecisionMatrix_0251
     * @tc.desc      resolution decision 15 with rotation 610/290 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0251 begin`);
      logInfo("decision(15,875,725,2.25,610,290,1,3)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(875, 725) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(610, 290) + '|' + xComponentSizeText(false, 0, 720, 1280, 610, 290, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|3840*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|3840*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0251 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0252
     * @tc.name      Resolution_DecisionMatrix_0252
     * @tc.desc      resolution decision 16 with rotation 647/343 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0252 begin`);
      logInfo("decision(16,878.1,727.7,2.5,647,343,2,3.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(878.1, 727.7) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(647, 343) + '|' + xComponentSizeText(false, 0, 720, 1280, 647, 343, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*2520|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*2520|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0252 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0253
     * @tc.name      Resolution_DecisionMatrix_0253
     * @tc.desc      resolution decision -1 with rotation 684/36 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0253 begin`);
      logInfo("decision(-1,881.2,730.4,0.5,684,36,0,0.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(881.2, 730.4) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(684, 36) + '|' + xComponentSizeText(false, 0, 720, 1280, 684, 36, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0253 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0254
     * @tc.name      Resolution_DecisionMatrix_0254
     * @tc.desc      resolution decision 0 with rotation 1/89 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0254 begin`);
      logInfo("decision(0,884.3,733.1,0.75,1,89,1,1)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(884.3, 733.1) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(1, 89) + '|' + xComponentSizeText(false, 0, 720, 1280, 1, 89, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*720|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*720|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0254 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0255
     * @tc.name      Resolution_DecisionMatrix_0255
     * @tc.desc      resolution decision 1 with rotation 38/142 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0255 begin`);
      logInfo("decision(1,887.4,735.8,1,38,142,2,1.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(887.4, 735.8) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(38, 142) + '|' + xComponentSizeText(false, 0, 720, 1280, 38, 142, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|1920*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|1920*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0255 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0256
     * @tc.name      Resolution_DecisionMatrix_0256
     * @tc.desc      resolution decision 2 with rotation 75/195 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0256 begin`);
      logInfo("decision(2,890.5,738.5,1.25,75,195,0,2)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(890.5, 738.5) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(75, 195) + '|' + xComponentSizeText(false, 0, 720, 1280, 75, 195, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0256 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0257
     * @tc.name      Resolution_DecisionMatrix_0257
     * @tc.desc      resolution decision 3 with rotation 112/248 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0257 begin`);
      logInfo("decision(3,893.6,741.2,1.5,112,248,1,2.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(893.6, 741.2) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(112, 248) + '|' + xComponentSizeText(false, 0, 720, 1280, 112, 248, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|3200*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|3200*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0257 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0258
     * @tc.name      Resolution_DecisionMatrix_0258
     * @tc.desc      resolution decision 4 with rotation 149/301 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0258 begin`);
      logInfo("decision(4,896.7,743.9,1.75,149,301,2,3)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(896.7, 743.9) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(149, 301) + '|' + xComponentSizeText(false, 0, 720, 1280, 149, 301, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*2160|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*2160|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0258 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0259
     * @tc.name      Resolution_DecisionMatrix_0259
     * @tc.desc      resolution decision 5 with rotation 186/354 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0259 begin`);
      logInfo("decision(5,899.8,746.6,2,186,354,0,3.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(899.8, 746.6) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(186, 354) + '|' + xComponentSizeText(false, 0, 720, 1280, 186, 354, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0259 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0260
     * @tc.name      Resolution_DecisionMatrix_0260
     * @tc.desc      resolution decision 6 with rotation 223/47 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0260 begin`);
      logInfo("decision(6,902.9,749.3,2.25,223,47,1,0.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(902.9, 749.3) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(223, 47) + '|' + xComponentSizeText(false, 0, 720, 1280, 223, 47, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*360|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*360|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0260 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0261
     * @tc.name      Resolution_DecisionMatrix_0261
     * @tc.desc      resolution decision 7 with rotation 260/100 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0261 begin`);
      logInfo("decision(7,906,752,2.5,260,100,2,1)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(906, 752) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(260, 100) + '|' + xComponentSizeText(false, 0, 720, 1280, 260, 100, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|1280*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|1280*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0261 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0262
     * @tc.name      Resolution_DecisionMatrix_0262
     * @tc.desc      resolution decision 8 with rotation 297/153 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0262 begin`);
      logInfo("decision(8,909.1,754.7,0.5,297,153,0,1.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(909.1, 754.7) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(297, 153) + '|' + xComponentSizeText(false, 0, 720, 1280, 297, 153, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0262 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0263
     * @tc.name      Resolution_DecisionMatrix_0263
     * @tc.desc      resolution decision 9 with rotation 334/206 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0263 begin`);
      logInfo("decision(9,912.2,757.4,0.75,334,206,1,2)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(912.2, 757.4) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(334, 206) + '|' + xComponentSizeText(false, 0, 720, 1280, 334, 206, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|2560*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|2560*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0263 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0264
     * @tc.name      Resolution_DecisionMatrix_0264
     * @tc.desc      resolution decision 10 with rotation 371/259 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0264 begin`);
      logInfo("decision(10,915.3,760.1,1,371,259,2,2.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(915.3, 760.1) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(371, 259) + '|' + xComponentSizeText(false, 0, 720, 1280, 371, 259, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*1800|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*1800|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0264 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0265
     * @tc.name      Resolution_DecisionMatrix_0265
     * @tc.desc      resolution decision 11 with rotation 408/312 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0265 begin`);
      logInfo("decision(11,918.4,762.8,1.25,408,312,0,3)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(918.4, 762.8) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(408, 312) + '|' + xComponentSizeText(false, 0, 720, 1280, 408, 312, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0265 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0266
     * @tc.name      Resolution_DecisionMatrix_0266
     * @tc.desc      resolution decision 12 with rotation 445/5 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0266 begin`);
      logInfo("decision(12,921.5,765.5,1.5,445,5,1,3.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(921.5, 765.5) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(445, 5) + '|' + xComponentSizeText(false, 0, 720, 1280, 445, 5, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*2520|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*2520|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0266 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0267
     * @tc.name      Resolution_DecisionMatrix_0267
     * @tc.desc      resolution decision 13 with rotation 482/58 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0267 begin`);
      logInfo("decision(13,924.6,768.2,1.75,482,58,2,0.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(924.6, 768.2) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(482, 58) + '|' + xComponentSizeText(false, 0, 720, 1280, 482, 58, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|640*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|640*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0267 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0268
     * @tc.name      Resolution_DecisionMatrix_0268
     * @tc.desc      resolution decision 14 with rotation 519/111 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0268 begin`);
      logInfo("decision(14,927.7,770.9,2,519,111,0,1)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(927.7, 770.9) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(519, 111) + '|' + xComponentSizeText(false, 0, 720, 1280, 519, 111, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0268 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0269
     * @tc.name      Resolution_DecisionMatrix_0269
     * @tc.desc      resolution decision 15 with rotation 556/164 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0269 begin`);
      logInfo("decision(15,930.8,773.6,2.25,556,164,1,1.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(930.8, 773.6) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(556, 164) + '|' + xComponentSizeText(false, 0, 720, 1280, 556, 164, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|1920*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|1920*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0269 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0270
     * @tc.name      Resolution_DecisionMatrix_0270
     * @tc.desc      resolution decision 16 with rotation 593/217 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0270 begin`);
      logInfo("decision(16,933.9,776.3,2.5,593,217,2,2)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(933.9, 776.3) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(593, 217) + '|' + xComponentSizeText(false, 0, 720, 1280, 593, 217, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*1440|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*1440|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0270 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0271
     * @tc.name      Resolution_DecisionMatrix_0271
     * @tc.desc      resolution decision -1 with rotation 630/270 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0271 begin`);
      logInfo("decision(-1,937,779,0.5,630,270,0,2.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(937, 779) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(630, 270) + '|' + xComponentSizeText(false, 0, 720, 1280, 630, 270, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0271 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0272
     * @tc.name      Resolution_DecisionMatrix_0272
     * @tc.desc      resolution decision 0 with rotation 667/323 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0272 begin`);
      logInfo("decision(0,940.1,781.7,0.75,667,323,1,3)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(940.1, 781.7) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(667, 323) + '|' + xComponentSizeText(false, 0, 720, 1280, 667, 323, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*2160|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*2160|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0272 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0273
     * @tc.name      Resolution_DecisionMatrix_0273
     * @tc.desc      resolution decision 1 with rotation 704/16 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0273 begin`);
      logInfo("decision(1,943.2,784.4,1,704,16,2,3.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(943.2, 784.4) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(704, 16) + '|' + xComponentSizeText(false, 0, 720, 1280, 704, 16, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|4480*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|4480*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0273 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0274
     * @tc.name      Resolution_DecisionMatrix_0274
     * @tc.desc      resolution decision 2 with rotation 21/69 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0274 begin`);
      logInfo("decision(2,946.3,787.1,1.25,21,69,0,0.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(946.3, 787.1) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(21, 69) + '|' + xComponentSizeText(false, 0, 720, 1280, 21, 69, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0274 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0275
     * @tc.name      Resolution_DecisionMatrix_0275
     * @tc.desc      resolution decision 3 with rotation 58/122 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0275 begin`);
      logInfo("decision(3,949.4,789.8,1.5,58,122,1,1)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(949.4, 789.8) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(58, 122) + '|' + xComponentSizeText(false, 0, 720, 1280, 58, 122, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|1280*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|1280*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0275 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0276
     * @tc.name      Resolution_DecisionMatrix_0276
     * @tc.desc      resolution decision 4 with rotation 95/175 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0276 begin`);
      logInfo("decision(4,952.5,792.5,1.75,95,175,2,1.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(952.5, 792.5) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(95, 175) + '|' + xComponentSizeText(false, 0, 720, 1280, 95, 175, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*1080|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*1080|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0276 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0277
     * @tc.name      Resolution_DecisionMatrix_0277
     * @tc.desc      resolution decision 5 with rotation 132/228 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0277 begin`);
      logInfo("decision(5,955.6,795.2,2,132,228,0,2)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(955.6, 795.2) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(132, 228) + '|' + xComponentSizeText(false, 0, 720, 1280, 132, 228, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0277 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0278
     * @tc.name      Resolution_DecisionMatrix_0278
     * @tc.desc      resolution decision 6 with rotation 169/281 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0278 begin`);
      logInfo("decision(6,958.7,797.9,2.25,169,281,1,2.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(958.7, 797.9) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(169, 281) + '|' + xComponentSizeText(false, 0, 720, 1280, 169, 281, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*1800|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*1800|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0278 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0279
     * @tc.name      Resolution_DecisionMatrix_0279
     * @tc.desc      resolution decision 7 with rotation 206/334 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0279 begin`);
      logInfo("decision(7,961.8,800.6,2.5,206,334,2,3)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(961.8, 800.6) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(206, 334) + '|' + xComponentSizeText(false, 0, 720, 1280, 206, 334, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|3840*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|3840*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0279 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0280
     * @tc.name      Resolution_DecisionMatrix_0280
     * @tc.desc      resolution decision 8 with rotation 243/27 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0280 begin`);
      logInfo("decision(8,964.9,803.3,0.5,243,27,0,3.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(964.9, 803.3) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(243, 27) + '|' + xComponentSizeText(false, 0, 720, 1280, 243, 27, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0280 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0281
     * @tc.name      Resolution_DecisionMatrix_0281
     * @tc.desc      resolution decision 9 with rotation 280/80 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0281 begin`);
      logInfo("decision(9,968,806,0.75,280,80,1,0.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(968, 806) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(280, 80) + '|' + xComponentSizeText(false, 0, 720, 1280, 280, 80, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|640*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|640*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0281 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0282
     * @tc.name      Resolution_DecisionMatrix_0282
     * @tc.desc      resolution decision 10 with rotation 317/133 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0282 begin`);
      logInfo("decision(10,971.1,808.7,1,317,133,2,1)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(971.1, 808.7) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(317, 133) + '|' + xComponentSizeText(false, 0, 720, 1280, 317, 133, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*720|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*720|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0282 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0283
     * @tc.name      Resolution_DecisionMatrix_0283
     * @tc.desc      resolution decision 11 with rotation 354/186 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0283 begin`);
      logInfo("decision(11,974.2,811.4,1.25,354,186,0,1.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(974.2, 811.4) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(354, 186) + '|' + xComponentSizeText(false, 0, 720, 1280, 354, 186, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0283 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0284
     * @tc.name      Resolution_DecisionMatrix_0284
     * @tc.desc      resolution decision 12 with rotation 391/239 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0284 begin`);
      logInfo("decision(12,977.3,814.1,1.5,391,239,1,2)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(977.3, 814.1) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(391, 239) + '|' + xComponentSizeText(false, 0, 720, 1280, 391, 239, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*1440|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*1440|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0284 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0285
     * @tc.name      Resolution_DecisionMatrix_0285
     * @tc.desc      resolution decision 13 with rotation 428/292 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0285 begin`);
      logInfo("decision(13,980.4,816.8,1.75,428,292,2,2.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(980.4, 816.8) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(428, 292) + '|' + xComponentSizeText(false, 0, 720, 1280, 428, 292, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|3200*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|3200*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0285 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0286
     * @tc.name      Resolution_DecisionMatrix_0286
     * @tc.desc      resolution decision 14 with rotation 465/345 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0286 begin`);
      logInfo("decision(14,983.5,819.5,2,465,345,0,3)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(983.5, 819.5) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(465, 345) + '|' + xComponentSizeText(false, 0, 720, 1280, 465, 345, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0286 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0287
     * @tc.name      Resolution_DecisionMatrix_0287
     * @tc.desc      resolution decision 15 with rotation 502/38 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0287 begin`);
      logInfo("decision(15,986.6,822.2,2.25,502,38,1,3.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(986.6, 822.2) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(502, 38) + '|' + xComponentSizeText(false, 0, 720, 1280, 502, 38, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|4480*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|4480*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0287 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0288
     * @tc.name      Resolution_DecisionMatrix_0288
     * @tc.desc      resolution decision 16 with rotation 539/91 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0288 begin`);
      logInfo("decision(16,989.7,824.9,2.5,539,91,2,0.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(989.7, 824.9) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(539, 91) + '|' + xComponentSizeText(false, 0, 720, 1280, 539, 91, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*360|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*360|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0288 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0289
     * @tc.name      Resolution_DecisionMatrix_0289
     * @tc.desc      resolution decision -1 with rotation 576/144 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0289 begin`);
      logInfo("decision(-1,992.8,827.6,0.5,576,144,0,1)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(992.8, 827.6) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(576, 144) + '|' + xComponentSizeText(false, 0, 720, 1280, 576, 144, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0289 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0290
     * @tc.name      Resolution_DecisionMatrix_0290
     * @tc.desc      resolution decision 0 with rotation 613/197 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0290 begin`);
      logInfo("decision(0,995.9,830.3,0.75,613,197,1,1.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(995.9, 830.3) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(613, 197) + '|' + xComponentSizeText(false, 0, 720, 1280, 613, 197, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*1080|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*1080|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0290 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0291
     * @tc.name      Resolution_DecisionMatrix_0291
     * @tc.desc      resolution decision 1 with rotation 650/250 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0291 begin`);
      logInfo("decision(1,999,833,1,650,250,2,2)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(999, 833) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(650, 250) + '|' + xComponentSizeText(false, 0, 720, 1280, 650, 250, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|2560*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|2560*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0291 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0292
     * @tc.name      Resolution_DecisionMatrix_0292
     * @tc.desc      resolution decision 2 with rotation 687/303 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0292 begin`);
      logInfo("decision(2,1002.1,835.7,1.25,687,303,0,2.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(1002.1, 835.7) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(687, 303) + '|' + xComponentSizeText(false, 0, 720, 1280, 687, 303, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0292 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0293
     * @tc.name      Resolution_DecisionMatrix_0293
     * @tc.desc      resolution decision 3 with rotation 4/356 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0293 begin`);
      logInfo("decision(3,1005.2,838.4,1.5,4,356,1,3)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(1005.2, 838.4) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(4, 356) + '|' + xComponentSizeText(false, 0, 720, 1280, 4, 356, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|3840*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|3840*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0293 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0294
     * @tc.name      Resolution_DecisionMatrix_0294
     * @tc.desc      resolution decision 4 with rotation 41/49 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0294 begin`);
      logInfo("decision(4,1008.3,841.1,1.75,41,49,2,3.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(1008.3, 841.1) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(41, 49) + '|' + xComponentSizeText(false, 0, 720, 1280, 41, 49, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*2520|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*2520|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0294 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0295
     * @tc.name      Resolution_DecisionMatrix_0295
     * @tc.desc      resolution decision 5 with rotation 78/102 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0295 begin`);
      logInfo("decision(5,1011.4,843.8,2,78,102,0,0.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(1011.4, 843.8) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(78, 102) + '|' + xComponentSizeText(false, 0, 720, 1280, 78, 102, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0295 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0296
     * @tc.name      Resolution_DecisionMatrix_0296
     * @tc.desc      resolution decision 6 with rotation 115/155 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0296 begin`);
      logInfo("decision(6,1014.5,846.5,2.25,115,155,1,1)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(1014.5, 846.5) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(115, 155) + '|' + xComponentSizeText(false, 0, 720, 1280, 115, 155, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*720|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*720|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0296 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0297
     * @tc.name      Resolution_DecisionMatrix_0297
     * @tc.desc      resolution decision 7 with rotation 152/208 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0297 begin`);
      logInfo("decision(7,1017.6,849.2,2.5,152,208,2,1.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(1017.6, 849.2) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(152, 208) + '|' + xComponentSizeText(false, 0, 720, 1280, 152, 208, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|1920*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|1920*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0297 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0298
     * @tc.name      Resolution_DecisionMatrix_0298
     * @tc.desc      resolution decision 8 with rotation 189/261 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0298 begin`);
      logInfo("decision(8,1020.7,851.9,0.5,189,261,0,2)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(1020.7, 851.9) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(189, 261) + '|' + xComponentSizeText(false, 0, 720, 1280, 189, 261, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0298 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0299
     * @tc.name      Resolution_DecisionMatrix_0299
     * @tc.desc      resolution decision 9 with rotation 226/314 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0299 begin`);
      logInfo("decision(9,1023.8,854.6,0.75,226,314,1,2.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(1023.8, 854.6) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(226, 314) + '|' + xComponentSizeText(false, 0, 720, 1280, 226, 314, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|3200*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|3200*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0299 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0300
     * @tc.name      Resolution_DecisionMatrix_0300
     * @tc.desc      resolution decision 10 with rotation 263/7 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0300 begin`);
      logInfo("decision(10,1026.9,857.3,1,263,7,2,3)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(1026.9, 857.3) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(263, 7) + '|' + xComponentSizeText(false, 0, 720, 1280, 263, 7, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*2160|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*2160|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0300 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0301
     * @tc.name      Resolution_DecisionMatrix_0301
     * @tc.desc      resolution decision 11 with rotation 300/60 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0301 begin`);
      logInfo("decision(11,1030,860,1.25,300,60,0,3.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(1030, 860) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(300, 60) + '|' + xComponentSizeText(false, 0, 720, 1280, 300, 60, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0301 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0302
     * @tc.name      Resolution_DecisionMatrix_0302
     * @tc.desc      resolution decision 12 with rotation 337/113 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0302 begin`);
      logInfo("decision(12,1033.1,862.7,1.5,337,113,1,0.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(1033.1, 862.7) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(337, 113) + '|' + xComponentSizeText(false, 0, 720, 1280, 337, 113, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*360|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*360|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0302 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0303
     * @tc.name      Resolution_DecisionMatrix_0303
     * @tc.desc      resolution decision 13 with rotation 374/166 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0303 begin`);
      logInfo("decision(13,1036.2,865.4,1.75,374,166,2,1)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(1036.2, 865.4) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(374, 166) + '|' + xComponentSizeText(false, 0, 720, 1280, 374, 166, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|1280*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|1280*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0303 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0304
     * @tc.name      Resolution_DecisionMatrix_0304
     * @tc.desc      resolution decision 14 with rotation 411/219 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0304 begin`);
      logInfo("decision(14,1039.3,868.1,2,411,219,0,1.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(1039.3, 868.1) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(411, 219) + '|' + xComponentSizeText(false, 0, 720, 1280, 411, 219, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0304 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0305
     * @tc.name      Resolution_DecisionMatrix_0305
     * @tc.desc      resolution decision 15 with rotation 448/272 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0305 begin`);
      logInfo("decision(15,1042.4,870.8,2.25,448,272,1,2)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(1042.4, 870.8) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(448, 272) + '|' + xComponentSizeText(false, 0, 720, 1280, 448, 272, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|2560*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|2560*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0305 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0306
     * @tc.name      Resolution_DecisionMatrix_0306
     * @tc.desc      resolution decision 16 with rotation 485/325 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0306 begin`);
      logInfo("decision(16,1045.5,873.5,2.5,485,325,2,2.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(1045.5, 873.5) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(485, 325) + '|' + xComponentSizeText(false, 0, 720, 1280, 485, 325, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*1800|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*1800|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0306 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0307
     * @tc.name      Resolution_DecisionMatrix_0307
     * @tc.desc      resolution decision -1 with rotation 522/18 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0307 begin`);
      logInfo("decision(-1,1048.6,876.2,0.5,522,18,0,3)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(1048.6, 876.2) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(522, 18) + '|' + xComponentSizeText(false, 0, 720, 1280, 522, 18, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0307 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0308
     * @tc.name      Resolution_DecisionMatrix_0308
     * @tc.desc      resolution decision 0 with rotation 559/71 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0308 begin`);
      logInfo("decision(0,1051.7,878.9,0.75,559,71,1,3.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(1051.7, 878.9) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(559, 71) + '|' + xComponentSizeText(false, 0, 720, 1280, 559, 71, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*2520|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*2520|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0308 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0309
     * @tc.name      Resolution_DecisionMatrix_0309
     * @tc.desc      resolution decision 1 with rotation 596/124 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0309 begin`);
      logInfo("decision(1,1054.8,881.6,1,596,124,2,0.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(1054.8, 881.6) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(596, 124) + '|' + xComponentSizeText(false, 0, 720, 1280, 596, 124, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|640*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|640*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0309 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0310
     * @tc.name      Resolution_DecisionMatrix_0310
     * @tc.desc      resolution decision 2 with rotation 633/177 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0310 begin`);
      logInfo("decision(2,1057.9,884.3,1.25,633,177,0,1)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(1057.9, 884.3) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(633, 177) + '|' + xComponentSizeText(false, 0, 720, 1280, 633, 177, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0310 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0311
     * @tc.name      Resolution_DecisionMatrix_0311
     * @tc.desc      resolution decision 3 with rotation 670/230 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0311 begin`);
      logInfo("decision(3,1061,887,1.5,670,230,1,1.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(1061, 887) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(670, 230) + '|' + xComponentSizeText(false, 0, 720, 1280, 670, 230, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|1920*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|1920*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0311 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0312
     * @tc.name      Resolution_DecisionMatrix_0312
     * @tc.desc      resolution decision 4 with rotation 707/283 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0312 begin`);
      logInfo("decision(4,1064.1,889.7,1.75,707,283,2,2)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(1064.1, 889.7) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(707, 283) + '|' + xComponentSizeText(false, 0, 720, 1280, 707, 283, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*1440|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*1440|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0312 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0313
     * @tc.name      Resolution_DecisionMatrix_0313
     * @tc.desc      resolution decision 5 with rotation 24/336 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0313 begin`);
      logInfo("decision(5,1067.2,892.4,2,24,336,0,2.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(1067.2, 892.4) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(24, 336) + '|' + xComponentSizeText(false, 0, 720, 1280, 24, 336, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0313 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0314
     * @tc.name      Resolution_DecisionMatrix_0314
     * @tc.desc      resolution decision 6 with rotation 61/29 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0314 begin`);
      logInfo("decision(6,1070.3,895.1,2.25,61,29,1,3)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(1070.3, 895.1) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(61, 29) + '|' + xComponentSizeText(false, 0, 720, 1280, 61, 29, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*2160|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*2160|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0314 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0315
     * @tc.name      Resolution_DecisionMatrix_0315
     * @tc.desc      resolution decision 7 with rotation 98/82 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0315 begin`);
      logInfo("decision(7,1073.4,897.8,2.5,98,82,2,3.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(1073.4, 897.8) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(98, 82) + '|' + xComponentSizeText(false, 0, 720, 1280, 98, 82, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|4480*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|4480*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0315 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0316
     * @tc.name      Resolution_DecisionMatrix_0316
     * @tc.desc      resolution decision 8 with rotation 135/135 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0316 begin`);
      logInfo("decision(8,1076.5,900.5,0.5,135,135,0,0.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(1076.5, 900.5) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(135, 135) + '|' + xComponentSizeText(false, 0, 720, 1280, 135, 135, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0316 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0317
     * @tc.name      Resolution_DecisionMatrix_0317
     * @tc.desc      resolution decision 9 with rotation 172/188 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0317 begin`);
      logInfo("decision(9,1079.6,903.2,0.75,172,188,1,1)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(1079.6, 903.2) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(172, 188) + '|' + xComponentSizeText(false, 0, 720, 1280, 172, 188, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|1280*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|1280*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0317 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0318
     * @tc.name      Resolution_DecisionMatrix_0318
     * @tc.desc      resolution decision 10 with rotation 209/241 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0318 begin`);
      logInfo("decision(10,1082.7,905.9,1,209,241,2,1.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(1082.7, 905.9) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(209, 241) + '|' + xComponentSizeText(false, 0, 720, 1280, 209, 241, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*1080|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*1080|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0318 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0319
     * @tc.name      Resolution_DecisionMatrix_0319
     * @tc.desc      resolution decision 11 with rotation 246/294 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0319 begin`);
      logInfo("decision(11,1085.8,908.6,1.25,246,294,0,2)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(1085.8, 908.6) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(246, 294) + '|' + xComponentSizeText(false, 0, 720, 1280, 246, 294, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0319 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0320
     * @tc.name      Resolution_DecisionMatrix_0320
     * @tc.desc      resolution decision 12 with rotation 283/347 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0320 begin`);
      logInfo("decision(12,1088.9,911.3,1.5,283,347,1,2.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(1088.9, 911.3) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(283, 347) + '|' + xComponentSizeText(false, 0, 720, 1280, 283, 347, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*1800|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*1800|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0320 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0321
     * @tc.name      Resolution_DecisionMatrix_0321
     * @tc.desc      resolution decision 13 with rotation 320/40 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0321 begin`);
      logInfo("decision(13,1092,914,1.75,320,40,2,3)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(1092, 914) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(320, 40) + '|' + xComponentSizeText(false, 0, 720, 1280, 320, 40, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|3840*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|3840*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0321 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0322
     * @tc.name      Resolution_DecisionMatrix_0322
     * @tc.desc      resolution decision 14 with rotation 357/93 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0322 begin`);
      logInfo("decision(14,1095.1,916.7,2,357,93,0,3.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(1095.1, 916.7) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(357, 93) + '|' + xComponentSizeText(false, 0, 720, 1280, 357, 93, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0322 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0323
     * @tc.name      Resolution_DecisionMatrix_0323
     * @tc.desc      resolution decision 15 with rotation 394/146 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0323 begin`);
      logInfo("decision(15,1098.2,919.4,2.25,394,146,1,0.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(1098.2, 919.4) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(394, 146) + '|' + xComponentSizeText(false, 0, 720, 1280, 394, 146, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|640*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|640*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0323 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0324
     * @tc.name      Resolution_DecisionMatrix_0324
     * @tc.desc      resolution decision 16 with rotation 431/199 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0324 begin`);
      logInfo("decision(16,1101.3,922.1,2.5,431,199,2,1)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(1101.3, 922.1) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(431, 199) + '|' + xComponentSizeText(false, 0, 720, 1280, 431, 199, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*720|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*720|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0324 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0325
     * @tc.name      Resolution_DecisionMatrix_0325
     * @tc.desc      resolution decision -1 with rotation 468/252 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0325 begin`);
      logInfo("decision(-1,1104.4,924.8,0.5,468,252,0,1.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(1104.4, 924.8) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(468, 252) + '|' + xComponentSizeText(false, 0, 720, 1280, 468, 252, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0325 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0326
     * @tc.name      Resolution_DecisionMatrix_0326
     * @tc.desc      resolution decision 0 with rotation 505/305 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0326 begin`);
      logInfo("decision(0,1107.5,927.5,0.75,505,305,1,2)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(1107.5, 927.5) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(505, 305) + '|' + xComponentSizeText(false, 0, 720, 1280, 505, 305, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*1440|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*1440|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0326 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0327
     * @tc.name      Resolution_DecisionMatrix_0327
     * @tc.desc      resolution decision 1 with rotation 542/358 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0327 begin`);
      logInfo("decision(1,1110.6,930.2,1,542,358,2,2.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(1110.6, 930.2) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(542, 358) + '|' + xComponentSizeText(false, 0, 720, 1280, 542, 358, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|3200*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|3200*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0327 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0328
     * @tc.name      Resolution_DecisionMatrix_0328
     * @tc.desc      resolution decision 2 with rotation 579/51 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0328 begin`);
      logInfo("decision(2,1113.7,932.9,1.25,579,51,0,3)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(1113.7, 932.9) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(579, 51) + '|' + xComponentSizeText(false, 0, 720, 1280, 579, 51, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0328 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0329
     * @tc.name      Resolution_DecisionMatrix_0329
     * @tc.desc      resolution decision 3 with rotation 616/104 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0329 begin`);
      logInfo("decision(3,1116.8,935.6,1.5,616,104,1,3.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(1116.8, 935.6) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(616, 104) + '|' + xComponentSizeText(false, 0, 720, 1280, 616, 104, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|4480*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|4480*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0329 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0330
     * @tc.name      Resolution_DecisionMatrix_0330
     * @tc.desc      resolution decision 4 with rotation 653/157 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0330 begin`);
      logInfo("decision(4,1119.9,938.3,1.75,653,157,2,0.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(1119.9, 938.3) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(653, 157) + '|' + xComponentSizeText(false, 0, 720, 1280, 653, 157, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*360|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*360|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0330 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0331
     * @tc.name      Resolution_DecisionMatrix_0331
     * @tc.desc      resolution decision 5 with rotation 690/210 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0331 begin`);
      logInfo("decision(5,1123,941,2,690,210,0,1)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(1123, 941) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(690, 210) + '|' + xComponentSizeText(false, 0, 720, 1280, 690, 210, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0331 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0332
     * @tc.name      Resolution_DecisionMatrix_0332
     * @tc.desc      resolution decision 6 with rotation 7/263 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0332 begin`);
      logInfo("decision(6,1126.1,943.7,2.25,7,263,1,1.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(1126.1, 943.7) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(7, 263) + '|' + xComponentSizeText(false, 0, 720, 1280, 7, 263, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*1080|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*1080|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0332 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0333
     * @tc.name      Resolution_DecisionMatrix_0333
     * @tc.desc      resolution decision 7 with rotation 44/316 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0333 begin`);
      logInfo("decision(7,1129.2,946.4,2.5,44,316,2,2)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(1129.2, 946.4) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(44, 316) + '|' + xComponentSizeText(false, 0, 720, 1280, 44, 316, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|2560*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|2560*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0333 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0334
     * @tc.name      Resolution_DecisionMatrix_0334
     * @tc.desc      resolution decision 8 with rotation 81/9 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0334 begin`);
      logInfo("decision(8,1132.3,949.1,0.5,81,9,0,2.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(1132.3, 949.1) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(81, 9) + '|' + xComponentSizeText(false, 0, 720, 1280, 81, 9, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0334 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0335
     * @tc.name      Resolution_DecisionMatrix_0335
     * @tc.desc      resolution decision 9 with rotation 118/62 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0335 begin`);
      logInfo("decision(9,1135.4,951.8,0.75,118,62,1,3)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(1135.4, 951.8) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(118, 62) + '|' + xComponentSizeText(false, 0, 720, 1280, 118, 62, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|3840*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|3840*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0335 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0336
     * @tc.name      Resolution_DecisionMatrix_0336
     * @tc.desc      resolution decision 10 with rotation 155/115 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0336 begin`);
      logInfo("decision(10,1138.5,954.5,1,155,115,2,3.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(1138.5, 954.5) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(155, 115) + '|' + xComponentSizeText(false, 0, 720, 1280, 155, 115, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*2520|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*2520|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0336 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0337
     * @tc.name      Resolution_DecisionMatrix_0337
     * @tc.desc      resolution decision 11 with rotation 192/168 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0337 begin`);
      logInfo("decision(11,1141.6,957.2,1.25,192,168,0,0.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(1141.6, 957.2) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(192, 168) + '|' + xComponentSizeText(false, 0, 720, 1280, 192, 168, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0337 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0338
     * @tc.name      Resolution_DecisionMatrix_0338
     * @tc.desc      resolution decision 12 with rotation 229/221 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0338 begin`);
      logInfo("decision(12,1144.7,959.9,1.5,229,221,1,1)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(1144.7, 959.9) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(229, 221) + '|' + xComponentSizeText(false, 0, 720, 1280, 229, 221, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*720|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*720|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0338 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0339
     * @tc.name      Resolution_DecisionMatrix_0339
     * @tc.desc      resolution decision 13 with rotation 266/274 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0339 begin`);
      logInfo("decision(13,1147.8,962.6,1.75,266,274,2,1.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(1147.8, 962.6) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(266, 274) + '|' + xComponentSizeText(false, 0, 720, 1280, 266, 274, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|1920*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|1920*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0339 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0340
     * @tc.name      Resolution_DecisionMatrix_0340
     * @tc.desc      resolution decision 14 with rotation 303/327 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0340 begin`);
      logInfo("decision(14,1150.9,965.3,2,303,327,0,2)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(1150.9, 965.3) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(303, 327) + '|' + xComponentSizeText(false, 0, 720, 1280, 303, 327, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0340 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0341
     * @tc.name      Resolution_DecisionMatrix_0341
     * @tc.desc      resolution decision 15 with rotation 340/20 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0341 begin`);
      logInfo("decision(15,1154,968,2.25,340,20,1,2.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(1154, 968) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(340, 20) + '|' + xComponentSizeText(false, 0, 720, 1280, 340, 20, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|3200*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|3200*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0341 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0342
     * @tc.name      Resolution_DecisionMatrix_0342
     * @tc.desc      resolution decision 16 with rotation 377/73 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0342 begin`);
      logInfo("decision(16,1157.1,970.7,2.5,377,73,2,3)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(1157.1, 970.7) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(377, 73) + '|' + xComponentSizeText(false, 0, 720, 1280, 377, 73, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*2160|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*2160|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0342 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0343
     * @tc.name      Resolution_DecisionMatrix_0343
     * @tc.desc      resolution decision -1 with rotation 414/126 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0343 begin`);
      logInfo("decision(-1,1160.2,973.4,0.5,414,126,0,3.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(1160.2, 973.4) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(414, 126) + '|' + xComponentSizeText(false, 0, 720, 1280, 414, 126, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0343 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0344
     * @tc.name      Resolution_DecisionMatrix_0344
     * @tc.desc      resolution decision 0 with rotation 451/179 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0344 begin`);
      logInfo("decision(0,1163.3,976.1,0.75,451,179,1,0.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(1163.3, 976.1) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(451, 179) + '|' + xComponentSizeText(false, 0, 720, 1280, 451, 179, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*360|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*360|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0344 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0345
     * @tc.name      Resolution_DecisionMatrix_0345
     * @tc.desc      resolution decision 1 with rotation 488/232 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0345 begin`);
      logInfo("decision(1,1166.4,978.8,1,488,232,2,1)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(1166.4, 978.8) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(488, 232) + '|' + xComponentSizeText(false, 0, 720, 1280, 488, 232, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|1280*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|1280*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0345 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0346
     * @tc.name      Resolution_DecisionMatrix_0346
     * @tc.desc      resolution decision 2 with rotation 525/285 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0346 begin`);
      logInfo("decision(2,1169.5,981.5,1.25,525,285,0,1.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(1169.5, 981.5) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(525, 285) + '|' + xComponentSizeText(false, 0, 720, 1280, 525, 285, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0346 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0347
     * @tc.name      Resolution_DecisionMatrix_0347
     * @tc.desc      resolution decision 3 with rotation 562/338 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0347 begin`);
      logInfo("decision(3,1172.6,984.2,1.5,562,338,1,2)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(1172.6, 984.2) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(562, 338) + '|' + xComponentSizeText(false, 0, 720, 1280, 562, 338, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|2560*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|2560*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0347 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0348
     * @tc.name      Resolution_DecisionMatrix_0348
     * @tc.desc      resolution decision 4 with rotation 599/31 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0348 begin`);
      logInfo("decision(4,1175.7,986.9,1.75,599,31,2,2.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(1175.7, 986.9) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(599, 31) + '|' + xComponentSizeText(false, 0, 720, 1280, 599, 31, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*1800|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*1800|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0348 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0349
     * @tc.name      Resolution_DecisionMatrix_0349
     * @tc.desc      resolution decision 5 with rotation 636/84 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0349 begin`);
      logInfo("decision(5,1178.8,989.6,2,636,84,0,3)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(1178.8, 989.6) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(636, 84) + '|' + xComponentSizeText(false, 0, 720, 1280, 636, 84, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0349 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0350
     * @tc.name      Resolution_DecisionMatrix_0350
     * @tc.desc      resolution decision 6 with rotation 673/137 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0350 begin`);
      logInfo("decision(6,1181.9,992.3,2.25,673,137,1,3.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(1181.9, 992.3) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(673, 137) + '|' + xComponentSizeText(false, 0, 720, 1280, 673, 137, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*2520|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*2520|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0350 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0351
     * @tc.name      Resolution_DecisionMatrix_0351
     * @tc.desc      resolution decision 7 with rotation 710/190 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0351 begin`);
      logInfo("decision(7,1185,995,2.5,710,190,2,0.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(1185, 995) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(710, 190) + '|' + xComponentSizeText(false, 0, 720, 1280, 710, 190, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|640*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|640*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0351 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0352
     * @tc.name      Resolution_DecisionMatrix_0352
     * @tc.desc      resolution decision 8 with rotation 27/243 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0352 begin`);
      logInfo("decision(8,1188.1,997.7,0.5,27,243,0,1)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(1188.1, 997.7) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(27, 243) + '|' + xComponentSizeText(false, 0, 720, 1280, 27, 243, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0352 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0353
     * @tc.name      Resolution_DecisionMatrix_0353
     * @tc.desc      resolution decision 9 with rotation 64/296 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0353 begin`);
      logInfo("decision(9,1191.2,1000.4,0.75,64,296,1,1.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(1191.2, 1000.4) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(64, 296) + '|' + xComponentSizeText(false, 0, 720, 1280, 64, 296, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|1920*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|1920*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0353 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0354
     * @tc.name      Resolution_DecisionMatrix_0354
     * @tc.desc      resolution decision 10 with rotation 101/349 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0354 begin`);
      logInfo("decision(10,1194.3,1003.1,1,101,349,2,2)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(1194.3, 1003.1) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(101, 349) + '|' + xComponentSizeText(false, 0, 720, 1280, 101, 349, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*1440|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*1440|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0354 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0355
     * @tc.name      Resolution_DecisionMatrix_0355
     * @tc.desc      resolution decision 11 with rotation 138/42 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0355 begin`);
      logInfo("decision(11,1197.4,1005.8,1.25,138,42,0,2.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(1197.4, 1005.8) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(138, 42) + '|' + xComponentSizeText(false, 0, 720, 1280, 138, 42, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0355 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0356
     * @tc.name      Resolution_DecisionMatrix_0356
     * @tc.desc      resolution decision 12 with rotation 175/95 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0356 begin`);
      logInfo("decision(12,1200.5,1008.5,1.5,175,95,1,3)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(1200.5, 1008.5) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(175, 95) + '|' + xComponentSizeText(false, 0, 720, 1280, 175, 95, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*2160|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*2160|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0356 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0357
     * @tc.name      Resolution_DecisionMatrix_0357
     * @tc.desc      resolution decision 13 with rotation 212/148 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0357 begin`);
      logInfo("decision(13,1203.6,1011.2,1.75,212,148,2,3.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(1203.6, 1011.2) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(212, 148) + '|' + xComponentSizeText(false, 0, 720, 1280, 212, 148, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|4480*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|4480*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0357 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0358
     * @tc.name      Resolution_DecisionMatrix_0358
     * @tc.desc      resolution decision 14 with rotation 249/201 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0358 begin`);
      logInfo("decision(14,1206.7,1013.9,2,249,201,0,0.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(1206.7, 1013.9) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(249, 201) + '|' + xComponentSizeText(false, 0, 720, 1280, 249, 201, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0358 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0359
     * @tc.name      Resolution_DecisionMatrix_0359
     * @tc.desc      resolution decision 15 with rotation 286/254 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0359 begin`);
      logInfo("decision(15,1209.8,1016.6,2.25,286,254,1,1)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(1209.8, 1016.6) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(286, 254) + '|' + xComponentSizeText(false, 0, 720, 1280, 286, 254, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|1280*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|1280*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0359 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0360
     * @tc.name      Resolution_DecisionMatrix_0360
     * @tc.desc      resolution decision 16 with rotation 323/307 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0360 begin`);
      logInfo("decision(16,1212.9,1019.3,2.5,323,307,2,1.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(1212.9, 1019.3) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(323, 307) + '|' + xComponentSizeText(false, 0, 720, 1280, 323, 307, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*1080|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*1080|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0360 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0361
     * @tc.name      Resolution_DecisionMatrix_0361
     * @tc.desc      resolution decision -1 with rotation 360/0 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0361 begin`);
      logInfo("decision(-1,1216,1022,0.5,360,0,0,2)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(1216, 1022) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(360, 0) + '|' + xComponentSizeText(false, 0, 720, 1280, 360, 0, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0361 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0362
     * @tc.name      Resolution_DecisionMatrix_0362
     * @tc.desc      resolution decision 0 with rotation 397/53 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0362 begin`);
      logInfo("decision(0,1219.1,1024.7,0.75,397,53,1,2.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(1219.1, 1024.7) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(397, 53) + '|' + xComponentSizeText(false, 0, 720, 1280, 397, 53, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*1800|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*1800|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0362 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0363
     * @tc.name      Resolution_DecisionMatrix_0363
     * @tc.desc      resolution decision 1 with rotation 434/106 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0363 begin`);
      logInfo("decision(1,1222.2,1027.4,1,434,106,2,3)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(1222.2, 1027.4) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(434, 106) + '|' + xComponentSizeText(false, 0, 720, 1280, 434, 106, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|3840*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|3840*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0363 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0364
     * @tc.name      Resolution_DecisionMatrix_0364
     * @tc.desc      resolution decision 2 with rotation 471/159 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0364 begin`);
      logInfo("decision(2,1225.3,1030.1,1.25,471,159,0,3.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(1225.3, 1030.1) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(471, 159) + '|' + xComponentSizeText(false, 0, 720, 1280, 471, 159, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0364 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0365
     * @tc.name      Resolution_DecisionMatrix_0365
     * @tc.desc      resolution decision 3 with rotation 508/212 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0365 begin`);
      logInfo("decision(3,1228.4,1032.8,1.5,508,212,1,0.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(1228.4, 1032.8) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(508, 212) + '|' + xComponentSizeText(false, 0, 720, 1280, 508, 212, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|640*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|640*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0365 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0366
     * @tc.name      Resolution_DecisionMatrix_0366
     * @tc.desc      resolution decision 4 with rotation 545/265 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0366 begin`);
      logInfo("decision(4,1231.5,1035.5,1.75,545,265,2,1)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(1231.5, 1035.5) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(545, 265) + '|' + xComponentSizeText(false, 0, 720, 1280, 545, 265, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*720|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*720|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0366 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0367
     * @tc.name      Resolution_DecisionMatrix_0367
     * @tc.desc      resolution decision 5 with rotation 582/318 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0367 begin`);
      logInfo("decision(5,1234.6,1038.2,2,582,318,0,1.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(1234.6, 1038.2) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(582, 318) + '|' + xComponentSizeText(false, 0, 720, 1280, 582, 318, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0367 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0368
     * @tc.name      Resolution_DecisionMatrix_0368
     * @tc.desc      resolution decision 6 with rotation 619/11 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0368 begin`);
      logInfo("decision(6,1237.7,1040.9,2.25,619,11,1,2)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(1237.7, 1040.9) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(619, 11) + '|' + xComponentSizeText(false, 0, 720, 1280, 619, 11, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*1440|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*1440|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0368 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0369
     * @tc.name      Resolution_DecisionMatrix_0369
     * @tc.desc      resolution decision 7 with rotation 656/64 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0369 begin`);
      logInfo("decision(7,1240.8,1043.6,2.5,656,64,2,2.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(1240.8, 1043.6) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(656, 64) + '|' + xComponentSizeText(false, 0, 720, 1280, 656, 64, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|3200*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|3200*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0369 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0370
     * @tc.name      Resolution_DecisionMatrix_0370
     * @tc.desc      resolution decision 8 with rotation 693/117 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0370 begin`);
      logInfo("decision(8,1243.9,1046.3,0.5,693,117,0,3)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(1243.9, 1046.3) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(693, 117) + '|' + xComponentSizeText(false, 0, 720, 1280, 693, 117, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0370 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0371
     * @tc.name      Resolution_DecisionMatrix_0371
     * @tc.desc      resolution decision 9 with rotation 10/170 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0371 begin`);
      logInfo("decision(9,1247,1049,0.75,10,170,1,3.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(1247, 1049) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(10, 170) + '|' + xComponentSizeText(false, 0, 720, 1280, 10, 170, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|4480*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|4480*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0371 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0372
     * @tc.name      Resolution_DecisionMatrix_0372
     * @tc.desc      resolution decision 10 with rotation 47/223 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0372 begin`);
      logInfo("decision(10,1250.1,1051.7,1,47,223,2,0.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(1250.1, 1051.7) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(47, 223) + '|' + xComponentSizeText(false, 0, 720, 1280, 47, 223, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*360|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*360|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0372 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0373
     * @tc.name      Resolution_DecisionMatrix_0373
     * @tc.desc      resolution decision 11 with rotation 84/276 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0373 begin`);
      logInfo("decision(11,1253.2,1054.4,1.25,84,276,0,1)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(1253.2, 1054.4) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(84, 276) + '|' + xComponentSizeText(false, 0, 720, 1280, 84, 276, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0373 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0374
     * @tc.name      Resolution_DecisionMatrix_0374
     * @tc.desc      resolution decision 12 with rotation 121/329 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0374 begin`);
      logInfo("decision(12,1256.3,1057.1,1.5,121,329,1,1.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(1256.3, 1057.1) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(121, 329) + '|' + xComponentSizeText(false, 0, 720, 1280, 121, 329, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*1080|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*1080|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0374 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0375
     * @tc.name      Resolution_DecisionMatrix_0375
     * @tc.desc      resolution decision 13 with rotation 158/22 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0375 begin`);
      logInfo("decision(13,1259.4,1059.8,1.75,158,22,2,2)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(1259.4, 1059.8) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(158, 22) + '|' + xComponentSizeText(false, 0, 720, 1280, 158, 22, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|2560*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|2560*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0375 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0376
     * @tc.name      Resolution_DecisionMatrix_0376
     * @tc.desc      resolution decision 14 with rotation 195/75 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0376 begin`);
      logInfo("decision(14,1262.5,1062.5,2,195,75,0,2.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(1262.5, 1062.5) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(195, 75) + '|' + xComponentSizeText(false, 0, 720, 1280, 195, 75, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0376 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0377
     * @tc.name      Resolution_DecisionMatrix_0377
     * @tc.desc      resolution decision 15 with rotation 232/128 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0377 begin`);
      logInfo("decision(15,1265.6,1065.2,2.25,232,128,1,3)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(1265.6, 1065.2) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(232, 128) + '|' + xComponentSizeText(false, 0, 720, 1280, 232, 128, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|3840*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|3840*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0377 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0378
     * @tc.name      Resolution_DecisionMatrix_0378
     * @tc.desc      resolution decision 16 with rotation 269/181 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0378 begin`);
      logInfo("decision(16,1268.7,1067.9,2.5,269,181,2,3.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(1268.7, 1067.9) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(269, 181) + '|' + xComponentSizeText(false, 0, 720, 1280, 269, 181, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*2520|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*2520|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0378 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0379
     * @tc.name      Resolution_DecisionMatrix_0379
     * @tc.desc      resolution decision -1 with rotation 306/234 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0379 begin`);
      logInfo("decision(-1,1271.8,1070.6,0.5,306,234,0,0.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(1271.8, 1070.6) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(306, 234) + '|' + xComponentSizeText(false, 0, 720, 1280, 306, 234, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0379 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0380
     * @tc.name      Resolution_DecisionMatrix_0380
     * @tc.desc      resolution decision 0 with rotation 343/287 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0380 begin`);
      logInfo("decision(0,1274.9,1073.3,0.75,343,287,1,1)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(1274.9, 1073.3) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(343, 287) + '|' + xComponentSizeText(false, 0, 720, 1280, 343, 287, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*720|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*720|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0380 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0381
     * @tc.name      Resolution_DecisionMatrix_0381
     * @tc.desc      resolution decision 1 with rotation 380/340 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0381 begin`);
      logInfo("decision(1,1278,1076,1,380,340,2,1.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(1278, 1076) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(380, 340) + '|' + xComponentSizeText(false, 0, 720, 1280, 380, 340, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|1920*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|1920*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0381 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0382
     * @tc.name      Resolution_DecisionMatrix_0382
     * @tc.desc      resolution decision 2 with rotation 417/33 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0382 begin`);
      logInfo("decision(2,1281.1,1078.7,1.25,417,33,0,2)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(1281.1, 1078.7) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(417, 33) + '|' + xComponentSizeText(false, 0, 720, 1280, 417, 33, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0382 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0383
     * @tc.name      Resolution_DecisionMatrix_0383
     * @tc.desc      resolution decision 3 with rotation 454/86 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0383 begin`);
      logInfo("decision(3,1284.2,1081.4,1.5,454,86,1,2.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(1284.2, 1081.4) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(454, 86) + '|' + xComponentSizeText(false, 0, 720, 1280, 454, 86, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|3200*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|3200*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0383 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0384
     * @tc.name      Resolution_DecisionMatrix_0384
     * @tc.desc      resolution decision 4 with rotation 491/139 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0384 begin`);
      logInfo("decision(4,1287.3,1084.1,1.75,491,139,2,3)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(1287.3, 1084.1) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(491, 139) + '|' + xComponentSizeText(false, 0, 720, 1280, 491, 139, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*2160|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*2160|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0384 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0385
     * @tc.name      Resolution_DecisionMatrix_0385
     * @tc.desc      resolution decision 5 with rotation 528/192 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0385 begin`);
      logInfo("decision(5,1290.4,1086.8,2,528,192,0,3.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(1290.4, 1086.8) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(528, 192) + '|' + xComponentSizeText(false, 0, 720, 1280, 528, 192, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0385 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0386
     * @tc.name      Resolution_DecisionMatrix_0386
     * @tc.desc      resolution decision 6 with rotation 565/245 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0386 begin`);
      logInfo("decision(6,1293.5,1089.5,2.25,565,245,1,0.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(1293.5, 1089.5) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(565, 245) + '|' + xComponentSizeText(false, 0, 720, 1280, 565, 245, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*360|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*360|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0386 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0387
     * @tc.name      Resolution_DecisionMatrix_0387
     * @tc.desc      resolution decision 7 with rotation 602/298 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0387 begin`);
      logInfo("decision(7,1296.6,1092.2,2.5,602,298,2,1)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(1296.6, 1092.2) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(602, 298) + '|' + xComponentSizeText(false, 0, 720, 1280, 602, 298, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|1280*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|1280*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0387 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0388
     * @tc.name      Resolution_DecisionMatrix_0388
     * @tc.desc      resolution decision 8 with rotation 639/351 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0388 begin`);
      logInfo("decision(8,1299.7,1094.9,0.5,639,351,0,1.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(1299.7, 1094.9) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(639, 351) + '|' + xComponentSizeText(false, 0, 720, 1280, 639, 351, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0388 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0389
     * @tc.name      Resolution_DecisionMatrix_0389
     * @tc.desc      resolution decision 9 with rotation 676/44 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0389 begin`);
      logInfo("decision(9,1302.8,1097.6,0.75,676,44,1,2)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(1302.8, 1097.6) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(676, 44) + '|' + xComponentSizeText(false, 0, 720, 1280, 676, 44, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|2560*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|2560*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0389 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0390
     * @tc.name      Resolution_DecisionMatrix_0390
     * @tc.desc      resolution decision 10 with rotation 713/97 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0390 begin`);
      logInfo("decision(10,1305.9,1100.3,1,713,97,2,2.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(1305.9, 1100.3) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(713, 97) + '|' + xComponentSizeText(false, 0, 720, 1280, 713, 97, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*1800|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*1800|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0390 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0391
     * @tc.name      Resolution_DecisionMatrix_0391
     * @tc.desc      resolution decision 11 with rotation 30/150 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0391 begin`);
      logInfo("decision(11,1309,1103,1.25,30,150,0,3)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(1309, 1103) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(30, 150) + '|' + xComponentSizeText(false, 0, 720, 1280, 30, 150, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0391 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0392
     * @tc.name      Resolution_DecisionMatrix_0392
     * @tc.desc      resolution decision 12 with rotation 67/203 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0392 begin`);
      logInfo("decision(12,1312.1,1105.7,1.5,67,203,1,3.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(1312.1, 1105.7) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(67, 203) + '|' + xComponentSizeText(false, 0, 720, 1280, 67, 203, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*2520|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*2520|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0392 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0393
     * @tc.name      Resolution_DecisionMatrix_0393
     * @tc.desc      resolution decision 13 with rotation 104/256 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0393 begin`);
      logInfo("decision(13,1315.2,1108.4,1.75,104,256,2,0.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(1315.2, 1108.4) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(104, 256) + '|' + xComponentSizeText(false, 0, 720, 1280, 104, 256, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|640*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|640*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0393 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0394
     * @tc.name      Resolution_DecisionMatrix_0394
     * @tc.desc      resolution decision 14 with rotation 141/309 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0394 begin`);
      logInfo("decision(14,1318.3,1111.1,2,141,309,0,1)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(1318.3, 1111.1) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(141, 309) + '|' + xComponentSizeText(false, 0, 720, 1280, 141, 309, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0394 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0395
     * @tc.name      Resolution_DecisionMatrix_0395
     * @tc.desc      resolution decision 15 with rotation 178/2 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0395 begin`);
      logInfo("decision(15,1321.4,1113.8,2.25,178,2,1,1.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(1321.4, 1113.8) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(178, 2) + '|' + xComponentSizeText(false, 0, 720, 1280, 178, 2, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|1920*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|1920*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0395 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0396
     * @tc.name      Resolution_DecisionMatrix_0396
     * @tc.desc      resolution decision 16 with rotation 215/55 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0396 begin`);
      logInfo("decision(16,1324.5,1116.5,2.5,215,55,2,2)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(1324.5, 1116.5) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(215, 55) + '|' + xComponentSizeText(false, 0, 720, 1280, 215, 55, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*1440|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*1440|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0396 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0397
     * @tc.name      Resolution_DecisionMatrix_0397
     * @tc.desc      resolution decision -1 with rotation 252/108 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0397 begin`);
      logInfo("decision(-1,1327.6,1119.2,0.5,252,108,0,2.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(1327.6, 1119.2) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(252, 108) + '|' + xComponentSizeText(false, 0, 720, 1280, 252, 108, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0397 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0398
     * @tc.name      Resolution_DecisionMatrix_0398
     * @tc.desc      resolution decision 0 with rotation 289/161 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0398 begin`);
      logInfo("decision(0,1330.7,1121.9,0.75,289,161,1,3)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(1330.7, 1121.9) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(289, 161) + '|' + xComponentSizeText(false, 0, 720, 1280, 289, 161, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*2160|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*2160|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0398 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0399
     * @tc.name      Resolution_DecisionMatrix_0399
     * @tc.desc      resolution decision 1 with rotation 326/214 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0399 begin`);
      logInfo("decision(1,1333.8,1124.6,1,326,214,2,3.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(1333.8, 1124.6) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(326, 214) + '|' + xComponentSizeText(false, 0, 720, 1280, 326, 214, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|4480*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|4480*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0399 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0400
     * @tc.name      Resolution_DecisionMatrix_0400
     * @tc.desc      resolution decision 2 with rotation 363/267 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0400 begin`);
      logInfo("decision(2,1336.9,1127.3,1.25,363,267,0,0.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(1336.9, 1127.3) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(363, 267) + '|' + xComponentSizeText(false, 0, 720, 1280, 363, 267, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0400 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0401
     * @tc.name      Resolution_DecisionMatrix_0401
     * @tc.desc      resolution decision 3 with rotation 400/320 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0401 begin`);
      logInfo("decision(3,1340,1130,1.5,400,320,1,1)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(1340, 1130) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(400, 320) + '|' + xComponentSizeText(false, 0, 720, 1280, 400, 320, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|1280*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|1280*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0401 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0402
     * @tc.name      Resolution_DecisionMatrix_0402
     * @tc.desc      resolution decision 4 with rotation 437/13 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0402 begin`);
      logInfo("decision(4,1343.1,1132.7,1.75,437,13,2,1.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(1343.1, 1132.7) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(437, 13) + '|' + xComponentSizeText(false, 0, 720, 1280, 437, 13, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*1080|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*1080|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0402 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0403
     * @tc.name      Resolution_DecisionMatrix_0403
     * @tc.desc      resolution decision 5 with rotation 474/66 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0403 begin`);
      logInfo("decision(5,1346.2,1135.4,2,474,66,0,2)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(1346.2, 1135.4) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(474, 66) + '|' + xComponentSizeText(false, 0, 720, 1280, 474, 66, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0403 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0404
     * @tc.name      Resolution_DecisionMatrix_0404
     * @tc.desc      resolution decision 6 with rotation 511/119 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0404 begin`);
      logInfo("decision(6,1349.3,1138.1,2.25,511,119,1,2.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(1349.3, 1138.1) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(511, 119) + '|' + xComponentSizeText(false, 0, 720, 1280, 511, 119, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*1800|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*1800|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0404 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0405
     * @tc.name      Resolution_DecisionMatrix_0405
     * @tc.desc      resolution decision 7 with rotation 548/172 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0405 begin`);
      logInfo("decision(7,1352.4,1140.8,2.5,548,172,2,3)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(1352.4, 1140.8) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(548, 172) + '|' + xComponentSizeText(false, 0, 720, 1280, 548, 172, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|3840*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|3840*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0405 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0406
     * @tc.name      Resolution_DecisionMatrix_0406
     * @tc.desc      resolution decision 8 with rotation 585/225 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0406 begin`);
      logInfo("decision(8,1355.5,1143.5,0.5,585,225,0,3.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(1355.5, 1143.5) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(585, 225) + '|' + xComponentSizeText(false, 0, 720, 1280, 585, 225, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0406 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0407
     * @tc.name      Resolution_DecisionMatrix_0407
     * @tc.desc      resolution decision 9 with rotation 622/278 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0407 begin`);
      logInfo("decision(9,1358.6,1146.2,0.75,622,278,1,0.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(1358.6, 1146.2) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(622, 278) + '|' + xComponentSizeText(false, 0, 720, 1280, 622, 278, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|640*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|640*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0407 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0408
     * @tc.name      Resolution_DecisionMatrix_0408
     * @tc.desc      resolution decision 10 with rotation 659/331 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0408 begin`);
      logInfo("decision(10,1361.7,1148.9,1,659,331,2,1)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(1361.7, 1148.9) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(659, 331) + '|' + xComponentSizeText(false, 0, 720, 1280, 659, 331, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*720|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*720|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0408 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0409
     * @tc.name      Resolution_DecisionMatrix_0409
     * @tc.desc      resolution decision 11 with rotation 696/24 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0409 begin`);
      logInfo("decision(11,1364.8,1151.6,1.25,696,24,0,1.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(1364.8, 1151.6) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(696, 24) + '|' + xComponentSizeText(false, 0, 720, 1280, 696, 24, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0409 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0410
     * @tc.name      Resolution_DecisionMatrix_0410
     * @tc.desc      resolution decision 12 with rotation 13/77 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0410 begin`);
      logInfo("decision(12,1367.9,1154.3,1.5,13,77,1,2)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(1367.9, 1154.3) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(13, 77) + '|' + xComponentSizeText(false, 0, 720, 1280, 13, 77, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*1440|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*1440|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0410 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0411
     * @tc.name      Resolution_DecisionMatrix_0411
     * @tc.desc      resolution decision 13 with rotation 50/130 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0411 begin`);
      logInfo("decision(13,1371,1157,1.75,50,130,2,2.5)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(1371, 1157) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(50, 130) + '|' + xComponentSizeText(false, 0, 720, 1280, 50, 130, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|3200*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|3200*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0411 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0412
     * @tc.name      Resolution_DecisionMatrix_0412
     * @tc.desc      resolution decision 14 with rotation 87/183 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0412 begin`);
      logInfo("decision(14,1374.1,1159.7,2,87,183,0,3)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(1374.1, 1159.7) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(87, 183) + '|' + xComponentSizeText(false, 0, 720, 1280, 87, 183, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0412 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0413
     * @tc.name      Resolution_DecisionMatrix_0413
     * @tc.desc      resolution decision 15 with rotation 124/236 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0413 begin`);
      logInfo("decision(15,1377.2,1162.4,2.25,124,236,1,3.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(1377.2, 1162.4) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(124, 236) + '|' + xComponentSizeText(false, 0, 720, 1280, 124, 236, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|4480*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|4480*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0413 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0414
     * @tc.name      Resolution_DecisionMatrix_0414
     * @tc.desc      resolution decision 16 with rotation 161/289 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0414 begin`);
      logInfo("decision(16,1380.3,1165.1,2.5,161,289,2,0.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(1380.3, 1165.1) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(161, 289) + '|' + xComponentSizeText(false, 0, 720, 1280, 161, 289, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*360|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*360|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0414 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0415
     * @tc.name      Resolution_DecisionMatrix_0415
     * @tc.desc      resolution decision -1 with rotation 198/342 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0415 begin`);
      logInfo("decision(-1,1383.4,1167.8,0.5,198,342,0,1)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(1383.4, 1167.8) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(198, 342) + '|' + xComponentSizeText(false, 0, 720, 1280, 198, 342, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0415 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0416
     * @tc.name      Resolution_DecisionMatrix_0416
     * @tc.desc      resolution decision 0 with rotation 235/35 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0416 begin`);
      logInfo("decision(0,1386.5,1170.5,0.75,235,35,1,1.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(1386.5, 1170.5) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(235, 35) + '|' + xComponentSizeText(false, 0, 720, 1280, 235, 35, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*1080|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*1080|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0416 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0417
     * @tc.name      Resolution_DecisionMatrix_0417
     * @tc.desc      resolution decision 1 with rotation 272/88 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0417 begin`);
      logInfo("decision(1,1389.6,1173.2,1,272,88,2,2)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(1389.6, 1173.2) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(272, 88) + '|' + xComponentSizeText(false, 0, 720, 1280, 272, 88, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|2560*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|2560*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0417 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0418
     * @tc.name      Resolution_DecisionMatrix_0418
     * @tc.desc      resolution decision 2 with rotation 309/141 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0418 begin`);
      logInfo("decision(2,1392.7,1175.9,1.25,309,141,0,2.5)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(1392.7, 1175.9) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(309, 141) + '|' + xComponentSizeText(false, 0, 720, 1280, 309, 141, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0418 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0419
     * @tc.name      Resolution_DecisionMatrix_0419
     * @tc.desc      resolution decision 3 with rotation 346/194 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0419 begin`);
      logInfo("decision(3,1395.8,1178.6,1.5,346,194,1,3)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(1395.8, 1178.6) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(346, 194) + '|' + xComponentSizeText(false, 0, 720, 1280, 346, 194, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|3840*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|3840*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0419 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0420
     * @tc.name      Resolution_DecisionMatrix_0420
     * @tc.desc      resolution decision 4 with rotation 383/247 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0420 begin`);
      logInfo("decision(4,1398.9,1181.3,1.75,383,247,2,3.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(1398.9, 1181.3) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(383, 247) + '|' + xComponentSizeText(false, 0, 720, 1280, 383, 247, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*2520|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*2520|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0420 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0421
     * @tc.name      Resolution_DecisionMatrix_0421
     * @tc.desc      resolution decision 5 with rotation 420/300 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0421 begin`);
      logInfo("decision(5,1402,1184,2,420,300,0,0.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(1402, 1184) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(420, 300) + '|' + xComponentSizeText(false, 0, 720, 1280, 420, 300, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0421 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0422
     * @tc.name      Resolution_DecisionMatrix_0422
     * @tc.desc      resolution decision 6 with rotation 457/353 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0422 begin`);
      logInfo("decision(6,1405.1,1186.7,2.25,457,353,1,1)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(1405.1, 1186.7) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(457, 353) + '|' + xComponentSizeText(false, 0, 720, 1280, 457, 353, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*720|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*720|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0422 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0423
     * @tc.name      Resolution_DecisionMatrix_0423
     * @tc.desc      resolution decision 7 with rotation 494/46 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0423 begin`);
      logInfo("decision(7,1408.2,1189.4,2.5,494,46,2,1.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(1408.2, 1189.4) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(494, 46) + '|' + xComponentSizeText(false, 0, 720, 1280, 494, 46, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|1920*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|1920*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0423 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0424
     * @tc.name      Resolution_DecisionMatrix_0424
     * @tc.desc      resolution decision 8 with rotation 531/99 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0424 begin`);
      logInfo("decision(8,1411.3,1192.1,0.5,531,99,0,2)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(1411.3, 1192.1) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(531, 99) + '|' + xComponentSizeText(false, 0, 720, 1280, 531, 99, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0424 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0425
     * @tc.name      Resolution_DecisionMatrix_0425
     * @tc.desc      resolution decision 9 with rotation 568/152 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0425 begin`);
      logInfo("decision(9,1414.4,1194.8,0.75,568,152,1,2.5)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(1414.4, 1194.8) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(568, 152) + '|' + xComponentSizeText(false, 0, 720, 1280, 568, 152, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|3200*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|3200*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0425 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0426
     * @tc.name      Resolution_DecisionMatrix_0426
     * @tc.desc      resolution decision 10 with rotation 605/205 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0426 begin`);
      logInfo("decision(10,1417.5,1197.5,1,605,205,2,3)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(1417.5, 1197.5) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(605, 205) + '|' + xComponentSizeText(false, 0, 720, 1280, 605, 205, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|90|720*2160|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|90|720*2160|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0426 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0427
     * @tc.name      Resolution_DecisionMatrix_0427
     * @tc.desc      resolution decision 11 with rotation 642/258 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0427 begin`);
      logInfo("decision(11,1420.6,1200.2,1.25,642,258,0,3.5)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(1420.6, 1200.2) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(642, 258) + '|' + xComponentSizeText(false, 0, 720, 1280, 642, 258, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0427 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0428
     * @tc.name      Resolution_DecisionMatrix_0428
     * @tc.desc      resolution decision 12 with rotation 679/311 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0428 begin`);
      logInfo("decision(12,1423.7,1202.9,1.5,679,311,1,0.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(1423.7, 1202.9) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(679, 311) + '|' + xComponentSizeText(false, 0, 720, 1280, 679, 311, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|270|720*360|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|270|720*360|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0428 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0429
     * @tc.name      Resolution_DecisionMatrix_0429
     * @tc.desc      resolution decision 13 with rotation 716/4 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0429 begin`);
      logInfo("decision(13,1426.8,1205.6,1.75,716,4,2,1)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(1426.8, 1205.6) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(716, 4) + '|' + xComponentSizeText(false, 0, 720, 1280, 716, 4, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|0|1280*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|0|1280*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0429 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0430
     * @tc.name      Resolution_DecisionMatrix_0430
     * @tc.desc      resolution decision 14 with rotation 33/57 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0430 begin`);
      logInfo("decision(14,1429.9,1208.3,2,33,57,0,1.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(1429.9, 1208.3) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(33, 57) + '|' + xComponentSizeText(false, 0, 720, 1280, 33, 57, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|90|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0430 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0431
     * @tc.name      Resolution_DecisionMatrix_0431
     * @tc.desc      resolution decision 15 with rotation 70/110 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0431 begin`);
      logInfo("decision(15,1433,1211,2.25,70,110,1,2)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(1433, 1211) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(70, 110) + '|' + xComponentSizeText(false, 0, 720, 1280, 70, 110, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|180|2560*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|180|2560*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0431 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0432
     * @tc.name      Resolution_DecisionMatrix_0432
     * @tc.desc      resolution decision 16 with rotation 107/163 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0432 begin`);
      logInfo("decision(16,1436.1,1213.7,2.5,107,163,2,2.5)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(1436.1, 1213.7) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(107, 163) + '|' + xComponentSizeText(false, 0, 720, 1280, 107, 163, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|270|720*1800|1");
      expect(actual).assertEqual("|-1|0|1.777778|270|720*1800|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0432 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0433
     * @tc.name      Resolution_DecisionMatrix_0433
     * @tc.desc      resolution decision -1 with rotation 144/216 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0433 begin`);
      logInfo("decision(-1,1439.2,1216.4,0.5,144,216,0,3)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(1439.2, 1216.4) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(144, 216) + '|' + xComponentSizeText(false, 0, 720, 1280, 144, 216, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0433 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0434
     * @tc.name      Resolution_DecisionMatrix_0434
     * @tc.desc      resolution decision 0 with rotation 181/269 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0434 begin`);
      logInfo("decision(0,1442.3,1219.1,0.75,181,269,1,3.5)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(1442.3, 1219.1) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(181, 269) + '|' + xComponentSizeText(false, 0, 720, 1280, 181, 269, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|90|720*2520|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|90|720*2520|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0434 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0435
     * @tc.name      Resolution_DecisionMatrix_0435
     * @tc.desc      resolution decision 1 with rotation 218/322 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0435 begin`);
      logInfo("decision(1,1445.4,1221.8,1,218,322,2,0.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(1445.4, 1221.8) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(218, 322) + '|' + xComponentSizeText(false, 0, 720, 1280, 218, 322, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|180|640*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|180|640*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0435 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0436
     * @tc.name      Resolution_DecisionMatrix_0436
     * @tc.desc      resolution decision 2 with rotation 255/15 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0436 begin`);
      logInfo("decision(2,1448.5,1224.5,1.25,255,15,0,1)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(1448.5, 1224.5) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(255, 15) + '|' + xComponentSizeText(false, 0, 720, 1280, 255, 15, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0436 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0437
     * @tc.name      Resolution_DecisionMatrix_0437
     * @tc.desc      resolution decision 3 with rotation 292/68 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0437 begin`);
      logInfo("decision(3,1451.6,1227.2,1.5,292,68,1,1.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(1451.6, 1227.2) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(292, 68) + '|' + xComponentSizeText(false, 0, 720, 1280, 292, 68, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|0|1920*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|0|1920*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0437 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0438
     * @tc.name      Resolution_DecisionMatrix_0438
     * @tc.desc      resolution decision 4 with rotation 329/121 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0438 begin`);
      logInfo("decision(4,1454.7,1229.9,1.75,329,121,2,2)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(1454.7, 1229.9) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(329, 121) + '|' + xComponentSizeText(false, 0, 720, 1280, 329, 121, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|90|720*1440|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|90|720*1440|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0438 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0439
     * @tc.name      Resolution_DecisionMatrix_0439
     * @tc.desc      resolution decision 5 with rotation 366/174 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0439 begin`);
      logInfo("decision(5,1457.8,1232.6,2,366,174,0,2.5)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(1457.8, 1232.6) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(366, 174) + '|' + xComponentSizeText(false, 0, 720, 1280, 366, 174, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0439 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0440
     * @tc.name      Resolution_DecisionMatrix_0440
     * @tc.desc      resolution decision 6 with rotation 403/227 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0440 begin`);
      logInfo("decision(6,1460.9,1235.3,2.25,403,227,1,3)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(1460.9, 1235.3) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(403, 227) + '|' + xComponentSizeText(false, 0, 720, 1280, 403, 227, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|270|720*2160|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|270|720*2160|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0440 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0441
     * @tc.name      Resolution_DecisionMatrix_0441
     * @tc.desc      resolution decision 7 with rotation 440/280 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0441 begin`);
      logInfo("decision(7,1464,1238,2.5,440,280,2,3.5)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(1464, 1238) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(440, 280) + '|' + xComponentSizeText(false, 0, 720, 1280, 440, 280, 2, 3.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|0|4480*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|0|4480*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0441 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0442
     * @tc.name      Resolution_DecisionMatrix_0442
     * @tc.desc      resolution decision 8 with rotation 477/333 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0442 begin`);
      logInfo("decision(8,1467.1,1240.7,0.5,477,333,0,0.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(1467.1, 1240.7) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(477, 333) + '|' + xComponentSizeText(false, 0, 720, 1280, 477, 333, 0, 0.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0442 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0443
     * @tc.name      Resolution_DecisionMatrix_0443
     * @tc.desc      resolution decision 9 with rotation 514/26 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0443 begin`);
      logInfo("decision(9,1470.2,1243.4,0.75,514,26,1,1)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(1470.2, 1243.4) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(514, 26) + '|' + xComponentSizeText(false, 0, 720, 1280, 514, 26, 1, 1) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|180|1280*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|180|1280*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0443 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0444
     * @tc.name      Resolution_DecisionMatrix_0444
     * @tc.desc      resolution decision 10 with rotation 551/79 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0444 begin`);
      logInfo("decision(10,1473.3,1246.1,1,551,79,2,1.5)");
      const actual: string = resolutionLabel(10) + '|' + findResolutionIndex(1473.3, 1246.1) + '|' + resolutionRatio(10) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(551, 79) + '|' + xComponentSizeText(false, 0, 720, 1280, 551, 79, 2, 1.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720|-1|1.777778|1.777778|270|720*1080|1");
      expect(actual).assertEqual("1280*720|-1|1.777778|1.777778|270|720*1080|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0444 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0445
     * @tc.name      Resolution_DecisionMatrix_0445
     * @tc.desc      resolution decision 11 with rotation 588/132 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0445 begin`);
      logInfo("decision(11,1476.4,1248.8,1.25,588,132,0,2)");
      const actual: string = resolutionLabel(11) + '|' + findResolutionIndex(1476.4, 1248.8) + '|' + resolutionRatio(11) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(588, 132) + '|' + xComponentSizeText(false, 0, 720, 1280, 588, 132, 0, 2) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088|-1|1|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("1088*1088|-1|1|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0445 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0446
     * @tc.name      Resolution_DecisionMatrix_0446
     * @tc.desc      resolution decision 12 with rotation 625/185 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0446 begin`);
      logInfo("decision(12,1479.5,1251.5,1.5,625,185,1,2.5)");
      const actual: string = resolutionLabel(12) + '|' + findResolutionIndex(1479.5, 1251.5) + '|' + resolutionRatio(12) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(625, 185) + '|' + xComponentSizeText(false, 0, 720, 1280, 625, 185, 1, 2.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080|-1|1|1|90|720*1800|2");
      expect(actual).assertEqual("1080*1080|-1|1|1|90|720*1800|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0446 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0447
     * @tc.name      Resolution_DecisionMatrix_0447
     * @tc.desc      resolution decision 13 with rotation 662/238 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0447 begin`);
      logInfo("decision(13,1482.6,1254.2,1.75,662,238,2,3)");
      const actual: string = resolutionLabel(13) + '|' + findResolutionIndex(1482.6, 1254.2) + '|' + resolutionRatio(13) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(662, 238) + '|' + xComponentSizeText(false, 0, 720, 1280, 662, 238, 2, 3) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720|-1|1|1.777778|180|3840*1280|1");
      expect(actual).assertEqual("720*720|-1|1|1.777778|180|3840*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0447 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0448
     * @tc.name      Resolution_DecisionMatrix_0448
     * @tc.desc      resolution decision 14 with rotation 699/291 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0448 begin`);
      logInfo("decision(14,1485.7,1256.9,2,699,291,0,3.5)");
      const actual: string = resolutionLabel(14) + '|' + findResolutionIndex(1485.7, 1256.9) + '|' + resolutionRatio(14) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(699, 291) + '|' + xComponentSizeText(false, 0, 720, 1280, 699, 291, 0, 3.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480|-1|1.333333|0|270|720*1280.00016|1");
      expect(actual).assertEqual("640*480|-1|1.333333|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0448 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0449
     * @tc.name      Resolution_DecisionMatrix_0449
     * @tc.desc      resolution decision 15 with rotation 16/344 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0449 begin`);
      logInfo("decision(15,1488.8,1259.6,2.25,16,344,1,0.5)");
      const actual: string = resolutionLabel(15) + '|' + findResolutionIndex(1488.8, 1259.6) + '|' + resolutionRatio(15) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(16, 344) + '|' + xComponentSizeText(false, 0, 720, 1280, 16, 344, 1, 0.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480|-1|1|1|0|640*1280|2");
      expect(actual).assertEqual("480*480|-1|1|1|0|640*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0449 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0450
     * @tc.name      Resolution_DecisionMatrix_0450
     * @tc.desc      resolution decision 16 with rotation 53/37 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0450 begin`);
      logInfo("decision(16,1491.9,1262.3,2.5,53,37,2,1)");
      const actual: string = resolutionLabel(16) + '|' + findResolutionIndex(1491.9, 1262.3) + '|' + resolutionRatio(16) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(53, 37) + '|' + xComponentSizeText(false, 0, 720, 1280, 53, 37, 2, 1) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|1.777778|90|720*720|1");
      expect(actual).assertEqual("|-1|0|1.777778|90|720*720|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0450 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0451
     * @tc.name      Resolution_DecisionMatrix_0451
     * @tc.desc      resolution decision -1 with rotation 90/90 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0451 begin`);
      logInfo("decision(-1,1495,1265,0.5,90,90,0,1.5)");
      const actual: string = resolutionLabel(-1) + '|' + findResolutionIndex(1495, 1265) + '|' + resolutionRatio(-1) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(90, 90) + '|' + xComponentSizeText(false, 0, 720, 1280, 90, 90, 0, 1.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "|-1|0|0|180|2275.55584*1280|1");
      expect(actual).assertEqual("|-1|0|0|180|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0451 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0452
     * @tc.name      Resolution_DecisionMatrix_0452
     * @tc.desc      resolution decision 0 with rotation 127/143 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DecisionMatrix_0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0452 begin`);
      logInfo("decision(0,1498.1,1267.7,0.75,127,143,1,2)");
      const actual: string = resolutionLabel(0) + '|' + findResolutionIndex(1498.1, 1267.7) + '|' + resolutionRatio(0) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(127, 143) + '|' + xComponentSizeText(false, 0, 720, 1280, 127, 143, 1, 2) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072|-1|1.333333|1|270|720*1440|2");
      expect(actual).assertEqual("4096*3072|-1|1.333333|1|270|720*1440|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0452 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0453
     * @tc.name      Resolution_DecisionMatrix_0453
     * @tc.desc      resolution decision 1 with rotation 164/196 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0453 begin`);
      logInfo("decision(1,1501.2,1270.4,1,164,196,2,2.5)");
      const actual: string = resolutionLabel(1) + '|' + findResolutionIndex(1501.2, 1270.4) + '|' + resolutionRatio(1) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(164, 196) + '|' + xComponentSizeText(false, 0, 720, 1280, 164, 196, 2, 2.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304|-1|1.777778|1.777778|0|3200*1280|1");
      expect(actual).assertEqual("4096*2304|-1|1.777778|1.777778|0|3200*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0453 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0454
     * @tc.name      Resolution_DecisionMatrix_0454
     * @tc.desc      resolution decision 2 with rotation 201/249 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0454 begin`);
      logInfo("decision(2,1504.3,1273.1,1.25,201,249,0,3)");
      const actual: string = resolutionLabel(2) + '|' + findResolutionIndex(1504.3, 1273.1) + '|' + resolutionRatio(2) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(201, 249) + '|' + xComponentSizeText(false, 0, 720, 1280, 201, 249, 0, 3) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      expect(actual).assertEqual("3840*2160|-1|1.777778|0|90|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0454 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0455
     * @tc.name      Resolution_DecisionMatrix_0455
     * @tc.desc      resolution decision 3 with rotation 238/302 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0455 begin`);
      logInfo("decision(3,1507.4,1275.8,1.5,238,302,1,3.5)");
      const actual: string = resolutionLabel(3) + '|' + findResolutionIndex(1507.4, 1275.8) + '|' + resolutionRatio(3) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(238, 302) + '|' + xComponentSizeText(false, 0, 720, 1280, 238, 302, 1, 3.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160|-1|1.333333|1|180|4480*1280|2");
      expect(actual).assertEqual("2880*2160|-1|1.333333|1|180|4480*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0455 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0456
     * @tc.name      Resolution_DecisionMatrix_0456
     * @tc.desc      resolution decision 4 with rotation 275/355 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0456 begin`);
      logInfo("decision(4,1510.5,1278.5,1.75,275,355,2,0.5)");
      const actual: string = resolutionLabel(4) + '|' + findResolutionIndex(1510.5, 1278.5) + '|' + resolutionRatio(4) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(275, 355) + '|' + xComponentSizeText(false, 0, 720, 1280, 275, 355, 2, 0.5) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440|-1|1.777778|1.777778|270|720*360|1");
      expect(actual).assertEqual("2560*1440|-1|1.777778|1.777778|270|720*360|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0456 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0457
     * @tc.name      Resolution_DecisionMatrix_0457
     * @tc.desc      resolution decision 5 with rotation 312/48 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0457 begin`);
      logInfo("decision(5,1513.6,1281.2,2,312,48,0,1)");
      const actual: string = resolutionLabel(5) + '|' + findResolutionIndex(1513.6, 1281.2) + '|' + resolutionRatio(5) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(312, 48) + '|' + xComponentSizeText(false, 0, 720, 1280, 312, 48, 0, 1) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      expect(actual).assertEqual("2408*1080|-1|2.22963|0|0|2275.55584*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0457 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0458
     * @tc.name      Resolution_DecisionMatrix_0458
     * @tc.desc      resolution decision 6 with rotation 349/101 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0458 begin`);
      logInfo("decision(6,1516.7,1283.9,2.25,349,101,1,1.5)");
      const actual: string = resolutionLabel(6) + '|' + findResolutionIndex(1516.7, 1283.9) + '|' + resolutionRatio(6) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(349, 101) + '|' + xComponentSizeText(false, 0, 720, 1280, 349, 101, 1, 1.5) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080|-1|2.207407|1|90|720*1080|2");
      expect(actual).assertEqual("2384*1080|-1|2.207407|1|90|720*1080|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0458 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0459
     * @tc.name      Resolution_DecisionMatrix_0459
     * @tc.desc      resolution decision 7 with rotation 386/154 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0459 begin`);
      logInfo("decision(7,1519.8,1286.6,2.5,386,154,2,2)");
      const actual: string = resolutionLabel(7) + '|' + findResolutionIndex(1519.8, 1286.6) + '|' + resolutionRatio(7) + '|' + configRatioForSelectedIndex(2) + '|' + angleDiff(386, 154) + '|' + xComponentSizeText(false, 0, 720, 1280, 386, 154, 2, 2) + '|' + switchCameraPosition(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440|-1|1.333333|1.777778|180|2560*1280|1");
      expect(actual).assertEqual("1920*1440|-1|1.333333|1.777778|180|2560*1280|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0459 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0460
     * @tc.name      Resolution_DecisionMatrix_0460
     * @tc.desc      resolution decision 8 with rotation 423/207 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_DecisionMatrix_0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0460 begin`);
      logInfo("decision(8,1522.9,1289.3,0.5,423,207,0,2.5)");
      const actual: string = resolutionLabel(8) + '|' + findResolutionIndex(1522.9, 1289.3) + '|' + resolutionRatio(8) + '|' + configRatioForSelectedIndex(0) + '|' + angleDiff(423, 207) + '|' + xComponentSizeText(false, 0, 720, 1280, 423, 207, 0, 2.5) + '|' + switchCameraPosition(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      expect(actual).assertEqual("1920*1080|-1|1.777778|0|270|720*1280.00016|1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0460 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0461
     * @tc.name      Resolution_DecisionMatrix_0461
     * @tc.desc      resolution decision 9 with rotation 460/260 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DecisionMatrix_0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DecisionMatrix_0461 begin`);
      logInfo("decision(9,1526,1292,0.75,460,260,1,3)");
      const actual: string = resolutionLabel(9) + '|' + findResolutionIndex(1526, 1292) + '|' + resolutionRatio(9) + '|' + configRatioForSelectedIndex(1) + '|' + angleDiff(460, 260) + '|' + xComponentSizeText(false, 0, 720, 1280, 460, 260, 1, 3) + '|' + switchCameraPosition(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080|-1|1.333333|1|0|3840*1280|2");
      expect(actual).assertEqual("1440*1080|-1|1.333333|1|0|3840*1280|2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}DecisionMatrix_0461 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DECISION_MATRIX_0462
     * @tc.name      Resolution_DecisionMatrix_0462
     * @tc.desc      resolution decision 10 with rotation 497/313 resolves consistently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
