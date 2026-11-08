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
import { angleToRadian, parseLrcLyric, parseKrcLyric, getRawStringData } from '../../../main/ets/common/utils/LrcUtils';
import { MediaTools } from '../../../main/ets/common/utils/mediautils/MediaTools';
import { LrcEntry } from '../../../main/ets/viewmodel/LrcEntry';
import { StorageSnapshot, appContext, uiAbilityContext } from './TestContext';
import { LrcLineScanner } from './TestData';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const LRC_PATH: string = 'lrcfiles/DreamItPossible.lrc';
const LRC_BYTE_SIZE: number = 1796;
const LRC_LINE_COUNT: number = 41;
const RADIAN_TOLERANCE: number = 1e-12;
const TWO_PI: number = Math.PI * 2;

/**
 * 独立换算：角度先归一到 (-180, 180] 再乘以 π/180。
 * 归一后结果与 main 直接乘法在 [-180, 180] 上完全一致，超出该区间则用周期性证明两者等价。
 */
function normalizedRadian(angle: number): number {
  let rest: number = angle % 360;
  let normalized: number = rest > 180 ? rest - 360 : (rest <= -180 ? rest + 360 : rest);
  return normalized * Math.PI / 180;
}

/**
 * 用 sin 交叉验证：相差 2π 整数倍的弧度在三角函数下取值相同。
 */
function sameDirection(a: number, b: number): boolean {
  return Math.abs(Math.sin(a) - Math.sin(b)) < 1e-9 && Math.abs(Math.cos(a) - Math.cos(b)) < 1e-9;
}

export default function LrcUtilsFunctionTest() {
  describe('LrcUtilsFunctionTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_LRC_UTILS_0100
     * @tc.name      testLrcUtilsFunction0001
     * @tc.desc      验证常用角度换算弧度：零点、直角、平角、周角与三四象限角度结果与 π 的整数分数严格相符
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcUtilsFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_AngleCommon_0001 begin');
      let zero: number = angleToRadian(0);
      let right: number = angleToRadian(90);
      let straight: number = angleToRadian(180);
      let full: number = angleToRadian(360);
      let fortyFive: number = angleToRadian(45);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `0=[${zero}], 90=[${right}], 180=[${straight}], 360=[${full}]`);
      expect(zero).assertEqual(0);
      expect(Math.abs(right - Math.PI / 2) < RADIAN_TOLERANCE).assertTrue();
      expect(Math.abs(straight - Math.PI) < RADIAN_TOLERANCE).assertTrue();
      expect(Math.abs(full - TWO_PI) < RADIAN_TOLERANCE).assertTrue();
      expect(Math.abs(fortyFive * 4 - Math.PI) < RADIAN_TOLERANCE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_AngleCommon_0001 end');
    });

    /**
     * @tc.number    SUB_LRC_UTILS_0200
     * @tc.name      testLrcUtilsFunction0002
     * @tc.desc      验证负角度与小角度换算：负直角等于直角取反，度数累加与弧度累加一致（线性性）
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcUtilsFunction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_AngleNegative_0002 begin');
      let positive: number = angleToRadian(90);
      let negative: number = angleToRadian(-90);
      let linearityOk: boolean = true;
      for (let step = 1; step <= 12; step++) {
        let degrees: number = step * 15;
        let combined: number = angleToRadian(degrees) + angleToRadian(-degrees);
        if (Math.abs(combined) > RADIAN_TOLERANCE) {
          linearityOk = false;
        }
      }
      let tiny: number = angleToRadian(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `+90=[${positive}], -90=[${negative}], 0.5°=[${tiny}]`);
      expect(Math.abs(positive + negative) < RADIAN_TOLERANCE).assertTrue();
      expect(negative < 0).assertTrue();
      expect(Math.abs(tiny - Math.PI / 360) < RADIAN_TOLERANCE).assertTrue();
      expect(linearityOk).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_AngleNegative_0002 end');
    });

    /**
     * @tc.number    SUB_LRC_UTILS_0300
     * @tc.name      testLrcUtilsFunction0003
     * @tc.desc      验证超过一周期的角度按周期性换算：与归一化后的等角在三角函数意义下表示同一方向
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcUtilsFunction0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_AnglePeriodic_0003 begin');
      let angles: number[] = [450, 720, -450, 1080, -720, 1800];
      let periodicOk: boolean = true;
      for (let angle of angles) {
        let actual: number = angleToRadian(angle);
        let oracle: number = normalizedRadian(angle);
        if (!sameDirection(actual, oracle)) {
          periodicOk = false;
        }
        if (Math.abs(actual - angle * Math.PI / 180) > 1e-9) {
          periodicOk = false;
        }
      }
      let turnAndQuarter: number = angleToRadian(450);
      hilog.info(DOMAIN, TAG, '%{public}s', `450°=[${turnAndQuarter}], 周期一致=${periodicOk}`);
      expect(periodicOk).assertTrue();
      expect(Math.abs(Math.sin(turnAndQuarter) - 1) < 1e-9).assertTrue();
      expect(Math.abs(turnAndQuarter - TWO_PI - Math.PI / 2) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_AnglePeriodic_0003 end');
    });

    /**
     * @tc.number    SUB_LRC_UTILS_0400
     * @tc.name      testLrcUtilsFunction0004
     * @tc.desc      验证特殊浮点输入：非数输入得到非数结果，极大极小角度保持符号与有限性
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcUtilsFunction0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_AngleSpecial_0004 begin');
      let nanResult: number = angleToRadian(Number.NaN);
      let tiny: number = angleToRadian(1e-10);
      let huge: number = angleToRadian(1e10);
      let negativeZero: number = angleToRadian(-0);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `NaN=[${nanResult}], 极小=[${tiny}], 极大=[${huge}], -0=[${negativeZero}]`);
      expect(Number.isNaN(nanResult)).assertTrue();
      expect(tiny > 0 && tiny < 1e-11).assertTrue();
      expect(Number.isFinite(huge)).assertTrue();
      expect(huge > 1e8).assertTrue();
      expect(negativeZero === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_AngleSpecial_0004 end');
    });

    /**
     * @tc.number    SUB_LRC_UTILS_0500
     * @tc.name      testLrcUtilsFunction0005
     * @tc.desc      验证逐度换算与独立换算结果一致，1° 到 360° 全部命中且结果随角度严格递增
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcUtilsFunction0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_AngleSweep_0005 begin');
      let matched: number = 0;
      let increasing: boolean = true;
      let previous: number = -1;
      for (let degree = 1; degree <= 360; degree++) {
        let actual: number = angleToRadian(degree);
        if (Math.abs(actual - degree * Math.PI / 180) <= RADIAN_TOLERANCE) {
          matched++;
        }
        if (actual <= previous) {
          increasing = false;
        }
        previous = actual;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `逐度匹配=${matched}, 严格递增=${increasing}`);
      expect(matched).assertEqual(360);
      expect(increasing).assertTrue();
      expect(Math.abs(angleToRadian(360) - TWO_PI) < RADIAN_TOLERANCE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_AngleSweep_0005 end');
    });

    /**
     * @tc.number    SUB_LRC_UTILS_0600
     * @tc.name      testLrcUtilsFunction0006
     * @tc.desc      验证真实歌词文件的字节长度、解码文本长度与解析行数三者自洽，且解码文本可直接再解析
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcUtilsFunction0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_RawLrcBytes_0006 begin');
      let bytes: Uint8Array = await appContext().resourceManager.getRawFileContent(LRC_PATH);
      let decoded: string = await getRawStringData(appContext(), LRC_PATH);
      let entries: LrcEntry[] = parseLrcLyric(decoded);
      let scanner: LrcLineScanner = new LrcLineScanner().scan(decoded);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `字节=${bytes.length}, 字符=${decoded.length}, 行=${entries.length}`);
      expect(bytes.length).assertEqual(LRC_BYTE_SIZE);
      expect(decoded.length).assertEqual(bytes.length);
      expect(decoded.charCodeAt(0)).assertEqual(91);
      expect(entries.length).assertEqual(LRC_LINE_COUNT);
      expect(scanner.times.length).assertEqual(LRC_LINE_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_RawLrcBytes_0006 end');
    });

    /**
     * @tc.number    SUB_LRC_UTILS_0700
     * @tc.name      testLrcUtilsFunction0007
     * @tc.desc      验证真实歌词解析的时间序列严格递增、末行时长为无穷大上限，且首行时间与源码标签一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcUtilsFunction0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_RawLrcTimes_0007 begin');
      let decoded: string = await getLrcText();
      let entries: LrcEntry[] = parseLrcLyric(decoded);
      let increasing: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime <= entries[i - 1].lineStartTime) {
          increasing = false;
        }
      }
      let lastDuration: number = entries[entries.length - 1].lineDuration;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `首行=${entries[0].lineStartTime}, 末行=${entries[entries.length - 1].lineStartTime}`);
      expect(entries.length).assertEqual(LRC_LINE_COUNT);
      expect(increasing).assertTrue();
      expect(entries[0].lineStartTime).assertEqual(150);
      expect(entries[0].lineWords).assertEqual('Delacey - Dream It Possible');
      expect(lastDuration).assertEqual(Number.MAX_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_RawLrcTimes_0007 end');
    });

    /**
     * @tc.number    SUB_LRC_UTILS_0800
     * @tc.name      testLrcUtilsFunction0008
     * @tc.desc      验证逐行时长等于相邻两行起始时间差，且所有行文本非空并与源码逐行去标签结果一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcUtilsFunction0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_RawLrcGaps_0008 begin');
      let decoded: string = await getLrcText();
      let entries: LrcEntry[] = parseLrcLyric(decoded);
      let scanner: LrcLineScanner = new LrcLineScanner().scan(decoded);
      let gapsOk: boolean = true;
      let emptyText: number = 0;
      for (let i = 0; i < entries.length - 1; i++) {
        if (entries[i].lineDuration !== entries[i + 1].lineStartTime - entries[i].lineStartTime) {
          gapsOk = false;
        }
        if (entries[i].lineWords.length === 0) {
          emptyText++;
        }
        if (entries[i].lineWords !== scanner.texts[i].replace(new RegExp('^\\[\\d{2,}:\\d{2}\\.\\d{2,}\\]'), '')) {
          gapsOk = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `间隙一致=${gapsOk}, 空文本行=${emptyText}`);
      expect(gapsOk).assertTrue();
      expect(emptyText).assertEqual(0);
      expect(entries[1].lineStartTime - entries[0].lineStartTime).assertEqual(8690);
      expect(entries[0].lineDuration).assertEqual(8690);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_RawLrcGaps_0008 end');
    });

    /**
     * @tc.number    SUB_LRC_UTILS_0900
     * @tc.name      testLrcUtilsFunction0009
     * @tc.desc      验证歌词入口在上下文与文件名有效时返回与直接解码一致的内容，并可与空文件名结果区分
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcUtilsFunction0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_EntryCompare_0009 begin');
      let viaTools: string | undefined = await MediaTools.getLrcFromRawFile(uiAbilityContext(), LRC_PATH);
      let viaUtils: string = await getRawStringData(appContext(), LRC_PATH);
      let viaEmpty: string | undefined = await MediaTools.getLrcFromRawFile(uiAbilityContext(), '');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `工具入口长度=${viaTools === undefined ? -1 : viaTools.length}, 直读长度=${viaUtils.length}`);
      expect(viaTools !== undefined).assertTrue();
      expect(viaTools === viaUtils).assertTrue();
      expect(viaEmpty === undefined).assertTrue();
      expect((viaTools as string).length).assertEqual(LRC_BYTE_SIZE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_EntryCompare_0009 end');
    });

    // /**
    //  * @tc.number    SUB_LRC_UTILS_1000
    //  * @tc.name      testLrcUtilsFunction0010
    //  * @tc.desc      验证缺少全局上下文时读取歌词失败，而补充上下文后同一路径读取成功，证明读取依赖应用上下文
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     LEVEL0
    //  */
    // it('testLrcUtilsFunction0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    //   hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_ContextFallback_0010 begin');
    //   let snapshot: StorageSnapshot = new StorageSnapshot().capture('context');
    //   let failed: boolean = false;
    //   let brokenSource: Object = undefined;
    //   let brokenContext: Context = brokenSource as Context;
    //   AppStorage.delete('context');
    //   try {
    //     await getRawStringData(brokenContext, LRC_PATH);
    //   } catch (error) {
    //     failed = true;
    //   }
    //   snapshot.restore();
    //   let recovered: string = await getRawStringData(appContext(), LRC_PATH);
    //   hilog.info(DOMAIN, TAG, '%{public}s', `缺上下文失败=${failed}, 恢复后长度=${recovered.length}`);
    //   expect(failed).assertTrue();
    //   expect(recovered.length).assertEqual(LRC_BYTE_SIZE);
    //   expect(AppStorage.get<Object>('context') !== undefined).assertTrue();
    //   expect(recovered.startsWith('[00:00.15]')).assertTrue();
    //   hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcUtils_ContextFallback_0010 end');
    // });
  });
}

async function getLrcText(): Promise<string> {
  return await getRawStringData(appContext(), LRC_PATH);
}
