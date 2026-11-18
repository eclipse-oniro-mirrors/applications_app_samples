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
import { MockKit } from '@ohos/hypium';
import { media } from '@kit.MediaKit';
import { ExternalPlayer, sdkMock } from './ContinuousExternal';
import { mediaMockTarget } from './ContinuousMediaMockTarget';

// This module MUST evaluate before the production singleton dependency. ES module
// requested-module evaluation order is depth-first in import declaration order.
// ContinuousFixture imports this dependency before BackgroundPlayerFeature.
export const bootstrapPlayer: ExternalPlayer = new ExternalPlayer();
export let bootstrapCalls: number = 0;
const bootstrapMock: MockKit = new MockKit();
const originalCreate = media.createAVPlayer;
const mockedCreate = sdkMock(bootstrapMock, mediaMockTarget, originalCreate);
const installedCreate: Function = media.createAVPlayer;
export const bootstrapMockInstalled: boolean = installedCreate === mockedCreate;
mockedCreate.stub().afterAction((): Promise<media.AVPlayer> => {
  bootstrapCalls++;
  return Promise.resolve(bootstrapPlayer.asSdk());
});
// Keep the owned microtask barrier, but do not restore during dependency evaluation.
// The real singleton must consume the installed SDK mock before restoration.
// Fixture.open drains that existing chain, restores once, then keeps all original
// bootstrap call-count/listener/singleton identity assertions.
export const bootstrapBarrier: Promise<void> = Promise.resolve().then((): void => {});
let bootstrapRestored: boolean = false;
export function restoreBootstrapMock(): void {
  if (!bootstrapRestored) {
    bootstrapMock.ignoreMock(mediaMockTarget, media.createAVPlayer);
    bootstrapRestored = true;
  }
}
