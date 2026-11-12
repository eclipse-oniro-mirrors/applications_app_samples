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
import { describe, it, expect, beforeEach, Level, Size, TestType } from '@ohos/hypium';
import { audio } from '@kit.AudioKit';
import Utils from '../Util.test';
import { DefaultKeyboardController } from '../../../main/ets/common/controllers/KeyboardSoundController';
import { AudioConstants } from '../../../main/ets/common/constants/AudioConstants';
import Logger from '../../../main/ets/common/utils/Logger';

export default function KeyboardSoundTest(): void {
  describe('KeyboardSoundTest', () => {
    beforeEach(async () => {
      await Utils.msSleep(30);
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_0100
     * @tc.name      testKeyboardSoundAudioConstants0001
     * @tc.desc      Audio constants keep the S16 stereo frame layout and key sound timing.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundAudioConstants0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(AudioConstants.SAMPLE_RATE).assertEqual(44100);
      expect(AudioConstants.CHANNELS).assertEqual(2);
      expect(AudioConstants.BYTES_PER_SAMPLE).assertEqual(2);
      expect(AudioConstants.FRAME_SIZE).assertEqual(4);
      expect(AudioConstants.KEY_SOUND_FREQUENCY).assertEqual(1000);
      expect(AudioConstants.AMPLITUDE).assertEqual(0.3);
      expect(AudioConstants.KEY_SOUND_DURATION_MS).assertEqual(150);
      expect(AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION).assertEqual(30);
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_0200
     * @tc.name      testKeyboardSoundDefaultLifecycle0002
     * @tc.desc      Default controller supports init, play, release and re-init lifecycle.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundDefaultLifecycle0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const controller = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.init();
        await controller.play();
        await controller.release();
        await controller.init();
        await controller.release();
      } catch (err) {
        hasError = true;
      }
      expect(hasError).assertFalse();
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_0300
     * @tc.name      testKeyboardSoundPlayBeforeInit0003
     * @tc.desc      Play before init returns silently without touching any renderer.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundPlayBeforeInit0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const controller = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
      } catch (err) {
        hasError = true;
      }
      expect(hasError).assertFalse();
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_0400
     * @tc.name      testKeyboardSoundFrameAlignedWrite0004
     * @tc.desc      Started MUSIC renderer delivers non-empty frame aligned writeData buffers.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundFrameAlignedWrite0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const renderer = await audio.createAudioRenderer(Utils.getMusicRendererOptions());
      let received = false;
      let frameAligned = false;
      renderer.on('writeData', (buf: ArrayBuffer) => {
        received = true;
        frameAligned = buf.byteLength > 0 && buf.byteLength % AudioConstants.FRAME_SIZE === 0;
      });
      await renderer.start();
      await Utils.msSleep(200);
      await renderer.stop();
      await renderer.release();
      expect(received).assertTrue();
      expect(frameAligned).assertTrue();
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_0500
     * @tc.name      testKeyboardSoundDefaultStrategy0005
     * @tc.desc      MUSIC renderer accepts the CONCURRENCY_DEFAULT independent session strategy.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundDefaultStrategy0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const renderer = await audio.createAudioRenderer(Utils.getMusicRendererOptions());
      expect(renderer != null).assertTrue();
      let hasError = false;
      try {
        renderer.setIndependentAudioSessionStrategy({
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }, audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR);
      } catch (err) {
        hasError = true;
      }
      await renderer.release();
      expect(hasError).assertFalse();
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_0600
     * @tc.name      testKeyboardSoundConcurrentPlay0006
     * @tc.desc      Default MUSIC renderer survives rapid replays: a later play and release succeed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundConcurrentPlay0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const controller = new DefaultKeyboardController();
      await controller.init();
      const results = await Promise.allSettled([controller.play(), controller.play()]);
      const fulfilledCount =
        results.filter((r: PromiseSettledResult<void>): boolean => r.status === 'fulfilled').length;
      expect(fulfilledCount >= 1).assertTrue();
      let replayOk = false;
      try {
        await controller.play();
        replayOk = true;
      } catch (err) {
        replayOk = false;
      }
      expect(replayOk).assertTrue();
      let releaseOk = false;
      try {
        await controller.release();
        releaseOk = true;
      } catch (err) {
        releaseOk = false;
      }
      expect(releaseOk).assertTrue();
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_0700
     * @tc.name      testKeyboardSoundLoggerMethods0007
     * @tc.desc      Logger info, error and debug write hilog without throwing.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundLoggerMethods0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let hasError = false;
      try {
        Logger.info('keyboard sound test info');
        Logger.error('keyboard sound test error');
        Logger.debug('keyboard sound test debug');
      } catch (err) {
        hasError = true;
      }
      expect(hasError).assertFalse();
    })
  })
}
