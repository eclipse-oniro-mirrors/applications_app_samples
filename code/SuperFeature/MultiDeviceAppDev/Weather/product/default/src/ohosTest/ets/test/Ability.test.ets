/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit'
import { Want } from '@kit.AbilityKit'
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { BreakpointConstants, StorageKeys } from '@ohos/common'
import { logger } from '../util/Logger'

const BUNDLE: string = 'Weather_'
const driver: Driver = Driver.create()

export default function abilityTest() {
  describe('AbilityTest', () => {
    /**
     * @tc.name   testAbility0001
     * @tc.number SUB_WEATHER_ABILITY_0001
     * @tc.desc   Launch the application and check that MainAbility stays on top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    // 启动应用，进入首页
    it('testAbility0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void) => {
      logger.info(`${BUNDLE}testAbility0001 begin`)
      const delegator = abilityDelegatorRegistry.getAbilityDelegator()
      const want: Want = {
        bundleName: 'ohos.samples.weather',
        abilityName: 'MainAbility'
      }
      delegator.startAbility(want, (err) => {
        logger.info(`${BUNDLE}startAbility end err ${JSON.stringify(err)}`)
      })
      await driver.delayMs(1000)
      await delegator.getCurrentTopAbility().then((Ability) => {
        const info = Ability.context.abilityInfo
        logger.info(`actual top ability ${info.name}, bundle ${info.bundleName}`)
        expect(info.name).assertEqual('MainAbility')
        expect(info.bundleName).assertEqual('ohos.samples.weather')
        expect(info.name.includes('Ability')).assertTrue()
      })
      logger.info(`${BUNDLE}testAbility0001 end`)
      done()
    })

    /**
     * @tc.name   testAbility0002
     * @tc.number SUB_WEATHER_ABILITY_0002
     * @tc.desc   Hide and show the sidebar container in large breakpoint
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    // 侧边栏隐藏和显示
    it('testAbility0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void) => {
      logger.info(`${BUNDLE}testAbility0002 begin`)
      if (AppStorage.get<string>(StorageKeys.CUR_BP) === BreakpointConstants.LG) {
        logger.info('assert exists: ON.id cancelSubarea')
        await driver.assertComponentExist(ON.id('cancelSubarea'))
        const cancelSlider = await driver.findComponent(ON.id('cancelSubarea'))
        await cancelSlider.click()
        logger.info('assert exists: ON.id iconSubarea')
        await driver.assertComponentExist(ON.id('iconSubarea'))
        const subarea = await driver.findComponent(ON.id('iconSubarea'))
        await subarea.click()
        logger.info('assert exists: ON.id cancelSubarea')
        await driver.assertComponentExist(ON.id('cancelSubarea'))
      }
      logger.info(`${BUNDLE}testAbility0002 end`)
      done()
    })

    /**
     * @tc.name   testAbility0003
     * @tc.number SUB_WEATHER_ABILITY_0003
     * @tc.desc   Switch the current city by clicking the sidebar city item
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    // 侧边栏中点击切换城市
    it('testAbility0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void) => {
      logger.info(`${BUNDLE}testAbility0003 begin`)
      if (AppStorage.get<string>(StorageKeys.CUR_BP) === BreakpointConstants.LG) {
        logger.info('assert exists: ON.id sliderCity1')
        await driver.assertComponentExist(ON.id('sliderCity1'))
        const shanghai = await driver.findComponent(ON.id('sliderCity1'))
        await shanghai.click()
        logger.info('assert exists: ON.id homeContent1')
        await driver.assertComponentExist(ON.id('homeContent1'))
        logger.info('assert exists: ON.id sliderCity0')
        await driver.assertComponentExist(ON.id('sliderCity0'))
        const beijing = await driver.findComponent(ON.id('sliderCity0'))
        await beijing.click()
        logger.info('assert exists: ON.id homeContent0')
        await driver.assertComponentExist(ON.id('homeContent0'))
        logger.info('assert exists: ON.id cancelSubarea')
        await driver.assertComponentExist(ON.id('cancelSubarea'))
        const cancelSlider1 = await driver.findComponent(ON.id('cancelSubarea'))
        await cancelSlider1.click()
        logger.info('assert exists: ON.id iconSubarea')
        await driver.assertComponentExist(ON.id('iconSubarea'))
      }
      logger.info(`${BUNDLE}testAbility0003 end`)
      done()
    })

    /**
     * @tc.name   testAbility0004
     * @tc.number SUB_WEATHER_ABILITY_0004
     * @tc.desc   Switch the current city by swiping the home content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    //Swiper滑动切换城市
    it('testAbility0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void) => {
      logger.info(`${BUNDLE}testAbility0004 begin`)
      logger.info('assert exists: ON.id homeContent0')
      await driver.assertComponentExist(ON.id('homeContent0'))
      await driver.swipe(500, 200, 100, 200)
      logger.info('assert exists: ON.id homeContent1')
      await driver.assertComponentExist(ON.id('homeContent1'))
      await driver.swipe(100, 200, 500, 200)
      logger.info('assert exists: ON.id homeContent0')
      await driver.assertComponentExist(ON.id('homeContent0'))
      logger.info(`${BUNDLE}testAbility0004 end`)
      done()
    })

    /**
     * @tc.name   testAbility0005
     * @tc.number SUB_WEATHER_ABILITY_0005
     * @tc.desc   Open the update interval dialog and cancel it
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    // 更新间隔
    it('testAbility0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void) => {
      logger.info(`${BUNDLE}testAbility0005 begin`)
      const delegator = abilityDelegatorRegistry.getAbilityDelegator()
      // 获取ability
      const ability = await delegator.getCurrentTopAbility()
      //获取manager
      const manager = ability.context.resourceManager
      // 点击弹出菜单
      logger.info('assert exists: ON.id menuPopup')
      await driver.assertComponentExist(ON.id('menuPopup'))
      const iconMore = await driver.findComponent(ON.id('menuPopup'))
      await iconMore.click()
      // 点击弹出更新时间弹窗
      logger.info('assert exists: ON.id menu1')
      await driver.assertComponentExist(ON.id('menu1'))
      const city = await driver.findComponent(ON.id('menu1'))
      await city.click()
      await driver.delayMs(500)
      logger.info('assert exists: ON.text cancel')
      await driver.assertComponentExist(ON.text(await manager.getStringValue($r('app.string.cancel')), MatchPattern.CONTAINS))
      const cancel = await driver.findComponent(ON.text(await manager.getStringValue($r('app.string.cancel')), MatchPattern.CONTAINS))
      await cancel.click()
      logger.info(`${BUNDLE}testAbility0005 end`)
      done()
    })

    /**
     * @tc.name   testAbility0006
     * @tc.number SUB_WEATHER_ABILITY_0006
     * @tc.desc   Enter the city management page from the home menu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    // 点击弹出菜单
    it('testAbility0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void) => {
      logger.info(`${BUNDLE}testAbility0006 begin`)
      const delegator = abilityDelegatorRegistry.getAbilityDelegator()
      // 获取ability
      const ability = await delegator.getCurrentTopAbility()
      //获取manager
      const manager = ability.context.resourceManager
      // 点击弹出菜单
      logger.info('assert exists: ON.id menuPopup')
      await driver.assertComponentExist(ON.id('menuPopup'))
      const iconMore = await driver.findComponent(ON.id('menuPopup'))
      await iconMore.click()
      // 点击菜单进入管理城市
      logger.info('assert exists: ON.id menu0')
      await driver.assertComponentExist(ON.id('menu0'))
      const city = await driver.findComponent(ON.id('menu0'))
      await city.click()
      logger.info('assert exists: ON.text bei_jing')
      await driver.assertComponentExist(ON.text(await manager.getStringValue($r('app.string.bei_jing')), MatchPattern.CONTAINS))
      logger.info('assert exists: ON.text shang_hai')
      await driver.assertComponentExist(ON.text(await manager.getStringValue($r('app.string.shang_hai')), MatchPattern.CONTAINS))
      logger.info(`${BUNDLE}testAbility0006 end`)
      done()
    })

    /**
     * @tc.name   testAbility0007
     * @tc.number SUB_WEATHER_ABILITY_0007
     * @tc.desc   Add a city from the hot city list and return to the home page
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    // 添加城市
    it('testAbility0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void) => {
      logger.info(`${BUNDLE}testAbility0007 begin`)
      const delegator = abilityDelegatorRegistry.getAbilityDelegator()
      // 获取ability
      const ability = await delegator.getCurrentTopAbility()
      //获取manager
      const manager = ability.context.resourceManager
      // 点击菜单进入管理城市
      logger.info('assert exists: ON.id addCity')
      await driver.assertComponentExist(ON.id('addCity'))
      const addCity = await driver.findComponent(ON.id('addCity'))
      await addCity.click()
      // 添加城市
      logger.info('assert exists: ON.text wu_han')
      await driver.assertComponentExist(ON.text(await manager.getStringValue($r('app.string.wu_han')), MatchPattern.CONTAINS))
      const city = await driver.findComponent(ON.text(await manager.getStringValue($r('app.string.wu_han')), MatchPattern.CONTAINS))
      await city.click()
      await driver.delayMs(500)
      logger.info('assert exists: ON.text wu_han')
      await driver.assertComponentExist(ON.text(await manager.getStringValue($r('app.string.wu_han')), MatchPattern.CONTAINS))
      // 返回首页
      await driver.pressBack()
      logger.info(`${BUNDLE}testAbility0007 end`)
      done()
    })
  })
}
