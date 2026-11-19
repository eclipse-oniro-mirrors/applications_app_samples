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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Eraser]';

export default function eraserTextMatrix2Test(): void {
  describe('EraserTextMatrix2Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    ERASER_TEXT_0090
     * @tc.name      eraserTextText0090
     * @tc.desc      文本 Português 截断到 7 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0090 begin');
      const text: string = 'Português';
      const truncated: string = text.substring(0, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(7);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0090 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0091
     * @tc.name      eraserTextText0091
     * @tc.desc      文本 Русский 在 54px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0091 begin');
      const text: string = 'Русский';
      const fontSize: number = 54;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(7);
      expect(width).assertEqual(378);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0091 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0092
     * @tc.name      eraserTextText0092
     * @tc.desc      文本 Русский 在 648px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0092 begin');
      const width: number = 378;
      const boxWidth: number = 648;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0092 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0093
     * @tc.name      eraserTextText0093
     * @tc.desc      文本 Русский 截断到 3 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0093 begin');
      const text: string = 'Русский';
      const truncated: string = text.substring(0, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(3);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0093 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0094
     * @tc.name      eraserTextText0094
     * @tc.desc      文本 Graphics2D 在 58px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0094 begin');
      const text: string = 'Graphics2D';
      const fontSize: number = 58;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(10);
      expect(width).assertEqual(580);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0094 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0095
     * @tc.name      eraserTextText0095
     * @tc.desc      文本 Graphics2D 在 696px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0095 begin');
      const width: number = 580;
      const boxWidth: number = 696;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0095 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0096
     * @tc.name      eraserTextText0096
     * @tc.desc      文本 Graphics2D 截断到 4 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0096 begin');
      const text: string = 'Graphics2D';
      const truncated: string = text.substring(0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(4);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0096 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0097
     * @tc.name      eraserTextText0097
     * @tc.desc      文本 SceneKit 3D 在 60px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0097 begin');
      const text: string = 'SceneKit 3D';
      const fontSize: number = 60;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(11);
      expect(width).assertEqual(660);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0097 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0098
     * @tc.name      eraserTextText0098
     * @tc.desc      文本 SceneKit 3D 在 720px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0098 begin');
      const width: number = 660;
      const boxWidth: number = 720;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0098 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0099
     * @tc.name      eraserTextText0099
     * @tc.desc      文本 SceneKit 3D 截断到 5 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0099 begin');
      const text: string = 'SceneKit 3D';
      const truncated: string = text.substring(0, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(5);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0099 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0100
     * @tc.name      eraserTextText0100
     * @tc.desc      文本 Media Player 在 62px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0100 begin');
      const text: string = 'Media Player';
      const fontSize: number = 62;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(12);
      expect(width).assertEqual(744);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0100 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0101
     * @tc.name      eraserTextText0101
     * @tc.desc      文本 Media Player 在 744px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0101 begin');
      const width: number = 744;
      const boxWidth: number = 744;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0101 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0102
     * @tc.name      eraserTextText0102
     * @tc.desc      文本 Media Player 截断到 6 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0102 begin');
      const text: string = 'Media Player';
      const truncated: string = text.substring(0, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(6);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0102 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0103
     * @tc.name      eraserTextText0103
     * @tc.desc      文本 Frame Rate 60 在 64px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0103 begin');
      const text: string = 'Frame Rate 60';
      const fontSize: number = 64;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(13);
      expect(width).assertEqual(832);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0103 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0104
     * @tc.name      eraserTextText0104
     * @tc.desc      文本 Frame Rate 60 在 768px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0104 begin');
      const width: number = 832;
      const boxWidth: number = 768;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0104 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0105
     * @tc.name      eraserTextText0105
     * @tc.desc      文本 Frame Rate 60 截断到 7 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0105 begin');
      const text: string = 'Frame Rate 60';
      const truncated: string = text.substring(0, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(7);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0105 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0106
     * @tc.name      eraserTextText0106
     * @tc.desc      文本 Pixel Map 在 66px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0106 begin');
      const text: string = 'Pixel Map';
      const fontSize: number = 66;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(9);
      expect(width).assertEqual(594);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0106 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0107
     * @tc.name      eraserTextText0107
     * @tc.desc      文本 Pixel Map 在 792px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0107 begin');
      const width: number = 594;
      const boxWidth: number = 792;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0107 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0108
     * @tc.name      eraserTextText0108
     * @tc.desc      文本 Pixel Map 截断到 3 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0108 begin');
      const text: string = 'Pixel Map';
      const truncated: string = text.substring(0, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(3);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0108 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0109
     * @tc.name      eraserTextText0109
     * @tc.desc      文本 Color Space 在 68px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0109 begin');
      const text: string = 'Color Space';
      const fontSize: number = 68;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(11);
      expect(width).assertEqual(748);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0109 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0110
     * @tc.name      eraserTextText0110
     * @tc.desc      文本 Color Space 在 816px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0110 begin');
      const width: number = 748;
      const boxWidth: number = 816;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0110 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0111
     * @tc.name      eraserTextText0111
     * @tc.desc      文本 Color Space 截断到 4 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0111 begin');
      const text: string = 'Color Space';
      const truncated: string = text.substring(0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(4);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0111 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0112
     * @tc.name      eraserTextText0112
     * @tc.desc      文本 Image Effect 在 70px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0112 begin');
      const text: string = 'Image Effect';
      const fontSize: number = 70;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(12);
      expect(width).assertEqual(840);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0112 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0113
     * @tc.name      eraserTextText0113
     * @tc.desc      文本 Image Effect 在 840px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0113 begin');
      const width: number = 840;
      const boxWidth: number = 840;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0113 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0114
     * @tc.name      eraserTextText0114
     * @tc.desc      文本 Image Effect 截断到 5 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0114 begin');
      const text: string = 'Image Effect';
      const truncated: string = text.substring(0, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(5);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0114 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0115
     * @tc.name      eraserTextText0115
     * @tc.desc      文本 Video Trimmer 在 72px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0115 begin');
      const text: string = 'Video Trimmer';
      const fontSize: number = 72;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(13);
      expect(width).assertEqual(936);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0115 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0116
     * @tc.name      eraserTextText0116
     * @tc.desc      文本 Video Trimmer 在 864px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0116 begin');
      const width: number = 936;
      const boxWidth: number = 864;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0116 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0117
     * @tc.name      eraserTextText0117
     * @tc.desc      文本 Video Trimmer 截断到 6 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0117 begin');
      const text: string = 'Video Trimmer';
      const truncated: string = text.substring(0, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(6);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0117 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0118
     * @tc.name      eraserTextText0118
     * @tc.desc      文本 AVSession 在 74px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0118 begin');
      const text: string = 'AVSession';
      const fontSize: number = 74;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(9);
      expect(width).assertEqual(666);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0118 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0119
     * @tc.name      eraserTextText0119
     * @tc.desc      文本 AVSession 在 888px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0119 begin');
      const width: number = 666;
      const boxWidth: number = 888;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(1);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0119 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0120
     * @tc.name      eraserTextText0120
     * @tc.desc      文本 AVSession 截断到 7 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0120 begin');
      const text: string = 'AVSession';
      const truncated: string = text.substring(0, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(7);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0120 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0121
     * @tc.name      eraserTextText0121
     * @tc.desc      文本 Camera Preview 4K 在 76px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0121 begin');
      const text: string = 'Camera Preview 4K';
      const fontSize: number = 76;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(17);
      expect(width).assertEqual(1292);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0121 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0122
     * @tc.name      eraserTextText0122
     * @tc.desc      文本 Camera Preview 4K 在 912px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0122 begin');
      const width: number = 1292;
      const boxWidth: number = 912;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0122 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0123
     * @tc.name      eraserTextText0123
     * @tc.desc      文本 Camera Preview 4K 截断到 3 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0123 begin');
      const text: string = 'Camera Preview 4K';
      const truncated: string = text.substring(0, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(3);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0123 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0124
     * @tc.name      eraserTextText0124
     * @tc.desc      文本 Ndk Native Image 在 78px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0124 begin');
      const text: string = 'Ndk Native Image';
      const fontSize: number = 78;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(16);
      expect(width).assertEqual(1248);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0124 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0125
     * @tc.name      eraserTextText0125
     * @tc.desc      文本 Ndk Native Image 在 936px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0125 begin');
      const width: number = 1248;
      const boxWidth: number = 936;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0125 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0126
     * @tc.name      eraserTextText0126
     * @tc.desc      文本 Ndk Native Image 截断到 4 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0126 begin');
      const text: string = 'Ndk Native Image';
      const truncated: string = text.substring(0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(4);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0126 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0127
     * @tc.name      eraserTextText0127
     * @tc.desc      文本 OpenGL ES 3.0 在 80px 下的单行宽度估算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0127 begin');
      const text: string = 'OpenGL ES 3.0';
      const fontSize: number = 80;
      const count: number = text.length;
      const width: number = count * fontSize;
      hilog.info(DOMAIN, TAG, '%{public}s', 'width=' + width);
      expect(count).assertEqual(13);
      expect(width).assertEqual(1040);
      expect(width / fontSize).assertEqual(count);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0127 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0128
     * @tc.name      eraserTextText0128
     * @tc.desc      文本 OpenGL ES 3.0 在 960px 容器内的换行行数推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0128 begin');
      const width: number = 1040;
      const boxWidth: number = 960;
      const lines: number = Math.max(1, Math.ceil(width / boxWidth));
      hilog.info(DOMAIN, TAG, '%{public}s', 'lines=' + lines);
      expect(lines).assertEqual(2);
      expect(lines >= 1).assertTrue();
      expect(lines * boxWidth >= width).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0128 end');
    })

    /**
     * @tc.number    ERASER_TEXT_0129
     * @tc.name      eraserTextText0129
     * @tc.desc      文本 OpenGL ES 3.0 截断到 5 字符的长度与起始一致校验
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('eraserTextText0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0129 begin');
      const text: string = 'OpenGL ES 3.0';
      const truncated: string = text.substring(0, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'truncated=' + truncated.length);
      expect(truncated.length).assertEqual(5);
      expect(text.startsWith(truncated)).assertTrue();
      expect(truncated.length <= text.length).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'eraserTextText0129 end');
    })
  })
}
