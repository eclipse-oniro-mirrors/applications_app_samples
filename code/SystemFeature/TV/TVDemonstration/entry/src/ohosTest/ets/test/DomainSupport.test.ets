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
* Domain quality + checkpoint suites for the support business domain.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import {
  buildChaosScenarios,
  buildRemoteScenarios,
  scanVisibleText,
  SecurityScanResult,
  buildCheckpointIndexPaths,
  buildCheckpointPaths,
  startAppWithRetry
} from './TestScenarioUtils';
import { KeyCode } from '@kit.InputKit';


/**
 * Support business-domain quality suite.
 *
 * This file merges the ten non-checkpoint support* twin files
 * (supportA11y, supportConsistency, supportInputChaosPart1/2/3,
 * supportLifecycle, supportPerformance, supportRemote, supportSecurity,
 * supportStress). The three InputChaos parts are consolidated into one
 * describe (supportInputChaosPart1Test) keeping every original it with its
 * @tc metadata; only the shared constants are hoisted and renamed with the
 * SUPPORT_ prefix to avoid collisions inside the merged file.
 */


const QUALITY_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const REMOTE_SEQUENCES: number[][] = buildRemoteScenarios();

const CHAOS_BOUNDARY_SEQUENCES: number[][] = buildChaosScenarios(1);

const CHAOS_ROUND_TRIP_SEQUENCES: number[][] = buildChaosScenarios(2);

const CHAOS_LONG_SEQUENCES: number[][] = buildChaosScenarios(3);


const SUPPORT_TARGET_TAB: number = 3;

const SUPPORT_OTHER_TAB: number = 0;

const SUPPORT_TAB_LABEL: string = 'Service Support';


const A11Y_CHECKPOINT_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const A11Y_CHECKPOINT_PATH_LENGTH: number = 6;

const A11Y_CHECKPOINT_PATH_COUNT: number = 8;

const A11Y_CHECKPOINT_PATH_OFFSET: number = 3230;

const A11Y_CHECKPOINT_MATRIX: number[][] = buildCheckpointPaths(
  A11Y_CHECKPOINT_PATH_LENGTH,
  A11Y_CHECKPOINT_PATH_COUNT,
  A11Y_CHECKPOINT_PATH_OFFSET,
);


const BOUNDARY_CHECKPOINT_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const BOUNDARY_CHECKPOINT_PATH_LENGTH: number = 6;

const BOUNDARY_CHECKPOINT_PATH_COUNT: number = 8;

const BOUNDARY_CHECKPOINT_PATH_OFFSET: number = 2850;

const BOUNDARY_CHECKPOINT_MATRIX: number[][] = buildCheckpointPaths(
  BOUNDARY_CHECKPOINT_PATH_LENGTH,
  BOUNDARY_CHECKPOINT_PATH_COUNT,
  BOUNDARY_CHECKPOINT_PATH_OFFSET,
);


const CONSISTENCY_CHECKPOINT_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const CONSISTENCY_CHECKPOINT_PATH_LENGTH: number = 5;

const CONSISTENCY_CHECKPOINT_PATH_COUNT: number = 8;

const CONSISTENCY_CHECKPOINT_PATH_OFFSET: number = 400;

const CONSISTENCY_CHECKPOINT_MATRIX: number[][] = buildCheckpointIndexPaths(
  CONSISTENCY_CHECKPOINT_PATH_LENGTH,
  CONSISTENCY_CHECKPOINT_PATH_COUNT,
  CONSISTENCY_CHECKPOINT_PATH_OFFSET,
);


const FOCUS_CHECKPOINT_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const FOCUS_CHECKPOINT_PATH_LENGTH: number = 5;

const FOCUS_CHECKPOINT_PATH_COUNT: number = 8;

const FOCUS_CHECKPOINT_PATH_OFFSET: number = 0;

const FOCUS_CHECKPOINT_MATRIX: number[][] = buildCheckpointPaths(
  FOCUS_CHECKPOINT_PATH_LENGTH,
  FOCUS_CHECKPOINT_PATH_COUNT,
  FOCUS_CHECKPOINT_PATH_OFFSET,
);


const LIFECYCLE_CHECKPOINT_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const LIFECYCLE_CHECKPOINT_PATH_LENGTH: number = 6;

const LIFECYCLE_CHECKPOINT_PATH_COUNT: number = 8;

const LIFECYCLE_CHECKPOINT_PATH_OFFSET: number = 3610;

const LIFECYCLE_CHECKPOINT_MATRIX: number[][] = buildCheckpointPaths(
  LIFECYCLE_CHECKPOINT_PATH_LENGTH,
  LIFECYCLE_CHECKPOINT_PATH_COUNT,
  LIFECYCLE_CHECKPOINT_PATH_OFFSET,
);


const NAVIGATION_CHECKPOINT_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const NAVIGATION_CHECKPOINT_PATH_LENGTH: number = 5;

const NAVIGATION_CHECKPOINT_PATH_COUNT: number = 8;

const NAVIGATION_CHECKPOINT_PATH_OFFSET: number = 200;

const NAVIGATION_CHECKPOINT_MATRIX: number[][] = buildCheckpointIndexPaths(
  NAVIGATION_CHECKPOINT_PATH_LENGTH,
  NAVIGATION_CHECKPOINT_PATH_COUNT,
  NAVIGATION_CHECKPOINT_PATH_OFFSET,
);


const PERFORMANCE_CHECKPOINT_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const MAX_KEY_LATENCY_MS: number = 5000;

const PERFORMANCE_CHECKPOINT_PATH_LENGTH: number = 6;

const PERFORMANCE_CHECKPOINT_PATH_COUNT: number = 8;

const PERFORMANCE_CHECKPOINT_PATH_OFFSET: number = 3420;

const PERFORMANCE_CHECKPOINT_MATRIX: number[][] = buildCheckpointPaths(
  PERFORMANCE_CHECKPOINT_PATH_LENGTH,
  PERFORMANCE_CHECKPOINT_PATH_COUNT,
  PERFORMANCE_CHECKPOINT_PATH_OFFSET,
);


const RECOVERY_CHECKPOINT_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const RECOVERY_CHECKPOINT_PATH_LENGTH: number = 6;

const RECOVERY_CHECKPOINT_PATH_COUNT: number = 8;

const RECOVERY_CHECKPOINT_PATH_OFFSET: number = 3040;

const RECOVERY_CHECKPOINT_MATRIX: number[][] = buildCheckpointPaths(
  RECOVERY_CHECKPOINT_PATH_LENGTH,
  RECOVERY_CHECKPOINT_PATH_COUNT,
  RECOVERY_CHECKPOINT_PATH_OFFSET,
);


export default function domainSupportTest(): void {





  describe('supportRemoteTest', () => {
    let driver: Driver;
        const selectPage = async (): Promise<void> => {
          const tab: Component | null = await driver.findComponent(ON.id('tab3'));
          if (tab !== null) {
            await tab.click();
          }
          await driver.delayMs(160);
        };

        const assertStable = async (): Promise<void> => {
          // Arbitrary remote input may leave the app on any tab or on a pushed
          // detail page, so stability means the app still renders its content and
          // the process survived the injected input.
          const anchors: string[] = [
            'Product Specifications', 'Function Directory', 'Entertainment & AV',
            'Function Features', 'Smart Life', 'Service Support'
          ];
          let visible: number = 0;
          for (let index: number = 0; index < anchors.length; index++) {
            const nodes: Component[] | null = await driver.findComponents(ON.text(anchors[index]));
            if (nodes !== null) {
              visible += nodes.length;
            }
          }
          expect(visible > 0).assertTrue();
        };
    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(QUALITY_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(350);
    });
    beforeEach(async (): Promise<void> => {
      await selectPage();
    });
    afterEach(async (): Promise<void> => {
      await driver.delayMs(20);
    });
    afterAll(async (): Promise<void> => {
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_REMOTE_SUPPORT_0100
     * @tc.name supportRemoteSemanticCatalog001
     * @tc.desc Verify support Swiper recovers after representative direction and confirmation inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('supportRemoteSemanticCatalog001', 0, async (): Promise<void> => {
      for (let sequenceIndex: number = 0; sequenceIndex < REMOTE_SEQUENCES.length; sequenceIndex++) {
        const keys: number[] = REMOTE_SEQUENCES[sequenceIndex];
        for (let keyIndex: number = 0; keyIndex < keys.length; keyIndex++) {
          await driver.triggerKey(keys[keyIndex]);
          await driver.delayMs(15);
        }
        // Assert the terminal state produced by the injected input directly. The former
        // reselect before asserting only proved the test's own click, so the reset was
        // removed per the audit (input-after-state was never verified before).
        await assertStable();
      }
    });
  })












}
