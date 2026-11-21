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
  resolutionCount,
  defaultResolutionIndex,
  resolutionLabel,
  resolutionRatio,
  findResolutionIndex,
  DEFAULT_RESOLUTION_INDEX,
  RESOLUTION_COUNT,
} from '../model/ResolutionLogic';

/** ResolutionTableCoreTest logic checks (46 cases). */
export default function resolutionTableCoreTest(): void {
  describe('ResolutionTableCoreTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0001
     * @tc.name      Resolution_TableCore_0001
     * @tc.desc      label(0) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_TableCore_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TableCore_0001 begin`);
      logInfo("label(0)");
      const actual: string = resolutionLabel(0);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*3072");
      expect(actual).assertEqual("4096*3072");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0002
     * @tc.name      Resolution_TableCore_0002
     * @tc.desc      label(1) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0002 begin`);
      logInfo("label(1)");
      const actual: string = resolutionLabel(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096*2304");
      expect(actual).assertEqual("4096*2304");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0003
     * @tc.name      Resolution_TableCore_0003
     * @tc.desc      label(2) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0003 begin`);
      logInfo("label(2)");
      const actual: string = resolutionLabel(2);
      logInfo('actual=' + String(actual) + ', expected=' + "3840*2160");
      expect(actual).assertEqual("3840*2160");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0004
     * @tc.name      Resolution_TableCore_0004
     * @tc.desc      label(3) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0004 begin`);
      logInfo("label(3)");
      const actual: string = resolutionLabel(3);
      logInfo('actual=' + String(actual) + ', expected=' + "2880*2160");
      expect(actual).assertEqual("2880*2160");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0005
     * @tc.name      Resolution_TableCore_0005
     * @tc.desc      label(4) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0005 begin`);
      logInfo("label(4)");
      const actual: string = resolutionLabel(4);
      logInfo('actual=' + String(actual) + ', expected=' + "2560*1440");
      expect(actual).assertEqual("2560*1440");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0006
     * @tc.name      Resolution_TableCore_0006
     * @tc.desc      label(5) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0006 begin`);
      logInfo("label(5)");
      const actual: string = resolutionLabel(5);
      logInfo('actual=' + String(actual) + ', expected=' + "2408*1080");
      expect(actual).assertEqual("2408*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0007
     * @tc.name      Resolution_TableCore_0007
     * @tc.desc      label(6) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0007 begin`);
      logInfo("label(6)");
      const actual: string = resolutionLabel(6);
      logInfo('actual=' + String(actual) + ', expected=' + "2384*1080");
      expect(actual).assertEqual("2384*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0008
     * @tc.name      Resolution_TableCore_0008
     * @tc.desc      label(7) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0008 begin`);
      logInfo("label(7)");
      const actual: string = resolutionLabel(7);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1440");
      expect(actual).assertEqual("1920*1440");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0009
     * @tc.name      Resolution_TableCore_0009
     * @tc.desc      label(8) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0009 begin`);
      logInfo("label(8)");
      const actual: string = resolutionLabel(8);
      logInfo('actual=' + String(actual) + ', expected=' + "1920*1080");
      expect(actual).assertEqual("1920*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0010
     * @tc.name      Resolution_TableCore_0010
     * @tc.desc      label(9) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0010 begin`);
      logInfo("label(9)");
      const actual: string = resolutionLabel(9);
      logInfo('actual=' + String(actual) + ', expected=' + "1440*1080");
      expect(actual).assertEqual("1440*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0011
     * @tc.name      Resolution_TableCore_0011
     * @tc.desc      label(10) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0011 begin`);
      logInfo("label(10)");
      const actual: string = resolutionLabel(10);
      logInfo('actual=' + String(actual) + ', expected=' + "1280*720");
      expect(actual).assertEqual("1280*720");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0012
     * @tc.name      Resolution_TableCore_0012
     * @tc.desc      label(11) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_TableCore_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TableCore_0012 begin`);
      logInfo("label(11)");
      const actual: string = resolutionLabel(11);
      logInfo('actual=' + String(actual) + ', expected=' + "1088*1088");
      expect(actual).assertEqual("1088*1088");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0013
     * @tc.name      Resolution_TableCore_0013
     * @tc.desc      label(12) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0013 begin`);
      logInfo("label(12)");
      const actual: string = resolutionLabel(12);
      logInfo('actual=' + String(actual) + ', expected=' + "1080*1080");
      expect(actual).assertEqual("1080*1080");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0014
     * @tc.name      Resolution_TableCore_0014
     * @tc.desc      label(13) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0014 begin`);
      logInfo("label(13)");
      const actual: string = resolutionLabel(13);
      logInfo('actual=' + String(actual) + ', expected=' + "720*720");
      expect(actual).assertEqual("720*720");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0015
     * @tc.name      Resolution_TableCore_0015
     * @tc.desc      label(14) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0015 begin`);
      logInfo("label(14)");
      const actual: string = resolutionLabel(14);
      logInfo('actual=' + String(actual) + ', expected=' + "640*480");
      expect(actual).assertEqual("640*480");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0016
     * @tc.name      Resolution_TableCore_0016
     * @tc.desc      label(15) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0016 begin`);
      logInfo("label(15)");
      const actual: string = resolutionLabel(15);
      logInfo('actual=' + String(actual) + ', expected=' + "480*480");
      expect(actual).assertEqual("480*480");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TableCore_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0017
     * @tc.name      Resolution_TableCore_0017
     * @tc.desc      ratio(0) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0017 begin`);
      logInfo("ratio(0)");
      const actual: number = resolutionRatio(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1.333333");
      expect(actual).assertEqual(1.333333);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0018
     * @tc.name      Resolution_TableCore_0018
     * @tc.desc      ratio(1) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_TableCore_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TableCore_0018 begin`);
      logInfo("ratio(1)");
      const actual: number = resolutionRatio(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0019
     * @tc.name      Resolution_TableCore_0019
     * @tc.desc      ratio(2) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0019 begin`);
      logInfo("ratio(2)");
      const actual: number = resolutionRatio(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0020
     * @tc.name      Resolution_TableCore_0020
     * @tc.desc      ratio(3) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0020 begin`);
      logInfo("ratio(3)");
      const actual: number = resolutionRatio(3);
      logInfo('actual=' + String(actual) + ', expected=' + "1.333333");
      expect(actual).assertEqual(1.333333);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0021
     * @tc.name      Resolution_TableCore_0021
     * @tc.desc      ratio(4) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0021 begin`);
      logInfo("ratio(4)");
      const actual: number = resolutionRatio(4);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0022
     * @tc.name      Resolution_TableCore_0022
     * @tc.desc      ratio(5) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0022 begin`);
      logInfo("ratio(5)");
      const actual: number = resolutionRatio(5);
      logInfo('actual=' + String(actual) + ', expected=' + "2.22963");
      expect(actual).assertEqual(2.22963);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0023
     * @tc.name      Resolution_TableCore_0023
     * @tc.desc      ratio(6) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_TableCore_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TableCore_0023 begin`);
      logInfo("ratio(6)");
      const actual: number = resolutionRatio(6);
      logInfo('actual=' + String(actual) + ', expected=' + "2.207407");
      expect(actual).assertEqual(2.207407);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0024
     * @tc.name      Resolution_TableCore_0024
     * @tc.desc      ratio(7) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0024 begin`);
      logInfo("ratio(7)");
      const actual: number = resolutionRatio(7);
      logInfo('actual=' + String(actual) + ', expected=' + "1.333333");
      expect(actual).assertEqual(1.333333);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0025
     * @tc.name      Resolution_TableCore_0025
     * @tc.desc      ratio(8) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0025 begin`);
      logInfo("ratio(8)");
      const actual: number = resolutionRatio(8);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0026
     * @tc.name      Resolution_TableCore_0026
     * @tc.desc      ratio(9) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0026 begin`);
      logInfo("ratio(9)");
      const actual: number = resolutionRatio(9);
      logInfo('actual=' + String(actual) + ', expected=' + "1.333333");
      expect(actual).assertEqual(1.333333);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0027
     * @tc.name      Resolution_TableCore_0027
     * @tc.desc      ratio(10) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0027 begin`);
      logInfo("ratio(10)");
      const actual: number = resolutionRatio(10);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_TABLE_CORE_0028
     * @tc.name      Resolution_TableCore_0028
     * @tc.desc      ratio(11) keeps the resolution table contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_TableCore_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TableCore_0028 begin`);
      logInfo("ratio(11)");
      const actual: number = resolutionRatio(11);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}TableCore_0028 end`);
    });
