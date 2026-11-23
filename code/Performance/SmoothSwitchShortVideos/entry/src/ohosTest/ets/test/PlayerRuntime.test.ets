/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { media } from '@kit.MediaKit';
import { describe, it, expect } from '@ohos/hypium';
import { AVPlayerState } from '../../../main/ets/model/AVPlayerState';
import { pauseVideo, playVideo, releaseVideo, setSeek, stopVideo } from '../../../main/ets/common/utils/CommonUtils';

async function waitForRelease(player: media.AVPlayer): Promise<void> {
  for (let attempt = 0; attempt < 30; attempt++) {
    if (player.state === AVPlayerState.RELEASED) {
      return;
    }
    await new Promise<void>((resolve) => setTimeout(() => resolve(), 50));
  }
  throw new Error(`Player did not release; final state: ${player.state}`);
}

export default function playerRuntimeTest(): void {
  describe('ShortVideoPlayerRuntime', (): void => {
    it('newPlayerStaysIdleWhenPlaySeekAndStopAreGated', 0, async (): Promise<void> => {
      const player = await media.createAVPlayer();
      try {
        expect(player.state).assertEqual(AVPlayerState.IDLE);
        await playVideo(player, 0, 0);
        setSeek(player, 500);
        await stopVideo(player, 0, 0);
        expect(player.state).assertEqual(AVPlayerState.IDLE);
      } finally {
        await player.release();
      }
    });

    it('pauseInIdleCompletesWithoutChangingState', 0, async (): Promise<void> => {
      const player = await media.createAVPlayer();
      try {
        await pauseVideo(player, 0, 0);
        expect(player.state).assertEqual(AVPlayerState.IDLE);
      } finally {
        await player.release();
      }
    });

    it('releaseHelperReleasesAnActualMediaPlayer', 0, async (): Promise<void> => {
      const player = await media.createAVPlayer();
      try {
        releaseVideo(player, 0, 0);
        await waitForRelease(player);
        expect(player.state).assertEqual(AVPlayerState.RELEASED);
      } finally {
        if (player.state !== AVPlayerState.RELEASED) {
          await player.release();
        }
      }
    });

    it('helpersAcceptMissingPlayerDuringStartupOrDisposal', 0, async (): Promise<void> => {
      // A rejection or exception fails this case; these APIs do not return a value.
      await playVideo(undefined, 0, 0);
      await pauseVideo(undefined, 1, 0);
      await stopVideo(undefined, 1, 0);
      setSeek(undefined, 2000);
      releaseVideo(undefined, 1, 0);
    });
  });
}
