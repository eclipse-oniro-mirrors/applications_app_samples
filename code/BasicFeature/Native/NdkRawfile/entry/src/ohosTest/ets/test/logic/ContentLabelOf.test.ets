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
import { contentLabelOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for contentLabelOf (90 cases). */
export default function contentLabelOfTest(): void {
  describe('ContentLabelOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0001
     * @tc.name      NdkRawfile_ContentLabelOf_0001
     * @tc.desc      contentLabelOf(text="Hello") returns "rawfile.txt content: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_ContentLabelOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0001 begin`);
      const actual: string = contentLabelOf('Hello');
      logInfo(`contentLabelOf(text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: Hello');
      logInfo(`${BUNDLE}ContentLabelOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0002
     * @tc.name      NdkRawfile_ContentLabelOf_0002
     * @tc.desc      contentLabelOf(text="hello world") returns "rawfile.txt content: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_ContentLabelOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0002 begin`);
      const actual: string = contentLabelOf('hello world');
      logInfo(`contentLabelOf(text="hello world"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: hello world');
      logInfo(`${BUNDLE}ContentLabelOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0003
     * @tc.name      NdkRawfile_ContentLabelOf_0003
     * @tc.desc      contentLabelOf(text="") returns "rawfile.txt content: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0003 begin`);
      const actual: string = contentLabelOf('');
      logInfo(`contentLabelOf(text=""): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: ');
      logInfo(`${BUNDLE}ContentLabelOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0004
     * @tc.name      NdkRawfile_ContentLabelOf_0004
     * @tc.desc      contentLabelOf(text=" ") returns "rawfile.txt content:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0004 begin`);
      const actual: string = contentLabelOf(' ');
      logInfo(`contentLabelOf(text=" "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:  ');
      logInfo(`${BUNDLE}ContentLabelOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0005
     * @tc.name      NdkRawfile_ContentLabelOf_0005
     * @tc.desc      contentLabelOf(text="A") returns "rawfile.txt content: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0005 begin`);
      const actual: string = contentLabelOf('A');
      logInfo(`contentLabelOf(text="A"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: A');
      logInfo(`${BUNDLE}ContentLabelOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0006
     * @tc.name      NdkRawfile_ContentLabelOf_0006
     * @tc.desc      contentLabelOf(text="Sample Title 123") returns "rawfile.txt content: Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0006 begin`);
      const actual: string = contentLabelOf('Sample Title 123');
      logInfo(`contentLabelOf(text="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: Sample Title 123');
      logInfo(`${BUNDLE}ContentLabelOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0007
     * @tc.name      NdkRawfile_ContentLabelOf_0007
     * @tc.desc      contentLabelOf(text="??") returns "rawfile.txt content: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0007 begin`);
      const actual: string = contentLabelOf('\u4e2d\u6587');
      logInfo(`contentLabelOf(text="??"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: \u4e2d\u6587');
      logInfo(`${BUNDLE}ContentLabelOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0008
     * @tc.name      NdkRawfile_ContentLabelOf_0008
     * @tc.desc      contentLabelOf(text="a") returns "rawfile.txt content: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0008 begin`);
      const actual: string = contentLabelOf('a');
      logInfo(`contentLabelOf(text="a"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: a');
      logInfo(`${BUNDLE}ContentLabelOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0009
     * @tc.name      NdkRawfile_ContentLabelOf_0009
     * @tc.desc      contentLabelOf(text="abc") returns "rawfile.txt content: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0009 begin`);
      const actual: string = contentLabelOf('abc');
      logInfo(`contentLabelOf(text="abc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: abc');
      logInfo(`${BUNDLE}ContentLabelOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0010
     * @tc.name      NdkRawfile_ContentLabelOf_0010
     * @tc.desc      contentLabelOf(text="Hello World") returns "rawfile.txt content: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0010 begin`);
      const actual: string = contentLabelOf('Hello World');
      logInfo(`contentLabelOf(text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: Hello World');
      logInfo(`${BUNDLE}ContentLabelOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0011
     * @tc.name      NdkRawfile_ContentLabelOf_0011
     * @tc.desc      contentLabelOf(text="123") returns "rawfile.txt content: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0011 begin`);
      const actual: string = contentLabelOf('123');
      logInfo(`contentLabelOf(text="123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: 123');
      logInfo(`${BUNDLE}ContentLabelOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0012
     * @tc.name      NdkRawfile_ContentLabelOf_0012
     * @tc.desc      contentLabelOf(text=" Hello ") returns "rawfile.txt content:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0012 begin`);
      const actual: string = contentLabelOf(' Hello ');
      logInfo(`contentLabelOf(text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:  Hello ');
      logInfo(`${BUNDLE}ContentLabelOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0013
     * @tc.name      NdkRawfile_ContentLabelOf_0013
     * @tc.desc      contentLabelOf(text="HelloHello") returns "rawfile.txt content: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0013 begin`);
      const actual: string = contentLabelOf('HelloHello');
      logInfo(`contentLabelOf(text="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: HelloHello');
      logInfo(`${BUNDLE}ContentLabelOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0014
     * @tc.name      NdkRawfile_ContentLabelOf_0014
     * @tc.desc      contentLabelOf(text="Hello_1") returns "rawfile.txt content: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0014 begin`);
      const actual: string = contentLabelOf('Hello_1');
      logInfo(`contentLabelOf(text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: Hello_1');
      logInfo(`${BUNDLE}ContentLabelOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0015
     * @tc.name      NdkRawfile_ContentLabelOf_0015
     * @tc.desc      contentLabelOf(text="xHello") returns "rawfile.txt content: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0015 begin`);
      const actual: string = contentLabelOf('xHello');
      logInfo(`contentLabelOf(text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: xHello');
      logInfo(`${BUNDLE}ContentLabelOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0016
     * @tc.name      NdkRawfile_ContentLabelOf_0016
     * @tc.desc      contentLabelOf(text=" hello world ") returns "rawfile.txt content:  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0016 begin`);
      const actual: string = contentLabelOf(' hello world ');
      logInfo(`contentLabelOf(text=" hello world "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:  hello world ');
      logInfo(`${BUNDLE}ContentLabelOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0017
     * @tc.name      NdkRawfile_ContentLabelOf_0017
     * @tc.desc      contentLabelOf(text="hello worldhello world") returns "rawfile.txt content: hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0017 begin`);
      const actual: string = contentLabelOf('hello worldhello world');
      logInfo(`contentLabelOf(text="hello worldhello wor...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: hello worldhello world');
      logInfo(`${BUNDLE}ContentLabelOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0018
     * @tc.name      NdkRawfile_ContentLabelOf_0018
     * @tc.desc      contentLabelOf(text="hello world_1") returns "rawfile.txt content: hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0018 begin`);
      const actual: string = contentLabelOf('hello world_1');
      logInfo(`contentLabelOf(text="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: hello world_1');
      logInfo(`${BUNDLE}ContentLabelOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0019
     * @tc.name      NdkRawfile_ContentLabelOf_0019
     * @tc.desc      contentLabelOf(text="xhello world") returns "rawfile.txt content: xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0019 begin`);
      const actual: string = contentLabelOf('xhello world');
      logInfo(`contentLabelOf(text="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: xhello world');
      logInfo(`${BUNDLE}ContentLabelOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0020
     * @tc.name      NdkRawfile_ContentLabelOf_0020
     * @tc.desc      contentLabelOf(text="   ") returns "rawfile.txt content:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0020 begin`);
      const actual: string = contentLabelOf('   ');
      logInfo(`contentLabelOf(text="   "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:    ');
      logInfo(`${BUNDLE}ContentLabelOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0021
     * @tc.name      NdkRawfile_ContentLabelOf_0021
     * @tc.desc      contentLabelOf(text="  ") returns "rawfile.txt content:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0021 begin`);
      const actual: string = contentLabelOf('  ');
      logInfo(`contentLabelOf(text="  "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:   ');
      logInfo(`${BUNDLE}ContentLabelOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0022
     * @tc.name      NdkRawfile_ContentLabelOf_0022
     * @tc.desc      contentLabelOf(text=" _1") returns "rawfile.txt content:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0022 begin`);
      const actual: string = contentLabelOf(' _1');
      logInfo(`contentLabelOf(text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:  _1');
      logInfo(`${BUNDLE}ContentLabelOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0023
     * @tc.name      NdkRawfile_ContentLabelOf_0023
     * @tc.desc      contentLabelOf(text="x ") returns "rawfile.txt content: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0023 begin`);
      const actual: string = contentLabelOf('x ');
      logInfo(`contentLabelOf(text="x "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: x ');
      logInfo(`${BUNDLE}ContentLabelOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0024
     * @tc.name      NdkRawfile_ContentLabelOf_0024
     * @tc.desc      contentLabelOf(text=" A ") returns "rawfile.txt content:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0024 begin`);
      const actual: string = contentLabelOf(' A ');
      logInfo(`contentLabelOf(text=" A "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:  A ');
      logInfo(`${BUNDLE}ContentLabelOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0025
     * @tc.name      NdkRawfile_ContentLabelOf_0025
     * @tc.desc      contentLabelOf(text="AA") returns "rawfile.txt content: AA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0025 begin`);
      const actual: string = contentLabelOf('AA');
      logInfo(`contentLabelOf(text="AA"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: AA');
      logInfo(`${BUNDLE}ContentLabelOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0026
     * @tc.name      NdkRawfile_ContentLabelOf_0026
     * @tc.desc      contentLabelOf(text="A_1") returns "rawfile.txt content: A_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0026 begin`);
      const actual: string = contentLabelOf('A_1');
      logInfo(`contentLabelOf(text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: A_1');
      logInfo(`${BUNDLE}ContentLabelOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0027
     * @tc.name      NdkRawfile_ContentLabelOf_0027
     * @tc.desc      contentLabelOf(text="xA") returns "rawfile.txt content: xA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0027 begin`);
      const actual: string = contentLabelOf('xA');
      logInfo(`contentLabelOf(text="xA"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: xA');
      logInfo(`${BUNDLE}ContentLabelOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0028
     * @tc.name      NdkRawfile_ContentLabelOf_0028
     * @tc.desc      contentLabelOf(text=" Sample Title 123 ") returns "rawfile.txt content:  Sample Title 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0028 begin`);
      const actual: string = contentLabelOf(' Sample Title 123 ');
      logInfo(`contentLabelOf(text=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:  Sample Title 123 ');
      logInfo(`${BUNDLE}ContentLabelOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0029
     * @tc.name      NdkRawfile_ContentLabelOf_0029
     * @tc.desc      contentLabelOf(text="Sample Title 123Sample Title 123") returns "rawfile.txt content: Sample Tit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0029 begin`);
      const actual: string = contentLabelOf('Sample Title 123Sample Title 123');
      logInfo(`contentLabelOf(text="Sample Title 123Samp...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: Sample Title 123Sample Title 123');
      logInfo(`${BUNDLE}ContentLabelOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0030
     * @tc.name      NdkRawfile_ContentLabelOf_0030
     * @tc.desc      contentLabelOf(text="Sample Title 123_1") returns "rawfile.txt content: Sample Title 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0030 begin`);
      const actual: string = contentLabelOf('Sample Title 123_1');
      logInfo(`contentLabelOf(text="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: Sample Title 123_1');
      logInfo(`${BUNDLE}ContentLabelOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0031
     * @tc.name      NdkRawfile_ContentLabelOf_0031
     * @tc.desc      contentLabelOf(text="xSample Title 123") returns "rawfile.txt content: xSample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0031 begin`);
      const actual: string = contentLabelOf('xSample Title 123');
      logInfo(`contentLabelOf(text="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: xSample Title 123');
      logInfo(`${BUNDLE}ContentLabelOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0032
     * @tc.name      NdkRawfile_ContentLabelOf_0032
     * @tc.desc      contentLabelOf(text=" ?? ") returns "rawfile.txt content:  ?? "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0032 begin`);
      const actual: string = contentLabelOf(' \u4e2d\u6587 ');
      logInfo(`contentLabelOf(text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:  \u4e2d\u6587 ');
      logInfo(`${BUNDLE}ContentLabelOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0033
     * @tc.name      NdkRawfile_ContentLabelOf_0033
     * @tc.desc      contentLabelOf(text="????") returns "rawfile.txt content: ????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0033 begin`);
      const actual: string = contentLabelOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`contentLabelOf(text="????"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: \u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}ContentLabelOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0034
     * @tc.name      NdkRawfile_ContentLabelOf_0034
     * @tc.desc      contentLabelOf(text="??_1") returns "rawfile.txt content: ??_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0034 begin`);
      const actual: string = contentLabelOf('\u4e2d\u6587_1');
      logInfo(`contentLabelOf(text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: \u4e2d\u6587_1');
      logInfo(`${BUNDLE}ContentLabelOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0035
     * @tc.name      NdkRawfile_ContentLabelOf_0035
     * @tc.desc      contentLabelOf(text="x??") returns "rawfile.txt content: x??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0035 begin`);
      const actual: string = contentLabelOf('x\u4e2d\u6587');
      logInfo(`contentLabelOf(text="x??"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: x\u4e2d\u6587');
      logInfo(`${BUNDLE}ContentLabelOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0036
     * @tc.name      NdkRawfile_ContentLabelOf_0036
     * @tc.desc      contentLabelOf(text=" a ") returns "rawfile.txt content:  a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0036 begin`);
      const actual: string = contentLabelOf(' a ');
      logInfo(`contentLabelOf(text=" a "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:  a ');
      logInfo(`${BUNDLE}ContentLabelOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0037
     * @tc.name      NdkRawfile_ContentLabelOf_0037
     * @tc.desc      contentLabelOf(text="aa") returns "rawfile.txt content: aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0037 begin`);
      const actual: string = contentLabelOf('aa');
      logInfo(`contentLabelOf(text="aa"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: aa');
      logInfo(`${BUNDLE}ContentLabelOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0038
     * @tc.name      NdkRawfile_ContentLabelOf_0038
     * @tc.desc      contentLabelOf(text="a_1") returns "rawfile.txt content: a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0038 begin`);
      const actual: string = contentLabelOf('a_1');
      logInfo(`contentLabelOf(text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: a_1');
      logInfo(`${BUNDLE}ContentLabelOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0039
     * @tc.name      NdkRawfile_ContentLabelOf_0039
     * @tc.desc      contentLabelOf(text="xa") returns "rawfile.txt content: xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0039 begin`);
      const actual: string = contentLabelOf('xa');
      logInfo(`contentLabelOf(text="xa"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: xa');
      logInfo(`${BUNDLE}ContentLabelOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0040
     * @tc.name      NdkRawfile_ContentLabelOf_0040
     * @tc.desc      contentLabelOf(text=" abc ") returns "rawfile.txt content:  abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0040 begin`);
      const actual: string = contentLabelOf(' abc ');
      logInfo(`contentLabelOf(text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:  abc ');
      logInfo(`${BUNDLE}ContentLabelOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0041
     * @tc.name      NdkRawfile_ContentLabelOf_0041
     * @tc.desc      contentLabelOf(text="abcabc") returns "rawfile.txt content: abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0041 begin`);
      const actual: string = contentLabelOf('abcabc');
      logInfo(`contentLabelOf(text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: abcabc');
      logInfo(`${BUNDLE}ContentLabelOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0042
     * @tc.name      NdkRawfile_ContentLabelOf_0042
     * @tc.desc      contentLabelOf(text="abc_1") returns "rawfile.txt content: abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0042 begin`);
      const actual: string = contentLabelOf('abc_1');
      logInfo(`contentLabelOf(text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: abc_1');
      logInfo(`${BUNDLE}ContentLabelOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0043
     * @tc.name      NdkRawfile_ContentLabelOf_0043
     * @tc.desc      contentLabelOf(text="xabc") returns "rawfile.txt content: xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0043 begin`);
      const actual: string = contentLabelOf('xabc');
      logInfo(`contentLabelOf(text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: xabc');
      logInfo(`${BUNDLE}ContentLabelOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0044
     * @tc.name      NdkRawfile_ContentLabelOf_0044
     * @tc.desc      contentLabelOf(text=" Hello World ") returns "rawfile.txt content:  Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0044 begin`);
      const actual: string = contentLabelOf(' Hello World ');
      logInfo(`contentLabelOf(text=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:  Hello World ');
      logInfo(`${BUNDLE}ContentLabelOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0045
     * @tc.name      NdkRawfile_ContentLabelOf_0045
     * @tc.desc      contentLabelOf(text="Hello WorldHello World") returns "rawfile.txt content: Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0045 begin`);
      const actual: string = contentLabelOf('Hello WorldHello World');
      logInfo(`contentLabelOf(text="Hello WorldHello Wor...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: Hello WorldHello World');
      logInfo(`${BUNDLE}ContentLabelOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0046
     * @tc.name      NdkRawfile_ContentLabelOf_0046
     * @tc.desc      contentLabelOf(text="Hello World_1") returns "rawfile.txt content: Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0046 begin`);
      const actual: string = contentLabelOf('Hello World_1');
      logInfo(`contentLabelOf(text="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: Hello World_1');
      logInfo(`${BUNDLE}ContentLabelOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0047
     * @tc.name      NdkRawfile_ContentLabelOf_0047
     * @tc.desc      contentLabelOf(text="xHello World") returns "rawfile.txt content: xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0047 begin`);
      const actual: string = contentLabelOf('xHello World');
      logInfo(`contentLabelOf(text="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: xHello World');
      logInfo(`${BUNDLE}ContentLabelOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0048
     * @tc.name      NdkRawfile_ContentLabelOf_0048
     * @tc.desc      contentLabelOf(text=" 123 ") returns "rawfile.txt content:  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0048 begin`);
      const actual: string = contentLabelOf(' 123 ');
      logInfo(`contentLabelOf(text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content:  123 ');
      logInfo(`${BUNDLE}ContentLabelOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0049
     * @tc.name      NdkRawfile_ContentLabelOf_0049
     * @tc.desc      contentLabelOf(text="123123") returns "rawfile.txt content: 123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0049 begin`);
      const actual: string = contentLabelOf('123123');
      logInfo(`contentLabelOf(text="123123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: 123123');
      logInfo(`${BUNDLE}ContentLabelOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0050
     * @tc.name      NdkRawfile_ContentLabelOf_0050
     * @tc.desc      contentLabelOf(text="123_1") returns "rawfile.txt content: 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0050 begin`);
      const actual: string = contentLabelOf('123_1');
      logInfo(`contentLabelOf(text="123_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: 123_1');
      logInfo(`${BUNDLE}ContentLabelOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0051
     * @tc.name      NdkRawfile_ContentLabelOf_0051
     * @tc.desc      contentLabelOf(text="x123") returns "rawfile.txt content: x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ContentLabelOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0051 begin`);
      const actual: string = contentLabelOf('x123');
      logInfo(`contentLabelOf(text="x123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: x123');
      logInfo(`${BUNDLE}ContentLabelOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0052
     * @tc.name      NdkRawfile_ContentLabelOf_0052
     * @tc.desc      contentLabelOf(text="H7z2") returns "rawfile.txt content: H7z2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0052 begin`);
      const actual: string = contentLabelOf('H7z2');
      logInfo(`contentLabelOf(text="H7z2"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: H7z2');
      logInfo(`${BUNDLE}ContentLabelOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0053
     * @tc.name      NdkRawfile_ContentLabelOf_0053
     * @tc.desc      contentLabelOf(text="M7") returns "rawfile.txt content: M7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0053 begin`);
      const actual: string = contentLabelOf('M7');
      logInfo(`contentLabelOf(text="M7"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: M7');
      logInfo(`${BUNDLE}ContentLabelOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0054
     * @tc.name      NdkRawfile_ContentLabelOf_0054
     * @tc.desc      contentLabelOf(text="yTHfxGpU") returns "rawfile.txt content: yTHfxGpU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0054 begin`);
      const actual: string = contentLabelOf('yTHfxGpU');
      logInfo(`contentLabelOf(text="yTHfxGpU"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: yTHfxGpU');
      logInfo(`${BUNDLE}ContentLabelOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0055
     * @tc.name      NdkRawfile_ContentLabelOf_0055
     * @tc.desc      contentLabelOf(text="zv1pHUp") returns "rawfile.txt content: zv1pHUp"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0055 begin`);
      const actual: string = contentLabelOf('zv1pHUp');
      logInfo(`contentLabelOf(text="zv1pHUp"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: zv1pHUp');
      logInfo(`${BUNDLE}ContentLabelOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0056
     * @tc.name      NdkRawfile_ContentLabelOf_0056
     * @tc.desc      contentLabelOf(text="eKZijWYxTve") returns "rawfile.txt content: eKZijWYxTve"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0056 begin`);
      const actual: string = contentLabelOf('eKZijWYxTve');
      logInfo(`contentLabelOf(text="eKZijWYxTve"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: eKZijWYxTve');
      logInfo(`${BUNDLE}ContentLabelOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0057
     * @tc.name      NdkRawfile_ContentLabelOf_0057
     * @tc.desc      contentLabelOf(text="D5smX6Vksk") returns "rawfile.txt content: D5smX6Vksk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0057 begin`);
      const actual: string = contentLabelOf('D5smX6Vksk');
      logInfo(`contentLabelOf(text="D5smX6Vksk"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: D5smX6Vksk');
      logInfo(`${BUNDLE}ContentLabelOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0058
     * @tc.name      NdkRawfile_ContentLabelOf_0058
     * @tc.desc      contentLabelOf(text="2RzU") returns "rawfile.txt content: 2RzU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0058 begin`);
      const actual: string = contentLabelOf('2RzU');
      logInfo(`contentLabelOf(text="2RzU"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: 2RzU');
      logInfo(`${BUNDLE}ContentLabelOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0059
     * @tc.name      NdkRawfile_ContentLabelOf_0059
     * @tc.desc      contentLabelOf(text="8f2NCJo8Ed") returns "rawfile.txt content: 8f2NCJo8Ed"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0059 begin`);
      const actual: string = contentLabelOf('8f2NCJo8Ed');
      logInfo(`contentLabelOf(text="8f2NCJo8Ed"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: 8f2NCJo8Ed');
      logInfo(`${BUNDLE}ContentLabelOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0060
     * @tc.name      NdkRawfile_ContentLabelOf_0060
     * @tc.desc      contentLabelOf(text="642jQs23Oru") returns "rawfile.txt content: 642jQs23Oru"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0060 begin`);
      const actual: string = contentLabelOf('642jQs23Oru');
      logInfo(`contentLabelOf(text="642jQs23Oru"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: 642jQs23Oru');
      logInfo(`${BUNDLE}ContentLabelOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0061
     * @tc.name      NdkRawfile_ContentLabelOf_0061
     * @tc.desc      contentLabelOf(text="nY7my") returns "rawfile.txt content: nY7my"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0061 begin`);
      const actual: string = contentLabelOf('nY7my');
      logInfo(`contentLabelOf(text="nY7my"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: nY7my');
      logInfo(`${BUNDLE}ContentLabelOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0062
     * @tc.name      NdkRawfile_ContentLabelOf_0062
     * @tc.desc      contentLabelOf(text="dcHM") returns "rawfile.txt content: dcHM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0062 begin`);
      const actual: string = contentLabelOf('dcHM');
      logInfo(`contentLabelOf(text="dcHM"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: dcHM');
      logInfo(`${BUNDLE}ContentLabelOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0063
     * @tc.name      NdkRawfile_ContentLabelOf_0063
     * @tc.desc      contentLabelOf(text="nzvtrJwqAZm3") returns "rawfile.txt content: nzvtrJwqAZm3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0063 begin`);
      const actual: string = contentLabelOf('nzvtrJwqAZm3');
      logInfo(`contentLabelOf(text="nzvtrJwqAZm3"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: nzvtrJwqAZm3');
      logInfo(`${BUNDLE}ContentLabelOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0064
     * @tc.name      NdkRawfile_ContentLabelOf_0064
     * @tc.desc      contentLabelOf(text="cG4ZkL") returns "rawfile.txt content: cG4ZkL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0064 begin`);
      const actual: string = contentLabelOf('cG4ZkL');
      logInfo(`contentLabelOf(text="cG4ZkL"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: cG4ZkL');
      logInfo(`${BUNDLE}ContentLabelOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0065
     * @tc.name      NdkRawfile_ContentLabelOf_0065
     * @tc.desc      contentLabelOf(text="fY") returns "rawfile.txt content: fY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0065 begin`);
      const actual: string = contentLabelOf('fY');
      logInfo(`contentLabelOf(text="fY"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: fY');
      logInfo(`${BUNDLE}ContentLabelOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0066
     * @tc.name      NdkRawfile_ContentLabelOf_0066
     * @tc.desc      contentLabelOf(text="YohgfeP") returns "rawfile.txt content: YohgfeP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0066 begin`);
      const actual: string = contentLabelOf('YohgfeP');
      logInfo(`contentLabelOf(text="YohgfeP"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: YohgfeP');
      logInfo(`${BUNDLE}ContentLabelOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0067
     * @tc.name      NdkRawfile_ContentLabelOf_0067
     * @tc.desc      contentLabelOf(text="T") returns "rawfile.txt content: T"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0067 begin`);
      const actual: string = contentLabelOf('T');
      logInfo(`contentLabelOf(text="T"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: T');
      logInfo(`${BUNDLE}ContentLabelOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0068
     * @tc.name      NdkRawfile_ContentLabelOf_0068
     * @tc.desc      contentLabelOf(text="LHmwwc") returns "rawfile.txt content: LHmwwc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0068 begin`);
      const actual: string = contentLabelOf('LHmwwc');
      logInfo(`contentLabelOf(text="LHmwwc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: LHmwwc');
      logInfo(`${BUNDLE}ContentLabelOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0069
     * @tc.name      NdkRawfile_ContentLabelOf_0069
     * @tc.desc      contentLabelOf(text="YjVJNZbYXlTb") returns "rawfile.txt content: YjVJNZbYXlTb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0069 begin`);
      const actual: string = contentLabelOf('YjVJNZbYXlTb');
      logInfo(`contentLabelOf(text="YjVJNZbYXlTb"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: YjVJNZbYXlTb');
      logInfo(`${BUNDLE}ContentLabelOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0070
     * @tc.name      NdkRawfile_ContentLabelOf_0070
     * @tc.desc      contentLabelOf(text="tZIoaXp7") returns "rawfile.txt content: tZIoaXp7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0070 begin`);
      const actual: string = contentLabelOf('tZIoaXp7');
      logInfo(`contentLabelOf(text="tZIoaXp7"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: tZIoaXp7');
      logInfo(`${BUNDLE}ContentLabelOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0071
     * @tc.name      NdkRawfile_ContentLabelOf_0071
     * @tc.desc      contentLabelOf(text="tdSctqDsV") returns "rawfile.txt content: tdSctqDsV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0071 begin`);
      const actual: string = contentLabelOf('tdSctqDsV');
      logInfo(`contentLabelOf(text="tdSctqDsV"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: tdSctqDsV');
      logInfo(`${BUNDLE}ContentLabelOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0072
     * @tc.name      NdkRawfile_ContentLabelOf_0072
     * @tc.desc      contentLabelOf(text="rYcP") returns "rawfile.txt content: rYcP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0072 begin`);
      const actual: string = contentLabelOf('rYcP');
      logInfo(`contentLabelOf(text="rYcP"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: rYcP');
      logInfo(`${BUNDLE}ContentLabelOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0073
     * @tc.name      NdkRawfile_ContentLabelOf_0073
     * @tc.desc      contentLabelOf(text="yK7sTq") returns "rawfile.txt content: yK7sTq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0073 begin`);
      const actual: string = contentLabelOf('yK7sTq');
      logInfo(`contentLabelOf(text="yK7sTq"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: yK7sTq');
      logInfo(`${BUNDLE}ContentLabelOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0074
     * @tc.name      NdkRawfile_ContentLabelOf_0074
     * @tc.desc      contentLabelOf(text="vI23ghlU") returns "rawfile.txt content: vI23ghlU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0074 begin`);
      const actual: string = contentLabelOf('vI23ghlU');
      logInfo(`contentLabelOf(text="vI23ghlU"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: vI23ghlU');
      logInfo(`${BUNDLE}ContentLabelOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0075
     * @tc.name      NdkRawfile_ContentLabelOf_0075
     * @tc.desc      contentLabelOf(text="Z65penVB") returns "rawfile.txt content: Z65penVB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0075 begin`);
      const actual: string = contentLabelOf('Z65penVB');
      logInfo(`contentLabelOf(text="Z65penVB"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: Z65penVB');
      logInfo(`${BUNDLE}ContentLabelOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0076
     * @tc.name      NdkRawfile_ContentLabelOf_0076
     * @tc.desc      contentLabelOf(text="8") returns "rawfile.txt content: 8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0076 begin`);
      const actual: string = contentLabelOf('8');
      logInfo(`contentLabelOf(text="8"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: 8');
      logInfo(`${BUNDLE}ContentLabelOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0077
     * @tc.name      NdkRawfile_ContentLabelOf_0077
     * @tc.desc      contentLabelOf(text="5Y") returns "rawfile.txt content: 5Y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0077 begin`);
      const actual: string = contentLabelOf('5Y');
      logInfo(`contentLabelOf(text="5Y"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: 5Y');
      logInfo(`${BUNDLE}ContentLabelOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0078
     * @tc.name      NdkRawfile_ContentLabelOf_0078
     * @tc.desc      contentLabelOf(text="gPROdx") returns "rawfile.txt content: gPROdx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0078 begin`);
      const actual: string = contentLabelOf('gPROdx');
      logInfo(`contentLabelOf(text="gPROdx"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: gPROdx');
      logInfo(`${BUNDLE}ContentLabelOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0079
     * @tc.name      NdkRawfile_ContentLabelOf_0079
     * @tc.desc      contentLabelOf(text="lrLkZzfPj00") returns "rawfile.txt content: lrLkZzfPj00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0079 begin`);
      const actual: string = contentLabelOf('lrLkZzfPj00');
      logInfo(`contentLabelOf(text="lrLkZzfPj00"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: lrLkZzfPj00');
      logInfo(`${BUNDLE}ContentLabelOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0080
     * @tc.name      NdkRawfile_ContentLabelOf_0080
     * @tc.desc      contentLabelOf(text="p") returns "rawfile.txt content: p"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0080 begin`);
      const actual: string = contentLabelOf('p');
      logInfo(`contentLabelOf(text="p"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: p');
      logInfo(`${BUNDLE}ContentLabelOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0081
     * @tc.name      NdkRawfile_ContentLabelOf_0081
     * @tc.desc      contentLabelOf(text="c7lFLa") returns "rawfile.txt content: c7lFLa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0081 begin`);
      const actual: string = contentLabelOf('c7lFLa');
      logInfo(`contentLabelOf(text="c7lFLa"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: c7lFLa');
      logInfo(`${BUNDLE}ContentLabelOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0082
     * @tc.name      NdkRawfile_ContentLabelOf_0082
     * @tc.desc      contentLabelOf(text="RJ") returns "rawfile.txt content: RJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0082 begin`);
      const actual: string = contentLabelOf('RJ');
      logInfo(`contentLabelOf(text="RJ"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: RJ');
      logInfo(`${BUNDLE}ContentLabelOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0083
     * @tc.name      NdkRawfile_ContentLabelOf_0083
     * @tc.desc      contentLabelOf(text="XkWYrnD9x") returns "rawfile.txt content: XkWYrnD9x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0083 begin`);
      const actual: string = contentLabelOf('XkWYrnD9x');
      logInfo(`contentLabelOf(text="XkWYrnD9x"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: XkWYrnD9x');
      logInfo(`${BUNDLE}ContentLabelOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0084
     * @tc.name      NdkRawfile_ContentLabelOf_0084
     * @tc.desc      contentLabelOf(text="20oh05gPmL2") returns "rawfile.txt content: 20oh05gPmL2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0084 begin`);
      const actual: string = contentLabelOf('20oh05gPmL2');
      logInfo(`contentLabelOf(text="20oh05gPmL2"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: 20oh05gPmL2');
      logInfo(`${BUNDLE}ContentLabelOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0085
     * @tc.name      NdkRawfile_ContentLabelOf_0085
     * @tc.desc      contentLabelOf(text="TVmBH") returns "rawfile.txt content: TVmBH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0085 begin`);
      const actual: string = contentLabelOf('TVmBH');
      logInfo(`contentLabelOf(text="TVmBH"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: TVmBH');
      logInfo(`${BUNDLE}ContentLabelOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0086
     * @tc.name      NdkRawfile_ContentLabelOf_0086
     * @tc.desc      contentLabelOf(text="TxHnyURd0CH") returns "rawfile.txt content: TxHnyURd0CH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0086 begin`);
      const actual: string = contentLabelOf('TxHnyURd0CH');
      logInfo(`contentLabelOf(text="TxHnyURd0CH"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: TxHnyURd0CH');
      logInfo(`${BUNDLE}ContentLabelOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0087
     * @tc.name      NdkRawfile_ContentLabelOf_0087
     * @tc.desc      contentLabelOf(text="YFc") returns "rawfile.txt content: YFc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0087 begin`);
      const actual: string = contentLabelOf('YFc');
      logInfo(`contentLabelOf(text="YFc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: YFc');
      logInfo(`${BUNDLE}ContentLabelOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0088
     * @tc.name      NdkRawfile_ContentLabelOf_0088
     * @tc.desc      contentLabelOf(text="e1HX3") returns "rawfile.txt content: e1HX3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0088 begin`);
      const actual: string = contentLabelOf('e1HX3');
      logInfo(`contentLabelOf(text="e1HX3"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: e1HX3');
      logInfo(`${BUNDLE}ContentLabelOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0089
     * @tc.name      NdkRawfile_ContentLabelOf_0089
     * @tc.desc      contentLabelOf(text="w5mPhmPclz") returns "rawfile.txt content: w5mPhmPclz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0089 begin`);
      const actual: string = contentLabelOf('w5mPhmPclz');
      logInfo(`contentLabelOf(text="w5mPhmPclz"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: w5mPhmPclz');
      logInfo(`${BUNDLE}ContentLabelOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT_LABEL_OF_0090
     * @tc.name      NdkRawfile_ContentLabelOf_0090
     * @tc.desc      contentLabelOf(text="EEeyd3V") returns "rawfile.txt content: EEeyd3V"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ContentLabelOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentLabelOf_0090 begin`);
      const actual: string = contentLabelOf('EEeyd3V');
      logInfo(`contentLabelOf(text="EEeyd3V"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content: EEeyd3V');
      logInfo(`${BUNDLE}ContentLabelOf_0090 end`);
    });
  });
}
