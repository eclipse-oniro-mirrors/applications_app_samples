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
import { offsetContentLabelOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for offsetContentLabelOf (90 cases). */
export default function offsetContentLabelOfTest(): void {
  describe('OffsetContentLabelOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0001
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0001
     * @tc.desc      offsetContentLabelOf(text="Hello") returns "rawfile.txt content with offset: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_OffsetContentLabelOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0001 begin`);
      const actual: string = offsetContentLabelOf('Hello');
      logInfo(`offsetContentLabelOf(text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Hello');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0002
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0002
     * @tc.desc      offsetContentLabelOf(text="hello world") returns "rawfile.txt content with offset: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_OffsetContentLabelOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0002 begin`);
      const actual: string = offsetContentLabelOf('hello world');
      logInfo(`offsetContentLabelOf(text="hello world"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: hello world');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0003
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0003
     * @tc.desc      offsetContentLabelOf(text="") returns "rawfile.txt content with offset: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0003 begin`);
      const actual: string = offsetContentLabelOf('');
      logInfo(`offsetContentLabelOf(text=""): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0004
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0004
     * @tc.desc      offsetContentLabelOf(text=" ") returns "rawfile.txt content with offset:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0004 begin`);
      const actual: string = offsetContentLabelOf(' ');
      logInfo(`offsetContentLabelOf(text=" "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:  ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0005
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0005
     * @tc.desc      offsetContentLabelOf(text="A") returns "rawfile.txt content with offset: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0005 begin`);
      const actual: string = offsetContentLabelOf('A');
      logInfo(`offsetContentLabelOf(text="A"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: A');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0006
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0006
     * @tc.desc      offsetContentLabelOf(text="Sample Title 123") returns "rawfile.txt content with offset: Sample T...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0006 begin`);
      const actual: string = offsetContentLabelOf('Sample Title 123');
      logInfo(`offsetContentLabelOf(text="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Sample Title 123');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0007
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0007
     * @tc.desc      offsetContentLabelOf(text="??") returns "rawfile.txt content with offset: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0007 begin`);
      const actual: string = offsetContentLabelOf('\u4e2d\u6587');
      logInfo(`offsetContentLabelOf(text="??"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: \u4e2d\u6587');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0008
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0008
     * @tc.desc      offsetContentLabelOf(text="a") returns "rawfile.txt content with offset: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0008 begin`);
      const actual: string = offsetContentLabelOf('a');
      logInfo(`offsetContentLabelOf(text="a"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: a');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0009
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0009
     * @tc.desc      offsetContentLabelOf(text="abc") returns "rawfile.txt content with offset: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0009 begin`);
      const actual: string = offsetContentLabelOf('abc');
      logInfo(`offsetContentLabelOf(text="abc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: abc');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0010
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0010
     * @tc.desc      offsetContentLabelOf(text="Hello World") returns "rawfile.txt content with offset: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0010 begin`);
      const actual: string = offsetContentLabelOf('Hello World');
      logInfo(`offsetContentLabelOf(text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Hello World');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0011
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0011
     * @tc.desc      offsetContentLabelOf(text="123") returns "rawfile.txt content with offset: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0011 begin`);
      const actual: string = offsetContentLabelOf('123');
      logInfo(`offsetContentLabelOf(text="123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: 123');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0012
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0012
     * @tc.desc      offsetContentLabelOf(text=" Hello ") returns "rawfile.txt content with offset:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0012 begin`);
      const actual: string = offsetContentLabelOf(' Hello ');
      logInfo(`offsetContentLabelOf(text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:  Hello ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0013
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0013
     * @tc.desc      offsetContentLabelOf(text="HelloHello") returns "rawfile.txt content with offset: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0013 begin`);
      const actual: string = offsetContentLabelOf('HelloHello');
      logInfo(`offsetContentLabelOf(text="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: HelloHello');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0014
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0014
     * @tc.desc      offsetContentLabelOf(text="Hello_1") returns "rawfile.txt content with offset: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0014 begin`);
      const actual: string = offsetContentLabelOf('Hello_1');
      logInfo(`offsetContentLabelOf(text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Hello_1');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0015
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0015
     * @tc.desc      offsetContentLabelOf(text="xHello") returns "rawfile.txt content with offset: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0015 begin`);
      const actual: string = offsetContentLabelOf('xHello');
      logInfo(`offsetContentLabelOf(text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: xHello');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0016
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0016
     * @tc.desc      offsetContentLabelOf(text=" hello world ") returns "rawfile.txt content with offset:  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0016 begin`);
      const actual: string = offsetContentLabelOf(' hello world ');
      logInfo(`offsetContentLabelOf(text=" hello world "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:  hello world ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0017
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0017
     * @tc.desc      offsetContentLabelOf(text="hello worldhello world") returns "rawfile.txt content with offset: he...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0017 begin`);
      const actual: string = offsetContentLabelOf('hello worldhello world');
      logInfo(`offsetContentLabelOf(text="hello worldhel...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: hello worldhello world');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0018
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0018
     * @tc.desc      offsetContentLabelOf(text="hello world_1") returns "rawfile.txt content with offset: hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0018 begin`);
      const actual: string = offsetContentLabelOf('hello world_1');
      logInfo(`offsetContentLabelOf(text="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: hello world_1');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0019
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0019
     * @tc.desc      offsetContentLabelOf(text="xhello world") returns "rawfile.txt content with offset: xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0019 begin`);
      const actual: string = offsetContentLabelOf('xhello world');
      logInfo(`offsetContentLabelOf(text="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: xhello world');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0020
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0020
     * @tc.desc      offsetContentLabelOf(text="   ") returns "rawfile.txt content with offset:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0020 begin`);
      const actual: string = offsetContentLabelOf('   ');
      logInfo(`offsetContentLabelOf(text="   "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:    ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0021
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0021
     * @tc.desc      offsetContentLabelOf(text="  ") returns "rawfile.txt content with offset:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0021 begin`);
      const actual: string = offsetContentLabelOf('  ');
      logInfo(`offsetContentLabelOf(text="  "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:   ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0022
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0022
     * @tc.desc      offsetContentLabelOf(text=" _1") returns "rawfile.txt content with offset:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0022 begin`);
      const actual: string = offsetContentLabelOf(' _1');
      logInfo(`offsetContentLabelOf(text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:  _1');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0023
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0023
     * @tc.desc      offsetContentLabelOf(text="x ") returns "rawfile.txt content with offset: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0023 begin`);
      const actual: string = offsetContentLabelOf('x ');
      logInfo(`offsetContentLabelOf(text="x "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: x ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0024
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0024
     * @tc.desc      offsetContentLabelOf(text=" A ") returns "rawfile.txt content with offset:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0024 begin`);
      const actual: string = offsetContentLabelOf(' A ');
      logInfo(`offsetContentLabelOf(text=" A "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:  A ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0025
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0025
     * @tc.desc      offsetContentLabelOf(text="AA") returns "rawfile.txt content with offset: AA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0025 begin`);
      const actual: string = offsetContentLabelOf('AA');
      logInfo(`offsetContentLabelOf(text="AA"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: AA');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0026
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0026
     * @tc.desc      offsetContentLabelOf(text="A_1") returns "rawfile.txt content with offset: A_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0026 begin`);
      const actual: string = offsetContentLabelOf('A_1');
      logInfo(`offsetContentLabelOf(text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: A_1');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0027
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0027
     * @tc.desc      offsetContentLabelOf(text="xA") returns "rawfile.txt content with offset: xA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0027 begin`);
      const actual: string = offsetContentLabelOf('xA');
      logInfo(`offsetContentLabelOf(text="xA"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: xA');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0028
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0028
     * @tc.desc      offsetContentLabelOf(text=" Sample Title 123 ") returns "rawfile.txt content with offset:  Sampl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0028 begin`);
      const actual: string = offsetContentLabelOf(' Sample Title 123 ');
      logInfo(`offsetContentLabelOf(text=" Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:  Sample Title 123 ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0029
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0029
     * @tc.desc      offsetContentLabelOf(text="Sample Title 123Sample Title 123") returns "Sample Title 123Sample Ti...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0029 begin`);
      const actual: string = offsetContentLabelOf('Sample Title 123Sample Title 123');
      logInfo(`offsetContentLabelOf(text="Sample Title 1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`offsetContentLabelOf(text="Sample Title 1...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('rawfile.txt content with offset:');
      logInfo(`offsetContentLabelOf(text="Sample Title 1...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0030
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0030
     * @tc.desc      offsetContentLabelOf(text="Sample Title 123_1") returns "rawfile.txt content with offset: Sample...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0030 begin`);
      const actual: string = offsetContentLabelOf('Sample Title 123_1');
      logInfo(`offsetContentLabelOf(text="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Sample Title 123_1');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0031
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0031
     * @tc.desc      offsetContentLabelOf(text="xSample Title 123") returns "rawfile.txt content with offset: xSample...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0031 begin`);
      const actual: string = offsetContentLabelOf('xSample Title 123');
      logInfo(`offsetContentLabelOf(text="xSample Title ...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: xSample Title 123');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0032
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0032
     * @tc.desc      offsetContentLabelOf(text=" ?? ") returns "rawfile.txt content with offset:  ?? "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0032 begin`);
      const actual: string = offsetContentLabelOf(' \u4e2d\u6587 ');
      logInfo(`offsetContentLabelOf(text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:  \u4e2d\u6587 ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0033
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0033
     * @tc.desc      offsetContentLabelOf(text="????") returns "rawfile.txt content with offset: ????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0033 begin`);
      const actual: string = offsetContentLabelOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`offsetContentLabelOf(text="????"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: \u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0034
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0034
     * @tc.desc      offsetContentLabelOf(text="??_1") returns "rawfile.txt content with offset: ??_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0034 begin`);
      const actual: string = offsetContentLabelOf('\u4e2d\u6587_1');
      logInfo(`offsetContentLabelOf(text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: \u4e2d\u6587_1');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0035
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0035
     * @tc.desc      offsetContentLabelOf(text="x??") returns "rawfile.txt content with offset: x??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0035 begin`);
      const actual: string = offsetContentLabelOf('x\u4e2d\u6587');
      logInfo(`offsetContentLabelOf(text="x??"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: x\u4e2d\u6587');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0036
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0036
     * @tc.desc      offsetContentLabelOf(text=" a ") returns "rawfile.txt content with offset:  a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0036 begin`);
      const actual: string = offsetContentLabelOf(' a ');
      logInfo(`offsetContentLabelOf(text=" a "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:  a ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0037
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0037
     * @tc.desc      offsetContentLabelOf(text="aa") returns "rawfile.txt content with offset: aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0037 begin`);
      const actual: string = offsetContentLabelOf('aa');
      logInfo(`offsetContentLabelOf(text="aa"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: aa');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0038
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0038
     * @tc.desc      offsetContentLabelOf(text="a_1") returns "rawfile.txt content with offset: a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0038 begin`);
      const actual: string = offsetContentLabelOf('a_1');
      logInfo(`offsetContentLabelOf(text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: a_1');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0039
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0039
     * @tc.desc      offsetContentLabelOf(text="xa") returns "rawfile.txt content with offset: xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0039 begin`);
      const actual: string = offsetContentLabelOf('xa');
      logInfo(`offsetContentLabelOf(text="xa"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: xa');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0040
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0040
     * @tc.desc      offsetContentLabelOf(text=" abc ") returns "rawfile.txt content with offset:  abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0040 begin`);
      const actual: string = offsetContentLabelOf(' abc ');
      logInfo(`offsetContentLabelOf(text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:  abc ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0041
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0041
     * @tc.desc      offsetContentLabelOf(text="abcabc") returns "rawfile.txt content with offset: abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0041 begin`);
      const actual: string = offsetContentLabelOf('abcabc');
      logInfo(`offsetContentLabelOf(text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: abcabc');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0042
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0042
     * @tc.desc      offsetContentLabelOf(text="abc_1") returns "rawfile.txt content with offset: abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0042 begin`);
      const actual: string = offsetContentLabelOf('abc_1');
      logInfo(`offsetContentLabelOf(text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: abc_1');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0043
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0043
     * @tc.desc      offsetContentLabelOf(text="xabc") returns "rawfile.txt content with offset: xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0043 begin`);
      const actual: string = offsetContentLabelOf('xabc');
      logInfo(`offsetContentLabelOf(text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: xabc');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0044
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0044
     * @tc.desc      offsetContentLabelOf(text=" Hello World ") returns "rawfile.txt content with offset:  Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0044 begin`);
      const actual: string = offsetContentLabelOf(' Hello World ');
      logInfo(`offsetContentLabelOf(text=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:  Hello World ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0045
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0045
     * @tc.desc      offsetContentLabelOf(text="Hello WorldHello World") returns "rawfile.txt content with offset: He...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0045 begin`);
      const actual: string = offsetContentLabelOf('Hello WorldHello World');
      logInfo(`offsetContentLabelOf(text="Hello WorldHel...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Hello WorldHello World');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0046
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0046
     * @tc.desc      offsetContentLabelOf(text="Hello World_1") returns "rawfile.txt content with offset: Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0046 begin`);
      const actual: string = offsetContentLabelOf('Hello World_1');
      logInfo(`offsetContentLabelOf(text="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Hello World_1');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0047
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0047
     * @tc.desc      offsetContentLabelOf(text="xHello World") returns "rawfile.txt content with offset: xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0047 begin`);
      const actual: string = offsetContentLabelOf('xHello World');
      logInfo(`offsetContentLabelOf(text="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: xHello World');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0048
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0048
     * @tc.desc      offsetContentLabelOf(text=" 123 ") returns "rawfile.txt content with offset:  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0048 begin`);
      const actual: string = offsetContentLabelOf(' 123 ');
      logInfo(`offsetContentLabelOf(text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset:  123 ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0049
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0049
     * @tc.desc      offsetContentLabelOf(text="123123") returns "rawfile.txt content with offset: 123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0049 begin`);
      const actual: string = offsetContentLabelOf('123123');
      logInfo(`offsetContentLabelOf(text="123123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: 123123');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0050
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0050
     * @tc.desc      offsetContentLabelOf(text="123_1") returns "rawfile.txt content with offset: 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0050 begin`);
      const actual: string = offsetContentLabelOf('123_1');
      logInfo(`offsetContentLabelOf(text="123_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: 123_1');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0051
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0051
     * @tc.desc      offsetContentLabelOf(text="x123") returns "rawfile.txt content with offset: x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_OffsetContentLabelOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0051 begin`);
      const actual: string = offsetContentLabelOf('x123');
      logInfo(`offsetContentLabelOf(text="x123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: x123');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0052
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0052
     * @tc.desc      offsetContentLabelOf(text="H") returns "rawfile.txt content with offset: H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0052 begin`);
      const actual: string = offsetContentLabelOf('H');
      logInfo(`offsetContentLabelOf(text="H"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: H');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0053
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0053
     * @tc.desc      offsetContentLabelOf(text="V9zbu5we") returns "rawfile.txt content with offset: V9zbu5we"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0053 begin`);
      const actual: string = offsetContentLabelOf('V9zbu5we');
      logInfo(`offsetContentLabelOf(text="V9zbu5we"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: V9zbu5we');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0054
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0054
     * @tc.desc      offsetContentLabelOf(text="FBRS9m") returns "rawfile.txt content with offset: FBRS9m"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0054 begin`);
      const actual: string = offsetContentLabelOf('FBRS9m');
      logInfo(`offsetContentLabelOf(text="FBRS9m"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: FBRS9m');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0055
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0055
     * @tc.desc      offsetContentLabelOf(text="4EvRty0sCWv") returns "rawfile.txt content with offset: 4EvRty0sCWv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0055 begin`);
      const actual: string = offsetContentLabelOf('4EvRty0sCWv');
      logInfo(`offsetContentLabelOf(text="4EvRty0sCWv"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: 4EvRty0sCWv');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0056
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0056
     * @tc.desc      offsetContentLabelOf(text="Oy0k") returns "rawfile.txt content with offset: Oy0k"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0056 begin`);
      const actual: string = offsetContentLabelOf('Oy0k');
      logInfo(`offsetContentLabelOf(text="Oy0k"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Oy0k');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0057
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0057
     * @tc.desc      offsetContentLabelOf(text="rQ") returns "rawfile.txt content with offset: rQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0057 begin`);
      const actual: string = offsetContentLabelOf('rQ');
      logInfo(`offsetContentLabelOf(text="rQ"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: rQ');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0058
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0058
     * @tc.desc      offsetContentLabelOf(text="azAQRw") returns "rawfile.txt content with offset: azAQRw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0058 begin`);
      const actual: string = offsetContentLabelOf('azAQRw');
      logInfo(`offsetContentLabelOf(text="azAQRw"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: azAQRw');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0059
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0059
     * @tc.desc      offsetContentLabelOf(text="c6lVGGiRrqXI") returns "rawfile.txt content with offset: c6lVGGiRrqXI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0059 begin`);
      const actual: string = offsetContentLabelOf('c6lVGGiRrqXI');
      logInfo(`offsetContentLabelOf(text="c6lVGGiRrqXI"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: c6lVGGiRrqXI');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0060
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0060
     * @tc.desc      offsetContentLabelOf(text="lEZOODzAl") returns "rawfile.txt content with offset: lEZOODzAl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0060 begin`);
      const actual: string = offsetContentLabelOf('lEZOODzAl');
      logInfo(`offsetContentLabelOf(text="lEZOODzAl"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: lEZOODzAl');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0061
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0061
     * @tc.desc      offsetContentLabelOf(text="uXrsanV") returns "rawfile.txt content with offset: uXrsanV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0061 begin`);
      const actual: string = offsetContentLabelOf('uXrsanV');
      logInfo(`offsetContentLabelOf(text="uXrsanV"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: uXrsanV');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0062
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0062
     * @tc.desc      offsetContentLabelOf(text="YgMnAQFT") returns "rawfile.txt content with offset: YgMnAQFT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0062 begin`);
      const actual: string = offsetContentLabelOf('YgMnAQFT');
      logInfo(`offsetContentLabelOf(text="YgMnAQFT"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: YgMnAQFT');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0063
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0063
     * @tc.desc      offsetContentLabelOf(text="Lh") returns "rawfile.txt content with offset: Lh"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0063 begin`);
      const actual: string = offsetContentLabelOf('Lh');
      logInfo(`offsetContentLabelOf(text="Lh"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Lh');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0064
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0064
     * @tc.desc      offsetContentLabelOf(text="Zg2LSyOx8Lut") returns "rawfile.txt content with offset: Zg2LSyOx8Lut"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0064 begin`);
      const actual: string = offsetContentLabelOf('Zg2LSyOx8Lut');
      logInfo(`offsetContentLabelOf(text="Zg2LSyOx8Lut"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Zg2LSyOx8Lut');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0065
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0065
     * @tc.desc      offsetContentLabelOf(text="9ZNgGD0") returns "rawfile.txt content with offset: 9ZNgGD0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0065 begin`);
      const actual: string = offsetContentLabelOf('9ZNgGD0');
      logInfo(`offsetContentLabelOf(text="9ZNgGD0"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: 9ZNgGD0');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0066
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0066
     * @tc.desc      offsetContentLabelOf(text="QmB") returns "rawfile.txt content with offset: QmB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0066 begin`);
      const actual: string = offsetContentLabelOf('QmB');
      logInfo(`offsetContentLabelOf(text="QmB"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: QmB');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0067
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0067
     * @tc.desc      offsetContentLabelOf(text="AnPBeH") returns "rawfile.txt content with offset: AnPBeH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0067 begin`);
      const actual: string = offsetContentLabelOf('AnPBeH');
      logInfo(`offsetContentLabelOf(text="AnPBeH"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: AnPBeH');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0068
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0068
     * @tc.desc      offsetContentLabelOf(text="P2") returns "rawfile.txt content with offset: P2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0068 begin`);
      const actual: string = offsetContentLabelOf('P2');
      logInfo(`offsetContentLabelOf(text="P2"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: P2');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0069
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0069
     * @tc.desc      offsetContentLabelOf(text="aS7JIRay") returns "rawfile.txt content with offset: aS7JIRay"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0069 begin`);
      const actual: string = offsetContentLabelOf('aS7JIRay');
      logInfo(`offsetContentLabelOf(text="aS7JIRay"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: aS7JIRay');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0070
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0070
     * @tc.desc      offsetContentLabelOf(text="eWO3SDCrYAhl") returns "rawfile.txt content with offset: eWO3SDCrYAhl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0070 begin`);
      const actual: string = offsetContentLabelOf('eWO3SDCrYAhl');
      logInfo(`offsetContentLabelOf(text="eWO3SDCrYAhl"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: eWO3SDCrYAhl');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0071
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0071
     * @tc.desc      offsetContentLabelOf(text="knbzVWNZds5A") returns "rawfile.txt content with offset: knbzVWNZds5A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0071 begin`);
      const actual: string = offsetContentLabelOf('knbzVWNZds5A');
      logInfo(`offsetContentLabelOf(text="knbzVWNZds5A"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: knbzVWNZds5A');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0072
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0072
     * @tc.desc      offsetContentLabelOf(text="A8FUKXJeNey") returns "rawfile.txt content with offset: A8FUKXJeNey"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0072 begin`);
      const actual: string = offsetContentLabelOf('A8FUKXJeNey');
      logInfo(`offsetContentLabelOf(text="A8FUKXJeNey"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: A8FUKXJeNey');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0073
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0073
     * @tc.desc      offsetContentLabelOf(text="vn9HWZc3") returns "rawfile.txt content with offset: vn9HWZc3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0073 begin`);
      const actual: string = offsetContentLabelOf('vn9HWZc3');
      logInfo(`offsetContentLabelOf(text="vn9HWZc3"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: vn9HWZc3');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0074
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0074
     * @tc.desc      offsetContentLabelOf(text="Oepu8nV") returns "rawfile.txt content with offset: Oepu8nV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0074 begin`);
      const actual: string = offsetContentLabelOf('Oepu8nV');
      logInfo(`offsetContentLabelOf(text="Oepu8nV"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Oepu8nV');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0075
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0075
     * @tc.desc      offsetContentLabelOf(text="hS3f") returns "rawfile.txt content with offset: hS3f"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0075 begin`);
      const actual: string = offsetContentLabelOf('hS3f');
      logInfo(`offsetContentLabelOf(text="hS3f"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: hS3f');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0076
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0076
     * @tc.desc      offsetContentLabelOf(text="Y") returns "rawfile.txt content with offset: Y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0076 begin`);
      const actual: string = offsetContentLabelOf('Y');
      logInfo(`offsetContentLabelOf(text="Y"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: Y');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0077
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0077
     * @tc.desc      offsetContentLabelOf(text="53Qk") returns "rawfile.txt content with offset: 53Qk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0077 begin`);
      const actual: string = offsetContentLabelOf('53Qk');
      logInfo(`offsetContentLabelOf(text="53Qk"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: 53Qk');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0078
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0078
     * @tc.desc      offsetContentLabelOf(text="7") returns "rawfile.txt content with offset: 7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0078 begin`);
      const actual: string = offsetContentLabelOf('7');
      logInfo(`offsetContentLabelOf(text="7"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: 7');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0079
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0079
     * @tc.desc      offsetContentLabelOf(text="cwHIGTpah1") returns "rawfile.txt content with offset: cwHIGTpah1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0079 begin`);
      const actual: string = offsetContentLabelOf('cwHIGTpah1');
      logInfo(`offsetContentLabelOf(text="cwHIGTpah1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: cwHIGTpah1');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0080
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0080
     * @tc.desc      offsetContentLabelOf(text="9S") returns "rawfile.txt content with offset: 9S"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0080 begin`);
      const actual: string = offsetContentLabelOf('9S');
      logInfo(`offsetContentLabelOf(text="9S"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: 9S');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0081
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0081
     * @tc.desc      offsetContentLabelOf(text="uWut6BAbJZ7") returns "rawfile.txt content with offset: uWut6BAbJZ7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0081 begin`);
      const actual: string = offsetContentLabelOf('uWut6BAbJZ7');
      logInfo(`offsetContentLabelOf(text="uWut6BAbJZ7"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: uWut6BAbJZ7');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0082
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0082
     * @tc.desc      offsetContentLabelOf(text="5XUfiC") returns "rawfile.txt content with offset: 5XUfiC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0082 begin`);
      const actual: string = offsetContentLabelOf('5XUfiC');
      logInfo(`offsetContentLabelOf(text="5XUfiC"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: 5XUfiC');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0083
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0083
     * @tc.desc      offsetContentLabelOf(text="kzr") returns "rawfile.txt content with offset: kzr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0083 begin`);
      const actual: string = offsetContentLabelOf('kzr');
      logInfo(`offsetContentLabelOf(text="kzr"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: kzr');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0084
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0084
     * @tc.desc      offsetContentLabelOf(text="eEh9dsHv16f") returns "rawfile.txt content with offset: eEh9dsHv16f"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0084 begin`);
      const actual: string = offsetContentLabelOf('eEh9dsHv16f');
      logInfo(`offsetContentLabelOf(text="eEh9dsHv16f"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: eEh9dsHv16f');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0085
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0085
     * @tc.desc      offsetContentLabelOf(text="owH7D6ki8") returns "rawfile.txt content with offset: owH7D6ki8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0085 begin`);
      const actual: string = offsetContentLabelOf('owH7D6ki8');
      logInfo(`offsetContentLabelOf(text="owH7D6ki8"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: owH7D6ki8');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0086
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0086
     * @tc.desc      offsetContentLabelOf(text="5wIOO5JZsf") returns "rawfile.txt content with offset: 5wIOO5JZsf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0086 begin`);
      const actual: string = offsetContentLabelOf('5wIOO5JZsf');
      logInfo(`offsetContentLabelOf(text="5wIOO5JZsf"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: 5wIOO5JZsf');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0087
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0087
     * @tc.desc      offsetContentLabelOf(text="OJFN") returns "rawfile.txt content with offset: OJFN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0087 begin`);
      const actual: string = offsetContentLabelOf('OJFN');
      logInfo(`offsetContentLabelOf(text="OJFN"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: OJFN');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0088
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0088
     * @tc.desc      offsetContentLabelOf(text="eZfkVyRAs") returns "rawfile.txt content with offset: eZfkVyRAs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0088 begin`);
      const actual: string = offsetContentLabelOf('eZfkVyRAs');
      logInfo(`offsetContentLabelOf(text="eZfkVyRAs"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: eZfkVyRAs');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0089
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0089
     * @tc.desc      offsetContentLabelOf(text="FazSmxSNd") returns "rawfile.txt content with offset: FazSmxSNd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0089 begin`);
      const actual: string = offsetContentLabelOf('FazSmxSNd');
      logInfo(`offsetContentLabelOf(text="FazSmxSNd"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: FazSmxSNd');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_OFFSET_CONTENT_LABEL_OF_0090
     * @tc.name      NdkRawfile_OffsetContentLabelOf_0090
     * @tc.desc      offsetContentLabelOf(text="YGu7HgFYPn") returns "rawfile.txt content with offset: YGu7HgFYPn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_OffsetContentLabelOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetContentLabelOf_0090 begin`);
      const actual: string = offsetContentLabelOf('YGu7HgFYPn');
      logInfo(`offsetContentLabelOf(text="YGu7HgFYPn"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content with offset: YGu7HgFYPn');
      logInfo(`${BUNDLE}OffsetContentLabelOf_0090 end`);
    });
  });
}
