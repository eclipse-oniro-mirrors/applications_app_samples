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
import { contentPageOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for contentPageOf (50 cases). */
export default function contentPageOfTest(): void {
  describe('ContentPageOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0001
     * @tc.name      UIExtensionSamples_ContentPageOf_0001
     * @tc.desc      contentPageOf(abilityName="OpenLinkUIAbility") returns "pages/OpenLinkIndex"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ContentPageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ContentPageOf_0001 begin`);
      const actual: string = contentPageOf('OpenLinkUIAbility');
      logInfo(`contentPageOf(abilityName="OpenLinkUIAbil...: actual=${actual}`);
      expect(actual).assertEqual('pages/OpenLinkIndex');
      logInfo(`${BUNDLE}ContentPageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0002
     * @tc.name      UIExtensionSamples_ContentPageOf_0002
     * @tc.desc      contentPageOf(abilityName="OPENLINKUIABILITY") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ContentPageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ContentPageOf_0002 begin`);
      const actual: string = contentPageOf('OPENLINKUIABILITY');
      logInfo(`contentPageOf(abilityName="OPENLINKUIABIL...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0003
     * @tc.name      UIExtensionSamples_ContentPageOf_0003
     * @tc.desc      contentPageOf(abilityName="OpenLinkUIAbilit") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0003 begin`);
      const actual: string = contentPageOf('OpenLinkUIAbilit');
      logInfo(`contentPageOf(abilityName="OpenLinkUIAbil...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0004
     * @tc.name      UIExtensionSamples_ContentPageOf_0004
     * @tc.desc      contentPageOf(abilityName="OpenLinkUIAbilityx") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0004 begin`);
      const actual: string = contentPageOf('OpenLinkUIAbilityx');
      logInfo(`contentPageOf(abilityName="OpenLinkUIAbil...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0005
     * @tc.name      UIExtensionSamples_ContentPageOf_0005
     * @tc.desc      contentPageOf(abilityName="Hello") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0005 begin`);
      const actual: string = contentPageOf('Hello');
      logInfo(`contentPageOf(abilityName="Hello"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0006
     * @tc.name      UIExtensionSamples_ContentPageOf_0006
     * @tc.desc      contentPageOf(abilityName="hello world") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0006 begin`);
      const actual: string = contentPageOf('hello world');
      logInfo(`contentPageOf(abilityName="hello world"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0007
     * @tc.name      UIExtensionSamples_ContentPageOf_0007
     * @tc.desc      contentPageOf(abilityName="") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0007 begin`);
      const actual: string = contentPageOf('');
      logInfo(`contentPageOf(abilityName=""): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0008
     * @tc.name      UIExtensionSamples_ContentPageOf_0008
     * @tc.desc      contentPageOf(abilityName=" ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0008 begin`);
      const actual: string = contentPageOf(' ');
      logInfo(`contentPageOf(abilityName=" "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0009
     * @tc.name      UIExtensionSamples_ContentPageOf_0009
     * @tc.desc      contentPageOf(abilityName="A") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0009 begin`);
      const actual: string = contentPageOf('A');
      logInfo(`contentPageOf(abilityName="A"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0010
     * @tc.name      UIExtensionSamples_ContentPageOf_0010
     * @tc.desc      contentPageOf(abilityName="Sample Title 123") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0010 begin`);
      const actual: string = contentPageOf('Sample Title 123');
      logInfo(`contentPageOf(abilityName="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0011
     * @tc.name      UIExtensionSamples_ContentPageOf_0011
     * @tc.desc      contentPageOf(abilityName="??") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0011 begin`);
      const actual: string = contentPageOf('\u4e2d\u6587');
      logInfo(`contentPageOf(abilityName="??"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0012
     * @tc.name      UIExtensionSamples_ContentPageOf_0012
     * @tc.desc      contentPageOf(abilityName="a") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0012 begin`);
      const actual: string = contentPageOf('a');
      logInfo(`contentPageOf(abilityName="a"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0013
     * @tc.name      UIExtensionSamples_ContentPageOf_0013
     * @tc.desc      contentPageOf(abilityName="abc") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0013 begin`);
      const actual: string = contentPageOf('abc');
      logInfo(`contentPageOf(abilityName="abc"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0014
     * @tc.name      UIExtensionSamples_ContentPageOf_0014
     * @tc.desc      contentPageOf(abilityName="Hello World") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0014 begin`);
      const actual: string = contentPageOf('Hello World');
      logInfo(`contentPageOf(abilityName="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0015
     * @tc.name      UIExtensionSamples_ContentPageOf_0015
     * @tc.desc      contentPageOf(abilityName="123") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0015 begin`);
      const actual: string = contentPageOf('123');
      logInfo(`contentPageOf(abilityName="123"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0016
     * @tc.name      UIExtensionSamples_ContentPageOf_0016
     * @tc.desc      contentPageOf(abilityName=" OpenLinkUIAbility ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0016 begin`);
      const actual: string = contentPageOf(' OpenLinkUIAbility ');
      logInfo(`contentPageOf(abilityName=" OpenLinkUIAbi...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0017
     * @tc.name      UIExtensionSamples_ContentPageOf_0017
     * @tc.desc      contentPageOf(abilityName="OpenLinkUIAbilityOpenLinkUIAbility") returns "uiextensionpages/UIExte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0017 begin`);
      const actual: string = contentPageOf('OpenLinkUIAbilityOpenLinkUIAbility');
      logInfo(`contentPageOf(abilityName="OpenLinkUIAbil...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0018
     * @tc.name      UIExtensionSamples_ContentPageOf_0018
     * @tc.desc      contentPageOf(abilityName="OpenLinkUIAbility_1") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0018 begin`);
      const actual: string = contentPageOf('OpenLinkUIAbility_1');
      logInfo(`contentPageOf(abilityName="OpenLinkUIAbil...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0019
     * @tc.name      UIExtensionSamples_ContentPageOf_0019
     * @tc.desc      contentPageOf(abilityName="xOpenLinkUIAbility") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0019 begin`);
      const actual: string = contentPageOf('xOpenLinkUIAbility');
      logInfo(`contentPageOf(abilityName="xOpenLinkUIAbi...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0020
     * @tc.name      UIExtensionSamples_ContentPageOf_0020
     * @tc.desc      contentPageOf(abilityName=" OPENLINKUIABILITY ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0020 begin`);
      const actual: string = contentPageOf(' OPENLINKUIABILITY ');
      logInfo(`contentPageOf(abilityName=" OPENLINKUIABI...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0021
     * @tc.name      UIExtensionSamples_ContentPageOf_0021
     * @tc.desc      contentPageOf(abilityName="OPENLINKUIABILITYOPENLINKUIABILITY") returns "uiextensionpages/UIExte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0021 begin`);
      const actual: string = contentPageOf('OPENLINKUIABILITYOPENLINKUIABILITY');
      logInfo(`contentPageOf(abilityName="OPENLINKUIABIL...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0022
     * @tc.name      UIExtensionSamples_ContentPageOf_0022
     * @tc.desc      contentPageOf(abilityName="OPENLINKUIABILITY_1") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0022 begin`);
      const actual: string = contentPageOf('OPENLINKUIABILITY_1');
      logInfo(`contentPageOf(abilityName="OPENLINKUIABIL...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0023
     * @tc.name      UIExtensionSamples_ContentPageOf_0023
     * @tc.desc      contentPageOf(abilityName="xOPENLINKUIABILITY") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0023 begin`);
      const actual: string = contentPageOf('xOPENLINKUIABILITY');
      logInfo(`contentPageOf(abilityName="xOPENLINKUIABI...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0024
     * @tc.name      UIExtensionSamples_ContentPageOf_0024
     * @tc.desc      contentPageOf(abilityName=" OpenLinkUIAbilit ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0024 begin`);
      const actual: string = contentPageOf(' OpenLinkUIAbilit ');
      logInfo(`contentPageOf(abilityName=" OpenLinkUIAbi...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0025
     * @tc.name      UIExtensionSamples_ContentPageOf_0025
     * @tc.desc      contentPageOf(abilityName="OpenLinkUIAbilitOpenLinkUIAbilit") returns "uiextensionpages/UIExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0025 begin`);
      const actual: string = contentPageOf('OpenLinkUIAbilitOpenLinkUIAbilit');
      logInfo(`contentPageOf(abilityName="OpenLinkUIAbil...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0026
     * @tc.name      UIExtensionSamples_ContentPageOf_0026
     * @tc.desc      contentPageOf(abilityName="OpenLinkUIAbilit_1") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0026 begin`);
      const actual: string = contentPageOf('OpenLinkUIAbilit_1');
      logInfo(`contentPageOf(abilityName="OpenLinkUIAbil...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0027
     * @tc.name      UIExtensionSamples_ContentPageOf_0027
     * @tc.desc      contentPageOf(abilityName="xOpenLinkUIAbilit") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0027 begin`);
      const actual: string = contentPageOf('xOpenLinkUIAbilit');
      logInfo(`contentPageOf(abilityName="xOpenLinkUIAbi...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0028
     * @tc.name      UIExtensionSamples_ContentPageOf_0028
     * @tc.desc      contentPageOf(abilityName=" OpenLinkUIAbilityx ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0028 begin`);
      const actual: string = contentPageOf(' OpenLinkUIAbilityx ');
      logInfo(`contentPageOf(abilityName=" OpenLinkUIAbi...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0029
     * @tc.name      UIExtensionSamples_ContentPageOf_0029
     * @tc.desc      contentPageOf(abilityName="OpenLinkUIAbilityxOpenLinkUIAbilityx") returns "uiextensionpages/UIEx...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0029 begin`);
      const actual: string = contentPageOf('OpenLinkUIAbilityxOpenLinkUIAbilityx');
      logInfo(`contentPageOf(abilityName="OpenLinkUIAbil...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0030
     * @tc.name      UIExtensionSamples_ContentPageOf_0030
     * @tc.desc      contentPageOf(abilityName="OpenLinkUIAbilityx_1") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0030 begin`);
      const actual: string = contentPageOf('OpenLinkUIAbilityx_1');
      logInfo(`contentPageOf(abilityName="OpenLinkUIAbil...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0031
     * @tc.name      UIExtensionSamples_ContentPageOf_0031
     * @tc.desc      contentPageOf(abilityName="xOpenLinkUIAbilityx") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0031 begin`);
      const actual: string = contentPageOf('xOpenLinkUIAbilityx');
      logInfo(`contentPageOf(abilityName="xOpenLinkUIAbi...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0032
     * @tc.name      UIExtensionSamples_ContentPageOf_0032
     * @tc.desc      contentPageOf(abilityName=" Hello ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0032 begin`);
      const actual: string = contentPageOf(' Hello ');
      logInfo(`contentPageOf(abilityName=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0033
     * @tc.name      UIExtensionSamples_ContentPageOf_0033
     * @tc.desc      contentPageOf(abilityName="HelloHello") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0033 begin`);
      const actual: string = contentPageOf('HelloHello');
      logInfo(`contentPageOf(abilityName="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0034
     * @tc.name      UIExtensionSamples_ContentPageOf_0034
     * @tc.desc      contentPageOf(abilityName="Hello_1") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0034 begin`);
      const actual: string = contentPageOf('Hello_1');
      logInfo(`contentPageOf(abilityName="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0035
     * @tc.name      UIExtensionSamples_ContentPageOf_0035
     * @tc.desc      contentPageOf(abilityName="xHello") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0035 begin`);
      const actual: string = contentPageOf('xHello');
      logInfo(`contentPageOf(abilityName="xHello"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0036
     * @tc.name      UIExtensionSamples_ContentPageOf_0036
     * @tc.desc      contentPageOf(abilityName=" hello world ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0036 begin`);
      const actual: string = contentPageOf(' hello world ');
      logInfo(`contentPageOf(abilityName=" hello world "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0037
     * @tc.name      UIExtensionSamples_ContentPageOf_0037
     * @tc.desc      contentPageOf(abilityName="hello worldhello world") returns "uiextensionpages/UIExtensionContext...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0037 begin`);
      const actual: string = contentPageOf('hello worldhello world');
      logInfo(`contentPageOf(abilityName="hello worldhel...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0038
     * @tc.name      UIExtensionSamples_ContentPageOf_0038
     * @tc.desc      contentPageOf(abilityName="hello world_1") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0038 begin`);
      const actual: string = contentPageOf('hello world_1');
      logInfo(`contentPageOf(abilityName="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0039
     * @tc.name      UIExtensionSamples_ContentPageOf_0039
     * @tc.desc      contentPageOf(abilityName="xhello world") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0039 begin`);
      const actual: string = contentPageOf('xhello world');
      logInfo(`contentPageOf(abilityName="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0040
     * @tc.name      UIExtensionSamples_ContentPageOf_0040
     * @tc.desc      contentPageOf(abilityName="   ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0040 begin`);
      const actual: string = contentPageOf('   ');
      logInfo(`contentPageOf(abilityName="   "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0041
     * @tc.name      UIExtensionSamples_ContentPageOf_0041
     * @tc.desc      contentPageOf(abilityName="  ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0041 begin`);
      const actual: string = contentPageOf('  ');
      logInfo(`contentPageOf(abilityName="  "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0042
     * @tc.name      UIExtensionSamples_ContentPageOf_0042
     * @tc.desc      contentPageOf(abilityName=" _1") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0042 begin`);
      const actual: string = contentPageOf(' _1');
      logInfo(`contentPageOf(abilityName=" _1"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0043
     * @tc.name      UIExtensionSamples_ContentPageOf_0043
     * @tc.desc      contentPageOf(abilityName="x ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0043 begin`);
      const actual: string = contentPageOf('x ');
      logInfo(`contentPageOf(abilityName="x "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0044
     * @tc.name      UIExtensionSamples_ContentPageOf_0044
     * @tc.desc      contentPageOf(abilityName=" A ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0044 begin`);
      const actual: string = contentPageOf(' A ');
      logInfo(`contentPageOf(abilityName=" A "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0045
     * @tc.name      UIExtensionSamples_ContentPageOf_0045
     * @tc.desc      contentPageOf(abilityName="AA") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0045 begin`);
      const actual: string = contentPageOf('AA');
      logInfo(`contentPageOf(abilityName="AA"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0046
     * @tc.name      UIExtensionSamples_ContentPageOf_0046
     * @tc.desc      contentPageOf(abilityName="A_1") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0046 begin`);
      const actual: string = contentPageOf('A_1');
      logInfo(`contentPageOf(abilityName="A_1"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0047
     * @tc.name      UIExtensionSamples_ContentPageOf_0047
     * @tc.desc      contentPageOf(abilityName="xA") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0047 begin`);
      const actual: string = contentPageOf('xA');
      logInfo(`contentPageOf(abilityName="xA"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0048
     * @tc.name      UIExtensionSamples_ContentPageOf_0048
     * @tc.desc      contentPageOf(abilityName=" Sample Title 123 ") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ContentPageOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ContentPageOf_0048 begin`);
      const actual: string = contentPageOf(' Sample Title 123 ');
      logInfo(`contentPageOf(abilityName=" Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0049
     * @tc.name      UIExtensionSamples_ContentPageOf_0049
     * @tc.desc      contentPageOf(abilityName="Sample Title 123Sample Title 123") returns "uiextensionpages/UIExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0049 begin`);
      const actual: string = contentPageOf('Sample Title 123Sample Title 123');
      logInfo(`contentPageOf(abilityName="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_CONTENT_PAGE_OF_0050
     * @tc.name      UIExtensionSamples_ContentPageOf_0050
     * @tc.desc      contentPageOf(abilityName="Sample Title 123_1") returns "uiextensionpages/UIExtensionContextPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ContentPageOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ContentPageOf_0050 begin`);
      const actual: string = contentPageOf('Sample Title 123_1');
      logInfo(`contentPageOf(abilityName="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UIExtensionContextPage');
      logInfo(`${BUNDLE}ContentPageOf_0050 end`);
    });
  });
}
