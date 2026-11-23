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
  resolutionLabel,
} from '../model/ResolutionLogic';

/** ResolutionChangeFlowTest logic checks (46 cases). */
export default function resolutionChangeFlowTest(): void {
  describe('ResolutionChangeFlowTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0001
     * @tc.name      Resolution_ChangeFlow_0001
     * @tc.desc      changeResolution(0) updates the page to 4096*3072.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ChangeFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChangeFlow_0001 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(0)");
      const actual: string = subject.changeResolution(0);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072");
      expect(actual).assertEqual("4096*3072");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0002
     * @tc.name      Resolution_ChangeFlow_0002
     * @tc.desc      changeResolution(1) updates the page to 4096*2304.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0002 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(1)");
      const actual: string = subject.changeResolution(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304");
      expect(actual).assertEqual("4096*2304");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0003
     * @tc.name      Resolution_ChangeFlow_0003
     * @tc.desc      changeResolution(2) updates the page to 3840*2160.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0003 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(2)");
      const actual: string = subject.changeResolution(2);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160");
      expect(actual).assertEqual("3840*2160");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0004
     * @tc.name      Resolution_ChangeFlow_0004
     * @tc.desc      changeResolution(3) updates the page to 2880*2160.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0004 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(3)");
      const actual: string = subject.changeResolution(3);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160");
      expect(actual).assertEqual("2880*2160");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0005
     * @tc.name      Resolution_ChangeFlow_0005
     * @tc.desc      changeResolution(4) updates the page to 2560*1440.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0005 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(4)");
      const actual: string = subject.changeResolution(4);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440");
      expect(actual).assertEqual("2560*1440");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0006
     * @tc.name      Resolution_ChangeFlow_0006
     * @tc.desc      changeResolution(5) updates the page to 2408*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0006 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(5)");
      const actual: string = subject.changeResolution(5);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080");
      expect(actual).assertEqual("2408*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0007
     * @tc.name      Resolution_ChangeFlow_0007
     * @tc.desc      changeResolution(6) updates the page to 2384*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0007 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(6)");
      const actual: string = subject.changeResolution(6);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080");
      expect(actual).assertEqual("2384*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0008
     * @tc.name      Resolution_ChangeFlow_0008
     * @tc.desc      changeResolution(7) updates the page to 1920*1440.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0008 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(7)");
      const actual: string = subject.changeResolution(7);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440");
      expect(actual).assertEqual("1920*1440");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0009
     * @tc.name      Resolution_ChangeFlow_0009
     * @tc.desc      changeResolution(8) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0009 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(8)");
      const actual: string = subject.changeResolution(8);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0010
     * @tc.name      Resolution_ChangeFlow_0010
     * @tc.desc      changeResolution(9) updates the page to 1440*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0010 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(9)");
      const actual: string = subject.changeResolution(9);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080");
      expect(actual).assertEqual("1440*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0011
     * @tc.name      Resolution_ChangeFlow_0011
     * @tc.desc      changeResolution(10) updates the page to 1280*720.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0011 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(10)");
      const actual: string = subject.changeResolution(10);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720");
      expect(actual).assertEqual("1280*720");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0012
     * @tc.name      Resolution_ChangeFlow_0012
     * @tc.desc      changeResolution(11) updates the page to 1088*1088.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ChangeFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChangeFlow_0012 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(11)");
      const actual: string = subject.changeResolution(11);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088");
      expect(actual).assertEqual("1088*1088");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0013
     * @tc.name      Resolution_ChangeFlow_0013
     * @tc.desc      changeResolution(12) updates the page to 1080*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0013 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(12)");
      const actual: string = subject.changeResolution(12);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080");
      expect(actual).assertEqual("1080*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0014
     * @tc.name      Resolution_ChangeFlow_0014
     * @tc.desc      changeResolution(13) updates the page to 720*720.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0014 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(13)");
      const actual: string = subject.changeResolution(13);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720");
      expect(actual).assertEqual("720*720");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0015
     * @tc.name      Resolution_ChangeFlow_0015
     * @tc.desc      changeResolution(14) updates the page to 640*480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0015 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(14)");
      const actual: string = subject.changeResolution(14);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480");
      expect(actual).assertEqual("640*480");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0016
     * @tc.name      Resolution_ChangeFlow_0016
     * @tc.desc      changeResolution(15) updates the page to 480*480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0016 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(15)");
      const actual: string = subject.changeResolution(15);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480");
      expect(actual).assertEqual("480*480");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0017
     * @tc.name      Resolution_ChangeFlow_0017
     * @tc.desc      changeResolution(16) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0017 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(16)");
      const actual: string = subject.changeResolution(16);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0018
     * @tc.name      Resolution_ChangeFlow_0018
     * @tc.desc      changeResolution(17) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ChangeFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ChangeFlow_0018 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(17)");
      const actual: string = subject.changeResolution(17);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0019
     * @tc.name      Resolution_ChangeFlow_0019
     * @tc.desc      changeResolution(18) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0019 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(18)");
      const actual: string = subject.changeResolution(18);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0020
     * @tc.name      Resolution_ChangeFlow_0020
     * @tc.desc      changeResolution(19) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0020 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(19)");
      const actual: string = subject.changeResolution(19);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0021
     * @tc.name      Resolution_ChangeFlow_0021
     * @tc.desc      changeResolution(20) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0021 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(20)");
      const actual: string = subject.changeResolution(20);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0022
     * @tc.name      Resolution_ChangeFlow_0022
     * @tc.desc      changeResolution(21) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0022 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(21)");
      const actual: string = subject.changeResolution(21);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0023
     * @tc.name      Resolution_ChangeFlow_0023
     * @tc.desc      changeResolution(22) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ChangeFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChangeFlow_0023 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(22)");
      const actual: string = subject.changeResolution(22);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0024
     * @tc.name      Resolution_ChangeFlow_0024
     * @tc.desc      changeResolution(23) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0024 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(23)");
      const actual: string = subject.changeResolution(23);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0025
     * @tc.name      Resolution_ChangeFlow_0025
     * @tc.desc      changeResolution(24) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0025 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(24)");
      const actual: string = subject.changeResolution(24);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0026
     * @tc.name      Resolution_ChangeFlow_0026
     * @tc.desc      changeResolution(25) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0026 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(25)");
      const actual: string = subject.changeResolution(25);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0027
     * @tc.name      Resolution_ChangeFlow_0027
     * @tc.desc      changeResolution(26) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0027 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(26)");
      const actual: string = subject.changeResolution(26);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0028
     * @tc.name      Resolution_ChangeFlow_0028
     * @tc.desc      changeResolution(27) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0028 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(27)");
      const actual: string = subject.changeResolution(27);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0029
     * @tc.name      Resolution_ChangeFlow_0029
     * @tc.desc      changeResolution(28) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0029 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(28)");
      const actual: string = subject.changeResolution(28);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0030
     * @tc.name      Resolution_ChangeFlow_0030
     * @tc.desc      changeResolution(29) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0030 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(29)");
      const actual: string = subject.changeResolution(29);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0031
     * @tc.name      Resolution_ChangeFlow_0031
     * @tc.desc      changeResolution(30) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0031 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(30)");
      const actual: string = subject.changeResolution(30);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0032
     * @tc.name      Resolution_ChangeFlow_0032
     * @tc.desc      changeResolution(31) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0032 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(31)");
      const actual: string = subject.changeResolution(31);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0033
     * @tc.name      Resolution_ChangeFlow_0033
     * @tc.desc      changeResolution(32) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0033 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(32)");
      const actual: string = subject.changeResolution(32);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0034
     * @tc.name      Resolution_ChangeFlow_0034
     * @tc.desc      changeResolution(33) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ChangeFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChangeFlow_0034 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(33)");
      const actual: string = subject.changeResolution(33);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0035
     * @tc.name      Resolution_ChangeFlow_0035
     * @tc.desc      changeResolution(34) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ChangeFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ChangeFlow_0035 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(34)");
      const actual: string = subject.changeResolution(34);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0036
     * @tc.name      Resolution_ChangeFlow_0036
     * @tc.desc      changeResolution(35) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0036 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(35)");
      const actual: string = subject.changeResolution(35);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0037
     * @tc.name      Resolution_ChangeFlow_0037
     * @tc.desc      changeResolution(36) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0037 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(36)");
      const actual: string = subject.changeResolution(36);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0038
     * @tc.name      Resolution_ChangeFlow_0038
     * @tc.desc      changeResolution(37) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0038 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(37)");
      const actual: string = subject.changeResolution(37);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0039
     * @tc.name      Resolution_ChangeFlow_0039
     * @tc.desc      changeResolution(38) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0039 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(38)");
      const actual: string = subject.changeResolution(38);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0040
     * @tc.name      Resolution_ChangeFlow_0040
     * @tc.desc      changeResolution(39) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0040 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(39)");
      const actual: string = subject.changeResolution(39);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0041
     * @tc.name      Resolution_ChangeFlow_0041
     * @tc.desc      changeResolution(40) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0041 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(40)");
      const actual: string = subject.changeResolution(40);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0042
     * @tc.name      Resolution_ChangeFlow_0042
     * @tc.desc      changeResolution(41) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0042 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(41)");
      const actual: string = subject.changeResolution(41);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0043
     * @tc.name      Resolution_ChangeFlow_0043
     * @tc.desc      changeResolution(42) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0043 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(42)");
      const actual: string = subject.changeResolution(42);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0044
     * @tc.name      Resolution_ChangeFlow_0044
     * @tc.desc      changeResolution(43) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0044 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(43)");
      const actual: string = subject.changeResolution(43);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0045
     * @tc.name      Resolution_ChangeFlow_0045
     * @tc.desc      changeResolution(44) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ChangeFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChangeFlow_0045 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(44)");
      const actual: string = subject.changeResolution(44);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CHANGE_FLOW_0046
     * @tc.name      Resolution_ChangeFlow_0046
     * @tc.desc      changeResolution(45) updates the page to 1920*1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ChangeFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChangeFlow_0046 begin`);
      const subject: ResolutionPageModel = new ResolutionPageModel();
      logInfo("changeResolution(45)");
      const actual: string = subject.changeResolution(45);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ChangeFlow_0046 end`);
    });
  });
}
