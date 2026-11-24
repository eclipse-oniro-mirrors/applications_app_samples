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
import { ListInfo } from 'listexchange/src/main/ets/model/ListInfo';
import { ListExchangeCtrl } from 'listexchange/src/main/ets/model/ListExchangeCtrl';
import { ListItemModifier } from 'listexchange/src/main/ets/model/AttributeModifier';

const DOMAIN: number = 0xF814;
const TAG: string = 'ExchangeCtrlCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function makeItems(): ListInfo[] {
  return [new ListInfo('icon_a', 'A'), new ListInfo('icon_b', 'B'),
    new ListInfo('icon_c', 'C'), new ListInfo('icon_d', 'D')];
}

export default function exchangeCtrlCoreTest(): void {
  describe('ExchangeCtrlCoreTest', () => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0101
     * @tc.name      testExchangeCtrl0101
     * @tc.desc      Verify initData binds every item to a fresh default modifier.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0101 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=1`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[1]).offsetY}, expected=0`);
      expect(ctrl.getModifier(items[1]).offsetY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[2]).opacity}, expected=1`);
      expect(ctrl.getModifier(items[2]).opacity).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[3]).hasShadow}`);
      expect(ctrl.getModifier(items[3]).hasShadow).assertEqual(false);
      log('testExchangeCtrl0101 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0102
     * @tc.name      testExchangeCtrl0102
     * @tc.desc      Verify single item initialization produces default modifier fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0102 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = [new ListInfo('icon_s', '单条')];
      ctrl.initData(items);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).opacity}, expected=1`);
      expect(ctrl.getModifier(items[0]).opacity).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).hasShadow}`);
      expect(ctrl.getModifier(items[0]).hasShadow).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).isDeleted}`);
      expect(ctrl.getModifier(items[0]).isDeleted).assertEqual(false);
      log('testExchangeCtrl0102 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0103
     * @tc.name      testExchangeCtrl0103
     * @tc.desc      Verify empty data initialization leaves unknown items unbound until added.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0103 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      ctrl.initData([]);
      const ghost: ListInfo = new ListInfo('icon_g', 'G');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${ctrl.getModifier(ghost) === undefined}`);
      expect(ctrl.getModifier(ghost) === undefined).assertTrue();
      ctrl.addItem(ghost);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(ghost).scale}, expected=1`);
      expect(ctrl.getModifier(ghost).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(ghost).offsetY}, expected=0`);
      expect(ctrl.getModifier(ghost).offsetY).assertEqual(0);
      log('testExchangeCtrl0103 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0104
     * @tc.name      testExchangeCtrl0104
     * @tc.desc      Verify re-initializing with the same array reuses existing modifiers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0104 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const firstModifier: ListItemModifier = ctrl.getModifier(items[0]);
      firstModifier.scale = 0.33;
      ctrl.initData(items);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${ctrl.getModifier(items[0]) === firstModifier}`);
      expect(ctrl.getModifier(items[0]) === firstModifier).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=0.33`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(0.33);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[3]).scale}, expected=1`);
      expect(ctrl.getModifier(items[3]).scale).assertEqual(1);
      log('testExchangeCtrl0104 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0105
     * @tc.name      testExchangeCtrl0105
     * @tc.desc      Verify re-initializing with a new array binds the first new item to a modifier.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0105 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const first: ListInfo[] = [new ListInfo('icon_1', '第一批')];
      ctrl.initData(first);
      const second: ListInfo[] = [new ListInfo('icon_2', '第二批'), new ListInfo('icon_3', '第三批')];
      ctrl.initData(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${ctrl.getModifier(second[0]) === undefined}`);
      expect(ctrl.getModifier(second[0]) === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(second[0]).scale}, expected=1`);
      expect(ctrl.getModifier(second[0]).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof ctrl.getModifier(second[0])}`);
      expect(typeof ctrl.getModifier(second[0])).assertEqual('object');
      log('testExchangeCtrl0105 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0106
     * @tc.name      testExchangeCtrl0106
     * @tc.desc      Verify two initialized items receive two distinct modifier instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0106 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = [new ListInfo('icon_p', 'P'), new ListInfo('icon_q', 'Q')];
      ctrl.initData(items);
      const modifierP: ListItemModifier = ctrl.getModifier(items[0]);
      const modifierQ: ListItemModifier = ctrl.getModifier(items[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse modifierP === modifierQ=${modifierP === modifierQ}`);
      expect(modifierP === modifierQ).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${modifierP === ctrl.getModifier(items[0])}`);
      expect(modifierP === ctrl.getModifier(items[0])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${modifierQ === ctrl.getModifier(items[1])}`);
      expect(modifierQ === ctrl.getModifier(items[1])).assertTrue();
      log('testExchangeCtrl0106 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0107
     * @tc.name      testExchangeCtrl0107
     * @tc.desc      Verify getModifier returns nothing for an item outside the list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0107 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const ghost: ListInfo = new ListInfo('icon_x', 'X');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${ctrl.getModifier(ghost) === undefined}`);
      expect(ctrl.getModifier(ghost) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${ctrl.getModifier(items[0]) === undefined}`);
      expect(ctrl.getModifier(items[0]) === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof ctrl.getModifier(items[0])}`);
      expect(typeof ctrl.getModifier(items[0])).assertEqual('object');
      log('testExchangeCtrl0107 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0108
     * @tc.name      testExchangeCtrl0108
     * @tc.desc      Verify scale written through a returned modifier is read back unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0108 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const modifier: ListItemModifier = ctrl.getModifier(items[0]);
      modifier.scale = 0.7;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=0.7`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(0.7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${ctrl.getModifier(items[0]).scale === 1}`);
      expect(ctrl.getModifier(items[0]).scale === 1).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[1]).scale}, expected=1`);
      expect(ctrl.getModifier(items[1]).scale).assertEqual(1);
      log('testExchangeCtrl0108 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0109
     * @tc.name      testExchangeCtrl0109
     * @tc.desc      Verify offsetY written through a returned modifier is read back unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0109 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const modifier: ListItemModifier = ctrl.getModifier(items[1]);
      modifier.offsetY = 5;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[1]).offsetY}, expected=5`);
      expect(ctrl.getModifier(items[1]).offsetY).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${ctrl.getModifier(items[1]).offsetY === 0}`);
      expect(ctrl.getModifier(items[1]).offsetY === 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).offsetY}, expected=0`);
      expect(ctrl.getModifier(items[0]).offsetY).assertEqual(0);
      log('testExchangeCtrl0109 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0110
     * @tc.name      testExchangeCtrl0110
     * @tc.desc      Verify hasShadow toggling is visible through later getModifier calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0110 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[2]).hasShadow = true;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[2]).hasShadow}`);
      expect(ctrl.getModifier(items[2]).hasShadow).assertEqual(true);
      ctrl.getModifier(items[2]).hasShadow = false;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[2]).hasShadow}`);
      expect(ctrl.getModifier(items[2]).hasShadow).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[3]).hasShadow}`);
      expect(ctrl.getModifier(items[3]).hasShadow).assertEqual(false);
      log('testExchangeCtrl0110 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0111
     * @tc.name      testExchangeCtrl0111
     * @tc.desc      Verify opacity written through a returned modifier is read back unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0111 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[0]).opacity = 0.4;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).opacity}, expected=0.4`);
      expect(ctrl.getModifier(items[0]).opacity).assertEqual(0.4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${ctrl.getModifier(items[0]).opacity}, expected=1`);
      expect(ctrl.getModifier(items[0]).opacity).assertLess(1);
      ctrl.getModifier(items[0]).opacity = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).opacity}, expected=1`);
      expect(ctrl.getModifier(items[0]).opacity).assertEqual(1);
      log('testExchangeCtrl0111 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0112
     * @tc.name      testExchangeCtrl0112
     * @tc.desc      Verify four initialized items map to four distinct modifier instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0112 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const modifierA: ListItemModifier = ctrl.getModifier(items[0]);
      const modifierB: ListItemModifier = ctrl.getModifier(items[1]);
      const modifierC: ListItemModifier = ctrl.getModifier(items[2]);
      const modifierD: ListItemModifier = ctrl.getModifier(items[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse modifierA === modifierB=${modifierA === modifierB}`);
      expect(modifierA === modifierB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse modifierA === modifierC=${modifierA === modifierC}`);
      expect(modifierA === modifierC).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse modifierB === modifierD=${modifierB === modifierD}`);
      expect(modifierB === modifierD).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse modifierC === modifierD=${modifierC === modifierD}`);
      expect(modifierC === modifierD).assertFalse();
      log('testExchangeCtrl0112 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0113
     * @tc.name      testExchangeCtrl0113
     * @tc.desc      Verify swapping the first two items moves the old first item to index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0113 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const originalItems: ListInfo[] = items.slice();
      const modifiers: ListItemModifier[] = items.map((item: ListInfo) => ctrl.getModifier(item));
      ctrl.changeItem(0, 1);
      expect(items.map((item: ListInfo) => item.name.toString()).join(',')).assertEqual('B,A,C,D');
      originalItems.forEach((item: ListInfo, index: number) => {
        expect(ctrl.getModifier(item) === modifiers[index]).assertTrue();
      });
      log('testExchangeCtrl0113 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0114
     * @tc.name      testExchangeCtrl0114
     * @tc.desc      Verify swapping the last two items keeps the second item at index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0114 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const originalItems: ListInfo[] = items.slice();
      const modifiers: ListItemModifier[] = items.map((item: ListInfo) => ctrl.getModifier(item));
      ctrl.changeItem(3, 2);
      expect(items.map((item: ListInfo) => item.name.toString()).join(',')).assertEqual('A,B,D,C');
      originalItems.forEach((item: ListInfo, index: number) => {
        expect(ctrl.getModifier(item) === modifiers[index]).assertTrue();
      });
      log('testExchangeCtrl0114 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0115
     * @tc.name      testExchangeCtrl0115
     * @tc.desc      Verify moving the first item to the end puts the old second item at index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0115 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const originalItems: ListInfo[] = items.slice();
      const modifiers: ListItemModifier[] = items.map((item: ListInfo) => ctrl.getModifier(item));
      ctrl.changeItem(0, 3);
      expect(items.map((item: ListInfo) => item.name.toString()).join(',')).assertEqual('B,C,D,A');
      originalItems.forEach((item: ListInfo, index: number) => {
        expect(ctrl.getModifier(item) === modifiers[index]).assertTrue();
      });
      log('testExchangeCtrl0115 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0116
     * @tc.name      testExchangeCtrl0116
     * @tc.desc      Verify moving the last item to the front puts the old first item at index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0116 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const originalItems: ListInfo[] = items.slice();
      const modifiers: ListItemModifier[] = items.map((item: ListInfo) => ctrl.getModifier(item));
      ctrl.changeItem(3, 0);
      expect(items.map((item: ListInfo) => item.name.toString()).join(',')).assertEqual('D,A,B,C');
      originalItems.forEach((item: ListInfo, index: number) => {
        expect(ctrl.getModifier(item) === modifiers[index]).assertTrue();
      });
      log('testExchangeCtrl0116 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0117
     * @tc.name      testExchangeCtrl0117
     * @tc.desc      Verify moving item one to index two puts the old third item at index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0117 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const originalItems: ListInfo[] = items.slice();
      const modifiers: ListItemModifier[] = items.map((item: ListInfo) => ctrl.getModifier(item));
      ctrl.changeItem(1, 2);
      expect(items.map((item: ListInfo) => item.name.toString()).join(',')).assertEqual('A,C,B,D');
      originalItems.forEach((item: ListInfo, index: number) => {
        expect(ctrl.getModifier(item) === modifiers[index]).assertTrue();
      });
      log('testExchangeCtrl0117 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0118
     * @tc.name      testExchangeCtrl0118
     * @tc.desc      Verify moving item one to the end keeps the old first item at index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0118 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const originalItems: ListInfo[] = items.slice();
      const modifiers: ListItemModifier[] = items.map((item: ListInfo) => ctrl.getModifier(item));
      ctrl.changeItem(1, 3);
      expect(items.map((item: ListInfo) => item.name.toString()).join(',')).assertEqual('A,C,D,B');
      originalItems.forEach((item: ListInfo, index: number) => {
        expect(ctrl.getModifier(item) === modifiers[index]).assertTrue();
      });
      log('testExchangeCtrl0118 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0119
     * @tc.name      testExchangeCtrl0119
     * @tc.desc      Verify moving item two to the front puts the old first item at index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0119 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const originalItems: ListInfo[] = items.slice();
      const modifiers: ListItemModifier[] = items.map((item: ListInfo) => ctrl.getModifier(item));
      ctrl.changeItem(2, 0);
      expect(items.map((item: ListInfo) => item.name.toString()).join(',')).assertEqual('C,A,B,D');
      originalItems.forEach((item: ListInfo, index: number) => {
        expect(ctrl.getModifier(item) === modifiers[index]).assertTrue();
      });
      log('testExchangeCtrl0119 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0120
     * @tc.name      testExchangeCtrl0120
     * @tc.desc      Verify changing an item to its own index keeps the original ordering.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0120 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[1]).scale = 0.5;
      ctrl.changeItem(1, 1);
      ctrl.onMove(items[0], 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${ctrl.getModifier(items[1]).scale}, expected=1`);
      expect(ctrl.getModifier(items[1]).scale).assertLess(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${ctrl.getModifier(items[1]).scale}, expected=0.9`);
      expect(ctrl.getModifier(items[1]).scale).assertLarger(0.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${ctrl.getModifier(items[1]).scale === 0.5}`);
      expect(ctrl.getModifier(items[1]).scale === 0.5).assertFalse();
      log('testExchangeCtrl0120 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0121
     * @tc.name      testExchangeCtrl0121
     * @tc.desc      Verify an out-of-range target index moves the first item to the end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0121 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const originalItems: ListInfo[] = items.slice();
      const modifiers: ListItemModifier[] = items.map((item: ListInfo) => ctrl.getModifier(item));
      ctrl.changeItem(0, 99);
      expect(items.map((item: ListInfo) => item.name.toString()).join(',')).assertEqual('B,C,D,A');
      originalItems.forEach((item: ListInfo, index: number) => {
        expect(ctrl.getModifier(item) === modifiers[index]).assertTrue();
      });
      log('testExchangeCtrl0121 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0122
     * @tc.name      testExchangeCtrl0122
     * @tc.desc      Verify a negative source index moves the last item to the front.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0122 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[1]).scale = 0.5;
      ctrl.getModifier(items[3]).scale = 0.5;
      ctrl.changeItem(-1, 0);
      ctrl.onMove(items[0], 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${ctrl.getModifier(items[1]).scale}, expected=1`);
      expect(ctrl.getModifier(items[1]).scale).assertLess(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${ctrl.getModifier(items[1]).scale}, expected=0.9`);
      expect(ctrl.getModifier(items[1]).scale).assertLarger(0.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[3]).scale}, expected=1`);
      expect(ctrl.getModifier(items[3]).scale).assertEqual(1);
      log('testExchangeCtrl0122 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0123
     * @tc.name      testExchangeCtrl0123
     * @tc.desc      Verify a negative target index keeps the first item at the front.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0123 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[1]).scale = 0.5;
      ctrl.getModifier(items[0]).scale = 0.5;
      ctrl.changeItem(0, -5);
      ctrl.onMove(items[0], 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${ctrl.getModifier(items[1]).scale}, expected=1`);
      expect(ctrl.getModifier(items[1]).scale).assertLess(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${ctrl.getModifier(items[1]).scale}, expected=0.9`);
      expect(ctrl.getModifier(items[1]).scale).assertLarger(0.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(0.5);
      log('testExchangeCtrl0123 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0124
     * @tc.name      testExchangeCtrl0124
     * @tc.desc      Verify a target index equal to the length moves the first item to the end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0124 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const originalItems: ListInfo[] = items.slice();
      const modifiers: ListItemModifier[] = items.map((item: ListInfo) => ctrl.getModifier(item));
      ctrl.changeItem(0, 4);
      expect(items.map((item: ListInfo) => item.name.toString()).join(',')).assertEqual('B,C,D,A');
      originalItems.forEach((item: ListInfo, index: number) => {
        expect(ctrl.getModifier(item) === modifiers[index]).assertTrue();
      });
      log('testExchangeCtrl0124 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0125
     * @tc.name      testExchangeCtrl0125
     * @tc.desc      Verify changing an out-of-range index on a single item list keeps binding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0125 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = [new ListInfo('icon_s', 'S')];
      ctrl.initData(items);
      ctrl.getModifier(items[0]).scale = 0.5;
      ctrl.changeItem(1, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${ctrl.getModifier(items[0]) === undefined}`);
      expect(ctrl.getModifier(items[0]) === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof ctrl.getModifier(items[0])}`);
      expect(typeof ctrl.getModifier(items[0])).assertEqual('object');
      log('testExchangeCtrl0125 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0126
     * @tc.name      testExchangeCtrl0126
     * @tc.desc      Verify changing a single item to its own index preserves its modifier.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0126 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = [new ListInfo('icon_s', 'S')];
      ctrl.initData(items);
      ctrl.getModifier(items[0]).scale = 0.5;
      ctrl.changeItem(0, 0);
      ctrl.onMove(items[0], -10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).offsetY}, expected=-10`);
      expect(ctrl.getModifier(items[0]).offsetY).assertEqual(-10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof ctrl.getModifier(items[0])}`);
      expect(typeof ctrl.getModifier(items[0])).assertEqual('object');
      log('testExchangeCtrl0126 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0127
     * @tc.name      testExchangeCtrl0127
     * @tc.desc      Verify a swap followed by the reverse swap restores the original order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0127 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[1]).scale = 0.5;
      ctrl.getModifier(items[3]).scale = 0.5;
      ctrl.changeItem(0, 1);
      ctrl.changeItem(1, 0);
      ctrl.onMove(items[0], 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${ctrl.getModifier(items[1]).scale}, expected=1`);
      expect(ctrl.getModifier(items[1]).scale).assertLess(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${ctrl.getModifier(items[1]).scale}, expected=0.9`);
      expect(ctrl.getModifier(items[1]).scale).assertLarger(0.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[3]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[3]).scale).assertEqual(0.5);
      log('testExchangeCtrl0127 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0128
     * @tc.name      testExchangeCtrl0128
     * @tc.desc      Verify appending an item binds it to a fresh default modifier.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0128 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const extra: ListInfo = new ListInfo('icon_e', 'E');
      ctrl.addItem(extra);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(extra).scale}, expected=1`);
      expect(ctrl.getModifier(extra).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(extra).offsetY}, expected=0`);
      expect(ctrl.getModifier(extra).offsetY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(extra).opacity}, expected=1`);
      expect(ctrl.getModifier(extra).opacity).assertEqual(1);
      log('testExchangeCtrl0128 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0129
     * @tc.name      testExchangeCtrl0129
     * @tc.desc      Verify appending an item preserves existing item bindings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0129 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const modifierA: ListItemModifier = ctrl.getModifier(items[0]);
      modifierA.scale = 0.5;
      const extra: ListInfo = new ListInfo('icon_e', 'E');
      ctrl.addItem(extra);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${ctrl.getModifier(items[0]) === modifierA}`);
      expect(ctrl.getModifier(items[0]) === modifierA).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(extra).scale}, expected=1`);
      expect(ctrl.getModifier(extra).scale).assertEqual(1);
      log('testExchangeCtrl0129 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0130
     * @tc.name      testExchangeCtrl0130
     * @tc.desc      Verify two appended items receive two distinct fresh modifiers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0130 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const extraOne: ListInfo = new ListInfo('icon_e1', 'E1');
      const extraTwo: ListInfo = new ListInfo('icon_e2', 'E2');
      ctrl.addItem(extraOne);
      ctrl.addItem(extraTwo);
      const modifierOne: ListItemModifier = ctrl.getModifier(extraOne);
      const modifierTwo: ListItemModifier = ctrl.getModifier(extraTwo);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse modifierOne === modifierTwo=${modifierOne === modifierTwo}`);
      expect(modifierOne === modifierTwo).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifierOne.scale=${modifierOne.scale}, expected=1`);
      expect(modifierOne.scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modifierTwo.scale=${modifierTwo.scale}, expected=1`);
      expect(modifierTwo.scale).assertEqual(1);
      log('testExchangeCtrl0130 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0131
     * @tc.name      testExchangeCtrl0131
     * @tc.desc      Verify an appended item sits after the previous last item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0131 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[3]).scale = 0.5;
      ctrl.getModifier(items[1]).scale = 0.5;
      const extra: ListInfo = new ListInfo('icon_e', 'E');
      ctrl.addItem(extra);
      ctrl.onMove(extra, -20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert 0.9 < scale < 1');
      expect(ctrl.getModifier(items[3]).scale).assertLarger(0.9);
      expect(ctrl.getModifier(items[3]).scale).assertLess(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[1]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[1]).scale).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(extra).offsetY}, expected=-20`);
      expect(ctrl.getModifier(extra).offsetY).assertEqual(-20);
      log('testExchangeCtrl0131 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0132
     * @tc.name      testExchangeCtrl0132
     * @tc.desc      Verify a small downward move records the offset and shrinks the next item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0132 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[0]).scale = 0.5;
      ctrl.getModifier(items[1]).scale = 0.5;
      ctrl.onMove(items[0], 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).offsetY}, expected=10`);
      expect(ctrl.getModifier(items[0]).offsetY).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${ctrl.getModifier(items[1]).scale}, expected=1`);
      expect(ctrl.getModifier(items[1]).scale).assertLess(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${ctrl.getModifier(items[1]).scale}, expected=0.9`);
      expect(ctrl.getModifier(items[1]).scale).assertLarger(0.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(0.5);
      log('testExchangeCtrl0132 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0133
     * @tc.name      testExchangeCtrl0133
     * @tc.desc      Verify a small upward move resets the next item scale to one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0133 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[0]).scale = 0.5;
      ctrl.getModifier(items[1]).scale = 0.5;
      ctrl.onMove(items[0], -10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).offsetY}, expected=-10`);
      expect(ctrl.getModifier(items[0]).offsetY).assertEqual(-10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[1]).scale}, expected=1`);
      expect(ctrl.getModifier(items[1]).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(0.5);
      log('testExchangeCtrl0133 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0134
     * @tc.name      testExchangeCtrl0134
     * @tc.desc      Verify a move of half the item height does not trigger an exchange yet.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0134 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[0]).scale = 0.5;
      ctrl.getModifier(items[1]).scale = 0.5;
      ctrl.onMove(items[0], 25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).offsetY}, expected=25`);
      expect(ctrl.getModifier(items[0]).offsetY).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess actual=${ctrl.getModifier(items[1]).scale}, expected=1`);
      expect(ctrl.getModifier(items[1]).scale).assertLess(1);
      log('testExchangeCtrl0134 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0135
     * @tc.name      testExchangeCtrl0135
     * @tc.desc      Verify a negative half-height move keeps the ordering unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0135 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[0]).scale = 0.5;
      ctrl.getModifier(items[1]).scale = 0.5;
      ctrl.onMove(items[0], -25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).offsetY}, expected=-25`);
      expect(ctrl.getModifier(items[0]).offsetY).assertEqual(-25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[1]).scale}, expected=1`);
      expect(ctrl.getModifier(items[1]).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(0.5);
      log('testExchangeCtrl0135 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0136
     * @tc.name      testExchangeCtrl0136
     * @tc.desc      Verify moving an unknown item is swallowed without breaking the list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0136 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      const ghost: ListInfo = new ListInfo('icon_x', 'X');
      let movedSafely: boolean = false;
      try {
        ctrl.onMove(ghost, 10);
        movedSafely = true;
      } catch (err) {
        movedSafely = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue movedSafely=${movedSafely}`);
      expect(movedSafely).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=1`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).offsetY}, expected=0`);
      expect(ctrl.getModifier(items[0]).offsetY).assertEqual(0);
      log('testExchangeCtrl0136 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0137
     * @tc.name      testExchangeCtrl0137
     * @tc.desc      Verify a small move on the last item resets the previous item scale.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0137 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[2]).scale = 0.5;
      ctrl.getModifier(items[1]).scale = 0.5;
      ctrl.onMove(items[3], 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[3]).offsetY}, expected=10`);
      expect(ctrl.getModifier(items[3]).offsetY).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[2]).scale}, expected=1`);
      expect(ctrl.getModifier(items[2]).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[1]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[1]).scale).assertEqual(0.5);
      log('testExchangeCtrl0137 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0138
     * @tc.name      testExchangeCtrl0138
     * @tc.desc      Verify an upward move beyond half height on the first item is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0138 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[0]).scale = 0.5;
      ctrl.getModifier(items[1]).scale = 0.5;
      ctrl.onMove(items[0], -30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).offsetY}, expected=-30`);
      expect(ctrl.getModifier(items[0]).offsetY).assertEqual(-30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[1]).scale}, expected=1`);
      expect(ctrl.getModifier(items[1]).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[0]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[0]).scale).assertEqual(0.5);
      log('testExchangeCtrl0138 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CTRL_0139
     * @tc.name      testExchangeCtrl0139
     * @tc.desc      Verify a downward move beyond half height on the last item is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExchangeCtrl0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testExchangeCtrl0139 begin');
      const ctrl: ListExchangeCtrl<ListInfo> = new ListExchangeCtrl<ListInfo>();
      const items: ListInfo[] = makeItems();
      ctrl.initData(items);
      ctrl.getModifier(items[2]).scale = 0.5;
      ctrl.getModifier(items[1]).scale = 0.5;
      ctrl.onMove(items[3], 30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[3]).offsetY}, expected=30`);
      expect(ctrl.getModifier(items[3]).offsetY).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[2]).scale}, expected=1`);
      expect(ctrl.getModifier(items[2]).scale).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ctrl.getModifier(items[1]).scale}, expected=0.5`);
      expect(ctrl.getModifier(items[1]).scale).assertEqual(0.5);
      log('testExchangeCtrl0139 end');
    })
  })
}
