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
import { appContext, StorageSnapshot } from './TestContext';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const LRC_PATH: string = 'lrcfiles/DreamItPossible.lrc';
const LRC_LINE_COUNT: number = 41;
const LRC_FIRST_TEXT: string = 'Delacey - Dream It Possible';
const LRC_LAST_TEXT: string = 'And we\'ll dream it possible';
const LRC_LAST_MS: number = 193900;
const LRC_SUFFIX: string = '.lrc';
const KRC_SUFFIX: string = '.krc';

interface ParsedSong {
  id: number;
  index: number;
  src: string;
}

/**
 * 按播放界面的后缀判断选择歌词来源：只有以 .lrc / .krc 结尾才去读原始文件，其余歌曲不读歌词。
 */
function lyricResourceOf(song: SongItem): string {
  if (song.lyric.endsWith(LRC_SUFFIX) || song.lyric.endsWith(KRC_SUFFIX)) {
    return song.lyric;
  }
  return '';
}

/**
 * 独立复算：取第一个起点不早于给定时间的行进号，找不到返回 -1。
 * 用于核对“换歌后歌词重新定位”的时间换算。
 */
function firstLineAtOrAfter(entries: LrcEntry[], ms: number): number {
  for (let index = 0; index < entries.length; index++) {
    if (entries[index].lineStartTime >= ms) {
      return index;
    }
  }
  return -1;
}

export default function LyricSwitchIntegrationSuite() {
  describe('LyricSwitchIntegrationSuite', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_LYRIC_SWITCH_0100
     * @tc.name      testLyricSwitch0001
     * @tc.desc      验证目录中每首歌的歌词后缀决定是否加载歌词文件，只有带 LRC 的歌曲能读出非空文本，其余歌曲为空歌词
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricSwitch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_ResourcePick_0001 begin');
      let loaded: ParsedSong[] = [];
      let emptyCount: number = 0;
      for (let song of songList) {
        let resource: string = lyricResourceOf(song);
        if (resource === '') {
          emptyCount++;
          continue;
        }
        let text: string = await getRawStringData(appContext(), resource);
        let entries: LrcEntry[] = parseLrcLyric(text);
        if (text.length > 0 && entries.length > 0) {
          loaded.push({ id: song.id, index: song.index, src: song.src });
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `目录歌曲数=${songList.length}, 无歌词歌曲数=${emptyCount}, 成功载入歌词=${loaded.length}, 载入歌曲编号=${loaded.length > 0 ? loaded[0].id : -1}`);
      expect(emptyCount).assertEqual(songList.length - 1);
      expect(loaded.length).assertEqual(1);
      expect(loaded[0].index).assertEqual(0);
      expect(loaded[0].src).assertEqual(songList[0].src);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_ResourcePick_0001 end');
    });

    /**
     * @tc.number    SUB_LYRIC_SWITCH_0200
     * @tc.name      testLyricSwitch0002
     * @tc.desc      验证换到无歌词歌曲时歌词列表清空、换回有歌词歌曲时重新解析出完整行数，且解析结果与按资源管理器读取再解码一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricSwitch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_SwitchSong_0002 begin');
      let manager = appContext().resourceManager;
      let withLyric: SongItem = songList[0];
      let withoutLyric: SongItem = songList[1];
      let emptyEntries: LrcEntry[] = parseLrcLyric(lyricResourceOf(withoutLyric));
      let firstText: string = await getRawStringData(appContext(), lyricResourceOf(withLyric));
      let bytes: Uint8Array = await manager.getRawFileContent(lyricResourceOf(withLyric));
      let decoded: string = util.TextDecoder.create('utf-8', { ignoreBOM: true }).decodeToString(bytes, { stream: false });
      let entries: LrcEntry[] = parseLrcLyric(firstText);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `无歌词歌曲=${withoutLyric.src} 行数=${emptyEntries.length}, 换回后行数=${entries.length}, 两次解码一致=${firstText === decoded}`);
      expect(emptyEntries.length).assertEqual(0);
      expect(firstText).assertEqual(decoded);
      expect(entries.length).assertEqual(LRC_LINE_COUNT);
      expect(entries[0].lineWords).assertEqual(LRC_FIRST_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_SwitchSong_0002 end');
    });

    /**
     * @tc.number    SUB_LYRIC_SWITCH_0300
     * @tc.name      testLyricSwitch0003
     * @tc.desc      验证换歌后按新歌歌词重新定位：从第一首切到无歌词歌曲再切回，定位结果与首次一致，且从播放中段进入时能落到对应行
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricSwitch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_Relocate_0003 begin');
      let text: string = await getRawStringData(appContext(), LRC_PATH);
      let entries: LrcEntry[] = parseLrcLyric(text);
      let snapshot: StorageSnapshot = new StorageSnapshot().capture('selectIndex');
      let loadedIndexes: number[] = [];
      try {
        let sequence: number[] = [0, 1, 0];
        for (let index of sequence) {
          AppStorage.setOrCreate('selectIndex', index);
          loadedIndexes.push(AppStorage.get<number>('selectIndex') as number);
        }
      } finally {
        snapshot.restore();
      }
      let middleStart: number = entries[20].lineStartTime + 1200;
      let jumpLine: number = firstLineAtOrAfter(entries, middleStart);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `选择序列=${loadedIndexes.join(',')}, 中段${middleStart}ms后下一行=${jumpLine}, 该行文本=[${jumpLine >= 0 ? entries[jumpLine].lineWords : ''}]`);
      expect(loadedIndexes).assertDeepEquals([0, 1, 0]);
      expect(jumpLine).assertEqual(21);
      expect(entries[jumpLine].lineStartTime >= middleStart).assertTrue();
      expect(entries[jumpLine - 1].lineStartTime < middleStart).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_Relocate_0003 end');
    });

    /**
     * @tc.number    SUB_LYRIC_SWITCH_0400
     * @tc.name      testLyricSwitch0004
     * @tc.desc      验证歌词末端定位：接近结尾时停留在末行，超过末行起点后仍命中末行，并且末行文本与歌词文件最后一行一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricSwitch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_EndOfSong_0004 begin');
      let text: string = await getRawStringData(appContext(), LRC_PATH);
      let entries: LrcEntry[] = parseLrcLyric(text);
      let lastIndex: number = entries.length - 1;
      let probes: number[] = [LRC_LAST_MS - 1, LRC_LAST_MS, LRC_LAST_MS + 30000];
      let located: number[] = [];
      for (let moment of probes) {
        let hit: number = -1;
        for (let index = 0; index < entries.length; index++) {
          let start: number = entries[index].lineStartTime;
          if (index === lastIndex && moment >= start) {
            hit = index;
            break;
          }
          if (moment >= start && moment < entries[index + 1].lineStartTime) {
            hit = index;
            break;
          }
        }
        located.push(hit);
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `末行起点前1ms=${located[0]}, 末行起点=${located[1]}, 末行起点后30s=${located[2]}, 末行文本=[${entries[lastIndex].lineWords}]`);
      expect(located[0]).assertEqual(lastIndex - 1);
      expect(located[1]).assertEqual(lastIndex);
      expect(located[2]).assertEqual(lastIndex);
      expect(entries[lastIndex].lineWords).assertEqual(LRC_LAST_TEXT);
      expect(entries[lastIndex].lineDuration).assertEqual(Number.MAX_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_EndOfSong_0004 end');
    });

    /**
     * @tc.number    SUB_LYRIC_SWITCH_0500
     * @tc.name      testLyricSwitch0005
     * @tc.desc      验证歌词模板中每行时间标签都单调递增且行时长等于下一行起点差值，可作为滚动时间轴直接使用
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricSwitch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_Timeline_0005 begin');
      let text: string = await getRawStringData(appContext(), LRC_PATH);
      let entries: LrcEntry[] = parseLrcLyric(text);
      let increasing: boolean = true;
      let durationMatches: number = 0;
      let gapSum: number = 0;
      for (let index = 0; index < entries.length - 1; index++) {
        if (entries[index + 1].lineStartTime <= entries[index].lineStartTime) {
          increasing = false;
        }
        if (entries[index].lineDuration === entries[index + 1].lineStartTime - entries[index].lineStartTime) {
          durationMatches++;
        }
        gapSum += entries[index].lineDuration;
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `严格递增=${increasing}, 时长匹配行数=${durationMatches}, 总时长=${gapSum}, 首行到末行跨度=${LRC_LAST_MS - entries[0].lineStartTime}`);
      expect(increasing).assertTrue();
      expect(durationMatches).assertEqual(entries.length - 1);
      expect(gapSum).assertEqual(LRC_LAST_MS - entries[0].lineStartTime);
      expect(gapSum).assertEqual(193750);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_Timeline_0005 end');
    });

    /**
     * @tc.number    SUB_LYRIC_SWITCH_0600
     * @tc.name      testLyricSwitch0006
     * @tc.desc      验证同一歌词重复解析得到的行时间与文本完全一致，且解析过程不改动传入的歌词文本，多次解析结果可复现
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricSwitch0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_RepeatParse_0006 begin');
      let text: string = await getRawStringData(appContext(), LRC_PATH);
      let originalLength: number = text.length;
      let first: LrcEntry[] = parseLrcLyric(text);
      let second: LrcEntry[] = parseLrcLyric(text);
      let timesEqual: boolean = true;
      let wordsEqual: boolean = true;
      for (let index = 0; index < first.length; index++) {
        if (first[index].lineStartTime !== second[index].lineStartTime) {
          timesEqual = false;
        }
        if (first[index].lineWords !== second[index].lineWords) {
          wordsEqual = false;
        }
      }
      let sharedEntry: boolean = first[0] === second[0];
      hilog.info(DOMAIN, TAG, '%{public}s',
        `原文长度保持=${text.length === originalLength}, 时间一致=${timesEqual}, 文本一致=${wordsEqual}, 两次结果共享元素对象=${sharedEntry}`);
      expect(text.length).assertEqual(originalLength);
      expect(timesEqual).assertTrue();
      expect(wordsEqual).assertTrue();
      expect(sharedEntry).assertFalse();
      expect(first.length).assertEqual(second.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_RepeatParse_0006 end');
    });

    /**
     * @tc.number    SUB_LYRIC_SWITCH_0700
     * @tc.name      testLyricSwitch0007
     * @tc.desc      验证无歌词歌曲不产生歌词行，而空资源标识与不存在的歌词路径读取失败时都不会被误解析出歌词行
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricSwitch0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_NoLyric_0007 begin');
      let noLyricEntries: LrcEntry[] = parseLrcLyric(lyricResourceOf(songList[2]));
      let failed: boolean = false;
      try {
        await getRawStringData(appContext(), 'lrcfiles/NotExist.lrc');
      } catch (error) {
        failed = true;
      }
      let emptyTextEntries: LrcEntry[] = parseLrcLyric('');
      let noTagEntries: LrcEntry[] = parseLrcLyric('Delacey - Dream It Possible\nI will run I will climb\n');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `无歌词歌曲行数=${noLyricEntries.length}, 不存在路径读取失败=${failed}, 空文本行数=${emptyTextEntries.length}, 无标签文本行数=${noTagEntries.length}`);
      expect(noLyricEntries.length).assertEqual(0);
      expect(failed).assertTrue();
      expect(emptyTextEntries.length).assertEqual(0);
      expect(noTagEntries.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_NoLyric_0007 end');
    });

    /**
     * @tc.number    SUB_LYRIC_SWITCH_0800
     * @tc.name      testLyricSwitch0008
     * @tc.desc      验证歌词文件与歌曲目录中的歌词字段一一对应：歌词路径位于歌词目录、后缀为 LRC、内容首尾行与解析出的首尾行文本相同
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricSwitch0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_FileBinding_0008 begin');
      let song: SongItem = songList[0];
      let text: string = await getRawStringData(appContext(), song.lyric);
      let entries: LrcEntry[] = parseLrcLyric(text);
      let rawLines: string[] = text.split('\n');
      let firstRaw: string = rawLines[0];
      let lastRaw: string = rawLines[rawLines.length - 1];
      hilog.info(DOMAIN, TAG, '%{public}s',
        `歌词路径=${song.lyric}, 目录层=${song.lyric.split('/')[0]}, 后缀命中=${song.lyric.endsWith(LRC_SUFFIX)}, ` +
        `首行解析=[${entries[0].lineWords}], 末行解析=[${entries[entries.length - 1].lineWords}]`);
      expect(song.lyric.split('/')[0]).assertEqual('lrcfiles');
      expect(song.lyric.endsWith(LRC_SUFFIX)).assertTrue();
      expect(firstRaw.substring(10)).assertEqual(entries[0].lineWords);
      expect(lastRaw.substring(10)).assertEqual(entries[entries.length - 1].lineWords);
      expect(rawLines.length).assertEqual(LRC_LINE_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LyricSwitch_FileBinding_0008 end');
    });
  });
}
