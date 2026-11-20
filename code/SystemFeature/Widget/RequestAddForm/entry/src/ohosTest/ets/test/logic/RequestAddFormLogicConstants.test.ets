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
  ABILITY_NAME, ARKTS_FORM_NAME, CONDITION_ID, DEFAULT_DIMENSION, DESIGN_WIDTH, DIMENSION_KEY, FORM_NAME_KEY,
  JS_FORM_NAME, MODULE_NAME, MODULE_NAME_KEY, PROXY_KEY, SCHEDULED_UPDATE_TIME, SUPPORT_DIMENSIONS, UPDATE_DURATION
} from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for RequestAddFormLogic (14 cases). */
export default function requestAddFormLogicConstantsTest(): void {
  describe('RequestAddFormLogicConstantsTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0001
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0001
     * @tc.desc      CONDITION_ID keeps value "110000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0001 begin`);
      const actual: string = CONDITION_ID;
      logInfo(`CONDITION_ID: actual=${actual}`);
      expect(actual).assertEqual('110000');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0002
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0002
     * @tc.desc      ABILITY_NAME keeps value "EntryFormAbility"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0002 begin`);
      const actual: string = ABILITY_NAME;
      logInfo(`ABILITY_NAME: actual=${actual}`);
      expect(actual).assertEqual('EntryFormAbility');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0003
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0003
     * @tc.desc      MODULE_NAME keeps value "entry"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0003 begin`);
      const actual: string = MODULE_NAME;
      logInfo(`MODULE_NAME: actual=${actual}`);
      expect(actual).assertEqual('entry');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0004
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0004
     * @tc.desc      ARKTS_FORM_NAME keeps value "widget"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0004 begin`);
      const actual: string = ARKTS_FORM_NAME;
      logInfo(`ARKTS_FORM_NAME: actual=${actual}`);
      expect(actual).assertEqual('widget');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0005
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0005
     * @tc.desc      JS_FORM_NAME keeps value "JsWidget"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0005 begin`);
      const actual: string = JS_FORM_NAME;
      logInfo(`JS_FORM_NAME: actual=${actual}`);
      expect(actual).assertEqual('JsWidget');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0006
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0006
     * @tc.desc      PROXY_KEY keeps value "weather"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0006 begin`);
      const actual: string = PROXY_KEY;
      logInfo(`PROXY_KEY: actual=${actual}`);
      expect(actual).assertEqual('weather');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0007
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0007
     * @tc.desc      DIMENSION_KEY keeps value "ohos.extra.param.key.form_dimension"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0007 begin`);
      const actual: string = DIMENSION_KEY;
      logInfo(`DIMENSION_KEY: actual=${actual}`);
      expect(actual).assertEqual('ohos.extra.param.key.form_dimension');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0008
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0008
     * @tc.desc      FORM_NAME_KEY keeps value "ohos.extra.param.key.form_name"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0008 begin`);
      const actual: string = FORM_NAME_KEY;
      logInfo(`FORM_NAME_KEY: actual=${actual}`);
      expect(actual).assertEqual('ohos.extra.param.key.form_name');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0009
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0009
     * @tc.desc      MODULE_NAME_KEY keeps value "ohos.extra.param.key.module_name"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0009 begin`);
      const actual: string = MODULE_NAME_KEY;
      logInfo(`MODULE_NAME_KEY: actual=${actual}`);
      expect(actual).assertEqual('ohos.extra.param.key.module_name');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0010
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0010
     * @tc.desc      DEFAULT_DIMENSION keeps value "2*2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0010 begin`);
      const actual: string = DEFAULT_DIMENSION;
      logInfo(`DEFAULT_DIMENSION: actual=${actual}`);
      expect(actual).assertEqual('2*2');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0011
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0011
     * @tc.desc      SUPPORT_DIMENSIONS keeps value ["2*2"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0011 begin`);
      const actual: string[] = SUPPORT_DIMENSIONS;
      logInfo(`SUPPORT_DIMENSIONS: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`SUPPORT_DIMENSIONS: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["2*2"]');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0012
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0012
     * @tc.desc      SCHEDULED_UPDATE_TIME keeps value "10:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0012 begin`);
      const actual: string = SCHEDULED_UPDATE_TIME;
      logInfo(`SCHEDULED_UPDATE_TIME: actual=${actual}`);
      expect(actual).assertEqual('10:30');
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0013
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0013
     * @tc.desc      UPDATE_DURATION keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0013 begin`);
      const actual: number = UPDATE_DURATION;
      logInfo(`UPDATE_DURATION: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_REQUEST_ADD_FORM_LOGIC_CONSTANTS_0014
     * @tc.name      RequestAddForm_RequestAddFormLogicConstants_0014
     * @tc.desc      DESIGN_WIDTH keeps value 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_RequestAddFormLogicConstants_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0014 begin`);
      const actual: number = DESIGN_WIDTH;
      logInfo(`DESIGN_WIDTH: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}RequestAddFormLogicConstants_0014 end`);
    });
  });
}
