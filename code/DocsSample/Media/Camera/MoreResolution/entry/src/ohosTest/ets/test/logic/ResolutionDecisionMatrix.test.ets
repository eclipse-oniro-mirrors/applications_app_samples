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
