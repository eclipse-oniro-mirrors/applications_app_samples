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
import { descriptorLabelOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for descriptorLabelOf (96 cases). */
export default function descriptorLabelOfTest(): void {
  describe('DescriptorLabelOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0001
     * @tc.name      NdkRawfile_DescriptorLabelOf_0001
     * @tc.desc      descriptorLabelOf(field="64", value=0, is64=true) returns "rawfile.txt fd.6464: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_DescriptorLabelOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0001 begin`);
      const actual: string = descriptorLabelOf('64', 0, true);
      logInfo(`descriptorLabelOf(field="64", value=0, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0002
     * @tc.name      NdkRawfile_DescriptorLabelOf_0002
     * @tc.desc      descriptorLabelOf(field="64", value=0, is64=false) returns "rawfile.txt fd.64: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_DescriptorLabelOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0002 begin`);
      const actual: string = descriptorLabelOf('64', 0, false);
      logInfo(`descriptorLabelOf(field="64", value=0, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0003
     * @tc.name      NdkRawfile_DescriptorLabelOf_0003
     * @tc.desc      descriptorLabelOf(field="64", value=1, is64=true) returns "rawfile.txt fd.6464: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0003 begin`);
      const actual: string = descriptorLabelOf('64', 1, true);
      logInfo(`descriptorLabelOf(field="64", value=1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0004
     * @tc.name      NdkRawfile_DescriptorLabelOf_0004
     * @tc.desc      descriptorLabelOf(field="64", value=1, is64=false) returns "rawfile.txt fd.64: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0004 begin`);
      const actual: string = descriptorLabelOf('64', 1, false);
      logInfo(`descriptorLabelOf(field="64", value=1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0005
     * @tc.name      NdkRawfile_DescriptorLabelOf_0005
     * @tc.desc      descriptorLabelOf(field="64", value=-1, is64=true) returns "rawfile.txt fd.6464: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0005 begin`);
      const actual: string = descriptorLabelOf('64', -1, true);
      logInfo(`descriptorLabelOf(field="64", value=-1, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0006
     * @tc.name      NdkRawfile_DescriptorLabelOf_0006
     * @tc.desc      descriptorLabelOf(field="64", value=-1, is64=false) returns "rawfile.txt fd.64: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0006 begin`);
      const actual: string = descriptorLabelOf('64', -1, false);
      logInfo(`descriptorLabelOf(field="64", value=-1, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0007
     * @tc.name      NdkRawfile_DescriptorLabelOf_0007
     * @tc.desc      descriptorLabelOf(field="64", value=2, is64=true) returns "rawfile.txt fd.6464: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0007 begin`);
      const actual: string = descriptorLabelOf('64', 2, true);
      logInfo(`descriptorLabelOf(field="64", value=2, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0008
     * @tc.name      NdkRawfile_DescriptorLabelOf_0008
     * @tc.desc      descriptorLabelOf(field="64", value=2, is64=false) returns "rawfile.txt fd.64: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0008 begin`);
      const actual: string = descriptorLabelOf('64', 2, false);
      logInfo(`descriptorLabelOf(field="64", value=2, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0009
     * @tc.name      NdkRawfile_DescriptorLabelOf_0009
     * @tc.desc      descriptorLabelOf(field="64", value=3, is64=true) returns "rawfile.txt fd.6464: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0009 begin`);
      const actual: string = descriptorLabelOf('64', 3, true);
      logInfo(`descriptorLabelOf(field="64", value=3, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0010
     * @tc.name      NdkRawfile_DescriptorLabelOf_0010
     * @tc.desc      descriptorLabelOf(field="64", value=3, is64=false) returns "rawfile.txt fd.64: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0010 begin`);
      const actual: string = descriptorLabelOf('64', 3, false);
      logInfo(`descriptorLabelOf(field="64", value=3, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0011
     * @tc.name      NdkRawfile_DescriptorLabelOf_0011
     * @tc.desc      descriptorLabelOf(field="64", value=10, is64=true) returns "rawfile.txt fd.6464: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0011 begin`);
      const actual: string = descriptorLabelOf('64', 10, true);
      logInfo(`descriptorLabelOf(field="64", value=10, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0012
     * @tc.name      NdkRawfile_DescriptorLabelOf_0012
     * @tc.desc      descriptorLabelOf(field="64", value=10, is64=false) returns "rawfile.txt fd.64: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0012 begin`);
      const actual: string = descriptorLabelOf('64', 10, false);
      logInfo(`descriptorLabelOf(field="64", value=10, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0013
     * @tc.name      NdkRawfile_DescriptorLabelOf_0013
     * @tc.desc      descriptorLabelOf(field="64", value=100, is64=true) returns "rawfile.txt fd.6464: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0013 begin`);
      const actual: string = descriptorLabelOf('64', 100, true);
      logInfo(`descriptorLabelOf(field="64", value=100, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0014
     * @tc.name      NdkRawfile_DescriptorLabelOf_0014
     * @tc.desc      descriptorLabelOf(field="64", value=100, is64=false) returns "rawfile.txt fd.64: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0014 begin`);
      const actual: string = descriptorLabelOf('64', 100, false);
      logInfo(`descriptorLabelOf(field="64", value=100, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0015
     * @tc.name      NdkRawfile_DescriptorLabelOf_0015
     * @tc.desc      descriptorLabelOf(field="64", value=5, is64=true) returns "rawfile.txt fd.6464: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0015 begin`);
      const actual: string = descriptorLabelOf('64', 5, true);
      logInfo(`descriptorLabelOf(field="64", value=5, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0016
     * @tc.name      NdkRawfile_DescriptorLabelOf_0016
     * @tc.desc      descriptorLabelOf(field="64", value=5, is64=false) returns "rawfile.txt fd.64: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0016 begin`);
      const actual: string = descriptorLabelOf('64', 5, false);
      logInfo(`descriptorLabelOf(field="64", value=5, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0017
     * @tc.name      NdkRawfile_DescriptorLabelOf_0017
     * @tc.desc      descriptorLabelOf(field="64", value=15, is64=true) returns "rawfile.txt fd.6464: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0017 begin`);
      const actual: string = descriptorLabelOf('64', 15, true);
      logInfo(`descriptorLabelOf(field="64", value=15, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0018
     * @tc.name      NdkRawfile_DescriptorLabelOf_0018
     * @tc.desc      descriptorLabelOf(field="64", value=15, is64=false) returns "rawfile.txt fd.64: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0018 begin`);
      const actual: string = descriptorLabelOf('64', 15, false);
      logInfo(`descriptorLabelOf(field="64", value=15, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0019
     * @tc.name      NdkRawfile_DescriptorLabelOf_0019
     * @tc.desc      descriptorLabelOf(field="64", value=20, is64=true) returns "rawfile.txt fd.6464: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0019 begin`);
      const actual: string = descriptorLabelOf('64', 20, true);
      logInfo(`descriptorLabelOf(field="64", value=20, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0020
     * @tc.name      NdkRawfile_DescriptorLabelOf_0020
     * @tc.desc      descriptorLabelOf(field="64", value=20, is64=false) returns "rawfile.txt fd.64: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0020 begin`);
      const actual: string = descriptorLabelOf('64', 20, false);
      logInfo(`descriptorLabelOf(field="64", value=20, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0021
     * @tc.name      NdkRawfile_DescriptorLabelOf_0021
     * @tc.desc      descriptorLabelOf(field="64", value=25, is64=true) returns "rawfile.txt fd.6464: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0021 begin`);
      const actual: string = descriptorLabelOf('64', 25, true);
      logInfo(`descriptorLabelOf(field="64", value=25, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0022
     * @tc.name      NdkRawfile_DescriptorLabelOf_0022
     * @tc.desc      descriptorLabelOf(field="64", value=25, is64=false) returns "rawfile.txt fd.64: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0022 begin`);
      const actual: string = descriptorLabelOf('64', 25, false);
      logInfo(`descriptorLabelOf(field="64", value=25, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0023
     * @tc.name      NdkRawfile_DescriptorLabelOf_0023
     * @tc.desc      descriptorLabelOf(field="64", value=13.64, is64=true) returns "rawfile.txt fd.6464: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0023 begin`);
      const actual: string = descriptorLabelOf('64', 13.64, true);
      logInfo(`descriptorLabelOf(field="64", value=13.64...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6464: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0024
     * @tc.name      NdkRawfile_DescriptorLabelOf_0024
     * @tc.desc      descriptorLabelOf(field="64", value=13.64, is64=false) returns "rawfile.txt fd.64: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0024 begin`);
      const actual: string = descriptorLabelOf('64', 13.64, false);
      logInfo(`descriptorLabelOf(field="64", value=13.64...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0025
     * @tc.name      NdkRawfile_DescriptorLabelOf_0025
     * @tc.desc      descriptorLabelOf(field="", value=0, is64=false) returns "rawfile.txt fd.: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0025 begin`);
      const actual: string = descriptorLabelOf('', 0, false);
      logInfo(`descriptorLabelOf(field="", value=0, is64...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0026
     * @tc.name      NdkRawfile_DescriptorLabelOf_0026
     * @tc.desc      descriptorLabelOf(field="", value=1, is64=false) returns "rawfile.txt fd.: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0026 begin`);
      const actual: string = descriptorLabelOf('', 1, false);
      logInfo(`descriptorLabelOf(field="", value=1, is64...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0027
     * @tc.name      NdkRawfile_DescriptorLabelOf_0027
     * @tc.desc      descriptorLabelOf(field="", value=-1, is64=false) returns "rawfile.txt fd.: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0027 begin`);
      const actual: string = descriptorLabelOf('', -1, false);
      logInfo(`descriptorLabelOf(field="", value=-1, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0028
     * @tc.name      NdkRawfile_DescriptorLabelOf_0028
     * @tc.desc      descriptorLabelOf(field="", value=2, is64=false) returns "rawfile.txt fd.: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0028 begin`);
      const actual: string = descriptorLabelOf('', 2, false);
      logInfo(`descriptorLabelOf(field="", value=2, is64...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0029
     * @tc.name      NdkRawfile_DescriptorLabelOf_0029
     * @tc.desc      descriptorLabelOf(field="", value=3, is64=false) returns "rawfile.txt fd.: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0029 begin`);
      const actual: string = descriptorLabelOf('', 3, false);
      logInfo(`descriptorLabelOf(field="", value=3, is64...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0030
     * @tc.name      NdkRawfile_DescriptorLabelOf_0030
     * @tc.desc      descriptorLabelOf(field="", value=10, is64=false) returns "rawfile.txt fd.: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0030 begin`);
      const actual: string = descriptorLabelOf('', 10, false);
      logInfo(`descriptorLabelOf(field="", value=10, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0031
     * @tc.name      NdkRawfile_DescriptorLabelOf_0031
     * @tc.desc      descriptorLabelOf(field="", value=100, is64=false) returns "rawfile.txt fd.: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0031 begin`);
      const actual: string = descriptorLabelOf('', 100, false);
      logInfo(`descriptorLabelOf(field="", value=100, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0032
     * @tc.name      NdkRawfile_DescriptorLabelOf_0032
     * @tc.desc      descriptorLabelOf(field="", value=5, is64=false) returns "rawfile.txt fd.: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0032 begin`);
      const actual: string = descriptorLabelOf('', 5, false);
      logInfo(`descriptorLabelOf(field="", value=5, is64...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0033
     * @tc.name      NdkRawfile_DescriptorLabelOf_0033
     * @tc.desc      descriptorLabelOf(field="", value=15, is64=false) returns "rawfile.txt fd.: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0033 begin`);
      const actual: string = descriptorLabelOf('', 15, false);
      logInfo(`descriptorLabelOf(field="", value=15, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0034
     * @tc.name      NdkRawfile_DescriptorLabelOf_0034
     * @tc.desc      descriptorLabelOf(field="", value=20, is64=false) returns "rawfile.txt fd.: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0034 begin`);
      const actual: string = descriptorLabelOf('', 20, false);
      logInfo(`descriptorLabelOf(field="", value=20, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0035
     * @tc.name      NdkRawfile_DescriptorLabelOf_0035
     * @tc.desc      descriptorLabelOf(field="", value=25, is64=false) returns "rawfile.txt fd.: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0035 begin`);
      const actual: string = descriptorLabelOf('', 25, false);
      logInfo(`descriptorLabelOf(field="", value=25, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0036
     * @tc.name      NdkRawfile_DescriptorLabelOf_0036
     * @tc.desc      descriptorLabelOf(field="", value=13.64, is64=false) returns "rawfile.txt fd.: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0036 begin`);
      const actual: string = descriptorLabelOf('', 13.64, false);
      logInfo(`descriptorLabelOf(field="", value=13.64, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0037
     * @tc.name      NdkRawfile_DescriptorLabelOf_0037
     * @tc.desc      descriptorLabelOf(field="fd", value=0, is64=true) returns "rawfile.txt fd64: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0037 begin`);
      const actual: string = descriptorLabelOf('fd', 0, true);
      logInfo(`descriptorLabelOf(field="fd", value=0, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0038
     * @tc.name      NdkRawfile_DescriptorLabelOf_0038
     * @tc.desc      descriptorLabelOf(field="fd", value=0, is64=false) returns "rawfile.txt fd: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0038 begin`);
      const actual: string = descriptorLabelOf('fd', 0, false);
      logInfo(`descriptorLabelOf(field="fd", value=0, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0039
     * @tc.name      NdkRawfile_DescriptorLabelOf_0039
     * @tc.desc      descriptorLabelOf(field="fd", value=1, is64=true) returns "rawfile.txt fd64: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0039 begin`);
      const actual: string = descriptorLabelOf('fd', 1, true);
      logInfo(`descriptorLabelOf(field="fd", value=1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0040
     * @tc.name      NdkRawfile_DescriptorLabelOf_0040
     * @tc.desc      descriptorLabelOf(field="fd", value=1, is64=false) returns "rawfile.txt fd: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0040 begin`);
      const actual: string = descriptorLabelOf('fd', 1, false);
      logInfo(`descriptorLabelOf(field="fd", value=1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0041
     * @tc.name      NdkRawfile_DescriptorLabelOf_0041
     * @tc.desc      descriptorLabelOf(field="fd", value=-1, is64=true) returns "rawfile.txt fd64: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0041 begin`);
      const actual: string = descriptorLabelOf('fd', -1, true);
      logInfo(`descriptorLabelOf(field="fd", value=-1, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0042
     * @tc.name      NdkRawfile_DescriptorLabelOf_0042
     * @tc.desc      descriptorLabelOf(field="fd", value=-1, is64=false) returns "rawfile.txt fd: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0042 begin`);
      const actual: string = descriptorLabelOf('fd', -1, false);
      logInfo(`descriptorLabelOf(field="fd", value=-1, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0043
     * @tc.name      NdkRawfile_DescriptorLabelOf_0043
     * @tc.desc      descriptorLabelOf(field="fd", value=2, is64=true) returns "rawfile.txt fd64: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0043 begin`);
      const actual: string = descriptorLabelOf('fd', 2, true);
      logInfo(`descriptorLabelOf(field="fd", value=2, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0044
     * @tc.name      NdkRawfile_DescriptorLabelOf_0044
     * @tc.desc      descriptorLabelOf(field="fd", value=2, is64=false) returns "rawfile.txt fd: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0044 begin`);
      const actual: string = descriptorLabelOf('fd', 2, false);
      logInfo(`descriptorLabelOf(field="fd", value=2, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0045
     * @tc.name      NdkRawfile_DescriptorLabelOf_0045
     * @tc.desc      descriptorLabelOf(field="fd", value=3, is64=true) returns "rawfile.txt fd64: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0045 begin`);
      const actual: string = descriptorLabelOf('fd', 3, true);
      logInfo(`descriptorLabelOf(field="fd", value=3, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0046
     * @tc.name      NdkRawfile_DescriptorLabelOf_0046
     * @tc.desc      descriptorLabelOf(field="fd", value=3, is64=false) returns "rawfile.txt fd: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0046 begin`);
      const actual: string = descriptorLabelOf('fd', 3, false);
      logInfo(`descriptorLabelOf(field="fd", value=3, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0047
     * @tc.name      NdkRawfile_DescriptorLabelOf_0047
     * @tc.desc      descriptorLabelOf(field="fd", value=10, is64=true) returns "rawfile.txt fd64: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0047 begin`);
      const actual: string = descriptorLabelOf('fd', 10, true);
      logInfo(`descriptorLabelOf(field="fd", value=10, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0048
     * @tc.name      NdkRawfile_DescriptorLabelOf_0048
     * @tc.desc      descriptorLabelOf(field="fd", value=10, is64=false) returns "rawfile.txt fd: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0048 begin`);
      const actual: string = descriptorLabelOf('fd', 10, false);
      logInfo(`descriptorLabelOf(field="fd", value=10, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0049
     * @tc.name      NdkRawfile_DescriptorLabelOf_0049
     * @tc.desc      descriptorLabelOf(field="fd", value=100, is64=true) returns "rawfile.txt fd64: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0049 begin`);
      const actual: string = descriptorLabelOf('fd', 100, true);
      logInfo(`descriptorLabelOf(field="fd", value=100, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0050
     * @tc.name      NdkRawfile_DescriptorLabelOf_0050
     * @tc.desc      descriptorLabelOf(field="fd", value=100, is64=false) returns "rawfile.txt fd: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0050 begin`);
      const actual: string = descriptorLabelOf('fd', 100, false);
      logInfo(`descriptorLabelOf(field="fd", value=100, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0051
     * @tc.name      NdkRawfile_DescriptorLabelOf_0051
     * @tc.desc      descriptorLabelOf(field="fd", value=5, is64=true) returns "rawfile.txt fd64: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0051 begin`);
      const actual: string = descriptorLabelOf('fd', 5, true);
      logInfo(`descriptorLabelOf(field="fd", value=5, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0052
     * @tc.name      NdkRawfile_DescriptorLabelOf_0052
     * @tc.desc      descriptorLabelOf(field="fd", value=5, is64=false) returns "rawfile.txt fd: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0052 begin`);
      const actual: string = descriptorLabelOf('fd', 5, false);
      logInfo(`descriptorLabelOf(field="fd", value=5, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0053
     * @tc.name      NdkRawfile_DescriptorLabelOf_0053
     * @tc.desc      descriptorLabelOf(field="fd", value=15, is64=true) returns "rawfile.txt fd64: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0053 begin`);
      const actual: string = descriptorLabelOf('fd', 15, true);
      logInfo(`descriptorLabelOf(field="fd", value=15, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0054
     * @tc.name      NdkRawfile_DescriptorLabelOf_0054
     * @tc.desc      descriptorLabelOf(field="fd", value=15, is64=false) returns "rawfile.txt fd: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0054 begin`);
      const actual: string = descriptorLabelOf('fd', 15, false);
      logInfo(`descriptorLabelOf(field="fd", value=15, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0055
     * @tc.name      NdkRawfile_DescriptorLabelOf_0055
     * @tc.desc      descriptorLabelOf(field="fd", value=20, is64=true) returns "rawfile.txt fd64: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0055 begin`);
      const actual: string = descriptorLabelOf('fd', 20, true);
      logInfo(`descriptorLabelOf(field="fd", value=20, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0056
     * @tc.name      NdkRawfile_DescriptorLabelOf_0056
     * @tc.desc      descriptorLabelOf(field="fd", value=20, is64=false) returns "rawfile.txt fd: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0056 begin`);
      const actual: string = descriptorLabelOf('fd', 20, false);
      logInfo(`descriptorLabelOf(field="fd", value=20, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0057
     * @tc.name      NdkRawfile_DescriptorLabelOf_0057
     * @tc.desc      descriptorLabelOf(field="fd", value=25, is64=true) returns "rawfile.txt fd64: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0057 begin`);
      const actual: string = descriptorLabelOf('fd', 25, true);
      logInfo(`descriptorLabelOf(field="fd", value=25, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0058
     * @tc.name      NdkRawfile_DescriptorLabelOf_0058
     * @tc.desc      descriptorLabelOf(field="fd", value=25, is64=false) returns "rawfile.txt fd: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0058 begin`);
      const actual: string = descriptorLabelOf('fd', 25, false);
      logInfo(`descriptorLabelOf(field="fd", value=25, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0059
     * @tc.name      NdkRawfile_DescriptorLabelOf_0059
     * @tc.desc      descriptorLabelOf(field="fd", value=13.64, is64=true) returns "rawfile.txt fd64: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0059 begin`);
      const actual: string = descriptorLabelOf('fd', 13.64, true);
      logInfo(`descriptorLabelOf(field="fd", value=13.64...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd64: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0060
     * @tc.name      NdkRawfile_DescriptorLabelOf_0060
     * @tc.desc      descriptorLabelOf(field="fd", value=13.64, is64=false) returns "rawfile.txt fd: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_DescriptorLabelOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0060 begin`);
      const actual: string = descriptorLabelOf('fd', 13.64, false);
      logInfo(`descriptorLabelOf(field="fd", value=13.64...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0061
     * @tc.name      NdkRawfile_DescriptorLabelOf_0061
     * @tc.desc      descriptorLabelOf(field="6", value=0, is64=true) returns "rawfile.txt fd.664: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0061 begin`);
      const actual: string = descriptorLabelOf('6', 0, true);
      logInfo(`descriptorLabelOf(field="6", value=0, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0062
     * @tc.name      NdkRawfile_DescriptorLabelOf_0062
     * @tc.desc      descriptorLabelOf(field="6", value=0, is64=false) returns "rawfile.txt fd.6: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0062 begin`);
      const actual: string = descriptorLabelOf('6', 0, false);
      logInfo(`descriptorLabelOf(field="6", value=0, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0063
     * @tc.name      NdkRawfile_DescriptorLabelOf_0063
     * @tc.desc      descriptorLabelOf(field="6", value=1, is64=true) returns "rawfile.txt fd.664: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0063 begin`);
      const actual: string = descriptorLabelOf('6', 1, true);
      logInfo(`descriptorLabelOf(field="6", value=1, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0064
     * @tc.name      NdkRawfile_DescriptorLabelOf_0064
     * @tc.desc      descriptorLabelOf(field="6", value=1, is64=false) returns "rawfile.txt fd.6: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0064 begin`);
      const actual: string = descriptorLabelOf('6', 1, false);
      logInfo(`descriptorLabelOf(field="6", value=1, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0065
     * @tc.name      NdkRawfile_DescriptorLabelOf_0065
     * @tc.desc      descriptorLabelOf(field="6", value=-1, is64=true) returns "rawfile.txt fd.664: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0065 begin`);
      const actual: string = descriptorLabelOf('6', -1, true);
      logInfo(`descriptorLabelOf(field="6", value=-1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0066
     * @tc.name      NdkRawfile_DescriptorLabelOf_0066
     * @tc.desc      descriptorLabelOf(field="6", value=-1, is64=false) returns "rawfile.txt fd.6: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0066 begin`);
      const actual: string = descriptorLabelOf('6', -1, false);
      logInfo(`descriptorLabelOf(field="6", value=-1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0067
     * @tc.name      NdkRawfile_DescriptorLabelOf_0067
     * @tc.desc      descriptorLabelOf(field="6", value=2, is64=true) returns "rawfile.txt fd.664: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0067 begin`);
      const actual: string = descriptorLabelOf('6', 2, true);
      logInfo(`descriptorLabelOf(field="6", value=2, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0068
     * @tc.name      NdkRawfile_DescriptorLabelOf_0068
     * @tc.desc      descriptorLabelOf(field="6", value=2, is64=false) returns "rawfile.txt fd.6: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0068 begin`);
      const actual: string = descriptorLabelOf('6', 2, false);
      logInfo(`descriptorLabelOf(field="6", value=2, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0069
     * @tc.name      NdkRawfile_DescriptorLabelOf_0069
     * @tc.desc      descriptorLabelOf(field="6", value=3, is64=true) returns "rawfile.txt fd.664: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0069 begin`);
      const actual: string = descriptorLabelOf('6', 3, true);
      logInfo(`descriptorLabelOf(field="6", value=3, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0070
     * @tc.name      NdkRawfile_DescriptorLabelOf_0070
     * @tc.desc      descriptorLabelOf(field="6", value=3, is64=false) returns "rawfile.txt fd.6: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0070 begin`);
      const actual: string = descriptorLabelOf('6', 3, false);
      logInfo(`descriptorLabelOf(field="6", value=3, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0071
     * @tc.name      NdkRawfile_DescriptorLabelOf_0071
     * @tc.desc      descriptorLabelOf(field="6", value=10, is64=true) returns "rawfile.txt fd.664: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0071 begin`);
      const actual: string = descriptorLabelOf('6', 10, true);
      logInfo(`descriptorLabelOf(field="6", value=10, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0072
     * @tc.name      NdkRawfile_DescriptorLabelOf_0072
     * @tc.desc      descriptorLabelOf(field="6", value=10, is64=false) returns "rawfile.txt fd.6: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0072 begin`);
      const actual: string = descriptorLabelOf('6', 10, false);
      logInfo(`descriptorLabelOf(field="6", value=10, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0073
     * @tc.name      NdkRawfile_DescriptorLabelOf_0073
     * @tc.desc      descriptorLabelOf(field="6", value=100, is64=true) returns "rawfile.txt fd.664: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0073 begin`);
      const actual: string = descriptorLabelOf('6', 100, true);
      logInfo(`descriptorLabelOf(field="6", value=100, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0074
     * @tc.name      NdkRawfile_DescriptorLabelOf_0074
     * @tc.desc      descriptorLabelOf(field="6", value=100, is64=false) returns "rawfile.txt fd.6: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0074 begin`);
      const actual: string = descriptorLabelOf('6', 100, false);
      logInfo(`descriptorLabelOf(field="6", value=100, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0075
     * @tc.name      NdkRawfile_DescriptorLabelOf_0075
     * @tc.desc      descriptorLabelOf(field="6", value=5, is64=true) returns "rawfile.txt fd.664: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0075 begin`);
      const actual: string = descriptorLabelOf('6', 5, true);
      logInfo(`descriptorLabelOf(field="6", value=5, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0076
     * @tc.name      NdkRawfile_DescriptorLabelOf_0076
     * @tc.desc      descriptorLabelOf(field="6", value=5, is64=false) returns "rawfile.txt fd.6: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0076 begin`);
      const actual: string = descriptorLabelOf('6', 5, false);
      logInfo(`descriptorLabelOf(field="6", value=5, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0077
     * @tc.name      NdkRawfile_DescriptorLabelOf_0077
     * @tc.desc      descriptorLabelOf(field="6", value=15, is64=true) returns "rawfile.txt fd.664: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0077 begin`);
      const actual: string = descriptorLabelOf('6', 15, true);
      logInfo(`descriptorLabelOf(field="6", value=15, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0078
     * @tc.name      NdkRawfile_DescriptorLabelOf_0078
     * @tc.desc      descriptorLabelOf(field="6", value=15, is64=false) returns "rawfile.txt fd.6: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0078 begin`);
      const actual: string = descriptorLabelOf('6', 15, false);
      logInfo(`descriptorLabelOf(field="6", value=15, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0079
     * @tc.name      NdkRawfile_DescriptorLabelOf_0079
     * @tc.desc      descriptorLabelOf(field="6", value=20, is64=true) returns "rawfile.txt fd.664: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0079 begin`);
      const actual: string = descriptorLabelOf('6', 20, true);
      logInfo(`descriptorLabelOf(field="6", value=20, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0080
     * @tc.name      NdkRawfile_DescriptorLabelOf_0080
     * @tc.desc      descriptorLabelOf(field="6", value=20, is64=false) returns "rawfile.txt fd.6: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0080 begin`);
      const actual: string = descriptorLabelOf('6', 20, false);
      logInfo(`descriptorLabelOf(field="6", value=20, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0081
     * @tc.name      NdkRawfile_DescriptorLabelOf_0081
     * @tc.desc      descriptorLabelOf(field="6", value=25, is64=true) returns "rawfile.txt fd.664: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0081 begin`);
      const actual: string = descriptorLabelOf('6', 25, true);
      logInfo(`descriptorLabelOf(field="6", value=25, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0082
     * @tc.name      NdkRawfile_DescriptorLabelOf_0082
     * @tc.desc      descriptorLabelOf(field="6", value=25, is64=false) returns "rawfile.txt fd.6: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0082 begin`);
      const actual: string = descriptorLabelOf('6', 25, false);
      logInfo(`descriptorLabelOf(field="6", value=25, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0083
     * @tc.name      NdkRawfile_DescriptorLabelOf_0083
     * @tc.desc      descriptorLabelOf(field="6", value=13.64, is64=true) returns "rawfile.txt fd.664: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0083 begin`);
      const actual: string = descriptorLabelOf('6', 13.64, true);
      logInfo(`descriptorLabelOf(field="6", value=13.64,...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.664: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0084
     * @tc.name      NdkRawfile_DescriptorLabelOf_0084
     * @tc.desc      descriptorLabelOf(field="6", value=13.64, is64=false) returns "rawfile.txt fd.6: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0084 begin`);
      const actual: string = descriptorLabelOf('6', 13.64, false);
      logInfo(`descriptorLabelOf(field="6", value=13.64,...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.6: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0085
     * @tc.name      NdkRawfile_DescriptorLabelOf_0085
     * @tc.desc      descriptorLabelOf(field="64x", value=0, is64=true) returns "rawfile.txt fd.64x64: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0085 begin`);
      const actual: string = descriptorLabelOf('64x', 0, true);
      logInfo(`descriptorLabelOf(field="64x", value=0, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0086
     * @tc.name      NdkRawfile_DescriptorLabelOf_0086
     * @tc.desc      descriptorLabelOf(field="64x", value=0, is64=false) returns "rawfile.txt fd.64x: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0086 begin`);
      const actual: string = descriptorLabelOf('64x', 0, false);
      logInfo(`descriptorLabelOf(field="64x", value=0, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0087
     * @tc.name      NdkRawfile_DescriptorLabelOf_0087
     * @tc.desc      descriptorLabelOf(field="64x", value=1, is64=true) returns "rawfile.txt fd.64x64: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0087 begin`);
      const actual: string = descriptorLabelOf('64x', 1, true);
      logInfo(`descriptorLabelOf(field="64x", value=1, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0088
     * @tc.name      NdkRawfile_DescriptorLabelOf_0088
     * @tc.desc      descriptorLabelOf(field="64x", value=1, is64=false) returns "rawfile.txt fd.64x: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0088 begin`);
      const actual: string = descriptorLabelOf('64x', 1, false);
      logInfo(`descriptorLabelOf(field="64x", value=1, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0089
     * @tc.name      NdkRawfile_DescriptorLabelOf_0089
     * @tc.desc      descriptorLabelOf(field="64x", value=-1, is64=true) returns "rawfile.txt fd.64x64: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0089 begin`);
      const actual: string = descriptorLabelOf('64x', -1, true);
      logInfo(`descriptorLabelOf(field="64x", value=-1, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0090
     * @tc.name      NdkRawfile_DescriptorLabelOf_0090
     * @tc.desc      descriptorLabelOf(field="64x", value=-1, is64=false) returns "rawfile.txt fd.64x: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0090 begin`);
      const actual: string = descriptorLabelOf('64x', -1, false);
      logInfo(`descriptorLabelOf(field="64x", value=-1, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0091
     * @tc.name      NdkRawfile_DescriptorLabelOf_0091
     * @tc.desc      descriptorLabelOf(field="64x", value=2, is64=true) returns "rawfile.txt fd.64x64: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0091 begin`);
      const actual: string = descriptorLabelOf('64x', 2, true);
      logInfo(`descriptorLabelOf(field="64x", value=2, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0092
     * @tc.name      NdkRawfile_DescriptorLabelOf_0092
     * @tc.desc      descriptorLabelOf(field="64x", value=2, is64=false) returns "rawfile.txt fd.64x: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0092 begin`);
      const actual: string = descriptorLabelOf('64x', 2, false);
      logInfo(`descriptorLabelOf(field="64x", value=2, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0093
     * @tc.name      NdkRawfile_DescriptorLabelOf_0093
     * @tc.desc      descriptorLabelOf(field="64x", value=3, is64=true) returns "rawfile.txt fd.64x64: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0093 begin`);
      const actual: string = descriptorLabelOf('64x', 3, true);
      logInfo(`descriptorLabelOf(field="64x", value=3, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0094
     * @tc.name      NdkRawfile_DescriptorLabelOf_0094
     * @tc.desc      descriptorLabelOf(field="64x", value=3, is64=false) returns "rawfile.txt fd.64x: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0094 begin`);
      const actual: string = descriptorLabelOf('64x', 3, false);
      logInfo(`descriptorLabelOf(field="64x", value=3, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0095
     * @tc.name      NdkRawfile_DescriptorLabelOf_0095
     * @tc.desc      descriptorLabelOf(field="64x", value=10, is64=true) returns "rawfile.txt fd.64x64: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0095 begin`);
      const actual: string = descriptorLabelOf('64x', 10, true);
      logInfo(`descriptorLabelOf(field="64x", value=10, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0096
     * @tc.name      NdkRawfile_DescriptorLabelOf_0096
     * @tc.desc      descriptorLabelOf(field="64x", value=10, is64=false) returns "rawfile.txt fd.64x: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0096 begin`);
      const actual: string = descriptorLabelOf('64x', 10, false);
      logInfo(`descriptorLabelOf(field="64x", value=10, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0096 end`);
    });
  });
}
