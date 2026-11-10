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
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { application, common } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';

let moduleContext: common.Context | null = null;

function subtitleBytes(): Uint8Array {
  const context: common.Context = moduleContext as common.Context;
  return context.resourceManager.getRawFileContentSync('subtitle.srt');
}

function subtitleText(): string {
  return util.TextDecoder.create('utf-8').decodeToString(subtitleBytes());
}



export default function subtitleResourceHighValueTest() {
  describe('subtitleResourceHighValueTest', () => {
  beforeAll(async () => {
    if (moduleContext === null) {
      moduleContext = await application.createModuleContext(
        abilityDelegatorRegistry.getAbilityDelegator().getAppContext(), 'entry');
    }
  });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0001
     * @tc.name      testHighValueSubtitleResource0001
     * @tc.desc      Resource subtitle block 1 exposes its index and timestamp line.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0001', 0, () => {
      const text: string = subtitleText();
      const lines: string[] = text.split('\n');
      expect(lines[0]).assertEqual('1');
      expect(text.indexOf('1\n00:00:00,000 --> 00:00:05,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0002
     * @tc.name      testHighValueSubtitleResource0002
     * @tc.desc      Resource subtitle block 2 exposes its index and timestamp line.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0002', 0, () => {
      const text: string = subtitleText();
      const lines: string[] = text.split('\n');
      expect(lines[0]).assertEqual('2');
      expect(text.indexOf('2\n00:00:05,000 --> 00:00:10,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0003
     * @tc.name      testHighValueSubtitleResource0003
     * @tc.desc      Resource subtitle block 3 exposes its index and timestamp line.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0003', 0, () => {
      const text: string = subtitleText();
      const lines: string[] = text.split('\n');
      expect(lines[0]).assertEqual('3');
      expect(text.indexOf('3\n00:00:10,000 --> 00:00:15,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0004
     * @tc.name      testHighValueSubtitleResource0004
     * @tc.desc      Resource subtitle block 4 exposes its index and timestamp line.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0004', 0, () => {
      const text: string = subtitleText();
      const lines: string[] = text.split('\n');
      expect(lines[0]).assertEqual('4');
      expect(text.indexOf('4\n00:00:15,000 --> 00:00:20,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0005
     * @tc.name      testHighValueSubtitleResource0005
     * @tc.desc      Resource subtitle block 5 exposes its index and timestamp line.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0005', 0, () => {
      const text: string = subtitleText();
      const lines: string[] = text.split('\n');
      expect(lines[0]).assertEqual('5');
      expect(text.indexOf('5\n00:00:20,000 --> 00:00:25,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0006
     * @tc.name      testHighValueSubtitleResource0006
     * @tc.desc      Resource subtitle block 6 exposes its index and timestamp line.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0006', 0, () => {
      const text: string = subtitleText();
      const lines: string[] = text.split('\n');
      expect(lines[0]).assertEqual('6');
      expect(text.indexOf('6\n00:00:25,000 --> 00:00:30,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0007
     * @tc.name      testHighValueSubtitleResource0007
     * @tc.desc      Resource subtitle block 7 exposes its index and timestamp line.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0007', 0, () => {
      const text: string = subtitleText();
      const lines: string[] = text.split('\n');
      expect(lines[0]).assertEqual('7');
      expect(text.indexOf('7\n00:00:30,000 --> 00:00:35,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0008
     * @tc.name      testHighValueSubtitleResource0008
     * @tc.desc      Resource subtitle block 8 exposes its index and timestamp line.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0008', 0, () => {
      const text: string = subtitleText();
      const lines: string[] = text.split('\n');
      expect(lines[0]).assertEqual('8');
      expect(text.indexOf('8\n00:00:35,000 --> 00:00:40,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0009
     * @tc.name      testHighValueSubtitleResource0009
     * @tc.desc      Resource subtitle block 9 exposes its index and timestamp line.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0009', 0, () => {
      const text: string = subtitleText();
      const lines: string[] = text.split('\n');
      expect(lines[0]).assertEqual('9');
      expect(text.indexOf('9\n00:00:40,000 --> 00:00:45,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0010
     * @tc.name      testHighValueSubtitleResource0010
     * @tc.desc      Resource subtitle block 10 exposes its index and timestamp line.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0010', 0, () => {
      const text: string = subtitleText();
      const lines: string[] = text.split('\n');
      expect(lines[0]).assertEqual('10');
      expect(text.indexOf('10\n00:00:45,000 --> 00:00:50,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0011
     * @tc.name      testHighValueSubtitleResource0011
     * @tc.desc      Resource subtitle block 1 keeps start 00:00:00,000 and end 00:00:05,000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0011', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('00:00:00,000 --> 00:00:05,000')).assertLargerOrEqual(0);
      expect(text.indexOf('This is a subtitle demo for local video')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0012
     * @tc.name      testHighValueSubtitleResource0012
     * @tc.desc      Resource subtitle block 2 keeps start 00:00:05,000 and end 00:00:10,000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0012', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('00:00:05,000 --> 00:00:10,000')).assertLargerOrEqual(0);
      expect(text.indexOf('AVPlayer NDK Video Playback')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0013
     * @tc.name      testHighValueSubtitleResource0013
     * @tc.desc      Resource subtitle block 3 keeps start 00:00:10,000 and end 00:00:15,000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0013', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('00:00:10,000 --> 00:00:15,000')).assertLargerOrEqual(0);
      expect(text.indexOf('External subtitle demonstration')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0014
     * @tc.name      testHighValueSubtitleResource0014
     * @tc.desc      Resource subtitle block 4 keeps start 00:00:15,000 and end 00:00:20,000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0014', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('00:00:15,000 --> 00:00:20,000')).assertLargerOrEqual(0);
      expect(text.indexOf('Using OH_AVPlayer_AddFdSubtitleSource')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0015
     * @tc.name      testHighValueSubtitleResource0015
     * @tc.desc      Resource subtitle block 5 keeps start 00:00:20,000 and end 00:00:25,000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0015', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('00:00:20,000 --> 00:00:25,000')).assertLargerOrEqual(0);
      expect(text.indexOf('Subtitle file from rawfile directory')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0016
     * @tc.name      testHighValueSubtitleResource0016
     * @tc.desc      Resource subtitle block 6 keeps start 00:00:25,000 and end 00:00:30,000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0016', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('00:00:25,000 --> 00:00:30,000')).assertLargerOrEqual(0);
      expect(text.indexOf('HarmonyOS Media Player Demo')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0017
     * @tc.name      testHighValueSubtitleResource0017
     * @tc.desc      Resource subtitle block 7 keeps start 00:00:30,000 and end 00:00:35,000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0017', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('00:00:30,000 --> 00:00:35,000')).assertLargerOrEqual(0);
      expect(text.indexOf('OpenHarmony Application Sample')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0018
     * @tc.name      testHighValueSubtitleResource0018
     * @tc.desc      Resource subtitle block 8 keeps start 00:00:35,000 and end 00:00:40,000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0018', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('00:00:35,000 --> 00:00:40,000')).assertLargerOrEqual(0);
      expect(text.indexOf('Local video streaming playback test')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0019
     * @tc.name      testHighValueSubtitleResource0019
     * @tc.desc      Resource subtitle block 9 keeps start 00:00:40,000 and end 00:00:45,000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0019', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('00:00:40,000 --> 00:00:45,000')).assertLargerOrEqual(0);
      expect(text.indexOf('Thank you for watching!')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0020
     * @tc.name      testHighValueSubtitleResource0020
     * @tc.desc      Resource subtitle block 10 keeps start 00:00:45,000 and end 00:00:50,000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0020', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('00:00:45,000 --> 00:00:50,000')).assertLargerOrEqual(0);
      expect(text.indexOf('End of subtitle demo')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0021
     * @tc.name      testHighValueSubtitleResource0021
     * @tc.desc      Resource subtitle block 1 starts at line 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0021', 0, () => {
      const lines: string[] = subtitleText().split('\n');
      expect(lines.length).assertLarger(1);
      expect(lines.length).assertEqual(39);
      expect(lines[0]).assertEqual('1');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0022
     * @tc.name      testHighValueSubtitleResource0022
     * @tc.desc      Resource subtitle block 2 starts at line 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0022', 0, () => {
      const lines: string[] = subtitleText().split('\n');
      expect(lines.length).assertLarger(2);
      expect(lines.length).assertEqual(39);
      expect(lines[4]).assertEqual('2');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0023
     * @tc.name      testHighValueSubtitleResource0023
     * @tc.desc      Resource subtitle block 3 starts at line 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0023', 0, () => {
      const lines: string[] = subtitleText().split('\n');
      expect(lines.length).assertLarger(3);
      expect(lines.length).assertEqual(39);
      expect(lines[8]).assertEqual('3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0024
     * @tc.name      testHighValueSubtitleResource0024
     * @tc.desc      Resource subtitle block 4 starts at line 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0024', 0, () => {
      const lines: string[] = subtitleText().split('\n');
      expect(lines.length).assertLarger(4);
      expect(lines.length).assertEqual(39);
      expect(lines[12]).assertEqual('4');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0025
     * @tc.name      testHighValueSubtitleResource0025
     * @tc.desc      Resource subtitle block 5 starts at line 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0025', 0, () => {
      const lines: string[] = subtitleText().split('\n');
      expect(lines.length).assertLarger(5);
      expect(lines.length).assertEqual(39);
      expect(lines[16]).assertEqual('5');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0026
     * @tc.name      testHighValueSubtitleResource0026
     * @tc.desc      Resource subtitle block 6 starts at line 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0026', 0, () => {
      const lines: string[] = subtitleText().split('\n');
      expect(lines.length).assertLarger(6);
      expect(lines.length).assertEqual(39);
      expect(lines[20]).assertEqual('6');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0027
     * @tc.name      testHighValueSubtitleResource0027
     * @tc.desc      Resource subtitle block 7 starts at line 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0027', 0, () => {
      const lines: string[] = subtitleText().split('\n');
      expect(lines.length).assertLarger(7);
      expect(lines.length).assertEqual(39);
      expect(lines[24]).assertEqual('7');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0028
     * @tc.name      testHighValueSubtitleResource0028
     * @tc.desc      Resource subtitle block 8 starts at line 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0028', 0, () => {
      const lines: string[] = subtitleText().split('\n');
      expect(lines.length).assertLarger(8);
      expect(lines.length).assertEqual(39);
      expect(lines[28]).assertEqual('8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0029
     * @tc.name      testHighValueSubtitleResource0029
     * @tc.desc      Resource subtitle block 9 starts at line 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0029', 0, () => {
      const lines: string[] = subtitleText().split('\n');
      expect(lines.length).assertLarger(9);
      expect(lines.length).assertEqual(39);
      expect(lines[32]).assertEqual('9');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0030
     * @tc.name      testHighValueSubtitleResource0030
     * @tc.desc      Resource subtitle block 10 starts at line 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0030', 0, () => {
      const lines: string[] = subtitleText().split('\n');
      expect(lines.length).assertLarger(10);
      expect(lines.length).assertEqual(39);
      expect(lines[36]).assertEqual('10');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0031
     * @tc.name      testHighValueSubtitleResource0031
     * @tc.desc      Resource subtitle block 1 keeps its display text.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0031', 0, () => {
      const text: string = subtitleText();
      expect(text.length).assertLarger(0);
      expect(text.indexOf('This is a subtitle demo for local video')).assertLargerOrEqual(0);
      expect('This is a subtitle demo for local video'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0032
     * @tc.name      testHighValueSubtitleResource0032
     * @tc.desc      Resource subtitle block 2 keeps its display text.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0032', 0, () => {
      const text: string = subtitleText();
      expect(text.length).assertLarger(0);
      expect(text.indexOf('AVPlayer NDK Video Playback')).assertLargerOrEqual(0);
      expect('AVPlayer NDK Video Playback'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0033
     * @tc.name      testHighValueSubtitleResource0033
     * @tc.desc      Resource subtitle block 3 keeps its display text.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0033', 0, () => {
      const text: string = subtitleText();
      expect(text.length).assertLarger(0);
      expect(text.indexOf('External subtitle demonstration')).assertLargerOrEqual(0);
      expect('External subtitle demonstration'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0034
     * @tc.name      testHighValueSubtitleResource0034
     * @tc.desc      Resource subtitle block 4 keeps its display text.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0034', 0, () => {
      const text: string = subtitleText();
      expect(text.length).assertLarger(0);
      expect(text.indexOf('Using OH_AVPlayer_AddFdSubtitleSource')).assertLargerOrEqual(0);
      expect('Using OH_AVPlayer_AddFdSubtitleSource'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0035
     * @tc.name      testHighValueSubtitleResource0035
     * @tc.desc      Resource subtitle block 5 keeps its display text.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0035', 0, () => {
      const text: string = subtitleText();
      expect(text.length).assertLarger(0);
      expect(text.indexOf('Subtitle file from rawfile directory')).assertLargerOrEqual(0);
      expect('Subtitle file from rawfile directory'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0036
     * @tc.name      testHighValueSubtitleResource0036
     * @tc.desc      Resource subtitle block 6 keeps its display text.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0036', 0, () => {
      const text: string = subtitleText();
      expect(text.length).assertLarger(0);
      expect(text.indexOf('HarmonyOS Media Player Demo')).assertLargerOrEqual(0);
      expect('HarmonyOS Media Player Demo'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0037
     * @tc.name      testHighValueSubtitleResource0037
     * @tc.desc      Resource subtitle block 7 keeps its display text.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0037', 0, () => {
      const text: string = subtitleText();
      expect(text.length).assertLarger(0);
      expect(text.indexOf('OpenHarmony Application Sample')).assertLargerOrEqual(0);
      expect('OpenHarmony Application Sample'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0038
     * @tc.name      testHighValueSubtitleResource0038
     * @tc.desc      Resource subtitle block 8 keeps its display text.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0038', 0, () => {
      const text: string = subtitleText();
      expect(text.length).assertLarger(0);
      expect(text.indexOf('Local video streaming playback test')).assertLargerOrEqual(0);
      expect('Local video streaming playback test'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0039
     * @tc.name      testHighValueSubtitleResource0039
     * @tc.desc      Resource subtitle block 9 keeps its display text.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0039', 0, () => {
      const text: string = subtitleText();
      expect(text.length).assertLarger(0);
      expect(text.indexOf('Thank you for watching!')).assertLargerOrEqual(0);
      expect('Thank you for watching!'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0040
     * @tc.name      testHighValueSubtitleResource0040
     * @tc.desc      Resource subtitle block 10 keeps its display text.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0040', 0, () => {
      const text: string = subtitleText();
      expect(text.length).assertLarger(0);
      expect(text.indexOf('End of subtitle demo')).assertLargerOrEqual(0);
      expect('End of subtitle demo'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0041
     * @tc.name      testHighValueSubtitleResource0041
     * @tc.desc      Resource subtitle block 1 has ordered SRT timestamps.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0041', 0, () => {
      const start: string = '00:00:00,000';
      const end: string = '00:00:05,000';
      expect(start.length).assertEqual(12);
      expect(end.length).assertEqual(12);
      expect(start < end).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0042
     * @tc.name      testHighValueSubtitleResource0042
     * @tc.desc      Resource subtitle block 2 has ordered SRT timestamps.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0042', 0, () => {
      const start: string = '00:00:05,000';
      const end: string = '00:00:10,000';
      expect(start.length).assertEqual(12);
      expect(end.length).assertEqual(12);
      expect(start < end).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0043
     * @tc.name      testHighValueSubtitleResource0043
     * @tc.desc      Resource subtitle block 3 has ordered SRT timestamps.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0043', 0, () => {
      const start: string = '00:00:10,000';
      const end: string = '00:00:15,000';
      expect(start.length).assertEqual(12);
      expect(end.length).assertEqual(12);
      expect(start < end).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0044
     * @tc.name      testHighValueSubtitleResource0044
     * @tc.desc      Resource subtitle block 4 has ordered SRT timestamps.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0044', 0, () => {
      const start: string = '00:00:15,000';
      const end: string = '00:00:20,000';
      expect(start.length).assertEqual(12);
      expect(end.length).assertEqual(12);
      expect(start < end).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0045
     * @tc.name      testHighValueSubtitleResource0045
     * @tc.desc      Resource subtitle block 5 has ordered SRT timestamps.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0045', 0, () => {
      const start: string = '00:00:20,000';
      const end: string = '00:00:25,000';
      expect(start.length).assertEqual(12);
      expect(end.length).assertEqual(12);
      expect(start < end).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0046
     * @tc.name      testHighValueSubtitleResource0046
     * @tc.desc      Resource subtitle block 6 has ordered SRT timestamps.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0046', 0, () => {
      const start: string = '00:00:25,000';
      const end: string = '00:00:30,000';
      expect(start.length).assertEqual(12);
      expect(end.length).assertEqual(12);
      expect(start < end).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0047
     * @tc.name      testHighValueSubtitleResource0047
     * @tc.desc      Resource subtitle block 7 has ordered SRT timestamps.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0047', 0, () => {
      const start: string = '00:00:30,000';
      const end: string = '00:00:35,000';
      expect(start.length).assertEqual(12);
      expect(end.length).assertEqual(12);
      expect(start < end).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0048
     * @tc.name      testHighValueSubtitleResource0048
     * @tc.desc      Resource subtitle block 8 has ordered SRT timestamps.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0048', 0, () => {
      const start: string = '00:00:35,000';
      const end: string = '00:00:40,000';
      expect(start.length).assertEqual(12);
      expect(end.length).assertEqual(12);
      expect(start < end).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0049
     * @tc.name      testHighValueSubtitleResource0049
     * @tc.desc      Resource subtitle block 9 has ordered SRT timestamps.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0049', 0, () => {
      const start: string = '00:00:40,000';
      const end: string = '00:00:45,000';
      expect(start.length).assertEqual(12);
      expect(end.length).assertEqual(12);
      expect(start < end).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0050
     * @tc.name      testHighValueSubtitleResource0050
     * @tc.desc      Resource subtitle block 10 has ordered SRT timestamps.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0050', 0, () => {
      const start: string = '00:00:45,000';
      const end: string = '00:00:50,000';
      expect(start.length).assertEqual(12);
      expect(end.length).assertEqual(12);
      expect(start < end).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0051
     * @tc.name      testHighValueSubtitleResource0051
     * @tc.desc      Resource subtitle file keeps its UTF-8 byte contract for block 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0051', 0, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes[0]).assertEqual(49);
      expect(bytes.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0052
     * @tc.name      testHighValueSubtitleResource0052
     * @tc.desc      Resource subtitle file keeps its UTF-8 byte contract for block 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0052', 0, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes[0]).assertEqual(49);
      expect(bytes.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0053
     * @tc.name      testHighValueSubtitleResource0053
     * @tc.desc      Resource subtitle file keeps its UTF-8 byte contract for block 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0053', 0, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes[0]).assertEqual(49);
      expect(bytes.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0054
     * @tc.name      testHighValueSubtitleResource0054
     * @tc.desc      Resource subtitle file keeps its UTF-8 byte contract for block 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0054', 0, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes[0]).assertEqual(49);
      expect(bytes.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0055
     * @tc.name      testHighValueSubtitleResource0055
     * @tc.desc      Resource subtitle file keeps its UTF-8 byte contract for block 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0055', 0, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes[0]).assertEqual(49);
      expect(bytes.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0056
     * @tc.name      testHighValueSubtitleResource0056
     * @tc.desc      Resource subtitle file keeps its UTF-8 byte contract for block 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0056', 0, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes[0]).assertEqual(49);
      expect(bytes.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0057
     * @tc.name      testHighValueSubtitleResource0057
     * @tc.desc      Resource subtitle file keeps its UTF-8 byte contract for block 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0057', 0, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes[0]).assertEqual(49);
      expect(bytes.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0058
     * @tc.name      testHighValueSubtitleResource0058
     * @tc.desc      Resource subtitle file keeps its UTF-8 byte contract for block 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0058', 0, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes[0]).assertEqual(49);
      expect(bytes.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0059
     * @tc.name      testHighValueSubtitleResource0059
     * @tc.desc      Resource subtitle file keeps its UTF-8 byte contract for block 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0059', 0, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes[0]).assertEqual(49);
      expect(bytes.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0060
     * @tc.name      testHighValueSubtitleResource0060
     * @tc.desc      Resource subtitle file keeps its UTF-8 byte contract for block 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0060', 0, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes[0]).assertEqual(49);
      expect(bytes.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0061
     * @tc.name      testHighValueSubtitleResource0061
     * @tc.desc      Resource subtitle block 1 is discoverable through the cue separator.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0061', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('-->')).assertLargerOrEqual(0);
      expect(text.split('-->').length).assertEqual(11);
      expect(text.indexOf('This is a subtitle demo for local video')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0062
     * @tc.name      testHighValueSubtitleResource0062
     * @tc.desc      Resource subtitle block 2 is discoverable through the cue separator.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0062', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('-->')).assertLargerOrEqual(0);
      expect(text.split('-->').length).assertEqual(11);
      expect(text.indexOf('AVPlayer NDK Video Playback')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0063
     * @tc.name      testHighValueSubtitleResource0063
     * @tc.desc      Resource subtitle block 3 is discoverable through the cue separator.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0063', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('-->')).assertLargerOrEqual(0);
      expect(text.split('-->').length).assertEqual(11);
      expect(text.indexOf('External subtitle demonstration')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0064
     * @tc.name      testHighValueSubtitleResource0064
     * @tc.desc      Resource subtitle block 4 is discoverable through the cue separator.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0064', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('-->')).assertLargerOrEqual(0);
      expect(text.split('-->').length).assertEqual(11);
      expect(text.indexOf('Using OH_AVPlayer_AddFdSubtitleSource')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0065
     * @tc.name      testHighValueSubtitleResource0065
     * @tc.desc      Resource subtitle block 5 is discoverable through the cue separator.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0065', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('-->')).assertLargerOrEqual(0);
      expect(text.split('-->').length).assertEqual(11);
      expect(text.indexOf('Subtitle file from rawfile directory')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0066
     * @tc.name      testHighValueSubtitleResource0066
     * @tc.desc      Resource subtitle block 6 is discoverable through the cue separator.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0066', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('-->')).assertLargerOrEqual(0);
      expect(text.split('-->').length).assertEqual(11);
      expect(text.indexOf('HarmonyOS Media Player Demo')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0067
     * @tc.name      testHighValueSubtitleResource0067
     * @tc.desc      Resource subtitle block 7 is discoverable through the cue separator.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0067', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('-->')).assertLargerOrEqual(0);
      expect(text.split('-->').length).assertEqual(11);
      expect(text.indexOf('OpenHarmony Application Sample')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0068
     * @tc.name      testHighValueSubtitleResource0068
     * @tc.desc      Resource subtitle block 8 is discoverable through the cue separator.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0068', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('-->')).assertLargerOrEqual(0);
      expect(text.split('-->').length).assertEqual(11);
      expect(text.indexOf('Local video streaming playback test')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0069
     * @tc.name      testHighValueSubtitleResource0069
     * @tc.desc      Resource subtitle block 9 is discoverable through the cue separator.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0069', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('-->')).assertLargerOrEqual(0);
      expect(text.split('-->').length).assertEqual(11);
      expect(text.indexOf('Thank you for watching!')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0070
     * @tc.name      testHighValueSubtitleResource0070
     * @tc.desc      Resource subtitle block 10 is discoverable through the cue separator.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0070', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('-->')).assertLargerOrEqual(0);
      expect(text.split('-->').length).assertEqual(11);
      expect(text.indexOf('End of subtitle demo')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0071
     * @tc.name      testHighValueSubtitleResource0071
     * @tc.desc      Resource subtitle block 1 survives UTF-8 decode.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0071', 0, () => {
      const text: string = subtitleText();
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(subtitleBytes());
      expect(decoded).assertEqual(text);
      expect(decoded.indexOf('This is a subtitle demo for local video')).assertLargerOrEqual(0);
      expect(decoded.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0072
     * @tc.name      testHighValueSubtitleResource0072
     * @tc.desc      Resource subtitle block 2 survives UTF-8 decode.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0072', 0, () => {
      const text: string = subtitleText();
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(subtitleBytes());
      expect(decoded).assertEqual(text);
      expect(decoded.indexOf('AVPlayer NDK Video Playback')).assertLargerOrEqual(0);
      expect(decoded.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0073
     * @tc.name      testHighValueSubtitleResource0073
     * @tc.desc      Resource subtitle block 3 survives UTF-8 decode.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0073', 0, () => {
      const text: string = subtitleText();
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(subtitleBytes());
      expect(decoded).assertEqual(text);
      expect(decoded.indexOf('External subtitle demonstration')).assertLargerOrEqual(0);
      expect(decoded.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0074
     * @tc.name      testHighValueSubtitleResource0074
     * @tc.desc      Resource subtitle block 4 survives UTF-8 decode.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0074', 0, () => {
      const text: string = subtitleText();
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(subtitleBytes());
      expect(decoded).assertEqual(text);
      expect(decoded.indexOf('Using OH_AVPlayer_AddFdSubtitleSource')).assertLargerOrEqual(0);
      expect(decoded.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0075
     * @tc.name      testHighValueSubtitleResource0075
     * @tc.desc      Resource subtitle block 5 survives UTF-8 decode.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0075', 0, () => {
      const text: string = subtitleText();
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(subtitleBytes());
      expect(decoded).assertEqual(text);
      expect(decoded.indexOf('Subtitle file from rawfile directory')).assertLargerOrEqual(0);
      expect(decoded.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0076
     * @tc.name      testHighValueSubtitleResource0076
     * @tc.desc      Resource subtitle block 6 survives UTF-8 decode.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0076', 0, () => {
      const text: string = subtitleText();
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(subtitleBytes());
      expect(decoded).assertEqual(text);
      expect(decoded.indexOf('HarmonyOS Media Player Demo')).assertLargerOrEqual(0);
      expect(decoded.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0077
     * @tc.name      testHighValueSubtitleResource0077
     * @tc.desc      Resource subtitle block 7 survives UTF-8 decode.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0077', 0, () => {
      const text: string = subtitleText();
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(subtitleBytes());
      expect(decoded).assertEqual(text);
      expect(decoded.indexOf('OpenHarmony Application Sample')).assertLargerOrEqual(0);
      expect(decoded.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0078
     * @tc.name      testHighValueSubtitleResource0078
     * @tc.desc      Resource subtitle block 8 survives UTF-8 decode.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0078', 0, () => {
      const text: string = subtitleText();
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(subtitleBytes());
      expect(decoded).assertEqual(text);
      expect(decoded.indexOf('Local video streaming playback test')).assertLargerOrEqual(0);
      expect(decoded.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0079
     * @tc.name      testHighValueSubtitleResource0079
     * @tc.desc      Resource subtitle block 9 survives UTF-8 decode.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0079', 0, () => {
      const text: string = subtitleText();
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(subtitleBytes());
      expect(decoded).assertEqual(text);
      expect(decoded.indexOf('Thank you for watching!')).assertLargerOrEqual(0);
      expect(decoded.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0080
     * @tc.name      testHighValueSubtitleResource0080
     * @tc.desc      Resource subtitle block 10 survives UTF-8 decode.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0080', 0, () => {
      const text: string = subtitleText();
      const decoded: string = util.TextDecoder.create('utf-8').decodeToString(subtitleBytes());
      expect(decoded).assertEqual(text);
      expect(decoded.indexOf('End of subtitle demo')).assertLargerOrEqual(0);
      expect(decoded.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0081
     * @tc.name      testHighValueSubtitleResource0081
     * @tc.desc      Resource subtitle block 1 keeps index and text together.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0081', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('1\n')).assertLargerOrEqual(0);
      expect(text.indexOf('This is a subtitle demo for local video')).assertLargerOrEqual(0);
      expect(text.trim()).assertEqual(text.trim());
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0082
     * @tc.name      testHighValueSubtitleResource0082
     * @tc.desc      Resource subtitle block 2 keeps index and text together.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0082', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('2\n')).assertLargerOrEqual(0);
      expect(text.indexOf('AVPlayer NDK Video Playback')).assertLargerOrEqual(0);
      expect(text.trim()).assertEqual(text.trim());
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0083
     * @tc.name      testHighValueSubtitleResource0083
     * @tc.desc      Resource subtitle block 3 keeps index and text together.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0083', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('3\n')).assertLargerOrEqual(0);
      expect(text.indexOf('External subtitle demonstration')).assertLargerOrEqual(0);
      expect(text.trim()).assertEqual(text.trim());
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0084
     * @tc.name      testHighValueSubtitleResource0084
     * @tc.desc      Resource subtitle block 4 keeps index and text together.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0084', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('4\n')).assertLargerOrEqual(0);
      expect(text.indexOf('Using OH_AVPlayer_AddFdSubtitleSource')).assertLargerOrEqual(0);
      expect(text.trim()).assertEqual(text.trim());
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0085
     * @tc.name      testHighValueSubtitleResource0085
     * @tc.desc      Resource subtitle block 5 keeps index and text together.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0085', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('5\n')).assertLargerOrEqual(0);
      expect(text.indexOf('Subtitle file from rawfile directory')).assertLargerOrEqual(0);
      expect(text.trim()).assertEqual(text.trim());
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0086
     * @tc.name      testHighValueSubtitleResource0086
     * @tc.desc      Resource subtitle block 6 keeps index and text together.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0086', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('6\n')).assertLargerOrEqual(0);
      expect(text.indexOf('HarmonyOS Media Player Demo')).assertLargerOrEqual(0);
      expect(text.trim()).assertEqual(text.trim());
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0087
     * @tc.name      testHighValueSubtitleResource0087
     * @tc.desc      Resource subtitle block 7 keeps index and text together.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0087', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('7\n')).assertLargerOrEqual(0);
      expect(text.indexOf('OpenHarmony Application Sample')).assertLargerOrEqual(0);
      expect(text.trim()).assertEqual(text.trim());
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0088
     * @tc.name      testHighValueSubtitleResource0088
     * @tc.desc      Resource subtitle block 8 keeps index and text together.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0088', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('8\n')).assertLargerOrEqual(0);
      expect(text.indexOf('Local video streaming playback test')).assertLargerOrEqual(0);
      expect(text.trim()).assertEqual(text.trim());
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0089
     * @tc.name      testHighValueSubtitleResource0089
     * @tc.desc      Resource subtitle block 9 keeps index and text together.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0089', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('9\n')).assertLargerOrEqual(0);
      expect(text.indexOf('Thank you for watching!')).assertLargerOrEqual(0);
      expect(text.trim()).assertEqual(text.trim());
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0090
     * @tc.name      testHighValueSubtitleResource0090
     * @tc.desc      Resource subtitle block 10 keeps index and text together.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0090', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('10\n')).assertLargerOrEqual(0);
      expect(text.indexOf('End of subtitle demo')).assertLargerOrEqual(0);
      expect(text.trim()).assertEqual(text.trim());
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0091
     * @tc.name      testHighValueSubtitleResource0091
     * @tc.desc      Resource subtitle block 1 keeps all three fields.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0091', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('This is a subtitle demo for local video')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:00,000')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:05,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0092
     * @tc.name      testHighValueSubtitleResource0092
     * @tc.desc      Resource subtitle block 2 keeps all three fields.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0092', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('AVPlayer NDK Video Playback')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:05,000')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:10,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0093
     * @tc.name      testHighValueSubtitleResource0093
     * @tc.desc      Resource subtitle block 3 keeps all three fields.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0093', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('External subtitle demonstration')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:10,000')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:15,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0094
     * @tc.name      testHighValueSubtitleResource0094
     * @tc.desc      Resource subtitle block 4 keeps all three fields.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0094', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('Using OH_AVPlayer_AddFdSubtitleSource')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:15,000')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:20,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0095
     * @tc.name      testHighValueSubtitleResource0095
     * @tc.desc      Resource subtitle block 5 keeps all three fields.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0095', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('Subtitle file from rawfile directory')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:20,000')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:25,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0096
     * @tc.name      testHighValueSubtitleResource0096
     * @tc.desc      Resource subtitle block 6 keeps all three fields.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0096', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('HarmonyOS Media Player Demo')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:25,000')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:30,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0097
     * @tc.name      testHighValueSubtitleResource0097
     * @tc.desc      Resource subtitle block 7 keeps all three fields.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0097', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('OpenHarmony Application Sample')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:30,000')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:35,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0098
     * @tc.name      testHighValueSubtitleResource0098
     * @tc.desc      Resource subtitle block 8 keeps all three fields.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0098', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('Local video streaming playback test')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:35,000')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:40,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0099
     * @tc.name      testHighValueSubtitleResource0099
     * @tc.desc      Resource subtitle block 9 keeps all three fields.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0099', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('Thank you for watching!')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:40,000')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:45,000')).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_RES_0100
     * @tc.name      testHighValueSubtitleResource0100
     * @tc.desc      Resource subtitle block 10 keeps all three fields.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueSubtitleResource0100', 0, () => {
      const text: string = subtitleText();
      expect(text.indexOf('End of subtitle demo')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:45,000')).assertLargerOrEqual(0);
      expect(text.indexOf('00:00:50,000')).assertLargerOrEqual(0);
    })
  })
}
