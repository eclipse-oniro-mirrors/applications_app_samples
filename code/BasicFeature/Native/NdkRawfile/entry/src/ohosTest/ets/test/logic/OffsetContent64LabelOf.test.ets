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
import { offsetContent64LabelOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for offsetContent64LabelOf (90 cases). */
export default function offsetContent64LabelOfTest(): void {
  describe('OffsetContent64LabelOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0001
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0001
     * @tc.desc      offsetContent64LabelOf(text="Hello") returns "rawfile.txt content with offset64: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_OffsetContent64LabelOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0001 begin`);
      const actual: string = offsetContent64LabelOf('Hello');
      logInfo(`offsetContent64LabelOf(text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: Hello');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0002
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0002
     * @tc.desc      offsetContent64LabelOf(text="hello world") returns "rawfile.txt content with offset64: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_OffsetContent64LabelOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0002 begin`);
      const actual: string = offsetContent64LabelOf('hello world');
      logInfo(`offsetContent64LabelOf(text="hello world"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: hello world');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0003
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0003
     * @tc.desc      offsetContent64LabelOf(text="") returns "rawfile.txt content with offset64: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0003 begin`);
      const actual: string = offsetContent64LabelOf('');
      logInfo(`offsetContent64LabelOf(text=""): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0004
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0004
     * @tc.desc      offsetContent64LabelOf(text=" ") returns "rawfile.txt content with offset64:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0004 begin`);
      const actual: string = offsetContent64LabelOf(' ');
      logInfo(`offsetContent64LabelOf(text=" "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:  ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0005
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0005
     * @tc.desc      offsetContent64LabelOf(text="A") returns "rawfile.txt content with offset64: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0005 begin`);
      const actual: string = offsetContent64LabelOf('A');
      logInfo(`offsetContent64LabelOf(text="A"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: A');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0006
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0006
     * @tc.desc      offsetContent64LabelOf(text="Sample Title 123") returns "rawfile.txt content with offset64: Samp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0006 begin`);
      const actual: string = offsetContent64LabelOf('Sample Title 123');
      logInfo(`offsetContent64LabelOf(text="Sample Title...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: Sample Title 123');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0007
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0007
     * @tc.desc      offsetContent64LabelOf(text="??") returns "rawfile.txt content with offset64: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0007 begin`);
      const actual: string = offsetContent64LabelOf('\u4e2d\u6587');
      logInfo(`offsetContent64LabelOf(text="??"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: \u4e2d\u6587');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0008
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0008
     * @tc.desc      offsetContent64LabelOf(text="a") returns "rawfile.txt content with offset64: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0008 begin`);
      const actual: string = offsetContent64LabelOf('a');
      logInfo(`offsetContent64LabelOf(text="a"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: a');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0009
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0009
     * @tc.desc      offsetContent64LabelOf(text="abc") returns "rawfile.txt content with offset64: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0009 begin`);
      const actual: string = offsetContent64LabelOf('abc');
      logInfo(`offsetContent64LabelOf(text="abc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: abc');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0010
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0010
     * @tc.desc      offsetContent64LabelOf(text="Hello World") returns "rawfile.txt content with offset64: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0010 begin`);
      const actual: string = offsetContent64LabelOf('Hello World');
      logInfo(`offsetContent64LabelOf(text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: Hello World');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0011
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0011
     * @tc.desc      offsetContent64LabelOf(text="123") returns "rawfile.txt content with offset64: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0011 begin`);
      const actual: string = offsetContent64LabelOf('123');
      logInfo(`offsetContent64LabelOf(text="123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 123');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0012
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0012
     * @tc.desc      offsetContent64LabelOf(text=" Hello ") returns "rawfile.txt content with offset64:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0012 begin`);
      const actual: string = offsetContent64LabelOf(' Hello ');
      logInfo(`offsetContent64LabelOf(text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:  Hello ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0013
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0013
     * @tc.desc      offsetContent64LabelOf(text="HelloHello") returns "rawfile.txt content with offset64: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0013 begin`);
      const actual: string = offsetContent64LabelOf('HelloHello');
      logInfo(`offsetContent64LabelOf(text="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: HelloHello');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0014
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0014
     * @tc.desc      offsetContent64LabelOf(text="Hello_1") returns "rawfile.txt content with offset64: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0014 begin`);
      const actual: string = offsetContent64LabelOf('Hello_1');
      logInfo(`offsetContent64LabelOf(text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: Hello_1');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0015
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0015
     * @tc.desc      offsetContent64LabelOf(text="xHello") returns "rawfile.txt content with offset64: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0015 begin`);
      const actual: string = offsetContent64LabelOf('xHello');
      logInfo(`offsetContent64LabelOf(text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: xHello');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0016
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0016
     * @tc.desc      offsetContent64LabelOf(text=" hello world ") returns "rawfile.txt content with offset64:  hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0016 begin`);
      const actual: string = offsetContent64LabelOf(' hello world ');
      logInfo(`offsetContent64LabelOf(text=" hello world "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:  hello world ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0017
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0017
     * @tc.desc      offsetContent64LabelOf(text="hello worldhello world") returns "rawfile.txt content with offset64...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0017 begin`);
      const actual: string = offsetContent64LabelOf('hello worldhello world');
      logInfo(`offsetContent64LabelOf(text="hello worldh...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: hello worldhello world');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0018
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0018
     * @tc.desc      offsetContent64LabelOf(text="hello world_1") returns "rawfile.txt content with offset64: hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0018 begin`);
      const actual: string = offsetContent64LabelOf('hello world_1');
      logInfo(`offsetContent64LabelOf(text="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: hello world_1');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0019
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0019
     * @tc.desc      offsetContent64LabelOf(text="xhello world") returns "rawfile.txt content with offset64: xhello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0019 begin`);
      const actual: string = offsetContent64LabelOf('xhello world');
      logInfo(`offsetContent64LabelOf(text="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: xhello world');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0020
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0020
     * @tc.desc      offsetContent64LabelOf(text="   ") returns "rawfile.txt content with offset64:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0020 begin`);
      const actual: string = offsetContent64LabelOf('   ');
      logInfo(`offsetContent64LabelOf(text="   "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:    ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0021
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0021
     * @tc.desc      offsetContent64LabelOf(text="  ") returns "rawfile.txt content with offset64:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0021 begin`);
      const actual: string = offsetContent64LabelOf('  ');
      logInfo(`offsetContent64LabelOf(text="  "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:   ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0022
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0022
     * @tc.desc      offsetContent64LabelOf(text=" _1") returns "rawfile.txt content with offset64:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0022 begin`);
      const actual: string = offsetContent64LabelOf(' _1');
      logInfo(`offsetContent64LabelOf(text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:  _1');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0023
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0023
     * @tc.desc      offsetContent64LabelOf(text="x ") returns "rawfile.txt content with offset64: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0023 begin`);
      const actual: string = offsetContent64LabelOf('x ');
      logInfo(`offsetContent64LabelOf(text="x "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: x ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0024
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0024
     * @tc.desc      offsetContent64LabelOf(text=" A ") returns "rawfile.txt content with offset64:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0024 begin`);
      const actual: string = offsetContent64LabelOf(' A ');
      logInfo(`offsetContent64LabelOf(text=" A "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:  A ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0025
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0025
     * @tc.desc      offsetContent64LabelOf(text="AA") returns "rawfile.txt content with offset64: AA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0025 begin`);
      const actual: string = offsetContent64LabelOf('AA');
      logInfo(`offsetContent64LabelOf(text="AA"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: AA');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0026
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0026
     * @tc.desc      offsetContent64LabelOf(text="A_1") returns "rawfile.txt content with offset64: A_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0026 begin`);
      const actual: string = offsetContent64LabelOf('A_1');
      logInfo(`offsetContent64LabelOf(text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: A_1');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0027
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0027
     * @tc.desc      offsetContent64LabelOf(text="xA") returns "rawfile.txt content with offset64: xA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0027 begin`);
      const actual: string = offsetContent64LabelOf('xA');
      logInfo(`offsetContent64LabelOf(text="xA"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: xA');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0028
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0028
     * @tc.desc      offsetContent64LabelOf(text=" Sample Title 123 ") returns "rawfile.txt content with offset64:  S...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0028 begin`);
      const actual: string = offsetContent64LabelOf(' Sample Title 123 ');
      logInfo(`offsetContent64LabelOf(text=" Sample Titl...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:  Sample Title 123 ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0029
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0029
     * @tc.desc      offsetContent64LabelOf(text="Sample Title 123Sample Title 123") returns "Sample Title 123Sample ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0029 begin`);
      const actual: string = offsetContent64LabelOf('Sample Title 123Sample Title 123');
      logInfo(`offsetContent64LabelOf(text="Sample Title...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`offsetContent64LabelOf(text="Sample Title...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('rawfile.txt content with offset6');
      logInfo(`offsetContent64LabelOf(text="Sample Title...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0030
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0030
     * @tc.desc      offsetContent64LabelOf(text="Sample Title 123_1") returns "rawfile.txt content with offset64: Sa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0030 begin`);
      const actual: string = offsetContent64LabelOf('Sample Title 123_1');
      logInfo(`offsetContent64LabelOf(text="Sample Title...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: Sample Title 123_1');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0031
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0031
     * @tc.desc      offsetContent64LabelOf(text="xSample Title 123") returns "rawfile.txt content with offset64: xSa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0031 begin`);
      const actual: string = offsetContent64LabelOf('xSample Title 123');
      logInfo(`offsetContent64LabelOf(text="xSample Titl...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: xSample Title 123');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0032
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0032
     * @tc.desc      offsetContent64LabelOf(text=" ?? ") returns "rawfile.txt content with offset64:  ?? "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0032 begin`);
      const actual: string = offsetContent64LabelOf(' \u4e2d\u6587 ');
      logInfo(`offsetContent64LabelOf(text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:  \u4e2d\u6587 ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0033
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0033
     * @tc.desc      offsetContent64LabelOf(text="????") returns "rawfile.txt content with offset64: ????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0033 begin`);
      const actual: string = offsetContent64LabelOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`offsetContent64LabelOf(text="????"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: \u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0034
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0034
     * @tc.desc      offsetContent64LabelOf(text="??_1") returns "rawfile.txt content with offset64: ??_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0034 begin`);
      const actual: string = offsetContent64LabelOf('\u4e2d\u6587_1');
      logInfo(`offsetContent64LabelOf(text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: \u4e2d\u6587_1');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0035
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0035
     * @tc.desc      offsetContent64LabelOf(text="x??") returns "rawfile.txt content with offset64: x??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0035 begin`);
      const actual: string = offsetContent64LabelOf('x\u4e2d\u6587');
      logInfo(`offsetContent64LabelOf(text="x??"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: x\u4e2d\u6587');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0036
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0036
     * @tc.desc      offsetContent64LabelOf(text=" a ") returns "rawfile.txt content with offset64:  a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0036 begin`);
      const actual: string = offsetContent64LabelOf(' a ');
      logInfo(`offsetContent64LabelOf(text=" a "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:  a ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0037
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0037
     * @tc.desc      offsetContent64LabelOf(text="aa") returns "rawfile.txt content with offset64: aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0037 begin`);
      const actual: string = offsetContent64LabelOf('aa');
      logInfo(`offsetContent64LabelOf(text="aa"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: aa');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0038
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0038
     * @tc.desc      offsetContent64LabelOf(text="a_1") returns "rawfile.txt content with offset64: a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0038 begin`);
      const actual: string = offsetContent64LabelOf('a_1');
      logInfo(`offsetContent64LabelOf(text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: a_1');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0039
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0039
     * @tc.desc      offsetContent64LabelOf(text="xa") returns "rawfile.txt content with offset64: xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0039 begin`);
      const actual: string = offsetContent64LabelOf('xa');
      logInfo(`offsetContent64LabelOf(text="xa"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: xa');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0040
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0040
     * @tc.desc      offsetContent64LabelOf(text=" abc ") returns "rawfile.txt content with offset64:  abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0040 begin`);
      const actual: string = offsetContent64LabelOf(' abc ');
      logInfo(`offsetContent64LabelOf(text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:  abc ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0041
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0041
     * @tc.desc      offsetContent64LabelOf(text="abcabc") returns "rawfile.txt content with offset64: abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0041 begin`);
      const actual: string = offsetContent64LabelOf('abcabc');
      logInfo(`offsetContent64LabelOf(text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: abcabc');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0042
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0042
     * @tc.desc      offsetContent64LabelOf(text="abc_1") returns "rawfile.txt content with offset64: abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0042 begin`);
      const actual: string = offsetContent64LabelOf('abc_1');
      logInfo(`offsetContent64LabelOf(text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: abc_1');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0043
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0043
     * @tc.desc      offsetContent64LabelOf(text="xabc") returns "rawfile.txt content with offset64: xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0043 begin`);
      const actual: string = offsetContent64LabelOf('xabc');
      logInfo(`offsetContent64LabelOf(text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: xabc');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0044
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0044
     * @tc.desc      offsetContent64LabelOf(text=" Hello World ") returns "rawfile.txt content with offset64:  Hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0044 begin`);
      const actual: string = offsetContent64LabelOf(' Hello World ');
      logInfo(`offsetContent64LabelOf(text=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:  Hello World ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0045
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0045
     * @tc.desc      offsetContent64LabelOf(text="Hello WorldHello World") returns "rawfile.txt content with offset64...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0045 begin`);
      const actual: string = offsetContent64LabelOf('Hello WorldHello World');
      logInfo(`offsetContent64LabelOf(text="Hello WorldH...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: Hello WorldHello World');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0046
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0046
     * @tc.desc      offsetContent64LabelOf(text="Hello World_1") returns "rawfile.txt content with offset64: Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0046 begin`);
      const actual: string = offsetContent64LabelOf('Hello World_1');
      logInfo(`offsetContent64LabelOf(text="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: Hello World_1');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0047
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0047
     * @tc.desc      offsetContent64LabelOf(text="xHello World") returns "rawfile.txt content with offset64: xHello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0047 begin`);
      const actual: string = offsetContent64LabelOf('xHello World');
      logInfo(`offsetContent64LabelOf(text="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: xHello World');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0048
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0048
     * @tc.desc      offsetContent64LabelOf(text=" 123 ") returns "rawfile.txt content with offset64:  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0048 begin`);
      const actual: string = offsetContent64LabelOf(' 123 ');
      logInfo(`offsetContent64LabelOf(text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64:  123 ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0049
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0049
     * @tc.desc      offsetContent64LabelOf(text="123123") returns "rawfile.txt content with offset64: 123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0049 begin`);
      const actual: string = offsetContent64LabelOf('123123');
      logInfo(`offsetContent64LabelOf(text="123123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 123123');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0050
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0050
     * @tc.desc      offsetContent64LabelOf(text="123_1") returns "rawfile.txt content with offset64: 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0050 begin`);
      const actual: string = offsetContent64LabelOf('123_1');
      logInfo(`offsetContent64LabelOf(text="123_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 123_1');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0051
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0051
     * @tc.desc      offsetContent64LabelOf(text="x123") returns "rawfile.txt content with offset64: x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContent64LabelOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0051 begin`);
      const actual: string = offsetContent64LabelOf('x123');
      logInfo(`offsetContent64LabelOf(text="x123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: x123');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0052
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0052
     * @tc.desc      offsetContent64LabelOf(text="b") returns "rawfile.txt content with offset64: b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0052 begin`);
      const actual: string = offsetContent64LabelOf('b');
      logInfo(`offsetContent64LabelOf(text="b"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: b');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0053
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0053
     * @tc.desc      offsetContent64LabelOf(text="l6") returns "rawfile.txt content with offset64: l6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0053 begin`);
      const actual: string = offsetContent64LabelOf('l6');
      logInfo(`offsetContent64LabelOf(text="l6"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: l6');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0054
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0054
     * @tc.desc      offsetContent64LabelOf(text="L36f5Mobnha") returns "rawfile.txt content with offset64: L36f5Mobnha"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0054 begin`);
      const actual: string = offsetContent64LabelOf('L36f5Mobnha');
      logInfo(`offsetContent64LabelOf(text="L36f5Mobnha"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: L36f5Mobnha');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0055
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0055
     * @tc.desc      offsetContent64LabelOf(text="4BenhHrS53w") returns "rawfile.txt content with offset64: 4BenhHrS53w"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0055 begin`);
      const actual: string = offsetContent64LabelOf('4BenhHrS53w');
      logInfo(`offsetContent64LabelOf(text="4BenhHrS53w"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 4BenhHrS53w');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0056
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0056
     * @tc.desc      offsetContent64LabelOf(text="0IOouehJxe") returns "rawfile.txt content with offset64: 0IOouehJxe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0056 begin`);
      const actual: string = offsetContent64LabelOf('0IOouehJxe');
      logInfo(`offsetContent64LabelOf(text="0IOouehJxe"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 0IOouehJxe');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0057
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0057
     * @tc.desc      offsetContent64LabelOf(text="1NF5gD") returns "rawfile.txt content with offset64: 1NF5gD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0057 begin`);
      const actual: string = offsetContent64LabelOf('1NF5gD');
      logInfo(`offsetContent64LabelOf(text="1NF5gD"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 1NF5gD');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0058
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0058
     * @tc.desc      offsetContent64LabelOf(text="Tpgr") returns "rawfile.txt content with offset64: Tpgr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0058 begin`);
      const actual: string = offsetContent64LabelOf('Tpgr');
      logInfo(`offsetContent64LabelOf(text="Tpgr"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: Tpgr');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0059
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0059
     * @tc.desc      offsetContent64LabelOf(text="lwV") returns "rawfile.txt content with offset64: lwV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0059 begin`);
      const actual: string = offsetContent64LabelOf('lwV');
      logInfo(`offsetContent64LabelOf(text="lwV"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: lwV');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0060
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0060
     * @tc.desc      offsetContent64LabelOf(text="IMOmhaEC") returns "rawfile.txt content with offset64: IMOmhaEC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0060 begin`);
      const actual: string = offsetContent64LabelOf('IMOmhaEC');
      logInfo(`offsetContent64LabelOf(text="IMOmhaEC"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: IMOmhaEC');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0061
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0061
     * @tc.desc      offsetContent64LabelOf(text="t") returns "rawfile.txt content with offset64: t"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0061 begin`);
      const actual: string = offsetContent64LabelOf('t');
      logInfo(`offsetContent64LabelOf(text="t"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: t');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0062
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0062
     * @tc.desc      offsetContent64LabelOf(text="6jXWVi") returns "rawfile.txt content with offset64: 6jXWVi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0062 begin`);
      const actual: string = offsetContent64LabelOf('6jXWVi');
      logInfo(`offsetContent64LabelOf(text="6jXWVi"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 6jXWVi');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0063
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0063
     * @tc.desc      offsetContent64LabelOf(text="U") returns "rawfile.txt content with offset64: U"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0063 begin`);
      const actual: string = offsetContent64LabelOf('U');
      logInfo(`offsetContent64LabelOf(text="U"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: U');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0064
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0064
     * @tc.desc      offsetContent64LabelOf(text="Re7FH2auZPg") returns "rawfile.txt content with offset64: Re7FH2auZPg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0064 begin`);
      const actual: string = offsetContent64LabelOf('Re7FH2auZPg');
      logInfo(`offsetContent64LabelOf(text="Re7FH2auZPg"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: Re7FH2auZPg');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0065
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0065
     * @tc.desc      offsetContent64LabelOf(text="o7XKLfX7A9Ex") returns "rawfile.txt content with offset64: o7XKLfX7...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0065 begin`);
      const actual: string = offsetContent64LabelOf('o7XKLfX7A9Ex');
      logInfo(`offsetContent64LabelOf(text="o7XKLfX7A9Ex"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: o7XKLfX7A9Ex');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0066
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0066
     * @tc.desc      offsetContent64LabelOf(text="urUn") returns "rawfile.txt content with offset64: urUn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0066 begin`);
      const actual: string = offsetContent64LabelOf('urUn');
      logInfo(`offsetContent64LabelOf(text="urUn"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: urUn');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0067
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0067
     * @tc.desc      offsetContent64LabelOf(text="ATVvo") returns "rawfile.txt content with offset64: ATVvo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0067 begin`);
      const actual: string = offsetContent64LabelOf('ATVvo');
      logInfo(`offsetContent64LabelOf(text="ATVvo"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: ATVvo');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0068
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0068
     * @tc.desc      offsetContent64LabelOf(text="9WD") returns "rawfile.txt content with offset64: 9WD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0068 begin`);
      const actual: string = offsetContent64LabelOf('9WD');
      logInfo(`offsetContent64LabelOf(text="9WD"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 9WD');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0069
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0069
     * @tc.desc      offsetContent64LabelOf(text="3m") returns "rawfile.txt content with offset64: 3m"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0069 begin`);
      const actual: string = offsetContent64LabelOf('3m');
      logInfo(`offsetContent64LabelOf(text="3m"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 3m');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0070
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0070
     * @tc.desc      offsetContent64LabelOf(text="X43D") returns "rawfile.txt content with offset64: X43D"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0070 begin`);
      const actual: string = offsetContent64LabelOf('X43D');
      logInfo(`offsetContent64LabelOf(text="X43D"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: X43D');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0071
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0071
     * @tc.desc      offsetContent64LabelOf(text="0sSX") returns "rawfile.txt content with offset64: 0sSX"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0071 begin`);
      const actual: string = offsetContent64LabelOf('0sSX');
      logInfo(`offsetContent64LabelOf(text="0sSX"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 0sSX');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0072
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0072
     * @tc.desc      offsetContent64LabelOf(text="zisboFmHWNQ") returns "rawfile.txt content with offset64: zisboFmHWNQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0072 begin`);
      const actual: string = offsetContent64LabelOf('zisboFmHWNQ');
      logInfo(`offsetContent64LabelOf(text="zisboFmHWNQ"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: zisboFmHWNQ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0073
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0073
     * @tc.desc      offsetContent64LabelOf(text="TMcr8XbM1WO") returns "rawfile.txt content with offset64: TMcr8XbM1WO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0073 begin`);
      const actual: string = offsetContent64LabelOf('TMcr8XbM1WO');
      logInfo(`offsetContent64LabelOf(text="TMcr8XbM1WO"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: TMcr8XbM1WO');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0074
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0074
     * @tc.desc      offsetContent64LabelOf(text="wQII6tMSI") returns "rawfile.txt content with offset64: wQII6tMSI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0074 begin`);
      const actual: string = offsetContent64LabelOf('wQII6tMSI');
      logInfo(`offsetContent64LabelOf(text="wQII6tMSI"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: wQII6tMSI');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0075
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0075
     * @tc.desc      offsetContent64LabelOf(text="Ze7IoZiXM") returns "rawfile.txt content with offset64: Ze7IoZiXM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0075 begin`);
      const actual: string = offsetContent64LabelOf('Ze7IoZiXM');
      logInfo(`offsetContent64LabelOf(text="Ze7IoZiXM"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: Ze7IoZiXM');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0076
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0076
     * @tc.desc      offsetContent64LabelOf(text="nEcM") returns "rawfile.txt content with offset64: nEcM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0076 begin`);
      const actual: string = offsetContent64LabelOf('nEcM');
      logInfo(`offsetContent64LabelOf(text="nEcM"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: nEcM');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0077
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0077
     * @tc.desc      offsetContent64LabelOf(text="8Q9ic5iIwB") returns "rawfile.txt content with offset64: 8Q9ic5iIwB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0077 begin`);
      const actual: string = offsetContent64LabelOf('8Q9ic5iIwB');
      logInfo(`offsetContent64LabelOf(text="8Q9ic5iIwB"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 8Q9ic5iIwB');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0078
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0078
     * @tc.desc      offsetContent64LabelOf(text="TWODHM5") returns "rawfile.txt content with offset64: TWODHM5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0078 begin`);
      const actual: string = offsetContent64LabelOf('TWODHM5');
      logInfo(`offsetContent64LabelOf(text="TWODHM5"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: TWODHM5');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0079
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0079
     * @tc.desc      offsetContent64LabelOf(text="jWknMwqtjvt") returns "rawfile.txt content with offset64: jWknMwqtjvt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0079 begin`);
      const actual: string = offsetContent64LabelOf('jWknMwqtjvt');
      logInfo(`offsetContent64LabelOf(text="jWknMwqtjvt"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: jWknMwqtjvt');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0080
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0080
     * @tc.desc      offsetContent64LabelOf(text="xZGoEVN") returns "rawfile.txt content with offset64: xZGoEVN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0080 begin`);
      const actual: string = offsetContent64LabelOf('xZGoEVN');
      logInfo(`offsetContent64LabelOf(text="xZGoEVN"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: xZGoEVN');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0081
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0081
     * @tc.desc      offsetContent64LabelOf(text="I") returns "rawfile.txt content with offset64: I"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0081 begin`);
      const actual: string = offsetContent64LabelOf('I');
      logInfo(`offsetContent64LabelOf(text="I"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: I');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0082
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0082
     * @tc.desc      offsetContent64LabelOf(text="USLUH0") returns "rawfile.txt content with offset64: USLUH0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0082 begin`);
      const actual: string = offsetContent64LabelOf('USLUH0');
      logInfo(`offsetContent64LabelOf(text="USLUH0"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: USLUH0');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0083
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0083
     * @tc.desc      offsetContent64LabelOf(text="3F") returns "rawfile.txt content with offset64: 3F"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0083 begin`);
      const actual: string = offsetContent64LabelOf('3F');
      logInfo(`offsetContent64LabelOf(text="3F"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 3F');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0084
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0084
     * @tc.desc      offsetContent64LabelOf(text="FF") returns "rawfile.txt content with offset64: FF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0084 begin`);
      const actual: string = offsetContent64LabelOf('FF');
      logInfo(`offsetContent64LabelOf(text="FF"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: FF');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0085
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0085
     * @tc.desc      offsetContent64LabelOf(text="P3wuB3Uhd") returns "rawfile.txt content with offset64: P3wuB3Uhd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0085 begin`);
      const actual: string = offsetContent64LabelOf('P3wuB3Uhd');
      logInfo(`offsetContent64LabelOf(text="P3wuB3Uhd"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: P3wuB3Uhd');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0086
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0086
     * @tc.desc      offsetContent64LabelOf(text="GbDcgZQYmdo") returns "rawfile.txt content with offset64: GbDcgZQYmdo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0086 begin`);
      const actual: string = offsetContent64LabelOf('GbDcgZQYmdo');
      logInfo(`offsetContent64LabelOf(text="GbDcgZQYmdo"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: GbDcgZQYmdo');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0087
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0087
     * @tc.desc      offsetContent64LabelOf(text="8YQ") returns "rawfile.txt content with offset64: 8YQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0087 begin`);
      const actual: string = offsetContent64LabelOf('8YQ');
      logInfo(`offsetContent64LabelOf(text="8YQ"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: 8YQ');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0088
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0088
     * @tc.desc      offsetContent64LabelOf(text="Jncu0TbGJdL") returns "rawfile.txt content with offset64: Jncu0TbGJdL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0088 begin`);
      const actual: string = offsetContent64LabelOf('Jncu0TbGJdL');
      logInfo(`offsetContent64LabelOf(text="Jncu0TbGJdL"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: Jncu0TbGJdL');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0089
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0089
     * @tc.desc      offsetContent64LabelOf(text="WDU") returns "rawfile.txt content with offset64: WDU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0089 begin`);
      const actual: string = offsetContent64LabelOf('WDU');
      logInfo(`offsetContent64LabelOf(text="WDU"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: WDU');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT64_LABEL_OF_0090
     * @tc.name      NdkRawfile_OffsetContent64LabelOf_0090
     * @tc.desc      offsetContent64LabelOf(text="ikCCOXb") returns "rawfile.txt content with offset64: ikCCOXb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContent64LabelOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0090 begin`);
      const actual: string = offsetContent64LabelOf('ikCCOXb');
      logInfo(`offsetContent64LabelOf(text="ikCCOXb"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset64: ikCCOXb');
      logInfo(`${BUNDLE}OffsetContent64LabelOf_0090 end`);
    });
  });
}
