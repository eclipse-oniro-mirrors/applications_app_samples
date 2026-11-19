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

/** Logic checks for conditionFilePathOf (96 cases). */
export default function conditionFilePathOf2Test(): void {
  describe('ConditionFilePathOf2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0094
     * @tc.name      FormExtAbility_ConditionFilePathOf_0094
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="photo.JPGphoto.JPG") returns "photo.JPGphoto...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0094 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'photo.JPGphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGphoto.JPGphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0094 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0095
     * @tc.name      FormExtAbility_ConditionFilePathOf_0095
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="photo.JPG_1") returns "photo.JPGphoto.JPG_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0095 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'photo.JPG_1');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGphoto.JPG_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0095 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0096
     * @tc.name      FormExtAbility_ConditionFilePathOf_0096
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="xphoto.JPG") returns "photo.JPGxphoto.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0096 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'xphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGxphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0096 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0097
     * @tc.name      FormExtAbility_ConditionFilePathOf_0097
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="/data/storage/el2/base/files/test.txt")...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0097 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', '/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gz/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0097 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0098
     * @tc.name      FormExtAbility_ConditionFilePathOf_0098
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="/data/storage/el2/base/haps/entry/fi......
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0098 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', '/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gz/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`${BUNDLE}ConditionFilePathOf_0098 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0099
     * @tc.name      FormExtAbility_ConditionFilePathOf_0099
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="test.mp3") returns "archive.tar.gztest....
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0099 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'test.mp3');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gztest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0099 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0100
     * @tc.name      FormExtAbility_ConditionFilePathOf_0100
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="photo.JPG") returns "archive.tar.gzphot...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0100 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'photo.JPG');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gzphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0100 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0101
     * @tc.name      FormExtAbility_ConditionFilePathOf_0101
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="archive.tar.gz") returns "archive.tar.g...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0101 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'archive.tar.gz');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gzarchive.tar.gz');
      logInfo(`${BUNDLE}ConditionFilePathOf_0101 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0102
     * @tc.name      FormExtAbility_ConditionFilePathOf_0102
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="noext") returns "archive.tar.gznoext"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0102 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'noext');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gznoext');
      logInfo(`${BUNDLE}ConditionFilePathOf_0102 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0103
     * @tc.name      FormExtAbility_ConditionFilePathOf_0103
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="") returns "archive.tar.gz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0103 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', '');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gz');
      logInfo(`${BUNDLE}ConditionFilePathOf_0103 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0104
     * @tc.name      FormExtAbility_ConditionFilePathOf_0104
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName=".hidden") returns "archive.tar.gz.hidden"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0104 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', '.hidden');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gz.hidden');
      logInfo(`${BUNDLE}ConditionFilePathOf_0104 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0105
     * @tc.name      FormExtAbility_ConditionFilePathOf_0105
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="a") returns "archive.tar.gza"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0105 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'a');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gza');
      logInfo(`${BUNDLE}ConditionFilePathOf_0105 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0106
     * @tc.name      FormExtAbility_ConditionFilePathOf_0106
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="abc") returns "archive.tar.gzabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0106 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'abc');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gzabc');
      logInfo(`${BUNDLE}ConditionFilePathOf_0106 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0107
     * @tc.name      FormExtAbility_ConditionFilePathOf_0107
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="Hello World") returns "archive.tar.gzHe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0107 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'Hello World');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gzHello World');
      logInfo(`${BUNDLE}ConditionFilePathOf_0107 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0108
     * @tc.name      FormExtAbility_ConditionFilePathOf_0108
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName=" ") returns "archive.tar.gz "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0108 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', ' ');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gz ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0108 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0109
     * @tc.name      FormExtAbility_ConditionFilePathOf_0109
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="123") returns "archive.tar.gz123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0109 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', '123');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gz123');
      logInfo(`${BUNDLE}ConditionFilePathOf_0109 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0110
     * @tc.name      FormExtAbility_ConditionFilePathOf_0110
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName=" /data/storage/el2/base/files/test.t......
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0110 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', ' /data/storage/el2/base/files/test.txt ');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gz /data/storage/el2/base/files/test.txt ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0110 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0111
     * @tc.name      FormExtAbility_ConditionFilePathOf_0111
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="/data/storage/el2/base/files/test.tx......
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0111 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', '/data/storage/el2/base/files/test.txt_1');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gz/data/storage/el2/base/files/test.txt_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0111 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0112
     * @tc.name      FormExtAbility_ConditionFilePathOf_0112
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="x/data/storage/el2/base/files/test.txt"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0112 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'x/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gzx/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0112 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0113
     * @tc.name      FormExtAbility_ConditionFilePathOf_0113
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName=" test.mp3 ") returns "archive.tar.gz te...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0113 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', ' test.mp3 ');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gz test.mp3 ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0113 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0114
     * @tc.name      FormExtAbility_ConditionFilePathOf_0114
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="test.mp3test.mp3") returns "archive.tar...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0114 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'test.mp3test.mp3');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gztest.mp3test.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0114 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0115
     * @tc.name      FormExtAbility_ConditionFilePathOf_0115
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="test.mp3_1") returns "archive.tar.gztes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0115 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'test.mp3_1');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gztest.mp3_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0115 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0116
     * @tc.name      FormExtAbility_ConditionFilePathOf_0116
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="xtest.mp3") returns "archive.tar.gzxtes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0116 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'xtest.mp3');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gzxtest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0116 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0117
     * @tc.name      FormExtAbility_ConditionFilePathOf_0117
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName=" photo.JPG ") returns "archive.tar.gz p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0117 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', ' photo.JPG ');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gz photo.JPG ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0117 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0118
     * @tc.name      FormExtAbility_ConditionFilePathOf_0118
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="photo.JPGphoto.JPG") returns "archive.t...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0118 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'photo.JPGphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gzphoto.JPGphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0118 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0119
     * @tc.name      FormExtAbility_ConditionFilePathOf_0119
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="photo.JPG_1") returns "archive.tar.gzph...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0119 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'photo.JPG_1');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gzphoto.JPG_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0119 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0120
     * @tc.name      FormExtAbility_ConditionFilePathOf_0120
     * @tc.desc      conditionFilePathOf(filesDir="archive.tar.gz", fileName="xphoto.JPG") returns "archive.tar.gzxph...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0120 begin`);
      const actual: string = conditionFilePathOf('archive.tar.gz', 'xphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="archive.tar...: actual=${actual}`);
      expect(actual).assertEqual('archive.tar.gzxphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0120 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0121
     * @tc.name      FormExtAbility_ConditionFilePathOf_0121
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="/data/storage/el2/base/files/test.txt") returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0121 begin`);
      const actual: string = conditionFilePathOf('noext', '/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noext/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0121 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0122
     * @tc.name      FormExtAbility_ConditionFilePathOf_0122
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="/data/storage/el2/base/haps/entry/fi...) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0122 begin`);
      const actual: string = conditionFilePathOf('noext', '/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noext/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`${BUNDLE}ConditionFilePathOf_0122 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0123
     * @tc.name      FormExtAbility_ConditionFilePathOf_0123
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="test.mp3") returns "noexttest.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0123 begin`);
      const actual: string = conditionFilePathOf('noext', 'test.mp3');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noexttest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0123 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0124
     * @tc.name      FormExtAbility_ConditionFilePathOf_0124
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="photo.JPG") returns "noextphoto.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0124 begin`);
      const actual: string = conditionFilePathOf('noext', 'photo.JPG');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noextphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0124 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0125
     * @tc.name      FormExtAbility_ConditionFilePathOf_0125
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="archive.tar.gz") returns "noextarchive.tar.gz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0125 begin`);
      const actual: string = conditionFilePathOf('noext', 'archive.tar.gz');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noextarchive.tar.gz');
      logInfo(`${BUNDLE}ConditionFilePathOf_0125 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0126
     * @tc.name      FormExtAbility_ConditionFilePathOf_0126
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="noext") returns "noextnoext"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0126 begin`);
      const actual: string = conditionFilePathOf('noext', 'noext');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noextnoext');
      logInfo(`${BUNDLE}ConditionFilePathOf_0126 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0127
     * @tc.name      FormExtAbility_ConditionFilePathOf_0127
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="") returns "noext"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0127 begin`);
      const actual: string = conditionFilePathOf('noext', '');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noext');
      logInfo(`${BUNDLE}ConditionFilePathOf_0127 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0128
     * @tc.name      FormExtAbility_ConditionFilePathOf_0128
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName=".hidden") returns "noext.hidden"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0128 begin`);
      const actual: string = conditionFilePathOf('noext', '.hidden');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noext.hidden');
      logInfo(`${BUNDLE}ConditionFilePathOf_0128 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0129
     * @tc.name      FormExtAbility_ConditionFilePathOf_0129
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="a") returns "noexta"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0129 begin`);
      const actual: string = conditionFilePathOf('noext', 'a');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noexta');
      logInfo(`${BUNDLE}ConditionFilePathOf_0129 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0130
     * @tc.name      FormExtAbility_ConditionFilePathOf_0130
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="abc") returns "noextabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0130 begin`);
      const actual: string = conditionFilePathOf('noext', 'abc');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noextabc');
      logInfo(`${BUNDLE}ConditionFilePathOf_0130 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0131
     * @tc.name      FormExtAbility_ConditionFilePathOf_0131
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="Hello World") returns "noextHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0131 begin`);
      const actual: string = conditionFilePathOf('noext', 'Hello World');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noextHello World');
      logInfo(`${BUNDLE}ConditionFilePathOf_0131 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0132
     * @tc.name      FormExtAbility_ConditionFilePathOf_0132
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName=" ") returns "noext "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0132 begin`);
      const actual: string = conditionFilePathOf('noext', ' ');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noext ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0132 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0133
     * @tc.name      FormExtAbility_ConditionFilePathOf_0133
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="123") returns "noext123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0133 begin`);
      const actual: string = conditionFilePathOf('noext', '123');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noext123');
      logInfo(`${BUNDLE}ConditionFilePathOf_0133 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0134
     * @tc.name      FormExtAbility_ConditionFilePathOf_0134
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName=" /data/storage/el2/base/files/test.t...) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0134 begin`);
      const actual: string = conditionFilePathOf('noext', ' /data/storage/el2/base/files/test.txt ');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noext /data/storage/el2/base/files/test.txt ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0134 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0135
     * @tc.name      FormExtAbility_ConditionFilePathOf_0135
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="/data/storage/el2/base/files/test.tx...) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0135 begin`);
      const actual: string = conditionFilePathOf('noext', '/data/storage/el2/base/files/test.txt_1');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noext/data/storage/el2/base/files/test.txt_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0135 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0136
     * @tc.name      FormExtAbility_ConditionFilePathOf_0136
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="x/data/storage/el2/base/files/test.txt") returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0136 begin`);
      const actual: string = conditionFilePathOf('noext', 'x/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noextx/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0136 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0137
     * @tc.name      FormExtAbility_ConditionFilePathOf_0137
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName=" test.mp3 ") returns "noext test.mp3 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0137 begin`);
      const actual: string = conditionFilePathOf('noext', ' test.mp3 ');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noext test.mp3 ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0137 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0138
     * @tc.name      FormExtAbility_ConditionFilePathOf_0138
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="test.mp3test.mp3") returns "noexttest.mp3test.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0138 begin`);
      const actual: string = conditionFilePathOf('noext', 'test.mp3test.mp3');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noexttest.mp3test.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0138 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0139
     * @tc.name      FormExtAbility_ConditionFilePathOf_0139
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="test.mp3_1") returns "noexttest.mp3_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0139 begin`);
      const actual: string = conditionFilePathOf('noext', 'test.mp3_1');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noexttest.mp3_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0139 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0140
     * @tc.name      FormExtAbility_ConditionFilePathOf_0140
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="xtest.mp3") returns "noextxtest.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0140 begin`);
      const actual: string = conditionFilePathOf('noext', 'xtest.mp3');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noextxtest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0140 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0141
     * @tc.name      FormExtAbility_ConditionFilePathOf_0141
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName=" photo.JPG ") returns "noext photo.JPG "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0141 begin`);
      const actual: string = conditionFilePathOf('noext', ' photo.JPG ');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noext photo.JPG ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0141 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0142
     * @tc.name      FormExtAbility_ConditionFilePathOf_0142
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="photo.JPGphoto.JPG") returns "noextphoto.JPGphot...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0142 begin`);
      const actual: string = conditionFilePathOf('noext', 'photo.JPGphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noextphoto.JPGphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0142 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0143
     * @tc.name      FormExtAbility_ConditionFilePathOf_0143
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="photo.JPG_1") returns "noextphoto.JPG_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0143 begin`);
      const actual: string = conditionFilePathOf('noext', 'photo.JPG_1');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noextphoto.JPG_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0143 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0144
     * @tc.name      FormExtAbility_ConditionFilePathOf_0144
     * @tc.desc      conditionFilePathOf(filesDir="noext", fileName="xphoto.JPG") returns "noextxphoto.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0144 begin`);
      const actual: string = conditionFilePathOf('noext', 'xphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="noext", fil...: actual=${actual}`);
      expect(actual).assertEqual('noextxphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0144 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0145
     * @tc.name      FormExtAbility_ConditionFilePathOf_0145
     * @tc.desc      conditionFilePathOf(filesDir="", fileName="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0145 begin`);
      const actual: string = conditionFilePathOf('', '');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ConditionFilePathOf_0145 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0146
     * @tc.name      FormExtAbility_ConditionFilePathOf_0146
     * @tc.desc      conditionFilePathOf(filesDir="", fileName=".hidden") returns ".hidden"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0146 begin`);
      const actual: string = conditionFilePathOf('', '.hidden');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('.hidden');
      logInfo(`${BUNDLE}ConditionFilePathOf_0146 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0147
     * @tc.name      FormExtAbility_ConditionFilePathOf_0147
     * @tc.desc      conditionFilePathOf(filesDir="", fileName="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0147 begin`);
      const actual: string = conditionFilePathOf('', 'a');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ConditionFilePathOf_0147 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0148
     * @tc.name      FormExtAbility_ConditionFilePathOf_0148
     * @tc.desc      conditionFilePathOf(filesDir="", fileName="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0148 begin`);
      const actual: string = conditionFilePathOf('', 'abc');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ConditionFilePathOf_0148 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0149
     * @tc.name      FormExtAbility_ConditionFilePathOf_0149
     * @tc.desc      conditionFilePathOf(filesDir="", fileName="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0149 begin`);
      const actual: string = conditionFilePathOf('', 'Hello World');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ConditionFilePathOf_0149 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0150
     * @tc.name      FormExtAbility_ConditionFilePathOf_0150
     * @tc.desc      conditionFilePathOf(filesDir="", fileName=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0150 begin`);
      const actual: string = conditionFilePathOf('', ' ');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0150 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0151
     * @tc.name      FormExtAbility_ConditionFilePathOf_0151
     * @tc.desc      conditionFilePathOf(filesDir="", fileName="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0151 begin`);
      const actual: string = conditionFilePathOf('', '123');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ConditionFilePathOf_0151 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0152
     * @tc.name      FormExtAbility_ConditionFilePathOf_0152
     * @tc.desc      conditionFilePathOf(filesDir="", fileName=" /data/storage/el2/base/files/test.t...) returns " /d...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0152 begin`);
      const actual: string = conditionFilePathOf('', ' /data/storage/el2/base/files/test.txt ');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual(' /data/storage/el2/base/files/test.txt ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0152 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0153
     * @tc.name      FormExtAbility_ConditionFilePathOf_0153
     * @tc.desc      conditionFilePathOf(filesDir="", fileName="/data/storage/el2/base/files/test.tx...) returns "/da...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0153 begin`);
      const actual: string = conditionFilePathOf('', '/data/storage/el2/base/files/test.txt_1');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txt_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0153 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0154
     * @tc.name      FormExtAbility_ConditionFilePathOf_0154
     * @tc.desc      conditionFilePathOf(filesDir="", fileName="x/data/storage/el2/base/files/test.txt") returns "x/d...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0154 begin`);
      const actual: string = conditionFilePathOf('', 'x/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('x/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0154 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0155
     * @tc.name      FormExtAbility_ConditionFilePathOf_0155
     * @tc.desc      conditionFilePathOf(filesDir="", fileName=" test.mp3 ") returns " test.mp3 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0155 begin`);
      const actual: string = conditionFilePathOf('', ' test.mp3 ');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual(' test.mp3 ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0155 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0156
     * @tc.name      FormExtAbility_ConditionFilePathOf_0156
     * @tc.desc      conditionFilePathOf(filesDir="", fileName="test.mp3_1") returns "test.mp3_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0156 begin`);
      const actual: string = conditionFilePathOf('', 'test.mp3_1');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0156 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0157
     * @tc.name      FormExtAbility_ConditionFilePathOf_0157
     * @tc.desc      conditionFilePathOf(filesDir="", fileName="xtest.mp3") returns "xtest.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0157 begin`);
      const actual: string = conditionFilePathOf('', 'xtest.mp3');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('xtest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0157 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0158
     * @tc.name      FormExtAbility_ConditionFilePathOf_0158
     * @tc.desc      conditionFilePathOf(filesDir="", fileName=" photo.JPG ") returns " photo.JPG "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0158 begin`);
      const actual: string = conditionFilePathOf('', ' photo.JPG ');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual(' photo.JPG ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0158 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0159
     * @tc.name      FormExtAbility_ConditionFilePathOf_0159
     * @tc.desc      conditionFilePathOf(filesDir="", fileName="photo.JPG_1") returns "photo.JPG_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0159 begin`);
      const actual: string = conditionFilePathOf('', 'photo.JPG_1');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPG_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0159 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0160
     * @tc.name      FormExtAbility_ConditionFilePathOf_0160
     * @tc.desc      conditionFilePathOf(filesDir="", fileName="xphoto.JPG") returns "xphoto.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0160 begin`);
      const actual: string = conditionFilePathOf('', 'xphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="", fileName...: actual=${actual}`);
      expect(actual).assertEqual('xphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0160 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0161
     * @tc.name      FormExtAbility_ConditionFilePathOf_0161
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="/data/storage/el2/base/files/test.txt") return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0161 begin`);
      const actual: string = conditionFilePathOf('.hidden', '/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hidden/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0161 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0162
     * @tc.name      FormExtAbility_ConditionFilePathOf_0162
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="/data/storage/el2/base/haps/entry/fi...) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0162 begin`);
      const actual: string = conditionFilePathOf('.hidden', '/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hidden/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`${BUNDLE}ConditionFilePathOf_0162 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0163
     * @tc.name      FormExtAbility_ConditionFilePathOf_0163
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="test.mp3") returns ".hiddentest.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0163 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'test.mp3');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddentest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0163 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0164
     * @tc.name      FormExtAbility_ConditionFilePathOf_0164
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="photo.JPG") returns ".hiddenphoto.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0164 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'photo.JPG');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddenphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0164 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0165
     * @tc.name      FormExtAbility_ConditionFilePathOf_0165
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="archive.tar.gz") returns ".hiddenarchive.tar.gz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0165 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'archive.tar.gz');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddenarchive.tar.gz');
      logInfo(`${BUNDLE}ConditionFilePathOf_0165 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0166
     * @tc.name      FormExtAbility_ConditionFilePathOf_0166
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="noext") returns ".hiddennoext"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0166 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'noext');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddennoext');
      logInfo(`${BUNDLE}ConditionFilePathOf_0166 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0167
     * @tc.name      FormExtAbility_ConditionFilePathOf_0167
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName=".hidden") returns ".hidden.hidden"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0167 begin`);
      const actual: string = conditionFilePathOf('.hidden', '.hidden');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hidden.hidden');
      logInfo(`${BUNDLE}ConditionFilePathOf_0167 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0168
     * @tc.name      FormExtAbility_ConditionFilePathOf_0168
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="a") returns ".hiddena"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0168 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'a');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddena');
      logInfo(`${BUNDLE}ConditionFilePathOf_0168 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0169
     * @tc.name      FormExtAbility_ConditionFilePathOf_0169
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="abc") returns ".hiddenabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0169 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'abc');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddenabc');
      logInfo(`${BUNDLE}ConditionFilePathOf_0169 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0170
     * @tc.name      FormExtAbility_ConditionFilePathOf_0170
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="Hello World") returns ".hiddenHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0170 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'Hello World');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddenHello World');
      logInfo(`${BUNDLE}ConditionFilePathOf_0170 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0171
     * @tc.name      FormExtAbility_ConditionFilePathOf_0171
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName=" ") returns ".hidden "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0171 begin`);
      const actual: string = conditionFilePathOf('.hidden', ' ');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hidden ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0171 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0172
     * @tc.name      FormExtAbility_ConditionFilePathOf_0172
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="123") returns ".hidden123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0172 begin`);
      const actual: string = conditionFilePathOf('.hidden', '123');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hidden123');
      logInfo(`${BUNDLE}ConditionFilePathOf_0172 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0173
     * @tc.name      FormExtAbility_ConditionFilePathOf_0173
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName=" /data/storage/el2/base/files/test.t...) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0173 begin`);
      const actual: string = conditionFilePathOf('.hidden', ' /data/storage/el2/base/files/test.txt ');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hidden /data/storage/el2/base/files/test.txt ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0173 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0174
     * @tc.name      FormExtAbility_ConditionFilePathOf_0174
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="/data/storage/el2/base/files/test.tx...) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0174 begin`);
      const actual: string = conditionFilePathOf('.hidden', '/data/storage/el2/base/files/test.txt_1');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hidden/data/storage/el2/base/files/test.txt_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0174 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0175
     * @tc.name      FormExtAbility_ConditionFilePathOf_0175
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="x/data/storage/el2/base/files/test.txt") retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0175 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'x/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddenx/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0175 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0176
     * @tc.name      FormExtAbility_ConditionFilePathOf_0176
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName=" test.mp3 ") returns ".hidden test.mp3 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0176 begin`);
      const actual: string = conditionFilePathOf('.hidden', ' test.mp3 ');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hidden test.mp3 ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0176 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0177
     * @tc.name      FormExtAbility_ConditionFilePathOf_0177
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="test.mp3test.mp3") returns ".hiddentest.mp3tes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0177 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'test.mp3test.mp3');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddentest.mp3test.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0177 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0178
     * @tc.name      FormExtAbility_ConditionFilePathOf_0178
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="test.mp3_1") returns ".hiddentest.mp3_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0178 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'test.mp3_1');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddentest.mp3_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0178 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0179
     * @tc.name      FormExtAbility_ConditionFilePathOf_0179
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="xtest.mp3") returns ".hiddenxtest.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0179 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'xtest.mp3');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddenxtest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0179 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0180
     * @tc.name      FormExtAbility_ConditionFilePathOf_0180
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName=" photo.JPG ") returns ".hidden photo.JPG "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0180 begin`);
      const actual: string = conditionFilePathOf('.hidden', ' photo.JPG ');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hidden photo.JPG ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0180 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0181
     * @tc.name      FormExtAbility_ConditionFilePathOf_0181
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="photo.JPGphoto.JPG") returns ".hiddenphoto.JPG...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0181 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'photo.JPGphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddenphoto.JPGphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0181 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0182
     * @tc.name      FormExtAbility_ConditionFilePathOf_0182
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="photo.JPG_1") returns ".hiddenphoto.JPG_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0182 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'photo.JPG_1');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddenphoto.JPG_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0182 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0183
     * @tc.name      FormExtAbility_ConditionFilePathOf_0183
     * @tc.desc      conditionFilePathOf(filesDir=".hidden", fileName="xphoto.JPG") returns ".hiddenxphoto.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0183 begin`);
      const actual: string = conditionFilePathOf('.hidden', 'xphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir=".hidden", f...: actual=${actual}`);
      expect(actual).assertEqual('.hiddenxphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0183 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0184
     * @tc.name      FormExtAbility_ConditionFilePathOf_0184
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="/data/storage/el2/base/files/test.txt") returns "a/d...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0184 begin`);
      const actual: string = conditionFilePathOf('a', '/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('a/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0184 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0185
     * @tc.name      FormExtAbility_ConditionFilePathOf_0185
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="/data/storage/el2/base/haps/entry/fi...) returns "a/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0185 begin`);
      const actual: string = conditionFilePathOf('a', '/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('a/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`${BUNDLE}ConditionFilePathOf_0185 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0186
     * @tc.name      FormExtAbility_ConditionFilePathOf_0186
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="test.mp3") returns "atest.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0186 begin`);
      const actual: string = conditionFilePathOf('a', 'test.mp3');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('atest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0186 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0187
     * @tc.name      FormExtAbility_ConditionFilePathOf_0187
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="photo.JPG") returns "aphoto.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0187 begin`);
      const actual: string = conditionFilePathOf('a', 'photo.JPG');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('aphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0187 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0188
     * @tc.name      FormExtAbility_ConditionFilePathOf_0188
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="archive.tar.gz") returns "aarchive.tar.gz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0188 begin`);
      const actual: string = conditionFilePathOf('a', 'archive.tar.gz');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('aarchive.tar.gz');
      logInfo(`${BUNDLE}ConditionFilePathOf_0188 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0189
     * @tc.name      FormExtAbility_ConditionFilePathOf_0189
     * @tc.desc      conditionFilePathOf(filesDir="a", fileName="noext") returns "anoext"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0189 begin`);
      const actual: string = conditionFilePathOf('a', 'noext');
      logInfo(`conditionFilePathOf(filesDir="a", fileNam...: actual=${actual}`);
      expect(actual).assertEqual('anoext');
      logInfo(`${BUNDLE}ConditionFilePathOf_0189 end`);
    });
  });
}
