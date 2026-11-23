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
  ResolutionPageModel,
  changeResolutionIndex,
} from '../model/ResolutionLogic';

/** ResolutionIndexFlowTest logic checks (46 cases). */
export default function resolutionIndexFlowTest(): void {
  describe('ResolutionIndexFlowTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0001
     * @tc.name      Resolution_IndexFlow_0001
     * @tc.desc      resolution selection sequence -2,-6 settles on 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_IndexFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexFlow_0001 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select -2 then -6");
      const actual: string = subject.selectResolution(-2) + ',' + subject.selectResolution(-6);
      logInfo('actual=' + String(actual) + ', expected=' + "8,8");
      expect(actual).assertEqual("8,8");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0002
     * @tc.name      Resolution_IndexFlow_0002
     * @tc.desc      resolution selection sequence -1,-3 settles on 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0002 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select -1 then -3");
      const actual: string = subject.selectResolution(-1) + ',' + subject.selectResolution(-3);
      logInfo('actual=' + String(actual) + ', expected=' + "8,8");
      expect(actual).assertEqual("8,8");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0003
     * @tc.name      Resolution_IndexFlow_0003
     * @tc.desc      resolution selection sequence 0,0 settles on 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0003 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 0 then 0");
      const actual: string = subject.selectResolution(0) + ',' + subject.selectResolution(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0,0");
      expect(actual).assertEqual("0,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0004
     * @tc.name      Resolution_IndexFlow_0004
     * @tc.desc      resolution selection sequence 1,3 settles on 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0004 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 1 then 3");
      const actual: string = subject.selectResolution(1) + ',' + subject.selectResolution(3);
      logInfo('actual=' + String(actual) + ', expected=' + "1,3");
      expect(actual).assertEqual("1,3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0005
     * @tc.name      Resolution_IndexFlow_0005
     * @tc.desc      resolution selection sequence 2,6 settles on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0005 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 2 then 6");
      const actual: string = subject.selectResolution(2) + ',' + subject.selectResolution(6);
      logInfo('actual=' + String(actual) + ', expected=' + "2,6");
      expect(actual).assertEqual("2,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0006
     * @tc.name      Resolution_IndexFlow_0006
     * @tc.desc      resolution selection sequence 3,9 settles on 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0006 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 3 then 9");
      const actual: string = subject.selectResolution(3) + ',' + subject.selectResolution(9);
      logInfo('actual=' + String(actual) + ', expected=' + "3,9");
      expect(actual).assertEqual("3,9");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0007
     * @tc.name      Resolution_IndexFlow_0007
     * @tc.desc      resolution selection sequence 4,12 settles on 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0007 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 4 then 12");
      const actual: string = subject.selectResolution(4) + ',' + subject.selectResolution(12);
      logInfo('actual=' + String(actual) + ', expected=' + "4,12");
      expect(actual).assertEqual("4,12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0008
     * @tc.name      Resolution_IndexFlow_0008
     * @tc.desc      resolution selection sequence 5,15 settles on 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0008 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 5 then 15");
      const actual: string = subject.selectResolution(5) + ',' + subject.selectResolution(15);
      logInfo('actual=' + String(actual) + ', expected=' + "5,15");
      expect(actual).assertEqual("5,15");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0009
     * @tc.name      Resolution_IndexFlow_0009
     * @tc.desc      resolution selection sequence 6,18 settles on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0009 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 6 then 18");
      const actual: string = subject.selectResolution(6) + ',' + subject.selectResolution(18);
      logInfo('actual=' + String(actual) + ', expected=' + "6,6");
      expect(actual).assertEqual("6,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0010
     * @tc.name      Resolution_IndexFlow_0010
     * @tc.desc      resolution selection sequence 7,1 settles on 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0010 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 7 then 1");
      const actual: string = subject.selectResolution(7) + ',' + subject.selectResolution(1);
      logInfo('actual=' + String(actual) + ', expected=' + "7,1");
      expect(actual).assertEqual("7,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0011
     * @tc.name      Resolution_IndexFlow_0011
     * @tc.desc      resolution selection sequence 8,4 settles on 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0011 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 8 then 4");
      const actual: string = subject.selectResolution(8) + ',' + subject.selectResolution(4);
      logInfo('actual=' + String(actual) + ', expected=' + "8,4");
      expect(actual).assertEqual("8,4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0012
     * @tc.name      Resolution_IndexFlow_0012
     * @tc.desc      resolution selection sequence 9,7 settles on 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_IndexFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexFlow_0012 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 9 then 7");
      const actual: string = subject.selectResolution(9) + ',' + subject.selectResolution(7);
      logInfo('actual=' + String(actual) + ', expected=' + "9,7");
      expect(actual).assertEqual("9,7");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0013
     * @tc.name      Resolution_IndexFlow_0013
     * @tc.desc      resolution selection sequence 10,10 settles on 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0013 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 10 then 10");
      const actual: string = subject.selectResolution(10) + ',' + subject.selectResolution(10);
      logInfo('actual=' + String(actual) + ', expected=' + "10,10");
      expect(actual).assertEqual("10,10");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0014
     * @tc.name      Resolution_IndexFlow_0014
     * @tc.desc      resolution selection sequence 11,13 settles on 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0014 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 11 then 13");
      const actual: string = subject.selectResolution(11) + ',' + subject.selectResolution(13);
      logInfo('actual=' + String(actual) + ', expected=' + "11,13");
      expect(actual).assertEqual("11,13");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0015
     * @tc.name      Resolution_IndexFlow_0015
     * @tc.desc      resolution selection sequence 12,16 settles on 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0015 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 12 then 16");
      const actual: string = subject.selectResolution(12) + ',' + subject.selectResolution(16);
      logInfo('actual=' + String(actual) + ', expected=' + "12,12");
      expect(actual).assertEqual("12,12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0016
     * @tc.name      Resolution_IndexFlow_0016
     * @tc.desc      resolution selection sequence 13,19 settles on 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0016 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 13 then 19");
      const actual: string = subject.selectResolution(13) + ',' + subject.selectResolution(19);
      logInfo('actual=' + String(actual) + ', expected=' + "13,13");
      expect(actual).assertEqual("13,13");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0017
     * @tc.name      Resolution_IndexFlow_0017
     * @tc.desc      resolution selection sequence 14,2 settles on 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0017 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 14 then 2");
      const actual: string = subject.selectResolution(14) + ',' + subject.selectResolution(2);
      logInfo('actual=' + String(actual) + ', expected=' + "14,2");
      expect(actual).assertEqual("14,2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0018
     * @tc.name      Resolution_IndexFlow_0018
     * @tc.desc      resolution selection sequence 15,5 settles on 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_IndexFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexFlow_0018 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 15 then 5");
      const actual: string = subject.selectResolution(15) + ',' + subject.selectResolution(5);
      logInfo('actual=' + String(actual) + ', expected=' + "15,5");
      expect(actual).assertEqual("15,5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0019
     * @tc.name      Resolution_IndexFlow_0019
     * @tc.desc      resolution selection sequence 16,8 settles on 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0019 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 16 then 8");
      const actual: string = subject.selectResolution(16) + ',' + subject.selectResolution(8);
      logInfo('actual=' + String(actual) + ', expected=' + "8,8");
      expect(actual).assertEqual("8,8");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0020
     * @tc.name      Resolution_IndexFlow_0020
     * @tc.desc      resolution selection sequence 17,11 settles on 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0020 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 17 then 11");
      const actual: string = subject.selectResolution(17) + ',' + subject.selectResolution(11);
      logInfo('actual=' + String(actual) + ', expected=' + "8,11");
      expect(actual).assertEqual("8,11");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0021
     * @tc.name      Resolution_IndexFlow_0021
     * @tc.desc      resolution selection sequence 18,14 settles on 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0021 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 18 then 14");
      const actual: string = subject.selectResolution(18) + ',' + subject.selectResolution(14);
      logInfo('actual=' + String(actual) + ', expected=' + "8,14");
      expect(actual).assertEqual("8,14");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0022
     * @tc.name      Resolution_IndexFlow_0022
     * @tc.desc      resolution selection sequence 19,17 settles on 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0022 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 19 then 17");
      const actual: string = subject.selectResolution(19) + ',' + subject.selectResolution(17);
      logInfo('actual=' + String(actual) + ', expected=' + "8,8");
      expect(actual).assertEqual("8,8");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0023
     * @tc.name      Resolution_IndexFlow_0023
     * @tc.desc      resolution selection sequence 20,0 settles on 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_IndexFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexFlow_0023 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 20 then 0");
      const actual: string = subject.selectResolution(20) + ',' + subject.selectResolution(0);
      logInfo('actual=' + String(actual) + ', expected=' + "8,0");
      expect(actual).assertEqual("8,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0024
     * @tc.name      Resolution_IndexFlow_0024
     * @tc.desc      resolution selection sequence 21,3 settles on 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0024 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 21 then 3");
      const actual: string = subject.selectResolution(21) + ',' + subject.selectResolution(3);
      logInfo('actual=' + String(actual) + ', expected=' + "8,3");
      expect(actual).assertEqual("8,3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0025
     * @tc.name      Resolution_IndexFlow_0025
     * @tc.desc      resolution selection sequence 22,6 settles on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0025 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 22 then 6");
      const actual: string = subject.selectResolution(22) + ',' + subject.selectResolution(6);
      logInfo('actual=' + String(actual) + ', expected=' + "8,6");
      expect(actual).assertEqual("8,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0026
     * @tc.name      Resolution_IndexFlow_0026
     * @tc.desc      resolution selection sequence 23,9 settles on 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0026 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 23 then 9");
      const actual: string = subject.selectResolution(23) + ',' + subject.selectResolution(9);
      logInfo('actual=' + String(actual) + ', expected=' + "8,9");
      expect(actual).assertEqual("8,9");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0027
     * @tc.name      Resolution_IndexFlow_0027
     * @tc.desc      resolution selection sequence 24,12 settles on 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0027 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 24 then 12");
      const actual: string = subject.selectResolution(24) + ',' + subject.selectResolution(12);
      logInfo('actual=' + String(actual) + ', expected=' + "8,12");
      expect(actual).assertEqual("8,12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0028
     * @tc.name      Resolution_IndexFlow_0028
     * @tc.desc      resolution selection sequence 25,15 settles on 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0028 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 25 then 15");
      const actual: string = subject.selectResolution(25) + ',' + subject.selectResolution(15);
      logInfo('actual=' + String(actual) + ', expected=' + "8,15");
      expect(actual).assertEqual("8,15");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0029
     * @tc.name      Resolution_IndexFlow_0029
     * @tc.desc      resolution selection sequence 26,18 settles on 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0029 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 26 then 18");
      const actual: string = subject.selectResolution(26) + ',' + subject.selectResolution(18);
      logInfo('actual=' + String(actual) + ', expected=' + "8,8");
      expect(actual).assertEqual("8,8");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0030
     * @tc.name      Resolution_IndexFlow_0030
     * @tc.desc      resolution selection sequence 27,1 settles on 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0030 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 27 then 1");
      const actual: string = subject.selectResolution(27) + ',' + subject.selectResolution(1);
      logInfo('actual=' + String(actual) + ', expected=' + "8,1");
      expect(actual).assertEqual("8,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0031
     * @tc.name      Resolution_IndexFlow_0031
     * @tc.desc      resolution selection sequence 28,4 settles on 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0031 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 28 then 4");
      const actual: string = subject.selectResolution(28) + ',' + subject.selectResolution(4);
      logInfo('actual=' + String(actual) + ', expected=' + "8,4");
      expect(actual).assertEqual("8,4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0032
     * @tc.name      Resolution_IndexFlow_0032
     * @tc.desc      resolution selection sequence 29,7 settles on 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0032 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 29 then 7");
      const actual: string = subject.selectResolution(29) + ',' + subject.selectResolution(7);
      logInfo('actual=' + String(actual) + ', expected=' + "8,7");
      expect(actual).assertEqual("8,7");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0033
     * @tc.name      Resolution_IndexFlow_0033
     * @tc.desc      resolution selection sequence 30,10 settles on 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0033 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 30 then 10");
      const actual: string = subject.selectResolution(30) + ',' + subject.selectResolution(10);
      logInfo('actual=' + String(actual) + ', expected=' + "8,10");
      expect(actual).assertEqual("8,10");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0034
     * @tc.name      Resolution_IndexFlow_0034
     * @tc.desc      resolution selection sequence 31,13 settles on 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_IndexFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexFlow_0034 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 31 then 13");
      const actual: string = subject.selectResolution(31) + ',' + subject.selectResolution(13);
      logInfo('actual=' + String(actual) + ', expected=' + "8,13");
      expect(actual).assertEqual("8,13");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0035
     * @tc.name      Resolution_IndexFlow_0035
     * @tc.desc      resolution selection sequence 32,16 settles on 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_IndexFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexFlow_0035 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 32 then 16");
      const actual: string = subject.selectResolution(32) + ',' + subject.selectResolution(16);
      logInfo('actual=' + String(actual) + ', expected=' + "8,8");
      expect(actual).assertEqual("8,8");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0036
     * @tc.name      Resolution_IndexFlow_0036
     * @tc.desc      resolution selection sequence 33,19 settles on 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0036 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 33 then 19");
      const actual: string = subject.selectResolution(33) + ',' + subject.selectResolution(19);
      logInfo('actual=' + String(actual) + ', expected=' + "8,8");
      expect(actual).assertEqual("8,8");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0037
     * @tc.name      Resolution_IndexFlow_0037
     * @tc.desc      resolution selection sequence 34,2 settles on 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0037 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 34 then 2");
      const actual: string = subject.selectResolution(34) + ',' + subject.selectResolution(2);
      logInfo('actual=' + String(actual) + ', expected=' + "8,2");
      expect(actual).assertEqual("8,2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0038
     * @tc.name      Resolution_IndexFlow_0038
     * @tc.desc      resolution selection sequence 35,5 settles on 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0038 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 35 then 5");
      const actual: string = subject.selectResolution(35) + ',' + subject.selectResolution(5);
      logInfo('actual=' + String(actual) + ', expected=' + "8,5");
      expect(actual).assertEqual("8,5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0039
     * @tc.name      Resolution_IndexFlow_0039
     * @tc.desc      resolution selection sequence 36,8 settles on 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0039 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 36 then 8");
      const actual: string = subject.selectResolution(36) + ',' + subject.selectResolution(8);
      logInfo('actual=' + String(actual) + ', expected=' + "8,8");
      expect(actual).assertEqual("8,8");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0040
     * @tc.name      Resolution_IndexFlow_0040
     * @tc.desc      resolution selection sequence 37,11 settles on 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0040 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 37 then 11");
      const actual: string = subject.selectResolution(37) + ',' + subject.selectResolution(11);
      logInfo('actual=' + String(actual) + ', expected=' + "8,11");
      expect(actual).assertEqual("8,11");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0041
     * @tc.name      Resolution_IndexFlow_0041
     * @tc.desc      resolution selection sequence 38,14 settles on 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0041 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 38 then 14");
      const actual: string = subject.selectResolution(38) + ',' + subject.selectResolution(14);
      logInfo('actual=' + String(actual) + ', expected=' + "8,14");
      expect(actual).assertEqual("8,14");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0042
     * @tc.name      Resolution_IndexFlow_0042
     * @tc.desc      resolution selection sequence 39,17 settles on 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0042 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 39 then 17");
      const actual: string = subject.selectResolution(39) + ',' + subject.selectResolution(17);
      logInfo('actual=' + String(actual) + ', expected=' + "8,8");
      expect(actual).assertEqual("8,8");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0043
     * @tc.name      Resolution_IndexFlow_0043
     * @tc.desc      resolution selection sequence 40,0 settles on 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0043 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 40 then 0");
      const actual: string = subject.selectResolution(40) + ',' + subject.selectResolution(0);
      logInfo('actual=' + String(actual) + ', expected=' + "8,0");
      expect(actual).assertEqual("8,0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0044
     * @tc.name      Resolution_IndexFlow_0044
     * @tc.desc      resolution selection sequence 41,3 settles on 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0044 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 41 then 3");
      const actual: string = subject.selectResolution(41) + ',' + subject.selectResolution(3);
      logInfo('actual=' + String(actual) + ', expected=' + "8,3");
      expect(actual).assertEqual("8,3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0045
     * @tc.name      Resolution_IndexFlow_0045
     * @tc.desc      resolution selection sequence 42,6 settles on 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_IndexFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexFlow_0045 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 42 then 6");
      const actual: string = subject.selectResolution(42) + ',' + subject.selectResolution(6);
      logInfo('actual=' + String(actual) + ', expected=' + "8,6");
      expect(actual).assertEqual("8,6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INDEX_FLOW_0046
     * @tc.name      Resolution_IndexFlow_0046
     * @tc.desc      resolution selection sequence 43,9 settles on 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_IndexFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexFlow_0046 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("select 43 then 9");
      const actual: string = subject.selectResolution(43) + ',' + subject.selectResolution(9);
      logInfo('actual=' + String(actual) + ', expected=' + "8,9");
      expect(actual).assertEqual("8,9");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}IndexFlow_0046 end`);
    });
  });
}
