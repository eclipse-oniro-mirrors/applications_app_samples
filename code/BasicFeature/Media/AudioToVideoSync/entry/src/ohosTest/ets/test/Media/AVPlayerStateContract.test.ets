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

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { media } from '@kit.MediaKit';
import { application, common } from '@kit.AbilityKit';
import { paceTurn } from '../Shared/TestPace';
import { appContext } from '../Shared/TestSupport';

const RAW_NAME: string = 'test.mp4';
const TEST_MODULE: string = 'entry_test';
const WAIT_TIMEOUT_MS: number = 8000;

let moduleContext: common.Context | null = null;

async function testModuleContext(): Promise<common.Context> {
  if (moduleContext === null) {
    moduleContext = await application.createModuleContext(appContext().getApplicationContext(), TEST_MODULE);
  }
  return moduleContext;
}

async function rawDescriptor(): Promise<media.AVFileDescriptor> {
  const context: common.Context = await testModuleContext();
  const raw = context.resourceManager.getRawFdSync(RAW_NAME);
  const descriptor: media.AVFileDescriptor = {
    fd: raw.fd,
    offset: raw.offset,
    length: raw.length
  };
  expect(descriptor.fd).assertLarger(0);
  expect(descriptor.offset).assertLargerOrEqual(0);
  expect(descriptor.length).assertLarger(0);
  return descriptor;
}

async function waitForState(player: media.AVPlayer, target: media.AVPlayerState,
  timeoutMs: number = WAIT_TIMEOUT_MS): Promise<media.AVPlayerState> {
  if (player.state === target) {
    return player.state;
  }
  return new Promise<media.AVPlayerState>((resolve: (value: media.AVPlayerState) => void,
    reject: (reason: Error) => void) => {
    let settled: boolean = false;
    const timer: number = setTimeout(() => {
      if (!settled) {
        settled = true;
        player.off('stateChange');
        reject(new Error(`state timeout: expected ${target}, current ${player.state}`));
      }
    }, timeoutMs);
    const handler: media.OnAVPlayerStateChangeHandle =
      (state: media.AVPlayerState, reason: media.StateChangeReason) => {
        if (state === target && !settled) {
          settled = true;
          clearTimeout(timer);
          player.off('stateChange', handler);
          resolve(state);
        }
      };
    player.on('stateChange', handler);
  });
}

async function createInitialized(): Promise<media.AVPlayer> {
  const player: media.AVPlayer = await media.createAVPlayer();
  player.fdSrc = await rawDescriptor();
  await waitForState(player, 'initialized');
  return player;
}

export default function avPlayerStateContractTest() {
  describe('avPlayerStateContractTest', () => {
    beforeAll(() => {
      console.info('avPlayerStateContractTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('avPlayerStateContractTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0100
     * @tc.name      testAVPlayerState0001
     * @tc.desc      Verify a freshly created player is in the idle state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0001', 0, async () => {
      const player: media.AVPlayer = await media.createAVPlayer();
      try {
        expect(player.state).assertEqual('idle');
        expect(typeof player.state).assertEqual('string');
        expect(player.state.length).assertLarger(0);
      } finally {
        await player.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0200
     * @tc.name      testAVPlayerState0002
     * @tc.desc      Verify releasing an idle player moves it to the released state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0002', 0, async () => {
      const player: media.AVPlayer = await media.createAVPlayer();
      await player.release();
      expect(player.state).assertEqual('released');
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0300
     * @tc.name      testAVPlayerState0003
     * @tc.desc      Verify two independently created players are distinct and both start idle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0003', 0, async () => {
      const first: media.AVPlayer = await media.createAVPlayer();
      const second: media.AVPlayer = await media.createAVPlayer();
      try {
        expect(first === second).assertFalse();
        expect(first.state).assertEqual('idle');
        expect(second.state).assertEqual('idle');
      } finally {
        await first.release();
        await second.release();
      }
      expect(first.state).assertEqual('released');
      expect(second.state).assertEqual('released');
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0400
     * @tc.name      testAVPlayerState0004
     * @tc.desc      Verify creating and releasing several players keeps every instance independent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0004', 0, async () => {
      const players: media.AVPlayer[] = [];
      for (let i = 0; i < 4; i++) {
        players.push(await media.createAVPlayer());
      }
      for (let i = 0; i < players.length; i++) {
        expect(players[i].state).assertEqual('idle');
      }
      await players[1].release();
      expect(players[1].state).assertEqual('released');
      for (let i = 0; i < players.length; i++) {
        if (i !== 1) {
          expect(players[i].state).assertEqual('idle');
          await players[i].release();
        }
      }
      for (let i = 0; i < players.length; i++) {
        expect(players[i].state).assertEqual('released');
      }
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0500
     * @tc.name      testAVPlayerState0005
     * @tc.desc      Verify a valid file descriptor source moves the player to initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0005', 0, async () => {
      const player: media.AVPlayer = await media.createAVPlayer();
      try {
        player.fdSrc = await rawDescriptor();
        const reached: media.AVPlayerState = await waitForState(player, 'initialized');
        expect(reached).assertEqual('initialized');
        expect(player.state).assertEqual('initialized');
      } finally {
        await player.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0600
     * @tc.name      testAVPlayerState0006
     * @tc.desc      Verify resetting an initialized player returns it to idle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0006', 0, async () => {
      const player: media.AVPlayer = await createInitialized();
      try {
        await player.reset();
        expect(player.state).assertEqual('idle');
      } finally {
        await player.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0700
     * @tc.name      testAVPlayerState0007
     * @tc.desc      Verify releasing an initialized player reaches the released state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0007', 0, async () => {
      const player: media.AVPlayer = await createInitialized();
      await player.release();
      expect(player.state).assertEqual('released');
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0800
     * @tc.name      testAVPlayerState0008
     * @tc.desc      Verify two sourced players hold their initialized state independently
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0008', 0, async () => {
      const first: media.AVPlayer = await createInitialized();
      const second: media.AVPlayer = await createInitialized();
      try {
        expect(first.state).assertEqual('initialized');
        expect(second.state).assertEqual('initialized');
        await first.reset();
        expect(first.state).assertEqual('idle');
        expect(second.state).assertEqual('initialized');
      } finally {
        await first.release();
        await second.release();
      }
      expect(first.state).assertEqual('released');
      expect(second.state).assertEqual('released');
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0900
     * @tc.name      testAVPlayerState0009
     * @tc.desc      Verify the loop flag defaults to false on a new player
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0009', 0, async () => {
      const player: media.AVPlayer = await media.createAVPlayer();
      try {
        expect(player.loop).assertFalse();
        expect(typeof player.loop).assertEqual('boolean');
      } finally {
        await player.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_1000
     * @tc.name      testAVPlayerState0010
     * @tc.desc      Verify a new player exposes no video surface before one is attached
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0010', 0, async () => {
      const player: media.AVPlayer = await media.createAVPlayer();
      try {
        expect(player.surfaceId === undefined || player.surfaceId === '').assertTrue();
        expect(player.state).assertEqual('idle');
      } finally {
        await player.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_1100
     * @tc.name      testAVPlayerState0011
     * @tc.desc      Verify the state string is always one of the documented AVPlayer literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0011', 0, async () => {
      const allowed: string[] = ['idle', 'initialized', 'prepared', 'playing', 'paused', 'completed',
        'stopped', 'released', 'error'];
      const player: media.AVPlayer = await media.createAVPlayer();
      try {
        expect(allowed.indexOf(player.state) >= 0).assertTrue();
        player.fdSrc = await rawDescriptor();
        await waitForState(player, 'initialized');
        expect(allowed.indexOf(player.state) >= 0).assertTrue();
        await player.reset();
        expect(allowed.indexOf(player.state) >= 0).assertTrue();
      } finally {
        await player.release();
      }
      expect(allowed.indexOf(player.state) >= 0).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_1200
     * @tc.name      testAVPlayerState0012
     * @tc.desc      Verify reading the state repeatedly does not change it while idle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0012', 0, async () => {
      const player: media.AVPlayer = await media.createAVPlayer();
      try {
        for (let i = 0; i < 100; i++) {
          expect(player.state).assertEqual('idle');
        }
      } finally {
        await player.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_1300
     * @tc.name      testAVPlayerState0013
     * @tc.desc      Verify repeated source, reset and release cycles keep every terminal state correct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0013', 0, async () => {
      for (let i = 0; i < 3; i++) {
        const player: media.AVPlayer = await createInitialized();
        expect(player.state).assertEqual('initialized');
        await player.reset();
        expect(player.state).assertEqual('idle');
        await player.release();
        expect(player.state).assertEqual('released');
      }
    })
  });
}
