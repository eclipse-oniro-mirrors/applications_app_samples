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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../EventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { seekApplies } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for seekApplies (50 cases). */
export default function seekAppliesTest(): void {
  describe('SeekAppliesTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0001
     * @tc.name      NdkRawfile_SeekApplies_0001
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_SeekApplies_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SeekApplies_0001 begin`);
      const actual: boolean = seekApplies(0, -100, 0);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0002
     * @tc.name      NdkRawfile_SeekApplies_0002
     * @tc.desc      seekApplies(fileSize=0, offset=1, length=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_SeekApplies_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SeekApplies_0002 begin`);
      const actual: boolean = seekApplies(0, 1, 0);
      logInfo(`seekApplies(fileSize=0, offset=1, length=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0003
     * @tc.name      NdkRawfile_SeekApplies_0003
     * @tc.desc      seekApplies(fileSize=1, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0003 begin`);
      const actual: boolean = seekApplies(1, -100, 0);
      logInfo(`seekApplies(fileSize=1, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0004
     * @tc.name      NdkRawfile_SeekApplies_0004
     * @tc.desc      seekApplies(fileSize=2, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0004 begin`);
      const actual: boolean = seekApplies(2, -100, 0);
      logInfo(`seekApplies(fileSize=2, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0005
     * @tc.name      NdkRawfile_SeekApplies_0005
     * @tc.desc      seekApplies(fileSize=5, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0005 begin`);
      const actual: boolean = seekApplies(5, -100, 0);
      logInfo(`seekApplies(fileSize=5, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0006
     * @tc.name      NdkRawfile_SeekApplies_0006
     * @tc.desc      seekApplies(fileSize=10, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0006 begin`);
      const actual: boolean = seekApplies(10, -100, 0);
      logInfo(`seekApplies(fileSize=10, offset=-100, len...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0007
     * @tc.name      NdkRawfile_SeekApplies_0007
     * @tc.desc      seekApplies(fileSize=100, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0007 begin`);
      const actual: boolean = seekApplies(100, -100, 0);
      logInfo(`seekApplies(fileSize=100, offset=-100, le...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0008
     * @tc.name      NdkRawfile_SeekApplies_0008
     * @tc.desc      seekApplies(fileSize=-1, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0008 begin`);
      const actual: boolean = seekApplies(-1, -100, 0);
      logInfo(`seekApplies(fileSize=-1, offset=-100, len...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0009
     * @tc.name      NdkRawfile_SeekApplies_0009
     * @tc.desc      seekApplies(fileSize=3, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0009 begin`);
      const actual: boolean = seekApplies(3, -100, 0);
      logInfo(`seekApplies(fileSize=3, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0010
     * @tc.name      NdkRawfile_SeekApplies_0010
     * @tc.desc      seekApplies(fileSize=15, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0010 begin`);
      const actual: boolean = seekApplies(15, -100, 0);
      logInfo(`seekApplies(fileSize=15, offset=-100, len...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0011
     * @tc.name      NdkRawfile_SeekApplies_0011
     * @tc.desc      seekApplies(fileSize=20, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0011 begin`);
      const actual: boolean = seekApplies(20, -100, 0);
      logInfo(`seekApplies(fileSize=20, offset=-100, len...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0012
     * @tc.name      NdkRawfile_SeekApplies_0012
     * @tc.desc      seekApplies(fileSize=96, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0012 begin`);
      const actual: boolean = seekApplies(96, -100, 0);
      logInfo(`seekApplies(fileSize=96, offset=-100, len...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0013
     * @tc.name      NdkRawfile_SeekApplies_0013
     * @tc.desc      seekApplies(fileSize=165, offset=-100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0013 begin`);
      const actual: boolean = seekApplies(165, -100, 0);
      logInfo(`seekApplies(fileSize=165, offset=-100, le...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0014
     * @tc.name      NdkRawfile_SeekApplies_0014
     * @tc.desc      seekApplies(fileSize=0, offset=-1, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0014 begin`);
      const actual: boolean = seekApplies(0, -1, 0);
      logInfo(`seekApplies(fileSize=0, offset=-1, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0015
     * @tc.name      NdkRawfile_SeekApplies_0015
     * @tc.desc      seekApplies(fileSize=0, offset=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0015 begin`);
      const actual: boolean = seekApplies(0, 0, 0);
      logInfo(`seekApplies(fileSize=0, offset=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0016
     * @tc.name      NdkRawfile_SeekApplies_0016
     * @tc.desc      seekApplies(fileSize=0, offset=50, length=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0016 begin`);
      const actual: boolean = seekApplies(0, 50, 0);
      logInfo(`seekApplies(fileSize=0, offset=50, length=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0017
     * @tc.name      NdkRawfile_SeekApplies_0017
     * @tc.desc      seekApplies(fileSize=0, offset=100, length=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0017 begin`);
      const actual: boolean = seekApplies(0, 100, 0);
      logInfo(`seekApplies(fileSize=0, offset=100, lengt...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0018
     * @tc.name      NdkRawfile_SeekApplies_0018
     * @tc.desc      seekApplies(fileSize=0, offset=2, length=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0018 begin`);
      const actual: boolean = seekApplies(0, 2, 0);
      logInfo(`seekApplies(fileSize=0, offset=2, length=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0019
     * @tc.name      NdkRawfile_SeekApplies_0019
     * @tc.desc      seekApplies(fileSize=0, offset=3, length=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0019 begin`);
      const actual: boolean = seekApplies(0, 3, 0);
      logInfo(`seekApplies(fileSize=0, offset=3, length=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0020
     * @tc.name      NdkRawfile_SeekApplies_0020
     * @tc.desc      seekApplies(fileSize=0, offset=10, length=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0020 begin`);
      const actual: boolean = seekApplies(0, 10, 0);
      logInfo(`seekApplies(fileSize=0, offset=10, length=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0021
     * @tc.name      NdkRawfile_SeekApplies_0021
     * @tc.desc      seekApplies(fileSize=0, offset=5, length=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0021 begin`);
      const actual: boolean = seekApplies(0, 5, 0);
      logInfo(`seekApplies(fileSize=0, offset=5, length=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0022
     * @tc.name      NdkRawfile_SeekApplies_0022
     * @tc.desc      seekApplies(fileSize=0, offset=15, length=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0022 begin`);
      const actual: boolean = seekApplies(0, 15, 0);
      logInfo(`seekApplies(fileSize=0, offset=15, length=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0023
     * @tc.name      NdkRawfile_SeekApplies_0023
     * @tc.desc      seekApplies(fileSize=0, offset=-80, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0023 begin`);
      const actual: boolean = seekApplies(0, -80, 0);
      logInfo(`seekApplies(fileSize=0, offset=-80, lengt...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0024
     * @tc.name      NdkRawfile_SeekApplies_0024
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0024 begin`);
      const actual: boolean = seekApplies(0, -100, 1);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0025
     * @tc.name      NdkRawfile_SeekApplies_0025
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0025 begin`);
      const actual: boolean = seekApplies(0, -100, 2);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0026
     * @tc.name      NdkRawfile_SeekApplies_0026
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0026 begin`);
      const actual: boolean = seekApplies(0, -100, 5);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0027
     * @tc.name      NdkRawfile_SeekApplies_0027
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0027 begin`);
      const actual: boolean = seekApplies(0, -100, 10);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0028
     * @tc.name      NdkRawfile_SeekApplies_0028
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0028 begin`);
      const actual: boolean = seekApplies(0, -100, 100);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0029
     * @tc.name      NdkRawfile_SeekApplies_0029
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0029 begin`);
      const actual: boolean = seekApplies(0, -100, -1);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0030
     * @tc.name      NdkRawfile_SeekApplies_0030
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0030 begin`);
      const actual: boolean = seekApplies(0, -100, 3);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0031
     * @tc.name      NdkRawfile_SeekApplies_0031
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0031 begin`);
      const actual: boolean = seekApplies(0, -100, 15);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0032
     * @tc.name      NdkRawfile_SeekApplies_0032
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=20) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0032 begin`);
      const actual: boolean = seekApplies(0, -100, 20);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0033
     * @tc.name      NdkRawfile_SeekApplies_0033
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=191) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0033 begin`);
      const actual: boolean = seekApplies(0, -100, 191);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0034
     * @tc.name      NdkRawfile_SeekApplies_0034
     * @tc.desc      seekApplies(fileSize=0, offset=-100, length=-58) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0034 begin`);
      const actual: boolean = seekApplies(0, -100, -58);
      logInfo(`seekApplies(fileSize=0, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0035
     * @tc.name      NdkRawfile_SeekApplies_0035
     * @tc.desc      seekApplies(fileSize=20, offset=50, length=191) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0035 begin`);
      const actual: boolean = seekApplies(20, 50, 191);
      logInfo(`seekApplies(fileSize=20, offset=50, lengt...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0036
     * @tc.name      NdkRawfile_SeekApplies_0036
     * @tc.desc      seekApplies(fileSize=100, offset=-1, length=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0036 begin`);
      const actual: boolean = seekApplies(100, -1, 5);
      logInfo(`seekApplies(fileSize=100, offset=-1, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0037
     * @tc.name      NdkRawfile_SeekApplies_0037
     * @tc.desc      seekApplies(fileSize=96, offset=0, length=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0037 begin`);
      const actual: boolean = seekApplies(96, 0, 10);
      logInfo(`seekApplies(fileSize=96, offset=0, length...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0038
     * @tc.name      NdkRawfile_SeekApplies_0038
     * @tc.desc      seekApplies(fileSize=5, offset=0, length=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0038 begin`);
      const actual: boolean = seekApplies(5, 0, 2);
      logInfo(`seekApplies(fileSize=5, offset=0, length=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0039
     * @tc.name      NdkRawfile_SeekApplies_0039
     * @tc.desc      seekApplies(fileSize=0, offset=10, length=-58) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0039 begin`);
      const actual: boolean = seekApplies(0, 10, -58);
      logInfo(`seekApplies(fileSize=0, offset=10, length...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0040
     * @tc.name      NdkRawfile_SeekApplies_0040
     * @tc.desc      seekApplies(fileSize=3, offset=1, length=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0040 begin`);
      const actual: boolean = seekApplies(3, 1, 20);
      logInfo(`seekApplies(fileSize=3, offset=1, length=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0041
     * @tc.name      NdkRawfile_SeekApplies_0041
     * @tc.desc      seekApplies(fileSize=100, offset=15, length=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0041 begin`);
      const actual: boolean = seekApplies(100, 15, 3);
      logInfo(`seekApplies(fileSize=100, offset=15, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0042
     * @tc.name      NdkRawfile_SeekApplies_0042
     * @tc.desc      seekApplies(fileSize=1, offset=-100, length=191) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0042 begin`);
      const actual: boolean = seekApplies(1, -100, 191);
      logInfo(`seekApplies(fileSize=1, offset=-100, leng...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0043
     * @tc.name      NdkRawfile_SeekApplies_0043
     * @tc.desc      seekApplies(fileSize=3, offset=0, length=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0043 begin`);
      const actual: boolean = seekApplies(3, 0, 15);
      logInfo(`seekApplies(fileSize=3, offset=0, length=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0044
     * @tc.name      NdkRawfile_SeekApplies_0044
     * @tc.desc      seekApplies(fileSize=20, offset=0, length=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0044 begin`);
      const actual: boolean = seekApplies(20, 0, 5);
      logInfo(`seekApplies(fileSize=20, offset=0, length=5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0045
     * @tc.name      NdkRawfile_SeekApplies_0045
     * @tc.desc      seekApplies(fileSize=20, offset=-80, length=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0045 begin`);
      const actual: boolean = seekApplies(20, -80, 5);
      logInfo(`seekApplies(fileSize=20, offset=-80, leng...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0046
     * @tc.name      NdkRawfile_SeekApplies_0046
     * @tc.desc      seekApplies(fileSize=10, offset=5, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0046 begin`);
      const actual: boolean = seekApplies(10, 5, 0);
      logInfo(`seekApplies(fileSize=10, offset=5, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0047
     * @tc.name      NdkRawfile_SeekApplies_0047
     * @tc.desc      seekApplies(fileSize=10, offset=1, length=-58) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0047 begin`);
      const actual: boolean = seekApplies(10, 1, -58);
      logInfo(`seekApplies(fileSize=10, offset=1, length...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0048
     * @tc.name      NdkRawfile_SeekApplies_0048
     * @tc.desc      seekApplies(fileSize=96, offset=-100, length=-58) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_SeekApplies_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SeekApplies_0048 begin`);
      const actual: boolean = seekApplies(96, -100, -58);
      logInfo(`seekApplies(fileSize=96, offset=-100, len...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0049
     * @tc.name      NdkRawfile_SeekApplies_0049
     * @tc.desc      seekApplies(fileSize=100, offset=3, length=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0049 begin`);
      const actual: boolean = seekApplies(100, 3, 1);
      logInfo(`seekApplies(fileSize=100, offset=3, lengt...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeekApplies_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_SEEK_APPLIES_0050
     * @tc.name      NdkRawfile_SeekApplies_0050
     * @tc.desc      seekApplies(fileSize=0, offset=0, length=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_SeekApplies_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SeekApplies_0050 begin`);
      const actual: boolean = seekApplies(0, 0, 100);
      logInfo(`seekApplies(fileSize=0, offset=0, length=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeekApplies_0050 end`);
    });
  });
}
