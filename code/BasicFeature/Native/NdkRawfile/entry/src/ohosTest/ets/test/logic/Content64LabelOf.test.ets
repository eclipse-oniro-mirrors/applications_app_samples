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
import { content64LabelOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for content64LabelOf (90 cases). */
export default function content64LabelOfTest(): void {
  describe('Content64LabelOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0001
     * @tc.name      NdkRawfile_Content64LabelOf_0001
     * @tc.desc      content64LabelOf(text="Hello") returns "rawfile.txt content64: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_Content64LabelOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0001 begin`);
      const actual: string = content64LabelOf('Hello');
      logInfo(`content64LabelOf(text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Hello');
      logInfo(`${BUNDLE}Content64LabelOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0002
     * @tc.name      NdkRawfile_Content64LabelOf_0002
     * @tc.desc      content64LabelOf(text="hello world") returns "rawfile.txt content64: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_Content64LabelOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0002 begin`);
      const actual: string = content64LabelOf('hello world');
      logInfo(`content64LabelOf(text="hello world"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: hello world');
      logInfo(`${BUNDLE}Content64LabelOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0003
     * @tc.name      NdkRawfile_Content64LabelOf_0003
     * @tc.desc      content64LabelOf(text="") returns "rawfile.txt content64: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0003 begin`);
      const actual: string = content64LabelOf('');
      logInfo(`content64LabelOf(text=""): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: ');
      logInfo(`${BUNDLE}Content64LabelOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0004
     * @tc.name      NdkRawfile_Content64LabelOf_0004
     * @tc.desc      content64LabelOf(text=" ") returns "rawfile.txt content64:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0004 begin`);
      const actual: string = content64LabelOf(' ');
      logInfo(`content64LabelOf(text=" "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:  ');
      logInfo(`${BUNDLE}Content64LabelOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0005
     * @tc.name      NdkRawfile_Content64LabelOf_0005
     * @tc.desc      content64LabelOf(text="A") returns "rawfile.txt content64: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0005 begin`);
      const actual: string = content64LabelOf('A');
      logInfo(`content64LabelOf(text="A"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: A');
      logInfo(`${BUNDLE}Content64LabelOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0006
     * @tc.name      NdkRawfile_Content64LabelOf_0006
     * @tc.desc      content64LabelOf(text="Sample Title 123") returns "rawfile.txt content64: Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0006 begin`);
      const actual: string = content64LabelOf('Sample Title 123');
      logInfo(`content64LabelOf(text="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Sample Title 123');
      logInfo(`${BUNDLE}Content64LabelOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0007
     * @tc.name      NdkRawfile_Content64LabelOf_0007
     * @tc.desc      content64LabelOf(text="??") returns "rawfile.txt content64: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0007 begin`);
      const actual: string = content64LabelOf('\u4e2d\u6587');
      logInfo(`content64LabelOf(text="??"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: \u4e2d\u6587');
      logInfo(`${BUNDLE}Content64LabelOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0008
     * @tc.name      NdkRawfile_Content64LabelOf_0008
     * @tc.desc      content64LabelOf(text="a") returns "rawfile.txt content64: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0008 begin`);
      const actual: string = content64LabelOf('a');
      logInfo(`content64LabelOf(text="a"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: a');
      logInfo(`${BUNDLE}Content64LabelOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0009
     * @tc.name      NdkRawfile_Content64LabelOf_0009
     * @tc.desc      content64LabelOf(text="abc") returns "rawfile.txt content64: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0009 begin`);
      const actual: string = content64LabelOf('abc');
      logInfo(`content64LabelOf(text="abc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: abc');
      logInfo(`${BUNDLE}Content64LabelOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0010
     * @tc.name      NdkRawfile_Content64LabelOf_0010
     * @tc.desc      content64LabelOf(text="Hello World") returns "rawfile.txt content64: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0010 begin`);
      const actual: string = content64LabelOf('Hello World');
      logInfo(`content64LabelOf(text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Hello World');
      logInfo(`${BUNDLE}Content64LabelOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0011
     * @tc.name      NdkRawfile_Content64LabelOf_0011
     * @tc.desc      content64LabelOf(text="123") returns "rawfile.txt content64: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0011 begin`);
      const actual: string = content64LabelOf('123');
      logInfo(`content64LabelOf(text="123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: 123');
      logInfo(`${BUNDLE}Content64LabelOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0012
     * @tc.name      NdkRawfile_Content64LabelOf_0012
     * @tc.desc      content64LabelOf(text=" Hello ") returns "rawfile.txt content64:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0012 begin`);
      const actual: string = content64LabelOf(' Hello ');
      logInfo(`content64LabelOf(text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:  Hello ');
      logInfo(`${BUNDLE}Content64LabelOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0013
     * @tc.name      NdkRawfile_Content64LabelOf_0013
     * @tc.desc      content64LabelOf(text="HelloHello") returns "rawfile.txt content64: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0013 begin`);
      const actual: string = content64LabelOf('HelloHello');
      logInfo(`content64LabelOf(text="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: HelloHello');
      logInfo(`${BUNDLE}Content64LabelOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0014
     * @tc.name      NdkRawfile_Content64LabelOf_0014
     * @tc.desc      content64LabelOf(text="Hello_1") returns "rawfile.txt content64: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0014 begin`);
      const actual: string = content64LabelOf('Hello_1');
      logInfo(`content64LabelOf(text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Hello_1');
      logInfo(`${BUNDLE}Content64LabelOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0015
     * @tc.name      NdkRawfile_Content64LabelOf_0015
     * @tc.desc      content64LabelOf(text="xHello") returns "rawfile.txt content64: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0015 begin`);
      const actual: string = content64LabelOf('xHello');
      logInfo(`content64LabelOf(text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: xHello');
      logInfo(`${BUNDLE}Content64LabelOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0016
     * @tc.name      NdkRawfile_Content64LabelOf_0016
     * @tc.desc      content64LabelOf(text=" hello world ") returns "rawfile.txt content64:  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0016 begin`);
      const actual: string = content64LabelOf(' hello world ');
      logInfo(`content64LabelOf(text=" hello world "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:  hello world ');
      logInfo(`${BUNDLE}Content64LabelOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0017
     * @tc.name      NdkRawfile_Content64LabelOf_0017
     * @tc.desc      content64LabelOf(text="hello worldhello world") returns "rawfile.txt content64: hello worldhello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0017 begin`);
      const actual: string = content64LabelOf('hello worldhello world');
      logInfo(`content64LabelOf(text="hello worldhello w...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: hello worldhello world');
      logInfo(`${BUNDLE}Content64LabelOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0018
     * @tc.name      NdkRawfile_Content64LabelOf_0018
     * @tc.desc      content64LabelOf(text="hello world_1") returns "rawfile.txt content64: hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0018 begin`);
      const actual: string = content64LabelOf('hello world_1');
      logInfo(`content64LabelOf(text="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: hello world_1');
      logInfo(`${BUNDLE}Content64LabelOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0019
     * @tc.name      NdkRawfile_Content64LabelOf_0019
     * @tc.desc      content64LabelOf(text="xhello world") returns "rawfile.txt content64: xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0019 begin`);
      const actual: string = content64LabelOf('xhello world');
      logInfo(`content64LabelOf(text="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: xhello world');
      logInfo(`${BUNDLE}Content64LabelOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0020
     * @tc.name      NdkRawfile_Content64LabelOf_0020
     * @tc.desc      content64LabelOf(text="   ") returns "rawfile.txt content64:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0020 begin`);
      const actual: string = content64LabelOf('   ');
      logInfo(`content64LabelOf(text="   "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:    ');
      logInfo(`${BUNDLE}Content64LabelOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0021
     * @tc.name      NdkRawfile_Content64LabelOf_0021
     * @tc.desc      content64LabelOf(text="  ") returns "rawfile.txt content64:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0021 begin`);
      const actual: string = content64LabelOf('  ');
      logInfo(`content64LabelOf(text="  "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:   ');
      logInfo(`${BUNDLE}Content64LabelOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0022
     * @tc.name      NdkRawfile_Content64LabelOf_0022
     * @tc.desc      content64LabelOf(text=" _1") returns "rawfile.txt content64:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0022 begin`);
      const actual: string = content64LabelOf(' _1');
      logInfo(`content64LabelOf(text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:  _1');
      logInfo(`${BUNDLE}Content64LabelOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0023
     * @tc.name      NdkRawfile_Content64LabelOf_0023
     * @tc.desc      content64LabelOf(text="x ") returns "rawfile.txt content64: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0023 begin`);
      const actual: string = content64LabelOf('x ');
      logInfo(`content64LabelOf(text="x "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: x ');
      logInfo(`${BUNDLE}Content64LabelOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0024
     * @tc.name      NdkRawfile_Content64LabelOf_0024
     * @tc.desc      content64LabelOf(text=" A ") returns "rawfile.txt content64:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0024 begin`);
      const actual: string = content64LabelOf(' A ');
      logInfo(`content64LabelOf(text=" A "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:  A ');
      logInfo(`${BUNDLE}Content64LabelOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0025
     * @tc.name      NdkRawfile_Content64LabelOf_0025
     * @tc.desc      content64LabelOf(text="AA") returns "rawfile.txt content64: AA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0025 begin`);
      const actual: string = content64LabelOf('AA');
      logInfo(`content64LabelOf(text="AA"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: AA');
      logInfo(`${BUNDLE}Content64LabelOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0026
     * @tc.name      NdkRawfile_Content64LabelOf_0026
     * @tc.desc      content64LabelOf(text="A_1") returns "rawfile.txt content64: A_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0026 begin`);
      const actual: string = content64LabelOf('A_1');
      logInfo(`content64LabelOf(text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: A_1');
      logInfo(`${BUNDLE}Content64LabelOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0027
     * @tc.name      NdkRawfile_Content64LabelOf_0027
     * @tc.desc      content64LabelOf(text="xA") returns "rawfile.txt content64: xA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0027 begin`);
      const actual: string = content64LabelOf('xA');
      logInfo(`content64LabelOf(text="xA"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: xA');
      logInfo(`${BUNDLE}Content64LabelOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0028
     * @tc.name      NdkRawfile_Content64LabelOf_0028
     * @tc.desc      content64LabelOf(text=" Sample Title 123 ") returns "rawfile.txt content64:  Sample Title 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0028 begin`);
      const actual: string = content64LabelOf(' Sample Title 123 ');
      logInfo(`content64LabelOf(text=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:  Sample Title 123 ');
      logInfo(`${BUNDLE}Content64LabelOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0029
     * @tc.name      NdkRawfile_Content64LabelOf_0029
     * @tc.desc      content64LabelOf(text="Sample Title 123Sample Title 123") returns "rawfile.txt content64: Sample...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0029 begin`);
      const actual: string = content64LabelOf('Sample Title 123Sample Title 123');
      logInfo(`content64LabelOf(text="Sample Title 123Sa...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Sample Title 123Sample Title 123');
      logInfo(`${BUNDLE}Content64LabelOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0030
     * @tc.name      NdkRawfile_Content64LabelOf_0030
     * @tc.desc      content64LabelOf(text="Sample Title 123_1") returns "rawfile.txt content64: Sample Title 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0030 begin`);
      const actual: string = content64LabelOf('Sample Title 123_1');
      logInfo(`content64LabelOf(text="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Sample Title 123_1');
      logInfo(`${BUNDLE}Content64LabelOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0031
     * @tc.name      NdkRawfile_Content64LabelOf_0031
     * @tc.desc      content64LabelOf(text="xSample Title 123") returns "rawfile.txt content64: xSample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0031 begin`);
      const actual: string = content64LabelOf('xSample Title 123');
      logInfo(`content64LabelOf(text="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: xSample Title 123');
      logInfo(`${BUNDLE}Content64LabelOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0032
     * @tc.name      NdkRawfile_Content64LabelOf_0032
     * @tc.desc      content64LabelOf(text=" ?? ") returns "rawfile.txt content64:  ?? "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0032 begin`);
      const actual: string = content64LabelOf(' \u4e2d\u6587 ');
      logInfo(`content64LabelOf(text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:  \u4e2d\u6587 ');
      logInfo(`${BUNDLE}Content64LabelOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0033
     * @tc.name      NdkRawfile_Content64LabelOf_0033
     * @tc.desc      content64LabelOf(text="????") returns "rawfile.txt content64: ????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0033 begin`);
      const actual: string = content64LabelOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`content64LabelOf(text="????"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: \u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}Content64LabelOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0034
     * @tc.name      NdkRawfile_Content64LabelOf_0034
     * @tc.desc      content64LabelOf(text="??_1") returns "rawfile.txt content64: ??_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0034 begin`);
      const actual: string = content64LabelOf('\u4e2d\u6587_1');
      logInfo(`content64LabelOf(text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: \u4e2d\u6587_1');
      logInfo(`${BUNDLE}Content64LabelOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0035
     * @tc.name      NdkRawfile_Content64LabelOf_0035
     * @tc.desc      content64LabelOf(text="x??") returns "rawfile.txt content64: x??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0035 begin`);
      const actual: string = content64LabelOf('x\u4e2d\u6587');
      logInfo(`content64LabelOf(text="x??"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: x\u4e2d\u6587');
      logInfo(`${BUNDLE}Content64LabelOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0036
     * @tc.name      NdkRawfile_Content64LabelOf_0036
     * @tc.desc      content64LabelOf(text=" a ") returns "rawfile.txt content64:  a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0036 begin`);
      const actual: string = content64LabelOf(' a ');
      logInfo(`content64LabelOf(text=" a "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:  a ');
      logInfo(`${BUNDLE}Content64LabelOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0037
     * @tc.name      NdkRawfile_Content64LabelOf_0037
     * @tc.desc      content64LabelOf(text="aa") returns "rawfile.txt content64: aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0037 begin`);
      const actual: string = content64LabelOf('aa');
      logInfo(`content64LabelOf(text="aa"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: aa');
      logInfo(`${BUNDLE}Content64LabelOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0038
     * @tc.name      NdkRawfile_Content64LabelOf_0038
     * @tc.desc      content64LabelOf(text="a_1") returns "rawfile.txt content64: a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0038 begin`);
      const actual: string = content64LabelOf('a_1');
      logInfo(`content64LabelOf(text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: a_1');
      logInfo(`${BUNDLE}Content64LabelOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0039
     * @tc.name      NdkRawfile_Content64LabelOf_0039
     * @tc.desc      content64LabelOf(text="xa") returns "rawfile.txt content64: xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0039 begin`);
      const actual: string = content64LabelOf('xa');
      logInfo(`content64LabelOf(text="xa"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: xa');
      logInfo(`${BUNDLE}Content64LabelOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0040
     * @tc.name      NdkRawfile_Content64LabelOf_0040
     * @tc.desc      content64LabelOf(text=" abc ") returns "rawfile.txt content64:  abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0040 begin`);
      const actual: string = content64LabelOf(' abc ');
      logInfo(`content64LabelOf(text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:  abc ');
      logInfo(`${BUNDLE}Content64LabelOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0041
     * @tc.name      NdkRawfile_Content64LabelOf_0041
     * @tc.desc      content64LabelOf(text="abcabc") returns "rawfile.txt content64: abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0041 begin`);
      const actual: string = content64LabelOf('abcabc');
      logInfo(`content64LabelOf(text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: abcabc');
      logInfo(`${BUNDLE}Content64LabelOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0042
     * @tc.name      NdkRawfile_Content64LabelOf_0042
     * @tc.desc      content64LabelOf(text="abc_1") returns "rawfile.txt content64: abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0042 begin`);
      const actual: string = content64LabelOf('abc_1');
      logInfo(`content64LabelOf(text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: abc_1');
      logInfo(`${BUNDLE}Content64LabelOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0043
     * @tc.name      NdkRawfile_Content64LabelOf_0043
     * @tc.desc      content64LabelOf(text="xabc") returns "rawfile.txt content64: xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0043 begin`);
      const actual: string = content64LabelOf('xabc');
      logInfo(`content64LabelOf(text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: xabc');
      logInfo(`${BUNDLE}Content64LabelOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0044
     * @tc.name      NdkRawfile_Content64LabelOf_0044
     * @tc.desc      content64LabelOf(text=" Hello World ") returns "rawfile.txt content64:  Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0044 begin`);
      const actual: string = content64LabelOf(' Hello World ');
      logInfo(`content64LabelOf(text=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:  Hello World ');
      logInfo(`${BUNDLE}Content64LabelOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0045
     * @tc.name      NdkRawfile_Content64LabelOf_0045
     * @tc.desc      content64LabelOf(text="Hello WorldHello World") returns "rawfile.txt content64: Hello WorldHello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0045 begin`);
      const actual: string = content64LabelOf('Hello WorldHello World');
      logInfo(`content64LabelOf(text="Hello WorldHello W...: actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Hello WorldHello World');
      logInfo(`${BUNDLE}Content64LabelOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0046
     * @tc.name      NdkRawfile_Content64LabelOf_0046
     * @tc.desc      content64LabelOf(text="Hello World_1") returns "rawfile.txt content64: Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0046 begin`);
      const actual: string = content64LabelOf('Hello World_1');
      logInfo(`content64LabelOf(text="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Hello World_1');
      logInfo(`${BUNDLE}Content64LabelOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0047
     * @tc.name      NdkRawfile_Content64LabelOf_0047
     * @tc.desc      content64LabelOf(text="xHello World") returns "rawfile.txt content64: xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0047 begin`);
      const actual: string = content64LabelOf('xHello World');
      logInfo(`content64LabelOf(text="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: xHello World');
      logInfo(`${BUNDLE}Content64LabelOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0048
     * @tc.name      NdkRawfile_Content64LabelOf_0048
     * @tc.desc      content64LabelOf(text=" 123 ") returns "rawfile.txt content64:  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0048 begin`);
      const actual: string = content64LabelOf(' 123 ');
      logInfo(`content64LabelOf(text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64:  123 ');
      logInfo(`${BUNDLE}Content64LabelOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0049
     * @tc.name      NdkRawfile_Content64LabelOf_0049
     * @tc.desc      content64LabelOf(text="123123") returns "rawfile.txt content64: 123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0049 begin`);
      const actual: string = content64LabelOf('123123');
      logInfo(`content64LabelOf(text="123123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: 123123');
      logInfo(`${BUNDLE}Content64LabelOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0050
     * @tc.name      NdkRawfile_Content64LabelOf_0050
     * @tc.desc      content64LabelOf(text="123_1") returns "rawfile.txt content64: 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0050 begin`);
      const actual: string = content64LabelOf('123_1');
      logInfo(`content64LabelOf(text="123_1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: 123_1');
      logInfo(`${BUNDLE}Content64LabelOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0051
     * @tc.name      NdkRawfile_Content64LabelOf_0051
     * @tc.desc      content64LabelOf(text="x123") returns "rawfile.txt content64: x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_Content64LabelOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0051 begin`);
      const actual: string = content64LabelOf('x123');
      logInfo(`content64LabelOf(text="x123"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: x123');
      logInfo(`${BUNDLE}Content64LabelOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0052
     * @tc.name      NdkRawfile_Content64LabelOf_0052
     * @tc.desc      content64LabelOf(text="A26930gL") returns "rawfile.txt content64: A26930gL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0052 begin`);
      const actual: string = content64LabelOf('A26930gL');
      logInfo(`content64LabelOf(text="A26930gL"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: A26930gL');
      logInfo(`${BUNDLE}Content64LabelOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0053
     * @tc.name      NdkRawfile_Content64LabelOf_0053
     * @tc.desc      content64LabelOf(text="08XhxD0bBBe1") returns "rawfile.txt content64: 08XhxD0bBBe1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0053 begin`);
      const actual: string = content64LabelOf('08XhxD0bBBe1');
      logInfo(`content64LabelOf(text="08XhxD0bBBe1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: 08XhxD0bBBe1');
      logInfo(`${BUNDLE}Content64LabelOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0054
     * @tc.name      NdkRawfile_Content64LabelOf_0054
     * @tc.desc      content64LabelOf(text="WJE0O8") returns "rawfile.txt content64: WJE0O8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0054 begin`);
      const actual: string = content64LabelOf('WJE0O8');
      logInfo(`content64LabelOf(text="WJE0O8"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: WJE0O8');
      logInfo(`${BUNDLE}Content64LabelOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0055
     * @tc.name      NdkRawfile_Content64LabelOf_0055
     * @tc.desc      content64LabelOf(text="AFF1Hla9W") returns "rawfile.txt content64: AFF1Hla9W"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0055 begin`);
      const actual: string = content64LabelOf('AFF1Hla9W');
      logInfo(`content64LabelOf(text="AFF1Hla9W"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: AFF1Hla9W');
      logInfo(`${BUNDLE}Content64LabelOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0056
     * @tc.name      NdkRawfile_Content64LabelOf_0056
     * @tc.desc      content64LabelOf(text="4nJv1k6zMXn") returns "rawfile.txt content64: 4nJv1k6zMXn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0056 begin`);
      const actual: string = content64LabelOf('4nJv1k6zMXn');
      logInfo(`content64LabelOf(text="4nJv1k6zMXn"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: 4nJv1k6zMXn');
      logInfo(`${BUNDLE}Content64LabelOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0057
     * @tc.name      NdkRawfile_Content64LabelOf_0057
     * @tc.desc      content64LabelOf(text="3P3Lrd") returns "rawfile.txt content64: 3P3Lrd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0057 begin`);
      const actual: string = content64LabelOf('3P3Lrd');
      logInfo(`content64LabelOf(text="3P3Lrd"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: 3P3Lrd');
      logInfo(`${BUNDLE}Content64LabelOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0058
     * @tc.name      NdkRawfile_Content64LabelOf_0058
     * @tc.desc      content64LabelOf(text="cL3Omj5NAtL") returns "rawfile.txt content64: cL3Omj5NAtL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0058 begin`);
      const actual: string = content64LabelOf('cL3Omj5NAtL');
      logInfo(`content64LabelOf(text="cL3Omj5NAtL"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: cL3Omj5NAtL');
      logInfo(`${BUNDLE}Content64LabelOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0059
     * @tc.name      NdkRawfile_Content64LabelOf_0059
     * @tc.desc      content64LabelOf(text="OXnx07") returns "rawfile.txt content64: OXnx07"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0059 begin`);
      const actual: string = content64LabelOf('OXnx07');
      logInfo(`content64LabelOf(text="OXnx07"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: OXnx07');
      logInfo(`${BUNDLE}Content64LabelOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0060
     * @tc.name      NdkRawfile_Content64LabelOf_0060
     * @tc.desc      content64LabelOf(text="C3U9wC5dvt") returns "rawfile.txt content64: C3U9wC5dvt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0060 begin`);
      const actual: string = content64LabelOf('C3U9wC5dvt');
      logInfo(`content64LabelOf(text="C3U9wC5dvt"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: C3U9wC5dvt');
      logInfo(`${BUNDLE}Content64LabelOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0061
     * @tc.name      NdkRawfile_Content64LabelOf_0061
     * @tc.desc      content64LabelOf(text="mnFcsu") returns "rawfile.txt content64: mnFcsu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0061 begin`);
      const actual: string = content64LabelOf('mnFcsu');
      logInfo(`content64LabelOf(text="mnFcsu"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: mnFcsu');
      logInfo(`${BUNDLE}Content64LabelOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0062
     * @tc.name      NdkRawfile_Content64LabelOf_0062
     * @tc.desc      content64LabelOf(text="WGlD") returns "rawfile.txt content64: WGlD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0062 begin`);
      const actual: string = content64LabelOf('WGlD');
      logInfo(`content64LabelOf(text="WGlD"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: WGlD');
      logInfo(`${BUNDLE}Content64LabelOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0063
     * @tc.name      NdkRawfile_Content64LabelOf_0063
     * @tc.desc      content64LabelOf(text="eDNYq6N") returns "rawfile.txt content64: eDNYq6N"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0063 begin`);
      const actual: string = content64LabelOf('eDNYq6N');
      logInfo(`content64LabelOf(text="eDNYq6N"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: eDNYq6N');
      logInfo(`${BUNDLE}Content64LabelOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0064
     * @tc.name      NdkRawfile_Content64LabelOf_0064
     * @tc.desc      content64LabelOf(text="DXB") returns "rawfile.txt content64: DXB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0064 begin`);
      const actual: string = content64LabelOf('DXB');
      logInfo(`content64LabelOf(text="DXB"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: DXB');
      logInfo(`${BUNDLE}Content64LabelOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0065
     * @tc.name      NdkRawfile_Content64LabelOf_0065
     * @tc.desc      content64LabelOf(text="bMBIVK") returns "rawfile.txt content64: bMBIVK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0065 begin`);
      const actual: string = content64LabelOf('bMBIVK');
      logInfo(`content64LabelOf(text="bMBIVK"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: bMBIVK');
      logInfo(`${BUNDLE}Content64LabelOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0066
     * @tc.name      NdkRawfile_Content64LabelOf_0066
     * @tc.desc      content64LabelOf(text="Zs9J7q") returns "rawfile.txt content64: Zs9J7q"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0066 begin`);
      const actual: string = content64LabelOf('Zs9J7q');
      logInfo(`content64LabelOf(text="Zs9J7q"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Zs9J7q');
      logInfo(`${BUNDLE}Content64LabelOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0067
     * @tc.name      NdkRawfile_Content64LabelOf_0067
     * @tc.desc      content64LabelOf(text="J6dh03el8Okv") returns "rawfile.txt content64: J6dh03el8Okv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0067 begin`);
      const actual: string = content64LabelOf('J6dh03el8Okv');
      logInfo(`content64LabelOf(text="J6dh03el8Okv"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: J6dh03el8Okv');
      logInfo(`${BUNDLE}Content64LabelOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0068
     * @tc.name      NdkRawfile_Content64LabelOf_0068
     * @tc.desc      content64LabelOf(text="bqwvl8ler") returns "rawfile.txt content64: bqwvl8ler"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0068 begin`);
      const actual: string = content64LabelOf('bqwvl8ler');
      logInfo(`content64LabelOf(text="bqwvl8ler"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: bqwvl8ler');
      logInfo(`${BUNDLE}Content64LabelOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0069
     * @tc.name      NdkRawfile_Content64LabelOf_0069
     * @tc.desc      content64LabelOf(text="9ljb0E16AOx") returns "rawfile.txt content64: 9ljb0E16AOx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0069 begin`);
      const actual: string = content64LabelOf('9ljb0E16AOx');
      logInfo(`content64LabelOf(text="9ljb0E16AOx"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: 9ljb0E16AOx');
      logInfo(`${BUNDLE}Content64LabelOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0070
     * @tc.name      NdkRawfile_Content64LabelOf_0070
     * @tc.desc      content64LabelOf(text="iHKpbTls05") returns "rawfile.txt content64: iHKpbTls05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0070 begin`);
      const actual: string = content64LabelOf('iHKpbTls05');
      logInfo(`content64LabelOf(text="iHKpbTls05"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: iHKpbTls05');
      logInfo(`${BUNDLE}Content64LabelOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0071
     * @tc.name      NdkRawfile_Content64LabelOf_0071
     * @tc.desc      content64LabelOf(text="SgLfGu6t") returns "rawfile.txt content64: SgLfGu6t"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0071 begin`);
      const actual: string = content64LabelOf('SgLfGu6t');
      logInfo(`content64LabelOf(text="SgLfGu6t"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: SgLfGu6t');
      logInfo(`${BUNDLE}Content64LabelOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0072
     * @tc.name      NdkRawfile_Content64LabelOf_0072
     * @tc.desc      content64LabelOf(text="r9C1") returns "rawfile.txt content64: r9C1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0072 begin`);
      const actual: string = content64LabelOf('r9C1');
      logInfo(`content64LabelOf(text="r9C1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: r9C1');
      logInfo(`${BUNDLE}Content64LabelOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0073
     * @tc.name      NdkRawfile_Content64LabelOf_0073
     * @tc.desc      content64LabelOf(text="e4j") returns "rawfile.txt content64: e4j"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0073 begin`);
      const actual: string = content64LabelOf('e4j');
      logInfo(`content64LabelOf(text="e4j"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: e4j');
      logInfo(`${BUNDLE}Content64LabelOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0074
     * @tc.name      NdkRawfile_Content64LabelOf_0074
     * @tc.desc      content64LabelOf(text="GWNaVzMCLK") returns "rawfile.txt content64: GWNaVzMCLK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0074 begin`);
      const actual: string = content64LabelOf('GWNaVzMCLK');
      logInfo(`content64LabelOf(text="GWNaVzMCLK"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: GWNaVzMCLK');
      logInfo(`${BUNDLE}Content64LabelOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0075
     * @tc.name      NdkRawfile_Content64LabelOf_0075
     * @tc.desc      content64LabelOf(text="KfMhVL") returns "rawfile.txt content64: KfMhVL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0075 begin`);
      const actual: string = content64LabelOf('KfMhVL');
      logInfo(`content64LabelOf(text="KfMhVL"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: KfMhVL');
      logInfo(`${BUNDLE}Content64LabelOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0076
     * @tc.name      NdkRawfile_Content64LabelOf_0076
     * @tc.desc      content64LabelOf(text="yHr") returns "rawfile.txt content64: yHr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0076 begin`);
      const actual: string = content64LabelOf('yHr');
      logInfo(`content64LabelOf(text="yHr"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: yHr');
      logInfo(`${BUNDLE}Content64LabelOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0077
     * @tc.name      NdkRawfile_Content64LabelOf_0077
     * @tc.desc      content64LabelOf(text="hS7sYrPZ") returns "rawfile.txt content64: hS7sYrPZ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0077 begin`);
      const actual: string = content64LabelOf('hS7sYrPZ');
      logInfo(`content64LabelOf(text="hS7sYrPZ"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: hS7sYrPZ');
      logInfo(`${BUNDLE}Content64LabelOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0078
     * @tc.name      NdkRawfile_Content64LabelOf_0078
     * @tc.desc      content64LabelOf(text="V") returns "rawfile.txt content64: V"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0078 begin`);
      const actual: string = content64LabelOf('V');
      logInfo(`content64LabelOf(text="V"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: V');
      logInfo(`${BUNDLE}Content64LabelOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0079
     * @tc.name      NdkRawfile_Content64LabelOf_0079
     * @tc.desc      content64LabelOf(text="HbKXs") returns "rawfile.txt content64: HbKXs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0079 begin`);
      const actual: string = content64LabelOf('HbKXs');
      logInfo(`content64LabelOf(text="HbKXs"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: HbKXs');
      logInfo(`${BUNDLE}Content64LabelOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0080
     * @tc.name      NdkRawfile_Content64LabelOf_0080
     * @tc.desc      content64LabelOf(text="0cZq9Opc4t") returns "rawfile.txt content64: 0cZq9Opc4t"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0080 begin`);
      const actual: string = content64LabelOf('0cZq9Opc4t');
      logInfo(`content64LabelOf(text="0cZq9Opc4t"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: 0cZq9Opc4t');
      logInfo(`${BUNDLE}Content64LabelOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0081
     * @tc.name      NdkRawfile_Content64LabelOf_0081
     * @tc.desc      content64LabelOf(text="JJ") returns "rawfile.txt content64: JJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0081 begin`);
      const actual: string = content64LabelOf('JJ');
      logInfo(`content64LabelOf(text="JJ"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: JJ');
      logInfo(`${BUNDLE}Content64LabelOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0082
     * @tc.name      NdkRawfile_Content64LabelOf_0082
     * @tc.desc      content64LabelOf(text="qtTc") returns "rawfile.txt content64: qtTc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0082 begin`);
      const actual: string = content64LabelOf('qtTc');
      logInfo(`content64LabelOf(text="qtTc"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: qtTc');
      logInfo(`${BUNDLE}Content64LabelOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0083
     * @tc.name      NdkRawfile_Content64LabelOf_0083
     * @tc.desc      content64LabelOf(text="z7XX1") returns "rawfile.txt content64: z7XX1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0083 begin`);
      const actual: string = content64LabelOf('z7XX1');
      logInfo(`content64LabelOf(text="z7XX1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: z7XX1');
      logInfo(`${BUNDLE}Content64LabelOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0084
     * @tc.name      NdkRawfile_Content64LabelOf_0084
     * @tc.desc      content64LabelOf(text="N1I3NuoiIP") returns "rawfile.txt content64: N1I3NuoiIP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0084 begin`);
      const actual: string = content64LabelOf('N1I3NuoiIP');
      logInfo(`content64LabelOf(text="N1I3NuoiIP"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: N1I3NuoiIP');
      logInfo(`${BUNDLE}Content64LabelOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0085
     * @tc.name      NdkRawfile_Content64LabelOf_0085
     * @tc.desc      content64LabelOf(text="Lq0C5sILW") returns "rawfile.txt content64: Lq0C5sILW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0085 begin`);
      const actual: string = content64LabelOf('Lq0C5sILW');
      logInfo(`content64LabelOf(text="Lq0C5sILW"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Lq0C5sILW');
      logInfo(`${BUNDLE}Content64LabelOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0086
     * @tc.name      NdkRawfile_Content64LabelOf_0086
     * @tc.desc      content64LabelOf(text="oeHpyQP8") returns "rawfile.txt content64: oeHpyQP8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0086 begin`);
      const actual: string = content64LabelOf('oeHpyQP8');
      logInfo(`content64LabelOf(text="oeHpyQP8"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: oeHpyQP8');
      logInfo(`${BUNDLE}Content64LabelOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0087
     * @tc.name      NdkRawfile_Content64LabelOf_0087
     * @tc.desc      content64LabelOf(text="76hW7kXTL1") returns "rawfile.txt content64: 76hW7kXTL1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0087 begin`);
      const actual: string = content64LabelOf('76hW7kXTL1');
      logInfo(`content64LabelOf(text="76hW7kXTL1"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: 76hW7kXTL1');
      logInfo(`${BUNDLE}Content64LabelOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0088
     * @tc.name      NdkRawfile_Content64LabelOf_0088
     * @tc.desc      content64LabelOf(text="Ro") returns "rawfile.txt content64: Ro"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0088 begin`);
      const actual: string = content64LabelOf('Ro');
      logInfo(`content64LabelOf(text="Ro"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Ro');
      logInfo(`${BUNDLE}Content64LabelOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0089
     * @tc.name      NdkRawfile_Content64LabelOf_0089
     * @tc.desc      content64LabelOf(text="Z418Y5POb") returns "rawfile.txt content64: Z418Y5POb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0089 begin`);
      const actual: string = content64LabelOf('Z418Y5POb');
      logInfo(`content64LabelOf(text="Z418Y5POb"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: Z418Y5POb');
      logInfo(`${BUNDLE}Content64LabelOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_CONTENT64_LABEL_OF_0090
     * @tc.name      NdkRawfile_Content64LabelOf_0090
     * @tc.desc      content64LabelOf(text="obCTukEhB") returns "rawfile.txt content64: obCTukEhB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_Content64LabelOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Content64LabelOf_0090 begin`);
      const actual: string = content64LabelOf('obCTukEhB');
      logInfo(`content64LabelOf(text="obCTukEhB"): actual=${actual}`);
      expect(actual).assertEqual('rawfile.txt content64: obCTukEhB');
      logInfo(`${BUNDLE}Content64LabelOf_0090 end`);
    });
  });
}
