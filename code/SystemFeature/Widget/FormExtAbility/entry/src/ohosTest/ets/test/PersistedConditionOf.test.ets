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
import { persistedConditionOf } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for persistedConditionOf (90 cases). */
export default function persistedConditionOfTest(): void {
  describe('PersistedConditionOfTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0001
     * @tc.name      FormExtAbility_PersistedConditionOf_0001
     * @tc.desc      persistedConditionOf(fileContent="?u0000") returns "?u0000?u0000?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_PersistedConditionOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0001 begin`);
      const actual: string = persistedConditionOf('\u0000');
      logInfo(`persistedConditionOf(fileContent="?u0000"): actual=${actual}`);
      expect(actual).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0002
     * @tc.name      FormExtAbility_PersistedConditionOf_0002
     * @tc.desc      persistedConditionOf(fileContent="?u0000x") returns "?u0000x?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_PersistedConditionOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0002 begin`);
      const actual: string = persistedConditionOf('\u0000x');
      logInfo(`persistedConditionOf(fileContent="?u0000x"): actual=${actual}`);
      expect(actual).assertEqual('\u0000x\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0003
     * @tc.name      FormExtAbility_PersistedConditionOf_0003
     * @tc.desc      persistedConditionOf(fileContent="/data/storage/el2/base/files/test.txt") returns "/data/"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0003 begin`);
      const actual: string = persistedConditionOf('/data/storage/el2/base/files/test.txt');
      logInfo(`persistedConditionOf(fileContent="/data/s...: actual=${actual}`);
      expect(actual).assertEqual('/data/');
      logInfo(`${BUNDLE}PersistedConditionOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0004
     * @tc.name      FormExtAbility_PersistedConditionOf_0004
     * @tc.desc      persistedConditionOf(fileContent="test.mp3") returns "test.m"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0004 begin`);
      const actual: string = persistedConditionOf('test.mp3');
      logInfo(`persistedConditionOf(fileContent="test.mp3"): actual=${actual}`);
      expect(actual).assertEqual('test.m');
      logInfo(`${BUNDLE}PersistedConditionOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0005
     * @tc.name      FormExtAbility_PersistedConditionOf_0005
     * @tc.desc      persistedConditionOf(fileContent="photo.JPG") returns "photo."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0005 begin`);
      const actual: string = persistedConditionOf('photo.JPG');
      logInfo(`persistedConditionOf(fileContent="photo.J...: actual=${actual}`);
      expect(actual).assertEqual('photo.');
      logInfo(`${BUNDLE}PersistedConditionOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0006
     * @tc.name      FormExtAbility_PersistedConditionOf_0006
     * @tc.desc      persistedConditionOf(fileContent="archive.tar.gz") returns "archiv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0006 begin`);
      const actual: string = persistedConditionOf('archive.tar.gz');
      logInfo(`persistedConditionOf(fileContent="archive...: actual=${actual}`);
      expect(actual).assertEqual('archiv');
      logInfo(`${BUNDLE}PersistedConditionOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0007
     * @tc.name      FormExtAbility_PersistedConditionOf_0007
     * @tc.desc      persistedConditionOf(fileContent="noext") returns "noext?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0007 begin`);
      const actual: string = persistedConditionOf('noext');
      logInfo(`persistedConditionOf(fileContent="noext"): actual=${actual}`);
      expect(actual).assertEqual('noext\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0008
     * @tc.name      FormExtAbility_PersistedConditionOf_0008
     * @tc.desc      persistedConditionOf(fileContent=".hidden") returns ".hidde"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0008 begin`);
      const actual: string = persistedConditionOf('.hidden');
      logInfo(`persistedConditionOf(fileContent=".hidden"): actual=${actual}`);
      expect(actual).assertEqual('.hidde');
      logInfo(`${BUNDLE}PersistedConditionOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0009
     * @tc.name      FormExtAbility_PersistedConditionOf_0009
     * @tc.desc      persistedConditionOf(fileContent="a") returns "a?u0000?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0009 begin`);
      const actual: string = persistedConditionOf('a');
      logInfo(`persistedConditionOf(fileContent="a"): actual=${actual}`);
      expect(actual).assertEqual('a\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0010
     * @tc.name      FormExtAbility_PersistedConditionOf_0010
     * @tc.desc      persistedConditionOf(fileContent="abc") returns "abc?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0010 begin`);
      const actual: string = persistedConditionOf('abc');
      logInfo(`persistedConditionOf(fileContent="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0011
     * @tc.name      FormExtAbility_PersistedConditionOf_0011
     * @tc.desc      persistedConditionOf(fileContent="Hello World") returns "Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0011 begin`);
      const actual: string = persistedConditionOf('Hello World');
      logInfo(`persistedConditionOf(fileContent="Hello W...: actual=${actual}`);
      expect(actual).assertEqual('Hello ');
      logInfo(`${BUNDLE}PersistedConditionOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0012
     * @tc.name      FormExtAbility_PersistedConditionOf_0012
     * @tc.desc      persistedConditionOf(fileContent=" ") returns " ?u0000?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0012 begin`);
      const actual: string = persistedConditionOf(' ');
      logInfo(`persistedConditionOf(fileContent=" "): actual=${actual}`);
      expect(actual).assertEqual(' \u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0013
     * @tc.name      FormExtAbility_PersistedConditionOf_0013
     * @tc.desc      persistedConditionOf(fileContent="123") returns "123?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0013 begin`);
      const actual: string = persistedConditionOf('123');
      logInfo(`persistedConditionOf(fileContent="123"): actual=${actual}`);
      expect(actual).assertEqual('123\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0014
     * @tc.name      FormExtAbility_PersistedConditionOf_0014
     * @tc.desc      persistedConditionOf(fileContent=" ?u0000 ") returns " ?u0000 ?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0014 begin`);
      const actual: string = persistedConditionOf(' \u0000 ');
      logInfo(`persistedConditionOf(fileContent=" ?u0000 "): actual=${actual}`);
      expect(actual).assertEqual(' \u0000 \u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0015
     * @tc.name      FormExtAbility_PersistedConditionOf_0015
     * @tc.desc      persistedConditionOf(fileContent="?u0000_1") returns "?u0000_1?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0015 begin`);
      const actual: string = persistedConditionOf('\u0000_1');
      logInfo(`persistedConditionOf(fileContent="?u0000_1"): actual=${actual}`);
      expect(actual).assertEqual('\u0000_1\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0016
     * @tc.name      FormExtAbility_PersistedConditionOf_0016
     * @tc.desc      persistedConditionOf(fileContent="x?u0000") returns "x?u0000?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0016 begin`);
      const actual: string = persistedConditionOf('x\u0000');
      logInfo(`persistedConditionOf(fileContent="x?u0000"): actual=${actual}`);
      expect(actual).assertEqual('x\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0017
     * @tc.name      FormExtAbility_PersistedConditionOf_0017
     * @tc.desc      persistedConditionOf(fileContent=" ?u0000x ") returns " ?u0000x ?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0017 begin`);
      const actual: string = persistedConditionOf(' \u0000x ');
      logInfo(`persistedConditionOf(fileContent=" ?u0000...: actual=${actual}`);
      expect(actual).assertEqual(' \u0000x \u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0018
     * @tc.name      FormExtAbility_PersistedConditionOf_0018
     * @tc.desc      persistedConditionOf(fileContent="?u0000x?u0000x") returns "?u0000x?u0000x?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0018 begin`);
      const actual: string = persistedConditionOf('\u0000x\u0000x');
      logInfo(`persistedConditionOf(fileContent="?u0000x...: actual=${actual}`);
      expect(actual).assertEqual('\u0000x\u0000x\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0019
     * @tc.name      FormExtAbility_PersistedConditionOf_0019
     * @tc.desc      persistedConditionOf(fileContent="?u0000x_1") returns "?u0000x_1?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0019 begin`);
      const actual: string = persistedConditionOf('\u0000x_1');
      logInfo(`persistedConditionOf(fileContent="?u0000x...: actual=${actual}`);
      expect(actual).assertEqual('\u0000x_1\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0020
     * @tc.name      FormExtAbility_PersistedConditionOf_0020
     * @tc.desc      persistedConditionOf(fileContent="x?u0000x") returns "x?u0000x?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0020 begin`);
      const actual: string = persistedConditionOf('x\u0000x');
      logInfo(`persistedConditionOf(fileContent="x?u0000x"): actual=${actual}`);
      expect(actual).assertEqual('x\u0000x\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0021
     * @tc.name      FormExtAbility_PersistedConditionOf_0021
     * @tc.desc      persistedConditionOf(fileContent=" /data/storage/el2/base/files/test.t...) returns " /data"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0021 begin`);
      const actual: string = persistedConditionOf(' /data/storage/el2/base/files/test.txt ');
      logInfo(`persistedConditionOf(fileContent=" /data/...: actual=${actual}`);
      expect(actual).assertEqual(' /data');
      logInfo(`${BUNDLE}PersistedConditionOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0022
     * @tc.name      FormExtAbility_PersistedConditionOf_0022
     * @tc.desc      persistedConditionOf(fileContent="x/data/storage/el2/base/files/test.txt") returns "x/data"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0022 begin`);
      const actual: string = persistedConditionOf('x/data/storage/el2/base/files/test.txt');
      logInfo(`persistedConditionOf(fileContent="x/data/...: actual=${actual}`);
      expect(actual).assertEqual('x/data');
      logInfo(`${BUNDLE}PersistedConditionOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0023
     * @tc.name      FormExtAbility_PersistedConditionOf_0023
     * @tc.desc      persistedConditionOf(fileContent=" test.mp3 ") returns " test."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0023 begin`);
      const actual: string = persistedConditionOf(' test.mp3 ');
      logInfo(`persistedConditionOf(fileContent=" test.m...: actual=${actual}`);
      expect(actual).assertEqual(' test.');
      logInfo(`${BUNDLE}PersistedConditionOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0024
     * @tc.name      FormExtAbility_PersistedConditionOf_0024
     * @tc.desc      persistedConditionOf(fileContent="xtest.mp3") returns "xtest."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0024 begin`);
      const actual: string = persistedConditionOf('xtest.mp3');
      logInfo(`persistedConditionOf(fileContent="xtest.m...: actual=${actual}`);
      expect(actual).assertEqual('xtest.');
      logInfo(`${BUNDLE}PersistedConditionOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0025
     * @tc.name      FormExtAbility_PersistedConditionOf_0025
     * @tc.desc      persistedConditionOf(fileContent=" photo.JPG ") returns " photo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0025 begin`);
      const actual: string = persistedConditionOf(' photo.JPG ');
      logInfo(`persistedConditionOf(fileContent=" photo....: actual=${actual}`);
      expect(actual).assertEqual(' photo');
      logInfo(`${BUNDLE}PersistedConditionOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0026
     * @tc.name      FormExtAbility_PersistedConditionOf_0026
     * @tc.desc      persistedConditionOf(fileContent="xphoto.JPG") returns "xphoto"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0026 begin`);
      const actual: string = persistedConditionOf('xphoto.JPG');
      logInfo(`persistedConditionOf(fileContent="xphoto....: actual=${actual}`);
      expect(actual).assertEqual('xphoto');
      logInfo(`${BUNDLE}PersistedConditionOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0027
     * @tc.name      FormExtAbility_PersistedConditionOf_0027
     * @tc.desc      persistedConditionOf(fileContent=" archive.tar.gz ") returns " archi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0027 begin`);
      const actual: string = persistedConditionOf(' archive.tar.gz ');
      logInfo(`persistedConditionOf(fileContent=" archiv...: actual=${actual}`);
      expect(actual).assertEqual(' archi');
      logInfo(`${BUNDLE}PersistedConditionOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0028
     * @tc.name      FormExtAbility_PersistedConditionOf_0028
     * @tc.desc      persistedConditionOf(fileContent="xarchive.tar.gz") returns "xarchi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0028 begin`);
      const actual: string = persistedConditionOf('xarchive.tar.gz');
      logInfo(`persistedConditionOf(fileContent="xarchiv...: actual=${actual}`);
      expect(actual).assertEqual('xarchi');
      logInfo(`${BUNDLE}PersistedConditionOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0029
     * @tc.name      FormExtAbility_PersistedConditionOf_0029
     * @tc.desc      persistedConditionOf(fileContent=" noext ") returns " noext"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0029 begin`);
      const actual: string = persistedConditionOf(' noext ');
      logInfo(`persistedConditionOf(fileContent=" noext "): actual=${actual}`);
      expect(actual).assertEqual(' noext');
      logInfo(`${BUNDLE}PersistedConditionOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0030
     * @tc.name      FormExtAbility_PersistedConditionOf_0030
     * @tc.desc      persistedConditionOf(fileContent="noextnoext") returns "noextn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0030 begin`);
      const actual: string = persistedConditionOf('noextnoext');
      logInfo(`persistedConditionOf(fileContent="noextno...: actual=${actual}`);
      expect(actual).assertEqual('noextn');
      logInfo(`${BUNDLE}PersistedConditionOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0031
     * @tc.name      FormExtAbility_PersistedConditionOf_0031
     * @tc.desc      persistedConditionOf(fileContent="noext_1") returns "noext_"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0031 begin`);
      const actual: string = persistedConditionOf('noext_1');
      logInfo(`persistedConditionOf(fileContent="noext_1"): actual=${actual}`);
      expect(actual).assertEqual('noext_');
      logInfo(`${BUNDLE}PersistedConditionOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0032
     * @tc.name      FormExtAbility_PersistedConditionOf_0032
     * @tc.desc      persistedConditionOf(fileContent="xnoext") returns "xnoext"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0032 begin`);
      const actual: string = persistedConditionOf('xnoext');
      logInfo(`persistedConditionOf(fileContent="xnoext"): actual=${actual}`);
      expect(actual).assertEqual('xnoext');
      logInfo(`${BUNDLE}PersistedConditionOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0033
     * @tc.name      FormExtAbility_PersistedConditionOf_0033
     * @tc.desc      persistedConditionOf(fileContent=" .hidden ") returns " .hidd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0033 begin`);
      const actual: string = persistedConditionOf(' .hidden ');
      logInfo(`persistedConditionOf(fileContent=" .hidde...: actual=${actual}`);
      expect(actual).assertEqual(' .hidd');
      logInfo(`${BUNDLE}PersistedConditionOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0034
     * @tc.name      FormExtAbility_PersistedConditionOf_0034
     * @tc.desc      persistedConditionOf(fileContent="x.hidden") returns "x.hidd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0034 begin`);
      const actual: string = persistedConditionOf('x.hidden');
      logInfo(`persistedConditionOf(fileContent="x.hidden"): actual=${actual}`);
      expect(actual).assertEqual('x.hidd');
      logInfo(`${BUNDLE}PersistedConditionOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0035
     * @tc.name      FormExtAbility_PersistedConditionOf_0035
     * @tc.desc      persistedConditionOf(fileContent=" a ") returns " a ?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0035 begin`);
      const actual: string = persistedConditionOf(' a ');
      logInfo(`persistedConditionOf(fileContent=" a "): actual=${actual}`);
      expect(actual).assertEqual(' a \u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0036
     * @tc.name      FormExtAbility_PersistedConditionOf_0036
     * @tc.desc      persistedConditionOf(fileContent="aa") returns "aa?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0036 begin`);
      const actual: string = persistedConditionOf('aa');
      logInfo(`persistedConditionOf(fileContent="aa"): actual=${actual}`);
      expect(actual).assertEqual('aa\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0037
     * @tc.name      FormExtAbility_PersistedConditionOf_0037
     * @tc.desc      persistedConditionOf(fileContent="a_1") returns "a_1?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0037 begin`);
      const actual: string = persistedConditionOf('a_1');
      logInfo(`persistedConditionOf(fileContent="a_1"): actual=${actual}`);
      expect(actual).assertEqual('a_1\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0038
     * @tc.name      FormExtAbility_PersistedConditionOf_0038
     * @tc.desc      persistedConditionOf(fileContent="xa") returns "xa?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0038 begin`);
      const actual: string = persistedConditionOf('xa');
      logInfo(`persistedConditionOf(fileContent="xa"): actual=${actual}`);
      expect(actual).assertEqual('xa\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0039
     * @tc.name      FormExtAbility_PersistedConditionOf_0039
     * @tc.desc      persistedConditionOf(fileContent=" abc ") returns " abc ?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0039 begin`);
      const actual: string = persistedConditionOf(' abc ');
      logInfo(`persistedConditionOf(fileContent=" abc "): actual=${actual}`);
      expect(actual).assertEqual(' abc \u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0040
     * @tc.name      FormExtAbility_PersistedConditionOf_0040
     * @tc.desc      persistedConditionOf(fileContent="abcabc") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0040 begin`);
      const actual: string = persistedConditionOf('abcabc');
      logInfo(`persistedConditionOf(fileContent="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`${BUNDLE}PersistedConditionOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0041
     * @tc.name      FormExtAbility_PersistedConditionOf_0041
     * @tc.desc      persistedConditionOf(fileContent="abc_1") returns "abc_1?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0041 begin`);
      const actual: string = persistedConditionOf('abc_1');
      logInfo(`persistedConditionOf(fileContent="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('abc_1\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0042
     * @tc.name      FormExtAbility_PersistedConditionOf_0042
     * @tc.desc      persistedConditionOf(fileContent="xabc") returns "xabc?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0042 begin`);
      const actual: string = persistedConditionOf('xabc');
      logInfo(`persistedConditionOf(fileContent="xabc"): actual=${actual}`);
      expect(actual).assertEqual('xabc\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0043
     * @tc.name      FormExtAbility_PersistedConditionOf_0043
     * @tc.desc      persistedConditionOf(fileContent=" Hello World ") returns " Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0043 begin`);
      const actual: string = persistedConditionOf(' Hello World ');
      logInfo(`persistedConditionOf(fileContent=" Hello ...: actual=${actual}`);
      expect(actual).assertEqual(' Hello');
      logInfo(`${BUNDLE}PersistedConditionOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0044
     * @tc.name      FormExtAbility_PersistedConditionOf_0044
     * @tc.desc      persistedConditionOf(fileContent="xHello World") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0044 begin`);
      const actual: string = persistedConditionOf('xHello World');
      logInfo(`persistedConditionOf(fileContent="xHello ...: actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}PersistedConditionOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0045
     * @tc.name      FormExtAbility_PersistedConditionOf_0045
     * @tc.desc      persistedConditionOf(fileContent="   ") returns "   ?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0045 begin`);
      const actual: string = persistedConditionOf('   ');
      logInfo(`persistedConditionOf(fileContent="   "): actual=${actual}`);
      expect(actual).assertEqual('   \u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0046
     * @tc.name      FormExtAbility_PersistedConditionOf_0046
     * @tc.desc      persistedConditionOf(fileContent="  ") returns "  ?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0046 begin`);
      const actual: string = persistedConditionOf('  ');
      logInfo(`persistedConditionOf(fileContent="  "): actual=${actual}`);
      expect(actual).assertEqual('  \u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0047
     * @tc.name      FormExtAbility_PersistedConditionOf_0047
     * @tc.desc      persistedConditionOf(fileContent=" _1") returns " _1?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0047 begin`);
      const actual: string = persistedConditionOf(' _1');
      logInfo(`persistedConditionOf(fileContent=" _1"): actual=${actual}`);
      expect(actual).assertEqual(' _1\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0048
     * @tc.name      FormExtAbility_PersistedConditionOf_0048
     * @tc.desc      persistedConditionOf(fileContent="x ") returns "x ?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0048 begin`);
      const actual: string = persistedConditionOf('x ');
      logInfo(`persistedConditionOf(fileContent="x "): actual=${actual}`);
      expect(actual).assertEqual('x \u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0049
     * @tc.name      FormExtAbility_PersistedConditionOf_0049
     * @tc.desc      persistedConditionOf(fileContent="ISzj8aaw0c") returns "ISzj8a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0049 begin`);
      const actual: string = persistedConditionOf('ISzj8aaw0c');
      logInfo(`persistedConditionOf(fileContent="ISzj8aa...: actual=${actual}`);
      expect(actual).assertEqual('ISzj8a');
      logInfo(`${BUNDLE}PersistedConditionOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0050
     * @tc.name      FormExtAbility_PersistedConditionOf_0050
     * @tc.desc      persistedConditionOf(fileContent="IyCqrhM4uy") returns "IyCqrh"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0050 begin`);
      const actual: string = persistedConditionOf('IyCqrhM4uy');
      logInfo(`persistedConditionOf(fileContent="IyCqrhM...: actual=${actual}`);
      expect(actual).assertEqual('IyCqrh');
      logInfo(`${BUNDLE}PersistedConditionOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0051
     * @tc.name      FormExtAbility_PersistedConditionOf_0051
     * @tc.desc      persistedConditionOf(fileContent="Hv9Hwttaf") returns "Hv9Hwt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0051 begin`);
      const actual: string = persistedConditionOf('Hv9Hwttaf');
      logInfo(`persistedConditionOf(fileContent="Hv9Hwtt...: actual=${actual}`);
      expect(actual).assertEqual('Hv9Hwt');
      logInfo(`${BUNDLE}PersistedConditionOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0052
     * @tc.name      FormExtAbility_PersistedConditionOf_0052
     * @tc.desc      persistedConditionOf(fileContent="P") returns "P?u0000?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0052 begin`);
      const actual: string = persistedConditionOf('P');
      logInfo(`persistedConditionOf(fileContent="P"): actual=${actual}`);
      expect(actual).assertEqual('P\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0053
     * @tc.name      FormExtAbility_PersistedConditionOf_0053
     * @tc.desc      persistedConditionOf(fileContent="OmUKlA7G8") returns "OmUKlA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0053 begin`);
      const actual: string = persistedConditionOf('OmUKlA7G8');
      logInfo(`persistedConditionOf(fileContent="OmUKlA7...: actual=${actual}`);
      expect(actual).assertEqual('OmUKlA');
      logInfo(`${BUNDLE}PersistedConditionOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0054
     * @tc.name      FormExtAbility_PersistedConditionOf_0054
     * @tc.desc      persistedConditionOf(fileContent="q2tzQ5") returns "q2tzQ5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0054 begin`);
      const actual: string = persistedConditionOf('q2tzQ5');
      logInfo(`persistedConditionOf(fileContent="q2tzQ5"): actual=${actual}`);
      expect(actual).assertEqual('q2tzQ5');
      logInfo(`${BUNDLE}PersistedConditionOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0055
     * @tc.name      FormExtAbility_PersistedConditionOf_0055
     * @tc.desc      persistedConditionOf(fileContent="7KcgjIu") returns "7KcgjI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0055 begin`);
      const actual: string = persistedConditionOf('7KcgjIu');
      logInfo(`persistedConditionOf(fileContent="7KcgjIu"): actual=${actual}`);
      expect(actual).assertEqual('7KcgjI');
      logInfo(`${BUNDLE}PersistedConditionOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0056
     * @tc.name      FormExtAbility_PersistedConditionOf_0056
     * @tc.desc      persistedConditionOf(fileContent="TbTNGf88") returns "TbTNGf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0056 begin`);
      const actual: string = persistedConditionOf('TbTNGf88');
      logInfo(`persistedConditionOf(fileContent="TbTNGf88"): actual=${actual}`);
      expect(actual).assertEqual('TbTNGf');
      logInfo(`${BUNDLE}PersistedConditionOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0057
     * @tc.name      FormExtAbility_PersistedConditionOf_0057
     * @tc.desc      persistedConditionOf(fileContent="yHNaojFNc") returns "yHNaoj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0057 begin`);
      const actual: string = persistedConditionOf('yHNaojFNc');
      logInfo(`persistedConditionOf(fileContent="yHNaojF...: actual=${actual}`);
      expect(actual).assertEqual('yHNaoj');
      logInfo(`${BUNDLE}PersistedConditionOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0058
     * @tc.name      FormExtAbility_PersistedConditionOf_0058
     * @tc.desc      persistedConditionOf(fileContent="y6M") returns "y6M?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0058 begin`);
      const actual: string = persistedConditionOf('y6M');
      logInfo(`persistedConditionOf(fileContent="y6M"): actual=${actual}`);
      expect(actual).assertEqual('y6M\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0059
     * @tc.name      FormExtAbility_PersistedConditionOf_0059
     * @tc.desc      persistedConditionOf(fileContent="mj1x") returns "mj1x?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0059 begin`);
      const actual: string = persistedConditionOf('mj1x');
      logInfo(`persistedConditionOf(fileContent="mj1x"): actual=${actual}`);
      expect(actual).assertEqual('mj1x\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0060
     * @tc.name      FormExtAbility_PersistedConditionOf_0060
     * @tc.desc      persistedConditionOf(fileContent="zQCJX0C615d") returns "zQCJX0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0060 begin`);
      const actual: string = persistedConditionOf('zQCJX0C615d');
      logInfo(`persistedConditionOf(fileContent="zQCJX0C...: actual=${actual}`);
      expect(actual).assertEqual('zQCJX0');
      logInfo(`${BUNDLE}PersistedConditionOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0061
     * @tc.name      FormExtAbility_PersistedConditionOf_0061
     * @tc.desc      persistedConditionOf(fileContent="4SCEm0VUmEh") returns "4SCEm0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0061 begin`);
      const actual: string = persistedConditionOf('4SCEm0VUmEh');
      logInfo(`persistedConditionOf(fileContent="4SCEm0V...: actual=${actual}`);
      expect(actual).assertEqual('4SCEm0');
      logInfo(`${BUNDLE}PersistedConditionOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0062
     * @tc.name      FormExtAbility_PersistedConditionOf_0062
     * @tc.desc      persistedConditionOf(fileContent="JHOWiFw2") returns "JHOWiF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0062 begin`);
      const actual: string = persistedConditionOf('JHOWiFw2');
      logInfo(`persistedConditionOf(fileContent="JHOWiFw2"): actual=${actual}`);
      expect(actual).assertEqual('JHOWiF');
      logInfo(`${BUNDLE}PersistedConditionOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0063
     * @tc.name      FormExtAbility_PersistedConditionOf_0063
     * @tc.desc      persistedConditionOf(fileContent="rfWDpTBJ8") returns "rfWDpT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0063 begin`);
      const actual: string = persistedConditionOf('rfWDpTBJ8');
      logInfo(`persistedConditionOf(fileContent="rfWDpTB...: actual=${actual}`);
      expect(actual).assertEqual('rfWDpT');
      logInfo(`${BUNDLE}PersistedConditionOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0064
     * @tc.name      FormExtAbility_PersistedConditionOf_0064
     * @tc.desc      persistedConditionOf(fileContent="wTF") returns "wTF?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0064 begin`);
      const actual: string = persistedConditionOf('wTF');
      logInfo(`persistedConditionOf(fileContent="wTF"): actual=${actual}`);
      expect(actual).assertEqual('wTF\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0065
     * @tc.name      FormExtAbility_PersistedConditionOf_0065
     * @tc.desc      persistedConditionOf(fileContent="e") returns "e?u0000?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0065 begin`);
      const actual: string = persistedConditionOf('e');
      logInfo(`persistedConditionOf(fileContent="e"): actual=${actual}`);
      expect(actual).assertEqual('e\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0066
     * @tc.name      FormExtAbility_PersistedConditionOf_0066
     * @tc.desc      persistedConditionOf(fileContent="4") returns "4?u0000?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0066 begin`);
      const actual: string = persistedConditionOf('4');
      logInfo(`persistedConditionOf(fileContent="4"): actual=${actual}`);
      expect(actual).assertEqual('4\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0067
     * @tc.name      FormExtAbility_PersistedConditionOf_0067
     * @tc.desc      persistedConditionOf(fileContent="Ma") returns "Ma?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0067 begin`);
      const actual: string = persistedConditionOf('Ma');
      logInfo(`persistedConditionOf(fileContent="Ma"): actual=${actual}`);
      expect(actual).assertEqual('Ma\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0068
     * @tc.name      FormExtAbility_PersistedConditionOf_0068
     * @tc.desc      persistedConditionOf(fileContent="JTab3AW5") returns "JTab3A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0068 begin`);
      const actual: string = persistedConditionOf('JTab3AW5');
      logInfo(`persistedConditionOf(fileContent="JTab3AW5"): actual=${actual}`);
      expect(actual).assertEqual('JTab3A');
      logInfo(`${BUNDLE}PersistedConditionOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0069
     * @tc.name      FormExtAbility_PersistedConditionOf_0069
     * @tc.desc      persistedConditionOf(fileContent="mjjbP") returns "mjjbP?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0069 begin`);
      const actual: string = persistedConditionOf('mjjbP');
      logInfo(`persistedConditionOf(fileContent="mjjbP"): actual=${actual}`);
      expect(actual).assertEqual('mjjbP\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0070
     * @tc.name      FormExtAbility_PersistedConditionOf_0070
     * @tc.desc      persistedConditionOf(fileContent="Iwpp3ESHtu") returns "Iwpp3E"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0070 begin`);
      const actual: string = persistedConditionOf('Iwpp3ESHtu');
      logInfo(`persistedConditionOf(fileContent="Iwpp3ES...: actual=${actual}`);
      expect(actual).assertEqual('Iwpp3E');
      logInfo(`${BUNDLE}PersistedConditionOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0071
     * @tc.name      FormExtAbility_PersistedConditionOf_0071
     * @tc.desc      persistedConditionOf(fileContent="X3fQoI") returns "X3fQoI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0071 begin`);
      const actual: string = persistedConditionOf('X3fQoI');
      logInfo(`persistedConditionOf(fileContent="X3fQoI"): actual=${actual}`);
      expect(actual).assertEqual('X3fQoI');
      logInfo(`${BUNDLE}PersistedConditionOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0072
     * @tc.name      FormExtAbility_PersistedConditionOf_0072
     * @tc.desc      persistedConditionOf(fileContent="7spKxj0rqI") returns "7spKxj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0072 begin`);
      const actual: string = persistedConditionOf('7spKxj0rqI');
      logInfo(`persistedConditionOf(fileContent="7spKxj0...: actual=${actual}`);
      expect(actual).assertEqual('7spKxj');
      logInfo(`${BUNDLE}PersistedConditionOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0073
     * @tc.name      FormExtAbility_PersistedConditionOf_0073
     * @tc.desc      persistedConditionOf(fileContent="IBQtZ") returns "IBQtZ?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0073 begin`);
      const actual: string = persistedConditionOf('IBQtZ');
      logInfo(`persistedConditionOf(fileContent="IBQtZ"): actual=${actual}`);
      expect(actual).assertEqual('IBQtZ\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0074
     * @tc.name      FormExtAbility_PersistedConditionOf_0074
     * @tc.desc      persistedConditionOf(fileContent="spB28Y") returns "spB28Y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0074 begin`);
      const actual: string = persistedConditionOf('spB28Y');
      logInfo(`persistedConditionOf(fileContent="spB28Y"): actual=${actual}`);
      expect(actual).assertEqual('spB28Y');
      logInfo(`${BUNDLE}PersistedConditionOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0075
     * @tc.name      FormExtAbility_PersistedConditionOf_0075
     * @tc.desc      persistedConditionOf(fileContent="hAuz") returns "hAuz?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0075 begin`);
      const actual: string = persistedConditionOf('hAuz');
      logInfo(`persistedConditionOf(fileContent="hAuz"): actual=${actual}`);
      expect(actual).assertEqual('hAuz\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0076
     * @tc.name      FormExtAbility_PersistedConditionOf_0076
     * @tc.desc      persistedConditionOf(fileContent="pKjSjBgNjB") returns "pKjSjB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0076 begin`);
      const actual: string = persistedConditionOf('pKjSjBgNjB');
      logInfo(`persistedConditionOf(fileContent="pKjSjBg...: actual=${actual}`);
      expect(actual).assertEqual('pKjSjB');
      logInfo(`${BUNDLE}PersistedConditionOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0077
     * @tc.name      FormExtAbility_PersistedConditionOf_0077
     * @tc.desc      persistedConditionOf(fileContent="/data/storage/el2/base/haps/entry/fi...) returns "/data/"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0077 begin`);
      const actual: string = persistedConditionOf('/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`persistedConditionOf(fileContent="/data/s...: actual=${actual}`);
      expect(actual).assertEqual('/data/');
      logInfo(`${BUNDLE}PersistedConditionOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0078
     * @tc.name      FormExtAbility_PersistedConditionOf_0078
     * @tc.desc      persistedConditionOf(fileContent="") returns "?u0000?u0000?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistedConditionOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0078 begin`);
      const actual: string = persistedConditionOf('');
      logInfo(`persistedConditionOf(fileContent=""): actual=${actual}`);
      expect(actual).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0079
     * @tc.name      FormExtAbility_PersistedConditionOf_0079
     * @tc.desc      persistedConditionOf(fileContent="?u0000?u0000") returns "?u0000?u0000?u0000?u0000?u0000?u0000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0079 begin`);
      const actual: string = persistedConditionOf('\u0000\u0000');
      logInfo(`persistedConditionOf(fileContent="?u0000?...: actual=${actual}`);
      expect(actual).assertEqual('\u0000\u0000\u0000\u0000\u0000\u0000');
      logInfo(`${BUNDLE}PersistedConditionOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0080
     * @tc.name      FormExtAbility_PersistedConditionOf_0080
     * @tc.desc      persistedConditionOf(fileContent="/data/storage/el2/base/files/test.tx...) returns "/data/"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0080 begin`);
      const actual: string = persistedConditionOf('/data/storage/el2/base/files/test.txt_1');
      logInfo(`persistedConditionOf(fileContent="/data/s...: actual=${actual}`);
      expect(actual).assertEqual('/data/');
      logInfo(`${BUNDLE}PersistedConditionOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0081
     * @tc.name      FormExtAbility_PersistedConditionOf_0081
     * @tc.desc      persistedConditionOf(fileContent="test.mp3test.mp3") returns "test.m"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0081 begin`);
      const actual: string = persistedConditionOf('test.mp3test.mp3');
      logInfo(`persistedConditionOf(fileContent="test.mp...: actual=${actual}`);
      expect(actual).assertEqual('test.m');
      logInfo(`${BUNDLE}PersistedConditionOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0082
     * @tc.name      FormExtAbility_PersistedConditionOf_0082
     * @tc.desc      persistedConditionOf(fileContent="test.mp3_1") returns "test.m"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0082 begin`);
      const actual: string = persistedConditionOf('test.mp3_1');
      logInfo(`persistedConditionOf(fileContent="test.mp...: actual=${actual}`);
      expect(actual).assertEqual('test.m');
      logInfo(`${BUNDLE}PersistedConditionOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0083
     * @tc.name      FormExtAbility_PersistedConditionOf_0083
     * @tc.desc      persistedConditionOf(fileContent="photo.JPGphoto.JPG") returns "photo."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0083 begin`);
      const actual: string = persistedConditionOf('photo.JPGphoto.JPG');
      logInfo(`persistedConditionOf(fileContent="photo.J...: actual=${actual}`);
      expect(actual).assertEqual('photo.');
      logInfo(`${BUNDLE}PersistedConditionOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0084
     * @tc.name      FormExtAbility_PersistedConditionOf_0084
     * @tc.desc      persistedConditionOf(fileContent="photo.JPG_1") returns "photo."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0084 begin`);
      const actual: string = persistedConditionOf('photo.JPG_1');
      logInfo(`persistedConditionOf(fileContent="photo.J...: actual=${actual}`);
      expect(actual).assertEqual('photo.');
      logInfo(`${BUNDLE}PersistedConditionOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0085
     * @tc.name      FormExtAbility_PersistedConditionOf_0085
     * @tc.desc      persistedConditionOf(fileContent="archive.tar.gzarchive.tar.gz") returns "archiv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0085 begin`);
      const actual: string = persistedConditionOf('archive.tar.gzarchive.tar.gz');
      logInfo(`persistedConditionOf(fileContent="archive...: actual=${actual}`);
      expect(actual).assertEqual('archiv');
      logInfo(`${BUNDLE}PersistedConditionOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0086
     * @tc.name      FormExtAbility_PersistedConditionOf_0086
     * @tc.desc      persistedConditionOf(fileContent="archive.tar.gz_1") returns "archiv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0086 begin`);
      const actual: string = persistedConditionOf('archive.tar.gz_1');
      logInfo(`persistedConditionOf(fileContent="archive...: actual=${actual}`);
      expect(actual).assertEqual('archiv');
      logInfo(`${BUNDLE}PersistedConditionOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0087
     * @tc.name      FormExtAbility_PersistedConditionOf_0087
     * @tc.desc      persistedConditionOf(fileContent=".hidden.hidden") returns ".hidde"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0087 begin`);
      const actual: string = persistedConditionOf('.hidden.hidden');
      logInfo(`persistedConditionOf(fileContent=".hidden...: actual=${actual}`);
      expect(actual).assertEqual('.hidde');
      logInfo(`${BUNDLE}PersistedConditionOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0088
     * @tc.name      FormExtAbility_PersistedConditionOf_0088
     * @tc.desc      persistedConditionOf(fileContent=".hidden_1") returns ".hidde"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0088 begin`);
      const actual: string = persistedConditionOf('.hidden_1');
      logInfo(`persistedConditionOf(fileContent=".hidden...: actual=${actual}`);
      expect(actual).assertEqual('.hidde');
      logInfo(`${BUNDLE}PersistedConditionOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0089
     * @tc.name      FormExtAbility_PersistedConditionOf_0089
     * @tc.desc      persistedConditionOf(fileContent="Hello WorldHello World") returns "Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0089 begin`);
      const actual: string = persistedConditionOf('Hello WorldHello World');
      logInfo(`persistedConditionOf(fileContent="Hello W...: actual=${actual}`);
      expect(actual).assertEqual('Hello ');
      logInfo(`${BUNDLE}PersistedConditionOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTED_CONDITION_OF_0090
     * @tc.name      FormExtAbility_PersistedConditionOf_0090
     * @tc.desc      persistedConditionOf(fileContent="Hello World_1") returns "Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistedConditionOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistedConditionOf_0090 begin`);
      const actual: string = persistedConditionOf('Hello World_1');
      logInfo(`persistedConditionOf(fileContent="Hello W...: actual=${actual}`);
      expect(actual).assertEqual('Hello ');
      logInfo(`${BUNDLE}PersistedConditionOf_0090 end`);
    });
  });
}
