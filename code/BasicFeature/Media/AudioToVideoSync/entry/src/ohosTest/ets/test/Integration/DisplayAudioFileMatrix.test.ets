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
import { audio } from '@kit.AudioKit';
import { display } from '@kit.ArkUI';
import { fileIo } from '@kit.CoreFileKit';
import { paceTurn } from '../Shared/TestPace';
import { CommonConstants } from '../../../../main/ets/common/CommonConstants';
import {
  pathInFiles,
  readTextFile,
  removeQuietly,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

function viewportHeight(width: number): number {
  return width * CommonConstants.DEFAULT_HEIGHT / CommonConstants.DEFAULT_WIDTH;
}

function rendererFor(usage: audio.StreamUsage): Promise<audio.AudioRenderer> {
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
  return audio.createAudioRenderer({
    streamInfo: streamInfo,
    rendererInfo: rendererInfo
  });
}

export default function displayAudioFileMatrixTest() {
  describe('displayAudioFileMatrixTest', () => {
    beforeAll(() => {
      console.info('displayAudioFileMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('displayAudioFileMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_INTEGRATION_DAF_0100
     * @tc.name      testDisplayAudioFile0001
     * @tc.desc      Verify a media renderer and a file payload stay consistent at the 720-pixel width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayAudioFile0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const width: number = 720;
      const path: string = pathInFiles(uniqueName('avs_daf_720', '.txt'));
      const renderer: audio.AudioRenderer = await rendererFor(audio.StreamUsage.STREAM_USAGE_MEDIA);
      try {
        expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        expect(writeTextFile(path, `${width}`)).assertEqual(3);
        expect(readTextFile(path, 3)).assertEqual('720');
        expect(viewportHeight(width) / width).assertClose(9 / 16, 1e-9);
      } finally {
        await renderer.release();
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_DAF_0200
     * @tc.name      testDisplayAudioFile0002
     * @tc.desc      Verify a movie renderer and a file payload stay consistent at the 360-pixel width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayAudioFile0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const width: number = 360;
      const path: string = pathInFiles(uniqueName('avs_daf_360', '.txt'));
      const renderer: audio.AudioRenderer = await rendererFor(audio.StreamUsage.STREAM_USAGE_MOVIE);
      try {
        expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        writeTextFile(path, `w${width}`);
        expect(fileIo.statSync(path).size).assertEqual(4);
        expect(readTextFile(path, 4)).assertEqual('w360');
        expect(viewportHeight(width)).assertClose(202.5, 1e-9);
      } finally {
        await renderer.release();
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_DAF_0300
     * @tc.name      testDisplayAudioFile0003
     * @tc.desc      Verify a game renderer and a file payload stay consistent at the 1080-pixel width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayAudioFile0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const width: number = 1080;
      const path: string = pathInFiles(uniqueName('avs_daf_1080', '.txt'));
      const renderer: audio.AudioRenderer = await rendererFor(audio.StreamUsage.STREAM_USAGE_GAME);
      try {
        await renderer.start();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
        writeTextFile(path, `${width}`);
        expect(readTextFile(path, 4)).assertEqual('1080');
        expect(viewportHeight(width)).assertClose(607.5, 1e-9);
        await renderer.stop();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
      } finally {
        await renderer.release();
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_DAF_0400
     * @tc.name      testDisplayAudioFile0004
     * @tc.desc      Verify the width and usage matrix keeps the viewport ratio and the renderer prepared
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayAudioFile0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const widths: number[] = [360, 720, 1080];
      const usages: audio.StreamUsage[] = [
        audio.StreamUsage.STREAM_USAGE_MEDIA,
        audio.StreamUsage.STREAM_USAGE_MOVIE,
        audio.StreamUsage.STREAM_USAGE_GAME
      ];
      for (let i = 0; i < widths.length; i++) {
        for (let j = 0; j < usages.length; j++) {
          const path: string = pathInFiles(uniqueName(`avs_daf_${widths[i]}_${j}`, '.txt'));
          const renderer: audio.AudioRenderer = await rendererFor(usages[j]);
          try {
            expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
            expect(viewportHeight(widths[i]) / widths[i]).assertClose(9 / 16, 1e-9);
            writeTextFile(path, `${widths[i]}-${j}`);
            expect(readTextFile(path, `${widths[i]}-${j}`.length)).assertEqual(`${widths[i]}-${j}`);
          } finally {
            await renderer.release();
            removeQuietly(path);
          }
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_DAF_0500
     * @tc.name      testDisplayAudioFile0005
     * @tc.desc      Verify the real display width still produces the expected viewport ratio
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayAudioFile0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const screen: display.Display = display.getDefaultDisplaySync();
      const path: string = pathInFiles(uniqueName('avs_daf_real', '.txt'));
      const renderer: audio.AudioRenderer = await rendererFor(audio.StreamUsage.STREAM_USAGE_MEDIA);
      try {
        writeTextFile(path, `${screen.width}`);
        expect(readTextFile(path, `${screen.width}`.length)).assertEqual(`${screen.width}`);
        expect(viewportHeight(screen.width) / screen.width).assertClose(9 / 16, 1e-9);
        expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
      } finally {
        await renderer.release();
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_DAF_0600
     * @tc.name      testDisplayAudioFile0006
     * @tc.desc      Verify the renderer reaches a terminal released state after the file pipeline completes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayAudioFile0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const path: string = pathInFiles(uniqueName('avs_daf_terminal', '.txt'));
      const renderer: audio.AudioRenderer = await rendererFor(audio.StreamUsage.STREAM_USAGE_MOVIE);
      try {
        writeTextFile(path, 'terminal');
        expect(fileIo.statSync(path).size).assertEqual(8);
        await renderer.start();
        await renderer.stop();
      } finally {
        await renderer.release();
        removeQuietly(path);
      }
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })
  });
}
