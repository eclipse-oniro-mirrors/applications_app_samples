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

import { beforeAll, describe, expect, it, Level, TestType, Size } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import router from '@ohos.router';


const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let driver: Driver;
let want: Want;


export default function ReusableMigration() {
  describe('ReusableMigration', () => {
    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      driver = Driver.create();
      await driver.delayMs(1000);

      const ability: UIAbility = await delegator.getCurrentTopAbility();
      console.info('get top ability');
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    });

    /*
     * @tc.number     : ReusableIfScene_031
     * @tc.name       : testReusableIfScene
     * @tc.desc       : 测试if使用场景复用组件
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReusableIfScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await router.pushUrl({ url: 'pages/reusablemigration/ReusableIfScene' });
        await driver.delayMs(1000);
        // 验证复用组件初始内容存在
        const childText = await driver.findComponent(ON.text('Child'));
        expect(childText === null).assertFalse();
        await driver.delayMs(1000);
        // 点击按钮隐藏子组件
        const button = await driver.findComponent(ON.text('Hello'));
        expect(button === null).assertFalse();
        await button.click();
        await driver.delayMs(1000);
        // 再次点击按钮重新显示子组件，验证复用
        await button.click();
        await driver.delayMs(1000);
        const childTextReuse = await driver.findComponent(ON.text('Child'));
        expect(childTextReuse === null).assertFalse();
        await driver.delayMs(2000);
        await driver.pressBack();
        await driver.delayMs(1000);
        done();
      });

    /*
     * @tc.number     : ReusableRepeatScene_032
     * @tc.name       : testReusableRepeatScene
     * @tc.desc       : 测试列表滚动Repeat使用场景复用组件
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReusableRepeatScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await router.pushUrl({ url: 'pages/reusablemigration/ReusableRepeatScene' });
        await driver.delayMs(1000);
        // 验证列表项内容存在
        const item = await driver.findComponent(ON.text('Item 1'));
        expect(item === null).assertFalse();
        await driver.delayMs(1000);
        // 滑动列表验证复用
        await driver.swipe(300, 400, 300, 100);
        await driver.delayMs(1000);
        await driver.pressBack();
        await driver.delayMs(1000);
        done();
      });

    /*
     * @tc.number     : ReusableListIfScene_033
     * @tc.name       : testReusableListIfScene
     * @tc.desc       : 测试列表滚动if使用场景复用组件
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReusableListIfScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await router.pushUrl({ url: 'pages/reusablemigration/ReusableListIfScene' });
        await driver.delayMs(1000);
        // 验证列表项内容存在，实际显示的是moment.text即id
        const item = await driver.findComponent(ON.text('0'));
        expect(item === null).assertFalse();
        await driver.delayMs(1000);
        // 滑动列表验证复用
        await driver.swipe(300, 400, 300, 100);
        await driver.delayMs(1000);
        await driver.pressBack();
        await driver.delayMs(1000);
        done();
      });

    /*
     * @tc.number     : ReusableRepeatAllLoadScene_034
     * @tc.name       : testReusableRepeatAllLoadScene
     * @tc.desc       : 测试列表滚动Repeat全量加载使用场景复用组件
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReusableRepeatAllLoadScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await router.pushUrl({ url: 'pages/reusablemigration/ReusableRepeatAllLoadScene' });
        await driver.delayMs(1000);
        // 点击update生成列表数据
        const updateBtn = await driver.findComponent(ON.text('update'));
        expect(updateBtn === null).assertFalse();
        await driver.delayMs(1000);
        await updateBtn.click();
        await driver.delayMs(1000);
        // 验证列表项内容存在
        const item = await driver.findComponent(ON.text('1.标题'));
        expect(item === null).assertFalse();
        await driver.delayMs(1000);
        // 点击列表项验证展开功能
        await item.click();
        await driver.delayMs(1000);
        const expand = await driver.findComponent(ON.text('expand'));
        expect(expand === null).assertFalse();
        await driver.delayMs(1000);
        // 点击clear清空列表数据
        const clearBtn = await driver.findComponent(ON.text('clear'));
        expect(clearBtn === null).assertFalse();
        await clearBtn.click();
        await driver.delayMs(2000);
        await driver.pressBack();
        await driver.delayMs(1000);
        done();
      });

    /*
     * @tc.number     : ReusableGridScene_035
     * @tc.name       : testReusableGridScene
     * @tc.desc       : 测试Grid使用场景复用组件
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReusableGridScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await router.pushUrl({ url: 'pages/reusablemigration/ReusableGridScene' });
        await driver.delayMs(1000);
        // 验证网格项内容存在
        const item = await driver.findComponent(ON.text('图片1'));
        expect(item === null).assertFalse();
        await driver.delayMs(1000);
        // 滑动网格验证复用
        await driver.swipe(300, 400, 300, 100);
        await driver.delayMs(2000);
        await driver.pressBack();
        await driver.delayMs(1000);
        done();
      });

    /*
     * @tc.number     : ReusableWaterFlowScene_036
     * @tc.name       : testReusableWaterFlowScene
     * @tc.desc       : 测试WaterFlow使用场景复用组件
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReusableWaterFlowScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await router.pushUrl({ url: 'pages/reusablemigration/ReusableWaterFlowScene' });
        await driver.delayMs(1000);
        // 验证瀑布流子项内容存在
        const item = await driver.findComponent(ON.text('N0'));
        expect(item === null).assertFalse();
        await driver.delayMs(1000);
        // 滑动瀑布流加载更多数据
        await driver.swipe(300, 400, 300, 100);
        await driver.delayMs(1000);
        // 点击回到顶部
        const backTop = await driver.findComponent(ON.text('back top'));
        expect(backTop === null).assertFalse();
        await backTop.click();
        await driver.delayMs(2000);
        await driver.pressBack();
        await driver.delayMs(1000);
        done();
      });

    /*
     * @tc.number     : ReusableSwiperScene_037
     * @tc.name       : testReusableSwiperScene
     * @tc.desc       : 测试Swiper使用场景复用组件
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReusableSwiperScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await router.pushUrl({ url: 'pages/reusablemigration/ReusableSwiperScene' });
        await driver.delayMs(1000);
        // 验证轮播项内容存在
        const item = await driver.findComponent(ON.text('1test_swiper'));
        expect(item === null).assertFalse();
        await driver.delayMs(1000);
        // 滑动轮播验证复用
        await driver.swipe(300, 300, 100, 300);
        await driver.delayMs(2000);
        await driver.pressBack();
        await driver.delayMs(1000);
        done();
      });

    /*
     * @tc.number     : ReusableListItemGroupScene_038
     * @tc.name       : testReusableListItemGroupScene
     * @tc.desc       : 测试列表滚动ListItemGroup使用场景复用组件
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReusableListItemGroupScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await router.pushUrl({ url: 'pages/reusablemigration/ReusableListItemGroupScene' });
        await driver.delayMs(1000);
        // 验证分组列表项内容存在
        const item = await driver.findComponent(ON.text('测试条目数据: 0 - 0'));
        expect(item === null).assertFalse();
        await driver.delayMs(1000);
        // 滑动列表验证复用
        await driver.swipe(300, 400, 300, 100);
        await driver.delayMs(2000);
        await driver.pressBack();
        await driver.delayMs(1000);
        done();
      });

    /*
     * @tc.number     : ReusableLimitTypeScene_039
     * @tc.name       : testReusableLimitTypeScene
     * @tc.desc       : 测试多种条目类型有限变化型复用组件
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReusableLimitTypeScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await router.pushUrl({ url: 'pages/reusablemigration/ReusableLimitTypeScene' });
        await driver.delayMs(1000);
        // 验证偶数项内容存在
        const itemEven = await driver.findComponent(ON.text('Item 0 ReusableComponentOne'));
        expect(itemEven === null).assertFalse();
        await driver.delayMs(1000);
        // 验证奇数项内容存在
        const itemOdd = await driver.findComponent(ON.text('Item 1 ReusableComponentTwo'));
        expect(itemOdd === null).assertFalse();
        await driver.delayMs(1000);
        // 滑动列表验证复用
        await driver.swipe(300, 400, 300, 100);
        await driver.delayMs(2000);
        await driver.pressBack();
        await driver.delayMs(1000);
        done();
      });

    /*
     * @tc.number     : ReusableGroupTypeScene_040
     * @tc.name       : testReusableGroupTypeScene
     * @tc.desc       : 测试多种条目类型组合型复用组件
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReusableGroupTypeScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await router.pushUrl({ url: 'pages/reusablemigration/ReusableGroupTypeScene' });
        await driver.delayMs(1000);
        // 验证子组件A内容存在
        const componentA = await driver.findComponent(ON.text('Item 0 Child Component A'));
        expect(componentA === null).assertFalse();
        await driver.delayMs(1000);
        // 验证子组件B内容存在
        const componentB = await driver.findComponent(ON.text('Item 0 Child Component B'));
        expect(componentB === null).assertFalse();
        await driver.delayMs(1000);
        // 滑动列表验证复用
        await driver.swipe(300, 400, 300, 100);
        await driver.delayMs(2000);
        await driver.pressBack();
        await driver.delayMs(1000);
        done();
      });
  });
}
