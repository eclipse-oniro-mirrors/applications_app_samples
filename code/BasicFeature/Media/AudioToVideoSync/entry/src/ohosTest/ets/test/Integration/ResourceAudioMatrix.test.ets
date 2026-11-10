/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { audio } from '@kit.AudioKit';
import { application, common } from '@kit.AbilityKit';
import { paceTurn } from '../Shared/TestPace';
import { appContext } from '../Shared/TestSupport';

const RAW_NAME: string = 'test.mp4';
const TEST_MODULE: string = 'entry_test';

let moduleContext: common.Context | null = null;

async function context(): Promise<common.Context> {
  if (moduleContext === null) {
    moduleContext = await application.createModuleContext(appContext().getApplicationContext(), TEST_MODULE);
  }
  return moduleContext;
}

function rendererOptions(): audio.AudioRendererOptions {
  const streamInfo: audio.AudioStreamInfo = {
    samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
    channels: audio.AudioChannel.CHANNEL_2,
    sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
    encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
  };
  const rendererInfo: audio.AudioRendererInfo = {
    usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
    rendererFlags: 0
  };
  return {
    streamInfo: streamInfo,
    rendererInfo: rendererInfo
  };
}

export default function resourceAudioMatrixTest() {
  describe('resourceAudioMatrixTest', () => {
    beforeAll(() => {
      console.info('resourceAudioMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('resourceAudioMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_INTEGRATION_RES_0100
     * @tc.name      testResourceAudio0001
     * @tc.desc      Verify the bundled raw video exposes a positive descriptor and byte range
     */
    it('testResourceAudio0001', 0, async () => {
      const ctx: common.Context = await context();
      const raw = ctx.resourceManager.getRawFdSync(RAW_NAME);
      try {
        expect(raw.fd).assertLarger(0);
        expect(raw.offset).assertLargerOrEqual(0);
        expect(raw.length).assertLarger(0);
        expect(raw.length).assertLess(1024 * 1024);
      } finally {
        try {
          ctx.resourceManager.closeRawFdSync(RAW_NAME);
        } catch (error) {
          console.info('raw already closed');
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_RES_0200
     * @tc.name      testResourceAudio0002
     * @tc.desc      Verify an audio renderer can be prepared and released while the raw file is open
     */
    it('testResourceAudio0002', 0, async () => {
      const ctx: common.Context = await context();
      const raw = ctx.resourceManager.getRawFdSync(RAW_NAME);
      const renderer: audio.AudioRenderer = await audio.createAudioRenderer(rendererOptions());
      try {
        expect(raw.length).assertLarger(0);
        expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        await renderer.start();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
      } finally {
        await renderer.release();
        try {
          ctx.resourceManager.closeRawFdSync(RAW_NAME);
        } catch (error) {
          console.info('raw already closed');
        }
      }
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_RES_0300
     * @tc.name      testResourceAudio0003
     * @tc.desc      Verify two sequential raw descriptor lookups both stay valid
     */
    it('testResourceAudio0003', 0, async () => {
      const ctx: common.Context = await context();
      const first = ctx.resourceManager.getRawFdSync(RAW_NAME);
      expect(first.fd).assertLarger(0);
      expect(first.length).assertLarger(0);
      ctx.resourceManager.closeRawFdSync(RAW_NAME);
      const second = ctx.resourceManager.getRawFdSync(RAW_NAME);
      try {
        expect(second.fd).assertLarger(0);
        expect(second.length).assertEqual(first.length);
      } finally {
        try {
          ctx.resourceManager.closeRawFdSync(RAW_NAME);
        } catch (error) {
          console.info('raw already closed');
        }
      }
    })
  });
}
