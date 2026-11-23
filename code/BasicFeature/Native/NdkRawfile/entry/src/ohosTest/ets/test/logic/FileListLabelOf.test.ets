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
import { fileListLabelOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for fileListLabelOf (90 cases). */
export default function fileListLabelOfTest(): void {
  describe('FileListLabelOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0001
     * @tc.name      NdkRawfile_FileListLabelOf_0001
     * @tc.desc      fileListLabelOf(listJson="{}") returns "file list: {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_FileListLabelOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0001 begin`);
      const actual: string = fileListLabelOf('{}');
      logInfo(`fileListLabelOf(listJson="{}"): actual=${actual}`);
      expect(actual).assertEqual('file list: {}');
      logInfo(`${BUNDLE}FileListLabelOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0002
     * @tc.name      NdkRawfile_FileListLabelOf_0002
     * @tc.desc      fileListLabelOf(listJson="[]") returns "file list: []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_FileListLabelOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0002 begin`);
      const actual: string = fileListLabelOf('[]');
      logInfo(`fileListLabelOf(listJson="[]"): actual=${actual}`);
      expect(actual).assertEqual('file list: []');
      logInfo(`${BUNDLE}FileListLabelOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0003
     * @tc.name      NdkRawfile_FileListLabelOf_0003
     * @tc.desc      fileListLabelOf(listJson="{?"a?":1}") returns "file list: {?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0003 begin`);
      const actual: string = fileListLabelOf('{"a":1}');
      logInfo(`fileListLabelOf(listJson="{?"a?":1}"): actual=${actual}`);
      expect(actual).assertEqual('file list: {"a":1}');
      logInfo(`${BUNDLE}FileListLabelOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0004
     * @tc.name      NdkRawfile_FileListLabelOf_0004
     * @tc.desc      fileListLabelOf(listJson="invalid") returns "file list: invalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0004 begin`);
      const actual: string = fileListLabelOf('invalid');
      logInfo(`fileListLabelOf(listJson="invalid"): actual=${actual}`);
      expect(actual).assertEqual('file list: invalid');
      logInfo(`${BUNDLE}FileListLabelOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0005
     * @tc.name      NdkRawfile_FileListLabelOf_0005
     * @tc.desc      fileListLabelOf(listJson="") returns "file list: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0005 begin`);
      const actual: string = fileListLabelOf('');
      logInfo(`fileListLabelOf(listJson=""): actual=${actual}`);
      expect(actual).assertEqual('file list: ');
      logInfo(`${BUNDLE}FileListLabelOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0006
     * @tc.name      NdkRawfile_FileListLabelOf_0006
     * @tc.desc      fileListLabelOf(listJson="a") returns "file list: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0006 begin`);
      const actual: string = fileListLabelOf('a');
      logInfo(`fileListLabelOf(listJson="a"): actual=${actual}`);
      expect(actual).assertEqual('file list: a');
      logInfo(`${BUNDLE}FileListLabelOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0007
     * @tc.name      NdkRawfile_FileListLabelOf_0007
     * @tc.desc      fileListLabelOf(listJson="abc") returns "file list: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0007 begin`);
      const actual: string = fileListLabelOf('abc');
      logInfo(`fileListLabelOf(listJson="abc"): actual=${actual}`);
      expect(actual).assertEqual('file list: abc');
      logInfo(`${BUNDLE}FileListLabelOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0008
     * @tc.name      NdkRawfile_FileListLabelOf_0008
     * @tc.desc      fileListLabelOf(listJson="Hello World") returns "file list: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0008 begin`);
      const actual: string = fileListLabelOf('Hello World');
      logInfo(`fileListLabelOf(listJson="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('file list: Hello World');
      logInfo(`${BUNDLE}FileListLabelOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0009
     * @tc.name      NdkRawfile_FileListLabelOf_0009
     * @tc.desc      fileListLabelOf(listJson=" ") returns "file list:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0009 begin`);
      const actual: string = fileListLabelOf(' ');
      logInfo(`fileListLabelOf(listJson=" "): actual=${actual}`);
      expect(actual).assertEqual('file list:  ');
      logInfo(`${BUNDLE}FileListLabelOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0010
     * @tc.name      NdkRawfile_FileListLabelOf_0010
     * @tc.desc      fileListLabelOf(listJson="123") returns "file list: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0010 begin`);
      const actual: string = fileListLabelOf('123');
      logInfo(`fileListLabelOf(listJson="123"): actual=${actual}`);
      expect(actual).assertEqual('file list: 123');
      logInfo(`${BUNDLE}FileListLabelOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0011
     * @tc.name      NdkRawfile_FileListLabelOf_0011
     * @tc.desc      fileListLabelOf(listJson=" {} ") returns "file list:  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0011 begin`);
      const actual: string = fileListLabelOf(' {} ');
      logInfo(`fileListLabelOf(listJson=" {} "): actual=${actual}`);
      expect(actual).assertEqual('file list:  {} ');
      logInfo(`${BUNDLE}FileListLabelOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0012
     * @tc.name      NdkRawfile_FileListLabelOf_0012
     * @tc.desc      fileListLabelOf(listJson="{}{}") returns "file list: {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0012 begin`);
      const actual: string = fileListLabelOf('{}{}');
      logInfo(`fileListLabelOf(listJson="{}{}"): actual=${actual}`);
      expect(actual).assertEqual('file list: {}{}');
      logInfo(`${BUNDLE}FileListLabelOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0013
     * @tc.name      NdkRawfile_FileListLabelOf_0013
     * @tc.desc      fileListLabelOf(listJson="{}_1") returns "file list: {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0013 begin`);
      const actual: string = fileListLabelOf('{}_1');
      logInfo(`fileListLabelOf(listJson="{}_1"): actual=${actual}`);
      expect(actual).assertEqual('file list: {}_1');
      logInfo(`${BUNDLE}FileListLabelOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0014
     * @tc.name      NdkRawfile_FileListLabelOf_0014
     * @tc.desc      fileListLabelOf(listJson="x{}") returns "file list: x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0014 begin`);
      const actual: string = fileListLabelOf('x{}');
      logInfo(`fileListLabelOf(listJson="x{}"): actual=${actual}`);
      expect(actual).assertEqual('file list: x{}');
      logInfo(`${BUNDLE}FileListLabelOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0015
     * @tc.name      NdkRawfile_FileListLabelOf_0015
     * @tc.desc      fileListLabelOf(listJson=" [] ") returns "file list:  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0015 begin`);
      const actual: string = fileListLabelOf(' [] ');
      logInfo(`fileListLabelOf(listJson=" [] "): actual=${actual}`);
      expect(actual).assertEqual('file list:  [] ');
      logInfo(`${BUNDLE}FileListLabelOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0016
     * @tc.name      NdkRawfile_FileListLabelOf_0016
     * @tc.desc      fileListLabelOf(listJson="[][]") returns "file list: [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0016 begin`);
      const actual: string = fileListLabelOf('[][]');
      logInfo(`fileListLabelOf(listJson="[][]"): actual=${actual}`);
      expect(actual).assertEqual('file list: [][]');
      logInfo(`${BUNDLE}FileListLabelOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0017
     * @tc.name      NdkRawfile_FileListLabelOf_0017
     * @tc.desc      fileListLabelOf(listJson="[]_1") returns "file list: []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0017 begin`);
      const actual: string = fileListLabelOf('[]_1');
      logInfo(`fileListLabelOf(listJson="[]_1"): actual=${actual}`);
      expect(actual).assertEqual('file list: []_1');
      logInfo(`${BUNDLE}FileListLabelOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0018
     * @tc.name      NdkRawfile_FileListLabelOf_0018
     * @tc.desc      fileListLabelOf(listJson="x[]") returns "file list: x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0018 begin`);
      const actual: string = fileListLabelOf('x[]');
      logInfo(`fileListLabelOf(listJson="x[]"): actual=${actual}`);
      expect(actual).assertEqual('file list: x[]');
      logInfo(`${BUNDLE}FileListLabelOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0019
     * @tc.name      NdkRawfile_FileListLabelOf_0019
     * @tc.desc      fileListLabelOf(listJson=" {?"a?":1} ") returns "file list:  {?"a?":1} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0019 begin`);
      const actual: string = fileListLabelOf(' {"a":1} ');
      logInfo(`fileListLabelOf(listJson=" {?"a?":1} "): actual=${actual}`);
      expect(actual).assertEqual('file list:  {"a":1} ');
      logInfo(`${BUNDLE}FileListLabelOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0020
     * @tc.name      NdkRawfile_FileListLabelOf_0020
     * @tc.desc      fileListLabelOf(listJson="{?"a?":1}{?"a?":1}") returns "file list: {?"a?":1}{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0020 begin`);
      const actual: string = fileListLabelOf('{"a":1}{"a":1}');
      logInfo(`fileListLabelOf(listJson="{?"a?":1}{?"a?"...: actual=${actual}`);
      expect(actual).assertEqual('file list: {"a":1}{"a":1}');
      logInfo(`${BUNDLE}FileListLabelOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0021
     * @tc.name      NdkRawfile_FileListLabelOf_0021
     * @tc.desc      fileListLabelOf(listJson="{?"a?":1}_1") returns "file list: {?"a?":1}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0021 begin`);
      const actual: string = fileListLabelOf('{"a":1}_1');
      logInfo(`fileListLabelOf(listJson="{?"a?":1}_1"): actual=${actual}`);
      expect(actual).assertEqual('file list: {"a":1}_1');
      logInfo(`${BUNDLE}FileListLabelOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0022
     * @tc.name      NdkRawfile_FileListLabelOf_0022
     * @tc.desc      fileListLabelOf(listJson="x{?"a?":1}") returns "file list: x{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0022 begin`);
      const actual: string = fileListLabelOf('x{"a":1}');
      logInfo(`fileListLabelOf(listJson="x{?"a?":1}"): actual=${actual}`);
      expect(actual).assertEqual('file list: x{"a":1}');
      logInfo(`${BUNDLE}FileListLabelOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0023
     * @tc.name      NdkRawfile_FileListLabelOf_0023
     * @tc.desc      fileListLabelOf(listJson=" invalid ") returns "file list:  invalid "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0023 begin`);
      const actual: string = fileListLabelOf(' invalid ');
      logInfo(`fileListLabelOf(listJson=" invalid "): actual=${actual}`);
      expect(actual).assertEqual('file list:  invalid ');
      logInfo(`${BUNDLE}FileListLabelOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0024
     * @tc.name      NdkRawfile_FileListLabelOf_0024
     * @tc.desc      fileListLabelOf(listJson="invalidinvalid") returns "file list: invalidinvalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0024 begin`);
      const actual: string = fileListLabelOf('invalidinvalid');
      logInfo(`fileListLabelOf(listJson="invalidinvalid"): actual=${actual}`);
      expect(actual).assertEqual('file list: invalidinvalid');
      logInfo(`${BUNDLE}FileListLabelOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0025
     * @tc.name      NdkRawfile_FileListLabelOf_0025
     * @tc.desc      fileListLabelOf(listJson="invalid_1") returns "file list: invalid_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0025 begin`);
      const actual: string = fileListLabelOf('invalid_1');
      logInfo(`fileListLabelOf(listJson="invalid_1"): actual=${actual}`);
      expect(actual).assertEqual('file list: invalid_1');
      logInfo(`${BUNDLE}FileListLabelOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0026
     * @tc.name      NdkRawfile_FileListLabelOf_0026
     * @tc.desc      fileListLabelOf(listJson="xinvalid") returns "file list: xinvalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0026 begin`);
      const actual: string = fileListLabelOf('xinvalid');
      logInfo(`fileListLabelOf(listJson="xinvalid"): actual=${actual}`);
      expect(actual).assertEqual('file list: xinvalid');
      logInfo(`${BUNDLE}FileListLabelOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0027
     * @tc.name      NdkRawfile_FileListLabelOf_0027
     * @tc.desc      fileListLabelOf(listJson=" a ") returns "file list:  a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0027 begin`);
      const actual: string = fileListLabelOf(' a ');
      logInfo(`fileListLabelOf(listJson=" a "): actual=${actual}`);
      expect(actual).assertEqual('file list:  a ');
      logInfo(`${BUNDLE}FileListLabelOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0028
     * @tc.name      NdkRawfile_FileListLabelOf_0028
     * @tc.desc      fileListLabelOf(listJson="aa") returns "file list: aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0028 begin`);
      const actual: string = fileListLabelOf('aa');
      logInfo(`fileListLabelOf(listJson="aa"): actual=${actual}`);
      expect(actual).assertEqual('file list: aa');
      logInfo(`${BUNDLE}FileListLabelOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0029
     * @tc.name      NdkRawfile_FileListLabelOf_0029
     * @tc.desc      fileListLabelOf(listJson="a_1") returns "file list: a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0029 begin`);
      const actual: string = fileListLabelOf('a_1');
      logInfo(`fileListLabelOf(listJson="a_1"): actual=${actual}`);
      expect(actual).assertEqual('file list: a_1');
      logInfo(`${BUNDLE}FileListLabelOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0030
     * @tc.name      NdkRawfile_FileListLabelOf_0030
     * @tc.desc      fileListLabelOf(listJson="xa") returns "file list: xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0030 begin`);
      const actual: string = fileListLabelOf('xa');
      logInfo(`fileListLabelOf(listJson="xa"): actual=${actual}`);
      expect(actual).assertEqual('file list: xa');
      logInfo(`${BUNDLE}FileListLabelOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0031
     * @tc.name      NdkRawfile_FileListLabelOf_0031
     * @tc.desc      fileListLabelOf(listJson=" abc ") returns "file list:  abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0031 begin`);
      const actual: string = fileListLabelOf(' abc ');
      logInfo(`fileListLabelOf(listJson=" abc "): actual=${actual}`);
      expect(actual).assertEqual('file list:  abc ');
      logInfo(`${BUNDLE}FileListLabelOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0032
     * @tc.name      NdkRawfile_FileListLabelOf_0032
     * @tc.desc      fileListLabelOf(listJson="abcabc") returns "file list: abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0032 begin`);
      const actual: string = fileListLabelOf('abcabc');
      logInfo(`fileListLabelOf(listJson="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('file list: abcabc');
      logInfo(`${BUNDLE}FileListLabelOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0033
     * @tc.name      NdkRawfile_FileListLabelOf_0033
     * @tc.desc      fileListLabelOf(listJson="abc_1") returns "file list: abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0033 begin`);
      const actual: string = fileListLabelOf('abc_1');
      logInfo(`fileListLabelOf(listJson="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('file list: abc_1');
      logInfo(`${BUNDLE}FileListLabelOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0034
     * @tc.name      NdkRawfile_FileListLabelOf_0034
     * @tc.desc      fileListLabelOf(listJson="xabc") returns "file list: xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0034 begin`);
      const actual: string = fileListLabelOf('xabc');
      logInfo(`fileListLabelOf(listJson="xabc"): actual=${actual}`);
      expect(actual).assertEqual('file list: xabc');
      logInfo(`${BUNDLE}FileListLabelOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0035
     * @tc.name      NdkRawfile_FileListLabelOf_0035
     * @tc.desc      fileListLabelOf(listJson=" Hello World ") returns "file list:  Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0035 begin`);
      const actual: string = fileListLabelOf(' Hello World ');
      logInfo(`fileListLabelOf(listJson=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('file list:  Hello World ');
      logInfo(`${BUNDLE}FileListLabelOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0036
     * @tc.name      NdkRawfile_FileListLabelOf_0036
     * @tc.desc      fileListLabelOf(listJson="Hello WorldHello World") returns "file list: Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0036 begin`);
      const actual: string = fileListLabelOf('Hello WorldHello World');
      logInfo(`fileListLabelOf(listJson="Hello WorldHell...: actual=${actual}`);
      expect(actual).assertEqual('file list: Hello WorldHello World');
      logInfo(`${BUNDLE}FileListLabelOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0037
     * @tc.name      NdkRawfile_FileListLabelOf_0037
     * @tc.desc      fileListLabelOf(listJson="Hello World_1") returns "file list: Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0037 begin`);
      const actual: string = fileListLabelOf('Hello World_1');
      logInfo(`fileListLabelOf(listJson="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('file list: Hello World_1');
      logInfo(`${BUNDLE}FileListLabelOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0038
     * @tc.name      NdkRawfile_FileListLabelOf_0038
     * @tc.desc      fileListLabelOf(listJson="xHello World") returns "file list: xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0038 begin`);
      const actual: string = fileListLabelOf('xHello World');
      logInfo(`fileListLabelOf(listJson="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('file list: xHello World');
      logInfo(`${BUNDLE}FileListLabelOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0039
     * @tc.name      NdkRawfile_FileListLabelOf_0039
     * @tc.desc      fileListLabelOf(listJson="   ") returns "file list:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0039 begin`);
      const actual: string = fileListLabelOf('   ');
      logInfo(`fileListLabelOf(listJson="   "): actual=${actual}`);
      expect(actual).assertEqual('file list:    ');
      logInfo(`${BUNDLE}FileListLabelOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0040
     * @tc.name      NdkRawfile_FileListLabelOf_0040
     * @tc.desc      fileListLabelOf(listJson="  ") returns "file list:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0040 begin`);
      const actual: string = fileListLabelOf('  ');
      logInfo(`fileListLabelOf(listJson="  "): actual=${actual}`);
      expect(actual).assertEqual('file list:   ');
      logInfo(`${BUNDLE}FileListLabelOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0041
     * @tc.name      NdkRawfile_FileListLabelOf_0041
     * @tc.desc      fileListLabelOf(listJson=" _1") returns "file list:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0041 begin`);
      const actual: string = fileListLabelOf(' _1');
      logInfo(`fileListLabelOf(listJson=" _1"): actual=${actual}`);
      expect(actual).assertEqual('file list:  _1');
      logInfo(`${BUNDLE}FileListLabelOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0042
     * @tc.name      NdkRawfile_FileListLabelOf_0042
     * @tc.desc      fileListLabelOf(listJson="x ") returns "file list: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0042 begin`);
      const actual: string = fileListLabelOf('x ');
      logInfo(`fileListLabelOf(listJson="x "): actual=${actual}`);
      expect(actual).assertEqual('file list: x ');
      logInfo(`${BUNDLE}FileListLabelOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0043
     * @tc.name      NdkRawfile_FileListLabelOf_0043
     * @tc.desc      fileListLabelOf(listJson=" 123 ") returns "file list:  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0043 begin`);
      const actual: string = fileListLabelOf(' 123 ');
      logInfo(`fileListLabelOf(listJson=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('file list:  123 ');
      logInfo(`${BUNDLE}FileListLabelOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0044
     * @tc.name      NdkRawfile_FileListLabelOf_0044
     * @tc.desc      fileListLabelOf(listJson="123123") returns "file list: 123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0044 begin`);
      const actual: string = fileListLabelOf('123123');
      logInfo(`fileListLabelOf(listJson="123123"): actual=${actual}`);
      expect(actual).assertEqual('file list: 123123');
      logInfo(`${BUNDLE}FileListLabelOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0045
     * @tc.name      NdkRawfile_FileListLabelOf_0045
     * @tc.desc      fileListLabelOf(listJson="123_1") returns "file list: 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0045 begin`);
      const actual: string = fileListLabelOf('123_1');
      logInfo(`fileListLabelOf(listJson="123_1"): actual=${actual}`);
      expect(actual).assertEqual('file list: 123_1');
      logInfo(`${BUNDLE}FileListLabelOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0046
     * @tc.name      NdkRawfile_FileListLabelOf_0046
     * @tc.desc      fileListLabelOf(listJson="x123") returns "file list: x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_FileListLabelOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0046 begin`);
      const actual: string = fileListLabelOf('x123');
      logInfo(`fileListLabelOf(listJson="x123"): actual=${actual}`);
      expect(actual).assertEqual('file list: x123');
      logInfo(`${BUNDLE}FileListLabelOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0047
     * @tc.name      NdkRawfile_FileListLabelOf_0047
     * @tc.desc      fileListLabelOf(listJson="PdVrNQEsPT") returns "file list: PdVrNQEsPT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0047 begin`);
      const actual: string = fileListLabelOf('PdVrNQEsPT');
      logInfo(`fileListLabelOf(listJson="PdVrNQEsPT"): actual=${actual}`);
      expect(actual).assertEqual('file list: PdVrNQEsPT');
      logInfo(`${BUNDLE}FileListLabelOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0048
     * @tc.name      NdkRawfile_FileListLabelOf_0048
     * @tc.desc      fileListLabelOf(listJson="D") returns "file list: D"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0048 begin`);
      const actual: string = fileListLabelOf('D');
      logInfo(`fileListLabelOf(listJson="D"): actual=${actual}`);
      expect(actual).assertEqual('file list: D');
      logInfo(`${BUNDLE}FileListLabelOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0049
     * @tc.name      NdkRawfile_FileListLabelOf_0049
     * @tc.desc      fileListLabelOf(listJson="new") returns "file list: new"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0049 begin`);
      const actual: string = fileListLabelOf('new');
      logInfo(`fileListLabelOf(listJson="new"): actual=${actual}`);
      expect(actual).assertEqual('file list: new');
      logInfo(`${BUNDLE}FileListLabelOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0050
     * @tc.name      NdkRawfile_FileListLabelOf_0050
     * @tc.desc      fileListLabelOf(listJson="ccckigs1e") returns "file list: ccckigs1e"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0050 begin`);
      const actual: string = fileListLabelOf('ccckigs1e');
      logInfo(`fileListLabelOf(listJson="ccckigs1e"): actual=${actual}`);
      expect(actual).assertEqual('file list: ccckigs1e');
      logInfo(`${BUNDLE}FileListLabelOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0051
     * @tc.name      NdkRawfile_FileListLabelOf_0051
     * @tc.desc      fileListLabelOf(listJson="mT") returns "file list: mT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0051 begin`);
      const actual: string = fileListLabelOf('mT');
      logInfo(`fileListLabelOf(listJson="mT"): actual=${actual}`);
      expect(actual).assertEqual('file list: mT');
      logInfo(`${BUNDLE}FileListLabelOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0052
     * @tc.name      NdkRawfile_FileListLabelOf_0052
     * @tc.desc      fileListLabelOf(listJson="PR") returns "file list: PR"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0052 begin`);
      const actual: string = fileListLabelOf('PR');
      logInfo(`fileListLabelOf(listJson="PR"): actual=${actual}`);
      expect(actual).assertEqual('file list: PR');
      logInfo(`${BUNDLE}FileListLabelOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0053
     * @tc.name      NdkRawfile_FileListLabelOf_0053
     * @tc.desc      fileListLabelOf(listJson="ecQ7SM1EQ") returns "file list: ecQ7SM1EQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0053 begin`);
      const actual: string = fileListLabelOf('ecQ7SM1EQ');
      logInfo(`fileListLabelOf(listJson="ecQ7SM1EQ"): actual=${actual}`);
      expect(actual).assertEqual('file list: ecQ7SM1EQ');
      logInfo(`${BUNDLE}FileListLabelOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0054
     * @tc.name      NdkRawfile_FileListLabelOf_0054
     * @tc.desc      fileListLabelOf(listJson="ZPNPn") returns "file list: ZPNPn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0054 begin`);
      const actual: string = fileListLabelOf('ZPNPn');
      logInfo(`fileListLabelOf(listJson="ZPNPn"): actual=${actual}`);
      expect(actual).assertEqual('file list: ZPNPn');
      logInfo(`${BUNDLE}FileListLabelOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0055
     * @tc.name      NdkRawfile_FileListLabelOf_0055
     * @tc.desc      fileListLabelOf(listJson="QUn") returns "file list: QUn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0055 begin`);
      const actual: string = fileListLabelOf('QUn');
      logInfo(`fileListLabelOf(listJson="QUn"): actual=${actual}`);
      expect(actual).assertEqual('file list: QUn');
      logInfo(`${BUNDLE}FileListLabelOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0056
     * @tc.name      NdkRawfile_FileListLabelOf_0056
     * @tc.desc      fileListLabelOf(listJson="fA47") returns "file list: fA47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0056 begin`);
      const actual: string = fileListLabelOf('fA47');
      logInfo(`fileListLabelOf(listJson="fA47"): actual=${actual}`);
      expect(actual).assertEqual('file list: fA47');
      logInfo(`${BUNDLE}FileListLabelOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0057
     * @tc.name      NdkRawfile_FileListLabelOf_0057
     * @tc.desc      fileListLabelOf(listJson="gNfPROqJJ") returns "file list: gNfPROqJJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0057 begin`);
      const actual: string = fileListLabelOf('gNfPROqJJ');
      logInfo(`fileListLabelOf(listJson="gNfPROqJJ"): actual=${actual}`);
      expect(actual).assertEqual('file list: gNfPROqJJ');
      logInfo(`${BUNDLE}FileListLabelOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0058
     * @tc.name      NdkRawfile_FileListLabelOf_0058
     * @tc.desc      fileListLabelOf(listJson="Q") returns "file list: Q"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0058 begin`);
      const actual: string = fileListLabelOf('Q');
      logInfo(`fileListLabelOf(listJson="Q"): actual=${actual}`);
      expect(actual).assertEqual('file list: Q');
      logInfo(`${BUNDLE}FileListLabelOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0059
     * @tc.name      NdkRawfile_FileListLabelOf_0059
     * @tc.desc      fileListLabelOf(listJson="D3xe4P8qyew6") returns "file list: D3xe4P8qyew6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0059 begin`);
      const actual: string = fileListLabelOf('D3xe4P8qyew6');
      logInfo(`fileListLabelOf(listJson="D3xe4P8qyew6"): actual=${actual}`);
      expect(actual).assertEqual('file list: D3xe4P8qyew6');
      logInfo(`${BUNDLE}FileListLabelOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0060
     * @tc.name      NdkRawfile_FileListLabelOf_0060
     * @tc.desc      fileListLabelOf(listJson="AgWmytJ956bD") returns "file list: AgWmytJ956bD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0060 begin`);
      const actual: string = fileListLabelOf('AgWmytJ956bD');
      logInfo(`fileListLabelOf(listJson="AgWmytJ956bD"): actual=${actual}`);
      expect(actual).assertEqual('file list: AgWmytJ956bD');
      logInfo(`${BUNDLE}FileListLabelOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0061
     * @tc.name      NdkRawfile_FileListLabelOf_0061
     * @tc.desc      fileListLabelOf(listJson="IMJ") returns "file list: IMJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0061 begin`);
      const actual: string = fileListLabelOf('IMJ');
      logInfo(`fileListLabelOf(listJson="IMJ"): actual=${actual}`);
      expect(actual).assertEqual('file list: IMJ');
      logInfo(`${BUNDLE}FileListLabelOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0062
     * @tc.name      NdkRawfile_FileListLabelOf_0062
     * @tc.desc      fileListLabelOf(listJson="mV8qEsMAECb") returns "file list: mV8qEsMAECb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0062 begin`);
      const actual: string = fileListLabelOf('mV8qEsMAECb');
      logInfo(`fileListLabelOf(listJson="mV8qEsMAECb"): actual=${actual}`);
      expect(actual).assertEqual('file list: mV8qEsMAECb');
      logInfo(`${BUNDLE}FileListLabelOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0063
     * @tc.name      NdkRawfile_FileListLabelOf_0063
     * @tc.desc      fileListLabelOf(listJson="aAXe") returns "file list: aAXe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0063 begin`);
      const actual: string = fileListLabelOf('aAXe');
      logInfo(`fileListLabelOf(listJson="aAXe"): actual=${actual}`);
      expect(actual).assertEqual('file list: aAXe');
      logInfo(`${BUNDLE}FileListLabelOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0064
     * @tc.name      NdkRawfile_FileListLabelOf_0064
     * @tc.desc      fileListLabelOf(listJson="5GFem") returns "file list: 5GFem"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0064 begin`);
      const actual: string = fileListLabelOf('5GFem');
      logInfo(`fileListLabelOf(listJson="5GFem"): actual=${actual}`);
      expect(actual).assertEqual('file list: 5GFem');
      logInfo(`${BUNDLE}FileListLabelOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0065
     * @tc.name      NdkRawfile_FileListLabelOf_0065
     * @tc.desc      fileListLabelOf(listJson="3Bt7y") returns "file list: 3Bt7y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0065 begin`);
      const actual: string = fileListLabelOf('3Bt7y');
      logInfo(`fileListLabelOf(listJson="3Bt7y"): actual=${actual}`);
      expect(actual).assertEqual('file list: 3Bt7y');
      logInfo(`${BUNDLE}FileListLabelOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0066
     * @tc.name      NdkRawfile_FileListLabelOf_0066
     * @tc.desc      fileListLabelOf(listJson="C0unIl3QDB") returns "file list: C0unIl3QDB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0066 begin`);
      const actual: string = fileListLabelOf('C0unIl3QDB');
      logInfo(`fileListLabelOf(listJson="C0unIl3QDB"): actual=${actual}`);
      expect(actual).assertEqual('file list: C0unIl3QDB');
      logInfo(`${BUNDLE}FileListLabelOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0067
     * @tc.name      NdkRawfile_FileListLabelOf_0067
     * @tc.desc      fileListLabelOf(listJson="GDRgR8rKY") returns "file list: GDRgR8rKY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0067 begin`);
      const actual: string = fileListLabelOf('GDRgR8rKY');
      logInfo(`fileListLabelOf(listJson="GDRgR8rKY"): actual=${actual}`);
      expect(actual).assertEqual('file list: GDRgR8rKY');
      logInfo(`${BUNDLE}FileListLabelOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0068
     * @tc.name      NdkRawfile_FileListLabelOf_0068
     * @tc.desc      fileListLabelOf(listJson="mCJX") returns "file list: mCJX"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0068 begin`);
      const actual: string = fileListLabelOf('mCJX');
      logInfo(`fileListLabelOf(listJson="mCJX"): actual=${actual}`);
      expect(actual).assertEqual('file list: mCJX');
      logInfo(`${BUNDLE}FileListLabelOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0069
     * @tc.name      NdkRawfile_FileListLabelOf_0069
     * @tc.desc      fileListLabelOf(listJson="Ec2MjxhbFSkc") returns "file list: Ec2MjxhbFSkc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0069 begin`);
      const actual: string = fileListLabelOf('Ec2MjxhbFSkc');
      logInfo(`fileListLabelOf(listJson="Ec2MjxhbFSkc"): actual=${actual}`);
      expect(actual).assertEqual('file list: Ec2MjxhbFSkc');
      logInfo(`${BUNDLE}FileListLabelOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0070
     * @tc.name      NdkRawfile_FileListLabelOf_0070
     * @tc.desc      fileListLabelOf(listJson="H8") returns "file list: H8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0070 begin`);
      const actual: string = fileListLabelOf('H8');
      logInfo(`fileListLabelOf(listJson="H8"): actual=${actual}`);
      expect(actual).assertEqual('file list: H8');
      logInfo(`${BUNDLE}FileListLabelOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0071
     * @tc.name      NdkRawfile_FileListLabelOf_0071
     * @tc.desc      fileListLabelOf(listJson="KObZXLjWA") returns "file list: KObZXLjWA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0071 begin`);
      const actual: string = fileListLabelOf('KObZXLjWA');
      logInfo(`fileListLabelOf(listJson="KObZXLjWA"): actual=${actual}`);
      expect(actual).assertEqual('file list: KObZXLjWA');
      logInfo(`${BUNDLE}FileListLabelOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0072
     * @tc.name      NdkRawfile_FileListLabelOf_0072
     * @tc.desc      fileListLabelOf(listJson="CotR0cOrowLR") returns "file list: CotR0cOrowLR"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0072 begin`);
      const actual: string = fileListLabelOf('CotR0cOrowLR');
      logInfo(`fileListLabelOf(listJson="CotR0cOrowLR"): actual=${actual}`);
      expect(actual).assertEqual('file list: CotR0cOrowLR');
      logInfo(`${BUNDLE}FileListLabelOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0073
     * @tc.name      NdkRawfile_FileListLabelOf_0073
     * @tc.desc      fileListLabelOf(listJson="Vjm") returns "file list: Vjm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0073 begin`);
      const actual: string = fileListLabelOf('Vjm');
      logInfo(`fileListLabelOf(listJson="Vjm"): actual=${actual}`);
      expect(actual).assertEqual('file list: Vjm');
      logInfo(`${BUNDLE}FileListLabelOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0074
     * @tc.name      NdkRawfile_FileListLabelOf_0074
     * @tc.desc      fileListLabelOf(listJson="IBF5z") returns "file list: IBF5z"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0074 begin`);
      const actual: string = fileListLabelOf('IBF5z');
      logInfo(`fileListLabelOf(listJson="IBF5z"): actual=${actual}`);
      expect(actual).assertEqual('file list: IBF5z');
      logInfo(`${BUNDLE}FileListLabelOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0075
     * @tc.name      NdkRawfile_FileListLabelOf_0075
     * @tc.desc      fileListLabelOf(listJson="FOX61") returns "file list: FOX61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0075 begin`);
      const actual: string = fileListLabelOf('FOX61');
      logInfo(`fileListLabelOf(listJson="FOX61"): actual=${actual}`);
      expect(actual).assertEqual('file list: FOX61');
      logInfo(`${BUNDLE}FileListLabelOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0076
     * @tc.name      NdkRawfile_FileListLabelOf_0076
     * @tc.desc      fileListLabelOf(listJson="ky9TKzz") returns "file list: ky9TKzz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0076 begin`);
      const actual: string = fileListLabelOf('ky9TKzz');
      logInfo(`fileListLabelOf(listJson="ky9TKzz"): actual=${actual}`);
      expect(actual).assertEqual('file list: ky9TKzz');
      logInfo(`${BUNDLE}FileListLabelOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0077
     * @tc.name      NdkRawfile_FileListLabelOf_0077
     * @tc.desc      fileListLabelOf(listJson="9TZpCtTxhum3") returns "file list: 9TZpCtTxhum3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0077 begin`);
      const actual: string = fileListLabelOf('9TZpCtTxhum3');
      logInfo(`fileListLabelOf(listJson="9TZpCtTxhum3"): actual=${actual}`);
      expect(actual).assertEqual('file list: 9TZpCtTxhum3');
      logInfo(`${BUNDLE}FileListLabelOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0078
     * @tc.name      NdkRawfile_FileListLabelOf_0078
     * @tc.desc      fileListLabelOf(listJson="NHS") returns "file list: NHS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0078 begin`);
      const actual: string = fileListLabelOf('NHS');
      logInfo(`fileListLabelOf(listJson="NHS"): actual=${actual}`);
      expect(actual).assertEqual('file list: NHS');
      logInfo(`${BUNDLE}FileListLabelOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0079
     * @tc.name      NdkRawfile_FileListLabelOf_0079
     * @tc.desc      fileListLabelOf(listJson="cNbQjSXIpw") returns "file list: cNbQjSXIpw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0079 begin`);
      const actual: string = fileListLabelOf('cNbQjSXIpw');
      logInfo(`fileListLabelOf(listJson="cNbQjSXIpw"): actual=${actual}`);
      expect(actual).assertEqual('file list: cNbQjSXIpw');
      logInfo(`${BUNDLE}FileListLabelOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0080
     * @tc.name      NdkRawfile_FileListLabelOf_0080
     * @tc.desc      fileListLabelOf(listJson="vcYN3Soe") returns "file list: vcYN3Soe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0080 begin`);
      const actual: string = fileListLabelOf('vcYN3Soe');
      logInfo(`fileListLabelOf(listJson="vcYN3Soe"): actual=${actual}`);
      expect(actual).assertEqual('file list: vcYN3Soe');
      logInfo(`${BUNDLE}FileListLabelOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0081
     * @tc.name      NdkRawfile_FileListLabelOf_0081
     * @tc.desc      fileListLabelOf(listJson="R") returns "file list: R"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0081 begin`);
      const actual: string = fileListLabelOf('R');
      logInfo(`fileListLabelOf(listJson="R"): actual=${actual}`);
      expect(actual).assertEqual('file list: R');
      logInfo(`${BUNDLE}FileListLabelOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0082
     * @tc.name      NdkRawfile_FileListLabelOf_0082
     * @tc.desc      fileListLabelOf(listJson="CP3Nu") returns "file list: CP3Nu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0082 begin`);
      const actual: string = fileListLabelOf('CP3Nu');
      logInfo(`fileListLabelOf(listJson="CP3Nu"): actual=${actual}`);
      expect(actual).assertEqual('file list: CP3Nu');
      logInfo(`${BUNDLE}FileListLabelOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0083
     * @tc.name      NdkRawfile_FileListLabelOf_0083
     * @tc.desc      fileListLabelOf(listJson="a42kESuAxo") returns "file list: a42kESuAxo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0083 begin`);
      const actual: string = fileListLabelOf('a42kESuAxo');
      logInfo(`fileListLabelOf(listJson="a42kESuAxo"): actual=${actual}`);
      expect(actual).assertEqual('file list: a42kESuAxo');
      logInfo(`${BUNDLE}FileListLabelOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0084
     * @tc.name      NdkRawfile_FileListLabelOf_0084
     * @tc.desc      fileListLabelOf(listJson="BF5IMQq") returns "file list: BF5IMQq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0084 begin`);
      const actual: string = fileListLabelOf('BF5IMQq');
      logInfo(`fileListLabelOf(listJson="BF5IMQq"): actual=${actual}`);
      expect(actual).assertEqual('file list: BF5IMQq');
      logInfo(`${BUNDLE}FileListLabelOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0085
     * @tc.name      NdkRawfile_FileListLabelOf_0085
     * @tc.desc      fileListLabelOf(listJson="CSuIQYYam8U4") returns "file list: CSuIQYYam8U4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0085 begin`);
      const actual: string = fileListLabelOf('CSuIQYYam8U4');
      logInfo(`fileListLabelOf(listJson="CSuIQYYam8U4"): actual=${actual}`);
      expect(actual).assertEqual('file list: CSuIQYYam8U4');
      logInfo(`${BUNDLE}FileListLabelOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0086
     * @tc.name      NdkRawfile_FileListLabelOf_0086
     * @tc.desc      fileListLabelOf(listJson="as1c") returns "file list: as1c"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0086 begin`);
      const actual: string = fileListLabelOf('as1c');
      logInfo(`fileListLabelOf(listJson="as1c"): actual=${actual}`);
      expect(actual).assertEqual('file list: as1c');
      logInfo(`${BUNDLE}FileListLabelOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0087
     * @tc.name      NdkRawfile_FileListLabelOf_0087
     * @tc.desc      fileListLabelOf(listJson="xqnxGrF") returns "file list: xqnxGrF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0087 begin`);
      const actual: string = fileListLabelOf('xqnxGrF');
      logInfo(`fileListLabelOf(listJson="xqnxGrF"): actual=${actual}`);
      expect(actual).assertEqual('file list: xqnxGrF');
      logInfo(`${BUNDLE}FileListLabelOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0088
     * @tc.name      NdkRawfile_FileListLabelOf_0088
     * @tc.desc      fileListLabelOf(listJson="FK3") returns "file list: FK3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0088 begin`);
      const actual: string = fileListLabelOf('FK3');
      logInfo(`fileListLabelOf(listJson="FK3"): actual=${actual}`);
      expect(actual).assertEqual('file list: FK3');
      logInfo(`${BUNDLE}FileListLabelOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0089
     * @tc.name      NdkRawfile_FileListLabelOf_0089
     * @tc.desc      fileListLabelOf(listJson="WbhQ") returns "file list: WbhQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0089 begin`);
      const actual: string = fileListLabelOf('WbhQ');
      logInfo(`fileListLabelOf(listJson="WbhQ"): actual=${actual}`);
      expect(actual).assertEqual('file list: WbhQ');
      logInfo(`${BUNDLE}FileListLabelOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_LABEL_OF_0090
     * @tc.name      NdkRawfile_FileListLabelOf_0090
     * @tc.desc      fileListLabelOf(listJson="EI4b") returns "file list: EI4b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListLabelOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListLabelOf_0090 begin`);
      const actual: string = fileListLabelOf('EI4b');
      logInfo(`fileListLabelOf(listJson="EI4b"): actual=${actual}`);
      expect(actual).assertEqual('file list: EI4b');
      logInfo(`${BUNDLE}FileListLabelOf_0090 end`);
    });
  });
}
