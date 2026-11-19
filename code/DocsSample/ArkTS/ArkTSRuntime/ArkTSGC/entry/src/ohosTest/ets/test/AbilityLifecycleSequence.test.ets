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
import { ConfigurationConstant, UIAbility } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { display, window } from '@kit.ArkUI';
import {
  BUNDLE_NAME,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  homeWant,
  launchHome,
  stopHome,
  topAbility
} from './shared/AppProbe';
import { paceTurn, sleepMs } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const EVENT_WAIT_MS: number = 3000;
const POLL_MS: number = 100;
const REPEAT_LAUNCHES: number = 3;

function delegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

class LifecycleRecorder {
  events: string[] = [];
  readonly monitor: abilityDelegatorRegistry.AbilityMonitor;

  constructor() {
    this.monitor = {
      abilityName: ENTRY_ABILITY,
      moduleName: ENTRY_MODULE,
      onAbilityCreate: () => {
        this.events.push('create');
      },
      onWindowStageCreate: () => {
        this.events.push('windowStageCreate');
      },
      onAbilityForeground: () => {
        this.events.push('foreground');
      },
      onAbilityBackground: () => {
        this.events.push('background');
      },
      onWindowStageDestroy: () => {
        this.events.push('windowStageDestroy');
      },
      onAbilityDestroy: () => {
        this.events.push('destroy');
      }
    };
  }

  start(): void {
    delegator().addAbilityMonitorSync(this.monitor);
  }

  stop(): void {
    delegator().removeAbilityMonitorSync(this.monitor);
  }

  async waitFor(event: string): Promise<boolean> {
    for (let waited = 0; waited < EVENT_WAIT_MS; waited += POLL_MS) {
      if (this.events.indexOf(event) >= 0) {
        return true;
      }
      await sleepMs(POLL_MS);
    }
    return this.events.indexOf(event) >= 0;
  }
}

function isForeground(ability: UIAbility): boolean {
  return delegator().getAbilityState(ability) === abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND;
}

export default function abilityLifecycleSequenceTest() {
  describe('AbilityLifecycleSequence', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      await stopHome();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLE_0100
     * @tc.name      testLifecycleForeground0001
     * @tc.desc      Launch EntryAbility and check it is in the foreground, is the top ability and reports its own names
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLifecycleForeground0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await launchHome();
      const top: UIAbility | undefined = await topAbility();
      logCase('testLifecycleForeground0001', `topIsAbility=${top === ability} ` +
        `name=${ability.context.abilityInfo.name} module=${ability.context.abilityInfo.moduleName} ` +
        `bundle=${ability.context.abilityInfo.bundleName}`);
      expect(isForeground(ability)).assertTrue();
      expect(top === ability).assertTrue();
      expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      expect(ability.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
      expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLE_0200
     * @tc.name      testLifecycleCreateOrder0001
     * @tc.desc      Record the lifecycle callbacks of a cold launch and check create, window stage create and
     *               foreground run in order
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycleCreateOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await stopHome();
      const recorder: LifecycleRecorder = new LifecycleRecorder();
      recorder.start();
      try {
        await delegator().startAbility(homeWant());
        logCase('testLifecycleCreateOrder0001', `waitEvent=foreground events=${recorder.events.join(',')}`);
        expect(await recorder.waitFor('foreground')).assertTrue();
      } finally {
        recorder.stop();
      }
      const events: string[] = recorder.events;
      expect(events.indexOf('create') >= 0).assertTrue();
      expect(events.indexOf('create') < events.indexOf('windowStageCreate')).assertTrue();
      expect(events.indexOf('windowStageCreate') < events.indexOf('foreground')).assertTrue();
      expect(events.indexOf('destroy')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLE_0300
     * @tc.name      testLifecycleDestroyOrder0001
     * @tc.desc      Terminate a running EntryAbility and check window stage destroy and destroy are recorded with
     *               destroy last
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycleDestroyOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const recorder: LifecycleRecorder = new LifecycleRecorder();
      recorder.start();
      try {
        await ability.context.terminateSelf();
        logCase('testLifecycleDestroyOrder0001', `waitEvent=destroy name=${ability.context.abilityInfo.name} ` +
          `events=${recorder.events.join(',')}`);
        expect(await recorder.waitFor('destroy')).assertTrue();
      } finally {
        recorder.stop();
      }
      const events: string[] = recorder.events;
      expect(events.indexOf('windowStageDestroy') >= 0).assertTrue();
      expect(events.indexOf('destroy')).assertEqual(events.length - 1);
      expect(events.indexOf('create')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLE_0400
     * @tc.name      testLifecycleColorMode0001
     * @tc.desc      Check the color mode the ability sees after onCreate resets it is a concrete mode shared with the
     *               resource manager
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycleColorMode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const abilityMode: number = Number(ability.context.config.colorMode);
      const resourceMode: number = Number(ability.context.resourceManager.getConfigurationSync().colorMode);
      logCase('testLifecycleColorMode0001', `abilityMode=${abilityMode} resourceMode=${resourceMode}`);
      expect(abilityMode === ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET).assertFalse();
      expect(abilityMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK ||
        abilityMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT).assertTrue();
      expect(abilityMode).assertEqual(resourceMode);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLE_0500
     * @tc.name      testLifecycleWindowShown0001
     * @tc.desc      Read the main window of the launched ability and check it is showing with a non empty rectangle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycleWindowShown0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await launchHome();
      const main: window.Window = await window.getLastWindow(ability.context);
      const props: window.WindowProperties = main.getWindowProperties();
      const screen: display.Display = display.getDefaultDisplaySync();
      logCase('testLifecycleWindowShown0001', `rect=${props.windowRect.width}x${props.windowRect.height} ` +
        `screen=${screen.width}x${screen.height}`);
      expect(main.isWindowShowing()).assertTrue();
      expect(props.windowRect.width > 0 && props.windowRect.height > 0).assertTrue();
      expect(props.windowRect.width <= screen.width && props.windowRect.height <= screen.height).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLE_0600
     * @tc.name      testLifecycleRelaunch0001
     * @tc.desc      Terminate and relaunch EntryAbility and check the old instance is gone and a new foreground
     *               instance replaces it
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycleRelaunch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: UIAbility = await launchHome();
      await stopHome();
      const between: UIAbility | undefined = await topAbility();
      const second: UIAbility = await launchHome();
      logCase('testLifecycleRelaunch0001', `betweenDefined=${between !== undefined} ` +
        `betweenIsFirst=${between === first} secondIsFirst=${second === first}`);
      expect(between === first).assertFalse();
      expect(second === first).assertFalse();
      expect(isForeground(second)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_LIFECYCLE_0700
     * @tc.name      testLifecycleRepeatLaunch0001
     * @tc.desc      Launch EntryAbility three times in a row and check each launch gives a distinct foreground instance
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycleRepeatLaunch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seen: UIAbility[] = [];
      const foreground: boolean[] = [];
      for (let i = 0; i < REPEAT_LAUNCHES; i++) {
        const ability: UIAbility = await launchHome();
        foreground.push(isForeground(ability));
        seen.push(ability);
      }
      const distinct: number = seen.filter((item: UIAbility, index: number) => seen.indexOf(item) === index).length;
      logCase('testLifecycleRepeatLaunch0001', `seen=${seen.length} foreground=${foreground.join(',')} ` +
        `distinct=${distinct} expected=${REPEAT_LAUNCHES}`);
      expect(seen.length).assertEqual(REPEAT_LAUNCHES);
      expect(foreground.every((value: boolean) => value)).assertTrue();
      expect(distinct).assertEqual(REPEAT_LAUNCHES);
    });
  });
}
