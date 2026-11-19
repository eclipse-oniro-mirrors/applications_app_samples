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

/** Logic checks for new AnimationAttribute (64 cases). */
export default function animationAttributeCtorTest(): void {
  describe('AnimationAttributeCtorTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0001
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0001
     * @tc.desc      new AnimationAttribute(0, 0, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_AnimationAttributeCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0001 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 0, 0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0002
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0002
     * @tc.desc      new AnimationAttribute(1, 0, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_AnimationAttributeCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0002 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, 0, 0, 0, 0);
      logInfo(`new AnimationAttribute(1, 0, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 0, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(1, 0, 0, 0, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(1, 0, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(1, 0, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0003
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0003
     * @tc.desc      new AnimationAttribute(100, 0, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0003 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(100, 0, 0, 0, 0);
      logInfo(`new AnimationAttribute(100, 0, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, 0, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(100, 0, 0, 0, 0): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(100, 0, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(100, 0, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0004
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0004
     * @tc.desc      new AnimationAttribute(360, 0, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0004 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(360, 0, 0, 0, 0);
      logInfo(`new AnimationAttribute(360, 0, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(360, 0, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(360, 0, 0, 0, 0): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(360, 0, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(360, 0, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0005
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0005
     * @tc.desc      new AnimationAttribute(720, 0, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0005 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(720, 0, 0, 0, 0);
      logInfo(`new AnimationAttribute(720, 0, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(720, 0, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(720, 0, 0, 0, 0): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(720, 0, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(720, 0, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0006
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0006
     * @tc.desc      new AnimationAttribute(1080, 0, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0006 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 0, 0, 0, 0);
      logInfo(`new AnimationAttribute(1080, 0, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 0, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(1080, 0, 0, 0, 0): subject.continuePullThres...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(1080, 0, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(1080, 0, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0007
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0007
     * @tc.desc      new AnimationAttribute(1920, 0, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0007 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 0, 0, 0, 0);
      logInfo(`new AnimationAttribute(1920, 0, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 0, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(1920, 0, 0, 0, 0): subject.continuePullThres...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(1920, 0, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(1920, 0, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0008
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0008
     * @tc.desc      new AnimationAttribute(-1, 0, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0008 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 0, 0, 0, 0);
      logInfo(`new AnimationAttribute(-1, 0, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 0, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(-1, 0, 0, 0, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(-1, 0, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(-1, 0, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0009
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0009
     * @tc.desc      new AnimationAttribute(0, 1, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0009 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 1, 0, 0, 0);
      logInfo(`new AnimationAttribute(0, 1, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(0, 1, 0, 0, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0010
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0010
     * @tc.desc      new AnimationAttribute(0, 100, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0010 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 100, 0, 0, 0);
      logInfo(`new AnimationAttribute(0, 100, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 100, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(0, 100, 0, 0, 0): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 100, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 100, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0011
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0011
     * @tc.desc      new AnimationAttribute(0, 360, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0011 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 360, 0, 0, 0);
      logInfo(`new AnimationAttribute(0, 360, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 360, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(0, 360, 0, 0, 0): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 360, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 360, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0012
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0012
     * @tc.desc      new AnimationAttribute(0, 720, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0012 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 720, 0, 0, 0);
      logInfo(`new AnimationAttribute(0, 720, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 720, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(0, 720, 0, 0, 0): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 720, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 720, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0013
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0013
     * @tc.desc      new AnimationAttribute(0, 1080, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0013 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 1080, 0, 0, 0);
      logInfo(`new AnimationAttribute(0, 1080, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1080, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(0, 1080, 0, 0, 0): subject.continuePullThres...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1080, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1080, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0014
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0014
     * @tc.desc      new AnimationAttribute(0, 1920, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0014 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 1920, 0, 0, 0);
      logInfo(`new AnimationAttribute(0, 1920, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1920, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(0, 1920, 0, 0, 0): subject.continuePullThres...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1920, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1920, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0015
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0015
     * @tc.desc      new AnimationAttribute(0, -1, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0015 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, -1, 0, 0, 0);
      logInfo(`new AnimationAttribute(0, -1, 0, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, -1, 0, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(0, -1, 0, 0, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, -1, 0, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, -1, 0, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0016
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0016
     * @tc.desc      new AnimationAttribute(0, 0, 1, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0016 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 1, 0, 0);
      logInfo(`new AnimationAttribute(0, 0, 1, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 1, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 1, 0, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(1);
      logInfo(`new AnimationAttribute(0, 0, 1, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 1, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0017
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0017
     * @tc.desc      new AnimationAttribute(0, 0, -1, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0017 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, -1, 0, 0);
      logInfo(`new AnimationAttribute(0, 0, -1, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, -1, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, -1, 0, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(-1);
      logInfo(`new AnimationAttribute(0, 0, -1, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, -1, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0018
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0018
     * @tc.desc      new AnimationAttribute(0, 0, 2, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0018 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 2, 0, 0);
      logInfo(`new AnimationAttribute(0, 0, 2, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 2, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 2, 0, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(0, 0, 2, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 2, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0019
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0019
     * @tc.desc      new AnimationAttribute(0, 0, 3, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0019 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 3, 0, 0);
      logInfo(`new AnimationAttribute(0, 0, 3, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 3, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 3, 0, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(3);
      logInfo(`new AnimationAttribute(0, 0, 3, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 3, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0020
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0020
     * @tc.desc      new AnimationAttribute(0, 0, 10, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0020 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 10, 0, 0);
      logInfo(`new AnimationAttribute(0, 0, 10, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 10, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 10, 0, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(10);
      logInfo(`new AnimationAttribute(0, 0, 10, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 10, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0021
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0021
     * @tc.desc      new AnimationAttribute(0, 0, 100, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0021 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 100, 0, 0);
      logInfo(`new AnimationAttribute(0, 0, 100, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 100, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 100, 0, 0): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(0, 0, 100, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 100, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0022
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0022
     * @tc.desc      new AnimationAttribute(0, 0, 5, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0022 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 5, 0, 0);
      logInfo(`new AnimationAttribute(0, 0, 5, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 5, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 5, 0, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(5);
      logInfo(`new AnimationAttribute(0, 0, 5, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 5, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0023
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0023
     * @tc.desc      new AnimationAttribute(0, 0, 0, 0.25, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0023 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 0.25, 0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0.25, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0.25, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0.25, 0): subject.continuePullThres...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0.25, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.25, PRECISION);
      logInfo(`new AnimationAttribute(0, 0, 0, 0.25, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0024
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0024
     * @tc.desc      new AnimationAttribute(0, 0, 0, 0.5, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0024 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 0.5, 0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0.5, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0.5, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0.5, 0): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0.5, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.5, PRECISION);
      logInfo(`new AnimationAttribute(0, 0, 0, 0.5, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0025
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0025
     * @tc.desc      new AnimationAttribute(0, 0, 0, 1, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0025 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 1, 0);
      logInfo(`new AnimationAttribute(0, 0, 0, 1, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 1, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 1, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 1, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(0, 0, 0, 1, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0026
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0026
     * @tc.desc      new AnimationAttribute(0, 0, 0, 1.5, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0026 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 1.5, 0);
      logInfo(`new AnimationAttribute(0, 0, 0, 1.5, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 1.5, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 1.5, 0): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 1.5, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(1.5, PRECISION);
      logInfo(`new AnimationAttribute(0, 0, 0, 1.5, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0027
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0027
     * @tc.desc      new AnimationAttribute(0, 0, 0, 2, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0027 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 2, 0);
      logInfo(`new AnimationAttribute(0, 0, 0, 2, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 2, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 2, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 2, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(2);
      logInfo(`new AnimationAttribute(0, 0, 0, 2, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0028
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0028
     * @tc.desc      new AnimationAttribute(0, 0, 0, -1, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0028 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, -1, 0);
      logInfo(`new AnimationAttribute(0, 0, 0, -1, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, -1, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, -1, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, -1, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(-1);
      logInfo(`new AnimationAttribute(0, 0, 0, -1, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0029
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0029
     * @tc.desc      new AnimationAttribute(0, 0, 0, 3, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0029 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 3, 0);
      logInfo(`new AnimationAttribute(0, 0, 0, 3, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 3, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 3, 0): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 3, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(3);
      logInfo(`new AnimationAttribute(0, 0, 0, 3, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0030
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0030
     * @tc.desc      new AnimationAttribute(0, 0, 0, 0, 500) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0030 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 0, 500);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 500): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 500): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 500): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 500): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 500): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(500);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0031
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0031
     * @tc.desc      new AnimationAttribute(0, 0, 0, 0, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0031 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 0, 999);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 999): subject.continuePullThresh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0032
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0032
     * @tc.desc      new AnimationAttribute(0, 0, 0, 0, 1000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0032 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 0, 1000);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 1000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 1000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 1000): subject.continuePullThres...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 1000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 1000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(1000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0033
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0033
     * @tc.desc      new AnimationAttribute(0, 0, 0, 0, 59999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0033 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 0, 59999);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 59999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 59999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 59999): subject.continuePullThre...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 59999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 59999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(59999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0034
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0034
     * @tc.desc      new AnimationAttribute(0, 0, 0, 0, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0034 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 0, 60000);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 60000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 60000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 60000): subject.continuePullThre...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 60000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 60000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0035
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0035
     * @tc.desc      new AnimationAttribute(0, 0, 0, 0, 61000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0035 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 0, 61000);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 61000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 61000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 61000): subject.continuePullThre...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 61000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 61000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(61000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0036
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0036
     * @tc.desc      new AnimationAttribute(0, 0, 0, 0, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0036 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 0, 0, 3599000);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 3599000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 3599000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 3599000): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 3599000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 0, 0, 3599000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0037
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0037
     * @tc.desc      new AnimationAttribute(1920, 1080, 5, 1, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0037 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 1080, 5, 1, 999);
      logInfo(`new AnimationAttribute(1920, 1080, 5, 1, ...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 1080, 5, 1, ...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1920, 1080, 5, 1, ...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(5);
      logInfo(`new AnimationAttribute(1920, 1080, 5, 1, ...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(1920, 1080, 5, 1, ...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0038
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0038
     * @tc.desc      new AnimationAttribute(0, 1920, 100, 2, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0038 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 1920, 100, 2, 3599000);
      logInfo(`new AnimationAttribute(0, 1920, 100, 2, 3...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 1920, 100, 2, 3...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(0, 1920, 100, 2, 3...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(0, 1920, 100, 2, 3...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(2);
      logInfo(`new AnimationAttribute(0, 1920, 100, 2, 3...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0039
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0039
     * @tc.desc      new AnimationAttribute(720, 1, 10, 0.25, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0039 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(720, 1, 10, 0.25, 60000);
      logInfo(`new AnimationAttribute(720, 1, 10, 0.25, ...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(720, 1, 10, 0.25, ...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(720, 1, 10, 0.25, ...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(10);
      logInfo(`new AnimationAttribute(720, 1, 10, 0.25, ...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.25, PRECISION);
      logInfo(`new AnimationAttribute(720, 1, 10, 0.25, ...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0040
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0040
     * @tc.desc      new AnimationAttribute(1, -1, 10, 0.25, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0040 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, -1, 10, 0.25, 3599000);
      logInfo(`new AnimationAttribute(1, -1, 10, 0.25, 3...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, -1, 10, 0.25, 3...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(1, -1, 10, 0.25, 3...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(10);
      logInfo(`new AnimationAttribute(1, -1, 10, 0.25, 3...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.25, PRECISION);
      logInfo(`new AnimationAttribute(1, -1, 10, 0.25, 3...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0041
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0041
     * @tc.desc      new AnimationAttribute(100, 100, -1, 1.5, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0041 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(100, 100, -1, 1.5, 999);
      logInfo(`new AnimationAttribute(100, 100, -1, 1.5,...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, 100, -1, 1.5,...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, 100, -1, 1.5,...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(-1);
      logInfo(`new AnimationAttribute(100, 100, -1, 1.5,...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(1.5, PRECISION);
      logInfo(`new AnimationAttribute(100, 100, -1, 1.5,...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0042
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0042
     * @tc.desc      new AnimationAttribute(1, 1920, 10, 0, 61000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0042 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, 1920, 10, 0, 61000);
      logInfo(`new AnimationAttribute(1, 1920, 10, 0, 61...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 1920, 10, 0, 61...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1, 1920, 10, 0, 61...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(10);
      logInfo(`new AnimationAttribute(1, 1920, 10, 0, 61...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(1, 1920, 10, 0, 61...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(61000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0043
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0043
     * @tc.desc      new AnimationAttribute(1, 1, 100, 1, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0043 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, 1, 100, 1, 999);
      logInfo(`new AnimationAttribute(1, 1, 100, 1, 999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 1, 100, 1, 999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 1, 100, 1, 999): subject.continuePullThre...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(1, 1, 100, 1, 999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 1, 100, 1, 999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0044
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0044
     * @tc.desc      new AnimationAttribute(-1, 1920, 5, 0, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0044 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 1920, 5, 0, 60000);
      logInfo(`new AnimationAttribute(-1, 1920, 5, 0, 60...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 1920, 5, 0, 60...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(-1, 1920, 5, 0, 60...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(5);
      logInfo(`new AnimationAttribute(-1, 1920, 5, 0, 60...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(-1, 1920, 5, 0, 60...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0045
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0045
     * @tc.desc      new AnimationAttribute(-1, 720, 0, 0.5, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0045 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 720, 0, 0.5, 3599000);
      logInfo(`new AnimationAttribute(-1, 720, 0, 0.5, 3...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 720, 0, 0.5, 3...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(-1, 720, 0, 0.5, 3...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(-1, 720, 0, 0.5, 3...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.5, PRECISION);
      logInfo(`new AnimationAttribute(-1, 720, 0, 0.5, 3...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0046
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0046
     * @tc.desc      new AnimationAttribute(1080, 1, 10, 1, 61000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0046 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 1, 10, 1, 61000);
      logInfo(`new AnimationAttribute(1080, 1, 10, 1, 61...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 1, 10, 1, 61...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1080, 1, 10, 1, 61...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(10);
      logInfo(`new AnimationAttribute(1080, 1, 10, 1, 61...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(1080, 1, 10, 1, 61...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(61000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0047
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0047
     * @tc.desc      new AnimationAttribute(1, 720, 100, -1, 1000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0047 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, 720, 100, -1, 1000);
      logInfo(`new AnimationAttribute(1, 720, 100, -1, 1...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 720, 100, -1, 1...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(1, 720, 100, -1, 1...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(1, 720, 100, -1, 1...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(-1);
      logInfo(`new AnimationAttribute(1, 720, 100, -1, 1...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(1000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0048
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0048
     * @tc.desc      new AnimationAttribute(1080, 1920, 3, 1.5, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0048 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 1920, 3, 1.5, 60000);
      logInfo(`new AnimationAttribute(1080, 1920, 3, 1.5...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 1920, 3, 1.5...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1080, 1920, 3, 1.5...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(3);
      logInfo(`new AnimationAttribute(1080, 1920, 3, 1.5...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(1.5, PRECISION);
      logInfo(`new AnimationAttribute(1080, 1920, 3, 1.5...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0049
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0049
     * @tc.desc      new AnimationAttribute(1920, 1, 2, -1, 500) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0049 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1920, 1, 2, -1, 500);
      logInfo(`new AnimationAttribute(1920, 1, 2, -1, 500): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1920);
      logInfo(`new AnimationAttribute(1920, 1, 2, -1, 500): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1920, 1, 2, -1, 500): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(1920, 1, 2, -1, 500): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(-1);
      logInfo(`new AnimationAttribute(1920, 1, 2, -1, 500): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(500);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0050
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0050
     * @tc.desc      new AnimationAttribute(1080, 720, 1, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0050 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 720, 1, 0, 0);
      logInfo(`new AnimationAttribute(1080, 720, 1, 0, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 720, 1, 0, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(1080, 720, 1, 0, 0): subject.continuePullThr...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(1);
      logInfo(`new AnimationAttribute(1080, 720, 1, 0, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(1080, 720, 1, 0, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0051
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0051
     * @tc.desc      new AnimationAttribute(1080, 1080, 3, -1, 1000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0051 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 1080, 3, -1, 1000);
      logInfo(`new AnimationAttribute(1080, 1080, 3, -1,...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 1080, 3, -1,...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 1080, 3, -1,...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(3);
      logInfo(`new AnimationAttribute(1080, 1080, 3, -1,...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(-1);
      logInfo(`new AnimationAttribute(1080, 1080, 3, -1,...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(1000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0052
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0052
     * @tc.desc      new AnimationAttribute(-1, 720, 2, 1, 1000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0052 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 720, 2, 1, 1000);
      logInfo(`new AnimationAttribute(-1, 720, 2, 1, 1000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 720, 2, 1, 1000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(-1, 720, 2, 1, 1000): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(-1, 720, 2, 1, 1000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(-1, 720, 2, 1, 1000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(1000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0053
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0053
     * @tc.desc      new AnimationAttribute(1, 360, 100, 1.5, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0053 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, 360, 100, 1.5, 0);
      logInfo(`new AnimationAttribute(1, 360, 100, 1.5, 0): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 360, 100, 1.5, 0): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(1, 360, 100, 1.5, 0): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(1, 360, 100, 1.5, 0): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(1.5, PRECISION);
      logInfo(`new AnimationAttribute(1, 360, 100, 1.5, 0): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0054
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0054
     * @tc.desc      new AnimationAttribute(1, -1, 5, 2, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0054 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, -1, 5, 2, 3599000);
      logInfo(`new AnimationAttribute(1, -1, 5, 2, 3599000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, -1, 5, 2, 3599000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(1, -1, 5, 2, 3599000): subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(5);
      logInfo(`new AnimationAttribute(1, -1, 5, 2, 3599000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(2);
      logInfo(`new AnimationAttribute(1, -1, 5, 2, 3599000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0055
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0055
     * @tc.desc      new AnimationAttribute(1, 0, 3, 1, 61000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0055 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, 0, 3, 1, 61000);
      logInfo(`new AnimationAttribute(1, 0, 3, 1, 61000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 0, 3, 1, 61000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(1, 0, 3, 1, 61000): subject.continuePullThre...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(3);
      logInfo(`new AnimationAttribute(1, 0, 3, 1, 61000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 0, 3, 1, 61000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(61000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0056
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0056
     * @tc.desc      new AnimationAttribute(0, 100, 2, 2, 61000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0056 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 100, 2, 2, 61000);
      logInfo(`new AnimationAttribute(0, 100, 2, 2, 61000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 100, 2, 2, 61000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(0, 100, 2, 2, 61000): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(0, 100, 2, 2, 61000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(2);
      logInfo(`new AnimationAttribute(0, 100, 2, 2, 61000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(61000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0057
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0057
     * @tc.desc      new AnimationAttribute(0, 0, 10, 0.25, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0057 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(0, 0, 10, 0.25, 3599000);
      logInfo(`new AnimationAttribute(0, 0, 10, 0.25, 35...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 10, 0.25, 35...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(0);
      logInfo(`new AnimationAttribute(0, 0, 10, 0.25, 35...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(10);
      logInfo(`new AnimationAttribute(0, 0, 10, 0.25, 35...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.25, PRECISION);
      logInfo(`new AnimationAttribute(0, 0, 10, 0.25, 35...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0058
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0058
     * @tc.desc      new AnimationAttribute(1080, 1, 100, 0.5, 1000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0058 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1080, 1, 100, 0.5, 1000);
      logInfo(`new AnimationAttribute(1080, 1, 100, 0.5,...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1080);
      logInfo(`new AnimationAttribute(1080, 1, 100, 0.5,...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1080, 1, 100, 0.5,...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(1080, 1, 100, 0.5,...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.5, PRECISION);
      logInfo(`new AnimationAttribute(1080, 1, 100, 0.5,...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(1000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0059
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0059
     * @tc.desc      new AnimationAttribute(1, -1, 0, -1, 1000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0059 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, -1, 0, -1, 1000);
      logInfo(`new AnimationAttribute(1, -1, 0, -1, 1000): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, -1, 0, -1, 1000): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(1, -1, 0, -1, 1000): subject.continuePullThr...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(0);
      logInfo(`new AnimationAttribute(1, -1, 0, -1, 1000): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(-1);
      logInfo(`new AnimationAttribute(1, -1, 0, -1, 1000): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(1000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0060
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0060
     * @tc.desc      new AnimationAttribute(360, 720, 100, 1, 500) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0060 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(360, 720, 100, 1, 500);
      logInfo(`new AnimationAttribute(360, 720, 100, 1, ...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(360, 720, 100, 1, ...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(360, 720, 100, 1, ...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(100);
      logInfo(`new AnimationAttribute(360, 720, 100, 1, ...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(360, 720, 100, 1, ...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(500);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0061
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0061
     * @tc.desc      new AnimationAttribute(-1, 360, 10, 0, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0061 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(-1, 360, 10, 0, 999);
      logInfo(`new AnimationAttribute(-1, 360, 10, 0, 999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(-1);
      logInfo(`new AnimationAttribute(-1, 360, 10, 0, 999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(-1, 360, 10, 0, 999): subject.continuePullTh...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(10);
      logInfo(`new AnimationAttribute(-1, 360, 10, 0, 999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(0);
      logInfo(`new AnimationAttribute(-1, 360, 10, 0, 999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0062
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0062
     * @tc.desc      new AnimationAttribute(100, 1, 2, 0.5, 60000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0062 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(100, 1, 2, 0.5, 60000);
      logInfo(`new AnimationAttribute(100, 1, 2, 0.5, 60...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(100);
      logInfo(`new AnimationAttribute(100, 1, 2, 0.5, 60...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(100, 1, 2, 0.5, 60...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(100, 1, 2, 0.5, 60...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(0.5, PRECISION);
      logInfo(`new AnimationAttribute(100, 1, 2, 0.5, 60...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(60000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0063
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0063
     * @tc.desc      new AnimationAttribute(360, 360, -1, 1, 999) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0063 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(360, 360, -1, 1, 999);
      logInfo(`new AnimationAttribute(360, 360, -1, 1, 999): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(360, 360, -1, 1, 999): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(360);
      logInfo(`new AnimationAttribute(360, 360, -1, 1, 999): subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(-1);
      logInfo(`new AnimationAttribute(360, 360, -1, 1, 999): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(1);
      logInfo(`new AnimationAttribute(360, 360, -1, 1, 999): subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(999);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATION_ATTRIBUTE_CTOR_0064
     * @tc.name      ExpandTitle_AnimationAttributeCtor_0064
     * @tc.desc      new AnimationAttribute(1, 720, 2, 3, 3599000) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_AnimationAttributeCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0064 begin`);
      const subject: AnimationAttribute = new AnimationAttribute(1, 720, 2, 3, 3599000);
      logInfo(`new AnimationAttribute(1, 720, 2, 3, 3599...: subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(1);
      logInfo(`new AnimationAttribute(1, 720, 2, 3, 3599...: subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(720);
      logInfo(`new AnimationAttribute(1, 720, 2, 3, 3599...: subject.continuePullT...${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(2);
      logInfo(`new AnimationAttribute(1, 720, 2, 3, 3599...: subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertEqual(3);
      logInfo(`new AnimationAttribute(1, 720, 2, 3, 3599...: subject.animationDuration=${subject.animationDuration}`);
      expect(subject.animationDuration).assertEqual(3599000);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0064 end`);
    });
  });
}
