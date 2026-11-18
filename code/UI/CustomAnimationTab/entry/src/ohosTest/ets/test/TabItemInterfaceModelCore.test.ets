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
import { BaseInterface, TabBarItemInterface } from '../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'TabItemInterfaceTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function makeBarItem(curIndex: number, index: number, title: string): TabBarItemInterface {
  return { curIndex: curIndex, index: index, title: title };
}

export default function tabItemInterfaceModelCoreTest(): void {
  describe('TabItemInterfaceModelCoreTest', () => {
    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0601
     * @tc.name      testTabItemInterface0601
     * @tc.desc      Verify a BaseInterface object keeps curIndex.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0601 begin');
      const base: BaseInterface = { curIndex: 2 };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual base.curIndex=${base.curIndex}, expected=2`);
      expect(base.curIndex).assertEqual(2);
      log('testTabItemInterface0601 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0602
     * @tc.name      testTabItemInterface0602
     * @tc.desc      Verify a TabBarItemInterface keeps all three fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0602 begin');
      const item: TabBarItemInterface = makeBarItem(1, 0, '全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.curIndex=${item.curIndex}, expected=1`);
      expect(item.curIndex).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.index=${item.index}, expected=0`);
      expect(item.index).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected='全部'`);
      expect(item.title).assertEqual('全部');
      log('testTabItemInterface0602 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0603
     * @tc.name      testTabItemInterface0603
     * @tc.desc      Verify a bar item satisfies the base interface shape.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0603 begin');
      const item: TabBarItemInterface = makeBarItem(0, 0, 'UI布局');
      const base: BaseInterface = item;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual base.curIndex=${base.curIndex}, expected=0`);
      expect(base.curIndex).assertEqual(0);
      log('testTabItemInterface0603 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0604
     * @tc.name      testTabItemInterface0604
     * @tc.desc      Verify curIndex mutation is visible on re-read.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0604 begin');
      const item: TabBarItemInterface = makeBarItem(0, 2, '动效');
      item.curIndex = 2;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.curIndex=${item.curIndex}, expected=2`);
      expect(item.curIndex).assertEqual(2);
      log('testTabItemInterface0604 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0605
     * @tc.name      testTabItemInterface0605
     * @tc.desc      Verify title mutation is visible on re-read.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0605 begin');
      const item: TabBarItemInterface = makeBarItem(0, 3, '三方库');
      item.title = 'Native';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected='Native'`);
      expect(item.title).assertEqual('Native');
      log('testTabItemInterface0605 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0606
     * @tc.name      testTabItemInterface0606
     * @tc.desc      Verify an empty title is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0606 begin');
      const item: TabBarItemInterface = makeBarItem(0, 0, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected=''`);
      expect(item.title).assertEqual('');
      log('testTabItemInterface0606 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0607
     * @tc.name      testTabItemInterface0607
     * @tc.desc      Verify a Chinese title is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0607 begin');
      const item: TabBarItemInterface = makeBarItem(0, 4, '其它');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected='其它'`);
      expect(item.title).assertEqual('其它');
      log('testTabItemInterface0607 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0608
     * @tc.name      testTabItemInterface0608
     * @tc.desc      Verify a numeric-string title is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0608 begin');
      const item: TabBarItemInterface = makeBarItem(0, 5, '007');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.title=${item.title}, expected='007'`);
      expect(item.title).assertEqual('007');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.title=${typeof item.title}, expected='string'`);
      expect(typeof item.title).assertEqual('string');
      log('testTabItemInterface0608 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0609
     * @tc.name      testTabItemInterface0609
     * @tc.desc      Verify index zero is a valid boundary value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0609 begin');
      const item: TabBarItemInterface = makeBarItem(0, 0, '标题1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.index=${item.index}, expected=0`);
      expect(item.index).assertEqual(0);
      log('testTabItemInterface0609 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0610
     * @tc.name      testTabItemInterface0610
     * @tc.desc      Verify a large index value is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0610 begin');
      const item: TabBarItemInterface = makeBarItem(0, 9999, '标题4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.index=${item.index}, expected=9999`);
      expect(item.index).assertEqual(9999);
      log('testTabItemInterface0610 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0611
     * @tc.name      testTabItemInterface0611
     * @tc.desc      Verify the selected case keeps curIndex equal to index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0611 begin');
      const item: TabBarItemInterface = makeBarItem(3, 3, '标题3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item.curIndex === item.index=${item.curIndex === item.index}`);
      expect(item.curIndex === item.index).assertTrue();
      log('testTabItemInterface0611 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0612
     * @tc.name      testTabItemInterface0612
     * @tc.desc      Verify the unselected case keeps curIndex different.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0612 begin');
      const item: TabBarItemInterface = makeBarItem(1, 3, '标题3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse item.curIndex === item.index=${item.curIndex === item.index}`);
      expect(item.curIndex === item.index).assertFalse();
      log('testTabItemInterface0612 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0613
     * @tc.name      testTabItemInterface0613
     * @tc.desc      Verify field types remain number and string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0613 begin');
      const item: TabBarItemInterface = makeBarItem(2, 1, 'UI布局');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.curIndex=${typeof item.curIndex}`);
      expect(typeof item.curIndex).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.index=${typeof item.index}, expected='number'`);
      expect(typeof item.index).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.title=${typeof item.title}, expected='string'`);
      expect(typeof item.title).assertEqual('string');
      log('testTabItemInterface0613 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_TABITEMINTERFACE_0614
     * @tc.name      testTabItemInterface0614
     * @tc.desc      Verify two item objects stay mutually independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabItemInterface0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabItemInterface0614 begin');
      const first: TabBarItemInterface = makeBarItem(0, 0, '标题1');
      const second: TabBarItemInterface = makeBarItem(1, 1, '标题2');
      first.curIndex = 5;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.curIndex=${second.curIndex}, expected=1`);
      expect(second.curIndex).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.title=${second.title}, expected='标题2'`);
      expect(second.title).assertEqual('标题2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.curIndex=${first.curIndex}, expected=5`);
      expect(first.curIndex).assertEqual(5);
      log('testTabItemInterface0614 end');
    })
  })
}
