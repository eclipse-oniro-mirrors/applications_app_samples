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

/** Logic checks for openLinkLogOf (30 cases). */
export default function openLinkLogOf3Test(): void {
  describe('OpenLinkLogOf3Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0193
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0193
     * @tc.desc      openLinkLogOf(stage="faile", code=50) returns "exception occurred, errCode : 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0193 begin`);
      const actual: string = openLinkLogOf('faile', 50);
      logInfo(`openLinkLogOf(stage="faile", code=50): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 50');
      logInfo(`${BUNDLE}OpenLinkLogOf_0193 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0194
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0194
     * @tc.desc      openLinkLogOf(stage="faile", code=75) returns "exception occurred, errCode : 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0194 begin`);
      const actual: string = openLinkLogOf('faile', 75);
      logInfo(`openLinkLogOf(stage="faile", code=75): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 75');
      logInfo(`${BUNDLE}OpenLinkLogOf_0194 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0195
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0195
     * @tc.desc      openLinkLogOf(stage="faile", code=125) returns "exception occurred, errCode : 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0195 begin`);
      const actual: string = openLinkLogOf('faile', 125);
      logInfo(`openLinkLogOf(stage="faile", code=125): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 125');
      logInfo(`${BUNDLE}OpenLinkLogOf_0195 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0196
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0196
     * @tc.desc      openLinkLogOf(stage="faile", code=150) returns "exception occurred, errCode : 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0196 begin`);
      const actual: string = openLinkLogOf('faile', 150);
      logInfo(`openLinkLogOf(stage="faile", code=150): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 150');
      logInfo(`${BUNDLE}OpenLinkLogOf_0196 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0197
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0197
     * @tc.desc      openLinkLogOf(stage="faile", code=175) returns "exception occurred, errCode : 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0197 begin`);
      const actual: string = openLinkLogOf('faile', 175);
      logInfo(`openLinkLogOf(stage="faile", code=175): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 175');
      logInfo(`${BUNDLE}OpenLinkLogOf_0197 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0198
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0198
     * @tc.desc      openLinkLogOf(stage="faile", code=225) returns "exception occurred, errCode : 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0198 begin`);
      const actual: string = openLinkLogOf('faile', 225);
      logInfo(`openLinkLogOf(stage="faile", code=225): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 225');
      logInfo(`${BUNDLE}OpenLinkLogOf_0198 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0199
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0199
     * @tc.desc      openLinkLogOf(stage="faile", code=250) returns "exception occurred, errCode : 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0199 begin`);
      const actual: string = openLinkLogOf('faile', 250);
      logInfo(`openLinkLogOf(stage="faile", code=250): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 250');
      logInfo(`${BUNDLE}OpenLinkLogOf_0199 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0200
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0200
     * @tc.desc      openLinkLogOf(stage="faile", code=275) returns "exception occurred, errCode : 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0200 begin`);
      const actual: string = openLinkLogOf('faile', 275);
      logInfo(`openLinkLogOf(stage="faile", code=275): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 275');
      logInfo(`${BUNDLE}OpenLinkLogOf_0200 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0201
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0201
     * @tc.desc      openLinkLogOf(stage="faile", code=300) returns "exception occurred, errCode : 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0201 begin`);
      const actual: string = openLinkLogOf('faile', 300);
      logInfo(`openLinkLogOf(stage="faile", code=300): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 300');
      logInfo(`${BUNDLE}OpenLinkLogOf_0201 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0202
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0202
     * @tc.desc      openLinkLogOf(stage="faile", code=325) returns "exception occurred, errCode : 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0202 begin`);
      const actual: string = openLinkLogOf('faile', 325);
      logInfo(`openLinkLogOf(stage="faile", code=325): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 325');
      logInfo(`${BUNDLE}OpenLinkLogOf_0202 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0203
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0203
     * @tc.desc      openLinkLogOf(stage="faile", code=350) returns "exception occurred, errCode : 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0203 begin`);
      const actual: string = openLinkLogOf('faile', 350);
      logInfo(`openLinkLogOf(stage="faile", code=350): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 350');
      logInfo(`${BUNDLE}OpenLinkLogOf_0203 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0204
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0204
     * @tc.desc      openLinkLogOf(stage="faile", code=375) returns "exception occurred, errCode : 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0204 begin`);
      const actual: string = openLinkLogOf('faile', 375);
      logInfo(`openLinkLogOf(stage="faile", code=375): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 375');
      logInfo(`${BUNDLE}OpenLinkLogOf_0204 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0205
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0205
     * @tc.desc      openLinkLogOf(stage="faile", code=400) returns "exception occurred, errCode : 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0205 begin`);
      const actual: string = openLinkLogOf('faile', 400);
      logInfo(`openLinkLogOf(stage="faile", code=400): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 400');
      logInfo(`${BUNDLE}OpenLinkLogOf_0205 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0206
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0206
     * @tc.desc      openLinkLogOf(stage="faile", code=425) returns "exception occurred, errCode : 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0206 begin`);
      const actual: string = openLinkLogOf('faile', 425);
      logInfo(`openLinkLogOf(stage="faile", code=425): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 425');
      logInfo(`${BUNDLE}OpenLinkLogOf_0206 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0207
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0207
     * @tc.desc      openLinkLogOf(stage="faile", code=450) returns "exception occurred, errCode : 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0207 begin`);
      const actual: string = openLinkLogOf('faile', 450);
      logInfo(`openLinkLogOf(stage="faile", code=450): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 450');
      logInfo(`${BUNDLE}OpenLinkLogOf_0207 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0208
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0208
     * @tc.desc      openLinkLogOf(stage="faile", code=475) returns "exception occurred, errCode : 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0208 begin`);
      const actual: string = openLinkLogOf('faile', 475);
      logInfo(`openLinkLogOf(stage="faile", code=475): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 475');
      logInfo(`${BUNDLE}OpenLinkLogOf_0208 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0209
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0209
     * @tc.desc      openLinkLogOf(stage="faile", code=865) returns "exception occurred, errCode : 865"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0209 begin`);
      const actual: string = openLinkLogOf('faile', 865);
      logInfo(`openLinkLogOf(stage="faile", code=865): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 865');
      logInfo(`${BUNDLE}OpenLinkLogOf_0209 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0210
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0210
     * @tc.desc      openLinkLogOf(stage="faile", code=188.03) returns "exception occurred, errCode : 188.03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0210 begin`);
      const actual: string = openLinkLogOf('faile', 188.03);
      logInfo(`openLinkLogOf(stage="faile", code=188.03): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 188.03');
      logInfo(`${BUNDLE}OpenLinkLogOf_0210 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0211
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0211
     * @tc.desc      openLinkLogOf(stage="failedx", code=0) returns "exception occurred, errCode : 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0211 begin`);
      const actual: string = openLinkLogOf('failedx', 0);
      logInfo(`openLinkLogOf(stage="failedx", code=0): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 0');
      logInfo(`${BUNDLE}OpenLinkLogOf_0211 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0212
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0212
     * @tc.desc      openLinkLogOf(stage="failedx", code=200) returns "exception occurred, errCode : 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0212 begin`);
      const actual: string = openLinkLogOf('failedx', 200);
      logInfo(`openLinkLogOf(stage="failedx", code=200): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 200');
      logInfo(`${BUNDLE}OpenLinkLogOf_0212 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0213
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0213
     * @tc.desc      openLinkLogOf(stage="failedx", code=401) returns "exception occurred, errCode : 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0213 begin`);
      const actual: string = openLinkLogOf('failedx', 401);
      logInfo(`openLinkLogOf(stage="failedx", code=401): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 401');
      logInfo(`${BUNDLE}OpenLinkLogOf_0213 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0214
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0214
     * @tc.desc      openLinkLogOf(stage="failedx", code=404) returns "exception occurred, errCode : 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0214 begin`);
      const actual: string = openLinkLogOf('failedx', 404);
      logInfo(`openLinkLogOf(stage="failedx", code=404): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 404');
      logInfo(`${BUNDLE}OpenLinkLogOf_0214 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0215
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0215
     * @tc.desc      openLinkLogOf(stage="failedx", code=500) returns "exception occurred, errCode : 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0215 begin`);
      const actual: string = openLinkLogOf('failedx', 500);
      logInfo(`openLinkLogOf(stage="failedx", code=500): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 500');
      logInfo(`${BUNDLE}OpenLinkLogOf_0215 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0216
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0216
     * @tc.desc      openLinkLogOf(stage="failedx", code=-1) returns "exception occurred, errCode : -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0216 begin`);
      const actual: string = openLinkLogOf('failedx', -1);
      logInfo(`openLinkLogOf(stage="failedx", code=-1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : -1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0216 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0217
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0217
     * @tc.desc      openLinkLogOf(stage="failedx", code=1) returns "exception occurred, errCode : 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0217 begin`);
      const actual: string = openLinkLogOf('failedx', 1);
      logInfo(`openLinkLogOf(stage="failedx", code=1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0217 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0218
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0218
     * @tc.desc      openLinkLogOf(stage="failedx", code=2) returns "exception occurred, errCode : 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0218 begin`);
      const actual: string = openLinkLogOf('failedx', 2);
      logInfo(`openLinkLogOf(stage="failedx", code=2): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 2');
      logInfo(`${BUNDLE}OpenLinkLogOf_0218 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0219
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0219
     * @tc.desc      openLinkLogOf(stage="failedx", code=3) returns "exception occurred, errCode : 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0219 begin`);
      const actual: string = openLinkLogOf('failedx', 3);
      logInfo(`openLinkLogOf(stage="failedx", code=3): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 3');
      logInfo(`${BUNDLE}OpenLinkLogOf_0219 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0220
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0220
     * @tc.desc      openLinkLogOf(stage="failedx", code=10) returns "exception occurred, errCode : 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0220 begin`);
      const actual: string = openLinkLogOf('failedx', 10);
      logInfo(`openLinkLogOf(stage="failedx", code=10): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 10');
      logInfo(`${BUNDLE}OpenLinkLogOf_0220 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0221
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0221
     * @tc.desc      openLinkLogOf(stage="failedx", code=100) returns "exception occurred, errCode : 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0221 begin`);
      const actual: string = openLinkLogOf('failedx', 100);
      logInfo(`openLinkLogOf(stage="failedx", code=100): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 100');
      logInfo(`${BUNDLE}OpenLinkLogOf_0221 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0222
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0222
     * @tc.desc      openLinkLogOf(stage="failedx", code=25) returns "exception occurred, errCode : 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0222 begin`);
      const actual: string = openLinkLogOf('failedx', 25);
      logInfo(`openLinkLogOf(stage="failedx", code=25): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 25');
      logInfo(`${BUNDLE}OpenLinkLogOf_0222 end`);
    });
  });
}
