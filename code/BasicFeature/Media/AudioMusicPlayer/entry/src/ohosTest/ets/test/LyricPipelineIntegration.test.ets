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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { parseLrcLyric, getRawStringData } from '../../../main/ets/common/utils/LrcUtils';
import { songList } from '../../../main/ets/model/SongListData';
import { LrcEntry } from '../../../main/ets/viewmodel/LrcEntry';
import { SongItem } from '../../../main/ets/viewmodel/SongData';
import { LrcLineScanner } from './TestData';
import { appContext } from './TestContext';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const LRC_BYTE_SIZE: number = 1796;
const LRC_ENTRY_COUNT: number = 41;
const LRC_FIRST_MS: number = 150;
const LRC_LAST_MS: number = 193900;

/**
 * 按播放组件相同的解码参数把歌词字节转成文本：UTF-8、保留 BOM。
 */
function decodeLyric(value: Uint8Array): string {
  let decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
  return decoder.decodeToString(value, { stream: false });
}

/**
 * 选择歌词所用的解析任务，规则与播放界面一致：以 .krc 结尾走 KRC，以 .lrc 结尾走 LRC，其他不解析。
 */
function parserKindOf(song: SongItem): string {
  if (song.lyric.endsWith('.krc')) {
    return 'krc';
  }
  if (song.lyric.endsWith('.lrc')) {
    return 'lrc';
  }
  return 'none';
}

/**
 * 与歌词滚动相同的定位规则（LrcView 的区间命中）：取第一条满足 起始时间 ≤ 当前时间 ≤ 起始时间 + 行时长 的行；
 * 找不到时保持原行号。用独立实现复算，不使用被测界面里的私有方法。
 * 末行时长是最大数值，起点 + 时长会溢出为无穷，因此末行起点之后一律命中末行。
 */
function playingLineOf(entries: LrcEntry[], ms: number, fallback: number): number {
  for (let index = 0; index < entries.length; index++) {
    if (entries[index].lineStartTime <= ms && entries[index].lineStartTime + entries[index].lineDuration >= ms) {
      return index;
    }
  }
  return fallback;
}

export default function LyricPipelineIntegration() {
  describe('LyricPipelineIntegration', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_LYRIC_PIPELINE_0100
     * @tc.name      testLyricPipeline0001
     * @tc.desc      验证从歌曲目录取歌词资源、按播放组件参数解码并解析后，行数、行序与独立扫描结果一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricPipeline0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_PipelineCatalog_0001 begin');
      let first: SongItem = songList[0];
      let bytes: Uint8Array = await appContext().resourceManager.getRawFileContent(first.lyric);
      let text: string = decodeLyric(bytes);
      let entries: LrcEntry[] = parseLrcLyric(text);
      let scanner: LrcLineScanner = new LrcLineScanner().scan(text);
      let entryTimes: number[] = [];
      for (let entry of entries) {
        entryTimes.push(entry.lineStartTime);
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `歌词文件=${first.lyric}, 字节=${bytes.length}, 解析行数=${entries.length}, 扫描标签数=${scanner.times.length}`);
      expect(parserKindOf(first)).assertEqual('lrc');
      expect(bytes.length).assertEqual(LRC_BYTE_SIZE);
      expect(entries.length).assertEqual(LRC_ENTRY_COUNT);
      expect(scanner.times.length).assertEqual(LRC_ENTRY_COUNT);
      expect(entryTimes).assertDeepEquals(scanner.sortedTimes());
      expect(entries[0].lineWords.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_PipelineCatalog_0001 end');
    });

    /**
     * @tc.number    SUB_LYRIC_PIPELINE_0200
     * @tc.name      testLyricPipeline0002
     * @tc.desc      验证解码出的歌词首尾时间与原文首尾时间标签一致，且行文本按原文顺序完整保留
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricPipeline0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_PipelineTiming_0002 begin');
      let text: string = await getRawStringData(appContext(), songList[0].lyric);
      let entries: LrcEntry[] = parseLrcLyric(text);
      let rawLines: string[] = text.split('\n');
      let firstRaw: string = rawLines[0];
      let lastRaw: string = rawLines[rawLines.length - 1];
      let firstText: string = entries[0].lineWords;
      let lastText: string = entries[entries.length - 1].lineWords;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `首行原文=[${firstRaw.substring(0, 10)}], 首行文本=[${firstText.substring(0, 20)}], 末行文本=[${lastText}]`);
      expect(entries[0].lineStartTime).assertEqual(LRC_FIRST_MS);
      expect(entries[entries.length - 1].lineStartTime).assertEqual(LRC_LAST_MS);
      expect(firstRaw.startsWith('[00:00.15]')).assertTrue();
      expect(lastRaw.substring(0, 10)).assertEqual('[03:13.90]');
      expect(firstText).assertEqual(firstRaw.substring(10));
      expect(lastText).assertEqual(lastRaw.substring(10));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_PipelineTiming_0002 end');
    });

    /**
     * @tc.number    SUB_LYRIC_PIPELINE_0300
     * @tc.name      testLyricPipeline0003
     * @tc.desc      验证按播放时间定位高亮行：开头落在首行、每行起点命中该行、行时长边界命中前一毫秒的行、结束时间之后停在末行
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_LYRIC_PIPELINE_0400
     * @tc.name      testLyricPipeline0004
     * @tc.desc      验证以固定步长完整走一遍播放时长时，高亮行号单调不减且覆盖所有歌词行，不会跳行或回头
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_LYRIC_PIPELINE_0500
     * @tc.name      testLyricPipeline0005
     * @tc.desc      验证目录中每首歌都按歌词后缀选择解析方式，仅第一首使用 LRC，其余无歌词的歌曲不产生歌词行
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricPipeline0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_PipelinePerSong_0005 begin');
      let kinds: string[] = [];
      let lineCounts: number[] = [];
      for (let song of songList) {
        let kind: string = parserKindOf(song);
        kinds.push(kind);
        let lines: number = 0;
        if (kind !== 'none') {
          let text: string = await getRawStringData(appContext(), song.lyric);
          lines = parseLrcLyric(text).length;
        }
        lineCounts.push(lines);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `解析方式=${kinds.join(',')}, 行数=${lineCounts.join(',')}`);
      expect(kinds.length).assertEqual(songList.length);
      expect(kinds[0]).assertEqual('lrc');
      expect(kinds.slice(1).join('')).assertEqual('none'.repeat(songList.length - 1));
      expect(lineCounts[0]).assertEqual(LRC_ENTRY_COUNT);
      expect(lineCounts.slice(1)).assertDeepEquals([0, 0, 0, 0, 0, 0, 0]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_PipelinePerSong_0005 end');
    });

    /**
     * @tc.number    SUB_LYRIC_PIPELINE_0600
     * @tc.name      testLyricPipeline0006
     * @tc.desc      验证歌词逐行文本去除时间标签后非空、不含时间戳残留，且各行文本在原文中按序一一对应
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricPipeline0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_PipelineTextClean_0006 begin');
      let text: string = await getRawStringData(appContext(), songList[0].lyric);
      let entries: LrcEntry[] = parseLrcLyric(text);
      let timeStamp: RegExp = new RegExp('\\[\\d{2,}:\\d{2}(\\.|:)\\d{2,}\\]');
      let dirty: number = 0;
      let rawTexts: string[] = [];
      for (let rawLine of text.split('\n')) {
        let stripped: string = rawLine.replace(new RegExp('\\[\\d{2,}:\\d{2}(\\.|:)\\d{2,}\\]', 'g'), '');
        if (stripped.trim().length > 0) {
          rawTexts.push(stripped);
        }
      }
      let parsedTexts: string[] = [];
      for (let entry of entries) {
        parsedTexts.push(entry.lineWords);
        if (entry.lineWords.trim().length === 0 || timeStamp.test(entry.lineWords)) {
          dirty++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `行数=${entries.length}, 原文非空行=${rawTexts.length}, 残留时间戳或空行=${dirty}, 首行文本=[${entries[0].lineWords}]`);
      expect(dirty).assertEqual(0);
      expect(parsedTexts).assertDeepEquals(rawTexts);
      expect(entries[0].lineWords).assertEqual('Delacey - Dream It Possible');
      expect(timeStamp.test(entries[0].lineWords)).assertFalse();
      expect(entries[entries.length - 1].lineWords.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_PipelineTextClean_0006 end');
    });
  });
}
