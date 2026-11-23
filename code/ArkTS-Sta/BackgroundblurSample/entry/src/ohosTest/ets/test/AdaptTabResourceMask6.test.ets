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

import { describe, it, expect } from '@ohos/hypium';
import { TabResourceFixture } from '../fixtures/TabInfoFixture';

// Reference: ets/test/Validation/PointerUtilValidation.test.ets (1170 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptTabResourceMask6Tests(): void {
  describe('AdaptTabResourceMask6Test', (): void => {
    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0001
    // @tc.name AdaptTabResourceMask6_0001
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"Home"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0001', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "Home";
      const literalSelected: string = "selected:Home";
      const literalDefault: string = "default:Home";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0002
    // @tc.name AdaptTabResourceMask6_0002
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"Discover"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0002', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "Discover";
      const literalSelected: string = "selected:Discover";
      const literalDefault: string = "default:Discover";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0003
    // @tc.name AdaptTabResourceMask6_0003
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"Account"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0003', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "Account";
      const literalSelected: string = "selected:Account";
      const literalDefault: string = "default:Account";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0004
    // @tc.name AdaptTabResourceMask6_0004
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"0123456789"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0004', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "0123456789";
      const literalSelected: string = "selected:0123456789";
      const literalDefault: string = "default:0123456789";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0005
    // @tc.name AdaptTabResourceMask6_0005
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":""}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0005', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "";
      const literalSelected: string = "selected:";
      const literalDefault: string = "default:";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0006
    // @tc.name AdaptTabResourceMask6_0006
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":" "}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0006', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = " ";
      const literalSelected: string = "selected: ";
      const literalDefault: string = "default: ";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0007
    // @tc.name AdaptTabResourceMask6_0007
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"  Home  "}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0007', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "  Home  ";
      const literalSelected: string = "selected:  Home  ";
      const literalDefault: string = "default:  Home  ";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0008
    // @tc.name AdaptTabResourceMask6_0008
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"Line one\nLine two"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0008', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "Line one\nLine two";
      const literalSelected: string = "selected:Line one\nLine two";
      const literalDefault: string = "default:Line one\nLine two";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0009
    // @tc.name AdaptTabResourceMask6_0009
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"\u80cc\u666f\u6a21\u7cca"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0009', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "\u80cc\u666f\u6a21\u7cca";
      const literalSelected: string = "selected:\u80cc\u666f\u6a21\u7cca";
      const literalDefault: string = "default:\u80cc\u666f\u6a21\u7cca";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0010
    // @tc.name AdaptTabResourceMask6_0010
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0010', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629";
      const literalSelected: string = "selected:\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629";
      const literalDefault: string = "default:\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0011
    // @tc.name AdaptTabResourceMask6_0011
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"e\u0301"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0011', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "e\u0301";
      const literalSelected: string = "selected:e\u0301";
      const literalDefault: string = "default:e\u0301";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0012
    // @tc.name AdaptTabResourceMask6_0012
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"\ud83d\ude80"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0012', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "\ud83d\ude80";
      const literalSelected: string = "selected:\ud83d\ude80";
      const literalDefault: string = "default:\ud83d\ude80";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0013
    // @tc.name AdaptTabResourceMask6_0013
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"<b>Tab</b>"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0013', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "<b>Tab</b>";
      const literalSelected: string = "selected:<b>Tab</b>";
      const literalDefault: string = "default:<b>Tab</b>";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0014
    // @tc.name AdaptTabResourceMask6_0014
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"$r(app.string.tab)"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0014', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "$r(app.string.tab)";
      const literalSelected: string = "selected:$r(app.string.tab)";
      const literalDefault: string = "default:$r(app.string.tab)";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0015
    // @tc.name AdaptTabResourceMask6_0015
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"tab://home?x=1&y=2"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0015', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "tab://home?x=1&y=2";
      const literalSelected: string = "selected:tab://home?x=1&y=2";
      const literalDefault: string = "default:tab://home?x=1&y=2";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0016
    // @tc.name AdaptTabResourceMask6_0016
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0016', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      const literalSelected: string = "selected:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      const literalDefault: string = "default:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0017
    // @tc.name AdaptTabResourceMask6_0017
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"L"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0017', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "L";
      const literalSelected: string = "selected:L";
      const literalDefault: string = "default:L";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0018
    // @tc.name AdaptTabResourceMask6_0018
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"\u6807"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0018', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "\u6807";
      const literalSelected: string = "selected:\u6807";
      const literalDefault: string = "default:\u6807";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0019
    // @tc.name AdaptTabResourceMask6_0019
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"LL"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0019', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "LL";
      const literalSelected: string = "selected:LL";
      const literalDefault: string = "default:LL";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0020
    // @tc.name AdaptTabResourceMask6_0020
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"\u6807\u6807"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0020', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "\u6807\u6807";
      const literalSelected: string = "selected:\u6807\u6807";
      const literalDefault: string = "default:\u6807\u6807";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0021
    // @tc.name AdaptTabResourceMask6_0021
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"LLLLLLL"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0021', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "LLLLLLL";
      const literalSelected: string = "selected:LLLLLLL";
      const literalDefault: string = "default:LLLLLLL";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0022
    // @tc.name AdaptTabResourceMask6_0022
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"\u6807\u6807\u6807\u6807\u6807\u6807\u6807"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0022', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalSelected: string = "selected:\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalDefault: string = "default:\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0023
    // @tc.name AdaptTabResourceMask6_0023
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"LLLLLLLL"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0023', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "LLLLLLLL";
      const literalSelected: string = "selected:LLLLLLLL";
      const literalDefault: string = "default:LLLLLLLL";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0024
    // @tc.name AdaptTabResourceMask6_0024
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0024', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalSelected: string = "selected:\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalDefault: string = "default:\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0025
    // @tc.name AdaptTabResourceMask6_0025
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"LLLLLLLLLLLLLLL"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0025', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "LLLLLLLLLLLLLLL";
      const literalSelected: string = "selected:LLLLLLLLLLLLLLL";
      const literalDefault: string = "default:LLLLLLLLLLLLLLL";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0026
    // @tc.name AdaptTabResourceMask6_0026
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0026', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalSelected: string = "selected:\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalDefault: string = "default:\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0027
    // @tc.name AdaptTabResourceMask6_0027
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"LLLLLLLLLLLLLLLL"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0027', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "LLLLLLLLLLLLLLLL";
      const literalSelected: string = "selected:LLLLLLLLLLLLLLLL";
      const literalDefault: string = "default:LLLLLLLLLLLLLLLL";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0028
    // @tc.name AdaptTabResourceMask6_0028
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0028', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalSelected: string = "selected:\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalDefault: string = "default:\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0029
    // @tc.name AdaptTabResourceMask6_0029
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0029', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL";
      const literalSelected: string = "selected:LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL";
      const literalDefault: string = "default:LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0030
    // @tc.name AdaptTabResourceMask6_0030
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0030', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalSelected: string = "selected:\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalDefault: string = "default:\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0031
    // @tc.name AdaptTabResourceMask6_0031
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0031', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL";
      const literalSelected: string = "selected:LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL";
      const literalDefault: string = "default:LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0032
    // @tc.name AdaptTabResourceMask6_0032
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0032', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalSelected: string = "selected:\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      const literalDefault: string = "default:\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807\u6807";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });

    // @tc.number SUB_SAMPLE_ADAPTTABRESOURCEMASK6_0033
    // @tc.name AdaptTabResourceMask6_0033
    // @tc.desc Verify resource {"mask":6,"order":[0,1,2],"text":"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptTabResourceMask6_0033', 0, (): void => {
      const primary = new TabResourceFixture();
      const sibling = new TabResourceFixture();
      const literalTitle: string = "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL";
      const literalSelected: string = "selected:LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL";
      const literalDefault: string = "default:LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL";
      expect(primary.titleKeepsResource).assertTrue();
      expect(primary.selectedKeepsResource).assertTrue();
      expect(primary.defaultKeepsResource).assertTrue();
      expect(primary.iconResourcesAreDistinct).assertTrue();
      primary.setLiteralSelectedIcon(literalSelected);
      expect(primary.literalSelectedIcon).assertEqual(literalSelected);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      primary.setLiteralDefaultIcon(literalDefault);
      expect(primary.literalDefaultIcon).assertEqual(literalDefault);
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(false);
      expect(primary.id).assertEqual(0);
      primary.restoreDefaultResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(false);
      expect(primary.defaultKeepsResource).assertEqual(true);
      primary.restoreSelectedResource();
      expect(primary.titleKeepsResource).assertEqual(true);
      expect(primary.selectedKeepsResource).assertEqual(true);
      expect(primary.defaultKeepsResource).assertEqual(true);
      expect(primary.id).assertEqual(0);
      expect(primary.iconResourcesAreDistinct).assertTrue();
      expect(sibling.titleKeepsResource).assertTrue();
      expect(sibling.selectedKeepsResource).assertTrue();
      expect(sibling.defaultKeepsResource).assertTrue();
      expect(sibling.iconResourcesAreDistinct).assertTrue();
      expect(sibling.id).assertEqual(0);
    });
  });
}
