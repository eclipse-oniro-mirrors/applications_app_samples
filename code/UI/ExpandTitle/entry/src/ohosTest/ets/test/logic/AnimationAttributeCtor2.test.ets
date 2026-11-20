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
import { AnimationAttribute } from '../../../../main/ets/model/AnimationAttribute';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new AnimationAttribute (52 cases). */
export default function animationAttributeCtor2Test(): void {
  describe('AnimationAttributeCtor2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0065
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0065
     * @tc.desc      new AnimationAttribute(100, 100, 5, 0, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0065 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(100, 100, 5, 0, 60000);
      logInfo(`new AnimationAttribute(100, 100, 5, 0, 60...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, 100, 5, 0, 60...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, 100, 5, 0, 60...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(5);
      logInfo(`new AnimationAttribute(100, 100, 5, 0, 60...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(100, 100, 5, 0, 60...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0066
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0066
     * @tc.desc      new AnimationAttribute(1080, 100, 100, -1, 500) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0066 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 100, 100, -1, 500);
      logInfo(`new AnimationAttribute(1080, 100, 100, -1...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 100, 100, -1...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(1080, 100, 100, -1...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(1080, 100, 100, -1...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(-1);
      logInfo(`new AnimationAttribute(1080, 100, 100, -1...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(500);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0067
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0067
     * @tc.desc      new AnimationAttribute(0, 0, 10, -1, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0067 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 10, -1, 0);
      logInfo(`new AnimationAttribute(0, 0, 10, -1, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 10, -1, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 10, -1, 0): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(10);
      logInfo(`new AnimationAttribute(0, 0, 10, -1, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(-1);
      logInfo(`new AnimationAttribute(0, 0, 10, -1, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0068
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0068
     * @tc.desc      new AnimationAttribute(720, 1920, 100, 0.25, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0068 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(720, 1920, 100, 0.25, 999);
      logInfo(`new AnimationAttribute(720, 1920, 100, 0....: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(720, 1920, 100, 0....: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(720, 1920, 100, 0....: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(720, 1920, 100, 0....: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.25, PRECISION);
      logInfo(`new AnimationAttribute(720, 1920, 100, 0....: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0069
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0069
     * @tc.desc      new AnimationAttribute(100, 0, 1, 1, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0069 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(100, 0, 1, 1, 999);
      logInfo(`new AnimationAttribute(100, 0, 1, 1, 999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, 0, 1, 1, 999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(100, 0, 1, 1, 999): subject.continuePullThre...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(1);
      logInfo(`new AnimationAttribute(100, 0, 1, 1, 999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(100, 0, 1, 1, 999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0070
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0070
     * @tc.desc      new AnimationAttribute(-1, 360, 100, 0.25, 1000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0070 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 360, 100, 0.25, 1000);
      logInfo(`new AnimationAttribute(-1, 360, 100, 0.25...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 360, 100, 0.25...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(-1, 360, 100, 0.25...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(-1, 360, 100, 0.25...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.25, PRECISION);
      logInfo(`new AnimationAttribute(-1, 360, 100, 0.25...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(1000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0071
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0071
     * @tc.desc      new AnimationAttribute(1920, 1, 5, 2, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0071 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 1, 5, 2, 999);
      logInfo(`new AnimationAttribute(1920, 1, 5, 2, 999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 1, 5, 2, 999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1920, 1, 5, 2, 999): subject.continuePullThr...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(5);
      logInfo(`new AnimationAttribute(1920, 1, 5, 2, 999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(2);
      logInfo(`new AnimationAttribute(1920, 1, 5, 2, 999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0072
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0072
     * @tc.desc      new AnimationAttribute(1080, -1, 5, -1, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0072 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, -1, 5, -1, 60000);
      logInfo(`new AnimationAttribute(1080, -1, 5, -1, 6...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, -1, 5, -1, 6...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(1080, -1, 5, -1, 6...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(5);
      logInfo(`new AnimationAttribute(1080, -1, 5, -1, 6...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(-1);
      logInfo(`new AnimationAttribute(1080, -1, 5, -1, 6...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0073
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0073
     * @tc.desc      new AnimationAttribute(1080, 1080, -1, 2, 59999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0073 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 1080, -1, 2, 59999);
      logInfo(`new AnimationAttribute(1080, 1080, -1, 2,...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 1080, -1, 2,...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 1080, -1, 2,...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(-1);
      logInfo(`new AnimationAttribute(1080, 1080, -1, 2,...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(2);
      logInfo(`new AnimationAttribute(1080, 1080, -1, 2,...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(59999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0074
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0074
     * @tc.desc      new AnimationAttribute(360, 720, 2, 3, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0074 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(360, 720, 2, 3, 999);
      logInfo(`new AnimationAttribute(360, 720, 2, 3, 999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(360, 720, 2, 3, 999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(360, 720, 2, 3, 999): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(360, 720, 2, 3, 999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(3);
      logInfo(`new AnimationAttribute(360, 720, 2, 3, 999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0075
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0075
     * @tc.desc      new AnimationAttribute(1080, 100, -1, 2, 59999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0075 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 100, -1, 2, 59999);
      logInfo(`new AnimationAttribute(1080, 100, -1, 2, ...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 100, -1, 2, ...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(1080, 100, -1, 2, ...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(-1);
      logInfo(`new AnimationAttribute(1080, 100, -1, 2, ...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(2);
      logInfo(`new AnimationAttribute(1080, 100, -1, 2, ...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(59999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0076
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0076
     * @tc.desc      new AnimationAttribute(1920, 1080, 2, 0.5, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0076 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 1080, 2, 0.5, 3599000);
      logInfo(`new AnimationAttribute(1920, 1080, 2, 0.5...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 1080, 2, 0.5...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1920, 1080, 2, 0.5...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(1920, 1080, 2, 0.5...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.5, PRECISION);
      logInfo(`new AnimationAttribute(1920, 1080, 2, 0.5...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0077
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0077
     * @tc.desc      new AnimationAttribute(1, 1920, 0, 1, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0077 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, 1920, 0, 1, 0);
      logInfo(`new AnimationAttribute(1, 1920, 0, 1, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 1920, 0, 1, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1, 1920, 0, 1, 0): subject.continuePullThres...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(1, 1920, 0, 1, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 1920, 0, 1, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0078
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0078
     * @tc.desc      new AnimationAttribute(0, 0, 2, 0.25, 59999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0078 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 2, 0.25, 59999);
      logInfo(`new AnimationAttribute(0, 0, 2, 0.25, 59999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 2, 0.25, 59999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 2, 0.25, 59999): subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(0, 0, 2, 0.25, 59999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.25, PRECISION);
      logInfo(`new AnimationAttribute(0, 0, 2, 0.25, 59999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(59999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0079
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0079
     * @tc.desc      new AnimationAttribute(100, -1, 100, 0, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0079 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(100, -1, 100, 0, 3599000);
      logInfo(`new AnimationAttribute(100, -1, 100, 0, 3...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, -1, 100, 0, 3...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(100, -1, 100, 0, 3...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(100, -1, 100, 0, 3...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(100, -1, 100, 0, 3...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0080
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0080
     * @tc.desc      new AnimationAttribute(1080, 100, 0, 1.5, 500) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0080 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 100, 0, 1.5, 500);
      logInfo(`new AnimationAttribute(1080, 100, 0, 1.5,...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 100, 0, 1.5,...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(1080, 100, 0, 1.5,...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(1080, 100, 0, 1.5,...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(1.5, PRECISION);
      logInfo(`new AnimationAttribute(1080, 100, 0, 1.5,...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(500);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0081
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0081
     * @tc.desc      new AnimationAttribute(100, -1, -1, 3, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0081 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(100, -1, -1, 3, 0);
      logInfo(`new AnimationAttribute(100, -1, -1, 3, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, -1, -1, 3, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(100, -1, -1, 3, 0): subject.continuePullThre...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(-1);
      logInfo(`new AnimationAttribute(100, -1, -1, 3, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(3);
      logInfo(`new AnimationAttribute(100, -1, -1, 3, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0082
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0082
     * @tc.desc      new AnimationAttribute(1080, 720, -1, 0.5, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0082 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 720, -1, 0.5, 999);
      logInfo(`new AnimationAttribute(1080, 720, -1, 0.5...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 720, -1, 0.5...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(1080, 720, -1, 0.5...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(-1);
      logInfo(`new AnimationAttribute(1080, 720, -1, 0.5...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.5, PRECISION);
      logInfo(`new AnimationAttribute(1080, 720, -1, 0.5...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0083
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0083
     * @tc.desc      new AnimationAttribute(720, 1920, 0, 1, 61000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0083 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(720, 1920, 0, 1, 61000);
      logInfo(`new AnimationAttribute(720, 1920, 0, 1, 6...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(720, 1920, 0, 1, 6...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(720, 1920, 0, 1, 6...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(720, 1920, 0, 1, 6...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(720, 1920, 0, 1, 6...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(61000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0084
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0084
     * @tc.desc      new AnimationAttribute(1080, 0, -1, 1, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0084 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 0, -1, 1, 3599000);
      logInfo(`new AnimationAttribute(1080, 0, -1, 1, 35...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 0, -1, 1, 35...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(1080, 0, -1, 1, 35...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(-1);
      logInfo(`new AnimationAttribute(1080, 0, -1, 1, 35...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(1080, 0, -1, 1, 35...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0085
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0085
     * @tc.desc      new AnimationAttribute(360, 1, -1, -1, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0085 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(360, 1, -1, -1, 60000);
      logInfo(`new AnimationAttribute(360, 1, -1, -1, 60...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(360, 1, -1, -1, 60...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(360, 1, -1, -1, 60...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(-1);
      logInfo(`new AnimationAttribute(360, 1, -1, -1, 60...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(-1);
      logInfo(`new AnimationAttribute(360, 1, -1, -1, 60...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0086
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0086
     * @tc.desc      new AnimationAttribute(1920, 1920, 2, 3, 1000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0086 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 1920, 2, 3, 1000);
      logInfo(`new AnimationAttribute(1920, 1920, 2, 3, ...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 1920, 2, 3, ...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 1920, 2, 3, ...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(1920, 1920, 2, 3, ...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(3);
      logInfo(`new AnimationAttribute(1920, 1920, 2, 3, ...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(1000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0087
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0087
     * @tc.desc      new AnimationAttribute(0, 1, 0, 1.5, 61000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0087 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 1, 0, 1.5, 61000);
      logInfo(`new AnimationAttribute(0, 1, 0, 1.5, 61000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1, 0, 1.5, 61000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(0, 1, 0, 1.5, 61000): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1, 0, 1.5, 61000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(1.5, PRECISION);
      logInfo(`new AnimationAttribute(0, 1, 0, 1.5, 61000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(61000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0088
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0088
     * @tc.desc      new AnimationAttribute(-1, 100, 5, 0, 59999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0088 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 100, 5, 0, 59999);
      logInfo(`new AnimationAttribute(-1, 100, 5, 0, 59999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 100, 5, 0, 59999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(-1, 100, 5, 0, 59999): subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(5);
      logInfo(`new AnimationAttribute(-1, 100, 5, 0, 59999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(-1, 100, 5, 0, 59999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(59999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0089
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0089
     * @tc.desc      new AnimationAttribute(1920, 1080, 0, 0.5, 500) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0089 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 1080, 0, 0.5, 500);
      logInfo(`new AnimationAttribute(1920, 1080, 0, 0.5...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 1080, 0, 0.5...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1920, 1080, 0, 0.5...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(1920, 1080, 0, 0.5...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.5, PRECISION);
      logInfo(`new AnimationAttribute(1920, 1080, 0, 0.5...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(500);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0090
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0090
     * @tc.desc      new AnimationAttribute(100, 360, 2, 2, 500) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0090 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(100, 360, 2, 2, 500);
      logInfo(`new AnimationAttribute(100, 360, 2, 2, 500): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, 360, 2, 2, 500): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(100, 360, 2, 2, 500): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(100, 360, 2, 2, 500): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(2);
      logInfo(`new AnimationAttribute(100, 360, 2, 2, 500): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(500);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0091
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0091
     * @tc.desc      new AnimationAttribute(0, 1, 1, 0.25, 59999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0091 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 1, 1, 0.25, 59999);
      logInfo(`new AnimationAttribute(0, 1, 1, 0.25, 59999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1, 1, 0.25, 59999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(0, 1, 1, 0.25, 59999): subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(1);
      logInfo(`new AnimationAttribute(0, 1, 1, 0.25, 59999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.25, PRECISION);
      logInfo(`new AnimationAttribute(0, 1, 1, 0.25, 59999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(59999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0092
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0092
     * @tc.desc      new AnimationAttribute(1920, 0, 100, 0, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0092 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 0, 100, 0, 60000);
      logInfo(`new AnimationAttribute(1920, 0, 100, 0, 6...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 0, 100, 0, 6...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(1920, 0, 100, 0, 6...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(1920, 0, 100, 0, 6...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(1920, 0, 100, 0, 6...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0093
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0093
     * @tc.desc      new AnimationAttribute(0, 360, 0, -1, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0093 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 360, 0, -1, 999);
      logInfo(`new AnimationAttribute(0, 360, 0, -1, 999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 360, 0, -1, 999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(0, 360, 0, -1, 999): subject.continuePullThr...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 360, 0, -1, 999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(-1);
      logInfo(`new AnimationAttribute(0, 360, 0, -1, 999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0094
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0094
     * @tc.desc      new AnimationAttribute(1920, 1920, 3, 1, 61000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0094 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 1920, 3, 1, 61000);
      logInfo(`new AnimationAttribute(1920, 1920, 3, 1, ...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 1920, 3, 1, ...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 1920, 3, 1, ...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(3);
      logInfo(`new AnimationAttribute(1920, 1920, 3, 1, ...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(1920, 1920, 3, 1, ...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(61000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0095
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0095
     * @tc.desc      new AnimationAttribute(360, 0, 0, 2, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0095 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(360, 0, 0, 2, 3599000);
      logInfo(`new AnimationAttribute(360, 0, 0, 2, 3599...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(360, 0, 0, 2, 3599...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(360, 0, 0, 2, 3599...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(360, 0, 0, 2, 3599...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(2);
      logInfo(`new AnimationAttribute(360, 0, 0, 2, 3599...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0096
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0096
     * @tc.desc      new AnimationAttribute(720, 0, 2, 0.25, 1000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0096 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(720, 0, 2, 0.25, 1000);
      logInfo(`new AnimationAttribute(720, 0, 2, 0.25, 1...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(720, 0, 2, 0.25, 1...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(720, 0, 2, 0.25, 1...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(720, 0, 2, 0.25, 1...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.25, PRECISION);
      logInfo(`new AnimationAttribute(720, 0, 2, 0.25, 1...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(1000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0096 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0097
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0097
     * @tc.desc      new AnimationAttribute(1, 360, -1, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0097 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, 360, -1, 0, 0);
      logInfo(`new AnimationAttribute(1, 360, -1, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 360, -1, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(1, 360, -1, 0, 0): subject.continuePullThres...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(-1);
      logInfo(`new AnimationAttribute(1, 360, -1, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(1, 360, -1, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0098
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0098
     * @tc.desc      new AnimationAttribute(1, 1, 0, 1, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0098 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, 1, 0, 1, 999);
      logInfo(`new AnimationAttribute(1, 1, 0, 1, 999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 1, 0, 1, 999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 1, 0, 1, 999): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(1, 1, 0, 1, 999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 1, 0, 1, 999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0099
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0099
     * @tc.desc      new AnimationAttribute(100, 720, 1, 1.5, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0099 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(100, 720, 1, 1.5, 999);
      logInfo(`new AnimationAttribute(100, 720, 1, 1.5, ...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, 720, 1, 1.5, ...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(100, 720, 1, 1.5, ...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(1);
      logInfo(`new AnimationAttribute(100, 720, 1, 1.5, ...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(1.5, PRECISION);
      logInfo(`new AnimationAttribute(100, 720, 1, 1.5, ...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0100
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0100
     * @tc.desc      new AnimationAttribute(1920, 100, 2, 1, 59999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0100 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 100, 2, 1, 59999);
      logInfo(`new AnimationAttribute(1920, 100, 2, 1, 5...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 100, 2, 1, 5...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(1920, 100, 2, 1, 5...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(1920, 100, 2, 1, 5...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(1920, 100, 2, 1, 5...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(59999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0101
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0101
     * @tc.desc      new AnimationAttribute(360, 1920, 10, 1, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0101 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(360, 1920, 10, 1, 0);
      logInfo(`new AnimationAttribute(360, 1920, 10, 1, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(360, 1920, 10, 1, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(360, 1920, 10, 1, 0): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(10);
      logInfo(`new AnimationAttribute(360, 1920, 10, 1, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(360, 1920, 10, 1, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0102
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0102
     * @tc.desc      new AnimationAttribute(-1, 720, 1, 2, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0102 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 720, 1, 2, 3599000);
      logInfo(`new AnimationAttribute(-1, 720, 1, 2, 359...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 720, 1, 2, 359...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(-1, 720, 1, 2, 359...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(1);
      logInfo(`new AnimationAttribute(-1, 720, 1, 2, 359...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(2);
      logInfo(`new AnimationAttribute(-1, 720, 1, 2, 359...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0103
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0103
     * @tc.desc      new AnimationAttribute(-1, 0, 3, 0.5, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0103 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 0, 3, 0.5, 60000);
      logInfo(`new AnimationAttribute(-1, 0, 3, 0.5, 60000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 0, 3, 0.5, 60000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(-1, 0, 3, 0.5, 60000): subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(3);
      logInfo(`new AnimationAttribute(-1, 0, 3, 0.5, 60000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.5, PRECISION);
      logInfo(`new AnimationAttribute(-1, 0, 3, 0.5, 60000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0104
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0104
     * @tc.desc      new AnimationAttribute(100, 720, 10, 0, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0104 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(100, 720, 10, 0, 3599000);
      logInfo(`new AnimationAttribute(100, 720, 10, 0, 3...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, 720, 10, 0, 3...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(100, 720, 10, 0, 3...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(10);
      logInfo(`new AnimationAttribute(100, 720, 10, 0, 3...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(100, 720, 10, 0, 3...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0105
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0105
     * @tc.desc      new AnimationAttribute(1, 1, 2, 3, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0105 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, 1, 2, 3, 0);
      logInfo(`new AnimationAttribute(1, 1, 2, 3, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 1, 2, 3, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 1, 2, 3, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(1, 1, 2, 3, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(3);
      logInfo(`new AnimationAttribute(1, 1, 2, 3, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0106
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0106
     * @tc.desc      new AnimationAttribute(1, -1, 2, 0, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0106 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, -1, 2, 0, 60000);
      logInfo(`new AnimationAttribute(1, -1, 2, 0, 60000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, -1, 2, 0, 60000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(1, -1, 2, 0, 60000): subject.continuePullThr...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(1, -1, 2, 0, 60000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(1, -1, 2, 0, 60000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0107
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0107
     * @tc.desc      new AnimationAttribute(1920, 720, 0, 3, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0107 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 720, 0, 3, 999);
      logInfo(`new AnimationAttribute(1920, 720, 0, 3, 999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 720, 0, 3, 999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(1920, 720, 0, 3, 999): subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(1920, 720, 0, 3, 999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(3);
      logInfo(`new AnimationAttribute(1920, 720, 0, 3, 999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0108
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0108
     * @tc.desc      new AnimationAttribute(1080, 720, 5, 0.25, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0108 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 720, 5, 0.25, 60000);
      logInfo(`new AnimationAttribute(1080, 720, 5, 0.25...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 720, 5, 0.25...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(1080, 720, 5, 0.25...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(5);
      logInfo(`new AnimationAttribute(1080, 720, 5, 0.25...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.25, PRECISION);
      logInfo(`new AnimationAttribute(1080, 720, 5, 0.25...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0109
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0109
     * @tc.desc      new AnimationAttribute(720, 720, 3, 1.5, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0109 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(720, 720, 3, 1.5, 60000);
      logInfo(`new AnimationAttribute(720, 720, 3, 1.5, ...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(720, 720, 3, 1.5, ...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(720, 720, 3, 1.5, ...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(3);
      logInfo(`new AnimationAttribute(720, 720, 3, 1.5, ...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(1.5, PRECISION);
      logInfo(`new AnimationAttribute(720, 720, 3, 1.5, ...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0110
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0110
     * @tc.desc      new AnimationAttribute(720, 360, 0, 1, 500) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0110 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(720, 360, 0, 1, 500);
      logInfo(`new AnimationAttribute(720, 360, 0, 1, 500): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(720, 360, 0, 1, 500): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(720, 360, 0, 1, 500): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(720, 360, 0, 1, 500): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(720, 360, 0, 1, 500): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(500);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0111
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0111
     * @tc.desc      new AnimationAttribute(1920, 720, 10, 0.25, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0111 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 720, 10, 0.25, 60000);
      logInfo(`new AnimationAttribute(1920, 720, 10, 0.2...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 720, 10, 0.2...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(1920, 720, 10, 0.2...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(10);
      logInfo(`new AnimationAttribute(1920, 720, 10, 0.2...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.25, PRECISION);
      logInfo(`new AnimationAttribute(1920, 720, 10, 0.2...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0112
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0112
     * @tc.desc      new AnimationAttribute(-1, 360, 5, 0.5, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0112 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 360, 5, 0.5, 999);
      logInfo(`new AnimationAttribute(-1, 360, 5, 0.5, 999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 360, 5, 0.5, 999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(-1, 360, 5, 0.5, 999): subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(5);
      logInfo(`new AnimationAttribute(-1, 360, 5, 0.5, 999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.5, PRECISION);
      logInfo(`new AnimationAttribute(-1, 360, 5, 0.5, 999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0113
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0113
     * @tc.desc      new AnimationAttribute(1080, 360, 1, 3, 61000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0113 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 360, 1, 3, 61000);
      logInfo(`new AnimationAttribute(1080, 360, 1, 3, 6...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 360, 1, 3, 6...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(1080, 360, 1, 3, 6...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(1);
      logInfo(`new AnimationAttribute(1080, 360, 1, 3, 6...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(3);
      logInfo(`new AnimationAttribute(1080, 360, 1, 3, 6...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(61000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0114
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0114
     * @tc.desc      new AnimationAttribute(-1, 360, 100, 1.5, 59999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0114 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 360, 100, 1.5, 59999);
      logInfo(`new AnimationAttribute(-1, 360, 100, 1.5,...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 360, 100, 1.5,...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(-1, 360, 100, 1.5,...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(-1, 360, 100, 1.5,...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(1.5, PRECISION);
      logInfo(`new AnimationAttribute(-1, 360, 100, 1.5,...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(59999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0115
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0115
     * @tc.desc      new AnimationAttribute(100, 360, 3, 2, 59999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0115 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(100, 360, 3, 2, 59999);
      logInfo(`new AnimationAttribute(100, 360, 3, 2, 59...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, 360, 3, 2, 59...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(100, 360, 3, 2, 59...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(3);
      logInfo(`new AnimationAttribute(100, 360, 3, 2, 59...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(2);
      logInfo(`new AnimationAttribute(100, 360, 3, 2, 59...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(59999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0116
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0116
     * @tc.desc      new AnimationAttribute(-1, 100, -1, 1, 500) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0116 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 100, -1, 1, 500);
      logInfo(`new AnimationAttribute(-1, 100, -1, 1, 500): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 100, -1, 1, 500): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(-1, 100, -1, 1, 500): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 100, -1, 1, 500): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(-1, 100, -1, 1, 500): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(500);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0116 end`);
    });
  });
}
