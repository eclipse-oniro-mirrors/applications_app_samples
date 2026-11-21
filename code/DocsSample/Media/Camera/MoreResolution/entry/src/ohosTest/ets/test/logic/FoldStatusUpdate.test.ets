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
  shouldUpdateFoldStatus,
} from '../model/ResolutionLogic';

/** FoldStatusUpdateTest logic checks (45 cases). */
export default function foldStatusUpdateTest(): void {
  describe('FoldStatusUpdateTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0001
     * @tc.name      Resolution_FoldUpdate_0001
     * @tc.desc      shouldUpdateFoldStatus(0) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FoldUpdate_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldUpdate_0001 begin`);
      logInfo("shouldUpdateFoldStatus(0)");
      const actual: boolean = shouldUpdateFoldStatus(0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0002
     * @tc.name      Resolution_FoldUpdate_0002
     * @tc.desc      shouldUpdateFoldStatus(1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0002 begin`);
      logInfo("shouldUpdateFoldStatus(1)");
      const actual: boolean = shouldUpdateFoldStatus(1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FoldUpdate_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0003
     * @tc.name      Resolution_FoldUpdate_0003
     * @tc.desc      shouldUpdateFoldStatus(2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0003 begin`);
      logInfo("shouldUpdateFoldStatus(2)");
      const actual: boolean = shouldUpdateFoldStatus(2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}FoldUpdate_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0004
     * @tc.name      Resolution_FoldUpdate_0004
     * @tc.desc      shouldUpdateFoldStatus(3) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0004 begin`);
      logInfo("shouldUpdateFoldStatus(3)");
      const actual: boolean = shouldUpdateFoldStatus(3);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0005
     * @tc.name      Resolution_FoldUpdate_0005
     * @tc.desc      shouldUpdateFoldStatus(4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0005 begin`);
      logInfo("shouldUpdateFoldStatus(4)");
      const actual: boolean = shouldUpdateFoldStatus(4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0006
     * @tc.name      Resolution_FoldUpdate_0006
     * @tc.desc      shouldUpdateFoldStatus(5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0006 begin`);
      logInfo("shouldUpdateFoldStatus(5)");
      const actual: boolean = shouldUpdateFoldStatus(5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0007
     * @tc.name      Resolution_FoldUpdate_0007
     * @tc.desc      shouldUpdateFoldStatus(6) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0007 begin`);
      logInfo("shouldUpdateFoldStatus(6)");
      const actual: boolean = shouldUpdateFoldStatus(6);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0008
     * @tc.name      Resolution_FoldUpdate_0008
     * @tc.desc      shouldUpdateFoldStatus(7) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0008 begin`);
      logInfo("shouldUpdateFoldStatus(7)");
      const actual: boolean = shouldUpdateFoldStatus(7);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0009
     * @tc.name      Resolution_FoldUpdate_0009
     * @tc.desc      shouldUpdateFoldStatus(8) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0009 begin`);
      logInfo("shouldUpdateFoldStatus(8)");
      const actual: boolean = shouldUpdateFoldStatus(8);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0010
     * @tc.name      Resolution_FoldUpdate_0010
     * @tc.desc      shouldUpdateFoldStatus(9) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0010 begin`);
      logInfo("shouldUpdateFoldStatus(9)");
      const actual: boolean = shouldUpdateFoldStatus(9);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0011
     * @tc.name      Resolution_FoldUpdate_0011
     * @tc.desc      shouldUpdateFoldStatus(10) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0011 begin`);
      logInfo("shouldUpdateFoldStatus(10)");
      const actual: boolean = shouldUpdateFoldStatus(10);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0012
     * @tc.name      Resolution_FoldUpdate_0012
     * @tc.desc      shouldUpdateFoldStatus(-1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FoldUpdate_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldUpdate_0012 begin`);
      logInfo("shouldUpdateFoldStatus(-1)");
      const actual: boolean = shouldUpdateFoldStatus(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0013
     * @tc.name      Resolution_FoldUpdate_0013
     * @tc.desc      shouldUpdateFoldStatus(20) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0013 begin`);
      logInfo("shouldUpdateFoldStatus(20)");
      const actual: boolean = shouldUpdateFoldStatus(20);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0014
     * @tc.name      Resolution_FoldUpdate_0014
     * @tc.desc      shouldUpdateFoldStatus(30) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0014 begin`);
      logInfo("shouldUpdateFoldStatus(30)");
      const actual: boolean = shouldUpdateFoldStatus(30);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0015
     * @tc.name      Resolution_FoldUpdate_0015
     * @tc.desc      shouldUpdateFoldStatus(40) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0015 begin`);
      logInfo("shouldUpdateFoldStatus(40)");
      const actual: boolean = shouldUpdateFoldStatus(40);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0016
     * @tc.name      Resolution_FoldUpdate_0016
     * @tc.desc      shouldUpdateFoldStatus(50) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0016 begin`);
      logInfo("shouldUpdateFoldStatus(50)");
      const actual: boolean = shouldUpdateFoldStatus(50);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0017
     * @tc.name      Resolution_FoldUpdate_0017
     * @tc.desc      shouldUpdateFoldStatus(60) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0017 begin`);
      logInfo("shouldUpdateFoldStatus(60)");
      const actual: boolean = shouldUpdateFoldStatus(60);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0018
     * @tc.name      Resolution_FoldUpdate_0018
     * @tc.desc      shouldUpdateFoldStatus(70) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_FoldUpdate_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldUpdate_0018 begin`);
      logInfo("shouldUpdateFoldStatus(70)");
      const actual: boolean = shouldUpdateFoldStatus(70);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0019
     * @tc.name      Resolution_FoldUpdate_0019
     * @tc.desc      shouldUpdateFoldStatus(80) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0019 begin`);
      logInfo("shouldUpdateFoldStatus(80)");
      const actual: boolean = shouldUpdateFoldStatus(80);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0020
     * @tc.name      Resolution_FoldUpdate_0020
     * @tc.desc      shouldUpdateFoldStatus(90) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0020 begin`);
      logInfo("shouldUpdateFoldStatus(90)");
      const actual: boolean = shouldUpdateFoldStatus(90);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0021
     * @tc.name      Resolution_FoldUpdate_0021
     * @tc.desc      shouldUpdateFoldStatus(100) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0021 begin`);
      logInfo("shouldUpdateFoldStatus(100)");
      const actual: boolean = shouldUpdateFoldStatus(100);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0022
     * @tc.name      Resolution_FoldUpdate_0022
     * @tc.desc      shouldUpdateFoldStatus(200) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0022 begin`);
      logInfo("shouldUpdateFoldStatus(200)");
      const actual: boolean = shouldUpdateFoldStatus(200);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0023
     * @tc.name      Resolution_FoldUpdate_0023
     * @tc.desc      shouldUpdateFoldStatus(255) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FoldUpdate_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldUpdate_0023 begin`);
      logInfo("shouldUpdateFoldStatus(255)");
      const actual: boolean = shouldUpdateFoldStatus(255);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0024
     * @tc.name      Resolution_FoldUpdate_0024
     * @tc.desc      shouldUpdateFoldStatus(360) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0024 begin`);
      logInfo("shouldUpdateFoldStatus(360)");
      const actual: boolean = shouldUpdateFoldStatus(360);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0025
     * @tc.name      Resolution_FoldUpdate_0025
     * @tc.desc      shouldUpdateFoldStatus(720) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0025 begin`);
      logInfo("shouldUpdateFoldStatus(720)");
      const actual: boolean = shouldUpdateFoldStatus(720);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0026
     * @tc.name      Resolution_FoldUpdate_0026
     * @tc.desc      shouldUpdateFoldStatus(1080) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0026 begin`);
      logInfo("shouldUpdateFoldStatus(1080)");
      const actual: boolean = shouldUpdateFoldStatus(1080);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0027
     * @tc.name      Resolution_FoldUpdate_0027
     * @tc.desc      shouldUpdateFoldStatus(1280) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0027 begin`);
      logInfo("shouldUpdateFoldStatus(1280)");
      const actual: boolean = shouldUpdateFoldStatus(1280);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0028
     * @tc.name      Resolution_FoldUpdate_0028
     * @tc.desc      shouldUpdateFoldStatus(1920) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0028 begin`);
      logInfo("shouldUpdateFoldStatus(1920)");
      const actual: boolean = shouldUpdateFoldStatus(1920);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0029
     * @tc.name      Resolution_FoldUpdate_0029
     * @tc.desc      shouldUpdateFoldStatus(3840) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0029 begin`);
      logInfo("shouldUpdateFoldStatus(3840)");
      const actual: boolean = shouldUpdateFoldStatus(3840);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0030
     * @tc.name      Resolution_FoldUpdate_0030
     * @tc.desc      shouldUpdateFoldStatus(4096) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0030 begin`);
      logInfo("shouldUpdateFoldStatus(4096)");
      const actual: boolean = shouldUpdateFoldStatus(4096);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0031
     * @tc.name      Resolution_FoldUpdate_0031
     * @tc.desc      shouldUpdateFoldStatus(999) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0031 begin`);
      logInfo("shouldUpdateFoldStatus(999)");
      const actual: boolean = shouldUpdateFoldStatus(999);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0032
     * @tc.name      Resolution_FoldUpdate_0032
     * @tc.desc      shouldUpdateFoldStatus(1000) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0032 begin`);
      logInfo("shouldUpdateFoldStatus(1000)");
      const actual: boolean = shouldUpdateFoldStatus(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0033
     * @tc.name      Resolution_FoldUpdate_0033
     * @tc.desc      shouldUpdateFoldStatus(12) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0033 begin`);
      logInfo("shouldUpdateFoldStatus(12)");
      const actual: boolean = shouldUpdateFoldStatus(12);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0034
     * @tc.name      Resolution_FoldUpdate_0034
     * @tc.desc      shouldUpdateFoldStatus(14) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FoldUpdate_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldUpdate_0034 begin`);
      logInfo("shouldUpdateFoldStatus(14)");
      const actual: boolean = shouldUpdateFoldStatus(14);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0035
     * @tc.name      Resolution_FoldUpdate_0035
     * @tc.desc      shouldUpdateFoldStatus(24) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_FoldUpdate_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldUpdate_0035 begin`);
      logInfo("shouldUpdateFoldStatus(24)");
      const actual: boolean = shouldUpdateFoldStatus(24);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0036
     * @tc.name      Resolution_FoldUpdate_0036
     * @tc.desc      shouldUpdateFoldStatus(25) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0036 begin`);
      logInfo("shouldUpdateFoldStatus(25)");
      const actual: boolean = shouldUpdateFoldStatus(25);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0037
     * @tc.name      Resolution_FoldUpdate_0037
     * @tc.desc      shouldUpdateFoldStatus(28) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0037 begin`);
      logInfo("shouldUpdateFoldStatus(28)");
      const actual: boolean = shouldUpdateFoldStatus(28);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0038
     * @tc.name      Resolution_FoldUpdate_0038
     * @tc.desc      shouldUpdateFoldStatus(17) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0038 begin`);
      logInfo("shouldUpdateFoldStatus(17)");
      const actual: boolean = shouldUpdateFoldStatus(17);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0039
     * @tc.name      Resolution_FoldUpdate_0039
     * @tc.desc      shouldUpdateFoldStatus(19) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0039 begin`);
      logInfo("shouldUpdateFoldStatus(19)");
      const actual: boolean = shouldUpdateFoldStatus(19);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0040
     * @tc.name      Resolution_FoldUpdate_0040
     * @tc.desc      shouldUpdateFoldStatus(21) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0040 begin`);
      logInfo("shouldUpdateFoldStatus(21)");
      const actual: boolean = shouldUpdateFoldStatus(21);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0041
     * @tc.name      Resolution_FoldUpdate_0041
     * @tc.desc      shouldUpdateFoldStatus(22) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0041 begin`);
      logInfo("shouldUpdateFoldStatus(22)");
      const actual: boolean = shouldUpdateFoldStatus(22);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0042
     * @tc.name      Resolution_FoldUpdate_0042
     * @tc.desc      shouldUpdateFoldStatus(23) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0042 begin`);
      logInfo("shouldUpdateFoldStatus(23)");
      const actual: boolean = shouldUpdateFoldStatus(23);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0043
     * @tc.name      Resolution_FoldUpdate_0043
     * @tc.desc      shouldUpdateFoldStatus(26) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0043 begin`);
      logInfo("shouldUpdateFoldStatus(26)");
      const actual: boolean = shouldUpdateFoldStatus(26);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}FoldUpdate_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0044
     * @tc.name      Resolution_FoldUpdate_0044
     * @tc.desc      shouldUpdateFoldStatus(27) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldUpdate_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldUpdate_0044 begin`);
      logInfo("shouldUpdateFoldStatus(27)");
      const actual: boolean = shouldUpdateFoldStatus(27);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_UPDATE_0045
     * @tc.name      Resolution_FoldUpdate_0045
     * @tc.desc      shouldUpdateFoldStatus(29) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FoldUpdate_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldUpdate_0045 begin`);
      logInfo("shouldUpdateFoldStatus(29)");
      const actual: boolean = shouldUpdateFoldStatus(29);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}FoldUpdate_0045 end`);
    });
  });
}
