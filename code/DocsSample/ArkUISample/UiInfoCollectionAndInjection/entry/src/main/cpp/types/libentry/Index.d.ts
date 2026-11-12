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
import type { UIContext } from '@kit.ArkUI';

export interface TreeOptions {
  visibleOnly: boolean;
  filterLayout: boolean;
  interaction: boolean;
  accessibility: boolean;
  visual: boolean;
  functional: boolean;
}

export interface CommandResult {
  result: number;
}

// [Start ui_command_bridge_type]
export const injectCommand: (context: UIContext, nodeId: number, command: string) => Promise<CommandResult>;
// [End ui_command_bridge_type]

export const collectTree: (context: UIContext, options: TreeOptions) => string;

export const collectTreeAsync: (context: UIContext, options: TreeOptions) => Promise<string>;
