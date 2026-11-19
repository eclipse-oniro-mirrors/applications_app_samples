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
import { TabBarAttribute } from '../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'TabBarAttrCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function tabBarAttributeModelCoreTest(): void {
  describe('TabBarAttributeModelCoreTest', () => {
    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0501
     * @tc.name      testTabBarAttr0501
     * @tc.desc      Verify barItemWidth defaults to undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0501 begin');
      const attr: TabBarAttribute = new TabBarAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${attr.barItemWidth === undefined}`);
      expect(attr.barItemWidth === undefined).assertTrue();
      log('testTabBarAttr0501 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0502
     * @tc.name      testTabBarAttr0502
     * @tc.desc      Verify barHeight defaults to undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0502 begin');
      const attr: TabBarAttribute = new TabBarAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue attr.barHeight === undefined=${attr.barHeight === undefined}`);
      expect(attr.barHeight === undefined).assertTrue();
      log('testTabBarAttr0502 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0503
     * @tc.name      testTabBarAttr0503
     * @tc.desc      Verify scrollable defaults to true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0503 begin');
      const attr: TabBarAttribute = new TabBarAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue attr.scrollable=${attr.scrollable}`);
      expect(attr.scrollable).assertTrue();
      log('testTabBarAttr0503 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0504
     * @tc.name      testTabBarAttr0504
     * @tc.desc      Verify barEdgeEffect defaults to Spring.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0504 begin');
      const attr: TabBarAttribute = new TabBarAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barEdgeEffect=${attr.barEdgeEffect}`);
      expect(attr.barEdgeEffect).assertEqual(EdgeEffect.Spring);
      log('testTabBarAttr0504 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0505
     * @tc.name      testTabBarAttr0505
     * @tc.desc      Verify barVertical defaults to BarPosition.Start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0505 begin');
      const attr: TabBarAttribute = new TabBarAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barVertical=${attr.barVertical}`);
      expect(attr.barVertical).assertEqual(BarPosition.Start);
      log('testTabBarAttr0505 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0506
     * @tc.name      testTabBarAttr0506
     * @tc.desc      Verify barBackgroundColor defaults to transparent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0506 begin');
      const attr: TabBarAttribute = new TabBarAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barBackgroundColor=${attr.barBackgroundColor}`);
      expect(attr.barBackgroundColor).assertEqual(Color.Transparent);
      log('testTabBarAttr0506 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0507
     * @tc.name      testTabBarAttr0507
     * @tc.desc      Verify barMargin defaults to undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0507 begin');
      const attr: TabBarAttribute = new TabBarAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue attr.barMargin === undefined=${attr.barMargin === undefined}`);
      expect(attr.barMargin === undefined).assertTrue();
      log('testTabBarAttr0507 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0508
     * @tc.name      testTabBarAttr0508
     * @tc.desc      Verify numeric item width and bar height round-trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0508 begin');
      const attr: TabBarAttribute = new TabBarAttribute(100, 70);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barItemWidth=${attr.barItemWidth}, expected=100`);
      expect(attr.barItemWidth).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barHeight=${attr.barHeight}, expected=70`);
      expect(attr.barHeight).assertEqual(70);
      log('testTabBarAttr0508 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0509
     * @tc.name      testTabBarAttr0509
     * @tc.desc      Verify scrollable=false is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0509 begin');
      const attr: TabBarAttribute = new TabBarAttribute(undefined, undefined, false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse attr.scrollable=${attr.scrollable}`);
      expect(attr.scrollable).assertFalse();
      log('testTabBarAttr0509 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0510
     * @tc.name      testTabBarAttr0510
     * @tc.desc      Verify EdgeEffect.None is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0510 begin');
      const attr: TabBarAttribute = new TabBarAttribute(undefined, undefined, true, EdgeEffect.None);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barEdgeEffect=${attr.barEdgeEffect}`);
      expect(attr.barEdgeEffect).assertEqual(EdgeEffect.None);
      log('testTabBarAttr0510 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0511
     * @tc.name      testTabBarAttr0511
     * @tc.desc      Verify BarPosition.End is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0511 begin');
      const attr: TabBarAttribute =
        new TabBarAttribute(undefined, undefined, true, EdgeEffect.Spring, BarPosition.End);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barVertical=${attr.barVertical}`);
      expect(attr.barVertical).assertEqual(BarPosition.End);
      log('testTabBarAttr0511 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0512
     * @tc.name      testTabBarAttr0512
     * @tc.desc      Verify barMargin keeps the given object reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0512 begin');
      const margin: Margin = { left: 10, right: 10, top: 5, bottom: 5 };
      const attr: TabBarAttribute =
        new TabBarAttribute(undefined, undefined, true, EdgeEffect.Spring, BarPosition.Start, margin);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barMargin=${attr.barMargin}, expected=margin`);
      expect(attr.barMargin).assertEqual(margin);
      log('testTabBarAttr0512 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0513
     * @tc.name      testTabBarAttr0513
     * @tc.desc      Verify a Color background is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0513 begin');
      const attr: TabBarAttribute = new TabBarAttribute(undefined, undefined, true, EdgeEffect.Spring,
        BarPosition.Start, undefined, Color.Red);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barBackgroundColor=${attr.barBackgroundColor}`);
      expect(attr.barBackgroundColor).assertEqual(Color.Red);
      log('testTabBarAttr0513 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0514
     * @tc.name      testTabBarAttr0514
     * @tc.desc      Verify partial args keep later defaults untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0514 begin');
      const attr: TabBarAttribute = new TabBarAttribute(90, 60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue attr.scrollable=${attr.scrollable}`);
      expect(attr.scrollable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barEdgeEffect=${attr.barEdgeEffect}`);
      expect(attr.barEdgeEffect).assertEqual(EdgeEffect.Spring);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barVertical=${attr.barVertical}`);
      expect(attr.barVertical).assertEqual(BarPosition.Start);
      log('testTabBarAttr0514 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0515
     * @tc.name      testTabBarAttr0515
     * @tc.desc      Verify partial args keep barMargin undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0515 begin');
      const attr: TabBarAttribute = new TabBarAttribute(90, 60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue attr.barMargin === undefined=${attr.barMargin === undefined}`);
      expect(attr.barMargin === undefined).assertTrue();
      log('testTabBarAttr0515 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0516
     * @tc.name      testTabBarAttr0516
     * @tc.desc      Verify a string-typed item width round-trips.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0516 begin');
      const attr: TabBarAttribute = new TabBarAttribute('90vp', '60vp');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barItemWidth=${attr.barItemWidth}, expected='90vp'`);
      expect(attr.barItemWidth).assertEqual('90vp');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barHeight=${attr.barHeight}, expected='60vp'`);
      expect(attr.barHeight).assertEqual('60vp');
      log('testTabBarAttr0516 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0517
     * @tc.name      testTabBarAttr0517
     * @tc.desc      Verify numeric bar height keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0517 begin');
      const attr: TabBarAttribute = new TabBarAttribute(90, 60);
      const height: Length | undefined = attr.barHeight;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof height=${typeof height}, expected='number'`);
      expect(typeof height).assertEqual('number');
      log('testTabBarAttr0517 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0518
     * @tc.name      testTabBarAttr0518
     * @tc.desc      Verify instances pass an instanceof check.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0518 begin');
      const attr: TabBarAttribute = new TabBarAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${attr instanceof TabBarAttribute}`);
      expect(attr instanceof TabBarAttribute).assertTrue();
      log('testTabBarAttr0518 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0519
     * @tc.name      testTabBarAttr0519
     * @tc.desc      Verify two instances do not share mutable state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0519 begin');
      const first: TabBarAttribute = new TabBarAttribute(90, 60, false);
      const second: TabBarAttribute = new TabBarAttribute();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.barItemWidth=${first.barItemWidth}, expected=90`);
      expect(first.barItemWidth).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${second.barItemWidth === undefined}`);
      expect(second.barItemWidth === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse first.scrollable=${first.scrollable}`);
      expect(first.scrollable).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue second.scrollable=${second.scrollable}`);
      expect(second.scrollable).assertTrue();
      log('testTabBarAttr0519 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0520
     * @tc.name      testTabBarAttr0520
     * @tc.desc      Verify nested margin fields stay readable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0520 begin');
      const margin: Margin = { left: 12, top: 6 };
      const attr: TabBarAttribute =
        new TabBarAttribute(undefined, undefined, true, EdgeEffect.Spring, BarPosition.Start, margin);
      const barMargin: Margin | undefined = attr.barMargin;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse barMargin === undefined=${barMargin === undefined}`);
      expect(barMargin === undefined).assertFalse();
      log('testTabBarAttr0520 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0521
     * @tc.name      testTabBarAttr0521
     * @tc.desc      Verify a full-arg construction keeps every field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0521 begin');
      const margin: Margin = { left: 8 };
      const attr: TabBarAttribute =
        new TabBarAttribute(100, 70, false, EdgeEffect.None, BarPosition.End, margin, Color.Blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barItemWidth=${attr.barItemWidth}, expected=100`);
      expect(attr.barItemWidth).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barHeight=${attr.barHeight}, expected=70`);
      expect(attr.barHeight).assertEqual(70);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse attr.scrollable=${attr.scrollable}`);
      expect(attr.scrollable).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barEdgeEffect=${attr.barEdgeEffect}`);
      expect(attr.barEdgeEffect).assertEqual(EdgeEffect.None);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barVertical=${attr.barVertical}`);
      expect(attr.barVertical).assertEqual(BarPosition.End);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barBackgroundColor=${attr.barBackgroundColor}`);
      expect(attr.barBackgroundColor).assertEqual(Color.Blue);
      log('testTabBarAttr0521 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABBARATTR_0522
     * @tc.name      testTabBarAttr0522
     * @tc.desc      Verify equal-width mode still stores the item width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabBarAttr0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabBarAttr0522 begin');
      const attr: TabBarAttribute = new TabBarAttribute(100, 70, false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse attr.scrollable=${attr.scrollable}`);
      expect(attr.scrollable).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barItemWidth=${attr.barItemWidth}, expected=100`);
      expect(attr.barItemWidth).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual attr.barHeight=${attr.barHeight}, expected=70`);
      expect(attr.barHeight).assertEqual(70);
      log('testTabBarAttr0522 end');
    })
  })
}
