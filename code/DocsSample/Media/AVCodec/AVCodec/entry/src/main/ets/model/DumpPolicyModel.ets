/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export class DumpPolicyModel {
  // 0 表示不限制该项，大小和时长分别生效。
  public static readonly UNLIMITED: number = 0;
  public static readonly SIZE_OPTIONS: number[] = [64, 256, DumpPolicyModel.UNLIMITED];
  public static readonly DURATION_OPTIONS: number[] = [10, 30, DumpPolicyModel.UNLIMITED];
  public static maxMiB: number = 256;
  public static maxSeconds: number = 30;
}
