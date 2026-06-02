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

// [Start DynInteropStaComponentIndex]
// static_module/Index.ets
export { ChildComponentV1, ChildComponentV2 } from './src/main/ets/components/StaComponent';
// [End DynInteropStaComponentIndex]

// [Start DynInteropStaBuilderIndexByCallback]
// static_module/Index.ets
export { CustomButton, createStaticMutableBinding, createStaticBinding } from './src/main/ets/components/StaBuilderByCallback';
// [End DynInteropStaBuilderIndexByCallback]

// [Start DynInteropStaBuilderIndexByRef]
// static_module/Index.ets
export { personInfo } from './src/main/ets/components/StaBuilderByRef'; // 导出ArkTS-Sta @Builder函数
// [End DynInteropStaBuilderIndexByRef]

// [Start DynInteropStaBuilderIndexByValue]
// static_module/Index.ets
export { showTextBuilder } from './src/main/ets/components/StaBuilderByValue';
// [End DynInteropStaBuilderIndexByValue]

// [Start DynInteropStaWrappedBuilderIndexByRef]
// static_module/Index.ets
export { globalBuilder } from './src/main/ets/components/StaWrappedBuilderByRef'; // 导出WrappedBuilder对象
// [End DynInteropStaWrappedBuilderIndexByRef]

// [Start DynInteropStaWrappedBuilderIndexByValue]
// static_module/Index.ets
export { globalBuilderByValue } from './src/main/ets/components/StaWrappedBuilderByValue'; // 导出WrappedBuilder对象
// [End DynInteropStaWrappedBuilderIndexByValue]

// [Start DynInteropStaBuilderParamIndexByRef]
// static_module/Index.ets
export { IPerson, Child } from './src/main/ets/components/StaBuilderParamByRef'; // 导出ArkTS-Sta侧的对象字面量interface和自定义组件
// [End DynInteropStaBuilderParamIndexByRef]

// [Start DynInteropStaBuilderParamIndexByValue]
// static_module/Index.ets
export { ChildByValue } from './src/main/ets/components/StaBuilderParamByValue';
// [End DynInteropStaBuilderParamIndexByValue]

// [Start DynInteropStaDeclSpecIndex]
// static_module/Index.ets
export { DeclChild, DeclPerson } from './src/main/ets/components/StaDeclarationSpec';
// [End DynInteropStaDeclSpecIndex]

// [Start DynInteropStaDeclSpecV2Index]
// static_module/Index.ets
export { ChildV2 } from './src/main/ets/components/StaDeclarationSpecV2';
// [End DynInteropStaDeclSpecV2Index]

// [Start DynInteropStaDeclSpecBuilderIndex]
// static_module/Index.ets
export { StaChild, staticBuilder, staticWrappedBuilder } from './src/main/ets/components/StaDeclarationSpecBuilder';
// [End DynInteropStaDeclSpecBuilderIndex]

// [Start DynInteropStaESArrayIndex]
// static_module/Index.ets
export { ESArrayChild } from './src/main/ets/components/StaESArray';
// [End DynInteropStaESArrayIndex]

// [Start DynInteropStaSTArrayIndex]
// static_module/Index.ets
export { STArrayChild } from './src/main/ets/components/StaSTArray';
// [End DynInteropStaSTArrayIndex]

// [Start DynInteropStaESMapIndex]
// static_module/Index.ets
export { ESMapChild } from './src/main/ets/components/StaESMap';
// [End DynInteropStaESMapIndex]

// [Start DynInteropStaSTMapIndex]
// static_module/Index.ets
export { STMapChild } from './src/main/ets/components/StaSTMap';
// [End DynInteropStaSTMapIndex]

// [Start DynInteropStaESSetIndex]
// static_module/Index.ets
export { ESSetChild } from './src/main/ets/components/StaESSet';
// [End DynInteropStaESSetIndex]

// [Start DynInteropStaSTSetIndex]
// static_module/Index.ets
export { STSetChild } from './src/main/ets/components/StaSTSet';
// [End DynInteropStaSTSetIndex]
