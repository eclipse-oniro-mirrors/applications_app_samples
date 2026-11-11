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
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

export const UI_BUNDLE: string = 'com.samples.avrecorder';
export const UI_ENTRY: string = 'EntryAbility';
export const VIDEO_ENTRY: string = 'videoRecorderPage';
export const AUDIO_ENTRY: string = 'audioRecorderPage';

let sharedDriver: Driver | null = null;

// UiTest allows only one driver per process and rejects overlapping driver calls,
// so every UI suite reuses the same instance instead of calling Driver.create again.
export function uiDriver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

export async function dismissPermissions(target: Driver): Promise<void> {
  for (let i = 0; i < 3; i++) {
    const allowNodes: Component[] = await target.findComponents(ON.text('允许'));
    if (allowNodes === null || allowNodes.length === 0) {
      return;
    }
    await allowNodes[0].click();
    await target.delayMs(600);
  }
}

export async function backHome(target: Driver, maxSteps: number = 5): Promise<boolean> {
  for (let i = 0; i < maxSteps; i++) {
    await dismissPermissions(target);
    const video: Component | null = await target.findComponent(ON.id(VIDEO_ENTRY));
    const audio: Component | null = await target.findComponent(ON.id(AUDIO_ENTRY));
    if (video !== null && audio !== null) {
      return true;
    }
    const inApp: boolean = (await target.findComponent(ON.id('videoSetting'))) !== null ||
      (await target.findComponent(ON.id('audioSetting'))) !== null ||
      (await target.findComponent(ON.id('videoStart'))) !== null ||
      (await target.findComponent(ON.id('audioStart'))) !== null;
    if (inApp) {
      await target.pressBack();
    }
    await target.delayMs(800);
  }
  await dismissPermissions(target);
  return (await target.findComponent(ON.id(VIDEO_ENTRY))) !== null;
}

// A suite may start after another suite left the app on a recorder page or with a
// dialog open, so every beforeAll relaunches the ability and walks back to home.
// The first wait must not press back: on a cold launch the home page can take a few
// seconds to draw, and back would exit the just-started ability.
export async function openHome(): Promise<Driver> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator =
    abilityDelegatorRegistry.getAbilityDelegator();
  const want: Want = { bundleName: UI_BUNDLE, abilityName: UI_ENTRY };
  await delegator.startAbility(want);
  const target: Driver = uiDriver();
  await target.waitForComponent(ON.id(VIDEO_ENTRY), 8000);
  await dismissPermissions(target);
  await backHome(target);
  return target;
}
