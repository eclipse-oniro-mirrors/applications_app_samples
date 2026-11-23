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
import { ImageData } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ImageData flow (38 cases). */
export default function imageDataFlow2Test(): void {
  describe('ImageDataFlow2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0063
     * @tc.name      Image_ImageDataFlow_0063
     * @tc.desc      ImageData call flow getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0063 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0064
     * @tc.name      Image_ImageDataFlow_0064
     * @tc.desc      ImageData call flow getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0064 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0065
     * @tc.name      Image_ImageDataFlow_0065
     * @tc.desc      ImageData call flow getName > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0065 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0066
     * @tc.name      Image_ImageDataFlow_0066
     * @tc.desc      ImageData call flow getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0066 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0067
     * @tc.name      Image_ImageDataFlow_0067
     * @tc.desc      ImageData call flow getName > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0067 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0068
     * @tc.name      Image_ImageDataFlow_0068
     * @tc.desc      ImageData call flow getResource > getName > getResource > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0068 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0069
     * @tc.name      Image_ImageDataFlow_0069
     * @tc.desc      ImageData call flow getResource > getName > getResource > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0069 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0070
     * @tc.name      Image_ImageDataFlow_0070
     * @tc.desc      ImageData call flow getResource > getResource > getResource > getName > getResource keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0070 begin`);
      const subject: ImageData = new ImageData();
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
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0071
     * @tc.name      Image_ImageDataFlow_0071
     * @tc.desc      ImageData call flow getName > getResource > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0071 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0072
     * @tc.name      Image_ImageDataFlow_0072
     * @tc.desc      ImageData call flow getName > getName > getName > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0072 begin`);
      const subject: ImageData = new ImageData();
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
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0073
     * @tc.name      Image_ImageDataFlow_0073
     * @tc.desc      ImageData call flow getResource > getName > getName > getResource > getResource keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0073 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0074
     * @tc.name      Image_ImageDataFlow_0074
     * @tc.desc      ImageData call flow getResource > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0074 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0075
     * @tc.name      Image_ImageDataFlow_0075
     * @tc.desc      ImageData call flow getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0075 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0076
     * @tc.name      Image_ImageDataFlow_0076
     * @tc.desc      ImageData call flow getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0076 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0077
     * @tc.name      Image_ImageDataFlow_0077
     * @tc.desc      ImageData call flow getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0077 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0078
     * @tc.name      Image_ImageDataFlow_0078
     * @tc.desc      ImageData call flow getName > getResource > getName > getResource > getResource keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0078 begin`);
      const subject: ImageData = new ImageData();
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
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0079
     * @tc.name      Image_ImageDataFlow_0079
     * @tc.desc      ImageData call flow getResource > getName > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0079 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0080
     * @tc.name      Image_ImageDataFlow_0080
     * @tc.desc      ImageData call flow getName > getResource > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0080 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0081
     * @tc.name      Image_ImageDataFlow_0081
     * @tc.desc      ImageData call flow getName > getResource > getResource > getName > getResource keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0081 begin`);
      const subject: ImageData = new ImageData();
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
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0082
     * @tc.name      Image_ImageDataFlow_0082
     * @tc.desc      ImageData call flow getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0082 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0083
     * @tc.name      Image_ImageDataFlow_0083
     * @tc.desc      ImageData call flow getResource > getName > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0083 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0084
     * @tc.name      Image_ImageDataFlow_0084
     * @tc.desc      ImageData call flow getResource > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0084 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0085
     * @tc.name      Image_ImageDataFlow_0085
     * @tc.desc      ImageData call flow getResource > getResource > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0085 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0086
     * @tc.name      Image_ImageDataFlow_0086
     * @tc.desc      ImageData call flow getResource > getName > getName > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0086 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0087
     * @tc.name      Image_ImageDataFlow_0087
     * @tc.desc      ImageData call flow getResource > getResource > getName > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0087 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0088
     * @tc.name      Image_ImageDataFlow_0088
     * @tc.desc      ImageData call flow getName > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0088 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0089
     * @tc.name      Image_ImageDataFlow_0089
     * @tc.desc      ImageData call flow getName > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0089 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0090
     * @tc.name      Image_ImageDataFlow_0090
     * @tc.desc      ImageData call flow getName > getResource > getName > getResource > getResource keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0090 begin`);
      const subject: ImageData = new ImageData();
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
      const step5 = subject.getResource();
      logInfo(`step5 getResource(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0091
     * @tc.name      Image_ImageDataFlow_0091
     * @tc.desc      ImageData call flow getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0091 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0092
     * @tc.name      Image_ImageDataFlow_0092
     * @tc.desc      ImageData call flow getResource > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0092 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getName();
      logInfo(`step3 getName(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0093
     * @tc.name      Image_ImageDataFlow_0093
     * @tc.desc      ImageData call flow getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0093 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getResource();
      logInfo(`step2 getResource(): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0094
     * @tc.name      Image_ImageDataFlow_0094
     * @tc.desc      ImageData call flow getName > getResource > getResource > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0094 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0095
     * @tc.name      Image_ImageDataFlow_0095
     * @tc.desc      ImageData call flow getResource > getName > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0095 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0096
     * @tc.name      Image_ImageDataFlow_0096
     * @tc.desc      ImageData call flow getResource > getResource > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0096 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getResource();
      logInfo(`step1 getResource(): step1=${step1}`);
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
      logInfo(`${BUNDLE}ImageDataFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0097
     * @tc.name      Image_ImageDataFlow_0097
     * @tc.desc      ImageData call flow getResource > getName > getResource > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0097 begin`);
      const subject: ImageData = new ImageData();
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
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0098
     * @tc.name      Image_ImageDataFlow_0098
     * @tc.desc      ImageData call flow getResource > getName > getResource > getName > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0098 begin`);
      const subject: ImageData = new ImageData();
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
      const step5 = subject.getName();
      logInfo(`step5 getName(): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0099
     * @tc.name      Image_ImageDataFlow_0099
     * @tc.desc      ImageData call flow getName > getName > getResource keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0099 begin`);
      const subject: ImageData = new ImageData();
      const step1 = subject.getName();
      logInfo(`step1 getName(): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getName();
      logInfo(`step2 getName(): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getResource();
      logInfo(`step3 getResource(): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ImageDataFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_FLOW_0100
     * @tc.name      Image_ImageDataFlow_0100
     * @tc.desc      ImageData call flow getResource > getResource > getResource > getName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ImageDataFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ImageDataFlow_0100 begin`);
      const subject: ImageData = new ImageData();
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
      logInfo(`${BUNDLE}ImageDataFlow_0100 end`);
    });
  });
}
