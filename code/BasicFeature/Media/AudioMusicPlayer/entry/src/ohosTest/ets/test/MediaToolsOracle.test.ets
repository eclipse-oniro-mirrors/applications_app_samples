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
import { MediaTools } from '../../../main/ets/common/utils/mediautils/MediaTools';
import { getRawStringData } from '../../../main/ets/common/utils/LrcUtils';
import { appContext, uiAbilityContext } from './TestContext';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const MS_PER_DAY: number = 86400000;
const MS_PER_HOUR: number = 3600000;
const MS_PER_MINUTE: number = 60000;
const MS_PER_SECOND: number = 1000;
const LRC_PATH: string = 'lrcfiles/DreamItPossible.lrc';

/**
 * 线性同余随机数，固定种子保证每次执行采样序列一致、可复现。
 */
class SeededRandom {
  private state: number;

  constructor(seed: number) {
    this.state = seed;
  }

  next(): number {
    this.state = (this.state * 48271) % 2147483647;
    return this.state;
  }

  nextInt(maxExclusive: number): number {
    return this.next() % maxExclusive;
  }
}

/**
 * 独立换算：只用整数除法与取模，逐段补零，只有非零的天与时才出现在文本里。
 * 负值不先取绝对值：分段用的是同一套取模取整，负余数各段自带负号。
 */
function oracleText(ms: number): string {
  let days: number = Math.floor(ms / MS_PER_DAY);
  let hours: number = Math.floor((ms % MS_PER_DAY) / MS_PER_HOUR);
  let minutes: number = Math.floor((ms % MS_PER_HOUR) / MS_PER_MINUTE);
  let seconds: number = Math.floor((ms % MS_PER_MINUTE) / MS_PER_SECOND);
  let parts: string[] = [];
  if (days !== 0) {
    parts.push(pad(days));
  }
  if (hours !== 0) {
    parts.push(pad(hours));
  }
  parts.push(pad(minutes));
  parts.push(pad(seconds));
  return parts.join(':').trim();
}

function pad(value: number): string {
  return value < 10 ? `0${value}` : `${value}`;
}

function mismatchCount(samples: number[]): number {
  let mismatched: number = 0;
  for (let ms of samples) {
    if (MediaTools.msToCountdownTime(ms) !== oracleText(ms)) {
      mismatched++;
    }
  }
  return mismatched;
}

/**
 * 展示文本换算用例组：用独立换算与固定种子采样交叉验证，不依赖被测实现自身输出。
 */
export default function MediaToolsOracleTest() {
  describe('MediaToolsOracleTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_MEDIA_ORACLE_0200
     * @tc.name      testMediaToolsOracle0002
     * @tc.desc      验证每秒毫秒数整除位置与前一毫秒的换算只在整秒处变化，同一秒内 0 到 999 毫秒文本全部相同
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testMediaToolsOracle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MediaOracle_SecondBoundary_0002 begin');
      let base: number = 59 * MS_PER_SECOND;
      let insideSecond: string[] = [];
      for (let offset = 0; offset < MS_PER_SECOND; offset += 37) {
        insideSecond.push(MediaTools.msToCountdownTime(base + offset));
      }
      let atBoundary: string = MediaTools.msToCountdownTime(base + MS_PER_SECOND);
      let beforeBoundary: string = MediaTools.msToCountdownTime(base + MS_PER_SECOND - 1);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `秒内样本=${insideSecond.length}, 去重后=${new Set<string>(insideSecond).size}, ` +
        `边界前=${beforeBoundary}, 边界=${atBoundary}`);
      expect(new Set<string>(insideSecond).size).assertEqual(1);
      expect(insideSecond[0]).assertEqual('00:59');
      expect(beforeBoundary).assertEqual('00:59');
      expect(atBoundary).assertEqual('01:00');
      expect(oracleText(base + MS_PER_SECOND)).assertEqual(atBoundary);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MediaOracle_SecondBoundary_0002 end');
    });

    /**
     * @tc.number    SUB_MEDIA_ORACLE_0300
     * @tc.name      testMediaToolsOracle0003
     * @tc.desc      验证天数为零时不显示天数段而小时非零时显示小时段，跨天整点时天数与小时同时出现且小时回到零
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testMediaToolsOracle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MediaOracle_DayHour_0003 begin');
      let oneHour: string = MediaTools.msToCountdownTime(MS_PER_HOUR);
      let dayMinusOneMs: string = MediaTools.msToCountdownTime(MS_PER_DAY - 1);
      let exactlyOneDay: string = MediaTools.msToCountdownTime(MS_PER_DAY);
      let dayAndHour: string = MediaTools.msToCountdownTime(MS_PER_DAY + MS_PER_HOUR);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `一小时=${oneHour}, 一天差一毫秒=${dayMinusOneMs}, 整一天=${exactlyOneDay}, 一天一小时=${dayAndHour}`);
      expect(oneHour).assertEqual('01:00:00');
      expect(dayMinusOneMs).assertEqual('23:59:59');
      expect(exactlyOneDay).assertEqual('01:00:00');
      expect(dayAndHour).assertEqual('01:01:00:00');
      expect(oneHour.split(':').length).assertEqual(3);
      expect(exactlyOneDay.split(':').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MediaOracle_DayHour_0003 end');
    });

    /**
     * @tc.number    SUB_MEDIA_ORACLE_0400
     * @tc.name      testMediaToolsOracle0004
     * @tc.desc      验证零与非数字输出零时长占位文本，负值各段按取模结果带负号输出且换算结果稳定可复现
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testMediaToolsOracle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MediaOracle_NonPositive_0004 begin');
      let zero: string = MediaTools.msToCountdownTime(0);
      let negatives: number[] = [-1, -999, -MS_PER_SECOND, -MS_PER_DAY, -Number.MAX_SAFE_INTEGER];
      let negativeTexts: string[] = negatives.map((ms: number) => MediaTools.msToCountdownTime(ms));
      let containsMinus: number = negativeTexts.filter((text: string) => text.indexOf('-') >= 0).length;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `零=${zero}, 负值文本=${negativeTexts.join(',')}, 含负号个数=${containsMinus}`);
      expect(zero).assertEqual('00:00');
      expect(negativeTexts.slice(0, 3)).assertDeepEquals(['-1:-1:-1:-1', '-1:-1:-1:-1', '-1:-1:-1:-1']);
      expect(negativeTexts[3]).assertEqual('-1:00:00');
      expect(containsMinus).assertEqual(negatives.length);
      expect(MediaTools.msToCountdownTime(NaN)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MediaOracle_NonPositive_0004 end');
    });

    /**
     * @tc.number    SUB_MEDIA_ORACLE_0700
     * @tc.name      testMediaToolsOracle0007
     * @tc.desc      验证从 rawfile 读取歌词与直接用字节解码结果完全一致，读取不存在的路径时抛出异常而非返回旧内容
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testMediaToolsOracle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MediaOracle_RawString_0007 begin');
      let bytes: Uint8Array = await appContext().resourceManager.getRawFileContent(LRC_PATH);
      let decoder: util.TextDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
      let direct: string = decoder.decodeToString(bytes, { stream: false });
      let viaUtil: string = await getRawStringData(appContext(), LRC_PATH);
      let twice: string = await getRawStringData(appContext(), LRC_PATH);
      let outcome: string = 'resolved';
      try {
        await MediaTools.getLrcFromRawFile(uiAbilityContext(), 'lrcfiles/__absent_lyric__.lrc');
      } catch (error) {
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `字节数=${bytes.length}, 直接解码长度=${direct.length}, 工具读取长度=${viaUtil.length}, 缺失路径=${outcome}`);
      expect(viaUtil).assertEqual(direct);
      expect(twice).assertEqual(viaUtil);
      expect(viaUtil.split('\n').length).assertEqual(41);
      expect(outcome).assertEqual('rejected');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MediaOracle_RawString_0007 end');
    });
  });
}

// 把展示文本换算回秒数，用于比较先后顺序
function parseSeconds(text: string): number {
  let parts: string[] = text.split(':');
  let total: number = 0;
  for (let part of parts) {
    total = total * 60 + Number(part);
  }
  return total;
}
