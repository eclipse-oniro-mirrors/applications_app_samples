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

// [Start StaDynBuilderBindingDynIndex]
// dynamic_module/index.ets
export { Person } from './src/main/ets/components/DynBuilderByRef'; // 导出ArkTS-Dyn Person类
// [End StaDynBuilderBindingDynIndex]

// [Start StaDynCreateArrayIndex]
// dynamic_module/index.ets
export { dynCreateArray } from './src/main/ets/components/DynCreateArray';
// [End StaDynCreateArrayIndex]

// [Start StaDynCreateMapIndex]
// dynamic_module/index.ets
export { dynCreateMap } from './src/main/ets/components/DynCreateMap';
// [End StaDynCreateMapIndex]

// [Start StaDynCreateSetIndex]
// dynamic_module/index.ets
export { dynCreateSet } from './src/main/ets/components/DynCreateSet';
// [End StaDynCreateSetIndex]
