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

/** Logic checks for descriptorLabelOf (70 cases). */
export default function descriptorLabelOf2Test(): void {
  describe('DescriptorLabelOf2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0097
     * @tc.name      NdkRawfile_DescriptorLabelOf_0097
     * @tc.desc      descriptorLabelOf(field="64x", value=100, is64=true) returns "rawfile.txt fd.64x64: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0097 begin`);
      const actual: string = descriptorLabelOf('64x', 100, true);
      logInfo(`descriptorLabelOf(field="64x", value=100,...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0098
     * @tc.name      NdkRawfile_DescriptorLabelOf_0098
     * @tc.desc      descriptorLabelOf(field="64x", value=100, is64=false) returns "rawfile.txt fd.64x: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0098 begin`);
      const actual: string = descriptorLabelOf('64x', 100, false);
      logInfo(`descriptorLabelOf(field="64x", value=100,...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0099
     * @tc.name      NdkRawfile_DescriptorLabelOf_0099
     * @tc.desc      descriptorLabelOf(field="64x", value=5, is64=true) returns "rawfile.txt fd.64x64: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0099 begin`);
      const actual: string = descriptorLabelOf('64x', 5, true);
      logInfo(`descriptorLabelOf(field="64x", value=5, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0100
     * @tc.name      NdkRawfile_DescriptorLabelOf_0100
     * @tc.desc      descriptorLabelOf(field="64x", value=5, is64=false) returns "rawfile.txt fd.64x: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0100 begin`);
      const actual: string = descriptorLabelOf('64x', 5, false);
      logInfo(`descriptorLabelOf(field="64x", value=5, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0101
     * @tc.name      NdkRawfile_DescriptorLabelOf_0101
     * @tc.desc      descriptorLabelOf(field="64x", value=15, is64=true) returns "rawfile.txt fd.64x64: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0101 begin`);
      const actual: string = descriptorLabelOf('64x', 15, true);
      logInfo(`descriptorLabelOf(field="64x", value=15, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0102
     * @tc.name      NdkRawfile_DescriptorLabelOf_0102
     * @tc.desc      descriptorLabelOf(field="64x", value=15, is64=false) returns "rawfile.txt fd.64x: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0102 begin`);
      const actual: string = descriptorLabelOf('64x', 15, false);
      logInfo(`descriptorLabelOf(field="64x", value=15, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0103
     * @tc.name      NdkRawfile_DescriptorLabelOf_0103
     * @tc.desc      descriptorLabelOf(field="64x", value=20, is64=true) returns "rawfile.txt fd.64x64: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0103 begin`);
      const actual: string = descriptorLabelOf('64x', 20, true);
      logInfo(`descriptorLabelOf(field="64x", value=20, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0104
     * @tc.name      NdkRawfile_DescriptorLabelOf_0104
     * @tc.desc      descriptorLabelOf(field="64x", value=20, is64=false) returns "rawfile.txt fd.64x: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0104 begin`);
      const actual: string = descriptorLabelOf('64x', 20, false);
      logInfo(`descriptorLabelOf(field="64x", value=20, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0105
     * @tc.name      NdkRawfile_DescriptorLabelOf_0105
     * @tc.desc      descriptorLabelOf(field="64x", value=25, is64=true) returns "rawfile.txt fd.64x64: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0105 begin`);
      const actual: string = descriptorLabelOf('64x', 25, true);
      logInfo(`descriptorLabelOf(field="64x", value=25, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0106
     * @tc.name      NdkRawfile_DescriptorLabelOf_0106
     * @tc.desc      descriptorLabelOf(field="64x", value=25, is64=false) returns "rawfile.txt fd.64x: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0106 begin`);
      const actual: string = descriptorLabelOf('64x', 25, false);
      logInfo(`descriptorLabelOf(field="64x", value=25, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0107
     * @tc.name      NdkRawfile_DescriptorLabelOf_0107
     * @tc.desc      descriptorLabelOf(field="64x", value=13.64, is64=true) returns "rawfile.txt fd.64x64: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0107 begin`);
      const actual: string = descriptorLabelOf('64x', 13.64, true);
      logInfo(`descriptorLabelOf(field="64x", value=13.6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x64: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0108
     * @tc.name      NdkRawfile_DescriptorLabelOf_0108
     * @tc.desc      descriptorLabelOf(field="64x", value=13.64, is64=false) returns "rawfile.txt fd.64x: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0108 begin`);
      const actual: string = descriptorLabelOf('64x', 13.64, false);
      logInfo(`descriptorLabelOf(field="64x", value=13.6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.64x: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0109
     * @tc.name      NdkRawfile_DescriptorLabelOf_0109
     * @tc.desc      descriptorLabelOf(field="x", value=0, is64=true) returns "rawfile.txt fd.x64: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0109 begin`);
      const actual: string = descriptorLabelOf('x', 0, true);
      logInfo(`descriptorLabelOf(field="x", value=0, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0110
     * @tc.name      NdkRawfile_DescriptorLabelOf_0110
     * @tc.desc      descriptorLabelOf(field="x", value=0, is64=false) returns "rawfile.txt fd.x: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0110 begin`);
      const actual: string = descriptorLabelOf('x', 0, false);
      logInfo(`descriptorLabelOf(field="x", value=0, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0111
     * @tc.name      NdkRawfile_DescriptorLabelOf_0111
     * @tc.desc      descriptorLabelOf(field="x", value=1, is64=true) returns "rawfile.txt fd.x64: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0111 begin`);
      const actual: string = descriptorLabelOf('x', 1, true);
      logInfo(`descriptorLabelOf(field="x", value=1, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0112
     * @tc.name      NdkRawfile_DescriptorLabelOf_0112
     * @tc.desc      descriptorLabelOf(field="x", value=1, is64=false) returns "rawfile.txt fd.x: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0112 begin`);
      const actual: string = descriptorLabelOf('x', 1, false);
      logInfo(`descriptorLabelOf(field="x", value=1, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0113
     * @tc.name      NdkRawfile_DescriptorLabelOf_0113
     * @tc.desc      descriptorLabelOf(field="x", value=-1, is64=true) returns "rawfile.txt fd.x64: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0113 begin`);
      const actual: string = descriptorLabelOf('x', -1, true);
      logInfo(`descriptorLabelOf(field="x", value=-1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0114
     * @tc.name      NdkRawfile_DescriptorLabelOf_0114
     * @tc.desc      descriptorLabelOf(field="x", value=-1, is64=false) returns "rawfile.txt fd.x: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0114 begin`);
      const actual: string = descriptorLabelOf('x', -1, false);
      logInfo(`descriptorLabelOf(field="x", value=-1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0115
     * @tc.name      NdkRawfile_DescriptorLabelOf_0115
     * @tc.desc      descriptorLabelOf(field="x", value=2, is64=true) returns "rawfile.txt fd.x64: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0115 begin`);
      const actual: string = descriptorLabelOf('x', 2, true);
      logInfo(`descriptorLabelOf(field="x", value=2, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0116
     * @tc.name      NdkRawfile_DescriptorLabelOf_0116
     * @tc.desc      descriptorLabelOf(field="x", value=2, is64=false) returns "rawfile.txt fd.x: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0116 begin`);
      const actual: string = descriptorLabelOf('x', 2, false);
      logInfo(`descriptorLabelOf(field="x", value=2, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0117
     * @tc.name      NdkRawfile_DescriptorLabelOf_0117
     * @tc.desc      descriptorLabelOf(field="x", value=3, is64=true) returns "rawfile.txt fd.x64: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0117 begin`);
      const actual: string = descriptorLabelOf('x', 3, true);
      logInfo(`descriptorLabelOf(field="x", value=3, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0118
     * @tc.name      NdkRawfile_DescriptorLabelOf_0118
     * @tc.desc      descriptorLabelOf(field="x", value=3, is64=false) returns "rawfile.txt fd.x: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0118 begin`);
      const actual: string = descriptorLabelOf('x', 3, false);
      logInfo(`descriptorLabelOf(field="x", value=3, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0119
     * @tc.name      NdkRawfile_DescriptorLabelOf_0119
     * @tc.desc      descriptorLabelOf(field="x", value=10, is64=true) returns "rawfile.txt fd.x64: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0119 begin`);
      const actual: string = descriptorLabelOf('x', 10, true);
      logInfo(`descriptorLabelOf(field="x", value=10, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0120
     * @tc.name      NdkRawfile_DescriptorLabelOf_0120
     * @tc.desc      descriptorLabelOf(field="x", value=10, is64=false) returns "rawfile.txt fd.x: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0120 begin`);
      const actual: string = descriptorLabelOf('x', 10, false);
      logInfo(`descriptorLabelOf(field="x", value=10, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0121
     * @tc.name      NdkRawfile_DescriptorLabelOf_0121
     * @tc.desc      descriptorLabelOf(field="x", value=100, is64=true) returns "rawfile.txt fd.x64: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0121 begin`);
      const actual: string = descriptorLabelOf('x', 100, true);
      logInfo(`descriptorLabelOf(field="x", value=100, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0122
     * @tc.name      NdkRawfile_DescriptorLabelOf_0122
     * @tc.desc      descriptorLabelOf(field="x", value=100, is64=false) returns "rawfile.txt fd.x: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0122 begin`);
      const actual: string = descriptorLabelOf('x', 100, false);
      logInfo(`descriptorLabelOf(field="x", value=100, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0123
     * @tc.name      NdkRawfile_DescriptorLabelOf_0123
     * @tc.desc      descriptorLabelOf(field="x", value=5, is64=true) returns "rawfile.txt fd.x64: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0123 begin`);
      const actual: string = descriptorLabelOf('x', 5, true);
      logInfo(`descriptorLabelOf(field="x", value=5, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0124
     * @tc.name      NdkRawfile_DescriptorLabelOf_0124
     * @tc.desc      descriptorLabelOf(field="x", value=5, is64=false) returns "rawfile.txt fd.x: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0124 begin`);
      const actual: string = descriptorLabelOf('x', 5, false);
      logInfo(`descriptorLabelOf(field="x", value=5, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0125
     * @tc.name      NdkRawfile_DescriptorLabelOf_0125
     * @tc.desc      descriptorLabelOf(field="x", value=15, is64=true) returns "rawfile.txt fd.x64: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0125 begin`);
      const actual: string = descriptorLabelOf('x', 15, true);
      logInfo(`descriptorLabelOf(field="x", value=15, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0126
     * @tc.name      NdkRawfile_DescriptorLabelOf_0126
     * @tc.desc      descriptorLabelOf(field="x", value=15, is64=false) returns "rawfile.txt fd.x: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0126 begin`);
      const actual: string = descriptorLabelOf('x', 15, false);
      logInfo(`descriptorLabelOf(field="x", value=15, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0127
     * @tc.name      NdkRawfile_DescriptorLabelOf_0127
     * @tc.desc      descriptorLabelOf(field="x", value=20, is64=true) returns "rawfile.txt fd.x64: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0127 begin`);
      const actual: string = descriptorLabelOf('x', 20, true);
      logInfo(`descriptorLabelOf(field="x", value=20, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0128
     * @tc.name      NdkRawfile_DescriptorLabelOf_0128
     * @tc.desc      descriptorLabelOf(field="x", value=20, is64=false) returns "rawfile.txt fd.x: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0128 begin`);
      const actual: string = descriptorLabelOf('x', 20, false);
      logInfo(`descriptorLabelOf(field="x", value=20, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0129
     * @tc.name      NdkRawfile_DescriptorLabelOf_0129
     * @tc.desc      descriptorLabelOf(field="x", value=25, is64=true) returns "rawfile.txt fd.x64: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0129 begin`);
      const actual: string = descriptorLabelOf('x', 25, true);
      logInfo(`descriptorLabelOf(field="x", value=25, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0130
     * @tc.name      NdkRawfile_DescriptorLabelOf_0130
     * @tc.desc      descriptorLabelOf(field="x", value=25, is64=false) returns "rawfile.txt fd.x: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0130 begin`);
      const actual: string = descriptorLabelOf('x', 25, false);
      logInfo(`descriptorLabelOf(field="x", value=25, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0131
     * @tc.name      NdkRawfile_DescriptorLabelOf_0131
     * @tc.desc      descriptorLabelOf(field="x", value=13.64, is64=true) returns "rawfile.txt fd.x64: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0131 begin`);
      const actual: string = descriptorLabelOf('x', 13.64, true);
      logInfo(`descriptorLabelOf(field="x", value=13.64,...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x64: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0132
     * @tc.name      NdkRawfile_DescriptorLabelOf_0132
     * @tc.desc      descriptorLabelOf(field="x", value=13.64, is64=false) returns "rawfile.txt fd.x: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0132 begin`);
      const actual: string = descriptorLabelOf('x', 13.64, false);
      logInfo(`descriptorLabelOf(field="x", value=13.64,...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.x: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0133
     * @tc.name      NdkRawfile_DescriptorLabelOf_0133
     * @tc.desc      descriptorLabelOf(field="FD", value=0, is64=true) returns "rawfile.txt fd.FD64: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0133 begin`);
      const actual: string = descriptorLabelOf('FD', 0, true);
      logInfo(`descriptorLabelOf(field="FD", value=0, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0134
     * @tc.name      NdkRawfile_DescriptorLabelOf_0134
     * @tc.desc      descriptorLabelOf(field="FD", value=0, is64=false) returns "rawfile.txt fd.FD: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0134 begin`);
      const actual: string = descriptorLabelOf('FD', 0, false);
      logInfo(`descriptorLabelOf(field="FD", value=0, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0135
     * @tc.name      NdkRawfile_DescriptorLabelOf_0135
     * @tc.desc      descriptorLabelOf(field="FD", value=1, is64=true) returns "rawfile.txt fd.FD64: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0135 begin`);
      const actual: string = descriptorLabelOf('FD', 1, true);
      logInfo(`descriptorLabelOf(field="FD", value=1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0136
     * @tc.name      NdkRawfile_DescriptorLabelOf_0136
     * @tc.desc      descriptorLabelOf(field="FD", value=1, is64=false) returns "rawfile.txt fd.FD: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0136 begin`);
      const actual: string = descriptorLabelOf('FD', 1, false);
      logInfo(`descriptorLabelOf(field="FD", value=1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0137
     * @tc.name      NdkRawfile_DescriptorLabelOf_0137
     * @tc.desc      descriptorLabelOf(field="FD", value=-1, is64=true) returns "rawfile.txt fd.FD64: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0137 begin`);
      const actual: string = descriptorLabelOf('FD', -1, true);
      logInfo(`descriptorLabelOf(field="FD", value=-1, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0138
     * @tc.name      NdkRawfile_DescriptorLabelOf_0138
     * @tc.desc      descriptorLabelOf(field="FD", value=-1, is64=false) returns "rawfile.txt fd.FD: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0138 begin`);
      const actual: string = descriptorLabelOf('FD', -1, false);
      logInfo(`descriptorLabelOf(field="FD", value=-1, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0139
     * @tc.name      NdkRawfile_DescriptorLabelOf_0139
     * @tc.desc      descriptorLabelOf(field="FD", value=2, is64=true) returns "rawfile.txt fd.FD64: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0139 begin`);
      const actual: string = descriptorLabelOf('FD', 2, true);
      logInfo(`descriptorLabelOf(field="FD", value=2, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0140
     * @tc.name      NdkRawfile_DescriptorLabelOf_0140
     * @tc.desc      descriptorLabelOf(field="FD", value=2, is64=false) returns "rawfile.txt fd.FD: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0140 begin`);
      const actual: string = descriptorLabelOf('FD', 2, false);
      logInfo(`descriptorLabelOf(field="FD", value=2, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0141
     * @tc.name      NdkRawfile_DescriptorLabelOf_0141
     * @tc.desc      descriptorLabelOf(field="FD", value=3, is64=true) returns "rawfile.txt fd.FD64: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0141 begin`);
      const actual: string = descriptorLabelOf('FD', 3, true);
      logInfo(`descriptorLabelOf(field="FD", value=3, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0142
     * @tc.name      NdkRawfile_DescriptorLabelOf_0142
     * @tc.desc      descriptorLabelOf(field="FD", value=3, is64=false) returns "rawfile.txt fd.FD: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0142 begin`);
      const actual: string = descriptorLabelOf('FD', 3, false);
      logInfo(`descriptorLabelOf(field="FD", value=3, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0143
     * @tc.name      NdkRawfile_DescriptorLabelOf_0143
     * @tc.desc      descriptorLabelOf(field="FD", value=10, is64=true) returns "rawfile.txt fd.FD64: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0143 begin`);
      const actual: string = descriptorLabelOf('FD', 10, true);
      logInfo(`descriptorLabelOf(field="FD", value=10, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0144
     * @tc.name      NdkRawfile_DescriptorLabelOf_0144
     * @tc.desc      descriptorLabelOf(field="FD", value=10, is64=false) returns "rawfile.txt fd.FD: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0144 begin`);
      const actual: string = descriptorLabelOf('FD', 10, false);
      logInfo(`descriptorLabelOf(field="FD", value=10, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: 10');
      logInfo(`${BUNDLE}DescriptorLabelOf_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0145
     * @tc.name      NdkRawfile_DescriptorLabelOf_0145
     * @tc.desc      descriptorLabelOf(field="FD", value=100, is64=true) returns "rawfile.txt fd.FD64: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0145 begin`);
      const actual: string = descriptorLabelOf('FD', 100, true);
      logInfo(`descriptorLabelOf(field="FD", value=100, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0146
     * @tc.name      NdkRawfile_DescriptorLabelOf_0146
     * @tc.desc      descriptorLabelOf(field="FD", value=100, is64=false) returns "rawfile.txt fd.FD: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0146 begin`);
      const actual: string = descriptorLabelOf('FD', 100, false);
      logInfo(`descriptorLabelOf(field="FD", value=100, ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: 100');
      logInfo(`${BUNDLE}DescriptorLabelOf_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0147
     * @tc.name      NdkRawfile_DescriptorLabelOf_0147
     * @tc.desc      descriptorLabelOf(field="FD", value=5, is64=true) returns "rawfile.txt fd.FD64: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0147 begin`);
      const actual: string = descriptorLabelOf('FD', 5, true);
      logInfo(`descriptorLabelOf(field="FD", value=5, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0148
     * @tc.name      NdkRawfile_DescriptorLabelOf_0148
     * @tc.desc      descriptorLabelOf(field="FD", value=5, is64=false) returns "rawfile.txt fd.FD: 5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0148 begin`);
      const actual: string = descriptorLabelOf('FD', 5, false);
      logInfo(`descriptorLabelOf(field="FD", value=5, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: 5');
      logInfo(`${BUNDLE}DescriptorLabelOf_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0149
     * @tc.name      NdkRawfile_DescriptorLabelOf_0149
     * @tc.desc      descriptorLabelOf(field="FD", value=15, is64=true) returns "rawfile.txt fd.FD64: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0149 begin`);
      const actual: string = descriptorLabelOf('FD', 15, true);
      logInfo(`descriptorLabelOf(field="FD", value=15, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0150
     * @tc.name      NdkRawfile_DescriptorLabelOf_0150
     * @tc.desc      descriptorLabelOf(field="FD", value=15, is64=false) returns "rawfile.txt fd.FD: 15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0150 begin`);
      const actual: string = descriptorLabelOf('FD', 15, false);
      logInfo(`descriptorLabelOf(field="FD", value=15, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: 15');
      logInfo(`${BUNDLE}DescriptorLabelOf_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0151
     * @tc.name      NdkRawfile_DescriptorLabelOf_0151
     * @tc.desc      descriptorLabelOf(field="FD", value=20, is64=true) returns "rawfile.txt fd.FD64: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0151 begin`);
      const actual: string = descriptorLabelOf('FD', 20, true);
      logInfo(`descriptorLabelOf(field="FD", value=20, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0152
     * @tc.name      NdkRawfile_DescriptorLabelOf_0152
     * @tc.desc      descriptorLabelOf(field="FD", value=20, is64=false) returns "rawfile.txt fd.FD: 20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0152 begin`);
      const actual: string = descriptorLabelOf('FD', 20, false);
      logInfo(`descriptorLabelOf(field="FD", value=20, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: 20');
      logInfo(`${BUNDLE}DescriptorLabelOf_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0153
     * @tc.name      NdkRawfile_DescriptorLabelOf_0153
     * @tc.desc      descriptorLabelOf(field="FD", value=25, is64=true) returns "rawfile.txt fd.FD64: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0153 begin`);
      const actual: string = descriptorLabelOf('FD', 25, true);
      logInfo(`descriptorLabelOf(field="FD", value=25, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0154
     * @tc.name      NdkRawfile_DescriptorLabelOf_0154
     * @tc.desc      descriptorLabelOf(field="FD", value=25, is64=false) returns "rawfile.txt fd.FD: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0154 begin`);
      const actual: string = descriptorLabelOf('FD', 25, false);
      logInfo(`descriptorLabelOf(field="FD", value=25, i...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: 25');
      logInfo(`${BUNDLE}DescriptorLabelOf_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0155
     * @tc.name      NdkRawfile_DescriptorLabelOf_0155
     * @tc.desc      descriptorLabelOf(field="FD", value=13.64, is64=true) returns "rawfile.txt fd.FD64: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0155 begin`);
      const actual: string = descriptorLabelOf('FD', 13.64, true);
      logInfo(`descriptorLabelOf(field="FD", value=13.64...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD64: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0156
     * @tc.name      NdkRawfile_DescriptorLabelOf_0156
     * @tc.desc      descriptorLabelOf(field="FD", value=13.64, is64=false) returns "rawfile.txt fd.FD: 13.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0156 begin`);
      const actual: string = descriptorLabelOf('FD', 13.64, false);
      logInfo(`descriptorLabelOf(field="FD", value=13.64...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.FD: 13.64');
      logInfo(`${BUNDLE}DescriptorLabelOf_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0157
     * @tc.name      NdkRawfile_DescriptorLabelOf_0157
     * @tc.desc      descriptorLabelOf(field="f", value=0, is64=true) returns "rawfile.txt fd.f64: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0157 begin`);
      const actual: string = descriptorLabelOf('f', 0, true);
      logInfo(`descriptorLabelOf(field="f", value=0, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.f64: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0158
     * @tc.name      NdkRawfile_DescriptorLabelOf_0158
     * @tc.desc      descriptorLabelOf(field="f", value=0, is64=false) returns "rawfile.txt fd.f: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0158 begin`);
      const actual: string = descriptorLabelOf('f', 0, false);
      logInfo(`descriptorLabelOf(field="f", value=0, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.f: 0');
      logInfo(`${BUNDLE}DescriptorLabelOf_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0159
     * @tc.name      NdkRawfile_DescriptorLabelOf_0159
     * @tc.desc      descriptorLabelOf(field="f", value=1, is64=true) returns "rawfile.txt fd.f64: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0159 begin`);
      const actual: string = descriptorLabelOf('f', 1, true);
      logInfo(`descriptorLabelOf(field="f", value=1, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.f64: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0160
     * @tc.name      NdkRawfile_DescriptorLabelOf_0160
     * @tc.desc      descriptorLabelOf(field="f", value=1, is64=false) returns "rawfile.txt fd.f: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0160 begin`);
      const actual: string = descriptorLabelOf('f', 1, false);
      logInfo(`descriptorLabelOf(field="f", value=1, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.f: 1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0161
     * @tc.name      NdkRawfile_DescriptorLabelOf_0161
     * @tc.desc      descriptorLabelOf(field="f", value=-1, is64=true) returns "rawfile.txt fd.f64: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0161 begin`);
      const actual: string = descriptorLabelOf('f', -1, true);
      logInfo(`descriptorLabelOf(field="f", value=-1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.f64: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0162
     * @tc.name      NdkRawfile_DescriptorLabelOf_0162
     * @tc.desc      descriptorLabelOf(field="f", value=-1, is64=false) returns "rawfile.txt fd.f: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0162 begin`);
      const actual: string = descriptorLabelOf('f', -1, false);
      logInfo(`descriptorLabelOf(field="f", value=-1, is...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.f: -1');
      logInfo(`${BUNDLE}DescriptorLabelOf_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0163
     * @tc.name      NdkRawfile_DescriptorLabelOf_0163
     * @tc.desc      descriptorLabelOf(field="f", value=2, is64=true) returns "rawfile.txt fd.f64: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0163 begin`);
      const actual: string = descriptorLabelOf('f', 2, true);
      logInfo(`descriptorLabelOf(field="f", value=2, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.f64: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0164
     * @tc.name      NdkRawfile_DescriptorLabelOf_0164
     * @tc.desc      descriptorLabelOf(field="f", value=2, is64=false) returns "rawfile.txt fd.f: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0164 begin`);
      const actual: string = descriptorLabelOf('f', 2, false);
      logInfo(`descriptorLabelOf(field="f", value=2, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.f: 2');
      logInfo(`${BUNDLE}DescriptorLabelOf_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0165
     * @tc.name      NdkRawfile_DescriptorLabelOf_0165
     * @tc.desc      descriptorLabelOf(field="f", value=3, is64=true) returns "rawfile.txt fd.f64: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0165 begin`);
      const actual: string = descriptorLabelOf('f', 3, true);
      logInfo(`descriptorLabelOf(field="f", value=3, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.f64: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_DESCRIPTOR_LABEL_OF_0166
     * @tc.name      NdkRawfile_DescriptorLabelOf_0166
     * @tc.desc      descriptorLabelOf(field="f", value=3, is64=false) returns "rawfile.txt fd.f: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_DescriptorLabelOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DescriptorLabelOf_0166 begin`);
      const actual: string = descriptorLabelOf('f', 3, false);
      logInfo(`descriptorLabelOf(field="f", value=3, is6...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt fd.f: 3');
      logInfo(`${BUNDLE}DescriptorLabelOf_0166 end`);
    });
  });
}
