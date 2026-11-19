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

import { describe, it } from '@ohos/hypium';
import {
  buildFoundationAssetNames,
  buildFoundationDurations,
  FoundationRollingChecksum,
  FoundationScenarioCounter
} from '../foundation/FoundationAdvancedFixtures';
import {
  assertAtLeast,
  assertContains,
  assertNotContains,
  assertNumberEqual,
  assertTrue
} from '../foundation/TestAsserts';
import { FocusTraversalTreeHarness } from './FocusLayoutHarness';

export default function focusTextReadabilityTest(): void {
  describe('FocusTextReadabilityTest', () => {
    it('FocusTraversalText_TimerAndHintRemainReadable_001', 0, () => {
      const harness = new FocusTraversalTreeHarness();
      harness.addNode('root', 'page', '录屏提示');
      harness.addNode('timer', 'text', '00:10', 'root');
      harness.addNode('hint', 'text', '录屏视频已存储到“照片”', 'root');
      const text = harness.flattenReadableText();
      assertContains(text, '00:10');
      assertContains(text, '录屏视频已存储到“照片”');
    });

    it('FocusTraversalText_BlankTextIsNotCountedAsReadable_002', 0, () => {
      const harness = new FocusTraversalTreeHarness();
      harness.addNode('root', 'page', '录屏');
      harness.addNode('blank', 'text', '   ', 'root');
      assertNumberEqual(harness.getReadableCount(), 1);
      assertNotContains(harness.flattenReadableText(), '   ');
    });

    it('FocusTraversalText_DurationSamplesBuildDistinctReadableVariants_003', 0, () => {
      const harness = new FocusTraversalTreeHarness();
      const durations = buildFoundationDurations();
      const counter = new FoundationScenarioCounter();
      harness.addNode('root', 'page', '录屏');
      for (let index = 0; index < durations.length; index++) {
        const text = `耗时_${durations[index]}`;
        harness.addNode(`duration_${index}`, 'text', text, 'root');
        counter.record(text);
      }
      assertNumberEqual(counter.getDistinctCount(), durations.length);
      assertAtLeast(harness.flattenReadableText().length, durations.length * 4);
    });

    it('FocusTraversalText_AssetNamesReplayProducesStableFingerprint_004', 0, () => {
      const names = buildFoundationAssetNames('spoken', 22);
      const checksumA = new FoundationRollingChecksum();
      const checksumB = new FoundationRollingChecksum();
      for (let pass = 0; pass < 2; pass++) {
        const harness = new FocusTraversalTreeHarness();
        harness.addNode('root', 'page', '录屏');
        for (let index = 0; index < names.length; index++) {
          harness.addNode(`spoken_${index}`, 'text', names[index], 'root');
        }
        if (pass === 0) {
          checksumA.appendText(harness.flattenReadableText());
        } else {
          checksumB.appendText(harness.flattenReadableText());
        }
      }
      assertNumberEqual(checksumA.getValue(), checksumB.getValue());
    });

    it('FocusTraversalText_LongReadTrailMaintainsHighReadableVolume_005', 0, () => {
      const harness = new FocusTraversalTreeHarness();
      harness.addNode('root', 'page', '录屏主页');
      for (let round = 0; round < 90; round++) {
        harness.addNode(`msg_${round}`, 'text', `朗读文本_${round}`, 'root');
      }
      assertAtLeast(harness.getReadableCount(), 91);
      assertTrue(harness.flattenReadableText().indexOf('朗读文本_89') >= 0);
    });
  });
}
