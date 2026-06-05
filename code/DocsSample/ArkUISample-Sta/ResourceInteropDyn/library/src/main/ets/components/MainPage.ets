'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start create_resource]
// library/src/main/ets/components/MainPage.ets
import { $r } from '@ohos.arkui.component';
import transfer from '@ohos.transfer';

export function createResource(): Any {
  // $r("app.string.EFG")需替换为开发者所需要的资源
  let res = $r("app.string.EFG");
  let res2 = transfer.transferDynamic(res, 'Global.Resource');
  return res2;
}
// [End create_resource]
