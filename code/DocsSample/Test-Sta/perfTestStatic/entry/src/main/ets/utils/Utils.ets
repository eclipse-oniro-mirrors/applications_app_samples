'use static';
/**
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
// [Start utils_sta_sample]
export class Utils {
  static num: number = 0;
  static maxNum: number = 10000;

  public static calculateTest(): void {
    for (let index: number = 0; index < Utils.maxNum; index++) {
      Utils.num++;
    }
  }

  public static reset(): void {
    Utils.num = 0;
  }
}

// [End utils_sta_sample]