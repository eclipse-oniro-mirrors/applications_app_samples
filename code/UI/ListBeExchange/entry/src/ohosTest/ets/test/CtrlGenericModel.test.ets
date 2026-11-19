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
import { ListExchangeCtrl } from 'listexchange/src/main/ets/model/ListExchangeCtrl';
import { ListItemModifier } from 'listexchange/src/main/ets/model/AttributeModifier';

const DOMAIN: number = 0xF814;
const TAG: string = 'CtrlGenericModelTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function ctrlGenericModelTest(): void {
  describe('CtrlGenericModelTest', () => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0501
     * @tc.name      testGenericCtrl0501
     * @tc.desc      Verify a numeric list initializes with default modifiers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0501 begin');
      const ctrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>();
      ctrl.initData([1, 2, 3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(1).scale=${ctrl.getModifier(1).scale}`);
      expect(ctrl.getModifier(1).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(1).offsetY=${ctrl.getModifier(1).offsetY}`);
      expect(ctrl.getModifier(1).offsetY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(1).opacity=${ctrl.getModifier(1).opacity}`);
      expect(ctrl.getModifier(1).opacity).assertEqual(1);
      log('testGenericCtrl0501 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0502
     * @tc.name      testGenericCtrl0502
     * @tc.desc      Verify an unknown numeric item has no modifier while known items do.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0502 begin');
      const ctrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>();
      ctrl.initData([1, 2, 3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${ctrl.getModifier(99) === undefined}`);
      expect(ctrl.getModifier(99) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${ctrl.getModifier(1) === undefined}`);
      expect(ctrl.getModifier(1) === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ctrl.getModifier(1)=${typeof ctrl.getModifier(1)}`);
      expect(typeof ctrl.getModifier(1)).assertEqual('object');
      log('testGenericCtrl0502 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0503
     * @tc.name      testGenericCtrl0503
     * @tc.desc      Verify a numeric swap puts the displaced item right after the probe item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0503 begin');
      const ctrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>();
      ctrl.initData([1, 2, 3]);
      ctrl.getModifier(1).scale = 0.5;
      ctrl.getModifier(3).scale = 0.5;
      ctrl.changeItem(0, 1);
      ctrl.onMove(2, -10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(1).scale=${ctrl.getModifier(1).scale}`);
      expect(ctrl.getModifier(1).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(3).scale=${ctrl.getModifier(3).scale}`);
      expect(ctrl.getModifier(3).scale).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(2).offsetY=${ctrl.getModifier(2).offsetY}`);
      expect(ctrl.getModifier(2).offsetY).assertEqual(-10);
      log('testGenericCtrl0503 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0504
     * @tc.name      testGenericCtrl0504
     * @tc.desc      Verify a small numeric move records the offset and shrinks the follower.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0504 begin');
      const ctrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>();
      ctrl.initData([1, 2, 3]);
      ctrl.getModifier(3).scale = 0.5;
      ctrl.onMove(2, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(2).offsetY=${ctrl.getModifier(2).offsetY}`);
      expect(ctrl.getModifier(2).offsetY).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess ctrl.getModifier(3).scale=${ctrl.getModifier(3).scale}`);
      expect(ctrl.getModifier(3).scale).assertLess(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger ctrl.getModifier(3).scale=${ctrl.getModifier(3).scale}`);
      expect(ctrl.getModifier(3).scale).assertLarger(0.9);
      log('testGenericCtrl0504 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0505
     * @tc.name      testGenericCtrl0505
     * @tc.desc      Verify appending a numeric item keeps earlier bindings intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0505 begin');
      const ctrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>();
      ctrl.initData([1, 2, 3]);
      ctrl.getModifier(1).scale = 0.5;
      ctrl.addItem(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(1).scale=${ctrl.getModifier(1).scale}`);
      expect(ctrl.getModifier(1).scale).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(4).scale=${ctrl.getModifier(4).scale}`);
      expect(ctrl.getModifier(4).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(4).offsetY=${ctrl.getModifier(4).offsetY}`);
      expect(ctrl.getModifier(4).offsetY).assertEqual(0);
      log('testGenericCtrl0505 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0506
     * @tc.name      testGenericCtrl0506
     * @tc.desc      Verify an out-of-range numeric target moves the item to the tail.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0506 begin');
      const ctrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>();
      ctrl.initData([1, 2, 3]);
      ctrl.getModifier(1).scale = 0.5;
      ctrl.getModifier(3).scale = 0.5;
      ctrl.changeItem(0, 99);
      ctrl.onMove(2, -10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(3).scale=${ctrl.getModifier(3).scale}`);
      expect(ctrl.getModifier(3).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(1).scale=${ctrl.getModifier(1).scale}`);
      expect(ctrl.getModifier(1).scale).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(2).offsetY=${ctrl.getModifier(2).offsetY}`);
      expect(ctrl.getModifier(2).offsetY).assertEqual(-10);
      log('testGenericCtrl0506 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0507
     * @tc.name      testGenericCtrl0507
     * @tc.desc      Verify a negative numeric index moves the tail item to the head.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0507 begin');
      const ctrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>();
      ctrl.initData([1, 2, 3]);
      ctrl.getModifier(2).scale = 0.5;
      ctrl.getModifier(3).scale = 0.5;
      ctrl.changeItem(-1, 0);
      ctrl.onMove(1, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess ctrl.getModifier(2).scale=${ctrl.getModifier(2).scale}`);
      expect(ctrl.getModifier(2).scale).assertLess(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger ctrl.getModifier(2).scale=${ctrl.getModifier(2).scale}`);
      expect(ctrl.getModifier(2).scale).assertLarger(0.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(3).scale=${ctrl.getModifier(3).scale}`);
      expect(ctrl.getModifier(3).scale).assertEqual(1);
      log('testGenericCtrl0507 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0508
     * @tc.name      testGenericCtrl0508
     * @tc.desc      Verify moving an unknown numeric item never corrupts existing state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0508 begin');
      const ctrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>();
      ctrl.initData([1, 2, 3]);
      let movedSafely: boolean = false;
      try {
        ctrl.onMove(42, 10);
        movedSafely = true;
      } catch (err) {
        movedSafely = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue movedSafely=${movedSafely}`);
      expect(movedSafely).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(1).scale=${ctrl.getModifier(1).scale}`);
      expect(ctrl.getModifier(1).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(1).offsetY=${ctrl.getModifier(1).offsetY}`);
      expect(ctrl.getModifier(1).offsetY).assertEqual(0);
      log('testGenericCtrl0508 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0509
     * @tc.name      testGenericCtrl0509
     * @tc.desc      Verify an upward numeric move past half height on the head is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0509 begin');
      const ctrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>();
      ctrl.initData([1, 2, 3]);
      ctrl.getModifier(1).scale = 0.5;
      ctrl.getModifier(2).scale = 0.5;
      ctrl.onMove(1, -30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(1).offsetY=${ctrl.getModifier(1).offsetY}`);
      expect(ctrl.getModifier(1).offsetY).assertEqual(-30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(2).scale=${ctrl.getModifier(2).scale}`);
      expect(ctrl.getModifier(2).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(1).scale=${ctrl.getModifier(1).scale}`);
      expect(ctrl.getModifier(1).scale).assertEqual(0.5);
      log('testGenericCtrl0509 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0510
     * @tc.name      testGenericCtrl0510
     * @tc.desc      Verify re-initializing a numeric list reuses the first round modifiers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0510 begin');
      const ctrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>();
      ctrl.initData([1, 2]);
      ctrl.getModifier(1).scale = 0.33;
      ctrl.initData([1, 2]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(1).scale=${ctrl.getModifier(1).scale}`);
      expect(ctrl.getModifier(1).scale).assertEqual(0.33);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(2).scale=${ctrl.getModifier(2).scale}`);
      expect(ctrl.getModifier(2).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ctrl.getModifier(1)=${typeof ctrl.getModifier(1)}`);
      expect(typeof ctrl.getModifier(1)).assertEqual('object');
      log('testGenericCtrl0510 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0511
     * @tc.name      testGenericCtrl0511
     * @tc.desc      Verify a string keyed list initializes with default modifiers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0511 begin');
      const ctrl: ListExchangeCtrl<string> = new ListExchangeCtrl<string>();
      ctrl.initData(['a', 'b']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier('a').scale=${ctrl.getModifier('a').scale}`);
      expect(ctrl.getModifier('a').scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier('a').offsetY}, expected=0`);
      expect(ctrl.getModifier('a').offsetY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${ctrl.getModifier('a').hasShadow}`);
      expect(ctrl.getModifier('a').hasShadow).assertFalse();
      log('testGenericCtrl0511 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0512
     * @tc.name      testGenericCtrl0512
     * @tc.desc      Verify an unknown string item has no modifier while known items do.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0512 begin');
      const ctrl: ListExchangeCtrl<string> = new ListExchangeCtrl<string>();
      ctrl.initData(['a', 'b']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${ctrl.getModifier('zz') === undefined}`);
      expect(ctrl.getModifier('zz') === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${ctrl.getModifier('a') === undefined}`);
      expect(ctrl.getModifier('a') === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ctrl.getModifier('a')=${typeof ctrl.getModifier('a')}`);
      expect(typeof ctrl.getModifier('a')).assertEqual('object');
      log('testGenericCtrl0512 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0513
     * @tc.name      testGenericCtrl0513
     * @tc.desc      Verify a string swap puts the displaced label right after the probe label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0513 begin');
      const ctrl: ListExchangeCtrl<string> = new ListExchangeCtrl<string>();
      ctrl.initData(['a', 'b', 'c']);
      ctrl.getModifier('a').scale = 0.5;
      ctrl.changeItem(0, 1);
      ctrl.onMove('b', -10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier('a').scale=${ctrl.getModifier('a').scale}`);
      expect(ctrl.getModifier('a').scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier('b').offsetY}, expected=-10`);
      expect(ctrl.getModifier('b').offsetY).assertEqual(-10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier('c').scale=${ctrl.getModifier('c').scale}`);
      expect(ctrl.getModifier('c').scale).assertEqual(1);
      log('testGenericCtrl0513 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0514
     * @tc.name      testGenericCtrl0514
     * @tc.desc      Verify appending a string item keeps earlier bindings intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0514 begin');
      const ctrl: ListExchangeCtrl<string> = new ListExchangeCtrl<string>();
      ctrl.initData(['a', 'b']);
      ctrl.getModifier('a').offsetY = 3;
      ctrl.addItem('c');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier('a').offsetY}, expected=3`);
      expect(ctrl.getModifier('a').offsetY).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier('c').scale=${ctrl.getModifier('c').scale}`);
      expect(ctrl.getModifier('c').scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier('c').opacity}, expected=1`);
      expect(ctrl.getModifier('c').opacity).assertEqual(1);
      log('testGenericCtrl0514 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0515
     * @tc.name      testGenericCtrl0515
     * @tc.desc      Verify a half-height string move on the tail resets the leading item scale.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0515 begin');
      const ctrl: ListExchangeCtrl<string> = new ListExchangeCtrl<string>();
      ctrl.initData(['a', 'b']);
      ctrl.getModifier('a').scale = 0.5;
      ctrl.getModifier('b').scale = 0.3;
      ctrl.onMove('b', 25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier('b').offsetY}, expected=25`);
      expect(ctrl.getModifier('b').offsetY).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier('a').scale=${ctrl.getModifier('a').scale}`);
      expect(ctrl.getModifier('a').scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier('b').scale=${ctrl.getModifier('b').scale}`);
      expect(ctrl.getModifier('b').scale).assertEqual(0.3);
      log('testGenericCtrl0515 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0516
     * @tc.name      testGenericCtrl0516
     * @tc.desc      Verify an empty string works as a valid list item key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0516 begin');
      const ctrl: ListExchangeCtrl<string> = new ListExchangeCtrl<string>();
      ctrl.initData(['']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${ctrl.getModifier('') === undefined}`);
      expect(ctrl.getModifier('') === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier('').scale=${ctrl.getModifier('').scale}`);
      expect(ctrl.getModifier('').scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier('').offsetY=${ctrl.getModifier('').offsetY}`);
      expect(ctrl.getModifier('').offsetY).assertEqual(0);
      log('testGenericCtrl0516 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0517
     * @tc.name      testGenericCtrl0517
     * @tc.desc      Verify a negative string index moves the tail label to the head.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0517 begin');
      const ctrl: ListExchangeCtrl<string> = new ListExchangeCtrl<string>();
      ctrl.initData(['a', 'b', 'c']);
      ctrl.getModifier('a').scale = 0.5;
      ctrl.getModifier('c').scale = 0.5;
      ctrl.changeItem(-1, 0);
      ctrl.onMove('b', -10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert 0.9 < scale < 1');
      expect(ctrl.getModifier('a').scale).assertLarger(0.9);
      expect(ctrl.getModifier('a').scale).assertLess(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier('c').scale=${ctrl.getModifier('c').scale}`);
      expect(ctrl.getModifier('c').scale).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier('b').offsetY}, expected=-10`);
      expect(ctrl.getModifier('b').offsetY).assertEqual(-10);
      log('testGenericCtrl0517 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_GENERIC_0518
     * @tc.name      testGenericCtrl0518
     * @tc.desc      Verify duplicate numeric keys resolve to the first matching modifier.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGenericCtrl0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGenericCtrl0518 begin');
      const ctrl: ListExchangeCtrl<number> = new ListExchangeCtrl<number>();
      ctrl.initData([5, 5]);
      const first: ListItemModifier = ctrl.getModifier(5);
      first.scale = 0.6;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ctrl.getModifier(5).scale=${ctrl.getModifier(5).scale}`);
      expect(ctrl.getModifier(5).scale).assertEqual(0.6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse first === undefined=${first === undefined}`);
      expect(first === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${first === ctrl.getModifier(5)}`);
      expect(first === ctrl.getModifier(5)).assertTrue();
      log('testGenericCtrl0518 end');
    })
  })
}
