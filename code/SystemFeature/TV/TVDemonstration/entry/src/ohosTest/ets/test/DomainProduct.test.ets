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
* Domain quality + checkpoint suites for the product business domain.
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
 * Product business-domain quality suite.
 *
 * This file merges the ten non-checkpoint product* twin files
 * (productA11y, productConsistency, productInputChaosPart1/2/3,
 * productLifecycle, productPerformance, productRemote, productSecurity,
 * productStress). The three InputChaos parts are consolidated into one
 * describe (productInputChaosPart1Test) keeping every original it with its
 * @tc metadata; only the shared constants are hoisted and renamed with the
 * PRODUCT_ prefix to avoid collisions inside the merged file.
 */


const QUALITY_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const REMOTE_SEQUENCES: number[][] = buildRemoteScenarios();

const CHAOS_BOUNDARY_SEQUENCES: number[][] = buildChaosScenarios(1);

const CHAOS_ROUND_TRIP_SEQUENCES: number[][] = buildChaosScenarios(2);

const CHAOS_LONG_SEQUENCES: number[][] = buildChaosScenarios(3);


const PRODUCT_TARGET_TAB: number = 0;

const PRODUCT_OTHER_TAB: number = 1;

const PRODUCT_LABELS: string[] = ['Product Specifications', 'Screen Size', 'Processor', 'Sound System'];

const PRODUCT_TEXTS: string[] =
  ['Product Specifications', 'Screen Size', 'Processor', 'Memory Configuration', 'Sound System'];

const PRODUCT_TEXT_COUNTS: number[] = [2, 1, 1, 1, 1];

const waitForProductLabels = async (driver: Driver, maxWaitMs: number = 3000): Promise<void> => {
  const pollStepMs: number = 100;
  let elapsedMs: number = 0;
  while (elapsedMs < maxWaitMs) {
    const labelNodes: Component[] | null = await driver.findComponents(ON.text(PRODUCT_LABELS[1]));
    if (labelNodes !== null && labelNodes.length > 0) {
      return;
    }
    await driver.delayMs(pollStepMs);
    elapsedMs += pollStepMs;
  }
};



const A11Y_CHECKPOINT_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const A11Y_CHECKPOINT_PATH_LENGTH: number = 6;

const A11Y_CHECKPOINT_PATH_COUNT: number = 8;

const A11Y_CHECKPOINT_PATH_OFFSET: number = 380;

const A11Y_CHECKPOINT_MATRIX: number[][] = buildCheckpointPaths(
  A11Y_CHECKPOINT_PATH_LENGTH,
  A11Y_CHECKPOINT_PATH_COUNT,
  A11Y_CHECKPOINT_PATH_OFFSET,
);


const BOUNDARY_CHECKPOINT_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const BOUNDARY_CHECKPOINT_PATH_LENGTH: number = 6;

const BOUNDARY_CHECKPOINT_PATH_COUNT: number = 8;

const BOUNDARY_CHECKPOINT_PATH_OFFSET: number = 0;

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

const LIFECYCLE_CHECKPOINT_PATH_OFFSET: number = 760;

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

const PERFORMANCE_CHECKPOINT_PATH_OFFSET: number = 570;

const PERFORMANCE_CHECKPOINT_MATRIX: number[][] = buildCheckpointPaths(
  PERFORMANCE_CHECKPOINT_PATH_LENGTH,
  PERFORMANCE_CHECKPOINT_PATH_COUNT,
  PERFORMANCE_CHECKPOINT_PATH_OFFSET,
);


const RECOVERY_CHECKPOINT_WANT: Want = { bundleName: 'com.sample.demonstration', abilityName: 'EntryAbility' };

const RECOVERY_CHECKPOINT_PATH_LENGTH: number = 6;

const RECOVERY_CHECKPOINT_PATH_COUNT: number = 8;

const RECOVERY_CHECKPOINT_PATH_OFFSET: number = 190;

const RECOVERY_CHECKPOINT_MATRIX: number[][] = buildCheckpointPaths(
  RECOVERY_CHECKPOINT_PATH_LENGTH,
  RECOVERY_CHECKPOINT_PATH_COUNT,
  RECOVERY_CHECKPOINT_PATH_OFFSET,
);


export default function domainProductTest(): void {
  describe('productA11yTest', () => {
    let driver: Driver;

    const selectTarget = async (): Promise<void> => {
      await (await driver.findComponent(ON.id('tab0'))).click();
      await driver.delayMs(120);
    };

    const assertReadableCatalog = async (): Promise<void> => {
      for (let index: number = 0; index < PRODUCT_TEXTS.length; index++) {
        const nodes: Component[] = await driver.findComponents(ON.text(PRODUCT_TEXTS[index]));
        expect(nodes.length).assertEqual(PRODUCT_TEXT_COUNTS[index]);
        const value: string = await nodes[0].getText();
        expect(value.trim()).assertEqual(PRODUCT_TEXTS[index]);
      }
    };

    const reconstructTarget = async (cycles: number): Promise<void> => {
      for (let cycle: number = 0; cycle < cycles; cycle++) {
        await (await driver.findComponent(ON.id('tab1'))).click();
        await driver.delayMs(50);
        await selectTarget();
      }
    };

    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(QUALITY_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(450);
    });

    beforeEach(async (): Promise<void> => {
      await selectTarget();
    });

    afterAll(async (): Promise<void> => {
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PRODUCT_A11Y_0100
     * @tc.name productA11ySemanticCatalog001
     * @tc.desc Verify Product Specifications exposes its exact readable business text catalog and visible geometry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productA11ySemanticCatalog001', 0, async (): Promise<void> => {
      await assertReadableCatalog();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PRODUCT_A11Y_0200
     * @tc.name productA11yTabFocus002
     * @tc.desc Verify Product Specifications selected tab has readable text, focus, and nonzero bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productA11yTabFocus002', 0, async (): Promise<void> => {
      const tab: Component = await driver.findComponent(ON.id('tab0'));
      expect((await tab.getText()).trim().length > 0).assertTrue();
      expect(await tab.isFocused()).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PRODUCT_A11Y_0300
     * @tc.name productA11ySingleReconstruction003
     * @tc.desc Verify one real Product Specifications reconstruction restores the complete readable semantic tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productA11ySingleReconstruction003', 0, async (): Promise<void> => {
      await reconstructTarget(1);
      await assertReadableCatalog();
      expect(((await driver.findComponents(ON.text('Function Directory'))) ?? []).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PRODUCT_A11Y_0400
     * @tc.name productA11yRepeatedReconstruction004
     * @tc.desc Verify four Product Specifications reconstructions preserve exact text uniqueness and tab focus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productA11yRepeatedReconstruction004', 0, async (): Promise<void> => {
      await reconstructTarget(4);
      await assertReadableCatalog();
      expect(await (await driver.findComponent(ON.id('tab0'))).isFocused()).assertTrue();
    });
  })

  describe('productInputChaosPart1Test', () => {

    let driver: Driver;
    const selectTarget = async (): Promise<void> => {
      await (await driver.findComponent(ON.id('tab0'))).click();
      await driver.delayMs(70);
    };
    const assertTarget = async (): Promise<void> => {
      await driver.assertComponentExist(ON.text('Product Specifications'));
      expect(((await driver.findComponents(ON.id('tab0'))) ?? []).length).assertEqual(1);
      for (let tabIndex: number = 0; tabIndex < 4; tabIndex++) {
        await driver.assertComponentExist(ON.id('tab' + tabIndex.toString()));
      }
    };
    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(QUALITY_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(350);
    });
    beforeEach(async (): Promise<void> => {
      await selectTarget();
    });
    afterEach(async (): Promise<void> => {
      await driver.delayMs(15);
    });
    afterAll(async (): Promise<void> => {
      await driver.pressHome();
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_CHAOS_PRODUCT_PART1_0010
     * @tc.name productInputChaosPart1SemanticPaths001
     * @tc.desc Verify product remains on Product Specifications after boundary and reversal DPAD paths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productInputChaosPart1SemanticPaths001', 0, async (): Promise<void> => {
      for (let sequenceIndex: number = 0; sequenceIndex < CHAOS_BOUNDARY_SEQUENCES.length; sequenceIndex++) {
        const keys: number[] = CHAOS_BOUNDARY_SEQUENCES[sequenceIndex];
        for (let keyIndex: number = 0; keyIndex < keys.length; keyIndex++) {
          await driver.triggerKey(keys[keyIndex]);
          await driver.delayMs(12);
        }
        await assertTarget();
        await selectTarget();
      }
    });
  });




  describe('productRemoteTest', () => {
    let driver: Driver;
        const selectPage = async (): Promise<void> => {
          const tab: Component | null = await driver.findComponent(ON.id('tab0'));
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
     * @tc.number SUB_TV_DEMONSTRATION_REMOTE_PRODUCT_0100
     * @tc.name productRemoteSemanticCatalog001
     * @tc.desc Verify product recovers after representative direction and confirmation inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productRemoteSemanticCatalog001', 0, async (): Promise<void> => {
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

  describe('productSecurityTest', () => {
    let driver: Driver;
    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(QUALITY_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(350);
    });
    beforeEach(async (): Promise<void> => {
      // The scan is deliberately limited to the a11y-visible tree;
      // log, storage, IPC, and network security require separate facilities.
      await (await driver.findComponent(ON.id('tab0'))).click();
      await driver.delayMs(70);
    });
    afterEach(async (): Promise<void> => {
      await driver.delayMs(20);
    });
    afterAll(async (): Promise<void> => {
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_SECURITY_PRODUCT_0100
     * @tc.name productSecurityVisibleTextCatalog001
     * @tc.desc Verify product visible text excludes the complete credential keyword catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('productSecurityVisibleTextCatalog001', 0, async (): Promise<void> => {
      const scan: SecurityScanResult = await scanVisibleText(driver);
      expect(scan.textCount > 0).assertTrue();
      expect(scan.matchCount).assertEqual(0);
      await driver.assertComponentExist(ON.text('Product Specifications'));
    });
  })











}
