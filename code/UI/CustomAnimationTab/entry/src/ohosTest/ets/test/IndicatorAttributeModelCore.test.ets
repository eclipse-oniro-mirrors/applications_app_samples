/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  AnimationAttribute, IndicatorBarAttribute, SizeMode, BaseInterface, MyAnimationAttribute
} from '../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'IndicatorAttrCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

@Builder
function indicatorTestBar($$: BaseInterface) {
  Column() {
  }
}

function makeIndicatorBar(): (index: BaseInterface) => void {
  return wrapBuilder(indicatorTestBar).builder;
}

export default function indicatorAttributeModelCoreTest(): void {
  describe('IndicatorAttributeModelCoreTest', () => {
    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0401
     * @tc.name      testIndicatorAttr0401
     * @tc.desc      Verify AnimationAttribute defaults left to zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0401 begin');
      const attr: AnimationAttribute = new AnimationAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.left=${attr.left}, expected=0`);
      expect(attr.left).assertEqual(0);
      log('testIndicatorAttr0401 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0402
     * @tc.name      testIndicatorAttr0402
     * @tc.desc      Verify AnimationAttribute defaults indicatorBarWidth to zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0402 begin');
      const attr: AnimationAttribute = new AnimationAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorBarWidth=${attr.indicatorBarWidth}, expected=0`);
      expect(attr.indicatorBarWidth).assertEqual(0);
      log('testIndicatorAttr0402 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0403
     * @tc.name      testIndicatorAttr0403
     * @tc.desc      Verify AnimationAttribute defaults indicatorBarHeight to zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0403 begin');
      const attr: AnimationAttribute = new AnimationAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorBarHeight=${attr.indicatorBarHeight}`);
      expect(attr.indicatorBarHeight).assertEqual(0);
      log('testIndicatorAttr0403 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0404
     * @tc.name      testIndicatorAttr0404
     * @tc.desc      Verify left accepts a positive value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0404 begin');
      const attr: AnimationAttribute = new AnimationAttribute();
      attr.left = 120;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.left=${attr.left}, expected=120`);
      expect(attr.left).assertEqual(120);
      log('testIndicatorAttr0404 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0405
     * @tc.name      testIndicatorAttr0405
     * @tc.desc      Verify width and height accept positive values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0405 begin');
      const attr: AnimationAttribute = new AnimationAttribute();
      attr.indicatorBarWidth = 90;
      attr.indicatorBarHeight = 40;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorBarWidth=${attr.indicatorBarWidth}`);
      expect(attr.indicatorBarWidth).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorBarHeight=${attr.indicatorBarHeight}`);
      expect(attr.indicatorBarHeight).assertEqual(40);
      log('testIndicatorAttr0405 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0406
     * @tc.name      testIndicatorAttr0406
     * @tc.desc      Verify all three default fields stay number typed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0406 begin');
      const attr: AnimationAttribute = new AnimationAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof attr.left=${typeof attr.left}, expected='number'`);
      expect(typeof attr.left).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof attr.indicatorBarWidth}, expected='number'`);
      expect(typeof attr.indicatorBarWidth).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof attr.indicatorBarHeight}, expected='number'`);
      expect(typeof attr.indicatorBarHeight).assertEqual('number');
      log('testIndicatorAttr0406 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0407
     * @tc.name      testIndicatorAttr0407
     * @tc.desc      Verify left accepts a negative value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0407 begin');
      const attr: AnimationAttribute = new AnimationAttribute();
      attr.left = -30;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.left=${attr.left}, expected=-30`);
      expect(attr.left).assertEqual(-30);
      log('testIndicatorAttr0407 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0408
     * @tc.name      testIndicatorAttr0408
     * @tc.desc      Verify left accepts a fractional value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0408 begin');
      const attr: AnimationAttribute = new AnimationAttribute();
      attr.left = 12.5;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.left=${attr.left}, expected=12.5`);
      expect(attr.left).assertEqual(12.5);
      log('testIndicatorAttr0408 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0409
     * @tc.name      testIndicatorAttr0409
     * @tc.desc      Verify MyAnimationAttribute stores its color and inherits defaults.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0409 begin');
      const attr: MyAnimationAttribute = new MyAnimationAttribute(Color.Red);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorBarColor=${attr.indicatorBarColor}`);
      expect(attr.indicatorBarColor).assertEqual(Color.Red);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.left=${attr.left}, expected=0`);
      expect(attr.left).assertEqual(0);
      log('testIndicatorAttr0409 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0410
     * @tc.name      testIndicatorAttr0410
     * @tc.desc      Verify MyAnimationAttribute extends AnimationAttribute.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0410 begin');
      const attr: MyAnimationAttribute = new MyAnimationAttribute(Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${attr instanceof AnimationAttribute}`);
      expect(attr instanceof AnimationAttribute).assertTrue();
      log('testIndicatorAttr0410 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0411
     * @tc.name      testIndicatorAttr0411
     * @tc.desc      Verify inherited width mutates on the subclass instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0411 begin');
      const attr: MyAnimationAttribute = new MyAnimationAttribute(Color.Gray);
      attr.indicatorBarWidth = 55;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorBarWidth=${attr.indicatorBarWidth}`);
      expect(attr.indicatorBarWidth).assertEqual(55);
      log('testIndicatorAttr0411 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0412
     * @tc.name      testIndicatorAttr0412
     * @tc.desc      Verify SizeMode.Normal maps to zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0412 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SizeMode.Normal=${SizeMode.Normal}, expected=0`);
      expect(SizeMode.Normal).assertEqual(0);
      log('testIndicatorAttr0412 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0413
     * @tc.name      testIndicatorAttr0413
     * @tc.desc      Verify SizeMode.Padding maps to one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0413 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SizeMode.Padding=${SizeMode.Padding}, expected=1`);
      expect(SizeMode.Padding).assertEqual(1);
      log('testIndicatorAttr0413 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0414
     * @tc.name      testIndicatorAttr0414
     * @tc.desc      Verify SizeMode values are number typed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0414 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof SizeMode.Normal=${typeof SizeMode.Normal}`);
      expect(typeof SizeMode.Normal).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof SizeMode.Padding=${typeof SizeMode.Padding}`);
      expect(typeof SizeMode.Padding).assertEqual('number');
      log('testIndicatorAttr0414 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0415
     * @tc.name      testIndicatorAttr0415
     * @tc.desc      Verify the two SizeMode values differ.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0415 begin');
      const normalValue: number = SizeMode.Normal;
      const paddingValue: number = SizeMode.Padding;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue normalValue !== paddingValue=${normalValue !== paddingValue}`);
      expect(normalValue !== paddingValue).assertTrue();
      log('testIndicatorAttr0415 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0416
     * @tc.name      testIndicatorAttr0416
     * @tc.desc      Verify default IndicatorBarAttribute uses Normal size mode.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0416 begin');
      const attr: IndicatorBarAttribute = new IndicatorBarAttribute(makeIndicatorBar());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.sizeMode=${attr.sizeMode}, expected=SizeMode.Normal`);
      expect(attr.sizeMode).assertEqual(SizeMode.Normal);
      log('testIndicatorAttr0416 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0417
     * @tc.name      testIndicatorAttr0417
     * @tc.desc      Verify default IndicatorBarAttribute width is zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0417 begin');
      const attr: IndicatorBarAttribute = new IndicatorBarAttribute(makeIndicatorBar());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorWidth=${attr.indicatorWidth}, expected=0`);
      expect(attr.indicatorWidth).assertEqual(0);
      log('testIndicatorAttr0417 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0418
     * @tc.name      testIndicatorAttr0418
     * @tc.desc      Verify default IndicatorBarAttribute height is zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0418 begin');
      const attr: IndicatorBarAttribute = new IndicatorBarAttribute(makeIndicatorBar());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorHeight=${attr.indicatorHeight}, expected=0`);
      expect(attr.indicatorHeight).assertEqual(0);
      log('testIndicatorAttr0418 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0419
     * @tc.name      testIndicatorAttr0419
     * @tc.desc      Verify default maxIndicatorBarLeft is negative one (no limit).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0419 begin');
      const attr: IndicatorBarAttribute = new IndicatorBarAttribute(makeIndicatorBar());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.maxIndicatorBarLeft=${attr.maxIndicatorBarLeft}`);
      expect(attr.maxIndicatorBarLeft).assertEqual(-1);
      log('testIndicatorAttr0419 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0420
     * @tc.name      testIndicatorAttr0420
     * @tc.desc      Verify default indicatorExpand is one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0420 begin');
      const attr: IndicatorBarAttribute = new IndicatorBarAttribute(makeIndicatorBar());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorExpand=${attr.indicatorExpand}, expected=1`);
      expect(attr.indicatorExpand).assertEqual(1);
      log('testIndicatorAttr0420 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0421
     * @tc.name      testIndicatorAttr0421
     * @tc.desc      Verify default barAlign is Center.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0421 begin');
      const attr: IndicatorBarAttribute = new IndicatorBarAttribute(makeIndicatorBar());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barAlign=${attr.barAlign}`);
      expect(attr.barAlign).assertEqual(VerticalAlign.Center);
      log('testIndicatorAttr0421 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0422
     * @tc.name      testIndicatorAttr0422
     * @tc.desc      Verify a full-arg constructor keeps Padding size mode.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0422 begin');
      const attr: IndicatorBarAttribute =
        new IndicatorBarAttribute(makeIndicatorBar(), SizeMode.Padding, 20, 10, 0, 1, VerticalAlign.Bottom);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.sizeMode=${attr.sizeMode}, expected=SizeMode.Padding`);
      expect(attr.sizeMode).assertEqual(SizeMode.Padding);
      log('testIndicatorAttr0422 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0423
     * @tc.name      testIndicatorAttr0423
     * @tc.desc      Verify full-arg constructor keeps width and height.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0423 begin');
      const attr: IndicatorBarAttribute =
        new IndicatorBarAttribute(makeIndicatorBar(), SizeMode.Padding, 20, 10, 0, 1, VerticalAlign.Bottom);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorWidth=${attr.indicatorWidth}, expected=20`);
      expect(attr.indicatorWidth).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorHeight=${attr.indicatorHeight}, expected=10`);
      expect(attr.indicatorHeight).assertEqual(10);
      log('testIndicatorAttr0423 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0424
     * @tc.name      testIndicatorAttr0424
     * @tc.desc      Verify full-arg constructor keeps max left and expand.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0424 begin');
      const attr: IndicatorBarAttribute =
        new IndicatorBarAttribute(makeIndicatorBar(), SizeMode.Normal, 0, 0, 0, 2, VerticalAlign.Top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.maxIndicatorBarLeft=${attr.maxIndicatorBarLeft}`);
      expect(attr.maxIndicatorBarLeft).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.indicatorExpand=${attr.indicatorExpand}, expected=2`);
      expect(attr.indicatorExpand).assertEqual(2);
      log('testIndicatorAttr0424 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0425
     * @tc.name      testIndicatorAttr0425
     * @tc.desc      Verify full-arg constructor keeps Bottom alignment.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0425 begin');
      const attr: IndicatorBarAttribute =
        new IndicatorBarAttribute(makeIndicatorBar(), SizeMode.Normal, 0, 3, -1, 1, VerticalAlign.Bottom);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barAlign=${attr.barAlign}`);
      expect(attr.barAlign).assertEqual(VerticalAlign.Bottom);
      log('testIndicatorAttr0425 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0426
     * @tc.name      testIndicatorAttr0426
     * @tc.desc      Verify BACKGROUNDBAR preset uses Padding mode.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0426 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${IndicatorBarAttribute.BACKGROUNDBAR.sizeMode}`);
      expect(IndicatorBarAttribute.BACKGROUNDBAR.sizeMode).assertEqual(SizeMode.Padding);
      log('testIndicatorAttr0426 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0427
     * @tc.name      testIndicatorAttr0427
     * @tc.desc      Verify BACKGROUNDBAR preset width/height are 20/10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0427 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${IndicatorBarAttribute.BACKGROUNDBAR.indicatorWidth}`);
      expect(IndicatorBarAttribute.BACKGROUNDBAR.indicatorWidth).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual IndicatorBarAttribute.BACKGROUNDBAR.indicato..., expected=10`);
      expect(IndicatorBarAttribute.BACKGROUNDBAR.indicatorHeight).assertEqual(10);
      log('testIndicatorAttr0427 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0428
     * @tc.name      testIndicatorAttr0428
     * @tc.desc      Verify BACKGROUNDBAR preset max-left is zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0428 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual IndicatorBarAttribute.BACKGROUNDBAR.maxIndica..., expected=0`);
      expect(IndicatorBarAttribute.BACKGROUNDBAR.maxIndicatorBarLeft).assertEqual(0);
      log('testIndicatorAttr0428 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0429
     * @tc.name      testIndicatorAttr0429
     * @tc.desc      Verify BACKGROUNDBAR preset alignment is Center.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0429 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${IndicatorBarAttribute.BACKGROUNDBAR.barAlign}`);
      expect(IndicatorBarAttribute.BACKGROUNDBAR.barAlign).assertEqual(VerticalAlign.Center);
      log('testIndicatorAttr0429 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0430
     * @tc.name      testIndicatorAttr0430
     * @tc.desc      Verify THINSTRIP preset uses Normal mode with zero width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0430 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${IndicatorBarAttribute.THINSTRIP.sizeMode}`);
      expect(IndicatorBarAttribute.THINSTRIP.sizeMode).assertEqual(SizeMode.Normal);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${IndicatorBarAttribute.THINSTRIP.indicatorWidth}`);
      expect(IndicatorBarAttribute.THINSTRIP.indicatorWidth).assertEqual(0);
      log('testIndicatorAttr0430 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0431
     * @tc.name      testIndicatorAttr0431
     * @tc.desc      Verify THINSTRIP preset height is three vp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0431 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${IndicatorBarAttribute.THINSTRIP.indicatorHeight}`);
      expect(IndicatorBarAttribute.THINSTRIP.indicatorHeight).assertEqual(3);
      log('testIndicatorAttr0431 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0432
     * @tc.name      testIndicatorAttr0432
     * @tc.desc      Verify THINSTRIP preset alignment is Bottom.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0432 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${IndicatorBarAttribute.THINSTRIP.barAlign}`);
      expect(IndicatorBarAttribute.THINSTRIP.barAlign).assertEqual(VerticalAlign.Bottom);
      log('testIndicatorAttr0432 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0433
     * @tc.name      testIndicatorAttr0433
     * @tc.desc      Verify indicatorBar getter returns a function reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0433 begin');
      const attr: IndicatorBarAttribute = new IndicatorBarAttribute(makeIndicatorBar());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof attr.indicatorBar=${typeof attr.indicatorBar}`);
      expect(typeof attr.indicatorBar).assertEqual('function');
      log('testIndicatorAttr0433 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0434
     * @tc.name      testIndicatorAttr0434
     * @tc.desc      Verify maxIndicatorBarLeft setter updates the value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0434 begin');
      const attr: IndicatorBarAttribute =
        new IndicatorBarAttribute(makeIndicatorBar(), SizeMode.Normal, 0, 0, -1, 1, VerticalAlign.Center);
      attr.maxIndicatorBarLeft = 90;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.maxIndicatorBarLeft=${attr.maxIndicatorBarLeft}`);
      expect(attr.maxIndicatorBarLeft).assertEqual(90);
      log('testIndicatorAttr0434 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0435
     * @tc.name      testIndicatorAttr0435
     * @tc.desc      Verify the two preset instances are distinct objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0435 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse IndicatorBarAttribute.BACKGROUNDBAR === IndicatorBarAttri...`);
      expect(IndicatorBarAttribute.BACKGROUNDBAR === IndicatorBarAttribute.THINSTRIP).assertFalse();
      log('testIndicatorAttr0435 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDICATORATTR_0436
     * @tc.name      testIndicatorAttr0436
     * @tc.desc      Verify two local instances are mutually independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIndicatorAttr0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testIndicatorAttr0436 begin');
      const first: IndicatorBarAttribute = new IndicatorBarAttribute(makeIndicatorBar(), SizeMode.Normal, 10);
      const second: IndicatorBarAttribute = new IndicatorBarAttribute(makeIndicatorBar(), SizeMode.Padding, 30);
      first.maxIndicatorBarLeft = 99;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.indicatorWidth=${first.indicatorWidth}, expected=10`);
      expect(first.indicatorWidth).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.indicatorWidth=${second.indicatorWidth}, expected=30`);
      expect(second.indicatorWidth).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.maxIndicatorBarLeft=${second.maxIndicatorBarLeft}`);
      expect(second.maxIndicatorBarLeft).assertEqual(-1);
      log('testIndicatorAttr0436 end');
    })
  })
}
