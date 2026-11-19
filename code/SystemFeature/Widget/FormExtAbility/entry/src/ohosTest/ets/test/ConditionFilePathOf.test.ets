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

/** Logic checks for conditionFilePathOf (93 cases). */
export default function conditionFilePathOfTest(): void {
  describe('ConditionFilePathOfTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0001
     * @tc.name      FormExtAbility_ConditionFilePathOf_0001
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="/data/storage/el...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_ConditionFilePathOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0001 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt',
        '/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('/data/storage/el2/base/files/tes');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0002
     * @tc.name      FormExtAbility_ConditionFilePathOf_0002
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="/data/storage/el...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_ConditionFilePathOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0002 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt',
        '/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('/data/storage/el2/base/files/tes');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('/el2/base/haps/entry/files/a.mp4');
      logInfo(`${BUNDLE}ConditionFilePathOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0003
     * @tc.name      FormExtAbility_ConditionFilePathOf_0003
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="test.mp3") retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0003 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'test.mp3');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txttest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0004
     * @tc.name      FormExtAbility_ConditionFilePathOf_0004
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="photo.JPG") retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0004 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'photo.JPG');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txtphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0005
     * @tc.name      FormExtAbility_ConditionFilePathOf_0005
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="archive.tar.gz")...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0005 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'archive.tar.gz');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txtarchive.tar.gz');
      logInfo(`${BUNDLE}ConditionFilePathOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0006
     * @tc.name      FormExtAbility_ConditionFilePathOf_0006
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="noext") returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0006 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'noext');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txtnoext');
      logInfo(`${BUNDLE}ConditionFilePathOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0007
     * @tc.name      FormExtAbility_ConditionFilePathOf_0007
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="") returns "/dat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0007 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', '');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0008
     * @tc.name      FormExtAbility_ConditionFilePathOf_0008
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName=".hidden") return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0008 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', '.hidden');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txt.hidden');
      logInfo(`${BUNDLE}ConditionFilePathOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0009
     * @tc.name      FormExtAbility_ConditionFilePathOf_0009
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="a") returns "/da...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0009 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'a');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txta');
      logInfo(`${BUNDLE}ConditionFilePathOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0010
     * @tc.name      FormExtAbility_ConditionFilePathOf_0010
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="abc") returns "/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0010 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'abc');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txtabc');
      logInfo(`${BUNDLE}ConditionFilePathOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0011
     * @tc.name      FormExtAbility_ConditionFilePathOf_0011
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="Hello World") re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0011 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'Hello World');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txtHello World');
      logInfo(`${BUNDLE}ConditionFilePathOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0012
     * @tc.name      FormExtAbility_ConditionFilePathOf_0012
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName=" ") returns "/da...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0012 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', ' ');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txt ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0013
     * @tc.name      FormExtAbility_ConditionFilePathOf_0013
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="123") returns "/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0013 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', '123');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txt123');
      logInfo(`${BUNDLE}ConditionFilePathOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0014
     * @tc.name      FormExtAbility_ConditionFilePathOf_0014
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName=" /data/storage/e...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0014 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt',
        ' /data/storage/el2/base/files/test.txt ');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('/data/storage/el2/base/files/tes');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('storage/el2/base/files/test.txt ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0015
     * @tc.name      FormExtAbility_ConditionFilePathOf_0015
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="/data/storage/el...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0015 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt',
        '/data/storage/el2/base/files/test.txt_1');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('/data/storage/el2/base/files/tes');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('torage/el2/base/files/test.txt_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0016
     * @tc.name      FormExtAbility_ConditionFilePathOf_0016
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="x/data/storage/e...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0016 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt',
        'x/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('/data/storage/el2/base/files/tes');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0017
     * @tc.name      FormExtAbility_ConditionFilePathOf_0017
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName=" test.mp3 ") ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0017 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', ' test.mp3 ');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txt test.mp3 ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0018
     * @tc.name      FormExtAbility_ConditionFilePathOf_0018
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="test.mp3test.mp3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0018 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'test.mp3test.mp3');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txttest.mp3test.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0019
     * @tc.name      FormExtAbility_ConditionFilePathOf_0019
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="test.mp3_1") ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0019 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'test.mp3_1');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txttest.mp3_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0020
     * @tc.name      FormExtAbility_ConditionFilePathOf_0020
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="xtest.mp3") retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0020 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'xtest.mp3');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txtxtest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0021
     * @tc.name      FormExtAbility_ConditionFilePathOf_0021
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName=" photo.JPG ") re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0021 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', ' photo.JPG ');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txt photo.JPG ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0022
     * @tc.name      FormExtAbility_ConditionFilePathOf_0022
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="photo.JPGphoto.J...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0022 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'photo.JPGphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txtphoto.JPGphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0023
     * @tc.name      FormExtAbility_ConditionFilePathOf_0023
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="photo.JPG_1") re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0023 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'photo.JPG_1');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txtphoto.JPG_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0024
     * @tc.name      FormExtAbility_ConditionFilePathOf_0024
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/files/test.txt", fileName="xphoto.JPG") ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0024 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/files/test.txt', 'xphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/files/test.txtxphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0025
     * @tc.name      FormExtAbility_ConditionFilePathOf_0025
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="/data/storage/e...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0025 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4',
        '/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('/data/storage/el2/base/haps/entr');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0026
     * @tc.name      FormExtAbility_ConditionFilePathOf_0026
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="/data/storage/e...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0026 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4',
        '/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(90);
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('/data/storage/el2/base/haps/entr');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(58)=${actual.substring(58)}`);
      expect(actual.substring(58)).assertEqual('/el2/base/haps/entry/files/a.mp4');
      logInfo(`${BUNDLE}ConditionFilePathOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0027
     * @tc.name      FormExtAbility_ConditionFilePathOf_0027
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="test.mp3") retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0027 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'test.mp3');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4test.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0028
     * @tc.name      FormExtAbility_ConditionFilePathOf_0028
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="photo.JPG") ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0028 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'photo.JPG');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4photo.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0029
     * @tc.name      FormExtAbility_ConditionFilePathOf_0029
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="archive.tar.gz"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0029 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'archive.tar.gz');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4archive.tar.gz');
      logInfo(`${BUNDLE}ConditionFilePathOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0030
     * @tc.name      FormExtAbility_ConditionFilePathOf_0030
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="noext") returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0030 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'noext');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4noext');
      logInfo(`${BUNDLE}ConditionFilePathOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0031
     * @tc.name      FormExtAbility_ConditionFilePathOf_0031
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="") returns "/da...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0031 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', '');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`${BUNDLE}ConditionFilePathOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0032
     * @tc.name      FormExtAbility_ConditionFilePathOf_0032
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName=".hidden") retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0032 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', '.hidden');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4.hidden');
      logInfo(`${BUNDLE}ConditionFilePathOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0033
     * @tc.name      FormExtAbility_ConditionFilePathOf_0033
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="a") returns "/d...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0033 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'a');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4a');
      logInfo(`${BUNDLE}ConditionFilePathOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0034
     * @tc.name      FormExtAbility_ConditionFilePathOf_0034
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="abc") returns "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0034 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'abc');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4abc');
      logInfo(`${BUNDLE}ConditionFilePathOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0035
     * @tc.name      FormExtAbility_ConditionFilePathOf_0035
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="Hello World") r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0035 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'Hello World');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4Hello World');
      logInfo(`${BUNDLE}ConditionFilePathOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0036
     * @tc.name      FormExtAbility_ConditionFilePathOf_0036
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName=" ") returns "/d...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0036 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', ' ');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4 ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0037
     * @tc.name      FormExtAbility_ConditionFilePathOf_0037
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="123") returns "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0037 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', '123');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4123');
      logInfo(`${BUNDLE}ConditionFilePathOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0038
     * @tc.name      FormExtAbility_ConditionFilePathOf_0038
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName=" /data/storage/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0038 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4',
        ' /data/storage/el2/base/files/test.txt ');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('/data/storage/el2/base/haps/entr');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual('storage/el2/base/files/test.txt ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0039
     * @tc.name      FormExtAbility_ConditionFilePathOf_0039
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="/data/storage/e...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0039 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4',
        '/data/storage/el2/base/files/test.txt_1');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('/data/storage/el2/base/haps/entr');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual('torage/el2/base/files/test.txt_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0040
     * @tc.name      FormExtAbility_ConditionFilePathOf_0040
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="x/data/storage/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0040 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4',
        'x/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('/data/storage/el2/base/haps/entr');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0041
     * @tc.name      FormExtAbility_ConditionFilePathOf_0041
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName=" test.mp3 ") re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0041 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', ' test.mp3 ');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4 test.mp3 ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0042
     * @tc.name      FormExtAbility_ConditionFilePathOf_0042
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="test.mp3test.mp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0042 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'test.mp3test.mp3');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4test.mp3test.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0043
     * @tc.name      FormExtAbility_ConditionFilePathOf_0043
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="test.mp3_1") re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0043 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'test.mp3_1');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4test.mp3_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0044
     * @tc.name      FormExtAbility_ConditionFilePathOf_0044
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="xtest.mp3") ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0044 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'xtest.mp3');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4xtest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0045
     * @tc.name      FormExtAbility_ConditionFilePathOf_0045
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName=" photo.JPG ") r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0045 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', ' photo.JPG ');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4 photo.JPG ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0046
     * @tc.name      FormExtAbility_ConditionFilePathOf_0046
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="photo.JPGphoto....
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0046 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'photo.JPGphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4photo.JPGphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0047
     * @tc.name      FormExtAbility_ConditionFilePathOf_0047
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="photo.JPG_1") r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0047 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'photo.JPG_1');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4photo.JPG_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0048
     * @tc.name      FormExtAbility_ConditionFilePathOf_0048
     * @tc.desc      conditionFilePathOf(filesDir="/data/storage/el2/base/haps/entry/fi..., fileName="xphoto.JPG") re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0048 begin`);
      const actual: string = conditionFilePathOf('/data/storage/el2/base/haps/entry/files/a.mp4', 'xphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="/data/stora...: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/entry/files/a.mp4xphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0049
     * @tc.name      FormExtAbility_ConditionFilePathOf_0049
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="/data/storage/el2/base/files/test.txt") retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0049 begin`);
      const actual: string = conditionFilePathOf('test.mp3', '/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0050
     * @tc.name      FormExtAbility_ConditionFilePathOf_0050
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="/data/storage/el2/base/haps/entry/fi...) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0050 begin`);
      const actual: string = conditionFilePathOf('test.mp3', '/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`${BUNDLE}ConditionFilePathOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0051
     * @tc.name      FormExtAbility_ConditionFilePathOf_0051
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="test.mp3") returns "test.mp3test.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0051 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'test.mp3');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3test.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0052
     * @tc.name      FormExtAbility_ConditionFilePathOf_0052
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="photo.JPG") returns "test.mp3photo.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0052 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'photo.JPG');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3photo.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0053
     * @tc.name      FormExtAbility_ConditionFilePathOf_0053
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="archive.tar.gz") returns "test.mp3archive.tar...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0053 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'archive.tar.gz');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3archive.tar.gz');
      logInfo(`${BUNDLE}ConditionFilePathOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0054
     * @tc.name      FormExtAbility_ConditionFilePathOf_0054
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="noext") returns "test.mp3noext"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0054 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'noext');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3noext');
      logInfo(`${BUNDLE}ConditionFilePathOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0055
     * @tc.name      FormExtAbility_ConditionFilePathOf_0055
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="") returns "test.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0055 begin`);
      const actual: string = conditionFilePathOf('test.mp3', '');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0056
     * @tc.name      FormExtAbility_ConditionFilePathOf_0056
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName=".hidden") returns "test.mp3.hidden"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0056 begin`);
      const actual: string = conditionFilePathOf('test.mp3', '.hidden');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3.hidden');
      logInfo(`${BUNDLE}ConditionFilePathOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0057
     * @tc.name      FormExtAbility_ConditionFilePathOf_0057
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="a") returns "test.mp3a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0057 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'a');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3a');
      logInfo(`${BUNDLE}ConditionFilePathOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0058
     * @tc.name      FormExtAbility_ConditionFilePathOf_0058
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="abc") returns "test.mp3abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0058 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'abc');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3abc');
      logInfo(`${BUNDLE}ConditionFilePathOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0059
     * @tc.name      FormExtAbility_ConditionFilePathOf_0059
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="Hello World") returns "test.mp3Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0059 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'Hello World');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3Hello World');
      logInfo(`${BUNDLE}ConditionFilePathOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0060
     * @tc.name      FormExtAbility_ConditionFilePathOf_0060
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName=" ") returns "test.mp3 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0060 begin`);
      const actual: string = conditionFilePathOf('test.mp3', ' ');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3 ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0061
     * @tc.name      FormExtAbility_ConditionFilePathOf_0061
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="123") returns "test.mp3123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0061 begin`);
      const actual: string = conditionFilePathOf('test.mp3', '123');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3123');
      logInfo(`${BUNDLE}ConditionFilePathOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0062
     * @tc.name      FormExtAbility_ConditionFilePathOf_0062
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName=" /data/storage/el2/base/files/test.t...) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0062 begin`);
      const actual: string = conditionFilePathOf('test.mp3', ' /data/storage/el2/base/files/test.txt ');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3 /data/storage/el2/base/files/test.txt ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0063
     * @tc.name      FormExtAbility_ConditionFilePathOf_0063
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="/data/storage/el2/base/files/test.tx...) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0063 begin`);
      const actual: string = conditionFilePathOf('test.mp3', '/data/storage/el2/base/files/test.txt_1');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3/data/storage/el2/base/files/test.txt_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0064
     * @tc.name      FormExtAbility_ConditionFilePathOf_0064
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="x/data/storage/el2/base/files/test.txt") retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0064 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'x/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3x/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0065
     * @tc.name      FormExtAbility_ConditionFilePathOf_0065
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName=" test.mp3 ") returns "test.mp3 test.mp3 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0065 begin`);
      const actual: string = conditionFilePathOf('test.mp3', ' test.mp3 ');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3 test.mp3 ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0066
     * @tc.name      FormExtAbility_ConditionFilePathOf_0066
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="test.mp3test.mp3") returns "test.mp3test.mp3t...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0066 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'test.mp3test.mp3');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3test.mp3test.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0067
     * @tc.name      FormExtAbility_ConditionFilePathOf_0067
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="test.mp3_1") returns "test.mp3test.mp3_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0067 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'test.mp3_1');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3test.mp3_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0068
     * @tc.name      FormExtAbility_ConditionFilePathOf_0068
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="xtest.mp3") returns "test.mp3xtest.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0068 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'xtest.mp3');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3xtest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0069
     * @tc.name      FormExtAbility_ConditionFilePathOf_0069
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName=" photo.JPG ") returns "test.mp3 photo.JPG "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0069 begin`);
      const actual: string = conditionFilePathOf('test.mp3', ' photo.JPG ');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3 photo.JPG ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0070
     * @tc.name      FormExtAbility_ConditionFilePathOf_0070
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="photo.JPGphoto.JPG") returns "test.mp3photo.J...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0070 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'photo.JPGphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3photo.JPGphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0071
     * @tc.name      FormExtAbility_ConditionFilePathOf_0071
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="photo.JPG_1") returns "test.mp3photo.JPG_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0071 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'photo.JPG_1');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3photo.JPG_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0072
     * @tc.name      FormExtAbility_ConditionFilePathOf_0072
     * @tc.desc      conditionFilePathOf(filesDir="test.mp3", fileName="xphoto.JPG") returns "test.mp3xphoto.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0072 begin`);
      const actual: string = conditionFilePathOf('test.mp3', 'xphoto.JPG');
      logInfo(`conditionFilePathOf(filesDir="test.mp3", ...: actual=${actual}`);
      expect(actual).assertEqual('test.mp3xphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0073
     * @tc.name      FormExtAbility_ConditionFilePathOf_0073
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="/data/storage/el2/base/files/test.txt") retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0073 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', '/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPG/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0074
     * @tc.name      FormExtAbility_ConditionFilePathOf_0074
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="/data/storage/el2/base/haps/entry/fi...) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0074 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', '/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPG/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`${BUNDLE}ConditionFilePathOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0075
     * @tc.name      FormExtAbility_ConditionFilePathOf_0075
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="test.mp3") returns "photo.JPGtest.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0075 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'test.mp3');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGtest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0076
     * @tc.name      FormExtAbility_ConditionFilePathOf_0076
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="photo.JPG") returns "photo.JPGphoto.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0076 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'photo.JPG');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGphoto.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0077
     * @tc.name      FormExtAbility_ConditionFilePathOf_0077
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="archive.tar.gz") returns "photo.JPGarchive.t...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0077 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'archive.tar.gz');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGarchive.tar.gz');
      logInfo(`${BUNDLE}ConditionFilePathOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0078
     * @tc.name      FormExtAbility_ConditionFilePathOf_0078
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="noext") returns "photo.JPGnoext"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0078 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'noext');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGnoext');
      logInfo(`${BUNDLE}ConditionFilePathOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0079
     * @tc.name      FormExtAbility_ConditionFilePathOf_0079
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="") returns "photo.JPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0079 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', '');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPG');
      logInfo(`${BUNDLE}ConditionFilePathOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0080
     * @tc.name      FormExtAbility_ConditionFilePathOf_0080
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName=".hidden") returns "photo.JPG.hidden"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0080 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', '.hidden');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPG.hidden');
      logInfo(`${BUNDLE}ConditionFilePathOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0081
     * @tc.name      FormExtAbility_ConditionFilePathOf_0081
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="a") returns "photo.JPGa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0081 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'a');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGa');
      logInfo(`${BUNDLE}ConditionFilePathOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0082
     * @tc.name      FormExtAbility_ConditionFilePathOf_0082
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="abc") returns "photo.JPGabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0082 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'abc');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGabc');
      logInfo(`${BUNDLE}ConditionFilePathOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0083
     * @tc.name      FormExtAbility_ConditionFilePathOf_0083
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="Hello World") returns "photo.JPGHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0083 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'Hello World');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGHello World');
      logInfo(`${BUNDLE}ConditionFilePathOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0084
     * @tc.name      FormExtAbility_ConditionFilePathOf_0084
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName=" ") returns "photo.JPG "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0084 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', ' ');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPG ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0085
     * @tc.name      FormExtAbility_ConditionFilePathOf_0085
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="123") returns "photo.JPG123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0085 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', '123');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPG123');
      logInfo(`${BUNDLE}ConditionFilePathOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0086
     * @tc.name      FormExtAbility_ConditionFilePathOf_0086
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName=" /data/storage/el2/base/files/test.t...) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0086 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', ' /data/storage/el2/base/files/test.txt ');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPG /data/storage/el2/base/files/test.txt ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0087
     * @tc.name      FormExtAbility_ConditionFilePathOf_0087
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="/data/storage/el2/base/files/test.tx...) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0087 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', '/data/storage/el2/base/files/test.txt_1');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPG/data/storage/el2/base/files/test.txt_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0088
     * @tc.name      FormExtAbility_ConditionFilePathOf_0088
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="x/data/storage/el2/base/files/test.txt") ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0088 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'x/data/storage/el2/base/files/test.txt');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGx/data/storage/el2/base/files/test.txt');
      logInfo(`${BUNDLE}ConditionFilePathOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0089
     * @tc.name      FormExtAbility_ConditionFilePathOf_0089
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName=" test.mp3 ") returns "photo.JPG test.mp3 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0089 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', ' test.mp3 ');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPG test.mp3 ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0090
     * @tc.name      FormExtAbility_ConditionFilePathOf_0090
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="test.mp3test.mp3") returns "photo.JPGtest.mp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0090 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'test.mp3test.mp3');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGtest.mp3test.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0090 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0091
     * @tc.name      FormExtAbility_ConditionFilePathOf_0091
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="test.mp3_1") returns "photo.JPGtest.mp3_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_ConditionFilePathOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0091 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'test.mp3_1');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGtest.mp3_1');
      logInfo(`${BUNDLE}ConditionFilePathOf_0091 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0092
     * @tc.name      FormExtAbility_ConditionFilePathOf_0092
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName="xtest.mp3") returns "photo.JPGxtest.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0092 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', 'xtest.mp3');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPGxtest.mp3');
      logInfo(`${BUNDLE}ConditionFilePathOf_0092 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CONDITION_FILE_PATH_OF_0093
     * @tc.name      FormExtAbility_ConditionFilePathOf_0093
     * @tc.desc      conditionFilePathOf(filesDir="photo.JPG", fileName=" photo.JPG ") returns "photo.JPG photo.JPG "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_ConditionFilePathOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ConditionFilePathOf_0093 begin`);
      const actual: string = conditionFilePathOf('photo.JPG', ' photo.JPG ');
      logInfo(`conditionFilePathOf(filesDir="photo.JPG",...: actual=${actual}`);
      expect(actual).assertEqual('photo.JPG photo.JPG ');
      logInfo(`${BUNDLE}ConditionFilePathOf_0093 end`);
    });
  });
}
