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

import { AbilityStage } from '@kit.AbilityKit';
import { beginLaunchEvidence } from '../core/LaunchEvidence';

export default class EntryStage extends AbilityStage {
  onCreate(): void {
    beginLaunchEvidence('AbilityStage.onCreate');
  }

  onLaunchFromHyperSnap(): void {
    // The system invokes this callback only when the process launches from HyperSnap.
    // Generate a new ID here: an ID captured in a snapshot is not a new launch.
    beginLaunchEvidence('AbilityStage.onLaunchFromHyperSnap');
  }
}
