/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AnimationAttribute } from '../../../main/ets/model/AnimationAttribute';
import Constants from '../../../main/ets/constants/Constants';
import { Configure } from '../../../main/ets/pages/Configure';

const DOMAIN: number = 0xF814;
const TAG: string = 'AnimationAttributeModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function animationAttributeModelCoreTest(): void {
  describe('AnimationAttributeModelCoreTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0401
     * @tc.name      testAnimationAttributeModelCore0401
     * @tc.desc      Verify normalTitleHeight getter returns the configured value 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0401 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, 120);
      const actual: number = attr.normalTitleHeight;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=80`);
      expect(actual).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testAnimationAttributeModelCore0401 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0402
     * @tc.name      testAnimationAttributeModelCore0402
     * @tc.desc      Verify expandTitleHeight getter returns the configured value 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0402 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, 120);
      const actual: number = attr.expandTitleHeight;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=100`);
      expect(actual).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testAnimationAttributeModelCore0402 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0403
     * @tc.name      testAnimationAttributeModelCore0403
     * @tc.desc      Verify continuePullThreshold getter returns the configured value 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0403 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, 120);
      const actual: number = attr.continuePullThreshold;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=90`);
      expect(actual).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testAnimationAttributeModelCore0403 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0404
     * @tc.name      testAnimationAttributeModelCore0404
     * @tc.desc      Verify titleScale getter returns the configured value 1.2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0404 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, 120);
      const actual: number = attr.titleScale;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1.2`);
      expect(actual).assertEqual(1.2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testAnimationAttributeModelCore0404 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0405
     * @tc.name      testAnimationAttributeModelCore0405
     * @tc.desc      Verify animationDuration getter returns the configured value 120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0405 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, 120);
      const actual: number = attr.animationDuration;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=120`);
      expect(actual).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testAnimationAttributeModelCore0405 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0406
     * @tc.name      testAnimationAttributeModelCore0406
     * @tc.desc      Verify zero normal title height is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0406 begin');
      const attr: AnimationAttribute = new AnimationAttribute(0, 100, 90, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.normalTitleHeight=${attr.normalTitleHeight}, expected=0`);
      expect(attr.normalTitleHeight).assertEqual(0);
      log('testAnimationAttributeModelCore0406 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0407
     * @tc.name      testAnimationAttributeModelCore0407
     * @tc.desc      Verify negative normal title height is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0407 begin');
      const attr: AnimationAttribute = new AnimationAttribute(-10, 100, 90, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.normalTitleHeight=${attr.normalTitleHeight}`);
      expect(attr.normalTitleHeight).assertEqual(-10);
      log('testAnimationAttributeModelCore0407 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0408
     * @tc.name      testAnimationAttributeModelCore0408
     * @tc.desc      Verify very large normal title height is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0408 begin');
      const attr: AnimationAttribute = new AnimationAttribute(100000, 100, 90, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.normalTitleHeight=${attr.normalTitleHeight}`);
      expect(attr.normalTitleHeight).assertEqual(100000);
      log('testAnimationAttributeModelCore0408 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0409
     * @tc.name      testAnimationAttributeModelCore0409
     * @tc.desc      Verify fractional normal title height is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0409 begin');
      const attr: AnimationAttribute = new AnimationAttribute(0.5, 100, 90, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.normalTitleHeight=${attr.normalTitleHeight}`);
      expect(attr.normalTitleHeight).assertEqual(0.5);
      log('testAnimationAttributeModelCore0409 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0410
     * @tc.name      testAnimationAttributeModelCore0410
     * @tc.desc      Verify zero expand title height is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0410 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 0, 90, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.expandTitleHeight=${attr.expandTitleHeight}, expected=0`);
      expect(attr.expandTitleHeight).assertEqual(0);
      log('testAnimationAttributeModelCore0410 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0411
     * @tc.name      testAnimationAttributeModelCore0411
     * @tc.desc      Verify negative expand title height is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0411 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, -20, 90, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.expandTitleHeight=${attr.expandTitleHeight}`);
      expect(attr.expandTitleHeight).assertEqual(-20);
      log('testAnimationAttributeModelCore0411 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0412
     * @tc.name      testAnimationAttributeModelCore0412
     * @tc.desc      Verify very large expand title height is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0412 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 200000, 90, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.expandTitleHeight=${attr.expandTitleHeight}`);
      expect(attr.expandTitleHeight).assertEqual(200000);
      log('testAnimationAttributeModelCore0412 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0413
     * @tc.name      testAnimationAttributeModelCore0413
     * @tc.desc      Verify fractional expand title height is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0413 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 1.25, 90, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.expandTitleHeight=${attr.expandTitleHeight}`);
      expect(attr.expandTitleHeight).assertEqual(1.25);
      log('testAnimationAttributeModelCore0413 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0414
     * @tc.name      testAnimationAttributeModelCore0414
     * @tc.desc      Verify zero continue pull threshold is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0414 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 0, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.continuePullThreshold=${attr.continuePullThreshold}`);
      expect(attr.continuePullThreshold).assertEqual(0);
      log('testAnimationAttributeModelCore0414 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0415
     * @tc.name      testAnimationAttributeModelCore0415
     * @tc.desc      Verify negative continue pull threshold is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0415 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, -90, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.continuePullThreshold=${attr.continuePullThreshold}`);
      expect(attr.continuePullThreshold).assertEqual(-90);
      log('testAnimationAttributeModelCore0415 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0416
     * @tc.name      testAnimationAttributeModelCore0416
     * @tc.desc      Verify very large continue pull threshold is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0416 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 999999, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.continuePullThreshold=${attr.continuePullThreshold}`);
      expect(attr.continuePullThreshold).assertEqual(999999);
      log('testAnimationAttributeModelCore0416 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0417
     * @tc.name      testAnimationAttributeModelCore0417
     * @tc.desc      Verify fractional continue pull threshold is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0417 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 0.9, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.continuePullThreshold=${attr.continuePullThreshold}`);
      expect(attr.continuePullThreshold).assertEqual(0.9);
      log('testAnimationAttributeModelCore0417 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0418
     * @tc.name      testAnimationAttributeModelCore0418
     * @tc.desc      Verify zero title scale is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0418 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 0, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.titleScale=${attr.titleScale}, expected=0`);
      expect(attr.titleScale).assertEqual(0);
      log('testAnimationAttributeModelCore0418 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0419
     * @tc.name      testAnimationAttributeModelCore0419
     * @tc.desc      Verify negative title scale is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0419 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, -1.5, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.titleScale=${attr.titleScale}, expected=-1.5`);
      expect(attr.titleScale).assertEqual(-1.5);
      log('testAnimationAttributeModelCore0419 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0420
     * @tc.name      testAnimationAttributeModelCore0420
     * @tc.desc      Verify very large title scale is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0420 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 10, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.titleScale=${attr.titleScale}, expected=10`);
      expect(attr.titleScale).assertEqual(10);
      log('testAnimationAttributeModelCore0420 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0421
     * @tc.name      testAnimationAttributeModelCore0421
     * @tc.desc      Verify fractional title scale is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0421 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 2.75, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.titleScale=${attr.titleScale}, expected=2.75`);
      expect(attr.titleScale).assertEqual(2.75);
      log('testAnimationAttributeModelCore0421 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0422
     * @tc.name      testAnimationAttributeModelCore0422
     * @tc.desc      Verify zero animation duration is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0422 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.animationDuration=${attr.animationDuration}, expected=0`);
      expect(attr.animationDuration).assertEqual(0);
      log('testAnimationAttributeModelCore0422 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0423
     * @tc.name      testAnimationAttributeModelCore0423
     * @tc.desc      Verify negative animation duration is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0423 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, -100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.animationDuration=${attr.animationDuration}`);
      expect(attr.animationDuration).assertEqual(-100);
      log('testAnimationAttributeModelCore0423 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0424
     * @tc.name      testAnimationAttributeModelCore0424
     * @tc.desc      Verify very large animation duration is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0424 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, 1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.animationDuration=${attr.animationDuration}`);
      expect(attr.animationDuration).assertEqual(1000000);
      log('testAnimationAttributeModelCore0424 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0425
     * @tc.name      testAnimationAttributeModelCore0425
     * @tc.desc      Verify fractional animation duration is stored as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0425 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, 0.1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.animationDuration=${attr.animationDuration}`);
      expect(attr.animationDuration).assertEqual(0.1);
      log('testAnimationAttributeModelCore0425 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0426
     * @tc.name      testAnimationAttributeModelCore0426
     * @tc.desc      Verify standard config keeps expanded height larger than normal height.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0426 begin');
      const attr: AnimationAttribute = new AnimationAttribute(Configure.NORMAL_TITLE_HEIGHT,
        Configure.EXPAND_TITLE_HEIGHT, Configure.CONTINUE_PULL_THRESHOLD, Configure.TITLE_SCALE_MAX_VALUE,
        Configure.ANIMATION_DURATION);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${attr.expandTitleHeight > attr.normalTitleHeight}`);
      expect(attr.expandTitleHeight > attr.normalTitleHeight).assertTrue();
      log('testAnimationAttributeModelCore0426 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0427
     * @tc.name      testAnimationAttributeModelCore0427
     * @tc.desc      Verify two instances with different configs stay independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0427 begin');
      const first: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, 120);
      const second: AnimationAttribute = new AnimationAttribute(60, 90, 50, 1.5, 200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.normalTitleHeight=${first.normalTitleHeight}`);
      expect(first.normalTitleHeight).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.normalTitleHeight=${second.normalTitleHeight}`);
      expect(second.normalTitleHeight).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.animationDuration=${first.animationDuration}`);
      expect(first.animationDuration).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.animationDuration=${second.animationDuration}`);
      expect(second.animationDuration).assertEqual(200);
      log('testAnimationAttributeModelCore0427 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0428
     * @tc.name      testAnimationAttributeModelCore0428
     * @tc.desc      Verify repeated getter reads stay stable on one instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0428 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.titleScale=${attr.titleScale}, expected=attr.titleScale`);
      expect(attr.titleScale).assertEqual(attr.titleScale);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.continuePullThreshold=${attr.continuePullThreshold}`);
      expect(attr.continuePullThreshold).assertEqual(attr.continuePullThreshold);
      log('testAnimationAttributeModelCore0428 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0429
     * @tc.name      testAnimationAttributeModelCore0429
     * @tc.desc      Verify constructed instance is recognized as AnimationAttribute.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0429 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90, 1.2, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${attr instanceof AnimationAttribute}`);
      expect(attr instanceof AnimationAttribute).assertTrue();
      log('testAnimationAttributeModelCore0429 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0430
     * @tc.name      testAnimationAttributeModelCore0430
     * @tc.desc      Verify all getters snapshot the constructor input values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0430 begin');
      const attr: AnimationAttribute = new AnimationAttribute(60, 90, 40, 1.1, 250);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.normalTitleHeight=${attr.normalTitleHeight}`);
      expect(attr.normalTitleHeight).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.expandTitleHeight=${attr.expandTitleHeight}`);
      expect(attr.expandTitleHeight).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.continuePullThreshold=${attr.continuePullThreshold}`);
      expect(attr.continuePullThreshold).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.titleScale=${attr.titleScale}, expected=1.1`);
      expect(attr.titleScale).assertEqual(1.1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.animationDuration=${attr.animationDuration}`);
      expect(attr.animationDuration).assertEqual(250);
      log('testAnimationAttributeModelCore0430 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0431
     * @tc.name      testAnimationAttributeModelCore0431
     * @tc.desc      Verify default scale constant stored as title scale keeps value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0431 begin');
      const attr: AnimationAttribute = new AnimationAttribute(80, 100, 90,
        Constants.TITLE_SCALE_DEFAULT_VALUE, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.titleScale=${attr.titleScale}, expected=1`);
      expect(attr.titleScale).assertEqual(1);
      log('testAnimationAttributeModelCore0431 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0432
     * @tc.name      testAnimationAttributeModelCore0432
     * @tc.desc      Verify constants based config is stored verbatim in the model.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0432 begin');
      const attr: AnimationAttribute = new AnimationAttribute(Constants.NORMAL_TITLE_HEIGHT,
        Constants.EXPAND_TITLE_HEIGHT, Constants.CONTINUE_PULL_THRESHOLD, Constants.TITLE_SCALE_MAX_VALUE,
        Constants.ANIMATION_DURATION);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.normalTitleHeight=${attr.normalTitleHeight}`);
      expect(attr.normalTitleHeight).assertEqual(Constants.NORMAL_TITLE_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.expandTitleHeight=${attr.expandTitleHeight}`);
      expect(attr.expandTitleHeight).assertEqual(Constants.EXPAND_TITLE_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.continuePullThreshold=${attr.continuePullThreshold}`);
      expect(attr.continuePullThreshold).assertEqual(Constants.CONTINUE_PULL_THRESHOLD);
      log('testAnimationAttributeModelCore0432 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_ANIMATTR_0433
     * @tc.name      testAnimationAttributeModelCore0433
     * @tc.desc      Verify configure based config equals constants based config.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAnimationAttributeModelCore0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAnimationAttributeModelCore0433 begin');
      const fromConfigure: AnimationAttribute = new AnimationAttribute(Configure.NORMAL_TITLE_HEIGHT,
        Configure.EXPAND_TITLE_HEIGHT, Configure.CONTINUE_PULL_THRESHOLD, Configure.TITLE_SCALE_MAX_VALUE,
        Configure.ANIMATION_DURATION);
      const fromConstants: AnimationAttribute = new AnimationAttribute(Constants.NORMAL_TITLE_HEIGHT,
        Constants.EXPAND_TITLE_HEIGHT, Constants.CONTINUE_PULL_THRESHOLD, Constants.TITLE_SCALE_MAX_VALUE,
        Constants.ANIMATION_DURATION);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${fromConfigure.normalTitleHeight}`);
      expect(fromConfigure.normalTitleHeight).assertEqual(fromConstants.normalTitleHeight);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${fromConfigure.expandTitleHeight}`);
      expect(fromConfigure.expandTitleHeight).assertEqual(fromConstants.expandTitleHeight);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${fromConfigure.continuePullThreshold}`);
      expect(fromConfigure.continuePullThreshold).assertEqual(fromConstants.continuePullThreshold);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fromConfigure.titleScale=${fromConfigure.titleScale}`);
      expect(fromConfigure.titleScale).assertEqual(fromConstants.titleScale);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${fromConfigure.animationDuration}`);
      expect(fromConfigure.animationDuration).assertEqual(fromConstants.animationDuration);
      log('testAnimationAttributeModelCore0433 end');
    })
  })
}
