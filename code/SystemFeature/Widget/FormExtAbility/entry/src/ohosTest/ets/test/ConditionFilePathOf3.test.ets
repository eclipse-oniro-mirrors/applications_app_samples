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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { conditionFilePathOf } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for conditionFilePathOf (19 cases). */
export default function conditionFilePathOf3Test(): void {
  describe('ConditionFilePathOf3Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0190
     * @tc.name      FormExtAbility_ConditionFilePathOf_0190
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName=".hidden") returns "a.hidden"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0190 begin`);
      const actual: string = conditionFilePathOf('a', '.hidden');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('a.hidden');
      logInfo(`${BUNDLE}ConditionFilePathOf_0190 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0191
     * @tc.name      FormExtAbility_ConditionFilePathOf_0191
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="a") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0191 begin`);
      const actual: string = conditionFilePathOf('a', 'a');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}ConditionFilePathOf_0191 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0192
     * @tc.name      FormExtAbility_ConditionFilePathOf_0192
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="abc") returns "aabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0192 begin`);
      const actual: string = conditionFilePathOf('a', 'abc');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('aabc');
      logInfo(`${BUNDLE}ConditionFilePathOf_0192 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0193
     * @tc.name      FormExtAbility_ConditionFilePathOf_0193
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="Hello World") returns "aHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0193 begin`);
      const actual: string = conditionFilePathOf('a', 'Hello World');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('aHello World');
      logInfo(`${BUNDLE}ConditionFilePathOf_0193 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0194
     * @tc.name      FormExtAbility_ConditionFilePathOf_0194
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName=" ") returns "a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0194 begin`);
      const actual: string = conditionFilePathOf('a', ' ');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('a ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0194 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0195
     * @tc.name      FormExtAbility_ConditionFilePathOf_0195
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="123") returns "a123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0195 begin`);
      const actual: string = conditionFilePathOf('a', '123');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('a123');
      logInfo(`${BUNDLE}ConditionFilePathOf_0195 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0196
     * @tc.name      FormExtAbility_ConditionFilePathOf_0196
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName=" /data/storage/el2/base/files/test.t...) returns "a ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0196 begin`);
      const actual: string = conditionFilePathOf('a', ' /data/storage/el2/base/files/test.txt ');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('a /data/storage/el2/base/files/test.txt ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0196 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0197
     * @tc.name      FormExtAbility_ConditionFilePathOf_0197
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="/data/storage/el2/base/files/test.tx...) returns "a/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0197 begin`);
      const actual: string = conditionFilePathOf('a', '/data/storage/el2/base/files/test.txt_1');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('a/data/storage/el2/base/files/test.txt_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0197 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0198
     * @tc.name      FormExtAbility_ConditionFilePathOf_0198
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="x/data/storage/el2/base/files/test.txt") returns "ax...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0198 begin`);
      const actual: string = conditionFilePathOf('a', 'x/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('ax/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0198 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0199
     * @tc.name      FormExtAbility_ConditionFilePathOf_0199
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName=" test.mp3 ") returns "a test.mp3 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0199 begin`);
      const actual: string = conditionFilePathOf('a', ' test.mp3 ');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('a test.mp3 ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0199 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0200
     * @tc.name      FormExtAbility_ConditionFilePathOf_0200
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="test.mp3test.mp3") returns "atest.mp3test.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0200 begin`);
      const actual: string = conditionFilePathOf('a', 'test.mp3test.mp3');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('atest.mp3test.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0200 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0201
     * @tc.name      FormExtAbility_ConditionFilePathOf_0201
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="test.mp3_1") returns "atest.mp3_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0201 begin`);
      const actual: string = conditionFilePathOf('a', 'test.mp3_1');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('atest.mp3_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0201 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0202
     * @tc.name      FormExtAbility_ConditionFilePathOf_0202
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="xtest.mp3") returns "axtest.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0202 begin`);
      const actual: string = conditionFilePathOf('a', 'xtest.mp3');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('axtest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0202 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0203
     * @tc.name      FormExtAbility_ConditionFilePathOf_0203
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName=" photo.JPG ") returns "a photo.JPG "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0203 begin`);
      const actual: string = conditionFilePathOf('a', ' photo.JPG ');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('a photo.JPG ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0203 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0204
     * @tc.name      FormExtAbility_ConditionFilePathOf_0204
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="photo.JPGphoto.JPG") returns "aphoto.JPGphoto.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0204 begin`);
      const actual: string = conditionFilePathOf('a', 'photo.JPGphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('aphoto.JPGphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0204 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0205
     * @tc.name      FormExtAbility_ConditionFilePathOf_0205
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="photo.JPG_1") returns "aphoto.JPG_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0205 begin`);
      const actual: string = conditionFilePathOf('a', 'photo.JPG_1');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('aphoto.JPG_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0205 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0206
     * @tc.name      FormExtAbility_ConditionFilePathOf_0206
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="xphoto.JPG") returns "axphoto.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0206 begin`);
      const actual: string = conditionFilePathOf('a', 'xphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('axphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0206 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0207
     * @tc.name      FormExtAbility_ConditionFilePathOf_0207
     * @tc.desc      conditionFilePathOf(filesDir="abc", fileName="/data/storage/el2/base/files/test.txt") returns "a...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0207 begin`);
      const actual: string = conditionFilePathOf('abc', '/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="abc", fileN...: actual=${actual}`);
      expect(actual).assertEqual('abc/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0207 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0208
     * @tc.name      FormExtAbility_ConditionFilePathOf_0208
     * @tc.desc      conditionFilePathOf(filesDir="abc", fileName="/data/storage/el2/base/haps/entry/fi...) returns "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0208 begin`);
      const actual: string = conditionFilePathOf('abc', '/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`conditionFilePathOf(filesDir="abc", fileN...: actual=${actual}`);
      expect(actual).assertEqual('abc/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`${BUNDLE}ConditionFilePathOf_0208 end`);
    });
  });
}
