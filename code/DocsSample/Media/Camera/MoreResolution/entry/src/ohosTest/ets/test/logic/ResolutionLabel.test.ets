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
} from '../model/ResolutionLogic';

/** ResolutionLabelTest logic checks (43 cases). */
export default function resolutionLabelTest(): void {
  describe('ResolutionLabelTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0001
     * @tc.name      Resolution_ResLabel_0001
     * @tc.desc      resolutionLabel(0) renders "4096*3072".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResLabel_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResLabel_0001 begin`);
      logInfo("resolutionLabel(0)");
      const actual: string = resolutionLabel(0);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072");
      expect(actual).assertEqual("4096*3072");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResLabel_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0002
     * @tc.name      Resolution_ResLabel_0002
     * @tc.desc      resolutionLabel(1) renders "4096*2304".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0002 begin`);
      logInfo("resolutionLabel(1)");
      const actual: string = resolutionLabel(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304");
      expect(actual).assertEqual("4096*2304");
      logInfo(`${BUNDLE}ResLabel_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0003
     * @tc.name      Resolution_ResLabel_0003
     * @tc.desc      resolutionLabel(2) renders "3840*2160".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0003 begin`);
      logInfo("resolutionLabel(2)");
      const actual: string = resolutionLabel(2);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160");
      expect(actual).assertEqual("3840*2160");
      logInfo(`${BUNDLE}ResLabel_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0004
     * @tc.name      Resolution_ResLabel_0004
     * @tc.desc      resolutionLabel(3) renders "2880*2160".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0004 begin`);
      logInfo("resolutionLabel(3)");
      const actual: string = resolutionLabel(3);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160");
      expect(actual).assertEqual("2880*2160");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResLabel_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0005
     * @tc.name      Resolution_ResLabel_0005
     * @tc.desc      resolutionLabel(4) renders "2560*1440".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0005 begin`);
      logInfo("resolutionLabel(4)");
      const actual: string = resolutionLabel(4);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440");
      expect(actual).assertEqual("2560*1440");
      logInfo(`${BUNDLE}ResLabel_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0006
     * @tc.name      Resolution_ResLabel_0006
     * @tc.desc      resolutionLabel(5) renders "2408*1080".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0006 begin`);
      logInfo("resolutionLabel(5)");
      const actual: string = resolutionLabel(5);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080");
      expect(actual).assertEqual("2408*1080");
      logInfo(`${BUNDLE}ResLabel_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0007
     * @tc.name      Resolution_ResLabel_0007
     * @tc.desc      resolutionLabel(6) renders "2384*1080".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0007 begin`);
      logInfo("resolutionLabel(6)");
      const actual: string = resolutionLabel(6);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080");
      expect(actual).assertEqual("2384*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResLabel_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0008
     * @tc.name      Resolution_ResLabel_0008
     * @tc.desc      resolutionLabel(7) renders "1920*1440".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0008 begin`);
      logInfo("resolutionLabel(7)");
      const actual: string = resolutionLabel(7);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440");
      expect(actual).assertEqual("1920*1440");
      logInfo(`${BUNDLE}ResLabel_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0009
     * @tc.name      Resolution_ResLabel_0009
     * @tc.desc      resolutionLabel(8) renders "1920*1080".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0009 begin`);
      logInfo("resolutionLabel(8)");
      const actual: string = resolutionLabel(8);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo(`${BUNDLE}ResLabel_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0010
     * @tc.name      Resolution_ResLabel_0010
     * @tc.desc      resolutionLabel(9) renders "1440*1080".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0010 begin`);
      logInfo("resolutionLabel(9)");
      const actual: string = resolutionLabel(9);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080");
      expect(actual).assertEqual("1440*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResLabel_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0011
     * @tc.name      Resolution_ResLabel_0011
     * @tc.desc      resolutionLabel(10) renders "1280*720".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0011 begin`);
      logInfo("resolutionLabel(10)");
      const actual: string = resolutionLabel(10);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720");
      expect(actual).assertEqual("1280*720");
      logInfo(`${BUNDLE}ResLabel_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0012
     * @tc.name      Resolution_ResLabel_0012
     * @tc.desc      resolutionLabel(11) renders "1088*1088".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResLabel_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResLabel_0012 begin`);
      logInfo("resolutionLabel(11)");
      const actual: string = resolutionLabel(11);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088");
      expect(actual).assertEqual("1088*1088");
      logInfo(`${BUNDLE}ResLabel_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0013
     * @tc.name      Resolution_ResLabel_0013
     * @tc.desc      resolutionLabel(12) renders "1080*1080".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0013 begin`);
      logInfo("resolutionLabel(12)");
      const actual: string = resolutionLabel(12);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080");
      expect(actual).assertEqual("1080*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResLabel_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0014
     * @tc.name      Resolution_ResLabel_0014
     * @tc.desc      resolutionLabel(13) renders "720*720".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0014 begin`);
      logInfo("resolutionLabel(13)");
      const actual: string = resolutionLabel(13);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720");
      expect(actual).assertEqual("720*720");
      logInfo(`${BUNDLE}ResLabel_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0015
     * @tc.name      Resolution_ResLabel_0015
     * @tc.desc      resolutionLabel(14) renders "640*480".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0015 begin`);
      logInfo("resolutionLabel(14)");
      const actual: string = resolutionLabel(14);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480");
      expect(actual).assertEqual("640*480");
      logInfo(`${BUNDLE}ResLabel_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0016
     * @tc.name      Resolution_ResLabel_0016
     * @tc.desc      resolutionLabel(15) renders "480*480".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0016 begin`);
      logInfo("resolutionLabel(15)");
      const actual: string = resolutionLabel(15);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480");
      expect(actual).assertEqual("480*480");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResLabel_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0017
     * @tc.name      Resolution_ResLabel_0017
     * @tc.desc      resolutionLabel(16) renders "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0017 begin`);
      logInfo("resolutionLabel(16)");
      const actual: string = resolutionLabel(16);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}ResLabel_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0018
     * @tc.name      Resolution_ResLabel_0018
     * @tc.desc      resolutionLabel(17) renders "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ResLabel_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResLabel_0018 begin`);
      logInfo("resolutionLabel(17)");
      const actual: string = resolutionLabel(17);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}ResLabel_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0019
     * @tc.name      Resolution_ResLabel_0019
     * @tc.desc      resolutionLabel(-1) renders "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0019 begin`);
      logInfo("resolutionLabel(-1)");
      const actual: string = resolutionLabel(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ResLabel_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0020
     * @tc.name      Resolution_ResLabel_0020
     * @tc.desc      resolutionLabel(-2) renders "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0020 begin`);
      logInfo("resolutionLabel(-2)");
      const actual: string = resolutionLabel(-2);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}ResLabel_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0021
     * @tc.name      Resolution_ResLabel_0021
     * @tc.desc      resolutionLabel(20) renders "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResLabel_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResLabel_0021 begin`);
      logInfo("resolutionLabel(20)");
      const actual: string = resolutionLabel(20);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}ResLabel_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_LABEL_0022
     * @tc.name      Resolution_ResLabel_0022
     * @tc.desc      resolutionLabel(30) renders "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
