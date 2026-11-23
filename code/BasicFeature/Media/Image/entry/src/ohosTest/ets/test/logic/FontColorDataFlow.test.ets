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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FontColorData } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for FontColorData flow (62 cases). */
export default function fontColorDataFlowTest(): void {
  describe('FontColorDataFlowTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0001
     * @tc.name      Image_FontColorDataFlow_0001
     * @tc.desc      FontColorData call flow getResource > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_FontColorDataFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0001 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0002
     * @tc.name      Image_FontColorDataFlow_0002
     * @tc.desc      FontColorData call flow getName > getName > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_FontColorDataFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0002 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0003
     * @tc.name      Image_FontColorDataFlow_0003
     * @tc.desc      FontColorData call flow getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0003 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0004
     * @tc.name      Image_FontColorDataFlow_0004
     * @tc.desc      FontColorData call flow getResource > getName > getResource > getResource > getResource keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0004 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0005
     * @tc.name      Image_FontColorDataFlow_0005
     * @tc.desc      FontColorData call flow getName > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0005 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0006
     * @tc.name      Image_FontColorDataFlow_0006
     * @tc.desc      FontColorData call flow getResource > getName > getResource > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0006 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0007
     * @tc.name      Image_FontColorDataFlow_0007
     * @tc.desc      FontColorData call flow getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0007 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0008
     * @tc.name      Image_FontColorDataFlow_0008
     * @tc.desc      FontColorData call flow getResource > getName > getResource > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0008 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0009
     * @tc.name      Image_FontColorDataFlow_0009
     * @tc.desc      FontColorData call flow getResource > getResource > getResource > getName > getName keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0009 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0010
     * @tc.name      Image_FontColorDataFlow_0010
     * @tc.desc      FontColorData call flow getResource > getName > getName > getResource > getResource keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0010 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0011
     * @tc.name      Image_FontColorDataFlow_0011
     * @tc.desc      FontColorData call flow getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0011 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0012
     * @tc.name      Image_FontColorDataFlow_0012
     * @tc.desc      FontColorData call flow getResource > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0012 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0013
     * @tc.name      Image_FontColorDataFlow_0013
     * @tc.desc      FontColorData call flow getName > getResource > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0013 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0014
     * @tc.name      Image_FontColorDataFlow_0014
     * @tc.desc      FontColorData call flow getResource > getResource > getResource > getResource > getName keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0014 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0015
     * @tc.name      Image_FontColorDataFlow_0015
     * @tc.desc      FontColorData call flow getName > getResource > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0015 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0016
     * @tc.name      Image_FontColorDataFlow_0016
     * @tc.desc      FontColorData call flow getName > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0016 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0017
     * @tc.name      Image_FontColorDataFlow_0017
     * @tc.desc      FontColorData call flow getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0017 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0018
     * @tc.name      Image_FontColorDataFlow_0018
     * @tc.desc      FontColorData call flow getName > getName > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0018 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0019
     * @tc.name      Image_FontColorDataFlow_0019
     * @tc.desc      FontColorData call flow getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0019 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0020
     * @tc.name      Image_FontColorDataFlow_0020
     * @tc.desc      FontColorData call flow getResource > getResource > getResource > getResource > getName keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0020 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0021
     * @tc.name      Image_FontColorDataFlow_0021
     * @tc.desc      FontColorData call flow getName > getResource > getResource > getResource > getResource keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0021 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0022
     * @tc.name      Image_FontColorDataFlow_0022
     * @tc.desc      FontColorData call flow getName > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0022 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0023
     * @tc.name      Image_FontColorDataFlow_0023
     * @tc.desc      FontColorData call flow getResource > getName > getResource > getResource > getResource keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0023 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0024
     * @tc.name      Image_FontColorDataFlow_0024
     * @tc.desc      FontColorData call flow getName > getResource > getName > getName > getResource keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0024 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0025
     * @tc.name      Image_FontColorDataFlow_0025
     * @tc.desc      FontColorData call flow getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0025 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0026
     * @tc.name      Image_FontColorDataFlow_0026
     * @tc.desc      FontColorData call flow getName > getName > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0026 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0027
     * @tc.name      Image_FontColorDataFlow_0027
     * @tc.desc      FontColorData call flow getResource > getName > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0027 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0028
     * @tc.name      Image_FontColorDataFlow_0028
     * @tc.desc      FontColorData call flow getResource > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0028 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0029
     * @tc.name      Image_FontColorDataFlow_0029
     * @tc.desc      FontColorData call flow getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0029 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0030
     * @tc.name      Image_FontColorDataFlow_0030
     * @tc.desc      FontColorData call flow getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0030 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0031
     * @tc.name      Image_FontColorDataFlow_0031
     * @tc.desc      FontColorData call flow getResource > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0031 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0032
     * @tc.name      Image_FontColorDataFlow_0032
     * @tc.desc      FontColorData call flow getName > getResource > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0032 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0033
     * @tc.name      Image_FontColorDataFlow_0033
     * @tc.desc      FontColorData call flow getName > getName > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0033 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0034
     * @tc.name      Image_FontColorDataFlow_0034
     * @tc.desc      FontColorData call flow getName > getResource > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0034 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0035
     * @tc.name      Image_FontColorDataFlow_0035
     * @tc.desc      FontColorData call flow getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0035 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0036
     * @tc.name      Image_FontColorDataFlow_0036
     * @tc.desc      FontColorData call flow getResource > getName > getName > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0036 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0037
     * @tc.name      Image_FontColorDataFlow_0037
     * @tc.desc      FontColorData call flow getName > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0037 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0038
     * @tc.name      Image_FontColorDataFlow_0038
     * @tc.desc      FontColorData call flow getResource > getName > getName > getName > getResource keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0038 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0039
     * @tc.name      Image_FontColorDataFlow_0039
     * @tc.desc      FontColorData call flow getName > getName > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0039 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0040
     * @tc.name      Image_FontColorDataFlow_0040
     * @tc.desc      FontColorData call flow getResource > getResource > getName > getName > getName keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0040 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0041
     * @tc.name      Image_FontColorDataFlow_0041
     * @tc.desc      FontColorData call flow getName > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0041 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0042
     * @tc.name      Image_FontColorDataFlow_0042
     * @tc.desc      FontColorData call flow getResource > getName > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0042 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0043
     * @tc.name      Image_FontColorDataFlow_0043
     * @tc.desc      FontColorData call flow getName > getName > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0043 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0044
     * @tc.name      Image_FontColorDataFlow_0044
     * @tc.desc      FontColorData call flow getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0044 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0045
     * @tc.name      Image_FontColorDataFlow_0045
     * @tc.desc      FontColorData call flow getResource > getResource > getResource > getResource > getName keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0045 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0046
     * @tc.name      Image_FontColorDataFlow_0046
     * @tc.desc      FontColorData call flow getName > getResource > getName > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0046 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0047
     * @tc.name      Image_FontColorDataFlow_0047
     * @tc.desc      FontColorData call flow getResource > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0047 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0048
     * @tc.name      Image_FontColorDataFlow_0048
     * @tc.desc      FontColorData call flow getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0048 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0049
     * @tc.name      Image_FontColorDataFlow_0049
     * @tc.desc      FontColorData call flow getResource > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0049 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0050
     * @tc.name      Image_FontColorDataFlow_0050
     * @tc.desc      FontColorData call flow getName > getName > getResource > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0050 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0051
     * @tc.name      Image_FontColorDataFlow_0051
     * @tc.desc      FontColorData call flow getName > getName > getResource > getResource > getResource keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0051 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0052
     * @tc.name      Image_FontColorDataFlow_0052
     * @tc.desc      FontColorData call flow getResource > getName > getName > getResource > getResource keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0052 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0053
     * @tc.name      Image_FontColorDataFlow_0053
     * @tc.desc      FontColorData call flow getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0053 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0054
     * @tc.name      Image_FontColorDataFlow_0054
     * @tc.desc      FontColorData call flow getResource > getName > getName > getResource > getName keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0054 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0055
     * @tc.name      Image_FontColorDataFlow_0055
     * @tc.desc      FontColorData call flow getName > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0055 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0056
     * @tc.name      Image_FontColorDataFlow_0056
     * @tc.desc      FontColorData call flow getResource > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0056 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0057
     * @tc.name      Image_FontColorDataFlow_0057
     * @tc.desc      FontColorData call flow getName > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0057 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0058
     * @tc.name      Image_FontColorDataFlow_0058
     * @tc.desc      FontColorData call flow getName > getResource > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0058 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getResource();
      logInfo(`step4 getResource(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0059
     * @tc.name      Image_FontColorDataFlow_0059
     * @tc.desc      FontColorData call flow getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0059 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0060
     * @tc.name      Image_FontColorDataFlow_0060
     * @tc.desc      FontColorData call flow getName > getResource > getResource > getName > getName keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0060 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0061
     * @tc.name      Image_FontColorDataFlow_0061
     * @tc.desc      FontColorData call flow getName > getResource > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0061 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getName();
      logInfo(`step4 getName(): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_FONT_COLOR_DATA_FLOW_0062
     * @tc.name      Image_FontColorDataFlow_0062
     * @tc.desc      FontColorData call flow getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_FontColorDataFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FontColorDataFlow_0062 begin`);
      const subject: FontColorData = new FontColorData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}FontColorDataFlow_0062 end`);
    });
  });
}
