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
import { isValidConditionRequest } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isValidConditionRequest (48 cases). */
export default function isValidConditionRequestTest(): void {
  describe('IsValidConditionRequestTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0001
     * @tc.name      FormExtAbility_IsValidConditionRequest_0001
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_IsValidConditionRequest_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0001 begin`);
      const actual: boolean = isValidConditionRequest(true, '');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0002
     * @tc.name      FormExtAbility_IsValidConditionRequest_0002
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="x") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_IsValidConditionRequest_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0002 begin`);
      const actual: boolean = isValidConditionRequest(true, 'x');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0003
     * @tc.name      FormExtAbility_IsValidConditionRequest_0003
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="/data/storage/el2/base/files/test.txt") retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0003 begin`);
      const actual: boolean = isValidConditionRequest(true, '/data/storage/el2/base/files/test.txt');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0004
     * @tc.name      FormExtAbility_IsValidConditionRequest_0004
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="/data/storage/el2/base/haps/entry/fi...) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0004 begin`);
      const actual: boolean = isValidConditionRequest(true, '/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0005
     * @tc.name      FormExtAbility_IsValidConditionRequest_0005
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="test.mp3") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0005 begin`);
      const actual: boolean = isValidConditionRequest(true, 'test.mp3');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0006
     * @tc.name      FormExtAbility_IsValidConditionRequest_0006
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="photo.JPG") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0006 begin`);
      const actual: boolean = isValidConditionRequest(true, 'photo.JPG');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0007
     * @tc.name      FormExtAbility_IsValidConditionRequest_0007
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="archive.tar.gz") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0007 begin`);
      const actual: boolean = isValidConditionRequest(true, 'archive.tar.gz');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0008
     * @tc.name      FormExtAbility_IsValidConditionRequest_0008
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="noext") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0008 begin`);
      const actual: boolean = isValidConditionRequest(true, 'noext');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0009
     * @tc.name      FormExtAbility_IsValidConditionRequest_0009
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName=".hidden") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0009 begin`);
      const actual: boolean = isValidConditionRequest(true, '.hidden');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0010
     * @tc.name      FormExtAbility_IsValidConditionRequest_0010
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="a") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0010 begin`);
      const actual: boolean = isValidConditionRequest(true, 'a');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0011
     * @tc.name      FormExtAbility_IsValidConditionRequest_0011
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="abc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0011 begin`);
      const actual: boolean = isValidConditionRequest(true, 'abc');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0012
     * @tc.name      FormExtAbility_IsValidConditionRequest_0012
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="Hello World") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0012 begin`);
      const actual: boolean = isValidConditionRequest(true, 'Hello World');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0013
     * @tc.name      FormExtAbility_IsValidConditionRequest_0013
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName=" ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0013 begin`);
      const actual: boolean = isValidConditionRequest(true, ' ');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0014
     * @tc.name      FormExtAbility_IsValidConditionRequest_0014
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0014 begin`);
      const actual: boolean = isValidConditionRequest(true, '123');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0015
     * @tc.name      FormExtAbility_IsValidConditionRequest_0015
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName=" x ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_IsValidConditionRequest_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0015 begin`);
      const actual: boolean = isValidConditionRequest(true, ' x ');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0016
     * @tc.name      FormExtAbility_IsValidConditionRequest_0016
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="xx") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0016 begin`);
      const actual: boolean = isValidConditionRequest(true, 'xx');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0017
     * @tc.name      FormExtAbility_IsValidConditionRequest_0017
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="x_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0017 begin`);
      const actual: boolean = isValidConditionRequest(true, 'x_1');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0018
     * @tc.name      FormExtAbility_IsValidConditionRequest_0018
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName=" /data/storage/el2/base/files/test.t...) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_IsValidConditionRequest_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0018 begin`);
      const actual: boolean = isValidConditionRequest(true, ' /data/storage/el2/base/files/test.txt ');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0019
     * @tc.name      FormExtAbility_IsValidConditionRequest_0019
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="/data/storage/el2/base/files/test.tx...) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0019 begin`);
      const actual: boolean = isValidConditionRequest(true, '/data/storage/el2/base/files/test.txt_1');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0020
     * @tc.name      FormExtAbility_IsValidConditionRequest_0020
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="x/data/storage/el2/base/files/test.txt") retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_IsValidConditionRequest_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0020 begin`);
      const actual: boolean = isValidConditionRequest(true, 'x/data/storage/el2/base/files/test.txt');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0021
     * @tc.name      FormExtAbility_IsValidConditionRequest_0021
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName=" test.mp3 ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_IsValidConditionRequest_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0021 begin`);
      const actual: boolean = isValidConditionRequest(true, ' test.mp3 ');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0022
     * @tc.name      FormExtAbility_IsValidConditionRequest_0022
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="test.mp3test.mp3") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0022 begin`);
      const actual: boolean = isValidConditionRequest(true, 'test.mp3test.mp3');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0023
     * @tc.name      FormExtAbility_IsValidConditionRequest_0023
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="test.mp3_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0023 begin`);
      const actual: boolean = isValidConditionRequest(true, 'test.mp3_1');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0024
     * @tc.name      FormExtAbility_IsValidConditionRequest_0024
     * @tc.desc      isValidConditionRequest(hasContext=true, fileName="xtest.mp3") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_IsValidConditionRequest_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0024 begin`);
      const actual: boolean = isValidConditionRequest(true, 'xtest.mp3');
      logInfo(`isValidConditionRequest(hasContext=true, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidConditionRequest_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0025
     * @tc.name      FormExtAbility_IsValidConditionRequest_0025
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_IsValidConditionRequest_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0025 begin`);
      const actual: boolean = isValidConditionRequest(false, '');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0026
     * @tc.name      FormExtAbility_IsValidConditionRequest_0026
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="x") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_IsValidConditionRequest_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0026 begin`);
      const actual: boolean = isValidConditionRequest(false, 'x');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0027
     * @tc.name      FormExtAbility_IsValidConditionRequest_0027
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="/data/storage/el2/base/files/test.txt") retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0027 begin`);
      const actual: boolean = isValidConditionRequest(false, '/data/storage/el2/base/files/test.txt');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0028
     * @tc.name      FormExtAbility_IsValidConditionRequest_0028
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="/data/storage/el2/base/haps/entry/fi...) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0028 begin`);
      const actual: boolean = isValidConditionRequest(false, '/data/storage/el2/base/haps/entry/files/a.mp4');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0029
     * @tc.name      FormExtAbility_IsValidConditionRequest_0029
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="test.mp3") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0029 begin`);
      const actual: boolean = isValidConditionRequest(false, 'test.mp3');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0030
     * @tc.name      FormExtAbility_IsValidConditionRequest_0030
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="photo.JPG") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0030 begin`);
      const actual: boolean = isValidConditionRequest(false, 'photo.JPG');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0031
     * @tc.name      FormExtAbility_IsValidConditionRequest_0031
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="archive.tar.gz") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0031 begin`);
      const actual: boolean = isValidConditionRequest(false, 'archive.tar.gz');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0032
     * @tc.name      FormExtAbility_IsValidConditionRequest_0032
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="noext") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0032 begin`);
      const actual: boolean = isValidConditionRequest(false, 'noext');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0033
     * @tc.name      FormExtAbility_IsValidConditionRequest_0033
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName=".hidden") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0033 begin`);
      const actual: boolean = isValidConditionRequest(false, '.hidden');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0034
     * @tc.name      FormExtAbility_IsValidConditionRequest_0034
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0034 begin`);
      const actual: boolean = isValidConditionRequest(false, 'a');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0035
     * @tc.name      FormExtAbility_IsValidConditionRequest_0035
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0035 begin`);
      const actual: boolean = isValidConditionRequest(false, 'abc');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0036
     * @tc.name      FormExtAbility_IsValidConditionRequest_0036
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0036 begin`);
      const actual: boolean = isValidConditionRequest(false, 'Hello World');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0037
     * @tc.name      FormExtAbility_IsValidConditionRequest_0037
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0037 begin`);
      const actual: boolean = isValidConditionRequest(false, ' ');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0038
     * @tc.name      FormExtAbility_IsValidConditionRequest_0038
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0038 begin`);
      const actual: boolean = isValidConditionRequest(false, '123');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0039
     * @tc.name      FormExtAbility_IsValidConditionRequest_0039
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName=" x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_IsValidConditionRequest_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0039 begin`);
      const actual: boolean = isValidConditionRequest(false, ' x ');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0040
     * @tc.name      FormExtAbility_IsValidConditionRequest_0040
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="xx") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0040 begin`);
      const actual: boolean = isValidConditionRequest(false, 'xx');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0041
     * @tc.name      FormExtAbility_IsValidConditionRequest_0041
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="x_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0041 begin`);
      const actual: boolean = isValidConditionRequest(false, 'x_1');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0042
     * @tc.name      FormExtAbility_IsValidConditionRequest_0042
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName=" /data/storage/el2/base/files/test.t...) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_IsValidConditionRequest_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0042 begin`);
      const actual: boolean = isValidConditionRequest(false, ' /data/storage/el2/base/files/test.txt ');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0043
     * @tc.name      FormExtAbility_IsValidConditionRequest_0043
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="/data/storage/el2/base/files/test.tx...) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0043 begin`);
      const actual: boolean = isValidConditionRequest(false, '/data/storage/el2/base/files/test.txt_1');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0044
     * @tc.name      FormExtAbility_IsValidConditionRequest_0044
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="x/data/storage/el2/base/files/test.txt") ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_IsValidConditionRequest_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0044 begin`);
      const actual: boolean = isValidConditionRequest(false, 'x/data/storage/el2/base/files/test.txt');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0045
     * @tc.name      FormExtAbility_IsValidConditionRequest_0045
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName=" test.mp3 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_IsValidConditionRequest_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0045 begin`);
      const actual: boolean = isValidConditionRequest(false, ' test.mp3 ');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0046
     * @tc.name      FormExtAbility_IsValidConditionRequest_0046
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="test.mp3test.mp3") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0046 begin`);
      const actual: boolean = isValidConditionRequest(false, 'test.mp3test.mp3');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0047
     * @tc.name      FormExtAbility_IsValidConditionRequest_0047
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="test.mp3_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_IsValidConditionRequest_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0047 begin`);
      const actual: boolean = isValidConditionRequest(false, 'test.mp3_1');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_IS_VALID_CONDITION_REQUEST_0048
     * @tc.name      FormExtAbility_IsValidConditionRequest_0048
     * @tc.desc      isValidConditionRequest(hasContext=false, fileName="xtest.mp3") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_IsValidConditionRequest_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidConditionRequest_0048 begin`);
      const actual: boolean = isValidConditionRequest(false, 'xtest.mp3');
      logInfo(`isValidConditionRequest(hasContext=false,...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidConditionRequest_0048 end`);
    });
  });
}
