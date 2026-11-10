/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { media } from '@kit.MediaKit';
import { paceTurn } from '../Shared/TestPace';

async function idlePlayer(): Promise<media.AVPlayer> {
  const player: media.AVPlayer = await media.createAVPlayer();
  expect(player.state).assertEqual('idle');
  return player;
}

async function settle(action: Promise<void> | void): Promise<void> {
  try {
    await action;
  } catch (error) {
    console.info('operation rejected as expected or tolerated');
  }
}

export default function mediaErrorMatrixTest() {
  describe('mediaErrorMatrixTest', () => {
    beforeAll(() => {
      console.info('mediaErrorMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('mediaErrorMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_MEDIA_0100
     * @tc.name      testMediaError0001
     * @tc.desc      Verify a play attempt on an idle player leaves it idle
     */
    it('testMediaError0001', 0, async () => {
      const player: media.AVPlayer = await idlePlayer();
      try {
        await settle(player.play());
        expect(player.state).assertEqual('idle');
      } finally {
        await player.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_MEDIA_0200
     * @tc.name      testMediaError0002
     * @tc.desc      Verify a pause attempt on an idle player leaves it idle
     */
    it('testMediaError0002', 0, async () => {
      const player: media.AVPlayer = await idlePlayer();
      try {
        await settle(player.pause());
        expect(player.state).assertEqual('idle');
      } finally {
        await player.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_MEDIA_0300
     * @tc.name      testMediaError0003
     * @tc.desc      Verify a stop attempt on an idle player leaves it idle
     */
    it('testMediaError0003', 0, async () => {
      const player: media.AVPlayer = await idlePlayer();
      try {
        await settle(player.stop());
        expect(player.state).assertEqual('idle');
      } finally {
        await player.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_MEDIA_0500
     * @tc.name      testMediaError0005
     * @tc.desc      Verify a seek attempt on an idle player leaves it idle
     */
    it('testMediaError0005', 0, async () => {
      const player: media.AVPlayer = await idlePlayer();
      try {
        await settle(player.seek(100, media.SeekMode.SEEK_PREV_SYNC));
        expect(player.state).assertEqual('idle');
      } finally {
        await player.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_MEDIA_0600
     * @tc.name      testMediaError0006
     * @tc.desc      Verify reset after release keeps the terminal released state
     */
    it('testMediaError0006', 0, async () => {
      const player: media.AVPlayer = await idlePlayer();
      await player.release();
      await settle(player.reset());
      expect(player.state).assertEqual('released');
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_MEDIA_0700
     * @tc.name      testMediaError0007
     * @tc.desc      Verify play after release keeps the terminal released state
     */
    it('testMediaError0007', 0, async () => {
      const player: media.AVPlayer = await idlePlayer();
      await player.release();
      await settle(player.play());
      expect(player.state).assertEqual('released');
    })

    /**
     * @tc.number    SUB_AVS_ROBUSTNESS_MEDIA_0800
     * @tc.name      testMediaError0008
     * @tc.desc      Verify two idle players are independent and both reject playback without changing state
     */
    it('testMediaError0008', 0, async () => {
      const first: media.AVPlayer = await idlePlayer();
      const second: media.AVPlayer = await idlePlayer();
      try {
        await settle(first.play());
        expect(first.state).assertEqual('idle');
        expect(second.state).assertEqual('idle');
        await settle(second.pause());
        expect(second.state).assertEqual('idle');
      } finally {
        await first.release();
        await second.release();
      }
      expect(first.state).assertEqual('released');
      expect(second.state).assertEqual('released');
    })
  });
}
