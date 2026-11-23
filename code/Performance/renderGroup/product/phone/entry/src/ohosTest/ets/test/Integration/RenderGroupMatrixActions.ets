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

import {
  NON_PROFIT, PROFIT, SWITCH_ID, Scene, assertSwitch, backToHome, backToIndex,
  clickCenter, countText, openHome, openScene
} from '../Shared/SharedDriver';
import { expect } from '@ohos/hypium';

export async function toggleByCoordinates(enabled: boolean): Promise<void> {
  await clickCenter(SWITCH_ID);
  await assertSwitch(enabled);
}

export async function reopenScene(scene: Scene, systemBack: boolean): Promise<void> {
  await backToHome(systemBack);
  expect(await countText('item1')).assertEqual(0);
  await openScene(scene);
}

export async function visitOtherSceneAndResume(scene: Scene): Promise<void> {
  await backToHome();
  const other = scene === PROFIT ? NON_PROFIT : PROFIT;
  await openScene(other);
  await assertSwitch(false);
  await backToHome(true);
  await openScene(scene);
}

export async function reenterThroughIndex(scene: Scene): Promise<void> {
  await backToHome();
  await backToIndex(true);
  expect(await countText('item1')).assertEqual(0);
  await openHome();
  await openScene(scene);
}
