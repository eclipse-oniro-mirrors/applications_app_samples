/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { rpc } from '@kit.IPCKit';

// IDL工具生成的interface类型import示例占位文件
// 实际项目中对应其他IDL文件生成的接口定义
export default interface IIdlTestObserver {
  // 示例：观察者接口方法声明
  onTestResult(data: number): void;
}
