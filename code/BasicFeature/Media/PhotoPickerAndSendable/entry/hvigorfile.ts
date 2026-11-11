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

// Entry module build script: brings in the official Hvigor task set for an HAP module.
import { hapTasks } from '@ohos/hvigor-ohos-plugin';

// Hvigor reads the default export to know which task graph this HAP contributes to.
export default {
  // Built-in HAP tasks supplied by the plugin; they own the compile, pack and sign steps.
  system: hapTasks, /* Built-in plugin of Hvigor. It cannot be modified. */
  // Custom plugins are empty on purpose so the sample build stays reproducible.
  plugins: []       /* Custom plugin to extend the functionality of Hvigor. */
}
