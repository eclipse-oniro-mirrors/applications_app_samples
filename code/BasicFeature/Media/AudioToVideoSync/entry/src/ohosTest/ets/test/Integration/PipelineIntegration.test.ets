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
import { audio } from '@kit.AudioKit';
import { display } from '@kit.ArkUI';
import { fileIo } from '@kit.CoreFileKit';
import { systemDateTime } from '@kit.BasicServicesKit';
import { paceTurn } from '../Shared/TestPace';
import { CommonConstants } from '../../../../main/ets/common/CommonConstants';
import {
  pathInFiles,
  readTextFile,
  removeQuietly,
  repeatPayload,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

function viewportHeight(width: number): number {
  return width * CommonConstants.DEFAULT_HEIGHT / CommonConstants.DEFAULT_WIDTH;
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

export default function pipelineIntegrationTest() {
  describe('pipelineIntegrationTest', () => {
    beforeAll(() => {
      console.info('pipelineIntegrationTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('pipelineIntegrationTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_INTEGRATION_0100
     * @tc.name      testPipelineIntegration0001
     * @tc.desc      Verify the file pipeline write, stat, read, copy, rename and delete keeps content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPipelineIntegration0001', 0, () => {
      const source: string = pathInFiles(uniqueName('avs_pipe_src', '.txt'));
      const copy: string = pathInFiles(uniqueName('avs_pipe_copy', '.txt'));
      const renamed: string = pathInFiles(uniqueName('avs_pipe_renamed', '.txt'));
      const payload: string = repeatPayload(300, 'integration');
      try {
        expect(writeTextFile(source, payload)).assertEqual(300);
        expect(fileIo.statSync(source).size).assertEqual(300);
        expect(readTextFile(source, 300)).assertEqual(payload);
        fileIo.copyFileSync(source, copy);
        expect(readTextFile(copy, 300)).assertEqual(payload);
        fileIo.renameSync(copy, renamed);
        expect(fileIo.statSync(renamed).size).assertEqual(300);
        expect(readTextFile(renamed, 300)).assertEqual(payload);
        fileIo.unlinkSync(renamed);
        expect(fileIo.accessSync(renamed)).assertFalse();
      } finally {
        removeQuietly(source);
        removeQuietly(copy);
        removeQuietly(renamed);
      }
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_0200
     * @tc.name      testPipelineIntegration0002
     * @tc.desc      Verify the audio renderer lifecycle can run while a file round trip is in flight
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPipelineIntegration0002', 0, async () => {
      const path: string = pathInFiles(uniqueName('avs_pipe_audio', '.txt'));
      const renderer: audio.AudioRenderer = await audio.createAudioRenderer(rendererOptions());
      try {
        expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        await renderer.start();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
        writeTextFile(path, 'while-running');
        expect(readTextFile(path, 13)).assertEqual('while-running');
        await renderer.pause();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_PAUSED);
        await renderer.stop();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
      } finally {
        await renderer.release();
        removeQuietly(path);
      }
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_0300
     * @tc.name      testPipelineIntegration0003
     * @tc.desc      Verify the display width drives the viewport height consistently with the file payload size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPipelineIntegration0003', 0, () => {
      const screen: display.Display = display.getDefaultDisplaySync();
      const height: number = viewportHeight(screen.width);
      const path: string = pathInFiles(uniqueName('avs_pipe_layout', '.txt'));
      try {
        expect(height).assertLarger(0);
        expect(height).assertClose(screen.width * 9 / 16, 1e-9);
        writeTextFile(path, 'layout');
        expect(fileIo.statSync(path).size).assertEqual(6);
        expect(height).assertLarger(fileIo.statSync(path).size);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_0400
     * @tc.name      testPipelineIntegration0004
     * @tc.desc      Verify the uptime clock brackets a complete file and audio pipeline without regressing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPipelineIntegration0004', 0, async () => {
      const path: string = pathInFiles(uniqueName('avs_pipe_clock', '.txt'));
      const before: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      const renderer: audio.AudioRenderer = await audio.createAudioRenderer(rendererOptions());
      try {
        writeTextFile(path, 'clock');
        expect(readTextFile(path, 5)).assertEqual('clock');
        await renderer.start();
        await renderer.stop();
      } finally {
        await renderer.release();
        removeQuietly(path);
      }
      const after: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      expect(after).assertLargerOrEqual(before);
      expect(after - before).assertLess(5000);
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_0500
     * @tc.name      testPipelineIntegration0005
     * @tc.desc      Verify two independent pipelines keep their own files and renderers isolated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPipelineIntegration0005', 0, async () => {
      const firstPath: string = pathInFiles(uniqueName('avs_pipe_first', '.txt'));
      const secondPath: string = pathInFiles(uniqueName('avs_pipe_second', '.txt'));
      const firstRenderer: audio.AudioRenderer = await audio.createAudioRenderer(rendererOptions());
      const secondRenderer: audio.AudioRenderer = await audio.createAudioRenderer(rendererOptions());
      try {
        writeTextFile(firstPath, 'first-pipe');
        writeTextFile(secondPath, 'second-pipe');
        await firstRenderer.start();
        expect(firstRenderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
        expect(secondRenderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        expect(readTextFile(firstPath, 10)).assertEqual('first-pipe');
        expect(readTextFile(secondPath, 11)).assertEqual('second-pipe');
        fileIo.unlinkSync(firstPath);
        expect(fileIo.accessSync(firstPath)).assertFalse();
        expect(fileIo.accessSync(secondPath)).assertTrue();
      } finally {
        await firstRenderer.release();
        await secondRenderer.release();
        removeQuietly(firstPath);
        removeQuietly(secondPath);
      }
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_0600
     * @tc.name      testPipelineIntegration0006
     * @tc.desc      Verify the full pipeline can be repeated three times with identical outcomes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPipelineIntegration0006', 0, async () => {
      for (let round = 0; round < 3; round++) {
        const path: string = pathInFiles(uniqueName(`avs_pipe_round_${round}`, '.txt'));
        const renderer: audio.AudioRenderer = await audio.createAudioRenderer(rendererOptions());
        try {
          writeTextFile(path, `round-${round}`);
          expect(readTextFile(path, 7)).assertEqual(`round-${round}`);
          await renderer.start();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
          await renderer.stop();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
        } finally {
          await renderer.release();
          removeQuietly(path);
        }
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
      }
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_0700
     * @tc.name      testPipelineIntegration0007
     * @tc.desc      Verify a truncated file and a released renderer remain consistent after teardown
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPipelineIntegration0007', 0, async () => {
      const path: string = pathInFiles(uniqueName('avs_pipe_truncate', '.txt'));
      const renderer: audio.AudioRenderer = await audio.createAudioRenderer(rendererOptions());
      try {
        writeTextFile(path, repeatPayload(512, 'truncate'));
        expect(fileIo.statSync(path).size).assertEqual(512);
        fileIo.truncateSync(path, 128);
        expect(fileIo.statSync(path).size).assertEqual(128);
        expect(readTextFile(path, 128).length).assertEqual(128);
      } finally {
        await renderer.release();
        removeQuietly(path);
      }
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_0800
     * @tc.name      testPipelineIntegration0008
     * @tc.desc      Verify the pipeline keeps the 16:9 viewport invariant across three display samples
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPipelineIntegration0008', 0, () => {
      const widths: number[] = [360, 720, 1080];
      for (let i = 0; i < widths.length; i++) {
        const height: number = viewportHeight(widths[i]);
        expect(height).assertLarger(0);
        expect(height / widths[i]).assertClose(9 / 16, 1e-9);
        const path: string = pathInFiles(uniqueName(`avs_pipe_width_${widths[i]}`, '.txt'));
        try {
          writeTextFile(path, `${widths[i]}`);
          expect(readTextFile(path, `${widths[i]}`.length)).assertEqual(`${widths[i]}`);
        } finally {
          removeQuietly(path);
        }
      }
    })
  });
}
