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
import {
  LyricScrollEffect,
  LyricTopPosition,
  LyricFile,
  Rectangle
} from '../../../main/ets/common/constants/LyricConst';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

/**
 * 矩形包含判定的独立实现：使用区间比较，不调用 Rectangle.isIn。
 */
function contains(box: Rectangle, x: number, y: number): boolean {
  let inX: boolean = x >= box.left && x <= box.right;
  let inY: boolean = y >= box.top && y <= box.bottom;
  return inX && inY;
}

function area(box: Rectangle): number {
  return (box.right - box.left) * (box.bottom - box.top);
}

export default function LyricConstSuiteTest() {
  describe('LyricConstSuiteTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_LYRIC_CONST_0100
     * @tc.name      testLyricConstSuite0001
     * @tc.desc      验证四种滚动效果枚举按 0~3 连续编号且首项为整行滚动
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricConstSuite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_ScrollEffect_0001 begin');
      let effects: number[] = [
        LyricScrollEffect.Line, LyricScrollEffect.LetterGradient,
        LyricScrollEffect.LetterScaleGradient, LyricScrollEffect.LetterStar
      ];
      hilog.info(DOMAIN, TAG, '%{public}s', `效果枚举=[${effects.join(',')}]`);
      expect(effects[0]).assertEqual(0);
      expect(effects[1]).assertEqual(1);
      expect(effects[2]).assertEqual(2);
      expect(effects[3]).assertEqual(3);
      expect(new Set<number>(effects).size).assertEqual(4);
      expect(effects[3] - effects[0]).assertEqual(3);
      expect(LyricScrollEffect.Line).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_ScrollEffect_0001 end');
    });

    /**
     * @tc.number    SUB_LYRIC_CONST_0200
     * @tc.name      testLyricConstSuite0002
     * @tc.desc      验证歌词初始位置枚举：顶部为 0、居中为 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricConstSuite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_TopPosition_0002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `Top=${LyricTopPosition.Top}, Middle=${LyricTopPosition.Middle}`);
      expect(LyricTopPosition.Top).assertEqual(0);
      expect(LyricTopPosition.Middle).assertEqual(1);
      expect(LyricTopPosition.Middle).assertEqual(LyricTopPosition.Top + 1);
      expect(LyricTopPosition.Top !== LyricTopPosition.Middle).assertTrue();
      expect(LyricTopPosition.Top >= 0).assertTrue();
      expect(LyricTopPosition.Middle < 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_TopPosition_0002 end');
    });

    /**
     * @tc.number    SUB_LYRIC_CONST_0300
     * @tc.name      testLyricConstSuite0003
     * @tc.desc      验证歌词文件扩展名以点开头且可被 endsWith 区分后缀
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricConstSuite0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_FileSuffix_0003 begin');
      let suffixes: string[] = [LyricFile.KRC, LyricFile.LRC];
      let dotPrefixed: number = suffixes.filter((item: string) => item.startsWith('.')).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `后缀=[${suffixes.join(',')}]`);
      expect(LyricFile.KRC).assertEqual('.krc');
      expect(LyricFile.LRC).assertEqual('.lrc');
      expect(dotPrefixed).assertEqual(2);
      expect('song.krc'.endsWith(LyricFile.KRC)).assertTrue();
      expect('song.lrc'.endsWith(LyricFile.KRC)).assertFalse();
      expect('song.lrc'.endsWith(LyricFile.LRC)).assertTrue();
      expect(new Set<string>(suffixes).size).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_FileSuffix_0003 end');
    });

    /**
     * @tc.number    SUB_LYRIC_CONST_0400
     * @tc.name      testLyricConstSuite0004
     * @tc.desc      验证合法矩形四个边界被正确保存且字符串格式与约定一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricConstSuite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_Normal_0004 begin');
      let box: Rectangle = new Rectangle(10, 20, 110, 220);
      hilog.info(DOMAIN, TAG, '%{public}s', `矩形字符串=${box.toString()}`);
      expect(box.left).assertEqual(10);
      expect(box.top).assertEqual(20);
      expect(box.right).assertEqual(110);
      expect(box.bottom).assertEqual(220);
      expect(box.toString()).assertEqual('[Rectangle] = 10, 20, 110,220');
      expect(area(box)).assertEqual(100 * 200);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_Normal_0004 end');
    });

    /**
     * @tc.number    SUB_LYRIC_CONST_0500
     * @tc.name      testLyricConstSuite0005
     * @tc.desc      验证矩形四角与边线命中、外部点不命中且与独立实现一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricConstSuite0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_Contains_0005 begin');
      let box: Rectangle = new Rectangle(0, 0, 100, 50);
      let points: number[][] = [[0, 0], [100, 50], [0, 50], [100, 0], [50, 25], [-1, 0], [101, 25], [50, 51]];
      let agree: number = 0;
      for (let point of points) {
        if (box.isIn(point[0], point[1]) === contains(box, point[0], point[1])) {
          agree++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `8 个采样点与独立实现一致=${agree}`);
      expect(agree).assertEqual(8);
      expect(box.isIn(0, 0)).assertTrue();
      expect(box.isIn(100, 50)).assertTrue();
      expect(box.isIn(100, 0)).assertTrue();
      expect(box.isIn(50, 25)).assertTrue();
      expect(box.isIn(-1, 0)).assertFalse();
      expect(box.isIn(101, 25)).assertFalse();
      expect(box.isIn(50, 51)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_Contains_0005 end');
    });

    /**
     * @tc.number    SUB_LYRIC_CONST_0600
     * @tc.name      testLyricConstSuite0006
     * @tc.desc      验证反向矩形（左大于右）按 main 规则保留零值，任意点都不命中
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricConstSuite0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_InvertedX_0006 begin');
      let box: Rectangle = new Rectangle(100, 0, 0, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `反向矩形=${box.toString()}`);
      expect(box.left).assertEqual(0);
      expect(box.top).assertEqual(0);
      expect(box.right).assertEqual(0);
      expect(box.bottom).assertEqual(0);
      expect(box.isIn(100, 25)).assertFalse();
      expect(box.isIn(50, 25)).assertFalse();
      expect(area(box)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_InvertedX_0006 end');
    });

    /**
     * @tc.number    SUB_LYRIC_CONST_0700
     * @tc.name      testLyricConstSuite0007
     * @tc.desc      验证零宽矩形只命中竖直边线上的点、不命中两侧
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricConstSuite0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_ZeroWidth_0007 begin');
      let box: Rectangle = new Rectangle(5, 5, 5, 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `零宽矩形=${box.toString()}, 面积=${area(box)}`);
      expect(area(box)).assertEqual(0);
      expect(box.isIn(5, 5)).assertTrue();
      expect(box.isIn(5, 10)).assertTrue();
      expect(box.isIn(5, 7)).assertTrue();
      expect(box.isIn(4, 7)).assertFalse();
      expect(box.isIn(6, 7)).assertFalse();
      expect(box.isIn(4, 4)).assertFalse();
      expect(box.toString()).assertEqual('[Rectangle] = 5, 5, 5,10');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_ZeroWidth_0007 end');
    });

    /**
     * @tc.number    SUB_LYRIC_CONST_0800
     * @tc.name      testLyricConstSuite0008
     * @tc.desc      验证负坐标矩形能正确保存边界并命中内部点
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricConstSuite0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_Negative_0008 begin');
      let box: Rectangle = new Rectangle(-50, -20, -10, -5);
      hilog.info(DOMAIN, TAG, '%{public}s', `负坐标矩形=${box.toString()}`);
      expect(box.left).assertEqual(-50);
      expect(box.top).assertEqual(-20);
      expect(box.right).assertEqual(-10);
      expect(box.bottom).assertEqual(-5);
      expect(box.isIn(-30, -10)).assertTrue();
      expect(box.isIn(-60, -10)).assertFalse();
      expect(area(box)).assertEqual(40 * 15);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_Negative_0008 end');
    });

    /**
     * @tc.number    SUB_LYRIC_CONST_0900
     * @tc.name      testLyricConstSuite0009
     * @tc.desc      验证同一输入重复构造的矩形字符串一致且不共享状态
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricConstSuite0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_Independence_0009 begin');
      let first: Rectangle = new Rectangle(1, 2, 3, 4);
      let second: Rectangle = new Rectangle(1, 2, 3, 4);
      let third: Rectangle = new Rectangle(0, 0, 1, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `first=${first.toString()}, third=${third.toString()}`);
      expect(first.toString()).assertEqual(second.toString());
      expect(first.left).assertEqual(second.left);
      expect(first.right).assertEqual(second.right);
      expect(first.toString() !== third.toString()).assertTrue();
      expect(third.right).assertEqual(1);
      expect(first.right).assertEqual(3);
      expect(area(first)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_Independence_0009 end');
    });

    /**
     * @tc.number    SUB_LYRIC_CONST_1000
     * @tc.name      testLyricConstSuite0010
     * @tc.desc      验证矩形包含判定与边界缩放不变量：扩大 1 单位后原边界外相邻点被包含
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricConstSuite0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_GrowInvariant_0010 begin');
      let base: Rectangle = new Rectangle(10, 10, 20, 20);
      let grown: Rectangle = new Rectangle(9, 9, 21, 21);
      let samples: number[][] = [[9, 10], [10, 9], [21, 20], [20, 21]];
      let baseHits: number = 0;
      let grownHits: number = 0;
      for (let point of samples) {
        if (base.isIn(point[0], point[1])) {
          baseHits++;
        }
        if (grown.isIn(point[0], point[1])) {
          grownHits++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `原矩形命中外沿=${baseHits}, 扩大后=${grownHits}, 面积比=${area(grown)}/${area(base)}`);
      expect(baseHits).assertEqual(0);
      expect(grownHits).assertEqual(4);
      expect(area(base)).assertEqual(400);
      expect(area(grown)).assertEqual(576);
      expect(area(grown) - area(base)).assertEqual(176);
      expect(grown.isIn(15, 15)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Rectangle_GrowInvariant_0010 end');
    });
  });
}
