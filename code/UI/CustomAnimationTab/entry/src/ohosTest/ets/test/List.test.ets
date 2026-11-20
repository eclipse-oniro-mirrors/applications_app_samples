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

import { beforeEachIt } from '@ohos/hypium';
import abilityTest from './Ability.test';
import tabInfoModelCoreTest from './TabInfoModelCore.test';
import componentFactoryCoreTest from './ComponentFactoryCore.test';
import componentFactoryExtendedTest from './ComponentFactoryExtended.test';
import controllerLogicCoreTest from './ControllerLogicCore.test';
import indicatorAttributeModelCoreTest from './IndicatorAttributeModelCore.test';
import tabBarAttributeModelCoreTest from './TabBarAttributeModelCore.test';
import tabItemInterfaceModelCoreTest from './TabItemInterfaceModelCore.test';
import configureConstantsCoreTest from './ConfigureConstantsCore.test';
import indexTabUiStateTest from './IndexTabUiState.test';
import componentFactoryGetBarTest from './logic/ComponentFactoryGetBar.test';
import componentFactoryToArrayTest from './logic/ComponentFactoryToArray.test';
import componentFactoryFlowTest from './logic/ComponentFactoryFlow.test';
import componentFactoryFlow2Test from './logic/ComponentFactoryFlow2.test';
import componentFactoryFlow3Test from './logic/ComponentFactoryFlow3.test';
import componentFactoryFlow4Test from './logic/ComponentFactoryFlow4.test';
import componentFactoryFlow5Test from './logic/ComponentFactoryFlow5.test';
import componentFactoryFlow6Test from './logic/ComponentFactoryFlow6.test';
import componentFactoryFlow7Test from './logic/ComponentFactoryFlow7.test';
import componentFactoryFlow8Test from './logic/ComponentFactoryFlow8.test';
import componentFactoryFlow9Test from './logic/ComponentFactoryFlow9.test';
import componentFactoryFlow10Test from './logic/ComponentFactoryFlow10.test';
import componentFactoryFlow11Test from './logic/ComponentFactoryFlow11.test';
import componentFactoryFlow12Test from './logic/ComponentFactoryFlow12.test';
import componentFactoryFlow13Test from './logic/ComponentFactoryFlow13.test';
import componentFactoryFlow14Test from './logic/ComponentFactoryFlow14.test';
import componentFactoryFlow15Test from './logic/ComponentFactoryFlow15.test';
import componentFactoryFlow16Test from './logic/ComponentFactoryFlow16.test';
import componentFactoryFlow17Test from './logic/ComponentFactoryFlow17.test';
import componentFactoryFlow18Test from './logic/ComponentFactoryFlow18.test';
import componentFactoryFlow19Test from './logic/ComponentFactoryFlow19.test';
import componentFactoryFlow20Test from './logic/ComponentFactoryFlow20.test';
import componentFactoryFlow21Test from './logic/ComponentFactoryFlow21.test';
import componentFactoryFlow22Test from './logic/ComponentFactoryFlow22.test';
import componentFactoryFlow23Test from './logic/ComponentFactoryFlow23.test';
import componentFactoryFlow24Test from './logic/ComponentFactoryFlow24.test';
import componentFactoryFlow25Test from './logic/ComponentFactoryFlow25.test';
import componentFactoryFlow26Test from './logic/ComponentFactoryFlow26.test';
import componentFactoryFlow27Test from './logic/ComponentFactoryFlow27.test';
import componentFactoryFlow28Test from './logic/ComponentFactoryFlow28.test';
import animationAttributeCtorTest from './logic/AnimationAttributeCtor.test';
import indicatorBarAttributeValuesTest from './logic/IndicatorBarAttributeValues.test';
import tabBarAttributeCtorTest from './logic/TabBarAttributeCtor.test';
import sizeModeValuesTest from './logic/SizeModeValues.test';
import commonConstantsValuesTest from './logic/CommonConstantsValues.test';
import customAnimationTabConfigureValuesTest from './logic/CustomAnimationTabConfigureValues.test';

const YIELD_DELAY_MS: number = 1;

function yieldToEventHandler(): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve();
    }, YIELD_DELAY_MS);
  });
}

export default function testsuite() {
  // 每条用例执行前让出主线程 1ms，使 watchdog 的检测任务能在用例之间得到调度，避免 THREAD_BLOCK_3S/6S
  beforeEachIt(yieldToEventHandler);
  abilityTest();
  tabInfoModelCoreTest();
  componentFactoryCoreTest();
  componentFactoryExtendedTest();
  controllerLogicCoreTest();
  indicatorAttributeModelCoreTest();
  tabBarAttributeModelCoreTest();
  tabItemInterfaceModelCoreTest();
  configureConstantsCoreTest();
  indexTabUiStateTest();
  componentFactoryGetBarTest();
  componentFactoryToArrayTest();
  componentFactoryFlowTest();
  componentFactoryFlow2Test();
  componentFactoryFlow3Test();
  componentFactoryFlow4Test();
  componentFactoryFlow5Test();
  componentFactoryFlow6Test();
  componentFactoryFlow7Test();
  componentFactoryFlow8Test();
  componentFactoryFlow9Test();
  componentFactoryFlow10Test();
  componentFactoryFlow11Test();
  componentFactoryFlow12Test();
  componentFactoryFlow13Test();
  componentFactoryFlow14Test();
  componentFactoryFlow15Test();
  componentFactoryFlow16Test();
  componentFactoryFlow17Test();
  componentFactoryFlow18Test();
  componentFactoryFlow19Test();
  componentFactoryFlow20Test();
  componentFactoryFlow21Test();
  componentFactoryFlow22Test();
  componentFactoryFlow23Test();
  componentFactoryFlow24Test();
  componentFactoryFlow25Test();
  componentFactoryFlow26Test();
  componentFactoryFlow27Test();
  componentFactoryFlow28Test();
  animationAttributeCtorTest();
  indicatorBarAttributeValuesTest();
  tabBarAttributeCtorTest();
  sizeModeValuesTest();
  commonConstantsValuesTest();
  customAnimationTabConfigureValuesTest();
}
