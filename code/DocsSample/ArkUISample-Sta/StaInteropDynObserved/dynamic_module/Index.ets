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

// [Start StaDynObservedDynIndexClass]
// dynamic_module/Index.ets

export { MyClassA } from './src/main/ets/components/ObservedClass'; // 导出动态@Observed装饰的类
// [End StaDynObservedDynIndexClass]

// [Start StaDynObservedDynIndexMap]
// dynamic_module/Index.ets

export { MapInfo } from './src/main/ets/components/ObservedMapInfo';
// [End StaDynObservedDynIndexMap]

// [Start StaDynObservedDynIndexSet]
// dynamic_module/Index.ets

export { SetInfo } from './src/main/ets/components/ObservedSetInfo';
// [End StaDynObservedDynIndexSet]
