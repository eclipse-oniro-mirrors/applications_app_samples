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

import { Resource, UIContext } from '@kit.ArkUI';
import { Context } from '@kit.AbilityKit';

export class P2PManager {
  private uiContext: UIContext | null = null;

  public init(uiContext: UIContext): void {
    this.uiContext = uiContext;
  }

  public resourceToString(resource: Resource): string {
    if (!this.uiContext) {
      throw new Error('P2PManager not initialized. Call init() first.');
    }
    const hostContext: Context | undefined = this.uiContext!.getHostContext() as Context;
    if (!hostContext) {
      throw new Error('HostContext is not available.');
    }
    return hostContext.resourceManager.getStringSync(resource.id);
  }
}

// 默认导出let
let p2pManager: P2PManager = new P2PManager();

export default p2pManager;
