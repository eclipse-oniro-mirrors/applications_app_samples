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
import { fileListJsonOf } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for fileListJsonOf (8 cases). */
export default function fileListJsonOfTest(): void {
  describe('FileListJsonOfTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_JSON_OF_0001
     * @tc.name      NdkRawfile_FileListJsonOf_0001
     * @tc.desc      fileListJsonOf(names=[]) returns "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_FileListJsonOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FileListJsonOf_0001 begin`);
      const actual: string = fileListJsonOf([]);
      logInfo(`fileListJsonOf(names=[]): actual=${actual}`);
      expect(actual).assertEqual('[]');
      logInfo(`${BUNDLE}FileListJsonOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_JSON_OF_0002
     * @tc.name      NdkRawfile_FileListJsonOf_0002
     * @tc.desc      fileListJsonOf(names=["Hello"]) returns "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_FileListJsonOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FileListJsonOf_0002 begin`);
      const actual: string = fileListJsonOf(['Hello']);
      logInfo(`fileListJsonOf(names=["Hello"]): actual=${actual}`);
      expect(actual).assertEqual('["Hello"]');
      logInfo(`${BUNDLE}FileListJsonOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_JSON_OF_0003
     * @tc.name      NdkRawfile_FileListJsonOf_0003
     * @tc.desc      fileListJsonOf(names=["Hello", "hello world"]) returns "[?"Hello?",?"hello world?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListJsonOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListJsonOf_0003 begin`);
      const actual: string = fileListJsonOf(['Hello', 'hello world']);
      logInfo(`fileListJsonOf(names=["Hello", "hello wor...: actual=${actual}`);
      expect(actual).assertEqual('["Hello","hello world"]');
      logInfo(`${BUNDLE}FileListJsonOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_JSON_OF_0004
     * @tc.name      NdkRawfile_FileListJsonOf_0004
     * @tc.desc      fileListJsonOf(names=["hello world", "Hello", ""]) returns "[?"hello world?",?"Hello?",?"?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListJsonOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListJsonOf_0004 begin`);
      const actual: string = fileListJsonOf(['hello world', 'Hello', '']);
      logInfo(`fileListJsonOf(names=["hello world", "Hel...: actual=${actual}`);
      expect(actual).assertEqual('["hello world","Hello",""]');
      logInfo(`${BUNDLE}FileListJsonOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_JSON_OF_0005
     * @tc.name      NdkRawfile_FileListJsonOf_0005
     * @tc.desc      fileListJsonOf(names=["", ""]) returns "[?"?",?"?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListJsonOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListJsonOf_0005 begin`);
      const actual: string = fileListJsonOf(['', '']);
      logInfo(`fileListJsonOf(names=["", ""]): actual=${actual}`);
      expect(actual).assertEqual('["",""]');
      logInfo(`${BUNDLE}FileListJsonOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_JSON_OF_0006
     * @tc.name      NdkRawfile_FileListJsonOf_0006
     * @tc.desc      fileListJsonOf(names=["Hello", "hello world", "", " ", "A"]) returns "[?"Hello?",?"hello world?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListJsonOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListJsonOf_0006 begin`);
      const actual: string = fileListJsonOf(['Hello', 'hello world', '', ' ', 'A']);
      logInfo(`fileListJsonOf(names=["Hello", "hello wor...: actual=${actual}`);
      expect(actual).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`${BUNDLE}FileListJsonOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_JSON_OF_0007
     * @tc.name      NdkRawfile_FileListJsonOf_0007
     * @tc.desc      fileListJsonOf(names=[" ", "hello world", "A", "hello world", "Sample Title 123"]) returns "[?" ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListJsonOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListJsonOf_0007 begin`);
      const actual: string = fileListJsonOf([' ', 'hello world', 'A', 'hello world', 'Sample Title 123']);
      logInfo(`fileListJsonOf(names=[" ", "hello world",...: actual=${actual}`);
      expect(actual).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`${BUNDLE}FileListJsonOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_FILE_LIST_JSON_OF_0008
     * @tc.name      NdkRawfile_FileListJsonOf_0008
     * @tc.desc      fileListJsonOf(names=["Sample Title 123", "A", " ", "", "hello world", "Hello"]) returns "[?"Sam...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_FileListJsonOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FileListJsonOf_0008 begin`);
      const actual: string = fileListJsonOf(['Sample Title 123', 'A', ' ', '', 'hello world', 'Hello']);
      logInfo(`fileListJsonOf(names=["Sample Title 123",...: actual=${actual}`);
      expect(actual).assertEqual('["Sample Title 123","A"," ","","hello world","Hello"]');
      logInfo(`${BUNDLE}FileListJsonOf_0008 end`);
    });
  });
}
