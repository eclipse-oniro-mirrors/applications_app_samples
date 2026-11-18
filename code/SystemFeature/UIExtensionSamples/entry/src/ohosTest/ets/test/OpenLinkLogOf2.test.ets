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
import { openLinkLogOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for openLinkLogOf (96 cases). */
export default function openLinkLogOf2Test(): void {
  describe('OpenLinkLogOf2Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0097
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0097
     * @tc.desc      openLinkLogOf(stage="callbac", code=1) returns "exception occurred, errCode : 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0097 begin`);
      const actual: string = openLinkLogOf('callbac', 1);
      logInfo(`openLinkLogOf(stage="callbac", code=1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0097 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0098
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0098
     * @tc.desc      openLinkLogOf(stage="callbac", code=2) returns "exception occurred, errCode : 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0098 begin`);
      const actual: string = openLinkLogOf('callbac', 2);
      logInfo(`openLinkLogOf(stage="callbac", code=2): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 2');
      logInfo(`${BUNDLE}OpenLinkLogOf_0098 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0099
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0099
     * @tc.desc      openLinkLogOf(stage="callbac", code=3) returns "exception occurred, errCode : 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0099 begin`);
      const actual: string = openLinkLogOf('callbac', 3);
      logInfo(`openLinkLogOf(stage="callbac", code=3): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 3');
      logInfo(`${BUNDLE}OpenLinkLogOf_0099 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0100
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0100
     * @tc.desc      openLinkLogOf(stage="callbac", code=10) returns "exception occurred, errCode : 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0100 begin`);
      const actual: string = openLinkLogOf('callbac', 10);
      logInfo(`openLinkLogOf(stage="callbac", code=10): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 10');
      logInfo(`${BUNDLE}OpenLinkLogOf_0100 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0101
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0101
     * @tc.desc      openLinkLogOf(stage="callbac", code=100) returns "exception occurred, errCode : 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0101 begin`);
      const actual: string = openLinkLogOf('callbac', 100);
      logInfo(`openLinkLogOf(stage="callbac", code=100): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 100');
      logInfo(`${BUNDLE}OpenLinkLogOf_0101 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0102
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0102
     * @tc.desc      openLinkLogOf(stage="callbac", code=25) returns "exception occurred, errCode : 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0102 begin`);
      const actual: string = openLinkLogOf('callbac', 25);
      logInfo(`openLinkLogOf(stage="callbac", code=25): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 25');
      logInfo(`${BUNDLE}OpenLinkLogOf_0102 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0103
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0103
     * @tc.desc      openLinkLogOf(stage="callbac", code=50) returns "exception occurred, errCode : 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0103 begin`);
      const actual: string = openLinkLogOf('callbac', 50);
      logInfo(`openLinkLogOf(stage="callbac", code=50): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 50');
      logInfo(`${BUNDLE}OpenLinkLogOf_0103 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0104
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0104
     * @tc.desc      openLinkLogOf(stage="callbac", code=75) returns "exception occurred, errCode : 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0104 begin`);
      const actual: string = openLinkLogOf('callbac', 75);
      logInfo(`openLinkLogOf(stage="callbac", code=75): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 75');
      logInfo(`${BUNDLE}OpenLinkLogOf_0104 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0105
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0105
     * @tc.desc      openLinkLogOf(stage="callbac", code=125) returns "exception occurred, errCode : 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0105 begin`);
      const actual: string = openLinkLogOf('callbac', 125);
      logInfo(`openLinkLogOf(stage="callbac", code=125): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 125');
      logInfo(`${BUNDLE}OpenLinkLogOf_0105 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0106
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0106
     * @tc.desc      openLinkLogOf(stage="callbac", code=150) returns "exception occurred, errCode : 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0106 begin`);
      const actual: string = openLinkLogOf('callbac', 150);
      logInfo(`openLinkLogOf(stage="callbac", code=150): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 150');
      logInfo(`${BUNDLE}OpenLinkLogOf_0106 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0107
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0107
     * @tc.desc      openLinkLogOf(stage="callbac", code=175) returns "exception occurred, errCode : 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0107 begin`);
      const actual: string = openLinkLogOf('callbac', 175);
      logInfo(`openLinkLogOf(stage="callbac", code=175): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 175');
      logInfo(`${BUNDLE}OpenLinkLogOf_0107 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0108
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0108
     * @tc.desc      openLinkLogOf(stage="callbac", code=225) returns "exception occurred, errCode : 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0108 begin`);
      const actual: string = openLinkLogOf('callbac', 225);
      logInfo(`openLinkLogOf(stage="callbac", code=225): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 225');
      logInfo(`${BUNDLE}OpenLinkLogOf_0108 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0109
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0109
     * @tc.desc      openLinkLogOf(stage="callbac", code=250) returns "exception occurred, errCode : 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0109 begin`);
      const actual: string = openLinkLogOf('callbac', 250);
      logInfo(`openLinkLogOf(stage="callbac", code=250): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 250');
      logInfo(`${BUNDLE}OpenLinkLogOf_0109 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0110
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0110
     * @tc.desc      openLinkLogOf(stage="callbac", code=275) returns "exception occurred, errCode : 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0110 begin`);
      const actual: string = openLinkLogOf('callbac', 275);
      logInfo(`openLinkLogOf(stage="callbac", code=275): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 275');
      logInfo(`${BUNDLE}OpenLinkLogOf_0110 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0111
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0111
     * @tc.desc      openLinkLogOf(stage="callbac", code=300) returns "exception occurred, errCode : 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0111 begin`);
      const actual: string = openLinkLogOf('callbac', 300);
      logInfo(`openLinkLogOf(stage="callbac", code=300): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 300');
      logInfo(`${BUNDLE}OpenLinkLogOf_0111 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0112
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0112
     * @tc.desc      openLinkLogOf(stage="callbac", code=325) returns "exception occurred, errCode : 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0112 begin`);
      const actual: string = openLinkLogOf('callbac', 325);
      logInfo(`openLinkLogOf(stage="callbac", code=325): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 325');
      logInfo(`${BUNDLE}OpenLinkLogOf_0112 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0113
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0113
     * @tc.desc      openLinkLogOf(stage="callbac", code=350) returns "exception occurred, errCode : 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0113 begin`);
      const actual: string = openLinkLogOf('callbac', 350);
      logInfo(`openLinkLogOf(stage="callbac", code=350): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 350');
      logInfo(`${BUNDLE}OpenLinkLogOf_0113 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0114
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0114
     * @tc.desc      openLinkLogOf(stage="callbac", code=375) returns "exception occurred, errCode : 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0114 begin`);
      const actual: string = openLinkLogOf('callbac', 375);
      logInfo(`openLinkLogOf(stage="callbac", code=375): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 375');
      logInfo(`${BUNDLE}OpenLinkLogOf_0114 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0115
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0115
     * @tc.desc      openLinkLogOf(stage="callbac", code=400) returns "exception occurred, errCode : 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0115 begin`);
      const actual: string = openLinkLogOf('callbac', 400);
      logInfo(`openLinkLogOf(stage="callbac", code=400): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 400');
      logInfo(`${BUNDLE}OpenLinkLogOf_0115 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0116
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0116
     * @tc.desc      openLinkLogOf(stage="callbac", code=425) returns "exception occurred, errCode : 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0116 begin`);
      const actual: string = openLinkLogOf('callbac', 425);
      logInfo(`openLinkLogOf(stage="callbac", code=425): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 425');
      logInfo(`${BUNDLE}OpenLinkLogOf_0116 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0117
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0117
     * @tc.desc      openLinkLogOf(stage="callbac", code=450) returns "exception occurred, errCode : 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0117 begin`);
      const actual: string = openLinkLogOf('callbac', 450);
      logInfo(`openLinkLogOf(stage="callbac", code=450): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 450');
      logInfo(`${BUNDLE}OpenLinkLogOf_0117 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0118
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0118
     * @tc.desc      openLinkLogOf(stage="callbac", code=475) returns "exception occurred, errCode : 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0118 begin`);
      const actual: string = openLinkLogOf('callbac', 475);
      logInfo(`openLinkLogOf(stage="callbac", code=475): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 475');
      logInfo(`${BUNDLE}OpenLinkLogOf_0118 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0119
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0119
     * @tc.desc      openLinkLogOf(stage="callbac", code=865) returns "exception occurred, errCode : 865"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0119 begin`);
      const actual: string = openLinkLogOf('callbac', 865);
      logInfo(`openLinkLogOf(stage="callbac", code=865): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 865');
      logInfo(`${BUNDLE}OpenLinkLogOf_0119 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0120
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0120
     * @tc.desc      openLinkLogOf(stage="callbac", code=188.03) returns "exception occurred, errCode : 188.03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0120 begin`);
      const actual: string = openLinkLogOf('callbac', 188.03);
      logInfo(`openLinkLogOf(stage="callbac", code=188.03): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 188.03');
      logInfo(`${BUNDLE}OpenLinkLogOf_0120 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0121
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0121
     * @tc.desc      openLinkLogOf(stage="callbackx", code=0) returns "exception occurred, errCode : 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0121 begin`);
      const actual: string = openLinkLogOf('callbackx', 0);
      logInfo(`openLinkLogOf(stage="callbackx", code=0): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 0');
      logInfo(`${BUNDLE}OpenLinkLogOf_0121 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0122
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0122
     * @tc.desc      openLinkLogOf(stage="callbackx", code=200) returns "exception occurred, errCode : 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0122 begin`);
      const actual: string = openLinkLogOf('callbackx', 200);
      logInfo(`openLinkLogOf(stage="callbackx", code=200): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 200');
      logInfo(`${BUNDLE}OpenLinkLogOf_0122 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0123
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0123
     * @tc.desc      openLinkLogOf(stage="callbackx", code=401) returns "exception occurred, errCode : 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0123 begin`);
      const actual: string = openLinkLogOf('callbackx', 401);
      logInfo(`openLinkLogOf(stage="callbackx", code=401): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 401');
      logInfo(`${BUNDLE}OpenLinkLogOf_0123 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0124
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0124
     * @tc.desc      openLinkLogOf(stage="callbackx", code=404) returns "exception occurred, errCode : 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0124 begin`);
      const actual: string = openLinkLogOf('callbackx', 404);
      logInfo(`openLinkLogOf(stage="callbackx", code=404): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 404');
      logInfo(`${BUNDLE}OpenLinkLogOf_0124 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0125
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0125
     * @tc.desc      openLinkLogOf(stage="callbackx", code=500) returns "exception occurred, errCode : 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0125 begin`);
      const actual: string = openLinkLogOf('callbackx', 500);
      logInfo(`openLinkLogOf(stage="callbackx", code=500): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 500');
      logInfo(`${BUNDLE}OpenLinkLogOf_0125 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0126
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0126
     * @tc.desc      openLinkLogOf(stage="callbackx", code=-1) returns "exception occurred, errCode : -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0126 begin`);
      const actual: string = openLinkLogOf('callbackx', -1);
      logInfo(`openLinkLogOf(stage="callbackx", code=-1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : -1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0126 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0127
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0127
     * @tc.desc      openLinkLogOf(stage="callbackx", code=1) returns "exception occurred, errCode : 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0127 begin`);
      const actual: string = openLinkLogOf('callbackx', 1);
      logInfo(`openLinkLogOf(stage="callbackx", code=1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0127 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0128
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0128
     * @tc.desc      openLinkLogOf(stage="callbackx", code=2) returns "exception occurred, errCode : 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0128 begin`);
      const actual: string = openLinkLogOf('callbackx', 2);
      logInfo(`openLinkLogOf(stage="callbackx", code=2): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 2');
      logInfo(`${BUNDLE}OpenLinkLogOf_0128 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0129
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0129
     * @tc.desc      openLinkLogOf(stage="callbackx", code=3) returns "exception occurred, errCode : 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0129 begin`);
      const actual: string = openLinkLogOf('callbackx', 3);
      logInfo(`openLinkLogOf(stage="callbackx", code=3): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 3');
      logInfo(`${BUNDLE}OpenLinkLogOf_0129 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0130
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0130
     * @tc.desc      openLinkLogOf(stage="callbackx", code=10) returns "exception occurred, errCode : 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0130 begin`);
      const actual: string = openLinkLogOf('callbackx', 10);
      logInfo(`openLinkLogOf(stage="callbackx", code=10): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 10');
      logInfo(`${BUNDLE}OpenLinkLogOf_0130 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0131
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0131
     * @tc.desc      openLinkLogOf(stage="callbackx", code=100) returns "exception occurred, errCode : 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0131 begin`);
      const actual: string = openLinkLogOf('callbackx', 100);
      logInfo(`openLinkLogOf(stage="callbackx", code=100): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 100');
      logInfo(`${BUNDLE}OpenLinkLogOf_0131 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0132
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0132
     * @tc.desc      openLinkLogOf(stage="callbackx", code=25) returns "exception occurred, errCode : 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0132 begin`);
      const actual: string = openLinkLogOf('callbackx', 25);
      logInfo(`openLinkLogOf(stage="callbackx", code=25): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 25');
      logInfo(`${BUNDLE}OpenLinkLogOf_0132 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0133
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0133
     * @tc.desc      openLinkLogOf(stage="callbackx", code=50) returns "exception occurred, errCode : 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0133 begin`);
      const actual: string = openLinkLogOf('callbackx', 50);
      logInfo(`openLinkLogOf(stage="callbackx", code=50): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 50');
      logInfo(`${BUNDLE}OpenLinkLogOf_0133 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0134
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0134
     * @tc.desc      openLinkLogOf(stage="callbackx", code=75) returns "exception occurred, errCode : 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0134 begin`);
      const actual: string = openLinkLogOf('callbackx', 75);
      logInfo(`openLinkLogOf(stage="callbackx", code=75): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 75');
      logInfo(`${BUNDLE}OpenLinkLogOf_0134 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0135
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0135
     * @tc.desc      openLinkLogOf(stage="callbackx", code=125) returns "exception occurred, errCode : 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0135 begin`);
      const actual: string = openLinkLogOf('callbackx', 125);
      logInfo(`openLinkLogOf(stage="callbackx", code=125): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 125');
      logInfo(`${BUNDLE}OpenLinkLogOf_0135 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0136
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0136
     * @tc.desc      openLinkLogOf(stage="callbackx", code=150) returns "exception occurred, errCode : 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0136 begin`);
      const actual: string = openLinkLogOf('callbackx', 150);
      logInfo(`openLinkLogOf(stage="callbackx", code=150): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 150');
      logInfo(`${BUNDLE}OpenLinkLogOf_0136 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0137
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0137
     * @tc.desc      openLinkLogOf(stage="callbackx", code=175) returns "exception occurred, errCode : 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0137 begin`);
      const actual: string = openLinkLogOf('callbackx', 175);
      logInfo(`openLinkLogOf(stage="callbackx", code=175): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 175');
      logInfo(`${BUNDLE}OpenLinkLogOf_0137 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0138
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0138
     * @tc.desc      openLinkLogOf(stage="callbackx", code=225) returns "exception occurred, errCode : 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0138 begin`);
      const actual: string = openLinkLogOf('callbackx', 225);
      logInfo(`openLinkLogOf(stage="callbackx", code=225): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 225');
      logInfo(`${BUNDLE}OpenLinkLogOf_0138 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0139
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0139
     * @tc.desc      openLinkLogOf(stage="callbackx", code=250) returns "exception occurred, errCode : 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0139 begin`);
      const actual: string = openLinkLogOf('callbackx', 250);
      logInfo(`openLinkLogOf(stage="callbackx", code=250): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 250');
      logInfo(`${BUNDLE}OpenLinkLogOf_0139 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0140
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0140
     * @tc.desc      openLinkLogOf(stage="callbackx", code=275) returns "exception occurred, errCode : 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0140 begin`);
      const actual: string = openLinkLogOf('callbackx', 275);
      logInfo(`openLinkLogOf(stage="callbackx", code=275): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 275');
      logInfo(`${BUNDLE}OpenLinkLogOf_0140 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0141
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0141
     * @tc.desc      openLinkLogOf(stage="callbackx", code=300) returns "exception occurred, errCode : 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0141 begin`);
      const actual: string = openLinkLogOf('callbackx', 300);
      logInfo(`openLinkLogOf(stage="callbackx", code=300): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 300');
      logInfo(`${BUNDLE}OpenLinkLogOf_0141 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0142
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0142
     * @tc.desc      openLinkLogOf(stage="callbackx", code=325) returns "exception occurred, errCode : 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0142 begin`);
      const actual: string = openLinkLogOf('callbackx', 325);
      logInfo(`openLinkLogOf(stage="callbackx", code=325): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 325');
      logInfo(`${BUNDLE}OpenLinkLogOf_0142 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0143
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0143
     * @tc.desc      openLinkLogOf(stage="callbackx", code=350) returns "exception occurred, errCode : 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0143 begin`);
      const actual: string = openLinkLogOf('callbackx', 350);
      logInfo(`openLinkLogOf(stage="callbackx", code=350): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 350');
      logInfo(`${BUNDLE}OpenLinkLogOf_0143 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0144
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0144
     * @tc.desc      openLinkLogOf(stage="callbackx", code=375) returns "exception occurred, errCode : 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0144 begin`);
      const actual: string = openLinkLogOf('callbackx', 375);
      logInfo(`openLinkLogOf(stage="callbackx", code=375): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 375');
      logInfo(`${BUNDLE}OpenLinkLogOf_0144 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0145
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0145
     * @tc.desc      openLinkLogOf(stage="callbackx", code=400) returns "exception occurred, errCode : 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0145 begin`);
      const actual: string = openLinkLogOf('callbackx', 400);
      logInfo(`openLinkLogOf(stage="callbackx", code=400): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 400');
      logInfo(`${BUNDLE}OpenLinkLogOf_0145 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0146
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0146
     * @tc.desc      openLinkLogOf(stage="callbackx", code=425) returns "exception occurred, errCode : 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0146 begin`);
      const actual: string = openLinkLogOf('callbackx', 425);
      logInfo(`openLinkLogOf(stage="callbackx", code=425): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 425');
      logInfo(`${BUNDLE}OpenLinkLogOf_0146 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0147
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0147
     * @tc.desc      openLinkLogOf(stage="callbackx", code=450) returns "exception occurred, errCode : 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0147 begin`);
      const actual: string = openLinkLogOf('callbackx', 450);
      logInfo(`openLinkLogOf(stage="callbackx", code=450): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 450');
      logInfo(`${BUNDLE}OpenLinkLogOf_0147 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0148
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0148
     * @tc.desc      openLinkLogOf(stage="callbackx", code=475) returns "exception occurred, errCode : 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0148 begin`);
      const actual: string = openLinkLogOf('callbackx', 475);
      logInfo(`openLinkLogOf(stage="callbackx", code=475): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 475');
      logInfo(`${BUNDLE}OpenLinkLogOf_0148 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0149
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0149
     * @tc.desc      openLinkLogOf(stage="callbackx", code=865) returns "exception occurred, errCode : 865"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0149 begin`);
      const actual: string = openLinkLogOf('callbackx', 865);
      logInfo(`openLinkLogOf(stage="callbackx", code=865): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 865');
      logInfo(`${BUNDLE}OpenLinkLogOf_0149 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0150
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0150
     * @tc.desc      openLinkLogOf(stage="callbackx", code=188.03) returns "exception occurred, errCode : 188.03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0150 begin`);
      const actual: string = openLinkLogOf('callbackx', 188.03);
      logInfo(`openLinkLogOf(stage="callbackx", code=188...: actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 188.03');
      logInfo(`${BUNDLE}OpenLinkLogOf_0150 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0151
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0151
     * @tc.desc      openLinkLogOf(stage="FAILED", code=0) returns "exception occurred, errCode : 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0151 begin`);
      const actual: string = openLinkLogOf('FAILED', 0);
      logInfo(`openLinkLogOf(stage="FAILED", code=0): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 0');
      logInfo(`${BUNDLE}OpenLinkLogOf_0151 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0152
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0152
     * @tc.desc      openLinkLogOf(stage="FAILED", code=200) returns "exception occurred, errCode : 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0152 begin`);
      const actual: string = openLinkLogOf('FAILED', 200);
      logInfo(`openLinkLogOf(stage="FAILED", code=200): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 200');
      logInfo(`${BUNDLE}OpenLinkLogOf_0152 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0153
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0153
     * @tc.desc      openLinkLogOf(stage="FAILED", code=401) returns "exception occurred, errCode : 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0153 begin`);
      const actual: string = openLinkLogOf('FAILED', 401);
      logInfo(`openLinkLogOf(stage="FAILED", code=401): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 401');
      logInfo(`${BUNDLE}OpenLinkLogOf_0153 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0154
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0154
     * @tc.desc      openLinkLogOf(stage="FAILED", code=404) returns "exception occurred, errCode : 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0154 begin`);
      const actual: string = openLinkLogOf('FAILED', 404);
      logInfo(`openLinkLogOf(stage="FAILED", code=404): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 404');
      logInfo(`${BUNDLE}OpenLinkLogOf_0154 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0155
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0155
     * @tc.desc      openLinkLogOf(stage="FAILED", code=500) returns "exception occurred, errCode : 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0155 begin`);
      const actual: string = openLinkLogOf('FAILED', 500);
      logInfo(`openLinkLogOf(stage="FAILED", code=500): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 500');
      logInfo(`${BUNDLE}OpenLinkLogOf_0155 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0156
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0156
     * @tc.desc      openLinkLogOf(stage="FAILED", code=-1) returns "exception occurred, errCode : -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0156 begin`);
      const actual: string = openLinkLogOf('FAILED', -1);
      logInfo(`openLinkLogOf(stage="FAILED", code=-1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : -1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0156 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0157
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0157
     * @tc.desc      openLinkLogOf(stage="FAILED", code=1) returns "exception occurred, errCode : 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0157 begin`);
      const actual: string = openLinkLogOf('FAILED', 1);
      logInfo(`openLinkLogOf(stage="FAILED", code=1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0157 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0158
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0158
     * @tc.desc      openLinkLogOf(stage="FAILED", code=2) returns "exception occurred, errCode : 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0158 begin`);
      const actual: string = openLinkLogOf('FAILED', 2);
      logInfo(`openLinkLogOf(stage="FAILED", code=2): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 2');
      logInfo(`${BUNDLE}OpenLinkLogOf_0158 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0159
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0159
     * @tc.desc      openLinkLogOf(stage="FAILED", code=3) returns "exception occurred, errCode : 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0159 begin`);
      const actual: string = openLinkLogOf('FAILED', 3);
      logInfo(`openLinkLogOf(stage="FAILED", code=3): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 3');
      logInfo(`${BUNDLE}OpenLinkLogOf_0159 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0160
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0160
     * @tc.desc      openLinkLogOf(stage="FAILED", code=10) returns "exception occurred, errCode : 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0160 begin`);
      const actual: string = openLinkLogOf('FAILED', 10);
      logInfo(`openLinkLogOf(stage="FAILED", code=10): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 10');
      logInfo(`${BUNDLE}OpenLinkLogOf_0160 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0161
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0161
     * @tc.desc      openLinkLogOf(stage="FAILED", code=100) returns "exception occurred, errCode : 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0161 begin`);
      const actual: string = openLinkLogOf('FAILED', 100);
      logInfo(`openLinkLogOf(stage="FAILED", code=100): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 100');
      logInfo(`${BUNDLE}OpenLinkLogOf_0161 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0162
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0162
     * @tc.desc      openLinkLogOf(stage="FAILED", code=25) returns "exception occurred, errCode : 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0162 begin`);
      const actual: string = openLinkLogOf('FAILED', 25);
      logInfo(`openLinkLogOf(stage="FAILED", code=25): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 25');
      logInfo(`${BUNDLE}OpenLinkLogOf_0162 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0163
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0163
     * @tc.desc      openLinkLogOf(stage="FAILED", code=50) returns "exception occurred, errCode : 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0163 begin`);
      const actual: string = openLinkLogOf('FAILED', 50);
      logInfo(`openLinkLogOf(stage="FAILED", code=50): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 50');
      logInfo(`${BUNDLE}OpenLinkLogOf_0163 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0164
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0164
     * @tc.desc      openLinkLogOf(stage="FAILED", code=75) returns "exception occurred, errCode : 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0164 begin`);
      const actual: string = openLinkLogOf('FAILED', 75);
      logInfo(`openLinkLogOf(stage="FAILED", code=75): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 75');
      logInfo(`${BUNDLE}OpenLinkLogOf_0164 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0165
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0165
     * @tc.desc      openLinkLogOf(stage="FAILED", code=125) returns "exception occurred, errCode : 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0165 begin`);
      const actual: string = openLinkLogOf('FAILED', 125);
      logInfo(`openLinkLogOf(stage="FAILED", code=125): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 125');
      logInfo(`${BUNDLE}OpenLinkLogOf_0165 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0166
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0166
     * @tc.desc      openLinkLogOf(stage="FAILED", code=150) returns "exception occurred, errCode : 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0166 begin`);
      const actual: string = openLinkLogOf('FAILED', 150);
      logInfo(`openLinkLogOf(stage="FAILED", code=150): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 150');
      logInfo(`${BUNDLE}OpenLinkLogOf_0166 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0167
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0167
     * @tc.desc      openLinkLogOf(stage="FAILED", code=175) returns "exception occurred, errCode : 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0167 begin`);
      const actual: string = openLinkLogOf('FAILED', 175);
      logInfo(`openLinkLogOf(stage="FAILED", code=175): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 175');
      logInfo(`${BUNDLE}OpenLinkLogOf_0167 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0168
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0168
     * @tc.desc      openLinkLogOf(stage="FAILED", code=225) returns "exception occurred, errCode : 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0168 begin`);
      const actual: string = openLinkLogOf('FAILED', 225);
      logInfo(`openLinkLogOf(stage="FAILED", code=225): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 225');
      logInfo(`${BUNDLE}OpenLinkLogOf_0168 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0169
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0169
     * @tc.desc      openLinkLogOf(stage="FAILED", code=250) returns "exception occurred, errCode : 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0169 begin`);
      const actual: string = openLinkLogOf('FAILED', 250);
      logInfo(`openLinkLogOf(stage="FAILED", code=250): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 250');
      logInfo(`${BUNDLE}OpenLinkLogOf_0169 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0170
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0170
     * @tc.desc      openLinkLogOf(stage="FAILED", code=275) returns "exception occurred, errCode : 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0170 begin`);
      const actual: string = openLinkLogOf('FAILED', 275);
      logInfo(`openLinkLogOf(stage="FAILED", code=275): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 275');
      logInfo(`${BUNDLE}OpenLinkLogOf_0170 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0171
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0171
     * @tc.desc      openLinkLogOf(stage="FAILED", code=300) returns "exception occurred, errCode : 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0171 begin`);
      const actual: string = openLinkLogOf('FAILED', 300);
      logInfo(`openLinkLogOf(stage="FAILED", code=300): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 300');
      logInfo(`${BUNDLE}OpenLinkLogOf_0171 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0172
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0172
     * @tc.desc      openLinkLogOf(stage="FAILED", code=325) returns "exception occurred, errCode : 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0172 begin`);
      const actual: string = openLinkLogOf('FAILED', 325);
      logInfo(`openLinkLogOf(stage="FAILED", code=325): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 325');
      logInfo(`${BUNDLE}OpenLinkLogOf_0172 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0173
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0173
     * @tc.desc      openLinkLogOf(stage="FAILED", code=350) returns "exception occurred, errCode : 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0173 begin`);
      const actual: string = openLinkLogOf('FAILED', 350);
      logInfo(`openLinkLogOf(stage="FAILED", code=350): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 350');
      logInfo(`${BUNDLE}OpenLinkLogOf_0173 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0174
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0174
     * @tc.desc      openLinkLogOf(stage="FAILED", code=375) returns "exception occurred, errCode : 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0174 begin`);
      const actual: string = openLinkLogOf('FAILED', 375);
      logInfo(`openLinkLogOf(stage="FAILED", code=375): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 375');
      logInfo(`${BUNDLE}OpenLinkLogOf_0174 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0175
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0175
     * @tc.desc      openLinkLogOf(stage="FAILED", code=400) returns "exception occurred, errCode : 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0175 begin`);
      const actual: string = openLinkLogOf('FAILED', 400);
      logInfo(`openLinkLogOf(stage="FAILED", code=400): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 400');
      logInfo(`${BUNDLE}OpenLinkLogOf_0175 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0176
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0176
     * @tc.desc      openLinkLogOf(stage="FAILED", code=425) returns "exception occurred, errCode : 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0176 begin`);
      const actual: string = openLinkLogOf('FAILED', 425);
      logInfo(`openLinkLogOf(stage="FAILED", code=425): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 425');
      logInfo(`${BUNDLE}OpenLinkLogOf_0176 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0177
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0177
     * @tc.desc      openLinkLogOf(stage="FAILED", code=450) returns "exception occurred, errCode : 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0177 begin`);
      const actual: string = openLinkLogOf('FAILED', 450);
      logInfo(`openLinkLogOf(stage="FAILED", code=450): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 450');
      logInfo(`${BUNDLE}OpenLinkLogOf_0177 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0178
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0178
     * @tc.desc      openLinkLogOf(stage="FAILED", code=475) returns "exception occurred, errCode : 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0178 begin`);
      const actual: string = openLinkLogOf('FAILED', 475);
      logInfo(`openLinkLogOf(stage="FAILED", code=475): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 475');
      logInfo(`${BUNDLE}OpenLinkLogOf_0178 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0179
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0179
     * @tc.desc      openLinkLogOf(stage="FAILED", code=865) returns "exception occurred, errCode : 865"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0179 begin`);
      const actual: string = openLinkLogOf('FAILED', 865);
      logInfo(`openLinkLogOf(stage="FAILED", code=865): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 865');
      logInfo(`${BUNDLE}OpenLinkLogOf_0179 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0180
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0180
     * @tc.desc      openLinkLogOf(stage="FAILED", code=188.03) returns "exception occurred, errCode : 188.03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0180 begin`);
      const actual: string = openLinkLogOf('FAILED', 188.03);
      logInfo(`openLinkLogOf(stage="FAILED", code=188.03): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 188.03');
      logInfo(`${BUNDLE}OpenLinkLogOf_0180 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0181
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0181
     * @tc.desc      openLinkLogOf(stage="faile", code=0) returns "exception occurred, errCode : 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0181 begin`);
      const actual: string = openLinkLogOf('faile', 0);
      logInfo(`openLinkLogOf(stage="faile", code=0): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 0');
      logInfo(`${BUNDLE}OpenLinkLogOf_0181 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0182
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0182
     * @tc.desc      openLinkLogOf(stage="faile", code=200) returns "exception occurred, errCode : 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0182 begin`);
      const actual: string = openLinkLogOf('faile', 200);
      logInfo(`openLinkLogOf(stage="faile", code=200): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 200');
      logInfo(`${BUNDLE}OpenLinkLogOf_0182 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0183
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0183
     * @tc.desc      openLinkLogOf(stage="faile", code=401) returns "exception occurred, errCode : 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0183 begin`);
      const actual: string = openLinkLogOf('faile', 401);
      logInfo(`openLinkLogOf(stage="faile", code=401): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 401');
      logInfo(`${BUNDLE}OpenLinkLogOf_0183 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0184
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0184
     * @tc.desc      openLinkLogOf(stage="faile", code=404) returns "exception occurred, errCode : 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0184 begin`);
      const actual: string = openLinkLogOf('faile', 404);
      logInfo(`openLinkLogOf(stage="faile", code=404): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 404');
      logInfo(`${BUNDLE}OpenLinkLogOf_0184 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0185
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0185
     * @tc.desc      openLinkLogOf(stage="faile", code=500) returns "exception occurred, errCode : 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0185 begin`);
      const actual: string = openLinkLogOf('faile', 500);
      logInfo(`openLinkLogOf(stage="faile", code=500): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 500');
      logInfo(`${BUNDLE}OpenLinkLogOf_0185 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0186
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0186
     * @tc.desc      openLinkLogOf(stage="faile", code=-1) returns "exception occurred, errCode : -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0186 begin`);
      const actual: string = openLinkLogOf('faile', -1);
      logInfo(`openLinkLogOf(stage="faile", code=-1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : -1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0186 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0187
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0187
     * @tc.desc      openLinkLogOf(stage="faile", code=1) returns "exception occurred, errCode : 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0187 begin`);
      const actual: string = openLinkLogOf('faile', 1);
      logInfo(`openLinkLogOf(stage="faile", code=1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0187 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0188
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0188
     * @tc.desc      openLinkLogOf(stage="faile", code=2) returns "exception occurred, errCode : 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0188 begin`);
      const actual: string = openLinkLogOf('faile', 2);
      logInfo(`openLinkLogOf(stage="faile", code=2): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 2');
      logInfo(`${BUNDLE}OpenLinkLogOf_0188 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0189
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0189
     * @tc.desc      openLinkLogOf(stage="faile", code=3) returns "exception occurred, errCode : 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0189 begin`);
      const actual: string = openLinkLogOf('faile', 3);
      logInfo(`openLinkLogOf(stage="faile", code=3): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 3');
      logInfo(`${BUNDLE}OpenLinkLogOf_0189 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0190
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0190
     * @tc.desc      openLinkLogOf(stage="faile", code=10) returns "exception occurred, errCode : 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0190 begin`);
      const actual: string = openLinkLogOf('faile', 10);
      logInfo(`openLinkLogOf(stage="faile", code=10): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 10');
      logInfo(`${BUNDLE}OpenLinkLogOf_0190 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0191
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0191
     * @tc.desc      openLinkLogOf(stage="faile", code=100) returns "exception occurred, errCode : 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0191 begin`);
      const actual: string = openLinkLogOf('faile', 100);
      logInfo(`openLinkLogOf(stage="faile", code=100): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 100');
      logInfo(`${BUNDLE}OpenLinkLogOf_0191 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0192
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0192
     * @tc.desc      openLinkLogOf(stage="faile", code=25) returns "exception occurred, errCode : 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0192 begin`);
      const actual: string = openLinkLogOf('faile', 25);
      logInfo(`openLinkLogOf(stage="faile", code=25): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 25');
      logInfo(`${BUNDLE}OpenLinkLogOf_0192 end`);
    });
  });
}
