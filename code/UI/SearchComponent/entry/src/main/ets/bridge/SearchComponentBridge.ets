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

// Re-export bridge: ohosTest cannot import files of the searchcomponent HAR directly, so its data model and data
// are re-exported from the entry module.
export { SceneModuleInfo } from 'searchcomponent/src/main/ets/components/model/SceneModuleInfo';

export { waterFlowData } from 'searchcomponent/src/main/ets/components/data/WaterFlowData';
