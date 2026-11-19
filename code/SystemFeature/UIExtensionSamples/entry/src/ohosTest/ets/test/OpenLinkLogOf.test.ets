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
export default function openLinkLogOfTest(): void {
  describe('OpenLinkLogOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0001
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0001
     * @tc.desc      openLinkLogOf(stage="callback", code=0) returns "openLink callback result: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_OpenLinkLogOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0001 begin`);
      const actual: string = openLinkLogOf('callback', 0);
      logInfo(`openLinkLogOf(stage="callback", code=0): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 0');
      logInfo(`${BUNDLE}OpenLinkLogOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0002
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0002
     * @tc.desc      openLinkLogOf(stage="callback", code=200) returns "openLink callback result: 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_OpenLinkLogOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0002 begin`);
      const actual: string = openLinkLogOf('callback', 200);
      logInfo(`openLinkLogOf(stage="callback", code=200): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 200');
      logInfo(`${BUNDLE}OpenLinkLogOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0003
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0003
     * @tc.desc      openLinkLogOf(stage="callback", code=401) returns "openLink callback result: 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0003 begin`);
      const actual: string = openLinkLogOf('callback', 401);
      logInfo(`openLinkLogOf(stage="callback", code=401): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 401');
      logInfo(`${BUNDLE}OpenLinkLogOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0004
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0004
     * @tc.desc      openLinkLogOf(stage="callback", code=404) returns "openLink callback result: 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0004 begin`);
      const actual: string = openLinkLogOf('callback', 404);
      logInfo(`openLinkLogOf(stage="callback", code=404): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 404');
      logInfo(`${BUNDLE}OpenLinkLogOf_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0005
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0005
     * @tc.desc      openLinkLogOf(stage="callback", code=500) returns "openLink callback result: 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0005 begin`);
      const actual: string = openLinkLogOf('callback', 500);
      logInfo(`openLinkLogOf(stage="callback", code=500): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 500');
      logInfo(`${BUNDLE}OpenLinkLogOf_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0006
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0006
     * @tc.desc      openLinkLogOf(stage="callback", code=-1) returns "openLink callback result: -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0006 begin`);
      const actual: string = openLinkLogOf('callback', -1);
      logInfo(`openLinkLogOf(stage="callback", code=-1): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: -1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0007
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0007
     * @tc.desc      openLinkLogOf(stage="callback", code=1) returns "openLink callback result: 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0007 begin`);
      const actual: string = openLinkLogOf('callback', 1);
      logInfo(`openLinkLogOf(stage="callback", code=1): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0008
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0008
     * @tc.desc      openLinkLogOf(stage="callback", code=2) returns "openLink callback result: 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0008 begin`);
      const actual: string = openLinkLogOf('callback', 2);
      logInfo(`openLinkLogOf(stage="callback", code=2): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 2');
      logInfo(`${BUNDLE}OpenLinkLogOf_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0009
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0009
     * @tc.desc      openLinkLogOf(stage="callback", code=3) returns "openLink callback result: 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0009 begin`);
      const actual: string = openLinkLogOf('callback', 3);
      logInfo(`openLinkLogOf(stage="callback", code=3): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 3');
      logInfo(`${BUNDLE}OpenLinkLogOf_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0010
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0010
     * @tc.desc      openLinkLogOf(stage="callback", code=10) returns "openLink callback result: 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0010 begin`);
      const actual: string = openLinkLogOf('callback', 10);
      logInfo(`openLinkLogOf(stage="callback", code=10): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 10');
      logInfo(`${BUNDLE}OpenLinkLogOf_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0011
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0011
     * @tc.desc      openLinkLogOf(stage="callback", code=100) returns "openLink callback result: 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0011 begin`);
      const actual: string = openLinkLogOf('callback', 100);
      logInfo(`openLinkLogOf(stage="callback", code=100): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 100');
      logInfo(`${BUNDLE}OpenLinkLogOf_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0012
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0012
     * @tc.desc      openLinkLogOf(stage="callback", code=25) returns "openLink callback result: 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0012 begin`);
      const actual: string = openLinkLogOf('callback', 25);
      logInfo(`openLinkLogOf(stage="callback", code=25): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 25');
      logInfo(`${BUNDLE}OpenLinkLogOf_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0013
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0013
     * @tc.desc      openLinkLogOf(stage="callback", code=50) returns "openLink callback result: 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0013 begin`);
      const actual: string = openLinkLogOf('callback', 50);
      logInfo(`openLinkLogOf(stage="callback", code=50): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 50');
      logInfo(`${BUNDLE}OpenLinkLogOf_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0014
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0014
     * @tc.desc      openLinkLogOf(stage="callback", code=75) returns "openLink callback result: 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0014 begin`);
      const actual: string = openLinkLogOf('callback', 75);
      logInfo(`openLinkLogOf(stage="callback", code=75): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 75');
      logInfo(`${BUNDLE}OpenLinkLogOf_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0015
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0015
     * @tc.desc      openLinkLogOf(stage="callback", code=125) returns "openLink callback result: 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0015 begin`);
      const actual: string = openLinkLogOf('callback', 125);
      logInfo(`openLinkLogOf(stage="callback", code=125): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 125');
      logInfo(`${BUNDLE}OpenLinkLogOf_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0016
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0016
     * @tc.desc      openLinkLogOf(stage="callback", code=150) returns "openLink callback result: 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0016 begin`);
      const actual: string = openLinkLogOf('callback', 150);
      logInfo(`openLinkLogOf(stage="callback", code=150): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 150');
      logInfo(`${BUNDLE}OpenLinkLogOf_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0017
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0017
     * @tc.desc      openLinkLogOf(stage="callback", code=175) returns "openLink callback result: 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0017 begin`);
      const actual: string = openLinkLogOf('callback', 175);
      logInfo(`openLinkLogOf(stage="callback", code=175): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 175');
      logInfo(`${BUNDLE}OpenLinkLogOf_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0018
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0018
     * @tc.desc      openLinkLogOf(stage="callback", code=225) returns "openLink callback result: 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0018 begin`);
      const actual: string = openLinkLogOf('callback', 225);
      logInfo(`openLinkLogOf(stage="callback", code=225): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 225');
      logInfo(`${BUNDLE}OpenLinkLogOf_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0019
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0019
     * @tc.desc      openLinkLogOf(stage="callback", code=250) returns "openLink callback result: 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0019 begin`);
      const actual: string = openLinkLogOf('callback', 250);
      logInfo(`openLinkLogOf(stage="callback", code=250): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 250');
      logInfo(`${BUNDLE}OpenLinkLogOf_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0020
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0020
     * @tc.desc      openLinkLogOf(stage="callback", code=275) returns "openLink callback result: 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0020 begin`);
      const actual: string = openLinkLogOf('callback', 275);
      logInfo(`openLinkLogOf(stage="callback", code=275): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 275');
      logInfo(`${BUNDLE}OpenLinkLogOf_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0021
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0021
     * @tc.desc      openLinkLogOf(stage="callback", code=300) returns "openLink callback result: 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0021 begin`);
      const actual: string = openLinkLogOf('callback', 300);
      logInfo(`openLinkLogOf(stage="callback", code=300): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 300');
      logInfo(`${BUNDLE}OpenLinkLogOf_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0022
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0022
     * @tc.desc      openLinkLogOf(stage="callback", code=325) returns "openLink callback result: 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0022 begin`);
      const actual: string = openLinkLogOf('callback', 325);
      logInfo(`openLinkLogOf(stage="callback", code=325): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 325');
      logInfo(`${BUNDLE}OpenLinkLogOf_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0023
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0023
     * @tc.desc      openLinkLogOf(stage="callback", code=350) returns "openLink callback result: 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0023 begin`);
      const actual: string = openLinkLogOf('callback', 350);
      logInfo(`openLinkLogOf(stage="callback", code=350): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 350');
      logInfo(`${BUNDLE}OpenLinkLogOf_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0024
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0024
     * @tc.desc      openLinkLogOf(stage="callback", code=375) returns "openLink callback result: 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0024 begin`);
      const actual: string = openLinkLogOf('callback', 375);
      logInfo(`openLinkLogOf(stage="callback", code=375): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 375');
      logInfo(`${BUNDLE}OpenLinkLogOf_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0025
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0025
     * @tc.desc      openLinkLogOf(stage="callback", code=400) returns "openLink callback result: 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0025 begin`);
      const actual: string = openLinkLogOf('callback', 400);
      logInfo(`openLinkLogOf(stage="callback", code=400): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 400');
      logInfo(`${BUNDLE}OpenLinkLogOf_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0026
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0026
     * @tc.desc      openLinkLogOf(stage="callback", code=425) returns "openLink callback result: 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0026 begin`);
      const actual: string = openLinkLogOf('callback', 425);
      logInfo(`openLinkLogOf(stage="callback", code=425): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 425');
      logInfo(`${BUNDLE}OpenLinkLogOf_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0027
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0027
     * @tc.desc      openLinkLogOf(stage="callback", code=450) returns "openLink callback result: 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0027 begin`);
      const actual: string = openLinkLogOf('callback', 450);
      logInfo(`openLinkLogOf(stage="callback", code=450): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 450');
      logInfo(`${BUNDLE}OpenLinkLogOf_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0028
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0028
     * @tc.desc      openLinkLogOf(stage="callback", code=475) returns "openLink callback result: 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0028 begin`);
      const actual: string = openLinkLogOf('callback', 475);
      logInfo(`openLinkLogOf(stage="callback", code=475): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 475');
      logInfo(`${BUNDLE}OpenLinkLogOf_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0029
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0029
     * @tc.desc      openLinkLogOf(stage="callback", code=865) returns "openLink callback result: 865"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0029 begin`);
      const actual: string = openLinkLogOf('callback', 865);
      logInfo(`openLinkLogOf(stage="callback", code=865): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 865');
      logInfo(`${BUNDLE}OpenLinkLogOf_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0030
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0030
     * @tc.desc      openLinkLogOf(stage="callback", code=188.03) returns "openLink callback result: 188.03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0030 begin`);
      const actual: string = openLinkLogOf('callback', 188.03);
      logInfo(`openLinkLogOf(stage="callback", code=188.03): actual=${actual}`);
      expect(actual).assertEqual('openLink callback result: 188.03');
      logInfo(`${BUNDLE}OpenLinkLogOf_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0031
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0031
     * @tc.desc      openLinkLogOf(stage="failed", code=0) returns "open link failed, errCode : 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0031 begin`);
      const actual: string = openLinkLogOf('failed', 0);
      logInfo(`openLinkLogOf(stage="failed", code=0): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 0');
      logInfo(`${BUNDLE}OpenLinkLogOf_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0032
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0032
     * @tc.desc      openLinkLogOf(stage="failed", code=200) returns "open link failed, errCode : 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0032 begin`);
      const actual: string = openLinkLogOf('failed', 200);
      logInfo(`openLinkLogOf(stage="failed", code=200): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 200');
      logInfo(`${BUNDLE}OpenLinkLogOf_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0033
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0033
     * @tc.desc      openLinkLogOf(stage="failed", code=401) returns "open link failed, errCode : 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0033 begin`);
      const actual: string = openLinkLogOf('failed', 401);
      logInfo(`openLinkLogOf(stage="failed", code=401): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 401');
      logInfo(`${BUNDLE}OpenLinkLogOf_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0034
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0034
     * @tc.desc      openLinkLogOf(stage="failed", code=404) returns "open link failed, errCode : 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0034 begin`);
      const actual: string = openLinkLogOf('failed', 404);
      logInfo(`openLinkLogOf(stage="failed", code=404): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 404');
      logInfo(`${BUNDLE}OpenLinkLogOf_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0035
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0035
     * @tc.desc      openLinkLogOf(stage="failed", code=500) returns "open link failed, errCode : 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0035 begin`);
      const actual: string = openLinkLogOf('failed', 500);
      logInfo(`openLinkLogOf(stage="failed", code=500): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 500');
      logInfo(`${BUNDLE}OpenLinkLogOf_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0036
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0036
     * @tc.desc      openLinkLogOf(stage="failed", code=-1) returns "open link failed, errCode : -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0036 begin`);
      const actual: string = openLinkLogOf('failed', -1);
      logInfo(`openLinkLogOf(stage="failed", code=-1): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : -1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0037
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0037
     * @tc.desc      openLinkLogOf(stage="failed", code=1) returns "open link failed, errCode : 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0037 begin`);
      const actual: string = openLinkLogOf('failed', 1);
      logInfo(`openLinkLogOf(stage="failed", code=1): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0038
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0038
     * @tc.desc      openLinkLogOf(stage="failed", code=2) returns "open link failed, errCode : 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0038 begin`);
      const actual: string = openLinkLogOf('failed', 2);
      logInfo(`openLinkLogOf(stage="failed", code=2): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 2');
      logInfo(`${BUNDLE}OpenLinkLogOf_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0039
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0039
     * @tc.desc      openLinkLogOf(stage="failed", code=3) returns "open link failed, errCode : 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0039 begin`);
      const actual: string = openLinkLogOf('failed', 3);
      logInfo(`openLinkLogOf(stage="failed", code=3): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 3');
      logInfo(`${BUNDLE}OpenLinkLogOf_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0040
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0040
     * @tc.desc      openLinkLogOf(stage="failed", code=10) returns "open link failed, errCode : 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0040 begin`);
      const actual: string = openLinkLogOf('failed', 10);
      logInfo(`openLinkLogOf(stage="failed", code=10): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 10');
      logInfo(`${BUNDLE}OpenLinkLogOf_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0041
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0041
     * @tc.desc      openLinkLogOf(stage="failed", code=100) returns "open link failed, errCode : 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0041 begin`);
      const actual: string = openLinkLogOf('failed', 100);
      logInfo(`openLinkLogOf(stage="failed", code=100): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 100');
      logInfo(`${BUNDLE}OpenLinkLogOf_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0042
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0042
     * @tc.desc      openLinkLogOf(stage="failed", code=25) returns "open link failed, errCode : 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0042 begin`);
      const actual: string = openLinkLogOf('failed', 25);
      logInfo(`openLinkLogOf(stage="failed", code=25): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 25');
      logInfo(`${BUNDLE}OpenLinkLogOf_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0043
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0043
     * @tc.desc      openLinkLogOf(stage="failed", code=50) returns "open link failed, errCode : 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0043 begin`);
      const actual: string = openLinkLogOf('failed', 50);
      logInfo(`openLinkLogOf(stage="failed", code=50): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 50');
      logInfo(`${BUNDLE}OpenLinkLogOf_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0044
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0044
     * @tc.desc      openLinkLogOf(stage="failed", code=75) returns "open link failed, errCode : 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0044 begin`);
      const actual: string = openLinkLogOf('failed', 75);
      logInfo(`openLinkLogOf(stage="failed", code=75): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 75');
      logInfo(`${BUNDLE}OpenLinkLogOf_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0045
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0045
     * @tc.desc      openLinkLogOf(stage="failed", code=125) returns "open link failed, errCode : 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0045 begin`);
      const actual: string = openLinkLogOf('failed', 125);
      logInfo(`openLinkLogOf(stage="failed", code=125): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 125');
      logInfo(`${BUNDLE}OpenLinkLogOf_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0046
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0046
     * @tc.desc      openLinkLogOf(stage="failed", code=150) returns "open link failed, errCode : 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0046 begin`);
      const actual: string = openLinkLogOf('failed', 150);
      logInfo(`openLinkLogOf(stage="failed", code=150): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 150');
      logInfo(`${BUNDLE}OpenLinkLogOf_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0047
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0047
     * @tc.desc      openLinkLogOf(stage="failed", code=175) returns "open link failed, errCode : 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0047 begin`);
      const actual: string = openLinkLogOf('failed', 175);
      logInfo(`openLinkLogOf(stage="failed", code=175): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 175');
      logInfo(`${BUNDLE}OpenLinkLogOf_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0048
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0048
     * @tc.desc      openLinkLogOf(stage="failed", code=225) returns "open link failed, errCode : 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0048 begin`);
      const actual: string = openLinkLogOf('failed', 225);
      logInfo(`openLinkLogOf(stage="failed", code=225): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 225');
      logInfo(`${BUNDLE}OpenLinkLogOf_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0049
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0049
     * @tc.desc      openLinkLogOf(stage="failed", code=250) returns "open link failed, errCode : 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0049 begin`);
      const actual: string = openLinkLogOf('failed', 250);
      logInfo(`openLinkLogOf(stage="failed", code=250): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 250');
      logInfo(`${BUNDLE}OpenLinkLogOf_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0050
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0050
     * @tc.desc      openLinkLogOf(stage="failed", code=275) returns "open link failed, errCode : 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0050 begin`);
      const actual: string = openLinkLogOf('failed', 275);
      logInfo(`openLinkLogOf(stage="failed", code=275): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 275');
      logInfo(`${BUNDLE}OpenLinkLogOf_0050 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0051
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0051
     * @tc.desc      openLinkLogOf(stage="failed", code=300) returns "open link failed, errCode : 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0051 begin`);
      const actual: string = openLinkLogOf('failed', 300);
      logInfo(`openLinkLogOf(stage="failed", code=300): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 300');
      logInfo(`${BUNDLE}OpenLinkLogOf_0051 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0052
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0052
     * @tc.desc      openLinkLogOf(stage="failed", code=325) returns "open link failed, errCode : 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0052 begin`);
      const actual: string = openLinkLogOf('failed', 325);
      logInfo(`openLinkLogOf(stage="failed", code=325): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 325');
      logInfo(`${BUNDLE}OpenLinkLogOf_0052 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0053
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0053
     * @tc.desc      openLinkLogOf(stage="failed", code=350) returns "open link failed, errCode : 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0053 begin`);
      const actual: string = openLinkLogOf('failed', 350);
      logInfo(`openLinkLogOf(stage="failed", code=350): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 350');
      logInfo(`${BUNDLE}OpenLinkLogOf_0053 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0054
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0054
     * @tc.desc      openLinkLogOf(stage="failed", code=375) returns "open link failed, errCode : 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0054 begin`);
      const actual: string = openLinkLogOf('failed', 375);
      logInfo(`openLinkLogOf(stage="failed", code=375): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 375');
      logInfo(`${BUNDLE}OpenLinkLogOf_0054 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0055
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0055
     * @tc.desc      openLinkLogOf(stage="failed", code=400) returns "open link failed, errCode : 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0055 begin`);
      const actual: string = openLinkLogOf('failed', 400);
      logInfo(`openLinkLogOf(stage="failed", code=400): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 400');
      logInfo(`${BUNDLE}OpenLinkLogOf_0055 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0056
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0056
     * @tc.desc      openLinkLogOf(stage="failed", code=425) returns "open link failed, errCode : 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0056 begin`);
      const actual: string = openLinkLogOf('failed', 425);
      logInfo(`openLinkLogOf(stage="failed", code=425): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 425');
      logInfo(`${BUNDLE}OpenLinkLogOf_0056 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0057
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0057
     * @tc.desc      openLinkLogOf(stage="failed", code=450) returns "open link failed, errCode : 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0057 begin`);
      const actual: string = openLinkLogOf('failed', 450);
      logInfo(`openLinkLogOf(stage="failed", code=450): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 450');
      logInfo(`${BUNDLE}OpenLinkLogOf_0057 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0058
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0058
     * @tc.desc      openLinkLogOf(stage="failed", code=475) returns "open link failed, errCode : 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0058 begin`);
      const actual: string = openLinkLogOf('failed', 475);
      logInfo(`openLinkLogOf(stage="failed", code=475): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 475');
      logInfo(`${BUNDLE}OpenLinkLogOf_0058 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0059
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0059
     * @tc.desc      openLinkLogOf(stage="failed", code=865) returns "open link failed, errCode : 865"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0059 begin`);
      const actual: string = openLinkLogOf('failed', 865);
      logInfo(`openLinkLogOf(stage="failed", code=865): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 865');
      logInfo(`${BUNDLE}OpenLinkLogOf_0059 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0060
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0060
     * @tc.desc      openLinkLogOf(stage="failed", code=188.03) returns "open link failed, errCode : 188.03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_OpenLinkLogOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0060 begin`);
      const actual: string = openLinkLogOf('failed', 188.03);
      logInfo(`openLinkLogOf(stage="failed", code=188.03): actual=${actual}`);
      expect(actual).assertEqual('open link failed, errCode : 188.03');
      logInfo(`${BUNDLE}OpenLinkLogOf_0060 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0061
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0061
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=0) returns "exception occurred, errCode : 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0061 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 0);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=0): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 0');
      logInfo(`${BUNDLE}OpenLinkLogOf_0061 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0062
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0062
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=200) returns "exception occurred, errCode : 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0062 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 200);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=200): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 200');
      logInfo(`${BUNDLE}OpenLinkLogOf_0062 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0063
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0063
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=401) returns "exception occurred, errCode : 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0063 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 401);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=401): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 401');
      logInfo(`${BUNDLE}OpenLinkLogOf_0063 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0064
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0064
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=404) returns "exception occurred, errCode : 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0064 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 404);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=404): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 404');
      logInfo(`${BUNDLE}OpenLinkLogOf_0064 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0065
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0065
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=500) returns "exception occurred, errCode : 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0065 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 500);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=500): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 500');
      logInfo(`${BUNDLE}OpenLinkLogOf_0065 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0066
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0066
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=-1) returns "exception occurred, errCode : -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0066 begin`);
      const actual: string = openLinkLogOf('CALLBACK', -1);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=-1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : -1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0066 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0067
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0067
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=1) returns "exception occurred, errCode : 1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0067 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 1);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0067 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0068
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0068
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=2) returns "exception occurred, errCode : 2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0068 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 2);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=2): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 2');
      logInfo(`${BUNDLE}OpenLinkLogOf_0068 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0069
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0069
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=3) returns "exception occurred, errCode : 3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0069 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 3);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=3): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 3');
      logInfo(`${BUNDLE}OpenLinkLogOf_0069 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0070
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0070
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=10) returns "exception occurred, errCode : 10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0070 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 10);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=10): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 10');
      logInfo(`${BUNDLE}OpenLinkLogOf_0070 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0071
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0071
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=100) returns "exception occurred, errCode : 100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0071 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 100);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=100): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 100');
      logInfo(`${BUNDLE}OpenLinkLogOf_0071 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0072
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0072
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=25) returns "exception occurred, errCode : 25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0072 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 25);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=25): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 25');
      logInfo(`${BUNDLE}OpenLinkLogOf_0072 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0073
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0073
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=50) returns "exception occurred, errCode : 50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0073 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 50);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=50): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 50');
      logInfo(`${BUNDLE}OpenLinkLogOf_0073 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0074
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0074
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=75) returns "exception occurred, errCode : 75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0074 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 75);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=75): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 75');
      logInfo(`${BUNDLE}OpenLinkLogOf_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0075
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0075
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=125) returns "exception occurred, errCode : 125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0075 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 125);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=125): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 125');
      logInfo(`${BUNDLE}OpenLinkLogOf_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0076
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0076
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=150) returns "exception occurred, errCode : 150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0076 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 150);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=150): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 150');
      logInfo(`${BUNDLE}OpenLinkLogOf_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0077
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0077
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=175) returns "exception occurred, errCode : 175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0077 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 175);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=175): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 175');
      logInfo(`${BUNDLE}OpenLinkLogOf_0077 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0078
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0078
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=225) returns "exception occurred, errCode : 225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0078 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 225);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=225): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 225');
      logInfo(`${BUNDLE}OpenLinkLogOf_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0079
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0079
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=250) returns "exception occurred, errCode : 250"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0079 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 250);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=250): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 250');
      logInfo(`${BUNDLE}OpenLinkLogOf_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0080
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0080
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=275) returns "exception occurred, errCode : 275"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0080 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 275);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=275): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 275');
      logInfo(`${BUNDLE}OpenLinkLogOf_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0081
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0081
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=300) returns "exception occurred, errCode : 300"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0081 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 300);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=300): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 300');
      logInfo(`${BUNDLE}OpenLinkLogOf_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0082
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0082
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=325) returns "exception occurred, errCode : 325"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0082 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 325);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=325): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 325');
      logInfo(`${BUNDLE}OpenLinkLogOf_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0083
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0083
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=350) returns "exception occurred, errCode : 350"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0083 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 350);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=350): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 350');
      logInfo(`${BUNDLE}OpenLinkLogOf_0083 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0084
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0084
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=375) returns "exception occurred, errCode : 375"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0084 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 375);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=375): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 375');
      logInfo(`${BUNDLE}OpenLinkLogOf_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0085
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0085
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=400) returns "exception occurred, errCode : 400"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0085 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 400);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=400): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 400');
      logInfo(`${BUNDLE}OpenLinkLogOf_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0086
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0086
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=425) returns "exception occurred, errCode : 425"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0086 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 425);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=425): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 425');
      logInfo(`${BUNDLE}OpenLinkLogOf_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0087
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0087
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=450) returns "exception occurred, errCode : 450"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0087 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 450);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=450): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 450');
      logInfo(`${BUNDLE}OpenLinkLogOf_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0088
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0088
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=475) returns "exception occurred, errCode : 475"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0088 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 475);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=475): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 475');
      logInfo(`${BUNDLE}OpenLinkLogOf_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0089
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0089
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=865) returns "exception occurred, errCode : 865"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0089 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 865);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=865): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 865');
      logInfo(`${BUNDLE}OpenLinkLogOf_0089 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0090
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0090
     * @tc.desc      openLinkLogOf(stage="CALLBACK", code=188.03) returns "exception occurred, errCode : 188.03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0090 begin`);
      const actual: string = openLinkLogOf('CALLBACK', 188.03);
      logInfo(`openLinkLogOf(stage="CALLBACK", code=188.03): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 188.03');
      logInfo(`${BUNDLE}OpenLinkLogOf_0090 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0091
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0091
     * @tc.desc      openLinkLogOf(stage="callbac", code=0) returns "exception occurred, errCode : 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0091 begin`);
      const actual: string = openLinkLogOf('callbac', 0);
      logInfo(`openLinkLogOf(stage="callbac", code=0): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 0');
      logInfo(`${BUNDLE}OpenLinkLogOf_0091 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0092
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0092
     * @tc.desc      openLinkLogOf(stage="callbac", code=200) returns "exception occurred, errCode : 200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0092 begin`);
      const actual: string = openLinkLogOf('callbac', 200);
      logInfo(`openLinkLogOf(stage="callbac", code=200): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 200');
      logInfo(`${BUNDLE}OpenLinkLogOf_0092 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0093
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0093
     * @tc.desc      openLinkLogOf(stage="callbac", code=401) returns "exception occurred, errCode : 401"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0093 begin`);
      const actual: string = openLinkLogOf('callbac', 401);
      logInfo(`openLinkLogOf(stage="callbac", code=401): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 401');
      logInfo(`${BUNDLE}OpenLinkLogOf_0093 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0094
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0094
     * @tc.desc      openLinkLogOf(stage="callbac", code=404) returns "exception occurred, errCode : 404"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0094 begin`);
      const actual: string = openLinkLogOf('callbac', 404);
      logInfo(`openLinkLogOf(stage="callbac", code=404): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 404');
      logInfo(`${BUNDLE}OpenLinkLogOf_0094 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0095
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0095
     * @tc.desc      openLinkLogOf(stage="callbac", code=500) returns "exception occurred, errCode : 500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0095 begin`);
      const actual: string = openLinkLogOf('callbac', 500);
      logInfo(`openLinkLogOf(stage="callbac", code=500): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : 500');
      logInfo(`${BUNDLE}OpenLinkLogOf_0095 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_OPEN_LINK_LOG_OF_0096
     * @tc.name      UIExtensionSamples_OpenLinkLogOf_0096
     * @tc.desc      openLinkLogOf(stage="callbac", code=-1) returns "exception occurred, errCode : -1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_OpenLinkLogOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}OpenLinkLogOf_0096 begin`);
      const actual: string = openLinkLogOf('callbac', -1);
      logInfo(`openLinkLogOf(stage="callbac", code=-1): actual=${actual}`);
      expect(actual).assertEqual('exception occurred, errCode : -1');
      logInfo(`${BUNDLE}OpenLinkLogOf_0096 end`);
    });
  });
}
