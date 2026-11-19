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
import {
  BASE_TEMP_MOD, CONDITION_DATA_SIZE, DATA_STORAGE_PATH, DEFAULT_SUBSCRIBER_ID, FORM_PARAM_IDENTITY_KEY,
  FORM_PARAM_NAME_KEY, FORM_PARAM_TEMPORARY_KEY, PERSISTENT_FILE_NAME, PROXY_URI, RANGE_TEMP_MOD
} from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for FormExtLogic (10 cases). */
export default function formExtLogicConstantsTest(): void {
  describe('FormExtLogicConstantsTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_EXT_LOGIC_CONSTANTS_0001
     * @tc.name      FormExtAbility_FormExtLogicConstants_0001
     * @tc.desc      DATA_STORAGE_PATH keeps value "/data/storage/el2/base/haps/form_store"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormExtLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormExtLogicConstants_0001 begin`);
      const actual: string = DATA_STORAGE_PATH;
      logInfo(`DATA_STORAGE_PATH: actual=${actual}`);
      expect(actual).assertEqual('/data/storage/el2/base/haps/form_store');
      logInfo(`${BUNDLE}FormExtLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_EXT_LOGIC_CONSTANTS_0002
     * @tc.name      FormExtAbility_FormExtLogicConstants_0002
     * @tc.desc      FORM_PARAM_IDENTITY_KEY keeps value "ohos.extra.param.key.form_identity"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormExtLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormExtLogicConstants_0002 begin`);
      const actual: string = FORM_PARAM_IDENTITY_KEY;
      logInfo(`FORM_PARAM_IDENTITY_KEY: actual=${actual}`);
      expect(actual).assertEqual('ohos.extra.param.key.form_identity');
      logInfo(`${BUNDLE}FormExtLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_EXT_LOGIC_CONSTANTS_0003
     * @tc.name      FormExtAbility_FormExtLogicConstants_0003
     * @tc.desc      FORM_PARAM_NAME_KEY keeps value "ohos.extra.param.key.form_name"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormExtLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormExtLogicConstants_0003 begin`);
      const actual: string = FORM_PARAM_NAME_KEY;
      logInfo(`FORM_PARAM_NAME_KEY: actual=${actual}`);
      expect(actual).assertEqual('ohos.extra.param.key.form_name');
      logInfo(`${BUNDLE}FormExtLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_EXT_LOGIC_CONSTANTS_0004
     * @tc.name      FormExtAbility_FormExtLogicConstants_0004
     * @tc.desc      FORM_PARAM_TEMPORARY_KEY keeps value "ohos.extra.param.key.form_temporary"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormExtLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormExtLogicConstants_0004 begin`);
      const actual: string = FORM_PARAM_TEMPORARY_KEY;
      logInfo(`FORM_PARAM_TEMPORARY_KEY: actual=${actual}`);
      expect(actual).assertEqual('ohos.extra.param.key.form_temporary');
      logInfo(`${BUNDLE}FormExtLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_EXT_LOGIC_CONSTANTS_0005
     * @tc.name      FormExtAbility_FormExtLogicConstants_0005
     * @tc.desc      BASE_TEMP_MOD keeps value 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormExtLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormExtLogicConstants_0005 begin`);
      const actual: number = BASE_TEMP_MOD;
      logInfo(`BASE_TEMP_MOD: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}FormExtLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_EXT_LOGIC_CONSTANTS_0006
     * @tc.name      FormExtAbility_FormExtLogicConstants_0006
     * @tc.desc      DEFAULT_SUBSCRIBER_ID keeps value "110000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormExtLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormExtLogicConstants_0006 begin`);
      const actual: string = DEFAULT_SUBSCRIBER_ID;
      logInfo(`DEFAULT_SUBSCRIBER_ID: actual=${actual}`);
      expect(actual).assertEqual('110000');
      logInfo(`${BUNDLE}FormExtLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_EXT_LOGIC_CONSTANTS_0007
     * @tc.name      FormExtAbility_FormExtLogicConstants_0007
     * @tc.desc      PROXY_URI keeps value "datashareproxy://ohos.samples.formextability/test"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormExtLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormExtLogicConstants_0007 begin`);
      const actual: string = PROXY_URI;
      logInfo(`PROXY_URI: actual=${actual}`);
      expect(actual).assertEqual('datashareproxy://ohos.samples.formextability/test');
      logInfo(`${BUNDLE}FormExtLogicConstants_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_EXT_LOGIC_CONSTANTS_0008
     * @tc.name      FormExtAbility_FormExtLogicConstants_0008
     * @tc.desc      PERSISTENT_FILE_NAME keeps value "/Persistent.txt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormExtLogicConstants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormExtLogicConstants_0008 begin`);
      const actual: string = PERSISTENT_FILE_NAME;
      logInfo(`PERSISTENT_FILE_NAME: actual=${actual}`);
      expect(actual).assertEqual('/Persistent.txt');
      logInfo(`${BUNDLE}FormExtLogicConstants_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_EXT_LOGIC_CONSTANTS_0009
     * @tc.name      FormExtAbility_FormExtLogicConstants_0009
     * @tc.desc      CONDITION_DATA_SIZE keeps value 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormExtLogicConstants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormExtLogicConstants_0009 begin`);
      const actual: number = CONDITION_DATA_SIZE;
      logInfo(`CONDITION_DATA_SIZE: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FormExtLogicConstants_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_EXT_LOGIC_CONSTANTS_0010
     * @tc.name      FormExtAbility_FormExtLogicConstants_0010
     * @tc.desc      RANGE_TEMP_MOD keeps value 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormExtLogicConstants_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormExtLogicConstants_0010 begin`);
      const actual: number = RANGE_TEMP_MOD;
      logInfo(`RANGE_TEMP_MOD: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}FormExtLogicConstants_0010 end`);
    });
  });
}
