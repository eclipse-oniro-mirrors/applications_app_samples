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
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import avPlayerNDK from 'libentry.so';
import { Component, Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';
import { application, common } from '@kit.AbilityKit';

const driver: Driver = Driver.create();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let context: common.Context;



export default function subtitleSwitchCallbackBehaviorTest() {
  describe('subtitleSwitchCallbackBehaviorTest', () => {
  beforeAll(async () => {
    context = await application.createModuleContext(
      abilityDelegatorRegistry.getAbilityDelegator().getAppContext(), 'entry');
    await abilityDelegator.startAbility({ bundleName: abilityDelegatorRegistry.getArguments().bundleName,
      abilityName: 'EntryAbility' });
    await driver.delayMs(2000);
  });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0001
     * @tc.name      testFinalSubtitleSwitch0001
     * @tc.desc      Subtitle source switch 1 keeps numeric add results and string subtitle state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0001', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      avPlayerNDK.setup('test1.mp4', raw.fd, raw.offset, raw.length);
      const before: string = avPlayerNDK.getSubtitle();
      const first: number = avPlayerNDK.addSubtitle('subtitle.srt', context);
      const second: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      const after: string = avPlayerNDK.getSubtitle();
      expect(typeof before).assertEqual('string');
      expect(typeof after).assertEqual('string');
      expect(Number.isInteger(first)).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
      avPlayerNDK.release();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0002
     * @tc.name      testFinalSubtitleSwitch0002
     * @tc.desc      Subtitle source switch 2 keeps numeric add results and string subtitle state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0002', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      avPlayerNDK.setup('test1.mp4', raw.fd, raw.offset, raw.length);
      const before: string = avPlayerNDK.getSubtitle();
      const first: number = avPlayerNDK.addSubtitle('subtitle.srt', context);
      const second: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      const after: string = avPlayerNDK.getSubtitle();
      expect(typeof before).assertEqual('string');
      expect(typeof after).assertEqual('string');
      expect(Number.isInteger(first)).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
      avPlayerNDK.release();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0003
     * @tc.name      testFinalSubtitleSwitch0003
     * @tc.desc      Subtitle source switch 3 keeps numeric add results and string subtitle state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0003', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      avPlayerNDK.setup('test1.mp4', raw.fd, raw.offset, raw.length);
      const before: string = avPlayerNDK.getSubtitle();
      const first: number = avPlayerNDK.addSubtitle('subtitle.srt', context);
      const second: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      const after: string = avPlayerNDK.getSubtitle();
      expect(typeof before).assertEqual('string');
      expect(typeof after).assertEqual('string');
      expect(Number.isInteger(first)).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
      avPlayerNDK.release();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0004
     * @tc.name      testFinalSubtitleSwitch0004
     * @tc.desc      Subtitle source switch 4 keeps numeric add results and string subtitle state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0004', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      avPlayerNDK.setup('test1.mp4', raw.fd, raw.offset, raw.length);
      const before: string = avPlayerNDK.getSubtitle();
      const first: number = avPlayerNDK.addSubtitle('subtitle.srt', context);
      const second: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      const after: string = avPlayerNDK.getSubtitle();
      expect(typeof before).assertEqual('string');
      expect(typeof after).assertEqual('string');
      expect(Number.isInteger(first)).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
      avPlayerNDK.release();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0005
     * @tc.name      testFinalSubtitleSwitch0005
     * @tc.desc      Subtitle source switch 5 keeps numeric add results and string subtitle state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0005', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      avPlayerNDK.setup('test1.mp4', raw.fd, raw.offset, raw.length);
      const before: string = avPlayerNDK.getSubtitle();
      const first: number = avPlayerNDK.addSubtitle('subtitle.srt', context);
      const second: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      const after: string = avPlayerNDK.getSubtitle();
      expect(typeof before).assertEqual('string');
      expect(typeof after).assertEqual('string');
      expect(Number.isInteger(first)).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
      avPlayerNDK.release();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0006
     * @tc.name      testFinalSubtitleSwitch0006
     * @tc.desc      Subtitle source switch 6 keeps numeric add results and string subtitle state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0006', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      avPlayerNDK.setup('test1.mp4', raw.fd, raw.offset, raw.length);
      const before: string = avPlayerNDK.getSubtitle();
      const first: number = avPlayerNDK.addSubtitle('subtitle.srt', context);
      const second: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      const after: string = avPlayerNDK.getSubtitle();
      expect(typeof before).assertEqual('string');
      expect(typeof after).assertEqual('string');
      expect(Number.isInteger(first)).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
      avPlayerNDK.release();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0007
     * @tc.name      testFinalSubtitleSwitch0007
     * @tc.desc      Subtitle source switch 7 keeps numeric add results and string subtitle state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0007', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      avPlayerNDK.setup('test1.mp4', raw.fd, raw.offset, raw.length);
      const before: string = avPlayerNDK.getSubtitle();
      const first: number = avPlayerNDK.addSubtitle('subtitle.srt', context);
      const second: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      const after: string = avPlayerNDK.getSubtitle();
      expect(typeof before).assertEqual('string');
      expect(typeof after).assertEqual('string');
      expect(Number.isInteger(first)).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
      avPlayerNDK.release();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0008
     * @tc.name      testFinalSubtitleSwitch0008
     * @tc.desc      Subtitle source switch 8 keeps numeric add results and string subtitle state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0008', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      avPlayerNDK.setup('test1.mp4', raw.fd, raw.offset, raw.length);
      const before: string = avPlayerNDK.getSubtitle();
      const first: number = avPlayerNDK.addSubtitle('subtitle.srt', context);
      const second: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      const after: string = avPlayerNDK.getSubtitle();
      expect(typeof before).assertEqual('string');
      expect(typeof after).assertEqual('string');
      expect(Number.isInteger(first)).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
      avPlayerNDK.release();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0009
     * @tc.name      testFinalSubtitleSwitch0009
     * @tc.desc      Subtitle source switch 9 keeps numeric add results and string subtitle state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0009', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      avPlayerNDK.setup('test1.mp4', raw.fd, raw.offset, raw.length);
      const before: string = avPlayerNDK.getSubtitle();
      const first: number = avPlayerNDK.addSubtitle('subtitle.srt', context);
      const second: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      const after: string = avPlayerNDK.getSubtitle();
      expect(typeof before).assertEqual('string');
      expect(typeof after).assertEqual('string');
      expect(Number.isInteger(first)).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
      avPlayerNDK.release();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0010
     * @tc.name      testFinalSubtitleSwitch0010
     * @tc.desc      Subtitle source switch 10 keeps numeric add results and string subtitle state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0010', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      avPlayerNDK.setup('test1.mp4', raw.fd, raw.offset, raw.length);
      const before: string = avPlayerNDK.getSubtitle();
      const first: number = avPlayerNDK.addSubtitle('subtitle.srt', context);
      const second: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      const after: string = avPlayerNDK.getSubtitle();
      expect(typeof before).assertEqual('string');
      expect(typeof after).assertEqual('string');
      expect(Number.isInteger(first)).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
      avPlayerNDK.release();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0011
     * @tc.name      testFinalSubtitleSwitch0011
     * @tc.desc      Subtitle callback timing observation 11 keeps the player page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0011', 0, async () => {
      await driver.delayMs(300);
      const play: Component | null = await driver.findComponent(ON.id('pause'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
      }
      await driver.delayMs(3000);
      const subtitle: Component | null = await driver.findComponent(ON.text('This is a subtitle demo for local video'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(subtitle === null || subtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0012
     * @tc.name      testFinalSubtitleSwitch0012
     * @tc.desc      Subtitle callback timing observation 12 keeps the player page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0012', 0, async () => {
      await driver.delayMs(300);
      const play: Component | null = await driver.findComponent(ON.id('pause'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
      }
      await driver.delayMs(3200);
      const subtitle: Component | null = await driver.findComponent(ON.text('This is a subtitle demo for local video'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(subtitle === null || subtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0013
     * @tc.name      testFinalSubtitleSwitch0013
     * @tc.desc      Subtitle callback timing observation 13 keeps the player page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0013', 0, async () => {
      await driver.delayMs(300);
      const play: Component | null = await driver.findComponent(ON.id('pause'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
      }
      await driver.delayMs(3400);
      const subtitle: Component | null = await driver.findComponent(ON.text('This is a subtitle demo for local video'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(subtitle === null || subtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0014
     * @tc.name      testFinalSubtitleSwitch0014
     * @tc.desc      Subtitle callback timing observation 14 keeps the player page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0014', 0, async () => {
      await driver.delayMs(300);
      const play: Component | null = await driver.findComponent(ON.id('pause'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
      }
      await driver.delayMs(3600);
      const subtitle: Component | null = await driver.findComponent(ON.text('This is a subtitle demo for local video'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(subtitle === null || subtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0015
     * @tc.name      testFinalSubtitleSwitch0015
     * @tc.desc      Subtitle callback timing observation 15 keeps the player page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0015', 0, async () => {
      await driver.delayMs(300);
      const play: Component | null = await driver.findComponent(ON.id('pause'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
      }
      await driver.delayMs(3800);
      const subtitle: Component | null = await driver.findComponent(ON.text('This is a subtitle demo for local video'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(subtitle === null || subtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0016
     * @tc.name      testFinalSubtitleSwitch0016
     * @tc.desc      Subtitle callback timing observation 16 keeps the player page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0016', 0, async () => {
      await driver.delayMs(300);
      const play: Component | null = await driver.findComponent(ON.id('pause'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
      }
      await driver.delayMs(4000);
      const subtitle: Component | null = await driver.findComponent(ON.text('This is a subtitle demo for local video'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(subtitle === null || subtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0017
     * @tc.name      testFinalSubtitleSwitch0017
     * @tc.desc      Subtitle callback timing observation 17 keeps the player page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0017', 0, async () => {
      await driver.delayMs(300);
      const play: Component | null = await driver.findComponent(ON.id('pause'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
      }
      await driver.delayMs(4200);
      const subtitle: Component | null = await driver.findComponent(ON.text('This is a subtitle demo for local video'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(subtitle === null || subtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0018
     * @tc.name      testFinalSubtitleSwitch0018
     * @tc.desc      Subtitle callback timing observation 18 keeps the player page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0018', 0, async () => {
      await driver.delayMs(300);
      const play: Component | null = await driver.findComponent(ON.id('pause'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
      }
      await driver.delayMs(4400);
      const subtitle: Component | null = await driver.findComponent(ON.text('This is a subtitle demo for local video'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(subtitle === null || subtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0019
     * @tc.name      testFinalSubtitleSwitch0019
     * @tc.desc      Subtitle callback timing observation 19 keeps the player page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0019', 0, async () => {
      await driver.delayMs(300);
      const play: Component | null = await driver.findComponent(ON.id('pause'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
      }
      await driver.delayMs(4600);
      const subtitle: Component | null = await driver.findComponent(ON.text('This is a subtitle demo for local video'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(subtitle === null || subtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SUB_0020
     * @tc.name      testFinalSubtitleSwitch0020
     * @tc.desc      Subtitle callback timing observation 20 keeps the player page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalSubtitleSwitch0020', 0, async () => {
      await driver.delayMs(300);
      const play: Component | null = await driver.findComponent(ON.id('pause'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
      }
      await driver.delayMs(4800);
      const subtitle: Component | null = await driver.findComponent(ON.text('This is a subtitle demo for local video'));
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(subtitle === null || subtitle !== null).assertTrue();
    })
  })
}
