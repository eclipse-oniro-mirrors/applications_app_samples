'use static'
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

// [Start DynInteropStaStatemgmtV1Index]
// static_module/Index.ets
export { Child } from './src/main/ets/components/StaStatemgmtV1'; // 导出ArkTS-Sta自定义组件Child
// [End DynInteropStaStatemgmtV1Index]

// [Start DynInteropStaStatemgmtV1IndexObserved]
// static_module/Index.ets
export { MyClassA } from './src/main/ets/components/StaStatemgmtV1Observed'; // 导出静态@Observed装饰的类MyClassA
// [End DynInteropStaStatemgmtV1IndexObserved]

// [Start DynInteropStaStatemgmtV1IndexAppStorage]
// static_module/Index.ets
export { MainPage } from './src/main/ets/components/StaAppStorage'; // 导出ArkTS-Sta自定义组件
// [End DynInteropStaStatemgmtV1IndexAppStorage]

export { AppStoragePage } from './src/main/ets/components/StaAppStorageData'; // 导出ArkTS-Sta自定义组件AppStoragePage

export { LocalStoragePage } from './src/main/ets/components/StaLocalStorage'; // 导出ArkTS-Sta自定义组件LocalStoragePage

export { PersistentStoragePage } from './src/main/ets/components/StaPersistentStorage'; // 导出ArkTS-Sta自定义组件PersistentStoragePage

export { EnvironmentPage } from './src/main/ets/components/StaEnvironment'; // 导出ArkTS-Sta自定义组件EnvironmentPage

// [Start DynInteropStaStatemgmtV2Index]
// static_module/Index.ets
export { MainPageV2 } from './src/main/ets/components/StaStatemgmtV2';
// [End DynInteropStaStatemgmtV2Index]

// [Start DynInteropStaStatemgmtV2IndexObservedV2]
// static_module/Index.ets
export { setEnableCompatibleObservedV2ForDynamic, ObservedV2ForStatic } from './src/main/ets/components/StaStatemgmtV2ObservedV2';
// [End DynInteropStaStatemgmtV2IndexObservedV2]

// [Start DynInteropStaStatemgmtV2IndexObservedV2Nested]
// static_module/Index.ets
export { setEnableCompatibleObservedV2ForDynamicNested, Son } from './src/main/ets/components/StaObservedV2Nested';
// [End DynInteropStaStatemgmtV2IndexObservedV2Nested]

// [Start DynInteropStaStatemgmtV2IndexObservedV2Inherit]
// static_module/Index.ets
export { setEnableCompatibleObservedV2ForDynamicInherit, Sonny, Cousin } from './src/main/ets/components/StaObservedV2Inherit';
// [End DynInteropStaStatemgmtV2IndexObservedV2Inherit]

// [Start DynInteropStaStatemgmtV2IndexAppStorageV2]
// static_module/Index.ets
export {
  AppStorageV2Page, STATIC_KEY, DYNAMIC_KEY, FONT_SIZE, MARGIN, MessageModel, setEnableCompatibleObservedV2ForDynamicStorage
} from './src/main/ets/components/StaAppStorageV2';
// [End DynInteropStaStatemgmtV2IndexAppStorageV2]

// [Start DynInteropStaStatemgmtV2IndexPersistenceV2]
// static_module/Index.ets
export {
  PersistenceV2Page, canTracePropPlusInStatic, normalPropPlusInStatic, connectInStatic, saveInStatic, removeInStatic,
  keysInStatic, StaDataModel
} from './src/main/ets/components/StaPersistenceV2';
// [End DynInteropStaStatemgmtV2IndexPersistenceV2]
