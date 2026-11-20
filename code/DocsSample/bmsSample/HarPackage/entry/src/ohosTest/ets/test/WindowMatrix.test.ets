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

export default function windowMatrixTest() {
  describe('WindowMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      await stopHome();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0001
     * @tc.name      testWindowCase0001
     * @tc.desc      Window rect width is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0001', 'window case 1');
      expect(props.windowRect.width > 0).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0002', 'window case 2');
      expect(props.windowRect.height > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0003
     * @tc.name      testWindowCase0003
     * @tc.desc      Window rect left edge is not negative
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowCase0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0003', 'window case 3');
      expect(props.windowRect.left >= 0).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0004', 'window case 4');
      expect(props.windowRect.top >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0005
     * @tc.name      testWindowCase0005
     * @tc.desc      Drawable rect width is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowCase0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0005', 'window case 5');
      expect(props.drawableRect.width > 0).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0006', 'window case 6');
      expect(props.drawableRect.height > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0007
     * @tc.name      testWindowCase0007
     * @tc.desc      Drawable rect fits inside the window width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowCase0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0007', 'window case 7');
      expect(props.drawableRect.width <= props.windowRect.width).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0008', 'window case 8');
      expect(props.drawableRect.height <= props.windowRect.height).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0009
     * @tc.name      testWindowCase0009
     * @tc.desc      Drawable left edge is not left of the window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowCase0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0009', 'window case 9');
      expect(props.drawableRect.left >= props.windowRect.left).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0010', 'window case 10');
      expect(props.drawableRect.top >= props.windowRect.top).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0011
     * @tc.name      testWindowCase0011
     * @tc.desc      Layout full screen flag is a boolean
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowCase0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0011', 'window case 11');
      expect(typeof props.isLayoutFullScreen === 'boolean').assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0012', 'window case 12');
      expect(typeof props.isFullScreen === 'boolean').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0013
     * @tc.name      testWindowCase0013
     * @tc.desc      Focusable flag is a boolean
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowCase0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0013', 'window case 13');
      expect(typeof props.focusable === 'boolean').assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0014', 'window case 14');
      expect(typeof props.touchable === 'boolean').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0015
     * @tc.name      testWindowCase0015
     * @tc.desc      Brightness value is a number
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowCase0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0015', 'window case 15');
      expect(typeof props.brightness === 'number').assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0016', 'window case 16');
      const again: window.WindowProperties = main.getWindowProperties();
      expect(again.windowRect.width).assertEqual(props.windowRect.width);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0017
     * @tc.name      testWindowCase0017
     * @tc.desc      Window properties read twice keep the same height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowCase0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0017', 'window case 17');
      const again: window.WindowProperties = main.getWindowProperties();
      expect(again.windowRect.height).assertEqual(props.windowRect.height);
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0018', 'window case 18');
      const again: window.WindowProperties = main.getWindowProperties();
      expect(again.drawableRect.width).assertEqual(props.drawableRect.width);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0019
     * @tc.name      testWindowCase0019
     * @tc.desc      Window is showing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowCase0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0019', 'window case 19');
      expect(await main.isWindowShowing()).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0020', 'window case 20');
      const top: window.Window = await window.getTopWindow(ability.context);
      expect(top.getWindowProperties().windowRect.width).assertEqual(props.windowRect.width);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0021
     * @tc.name      testWindowCase0021
     * @tc.desc      Top window height matches the last window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowCase0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0021', 'window case 21');
      const top: window.Window = await window.getTopWindow(ability.context);
      expect(top.getWindowProperties().windowRect.height).assertEqual(props.windowRect.height);
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0022', 'window case 22');
      const area: window.AvoidArea = main.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      expect(typeof area.visible === 'boolean').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0023
     * @tc.name      testWindowCase0023
     * @tc.desc      System avoid area top rect is not negative
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowCase0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0023', 'window case 23');
      const area: window.AvoidArea = main.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      expect(area.topRect.height >= 0).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0024', 'window case 24');
      const area: window.AvoidArea = main.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
      expect(typeof area.visible === 'boolean').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0025
     * @tc.name      testWindowCase0025
     * @tc.desc      System gesture avoid area is reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowCase0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0025', 'window case 25');
      const area: window.AvoidArea = main.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE);
      expect(typeof area.visible === 'boolean').assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0026', 'window case 26');
      const area: window.AvoidArea = main.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
      expect(typeof area.visible === 'boolean').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0027
     * @tc.name      testWindowCase0027
     * @tc.desc      Keyboard avoid area is reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowCase0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0027', 'window case 27');
      const area: window.AvoidArea = main.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD);
      expect(typeof area.visible === 'boolean').assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0028', 'window case 28');
      const area: window.AvoidArea = main.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      expect(area.leftRect.width >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0029
     * @tc.name      testWindowCase0029
     * @tc.desc      Avoid area right rect has a non negative width
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowCase0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0029', 'window case 29');
      const area: window.AvoidArea = main.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      expect(area.rightRect.width >= 0).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0030', 'window case 30');
      const area: window.AvoidArea = main.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      expect(area.bottomRect.height >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0031
     * @tc.name      testWindowCase0031
     * @tc.desc      Default display width is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowCase0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0031', 'window case 31');
      expect(display.getDefaultDisplaySync().width > 0).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0032', 'window case 32');
      expect(display.getDefaultDisplaySync().height > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0033
     * @tc.name      testWindowCase0033
     * @tc.desc      Default display density dpi is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowCase0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0033', 'window case 33');
      expect(display.getDefaultDisplaySync().densityDPI > 0).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0034', 'window case 34');
      expect(display.getDefaultDisplaySync().densityPixels > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0039
     * @tc.name      testWindowCase0039
     * @tc.desc      Window rect height fits the display height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowCase0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0039', 'window case 39');
      expect(props.windowRect.height <= display.getDefaultDisplaySync().height).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0040', 'window case 40');
      expect(props.windowRect.width * props.windowRect.height > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0041
     * @tc.name      testWindowCase0041
     * @tc.desc      Drawable rect area is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowCase0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0041', 'window case 41');
      expect(props.drawableRect.width * props.drawableRect.height > 0).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0042', 'window case 42');
      const drawableArea: number = props.drawableRect.width * props.drawableRect.height;
      const windowArea: number = props.windowRect.width * props.windowRect.height;
      expect(drawableArea <= windowArea).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0043
     * @tc.name      testWindowCase0043
     * @tc.desc      Window rect right edge stays inside the display
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowCase0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0043', 'window case 43');
      expect(props.windowRect.left + props.windowRect.width <= display.getDefaultDisplaySync().width + 16).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0044', 'window case 44');
      const screenHeight: number = display.getDefaultDisplaySync().height;
      expect(props.windowRect.top + props.windowRect.height <= screenHeight + 16).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0045
     * @tc.name      testWindowCase0045
     * @tc.desc      Window rect numbers are integers
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowCase0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0045', 'window case 45');
      expect(Math.floor(props.windowRect.width)).assertEqual(props.windowRect.width);
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0046', 'window case 46');
      expect(Math.floor(props.windowRect.height)).assertEqual(props.windowRect.height);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0047
     * @tc.name      testWindowCase0047
     * @tc.desc      Drawable rect left edge is an integer
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowCase0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0047', 'window case 47');
      expect(Math.floor(props.drawableRect.left)).assertEqual(props.drawableRect.left);
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0048', 'window case 48');
      expect(Math.floor(props.drawableRect.top)).assertEqual(props.drawableRect.top);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0049
     * @tc.name      testWindowCase0049
     * @tc.desc      Window width is at least 60 pixels
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowCase0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0049', 'window case 49');
      expect(props.windowRect.width >= 60).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0050', 'window case 50');
      expect(props.windowRect.height >= 60).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0051
     * @tc.name      testWindowCase0051
     * @tc.desc      Window brightness is not below minus one
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowCase0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0051', 'window case 51');
      expect(props.brightness >= -1).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0052', 'window case 52');
      expect(props.brightness <= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0057
     * @tc.name      testWindowCase0057
     * @tc.desc      getLastWindow twice returns the same height
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowCase0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0057', 'window case 57');
      const again: window.Window = await window.getLastWindow(ability.context);
      expect(again.getWindowProperties().windowRect.height).assertEqual(props.windowRect.height);
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0058', 'window case 58');
      expect(props.drawableRect.left - props.windowRect.left >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0059
     * @tc.name      testWindowCase0059
     * @tc.desc      Window drawable vertical offset is not negative
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowCase0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0059', 'window case 59');
      expect(props.drawableRect.top - props.windowRect.top >= 0).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0060', 'window case 60');
      const drawableRight: number = props.drawableRect.left + props.drawableRect.width;
      const windowRight: number = props.windowRect.left + props.windowRect.width;
      expect(drawableRight <= windowRight).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0061
     * @tc.name      testWindowCase0061
     * @tc.desc      Window drawable bottom edge fits
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowCase0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0061', 'window case 61');
      const drawableBottom: number = props.drawableRect.top + props.drawableRect.height;
      const windowBottom: number = props.windowRect.top + props.windowRect.height;
      expect(drawableBottom <= windowBottom).assertTrue();
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0062', 'window case 62');
      expect((await display.getAllDisplays()).length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0063
     * @tc.name      testWindowCase0063
     * @tc.desc      Primary display id is zero
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowCase0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0063', 'window case 63');
      expect(display.getDefaultDisplaySync().id).assertEqual(0);
      {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0064', 'window case 64');
      expect(display.getDefaultDisplaySync().densityDPI < 2000).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_WINDOW_0065
     * @tc.name      testWindowCase0065
     * @tc.desc      Window width is wider than tall on this sample device
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWindowCase0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      logCase('testWindowCase0065', 'window case 65');
      expect(props.windowRect.width * props.windowRect.height >= 3600).assertTrue();
    });

  });
}
