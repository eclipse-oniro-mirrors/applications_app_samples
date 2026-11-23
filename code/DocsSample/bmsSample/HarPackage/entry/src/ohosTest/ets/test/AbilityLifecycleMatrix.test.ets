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

import { describe, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager, common, UIAbility } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Component, Driver, ON, Rect } from '@kit.TestKit';
import { display, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  BUNDLE_NAME,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  homeWant,
  launchHome,
  stopHome,
  topAbility
} from './shared/HarProbe';
import { paceTurn, sleepMs } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const EVENT_WAIT_MS: number = 4000;
const POLL_MS: number = 100;
const SETTLE_MS: number = 700;
const DRIVER_WAIT_MS: number = 5000;
const CLICK_SETTLE_MS: number = 500;

const EVENT_CREATE: string = 'create';
const EVENT_WINDOW_STAGE_CREATE: string = 'windowStageCreate';
const EVENT_FOREGROUND: string = 'foreground';
const EVENT_BACKGROUND: string = 'background';
const EVENT_WINDOW_STAGE_DESTROY: string = 'windowStageDestroy';
const EVENT_DESTROY: string = 'destroy';

const RANK_CREATE: number = 10;
const RANK_WINDOW_STAGE_CREATE: number = 20;
const RANK_FOREGROUND: number = 30;
const RANK_BACKGROUND: number = 40;
const RANK_WINDOW_STAGE_DESTROY: number = 50;
const RANK_DESTROY: number = 60;
const RANK_UNKNOWN: number = -1;

function delegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

function rankOf(event: string): number {
  if (event === EVENT_CREATE) {
    return RANK_CREATE;
  }
  if (event === EVENT_WINDOW_STAGE_CREATE) {
    return RANK_WINDOW_STAGE_CREATE;
  }
  if (event === EVENT_FOREGROUND) {
    return RANK_FOREGROUND;
  }
  if (event === EVENT_BACKGROUND) {
    return RANK_BACKGROUND;
  }
  if (event === EVENT_WINDOW_STAGE_DESTROY) {
    return RANK_WINDOW_STAGE_DESTROY;
  }
  if (event === EVENT_DESTROY) {
    return RANK_DESTROY;
  }
  return RANK_UNKNOWN;
}

function ranksAscending(events: string[]): boolean {
  for (let index: number = 1; index < events.length; index++) {
    if (rankOf(events[index]) < rankOf(events[index - 1])) {
      return false;
    }
  }
  return events.length > 0;
}

function occurrencesOf(events: string[], name: string): number {
  let total: number = 0;
  for (let index: number = 0; index < events.length; index++) {
    if (events[index] === name) {
      total++;
    }
  }
  return total;
}

function allKnown(events: string[]): boolean {
  return events.every((event: string) => rankOf(event) !== RANK_UNKNOWN);
}

class LifecycleTap {
  events: string[] = [];
  instance: UIAbility | undefined = undefined;
  stage: window.WindowStage | undefined = undefined;
  readonly monitor: abilityDelegatorRegistry.AbilityMonitor;

  constructor() {
    this.monitor = {
      abilityName: ENTRY_ABILITY,
      moduleName: ENTRY_MODULE,
      onAbilityCreate: (ability: UIAbility) => {
        this.instance = ability;
        this.events.push(EVENT_CREATE);
      },
      onWindowStageCreate: (ability: UIAbility) => {
        this.stage = ability.context.windowStage;
        this.events.push(EVENT_WINDOW_STAGE_CREATE);
      },
      onAbilityForeground: () => {
        this.events.push(EVENT_FOREGROUND);
      },
      onAbilityBackground: () => {
        this.events.push(EVENT_BACKGROUND);
      },
      onWindowStageDestroy: () => {
        this.events.push(EVENT_WINDOW_STAGE_DESTROY);
      },
      onAbilityDestroy: () => {
        this.events.push(EVENT_DESTROY);
      }
    };
  }

  start(): void {
    delegator().addAbilityMonitorSync(this.monitor);
  }

  stop(): void {
    delegator().removeAbilityMonitorSync(this.monitor);
  }
}

async function waitFor(predicate: () => boolean, timeoutMs: number): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (predicate()) {
      return true;
    }
    await sleepMs(POLL_MS);
  }
  return predicate();
}

async function launch(tap: LifecycleTap): Promise<UIAbility> {
  await stopHome();
  tap.start();
  try {
    await delegator().startAbility(homeWant());
  } catch (error) {
    await sleepMs(SETTLE_MS);
    await delegator().startAbility(homeWant());
  }
  const ability: UIAbility = await delegator().waitAbilityMonitor(tap.monitor, EVENT_WAIT_MS);
  await waitFor(() => tap.events.indexOf(EVENT_FOREGROUND) >= 0, EVENT_WAIT_MS);
  await sleepMs(SETTLE_MS);
  return ability;
}

async function terminate(ability: UIAbility, tap: LifecycleTap): Promise<void> {
  await ability.context.terminateSelf();
  await waitFor(() => tap.events.indexOf(EVENT_DESTROY) >= 0, EVENT_WAIT_MS);
  await sleepMs(SETTLE_MS);
}

function resources(): common.Context {
  return delegator().getAppContext().createModuleContext(ENTRY_MODULE);
}

export default function abilityLifecycleMatrixTest() {
  describe('AbilityLifecycleMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      await stopHome();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_LIFECYCLE_0001
     * @tc.name      testAbilityLifecycle0001
     * @tc.desc      Cold start emits create first
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0001', 'lifecycle case 1');
      expect(tap.events[0]).assertEqual(EVENT_CREATE);
      tap.stop();
      {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0002', 'lifecycle case 2');
      expect(tap.events.indexOf(EVENT_WINDOW_STAGE_CREATE) > tap.events.indexOf(EVENT_CREATE)).assertTrue();
      tap.stop();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_LIFECYCLE_0003
     * @tc.name      testAbilityLifecycle0003
     * @tc.desc      Cold start reaches foreground after the window stage
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0003', 'lifecycle case 3');
      expect(tap.events.indexOf(EVENT_FOREGROUND) > tap.events.indexOf(EVENT_WINDOW_STAGE_CREATE)).assertTrue();
      tap.stop();
      {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0004', 'lifecycle case 4');
      expect(occurrencesOf(tap.events, EVENT_CREATE)).assertEqual(1);
      tap.stop();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_LIFECYCLE_0005
     * @tc.name      testAbilityLifecycle0005
     * @tc.desc      Cold start creates exactly one window stage
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0005', 'lifecycle case 5');
      expect(occurrencesOf(tap.events, EVENT_WINDOW_STAGE_CREATE)).assertEqual(1);
      tap.stop();
      {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0006', 'lifecycle case 6');
      expect(occurrencesOf(tap.events, EVENT_FOREGROUND)).assertEqual(1);
      tap.stop();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_LIFECYCLE_0007
     * @tc.name      testAbilityLifecycle0007
     * @tc.desc      Cold start does not destroy the ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0007', 'lifecycle case 7');
      expect(occurrencesOf(tap.events, EVENT_DESTROY)).assertEqual(0);
      tap.stop();
      {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0008', 'lifecycle case 8');
      expect(tap.instance !== undefined).assertTrue();
      tap.stop();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_LIFECYCLE_0009
     * @tc.name      testAbilityLifecycle0009
     * @tc.desc      Monitor exposes the window stage
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0009', 'lifecycle case 9');
      expect(tap.stage !== undefined).assertTrue();
      tap.stop();
      {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0010', 'lifecycle case 10');
      expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      tap.stop();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_LIFECYCLE_0011
     * @tc.name      testAbilityLifecycle0011
     * @tc.desc      Created ability belongs to the entry module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0011', 'lifecycle case 11');
      expect(ability.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
      tap.stop();
      {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0012', 'lifecycle case 12');
      expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
      tap.stop();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_LIFECYCLE_0013
     * @tc.name      testAbilityLifecycle0013
     * @tc.desc      Ability reaches the foreground state
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0013', 'lifecycle case 13');
      const state: abilityDelegatorRegistry.AbilityLifecycleState = delegator().getAbilityState(ability);
      expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
      tap.stop();
      {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0014', 'lifecycle case 14');
      expect(ranksAscending(tap.events)).assertTrue();
      tap.stop();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_LIFECYCLE_0015
     * @tc.name      testAbilityLifecycle0015
     * @tc.desc      Lifecycle events are all known callbacks
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0015', 'lifecycle case 15');
      expect(allKnown(tap.events)).assertTrue();
      tap.stop();
      {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0016', 'lifecycle case 16');
      expect(tap.events.length >= 3).assertTrue();
      tap.stop();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_LIFECYCLE_0017
     * @tc.name      testAbilityLifecycle0017
     * @tc.desc      Ability context exposes a files directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0017', 'lifecycle case 17');
      expect(ability.context.filesDir.length > 0).assertTrue();
      tap.stop();
      {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0018', 'lifecycle case 18');
      expect(ability.context.resourceManager.getStringByNameSync('app_name')).assertEqual('simple013_har_package');
      tap.stop();
      }
    })



    /**
     * @tc.number    SUB_HARPACKAGE_LIFECYCLE_0023
     * @tc.name      testAbilityLifecycle0023
     * @tc.desc      Terminate keeps the earlier cold start callbacks
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0023', 'lifecycle case 23');
      expect(occurrencesOf(tap.events, EVENT_CREATE)).assertEqual(1);
      await terminate(ability, tap);
      tap.stop();
      {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0024', 'lifecycle case 24');
      expect(allKnown(tap.events)).assertTrue();
      await terminate(ability, tap);
      tap.stop();
      }
    })


    /**
     * @tc.number    SUB_HARPACKAGE_LIFECYCLE_0039
     * @tc.name      testAbilityLifecycle0039
     * @tc.desc      Ability context stays usable after foreground
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0039', 'lifecycle case 39');
      expect(ability.context.applicationInfo.uid > 0).assertTrue();
      await terminate(ability, tap);
      tap.stop();
      {
      const tap: LifecycleTap = new LifecycleTap();
      let ability: UIAbility = await launch(tap);
      logCase('testAbilityLifecycle0040', 'lifecycle case 40');
      expect(tap.stage !== undefined).assertTrue();
      await terminate(ability, tap);
      tap.stop();
      }
    });

  });
}
