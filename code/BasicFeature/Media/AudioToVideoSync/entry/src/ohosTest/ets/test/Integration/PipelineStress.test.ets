/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { audio } from '@kit.AudioKit';
import { fileIo } from '@kit.CoreFileKit';
import { paceTurn } from '../Shared/TestPace';
import {
  encodeText,
  pathInFiles,
  readTextFile,
  removeQuietly,
  repeatPayload,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

function optionsFor(): audio.AudioRendererOptions {
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

export default function pipelineStressTest() {
  describe('pipelineStressTest', () => {
    beforeAll(() => {
      console.info('pipelineStressTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('pipelineStressTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_STRESS_0100
     * @tc.name      testPipelineStress0001
     * @tc.desc      Verify three rounds of write, append, truncate and read keep exact sizes
     */
    it('testPipelineStress0001', 0, () => {
      for (let round = 0; round < 3; round++) {
        const path: string = pathInFiles(uniqueName(`avs_stress_file_${round}`, '.txt'));
        try {
          writeTextFile(path, repeatPayload(1024, 'a'));
          const append: fileIo.File = fileIo.openSync(path,
            fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.APPEND);
          fileIo.writeSync(append.fd, encodeText(repeatPayload(1024, 'b')));
          fileIo.closeSync(append);
          expect(fileIo.statSync(path).size).assertEqual(2048);
          fileIo.truncateSync(path, 512);
          expect(fileIo.statSync(path).size).assertEqual(512);
          expect(readTextFile(path, 512).length).assertEqual(512);
        } finally {
          removeQuietly(path);
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_STRESS_0200
     * @tc.name      testPipelineStress0002
     * @tc.desc      Verify five audio lifecycle rounds all end in the released state
     */
    it('testPipelineStress0002', 0, async () => {
      for (let round = 0; round < 5; round++) {
        const renderer: audio.AudioRenderer = await audio.createAudioRenderer(optionsFor());
        try {
          expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
          await renderer.start();
          await renderer.pause();
          await renderer.start();
          await renderer.stop();
        } finally {
          await renderer.release();
        }
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
      }
    })

    /**
     * @tc.number    SUB_AVS_STRESS_0300
     * @tc.name      testPipelineStress0003
     * @tc.desc      Verify a combined audio and file round trip repeats with identical outcomes
     */
    it('testPipelineStress0003', 0, async () => {
      for (let round = 0; round < 3; round++) {
        const path: string = pathInFiles(uniqueName(`avs_stress_combo_${round}`, '.txt'));
        const renderer: audio.AudioRenderer = await audio.createAudioRenderer(optionsFor());
        try {
          const payload: string = `round-${round}`;
          writeTextFile(path, payload);
          expect(readTextFile(path, payload.length)).assertEqual(payload);
          await renderer.start();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
          await renderer.stop();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
        } finally {
          await renderer.release();
          removeQuietly(path);
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_STRESS_0400
     * @tc.name      testPipelineStress0004
     * @tc.desc      Verify ten alternating write and read rounds report the requested size each time
     */
    it('testPipelineStress0004', 0, () => {
      const path: string = pathInFiles(uniqueName('avs_stress_alt', '.txt'));
      try {
        for (let round = 0; round < 10; round++) {
          const size: number = (round + 1) * 32;
          writeTextFile(path, repeatPayload(size, 'r'));
          expect(fileIo.statSync(path).size).assertEqual(size);
          expect(readTextFile(path, size).length).assertEqual(size);
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_STRESS_0500
     * @tc.name      testPipelineStress0005
     * @tc.desc      Verify five copy, rename and delete cycles preserve the payload until deletion
     */
    it('testPipelineStress0005', 0, () => {
      for (let round = 0; round < 5; round++) {
        const source: string = pathInFiles(uniqueName(`avs_stress_src_${round}`, '.txt'));
        const copy: string = pathInFiles(uniqueName(`avs_stress_copy_${round}`, '.txt'));
        const renamed: string = pathInFiles(uniqueName(`avs_stress_renamed_${round}`, '.txt'));
        try {
          const payload: string = repeatPayload(200, 'p');
          writeTextFile(source, payload);
          fileIo.copyFileSync(source, copy);
          fileIo.renameSync(copy, renamed);
          expect(fileIo.statSync(renamed).size).assertEqual(200);
          expect(readTextFile(renamed, 200)).assertEqual(payload);
          fileIo.unlinkSync(renamed);
          expect(fileIo.accessSync(renamed)).assertFalse();
        } finally {
          removeQuietly(source);
          removeQuietly(copy);
          removeQuietly(renamed);
        }
      }
    })
  });
}
