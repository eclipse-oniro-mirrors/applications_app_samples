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
import { describe, it, expect } from '@ohos/hypium';
import { click, exists, text, waitText } from './SharedDriver';
import { openHistory, ownerState } from './HistoryDriver';

export default function ownerRebindingTests(): void {
  describe('OwnerRebindingTest', () => {
    it('OwnerRebinding_sameBuilderMethodsDispatchToSeparateComponentInstances', 0, async () => {
      await openHistory('owners');
      await click('owners-primary-label');
      await ownerState('owners-primary', 1, 0, 'Primary owner:label');
      await ownerState('owners-sibling', 0, 0, 'None');
      await click('owners-sibling-footer');
      await ownerState('owners-sibling', 0, 1, 'Sibling owner:footer');
      await ownerState('owners-primary', 1, 0, 'Primary owner:label');
      await click('owners-primary-footer');
      await click('owners-sibling-label');
      await ownerState('owners-primary', 1, 1, 'Primary owner:footer');
      await ownerState('owners-sibling', 1, 1, 'Sibling owner:label');
    });

    it('OwnerRebinding_existingCallbacksReadTheUpdatedOwnerProp', 0, async () => {
      await openHistory('owners');
      await click('owners-primary-label');
      await ownerState('owners-primary', 1, 0, 'Primary owner:label');
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      expect(await text('owners-primary-event')).assertEqual('Primary owner:label');
      await click('owners-primary-footer');
      await ownerState('owners-primary', 1, 1, 'Renamed owner:footer');
      await click('owners-primary-label');
      await ownerState('owners-primary', 2, 1, 'Renamed owner:label');
      expect(await text('owners-sibling-caption')).assertEqual('Sibling owner');
      await ownerState('owners-sibling', 0, 0, 'None');
    });

    it('OwnerRebinding_remountedOwnerStartsFreshWhileSiblingKeepsItsState', 0, async () => {
      await openHistory('owners');
      await click('owners-primary-label');
      await click('owners-sibling-footer');
      await ownerState('owners-primary', 1, 0, 'Primary owner:label');
      await ownerState('owners-sibling', 0, 1, 'Sibling owner:footer');
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      expect(await exists('owners-primary-container')).assertFalse();
      await click('owners-sibling-label');
      await ownerState('owners-sibling', 1, 1, 'Sibling owner:label');
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await ownerState('owners-primary', 0, 0, 'None');
      await click('owners-primary-footer');
      await ownerState('owners-primary', 0, 1, 'Primary owner:footer');
      await ownerState('owners-sibling', 1, 1, 'Sibling owner:label');
    });

    it('OwnerRebinding_hiddenOwnerReceivesCurrentPropsWhenRecreated', 0, async () => {
      await openHistory('owners');
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      expect(await exists('owners-primary-caption')).assertFalse();
      await click('owners-rename-primary');
      expect(await exists('owners-primary-container')).assertFalse();
      expect(await text('owners-sibling-caption')).assertEqual('Sibling owner');
      await click('owners-toggle-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      await ownerState('owners-primary', 0, 0, 'None');
      await click('owners-primary-label');
      await ownerState('owners-primary', 1, 0, 'Renamed owner:label');
      await ownerState('owners-sibling', 0, 0, 'None');
    });
  });
}
