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

import XComponentContext from '../../../main/ets/interface/XComponentContext';

// 只传递真实 Surface 的 onLoad 上下文，不模拟 native 实现。
export class NativeSoloistFixture {
  static normal: XComponentContext | undefined = undefined;
  static exclusive: XComponentContext | undefined = undefined;

  static async waitForContext(exclusive: boolean): Promise<XComponentContext> {
    for (let attempt: number = 0; attempt < 100; attempt++) {
      const context: XComponentContext | undefined =
        exclusive ? NativeSoloistFixture.exclusive : NativeSoloistFixture.normal;
      if (context !== undefined) {
        return context;
      }
      await new Promise<void>((resolve) => setTimeout(resolve, 50));
    }
    throw new Error('真实 XComponent Surface 未完成 onLoad');
  }
}
