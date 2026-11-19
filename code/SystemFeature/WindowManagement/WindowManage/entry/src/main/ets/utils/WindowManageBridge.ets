/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

/**
 * @file entry/src/main/ets/utils/WindowManageBridge.ets
 * 文件职责：转导出 WindowComponent 模块的窗口常量、日志工具与 WindowManger，供 entry 模块及其测试引用。
 */

export {
  WindowEventId, WindowColor, WindowType
} from '../../../../../WindowComponent/src/main/ets/components/util/WindowConst';

export { default as HarLogger } from '../../../../../WindowComponent/src/main/ets/components/util/Logger';

export { default as WindowManger } from '../../../../../WindowComponent/src/main/ets/components/feature/WindowManger';
