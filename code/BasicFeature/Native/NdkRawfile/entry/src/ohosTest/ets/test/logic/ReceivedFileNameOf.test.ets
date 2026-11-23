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
import { receivedFileNameOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for receivedFileNameOf (90 cases). */
export default function receivedFileNameOfTest(): void {
  describe('ReceivedFileNameOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0001
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0001
     * @tc.desc      receivedFileNameOf(name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_ReceivedFileNameOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0001 begin`);
      const actual: string = receivedFileNameOf('Hello');
      logInfo(`receivedFileNameOf(name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0002
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0002
     * @tc.desc      receivedFileNameOf(name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_ReceivedFileNameOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0002 begin`);
      const actual: string = receivedFileNameOf('hello world');
      logInfo(`receivedFileNameOf(name="hello world"): actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0003
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0003
     * @tc.desc      receivedFileNameOf(name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0003 begin`);
      const actual: string = receivedFileNameOf('');
      logInfo(`receivedFileNameOf(name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0004
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0004
     * @tc.desc      receivedFileNameOf(name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0004 begin`);
      const actual: string = receivedFileNameOf(' ');
      logInfo(`receivedFileNameOf(name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0005
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0005
     * @tc.desc      receivedFileNameOf(name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0005 begin`);
      const actual: string = receivedFileNameOf('A');
      logInfo(`receivedFileNameOf(name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0006
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0006
     * @tc.desc      receivedFileNameOf(name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0006 begin`);
      const actual: string = receivedFileNameOf('Sample Title 123');
      logInfo(`receivedFileNameOf(name="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0007
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0007
     * @tc.desc      receivedFileNameOf(name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0007 begin`);
      const actual: string = receivedFileNameOf('\u4e2d\u6587');
      logInfo(`receivedFileNameOf(name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0008
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0008
     * @tc.desc      receivedFileNameOf(name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0008 begin`);
      const actual: string = receivedFileNameOf('a');
      logInfo(`receivedFileNameOf(name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0009
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0009
     * @tc.desc      receivedFileNameOf(name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0009 begin`);
      const actual: string = receivedFileNameOf('abc');
      logInfo(`receivedFileNameOf(name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0010
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0010
     * @tc.desc      receivedFileNameOf(name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0010 begin`);
      const actual: string = receivedFileNameOf('Hello World');
      logInfo(`receivedFileNameOf(name="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0011
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0011
     * @tc.desc      receivedFileNameOf(name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0011 begin`);
      const actual: string = receivedFileNameOf('123');
      logInfo(`receivedFileNameOf(name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0012
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0012
     * @tc.desc      receivedFileNameOf(name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0012 begin`);
      const actual: string = receivedFileNameOf(' Hello ');
      logInfo(`receivedFileNameOf(name=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0013
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0013
     * @tc.desc      receivedFileNameOf(name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0013 begin`);
      const actual: string = receivedFileNameOf('HelloHello');
      logInfo(`receivedFileNameOf(name="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0014
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0014
     * @tc.desc      receivedFileNameOf(name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0014 begin`);
      const actual: string = receivedFileNameOf('Hello_1');
      logInfo(`receivedFileNameOf(name="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0015
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0015
     * @tc.desc      receivedFileNameOf(name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0015 begin`);
      const actual: string = receivedFileNameOf('xHello');
      logInfo(`receivedFileNameOf(name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0016
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0016
     * @tc.desc      receivedFileNameOf(name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0016 begin`);
      const actual: string = receivedFileNameOf(' hello world ');
      logInfo(`receivedFileNameOf(name=" hello world "): actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0017
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0017
     * @tc.desc      receivedFileNameOf(name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0017 begin`);
      const actual: string = receivedFileNameOf('hello worldhello world');
      logInfo(`receivedFileNameOf(name="hello worldhello...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0018
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0018
     * @tc.desc      receivedFileNameOf(name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0018 begin`);
      const actual: string = receivedFileNameOf('hello world_1');
      logInfo(`receivedFileNameOf(name="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0019
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0019
     * @tc.desc      receivedFileNameOf(name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0019 begin`);
      const actual: string = receivedFileNameOf('xhello world');
      logInfo(`receivedFileNameOf(name="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0020
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0020
     * @tc.desc      receivedFileNameOf(name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0020 begin`);
      const actual: string = receivedFileNameOf('   ');
      logInfo(`receivedFileNameOf(name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0021
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0021
     * @tc.desc      receivedFileNameOf(name="  ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0021 begin`);
      const actual: string = receivedFileNameOf('  ');
      logInfo(`receivedFileNameOf(name="  "): actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0022
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0022
     * @tc.desc      receivedFileNameOf(name=" _1") returns " _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0022 begin`);
      const actual: string = receivedFileNameOf(' _1');
      logInfo(`receivedFileNameOf(name=" _1"): actual=${actual}`);
      expect(actual).assertEqual(' _1');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0023
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0023
     * @tc.desc      receivedFileNameOf(name="x ") returns "x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0023 begin`);
      const actual: string = receivedFileNameOf('x ');
      logInfo(`receivedFileNameOf(name="x "): actual=${actual}`);
      expect(actual).assertEqual('x ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0024
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0024
     * @tc.desc      receivedFileNameOf(name=" A ") returns " A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0024 begin`);
      const actual: string = receivedFileNameOf(' A ');
      logInfo(`receivedFileNameOf(name=" A "): actual=${actual}`);
      expect(actual).assertEqual(' A ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0025
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0025
     * @tc.desc      receivedFileNameOf(name="AA") returns "AA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0025 begin`);
      const actual: string = receivedFileNameOf('AA');
      logInfo(`receivedFileNameOf(name="AA"): actual=${actual}`);
      expect(actual).assertEqual('AA');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0026
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0026
     * @tc.desc      receivedFileNameOf(name="A_1") returns "A_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0026 begin`);
      const actual: string = receivedFileNameOf('A_1');
      logInfo(`receivedFileNameOf(name="A_1"): actual=${actual}`);
      expect(actual).assertEqual('A_1');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0027
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0027
     * @tc.desc      receivedFileNameOf(name="xA") returns "xA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0027 begin`);
      const actual: string = receivedFileNameOf('xA');
      logInfo(`receivedFileNameOf(name="xA"): actual=${actual}`);
      expect(actual).assertEqual('xA');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0028
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0028
     * @tc.desc      receivedFileNameOf(name=" Sample Title 123 ") returns " Sample Title 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0028 begin`);
      const actual: string = receivedFileNameOf(' Sample Title 123 ');
      logInfo(`receivedFileNameOf(name=" Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual(' Sample Title 123 ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0029
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0029
     * @tc.desc      receivedFileNameOf(name="Sample Title 123Sample Title 123") returns "Sample Title 123Sample Titl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0029 begin`);
      const actual: string = receivedFileNameOf('Sample Title 123Sample Title 123');
      logInfo(`receivedFileNameOf(name="Sample Title 123...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0030
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0030
     * @tc.desc      receivedFileNameOf(name="Sample Title 123_1") returns "Sample Title 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0030 begin`);
      const actual: string = receivedFileNameOf('Sample Title 123_1');
      logInfo(`receivedFileNameOf(name="Sample Title 123...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123_1');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0031
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0031
     * @tc.desc      receivedFileNameOf(name="xSample Title 123") returns "xSample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0031 begin`);
      const actual: string = receivedFileNameOf('xSample Title 123');
      logInfo(`receivedFileNameOf(name="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('xSample Title 123');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0032
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0032
     * @tc.desc      receivedFileNameOf(name=" ?? ") returns " ?? "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0032 begin`);
      const actual: string = receivedFileNameOf(' \u4e2d\u6587 ');
      logInfo(`receivedFileNameOf(name=" ?? "): actual=${actual}`);
      expect(actual).assertEqual(' \u4e2d\u6587 ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0033
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0033
     * @tc.desc      receivedFileNameOf(name="????") returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0033 begin`);
      const actual: string = receivedFileNameOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`receivedFileNameOf(name="????"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0034
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0034
     * @tc.desc      receivedFileNameOf(name="??_1") returns "??_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0034 begin`);
      const actual: string = receivedFileNameOf('\u4e2d\u6587_1');
      logInfo(`receivedFileNameOf(name="??_1"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587_1');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0035
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0035
     * @tc.desc      receivedFileNameOf(name="x??") returns "x??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0035 begin`);
      const actual: string = receivedFileNameOf('x\u4e2d\u6587');
      logInfo(`receivedFileNameOf(name="x??"): actual=${actual}`);
      expect(actual).assertEqual('x\u4e2d\u6587');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0036
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0036
     * @tc.desc      receivedFileNameOf(name=" a ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0036 begin`);
      const actual: string = receivedFileNameOf(' a ');
      logInfo(`receivedFileNameOf(name=" a "): actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0037
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0037
     * @tc.desc      receivedFileNameOf(name="aa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0037 begin`);
      const actual: string = receivedFileNameOf('aa');
      logInfo(`receivedFileNameOf(name="aa"): actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0038
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0038
     * @tc.desc      receivedFileNameOf(name="a_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0038 begin`);
      const actual: string = receivedFileNameOf('a_1');
      logInfo(`receivedFileNameOf(name="a_1"): actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0039
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0039
     * @tc.desc      receivedFileNameOf(name="xa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0039 begin`);
      const actual: string = receivedFileNameOf('xa');
      logInfo(`receivedFileNameOf(name="xa"): actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0040
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0040
     * @tc.desc      receivedFileNameOf(name=" abc ") returns " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0040 begin`);
      const actual: string = receivedFileNameOf(' abc ');
      logInfo(`receivedFileNameOf(name=" abc "): actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0041
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0041
     * @tc.desc      receivedFileNameOf(name="abcabc") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0041 begin`);
      const actual: string = receivedFileNameOf('abcabc');
      logInfo(`receivedFileNameOf(name="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0042
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0042
     * @tc.desc      receivedFileNameOf(name="abc_1") returns "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0042 begin`);
      const actual: string = receivedFileNameOf('abc_1');
      logInfo(`receivedFileNameOf(name="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0043
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0043
     * @tc.desc      receivedFileNameOf(name="xabc") returns "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0043 begin`);
      const actual: string = receivedFileNameOf('xabc');
      logInfo(`receivedFileNameOf(name="xabc"): actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0044
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0044
     * @tc.desc      receivedFileNameOf(name=" Hello World ") returns " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0044 begin`);
      const actual: string = receivedFileNameOf(' Hello World ');
      logInfo(`receivedFileNameOf(name=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0045
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0045
     * @tc.desc      receivedFileNameOf(name="Hello WorldHello World") returns "Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0045 begin`);
      const actual: string = receivedFileNameOf('Hello WorldHello World');
      logInfo(`receivedFileNameOf(name="Hello WorldHello...: actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0046
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0046
     * @tc.desc      receivedFileNameOf(name="Hello World_1") returns "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0046 begin`);
      const actual: string = receivedFileNameOf('Hello World_1');
      logInfo(`receivedFileNameOf(name="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0047
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0047
     * @tc.desc      receivedFileNameOf(name="xHello World") returns "xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0047 begin`);
      const actual: string = receivedFileNameOf('xHello World');
      logInfo(`receivedFileNameOf(name="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('xHello World');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0048
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0048
     * @tc.desc      receivedFileNameOf(name=" 123 ") returns " 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0048 begin`);
      const actual: string = receivedFileNameOf(' 123 ');
      logInfo(`receivedFileNameOf(name=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(' 123 ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0049
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0049
     * @tc.desc      receivedFileNameOf(name="123123") returns "123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0049 begin`);
      const actual: string = receivedFileNameOf('123123');
      logInfo(`receivedFileNameOf(name="123123"): actual=${actual}`);
      expect(actual).assertEqual('123123');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0050
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0050
     * @tc.desc      receivedFileNameOf(name="123_1") returns "123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0050 begin`);
      const actual: string = receivedFileNameOf('123_1');
      logInfo(`receivedFileNameOf(name="123_1"): actual=${actual}`);
      expect(actual).assertEqual('123_1');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0051
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0051
     * @tc.desc      receivedFileNameOf(name="x123") returns "x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_ReceivedFileNameOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0051 begin`);
      const actual: string = receivedFileNameOf('x123');
      logInfo(`receivedFileNameOf(name="x123"): actual=${actual}`);
      expect(actual).assertEqual('x123');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0052
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0052
     * @tc.desc      receivedFileNameOf(name="IZz") returns "IZz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0052 begin`);
      const actual: string = receivedFileNameOf('IZz');
      logInfo(`receivedFileNameOf(name="IZz"): actual=${actual}`);
      expect(actual).assertEqual('IZz');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0053
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0053
     * @tc.desc      receivedFileNameOf(name="hX1iENNBkiN") returns "hX1iENNBkiN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0053 begin`);
      const actual: string = receivedFileNameOf('hX1iENNBkiN');
      logInfo(`receivedFileNameOf(name="hX1iENNBkiN"): actual=${actual}`);
      expect(actual).assertEqual('hX1iENNBkiN');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0054
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0054
     * @tc.desc      receivedFileNameOf(name="f") returns "f"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0054 begin`);
      const actual: string = receivedFileNameOf('f');
      logInfo(`receivedFileNameOf(name="f"): actual=${actual}`);
      expect(actual).assertEqual('f');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0055
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0055
     * @tc.desc      receivedFileNameOf(name="iKVyx7IAUJHM") returns "iKVyx7IAUJHM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0055 begin`);
      const actual: string = receivedFileNameOf('iKVyx7IAUJHM');
      logInfo(`receivedFileNameOf(name="iKVyx7IAUJHM"): actual=${actual}`);
      expect(actual).assertEqual('iKVyx7IAUJHM');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0056
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0056
     * @tc.desc      receivedFileNameOf(name="vucc") returns "vucc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0056 begin`);
      const actual: string = receivedFileNameOf('vucc');
      logInfo(`receivedFileNameOf(name="vucc"): actual=${actual}`);
      expect(actual).assertEqual('vucc');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0057
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0057
     * @tc.desc      receivedFileNameOf(name="ZplxUGy2") returns "ZplxUGy2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0057 begin`);
      const actual: string = receivedFileNameOf('ZplxUGy2');
      logInfo(`receivedFileNameOf(name="ZplxUGy2"): actual=${actual}`);
      expect(actual).assertEqual('ZplxUGy2');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0058
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0058
     * @tc.desc      receivedFileNameOf(name="lvBqVMnmeqA") returns "lvBqVMnmeqA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0058 begin`);
      const actual: string = receivedFileNameOf('lvBqVMnmeqA');
      logInfo(`receivedFileNameOf(name="lvBqVMnmeqA"): actual=${actual}`);
      expect(actual).assertEqual('lvBqVMnmeqA');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0059
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0059
     * @tc.desc      receivedFileNameOf(name="pvpwc") returns "pvpwc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0059 begin`);
      const actual: string = receivedFileNameOf('pvpwc');
      logInfo(`receivedFileNameOf(name="pvpwc"): actual=${actual}`);
      expect(actual).assertEqual('pvpwc');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0060
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0060
     * @tc.desc      receivedFileNameOf(name="4") returns "4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0060 begin`);
      const actual: string = receivedFileNameOf('4');
      logInfo(`receivedFileNameOf(name="4"): actual=${actual}`);
      expect(actual).assertEqual('4');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0061
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0061
     * @tc.desc      receivedFileNameOf(name="MIO") returns "MIO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0061 begin`);
      const actual: string = receivedFileNameOf('MIO');
      logInfo(`receivedFileNameOf(name="MIO"): actual=${actual}`);
      expect(actual).assertEqual('MIO');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0062
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0062
     * @tc.desc      receivedFileNameOf(name="aiDf") returns "aiDf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0062 begin`);
      const actual: string = receivedFileNameOf('aiDf');
      logInfo(`receivedFileNameOf(name="aiDf"): actual=${actual}`);
      expect(actual).assertEqual('aiDf');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0063
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0063
     * @tc.desc      receivedFileNameOf(name="AYMM4DcGGHV") returns "AYMM4DcGGHV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0063 begin`);
      const actual: string = receivedFileNameOf('AYMM4DcGGHV');
      logInfo(`receivedFileNameOf(name="AYMM4DcGGHV"): actual=${actual}`);
      expect(actual).assertEqual('AYMM4DcGGHV');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0064
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0064
     * @tc.desc      receivedFileNameOf(name="JXoqvLFe") returns "JXoqvLFe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0064 begin`);
      const actual: string = receivedFileNameOf('JXoqvLFe');
      logInfo(`receivedFileNameOf(name="JXoqvLFe"): actual=${actual}`);
      expect(actual).assertEqual('JXoqvLFe');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0065
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0065
     * @tc.desc      receivedFileNameOf(name="kxJ") returns "kxJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0065 begin`);
      const actual: string = receivedFileNameOf('kxJ');
      logInfo(`receivedFileNameOf(name="kxJ"): actual=${actual}`);
      expect(actual).assertEqual('kxJ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0066
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0066
     * @tc.desc      receivedFileNameOf(name="WpQz78RxXg") returns "WpQz78RxXg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0066 begin`);
      const actual: string = receivedFileNameOf('WpQz78RxXg');
      logInfo(`receivedFileNameOf(name="WpQz78RxXg"): actual=${actual}`);
      expect(actual).assertEqual('WpQz78RxXg');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0067
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0067
     * @tc.desc      receivedFileNameOf(name="s5aK6") returns "s5aK6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0067 begin`);
      const actual: string = receivedFileNameOf('s5aK6');
      logInfo(`receivedFileNameOf(name="s5aK6"): actual=${actual}`);
      expect(actual).assertEqual('s5aK6');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0068
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0068
     * @tc.desc      receivedFileNameOf(name="7tm5v") returns "7tm5v"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0068 begin`);
      const actual: string = receivedFileNameOf('7tm5v');
      logInfo(`receivedFileNameOf(name="7tm5v"): actual=${actual}`);
      expect(actual).assertEqual('7tm5v');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0069
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0069
     * @tc.desc      receivedFileNameOf(name="MkDZul8") returns "MkDZul8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0069 begin`);
      const actual: string = receivedFileNameOf('MkDZul8');
      logInfo(`receivedFileNameOf(name="MkDZul8"): actual=${actual}`);
      expect(actual).assertEqual('MkDZul8');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0070
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0070
     * @tc.desc      receivedFileNameOf(name="YEA8BHJOeu") returns "YEA8BHJOeu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0070 begin`);
      const actual: string = receivedFileNameOf('YEA8BHJOeu');
      logInfo(`receivedFileNameOf(name="YEA8BHJOeu"): actual=${actual}`);
      expect(actual).assertEqual('YEA8BHJOeu');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0071
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0071
     * @tc.desc      receivedFileNameOf(name="fnaA7oykF") returns "fnaA7oykF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0071 begin`);
      const actual: string = receivedFileNameOf('fnaA7oykF');
      logInfo(`receivedFileNameOf(name="fnaA7oykF"): actual=${actual}`);
      expect(actual).assertEqual('fnaA7oykF');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0072
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0072
     * @tc.desc      receivedFileNameOf(name="1") returns "1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0072 begin`);
      const actual: string = receivedFileNameOf('1');
      logInfo(`receivedFileNameOf(name="1"): actual=${actual}`);
      expect(actual).assertEqual('1');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0073
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0073
     * @tc.desc      receivedFileNameOf(name="J") returns "J"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0073 begin`);
      const actual: string = receivedFileNameOf('J');
      logInfo(`receivedFileNameOf(name="J"): actual=${actual}`);
      expect(actual).assertEqual('J');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0074
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0074
     * @tc.desc      receivedFileNameOf(name="ujSBqROv1A") returns "ujSBqROv1A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0074 begin`);
      const actual: string = receivedFileNameOf('ujSBqROv1A');
      logInfo(`receivedFileNameOf(name="ujSBqROv1A"): actual=${actual}`);
      expect(actual).assertEqual('ujSBqROv1A');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0075
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0075
     * @tc.desc      receivedFileNameOf(name="S") returns "S"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0075 begin`);
      const actual: string = receivedFileNameOf('S');
      logInfo(`receivedFileNameOf(name="S"): actual=${actual}`);
      expect(actual).assertEqual('S');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0076
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0076
     * @tc.desc      receivedFileNameOf(name="JQLX7skTQoQ") returns "JQLX7skTQoQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0076 begin`);
      const actual: string = receivedFileNameOf('JQLX7skTQoQ');
      logInfo(`receivedFileNameOf(name="JQLX7skTQoQ"): actual=${actual}`);
      expect(actual).assertEqual('JQLX7skTQoQ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0077
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0077
     * @tc.desc      receivedFileNameOf(name="WDb2fgJ8q") returns "WDb2fgJ8q"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0077 begin`);
      const actual: string = receivedFileNameOf('WDb2fgJ8q');
      logInfo(`receivedFileNameOf(name="WDb2fgJ8q"): actual=${actual}`);
      expect(actual).assertEqual('WDb2fgJ8q');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0078
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0078
     * @tc.desc      receivedFileNameOf(name="265G2j") returns "265G2j"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0078 begin`);
      const actual: string = receivedFileNameOf('265G2j');
      logInfo(`receivedFileNameOf(name="265G2j"): actual=${actual}`);
      expect(actual).assertEqual('265G2j');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0079
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0079
     * @tc.desc      receivedFileNameOf(name="OOU") returns "OOU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0079 begin`);
      const actual: string = receivedFileNameOf('OOU');
      logInfo(`receivedFileNameOf(name="OOU"): actual=${actual}`);
      expect(actual).assertEqual('OOU');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0080
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0080
     * @tc.desc      receivedFileNameOf(name="h") returns "h"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0080 begin`);
      const actual: string = receivedFileNameOf('h');
      logInfo(`receivedFileNameOf(name="h"): actual=${actual}`);
      expect(actual).assertEqual('h');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0081
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0081
     * @tc.desc      receivedFileNameOf(name="wldAlvapKXe") returns "wldAlvapKXe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0081 begin`);
      const actual: string = receivedFileNameOf('wldAlvapKXe');
      logInfo(`receivedFileNameOf(name="wldAlvapKXe"): actual=${actual}`);
      expect(actual).assertEqual('wldAlvapKXe');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0082
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0082
     * @tc.desc      receivedFileNameOf(name="81y8KEsALJ") returns "81y8KEsALJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0082 begin`);
      const actual: string = receivedFileNameOf('81y8KEsALJ');
      logInfo(`receivedFileNameOf(name="81y8KEsALJ"): actual=${actual}`);
      expect(actual).assertEqual('81y8KEsALJ');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0083
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0083
     * @tc.desc      receivedFileNameOf(name="mT5hutgi") returns "mT5hutgi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0083 begin`);
      const actual: string = receivedFileNameOf('mT5hutgi');
      logInfo(`receivedFileNameOf(name="mT5hutgi"): actual=${actual}`);
      expect(actual).assertEqual('mT5hutgi');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0084
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0084
     * @tc.desc      receivedFileNameOf(name="kN6VyJoNeS9") returns "kN6VyJoNeS9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0084 begin`);
      const actual: string = receivedFileNameOf('kN6VyJoNeS9');
      logInfo(`receivedFileNameOf(name="kN6VyJoNeS9"): actual=${actual}`);
      expect(actual).assertEqual('kN6VyJoNeS9');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0085
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0085
     * @tc.desc      receivedFileNameOf(name="yUKGWeI") returns "yUKGWeI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0085 begin`);
      const actual: string = receivedFileNameOf('yUKGWeI');
      logInfo(`receivedFileNameOf(name="yUKGWeI"): actual=${actual}`);
      expect(actual).assertEqual('yUKGWeI');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0086
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0086
     * @tc.desc      receivedFileNameOf(name="lUIOr5L14D") returns "lUIOr5L14D"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0086 begin`);
      const actual: string = receivedFileNameOf('lUIOr5L14D');
      logInfo(`receivedFileNameOf(name="lUIOr5L14D"): actual=${actual}`);
      expect(actual).assertEqual('lUIOr5L14D');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0087
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0087
     * @tc.desc      receivedFileNameOf(name="k2zPiOEhtB") returns "k2zPiOEhtB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0087 begin`);
      const actual: string = receivedFileNameOf('k2zPiOEhtB');
      logInfo(`receivedFileNameOf(name="k2zPiOEhtB"): actual=${actual}`);
      expect(actual).assertEqual('k2zPiOEhtB');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0088
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0088
     * @tc.desc      receivedFileNameOf(name="qQR78D") returns "qQR78D"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0088 begin`);
      const actual: string = receivedFileNameOf('qQR78D');
      logInfo(`receivedFileNameOf(name="qQR78D"): actual=${actual}`);
      expect(actual).assertEqual('qQR78D');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0089
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0089
     * @tc.desc      receivedFileNameOf(name="Q1o") returns "Q1o"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0089 begin`);
      const actual: string = receivedFileNameOf('Q1o');
      logInfo(`receivedFileNameOf(name="Q1o"): actual=${actual}`);
      expect(actual).assertEqual('Q1o');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RECEIVED_FILE_NAME_OF_0090
     * @tc.name      NdkRawfile_ReceivedFileNameOf_0090
     * @tc.desc      receivedFileNameOf(name="Dnp5kd") returns "Dnp5kd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_ReceivedFileNameOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReceivedFileNameOf_0090 begin`);
      const actual: string = receivedFileNameOf('Dnp5kd');
      logInfo(`receivedFileNameOf(name="Dnp5kd"): actual=${actual}`);
      expect(actual).assertEqual('Dnp5kd');
      logInfo(`${BUNDLE}ReceivedFileNameOf_0090 end`);
    });
  });
}
