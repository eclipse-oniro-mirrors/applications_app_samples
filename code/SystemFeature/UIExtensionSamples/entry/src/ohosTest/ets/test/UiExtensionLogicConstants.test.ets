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
  APP_LINKING_ONLY, BAR_COLOR, BUNDLE_NAME, CALLBACK_RESULT_CODE, CONTEXT_ABILITY, CONTEXT_PAGE, OPEN_LINK,
  OPEN_LINK_PAGE, PAGE_NAMES, PICKER_TYPES, PROMISE_RESULT_CODE, SESSION_ABILITY, UI_EXTENSION_TYPE,
  UI_EXTENSION_TYPE_KEY
} from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for UiExtensionLogic (14 cases). */
export default function uiExtensionLogicConstantsTest(): void {
  describe('UiExtensionLogicConstantsTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0001
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0001
     * @tc.desc      PAGE_NAMES keeps value ["UIExtensionContentSession"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0001 begin`);
      const actual: string[] = PAGE_NAMES;
      logInfo(`PAGE_NAMES: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`PAGE_NAMES: JSON.stringify(actual.slice(0, 2))=${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('["AbilityStartCallback","UIExtensionContext"]');
      logInfo(`PAGE_NAMES: JSON.stringify(actual.slice(2, 3))=${JSON.stringify(actual.slice(2, 3))}`);
      expect(JSON.stringify(actual.slice(2, 3))).assertEqual('["UIExtensionContentSession"]');
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0002
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0002
     * @tc.desc      BUNDLE_NAME keeps value "com.samples.uiextension"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0002 begin`);
      const actual: string = BUNDLE_NAME;
      logInfo(`BUNDLE_NAME: actual=${actual}`);
      expect(actual).assertEqual('com.samples.uiextension');
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0003
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0003
     * @tc.desc      CONTEXT_ABILITY keeps value "ContextUIExtensionAbility"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0003 begin`);
      const actual: string = CONTEXT_ABILITY;
      logInfo(`CONTEXT_ABILITY: actual=${actual}`);
      expect(actual).assertEqual('ContextUIExtensionAbility');
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0004
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0004
     * @tc.desc      SESSION_ABILITY keeps value "SessionUIExtensionAbility"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0004 begin`);
      const actual: string = SESSION_ABILITY;
      logInfo(`SESSION_ABILITY: actual=${actual}`);
      expect(actual).assertEqual('SessionUIExtensionAbility');
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0005
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0005
     * @tc.desc      UI_EXTENSION_TYPE_KEY keeps value "ability.want.params.uiExtensionType"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0005 begin`);
      const actual: string = UI_EXTENSION_TYPE_KEY;
      logInfo(`UI_EXTENSION_TYPE_KEY: actual=${actual}`);
      expect(actual).assertEqual('ability.want.params.uiExtensionType');
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0006
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0006
     * @tc.desc      UI_EXTENSION_TYPE keeps value "sys/commonUI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0006 begin`);
      const actual: string = UI_EXTENSION_TYPE;
      logInfo(`UI_EXTENSION_TYPE: actual=${actual}`);
      expect(actual).assertEqual('sys/commonUI');
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0007
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0007
     * @tc.desc      CALLBACK_RESULT_CODE keeps value 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0007 begin`);
      const actual: number = CALLBACK_RESULT_CODE;
      logInfo(`CALLBACK_RESULT_CODE: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0008
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0008
     * @tc.desc      PROMISE_RESULT_CODE keeps value 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0008 begin`);
      const actual: number = PROMISE_RESULT_CODE;
      logInfo(`PROMISE_RESULT_CODE: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0009
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0009
     * @tc.desc      OPEN_LINK keeps value "http://docs.openharmony.cn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0009 begin`);
      const actual: string = OPEN_LINK;
      logInfo(`OPEN_LINK: actual=${actual}`);
      expect(actual).assertEqual('http://docs.openharmony.cn');
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0010
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0010
     * @tc.desc      APP_LINKING_ONLY keeps value false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0010 begin`);
      const actual: boolean = APP_LINKING_ONLY;
      logInfo(`APP_LINKING_ONLY: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0011
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0011
     * @tc.desc      PICKER_TYPES keeps value ["audioPicker","error"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0011 begin`);
      const actual: string[] = PICKER_TYPES;
      logInfo(`PICKER_TYPES: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`PICKER_TYPES: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["audioPicker","error"]');
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0012
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0012
     * @tc.desc      BAR_COLOR keeps value "#f1f3f5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0012 begin`);
      const actual: string = BAR_COLOR;
      logInfo(`BAR_COLOR: actual=${actual}`);
      expect(actual).assertEqual('#f1f3f5');
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0013
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0013
     * @tc.desc      OPEN_LINK_PAGE keeps value "pages/OpenLinkIndex"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0013 begin`);
      const actual: string = OPEN_LINK_PAGE;
      logInfo(`OPEN_LINK_PAGE: actual=${actual}`);
      expect(actual).assertEqual('pages/OpenLinkIndex');
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_LOGIC_CONSTANTS_0014
     * @tc.name      UIExtensionSamples_UiExtensionLogicConstants_0014
     * @tc.desc      CONTEXT_PAGE keeps value "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionLogicConstants_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0014 begin`);
      const actual: string = CONTEXT_PAGE;
      logInfo(`CONTEXT_PAGE: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}UiExtensionLogicConstants_0014 end`);
    });
  });
}
