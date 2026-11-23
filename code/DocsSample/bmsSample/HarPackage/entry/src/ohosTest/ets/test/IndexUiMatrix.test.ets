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
  tap.start();
  await delegator().startAbility(homeWant());
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

export default function indexUiMatrixTest() {
  describe('IndexUiMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      await stopHome();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_INDEXUI_0001
     * @tc.name      testIndexUi0001
     * @tc.desc      Home shows Hello World on first launch
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIndexUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await launchHome();
      logCase('testIndexUi0001', 'index ui case 1');
      expect(await shown(INITIAL_TEXT, DRIVER_WAIT_MS)).assertTrue();
      {
      await launchHome();
      logCase('testIndexUi0002', 'index ui case 2');
      expect(await shown(NATIVE_TEXT, 800)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INDEXUI_0003
     * @tc.name      testIndexUi0003
     * @tc.desc      Home hides the HAR func result before any click
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIndexUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await launchHome();
      logCase('testIndexUi0003', 'index ui case 3');
      expect(await shown(FUNC_TEXT, 800)).assertFalse();
      {
      await launchHome();
      logCase('testIndexUi0004', 'index ui case 4');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INDEXUI_0005
     * @tc.name      testIndexUi0005
     * @tc.desc      Native button exists
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIndexUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await launchHome();
      logCase('testIndexUi0005', 'index ui case 5');
      {
      await launchHome();
      logCase('testIndexUi0006', 'index ui case 6');
            }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INDEXUI_0013
     * @tc.name      testIndexUi0013
     * @tc.desc      Native button stays after it is clicked
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIndexUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await launchHome();
      logCase('testIndexUi0013', 'index ui case 13');
      await clickId('nativeAdd');
      {
      await launchHome();
      logCase('testIndexUi0014', 'index ui case 14');
      await clickId('button');
      await clickId('nativeAdd');
      expect(await shown(NATIVE_TEXT, DRIVER_WAIT_MS)).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INDEXUI_0015
     * @tc.name      testIndexUi0015
     * @tc.desc      Clicking native then function leaves the HAR func result
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIndexUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await launchHome();
      logCase('testIndexUi0015', 'index ui case 15');
      await clickId('nativeAdd');
      await clickId('button');
      expect(await shown(FUNC_TEXT, DRIVER_WAIT_MS)).assertTrue();
      {
      await launchHome();
      logCase('testIndexUi0016', 'index ui case 16');
      await clickId('button');
      await clickId('button');
      expect(await shown(FUNC_TEXT, DRIVER_WAIT_MS)).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INDEXUI_0017
     * @tc.name      testIndexUi0017
     * @tc.desc      Two native clicks keep the native result
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIndexUi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await launchHome();
      logCase('testIndexUi0017', 'index ui case 17');
      await clickId('nativeAdd');
      await clickId('nativeAdd');
      expect(await shown(NATIVE_TEXT, DRIVER_WAIT_MS)).assertTrue();
      {
      await launchHome();
      logCase('testIndexUi0018', 'index ui case 18');
      await clickId('nativeAdd');
      await clickId('button');
      await clickId('nativeAdd');
      expect(await shown(NATIVE_TEXT, DRIVER_WAIT_MS)).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INDEXUI_0019
     * @tc.name      testIndexUi0019
     * @tc.desc      Four alternating clicks settle on the HAR func result
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIndexUi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await launchHome();
      logCase('testIndexUi0019', 'index ui case 19');
      await clickId('button');
      await clickId('nativeAdd');
      await clickId('button');
      await clickId('nativeAdd');
      expect(await shown(NATIVE_TEXT, DRIVER_WAIT_MS)).assertTrue();
      {
      await launchHome();
      logCase('testIndexUi0020', 'index ui case 20');
      const button: Component = await driver().waitForComponent(ON.id('button'), DRIVER_WAIT_MS);
      const bounds: Rect = await button.getBounds();
      expect(bounds.right - bounds.left > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INDEXUI_0021
     * @tc.name      testIndexUi0021
     * @tc.desc      Function button bounds have a positive height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexUi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await launchHome();
      logCase('testIndexUi0021', 'index ui case 21');
      const button: Component = await driver().waitForComponent(ON.id('button'), DRIVER_WAIT_MS);
      const bounds: Rect = await button.getBounds();
      expect(bounds.bottom - bounds.top > 0).assertTrue();
      {
      await launchHome();
      logCase('testIndexUi0022', 'index ui case 22');
      const button: Component = await driver().waitForComponent(ON.id('nativeAdd'), DRIVER_WAIT_MS);
      const bounds: Rect = await button.getBounds();
      expect(bounds.right - bounds.left > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INDEXUI_0023
     * @tc.name      testIndexUi0023
     * @tc.desc      Native button bounds have a positive height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexUi0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await launchHome();
      logCase('testIndexUi0023', 'index ui case 23');
      const button: Component = await driver().waitForComponent(ON.id('nativeAdd'), DRIVER_WAIT_MS);
      const bounds: Rect = await button.getBounds();
      expect(bounds.bottom - bounds.top > 0).assertTrue();
      {
      await launchHome();
      logCase('testIndexUi0024', 'index ui case 24');
      const text: Component = await driver().waitForComponent(ON.text(INITIAL_TEXT).type('Text'), DRIVER_WAIT_MS);
      const bounds: Rect = await text.getBounds();
      expect(bounds.right - bounds.left > 0).assertTrue();
      }
    })


  });
}

const INITIAL_TEXT: string = 'Hello World';
const FUNC_TEXT: string = 'func return: har func';
const NATIVE_TEXT: string = 'result: 3';

let sharedDriver: Driver | null = null;

function driver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

async function shown(content: string, timeoutMs: number): Promise<boolean> {
  return await driver().waitForComponent(ON.text(content).type('Text'), timeoutMs) !== null;
}

async function clickId(id: string): Promise<void> {
  const component: Component = await driver().waitForComponent(ON.id(id), DRIVER_WAIT_MS);
  await component.click();
  await sleepMs(CLICK_SETTLE_MS);
}
