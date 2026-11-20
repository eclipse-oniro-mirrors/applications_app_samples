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
import { TestType, Size, Level } from '@ohos/hypium';

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { media } from '@kit.MediaKit';
import { application, common } from '@kit.AbilityKit';
import { paceTurn } from '../Shared/TestPace';
import { appContext } from '../Shared/TestSupport';
import { hilog } from '@kit.PerformanceAnalysisKit';

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


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_Media_AVPlayerStateContract]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
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
    it('testAVPlayerState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testAVPlayerState0001');
      const player: media.AVPlayer = await media.createAVPlayer();
      try {
        expect(player.state).assertEqual('idle');
        expect(typeof player.state).assertEqual('string');
        expect(player.state.length).assertLarger(0);
      } finally {
        await player.release();
      }
    
      logEnd('testAVPlayerState0001');
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0200
     * @tc.name      testAVPlayerState0002
     * @tc.desc      Verify releasing an idle player moves it to the released state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testAVPlayerState0002');
      const player: media.AVPlayer = await media.createAVPlayer();
      await player.release();
      expect(player.state).assertEqual('released');
    
      logEnd('testAVPlayerState0002');
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0300
     * @tc.name      testAVPlayerState0003
     * @tc.desc      Verify two independently created players are distinct and both start idle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testAVPlayerState0003');
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
    
      logEnd('testAVPlayerState0003');
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0400
     * @tc.name      testAVPlayerState0004
     * @tc.desc      Verify creating and releasing several players keeps every instance independent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testAVPlayerState0004');
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
    
      logEnd('testAVPlayerState0004');
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_0900
     * @tc.name      testAVPlayerState0009
     * @tc.desc      Verify the loop flag defaults to false on a new player
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testAVPlayerState0009');
      const player: media.AVPlayer = await media.createAVPlayer();
      try {
        expect(player.loop).assertFalse();
        expect(typeof player.loop).assertEqual('boolean');
      } finally {
        await player.release();
      }
    
      logEnd('testAVPlayerState0009');
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_1000
     * @tc.name      testAVPlayerState0010
     * @tc.desc      Verify a new player exposes no video render target before one is attached
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testAVPlayerState0010');
      const player: media.AVPlayer = await media.createAVPlayer();
      try {
        expect(player.surfaceId === undefined || player.surfaceId === '').assertTrue();
        expect(player.state).assertEqual('idle');
      } finally {
        await player.release();
      }
    
      logEnd('testAVPlayerState0010');
    })

    /**
     * @tc.number    SUB_AVS_MEDIA_PLAYER_1200
     * @tc.name      testAVPlayerState0012
     * @tc.desc      Verify reading the state repeatedly does not change it while idle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVPlayerState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testAVPlayerState0012');
      const player: media.AVPlayer = await media.createAVPlayer();
      try {
        for (let i = 0; i < 100; i++) {
          expect(player.state).assertEqual('idle');
        }
      } finally {
        await player.release();
      }
    
      logEnd('testAVPlayerState0012');
    })
  });
}
