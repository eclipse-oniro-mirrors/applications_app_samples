/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { audio } from '@kit.AudioKit';
import { paceTurn } from '../Shared/TestPace';

const CREATE_ROUNDS: number = 30;
const START_ROUNDS: number = 20;
const PAUSE_ROUNDS: number = 10;

function optionsFor(usage: audio.StreamUsage): audio.AudioRendererOptions {
  const streamInfo: audio.AudioStreamInfo = {
    samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
    channels: audio.AudioChannel.CHANNEL_2,
    sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
    encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
  };
  const rendererInfo: audio.AudioRendererInfo = {
    usage: usage,
    rendererFlags: 0
  };
  return {
    streamInfo: streamInfo,
    rendererInfo: rendererInfo
  };
}

async function createFor(): Promise<audio.AudioRenderer> {
  const renderer: audio.AudioRenderer = await audio.createAudioRenderer(
    optionsFor(audio.StreamUsage.STREAM_USAGE_MEDIA));
  expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
  return renderer;
}

export default function audioLoopMatrixTest() {
  describe('audioLoopMatrixTest', () => {
    beforeAll(() => {
      console.info('audioLoopMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('audioLoopMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_STABILITY_AUDIO_0100
     * @tc.name      testAudioLoop0001
     * @tc.desc      Verify thirty create and release cycles all end released
     */
    it('testAudioLoop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < CREATE_ROUNDS; i++) {
        const renderer: audio.AudioRenderer = await createFor();
        await renderer.release();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
      }
    })

    /**
     * @tc.number    SUB_AVS_STABILITY_AUDIO_0200
     * @tc.name      testAudioLoop0002
     * @tc.desc      Verify twenty start and stop cycles keep the running and stopped states
     */
    it('testAudioLoop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createFor();
      try {
        for (let i = 0; i < START_ROUNDS; i++) {
          await renderer.start();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
          await renderer.stop();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
        }
      } finally {
        await renderer.release();
      }
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_STABILITY_AUDIO_0300
     * @tc.name      testAudioLoop0003
     * @tc.desc      Verify ten pause and resume cycles keep the paused and running states
     */
    it('testAudioLoop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createFor();
      try {
        await renderer.start();
        for (let i = 0; i < PAUSE_ROUNDS; i++) {
          await renderer.pause();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_PAUSED);
          await renderer.start();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
        }
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_STABILITY_AUDIO_0400
     * @tc.name      testAudioLoop0004
     * @tc.desc      Verify repeated create and release leaves no renderer running
     */
    it('testAudioLoop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 10; i++) {
        const renderer: audio.AudioRenderer = await createFor();
        await renderer.start();
        await renderer.release();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
      }
    })
  });
}
